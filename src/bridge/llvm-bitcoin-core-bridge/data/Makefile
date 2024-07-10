CC?=gcc
LLC?=llc
CLANG?=clang
tmp=./pre-

#Specify the target file name
#Current inputs are field_wrapp.ll or demangled_field.ll
TARGET_NAME=demangled_field

# Default target
all: $(TARGET_NAME).ll

%.json: %.ll
	@echo "Converting $< to $@"
	python3 llvm2json.py $< $@
# Generate LLVM IR from Rust source


# $(TARGET_NAME).ll: $(TARGET_NAME).rs
# 	rustc --crate-type=lib --emit=llvm-ir -C opt-level=1 ${<} -o ${@}
# 	rustc --crate-type=lib --emit=llvm-ir -C opt-level=1 -C symbol-mangling-version=v0 -o ${<} -o ${@}

# Generate object file from LLVM IR
$(TARGET_NAME).o: $(TARGET_NAME).ll
	cp ${<} ${<}.tmp
	$(LLC) -filetype=obj -opaque-pointers -o ${@} ${<}.tmp
	rm -f ${<}.tmp

# Compile shared object from object file
%.so: $(TARGET_NAME).o
	$(CC) $(CFLAGS) -fPIC -shared -o ${@} ${?}

# Clean up generated files
distclean:
	rm -f *.ll
	rm -f $(tmp)$(TARGET_NAME).json