/// Minimal version for mul_inner function

/// Simplified field element implementation
#[derive(Clone, Copy, Debug)]
pub struct FieldElement5x52(pub [u64; 5]);

impl FieldElement5x52 {
    /// Zero element
    pub const ZERO: Self = Self([0, 0, 0, 0, 0]);

    #[no_mangle]
    #[inline(always)]
    pub fn rust_ec_secp256k1_mul_inner(&self, rhs: &Self) -> Self {
        let a0 = self.0[0] as u128;
        let a1 = self.0[1] as u128;
        let a2 = self.0[2] as u128;
        let a3 = self.0[3] as u128;
        let a4 = self.0[4] as u128;
        let b0 = rhs.0[0] as u128;
        let b1 = rhs.0[1] as u128;
        let b2 = rhs.0[2] as u128;
        let b3 = rhs.0[3] as u128;
        let b4 = rhs.0[4] as u128;
        let m = 0xFFFFFFFFFFFFFu128;
        let r = 0x1000003D10u128;

        // [... a b c] is a shorthand for ... + a<<104 + b<<52 + c<<0 mod n.
        // for 0 <= x <= 4, px is a shorthand for sum(a[i]*b[x-i], i=0..x).
        // for 4 <= x <= 8, px is a shorthand for sum(a[i]*b[x-i], i=(x-4)..4)
        // Note that [x 0 0 0 0 0] = [x*r].

        let mut d = a0 * b3 + a1 * b2 + a2 * b1 + a3 * b0;
        // [d 0 0 0] = [p3 0 0 0]
        let mut c = a4 * b4;
        // [c 0 0 0 0 d 0 0 0] = [p8 0 0 0 0 p3 0 0 0]
        d += (c & m) * r;
        c >>= 52;
        let c64 = c as u64;
        // [c 0 0 0 0 0 d 0 0 0] = [p8 0 0 0 0 p3 0 0 0]
        let t3 = (d & m) as u64;
        d >>= 52;
        let d64 = d as u64;
        // [c 0 0 0 0 d t3 0 0 0] = [p8 0 0 0 0 p3 0 0 0]

        d = d64 as u128 + a0 * b4 + a1 * b3 + a2 * b2 + a3 * b1 + a4 * b0;
        // [c 0 0 0 0 d t3 0 0 0] = [p8 0 0 0 p4 p3 0 0 0]
        d += c64 as u128 * r;
        // [d t3 0 0 0] = [p8 0 0 0 p4 p3 0 0 0]
        let t4 = (d & m) as u64;
        d >>= 52;
        let d64 = d as u64;
        // [d t4 t3 0 0 0] = [p8 0 0 0 p4 p3 0 0 0]
        let tx = t4 >> 48;
        let t4 = t4 & ((m as u64) >> 4);
        // [d t4+(tx<<48) t3 0 0 0] = [p8 0 0 0 p4 p3 0 0 0]

        c = a0 * b0;
        // [d t4+(tx<<48) t3 0 0 c] = [p8 0 0 0 p4 p3 0 0 p0]
        d = d64 as u128 + a1 * b4 + a2 * b3 + a3 * b2 + a4 * b1;
        // [d t4+(tx<<48) t3 0 0 c] = [p8 0 0 p5 p4 p3 0 0 p0]
        let u0 = (d & m) as u64;
        d >>= 52;
        let d64 = d as u64;
        // [d u0 t4+(tx<<48) t3 0 0 c] = [p8 0 0 p5 p4 p3 0 0 p0]
        // [d 0 t4+(tx<<48)+(u0<<52) t3 0 0 c] = [p8 0 0 p5 p4 p3 0 0 p0]
        let u0 = (u0 << 4) | tx;
        // [d 0 t4+(u0<<48) t3 0 0 c] = [p8 0 0 p5 p4 p3 0 0 p0]
        c += u0 as u128 * ((r as u64) >> 4) as u128;
        // [d 0 t4 t3 0 0 c] = [p8 0 0 p5 p4 p3 0 0 p0]
        let r0 = (c & m) as u64;
        c >>= 52;
        let c64 = c as u64;
        // [d 0 t4 t3 0 c r0] = [p8 0 0 p5 p4 p3 0 0 p0]

        c = c64 as u128 + a0 * b1 + a1 * b0;
        // [d 0 t4 t3 0 c r0] = [p8 0 0 p5 p4 p3 0 p1 p0]
        d = d64 as u128 + a2 * b4 + a3 * b3 + a4 * b2;
        // [d 0 t4 t3 0 c r0] = [p8 0 p6 p5 p4 p3 0 p1 p0]
        c += (d & m) * r;
        d >>= 52;
        let d64 = d as u64;
        // [d 0 0 t4 t3 0 c r0] = [p8 0 p6 p5 p4 p3 0 p1 p0]
        let r1 = (c & m) as u64;
        c >>= 52;
        let c64 = c as u64;
        // [d 0 0 t4 t3 c r1 r0] = [p8 0 p6 p5 p4 p3 0 p1 p0]

        c = c64 as u128 + a0 * b2 + a1 * b1 + a2 * b0;
        // [d 0 0 t4 t3 c r1 r0] = [p8 0 p6 p5 p4 p3 p2 p1 p0]
        d = d64 as u128 + a3 * b4 + a4 * b3;
        // [d 0 0 t4 t3 c t1 r0] = [p8 p7 p6 p5 p4 p3 p2 p1 p0]
        c += (d & m) * r;
        d >>= 52;
        let d64 = d as u64;
        // [d 0 0 0 t4 t3 c r1 r0] = [p8 p7 p6 p5 p4 p3 p2 p1 p0]

        // [d 0 0 0 t4 t3 c r1 r0] = [p8 p7 p6 p5 p4 p3 p2 p1 p0]
        let r2 = (c & m) as u64;
        c >>= 52;
        let c64 = c as u64;
        // [d 0 0 0 t4 t3+c r2 r1 r0] = [p8 p7 p6 p5 p4 p3 p2 p1 p0]
        c = c64 as u128 + (d64 as u128) * r + t3 as u128;
        // [t4 c r2 r1 r0] = [p8 p7 p6 p5 p4 p3 p2 p1 p0]
        let r3 = (c & m) as u64;
        c >>= 52;
        let c64 = c as u64;
        // [t4+c r3 r2 r1 r0] = [p8 p7 p6 p5 p4 p3 p2 p1 p0]
        c = c64 as u128 + t4 as u128;
        // [c r3 r2 r1 r0] = [p8 p7 p6 p5 p4 p3 p2 p1 p0]
        let r4 = c as u64;
        // [r4 r3 r2 r1 r0] = [p8 p7 p6 p5 p4 p3 p2 p1 p0]

        Self([r0, r1, r2, r3, r4])
    }

    // Add a simple wrapper to make the function accessible
    // #[no_mangle]
    // pub fn mul(&self, rhs: &Self) -> Self {
    //     self.mul_inner(rhs)
    // }
}

// // For testing the function
// fn main() {
//     let a = FieldElement5x52([1, 2, 3, 4, 5]);
//     let b = FieldElement5x52([5, 4, 3, 2, 1]);
//     let _result = a.mul_inner(&b);
// }