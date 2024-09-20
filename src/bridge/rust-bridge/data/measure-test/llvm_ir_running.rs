use std::time::Instant;
use std::ffi::c_ulonglong; // For LLVM-IR's ASM

// // CryptOpt's ASM
// extern "C" {
//     fn bls12_mul_CryptOpt(out1: *mut u64, arg1: *const u64, arg2: *const u64, arg3: *const u64, arg4: *const u64, arg5: *const u64);
// }

// LLVM-IR's ASM
#[link(name = "bls12_mul")]
extern "C" {
    fn bls12_mul(out1: *mut c_ulonglong, arg1: *const c_ulonglong, arg2: *const c_ulonglong, arg3: *const c_ulonglong, arg4: *const c_ulonglong, arg5: *const c_ulonglong);
}


fn main() {
    let mut out1 = [0u64; 6]; // An array of six 64-bit unsigned integers, all initialized to 0
    let arg1 = [0x1111111111111111, 0x2222222222222222, 0x3333333333333333, 0x4444444444444444, 0x5555555555555555, 0x6666666666666666];     // An array of six 64-bit unsigned integers, all initialized to 1
    let arg2 = [0x1111111111111111, 0x2222222222222222, 0x3333333333333333, 0x4444444444444444, 0x5555555555555555, 0x6666666666666666];    // An array of six 64-bit unsigned integers, all initialized to 2
    let arg3 = [0x1111111111111111, 0x2222222222222222, 0x3333333333333333, 0x4444444444444444, 0x5555555555555555, 0x6666666666666666];    // An array of six 64-bit unsigned integers, all initialized to 3
    let arg4 = [0x1111111111111111, 0x2222222222222222, 0x3333333333333333, 0x4444444444444444, 0x5555555555555555, 0x6666666666666666];    // An array of six 64-bit unsigned integers, all initialized to 4
    let arg5 = [0x1111111111111111, 0x2222222222222222, 0x3333333333333333, 0x4444444444444444, 0x5555555555555555, 0x6666666666666666];     // An array of six 64-bit unsigned integers, all initialized to 5

    // let arg1 = [1u64; 6];     // An array of six 64-bit unsigned integers, all initialized to 1
    // let arg2 = [2u64; 6];     // An array of six 64-bit unsigned integers, all initialized to 2
    // let arg3 = [3u64; 6];     // An array of six 64-bit unsigned integers, all initialized to 3
    // let arg4 = [4u64; 6];     // An array of six 64-bit unsigned integers, all initialized to 4
    // let arg5 = [5u64; 6];     // An array of six 64-bit unsigned integers, all initialized to 5

    // Warm-up run

    // //CryptOpt's ASM
    // unsafe {
    //     bls12_mul_CryptOpt(out1.as_mut_ptr(), arg1.as_ptr(), arg2.as_ptr(), arg3.as_ptr(), arg4.as_ptr(), arg5.as_ptr());
    // }

    // LLVM-IR's ASM
    unsafe {
        bls12_mul(out1.as_mut_ptr(), arg1.as_ptr(), arg2.as_ptr(), arg3.as_ptr(), arg4.as_ptr(), arg5.as_ptr());
    }

    // Measure execution time
    let iterations = 10000;

    // //CryptOpt's ASM
    // let start_cryptopt = Instant::now();
    // for _ in 0..iterations {
    //     unsafe {
    //         bls12_mul_CryptOpt(out1.as_mut_ptr(), arg1.as_ptr(), arg2.as_ptr(), arg3.as_ptr(), arg4.as_ptr(), arg5.as_ptr());
    //     }
    // }
    // let duration_cryptopt = start_cryptopt.elapsed();

    // println!("The number of iterations: {:?}", iterations);
    // println!("Result of CryptOpt ASM: {:?}", out1);
    // println!("Average execution time of CryptOpt's ASM: {:?}", duration_cryptopt / iterations);

    // LLVM-IR's ASM
    let start_llvm_ir = Instant::now();
    for _ in 0..iterations {
        unsafe {
            bls12_mul(out1.as_mut_ptr(), arg1.as_ptr(), arg2.as_ptr(), arg3.as_ptr(), arg4.as_ptr(), arg5.as_ptr());
        }
    }
    let duration_llvm_ir = start_llvm_ir.elapsed();

    println!("The number of iterations: {:?}", iterations);
    println!("Input arguments arg1: {:?}", arg1);
    println!("Input arguments arg2: {:?}", arg2);
    println!("Input arguments arg3: {:?}", arg3);
    println!("Input arguments arg4: {:?}", arg4);
    println!("Input arguments arg5: {:?}", arg5);
    println!("Result of LLVM-IR' ASM: {:?}", out1);
    println!("Average execution time of LLVM-IR' ASM: {:?}", duration_llvm_ir / iterations);
}