llc -filetype=obj -opaque-pointers -relocation-model=pic -o sext_transformer.o sext_transformer.ll
gcc -fPIC -shared -o sext_transformer.so sext_transformer.o
objdump -d sext_transformer.so > sext_transformer_so.txt