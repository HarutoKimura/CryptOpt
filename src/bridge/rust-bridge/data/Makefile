CC?=gcc
LLC?=llc
CLANG?=clang
tmp=./pre-

#Specify the target file name
#Current inputs are field_wrapp.ll or demangled_field.ll
TARGET_NAME?=rust_fiat_curve25519_carry_mul
TEST_TARGET_NAME?=sext_transformer
LANGUAGE?=rust

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

# Choose compilation command based on language
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