const M: u64 = 0xFFFFFFFFFFFFFFFF;
const R: u64 = 0x1000003D10;

pub fn secp256k1_fe_mul_inner(r: &mut [u64; 5], a: &[u64; 5], b: &[u64; 5]) {
    let mut c: u128;
    let mut d: u128;
    let  t3: u64;
    let mut t4: u64;
    let  tx: u64;
    let mut u0: u64;

    let a0 = a[0];
    let a1 = a[1];
    let a2 = a[2];
    let a3 = a[3];
    let a4 = a[4];

    d = (a0 as u128) * (b[3] as u128)
        + (a1 as u128) * (b[2] as u128)
        + (a2 as u128) * (b[1] as u128)
        + (a3 as u128) * (b[0] as u128);

    c = (a4 as u128) * (b[4] as u128);

    d += (R as u128) * (c as u64 as u128);
    c >>= 64;

    t3 = (d & M as u128) as u64;
    d >>= 52;

    d += (a0 as u128) * (b[4] as u128)
        + (a1 as u128) * (b[3] as u128)
        + (a2 as u128) * (b[2] as u128)
        + (a3 as u128) * (b[1] as u128)
        + (a4 as u128) * (b[0] as u128);

    d += ((R as u128) << 12) * (c as u64 as u128);

    t4 = (d & M as u128) as u64;
    d >>= 52;

    tx = t4 >> 48;
    t4 &= M >> 4;

    c = (a0 as u128) * (b[0] as u128);

    d += (a1 as u128) * (b[4] as u128)
        + (a2 as u128) * (b[3] as u128)
        + (a3 as u128) * (b[2] as u128)
        + (a4 as u128) * (b[1] as u128);

    u0 = (d & M as u128) as u64;
    d >>= 52;

    u0 = (u0 << 4) | tx;

    c += (u0 as u128) * ((R >> 4) as u128);

    r[0] = (c & M as u128) as u64;
    c >>= 52;

    c += (a0 as u128) * (b[1] as u128) + (a1 as u128) * (b[0] as u128);

    d += (a2 as u128) * (b[4] as u128)
        + (a3 as u128) * (b[3] as u128)
        + (a4 as u128) * (b[2] as u128);

    c += ((d & M as u128) as u64 as u128) * (R as u128);
    d >>= 52;

    r[1] = (c & M as u128) as u64;
    c >>= 52;

    c += (a0 as u128) * (b[2] as u128)
        + (a1 as u128) * (b[1] as u128)
        + (a2 as u128) * (b[0] as u128);

    d += (a3 as u128) * (b[4] as u128) + (a4 as u128) * (b[3] as u128);

    c += (R as u128) * (d as u64 as u128);
    d >>= 64;

    r[2] = (c & M as u128) as u64;
    c >>= 52;

    c += ((R as u128) << 12) * (d as u64 as u128) + (t3 as u128);

    r[3] = (c & M as u128) as u64;
    c >>= 52;

    c += t4 as u128;

    r[4] = c as u64;
}