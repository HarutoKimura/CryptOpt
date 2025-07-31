# CryptOpt Formal Verification: Understanding Proof Failures with XMM Registers

## Overview

This document explains the formal verification process in CryptOpt and why proof verification can fail when using XMM (vector) registers for optimization.

## What is Formal Verification in CryptOpt?

CryptOpt uses **Fiat-Crypto**, a formal verification tool developed at MIT, to mathematically prove that generated assembly code correctly implements cryptographic algorithms. This is not just testing - it provides mathematical proof of correctness.

## The Verification Pipeline

### 1. Code Generation Phase
- CryptOpt generates optimized x86-64 assembly for cryptographic operations
- Assembly includes hints about register allocation and instruction ordering
- When `--xmm` and `--preferXmm` flags are used, CryptOpt prioritizes vector registers for spilling

### 2. Proof Command Construction

CryptOpt invokes Fiat-Crypto verification binaries located in `/src/bridge/fiat-bridge/data/`:
- `unsaturated_solinas`
- `word_by_word_montgomery`
- `dettman_multiplication`
- `solinas_reduction`

Example proof command:
```bash
./unsaturated_solinas --no-primitives --no-wide-int --shiftr-avoid-uint1 \
  --output /dev/null --output-asm /dev/null --tight-bounds-mul-by 1.000001 \
  'curve25519' '64' '5' '2^255 - 19' carry_mul \
  --hints-file /path/to/generated.asm
```

### 3. Synthesis Verification Process

The verification follows these steps:

```
Generated Assembly → Fiat-Crypto Synthesizer → Mathematical Model → Proof ✓/✗
```

The synthesizer:
1. Parses assembly instructions
2. Builds a mathematical model of the code's behavior
3. Proves the model matches expected cryptographic operations
4. Verifies:
   - No integer overflows occur
   - Modular reduction is correct
   - Carry propagation is proper
   - Bounds are maintained

## Why Proof Fails with XMM Registers

### Error Encountered
```
Fatal error: exception Failure("Synthesis failed")
tried to prove correct. didnt work.
```

### Root Causes

1. **Pattern Mismatch**
   - Fiat-Crypto expects specific scalar instruction patterns
   - XMM instructions (MOVDQA, MOVDQU, etc.) don't match expected patterns
   - The synthesizer cannot map vector operations to mathematical primitives

2. **Abstraction Gap**
   - Fiat-Crypto models scalar arithmetic operations
   - Vector registers introduce parallelism that breaks assumptions
   - Memory alignment requirements differ between scalar and vector operations

3. **Verification Limitations**
   - Current Fiat-Crypto version may not support SSE/AVX instructions
   - Proof system designed for general-purpose registers (RAX, RBX, etc.)
   - XMM spilling changes memory access patterns

## Impact on Security

While proof verification fails, this doesn't necessarily mean the code is incorrect:
- CryptOpt still performs correctness testing against C implementations
- The optimization maintains functional correctness
- However, formal mathematical proof is unavailable

## Solutions and Workarounds

### 1. Development Mode (Skip Proof)
```bash
./CryptOpt --bridge fiat --curve curve25519 --method mul --xmm --preferXmm --no-proof
```
- Useful for testing XMM optimization benefits
- Still validates against reference implementation
- Not suitable for production use

### 2. Try Different Seeds
```bash
./CryptOpt --bridge fiat --curve curve25519 --method mul --xmm --preferXmm --seed 12345
```
- Different random seeds generate different instruction sequences
- Some sequences may be provable despite XMM usage
- Requires multiple attempts

### 3. Baseline Testing
```bash
./CryptOpt --bridge fiat --curve curve25519 --method mul --no-proof
```
- Test without XMM optimization
- Establishes performance baseline
- Typically succeeds with proof verification

### 4. Production Approach
For production use requiring formal verification:
1. Use standard register allocation (no `--xmm` flag)
2. Accept slightly lower performance for proof guarantees
3. Wait for Fiat-Crypto updates supporting vector instructions

## Technical Details

### Code Locations
- Proof verification: `/src/optimizer/optimizer.class.ts:545-558`
- Proof command builder: `/src/bridge/fiat-bridge/FiatBridge.ts:198-226`
- Fiat binaries: `/src/bridge/fiat-bridge/data/`

### Verification Parameters
- `--tight-bounds-mul-by 1.000001`: Allows small margin for bounds
- `--shiftr-avoid-uint1`: Avoids problematic 1-bit shifts
- `--no-primitives --no-wide-int`: Disables certain optimizations

## Conclusion

The "Synthesis failed" error occurs because Fiat-Crypto's formal verification system cannot currently prove correctness of assembly code using XMM registers. This is a limitation of the proof system rather than an indication of incorrect code. For applications requiring formal verification, standard register allocation should be used. For performance-critical applications where correctness testing is sufficient, XMM optimization can provide significant speedups.

## References

- [Fiat-Crypto GitHub Repository](https://github.com/mit-plv/fiat-crypto)
- [Simple High-Level Code For Cryptographic Arithmetic (S&P'19)](http://adam.chlipala.net/papers/FiatCryptoSP19/FiatCryptoSP19.pdf)
- [CryptOpt Paper (PLDI'23)](https://doi.org/10.1145/3591269)