pub fn custom_func_ver(x: u64, y: u64) -> u64 {
    const MULTIPLIER2: u64 = 2;
    const ADDER3: u64 = 3;
    const MULTIPLIER4: u64 = 4;
    const ADDER5: u64 = 5;
    const MULTIPLIER6: u64 = 6;
    const ADDER7: u64 = 7;
    const MULTIPLIER8: u64 = 8;
    const ADDER9: u64 = 9;
    const MULTIPLIER10: u64 = 10;
    let result: u64 = 0;

    let _ = result.wrapping_add(x.wrapping_add(y).wrapping_mul(MULTIPLIER2));
    let _ = result.wrapping_add(x.wrapping_mul(y).wrapping_add(ADDER3));
    let _ = result.wrapping_add(x.wrapping_add(y).wrapping_mul(MULTIPLIER4));
    let _ = result.wrapping_add(x.wrapping_mul(y).wrapping_add(ADDER5));
    let _ = result.wrapping_add(x.wrapping_add(y).wrapping_mul(MULTIPLIER6));
    let _ = result.wrapping_add(x.wrapping_mul(y).wrapping_add(ADDER7));
    let _ = result.wrapping_add(x.wrapping_add(y).wrapping_mul(MULTIPLIER8));
    let _ = result.wrapping_add(x.wrapping_mul(y).wrapping_add(ADDER9));
    let _ = result.wrapping_add(x.wrapping_add(y).wrapping_mul(MULTIPLIER10));

    result
}