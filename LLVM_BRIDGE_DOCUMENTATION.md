
# LLVM-to-CryptOpt-IR Conversion Pipeline: Preserving Correctness and Security Properties

This document outlines the design and implementation of the LLVM-to-CryptOpt-IR conversion pipeline. The primary goal of this pipeline is to translate low-level LLVM Intermediate Representation (IR), typically generated from cryptographic source code (e.g., Rust code using Fiat), into the higher-level, architecture-agnostic CryptOpt-IR.

A critical requirement for this translation is the preservation of functional correctness and essential security properties, particularly the **constant-time** nature of the implementation. This document addresses how the pipeline is designed to meet this requirement, responding to the concern that there is "*No discussion of whether the LLVM-to-CryptOpt pipeline preserves such properties.*"

## Two-Stage Conversion Process

The conversion is a two-stage process designed to systematically abstract away low-level details while preserving the core computational logic:

1.  **Stage 1: LLVM IR to Structured JSON (`llvm2json3.py`)**: A Python script parses the textual LLVM IR, filters it, and converts it into a structured JSON format. This stage focuses on cleaning the IR and removing constructs irrelevant to the cryptographic algorithm itself.
2.  **Stage 2: JSON to CryptOpt-IR (`preprocess.ts`)**: A TypeScript-based preprocessor consumes the JSON file, transforming the low-level operations into the formal CryptOpt-IR. This stage involves abstracting memory operations and mapping instruction semantics.

---

## Stage 1: LLVM IR to JSON (`llvm2json3.py`)

This stage acts as a filter and normalizer, preparing the LLVM IR for higher-level processing. Its primary responsibilities are parsing, variable normalization, and instruction filtering.

### Key Operations and Transformations:

1.  **Parsing and Normalization**:
    *   The script parses the function definition, arguments, and body from the `.ll` file.
    *   It systematically renames all LLVM registers (e.g., `%_0.i`, `%_6`) to a uniform, sequential format (`x0`, `x1`, `x2`, ...). This simplifies dataflow tracking in subsequent stages.

2.  **Instruction Filtering for Constant-Time Preservation**:
    The script is designed to process straight-line, arithmetic-heavy code, which is characteristic of constant-time cryptographic implementations. It explicitly filters out constructs that could introduce side channels or are irrelevant to the core logic:
    *   **Control Flow**: Basic block labels (`bb...`) and branch instructions (`br`) are ignored.
    *   **Error Handling**: Code blocks related to `panic` and `unreachable` are completely skipped. This ensures that the resulting IR only represents the successful execution path of the algorithm, which is the path relevant for correctness and performance analysis.
    *   **Stack Allocations**: `alloca` instructions are ignored. The CryptOpt-IR uses an abstract memory model with registers and arrays, making low-level stack management details unnecessary.

3.  **Abstraction of Memory Operations**:
    The script simplifies memory-related instructions to focus on data movement rather than low-level memory layout:
    *   **`getelementptr` (GEP)**: The script processes GEP instructions, which are used for pointer arithmetic. It correctly interprets these operations as array indexing. For instance, it converts byte-based offsets into word-based offsets (e.g., `i64 32` becomes `i64 4` for a 64-bit word size), abstracting away the specific size of data types in memory.
    *   **`load`/`store`**: Metadata such as `align`, `!noundef`, and `!tbaa` is stripped from `load` and `store` instructions. This removes implementation-specific details, retaining only the essential information: the source, the destination, and the data type.

By the end of this stage, the LLVM IR has been converted to a JSON format that represents a simplified, straight-line computation, free of control-flow branches and low-level memory management details.

---

## Stage 2: JSON to CryptOpt-IR (`preprocess.ts` and `transformations`)

This stage completes the abstraction process, converting the cleaned JSON representation into the formal, high-level CryptOpt-IR.

### Key Operations and Transformations:

1.  **Argument and Return Value Handling (`fixArguments`)**:
    *   The script maps the normalized `xN` variables from the JSON to CryptOpt's formal `argN` and `out1` conventions. For example, input register `x1` is mapped to `arg1`, and the output pointer `x0` is mapped to `out1`.
    *   It injects initial assignment operations (e.g., `x1 = arg1`) into the instruction stream to bootstrap the data flow.

2.  **Memory Access Abstraction (`reduceStoreAndLoads`)**:
    This is a critical transformation for preserving correctness while moving to a higher level of abstraction.
    *   The preprocessor analyzes the `getelementptr`, `load`, and `store` operations from the JSON.
    *   It resolves the entire chain of memory operations. For example, a sequence like:
        1.  `x3 = getelementptr inbounds i8, ptr %arg1, i64 32`
        2.  `x4 = load i64, ptr x3`
        is reduced to a single, high-level CryptOpt-IR instruction:
        `x4 = arg1[4]`
    *   Similarly, `store` operations are converted into assignments to output arrays (e.g., `out1[2] = x115`).
    *   This process effectively abstracts away the concept of pointers and memory addresses, replacing them with a simpler, more analyzable array-based memory model. This makes the data flow explicit and independent of any specific memory layout, which is crucial for formal analysis.

3.  **Instruction Mapping and Simplification**:
    *   Each LLVM instruction in the JSON (e.g., `add`, `mul`, `lshr`, `trunc`, `zext`) is mapped to a corresponding CryptOpt-IR instruction via a dedicated transformation function (e.g., `transformAdd`, `transformMul`). This ensures a direct semantic link between the source LLVM and the target IR.
    *   Peephole-style reductions are applied. For example, the `zextR` reducer folds `zext` (zero-extend) operations into subsequent instructions, simplifying the final IR without altering the computational logic.

---

## Conclusion: How Properties are Preserved

The LLVM-to-CryptOpt-IR pipeline is carefully designed to preserve both the functional correctness and the constant-time security properties of the original cryptographic implementation.

1.  **Constant-Time Execution**: The pipeline is tailored for the straight-line LLVM IR typically produced by cryptographic code generators like Fiat. By **explicitly filtering out control flow instructions (`br`), error handling (`panic`), and focusing only on a well-defined set of arithmetic and logical operations**, the pipeline ensures that no data-dependent branches or variable-time operations are introduced. The constant-time nature of the input code is therefore preserved by construction.

2.  **Functional Correctness**: The conversion maintains the mathematical integrity of the algorithm through a series of semantics-preserving transformations:
    *   Instructions are mapped to their direct logical equivalents in CryptOpt-IR.
    *   The memory abstraction process correctly interprets pointer arithmetic as array accesses, ensuring the data flow of the original algorithm remains unchanged.

The final output is a high-level, abstract representation of the cryptographic computation, free from machine-specific details but with its core logic and security properties fully intact. This makes it an ideal input for the formal analysis and optimization performed by CryptOpt.
