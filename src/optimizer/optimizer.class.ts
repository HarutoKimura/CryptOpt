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
import { appendFileSync, existsSync, readFileSync, rmSync, writeFileSync } from "fs";
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
  private currentPhase: 'bet' | 'run';
  private phaseStartEval: number;
  private previousScore: number = 0;
  private mutationIndexWithinPhase: number = 0;
  private currentBetIndex: number = 0;
  private phaseStartRandomInputs: number = 0;
  
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
    
    // Initialize phase tracking
    // Determine phase based on log comment and read state
    const isBetPhase = args.logComment.includes('/') && !args.readState;
    this.currentPhase = isBetPhase ? 'bet' : 'run';
    this.currentBetIndex = isBetPhase ? parseInt(args.logComment.split('/')[0].split(' ').pop() || '0') : 0;
    this.phaseStartEval = 0;
    this.mutationIndexWithinPhase = 0;
    
    // Initialize new global tracking
    globals.mutationOrder = [];
    globals.phaseStats = [];
    globals.randomInputsPerMutation = new Map();
    globals.totalRandomInputsConsumed = 0;
    this.phaseStartRandomInputs = 0;
    
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
  
  // Natural mutation distribution tracking - no forced ratios
  private mutationTracking = {
    // Actual mutations executed
    actualPermutation: 0,
    actualDecision: 0,
    
    // Fallback tracking - when decisions can't find hot decisions
    decisionToPermutationFallbacks: 0,
    
    // Success tracking - mutations that were kept (not reverted)
    permutationKept: 0,
    decisionKept: 0,
    
    // Revert tracking
    permutationReverted: 0,
    decisionReverted: 0,
    
    // Time-series tracking - mutation sequence over time
    mutationSequence: [] as Array<{
      evaluation: number,
      intended: CHOICE,
      actual: CHOICE,
      fellback: boolean,
      kept: boolean
    }>,
  };

  private revertFunction = (): void => {
    /**intentionally blank */
  };
  

  
  /** you usually don't want to mess with @param random.
   * mutate should not be called from outside with @param random=false*/
  private mutate(random = true, currentEvalNum?: number): void {
    let intendedChoice: CHOICE;
    
    if (random) {
      // Natural random selection - no forced ratios, just 50/50 chance
      intendedChoice = Paul.pick([CHOICE.PERMUTE, CHOICE.DECISION]);
      choice = intendedChoice;
    } else {
      // For fallback cases, intendedChoice should already be set
      intendedChoice = choice;
    }
    
    Logger.log("Mutationalita");
    let actualChoice = choice;
    let fellback = false;
    
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
            fellback = true;
            console.log(`\n🔄 FALLBACK #${this.mutationTracking.decisionToPermutationFallbacks}: Decision → Permutation`);
            console.log(`   Evaluation: ${currentEvalNum ?? this.mutationTracking.actualPermutation + this.mutationTracking.actualDecision + 1}`);
            console.log(`   Reason: No hot decisions available for mutation`);
            console.log(`   Action: Falling back to permutation mutation\n`);
          }
          
          // Fall back to schedule mutation
          choice = CHOICE.PERMUTE;
          actualChoice = CHOICE.PERMUTE;
          this.mutate(false, currentEvalNum);
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
        break;
      }
    }
    
    // Record mutation in time-series if evaluation number is provided
    if (currentEvalNum) {
      this.mutationTracking.mutationSequence.push({
        evaluation: currentEvalNum,
        intended: intendedChoice,
        actual: actualChoice,
        fellback: fellback,
        kept: false // Will be updated later when we know if it was kept
      });
    }
  }

  public optimise() {
    return new Promise<number>((resolve) => {
      Logger.log("starting optimisation - natural mutation distribution study");
      
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
          this.mutate(true, numEvals);
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
          let randomInputsForThisMutation = 0;
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
            
            // Track random inputs used for this mutation
            randomInputsForThisMutation = batchSize * numBatches;
            globals.randomInputsPerMutation.set(numEvals, randomInputsForThisMutation);
            globals.totalRandomInputsConsumed += randomInputsForThisMutation;


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

          // Calculate performance delta
          const currentScore = currentFunctionIsA() ? meanrawA : meanrawB;
          const deltaScore = this.previousScore === 0 ? 0 : currentScore - this.previousScore;
          
          // Track mutation order
          const mutationType = choice === CHOICE.PERMUTE ? 'Permutation' : 'Decision';
          globals.mutationOrder.push({
            phase: this.currentPhase,
            index: this.mutationIndexWithinPhase++,
            type: mutationType,
            deltaScore: deltaScore,
            evalNumber: numEvals,
            randomInputsUsed: randomInputsForThisMutation
          });

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
            
            // Update time-series tracking for kept mutations
            if (this.mutationTracking.mutationSequence.length > 0) {
              const lastMutation = this.mutationTracking.mutationSequence[this.mutationTracking.mutationSequence.length - 1];
              if (lastMutation.evaluation === numEvals) {
                lastMutation.kept = true;
              }
            }
            
            currentNameOfTheFunctionThatHasTheMutation = toggleFUNCTIONS(
              currentNameOfTheFunctionThatHasTheMutation,
            );
            
            // Update previous score for next delta calculation
            this.previousScore = currentScore;
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
            
            // Add natural distribution tracking summary to status line when writing out
            if (writeout) {
              const totalActual = this.mutationTracking.actualPermutation + this.mutationTracking.actualDecision;
              const actualPermutationRatio = totalActual > 0 ? (this.mutationTracking.actualPermutation / totalActual * 100).toFixed(1) : "0.0";
              const actualDecisionRatio = totalActual > 0 ? (this.mutationTracking.actualDecision / totalActual * 100).toFixed(1) : "0.0";
              const fallbackImpact = totalActual > 0 ? 
                (this.mutationTracking.decisionToPermutationFallbacks / totalActual * 100).toFixed(1) : "0.0";
              
              process.stdout.write(`\n[NATURAL DISTRIBUTION] P=${actualPermutationRatio}% D=${actualDecisionRatio}% | Total: ${totalActual} | Fallbacks: ${fallbackImpact}%`);
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
            
            // FINAL NATURAL DISTRIBUTION SUMMARY
            const totalActual = this.mutationTracking.actualPermutation + this.mutationTracking.actualDecision;
            if (totalActual > 0) {
              const naturalPermutationRatio = (this.mutationTracking.actualPermutation / totalActual * 100).toFixed(1);
              const naturalDecisionRatio = (this.mutationTracking.actualDecision / totalActual * 100).toFixed(1);
              const fallbackRate = (this.mutationTracking.decisionToPermutationFallbacks / totalActual * 100).toFixed(1);
              
              // Validation: total evaluations should match
              const expectedTotal = this.args.evals - 1; // minus initial evaluation
              if (totalActual !== expectedTotal) {
                console.warn(`⚠️  COUNTING MISMATCH: Expected ${expectedTotal} mutations, got ${totalActual}`);
              }
              
              console.log(`\n📊 NATURAL MUTATION DISTRIBUTION RESULTS:`);
              console.log(`   Implementation: ${this.symbolname}`);
              console.log(`   Evaluations: ${totalActual} mutations`);
              console.log(`   Natural Ratio: ${naturalPermutationRatio}% Permutation / ${naturalDecisionRatio}% Decision`);
              console.log(`   Fallbacks: ${this.mutationTracking.decisionToPermutationFallbacks}/${totalActual} (${fallbackRate}%)`);
              console.log(`   Success Rates: P=${(this.mutationTracking.permutationKept/this.mutationTracking.actualPermutation*100).toFixed(1)}% D=${(this.mutationTracking.decisionKept/this.mutationTracking.actualDecision*100).toFixed(1)}%`);
              console.log(`   Intended Permutations: ${this.mutationTracking.actualPermutation - this.mutationTracking.decisionToPermutationFallbacks}`);
              console.log(`   Fallback-induced Permutations: ${this.mutationTracking.decisionToPermutationFallbacks}`);
              if (this.mutationTracking.decisionToPermutationFallbacks > 0) {
                console.log(`   💡 Fallbacks occurred when no operations had "hot" decisions available for mutation`);
              }
              console.log(`   🎯 KEY FINDING: This implementation naturally prefers ${naturalPermutationRatio}% permutation mutations`);
              console.log(``);
            }
            
            // Capture final phase stats
            this.capturePhaseStats(this.currentBetIndex);
            
            // Save bet phase data to shared file if this is a bet phase
            if (this.currentPhase === 'bet') {
              this.saveBetPhaseData();
            }
            
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

  public capturePhaseStats(betIndex?: number): void {
    const endEval = globals.mutationOrder.length;
    const phaseMutations = globals.mutationOrder.slice(this.phaseStartEval);
    
    globals.phaseStats.push({
      phaseType: this.currentPhase,
      betIndex: betIndex,
      seed: String(this.args.seed),
      startEvaluation: this.phaseStartEval + 1, // +1 because first eval is not a mutation
      endEvaluation: endEval,
      mutations: {
        permutation: this.mutationTracking.actualPermutation,
        decision: this.mutationTracking.actualDecision,
        permutationKept: this.mutationTracking.permutationKept,
        decisionKept: this.mutationTracking.decisionKept,
        decisionToPermutationFallbacks: this.mutationTracking.decisionToPermutationFallbacks,
      },
      randomInputsConsumed: globals.totalRandomInputsConsumed - this.phaseStartRandomInputs,
      convergence: [...globals.convergence],
      finalRatio: globals.currentRatio,
      mutationDetails: [...phaseMutations],
    });
  }
  
  public setPhase(phase: 'bet' | 'run', betIndex?: number): void {
    // Capture stats for the previous phase if it had any mutations
    if (globals.mutationOrder.length > this.phaseStartEval) {
      this.capturePhaseStats(this.currentBetIndex);
    }
    
    this.currentPhase = phase;
    this.currentBetIndex = betIndex || 0;
    this.phaseStartEval = globals.mutationOrder.length;
    this.mutationIndexWithinPhase = 0;
    this.phaseStartRandomInputs = globals.totalRandomInputsConsumed;
    
    // Reset mutation tracking for new phase
    this.mutationTracking.actualPermutation = 0;
    this.mutationTracking.actualDecision = 0;
    this.mutationTracking.decisionToPermutationFallbacks = 0;
    this.mutationTracking.permutationKept = 0;
    this.mutationTracking.decisionKept = 0;
    this.mutationTracking.permutationReverted = 0;
    this.mutationTracking.decisionReverted = 0;
    this.mutationTracking.mutationSequence = [];
  }

  private saveBetPhaseData(): void {
    try {
      const betData = {
        betIndex: this.currentBetIndex,
        seed: String(this.args.seed),
        phaseStats: globals.phaseStats,
        mutationOrder: globals.mutationOrder,
        randomInputsPerMutation: Array.from(globals.randomInputsPerMutation.entries()),
        totalRandomInputsConsumed: globals.totalRandomInputsConsumed,
        convergence: globals.convergence,
        finalRatio: globals.currentRatio,
        timestamp: Date.now(),
      };

      // Create shared file path in temp directory
      const sharedFilePath = `/tmp/cryptopt_bet_data_${this.getSymbolname()}.json`;
      
      // Read existing data or create new array
      let allBetData: any[] = [];
      try {
        if (existsSync(sharedFilePath)) {
          const existingData = readFileSync(sharedFilePath, 'utf8');
          allBetData = JSON.parse(existingData);
        }
      } catch (e) {
        // If file doesn't exist or is corrupted, start fresh
        allBetData = [];
      }
      
      // Add this bet's data
      allBetData.push(betData);
      
      // Write back to shared file
      writeFileSync(sharedFilePath, JSON.stringify(allBetData, null, 2));
      
      Logger.log(`Saved bet ${this.currentBetIndex} data to ${sharedFilePath}`);
    } catch (error) {
      Logger.log(`Failed to save bet data: ${error}`);
    }
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
