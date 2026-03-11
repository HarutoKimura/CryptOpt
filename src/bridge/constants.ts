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

import { CURVE_T as FIAT_CURVE_T, METHOD_T } from "./fiat-bridge";
import { CURVE_T as RUST_CURVE_T } from "./rust-bridge/constants";

// Create unified type that includes both fiat and rust bridge curves
export type CURVE_T = FIAT_CURVE_T | RUST_CURVE_T;

export const BRIDGES = ["fiat", "jasmin", "bitcoin-core", "manual", "llvm-bitcoin-core", "rust"] as const;
export type BRIDGES_T = (typeof BRIDGES)[number];

// currently used only in src/CountCycle
export const KNOWN_SYMBOLS: {
  [symbol: string]: { bridge: "fiat" | "bitcoin-core" | "llvm-bitcoin-core" | "rust"; method: METHOD_T; curve: CURVE_T; language?: "rust" | "c"};
} = {
  // fiat generated bls curves
  fiat_bls12_381_p_mul: { bridge: "fiat", method: "mul", curve: "bls12_381_p" },
  fiat_bls12_381_p_square: { bridge: "fiat", method: "square", curve: "bls12_381_p" },
  fiat_bls12_381_q_mul: { bridge: "fiat", method: "mul", curve: "bls12_381_q" },
  fiat_bls12_381_q_square: { bridge: "fiat", method: "square", curve: "bls12_381_q" },

  // fiat default curves
  fiat_curve25519_carry_mul: { bridge: "fiat", method: "mul", curve: "curve25519" },
  fiat_curve25519_carry_square: { bridge: "fiat", method: "square", curve: "curve25519" },
  fiat_curve25519_solinas_mul: { bridge: "fiat", method: "mul", curve: "curve25519_solinas" },
  /* currently not supported
   * fiat_curve25519_solinas_mul2: { bridge: "fiat", method: "mul2", curve: "curve25519_solinas" },
   */
  fiat_curve25519_solinas_square: { bridge: "fiat", method: "square", curve: "curve25519_solinas" },
  fiat_p224_mul: { bridge: "fiat", method: "mul", curve: "p224" },
  fiat_p224_square: { bridge: "fiat", method: "square", curve: "p224" },
  fiat_p256_mul: { bridge: "fiat", method: "mul", curve: "p256" },
  fiat_p256_square: { bridge: "fiat", method: "square", curve: "p256" },
  fiat_p384_mul: { bridge: "fiat", method: "mul", curve: "p384" },
  fiat_p384_square: { bridge: "fiat", method: "square", curve: "p384" },
  fiat_p434_mul: { bridge: "fiat", method: "mul", curve: "p434" },
  fiat_p434_square: { bridge: "fiat", method: "square", curve: "p434" },
  fiat_p448_solinas_carry_mul: { bridge: "fiat", method: "mul", curve: "p448_solinas" },
  fiat_p448_solinas_carry_square: { bridge: "fiat", method: "square", curve: "p448_solinas" },
  fiat_p521_carry_mul: { bridge: "fiat", method: "mul", curve: "p521" },
  fiat_p521_carry_square: { bridge: "fiat", method: "square", curve: "p521" },
  fiat_poly1305_carry_mul: { bridge: "fiat", method: "mul", curve: "poly1305" },
  fiat_poly1305_carry_square: { bridge: "fiat", method: "square", curve: "poly1305" },
  fiat_secp256k1_montgomery_mul: { bridge: "fiat", method: "mul", curve: "secp256k1_montgomery" },
  fiat_secp256k1_montgomery_square: { bridge: "fiat", method: "square", curve: "secp256k1_montgomery" },
  fiat_secp256k1_dettman_mul: { bridge: "fiat", method: "mul", curve: "secp256k1_dettman" },
  fiat_secp256k1_dettman_square: { bridge: "fiat", method: "square", curve: "secp256k1_dettman" },

  // bitcoin curve for bitcoin-core, llvm-bitcoin-corem and rust
  secp256k1_fe_mul_inner: { bridge: "bitcoin-core" , method: "mul", curve: "secp256k1_dettman" },
  secp256k1_fe_sqr_inner: { bridge: "bitcoin-core" , method: "square", curve: "secp256k1_dettman" },

  // rust generated bls curves
  bls12_mul: { bridge: "rust", method: "mul", curve: "bls12_381_p"}, // done
  bls12_square: { bridge: "rust", method: "square", curve: "bls12_381_p"}, 
  
  rust_fiat_curve25519_carry_mul: { bridge: "rust", method: "mul", curve: "curve25519"}, // done
  rust_fiat_curve25519_carry_square: { bridge: "rust", method: "square", curve: "curve25519"}, 

  rust_fiat_curve25519_solinas_mul: { bridge: "rust", method: "mul", curve: "curve25519_solinas"}, // runnanble but not good
  rust_fiat_curve25519_solinas_square: { bridge: "rust", method: "square", curve: "curve25519_solinas"}, // runnanble but not good

  rust_fiat_p224_mul: { bridge: "rust", method: "mul", curve: "p224"},
  rust_fiat_p224_square: { bridge: "rust", method: "square", curve: "p224"},

  rust_fiat_p256_mul: { bridge: "rust", method: "mul", curve: "p256"},
  rust_fiat_p256_square: { bridge: "rust", method: "square", curve: "p256"},

  rust_fiat_p384_mul: { bridge: "rust", method: "mul", curve: "p384"},
  rust_fiat_p384_square: { bridge: "rust", method: "square", curve: "p384"},

  rust_fiat_p434_mul: { bridge: "rust", method: "mul", curve: "p434"},
  rust_fiat_p434_square: { bridge: "rust", method: "square", curve: "p434"},

  rust_fiat_p448_solinas_carry_mul: { bridge: "rust", method: "mul", curve: "p448_solinas"}, //done
  rust_fiat_p448_solinas_carry_square: { bridge: "rust", method: "square", curve: "p448_solinas"},

  rust_fiat_p521_mul: { bridge: "rust", method: "mul", curve: "p521"}, //done
  rust_fiat_p521_square: { bridge: "rust", method: "square", curve: "p521"}, 

  rust_fiat_poly1305_carry_mul: { bridge: "rust", method: "mul", curve: "poly1305"}, //done
  rust_fiat_poly1305_carry_square: { bridge: "rust", method: "square", curve: "poly1305"},

  rust_fiat_secp256k1_montgomery_mul: { bridge: "rust", method: "mul", curve: "secp256k1_montgomery"}, 
  rust_fiat_secp256k1_montgomery_square: { bridge: "rust", method: "square", curve: "secp256k1_montgomery"},

  rust_fiat_secp256k1_dettman_mul: { bridge: "rust", method: "mul", curve: "secp256k1_dettman"}, //done
  rust_fiat_secp256k1_dettman_square: { bridge: "rust", method: "square", curve: "secp256k1_dettman"},

  // // new curve after CryptOpt publication
  // rust_fiat_sm2_mul: { bridge: "rust", method: "mul", curve: "sm2"},
  // rust_fiat_sm2_square: { bridge: "rust", method: "square", curve: "sm2"},
  // rust_bls12_381_q_mul: {bridge: "rust", method: "mul", curve: "bls12_381_q"},
  // rust_bls12_381_q_square: {bridge: "rust", method: "square", curve: "bls12_381_q"},

  // OpenSSL curve25519 functions (C implementation)
  open_ssl_curve25519_fe51_mul: { bridge: "rust", method: "mul", curve: "openssl_curve25519", language: "c"},
  open_ssl_curve25519_fe51_square: { bridge: "rust", method: "square", curve: "openssl_curve25519", language: "c"},

  // C-generated curve25519
  c_fiat_curve25519_carry_mul: { bridge: "rust", method: "mul", curve: "curve25519", language: "c" },
  c_fiat_curve25519_carry_square: { bridge: "rust", method: "square", curve: "curve25519", language: "c" },

  // C-generated p448
  c_fiat_p448_carry_mul: { bridge: "rust", method: "mul", curve: "p448_solinas", language: "c" },
  c_fiat_p448_carry_square: { bridge: "rust", method: "square", curve: "p448_solinas", language: "c" },

  // C-generated poly1305
  c_fiat_poly1305_carry_mul: { bridge: "rust", method: "mul", curve: "poly1305", language: "c" },
  c_fiat_poly1305_carry_square: { bridge: "rust", method: "square", curve: "poly1305", language: "c" },

  // C-generated secp256k1_dettman
  c_fiat_secp256k1_dettman_mul: { bridge: "rust", method: "mul", curve: "secp256k1_dettman", language: "c" },
  c_fiat_secp256k1_dettman_square: { bridge: "rust", method: "square", curve: "secp256k1_dettman", language: "c" },

  // OpenSSL p448 (C implementation)
  openssl_p448_mul: { bridge: "rust", method: "mul", curve: "openssl_p448", language: "c" },
  openssl_p448_square: { bridge: "rust", method: "square", curve: "openssl_p448", language: "c" },

  // rust-ec secp256k1
  rust_ec_secp256k1_mul_inner: { bridge: "rust", method: "mul", curve: "secp256k1_ec" },
  rust_ec_secp256k1_square: { bridge: "rust", method: "square", curve: "secp256k1_ec" },

  // curve25519_dalek (uses generic "mul" and "square" names)
  mul: { bridge: "rust", method: "mul", curve: "curve25519_dalek" },
  square: { bridge: "rust", method: "square", curve: "curve25519_dalek" },
};
