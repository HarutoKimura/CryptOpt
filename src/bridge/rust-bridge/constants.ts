/**
 * Copyright 2023 University of Adelaide
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
export const RUST_AVAILABLE_CURVES = [
  "bls12_381_p",
  'bls12_381_q',
  "curve25519",
  "curve25519_solinas",
  "curve25519_dalek",
  "openssl_curve25519",
  "openssl_p448",
  "openssl_poly1305",
  "p224",
  "p256",
  "p384",
  "p434",
  "p448_solinas",
  "p521",
  "poly1305",
  "secp256k1_montgomery",
  "secp256k1_dettman",
  "secp256k1_ec",
  "sm2",
] as const;
export type CURVE_T = (typeof RUST_AVAILABLE_CURVES)[number];

export const RUST_AVAILABLE_METHODS = ["square", "mul"] as const;
export type METHOD_T = (typeof RUST_AVAILABLE_METHODS)[number];

export const AVAILABLE_LANGUAGES = ["rust", "c"] as const;
export type LANGUAGE_T = (typeof AVAILABLE_LANGUAGES)[number];

/**
 * For each (curve, method), we store:
 * - The Rust and C function names we expect to see in the demangled JSON (i.e. the "operation" field).
 * - The JSON file name we want to load or generate for each language. 
 *   (If you want a single file for all curves, you can point them all to one file or use a scheme.)
 */
export const RUST_SYMBOLS: Record<
  CURVE_T,
  Record<
    METHOD_T, 
    Record<
      LANGUAGE_T, 
      { fnName: string; jsonFile: string }
    >
  >
> = {
  bls12_381_p: {
    mul: {
      rust: {
        fnName: "bls12_mul",
        jsonFile: "bls12_mul_updated.json",
      },
      c: {
        fnName: "mul",
        jsonFile: "bls12_381_fp_mul.json",
      },
    },
    square: {
      rust: {
        fnName: "square",
        jsonFile: "bls12_381_fp_square.json",
      },
      c: {
        fnName: "square",
      jsonFile: "bls12_381_fp_square.json",
      },
    },
  },

  bls12_381_q: {
    mul: {
      rust: {
        fnName: "bls12_q_mul",
        jsonFile: "bls12_q_mul.json",
      },
      c: {
        fnName: "bls12_q_mul",
      jsonFile: "bls12_q_mul.json",
      },
    },
    square: {
      rust: {
        fnName: "bls12_q_square",
        jsonFile: "bls12_q_square.json",
      },
      c: {
        fnName: "bls12_q_square",
      jsonFile: "bls12_q_square.json",
      },
    },
  },

  curve25519: {
    mul: {
      rust: {
        fnName: "rust_fiat_curve25519_carry_mul",
        jsonFile: "rust_fiat_curve25519_carry_mul_updated.json",
      },
      c: {
        fnName: "c_fiat_curve25519_carry_mul",
      jsonFile: "c_fiat_curve25519_carry_mul_ssa.json",
    },
    },
    square: {
      rust: {
        fnName: "rust_fiat_curve25519_carry_square",
        jsonFile: "rust_fiat_curve25519_carry_square.json",
      },
      c: {
        fnName: "c_fiat_curve25519_carry_square",
      jsonFile: "c_fiat_curve25519_carry_square_ssa.json",
    }
    }
  },

  curve25519_dalek: {
    mul: {
      rust: {
        fnName: "mul",
        jsonFile: "curve25519_dalek_u64_mul.json",
      },
      c: {
        fnName: "mul",
        jsonFile: "curve25519_dalek_u64_mul.json",
      },
    },
    square: {
      rust: {
        fnName: "square",
        jsonFile: "square.json",
      },
      c: {
        fnName: "square",
        jsonFile: "square.json",
      }
    }
  },

  curve25519_solinas: {
    mul: {
      rust: {
        fnName: "rust_fiat_curve25519_solinas_mul",
        jsonFile: "rust_fiat_curve25519_solinas_mul.json",
      },
      c: {
        fnName: "rust_fiat_curve25519_solinas_mul",
      jsonFile: "rust_fiat_curve25519_solinas_mul.json",
      },
    },
    square: {
      rust: {
        fnName: "rust_fiat_curve25519_solinas_square",
        jsonFile: "rust_fiat_curve25519_solinas_square.json",
      },
      c: {
        fnName: "rust_fiat_curve25519_solinas_square",
      jsonFile: "rust_fiat_curve25519_solinas_square.json",
      },
    },
  },

  p224: {
    mul: {
      rust: {
        fnName: "rust_fiat_p224_mul",
        jsonFile: "rust_fiat_p224_mul.json",
      },
      c: {
        fnName: "c_fiat_p224_mul",
      jsonFile: "c_fiat_p224_mul_ssa.json",
      },
    },
    square: {
      rust: {
        fnName: "rust_fiat_p224_square",
        jsonFile: "rust_fiat_p224_square.json",
      },
      c: {
        fnName: "rust_fiat_p224_square",
      jsonFile: "rust_fiat_p224_square.json",
      },
    },
  },

  p256: {
    mul: {
      rust: {
        fnName: "rust_fiat_p256_mul",
        jsonFile: "rust_fiat_p256_mul.json",
      },
      c: {
        fnName: "rust_fiat_p256_mul",
      jsonFile: "rust_fiat_p256_mul.json",
      },
    },
    square: {
      rust: {
        fnName: "rust_fiat_p256_square",
        jsonFile: "rust_fiat_p256_square.json",
      },
      c: {
        fnName: "rust_fiat_p256_square",
      jsonFile: "rust_fiat_p256_square.json",
      },
    },
  },

  p384: {
    mul: {
      rust: {
        fnName: "rust_fiat_p384_mul",
        jsonFile: "rust_fiat_p384_mul.json",
      },
      c: {
        fnName: "rust_fiat_p384_mul",
      jsonFile: "rust_fiat_p384_mul.json",
      },
    },
    square: {
      rust: {
        fnName: "rust_fiat_p384_square",
        jsonFile: "rust_fiat_p384_square.json",
      },
      c: {
        fnName: "rust_fiat_p384_square",
      jsonFile: "rust_fiat_p384_square.json",
      },
    },
  },

  p434: {
    mul: {
      rust: {
        fnName: "rust_fiat_p434_mul",
        jsonFile: "rust_fiat_p434_mul.json",
      },
      c: {
        fnName: "rust_fiat_p434_mul",
      jsonFile: "rust_fiat_p434_mul.json",
      },
    },
    square: {
      rust: {
        fnName: "rust_fiat_p434_square",
        jsonFile: "rust_fiat_p434_square.json",
      },
      c: {
        fnName: "rust_fiat_p434_square",
      jsonFile: "rust_fiat_p434_square.json",
      },
    },
  },

  p448_solinas: {
    mul: {
      rust: {
        fnName: "rust_fiat_p448_solinas_carry_mul",
        jsonFile: "rust_fiat_p448_solinas_carry_mul_updated.json",
      },
      c: {
        fnName: "c_fiat_p448_carry_mul",
      jsonFile: "c_fiat_p448_carry_mul_ssa.json",
      },
    },
    square: {
      rust: {
        fnName: "rust_fiat_p448_solinas_carry_square",
        jsonFile: "rust_fiat_p448_solinas_carry_square_new.json",
      },
      c: {
        fnName: "c_fiat_p448_carry_square",
      jsonFile: "c_fiat_p448_carry_square_ssa.json",
      },
    },
  },

  p521: {
    mul: {
      rust: {
        fnName: "rust_fiat_p521_carry_mul",
        jsonFile: "rust_fiat_p521_carry_mul.json",
      },
      c: {
        fnName: "rust_fiat_p521_carry_mul",
      jsonFile: "rust_fiat_p521_carry_mul.json",
      },
    },
    square: {
      rust: {
        fnName: "rust_fiat_p521_carry_square",
        jsonFile: "rust_fiat_p521_carry_square.json",
      },
      c: {
        fnName: "rust_fiat_p521_carry_square",
      jsonFile: "rust_fiat_p521_carry_square.json",
      },
    },
  },

  poly1305: {
    mul: {
      rust: {
        fnName: "rust_fiat_poly1305_carry_mul",
        jsonFile: "rust_fiat_poly1305_carry_mul_updated.json",
      },
      c: {
        fnName: "c_fiat_poly1305_carry_mul",
      jsonFile: "c_fiat_poly1305_carry_mul_ssa.json",
    },
    },
    square: {
      rust: {
        fnName: "rust_fiat_poly1305_carry_square",
        jsonFile: "rust_fiat_poly1305_carry_square.json",
      },
      c: {
        fnName: "c_fiat_poly1305_carry_square",
      jsonFile: "c_fiat_poly1305_carry_square_ssa.json",
      },
    },
  },

  secp256k1_montgomery: {
    mul: {
      rust: {
        fnName: "rust_fiat_secp256k1_montgomery_mul",
        jsonFile: "rust_fiat_secp256k1_montgomery_mul.json",
      },
      c: {
        fnName: "rust_fiat_secp256k1_montgomery_mul",
      jsonFile: "rust_fiat_secp256k1_montgomery_mul.json",
      },
    },
    square: {
      rust: {
        fnName: "rust_fiat_secp256k1_montgomery_square",
        jsonFile: "rust_fiat_secp256k1_montgomery_square.json",
      },
      c: {
        fnName: "rust_fiat_secp256k1_montgomery_square",
      jsonFile: "rust_fiat_secp256k1_montgomery_square.json",
      },
    },
  },

  secp256k1_dettman: {
    mul: {
      rust: {
        fnName: "rust_fiat_secp256k1_dettman_mul",
        jsonFile: "rust_fiat_secp256k1_dettman_mul_updated.json",
      },
      c: {
        fnName: "c_fiat_secp256k1_dettman_mul",
      jsonFile: "c_fiat_secp256k1_dettman_mul_ssa.json",
      },
    },
    square: {
      rust: {
        fnName: "rust_fiat_secp256k1_dettman_square",
        jsonFile: "rust_fiat_secp256k1_dettman_square.json",
      },
      c: {
        fnName: "c_fiat_secp256k1_dettman_square",
      jsonFile: "c_fiat_secp256k1_dettman_square_ssa.json",
      },
    },
  },

  secp256k1_ec: {
    mul: {
      rust: {
        fnName: "rust_ec_secp256k1_mul_inner",
        jsonFile: "rust_ec_secp256k1_mul_inner.json",
      },
      c: {
        fnName: "rust_ec_secp256k1_mul_inner",
        jsonFile: "rust_ec_secp256k1_mul_inner.json",
      },
    },
    square: {
      rust: {
        fnName: "rust_ec_secp256k1_square",
        jsonFile: "rust_ec_secp256k1_square.json",
      },
      c: {
        fnName: "rust_ec_secp256k1_square",
        jsonFile: "rust_ec_secp256k1_square.json",
      },
    },
  },

  sm2: {
    mul: {
      rust: {
        fnName: "rust_fiat_sm2_mul",
        jsonFile: "rust_fiat_sm2_mul.json",
      },
      c: {
        fnName: "rust_fiat_sm2_mul",
      jsonFile: "rust_fiat_sm2_mul.json",
      },
    },
    square: {
      rust: {
        fnName: "rust_fiat_sm2_square",
        jsonFile: "rust_fiat_sm2_square.json",
      },
      c: {
        fnName: "rust_fiat_sm2_square",
      jsonFile: "rust_fiat_sm2_square.json",
      },
    },
  },

  openssl_curve25519: {
    mul: {
      rust: {
        fnName: "open_ssl_curve25519_fe51_mul",
        jsonFile: "open_ssl_curve25519_fe51_mul_ssa.json",
      },
      c: {
        fnName: "open_ssl_curve25519_fe51_mul",
        jsonFile: "open_ssl_curve25519_fe51_mul_ssa.json",
      },
    },
    square: {
      rust: {
        fnName: "open_ssl_curve25519_fe51_square",
        jsonFile: "open_ssl_curve25519_fe51_square_ssa.json",
      },
      c: {
        fnName: "open_ssl_curve25519_fe51_square",
        jsonFile: "open_ssl_curve25519_fe51_square_ssa.json",
      }
    }
  },

  openssl_p448: {
    mul: {
      rust: {
        fnName: "openssl_p448_mul",
        jsonFile: "openssl_p448_mul_ssa.json",
      },
      c: {
        fnName: "openssl_p448_mul",
        jsonFile: "openssl_p448_mul_ssa.json",
      },
    },
    square: {
      rust: {
        fnName: "openssl_p448_square",
        jsonFile: "openssl_p448_square_ssa.json",
      },
      c: {
        fnName: "openssl_p448_square",
        jsonFile: "openssl_p448_square_ssa.json",
      }
    }
  },

  openssl_poly1305: {
    mul: {
      rust: {
        fnName: "poly1305_mul",
        jsonFile: "openssl_poly1305_mul_array_ssa.json",
      },
      c: {
        fnName: "poly1305_mul",
        jsonFile: "openssl_poly1305_mul_array_ssa.json",
      },
    },
    square: {
      rust: {
        fnName: "poly1305_mul",
        jsonFile: "openssl_poly1305_mul_array_ssa.json",
      },
      c: {
        fnName: "poly1305_mul",
        jsonFile: "openssl_poly1305_mul_array_ssa.json",
      }
    }
  },
};

/**
 * For each curve, define argwidth and bounds (same style as your other bridges).
 */
export const RUST_CURVE_DETAILS: Record<
  CURVE_T,
  { argwidth: number; bounds: string[] }
> = {
  bls12_381_p: {
    argwidth: 6,
    bounds: [
      "0xffffffffffffffff",
      "0xffffffffffffffff",
      "0xffffffffffffffff",
      "0xffffffffffffffff",
      "0xffffffffffffffff",
      "0xffffffffffffffff",
    ],
  },
  bls12_381_q: {
    argwidth: 4,
    bounds: [
      "0xffffffffffffffff",
      "0xffffffffffffffff",
      "0xffffffffffffffff",
      "0xffffffffffffffff",
      "0xffffffffffffffff",
      "0xffffffffffffffff",
    ],
  },
  curve25519: {
    argwidth: 5,
    bounds: [
      "0x18000000000000",
      "0x18000000000000",
      "0x18000000000000",
      "0x18000000000000",
      "0x18000000000000",
    ],
  },
  curve25519_dalek: {
    argwidth: 4,
    bounds: [
      "0xffffffffffffffff",
      "0xffffffffffffffff",
      "0xffffffffffffffff",
      "0xffffffffffffffff",
    ],
  },
  curve25519_solinas: {
    argwidth: 4,
    bounds: [
      "0xffffffffffffffff",
      "0xffffffffffffffff",
      "0xffffffffffffffff",
      "0xffffffffffffffff",
    ],
  },
  p224: {
    argwidth: 4,
    bounds: [
      "0xffffffffffffffff",
      "0xffffffffffffffff",
      "0xffffffffffffffff",
      "0xffffffffffffffff",
    ],
  },
  p256: {
    argwidth: 4,
    bounds: [
      "0xffffffffffffffff",
      "0xffffffffffffffff",
      "0xffffffffffffffff",
      "0xffffffffffffffff",
    ],
  },
  p384: {
    argwidth: 6,
    bounds: [
      "0xffffffffffffffff",
      "0xffffffffffffffff",
      "0xffffffffffffffff",
      "0xffffffffffffffff",
      "0xffffffffffffffff",
      "0xffffffffffffffff",
    ],
  },
  p434: {
    argwidth: 7,
    bounds: [
      "0xffffffffffffffff",
      "0xffffffffffffffff",
      "0xffffffffffffffff",
      "0xffffffffffffffff",
      "0xffffffffffffffff",
      "0xffffffffffffffff",
      "0xffffffffffffffff",
    ],
  },
  p448_solinas: {
    argwidth: 8,
    bounds: [
      "0x300000000000000",
      "0x300000000000000",
      "0x300000000000000",
      "0x300000000000000",
      "0x300000000000000",
      "0x300000000000000",
      "0x300000000000000",
      "0x300000000000000",
    ],
  },
  p521: {
    argwidth: 9,
    bounds: [
      "0xc00000000000000",
      "0xc00000000000000",
      "0xc00000000000000",
      "0xc00000000000000",
      "0xc00000000000000",
      "0xc00000000000000",
      "0xc00000000000000",
      "0xc00000000000000",
      "0x600000000000000",
    ],
  },
  poly1305: {
    argwidth: 3,
    bounds: [
      "0x300000000000",
      "0x180000000000",
      "0x180000000000",
    ],
  },
  secp256k1_montgomery: {
    argwidth: 4,
    bounds: [
      "0xffffffffffffffff",
      "0xffffffffffffffff",
      "0xffffffffffffffff",
      "0xffffffffffffffff",
    ],
  },
  secp256k1_dettman: {
    argwidth: 5,
    bounds: [
      "0x1ffffffffffffe",
      "0x1ffffffffffffe",
      "0x1ffffffffffffe",
      "0x1ffffffffffffe",
      "0x1fffffffffffe",
    ],
  },
  secp256k1_ec: {
    argwidth: 4, 
    bounds: [
      "0xffffffffffffffff",
      "0xffffffffffffffff",
      "0xffffffffffffffff",
      "0xffffffffffffffff",
    ],
  },
  sm2: {
    argwidth: 4,
    bounds: [
      "0xffffffffffffffff",
      "0xffffffffffffffff",
      "0xffffffffffffffff",
      "0xffffffffffffffff",
    ],
  },
  openssl_curve25519: {
    argwidth: 5,
    bounds: [
      "0x18000000000000",
      "0x18000000000000",
      "0x18000000000000",
      "0x18000000000000",
      "0x18000000000000",
    ],
  },
  openssl_p448: {
    argwidth: 8,
    bounds: [
      "0x300000000000000",
      "0x300000000000000",
      "0x300000000000000",
      "0x300000000000000",
      "0x300000000000000",
      "0x300000000000000",
      "0x300000000000000",
      "0x300000000000000",
    ],
  },
  openssl_poly1305: {
    argwidth: 3,
    bounds: [
      "0x3ffffffffffff",
      "0x3ffffffffffff", 
      "0x3ffffffffffff",
    ],
  },
};