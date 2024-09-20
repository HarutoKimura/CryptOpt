mv bls12_mul.so libbls12_mul.so # change the shared object file name to libbls12_mul.so
rustc -L. -l bls12_mul main.rs
LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH ./main > output.txt
