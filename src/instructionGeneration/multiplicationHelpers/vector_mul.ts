/**
 * Copyright 2025 University of Adelaide
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

import { AllocationFlags, Register } from "@/enums";
import { limbify } from "@/helper";
import { RegisterAllocator } from "@/registerAllocator";
import type { asm, CryptOpt } from "@/types";

// Import the real AVX2 implementation
import { mul_vector_avx2_real } from "./vector_mul_avx2_real";

/**
 * Performs parallel multiplication of two limbs using AVX2 instructions.
 * This is a minimal implementation for curve25519 that multiplies 2 limbs in parallel.
 * 
 * For curve25519 with 5 limbs (51-bit each), we can process 2 limbs at a time:
 * - Load limbs 0,1 into one YMM register
 * - Load corresponding limbs from second operand
 * - Perform parallel multiplication
 */
export function mul_vector_avx2(c: CryptOpt.StringOperation): asm[] {
  // Use the real AVX2 implementation
  return mul_vector_avx2_real(c);
}

/**
 * Vector squaring using AVX2
 */
function mul_vector_square(
  ra: RegisterAllocator, 
  c: CryptOpt.StringOperation,
  loName: string,
  hiName: string
): asm[] {
  // For squaring, we need to load the same value twice
  const allocation = ra.allocate({
    oReg: [loName, hiName],
    in: [c.arguments[0]],
    allocationFlags: 
      AllocationFlags.DISALLOW_IMM |
      AllocationFlags.DISALLOW_MEM |
      AllocationFlags.ONE_IN_MUST_BE_IN_RDX
  });

  const [resLoR, resHiR] = allocation.oReg;
  ra.declare128(c.name[0]);

  // For now, fall back to scalar mulx for squaring
  // TODO: Implement vector squaring with vpmuludq
  return [
    ...ra.pres,
    `; Vector square fallback to scalar`,
    `mulx ${resHiR}, ${resLoR}, ${Register.rdx}; ${hiName}, ${loName}<- ${c.arguments[0]}^2`,
  ];
}

/**
 * Vector multiplication using AVX2
 */
function mul_vector_multiply(
  ra: RegisterAllocator,
  c: CryptOpt.StringOperation,
  loName: string,
  hiName: string
): asm[] {
  // For multiplication a * b, we'll use vpmuludq for parallel multiplication
  // Strategy: Load two 64-bit values, multiply them to get 128-bit result
  
  // First, allocate registers for the operation
  const allocation = ra.allocate({
    oReg: [loName, hiName],
    in: c.arguments,
    allocationFlags:
      AllocationFlags.DISALLOW_IMM |
      AllocationFlags.DISALLOW_XMM |
      AllocationFlags.ONE_IN_MUST_BE_IN_RDX
  });

  const [resLoR, resHiR] = allocation.oReg;
  const [arg0R, arg1R] = allocation.in;
  
  ra.declare128(c.name[0]);

  // For now, we'll use scalar mulx but with vector-ready structure
  // In a full implementation, we'd load multiple limbs and process in parallel
  const instructions: asm[] = [
    ...ra.pres,
    `; Vector multiplication using AVX2 (single limb version)`,
  ];

  // Determine which argument is in rdx
  const argNotInRdx = arg0R === Register.rdx ? arg1R : arg0R;
  
  // Use scalar mulx for now (this is what works with current infrastructure)
  instructions.push(
    `mulx ${resHiR}, ${resLoR}, ${argNotInRdx}; ${hiName}, ${loName}<- ${c.arguments[0]} * ${c.arguments[1]}`
  );

  return instructions;
}

/**
 * Future implementation for true AVX2 parallel multiplication
 * This shows the target implementation we're working towards
 */
export function mul_vector_avx2_parallel_limbs(
  limbs_a: string[],
  limbs_b: string[],
  output: string[]
): asm[] {
  // This is a placeholder for the full implementation
  // It would:
  // 1. Load 4 limbs from each operand into YMM registers
  // 2. Use vpmuludq to multiply pairs in parallel
  // 3. Handle carry propagation with vector adds
  // 4. Store results back to memory
  
  return [
    `; Parallel limb multiplication using AVX2`,
    `; vmovdqu ymm0, [limbs_a]     ; Load 4 limbs from a`,
    `; vmovdqu ymm1, [limbs_b]     ; Load 4 limbs from b`,
    `; vpmuludq ymm2, ymm0, ymm1   ; Multiply low pairs`,
    `; vpsrlq ymm3, ymm0, 32       ; Shift for high parts`,
    `; vpsrlq ymm4, ymm1, 32       ; Shift for high parts`,
    `; vpmuludq ymm5, ymm3, ymm4   ; Multiply high pairs`,
    `; ... carry propagation ...`,
  ];
}