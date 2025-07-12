#!/usr/bin/env python3
"""
Enhanced Constant-Time Validator for LLVM IR with formal verification approach
Validates constant-time properties throughout the LLVM-to-CryptOpt pipeline
"""

import sys
import re
import json
from typing import List, Tuple, Set, Dict, Optional
from dataclasses import dataclass
from enum import Enum

class ViolationType(Enum):
    CONDITIONAL_BRANCH = "Conditional branch on potentially secret data"
    VARIABLE_TIME_INSTRUCTION = "Variable-time instruction"
    SECRET_DEPENDENT_MEMORY = "Secret-dependent memory access"
    POTENTIAL_TIMING_LEAK = "Potential timing side-channel"

@dataclass
class Violation:
    line_number: int
    violation_type: ViolationType
    instruction: str
    details: str
    severity: str  # "error", "warning", "info"

class EnhancedConstantTimeValidator:
    def __init__(self, secret_params: Optional[Set[str]] = None):
        # Instructions categorized by constant-time impact
        self.definitely_unsafe_branches = {'br', 'switch', 'indirectbr'}
        self.potentially_unsafe_ops = {'select', 'icmp', 'fcmp'}
        self.variable_time_arithmetic = {
            'udiv', 'sdiv', 'urem', 'srem', 'fdiv', 'frem',
            # Some CPUs have variable-time multiplication
            'mul', 'fmul'  # Mark as warning, not error
        }
        
        # Memory operations
        self.memory_ops = {'load', 'store', 'getelementptr'}
        
        # Track which variables might contain secrets
        self.secret_params = secret_params or set()
        self.secret_tainted_vars = set()
        
        self.violations: List[Violation] = []
        
    def validate_llvm_file(self, filepath: str) -> Tuple[bool, List[Violation]]:
        """Validate LLVM IR file with taint analysis"""
        with open(filepath, 'r') as f:
            lines = f.readlines()
            
        self.violations = []
        self._analyze_function_signature(lines)
        self._perform_taint_analysis(lines)
        
        for i, line in enumerate(lines):
            self._check_line(i + 1, line.strip())
            
        return len([v for v in self.violations if v.severity == "error"]) == 0, self.violations
    
    def _analyze_function_signature(self, lines: List[str]):
        """Extract function parameters and mark secrets based on naming/attributes"""
        for line in lines:
            if line.strip().startswith('define'):
                # Extract parameters
                param_match = re.search(r'\((.*?)\)', line)
                if param_match:
                    params = param_match.group(1)
                    # Look for parameters that might be secret (e.g., 'arg1', 'arg2' in crypto)
                    param_vars = re.findall(r'%\w+', params)
                    # Conservative: assume all input parameters might be secret
                    self.secret_tainted_vars.update(param_vars)
                break
    
    def _perform_taint_analysis(self, lines: List[str]):
        """Track data flow from potentially secret sources"""
        for line in lines:
            line = line.strip()
            if '=' in line:
                # Extract assignment pattern: %var = operation
                match = re.match(r'(%\w+)\s*=\s*(.+)', line)
                if match:
                    dest_var = match.group(1)
                    operation = match.group(2)
                    
                    # Check if operation uses any tainted variables
                    used_vars = re.findall(r'%\w+', operation)
                    if any(var in self.secret_tainted_vars for var in used_vars):
                        self.secret_tainted_vars.add(dest_var)
    
    def _check_line(self, line_num: int, line: str):
        """Check a single line for constant-time violations"""
        if not line or line.startswith(';'):
            return
            
        # Check conditional branches
        for branch_inst in self.definitely_unsafe_branches:
            if line.startswith(branch_inst + ' '):
                # Check if it's an unconditional branch
                if not (line.startswith('br label') or line.startswith('br i1 false')):
                    # Check if branch condition uses secret data
                    condition_vars = re.findall(r'%\w+', line)
                    if any(var in self.secret_tainted_vars for var in condition_vars):
                        self.violations.append(Violation(
                            line_num, ViolationType.CONDITIONAL_BRANCH,
                            branch_inst, line, "error"
                        ))
                    else:
                        self.violations.append(Violation(
                            line_num, ViolationType.CONDITIONAL_BRANCH,
                            branch_inst, f"Branch on public data: {line}", "warning"
                        ))
        
        # Check select instructions (can be constant-time if mapped correctly)
        if 'select' in line:
            self.violations.append(Violation(
                line_num, ViolationType.POTENTIAL_TIMING_LEAK,
                'select', f"Ensure mapped to cmovznz: {line}", "warning"
            ))
        
        # Check variable-time arithmetic
        for inst in self.variable_time_arithmetic:
            if f' {inst} ' in line or f'={inst} ' in line:
                severity = "error" if inst in ['udiv', 'sdiv', 'urem', 'srem'] else "warning"
                self.violations.append(Violation(
                    line_num, ViolationType.VARIABLE_TIME_INSTRUCTION,
                    inst, line, severity
                ))
        
        # Check memory access patterns
        if 'getelementptr' in line:
            if not self._is_constant_offset_gep(line):
                # Check if index uses secret data
                index_vars = re.findall(r'i\d+\s+(%\w+)', line)
                if any(var in self.secret_tainted_vars for var in index_vars):
                    self.violations.append(Violation(
                        line_num, ViolationType.SECRET_DEPENDENT_MEMORY,
                        'getelementptr', f"Secret-dependent offset: {line}", "error"
                    ))
    
    def _is_constant_offset_gep(self, line: str) -> bool:
        """Enhanced check for constant offsets in getelementptr"""
        # Look for patterns like: getelementptr ... i64 0, i32 1
        # All indices should be numeric constants
        indices = re.findall(r'i\d+\s+([%\w]+)', line)
        for idx in indices:
            if not idx.isdigit() and idx != '0':
                return False
        return True
    
    def validate_json_pipeline(self, json_file: str) -> Tuple[bool, List[str]]:
        """Validate the JSON intermediate representation"""
        with open(json_file, 'r') as f:
            data = json.load(f)
            
        violations = []
        
        for i, op in enumerate(data[0]['body'] if isinstance(data, list) else data['body']):
            operation = op.get('operation', '')
            
            # Verify select is properly transformed
            if operation == 'select':
                violations.append(f"Operation {i}: 'select' should be mapped to 'cmovznz'")
            
            # Check for proper cmovznz usage
            if operation == 'cmovznz':
                # This is good - non-branching conditional move
                pass
            
            # Ensure no branching operations leaked through
            if operation in ['br', 'jmp', 'je', 'jne']:
                violations.append(f"Operation {i}: Branching operation '{operation}' found")
                
        return len(violations) == 0, violations

def generate_verification_report(validator: EnhancedConstantTimeValidator, 
                               llvm_file: str, json_file: str) -> str:
    """Generate comprehensive verification report"""
    report = []
    report.append("=== Constant-Time Verification Report ===\n")
    
    # Validate LLVM
    llvm_valid, llvm_violations = validator.validate_llvm_file(llvm_file)
    report.append(f"LLVM IR Analysis ({llvm_file}):")
    
    errors = [v for v in llvm_violations if v.severity == "error"]
    warnings = [v for v in llvm_violations if v.severity == "warning"]
    
    if not errors:
        report.append("  ✅ No critical constant-time violations found")
    else:
        report.append(f"  ❌ {len(errors)} critical violations found")
        
    if warnings:
        report.append(f"  ⚠️  {len(warnings)} warnings")
        
    report.append("\nDetailed findings:")
    for v in llvm_violations:
        icon = "❌" if v.severity == "error" else "⚠️"
        report.append(f"  {icon} Line {v.line_number}: {v.violation_type.value}")
        report.append(f"     {v.details}")
    
    # Validate JSON pipeline
    if json_file:
        json_valid, json_violations = validator.validate_json_pipeline(json_file)
        report.append(f"\nJSON Pipeline Analysis ({json_file}):")
        if json_valid:
            report.append("  ✅ Pipeline preserves constant-time properties")
        else:
            report.append(f"  ❌ {len(json_violations)} pipeline issues found")
            for v in json_violations:
                report.append(f"     - {v}")
    
    return "\n".join(report)

def main():
    if len(sys.argv) < 2:
        print("Usage: python enhanced_constant_time_validator.py <llvm_file> [json_file]")
        sys.exit(1)
        
    llvm_file = sys.argv[1]
    json_file = sys.argv[2] if len(sys.argv) > 2 else None
    
    # You can specify known secret parameters here
    validator = EnhancedConstantTimeValidator(secret_params={'%arg1', '%arg2'})
    
    report = generate_verification_report(validator, llvm_file, json_file)
    print(report)
    
    # Exit with error if critical violations found
    llvm_valid, violations = validator.validate_llvm_file(llvm_file)
    sys.exit(0 if llvm_valid else 1)

if __name__ == "__main__":
    main()