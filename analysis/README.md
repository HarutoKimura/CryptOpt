# CryptOpt Analysis Results

## 🚨 **CRITICAL CORRECTION NOTICE** 🚨

**IMPORTANT:** Previous analysis reports contained a **fundamental error** in interpreting performance deltas.

### ✅ **USE THE CORRECTED ANALYSIS:**
- **📄 `supervisor_results/FINAL_CORRECTED_ANALYSIS.md`** - **CORRECT results and interpretation**
- **📊 `square_corrected_final/` & `mul_corrected_final/`** - **CORRECT analysis outputs**

### ❌ **DEPRECATED - DO NOT USE:**
- ~~`supervisor_results/comprehensive_analysis_report.md`~~ - Contains critical error
- ~~`analysis_output_fixed/` folders~~ - Based on wrong interpretation
- ~~`cryptopt_analysis/` folders~~ - Based on wrong interpretation

### **What Was Wrong:**
- ❌ **WRONG:** Positive Δ = "improvement" 
- ✅ **CORRECT:** Positive Δ = more cycles = **WORSE performance**
- ✅ **CORRECT:** Negative Δ = fewer cycles = **BETTER performance**

### **Corrected Key Findings:**
1. **Decision mutations are consistently BETTER** than Permutation mutations
2. **Most mutations (67-80%) actually HURT performance** - this is normal
3. **Success rates (20-30%) are reasonable** given the challenge
4. **No paradox existed** - it was an interpretation error

---

# Original Analysis Documentation ~~[DEPRECATED]~~

# CryptOpt Analysis Tools

This directory contains Python scripts for analyzing CryptOpt mutation effectiveness data.

## Key Finding: Success Rate vs Positive Delta Rate

The analysis revealed an important distinction:
- **Positive Delta Rate** (~80%): Percentage of mutations that improve the current function
- **Actual Success Rate** (~30%): Percentage of mutations that are actually kept by the optimizer

Why the difference? Even if a mutation improves the current function (positive delta), it may still be rejected if the other function (A or B) performs better.

## Setup

Using `uv` for Python environment management:

```bash
cd analysis
uv venv
source .venv/bin/activate  # On Linux/Mac
# or
.venv\Scripts\activate  # On Windows

uv pip install matplotlib numpy pandas seaborn
```

## Scripts

### 1. `supervisor_analysis.py` - Supervisor's Question Analysis (NEW!)
Addresses the specific paradox identified by your supervisor: "Why do Permutations show higher average improvement but lower success rates?"

```bash
python3 supervisor_analysis.py path/to/metrics.json -o supervisor_output
```

**Key Finding**: The paradox is explained by **risk/variance differences**. Permutations are high-risk, high-reward mutations that show both bigger improvements AND bigger failures, leading to more rejections despite better average performance.

Generates:
- `permutation_paradox_analysis.png`: Core paradox visualization
- `risk_analysis_detailed.png`: Variance and risk metrics
- `hypothesis_testing_results.png`: Evidence for different explanations
- `supervisor_analysis_report.txt`: Comprehensive answer to the supervisor

### 2. `analyze_metrics_fixed.py` - Main Analysis Tool (Recommended)
Provides comprehensive analysis with correct success rate calculations.

```bash
python3 analyze_metrics_fixed.py path/to/metrics.json -o output_dir
```

Generates:
- `mutation_analysis_fixed.png`: Overview with distribution, success rates, and performance
- `success_rate_analysis.png`: Detailed explanation of success vs positive delta rates
- `analysis_report_fixed.txt`: Text report with key findings

### 2. `simple_analysis.py` - Quick Text Analysis
Basic analysis without dependencies (uses only standard library).

```bash
python3 simple_analysis.py path/to/metrics.json
```

### 3. `compare_runs.py` - Compare Multiple Runs
Compare metrics across multiple experiments.

```bash
python3 compare_runs.py 'results/fiat/fiat_curve25519_carry_mul/*_metrics.json'
```

### 4. `analyze_metrics.py` - Original Analysis (Deprecated)
Original version with inflated success rates. Use `analyze_metrics_fixed.py` instead.

## Key Metrics Explained

### Natural Distribution
The ratio of Permutation vs Decision mutations chosen by the random selector (should be ~50/50).

### Actual Success Rate
Percentage of mutations that are kept (from bet phase data where we track kept/reverted).
- **Permutation**: ~28.2%
- **Decision**: ~34.2%

### Positive Delta Rate
Percentage of mutations that show positive performance improvement.
- **Permutation**: ~81.6%
- **Decision**: ~72.9%

### Mean Delta Score
Average performance change in CPU cycles.
- **Permutation**: +184.3 cycles
- **Decision**: +142.3 cycles

## Interpretation

1. **High Rejection Rate**: ~50% of mutations that improve performance are still rejected
2. **Permutation vs Decision**: 
   - Permutations have higher average improvement but lower success rate
   - Decisions have lower average improvement but higher success rate
3. **Natural Balance**: System maintains near 50/50 distribution naturally

## Supervisor's Paradox - Solved! 🎯

### **The Question**
"Why do Permutations show higher average improvement but lower success rates than Decisions?"

### **The Answer** 
**Risk/Variance Differences**: Permutations are high-risk, high-reward mutations. They show:
- ✅ Higher average improvement (+184.3 vs +142.3 cycles) 
- ❌ Lower success rate (28.2% vs 34.2%)
- 📊 Higher variance (1.08x more variable)

**Why?** Like high-risk investments, Permutations have bigger wins AND bigger losses. The optimizer correctly rejects more Permutation attempts because they fail more dramatically when they fail.

### **Evidence**
1. **Variance Analysis**: Permutations show 1.08x higher variance
2. **Extreme Values**: Worse worst-case scenarios for Permutations  
3. **Temporal Patterns**: Success varies by optimization stage
4. **Risk-Adjusted Returns**: Permutations still outperform when accounting for risk

### **Implications for Algorithm Design**
- Consider **adaptive ratios** by optimization stage (more Permutations early, more Decisions late)
- Add **risk tolerance parameters** 
- Track **risk-adjusted performance** metrics
- Test **conservative vs aggressive** strategies

## Future Analysis

When testing different mutation ratios (e.g., 70:30, 30:70), use these tools to compare:
- How success rates change with different ratios
- Whether forcing more Permutations (higher avg improvement) yields better results
- If stage-specific ratios (70% P early, 30% P late) work better than fixed 50/50
- Risk-adjusted performance across different strategies