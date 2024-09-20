nasm -f elf64 bls12_mul_CryptOpt.asm -o bls12_mul_CryptOpt.o
ar rcs libbls12_mul_CryptOpt.a bls12_mul_CryptOpt.o
rustc -C target-cpu=native main.rs -L. -lbls12_mul_CryptOpt
./main > ouptut.txt