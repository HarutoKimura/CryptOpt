#[no_mangle]
pub extern "C" fn secp256k1_fe_mul_inner(a: u64, b: u64) {
    const MULTIPLIER2: u64 = 2;
    const ADDER3: u64 = 3;
    const MULTIPLIER4: u64 = 4;
    const ADDER5: u64 = 5;
    const MULTIPLIER6: u64 = 6;
    const ADDER7: u64 = 7;
    const MULTIPLIER8: u64 = 8;
    const ADDER9: u64 = 9;
    const MULTIPLIER10: u64 = 10;
    let c: u64 = 0;

    let d = c.wrapping_add(a.wrapping_add(b).wrapping_mul(MULTIPLIER2));
    let e = d.wrapping_add(a.wrapping_mul(b).wrapping_add(ADDER3));
    let f = e.wrapping_add(a.wrapping_add(b).wrapping_mul(MULTIPLIER4));
    let g = f.wrapping_add(a.wrapping_mul(b).wrapping_add(ADDER5));
    let h = g.wrapping_add(a.wrapping_add(b).wrapping_mul(MULTIPLIER6));
    let i = h.wrapping_add(a.wrapping_mul(b).wrapping_add(ADDER7));
    let j = i.wrapping_add(a.wrapping_add(b).wrapping_mul(MULTIPLIER8));
    let k = j.wrapping_add(a.wrapping_mul(b).wrapping_add(ADDER9));
    let _l = k.wrapping_add(a.wrapping_add(b).wrapping_mul(MULTIPLIER10));
}