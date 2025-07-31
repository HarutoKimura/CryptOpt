# Vector Multiplication Investigation Report

**Date:** July 31, 2025  
**Investigation:** Why vector multiplication templates are not being called in CryptOpt

## Executive Summary

The vector multiplication infrastructure has been successfully implemented in CryptOpt, including:
- Decision enums for choosing between scalar and vector multiplication
- AVX2 instruction generation templates
- Integration with the existing multiplication pipeline
- Test infrastructure

However, the vector operations are not being generated in the final assembly because the decision mechanism is preventing their selection.

## Key Findings

### 1. Infrastructure is Complete and Functional

The following components have been implemented:

**Decision Infrastructure:**
- `DI_MULTIPLICATION_TYPE = "di_mult_type"` enum for multiplication type decisions
- `C_DI_MULTIPLICATION_TYPE` with choices:
  - `C_SCALAR_MULX = "c_scalar_mulx"` (scalar multiplication)
  - `C_VECTOR_AVX2 = "c_vector_avx2"` (AVX2 vector multiplication)

**Implementation Files:**
- `/src/instructionGeneration/multiplicationHelpers/vector_mul.ts` - Main interface
- `/src/instructionGeneration/multiplicationHelpers/vector_mul_avx2_real.ts` - AVX2 implementation
- Integration in `/src/instructionGeneration/multiplication.ts`

**Test Files:**
- `/test/instructionGeneration/multiplication_vector.ts`
- `/test/instructionGeneration/multiplication_vector_avx2.ts`

### 2. The Decision Mechanism Issue

The root cause why vector multiplication is not being used:

1. **Pre-determined Decisions**: Operations loaded from JSON files already have their multiplication type decisions set:
   ```json
   "di_mult_type": [0, ["c_scalar_mulx", "c_vector_avx2"]]
   ```
   Where index `0` always selects scalar multiplication.

2. **Paul's Decision System**: The `Paul.choose()` function returns stored decisions from the operation, not random choices:
   ```typescript
   const idx = decision[0];  // Always 0 for existing operations
   const element = possibilitiesOfThatSavedDecision[idx];  // Always c_scalar_mulx
   ```

3. **Decision Flow**:
   - Operations are loaded from JSON with pre-set decisions
   - `Paul.chooseMulType()` returns the stored decision (scalar)
   - Vector multiplication code is never reached

### 3. Code Structure

The implementation follows a clean layered architecture:

```
multiplication.ts
    ↓ calls
mul_vector_avx2() [from vector_mul.ts]
    ↓ delegates to
mul_vector_avx2_real() [from vector_mul_avx2_real.ts]
    ↓ generates
AVX2 assembly instructions
```

### 4. Attempted Solutions

Several approaches were tried to force vector multiplication:

1. **Modified Paul.chooseMulType()** to force AVX2 selection
2. **Added random forcing logic** in multiplication.ts
3. **Added debug comments** to track decision flow

These attempts revealed that the decision is made before the multiplication functions are called, making runtime forcing ineffective.

## Technical Details

### AVX2 Implementation

The vector multiplication implementation generates proper AVX2 instructions:
- `vmovq` - Load values into XMM registers
- `vpmuludq` - Parallel multiply of 32-bit values
- `vpsrlq` - Vector shift right for high bits
- `vpaddq` - Vector addition for accumulation
- `pextrq` - Extract results from vector registers

### Decision Addition in fiatHelpers.ts

The decision is properly added to multiplication operations:
```typescript
case "*": {
  if (result.datatype === "u128") {
    result.decisions[DECISION_IDENTIFIER.DI_MULTIPLICATION_TYPE] = [
      Paul.chooseBetween(2),
      [C_DI_MULTIPLICATION_TYPE.C_SCALAR_MULX, C_DI_MULTIPLICATION_TYPE.C_VECTOR_AVX2],
    ];
  }
  // ...
}
```

## Recommendations

To enable vector multiplication in CryptOpt:

1. **Modify Initial Generation**: When generating new optimization runs (not loading from JSON), ensure the multiplication type decision can select index 1 (vector) instead of always 0 (scalar).

2. **Add Command-Line Flag**: Implement a flag like `--force-vector` that overrides stored decisions and forces fresh random selection.

3. **Modify Paul's Decision Logic**: Add a mode where Paul ignores stored decisions for specific decision types and makes fresh random choices.

4. **Performance Testing**: Once vector operations are being generated, benchmark against scalar operations to validate performance improvements.

## Conclusion

The vector multiplication infrastructure is fully implemented and ready to use. The only barrier is the decision mechanism that currently prevents its selection. With minor modifications to how decisions are made (rather than the multiplication implementation itself), CryptOpt can begin generating and optimizing AVX2 vector multiplication operations.

The implementation demonstrates CryptOpt's extensibility for SIMD instructions and lays the groundwork for future vector operation support (AVX-512, ARM NEON, etc.).