use std::time::Instant;
// use std::ffi::c_ulonglong; // For LLVM-IR's ASM

// CryptOpt's ASM
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

// // LLVM-IR's ASM
// #[link(name = "bls12_mul")]
// extern "C" {
//     fn bls12_mul(out1: *mut c_ulonglong, arg1: *const c_ulonglong, arg2: *const c_ulonglong, arg3: *const c_ulonglong, arg4: *const c_ulonglong, arg5: *const c_ulonglong);
// }


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
    println!("Result of no_replacing shared object's ASM: {:?}", out0);
    println!("Average execution time of no_replacing shared object's ASM: {:?}", duration_cryptopt / iterations);

    // // LLVM-IR's ASM
    // let start_llvm_ir = Instant::now();
    // for _ in 0..iterations {
    //     unsafe {
    //         bls12_mul(out1.as_mut_ptr(), arg1.as_ptr(), arg2.as_ptr(), arg3.as_ptr(), arg4.as_ptr(), arg5.as_ptr());
    //     }
    // }
    // let duration_llvm_ir = start_llvm_ir.elapsed();

    // println!("The number of iterations: {:?}", iterations);
    // println!("Input arguments arg1: {:?}", arg1);
    // println!("Input arguments arg2: {:?}", arg2);
    // println!("Input arguments arg3: {:?}", arg3);
    // println!("Input arguments arg4: {:?}", arg4);
    // println!("Input arguments arg5: {:?}", arg5);
    // println!("Result of LLVM-IR' ASM: {:?}", out1);
    // println!("Average execution time of LLVM-IR' ASM: {:?}", duration_llvm_ir / iterations);
}