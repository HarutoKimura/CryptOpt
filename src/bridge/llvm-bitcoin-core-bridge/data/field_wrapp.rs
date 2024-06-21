const M: u64 = 0xFFFFFFFFFFFFFFFF;
const R: u64 = 0x1000003D10;

pub fn secp256k1_fe_mul_inner(r: &mut [u64; 5], a: &[u64; 5], b: &[u64; 5]) {
    let mut c: u128;
    let mut d: u128;
    let mut t3: u64;
    let mut t4: u64;
    let mut tx: u64;
    let mut u0: u64;

    let a0 = a[0];
    let a1 = a[1];
    let a2 = a[2];
    let a3 = a[3];
    let a4 = a[4];

    d = (a0 as u128).wrapping_mul(b[3] as u128)
        .wrapping_add((a1 as u128).wrapping_mul(b[2] as u128))
        .wrapping_add((a2 as u128).wrapping_mul(b[1] as u128))
        .wrapping_add((a3 as u128).wrapping_mul(b[0] as u128));

    c = (a4 as u128).wrapping_mul(b[4] as u128);

    d = d.wrapping_add((R as u128).wrapping_mul(c as u64 as u128));
    c >>= 64;

    t3 = (d & M as u128) as u64;
    d >>= 52;

    d = d.wrapping_add((a0 as u128).wrapping_mul(b[4] as u128))
        .wrapping_add((a1 as u128).wrapping_mul(b[3] as u128))
        .wrapping_add((a2 as u128).wrapping_mul(b[2] as u128))
        .wrapping_add((a3 as u128).wrapping_mul(b[1] as u128))
        .wrapping_add((a4 as u128).wrapping_mul(b[0] as u128));

    d = d.wrapping_add(((R as u128) << 12).wrapping_mul(c as u64 as u128));

    t4 = (d & M as u128) as u64;
    d >>= 52;

    tx = t4 >> 48;
    t4 &= M >> 4;

    c = (a0 as u128).wrapping_mul(b[0] as u128);

    d = d.wrapping_add((a1 as u128).wrapping_mul(b[4] as u128))
        .wrapping_add((a2 as u128).wrapping_mul(b[3] as u128))
        .wrapping_add((a3 as u128).wrapping_mul(b[2] as u128))
        .wrapping_add((a4 as u128).wrapping_mul(b[1] as u128));

    u0 = (d & M as u128) as u64;
    d >>= 52;

    u0 = (u0 << 4) | tx;

    c = c.wrapping_add((u0 as u128).wrapping_mul((R >> 4) as u128));

    r[0] = (c & M as u128) as u64;
    c >>= 52;

    c = c.wrapping_add((a0 as u128).wrapping_mul(b[1] as u128)).wrapping_add((a1 as u128).wrapping_mul(b[0] as u128));

    d = d.wrapping_add((a2 as u128).wrapping_mul(b[4] as u128))
        .wrapping_add((a3 as u128).wrapping_mul(b[3] as u128))
        .wrapping_add((a4 as u128).wrapping_mul(b[2] as u128));

    c = c.wrapping_add(((d & M as u128) as u64 as u128).wrapping_mul(R as u128));
    d >>= 52;

    r[1] = (c & M as u128) as u64;
    c >>= 52;

    c = c.wrapping_add((a0 as u128).wrapping_mul(b[2] as u128))
        .wrapping_add((a1 as u128).wrapping_mul(b[1] as u128))
        .wrapping_add((a2 as u128).wrapping_mul(b[0] as u128));

    d = d.wrapping_add((a3 as u128).wrapping_mul(b[4] as u128)).wrapping_add((a4 as u128).wrapping_mul(b[3] as u128));

    c = c.wrapping_add((R as u128).wrapping_mul(d as u64 as u128));
    d >>= 64;

    r[2] = (c & M as u128) as u64;
    c >>= 52;

    c = c.wrapping_add(((R as u128) << 12).wrapping_mul(d as u64 as u128)).wrapping_add(t3 as u128);

    r[3] = (c & M as u128) as u64;
    c >>= 52;

    c = c.wrapping_add(t4 as u128);

    r[4] = c as u64;

    return 
}