#include "../verifying-constant-time/examples/ct-verif.h"
#include <stdint.h>

/* ct-verif wrapper for rust_fiat_curve25519_carry_mul
 * This function performs constant-time field multiplication in Curve25519
 * 
 * Compile with:
 *   clang -I../verifying-constant-time/examples ../verifying-constant-time/examples/smack.c ct_verif_wrapper.c -emit-llvm -S -o ct_verif_wrapper.ll
 */

typedef uint64_t u64;

/* External function from the LLVM IR */
extern void rust_fiat_curve25519_carry_mul(u64 *out1, const u64 *arg1, const u64 *arg2);

/* Wrapper function for ct-verif analysis */
void verify_wrapper(u64 *out, const u64 *in1, const u64 *in2) {
    /* Ensure memory regions are disjoint */
    __disjoint_regions(out, 40, in1, 40);
    __disjoint_regions(out, 40, in2, 40);
    __disjoint_regions(in1, 40, in2, 40);
    
    /* Boilerplate for SMACK */
    public_in(__SMACK_value(out));
    public_in(__SMACK_value(in1));
    public_in(__SMACK_value(in2));
    
    /* Mark inputs as secret (5 limbs of 64 bits each) */
    /* These are the secret field elements */
    /* Note: We do NOT mark them as public_in, they remain secret */
    
    /* Mark output as declassified (the result can be public) */
    declassified_out(__SMACK_values(out, 40));
    
    /* Call the function under test */
    rust_fiat_curve25519_carry_mul(out, in1, in2);
}

#ifdef TEST
#include <stdio.h>
#include <string.h>

void test_multiplication() {
    u64 a[5] = {1, 2, 3, 4, 5};
    u64 b[5] = {6, 7, 8, 9, 10};
    u64 result[5] = {0};
    
    printf("Testing constant-time multiplication...\n");
    printf("a = ");
    for (int i = 0; i < 5; i++) printf("%llu ", a[i]);
    printf("\n");
    
    printf("b = ");
    for (int i = 0; i < 5; i++) printf("%llu ", b[i]);
    printf("\n");
    
    verify_wrapper(result, a, b);
    
    printf("result = ");
    for (int i = 0; i < 5; i++) printf("%llu ", result[i]);
    printf("\n");
}

int main() {
    test_multiplication();
    return 0;
}
#endif