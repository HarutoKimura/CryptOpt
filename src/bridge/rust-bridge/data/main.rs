use std::ffi::c_ulonglong;

extern "C" {
    fn cryptopt(out1: *mut usize, out1_len: usize, in0: *const usize, in0_len: usize, in1: *const usize, in1_len: usize);
}

#[link(name = "bls12_mul")]
extern "C" {
    fn bls12_mul(out1: *mut c_ulonglong, arg1: *const c_ulonglong, arg2: *const c_ulonglong, arg3: *const c_ulonglong, arg4: *const c_ulonglong, arg5: *const c_ulonglong);
}

fn generate_edge_cases() -> Vec<[u64; 6]> {
    let mut cases = vec![
        [0; 6],                    // All zeros,         0x000000000000000
        [u64::MAX; 6],             // All of them are    0xFFFFFFFFFFFFFFFF
        [1; 6],                    // All ones in binary 0x1111111111111
        [u64::MAX - 1; 6],         // All ones except the last bit 0x1111111111110
        [0x8000_0000_0000_0000; 6], // Largest negative number (if interpreted as signed)
        [0x7FFF_FFFF_FFFF_FFFF; 6], // Largest positive number (if interpreted as signed)
    ];

    // Powers of 2
    for i in 0..64 {
        cases.push([1u64 << i; 6]);
    }

    // Values near powers of 2
    for i in 0..64 {
        cases.push([(1u64 << i) - 1; 6]);
        cases.push([(1u64 << i) + 1; 6]);
    }

    // Some random problematic values
    cases.push([0xDEAD_BEEF_DEAD_BEEF; 6]);
    cases.push([0x0123_4567_89AB_CDEF; 6]);
    cases.push([0xFFFF_FFFF_0000_0000; 6]);
    cases.push([0x0000_0000_FFFF_FFFF; 6]);

    cases
}

fn main() {
    let mut asm_out = [0usize; 6];
    let mut so_out = [0u64; 6];
    
    let edge_cases = generate_edge_cases();
    
    println!("Testing {} edge cases", edge_cases.len());

    for (i, case) in edge_cases.iter().enumerate() {
        let in0 = *case;
        let in1 = *case;  // Using the same values for both inputs

        // Run ASM implementation
        unsafe {
            cryptopt(
                asm_out.as_mut_ptr(),
                asm_out.len(),
                in0.as_ptr() as *const usize,
                in0.len(),
                in1.as_ptr() as *const usize,
                in1.len()
            );
        }
        
        // Run SO implementation
        unsafe {
            bls12_mul(
                so_out.as_mut_ptr(),
                in0.as_ptr() as *const c_ulonglong,
                in1.as_ptr() as *const c_ulonglong,
                in0.as_ptr() as *const c_ulonglong,
                in1.as_ptr() as *const c_ulonglong,
                in0.as_ptr() as *const c_ulonglong
            );
        }
        
        // Compare results
        if asm_out != so_out.map(|x| x as usize) {
            println!("Difference found for edge case {}:", i);
            println!("Input: {:?}", in0);
            println!("CryptOpt output: {:?}", asm_out);
            println!("SO output: {:?}", so_out);
            println!("--------------------");
        }
    }
    
    println!("Edge case testing complete.");
}



// mod bls12_mul;
// use bls12_mul::bls12_mul;
// use::std::time::Instant;


// // Running original Rust bls12_mul function.
// fn main() {
//     let mut out0 = [0usize; 6];
//     let mut in0 = [0x1111111111111111usize, 0x2222222222222222, 0x3333333333333333, 0x4444444444444444, 0x5555555555555555, 0x6666666666666666];
//     let mut in1 = [0x1111111111111111usize, 0x2222222222222222, 0x3333333333333333, 0x4444444444444444, 0x5555555555555555, 0x6666666666666666];
//     // Warm-up run
//     bls12_mul(&mut out0, &mut in0, &mut in1);

//     // Measure execution time
//     let iterations = 10000;

//     let start = Instant::now();
//     for _ in 0..iterations {
//         bls12_mul(&mut out0, &mut in0, &mut in1);

//     }
//     let duration = start.elapsed();

//     println!("The number of iterations: {:?}", iterations);
//     println!("Input arguments in0: {:?}", in0);
//     println!("Input arguments in1: {:?}", in1);
//     println!("Result of bls12_mul: {:?}", out0);
//     println!("Average execution time of bls12_mul: {:?}", duration / iterations);
// }
