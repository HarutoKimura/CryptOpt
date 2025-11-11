# Fair Comparison Implementation: How .so Files Are Loaded and Measured

This document explains how CryptOpt's fair comparison mode works, detailing how baseline and optimized assembly are compiled to shared object files and measured.

## Overview

CryptOpt's fair comparison mode ensures an apples-to-apples performance comparison by compiling all functions (baseline and CryptOpt-generated) to `.so` files using the same compiler toolchain.

**Without `--fairComparison`:**
- Baseline: C/Rust code → gcc/rustc → `.so` file
- CryptOpt A/B: Assembly strings → AssemblyLine (runtime JIT)

**With `--fairComparison`:**
- Baseline: C/Rust code → gcc/rustc → `.so` file
- CryptOpt A/B: Assembly → NASM → `.o` → gcc → `.so` file

All three are now compiled `.so` files, eliminating compilation method as a variable.

---

## Part 1: How the Baseline `.so` File is Loaded

### Initialization Flow

```
CryptOpt startup
    ↓
optimizer.class.ts (line 78)
    ↓
init() - optimizer.helper.class.ts (line 212)
    ↓
initFiat() / initRust() / etc. (line 74)
    ↓
bridge.machinecode() - FiatBridge.ts (line 112)
    ↓
createMS() - optimizer.helper.class.ts (line 193)
    ↓
new Measuresuite() constructor - measuresuite/index.js (line 49)
    ↓
ms.load_shared_object_file() - native module
    ↓
Baseline loaded as function #0 (permanently)
```

### Step-by-Step Explanation

#### 1. **Optimizer Constructor** (`src/optimizer/optimizer.class.ts:78`)

```typescript
const { measuresuite, symbolname } = init(this.libcheckfunctionDirectory, args);
```

Calls `init()` to set up measuresuite with the baseline implementation.

#### 2. **init() Function** (`src/optimizer/optimizer.helper.class.ts:212-244`)

```typescript
export function init(tmpDir: string, args: any): { symbolname: string; measuresuite: Measuresuite } {
  // Create temp directory
  mkdirSync(tmpDir, { recursive: true });

  // Generate filename for baseline .so file
  const sharedObjectFilename = resolve(
    tmpDir,
    `libcheckfunctions-s${args.seed}-b${args.bridge}-p${process.pid}.so`,
  );
  // Example: /tmp/CryptOpt.cache/abc123/libcheckfunctions-s123-bfiat-p12345.so

  // Call bridge-specific initialization
  let r: ret;
  switch (args.bridge) {
    case "fiat":
      r = initFiat(sharedObjectFilename, args);
      break;
    case "rust":
      r = initRust(sharedObjectFilename, args);
      break;
    // ... other bridges
  }

  // Create and return Measuresuite instance with baseline loaded
  return createMS(r, sharedObjectFilename);
}
```

**Key point:** Creates a unique filename for the baseline `.so` file and passes it to the bridge.

#### 3. **initFiat() Function** (`src/optimizer/optimizer.helper.class.ts:74-89`)

```typescript
function initFiat(sharedObjectFilename: string, args: needFiat): ret {
  const bridge = new FiatBridge();

  // Initialize CryptOpt's internal model with JSON representation
  Model.init({
    memoryConstraints: args.memoryConstraints,
    json: bridge.getCryptOptFunction(args.method, args.curve),
  });

  // Generate the baseline .so file from Fiat-generated C code
  const symbolname = bridge.machinecode(sharedObjectFilename, args.method, args.curve);
  // ^^^ This creates the baseline .so file!

  const chunksize = 16;
  const argwidth = bridge.argwidth(args.curve);
  const argnumin = bridge.argnumin(args.method);
  const argnumout = bridge.argnumout(args.method);
  const bounds = CURVE_DETAILS[args.curve].bounds;

  return { symbolname, chunksize, argwidth, argnumin, argnumout, bounds };
}
```

**Key point:** Calls `bridge.machinecode()` which compiles the C code to a `.so` file.

#### 4. **bridge.machinecode() Function** (`src/bridge/fiat-bridge/FiatBridge.ts:112-148`)

```typescript
public machinecode(
  filename: string,
  method: METHOD_T,
  curve: CURVE_T,
  ccOverwrite: string | undefined = undefined,
  force = false,
): string {
  const cc = ccOverwrite ?? CC; // Default: gcc
  const { cmd, methodname, hash } = this.buildCommand(curve, method, "C");

  // Check if already exists
  if (!force && existsSync(filename)) {
    return methodname;
  }

  // Generate C code cache filename
  const cCacheFilename = resolve(cacheDir, `${hash}.c`);

  // Generate C code from Fiat if not cached
  if (!existsSync(cCacheFilename)) {
    const command = `data=$(${cmd}); cat <<<"\${data}" > ${cCacheFilename}`;
    lockAndRunOrReturn(cCacheFilename, command, { shell: "/usr/bin/bash" });
  }

  // Compile C code to shared object file
  const command = `${cc} ${CFLAGS} -fPIC -shared -o ${filename} ${cCacheFilename}`;
  // Example: gcc -march=native -mtune=native -O3 -fPIC -shared -o baseline.so fiat_curve25519_mul.c
  lockAndRunOrReturn(filename, command, { shell: "/usr/bin/bash" });

  return methodname; // e.g., "fiat_curve25519_carry_mul"
}
```

**Key point:** Compiles Fiat-generated C code to `.so` using gcc with `-march=native -mtune=native -O3`.

#### 5. **createMS() Function** (`src/optimizer/optimizer.helper.class.ts:193-209`)

```typescript
function createMS(
  { argwidth, argnumin, argnumout, chunksize, bounds, symbolname }: ret,
  libcheckfunctionFile: string,
): { symbolname: string; measuresuite: Measuresuite } {
  return {
    symbolname,
    measuresuite: new Measuresuite(
      argwidth,
      argnumin,
      argnumout,
      chunksize,
      bounds,
      libcheckfunctionFile,  // ← Path to baseline .so file
      symbolname,             // ← Function symbol name
    ),
  };
}
```

**Key point:** Creates Measuresuite instance, passing the baseline `.so` file path.

#### 6. **Measuresuite Constructor** (`node_modules/measuresuite/ts/dist/index.js:49-87`)

```javascript
function Measuresuite(argwidth, argNumIn, argNumOut, chunkSize, bounds,
                      libcheckfunctionsFilename, functionSymbol) {
  this.argwidth = argwidth;

  // Check if baseline .so file exists
  if (libcheckfunctionsFilename && !existsSync(libcheckfunctionsFilename)) {
    throw new Error(`${libcheckfunctionsFilename} does not exist.`);
  }

  try {
    // Initialize native measuresuite module
    ms.init(argwidth, argNumIn, argNumOut);

    if (libcheckfunctionsFilename) {
      // Enable correctness checking
      ms.enable_checking();

      // Load baseline .so file as function #0 (permanently)
      ms.load_shared_object_file(libcheckfunctionsFilename, functionSymbol);
      // ^^^ This is where the baseline gets loaded!
    }

    if (typeof chunkSize !== "undefined" && chunkSize !== null) {
      ms.enable_chunk_counting(chunkSize);
    }

    this.setBounds(bounds);
  } catch (e) {
    console.error(e);
    throw new Error("Could not initialize Measuresuite.");
  }

  // Set up mapping for file type loading
  this.ft2load.set("ELF", ms.load_elf_file);
  this.ft2load.set("ASM", ms.load_asm_file);
  this.ft2load.set("BIN", ms.load_bin_file);
  this.ft2load.set("SHARED_OBJECT", ms.load_shared_object_file);
}
```

**Key point:** The constructor loads the baseline `.so` file using `ms.load_shared_object_file()` and it remains loaded for the entire session.

### Baseline Loading Summary

| Step | Location | Action |
|------|----------|--------|
| 1 | optimizer.class.ts | Initialize optimizer |
| 2 | optimizer.helper.class.ts | Create `.so` filename |
| 3 | optimizer.helper.class.ts | Call bridge init |
| 4 | FiatBridge.ts | Generate C code from Fiat |
| 5 | FiatBridge.ts | Compile: `gcc -O3 -fPIC -shared -o baseline.so code.c` |
| 6 | optimizer.helper.class.ts | Create Measuresuite with `.so` path |
| 7 | measuresuite/index.js | Load baseline with `ms.load_shared_object_file()` |
| 8 | Native module | Baseline now loaded as function #0 |

**Result:** Baseline `.so` file is loaded once and stays loaded throughout optimization.

---

## Part 2: How Assembly Strings Are Measured (Original Mode)

### Without `--fairComparison`

When fair comparison is disabled, CryptOpt passes assembly strings directly to measuresuite.

#### Measurement Flow

```typescript
// optimizer.class.ts (line 395-398)
results = this.measuresuite.measure(batchSize, numBatches, [
  this.asmStrings[FUNCTIONS.F_A],
  this.asmStrings[FUNCTIONS.F_B],
]);
```

#### What Happens Inside `measure()`

```javascript
// measuresuite/index.js (line 135-169)
Measuresuite.prototype.measure = function (batchSize, numBatches, functions) {
    if (functions === void 0) { functions = []; }
    var result;

    try {
        // 1. Load each assembly string temporarily
        functions.forEach(ms.load_asm_string);
        // Now loaded: [baseline.so, asmA, asmB]
    } catch (e) {
        console.error("Error loading asm strings", e);
        throw new Error("Could not measure." + e);
    }

    try {
        // 2. Measure all loaded functions
        result = ms.measure(batchSize, numBatches);
    } catch (e) {
        console.error("Error during measurement", e);
        throw new Error("Could not measure." + e);
    }

    // 3. Unload the temporarily loaded assembly strings
    try {
        functions.forEach(function (_) { return ms.unload_last(); });
        // Now loaded: [baseline.so]
    } catch (e) {
        console.error("Error unloading functions", e);
        throw new Error("Could not measure." + e);
    }

    if (result) {
        return JSON.parse(result);
    }
    return null;
};
```

#### State Changes During Measurement

| Phase | Loaded Functions |
|-------|-----------------|
| Before measure() | `[baseline.so]` |
| After forEach(load_asm_string) | `[baseline.so, asmA, asmB]` |
| During ms.measure() | Measures all 3 functions |
| After forEach(unload_last) | `[baseline.so]` |

**Key point:** `measure()` automatically handles loading and unloading assembly strings. The baseline stays loaded.

---

## Part 3: How .so Files Are Measured (Fair Comparison Mode)

### With `--fairComparison`

When fair comparison is enabled, CryptOpt compiles assembly to `.so` files and loads them manually.

#### Compilation and Measurement Flow

```typescript
// optimizer.class.ts (line 321-392)
if (this.args.fairComparison) {
  let soFileA: string | undefined;
  let soFileB: string | undefined;

  try {
    // Step 1: Compile assembly to .so files
    soFileA = compileNasmToSharedObject(
      this.asmStrings[FUNCTIONS.F_A],
      pathResolve(this.libcheckfunctionDirectory, `cryptopt_a_${numEvals}`),
      this.symbolname
    );

    soFileB = compileNasmToSharedObject(
      this.asmStrings[FUNCTIONS.F_B],
      pathResolve(this.libcheckfunctionDirectory, `cryptopt_b_${numEvals}`),
      this.symbolname
    );

    // Step 2: Load .so files manually using native_ms
    native_ms.load_shared_object_file(soFileA, this.symbolname);
    native_ms.load_shared_object_file(soFileB, this.symbolname);
    // Now loaded: [baseline.so, cryptoptA.so, cryptoptB.so]

    // Step 3: Measure with empty array (functions already loaded)
    results = this.measuresuite.measure(batchSize, numBatches, []);

    // Step 4: Manually unload the .so files we just loaded
    native_ms.unload_last(); // unload soFileB
    native_ms.unload_last(); // unload soFileA
    // Now loaded: [baseline.so]

  } catch (fairCompError) {
    // Fall back to regular measurement if fair comparison fails
    Logger.log(`Error in fair comparison mode: ${fairCompError}`);
    results = this.measuresuite.measure(batchSize, numBatches, [
      this.asmStrings[FUNCTIONS.F_A],
      this.asmStrings[FUNCTIONS.F_B],
    ]);
  } finally {
    // Clean up .so files from disk
    if (soFileA && existsSync(soFileA)) {
      rmSync(soFileA);
    }
    if (soFileB && existsSync(soFileB)) {
      rmSync(soFileB);
    }
  }
}
```

#### The `compileNasmToSharedObject()` Function

```typescript
// optimizer.helper.class.ts (line 254-307)
export function compileNasmToSharedObject(
  asmCode: string,
  outputPath: string,
  symbolName: string
): string {
  const asmFile = `${outputPath}.asm`;
  const objFile = `${outputPath}.o`;
  const soFile = `${outputPath}.so`;

  try {
    // Check if assembly already has NASM directives
    const hasNasmDirectives = asmCode.includes('SECTION') || asmCode.includes('GLOBAL');

    let formattedAsm: string;
    if (hasNasmDirectives) {
      formattedAsm = asmCode;
    } else {
      // Wrap raw assembly with NASM directives
      formattedAsm = `SECTION .text
GLOBAL ${symbolName}
${symbolName}:
${asmCode}`;
    }

    // Write assembly to file
    writeFileSync(asmFile, formattedAsm);

    // Step 1: Assemble to object file
    const nasmCmd = `nasm -f elf64 -o ${objFile} ${asmFile}`;
    execSync(nasmCmd, { stdio: 'pipe' });

    // Step 2: Link to shared object using same compiler as baseline
    const cc = env.CC; // Uses gcc by default, or clang if CC=clang is set
    const linkCmd = `${cc} -shared -fPIC -o ${soFile} ${objFile}`;
    execSync(linkCmd, { stdio: 'pipe' });

    // Clean up intermediate files
    if (existsSync(asmFile)) unlinkSync(asmFile);
    if (existsSync(objFile)) unlinkSync(objFile);

    return soFile;
  } catch (error) {
    // Clean up on error
    if (existsSync(asmFile)) unlinkSync(asmFile);
    if (existsSync(objFile)) unlinkSync(objFile);
    if (existsSync(soFile)) unlinkSync(soFile);

    throw new Error(`Failed to compile NASM to shared object: ${error}`);
  }
}
```

#### State Changes During Fair Comparison

| Phase | Loaded Functions | On Disk |
|-------|-----------------|---------|
| Before fair comparison | `[baseline.so]` | baseline.so |
| After compileNasmToSharedObject() | `[baseline.so]` | baseline.so, cryptopt_a.so, cryptopt_b.so |
| After native_ms.load_shared_object_file() | `[baseline.so, cryptoptA.so, cryptoptB.so]` | baseline.so, cryptopt_a.so, cryptopt_b.so |
| During measure([]) | Measures all 3 .so files | baseline.so, cryptopt_a.so, cryptopt_b.so |
| After native_ms.unload_last() × 2 | `[baseline.so]` | baseline.so, cryptopt_a.so, cryptopt_b.so |
| After rmSync() cleanup | `[baseline.so]` | baseline.so |

---

## Part 4: Why Pass Empty Array `[]` for .so Files?

### The Key Difference

```typescript
// Assembly strings mode
results = this.measuresuite.measure(batchSize, numBatches, [asmA, asmB]);
// measure() loads, measures, and unloads automatically

// .so files mode
native_ms.load_shared_object_file(soFileA, symbolName);
native_ms.load_shared_object_file(soFileB, symbolName);
results = this.measuresuite.measure(batchSize, numBatches, []);
// measure() only measures (we loaded manually)
native_ms.unload_last();
native_ms.unload_last();
```

### Why We Can't Pass .so Files to `measure()`

The `measure()` function's `functions` parameter only accepts **assembly strings**:

```javascript
// Inside measure()
functions.forEach(ms.load_asm_string);  // ← Only loads assembly STRINGS
```

There is no `ms.load_shared_object_string()` - you cannot pass a `.so` file as a string!

Shared objects must be:
1. Compiled to disk as files
2. Loaded using `ms.load_shared_object_file(filename, symbol)`

### The Empty Array Trick

When we pass `[]` to `measure()`:

```javascript
functions.forEach(ms.load_asm_string);  // Does nothing (empty array)
result = ms.measure(batchSize, numBatches);  // Measures ALL currently loaded functions
functions.forEach(function (_) { return ms.unload_last(); });  // Does nothing (empty array)
```

**Result:** `measure()` simply measures whatever is currently loaded, without loading or unloading anything.

### Comparison Table

| Mode | Load Method | measure() Parameter | Unload Method |
|------|-------------|-------------------|---------------|
| **Assembly Strings** | Automatic (inside measure()) | `[asmA, asmB]` | Automatic (inside measure()) |
| **Shared Objects** | Manual (`native_ms.load_shared_object_file()`) | `[]` | Manual (`native_ms.unload_last()`) |

---

## Part 5: Complete Compilation Comparison

### Baseline Compilation

```bash
# Fiat generates C code
./unsaturated_solinas --lang C ... > fiat_curve25519_carry_mul.c

# Compile to .so
gcc -march=native -mtune=native -O3 -fPIC -shared \
    -o libcheckfunctions.so \
    fiat_curve25519_carry_mul.c
```

**Result:** Highly optimized `.so` file with:
- Native architecture optimizations (`-march=native`)
- CPU-specific tuning (`-mtune=native`)
- Maximum optimization (`-O3`)
- Full compiler optimizations (register allocation, instruction scheduling, etc.)

### CryptOpt Assembly Compilation (Fair Comparison)

```bash
# 1. Wrap assembly with NASM directives
echo "SECTION .text
GLOBAL fiat_curve25519_carry_mul
fiat_curve25519_carry_mul:
<CryptOpt-generated assembly>
" > cryptopt_a.asm

# 2. Assemble to object file
nasm -f elf64 -o cryptopt_a.o cryptopt_a.asm

# 3. Link to shared object using SAME compiler as baseline
gcc -shared -fPIC -o cryptopt_a.so cryptopt_a.o
```

**Result:** `.so` file with:
- Same linking as baseline (gcc)
- Same loading overhead
- Fair comparison - both are `.so` files

### Without Fair Comparison (Unfair)

CryptOpt assembly → AssemblyLine (runtime JIT) → Direct execution

**Problem:** Different execution environment than compiled `.so`, making comparison unfair.

---

## Part 6: Measurement Results Interpretation

### Results Structure

```typescript
interface MeasureResult {
  stats: {
    numFunctions: number;  // Always 3 (baseline + A + B)
    runtime: number;       // Total measurement time (ms)
    incorrect: number;     // 0=all correct, >0=which function differs
    timer: "PMC" | "RDTSCP";
  };
  functions: FunctionSummary[];  // [baseline, A, B]
  cycles: number[][];            // [baseline_cycles, A_cycles, B_cycles]
}
```

### Example Fair Comparison Result

```javascript
{
  "stats": {
    "numFunctions": 3,
    "runtime": 1520,
    "incorrect": 0,
    "timer": "RDTSCP"
  },
  "functions": [
    { "type": "SHARED_OBJECT" },  // baseline.so
    { "type": "SHARED_OBJECT" },  // cryptopt_a.so
    { "type": "SHARED_OBJECT" }   // cryptopt_b.so
  ],
  "cycles": [
    [1000, 995, 1003, ...],  // baseline cycle counts
    [920, 915, 918, ...],    // cryptopt_a cycle counts
    [925, 922, 928, ...]     // cryptopt_b cycle counts
  ]
}
```

**All three functions are SHARED_OBJECT type** - this is the proof of fair comparison!

### How Results Are Analyzed

```typescript
// optimizer.class.ts (line 421)
analyseResult = analyseMeasureResult(results, { batchSize, resultDir: this.args.resultDir });

// helper/analyse.ts (line 35-95)
const [cc, ca, cb] = result.cycles.map(analyseRow);
const rawMedian: numTripel = [ca.pre.median, cb.pre.median, cc.pre.median];
// Note: order is swapped - cc (baseline) is third element

// optimizer.class.ts (line 456)
const [meanrawA, meanrawB, meanrawCheck] = analyseResult.rawMedian;
// meanrawCheck is the median of the baseline
// meanrawA is the median of CryptOpt candidate A
// meanrawB is the median of CryptOpt candidate B
```

**Key Point:** All three median values come from `.so` files in fair comparison mode!

---

## Summary

### Baseline Loading (Once, at Startup)
1. Fiat generates C code
2. gcc compiles to baseline.so with -O3 -march=native
3. Measuresuite constructor loads baseline.so as function #0
4. Baseline stays loaded for entire session

### Fair Comparison Measurement (Each Iteration)
1. CryptOpt generates assembly A and B
2. compileNasmToSharedObject():
   - Wraps with NASM directives
   - nasm assembles to .o
   - gcc links to .so (same compiler as baseline)
3. native_ms.load_shared_object_file() loads both .so files
4. measure([]) measures all 3 .so files
5. native_ms.unload_last() × 2 unloads temporary .so files
6. Cleanup: delete .so files from disk

### Why This Is Fair
- **Same format:** All three are `.so` files
- **Same compiler:** All use gcc (or same CC)
- **Same overhead:** Loading, linking, execution all identical
- **Same optimization level:** gcc linking applies to all

### The Result
A truly fair comparison where the only difference is the assembly code quality, not the execution environment!
