nasm -f elf64 asm_from_json.asm -o asm_from_json.o
ar rcs libasm_from_json.a asm_from_json.o
rustc -C target-cpu=native main.rs -L. -lasm_from_json
./main