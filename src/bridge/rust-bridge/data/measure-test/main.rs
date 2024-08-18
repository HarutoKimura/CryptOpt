use std::time::Instant;

extern "C" {
    fn bls12_mul_CryptOpt(out1: *mut u64, arg1: *const u64, arg2: *const u64, arg3: *const u64, arg4: *const u64, arg5: *const u64);
}

fn main() {
    let mut out1 = [0u64; 6]; // An array of six 64-bit unsigned integers, all initialized to 0
    let arg1 = [1u64; 6];     // An array of six 64-bit unsigned integers, all initialized to 1
    let arg2 = [2u64; 6];     // An array of six 64-bit unsigned integers, all initialized to 2
    let arg3 = [3u64; 6];     // An array of six 64-bit unsigned integers, all initialized to 3
    let arg4 = [4u64; 6];     // An array of six 64-bit unsigned integers, all initialized to 4
    let arg5 = [5u64; 6];     // An array of six 64-bit unsigned integers, all initialized to 5
    // Warm-up run
    unsafe {
        bls12_mul_CryptOpt(out1.as_mut_ptr(), arg1.as_ptr(), arg2.as_ptr(), arg3.as_ptr(), arg4.as_ptr(), arg5.as_ptr());
    }

    // Measure execution time
    let iterations = 10;
    let start = Instant::now();
    for _ in 0..iterations {
        unsafe {
            bls12_mul_CryptOpt(out1.as_mut_ptr(), arg1.as_ptr(), arg2.as_ptr(), arg3.as_ptr(), arg4.as_ptr(), arg5.as_ptr());
        }
    }
    let duration = start.elapsed();

    println!("Result of CryptOpt ASM: {:?}", out1);
    println!("Average execution time: {:?}", duration / iterations);
}