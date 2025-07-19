#!/usr/bin/env python3
"""
Direct Constant-Time Validation for CryptOpt Pipeline
Checks LLVM IR and Assembly for constant-time properties
"""

import sys
import re
from typing import List, Tuple, Dict

class DirectConstantTimeValidator:
    def __init__(self):
        # Patterns that violate constant-time in LLVM
        self.llvm_violations = {
            'conditional_branch': r'\bbr\s+i1\s+%\w+\s*,\s*label',
            'switch': r'\bswitch\s+',
            'select_on_secret': r'\bselect\s+i1\s+%\w+',
            'division': r'\b(udiv|sdiv|urem|srem|fdiv|frem)\b',
        }
        
        # Patterns that violate constant-time in x86 assembly
        self.asm_violations = {
            'conditional_jumps': r'\b(je|jne|jz|jnz|ja|jae|jb|jbe|jg|jge|jl|jle|js|jns|jo|jno|jc|jnc|jp|jnp)\b',
            'division': r'\b(div|idiv)\b',
            'variable_shifts': r'\b(shl|shr|sal|sar)\s+%',  # Shift by register (variable)
        }
        
        # Good constant-time patterns
        self.good_patterns = {
            'cmov': r'\bcmov\w*\b',
            'constant_time_mul': r'\b(mulx|imul)\b',
            'carry_chains': r'\b(adcx|adox)\b',
        }
    
    def validate_llvm(self, llvm_file: str) -> Tuple[bool, List[str]]:
        """Check LLVM IR for constant-time violations"""
        violations = []
        
        with open(llvm_file, 'r') as f:
            lines = f.readlines()
        
        for i, line in enumerate(lines, 1):
            line = line.strip()
            
            # Skip comments and empty lines
            if not line or line.startswith(';'):
                continue
            
            # Check each violation pattern
            for vtype, pattern in self.llvm_violations.items():
                if re.search(pattern, line):
                    # Special case: unconditional branches are OK
                    if vtype == 'conditional_branch' and 'br label' in line:
                        continue
                    violations.append(f"Line {i}: {vtype} - {line}")
        
        return len(violations) == 0, violations
    
    def validate_asm(self, asm_file: str) -> Tuple[bool, List[str], Dict[str, int]]:
        """Check assembly for constant-time violations and good patterns"""
        violations = []
        good_counts = {pattern: 0 for pattern in self.good_patterns}
        
        with open(asm_file, 'r') as f:
            lines = f.readlines()
        
        for i, line in enumerate(lines, 1):
            line = line.strip().lower()
            
            # Skip comments and labels
            if not line or line.startswith(';') or ':' in line:
                continue
            
            # Check violations
            for vtype, pattern in self.asm_violations.items():
                if re.search(pattern, line):
                    violations.append(f"Line {i}: {vtype} - {line}")
            
            # Count good patterns
            for gtype, pattern in self.good_patterns.items():
                if re.search(pattern, line):
                    good_counts[gtype] += 1
        
        return len(violations) == 0, violations, good_counts
    
    def generate_report(self, llvm_file: str, asm_file: str) -> str:
        """Generate comprehensive validation report"""
        report = []
        report.append("=== Direct Constant-Time Validation Report ===\n")
        
        # Validate LLVM
        llvm_ok, llvm_violations = self.validate_llvm(llvm_file)
        report.append(f"LLVM IR Analysis ({llvm_file}):")
        if llvm_ok:
            report.append("  ✅ No constant-time violations found")
        else:
            report.append(f"  ❌ Found {len(llvm_violations)} violations:")
            for v in llvm_violations[:5]:  # Show first 5
                report.append(f"    - {v}")
            if len(llvm_violations) > 5:
                report.append(f"    ... and {len(llvm_violations) - 5} more")
        
        # Validate Assembly
        asm_ok, asm_violations, good_counts = self.validate_asm(asm_file)
        report.append(f"\nAssembly Analysis ({asm_file}):")
        if asm_ok:
            report.append("  ✅ No constant-time violations found")
        else:
            report.append(f"  ❌ Found {len(asm_violations)} violations:")
            for v in asm_violations[:5]:
                report.append(f"    - {v}")
            if len(asm_violations) > 5:
                report.append(f"    ... and {len(asm_violations) - 5} more")
        
        # Report good patterns
        report.append("\nConstant-Time Patterns Used:")
        for pattern, count in good_counts.items():
            if count > 0:
                report.append(f"  ✓ {pattern}: {count} occurrences")
        
        # Overall verdict
        report.append("\nOVERALL VERDICT:")
        if llvm_ok and asm_ok:
            report.append("✅ Code appears to be constant-time")
            report.append("   - No conditional branches on secret data")
            report.append("   - No variable-time operations")
            report.append("   - Uses constant-time primitives")
        else:
            report.append("❌ Code contains timing vulnerabilities")
        
        return "\n".join(report)

def main():
    if len(sys.argv) < 3:
        print("Usage: python validate_constant_time.py <llvm_file> <asm_file>")
        sys.exit(1)
    
    llvm_file = sys.argv[1]
    asm_file = sys.argv[2]
    
    validator = DirectConstantTimeValidator()
    report = validator.generate_report(llvm_file, asm_file)
    print(report)
    
    # Exit with error if violations found
    llvm_ok, _ = validator.validate_llvm(llvm_file)
    asm_ok, _, _ = validator.validate_asm(asm_file)
    sys.exit(0 if (llvm_ok and asm_ok) else 1)

if __name__ == "__main__":
    main()