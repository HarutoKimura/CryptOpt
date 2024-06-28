CC?=gcc
LLC?=llc
CLANG?=clang
tmp=./pre-

# Default target
all: func.ll

%.json: %.ll
	@echo "Converting $< to $@"
	python3 llvm2json.py $< $@
# Generate LLVM IR from Rust source

func.ll: func.rs
	rustc --crate-type=lib --emit=llvm-ir -C opt-level=0 ${<} -o ${@}

# Generate object file from LLVM IR (remove specific metadata)
func.o: func.ll
	sed '/^!llvm\\.module\\.flags.*$$/d; /^!llvm\\.ident.*$$/d; /^!.*$$/d' ${<} > ${<}.tmp
	$(LLC) -filetype=obj -o ${@} ${<}.tmp
	rm -f ${<}.tmp

# Compile shared object from object file
%.so: func.o
	$(CC) $(CFLAGS) -fPIC -shared -o ${@} ${?}

# Clean up generated files
distclean:
	rm -f *.ll
	rm -f $(tmp)func.json func.json