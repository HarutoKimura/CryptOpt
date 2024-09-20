mod bls12_mul;
use bls12_mul::bls12_mul;
use::std::time::Instant;


// Running original Rust bls12_mul function.
fn main() {
    let mut out0 = [0usize; 6];
    let mut in0 = [0x1111111111111111usize, 0x2222222222222222, 0x3333333333333333, 0x4444444444444444, 0x5555555555555555, 0x6666666666666666];
    let mut in1 = [0x1111111111111111usize, 0x2222222222222222, 0x3333333333333333, 0x4444444444444444, 0x5555555555555555, 0x6666666666666666];
    // Warm-up run
    bls12_mul(&mut out0, &mut in0, &mut in1);

    // Measure execution time
    let iterations = 10000;

    let start = Instant::now();
    for _ in 0..iterations {
        bls12_mul(&mut out0, &mut in0, &mut in1);

    }
    let duration = start.elapsed();

    println!("The number of iterations: {:?}", iterations);
    println!("Input arguments in0: {:?}", in0);
    println!("Input arguments in1: {:?}", in1);
    println!("Result of bls12_mul: {:?}", out0);
    println!("Average execution time of bls12_mul: {:?}", duration / iterations);
}
