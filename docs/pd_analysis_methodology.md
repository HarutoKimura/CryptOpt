# Permutation vs Decision Mutation Analysis Methodology

## Overview

This document describes the experimental setup and data collection methodology for analyzing the impact of permutation and decision mutations on CryptOpt's optimization performance.

## Experiment Configuration

### Parameters
- **Total Evaluations**: 10,000 mutations per configuration
- **Bet-and-Run Strategy**: 20 bets × 50 mutations + 9,000 run mutations
- **Bet Ratio**: 0.1 (10% of evaluations for population exploration)

### P:D Ratios Tested
11 configurations from 100:0 to 0:100 in steps of 10:
- P:D = 100:0 (permutation only)
- P:D = 90:10
- P:D = 80:20
- P:D = 70:30
- P:D = 60:40
- P:D = 50:50 (balanced)
- P:D = 40:60
- P:D = 30:70
- P:D = 20:80
- P:D = 10:90
- P:D = 0:100 (decision only)

### Curves Tested
All 10 fiat-crypto curves with both `mul` and `square` operations:
- curve25519
- p224
- p256
- p384
- p434
- p448_solinas
- p521
- poly1305
- secp256k1_dettman
- secp256k1_montgomery

**Total Configurations**: 10 curves × 2 methods × 11 ratios = **220 experiments**

## Mutation Types

### Permutation Mutations
Reorder instructions in the computation schedule by swapping two operations.

**Tracked Features**:
- `distance`: Number of positions between swapped operations
- `minPosition` / `maxPosition`: Range of affected positions
- `chosenPosition` / `partnerPosition`: Actual swap locations

**Distance Categories**:
- Short moves: |distance| < 5 positions
- Medium moves: 5 ≤ |distance| < 15 positions
- Long moves: |distance| ≥ 15 positions

### Decision Mutations
Change implementation choices for specific operations.

**Decision Types**:
- **AR** (DI_CHOOSE_ARG): Select different argument ordering
- **KK** (DI_HANDLE_FLAGS_KK): Flag handling for carry operations
- **FL** (DI_FLAG): General flag decisions
- **MU** (DI_MULTIPLICATION_IMM): Immediate multiplication choices
- **B&** (DI_SPILL_LOCATION): Register spill location decisions

**Tracked Features**:
- `decisionType`: Type of decision being mutated
- `operationIndex`: Which operation is affected
- `hotDecisionsCount`: Number of eligible decisions
- `oldChoice` / `newChoice`: Before and after values

## Data Collection

### Per-Mutation Tracking

Each mutation records:
```json
{
  "phase": "bet" | "run",
  "index": <mutation index within phase>,
  "type": "Permutation" | "Decision" | "Baseline",
  "deltaScore": <performance change in cycles>,
  "evalNumber": <global evaluation number>,
  "performanceBefore": <cycles before mutation>,
  "performanceAfter": <cycles after mutation>,
  "absoluteImprovement": <total improvement from baseline>,
  "features": {
    "permutation": { ... } | "decision": { ... }
  }
}
```

### Performance Measurement

- **Baseline**: Initial performance before any mutations
- **Cycle Count**: CPU cycles measured via hardware performance counters
- **Batch Size**: Multiple measurements per evaluation for statistical stability
- **Improvement**: Calculated as `(baseline - final) / baseline × 100%`

## Output Files

### Per-Experiment Outputs

Located in: `results/pd-analysis/fiat/{symbolname}/evals_10000/p_{P}_d_{D}/`

| File | Description |
|------|-------------|
| `seed*_final_analysis.json` | Clean analysis summary for visualization |
| `seed*_ratio*_metrics.json` | Comprehensive mutation-by-mutation data |
| `seed*_ratio*.asm` | Optimized assembly with statistics comments |
| `seed*.csv` | Mutation log in CSV format |

### Analysis JSON Structure

```json
{
  "metadata": {
    "seed": <random seed>,
    "curve": "curve25519",
    "method": "mul",
    "symbolname": "fiat_curve25519_carry_mul",
    "scheduleRatio": 100,
    "totalEvals": 10000,
    "timestamp": "2024-..."
  },
  "performance": {
    "baseline": <initial cycles>,
    "final": <optimized cycles>,
    "improvementPercent": <percentage>,
    "improvementCycles": <absolute cycles saved>
  },
  "distribution": {
    "totalMutations": 9999,
    "permutation": {
      "count": <number>,
      "percent": <percentage>,
      "kept": <accepted mutations>,
      "successRate": <acceptance percentage>
    },
    "decision": {
      "count": <number>,
      "percent": <percentage>,
      "kept": <accepted mutations>,
      "successRate": <acceptance percentage>
    },
    "fallbacks": <decision→permutation fallbacks>
  },
  "decisionTypes": {
    "AR": { "count": N, "avgDelta": X, "successRate": Y },
    "KK": { ... },
    "FL": { ... },
    "MU": { ... },
    "B&": { ... }
  },
  "permutationDistances": {
    "short": { "count": N, "avgDelta": X, "successRate": Y },
    "medium": { ... },
    "long": { ... }
  },
  "deltaDistribution": {
    "improvements": {
      "count": <improving mutations>,
      "avgDelta": <average improvement>,
      "best": <best single improvement>
    },
    "degradations": {
      "count": <degrading mutations>,
      "avgDelta": <average degradation>,
      "worst": <worst single degradation>
    },
    "overallSuccessRate": <percentage>
  },
  "convergence": [
    { "evalNumber": 1, "performance": <cycles> },
    { "evalNumber": 100, "performance": <cycles> },
    ...
  ]
}
```

## Key Metrics for Analysis

### Primary Metrics
1. **Performance Improvement**: Final speedup over baseline
2. **Success Rate**: Percentage of mutations that improve performance
3. **P:D Effectiveness**: Compare improvements across different ratios

### Secondary Metrics
1. **Convergence Speed**: How quickly optimization reaches good solutions
2. **Decision Type Impact**: Which decision types contribute most
3. **Permutation Distance Effect**: Optimal swap distances
4. **Fallback Frequency**: When decisions fall back to permutations

## Analysis Questions

This experiment aims to answer:

1. **What is the optimal P:D ratio?**
   - Compare final performance across all 11 ratios
   - Identify curve-specific optimal ratios

2. **How do mutation types differ in effectiveness?**
   - Compare success rates: permutation vs decision
   - Analyze average improvement per mutation type

3. **Which decision types are most impactful?**
   - Rank AR, KK, FL, MU, B& by improvement contribution
   - Identify implementation-specific patterns

4. **Does permutation distance matter?**
   - Compare short/medium/long move effectiveness
   - Determine optimal exploration range

5. **How does convergence behavior change?**
   - Compare convergence curves across ratios
   - Identify early vs late optimization patterns

## Execution Details

### Hardware
- CPU: Intel 12th Gen with P-cores and E-cores
- Measurement cores: 3 P-cores (pinned with taskset)
- Performance counters enabled

### Parallelization
- 3 concurrent experiments (one per P-core)
- ~2 minutes per configuration
- Total runtime: ~2.5 hours for all 220 configurations

### Reproducibility
- Random seeds generated per experiment
- Seeds stored in output filenames
- Full mutation history preserved in metrics JSON

## Visualization Suggestions

1. **Heatmap**: Performance improvement by curve × ratio
2. **Bar Chart**: Success rates by mutation type
3. **Line Plot**: Convergence curves for different ratios
4. **Stacked Bar**: Decision type distribution and impact
5. **Box Plot**: Improvement distribution by P:D ratio
