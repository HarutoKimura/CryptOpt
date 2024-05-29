pub fn custom_func(x: i32, y: i32) -> i32 {
    const MULTIPLIER: i32 = 1000;
    (x + y) * MULTIPLIER
    //x.wrapping_add(y).wrapping_mul(MULTIPLIER)
}