CC?=gcc
LLC?=llc
CLANG?=clang
tmp=./pre-

#Specify the target file name
#Current inputs are field_wrapp.ll or demangled_field.ll
TARGET_NAME?=bls12_mul

#Specify the demangled target file name
DEMANGLED_TARGET_NAME=demangled_$(TARGET_NAME)

# Default target
all: $(DEMANGLED_TARGET_NAME).json $(TARGET_NAME).rs

# %.json: %.ll
# 	@echo "Converting $< to $@"
# 	python3 llvm2json.py $< $@

# Original commnand to generate LLVM-IR From Rust source
# $(TARGET_NAME).ll: $(TARGET_NAME).rs
# rustc --crate-type=lib --emit=llvm-ir -C opt-level=1 ${<} -o ${@}

# Generate LLVM IR from Rust source
# $(TARGET_NAME).ll: $(TARGET_NAME).rs
# 	rustc --crate-type=lib --emit=llvm-ir -C opt-level=1 -C symbol-mangling-version=v0 ${<} -o ${@}

# # Demangle the LLVM-IR file
# $(DEMANGLED_TARGET_NAME).ll: $(TARGET_NAME).rs $(TARGET_NAME).ll
# 	python3 demangler.py $(TARGET_NAME).rs $(TARGET_NAME).ll $(DEMANGLED_TARGET_NAME).ll

# Gnerate JSON format from demangled LLVM-IR
$(DEMANGLED_TARGET_NAME).json: $(DEMANGLED_TARGET_NAME).ll
	@echo "Converting $< to $@"
	python3 llvm2json.py $< $@

# Generate object file from LLVM-IR
$(DEMANGLED_TARGET_NAME).o: $(DEMANGLED_TARGET_NAME).ll
	cp ${<} ${<}.tmp
	$(LLC) -filetype=obj -opaque-pointers -relocation-model=pic -o ${@} ${<}.tmp

# Compile shared object from object file
%.so: $(DEMANGLED_TARGET_NAME).o
	cp ${<} ${<}.tmp
	$(CC) -fPIC -shared -o ${@} ${?}.tmp
	rm -f $(DEMANGLED_TARGET_NAME).ll.tmp
	rm -f ${?}.tmp
	rm -f $(DEMANGLED_TARGET_NAME).o

# Clean up generated files
distclean:
	rm -f *.ll
	rm -f $(tmp)$(TARGET_NAME).json, $(DEMANGLED_TARGET_NAME).ll, $(DEMANGLED_TARGET_NAME).o