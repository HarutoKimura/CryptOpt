use std::time::Instant;

// shared_object's ASM
#[link(name = "bls12_mul")]
extern "C" {
    fn bls12_mul(
        out1: *mut usize, 
        out1_len: usize, 
        in0: *const usize, 
        in0_len: usize, 
        in1: *const usize, 
        in1_len: usize);
}

fn main() {
    let mut out0 = [0usize; 6]; // An array of six 64-bit unsigned integers, all initialized to 0
    let in0 = [0x1111111111111111usize, 0x2222222222222222, 0x3333333333333333, 0x4444444444444444, 0x5555555555555555, 0x6666666666666666];     // An array of six 64-bit unsigned integers, all initialized to 1
    let in1 = [0x1111111111111111usize, 0x2222222222222222, 0x3333333333333333, 0x4444444444444444, 0x5555555555555555, 0x6666666666666666];    // An array of six 64-bit unsigned integers, all initialized to 2
    
    // Measure execution time
    let iterations = 10000;

    //CryptOpt's ASM
    let start_llvm_ir = Instant::now();
    for _ in 0..iterations {
        unsafe {
            bls12_mul(
                out0.as_mut_ptr(),
                out0.len(),
                in0.as_ptr(),
                in0.len(),
                in1.as_ptr(),
                in1.len()
            );
        }
    }
    let duration_cryptopt = start_llvm_ir.elapsed();

    println!("The number of iterations: {:?}", iterations);
    println!("Input arguments in0: {:?}", in0);
    println!("Input arguments in1: {:?}", in1);
    println!("Result of demangled shared_object:");
    println!("{:?}", out0);
    println!("Average execution time of demangled_shared_object ASM: {:?}", duration_cryptopt / iterations);

}