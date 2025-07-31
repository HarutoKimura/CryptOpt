# CryptOpt Vector Operation Support - Detailed Report

## Overview

CryptOpt supports vector operations through XMM registers (128-bit SIMD registers in x86-64). This feature allows the optimizer to use XMM registers as temporary storage for spilled values, potentially improving performance by reducing memory access.

## 1. Command-Line Argument Processing

### File: `src/helper/argParse.ts`

**Lines 161-169**: Defines `--xmm` option
```typescript
.option("xmm", {
  alias: "x",
  default: false,
  describe: "If this is set, CryptOpt will optimize considering to spill into vector registers rather than spilling solely into memory.",
  boolean: true,
})
```

**Lines 170-177**: Defines `--preferXmm` option
```typescript
.option("preferXmm", {
  alias: "X", 
  default: false,
  describe: "If this is set, CryptOpt will prefer spilling into vector registers as long as they are available, then start spilling into memory. Must specify --xmm switch, too. It will not try to optimize on it. (i.e. The first 16 values to be spilled will be spilled into XMMs, the rest into memory.)",
  boolean: true,
})
```

**Line 46**: Exports parsed arguments as `parsedArgs`

### File: `src/types/optimizer.types.ts`

**Lines 40-42**: Defines XMM options in `OptimizerArgs` type
```typescript
xmm?: boolean;
redzone: boolean;
preferXmm?: boolean;
```

## 2. XMM Register Definitions

### File: `src/enums/Registers.enum.ts`

**Lines 80-97**: Defines all 16 XMM registers
```typescript
export enum XmmRegister {
  xmm0 = "xmm0",
  xmm1 = "xmm1",
  xmm2 = "xmm2",
  xmm3 = "xmm3",
  xmm4 = "xmm4",
  xmm5 = "xmm5",
  xmm6 = "xmm6",
  xmm7 = "xmm7",
  xmm8 = "xmm8",
  xmm9 = "xmm9",
  xmm10 = "xmm10",
  xmm11 = "xmm11",
  xmm12 = "xmm12",
  xmm13 = "xmm13",
  xmm14 = "xmm14",
  xmm15 = "xmm15",
}
```

### File: `src/helper/const/RegisterConstants.ts`

**Lines 42+**: Exports `ALL_XMM_REGISTERS` array containing all XMM registers

## 3. Register Allocation Logic

### File: `src/registerAllocator/RegisterAllocator.class.ts`

#### Key Methods:

**Lines 173-178**: `canXmm` getter - checks if XMM spilling is enabled
```typescript
private get canXmm(): boolean {
  if (RegisterAllocator._options?.xmm) {
    return RegisterAllocator._options.xmm == true;
  }
  return false;
}
```

**Lines 185-201**: `getFreeXmmRegister()` - finds available XMM registers
```typescript
private getFreeXmmRegister(): XmmRegister | false {
  const allocatedXmms = this.valuesAllocations
    .map(({ store }) => store)
    .filter((r) => isXmmRegister(r)) as XmmRegister[];
  const freeXmms = ALL_XMM_REGISTERS.filter((r) => !allocatedXmms.includes(r));
  if (freeXmms.length == 0) {
    return false;
  }
  return freeXmms[0];
}
```

**Lines 700-750**: Main spilling logic in allocation process
```typescript
const freeXmm = RegisterAllocator._options?.xmm && this.getFreeXmmRegister();
let choice = C_DI_SPILL_LOCATION.C_DI_MEM; // fallback

if (this.canXmm && freeXmm) {
  if (RegisterAllocator._options?.preferXmm) {
    choice = C_DI_SPILL_LOCATION.C_DI_XMM_REG;
    this.addToPreInstructions(`; spilling ${spareVariableName} to xmm because we prefer that`);
  } else if (matchXD(spareVariableName)) {
    choice = Paul.chooseSpillLocation(Model.operationByName(spareVariableName));
    this.addToPreInstructions(`; spilling of ${spareVariableName} is decided by Paul`);
  }
}
```

**Lines 756-763**: XMM spilling implementation
```typescript
if (choice == C_DI_SPILL_LOCATION.C_DI_XMM_REG) {
  if (isByteRegister(spilling_reg)) {
    const { inst, reg } = zx(spilling_reg);
    this.addToPreInstructions(inst);
    spilling_reg = reg;
  }
  this.addToPreInstructions(`movq ${freeXmm}, ${spilling_reg}; spilling ${spareVariableName} to xmm`);
  this._allocations[spareVariableName].store = freeXmm as XmmRegister;
}
```

**Lines 830-838**: `xmm2reg()` and `moveXmmToReg()` - convert XMM to general-purpose register
```typescript
private moveXmmToReg({ store }: Pick<ValueAllocation, "store">): RegisterAllocation {
  const varname = this.getVarnameFromStore({ store });
  const dest = this.getW(varname);
  this.addToPreInstructions(`movq ${dest}, ${store}; un-xmm-ify ${varname} `);
  return this._allocations[varname] as RegisterAllocation;
}
```

**Lines 1200-1210**: Loading from XMM during register loading
```typescript
if (isXmmRegister(store)) {
  this._clobbers.add(nameOfVar);
  const reg = this.getW(nameOfVar);
  this._preInstructions.push(`movq ${reg}, ${store}; loading ${nameOfVar} from spilled xmm`);
  this._allocations[nameOfVar].store = reg;
  return reg;
}
```

## 4. Paul Decision Engine

### File: `src/paul/Paul.class.ts`

**Lines 100-106**: `chooseSpillLocation()` - decides between memory and XMM spilling
```typescript
public static chooseSpillLocation(c: Readonly<CryptOpt.StringOperation>): C_DI_SPILL_LOCATION {
  return Paul.choose(
    [C_DI_SPILL_LOCATION.C_DI_MEM, C_DI_SPILL_LOCATION.C_DI_XMM_REG],
    DECISION_IDENTIFIER.DI_SPILL_LOCATION,
    c,
  );
}
```

### File: `src/enums/DI.enum.ts`

**Lines 54-57**: Defines spill location choices
```typescript
export enum C_DI_SPILL_LOCATION {
  C_DI_MEM = "c_mem",
  C_DI_XMM_REG = "c_xmm_reg",
}
```

## 5. Instruction Generation

### File: `src/enums/AllocationFlags.enum.ts`

**Line 30**: `DISALLOW_XMM` flag prevents XMM register allocation for specific operations
```typescript
DISALLOW_XMM = 1 << 4,
```

### File: `src/instructionGeneration/addition.ts`

**Lines 285-292**: Converts XMM to GP registers for flag-dependent operations
```typescript
// we need to get all xmm's into GP-regs, as we are interested in the COUT-Flag 
// and we cant observe the cout with vector instructions
if (isXmmRegister(a_arg1.store)) {
  a_arg1 = RegisterAllocator.xmm2reg(a_arg1);
}
if (isXmmRegister(a_arg2.store)) {
  a_arg2 = RegisterAllocator.xmm2reg(a_arg2);
}
```

### File: `src/instructionGeneration/mov.ts`

**Line 54**: Uses `movq` instruction for XMM registers
```typescript
const instr = isXmmRegister(allocation.in[0]) ? "movq" : "mov";
```

### File: `src/instructionGeneration/multiplication.ts`

**Lines 430-440**: `makeArgRanR64()` - ensures arguments are in general-purpose registers
```typescript
function makeArgRanR64(argR: string, ra: RegisterAllocator): string {
  // make sure we fix xmm's
  if (isXmmRegister(argR)) {
    return RegisterAllocator.xmm2reg({ store: argR }).store;
  }
  if (isByteRegister(argR)) {
    const { inst, reg } = zx(argR);
    ra.addToPreInstructions(inst);
    return reg;
  }
  return argR;
}
```

## 6. Usage in Operations

Many instruction generation functions use `AllocationFlags.DISALLOW_XMM` to prevent XMM allocation:

- **Conditional moves** (`mov.ts:85, 102, 144`)
- **Comparisons** (`cmp.ts`)
- **Bitwise operations** (`bitwiseOps.ts`)
- **Shifts** (`shift.ts`)
- **Multiplications** (`multiplication.ts`)

This restriction exists because these operations often need flag results or specific register constraints incompatible with XMM registers.

## 7. How It Works - Flow Diagram

```
1. User enables XMM support via --xmm flag
   ↓
2. RegisterAllocator checks if spilling is needed
   ↓
3. If --preferXmm is set → Always use XMM if available
   Otherwise → Paul decides based on learning
   ↓
4. If XMM chosen and available:
   - Use movq to spill GP register to XMM
   - Track allocation in _allocations map
   ↓
5. When value needed again:
   - Use movq to load from XMM to GP register
   - Update allocation tracking
```

## 8. Key Design Decisions

1. **Limited to 64-bit values**: Uses `movq` instruction which moves 64-bit values
2. **Learning-based decisions**: Paul can learn when XMM spilling is beneficial
3. **Fallback to memory**: When all 16 XMM registers are used, falls back to memory
4. **Flag preservation**: XMM operations don't affect CPU flags, preserving flag state
5. **Automatic conversion**: Seamlessly converts between XMM and GP registers as needed

## 9. Vector Multiplication Implementation Progress

### Research Goal
Extend CryptOpt to support actual vector operations (SIMD) for cryptographic computations, beyond just using XMM registers for spilling. The goal is to use AVX2 instructions like `vpmuludq` for parallel limb multiplication in curve25519.

### Implementation Added

#### New Decision Types
**File: `src/enums/DI.enum.ts`**
```typescript
DI_MULTIPLICATION_TYPE = "di_mult_type", // choose between scalar/vector multiplication

export enum C_DI_MULTIPLICATION_TYPE {
  C_SCALAR_MULX = "c_scalar_mulx", // Use scalar mulx instruction
  C_VECTOR_AVX2 = "c_vector_avx2", // Use AVX2 vector multiplication
}
```

#### Decision Making
**File: `src/paul/Paul.class.ts`**
```typescript
public static chooseMulType(): C_DI_MULTIPLICATION_TYPE {
  return Paul.choose(
    [C_DI_MULTIPLICATION_TYPE.C_SCALAR_MULX, C_DI_MULTIPLICATION_TYPE.C_VECTOR_AVX2],
    DECISION_IDENTIFIER.DI_MULTIPLICATION_TYPE,
  );
}
```

#### Vector Multiplication Functions
**File: `src/instructionGeneration/multiplicationHelpers/vector_mul_avx2_real.ts`**
- Implements actual AVX2 instruction generation
- Supports both multiplication and squaring
- Generates instructions like:
  - `vmovq` - Move 64-bit values to/from XMM registers
  - `vpmuludq` - Multiply packed unsigned 32-bit integers
  - `vpsrlq` - Logical right shift of 64-bit values
  - `vpaddq` - Add packed 64-bit integers
  - `vpextrq` - Extract 64-bit value from XMM register

#### Integration Points
**File: `src/instructionGeneration/multiplication.ts`**
- Modified `mul()` and `mulx()` functions to check for vector multiplication decision
- Routes to vector implementation when AVX2 is chosen

**File: `src/helper/fiatHelpers.ts`**
- Added `DI_MULTIPLICATION_TYPE` decision to multiplication operations
- Ensures decision is available for Paul to make

### Current Status

1. **Framework Complete**: The infrastructure for vector multiplication decisions is fully implemented
2. **AVX2 Instructions**: Real AVX2 instruction generation is implemented
3. **Testing**: Unit tests verify the vector multiplication code paths work correctly
4. **Integration Issue**: When running CryptOpt, the vector multiplication path is not being triggered in practice

### Technical Challenges Identified

1. **Decision Initialization**: The multiplication operations need the `DI_MULTIPLICATION_TYPE` decision properly initialized
2. **Operation Type**: Fiat-Crypto generates `*` operations which go through `mul()`, not just `mulx()`
3. **Performance Evaluation**: CryptOpt's optimizer needs to see performance benefit to keep vector instructions

### Next Steps for Full Integration

1. **Performance Tuning**: Adjust the vector multiplication implementation to show measurable performance improvements
2. **Optimizer Integration**: Ensure the CryptOpt optimizer can properly evaluate vector vs scalar performance
3. **Parallel Limb Processing**: Extend to process multiple limbs in parallel (e.g., 2-4 limbs at once)
4. **Carry Propagation**: Implement efficient carry handling with vector instructions
5. **Benchmark Suite**: Create specific benchmarks to validate performance improvements

## Summary

The vector operation support in CryptOpt provides:

1. **Performance optimization**: Reduces memory access by using XMM registers as fast temporary storage
2. **Intelligent decisions**: Uses machine learning (Paul) to decide when XMM spilling is beneficial
3. **User control**: Provides command-line options for manual control over spilling behavior
4. **Seamless integration**: Automatically handles conversions between register types
5. **Constraint awareness**: Respects operation requirements by disabling XMM usage where inappropriate
6. **Vector Computation Foundation**: Infrastructure for actual SIMD computations is now in place

The current implementation successfully uses XMM registers for spilling. The next phase involves fully integrating actual vector computations (AVX2) for cryptographic operations, which has been partially implemented but requires further optimization and integration work to be effective in practice.