CC?=gcc
LLC?=llc
CLANG?=clang
RUSTC?=rustc
PYTHON?=python3
tmp=./pre-

#Specify the target file name
#Current inputs are field_wrapp.ll or demangled_field.ll
TARGET_NAME?=rust_fiat_curve25519_carry_mul
TEST_TARGET_NAME?=sext_transformer
LANGUAGE?=rust

# Variables passed from RustBridge
CURVE?=
METHOD?=
JSON?=

#Specify the demangled target file name
DEMANGLED_TARGET_NAME=demangled_$(TARGET_NAME)

CLEAN_TARGET_NAME = clean_$(TARGET_NAME)
HALF_CLEAN_TARGET_NAME = half_clean_$(TARGET_NAME)

WRONG_BUT_WORKING_TARGET_NAME = wrong_but_working/wrong_but_working_$(TARGET_NAME)

# Default target - prepare environment based on language
ifeq ($(LANGUAGE),rust)
all: check_rust_env
	@echo "Using Rust environment"
else ifeq ($(LANGUAGE),c)
all: check_c_env
	@echo "Using C environment"
else
all:
	$(error Invalid language: $(LANGUAGE). Choose either 'rust' or 'c')
endif

# Check rust environment
check_rust_env:
	@command -v rustc >/dev/null 2>&1 || { echo >&2 "Rust compiler not found. Please install Rust."; exit 1; }
	@echo "Rust environment verified"

# Check C environment
check_c_env:
	@command -v $(CC) >/dev/null 2>&1 || { echo >&2 "C compiler not found. Please install GCC."; exit 1; }
	@echo "C environment verified"

# Extract base name from JSON filename (remove .json extension)
BASE_NAME = $(basename $(JSON))

# Pattern rules for generating JSON from source files
%.json: %.rs
	@echo "Generating JSON from Rust source: $< -> $@"
	@echo "Step 1: Compiling Rust to LLVM IR"
	$(RUSTC) --crate-type=lib --emit=llvm-ir -C opt-level=3 -C symbol-mangling-version=v0 $< -o $*.ll
	@echo "Step 2: Converting LLVM IR to JSON"
	$(PYTHON) llvm2json3.py $*.ll $@
	@echo "Successfully generated $@"

%.json: %.c
	@echo "Generating JSON from C source: $< -> $@"
	@echo "Step 1: Compiling C to LLVM IR"
	$(CLANG) -S -emit-llvm -O1 -o $*.ll $<
	@echo "Step 2: Converting LLVM IR to JSON"
	$(PYTHON) llvm2json3.py $*.ll $@
	@echo "Successfully generated $@"

# Some JSON files have "_updated" suffix, but source files don't
# This rule handles the mapping
%_updated.json: %.rs
	@echo "Generating updated JSON from Rust source: $< -> $@"
	@echo "Step 1: Compiling Rust to LLVM IR"
	$(RUSTC) --crate-type=lib --emit=llvm-ir -C opt-level=3 -C symbol-mangling-version=v0 $< -o $*.ll
	@echo "Step 2: Converting LLVM IR to JSON"
	$(PYTHON) llvm2json3.py $*.ll $@
	@echo "Successfully generated $@"

%_updated.json: %.c
	@echo "Generating updated JSON from C source: $< -> $@"
	@echo "Step 1: Compiling C to LLVM IR"
	$(CLANG) -S -emit-llvm -O1 -o $*.ll $<
	@echo "Step 2: Converting LLVM IR to JSON"
	$(PYTHON) llvm2json3.py $*.ll $@
	@echo "Successfully generated $@"

# Some C files have "_ssa" suffix in JSON but not in source
%_ssa.json: %.c
	@echo "Generating SSA JSON from C source: $< -> $@"
	@echo "Step 1: Compiling C to LLVM IR"
	$(CLANG) -S -emit-llvm -O1 -o $*_ssa.ll $<
	@echo "Step 2: Converting LLVM IR to JSON"
	$(PYTHON) llvm2json3.py $*_ssa.ll $@
	@echo "Successfully generated $@"

# Rule to generate specific JSON file when requested by RustBridge
$(JSON):
	@echo "Generating $(JSON) for curve=$(CURVE) method=$(METHOD) language=$(LANGUAGE)"
	@# Try to find the source file
	@if [ -f "$(BASE_NAME).$(LANGUAGE)" ]; then \
		echo "Found source file: $(BASE_NAME).$(LANGUAGE)"; \
		$(MAKE) -f Makefile $(JSON); \
	elif [ -f "$(patsubst %_updated,%,$(BASE_NAME)).$(LANGUAGE)" ]; then \
		echo "Found source file: $(patsubst %_updated,%,$(BASE_NAME)).$(LANGUAGE)"; \
		$(MAKE) -f Makefile $(JSON); \
	elif [ -f "$(patsubst %_ssa,%,$(BASE_NAME)).$(LANGUAGE)" ]; then \
		echo "Found source file: $(patsubst %_ssa,%,$(BASE_NAME)).$(LANGUAGE)"; \
		$(MAKE) -f Makefile $(JSON); \
	else \
		echo "Error: Could not find source file for $(JSON)"; \
		echo "Looked for: $(BASE_NAME).$(LANGUAGE), $(patsubst %_updated,%,$(BASE_NAME)).$(LANGUAGE), $(patsubst %_ssa,%,$(BASE_NAME)).$(LANGUAGE)"; \
		exit 1; \
	fi

# Choose compilation command based on language for .so files
ifeq ($(LANGUAGE),rust)
%.so:
	@echo "Building $(TARGET_NAME).rs to $@"
	@if [ ! -f $(TARGET_NAME).rs ]; then \
		echo "Source file $(TARGET_NAME).rs not found"; \
		exit 1; \
	fi
	# Special options for certain files
	@if echo "$(TARGET_NAME)" | grep -q "curve25519_dalek"; then \
		echo "Using special compilation for curve25519_dalek"; \
		rustc -C opt-level=3 --crate-type=cdylib --edition=2018 -o ${@} $(TARGET_NAME).rs; \
	elif echo "$(TARGET_NAME)" | grep -q "rust_ec_secp256k1"; then \
		echo "Using special compilation for rust_ec_secp256k1"; \
		rustc -C opt-level=3 --crate-type=cdylib --edition=2018 -o ${@} $(TARGET_NAME).rs; \
	else \
		rustc -C opt-level=3 --crate-type=cdylib -o ${@} $(TARGET_NAME).rs; \
	fi
else ifeq ($(LANGUAGE),c)
%.so:
	@echo "Building $(TARGET_NAME).c to $@"
	@if [ ! -f $(TARGET_NAME).c ]; then \
		echo "Source file $(TARGET_NAME).c not found"; \
		exit 1; \
	fi
	# Special options for certain files
	@if echo "$(TARGET_NAME)" | grep -q "curve25519_dalek"; then \
		echo "Using special compilation for curve25519_dalek"; \
		$(CC) -fPIC -shared -O3 -march=native -o ${@} $(TARGET_NAME).c; \
	elif echo "$(TARGET_NAME)" | grep -q "ec_secp256k1"; then \
		echo "Using special compilation for ec_secp256k1"; \
		$(CC) -fPIC -shared -O3 -march=native -o ${@} $(TARGET_NAME).c; \
	else \
		$(CC) -fPIC -shared -O3 -o ${@} $(TARGET_NAME).c; \
	fi
else
$(error Invalid language: $(LANGUAGE). Choose either 'rust' or 'c')
endif

# Clean up generated files
distclean:
	rm -f *.ll
	rm -f $(tmp)$(TARGET_NAME).json, $(CLEAN_TARGET_NAME).ll, $(CLEAN_TARGET_NAME).o

clean:
	rm -f *.json *.ll *.so *.o

.PHONY: all check_rust_env check_c_env distclean clean
