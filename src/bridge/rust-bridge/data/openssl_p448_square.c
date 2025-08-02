#include <stdint.h>

typedef __uint128_t uint128_t;
typedef uint64_t word_t;
#define NLIMBS 8
#define RESTRICT __restrict__
#define ALIGNED __attribute__((__aligned__(16)))

typedef struct gf_s {
    word_t limb[NLIMBS];
} ALIGNED gf_s, gf[1];

static inline uint128_t widemul(uint64_t a, uint64_t b)
{
    return ((uint128_t) a) * b;
}

void openssl_p448_square(gf_s * RESTRICT cs, const gf as)
{
    const uint64_t *a = as->limb;
    uint64_t *c = cs->limb;
    uint128_t accum0 = 0, accum1 = 0, accum2;
    uint64_t mask = (1ULL << 56) - 1;
    uint64_t aa[4];
    unsigned int i;

    /* For some reason clang doesn't vectorize this without prompting? */
    for (i = 0; i < 4; i++)
        aa[i] = a[i] + a[i + 4];

    accum2 = widemul(a[0], a[3]);
    accum0 = widemul(aa[0], aa[3]);
    accum1 = widemul(a[4], a[7]);

    accum2 += widemul(a[1], a[2]);
    accum0 += widemul(aa[1], aa[2]);
    accum1 += widemul(a[5], a[6]);

    accum0 -= accum2;
    accum1 += accum2;

    c[3] = ((uint64_t)(accum1)) << 1 & mask;
    c[7] = ((uint64_t)(accum0)) << 1 & mask;

    accum0 >>= 55;
    accum1 >>= 55;

    accum0 += widemul(2 * aa[1], aa[3]);
    accum1 += widemul(2 * a[5], a[7]);
    accum0 += widemul(aa[2], aa[2]);
    accum1 += accum0;

    accum0 -= widemul(2 * a[1], a[3]);
    accum1 += widemul(a[6], a[6]);

    accum2 = widemul(a[0], a[0]);
    accum1 -= accum2;
    accum0 += accum2;

    accum0 -= widemul(a[2], a[2]);
    accum1 += widemul(aa[0], aa[0]);
    accum0 += widemul(a[4], a[4]);

    c[0] = ((uint64_t)(accum0)) & mask;
    c[4] = ((uint64_t)(accum1)) & mask;

    accum0 >>= 56;
    accum1 >>= 56;

    accum2 = widemul(2 * aa[2], aa[3]);
    accum0 -= widemul(2 * a[2], a[3]);
    accum1 += widemul(2 * a[6], a[7]);

    accum1 += accum2;
    accum0 += accum2;

    accum2 = widemul(2 * a[0], a[1]);
    accum1 += widemul(2 * aa[0], aa[1]);
    accum0 += widemul(2 * a[4], a[5]);

    accum1 -= accum2;
    accum0 += accum2;

    c[1] = ((uint64_t)(accum0)) & mask;
    c[5] = ((uint64_t)(accum1)) & mask;

    accum0 >>= 56;
    accum1 >>= 56;

    accum2 = widemul(aa[3], aa[3]);
    accum0 -= widemul(a[3], a[3]);
    accum1 += widemul(a[7], a[7]);

    accum1 += accum2;
    accum0 += accum2;

    accum2 = widemul(2 * a[0], a[2]);
    accum1 += widemul(2 * aa[0], aa[2]);
    accum0 += widemul(2 * a[4], a[6]);

    accum2 += widemul(a[1], a[1]);
    accum1 += widemul(aa[1], aa[1]);
    accum0 += widemul(a[5], a[5]);

    accum1 -= accum2;
    accum0 += accum2;

    c[2] = ((uint64_t)(accum0)) & mask;
    c[6] = ((uint64_t)(accum1)) & mask;

    accum0 >>= 56;
    accum1 >>= 56;

    accum0 += c[3];
    accum1 += c[7];
    c[3] = ((uint64_t)(accum0)) & mask;
    c[7] = ((uint64_t)(accum1)) & mask;

    /* we could almost stop here, but it wouldn't be stable, so... */

    accum0 >>= 56;
    accum1 >>= 56;
    c[4] += ((uint64_t)(accum0)) + ((uint64_t)(accum1));
    c[0] += ((uint64_t)(accum1));
}