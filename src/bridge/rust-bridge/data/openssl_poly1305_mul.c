#include <stdint.h>

typedef unsigned long u64;
typedef __uint128_t u128;

// Poly1305 field multiplication: h = h * r mod (2^130 - 5)
// Input: h (h0, h1, h2) and r (r0, r1, s1)
// Output: h (h0, h1, h2) 
void poly1305_mul(u64 *h0, u64 *h1, u64 *h2, 
                         u64 r0, u64 r1, u64 s1)
{
    u128 d0, d1;
    u64 c;
    
    /* h *= r "%" p, where "%" stands for "partial remainder" */
    d0 = ((u128)*h0 * r0) +
         ((u128)*h1 * s1);
    d1 = ((u128)*h0 * r1) +
         ((u128)*h1 * r0) +
         (*h2 * s1);
    *h2 = (*h2 * r0);

    /* last reduction step: */
    /* a) h2:h0 = h2<<128 + d1<<64 + d0 */
    *h0 = (u64)d0;
    *h1 = (u64)(d1 += d0 >> 64);
    *h2 += (u64)(d1 >> 64);
    
    /* b) (h2:h0 += (h2:h0>>130) * 5) %= 2^130 */
    c = (*h2 >> 2) + (*h2 & ~3UL);
    *h2 &= 3;
    *h0 += c;
    *h1 += (c = ((*h0 < c) ? 1 : 0));
    *h2 += ((*h1 < c) ? 1 : 0);
}