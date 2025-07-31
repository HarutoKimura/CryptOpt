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

import { BRIDGES_T } from "@/bridge";
import { METHOD_T } from "@/bridge/bitcoin-core-bridge";
import { CURVE_T } from "@/bridge/fiat-bridge";
import { LANGUAGE_T } from "@/bridge/rust-bridge";
import { FRAME_POINTER_OPTIONS_T, MEMORY_CONSTRAINTS_OPTIONS_T } from "@/types";

export const MUTATION_MODE_OPTIONS = ["both", "schedule-only", "template-only"] as const;
export type MUTATION_MODE_OPTIONS_T = typeof MUTATION_MODE_OPTIONS[number];

export type OptimizerArgs = {
  evals: number;
  seed: number;
  curve: CURVE_T;
  method: METHOD_T;
  cyclegoal: number;
  readState?: string; // filename
  logComment: string;
  proof: boolean;
  verbose: boolean;
  bridge: BRIDGES_T;
  cFile?: string;
  jsonFile?: string;
  resultDir: string;
  xmm?: boolean;
  redzone: boolean;
  preferXmm?: boolean;
  framePointer: FRAME_POINTER_OPTIONS_T;
  memoryConstraints: MEMORY_CONSTRAINTS_OPTIONS_T;
  language?: LANGUAGE_T; // For rust-bridge to select between C and Rust
  mutationMode: MUTATION_MODE_OPTIONS_T;
  scheduleRatio: number; // 0-100: percentage of mutations that should be schedule mutations
  quotaMode: "execution" | "success"; // Controls whether scheduleRatio applies to executed or successful mutations
};
export type ParsedArgsT = OptimizerArgs & {
  startFromBestJson: boolean;
  single: boolean;
  bets: number;
  betRatio: number;
  forceVector: boolean;
};
