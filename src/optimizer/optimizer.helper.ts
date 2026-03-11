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
  scheduleRatio: number;
  mutationTracking?: {
    actualPermutation: number;
    actualDecision: number;
    decisionToPermutationFallbacks: number;
    permutationKept: number;
    decisionKept: number;
    permutationReverted: number;
    decisionReverted: number;
    mutationSequence: Array<{
      evaluation: number;
      intended: CHOICE;
      actual: CHOICE;
      fellback: boolean;
      kept: boolean;
    }>;
  };
  mutationOrder?: any[];
  baselinePerformance?: number;
  finalPerformance?: number;
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
    `; target mutation ratio P:${a.scheduleRatio}% D:${100-a.scheduleRatio}%`,
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

  // Natural mutation distribution analysis
  const naturalDistributionStats: string[] = [];
  if (a.mutationTracking) {
    const totalActualMutations = a.mutationTracking.actualPermutation + a.mutationTracking.actualDecision;
    const totalEvaluated = a.evals - 1; // Subtract 1 for the initial evaluation

    // Natural distribution ratios
    const naturalPermutationRatio = totalActualMutations > 0 ? (a.mutationTracking.actualPermutation / totalActualMutations * 100).toFixed(1) : "0.0";
    const naturalDecisionRatio = totalActualMutations > 0 ? (a.mutationTracking.actualDecision / totalActualMutations * 100).toFixed(1) : "0.0";

    // Fallback analysis
    const originalPermutations = a.mutationTracking.actualPermutation - a.mutationTracking.decisionToPermutationFallbacks;
    const fallbackRate = totalActualMutations > 0 ? 
      (a.mutationTracking.decisionToPermutationFallbacks / totalActualMutations * 100).toFixed(1) : "0.0";

    // Success rates
    const permutationSuccessRate = a.mutationTracking.actualPermutation > 0 ? 
      (a.mutationTracking.permutationKept / a.mutationTracking.actualPermutation * 100).toFixed(1) : "0.0";
    const decisionSuccessRate = a.mutationTracking.actualDecision > 0 ? 
      (a.mutationTracking.decisionKept / a.mutationTracking.actualDecision * 100).toFixed(1) : "0.0";

    naturalDistributionStats.push(
      `;`,
      `; === NATURAL MUTATION DISTRIBUTION ANALYSIS ===`,
      `; Study Goal: Measure inherent mutation preferences without forced ratios`,
      `; Total Evaluations: ${totalEvaluated} (excluding initial)`,
      `; Total Mutations: ${totalActualMutations}`,
      `;`,
      `; NATURAL DISTRIBUTION:`,
      `;   Permutation: ${a.mutationTracking.actualPermutation} mutations (${naturalPermutationRatio}%)`,
      `;   Decision:    ${a.mutationTracking.actualDecision} mutations (${naturalDecisionRatio}%)`,
      `;`,
      `; FALLBACK ANALYSIS:`,
      `;   Original Intended Permutations: ${originalPermutations}`,
      `;   Decision→Permutation Fallbacks: ${a.mutationTracking.decisionToPermutationFallbacks}`,
      `;   Fallback Rate: ${fallbackRate}% of total mutations`,
      `;`,
      `; SUCCESS RATES (mutations kept):`,
      `;   Permutation Success: ${a.mutationTracking.permutationKept}/${a.mutationTracking.actualPermutation} (${permutationSuccessRate}%)`,
      `;   Decision Success:    ${a.mutationTracking.decisionKept}/${a.mutationTracking.actualDecision} (${decisionSuccessRate}%)`,
      `;`,
      `; KEY FINDING: Natural P/D ratio = ${naturalPermutationRatio}%/${naturalDecisionRatio}% for this implementation`,
      `; Time-series data: ${a.mutationTracking.mutationSequence.length} mutations recorded with timestamps`
    );
  }

  // Detailed mutation feature analysis
  const detailedFeatureStats: string[] = [];
  if (a.mutationOrder && a.mutationOrder.length > 0) {
    const permMutations = a.mutationOrder.filter(m => m.type === 'Permutation' && m.features?.permutation);
    const decMutations = a.mutationOrder.filter(m => m.type === 'Decision' && m.features?.decision);

    detailedFeatureStats.push(
      `;`,
      `; === DETAILED MUTATION FEATURE ANALYSIS ===`,
      `;`
    );

    // Performance summary
    if (a.baselinePerformance && a.finalPerformance) {
      const totalImprovement = ((a.baselinePerformance - a.finalPerformance) / a.baselinePerformance * 100).toFixed(2);
      detailedFeatureStats.push(
        `; PERFORMANCE SUMMARY:`,
        `;   Baseline: ${a.baselinePerformance.toFixed(2)} cycles`,
        `;   Final:    ${a.finalPerformance.toFixed(2)} cycles`,
        `;   Total Improvement: ${totalImprovement}% (${(a.baselinePerformance - a.finalPerformance).toFixed(2)} cycles)`,
        `;`
      );
    }

    // Permutation feature analysis
    if (permMutations.length > 0) {
      const distances = permMutations.map(m => m.features.permutation.distance);
      const avgDistance = (distances.reduce((a, b) => a + b, 0) / distances.length).toFixed(2);
      const maxDistance = Math.max(...distances.map(Math.abs));
      const minDistance = Math.min(...distances.map(Math.abs));

      const shortMoves = permMutations.filter(m => Math.abs(m.features.permutation.distance) < 5);
      const mediumMoves = permMutations.filter(m => Math.abs(m.features.permutation.distance) >= 5 && Math.abs(m.features.permutation.distance) < 15);
      const longMoves = permMutations.filter(m => Math.abs(m.features.permutation.distance) >= 15);

      // Calculate avg delta for each category
      const avgDeltaShort = shortMoves.length > 0 ? (shortMoves.reduce((sum, m) => sum + m.deltaScore, 0) / shortMoves.length).toFixed(2) : "N/A";
      const avgDeltaMedium = mediumMoves.length > 0 ? (mediumMoves.reduce((sum, m) => sum + m.deltaScore, 0) / mediumMoves.length).toFixed(2) : "N/A";
      const avgDeltaLong = longMoves.length > 0 ? (longMoves.reduce((sum, m) => sum + m.deltaScore, 0) / longMoves.length).toFixed(2) : "N/A";

      detailedFeatureStats.push(
        `; PERMUTATION FEATURES (${permMutations.length} mutations):`,
        `;   Distance Statistics:`,
        `;     Average: ${avgDistance} positions`,
        `;     Range: ${minDistance} to ${maxDistance} positions`,
        `;   Distance Distribution:`,
        `;     Short moves  (<5):   ${shortMoves.length} mutations, avg Δ=${avgDeltaShort} cycles`,
        `;     Medium moves (5-15): ${mediumMoves.length} mutations, avg Δ=${avgDeltaMedium} cycles`,
        `;     Long moves   (>15):  ${longMoves.length} mutations, avg Δ=${avgDeltaLong} cycles`,
        `;`
      );
    }

    // Decision feature analysis
    if (decMutations.length > 0) {
      // Group by decision type
      const byType: { [key: string]: any[] } = {};
      decMutations.forEach(m => {
        const type = m.features.decision.decisionType;
        if (!byType[type]) byType[type] = [];
        byType[type].push(m);
      });

      detailedFeatureStats.push(
        `; DECISION FEATURES (${decMutations.length} mutations):`,
        `;   Decision Types:`,
      );

      Object.entries(byType)
        .sort(([, a], [, b]) => b.length - a.length)  // Sort by frequency
        .forEach(([type, mutations]) => {
          const avgDelta = (mutations.reduce((sum, m) => sum + m.deltaScore, 0) / mutations.length).toFixed(2);
          const kept = mutations.filter(m => {
            // Check if this mutation was kept by looking at the next mutation
            const nextIdx = a.mutationOrder!.findIndex(x => x === m) + 1;
            return nextIdx < a.mutationOrder!.length ? m.deltaScore <= 0 : true;
          }).length;
          const successRate = ((kept / mutations.length) * 100).toFixed(1);

          detailedFeatureStats.push(
            `;     ${type.padEnd(20)}: ${mutations.length.toString().padStart(3)} mutations, avg Δ=${avgDelta.padStart(7)} cycles, success=${successRate}%`
          );
        });

      detailedFeatureStats.push(`;`);
    }

    // Delta score distribution
    const allMutations = a.mutationOrder.filter(m => m.type !== 'Baseline');
    if (allMutations.length > 0) {
      const deltas = allMutations.map(m => m.deltaScore);
      const improvements = deltas.filter(d => d < 0);
      const degradations = deltas.filter(d => d > 0);

      const avgImprovement = improvements.length > 0 ? (improvements.reduce((a, b) => a + b, 0) / improvements.length).toFixed(2) : "N/A";
      const avgDegradation = degradations.length > 0 ? (degradations.reduce((a, b) => a + b, 0) / degradations.length).toFixed(2) : "N/A";
      const bestImprovement = improvements.length > 0 ? Math.min(...improvements).toFixed(2) : "N/A";
      const worstDegradation = degradations.length > 0 ? Math.max(...degradations).toFixed(2) : "N/A";

      detailedFeatureStats.push(
        `; DELTA SCORE DISTRIBUTION:`,
        `;   Improvements: ${improvements.length} mutations (avg: ${avgImprovement} cycles, best: ${bestImprovement} cycles)`,
        `;   Degradations: ${degradations.length} mutations (avg: ${avgDegradation} cycles, worst: ${worstDegradation} cycles)`,
        `;   Success Rate: ${((improvements.length / allMutations.length) * 100).toFixed(1)}%`,
        `;`
      );
    }

    detailedFeatureStats.push(
      `; Note: Detailed mutation-by-mutation data available in companion JSON file`,
      `; JSON contains: performanceBefore/After, absoluteImprovement, and full feature details`,
      `;`
    );
  }

  return [...baseStats, ...originalStats, ...naturalDistributionStats, ...detailedFeatureStats];
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
  scheduleRatio,
}: Pick<
  OptimizerArgs,
  "resultDir" | "bridge" | "seed" | "evals" | "cyclegoal" | "proof" | "framePointer" | "memoryConstraints" | "scheduleRatio"
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
      `mutation ratio>>${cy}P:${scheduleRatio}% D:${100-scheduleRatio}%${re}<<`,
      `starting @>>${cy}${new Date().toISOString()}${re}<<\n`,
    ].join(" "),
  );
}
