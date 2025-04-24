use std::time::Instant;
use crate::fiat_25519_carry_mul;
use crate::fiat_25519_loose_field_element;
use crate::fiat_25519_tight_field_element;

// use std::ffi::c_ulonglong; // For LLVM-IR's ASM

// // CryptOpt's ASM
// // #[link(name = "bls12_mul")]
// #[no_mangle]
// extern "C" {
//     fn bls12_mul(
//         out1: *mut usize, 
//         out1_len: usize, 
//         in0: *const usize, 
//         in0_len: usize, 
//         in1: *const usize, 
//         in1_len: usize);
// }

// fn main() {
//     let mut out0 = [0usize; 6]; // An array of six 64-bit unsigned integers, all initialized to 0
//     let in0 = [0x1111111111111111usize, 0x2222222222222222, 0x3333333333333333, 0x4444444444444444, 0x5555555555555555, 0x6666666666666666];     // An array of six 64-bit unsigned integers, all initialized to 1
//     let in1 = [0x1111111111111111usize, 0x2222222222222222, 0x3333333333333333, 0x4444444444444444, 0x5555555555555555, 0x6666666666666666];    // An array of six 64-bit unsigned integers, all initialized to 2
    
    
//     let iterations = 100000;

//     let mut times = Vec::with_capacity(iterations);

//     //CryptOpt's ASM
//     //let start_llvm_ir = Instant::now();
//     for _ in 0..iterations {
//         let start = Instant::now();
//         unsafe {
//             bls12_mul(
//                 out0.as_mut_ptr(),
//                 out0.len(),
//                 in0.as_ptr(),
//                 in0.len(),
//                 in1.as_ptr(),
//                 in1.len()
//             );
//         }
//         let duration = start.elapsed();
//         times.push(duration);
//     }
//     //let duration_cryptopt = start_llvm_ir.elapsed();

//     times.sort();

//     println!("time vector: {:?}", times);

//     // Calculate the median
//     let median_duration = if iterations % 2 == 0 {
//         (times[iterations / 2 - 1] + times[iterations / 2]) / 2
//     } else {
//         times[iterations / 2]
//     };

//     println!("The number of iterations: {:?}", iterations);
//     println!("Input arguments in0: {:?}", in0);
//     println!("Input arguments in1: {:?}", in1);
//     println!("Result of direct rustc ASM: {:?}", out0);
//     println!("Median execution time of direct rustc ASM: {:?}", median_duration);

// }



// fiat_curve25519_carry_mul
fn main() {
    let mut out0 = [0usize; 6]; // An array of six 64-bit unsigned integers, all initialized to 0
    let in0 = [0x1111111111111111usize, 0x2222222222222222, 0x3333333333333333, 0x4444444444444444, 0x5555555555555555, 0x6666666666666666];     // An array of six 64-bit unsigned integers, all initialized to 1
    let in1 = [0x1111111111111111usize, 0x2222222222222222, 0x3333333333333333, 0x4444444444444444, 0x5555555555555555, 0x6666666666666666];    // An array of six 64-bit unsigned integers, all initialized to 2
    
    
    let iterations = 100000;

    let mut times = Vec::with_capacity(iterations);

    //CryptOpt's ASM
    //let start_llvm_ir = Instant::now();
    for _ in 0..iterations {
        let start = Instant::now();
        curve25519_64_mul::fiat_25519_carry_mul(
            &mut out0,
            &curve25519_64_mul::fiat_25519_loose_field_element(in0),
            &curve25519_64_mul::fiat_25519_loose_field_element(in1),
        );
        let duration = start.elapsed();
        times.push(duration);
    }
    //let duration_cryptopt = start_llvm_ir.elapsed();

    times.sort();

    println!("time vector: {:?}", times);

    // Calculate the median
    let median_duration = if iterations % 2 == 0 {
        (times[iterations / 2 - 1] + times[iterations / 2]) / 2
    } else {
        times[iterations / 2]
    };

    println!("The number of iterations: {:?}", iterations);
    println!("Input arguments in0: {:?}", in0);
    println!("Input arguments in1: {:?}", in1);
    println!("Result of direct fiat_curve25519 source code: {:?}", out0);
    println!("Median execution time of fiat)curve25519 source code: {:?}", median_duration);

}