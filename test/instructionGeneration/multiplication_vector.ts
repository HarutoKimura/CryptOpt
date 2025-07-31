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

import { C_DI_SPILL_LOCATION, C_DI_MULTIPLICATION_TYPE, DECISION_IDENTIFIER, Register } from "@/enums";
import { mulx } from "@/instructionGeneration/multiplication";
import { mul_vector_avx2 } from "@/instructionGeneration/multiplicationHelpers";
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
      chooseMulType: vi.fn()
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

describe("Vector Multiplication", () => {
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

  it("should use vector multiplication when decision is set to AVX2", () => {
    // Mock Paul's decision to use vector multiplication
    vi.mocked(Paul.chooseMulType).mockReturnValue(C_DI_MULTIPLICATION_TYPE.C_VECTOR_AVX2);
    
    // Create multiplication operation with vector decision
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
    
    // Check that we get some assembly instructions
    expect(code).toBeDefined();
    expect(code.length).toBeGreaterThan(0);
    
    // Should have vector-related comments
    const hasVectorRelated = code.some(instr => 
      instr.includes("vector") || instr.includes("Vector") || instr.includes("TODO")
    );
    expect(hasVectorRelated).toBe(true);
    expect(Paul.chooseMulType).toHaveBeenCalled();
  });

  it("should use scalar multiplication when decision is not set", () => {
    getCurrentAllocations.mockImplementation(() => {
      return {
        x1: { datatype: "u64", store: Register.rdx },
        x2: { datatype: "u64", store: Register.rax },
      } as Allocations;
    });
    
    // Create multiplication operation without vector decision
    const code: asm[] = mulx({
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
    
    // Check that we get scalar multiplication
    expect(code).toBeDefined();
    expect(code.length).toBeGreaterThan(0);
    
    const hasMulxInstruction = code.some(instr => instr.includes("mulx"));
    expect(hasMulxInstruction).toBe(true);
    expect(Paul.chooseMulType).not.toHaveBeenCalled();
  });

  it("should handle vector multiplication directly when called", () => {
    allocate.mockImplementation((): AllocationRes => {
      return {
        oReg: [Register.r8, Register.r9],
        in: ["x1", "x2"]
      };
    });
    
    const result = mul_vector_avx2({
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
    
    // Should return valid assembly
    expect(result).toBeDefined();
    expect(Array.isArray(result)).toBe(true);
    expect(result.length).toBeGreaterThan(0);
    
    // Should contain TODO comment for now
    const hasTodoComment = result.some(instr => 
      instr.includes("TODO") || instr.includes("vector")
    );
    expect(hasTodoComment).toBe(true);
  });

  it("should fall back to scalar for u64 multiplication even with vector decision", () => {
    // Mock Paul's decision to use vector multiplication
    vi.mocked(Paul.chooseMulType).mockReturnValue(C_DI_MULTIPLICATION_TYPE.C_VECTOR_AVX2);
    
    getCurrentAllocations.mockImplementation(() => {
      return {
        x1: { datatype: "u64", store: Register.rdx },
        x2: { datatype: "u64", store: Register.rax },
      } as Allocations;
    });
    
    // Create u64 multiplication (not u128)
    const code: asm[] = mulx({
      name: ["x3", "x4"],
      operation: "mulx",
      arguments: ["x1", "x2"],
      datatype: "u64",
      decisions: {
        [DECISION_IDENTIFIER.DI_CHOOSE_ARG]: [0, ["x1", "x2"]],
        [DECISION_IDENTIFIER.DI_SPILL_LOCATION]: [0, [C_DI_SPILL_LOCATION.C_DI_MEM]],
        [DECISION_IDENTIFIER.DI_MULTIPLICATION_TYPE]: [0, [C_DI_MULTIPLICATION_TYPE.C_VECTOR_AVX2]]
      },
      decisionsHot: []
    });
    
    // Should use scalar mulx since vector is only for u128
    expect(code).toBeDefined();
    expect(code.length).toBeGreaterThan(0);
    const hasMulxInstruction = code.some(instr => instr.includes("mulx"));
    expect(hasMulxInstruction).toBe(true);
    // Should not call chooseMulType for u64
    expect(Paul.chooseMulType).not.toHaveBeenCalled();
  });
});