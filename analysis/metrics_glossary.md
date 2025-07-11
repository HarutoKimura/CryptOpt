# CryptOpt Metrics Glossary

## 🚨 **CORRECTED VERSION** 🚨

**This document has been updated with the correct delta interpretation.**

---

## Understanding CryptOpt Performance Data

### Core Performance Metrics

#### **Delta Score (Δ)**
- **Definition**: The performance difference in CPU cycles between the new mutated function and the previous best function
- **Formula**: `Δ = currentScore - previousScore`
- **CRITICAL:** Scores are measured in **CPU cycles**, where **lower = better performance**

**Correct Interpretation:**
- **Negative Δ (e.g., -100):** Current function uses **100 FEWER cycles** → **BETTER performance** ✅
- **Positive Δ (e.g., +100):** Current function uses **100 MORE cycles** → **WORSE performance** ❌
- **Zero Δ:** No performance change

**Example Calculation**:
```
Previous function: 1000 cycles
Current function:   900 cycles  
→ Δ = 900 - 1000 = -100 cycles = IMPROVEMENT (100 cycles faster)

Previous function: 1000 cycles  
Current function:  1100 cycles
→ Δ = 1100 - 1000 = +100 cycles = DEGRADATION (100 cycles slower)
```

#### **Mean Delta (cycles)**
- **Definition**: Average delta score across all mutations of a specific type
- **Current Results**: 
  - Permutation: +184.3 cycles (average improvement)
  - Decision: +142.3 cycles (average improvement)
- **Note**: Both positive values indicate overall improvement trends

#### **Median Delta**
- **Definition**: The middle value when all delta scores are sorted
- **Purpose**: Less affected by extreme outliers than mean
- **Current Results**:
  - Permutation: +154.0 cycles
  - Decision: +60.0 cycles

### Success Metrics

#### **Success Rate (Actually Kept)**
- **Definition**: Percentage of mutations that were **actually accepted** by the optimizer
- **Source**: Tracked from bet phases where we monitor kept/reverted mutations
- **Current Results**:
  - Permutation: 28.2%
  - Decision: 34.2%
- **Key Insight**: This is the real success rate

#### **Improvement Rate (Δ<0)**
- **Definition**: Percentage of mutations that made the function **faster** (fewer cycles)
- **Calculation**: `(mutations_with_negative_delta / total_mutations) × 100`
- **Correct Understanding**: This should be **lower** than the old "positive delta rate" because most mutations actually hurt performance.

#### **Made Worse Rate (Δ>0)**
- **Definition**: Percentage of mutations that made the function **slower** (more cycles)
- **Calculation**: `(mutations_with_positive_delta / total_mutations) × 100`
- **Expected Range**: 60-80% (most mutations hurt performance - this is normal!)

#### **The Success Rate Paradox**
Many mutations improve performance (positive delta) but are still rejected:
- ~80% of mutations improve their function
- Only ~30% are actually kept
- **Why?** Even if mutation A improves, mutation B might still be better overall

### Distribution Metrics

#### **Natural Distribution**
- **Definition**: The ratio of mutation types chosen by random selection (no forced bias)
- **Current Result**: 50.4% Permutation / 49.6% Decision
- **Significance**: Shows system naturally balances near 50/50

#### **Standard Deviation (σ)**
- **Definition**: Measure of how spread out the delta scores are
- **Current Results**:
  - Permutation: σ = 1800.3 cycles
  - Decision: σ = 1732.3 cycles
- **Interpretation**: Higher σ = more variable results (higher risk/reward)

### Temporal Metrics

#### **Optimization Stages**
- **Early (0-25%)**: First quarter of mutations
- **Mid (25-75%)**: Middle half of mutations  
- **Late (75-100%)**: Final quarter of mutations

**Performance by Stage**:
```
Stage    | Permutation Avg | Decision Avg | Pattern
---------|----------------|--------------|----------
Early    | +171.2 cycles  | +8.3 cycles  | P >> D
Mid      | +179.4 cycles  | +192.5 cycles| P ≈ D  
Late     | +207.7 cycles  | +172.5 cycles| P > D
```

### Competition Context

#### **The A vs B Function Battle**
CryptOpt maintains two versions of the function (A and B):
1. **Current best** function
2. **Newly mutated** function

**Decision Process**:
1. Apply mutation to create new function
2. Measure both functions' performance  
3. Keep the better performing one
4. **Key**: Even if new function improves, it might not be better than the other version

#### **Why Good Improvements Get Rejected**
```
Scenario:
Function A (current): 1000 cycles
Function B (baseline): 900 cycles  <- This is better
New mutation of A: 950 cycles      <- Improved by 50 cycles!

Result: Mutation REJECTED because B (900) still beats improved A (950)
Delta: +50 cycles improvement, but not kept!
```

## The Permutation Paradox

### **The Mystery Your Supervisor Identified**

**Observed Pattern**:
- ✅ **Permutations**: Higher average improvement (+184.3 vs +142.3 cycles)
- ❌ **Permutations**: Lower success rate (28.2% vs 34.2%)

**The Question**: Why do mutations with bigger improvements get rejected more often?

### **Possible Explanations**

#### **1. High-Risk, High-Reward Hypothesis**
- Permutations make more dramatic changes
- Higher variance: bigger wins AND bigger losses
- More rejections despite better average performance

#### **2. Timing Sensitivity Hypothesis**  
- Permutations might be more effective at certain optimization stages
- Success depends on current algorithm state
- Context matters more than raw improvement

#### **3. Competition Bias Hypothesis**
- Delta measured against previous function, not competitor
- Large improvements might coincide with strong competitor functions
- Measurement doesn't capture competitive landscape

#### **4. Mutation Scope Hypothesis**
- Permutations might change more aspects of the function
- Broader changes = more opportunities for improvement OR rejection
- Decisions might make safer, incremental changes

### **Testing These Hypotheses**

To determine which explanation is correct, we need:

1. **Variance Analysis**: Compare improvement distributions
2. **Temporal Success Tracking**: When do each type succeed?
3. **Competitive Context**: Track performance vs both functions
4. **Risk-Adjusted Metrics**: Account for variability
5. **Rejection Reason Analysis**: Why exactly are mutations rejected?

### **Metrics to Add**

1. **Improvement Variance**: σ² of delta scores by type
2. **Risk-Adjusted Return**: Mean improvement / Standard deviation  
3. **Margin of Victory/Defeat**: How close were the competitions?
4. **Stage-Specific Success**: Success rates by optimization phase
5. **Competitive Gap**: Performance difference between A and B functions

---

## Using This Information

### **For Researchers**
- Focus on success rate, not just positive delta rate
- Consider the competitive context when interpreting improvements
- Analyze timing and variance, not just averages

### **For Algorithm Development**
- The 50/50 natural balance might not be optimal
- Consider adaptive ratios based on optimization stage
- Account for risk tolerance in mutation selection

### **For Future Experiments**
- Test different ratios: 70/30, 30/70, etc.
- Measure risk-adjusted performance
- Track competitive context more precisely