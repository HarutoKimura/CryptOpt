# CryptOpt Constant-Time Validation Suite

This directory contains improved constant-time validation tools to address reviewer concerns about the lack of formal guarantees and empirical testing for timing side-channel resistance.

## Overview

The validation suite provides multiple levels of verification:

1. **Basic Pattern Matching** - Detects obvious timing vulnerabilities
2. **Taint Analysis** - Tracks secret data flow through the pipeline
3. **External Tool Integration** - Interfaces with established verification tools
4. **Formal Verification** - Generates specifications for formal provers
5. **Empirical Timing Tests** - Statistical analysis of execution times

## Tools Included

### 1. comprehensive_ct_validator.py
Main validation tool with three levels:
- `basic`: Pattern matching for conditional branches, variable-time ops
- `intermediate`: Adds taint analysis to track secret data flow
- `comprehensive`: Attempts integration with external tools

### 2. dudect_integration.py
Integration with dudect for statistical timing analysis:
- Creates test harnesses for timing measurements
- Performs Welch's t-test for timing independence
- Provides simplified mode when dudect is not available

### 3. formal_ct_verifier.py
Bridges to formal verification tools:
- Generates SMACK IR for ct-verif
- Creates Cryptoline specifications
- Provides installation instructions for tools

### 4. Makefile
Convenient interface for all validation tasks

## Quick Start

```bash
# Basic validation
make verify-basic

# Comprehensive validation
make verify-comprehensive

# Setup timing tests
make timing-test

# Attempt formal verification
make verify-formal
```

## Usage Examples

### Validate Full Pipeline
```bash
python3 comprehensive_ct_validator.py \
  rust_fiat_curve25519_carry_mul.ll \
  rust_fiat_curve25519_carry_mul.json \
  seed0001735954728832_ratio12068.asm \
  --level comprehensive
```

### Run Timing Analysis
```bash
# Simple mode (no external dependencies)
python3 dudect_integration.py output.asm --simple

# Full mode (requires dudect)
python3 dudect_integration.py output.asm
```

### Generate Formal Specs
```bash
python3 formal_ct_verifier.py input.ll
# Creates input.bpl (SMACK) and input.cl (Cryptoline)
```

## Current Status

### ✅ Implemented
- Pattern-based detection of timing vulnerabilities
- Basic taint analysis for secret data tracking
- Framework for external tool integration
- Specification generation for formal tools

### ⚠️ Limitations
1. **No actual external tools installed** - Provides interfaces but tools must be installed separately
2. **Simplified taint analysis** - Does not handle all LLVM constructs
3. **No microarchitectural modeling** - Cache timing and speculation not considered
4. **Limited formal verification** - Generates specs but doesn't run verifiers

### ❌ TODO (To Fully Address Reviewer)
1. **Install and integrate ct-verif**
   ```bash
   git clone https://github.com/imdea-software/verifying-constant-time
   cd verifying-constant-time && ./build.sh
   ```

2. **Setup dudect for real measurements**
   ```bash
   git clone https://github.com/oreparaz/dudect
   # Integrate with test harness generation
   ```

3. **Add microarchitectural analysis**
   - Cache timing patterns
   - Speculative execution barriers
   - Intel TSX considerations

4. **Implement proper LLVM metadata handling**
   - Use `!secret` annotations
   - Build complete use-def chains
   - Handle PHI nodes and complex control flow

## Validation Results Interpretation

### Pattern Matching Results
- **Errors**: Critical issues (conditional branches, division)
- **Warnings**: Potential issues (multiplication on older CPUs)
- **Info**: Good practices detected (cmov usage)

### Taint Analysis Results
- Shows which variables potentially contain secret data
- Tracks propagation through operations
- Flags any secret-dependent control flow

### External Tool Results
- Each tool provides pass/fail verdict
- Statistical tests show t-statistic values (< 4.5 is good)
- Formal tools provide counterexamples if verification fails

## Integration with CryptOpt

To use these validators in the CryptOpt pipeline:

```python
# In your pipeline script
from constant_time.comprehensive_ct_validator import ComprehensiveConstantTimeValidator

validator = ComprehensiveConstantTimeValidator()
result = validator.validate_pipeline(llvm_file, json_file, asm_file)

if not result.passed:
    print("Constant-time validation failed!")
    print(validator.generate_report(result))
    sys.exit(1)
```

## References

1. [ct-verif](https://github.com/imdea-software/verifying-constant-time) - Formal verification of constant-time
2. [dudect](https://github.com/oreparaz/dudect) - Statistical timing analysis
3. [Cryptoline](https://github.com/fmlab-iis/cryptoline) - Assembly-level verification
4. [Vale](https://github.com/project-everest/vale) - Verified assembly language

## Conclusion

This validation suite provides a foundation for addressing the reviewer's concerns about constant-time guarantees. However, to fully satisfy the requirements:

1. External verification tools must be installed and integrated
2. Empirical timing measurements must be performed
3. Formal proofs of preservation through the pipeline are needed

The current implementation demonstrates the approach and provides interfaces, but production use requires completing the TODO items above.