import { CHOICE } from "@/enums";
import { Paul } from "@/paul";

export type AdaptiveStrategyType = "none" | "ucb1" | "epsilon-greedy" | "thompson-sampling";

export interface ArmStats {
  pulls: number;
  totalReward: number;
  successes: number;
}

export interface AdaptiveSnapshot {
  eval: number;
  permutationProbability: number;
  armStats: { permutation: ArmStats; decision: ArmStats };
}

interface AdaptiveStrategy {
  selectArm(): CHOICE;
  update(arm: CHOICE, reward: number): void;
  getStats(): { permutation: ArmStats; decision: ArmStats };
  getPermutationProbability(): number;
  getHistory(): AdaptiveSnapshot[];
  snapshot(evalNum: number): void;
}

function uniformRandom(): number {
  return Paul.chooseBetween(1_000_000) / 1_000_000;
}

// --- UCB1 ---

class UCB1Strategy implements AdaptiveStrategy {
  private arms: Map<CHOICE, ArmStats> = new Map([
    [CHOICE.PERMUTE, { pulls: 0, totalReward: 0, successes: 0 }],
    [CHOICE.DECISION, { pulls: 0, totalReward: 0, successes: 0 }],
  ]);
  private totalPulls = 0;
  private explorationConstant: number;
  private history: AdaptiveSnapshot[] = [];

  constructor(explorationConstant = Math.SQRT2) {
    this.explorationConstant = explorationConstant;
  }

  selectArm(): CHOICE {
    const perm = this.arms.get(CHOICE.PERMUTE)!;
    const dec = this.arms.get(CHOICE.DECISION)!;

    if (perm.pulls === 0) return CHOICE.PERMUTE;
    if (dec.pulls === 0) return CHOICE.DECISION;

    const ucbPerm =
      perm.totalReward / perm.pulls +
      this.explorationConstant * Math.sqrt(Math.log(this.totalPulls) / perm.pulls);
    const ucbDec =
      dec.totalReward / dec.pulls +
      this.explorationConstant * Math.sqrt(Math.log(this.totalPulls) / dec.pulls);

    if (Math.abs(ucbPerm - ucbDec) < 1e-12) {
      return Paul.chooseBetween(2) === 0 ? CHOICE.PERMUTE : CHOICE.DECISION;
    }
    return ucbPerm > ucbDec ? CHOICE.PERMUTE : CHOICE.DECISION;
  }

  update(arm: CHOICE, reward: number): void {
    const stats = this.arms.get(arm)!;
    stats.pulls++;
    stats.totalReward += reward;
    if (reward > 0) stats.successes++;
    this.totalPulls++;
  }

  getStats() {
    return {
      permutation: { ...this.arms.get(CHOICE.PERMUTE)! },
      decision: { ...this.arms.get(CHOICE.DECISION)! },
    };
  }

  getPermutationProbability(): number {
    const perm = this.arms.get(CHOICE.PERMUTE)!;
    const dec = this.arms.get(CHOICE.DECISION)!;
    if (this.totalPulls === 0) return 0.5;
    if (perm.pulls === 0 || dec.pulls === 0) return 0.5;

    const ucbPerm =
      perm.totalReward / perm.pulls +
      this.explorationConstant * Math.sqrt(Math.log(this.totalPulls) / perm.pulls);
    const ucbDec =
      dec.totalReward / dec.pulls +
      this.explorationConstant * Math.sqrt(Math.log(this.totalPulls) / dec.pulls);

    const total = ucbPerm + ucbDec;
    return total > 0 ? ucbPerm / total : 0.5;
  }

  snapshot(evalNum: number): void {
    this.history.push({
      eval: evalNum,
      permutationProbability: this.getPermutationProbability(),
      armStats: this.getStats(),
    });
  }

  getHistory(): AdaptiveSnapshot[] {
    return this.history;
  }
}

// --- Epsilon-Greedy with decay ---

class EpsilonGreedyStrategy implements AdaptiveStrategy {
  private arms: Map<CHOICE, ArmStats> = new Map([
    [CHOICE.PERMUTE, { pulls: 0, totalReward: 0, successes: 0 }],
    [CHOICE.DECISION, { pulls: 0, totalReward: 0, successes: 0 }],
  ]);
  private totalPulls = 0;
  private initialEpsilon: number;
  private minEpsilon: number;
  private decayRate: number;
  private history: AdaptiveSnapshot[] = [];

  constructor(initialEpsilon = 0.3, minEpsilon = 0.05, decayRate = 0.999) {
    this.initialEpsilon = initialEpsilon;
    this.minEpsilon = minEpsilon;
    this.decayRate = decayRate;
  }

  private get epsilon(): number {
    return Math.max(this.minEpsilon, this.initialEpsilon * Math.pow(this.decayRate, this.totalPulls));
  }

  selectArm(): CHOICE {
    const perm = this.arms.get(CHOICE.PERMUTE)!;
    const dec = this.arms.get(CHOICE.DECISION)!;

    if (perm.pulls === 0) return CHOICE.PERMUTE;
    if (dec.pulls === 0) return CHOICE.DECISION;

    const explore = uniformRandom() < this.epsilon;
    if (explore) {
      return Paul.chooseBetween(2) === 0 ? CHOICE.PERMUTE : CHOICE.DECISION;
    }

    const meanPerm = perm.totalReward / perm.pulls;
    const meanDec = dec.totalReward / dec.pulls;

    if (Math.abs(meanPerm - meanDec) < 1e-12) {
      return Paul.chooseBetween(2) === 0 ? CHOICE.PERMUTE : CHOICE.DECISION;
    }
    return meanPerm > meanDec ? CHOICE.PERMUTE : CHOICE.DECISION;
  }

  update(arm: CHOICE, reward: number): void {
    const stats = this.arms.get(arm)!;
    stats.pulls++;
    stats.totalReward += reward;
    if (reward > 0) stats.successes++;
    this.totalPulls++;
  }

  getStats() {
    return {
      permutation: { ...this.arms.get(CHOICE.PERMUTE)! },
      decision: { ...this.arms.get(CHOICE.DECISION)! },
    };
  }

  getPermutationProbability(): number {
    const perm = this.arms.get(CHOICE.PERMUTE)!;
    const dec = this.arms.get(CHOICE.DECISION)!;
    if (this.totalPulls === 0) return 0.5;
    if (perm.pulls === 0 || dec.pulls === 0) return 0.5;

    const meanPerm = perm.totalReward / perm.pulls;
    const meanDec = dec.totalReward / dec.pulls;
    const eps = this.epsilon;

    if (meanPerm > meanDec) {
      return (1 - eps) + eps * 0.5;
    } else if (meanDec > meanPerm) {
      return eps * 0.5;
    }
    return 0.5;
  }

  snapshot(evalNum: number): void {
    this.history.push({
      eval: evalNum,
      permutationProbability: this.getPermutationProbability(),
      armStats: this.getStats(),
    });
  }

  getHistory(): AdaptiveSnapshot[] {
    return this.history;
  }
}

// --- Thompson Sampling ---

function sampleGamma(shape: number): number {
  if (shape < 1) {
    const u = uniformRandom() || 1e-10;
    return sampleGamma(shape + 1) * Math.pow(u, 1.0 / shape);
  }

  // Marsaglia and Tsang's method for shape >= 1
  const d = shape - 1.0 / 3.0;
  const c = 1.0 / Math.sqrt(9.0 * d);

  for (;;) {
    let x: number;
    let v: number;
    do {
      // Box-Muller for standard normal using Paul's PRNG
      const u1 = uniformRandom() || 1e-10;
      const u2 = uniformRandom() || 1e-10;
      x = Math.sqrt(-2.0 * Math.log(u1)) * Math.cos(2.0 * Math.PI * u2);
      v = 1.0 + c * x;
    } while (v <= 0);

    v = v * v * v;
    const u = uniformRandom() || 1e-10;

    if (u < 1.0 - 0.0331 * (x * x) * (x * x)) {
      return d * v;
    }
    if (Math.log(u) < 0.5 * x * x + d * (1.0 - v + Math.log(v))) {
      return d * v;
    }
  }
}

function sampleBeta(alpha: number, beta: number): number {
  const x = sampleGamma(alpha);
  const y = sampleGamma(beta);
  return x / (x + y);
}

class ThompsonSamplingStrategy implements AdaptiveStrategy {
  private arms: Map<CHOICE, ArmStats> = new Map([
    [CHOICE.PERMUTE, { pulls: 0, totalReward: 0, successes: 0 }],
    [CHOICE.DECISION, { pulls: 0, totalReward: 0, successes: 0 }],
  ]);
  private history: AdaptiveSnapshot[] = [];

  selectArm(): CHOICE {
    const perm = this.arms.get(CHOICE.PERMUTE)!;
    const dec = this.arms.get(CHOICE.DECISION)!;

    // Beta(successes + 1, failures + 1) prior
    const permSample = sampleBeta(perm.successes + 1, perm.pulls - perm.successes + 1);
    const decSample = sampleBeta(dec.successes + 1, dec.pulls - dec.successes + 1);

    return permSample >= decSample ? CHOICE.PERMUTE : CHOICE.DECISION;
  }

  update(arm: CHOICE, reward: number): void {
    const stats = this.arms.get(arm)!;
    stats.pulls++;
    stats.totalReward += reward;
    if (reward > 0) stats.successes++;
  }

  getStats() {
    return {
      permutation: { ...this.arms.get(CHOICE.PERMUTE)! },
      decision: { ...this.arms.get(CHOICE.DECISION)! },
    };
  }

  getPermutationProbability(): number {
    const perm = this.arms.get(CHOICE.PERMUTE)!;
    const dec = this.arms.get(CHOICE.DECISION)!;
    const alphaPerm = perm.successes + 1;
    const betaPerm = perm.pulls - perm.successes + 1;
    const alphaDec = dec.successes + 1;
    const betaDec = dec.pulls - dec.successes + 1;
    const meanPerm = alphaPerm / (alphaPerm + betaPerm);
    const meanDec = alphaDec / (alphaDec + betaDec);
    const total = meanPerm + meanDec;
    return total > 0 ? meanPerm / total : 0.5;
  }

  snapshot(evalNum: number): void {
    this.history.push({
      eval: evalNum,
      permutationProbability: this.getPermutationProbability(),
      armStats: this.getStats(),
    });
  }

  getHistory(): AdaptiveSnapshot[] {
    return this.history;
  }
}

// --- Factory ---

export function createAdaptiveStrategy(type: AdaptiveStrategyType): AdaptiveStrategy | null {
  switch (type) {
    case "none":
      return null;
    case "ucb1":
      return new UCB1Strategy();
    case "epsilon-greedy":
      return new EpsilonGreedyStrategy();
    case "thompson-sampling":
      return new ThompsonSamplingStrategy();
    default:
      throw new Error(`Unknown adaptive strategy: ${type}`);
  }
}

export type { AdaptiveStrategy };
