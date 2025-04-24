#![allow(dead_code)]

// Use std instead of core.
use std::fmt::Debug;
use std::ops::{Mul};

/// A minimal version of FieldElement51.
/// Internally, it represents an element of the field with 5 u64 limbs.
#[derive(Copy, Clone)]
pub struct FieldElement51(pub [u64; 5]);

impl Debug for FieldElement51 {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "FieldElement51({:?})", &self.0[..])
    }
}

// A dummy implementation of reduce so that any code that might depend on it compiles.
impl FieldElement51 {
    #[allow(unused)]
    fn reduce(input: [u64; 5]) -> FieldElement51 {
        FieldElement51(input)
    }
}

/// We only keep the multiplication implementation. This code computes a product of two
/// FieldElement51 values using 128-bit arithmetic for intermediate results.
impl<'a, 'b> Mul<&'b FieldElement51> for &'a FieldElement51 {
    type Output = FieldElement51;
    #[rustfmt::skip]
    #[no_mangle]
    fn mul(self, _rhs: &'b FieldElement51) -> FieldElement51 {
        #[inline(always)]
        fn m(x: u64, y: u64) -> u128 { (x as u128) * (y as u128) }
        // Alias self and _rhs for clarity.
        let a: &[u64; 5] = &self.0;
        let b: &[u64; 5] = &_rhs.0;
        
        // Precompute multiples of 19 for b[1..4].
        let b1_19 = b[1] * 19;
        let b2_19 = b[2] * 19;
        let b3_19 = b[3] * 19;
        let b4_19 = b[4] * 19;
        
        // Compute 128-bit intermediate products.
        let     c0: u128 = m(a[0], b[0]) + m(a[4], b1_19) + m(a[3], b2_19) + m(a[2], b3_19) + m(a[1], b4_19);
        let mut c1: u128 = m(a[1], b[0]) + m(a[0], b[1]) + m(a[4], b2_19) + m(a[3], b3_19) + m(a[2], b4_19);
        let mut c2: u128 = m(a[2], b[0]) + m(a[1], b[1]) + m(a[0], b[2]) + m(a[4], b3_19) + m(a[3], b4_19);
        let mut c3: u128 = m(a[3], b[0]) + m(a[2], b[1]) + m(a[1], b[2]) + m(a[0], b[3]) + m(a[4], b4_19);
        let mut c4: u128 = m(a[4], b[0]) + m(a[3], b[1]) + m(a[2], b[2]) + m(a[1], b[3]) + m(a[0], b[4]);
        
        // Debug assertions to check the limbs are within expected bounds.
        debug_assert!(a[0] < (1 << 54)); debug_assert!(b[0] < (1 << 54));
        debug_assert!(a[1] < (1 << 54)); debug_assert!(b[1] < (1 << 54));
        debug_assert!(a[2] < (1 << 54)); debug_assert!(b[2] < (1 << 54));
        debug_assert!(a[3] < (1 << 54)); debug_assert!(b[3] < (1 << 54));
        debug_assert!(a[4] < (1 << 54)); debug_assert!(b[4] < (1 << 54));
        
        // Reduce each coefficient by shifting by 51 bits.
        const LOW_51_BIT_MASK: u64 = (1u64 << 51) - 1;
        let mut out = [0u64; 5];
        
        c1 += ((c0 >> 51) as u64) as u128;
        out[0] = (c0 as u64) & LOW_51_BIT_MASK;
        
        c2 += ((c1 >> 51) as u64) as u128;
        out[1] = (c1 as u64) & LOW_51_BIT_MASK;
        
        c3 += ((c2 >> 51) as u64) as u128;
        out[2] = (c2 as u64) & LOW_51_BIT_MASK;
        
        c4 += ((c3 >> 51) as u64) as u128;
        out[3] = (c3 as u64) & LOW_51_BIT_MASK;
        
        let carry: u64 = (c4 >> 51) as u64;
        out[4] = (c4 as u64) & LOW_51_BIT_MASK;
        
        // Final reduction: incorporate the carry multiplied by 19.
        out[0] += carry * 19;
        out[1] += out[0] >> 51;
        out[0] &= LOW_51_BIT_MASK;
        
        FieldElement51(out)
    }
}