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

export interface MutationOrderEntry {
  phase: 'bet' | 'run';
  index: number;
  type: 'Permutation' | 'Decision';
  deltaScore: number; // Signed performance delta vs. previous state
  evalNumber: number;
}

export interface PhaseStats {
  phaseType: 'bet' | 'run';
  betIndex?: number; // Only for bet phases
  seed: string;
  startEvaluation: number;
  endEvaluation: number;
  mutations: {
    permutation: number;
    decision: number;
    permutationKept: number;
    decisionKept: number;
    decisionToPermutationFallbacks: number;
  };
  randomInputsConsumed: number;
  convergence: string[];
  finalRatio: number;
  mutationDetails: MutationOrderEntry[];
}

export interface CryptoptGlobals {
  currentRatio: number;
  convergence: string[]; // numbers, but .toFixed(4)
  time: {
    // in seconds
    validate: number;
    generateFiat: number;
    generateCryptopt: number;
  };
  mutationLog: string[]; // csv-parts (numEval, choice, kept)
  
  // New fields for enhanced logging
  mutationOrder: MutationOrderEntry[];
  phaseStats: PhaseStats[];
  randomInputsPerMutation: Map<number, number>; // evalNumber -> count
  totalRandomInputsConsumed: number;
}
