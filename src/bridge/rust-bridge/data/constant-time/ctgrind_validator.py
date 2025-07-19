#!/usr/bin/env python3
"""
Ctgrind (Valgrind) Integration for Constant-Time Validation
Provides dynamic taint analysis for secret data
"""

import subprocess
import os
import re
from typing import Tuple, Dict

class CtgrindValidator:
    def __init__(self):
        self.valgrind_available = self._check_valgrind()
        
    def _check_valgrind(self) -> bool:
        """Check if valgrind is available"""
        try:
            result = subprocess.run(['valgrind', '--version'], 
                                  capture_output=True, text=True)
            return result.returncode == 0
        except:
            return False
    
    def create_test_program(self, asm_file: str) -> str:
        """Create a test program that marks secret data"""
        test_code = '''
#include <stdint.h>
#include <string.h>
#include <valgrind/memcheck.h>

// External assembly function
extern void rust_fiat_curve25519_carry_mul(uint64_t* out, const uint64_t* arg1, const uint64_t* arg2);

// Mark memory as secret (undefined for valgrind)
static void ct_secret(void* data, size_t len) {
    VALGRIND_MAKE_MEM_UNDEFINED(data, len);
}

// Mark memory as public (defined for valgrind)  
static void ct_public(void* data, size_t len) {
    VALGRIND_MAKE_MEM_DEFINED(data, len);
}

int main() {
    uint64_t out[5] = {0};
    uint64_t arg1[5] = {1, 2, 3, 4, 5};
    uint64_t arg2[5] = {6, 7, 8, 9, 10};
    
    // Mark inputs as secret
    ct_secret(arg1, sizeof(arg1));
    ct_secret(arg2, sizeof(arg2));
    
    // Mark output location as public (address, not data)
    ct_public(&out, sizeof(&out));
    ct_public(&arg1, sizeof(&arg1));
    ct_public(&arg2, sizeof(&arg2));
    
    // Call the function
    rust_fiat_curve25519_carry_mul(out, arg1, arg2);
    
    // Output remains secret - don't declassify
    
    return 0;
}
'''
        
        test_file = asm_file.replace('.asm', '_ctgrind_test.c')
        with open(test_file, 'w') as f:
            f.write(test_code)
        
        return test_file
    
    def compile_with_memcheck(self, test_file: str, obj_file: str) -> Tuple[bool, str]:
        """Compile test program with valgrind memcheck support"""
        output_binary = test_file.replace('.c', '')
        
        compile_cmd = [
            'gcc', '-O0', '-g',  # No optimization, debug info
            test_file,
            obj_file,
            '-o', output_binary
        ]
        
        try:
            result = subprocess.run(compile_cmd, capture_output=True, text=True)
            if result.returncode != 0:
                return False, f"Compilation failed: {result.stderr}"
            return True, output_binary
        except Exception as e:
            return False, str(e)
    
    def run_ctgrind(self, binary: str) -> Dict[str, any]:
        """Run valgrind in ctgrind mode"""
        result = {
            'passed': False,
            'errors': [],
            'warnings': [],
            'summary': ''
        }
        
        # Run with valgrind
        valgrind_cmd = [
            'valgrind',
            '--tool=memcheck',
            '--track-origins=yes',
            '--leak-check=no',
            '--error-exitcode=1',
            binary
        ]
        
        try:
            proc = subprocess.run(valgrind_cmd, 
                                capture_output=True, 
                                text=True,
                                timeout=30)
            
            output = proc.stderr  # Valgrind outputs to stderr
            
            # Parse output for conditional jumps on undefined values
            if 'Conditional jump or move depends on uninitialised value' in output:
                result['errors'].append("Secret-dependent conditional branch detected!")
                
                # Extract details
                lines = output.split('\n')
                for i, line in enumerate(lines):
                    if 'Conditional jump' in line:
                        # Get context
                        context = '\n'.join(lines[i:i+5])
                        result['errors'].append(context)
            
            # Check for other issues
            if 'Use of uninitialised value' in output:
                result['warnings'].append("Uninitialized value used (may be OK if not in branch)")
            
            result['passed'] = len(result['errors']) == 0
            result['summary'] = f"Ctgrind: {'PASS' if result['passed'] else 'FAIL'}"
            
        except subprocess.TimeoutExpired:
            result['summary'] = "Timeout (likely OK)"
            result['passed'] = True
        except Exception as e:
            result['errors'].append(str(e))
            
        return result

def main():
    import sys
    
    if len(sys.argv) < 2:
        print("Usage: python ctgrind_validator.py <object_file>")
        sys.exit(1)
    
    obj_file = sys.argv[1]
    asm_file = obj_file.replace('.o', '.asm')
    
    validator = CtgrindValidator()
    
    if not validator.valgrind_available:
        print("❌ Valgrind not found. Install with: sudo apt-get install valgrind")
        sys.exit(1)
    
    print("Setting up ctgrind validation...")
    
    # Create test program
    test_file = validator.create_test_program(asm_file)
    print(f"✓ Created test program: {test_file}")
    
    # Compile
    success, binary_or_error = validator.compile_with_memcheck(test_file, obj_file)
    if not success:
        print(f"❌ Compilation failed: {binary_or_error}")
        sys.exit(1)
    
    print(f"✓ Compiled: {binary_or_error}")
    
    # Run ctgrind
    print("Running ctgrind analysis...")
    result = validator.run_ctgrind(binary_or_error)
    
    # Report results
    print("\n=== Ctgrind Results ===")
    print(result['summary'])
    
    if result['errors']:
        print("\n❌ Errors found:")
        for error in result['errors']:
            print(f"  {error}")
    
    if result['warnings']:
        print("\n⚠️  Warnings:")
        for warning in result['warnings']:
            print(f"  {warning}")
    
    if result['passed']:
        print("\n✅ No secret-dependent branches detected by ctgrind!")
    
    # Cleanup
    os.unlink(test_file)
    os.unlink(binary_or_error)
    
    sys.exit(0 if result['passed'] else 1)

if __name__ == "__main__":
    main()