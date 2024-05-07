pub fn custom_func(x: i32, y: i32) -> i32 {
    const MULTIPLIER: i32 = 2;
    let result: i32 = 0;

    let _ = result.wrapping_add(x.wrapping_add(y).wrapping_mul(MULTIPLIER));
    let _ = result.wrapping_add(x.wrapping_add(y).wrapping_mul(MULTIPLIER));
    let _ = result.wrapping_add(x.wrapping_add(y).wrapping_mul(MULTIPLIER));
    let _ = result.wrapping_add(x.wrapping_add(y).wrapping_mul(MULTIPLIER));
    let _ = result.wrapping_add(x.wrapping_add(y).wrapping_mul(MULTIPLIER));

    result
}