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

void openssl_p448_mul(gf_s * RESTRICT cs, const gf as, const gf bs)
{
    const uint64_t *a = as->limb, *b = bs->limb;
    uint64_t *c = cs->limb;
    uint128_t accum0 = 0, accum1 = 0, accum2;
    uint64_t mask = (1ULL << 56) - 1;
    uint64_t aa[4], bb[4], bbb[4];
    unsigned int i, j;

    for (i = 0; i < 4; i++) {
        aa[i] = a[i] + a[i + 4];
        bb[i] = b[i] + b[i + 4];
        bbb[i] = bb[i] + b[i + 4];
    }

    for (i = 0; i < 4; i++) {
        accum2 = 0;

        for (j = 0; j <= i; j++) {
            accum2 += widemul(a[j], b[i - j]);
            accum1 += widemul(aa[j], bb[i - j]);
            accum0 += widemul(a[j + 4], b[i - j + 4]);
        }
        for (; j < 4; j++) {
            accum2 += widemul(a[j], b[i + 8 - j]);
            accum1 += widemul(aa[j], bbb[i + 4 - j]);
            accum0 += widemul(a[j + 4], bb[i + 4 - j]);
        }

        accum1 -= accum2;
        accum0 += accum2;

        c[i] = ((uint64_t)(accum0)) & mask;
        c[i + 4] = ((uint64_t)(accum1)) & mask;

        accum0 >>= 56;
        accum1 >>= 56;
    }

    accum0 += accum1;
    accum0 += c[4];
    accum1 += c[0];
    c[4] = ((uint64_t)(accum0)) & mask;
    c[0] = ((uint64_t)(accum1)) & mask;

    accum0 >>= 56;
    accum1 >>= 56;

    c[5] += ((uint64_t)(accum0));
    c[1] += ((uint64_t)(accum1));
}