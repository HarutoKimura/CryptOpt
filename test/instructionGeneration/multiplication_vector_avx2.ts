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

/* eslint-disable @typescript-eslint/no-non-null-assertion */
import { afterAll, beforeEach, describe, expect, it, vi } from "vitest";

import { C_DI_SPILL_LOCATION, C_DI_MULTIPLICATION_TYPE, DECISION_IDENTIFIER, Register, XmmRegister } from "@/enums";
import { mulx } from "@/instructionGeneration/multiplication";
import { mul_vector_avx2_real } from "@/instructionGeneration/multiplicationHelpers";
import type { AllocationReq, AllocationRes, Allocations, asm } from "@/types";

import { nothing } from "../test-helpers";

const mockLog = vi.spyOn(console, "log").mockImplementation(nothing);
const allocate = vi.fn();
const getCurrentAllocations = vi.fn();
const declare128 = vi.fn();
const declareFlagState = vi.fn();
const addToPreInstructions = vi.fn();

// Mock Paul for decision making
vi.mock("@/paul", () => {
  return {
    Paul: {
      chooseMulType: vi.fn().mockReturnValue(C_DI_MULTIPLICATION_TYPE.C_VECTOR_AVX2)
    }
  };
});

import { Paul } from "@/paul";

vi.mock("@/registerAllocator/RegisterAllocator.class.ts", () => {
  return {
    RegisterAllocator: {
      getInstance: () => {
        return {
          declare128,
          allocate,
          getCurrentAllocations,
          declareFlagState,
          addToPreInstructions,
          pres: [],
          initNewInstruction: () => {
            /**intentionally empty */
          },
        };
      },
      xmm2reg: vi.fn().mockReturnValue({ store: Register.rax }),
    },
  };
});

describe("Vector Multiplication AVX2 Real Implementation", () => {
  const ALLOC_MOCK_RETURN = {
    oReg: [Register.r8, Register.r9],
    in: [Register.rdx, Register.rax],
  };

  beforeEach(() => {
    vi.clearAllMocks();
    allocate.mockImplementation(() => ALLOC_MOCK_RETURN);
    getCurrentAllocations.mockImplementation(() => ({} as Allocations));
  });

  afterAll(() => {
    mockLog.mockRestore();
  });

  it("should generate real AVX2 instructions for multiplication", () => {
    const code: asm[] = mul_vector_avx2_real({
      name: ["x3"],
      operation: "mulx",
      arguments: ["x1", "x2"],
      datatype: "u128",
      decisions: {
        [DECISION_IDENTIFIER.DI_CHOOSE_ARG]: [0, ["x1", "x2"]],
        [DECISION_IDENTIFIER.DI_SPILL_LOCATION]: [0, [C_DI_SPILL_LOCATION.C_DI_MEM]]
      },
      decisionsHot: []
    });
    
    // Check that we get AVX2 instructions
    expect(code).toBeDefined();
    expect(code.length).toBeGreaterThan(0);
    
    // Should contain AVX2 instructions
    const hasAVX2Instructions = code.some(instr => 
      instr.includes("vmovq") || 
      instr.includes("vpmuludq") || 
      instr.includes("vpsrlq") ||
      instr.includes("vpaddq") ||
      instr.includes("vpextrq")
    );
    expect(hasAVX2Instructions).toBe(true);
    
    // Should contain vector multiplication comment
    const hasVectorComment = code.some(instr => 
      instr.includes("AVX2 vector multiplication")
    );
    expect(hasVectorComment).toBe(true);
  });

  it("should generate AVX2 instructions for squaring", () => {
    const code: asm[] = mul_vector_avx2_real({
      name: ["x3"],
      operation: "mulx",
      arguments: ["x1", "x1"], // Square
      datatype: "u128",
      decisions: {
        [DECISION_IDENTIFIER.DI_CHOOSE_ARG]: [0, ["x1", "x1"]],
        [DECISION_IDENTIFIER.DI_SPILL_LOCATION]: [0, [C_DI_SPILL_LOCATION.C_DI_MEM]]
      },
      decisionsHot: []
    });
    
    // Check for squaring-specific instructions
    expect(code).toBeDefined();
    expect(code.length).toBeGreaterThan(0);
    
    const hasSquareComment = code.some(instr => 
      instr.includes("AVX2 vector square")
    );
    expect(hasSquareComment).toBe(true);
  });

  it("should handle XMM register inputs", () => {
    // Mock allocation to return XMM registers
    allocate.mockImplementation((): AllocationRes => {
      return {
        oReg: [Register.r8, Register.r9],
        in: [XmmRegister.xmm0, Register.rax]
      };
    });
    
    const code: asm[] = mul_vector_avx2_real({
      name: ["x3"],
      operation: "mulx",
      arguments: ["x1", "x2"],
      datatype: "u128",
      decisions: {
        [DECISION_IDENTIFIER.DI_CHOOSE_ARG]: [0, ["x1", "x2"]],
        [DECISION_IDENTIFIER.DI_SPILL_LOCATION]: [0, [C_DI_SPILL_LOCATION.C_DI_XMM_REG]]
      },
      decisionsHot: []
    });
    
    // Should use XMM register directly without loading
    const hasDirectXMMUse = code.some(instr => 
      instr.includes("xmm0") && instr.includes("vpmuludq")
    );
    expect(hasDirectXMMUse).toBe(true);
  });

  it("should work through mulx function with vector decision", () => {
    // Mock Paul's decision to use vector multiplication
    vi.mocked(Paul.chooseMulType).mockReturnValue(C_DI_MULTIPLICATION_TYPE.C_VECTOR_AVX2);
    
    const code: asm[] = mulx({
      name: ["x3"],
      operation: "mulx",
      arguments: ["x1", "x2"],
      datatype: "u128",
      decisions: {
        [DECISION_IDENTIFIER.DI_CHOOSE_ARG]: [0, ["x1", "x2"]],
        [DECISION_IDENTIFIER.DI_SPILL_LOCATION]: [0, [C_DI_SPILL_LOCATION.C_DI_MEM]],
        [DECISION_IDENTIFIER.DI_MULTIPLICATION_TYPE]: [0, [C_DI_MULTIPLICATION_TYPE.C_VECTOR_AVX2]]
      },
      decisionsHot: []
    });
    
    // Should generate AVX2 instructions through the full pipeline
    expect(code).toBeDefined();
    expect(code.length).toBeGreaterThan(0);
    
    const hasAVX2 = code.some(instr => 
      instr.includes("vmovq") || 
      instr.includes("vpmuludq") ||
      instr.includes("AVX2")
    );
    expect(hasAVX2).toBe(true);
    expect(Paul.chooseMulType).toHaveBeenCalled();
  });
});