CC?=gcc
LLC?=llc
CLANG?=clang
tmp=./pre-

# Default target
all: field_wrapp.ll

%.json: %.ll
	@echo "Converting $< to $@"
	python3 llvm2json.py $< $@
# Generate LLVM IR from Rust source

field_wrapp.ll: field_wrapp.rs
	rustc --crate-type=lib --emit=llvm-ir -C opt-level=1 ${<} -o ${@}

# Generate object file from LLVM IR (remove specific metadata)
field_wrapp.o: field_wrapp.ll
	cp ${<} ${<}.tmp
	$(LLC) -filetype=obj -opaque-pointers -o ${@} ${<}.tmp
	rm -f ${<}.tmp

# Compile shared object from object file
%.so: field_wrapp.o
	$(CC) $(CFLAGS) -fPIC -shared -o ${@} ${?}

# Clean up generated files
distclean:
	rm -f *.ll
	rm -f $(tmp)field_wrapp.json