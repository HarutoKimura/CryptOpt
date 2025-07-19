
# Makefile for CryptOpt Constant-Time Verification

LLVM_FILE ?= rust_fiat_curve25519_carry_mul.ll
JSON_FILE ?= rust_fiat_curve25519_carry_mul.json
ASM_FILE ?= seed0001735954728832_ratio12068.asm

# Tool paths (update as needed)
CT_VERIF ?= ct-verif
SMACK ?= smack
DUDECT_PATH ?= ./dudect

.PHONY: all verify-basic verify-comprehensive verify-formal timing-test clean

all: verify-comprehensive

# Basic pattern-based verification
verify-basic:
	@echo "Running basic constant-time verification..."
	python3 comprehensive_ct_validator.py $(LLVM_FILE) $(JSON_FILE) $(ASM_FILE) --level basic

# Comprehensive verification with taint analysis
verify-comprehensive:
	@echo "Running comprehensive constant-time verification..."
	python3 comprehensive_ct_validator.py $(LLVM_FILE) $(JSON_FILE) $(ASM_FILE) --level comprehensive

# Formal verification attempt
verify-formal:
	@echo "Attempting formal verification..."
	python3 formal_ct_verifier.py $(LLVM_FILE)
	@if [ -f $(LLVM_FILE:.ll=.bpl) ]; then \
		echo "Generated SMACK IR: $(LLVM_FILE:.ll=.bpl)"; \
		echo "To verify: $(CT_VERIF) verify $(LLVM_FILE:.ll=.bpl)"; \
	fi

# Timing analysis
timing-test:
	@echo "Setting up timing analysis..."
	python3 dudect_integration.py $(ASM_FILE) --simple
	@echo "For full dudect integration, run without --simple flag"

# Clean generated files
clean:
	rm -f *.bpl *.cl dudect_harness_*.c simplified_timing_test.py
	rm -rf __pycache__

# Help
help:
	@echo "CryptOpt Constant-Time Verification"
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@echo "  verify-basic         - Basic pattern matching validation"
	@echo "  verify-comprehensive - Full validation with taint analysis"
	@echo "  verify-formal        - Generate formal verification specs"
	@echo "  timing-test          - Setup timing side-channel tests"
	@echo "  clean                - Remove generated files"
	@echo ""
	@echo "Examples:"
	@echo "  make verify-basic LLVM_FILE=my_function.ll"
	@echo "  make timing-test ASM_FILE=my_output.asm"
