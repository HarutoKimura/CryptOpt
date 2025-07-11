#!/usr/bin/env python3
"""
Compare multiple CryptOpt runs to identify trends
"""

import json
import sys
import glob
from pathlib import Path

def load_metrics(file_path):
    """Load metrics from a JSON file"""
    with open(file_path, 'r') as f:
        return json.load(f)

def extract_key_metrics(data):
    """Extract key metrics from a single run"""
    mutations = data['mutationOrder']
    
    # Separate by type
    perm_deltas = [m['deltaScore'] for m in mutations if m['type'] == 'Permutation']
    dec_deltas = [m['deltaScore'] for m in mutations if m['type'] == 'Decision']
    
    # Calculate stats
    total_mutations = len(mutations)
    perm_count = len(perm_deltas)
    dec_count = len(dec_deltas)
    
    metrics = {
        'file': Path(data.get('_file_path', 'unknown')).name,
        'symbol': data['symbolname'],
        'evals': data['args']['evals'],
        'total_mutations': total_mutations,
        'perm_ratio': perm_count / total_mutations * 100 if total_mutations > 0 else 0,
        'perm_mean': sum(perm_deltas) / len(perm_deltas) if perm_deltas else 0,
        'dec_mean': sum(dec_deltas) / len(dec_deltas) if dec_deltas else 0,
        'perm_positive_rate': sum(1 for d in perm_deltas if d > 0) / len(perm_deltas) * 100 if perm_deltas else 0,
        'dec_positive_rate': sum(1 for d in dec_deltas if d > 0) / len(dec_deltas) * 100 if dec_deltas else 0,
    }
    
    # Add bet phase summary if available
    if 'betPhaseDetails' in data and data['betPhaseDetails']:
        bet_success_rates = []
        for bet in data['betPhaseDetails']:
            if bet.get('phaseStats') and bet['phaseStats']:
                stats = bet['phaseStats'][0]['mutations']
                if stats['permutation'] > 0:
                    bet_success_rates.append(stats['permutationKept'] / stats['permutation'])
        
        metrics['avg_bet_perm_success'] = sum(bet_success_rates) / len(bet_success_rates) * 100 if bet_success_rates else 0
    else:
        metrics['avg_bet_perm_success'] = 0
    
    return metrics

def compare_runs(pattern):
    """Compare all runs matching the pattern"""
    files = glob.glob(pattern)
    if not files:
        print(f"No files found matching pattern: {pattern}")
        return
    
    print(f"Found {len(files)} files to analyze")
    print("=" * 120)
    
    all_metrics = []
    for file_path in sorted(files):
        try:
            data = load_metrics(file_path)
            data['_file_path'] = file_path  # Store for reference
            metrics = extract_key_metrics(data)
            all_metrics.append(metrics)
        except Exception as e:
            print(f"Error processing {file_path}: {e}")
    
    if not all_metrics:
        print("No valid metrics files found")
        return
    
    # Print comparison table
    print(f"{'File':<40} {'Evals':>8} {'P-Ratio':>8} {'P-Mean':>8} {'D-Mean':>8} {'P-Succ':>8} {'D-Succ':>8} {'Bet-P':>8}")
    print("-" * 120)
    
    for m in all_metrics:
        print(f"{m['file']:<40} {m['evals']:>8,} {m['perm_ratio']:>7.1f}% "
              f"{m['perm_mean']:>8.0f} {m['dec_mean']:>8.0f} "
              f"{m['perm_positive_rate']:>7.1f}% {m['dec_positive_rate']:>7.1f}% "
              f"{m['avg_bet_perm_success']:>7.1f}%")
    
    # Summary statistics
    if len(all_metrics) > 1:
        print("\n" + "=" * 120)
        print("SUMMARY ACROSS ALL RUNS:")
        
        avg_perm_ratio = sum(m['perm_ratio'] for m in all_metrics) / len(all_metrics)
        avg_perm_mean = sum(m['perm_mean'] for m in all_metrics) / len(all_metrics)
        avg_dec_mean = sum(m['dec_mean'] for m in all_metrics) / len(all_metrics)
        
        print(f"  Average Permutation Ratio: {avg_perm_ratio:.1f}%")
        print(f"  Average Permutation Mean Δ: {avg_perm_mean:.1f} cycles")
        print(f"  Average Decision Mean Δ: {avg_dec_mean:.1f} cycles")
        print(f"  Performance Advantage: {'Permutation' if avg_perm_mean > avg_dec_mean else 'Decision'} "
              f"by {abs(avg_perm_mean - avg_dec_mean):.1f} cycles")
        
        # Check for trends with evaluation count
        eval_counts = sorted(set(m['evals'] for m in all_metrics))
        if len(eval_counts) > 1:
            print(f"\n  Evaluation counts found: {', '.join(str(e) for e in eval_counts)}")
            print("  Performance by evaluation count:")
            for eval_count in eval_counts:
                runs = [m for m in all_metrics if m['evals'] == eval_count]
                if runs:
                    avg_ratio = sum(r['perm_ratio'] for r in runs) / len(runs)
                    avg_p_mean = sum(r['perm_mean'] for r in runs) / len(runs)
                    avg_d_mean = sum(r['dec_mean'] for r in runs) / len(runs)
                    print(f"    {eval_count:,} evals: P-Ratio={avg_ratio:.1f}%, "
                          f"P-Mean={avg_p_mean:.0f}, D-Mean={avg_d_mean:.0f}")

def main():
    if len(sys.argv) < 2:
        print("Usage: python3 compare_runs.py <pattern>")
        print("Examples:")
        print("  python3 compare_runs.py 'results/fiat/fiat_curve25519_carry_mul/*_metrics.json'")
        print("  python3 compare_runs.py 'results/fiat/*/*/*_metrics.json'")
        sys.exit(1)
    
    pattern = sys.argv[1]
    compare_runs(pattern)

if __name__ == "__main__":
    main()