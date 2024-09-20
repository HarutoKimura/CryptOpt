#include <stdio.h>
#include <stdint.h>

// Declare the function prototype
extern void secp256k1_fe_mul_inner(uint64_t* out, const uint64_t* a, const uint64_t* b);

int main() {
    uint64_t a[5] = {0x1111111111111111, 0x1111111111111111, 0x1111111111111111, 0x1111111111111111, 0x1111111111111111};
    uint64_t b[5] = {0x1111111111111111, 0x1111111111111111, 0x1111111111111111, 0x1111111111111111, 0x1111111111111111};
    uint64_t result[5] = {0};

    secp256k1_fe_mul_inner(result, a, b);

    printf("Result:\n");
    for (int i = 0; i < 5; i++) {
        printf("%lu ", result[i]);
    }
    printf("\n");

    return 0;
}