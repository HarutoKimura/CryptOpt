llc -relocation-model=pic -filetype=obj transformer-test.ll -o transformer-test.o
gcc -fPIE -pie transformer-test.o -o transformer-test
./transformer-test