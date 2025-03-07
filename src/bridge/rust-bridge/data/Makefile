CC?=gcc
LLC?=llc
CLANG?=clang
tmp=./pre-

#Specify the target file name
#Current inputs are field_wrapp.ll or demangled_field.ll
TARGET_NAME?=rust_fiat_curve25519_carry_mul
TEST_TARGET_NAME?=sext_transformer

#Specify the demangled target file name
DEMANGLED_TARGET_NAME=demangled_$(TARGET_NAME)

CLEAN_TARGET_NAME = clean_$(TARGET_NAME)
HALF_CLEAN_TARGET_NAME = half_clean_$(TARGET_NAME)

WRONG_BUT_WORKING_TARGET_NAME = wrong_but_working/wrong_but_working_$(TARGET_NAME)

# Default target
# all: $(DEMANGLED_TARGET_NAME).json original_rust_and_llvm/$(TARGET_NAME).rs
all: lib.rs

# %.json: %.ll
# 	@echo "Converting $< to $@"
# 	python3 llvm2json.py $< $@

# Original commnand to generate LLVM-IR From Rust source, previously I use opt-level=1, but now I change to opt-level=3
# $(TARGET_NAME).ll: $(TARGET_NAME).rs
# rustc --crate-type=lib --emit=llvm-ir -C opt-level=3 ${<} -o ${@} // This is the original command

# but then since when I generate .so and .asm file, I use --crate-type=cdylib, I need to change the command to:
# the output is totally the same.
# rustc --crate-type=cdylib --emit=llvm-ir -C opt-level=1 ${<} -o ${@}

# Generate LLVM IR from Rust source
# $(TARGET_NAME).ll: $(TARGET_NAME).rs
# 	rustc --crate-type=lib --emit=llvm-ir -C opt-level=1 -C symbol-mangling-version=v0 ${<} -o ${@}

# # Demangle the LLVM-IR file
# $(DEMANGLED_TARGET_NAME).ll: $(TARGET_NAME).rs $(TARGET_NAME).ll
# 	python3 demangler.py $(TARGET_NAME).rs $(TARGET_NAME).ll $(DEMANGLED_TARGET_NAME).ll

# Gnerate JSON format from demangled LLVM-IR
# $(DEMANGLED_TARGET_NAME).json: $(DEMANGLED_TARGET_NAME).ll
# 	@echo "Converting $< to $@"
# 	python3 llvm2json.py $< $@



# # This part is using the wrong but working version of teh JSON and shared obect file from the LLVM-IR'
# # Generate object file from LLVM-IR
# $(WRONG_BUT_WORKING_TARGET_NAME).o: $(WRONG_BUT_WORKING_TARGET_NAME).ll
# 	cp ${<} ${<}.tmp
# 	$(LLC) -filetype=obj -opaque-pointers -relocation-model=pic -o ${@} ${<}.tmp

# # Compile shared object from object file
# %.so: $(WRONG_BUT_WORKING_TARGET_NAME).o
# 	cp ${<} ${<}.tmp
# 	$(CC) -fPIC -shared -o ${@} ${?}.tmp
# 	rm -f $(WRONG_BUT_WORKING_TARGET_NAME).ll.tmp
# 	rm -f ${?}.tmp
# 	rm -f $(WRONG_BUT_WORKING_TARGET_NAME).o

# # Clean up generated files
# distclean:
# 	rm -f *.ll
# 	rm -f $(tmp)$(TARGET_NAME).json, $(WRONG_BUT_WORKING_TARGET_NAME).ll, $(WRONG_BUT_WORKING_TARGET_NAME).o



# # Testing to run with the correct JSON and shared object file from the LLVM-IR"
# # Generate object file from LLVM-IR
# $(CLEAN_TARGET_NAME).o: $(CLEAN_TARGET_NAME).ll
# 	cp ${<} ${<}.tmp
# 	$(LLC) -filetype=obj -opaque-pointers -relocation-model=pic -o ${@} ${<}.tmp

# # Compile shared object from object file
# %.so: $(CLEAN_TARGET_NAME).o
# 	cp ${<} ${<}.tmp
# 	$(CC) -fPIC -shared -o ${@} ${?}.tmp
# 	rm -f $(CLEAN_TARGET_NAME).ll.tmp
# 	rm -f ${?}.tmpg
# 	rm -f $(CLEAN_TARGET_NAME).o

# # Clean up generated files
# distclean:
# 	rm -f *.ll
# 	rm -f $(tmp)$(TARGET_NAME).json, $(CLEAN_TARGET_NAME).ll, $(CLEAN_TARGET_NAME).o


# # Testing to run with the correct JSON and shared object file from the LLVM-IR"
# # Generate object file from LLVM-IR
# $(TEST_TARGET_NAME).o: $(TEST_TARGET_NAME).ll
# 	cp ${<} ${<}.tmp
# 	$(LLC) -filetype=obj -opaque-pointers -relocation-model=pic -o ${@} ${<}.tmp

# # Compile shared object from object file
# %.so: $(TEST_TARGET_NAME).o
# 	cp ${<} ${<}.tmp
# 	$(CC) -fPIC -shared -o ${@} ${?}.tmp
# 	rm -f $(TEST_TARGET_NAME).ll.tmp
# 	rm -f ${?}.tmpg
# 	rm -f $(TEST_TARGET_NAME).o

# # Clean up generated files
# distclean:
# 	rm -f *.ll
# 	rm -f $(tmp)$(TARGET_NAME).json, $(TEST_TARGET_NAME).ll, $(TEST_TARGET_NAME).o




##### New version I can firecly shared object file from Rust file.

# # Compile shared object from object file
# %.so:  original_rust_and_llvm/lib.rs
# 	cp ${<} ${<}.tmp
# 	rustc --crate-type=cdylib ${@} ${?}.tmp
# 	rm -f ${?}.tmp


# # Compile shared object from object file
# %.so: $(TARGET_NAME).rs
# 	rustc -v --crate-type=cdylib -o ${@} ${<} 


# # Compile LLVM-IR from Rust file with opt-level=1
# %.ll: $(TARGET_NAME).rs
# 	rustc -C opt-level=1 --crate-type=cdylib --emit=llvm-ir -o ${@} ${<}

# # Compile object file from LLVM-IR with opt-level=1 for bls12 case
# %.ll: $(TARGET_NAME).rs
# 	rustc -C opt-level=1 --crate-type=cdylib --emit=llvm-ir symbol-mangling-version=v0 -o ${@} ${<}

# Compile shared object from object file with opt-level=1
# but now I change the opt-level to 3 to get the best performance
# %.so: $(TARGET_NAME).rs
# 	rustc -C opt-level=1 --crate-type=cdylib -o ${@} ${<} 

# %.so: $(TARGET_NAME).rs
# 	rustc --crate-type=cdylib -o ${@} ${<} 

## original version for Rust
# %.so: $(TARGET_NAME).rs
# 	rustc -C opt-level=3 --crate-type=cdylib -o ${@} ${<} 

## test version for C
%.so: $(TARGET_NAME).c
	$(CC) -fPIC -shared -O3 -o ${@} ${<}

# # Seocnd new version 
# # Compile .asm file from Rust file with opt-level=1
# %.asm: $(TARGET_NAME).rs
# 	rustc -C opt-level=1 --crate-type=cdylib -C llvm-args=-x86-asm-syntax=intel --emit=asm -o ${@} ${<}

# ## Newest Version
# # Compile .asm file from Rust file with opt-level=1 and also x86-asm-syntax=intel and supported operation syntux by AssemblyLine
# # Then python script to clean up the .asm file
# %.asm: $(TARGET_NAME).rs
# 	rustc -C opt-level=1 \
#       --crate-type=cdylib \
#       -C target-feature=+bmi2 \
#       -C llvm-args="-x86-asm-syntax=intel" \
#       --emit=asm \
# 	  -o ${@} ${<}
# 	python3 asm-cleaner.py ${@} ${@}


# Clean up generated files
distclean:
	rm -f *.ll
	rm -f $(tmp)$(TARGET_NAME).json, $(CLEAN_TARGET_NAME).ll, $(CLEAN_TARGET_NAME).o