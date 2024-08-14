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

export type METHOD_T = (typeof AVAILABLE_METHODS)[number];

export const AVAILABLE_METHODS = ["square", "mul"] as const;

export const METHOD_DETAILS: {
  [f in METHOD_T]: {
    name: string;
  };
} = {
  mul: {
    // the operation 'multiply' is called fe_mul_inner in the library
    name: "bls12_mul",
  },
  square: {
    name: "bls12_square",
  },
};

// export type CURVE_T = (typeof AVAILABLE_CURVES)[number];
// export type METHOD_T = (typeof AVAILABLE_METHODS)[number];

// export const AVAILABLE_CURVES = [
//   "bls12_381_p",
//   "bls12_381_q",
//   "secp256k1_dettman",
// ] as const;

// export const AVAILABLE_METHODS = ["square", "mul"] as const;

// export const METHOD_DETAILS: {
//   [f in METHOD_T]: {
//     name: string;
//   };
// } = {
//   mul: {
//     name: "mul",
//   },
//   square: {
//     name: "square",
//   }
// };

// export const RUST_CURVE_DETAILS: {
//   [curve in CURVE_T]: {
//     bitwidth: number;
//     argwidth: number;
//     prime: string;
//     bounds: string[];
//     last_limbwidth?: number; // only used in dettman
//     last_reduction?: number; // only used in dettman
//   };
// } = {
//   // https://github.com/zkcrypto/bls12_381#curve-description
//   bls12_381_p: {
//     argwidth: 6,
//     bitwidth: 64,
//     prime:
//       // z = -0xd201000000010000
//       // p = (z - 1)^2 (z^4 - z^2 + 1) / 3 + z
//       "(-0xd201000000010000 -1)^2 * ((-0xd201000000010000)^4 - (-0xd201000000010000)^2 + 1)/3 + (-0xd201000000010000)",
//     bounds: [
//       "0xffffffffffffffff",
//       "0xffffffffffffffff",
//       "0xffffffffffffffff",
//       "0xffffffffffffffff",
//       "0xffffffffffffffff",
//       "0xffffffffffffffff",
//     ],
//   },
//   bls12_381_q: {
//     argwidth: 4,
//     bitwidth: 64,
//     // z = -0xd201000000010000
//     // q = z^4 - z^2 + 1
//     prime: "(-0xd201000000010000)^4 -(-0xd201000000010000)^2 + 1",
//     bounds: ["0xffffffffffffffff", "0xffffffffffffffff", "0xffffffffffffffff", "0xffffffffffffffff"],
//   },

//   // /tmp/dettman_multiplication dettman 64 5 52 '2^256 - 4294968273' 1 mul --hints-file ${f} --no-wide-int --output-asm /dev/null --output /dev/null && echo $f ok
//   secp256k1_dettman: {
//     argwidth: 5,
//     bitwidth: 64,
//     last_limbwidth: 48,
//     last_reduction: 2,
//     prime: "2^256 - 4294968273",
//     bounds: [
//       "0x1ffffffffffffe",
//       "0x1ffffffffffffe",
//       "0x1ffffffffffffe",
//       "0x1ffffffffffffe",
//       "0x1fffffffffffe",
//     ],
//   },
// };