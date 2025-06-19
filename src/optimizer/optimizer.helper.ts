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

import { cpus, hostname } from "os";

import { CHOICE } from "@/enums";
import { bl, cy, env, gn, pu, rd, re, shouldProof, SI, yl } from "@/helper";
import globals from "@/helper/globals";
import { Model } from "@/model";
import type { AnalyseResult, OptimizerArgs } from "@/types";

const { CC, CFLAGS } = env;

export function genStatusLine(a: {
  writeout: boolean;
  logComment: string;
  symbolname: string;
  stacklength: number;
  batchSize: number;
  no_of_instructions: number;
  analyseResult: AnalyseResult;
  indexGood: number;
  indexBad: number;
  goodChunks: number;
  badChunks: number;
  choice: CHOICE;
  kept: boolean;
  numEvals: number;
  evals: number;
  ratioString: string;
  show_per_second: string;
}): string {
  const cyclDeltaR = Math.abs(a.analyseResult.rawMedian[0] - a.analyseResult.rawMedian[1])
    .toString()
    .padStart(6);

  return [
    // general
    `${a.writeout ? "\n" : "\r"}${a.symbolname}`,
    `${a.logComment ?? "-"}`,
    `${bl}${a.stacklength.toString().padStart(3)}${re}`,
    `${cy}bs${a.batchSize.toString().padStart(5)}${re}`,
    `#inst:${cy}${a.no_of_instructions.toString().padStart(4)}${re}`,
    `cyclΔ ${gn}${cyclDeltaR}${re}`,

    // good
    `${yl}G ${a.analyseResult.batchSizeScaledrawMedian[a.indexGood].toFixed(0).padStart(3)} cycl` +
      // ` cnks${a.goodChunks.toString().padStart(3)}` +
      ` ${cy}σ${a.analyseResult.batchSizeScaledrawStddev[a.indexGood].toFixed(0).padStart(3)}${yl}`,
    // ` o${a.analyseResult.numOutliers[a.indexGood].toString().padStart(2)}/nb${ a.analyseResult.numBatches[a.indexGood] }${re}`,
    // `${analyseResult.rawResult.stats.virtualAddressA}${re}`,

    // bad
    `${rd}B ${a.analyseResult.batchSizeScaledrawMedian[a.indexBad].toFixed(0).padStart(3)} cycl` +
      // ` cnks${a.badChunks.toString().padStart(3)}` +
      ` ${cy}σ${a.analyseResult.batchSizeScaledrawStddev[a.indexBad].toFixed(0).padStart(3)}${rd}`,
    // ` o${a.analyseResult.numOutliers[a.indexBad].toString().padStart(2)}/nb${ a.analyseResult.numBatches[a.indexBad] }${re}`,
    // `${analyseResult.rawResult.stats.virtualAddressB}${re}`,

    // lib
    `${pu}L ${a.analyseResult.batchSizeScaledrawMedian[2].toFixed(0).padStart(3)}${re}`,
    `${a.ratioString[0] === "0" ? rd : gn}l/g ${bl}${a.ratioString.padStart(6)}${re}`,

    `${bl}${a.choice}${re}`,
    `${cy}${Model.permutationStats}${re}`,
    `${cy}${Model.decisionStats}${re}`,
    `${a.kept ? gn : rd}${SI(a.numEvals)}(${((100 * a.numEvals) / a.evals).toFixed(0).padStart(2)}%)` +
      `${pu}${a.show_per_second}${re}`,
  ].join("|");
}

export function genStatistics(a: {
  paddedSeed: string;
  ratioString: string;
  evals: number;
  elapsed: number;
  batchSize: number;
  numBatches: number;
  acc: number;
  numRevert: { [k: string]: number };
  numMut: { [k: string]: number };
  counter: string;
  framePointer: string;
  memoryConstraints: string;
  cyclegoal: number;
  mutationTracking?: {
    actualPermutation: number;
    actualDecision: number;
    decisionToPermutationFallbacks: number;
    permutationKept: number;
    decisionKept: number;
    permutationReverted: number;
    decisionReverted: number;
    targetPermutations: number;
    targetDecisions: number;
    permutationQuotaReached: boolean;
    decisionQuotaReached: boolean;
    exclusiveMode: boolean;
    exclusiveModeType: CHOICE | null;
  };
  scheduleRatio?: number;
}): string[] {
  const baseStats = [
    `; cpu ${cpus()[0].model}`,
    `; ratio ${a.ratioString}`,
    `; seed ${a.paddedSeed} `,
    `; CC / CFLAGS ${CC} / ${CFLAGS} `,
    `; cyclegoal; ${a.cyclegoal}`,
    `; using counter; ${a.counter}`,
    `; framePointer ${a.framePointer}`,
    `; memoryConstraints ${a.memoryConstraints}`,
    `; time needed: ${a.elapsed} ms on ${a.evals} evaluations.`,
    `; Time spent for assembling and measuring (initial batch_size=${a.batchSize}, initial num_batches=${a.numBatches}): ${a.acc} ms`,
    `; number of used evaluations: ${a.evals}`,
    `; Ratio (time for assembling + measure)/(total runtime for ${a.evals} evals): ${a.acc / a.elapsed}`,
  ];

  // Original stats for backward compatibility
  const originalStats = ["permutation", "decision"].map((key) => {
      const r = ((a.numRevert[key] / a.numMut[key]) * 100).toFixed(3);
      return `; number reverted ${key} / tried ${key}: ${a.numRevert[key]} / ${a.numMut[key]} =${r}%`;
  });

  // Enhanced mutation tracking stats - focus on ACTUAL mutations
  const enhancedStats: string[] = [];
  if (a.mutationTracking && a.scheduleRatio !== undefined) {
    const totalActualMutations = a.mutationTracking.actualPermutation + a.mutationTracking.actualDecision;
    const totalEvaluated = a.evals - 1; // Subtract 1 for the initial evaluation

    // ACTUAL mutation ratios (this is what really happened)
    const actualPermutationRatio = totalActualMutations > 0 ? (a.mutationTracking.actualPermutation / totalActualMutations * 100).toFixed(1) : "0.0";
    const actualDecisionRatio = totalActualMutations > 0 ? (a.mutationTracking.actualDecision / totalActualMutations * 100).toFixed(1) : "0.0";

    // Fallback impact analysis
    const totalPermutationsIncludingFallbacks = a.mutationTracking.actualPermutation;
    const originalPermutations = totalPermutationsIncludingFallbacks - a.mutationTracking.decisionToPermutationFallbacks;
    const fallbackImpactOnRatio = totalActualMutations > 0 ? 
      (a.mutationTracking.decisionToPermutationFallbacks / totalActualMutations * 100).toFixed(1) : "0.0";

    // Success rates (kept mutations)
    const permutationSuccessRate = a.mutationTracking.actualPermutation > 0 ? 
      (a.mutationTracking.permutationKept / a.mutationTracking.actualPermutation * 100).toFixed(1) : "0.0";
    const decisionSuccessRate = a.mutationTracking.actualDecision > 0 ? 
      (a.mutationTracking.decisionKept / a.mutationTracking.actualDecision * 100).toFixed(1) : "0.0";

    // Ratio deviation from target
    const targetPermutationRatio = a.scheduleRatio;
    const actualPermutationRatioNum = parseFloat(actualPermutationRatio);
    const ratioDeviation = (actualPermutationRatioNum - targetPermutationRatio).toFixed(1);
    const deviationSign = parseFloat(ratioDeviation) >= 0 ? "+" : "";

    // Quota system analysis
    const permutationQuotaProgress = `${a.mutationTracking.actualPermutation}/${a.mutationTracking.targetPermutations}`;
    const decisionQuotaProgress = `${a.mutationTracking.actualDecision}/${a.mutationTracking.targetDecisions}`;
    const permutationQuotaAchieved = a.mutationTracking.actualPermutation >= a.mutationTracking.targetPermutations;
    const decisionQuotaAchieved = a.mutationTracking.actualDecision >= a.mutationTracking.targetDecisions;
    const bothQuotasAchieved = permutationQuotaAchieved && decisionQuotaAchieved;

    enhancedStats.push(
      `;`,
      `; === DETERMINISTIC QUOTA SYSTEM ===`,
      `; Target Schedule Ratio: ${a.scheduleRatio}% permutation, ${100 - a.scheduleRatio}% decision`,
      `; Total Evaluations: ${totalEvaluated} (excluding initial)`,
      `; Total Actual Mutations: ${totalActualMutations}`,
      `;`,
      `; QUOTA TARGETS:`,
      `;   Permutation Target: ${a.mutationTracking.targetPermutations}`,
      `;   Decision Target:    ${a.mutationTracking.targetDecisions}`,
      `;`,
      `; ACTUAL EXECUTED MUTATIONS:`,
      `;   Permutation: ${a.mutationTracking.actualPermutation} (${actualPermutationRatio}%) [${permutationQuotaProgress}] ${permutationQuotaAchieved ? '✓' : '○'}`,
      `;   Decision:    ${a.mutationTracking.actualDecision} (${actualDecisionRatio}%) [${decisionQuotaProgress}] ${decisionQuotaAchieved ? '✓' : '○'}`,
      `;`,
      `; QUOTA STATUS:`,
      `;   Permutation Quota: ${permutationQuotaAchieved ? 'ACHIEVED' : 'IN PROGRESS'}`,
      `;   Decision Quota:    ${decisionQuotaAchieved ? 'ACHIEVED' : 'IN PROGRESS'}`,
      `;   Exclusive Mode:    ${a.mutationTracking.exclusiveMode ? 'ACTIVE' : 'INACTIVE'}`,
      `;   Both Quotas Met:   ${bothQuotasAchieved ? 'YES' : 'NO'}`,
      `;`,
      `; RATIO ANALYSIS:`,
      `;   Target vs Actual: ${targetPermutationRatio}% → ${actualPermutationRatio}% (${deviationSign}${ratioDeviation}% deviation)`,
      `;   Fallback Impact: ${a.mutationTracking.decisionToPermutationFallbacks} decisions became permutations (${fallbackImpactOnRatio}% of total)`,
      `;   Original Permutations: ${originalPermutations} (before fallbacks)`,
      `;`,
      `; MUTATION SUCCESS RATES (kept/not reverted):`,
      `;   Permutation success: ${a.mutationTracking.permutationKept}/${a.mutationTracking.actualPermutation} (${permutationSuccessRate}%)`,
      `;   Decision success:    ${a.mutationTracking.decisionKept}/${a.mutationTracking.actualDecision} (${decisionSuccessRate}%)`,
      `;`,
      `; PRECISE ACTUAL RATIO: ${actualPermutationRatio}% Permutation / ${actualDecisionRatio}% Decision`
    );
  }

  return [...baseStats, ...originalStats, ...enhancedStats];
}
export function logMutation({
  choice,
  kept,
  numEvals,
}: {
  choice: CHOICE;
  numEvals: number;
  kept: boolean;
}): void {
  const pDetails = choice == " P" ? Model.permutationStats : "                      ";
  const dDetails = choice == "D " ? Model.decisionStats : "             ";

  globals.mutationLog.push([numEvals, choice.trim(), kept ? 1 : 0, pDetails, dDetails].join(","));
}

export function printStartInfo({
  resultDir,
  bridge,
  seed,
  evals,
  cyclegoal,
  proof,
  symbolname,
  counter,
  framePointer,
  memoryConstraints,
}: Pick<
  OptimizerArgs,
  "resultDir" | "bridge" | "seed" | "evals" | "cyclegoal" | "proof" | "framePointer" | "memoryConstraints"
> & {
  symbolname: string;
  counter: string;
}) {
  process.stdout.write(
    [
      `\nStart`,
      `on brg/symbolname>>${cy}${bridge}/${symbolname}${re}<<`,
      `>>${cy}${shouldProof({ bridge, proof }) ? "with" : "without"} proofing${re} correct<<`,
      `on cpu >>${cy}${cpus()[0].model}${re}<<`,
      `writing results to>>${cy}${resultDir}${re}<<`,
      `with seed >>${cy}${seed}${re}<<`,
      `for >>${cy}${SI(evals)}${re}<< evaluations`,
      `against CC>>${cy}${CC} ${CFLAGS}${re}<<`,
      `with cycle goal>>${cy}${cyclegoal}${re}<< for each measurement`,
      `on host>>${cy}${hostname()}${re}<<`,
      `with pid>>${cy}${process.pid}${re}<<`,
      `using counter>>${cy}${counter}${re}<<`,
      `framePointer=>>${cy}${framePointer}${re}<<`,
      `memoryConstraints>>${cy}${memoryConstraints}${re}<<`,
      `starting @>>${cy}${new Date().toISOString()}${re}<<\n`,
    ].join(" "),
  );
}
