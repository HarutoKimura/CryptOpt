# CryptOpt Vector Multiplication Implementation Progress Report

## Date: July 31, 2025

## Executive Summary
Successfully implemented the infrastructure for vector multiplication in CryptOpt with a command-line flag (`--forceVector`) that allows users to choose between scalar and vector multiplication strategies. While the full AVX2 implementation is still under development, the framework is now operational with a scalar fallback.

## What We Accomplished

### 1. Command-Line Flag Implementation
- Added `--forceVector` flag to `src/helper/argParse.ts`
- Updated `ParsedArgsT` type in `src/types/optimizer.types.ts` to include the `forceVector` boolean field
- Flag successfully overrides Paul's decision mechanism to select vector multiplication

### 2. Paul's Decision System Modification
- Modified `src/paul/Paul.class.ts` to respect the `--forceVector` flag
- Updated `chooseMulType()` method to force `C_VECTOR_AVX2` when flag is set
- Added console logging to confirm when vector multiplication is being forced

### 3. Vector Multiplication Implementation
- Created `src/instructionGeneration/multiplicationHelpers/vector_mul_avx2_real.ts`
- Implemented basic structure for AVX2 vector multiplication
- Currently uses scalar `mulx` as a fallback with appropriate comments in generated assembly

### 4. Bug Fixes Resolved

#### a) "vvi" Operand Format Error
- **Issue**: Unsupported AVX2 instructions (vpsrlq, vpsllq, pextrq, vpextrq) were being generated
- **Solution**: Simplified implementation to use only instructions available in `instructions.c`

#### b) Bus Error/Core Dump
- **Issue**: Memory alignment or register usage problems in vector operations
- **Solution**: Implemented safe scalar fallback while maintaining vector framework

#### c) "rrv" Operand Format Error
- **Issue**: XMM registers were being used as mulx operands (e.g., `mulx r9, r15, xmm13`)
- **Root Cause**: When `--preferXmm` flag was used, values were spilled to XMM registers but later used directly in mulx instructions
- **Solution**: Added `AllocationFlags.DISALLOW_XMM` to prevent XMM register allocation for mulx operands

## Current State

### Working Features
- Command-line flag `--forceVector` successfully forces vector multiplication selection
- Paul's decision system correctly respects the flag
- Generated assembly includes comments indicating vector multiplication was selected
- Scalar fallback prevents crashes while development continues
- No more invalid assembly generation with XMM registers

### Generated Assembly Example
```asm
; Vector multiplication selected but using scalar fallback
; AVX2 implementation under development
mulx r8, rcx, r10; x15_1, x15_0<- arg1[2] * arg2[1]
```

### Test Command
```bash
./CryptOpt --bridge fiat --curve curve25519 --method mul --xmm --preferXmm --no-proof --forceVector --evals 10
```

## Next Steps

### 1. Implement Real AVX2 Vector Multiplication
- Replace scalar fallback with actual AVX2 instructions
- Use only instructions supported in `instructions.c`:
  - `vpmuludq` - Multiply packed unsigned doubleword integers
  - `vpaddq` - Add packed quadword integers
  - `movq` - Move quadword to/from XMM registers
  - `vmovdqu` - Move unaligned packed integer values

### 2. Performance Optimization
- Implement parallel limb processing for curve25519 (5 limbs of 51 bits each)
- Process multiple limbs simultaneously using YMM registers (256-bit)
- Optimize register allocation for vector operations

### 3. Testing and Validation
- Comprehensive testing with various curves and methods
- Performance benchmarking against scalar multiplication
- Correctness verification with proof generation enabled

### 4. Integration Improvements
- Extend vector support to other operations (squaring, addition)
- Implement automatic decision heuristics for when to use vector vs scalar
- Add support for AVX-512 when available

## Technical Details

### File Structure
```
src/
├── helper/argParse.ts                    # Added --forceVector flag
├── types/optimizer.types.ts              # Updated ParsedArgsT type
├── paul/Paul.class.ts                    # Modified decision system
└── instructionGeneration/
    └── multiplicationHelpers/
        └── vector_mul_avx2_real.ts       # Vector multiplication implementation
```

### Key Code Changes
1. **argParse.ts**: Added command-line option for forceVector
2. **Paul.class.ts**: Modified chooseMulType() to check forceVector flag
3. **vector_mul_avx2_real.ts**: Implemented with DISALLOW_XMM flag to prevent XMM spilling issues

## Conclusion
The infrastructure for vector multiplication is now fully operational. While currently using a scalar fallback, the framework allows for easy implementation of true AVX2 vector operations. The successful resolution of all blocking bugs (vvi format, bus errors, and rrv format) means development can now focus on implementing the actual vector instructions.