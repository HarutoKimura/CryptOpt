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

import { execSync } from "child_process";
import { appendFileSync, existsSync, rmSync } from "fs";
import { Measuresuite } from "measuresuite";
import { tmpdir } from "os";
import { join, resolve as pathResolve } from "path";

import { assemble } from "@/assembler";
import { FiatBridge } from "@/bridge/fiat-bridge";
import { CHOICE, FUNCTIONS } from "@/enums";
import { errorOut, ERRORS } from "@/errors";
import {
  analyseMeasureResult,
  generateResultFilename,
  LOG_EVERY,
  padSeed,
  PRINT_EVERY,
  shouldProof,
  toggleFUNCTIONS,
  writeString,
} from "@/helper";
import globals from "@/helper/globals";
import Logger from "@/helper/Logger.class";
import { Model } from "@/model";
import { Paul, sha1Hash } from "@/paul";
import { RegisterAllocator } from "@/registerAllocator";
import type { AnalyseResult, OptimizerArgs } from "@/types";

import { genStatistics, genStatusLine, logMutation, printStartInfo } from "./optimizer.helper";
import { init } from "./optimizer.helper.class";

let choice: CHOICE;

export class Optimizer {
  private measuresuite: Measuresuite;
  private libcheckfunctionDirectory: string; // aka. /tmp/CryptOpt.cache/yolo123
  private symbolname: string;
  public getSymbolname(deleteCache = false): string {
    if (deleteCache) {
      this.cleanLibcheckfunctions();
    }
    return this.symbolname;
  }

  public constructor(private args: OptimizerArgs) {
    Paul.seed = args.seed;

    const randomString = sha1Hash(Math.ceil(Date.now() * Math.random())).toString(36);
    this.libcheckfunctionDirectory = join(tmpdir(), "CryptOpt.cache", randomString);

    const { measuresuite, symbolname } = init(this.libcheckfunctionDirectory, args);

    this.measuresuite = measuresuite;
    this.symbolname = symbolname;

    globals.convergence = [];
    globals.mutationLog = [
      "evaluation,choice,kept,PdetailsBackForwardChosenstepsWaled,DdetailsKindNumhotNumall",
    ];
    // load a saved state if necessary
    if (args.readState) {
      Model.import(args.readState);
    }
    RegisterAllocator.options = args;
  }

  private no_of_instructions = -1;
  private asmStrings: { [k in FUNCTIONS]: string } = {
    [FUNCTIONS.F_A]: "",
    [FUNCTIONS.F_B]: "",
  };
  
  // Enhanced mutation tracking system
  private numMut: { [id: string]: number } = {
    permutation: 0,
    decision: 0,
  };
  private numRevert: { [id: string]: number } = {
    permutation: 0,
    decision: 0,
  };
  
  // Simplified tracking - only actual mutations that were executed
  private mutationTracking = {
    // Actual mutations executed (this is what really matters)
    actualPermutation: 0,
    actualDecision: 0,
    
    // Fallback tracking - how many times decision failed and became permutation
    decisionToPermutationFallbacks: 0,
    
    // Success tracking - mutations that were kept (not reverted)
    permutationKept: 0,
    decisionKept: 0,
    
    // Revert tracking (same as existing for compatibility)
    permutationReverted: 0,
    decisionReverted: 0,
    
    // Success-based quota system (NEW)
    targetSuccessfulPermutations: 0,
    targetSuccessfulDecisions: 0,
    successfulPermutationQuotaReached: false,
    successfulDecisionQuotaReached: false,
    successBasedExclusiveMode: false,
    successBasedExclusiveModeType: null as CHOICE | null,
    
    // Execution-based quota system (EXISTING - for comparison)
    targetPermutations: 0,
    targetDecisions: 0,
    permutationQuotaReached: false,
    decisionQuotaReached: false,
    exclusiveMode: false,
    exclusiveModeType: null as CHOICE | null,
  };

  private revertFunction = (): void => {
    /**intentionally blank */
  };
  
  /** Initialize mutation quotas based on total evaluations and scheduleRatio */
  private initializeMutationQuotas(): void {
    const totalMutations = this.args.evals - 1; // Subtract 1 for initial evaluation
    
    if (this.args.quotaMode === "execution") {
      // Execution-based quotas (original system)
      this.mutationTracking.targetPermutations = Math.round(totalMutations * this.args.scheduleRatio / 100);
      this.mutationTracking.targetDecisions = totalMutations - this.mutationTracking.targetPermutations;
      
      Logger.log(`Execution-based quotas initialized: P=${this.mutationTracking.targetPermutations}, D=${this.mutationTracking.targetDecisions}`);
    } else {
      // Success-based quotas (new system)
      // We need to estimate how many successful mutations we'll have
      // Based on typical success rates, let's assume ~20% overall success rate
      const estimatedSuccessfulMutations = Math.round(totalMutations * 0.2);
      this.mutationTracking.targetSuccessfulPermutations = Math.round(estimatedSuccessfulMutations * this.args.scheduleRatio / 100);
      this.mutationTracking.targetSuccessfulDecisions = estimatedSuccessfulMutations - this.mutationTracking.targetSuccessfulPermutations;
      
      Logger.log(`Success-based quotas initialized: P=${this.mutationTracking.targetSuccessfulPermutations}, D=${this.mutationTracking.targetSuccessfulDecisions} (estimated from ${estimatedSuccessfulMutations} total successful)`);
    }
  }
  
  /** you usually don't want to mess with @param random.
   * mutate should not be called from outside with @param random=false*/
  private mutate(random = true): void {
    let intendedChoice: CHOICE = choice; // Initialize with current choice
    
    if (random) {
      if (this.args.quotaMode === "execution") {
        // Execution-based quota system
        // Check if we've reached quotas and need to switch to exclusive mode
        if (!this.mutationTracking.permutationQuotaReached && 
            this.mutationTracking.actualPermutation >= this.mutationTracking.targetPermutations) {
          this.mutationTracking.permutationQuotaReached = true;
          this.mutationTracking.exclusiveMode = true;
          this.mutationTracking.exclusiveModeType = CHOICE.DECISION;
          Logger.log(`Permutation quota reached (${this.mutationTracking.actualPermutation}/${this.mutationTracking.targetPermutations}). Switching to decision-only mode.`);
        }
        
        if (!this.mutationTracking.decisionQuotaReached && 
            this.mutationTracking.actualDecision >= this.mutationTracking.targetDecisions) {
          this.mutationTracking.decisionQuotaReached = true;
          this.mutationTracking.exclusiveMode = true;
          this.mutationTracking.exclusiveModeType = CHOICE.PERMUTE;
          Logger.log(`Decision quota reached (${this.mutationTracking.actualDecision}/${this.mutationTracking.targetDecisions}). Switching to permutation-only mode.`);
        }
        
        // Determine choice based on execution quota system
        if (this.mutationTracking.exclusiveMode && this.mutationTracking.exclusiveModeType) {
          // One quota is reached, use only the other type
          intendedChoice = this.mutationTracking.exclusiveModeType;
          choice = intendedChoice;
        } else {
          // Normal random selection based on scheduleRatio
      const randomValue = Paul.chooseBetween(100); // random integer [0, 99]
      if (randomValue < this.args.scheduleRatio) {
            intendedChoice = CHOICE.PERMUTE; // Schedule mutation
          } else {
            intendedChoice = CHOICE.DECISION; // Template mutation
          }
          choice = intendedChoice;
        }
      } else {
        // Success-based quota system
        // Check if we've reached success quotas and need to switch to exclusive mode
        if (!this.mutationTracking.successfulPermutationQuotaReached && 
            this.mutationTracking.permutationKept >= this.mutationTracking.targetSuccessfulPermutations) {
          this.mutationTracking.successfulPermutationQuotaReached = true;
          this.mutationTracking.successBasedExclusiveMode = true;
          this.mutationTracking.successBasedExclusiveModeType = CHOICE.DECISION;
          Logger.log(`Successful permutation quota reached (${this.mutationTracking.permutationKept}/${this.mutationTracking.targetSuccessfulPermutations}). Switching to decision-only mode.`);
        }
        
        if (!this.mutationTracking.successfulDecisionQuotaReached && 
            this.mutationTracking.decisionKept >= this.mutationTracking.targetSuccessfulDecisions) {
          this.mutationTracking.successfulDecisionQuotaReached = true;
          this.mutationTracking.successBasedExclusiveMode = true;
          this.mutationTracking.successBasedExclusiveModeType = CHOICE.PERMUTE;
          Logger.log(`Successful decision quota reached (${this.mutationTracking.decisionKept}/${this.mutationTracking.targetSuccessfulDecisions}). Switching to permutation-only mode.`);
        }
        
        // Determine choice based on success quota system
        if (this.mutationTracking.successBasedExclusiveMode && this.mutationTracking.successBasedExclusiveModeType) {
          // One success quota is reached, use only the other type
          intendedChoice = this.mutationTracking.successBasedExclusiveModeType;
          choice = intendedChoice;
        } else {
          // Normal random selection based on scheduleRatio
          const randomValue = Paul.chooseBetween(100); // random integer [0, 99]
          if (randomValue < this.args.scheduleRatio) {
            intendedChoice = CHOICE.PERMUTE; // Schedule mutation
          } else {
            intendedChoice = CHOICE.DECISION; // Template mutation
          }
          choice = intendedChoice;
        }
      }
    }
    
    Logger.log("Mutationalita");
    switch (choice) {
      case CHOICE.PERMUTE: {
        Model.mutatePermutation();
        
        // Track actual mutation
        this.mutationTracking.actualPermutation++;
        this.numMut.permutation++;
        
        this.revertFunction = () => {
          this.numRevert.permutation++;
          this.mutationTracking.permutationReverted++;
          Model.revertLastMutation();
        };
        break;
      }
      case CHOICE.DECISION: {
        const hasHappend = Model.mutateDecision();
        if (!hasHappend) {
          // this is the case, if there is no hot decisions.
          // Track fallback: intended decision became permutation
          if (random && intendedChoice === CHOICE.DECISION) {
            this.mutationTracking.decisionToPermutationFallbacks++;
          }
          
          // Fall back to schedule mutation
          choice = CHOICE.PERMUTE;
          this.mutate(false);
          return;
        }
        
        // Track actual decision mutation
        this.mutationTracking.actualDecision++;
        this.numMut.decision++;
        
        this.revertFunction = () => {
          this.numRevert.decision++;
          this.mutationTracking.decisionReverted++;
          Model.revertLastMutation();
        };
      }
    }
  }

  public optimise() {
    return new Promise<number>((resolve) => {
      Logger.log("starting optimisation");
      
      // Initialize mutation quotas based on total evaluations and scheduleRatio
      this.initializeMutationQuotas();
      
      printStartInfo({
        ...this.args,
        symbolname: this.symbolname,
        counter: this.measuresuite.timer,
      });
      let batchSize = 200;
      const numBatches = 31;
      let ratioString = "";
      let numEvals = 0;

      const optimistaionStartDate = Date.now();
      let accumulatedTimeSpentByMeasuring = 0;

      let currentNameOfTheFunctionThatHasTheMutation = FUNCTIONS.F_A;
      let time = Date.now();
      let show_per_second = "many/s";
      let per_second_counter = 0;
      const intervalHandle = setInterval(() => {
        if (numEvals > 0) {
          // not first eval, thus we want to mutate.
          this.mutate();
        }

        Logger.log("assembling");
        const { code, stacklength } = assemble(this.args.resultDir);

        Logger.log("now we have the current string in the object, filtering");
        const filteredInstructions = code.filter((line) => line && !line.startsWith(";") && line !== "\n");
        this.no_of_instructions = filteredInstructions.length;

        // and depening on the silent-opt use filtered or the verbose ones for the string
        if (this.args.verbose) {
          const c = code.join("\n");
          writeString(pathResolve(this.libcheckfunctionDirectory, "current.asm"), c);
          this.asmStrings[currentNameOfTheFunctionThatHasTheMutation] = c;
        } else {
          this.asmStrings[currentNameOfTheFunctionThatHasTheMutation] = filteredInstructions.join("\n");
        }

        // check if this was the first round
        if (numEvals == 0) {
          // then point to fB and continue, write first
          if (this.asmStrings[FUNCTIONS.F_A].includes("undefined")) {
            const p = pathResolve(this.libcheckfunctionDirectory, "with_undefined.asm");
            writeString(p, this.asmStrings[FUNCTIONS.F_A]);

            console.log("asm string:",this.asmStrings[FUNCTIONS.F_A]);

            const e = `\n\n\nNah... we dont want undefined; wrote ${p}, plx fix. \n\n\n`;
            console.error(e);
            throw new Error(e);
          }
          currentNameOfTheFunctionThatHasTheMutation = FUNCTIONS.F_B;
          numEvals++;
        } else {
          //else, it was not the first round, we need to measure

          const now_measure = Date.now();

          let analyseResult: AnalyseResult | undefined;
          try {
            Logger.log("let the measurements begin!");
            if (this.args.verbose) {
              writeString(
                pathResolve(this.libcheckfunctionDirectory, "currentA.asm"),
                this.asmStrings[FUNCTIONS.F_A],
              );
              writeString(
                pathResolve(this.libcheckfunctionDirectory, "currentB.asm"),
                this.asmStrings[FUNCTIONS.F_B],
              );
            }
            // here we need the barriers
            const results = this.measuresuite.measure(batchSize, numBatches, [
              this.asmStrings[FUNCTIONS.F_A],
              this.asmStrings[FUNCTIONS.F_B],
            ]);
            Logger.log("well done guys. The results are in!");


            if (results) {
              console.log("Measurement results:", {
                numFunctions: results.stats.numFunctions,
                functionTypes: results.functions.map(f => f.type),
                numCycleArrays: results.cycles.length
              });
            } else {
              console.error("Measurement results are null");
            }
            

            accumulatedTimeSpentByMeasuring += Date.now() - now_measure;

            analyseResult = analyseMeasureResult(results, { batchSize, resultDir: this.args.resultDir });

            //TODO increase numBatches, if the times have a big stddeviation
            //TODO change batchSize if the avg number is batchSize *= avg(times)/goal ; goal=10000 cycles
          } catch (e) {
            const isIncorrect = e instanceof Error && e.message.includes("tested_incorrect");
            const isInvalid = e instanceof Error && e.message.includes("could not be assembled");
            if (isInvalid || isIncorrect) {
              writeString(
                join(this.args.resultDir, "tested_incorrect_A.asm"),
                this.asmStrings[FUNCTIONS.F_A],
              );
              writeString(
                join(this.args.resultDir, "tested_incorrect_B.asm"),
                this.asmStrings[FUNCTIONS.F_B],
              );
              writeString(
                join(this.args.resultDir, "tested_incorrect.json"),
                JSON.stringify({
                  nodes: Model.nodesInTopologicalOrder,
                }),
              );
            }

            if (isIncorrect) {
              errorOut(ERRORS.measureIncorrect);
            }
            if (isInvalid) {
              errorOut(ERRORS.measureInvalid);
            }
            writeString(join(this.args.resultDir, "generic_error_A.asm"), this.asmStrings[FUNCTIONS.F_A]);
            writeString(join(this.args.resultDir, "generic_error_B.asm"), this.asmStrings[FUNCTIONS.F_B]);
            errorOut(ERRORS.measureGeneric);
          }

          const [meanrawA, meanrawB, meanrawCheck] = analyseResult.rawMedian; // meausrawCheck is the median of the check function (the shared object file)

          batchSize = Math.ceil((Number(this.args.cyclegoal) / meanrawCheck) * batchSize);
          // We want to limit for some corner cases.
          batchSize = Math.min(batchSize, 10000);
          batchSize = Math.max(batchSize, 5);

          const currentFunctionIsA = () => currentNameOfTheFunctionThatHasTheMutation === FUNCTIONS.F_A;

          Logger.log(currentFunctionIsA() ? "New".padEnd(10) : "New".padStart(10));

          let kept: boolean;

          if (
            // A is not worse and A is new
            (meanrawA <= meanrawB && currentFunctionIsA()) ||
            // or B is not worse and B is new
            (meanrawA >= meanrawB && !currentFunctionIsA())
          ) {
            Logger.log("kept    mutation");
            kept = true;
            
            // Track kept mutations by type
            if (choice === CHOICE.PERMUTE) {
              this.mutationTracking.permutationKept++;
            } else if (choice === CHOICE.DECISION) {
              this.mutationTracking.decisionKept++;
            }
            
            currentNameOfTheFunctionThatHasTheMutation = toggleFUNCTIONS(
              currentNameOfTheFunctionThatHasTheMutation,
            );
          } else {
            // revert
            kept = false;
            this.revertFunction();
          }
          const indexGood = Number(meanrawA > meanrawB);
          const indexBad = 1 - indexGood;
          globals.currentRatio = meanrawCheck / Math.min(meanrawB, meanrawA);

          const goodChunks = analyseResult.chunks[indexGood];
          const badChunks = analyseResult.chunks[indexBad];

          ratioString = globals.currentRatio /*aka: new ratio*/
            .toFixed(4);

          per_second_counter++;
          if (Date.now() - time > 1000) {
            time = Date.now();
            show_per_second = (per_second_counter + "/s").padStart(6);
            per_second_counter = 0;
          }

          logMutation({ choice, kept, numEvals });
          if (numEvals % PRINT_EVERY == 0) {
            // print every 10th eval
            // a line every 5% (also to logfile) also write the asm when
            const writeout = numEvals % (this.args.evals / LOG_EVERY) === 0;

            const statusline = genStatusLine({
              ...this.args,
              analyseResult,
              badChunks,
              batchSize,
              choice,
              goodChunks,
              indexBad,
              indexGood,
              kept,
              no_of_instructions: this.no_of_instructions,
              numEvals,
              ratioString,
              show_per_second,
              stacklength,
              symbolname: this.symbolname,
              writeout,
            });
            
            // Add enhanced tracking summary to status line when writing out
            if (writeout) {
              const totalActual = this.mutationTracking.actualPermutation + this.mutationTracking.actualDecision;
              const actualPermutationRatio = totalActual > 0 ? (this.mutationTracking.actualPermutation / totalActual * 100).toFixed(1) : "0.0";
              const actualDecisionRatio = totalActual > 0 ? (this.mutationTracking.actualDecision / totalActual * 100).toFixed(1) : "0.0";
              const fallbackImpact = totalActual > 0 ? 
                (this.mutationTracking.decisionToPermutationFallbacks / totalActual * 100).toFixed(1) : "0.0";
              
              const quotaStatus = this.mutationTracking.exclusiveMode ? " [QUOTA MODE]" : "";
              const permutationProgress = `${this.mutationTracking.actualPermutation}/${this.mutationTracking.targetPermutations}`;
              const decisionProgress = `${this.mutationTracking.actualDecision}/${this.mutationTracking.targetDecisions}`;
              
              process.stdout.write(`\n[MUTATION TRACKING] Actual: P=${actualPermutationRatio}% D=${actualDecisionRatio}% | Progress: P=${permutationProgress} D=${decisionProgress} | Fallbacks: ${fallbackImpact}%${quotaStatus}`);
            }
            process.stdout.write(statusline);

            globals.convergence.push(ratioString);
          }

          // Increase  Number of evaluations taken.
          numEvals++;

          if (numEvals >= this.args.evals) {
            // DONE WITH OPTIMISING WRITE EVERYTHING TO DISK AND EXIT.
            globals.time.generateCryptopt =
              (Date.now() - optimistaionStartDate) / 1000 - globals.time.validate;
            clearInterval(intervalHandle);

            Logger.log("writing current asm");
            const elapsed = Date.now() - optimistaionStartDate;
            const paddedSeed = padSeed(Paul.initialSeed);

            const statistics = genStatistics({
              paddedSeed,
              ratioString,
              evals: this.args.evals,
              elapsed,
              batchSize,
              numBatches,
              acc: accumulatedTimeSpentByMeasuring,
              numRevert: this.numRevert,
              numMut: this.numMut,
              counter: this.measuresuite.timer,
              framePointer: this.args.framePointer,
              memoryConstraints: this.args.memoryConstraints,
              cyclegoal: this.args.cyclegoal,
              mutationTracking: this.mutationTracking,
              scheduleRatio: this.args.scheduleRatio,
            });
            Logger.log(statistics);

            const [asmFile, mutationsCsvFile] = generateResultFilename(
              { ...this.args, symbolname: this.symbolname },
              [`_ratio${ratioString.replace(".", "")}.asm`, `.csv`],
            );

            // write best found solution with headers
            // flip, because we want the last accepted, not the last mutated.
            const flipped = toggleFUNCTIONS(currentNameOfTheFunctionThatHasTheMutation);

            writeString(
              asmFile,
              ["SECTION .text", `\tGLOBAL ${this.symbolname}`, `${this.symbolname}:`]
                .concat(this.asmStrings[flipped])
                .concat(statistics)
                .join("\n"),
            );

            // writing the CSV
            writeString(mutationsCsvFile, globals.mutationLog.join("\n"));

            if (shouldProof(this.args)) {
              // and proof correct
              const proofCmd = FiatBridge.buildProofCommand(this.args.curve, this.args.method, asmFile);
              Logger.log(`proofing that asm correct with '${proofCmd}'`);
              try {
                const now = Date.now();
                execSync(proofCmd, { shell: "/usr/bin/bash" });
                const timeForValidation = (Date.now() - now) / 1000;
                appendFileSync(asmFile, `\n; validated in ${timeForValidation}s\n`);
                globals.time.validate += timeForValidation;
              } catch (e) {
                console.error(`tried to prove correct. didnt work. I tried ${proofCmd}`);
                errorOut(ERRORS.proofUnsuccessful);
              }
            }
            Logger.log("done with that current price of assembly code.");
            this.cleanLibcheckfunctions();
            const v = this.measuresuite.destroy();
            Logger.log(`Wonderful. Done with my work. Destroyed measuresuite (${v}). Time for lunch.`);

            // Log final cycle count for benchmarking
            const finalCycleCount = parseFloat(ratioString);
            process.stdout.write(`FINAL_CYCLE_COUNT,${this.args.mutationMode},${this.symbolname},${finalCycleCount}\n`);

            resolve(0);
          }
        }
      }, 0);
    });
  }

  private cleanLibcheckfunctions() {
    if (existsSync(this.libcheckfunctionDirectory)) {
      try {
        Logger.log(`Removing lib check functions in '${this.libcheckfunctionDirectory}'`);
        rmSync(this.libcheckfunctionDirectory, { recursive: true });
        Logger.log(`removed ${this.libcheckfunctionDirectory}`);
      } catch (e) {
        console.error(e);
        throw e;
      }
    }
  }
}
