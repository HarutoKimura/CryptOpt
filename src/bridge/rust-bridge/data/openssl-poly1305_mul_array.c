#include <stdint.h>

typedef unsigned long u64;
typedef __uint128_t u128;

// Poly1305 field multiplication using array representation
// This will generate getelementptr instructions in LLVM
void poly1305_mul(u64 h[3], const u64 r[2], u64 s1)
{
    u128 d0, d1;
    u64 c;
    
    /* h *= r "%" p, where "%" stands for "partial remainder" */
    d0 = ((u128)h[0] * r[0]) +
         ((u128)h[1] * s1);
    d1 = ((u128)h[0] * r[1]) +
         ((u128)h[1] * r[0]) +
         (h[2] * s1);
    h[2] = (h[2] * r[0]);

    /* last reduction step: */
    /* a) h2:h0 = h2<<128 + d1<<64 + d0 */
    h[0] = (u64)d0;
    h[1] = (u64)(d1 += d0 >> 64);
    h[2] += (u64)(d1 >> 64);
    
    /* b) (h2:h0 += (h2:h0>>130) * 5) %= 2^130 */
    c = (h[2] >> 2) + (h[2] & ~3UL);
    h[2] &= 3;
    h[0] += c;
    h[1] += (c = ((h[0] < c) ? 1 : 0));
    h[2] += ((h[1] < c) ? 1 : 0);
}

// Alternative using a struct (also generates getelementptr)
typedef struct {
    u64 v[3];
} poly1305_state;

typedef struct {
    u64 r[2];
    u64 s[2];  // s[0] = r[1] + (r[1] >> 2)
} poly1305_key;

static void poly1305_mul_struct(poly1305_state *h, const poly1305_key *key)
{
    u128 d0, d1;
    u64 c;
    
    /* h *= r "%" p, where "%" stands for "partial remainder" */
    d0 = ((u128)h->v[0] * key->r[0]) +
         ((u128)h->v[1] * key->s[0]);
    d1 = ((u128)h->v[0] * key->r[1]) +
         ((u128)h->v[1] * key->r[0]) +
         (h->v[2] * key->s[0]);
    h->v[2] = (h->v[2] * key->r[0]);

    /* last reduction step: */
    h->v[0] = (u64)d0;
    h->v[1] = (u64)(d1 += d0 >> 64);
    h->v[2] += (u64)(d1 >> 64);
    
    /* b) (h2:h0 += (h2:h0>>130) * 5) %= 2^130 */
    c = (h->v[2] >> 2) + (h->v[2] & ~3UL);
    h->v[2] &= 3;
    h->v[0] += c;
    h->v[1] += (c = ((h->v[0] < c) ? 1 : 0));
    h->v[2] += ((h->v[1] < c) ? 1 : 0);
}