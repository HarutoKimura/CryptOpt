# CryptOpt Instrumentation & Logging Enhancement Summary

## Overview
This implementation extends CryptOpt's instrumentation to capture detailed metrics for both bet and run phases, enabling comprehensive analysis of mutation performance.

## Key Features Implemented

### 1. Bet-Phase Statistics Capture ✓
- Added `BetPhaseStats` interface to track per-bet metrics
- Captures mutation counts, success rates, and convergence data for each bet
- Integrated with existing optimizer flow via `captureBetPhaseStats()` method

### 2. Random Input Counting ✓
- Tracks distinct random inputs per mutation: `batchSize * numBatches`
- Maintains running total via `totalRandomInputsConsumed`
- Per-mutation counts stored in `randomInputsPerMutation` Map

### 3. Mutation Order & Performance Tracking ✓
- New `MutationOrderEntry` interface captures:
  - Phase (bet/run)
  - Index within phase
  - Type (Permutation/Decision)
  - Performance delta (Δ-score)
  - Evaluation number
- Tracks signed performance deltas for each mutation

### 4. Metrics Export ✓
- Exports comprehensive JSON file to `./results/metrics_<timestamp>.json`
- Includes:
  - Complete mutation order history
  - Bet phase statistics
  - Random input usage
  - Existing metrics (convergence, mutation log)
  - Summary statistics

## Implementation Details

### Modified Files:
1. **src/types/CryptoptGlobals.interface.ts**: Extended with new tracking interfaces
2. **src/helper/globals.ts**: Initialized new global tracking structures
3. **src/optimizer/optimizer.class.ts**: 
   - Added phase tracking and performance delta calculation
   - Integrated random input counting
   - Added bet phase capture methods
4. **src/CryptOpt.ts**: 
   - Modified to capture bet stats after each bet
   - Added JSON export functionality

### Data Schema:
```json
{
  "timestamp": "ISO 8601 timestamp",
  "symbolname": "implementation name",
  "mutationOrder": [
    {
      "phase": "bet|run",
      "index": "mutation index within phase",
      "type": "Permutation|Decision",
      "deltaScore": "signed performance delta",
      "evalNumber": "evaluation number"
    }
  ],
  "betPhaseStats": [...],
  "randomInputsPerMutation": [...],
  "totalRandomInputsConsumed": "total count",
  "mutationSummary": {...}
}
```