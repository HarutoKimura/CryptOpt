// Minimal extraction of mul_r_mod_p function from Poly1305

// The 130-bit accumulator is split into five 26-bit limbs, with the
// carry between the limbs delayed.
//
// The reduction steps use the following identity:
//
// a×2^n ≡ a×c (mod 2^n−c)
//
// For Poly1305, the identity becomes:
//
// a×2^130 ≡ a×5 (mod 2^130−5)

#[derive(Clone, Debug)]
pub struct Poly1305 {
    /// Accumulator: 5x26-bit
    a: [u32; 5],
    /// Multiplier: 5x26-bit
    r: [u32; 5],
}

impl Poly1305 {
    // Constructor for testing
    pub fn new_for_test(a: [u32; 5], r: [u32; 5]) -> Self {
        Poly1305 { a, r }
    }

    #[no_mangle] // Ensures the function name is preserved in LLVM IR
    fn mul_r_mod_p(&mut self) {
        // t = r * a; high limbs multiplied by 5 and added to low limbs
        let mut t = [0; 5];

        t[0] +=      self.r[0]  as u64 * self.a[0] as u64;
        t[1] +=      self.r[0]  as u64 * self.a[1] as u64;
        t[2] +=      self.r[0]  as u64 * self.a[2] as u64;
        t[3] +=      self.r[0]  as u64 * self.a[3] as u64;
        t[4] +=      self.r[0]  as u64 * self.a[4] as u64;

        t[0] += (5 * self.r[1]) as u64 * self.a[4] as u64;
        t[1] +=      self.r[1]  as u64 * self.a[0] as u64;
        t[2] +=      self.r[1]  as u64 * self.a[1] as u64;
        t[3] +=      self.r[1]  as u64 * self.a[2] as u64;
        t[4] +=      self.r[1]  as u64 * self.a[3] as u64;

        t[0] += (5 * self.r[2]) as u64 * self.a[3] as u64;
        t[1] += (5 * self.r[2]) as u64 * self.a[4] as u64;
        t[2] +=      self.r[2]  as u64 * self.a[0] as u64;
        t[3] +=      self.r[2]  as u64 * self.a[1] as u64;
        t[4] +=      self.r[2]  as u64 * self.a[2] as u64;

        t[0] += (5 * self.r[3]) as u64 * self.a[2] as u64;
        t[1] += (5 * self.r[3]) as u64 * self.a[3] as u64;
        t[2] += (5 * self.r[3]) as u64 * self.a[4] as u64;
        t[3] +=      self.r[3]  as u64 * self.a[0] as u64;
        t[4] +=      self.r[3]  as u64 * self.a[1] as u64;

        t[0] += (5 * self.r[4]) as u64 * self.a[1] as u64;
        t[1] += (5 * self.r[4]) as u64 * self.a[2] as u64;
        t[2] += (5 * self.r[4]) as u64 * self.a[3] as u64;
        t[3] += (5 * self.r[4]) as u64 * self.a[4] as u64;
        t[4] +=      self.r[4]  as u64 * self.a[0] as u64;

        // propagate carries
        t[1] += t[0] >> 26;
        t[2] += t[1] >> 26;
        t[3] += t[2] >> 26;
        t[4] += t[3] >> 26;

        // mask out carries
        self.a[0] = t[0] as u32 & 0x03ffffff;
        self.a[1] = t[1] as u32 & 0x03ffffff;
        self.a[2] = t[2] as u32 & 0x03ffffff;
        self.a[3] = t[3] as u32 & 0x03ffffff;
        self.a[4] = t[4] as u32 & 0x03ffffff;

        // propagate high limb carry
        self.a[0] += (t[4] >> 26) as u32 * 5;
        self.a[1] += self.a[0] >> 26;

        // mask out carries
        self.a[0] &= 0x03ffffff;

        // A carry of at most 1 bit has been left in self.a[1]
    }
}