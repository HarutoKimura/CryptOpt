
#define DUDECT_IMPLEMENTATION
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include "dudect.h"

// External assembly function
extern void rust_fiat_curve25519_carry_mul(uint64_t* out, const uint64_t* arg1, const uint64_t* arg2);

// Global config for prepare_inputs
static size_t chunk_size = 80;
static size_t number_measurements = 10000;

// Prepare inputs for different test cases
uint8_t do_one_computation(uint8_t *data) {
    uint64_t out[5] = {0};
    uint64_t arg1[5] = {0};
    uint64_t arg2[5] = {0};
    
    // Use first 40 bytes for arg1, next 40 for arg2
    memcpy(arg1, data, 40);
    memcpy(arg2, data + 40, 40);
    
    // Call the function we're testing
    rust_fiat_curve25519_carry_mul(out, arg1, arg2);
    
    // Return a byte from the output (for dudect's measurements)
    return ((uint8_t*)out)[0];
}

// Prepare input data with different classes
void prepare_inputs(dudect_config_t *c, uint8_t *input_data, uint8_t *classes) {
    chunk_size = c->chunk_size;
    number_measurements = c->number_measurements;
    
    randombytes(input_data, number_measurements * chunk_size);
    
    for (size_t i = 0; i < number_measurements; i++) {
        classes[i] = randombit();
        if (classes[i] == 0) {
            // Class 0: Zero out the second argument
            memset(input_data + (i * chunk_size) + 40, 0, 40);
        }
        // Class 1: Keep random data
    }
}

int main(int argc, char **argv) {
    dudect_config_t config = {
        .chunk_size = 80,  // 40 bytes for each of two inputs
        .number_measurements = 10000,
    };
    
    dudect_ctx_t ctx;
    dudect_init(&ctx, &config);
    
    dudect_state_t state = DUDECT_NO_LEAKAGE_EVIDENCE_YET;
    
    // Run for a limited number of iterations
    int max_iterations = (argc > 1) ? atoi(argv[1]) : 100;
    int iterations = 0;
    
    while (state == DUDECT_NO_LEAKAGE_EVIDENCE_YET && iterations < max_iterations) {
        state = dudect_main(&ctx);
        iterations++;
    }
    
    dudect_free(&ctx);
    
    if (state == DUDECT_LEAKAGE_FOUND) {
        printf("❌ Timing leak detected after %d iterations!\n", iterations);
        return 1;
    } else {
        printf("✅ No timing leak detected after %d iterations\n", iterations);
        return 0;
    }
}
