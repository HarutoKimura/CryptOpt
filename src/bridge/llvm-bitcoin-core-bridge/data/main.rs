mod field_mul;
use field_mul::{secp256k1_fe_mul_inner};

mod field_sqr;
use field_sqr::{secp256k1_fe_sqr_inner};

// to test the result
fn main() {
    let mut r = [0u64; 5];
    let a = [0x1111111111111111, 0x2222222222222222, 0x3333333333333333, 0x4444444444444444, 0x5555555555555555];
    let b = [0x6666666666666666, 0x7777777777777777, 0x8888888888888888, 0x9999999999999999, 0xAAAAAAAAAAAAAAAA];

    // let a = [0, 0, 0, 0, 1];
    // let b = [0, 0, 0, 0, 1];

    secp256k1_fe_mul_inner(&mut r, &a, &b);

    println!("Rust result:");

    println!("secp256k1_fe_mul_inner:");
    for i in 0..5 {
        println!("r[{}] = {:016X}", i, r[i]);
    }

    println!();

    secp256k1_fe_sqr_inner(&mut r, &a);

    println!("secp256k1_fe_sqr_inner:");
    for i in 0..5 {
        println!("r[{}] = {:016X}", i, r[i]);
    }
}