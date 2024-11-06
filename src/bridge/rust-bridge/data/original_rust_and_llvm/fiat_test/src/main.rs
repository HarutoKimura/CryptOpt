use std::time::Instant;
use fiat_test::fiat_25519_carry_mul;
use fiat_test::fiat_25519_loose_field_element;
use fiat_test::fiat_25519_tight_field_element;

// fiat_curve25519_carry_mul
fn main() {
    /** The type fiat_25519_tight_field_element is a field element with tight bounds. */
    /** Bounds: [[0x0 ~> 0x8000000000000], [0x0 ~> 0x8000000000000], [0x0 ~> 0x8000000000000], [0x0 ~> 0x8000000000000], [0x0 ~> 0x8000000000000]] */
    let mut out0 = fiat_25519_tight_field_element([0u64; 5]); // An array of six 64-bit unsigned integers, all initialized to 0
    // let in0 = [0x8000000000000u64, 0x8000000000000u64, 0x8000000000000u64, 0x8000000000000u64, 0x8000000000000u64];   
    // let in1 = [0x8000000000000u64, 0x8000000000000u64, 0x8000000000000u64, 0x8000000000000u64, 0x8000000000000u64]; 

    let in0 = [0x5000000000000u64, 0x5000000000000u64, 0x5000000000000u64, 0x5000000000000u64, 0x5000000000000u64];   
    let in1 = [0x5000000000000u64, 0x5000000000000u64, 0x5000000000000u64, 0x5000000000000u64, 0x5000000000000u64]; 
    
    
    let iterations = 100000;

    let mut times = Vec::with_capacity(iterations);

    //CryptOpt's ASM
    //let start_llvm_ir = Instant::now();
    for _ in 0..iterations {
        let start = Instant::now();
        fiat_25519_carry_mul(
            &mut out0,
            &fiat_25519_loose_field_element(in0),
            &fiat_25519_loose_field_element(in1),
        );
        let duration = start.elapsed();
        times.push(duration);
    }
    //let duration_cryptopt = start_llvm_ir.elapsed();

    times.sort();

    // println!("time vector: {:?}", times);

    // Calculate the median
    let median_duration = if iterations % 2 == 0 {
        (times[iterations / 2 - 1] + times[iterations / 2]) / 2
    } else {
        times[iterations / 2]
    };

    println!("The number of iterations: {:?}", iterations);
    println!("Input arguments in0: {:?}", in0);
    println!("Input arguments in1: {:?}", in1);
    println!("Result of direct fiat_curve25519 source code:");
    println!("{:?}", out0.0);
    println!("Median execution time of fiat)curve25519 source code: {:?}", median_duration);

}