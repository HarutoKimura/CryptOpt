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

import { exec } from "child_process";
import { existsSync, readdirSync, readFileSync, rmSync, writeFileSync } from "fs";
import { hostname } from "os";
import { join, resolve } from "path";

import {
  cy,
  env,
  generateResultFilename,
  gn,
  parsedArgs as parsedArgsFromCli,
  PRINT_EVERY,
  rd,
  re,
  SI,
  writeString,
} from "@/helper";
import globals from "@/helper/globals";
import { registerExitHooks } from "@/helper/process";
import { Model } from "@/model";
import { Optimizer } from "@/optimizer";
import { sha1Hash } from "@/paul";
import type { CryptOpt, CryptoptGlobals, OptimizerArgs } from "@/types";

import Logger from "./helper/Logger.class";

let parsedArgs = parsedArgsFromCli;
if (parsedArgs.startFromBestJson) {
  const symbolname = new Optimizer(parsedArgs).getSymbolname(true);
  const dir = resolve(parsedArgs.resultDir, parsedArgs.bridge, symbolname);
  if (parsedArgs.verbose) {
    console.log(`Checking '${dir}' for the abosulte bestestest Statefile.`);
  }
  const [bestStateFileName, bestState] = readdirSync(dir)
    .filter((file) => file.match(/seed\d+\.json/))
    .map((f) => resolve(dir, f))
    .map((f) => [f, JSON.parse(readFileSync(f).toString())] as [string, CryptOpt.StateFile])
    .sort(([_, a], [_2, b]) => b.ratio - a.ratio)[0]; // note reverse sort, because we want the biggest one

  if (existsSync(bestStateFileName)) {
    // overwrite all args
    parsedArgs = bestState.parsedArgs;

    // restore some
    parsedArgs.readState = bestStateFileName;
    parsedArgs.single = true;
    parsedArgs.evals = parsedArgsFromCli.evals;
    parsedArgs.seed = parsedArgsFromCli.seed;

    process.stdout.write(
      `Found ${cy}${parsedArgs.readState}${re} with ratio ${cy}${bestState.ratio}${re}. Will continue from there with ${cy}${parsedArgs.evals}${re} evals, one single run from new seed ${cy}${parsedArgs.seed}${re}`,
    );
  }
}
// if we only have readState, w/o looking for the best one
else if (parsedArgsFromCli.readState) {
  // overwrite every parsed arg if we shall do so
  const stateFile: CryptOpt.StateFile = JSON.parse(readFileSync(parsedArgsFromCli.readState).toString());
  if (stateFile.parsedArgs) {
    parsedArgs = stateFile.parsedArgs;
  }
}

const { single, bets, betRatio, curve, method, verbose } = parsedArgs;
if (parsedArgs.resultDir == "") {
  parsedArgs.resultDir = resolve(process.cwd(), "results");
}

// Store original evals for folder naming (before it gets modified for phases)
parsedArgs.totalEvals = parsedArgs.evals;

// Resolve mutationMode and scheduleRatio conflicts
// scheduleRatio takes priority, but mutationMode can override for backwards compatibility
if (parsedArgs.mutationMode === "schedule-only" && parsedArgs.scheduleRatio === 50) {
  // If schedule-only mode is set and ratio is default, force ratio to 100
  parsedArgs.scheduleRatio = 100;
} else if (parsedArgs.mutationMode === "template-only" && parsedArgs.scheduleRatio === 50) {
  // If template-only mode is set and ratio is default, force ratio to 0
  parsedArgs.scheduleRatio = 0;
}
// If both are explicitly set, scheduleRatio takes priority (no changes needed)

// GENERAL INITIALIZATION
if (!verbose) {
  console.log = () => {
    // intentionally empty
  };
}
// Idea is: if you want debug messages, you want to compile with DEBUG and run with --verbose,
// compile with DEBUG | run with --verbose | outcome
//         0          |          0         |      no debug msg while running, and not in asm
//         0          |          1         |      no debug msg while running, and not in asm
//         1          |          0         |      no debug msg while running, but additional info in asm
//         1          |          1         | many(!) debug msg while running, and not in asm

// to get the symbol name, we create new anonymous optimizer.
const symbolname = new Optimizer(parsedArgs).getSymbolname(true);
registerExitHooks({ ...parsedArgs, symbolname });

type RunResult = { statefile: string; ratio: number; convergence: string[]; optimizer?: Optimizer };

async function allBets(evals: number, bets: number): Promise<RunResult[]> {
  const runRes = [] as RunResult[];

  let derivedSeed = parsedArgs.seed;

  for (let i = 1; i <= bets; i++) {
    derivedSeed = sha1Hash(derivedSeed);

    const args = {
      ...parsedArgs,
      evals,
      logComment: `${parsedArgs.logComment} ${i}/${bets}`,
      seed: derivedSeed,
    };
    Logger.log("running a bet with " + JSON.stringify(args, undefined, 2));
    const runResult = await run(args);
    runRes.push(runResult);
  }

  runRes.sort((a, b) => b.ratio - a.ratio); // note: reverse sort

  Logger.log(
    [
      `Done finding good SEEEDs.`,
      `Starting final optimisation now.`,
      `Starting with a ratio of: ${cy}${runRes[0].ratio}${re}`,
    ].join(" "),
  );
  return runRes;
}

async function run(args: OptimizerArgs): Promise<RunResult> {
  let optimizer: Optimizer;
  try {
    optimizer = new Optimizer(args);
  } catch (e) {
    console.error(`CryptOpt-Error while creating the optimizer\n`, e);
    process.exit(1000);
  }
  try {
    await optimizer.optimise();
  } catch (e) {
    console.error(`CryptOpt-Error while optimising\n`, e);
    process.exit(1000);
  }

  const [statefile] = generateResultFilename({ ...args, symbolname: optimizer.getSymbolname() });
  Model.persist(statefile, parsedArgs);
  const { ratio, convergence } = Model.getState();
  return { statefile, ratio, convergence, optimizer };
}

let runResults: RunResult[];

const allocatedToPopulation = parsedArgs.evals * betRatio; // total for population
const offspringEvals = allocatedToPopulation / bets; // each of the offspring

if (single) {
  const fullArgs = {
    ...parsedArgs,
    logComment: `${parsedArgs.logComment} run`,
  };
  const singleRun = await run(fullArgs);
  runResults = [singleRun];
} else {
  runResults = await allBets(offspringEvals, bets);
  const [bestRun] = runResults;
  const fullArgs = {
    ...parsedArgs,
    logComment: `${parsedArgs.logComment} run`,
    evals: parsedArgs.evals - allocatedToPopulation,
    readState: bestRun.statefile,
  };
  
  // Create new optimizer for run phase (it will set phase to 'run' automatically)
  const lastRun = await run(fullArgs);
  runResults.push(lastRun);
}

// OPTIMIZATION DONE.
// NOW Analyse and write files for graphing.

// Export all metrics to JSON file - use same logic as generateResultFilename
const [metricsFilename] = generateResultFilename({ ...parsedArgs, symbolname }, ["_metrics.json"]);

// Read bet data from shared file if it exists
let betDataFromFile: any[] = [];
const sharedBetFilePath = `/tmp/cryptopt_bet_data_${symbolname}.json`;
try {
  if (existsSync(sharedBetFilePath)) {
    const betFileContent = readFileSync(sharedBetFilePath, 'utf8');
    betDataFromFile = JSON.parse(betFileContent);
    Logger.log(`Read ${betDataFromFile.length} bet phases from ${sharedBetFilePath}`);
  }
} catch (error) {
  Logger.log(`Failed to read bet data file: ${error}`);
}

// Include bet results summary for now
const betResultsSummary = runResults.slice(0, -1).map((result, index) => ({
  betIndex: index + 1,
  seed: result.statefile.match(/seed(\d+)/) ? result.statefile.match(/seed(\d+)/)?.[1] : 'unknown',
  finalRatio: result.ratio,
  convergenceLength: result.convergence.length,
}));

const metricsData = {
  timestamp: new Date().toISOString(),
  symbolname: symbolname,
  args: parsedArgs,
  mutationOrder: globals.mutationOrder,
  phaseStats: globals.phaseStats,
  randomInputsPerMutation: Array.from(globals.randomInputsPerMutation.entries()),
  totalRandomInputsConsumed: globals.totalRandomInputsConsumed,
  
  // Bet phase information (enhanced with detailed data from shared file)
  betResultsSummary: betResultsSummary,
  betPhaseDetails: betDataFromFile,
  existingMetrics: {
    convergence: globals.convergence,
    mutationLog: globals.mutationLog,
    currentRatio: globals.currentRatio,
  },
  // Add mutation tracking summary
  mutationSummary: {
    totalMutations: globals.mutationOrder.length,
    betPhaseMutations: globals.mutationOrder.filter((m: any) => m.phase === 'bet').length,
    runPhaseMutations: globals.mutationOrder.filter((m: any) => m.phase === 'run').length,
    permutationCount: globals.mutationOrder.filter((m: any) => m.type === 'Permutation').length,
    decisionCount: globals.mutationOrder.filter((m: any) => m.type === 'Decision').length,
    averageDeltaScore: globals.mutationOrder.length > 0 ? globals.mutationOrder.reduce((sum: number, m: any) => sum + m.deltaScore, 0) / globals.mutationOrder.length : 0,
  },
  
  // Summary of phases
  phaseSummary: {
    betPhases: globals.phaseStats.filter((p: any) => p.phaseType === 'bet').length,
    runPhases: globals.phaseStats.filter((p: any) => p.phaseType === 'run').length,
    totalPhases: globals.phaseStats.length,
    betsExecuted: runResults.length - 1, // Subtract final run
  },
};

writeFileSync(metricsFilename, JSON.stringify(metricsData, null, 2));
Logger.log(`Metrics written to ${metricsFilename}`);

// Clean up shared bet data file
try {
  if (existsSync(sharedBetFilePath)) {
    rmSync(sharedBetFilePath);
    Logger.log(`Cleaned up shared bet data file: ${sharedBetFilePath}`);
  }
} catch (error) {
  Logger.log(`Failed to clean up bet data file: ${error}`);
}

const times: CryptoptGlobals["time"] = { validate: 0, generateCryptopt: 0, generateFiat: 0 };

const parsed = Model.getState();

if ("time" in parsed) {
  const { validate, generateCryptopt, generateFiat } = parsed.time;
  times.validate += validate;
  times.generateFiat += generateFiat;
  times.generateCryptopt += generateCryptopt;
}

const lastConvergence = runResults[runResults.length - 1].convergence;
const longestDataRow = lastConvergence.length;

const spaceSeparated = runResults.reduce((arr, { convergence }) => {
  // in order to create a matrix for gnuplot, we need to pad with " ?"
  const paddingAmount = longestDataRow - convergence.length;
  const paddingArray = new Array(paddingAmount).fill("  ?   ");
  arr.push(convergence.concat(paddingArray).join(" "));
  return arr;
}, [] as string[]);

const [datFileFull, gpFileFull, pdfFileFull] = generateResultFilename({ ...parsedArgs, symbolname }, [
  ".dat",
  ".gp",
  ".pdf",
]);

writeString(datFileFull, spaceSeparated.join("\n"));
process.stdout.write(`Wrote ${cy}${datFileFull}${re} ${spaceSeparated.length}x${longestDataRow}`);

Logger.log(JSON.stringify(times));
const title = [
  `${curve.replace("_", "\\\\_")}-${method}`,
  single ? "Single Run" : `Restarts^{${bets}}_{${(offspringEvals / parsedArgs.evals) * 100} %}`,
  `#Mutations ${SI(parsedArgs.evals)}`,
  new Date().toISOString(),
  hostname(),
  Object.entries(times).map((k, v) => `Time for ${k}: ${(v / 60).toFixed(2)}min`),
].join(", ");

writeString(
  gpFileFull,
  [
    `#!/usr/bin/env gnuplot\n`,
    `set title "${title}"`,
    "# missing values are the ones from earlier-finished seed-searching evaluations",
    `set datafile missing "?"\n`,
    "# setting output sizes and filename",
    "set terminal pdf size 80cm,20cm",
    `set output '${pdfFileFull}'\n`,
    "# set x",
    'set xlabel "Mutation"',
    "set logscale x 10\n",
    "# set y",
    // "set yrange [0:2]\n",
    `set ylabel "ratio: '${env.CC}-compiled cycle lib'/'cycle good' "\n`,
    "# remove legend",
    "unset key\n",
    "# and plot the matrix with line colors, and a line at y=1 with color 0 (gre)",
    `plot "${datFileFull}" matrix using ($1*${PRINT_EVERY}):3:2 linecolor variable with lines, 1 lc 0`,
  ].join("\n"),
);

process.stdout.write(" Gen Pdf...");
const d = (chunk: Buffer | string) => {
  const str = chunk.toString();
  if (
    !str.includes("line 22: ") &&
    !str.includes(gpFileFull) &&
    str !== "\n" &&
    !str.includes("warning: ") &&
    !str.includes("matrix contains missing or undefined values")
  ) {
    process.stdout.write(str);
  }
};

const child = exec(`gnuplot ${gpFileFull}`);
child.stdout?.on("data", d);
child.stderr?.on("data", d);
child.on("close", (code) => {
  process.stdout.write(`${code == 0 ? gn : rd + "not"} OK ${re}\n`);
});
