#!/usr/bin/env python3
"""
Custom visualization for CryptOpt mutation sequences
Handles cases where only one mutation type exists
"""

import json
import matplotlib.pyplot as plt
import numpy as np
from pathlib import Path
import sys
import argparse

def analyze_mutation_sequence(metrics_file, output_dir=None):
    """Load and analyze the mutation sequence"""
    with open(metrics_file, 'r') as f:
        data = json.load(f)
    
    mutations = data['mutationOrder']
    symbol = data['symbolname']
    
    # Count mutation types
    perm_count = sum(1 for m in mutations if m['type'] == 'Permutation')
    dec_count = sum(1 for m in mutations if m['type'] == 'Decision')
    
    print(f"\n📊 MUTATION SEQUENCE ANALYSIS")
    print(f"Symbol: {symbol}")
    print(f"Total mutations: {len(mutations)}")
    print(f"Permutation mutations: {perm_count} ({perm_count/len(mutations)*100:.1f}%)")
    print(f"Decision mutations: {dec_count} ({dec_count/len(mutations)*100:.1f}%)")
    
    # Prepare data
    eval_numbers = [m['evalNumber'] for m in mutations]
    mutation_y = [0 if m['type'] == 'Permutation' else 1 for m in mutations]

    # Create visualization
    fig, axes = plt.subplots(2, 1, figsize=(15, 10))
    fig.suptitle(f'Mutation Sequence Analysis: {symbol}\nTotal: {len(mutations)} mutations', fontsize=14)

    # 1. Delta scores over time
    ax2 = axes[0]
    delta_scores = [m['deltaScore'] for m in mutations]
    
    # Separate by type
    perm_evals = [m['evalNumber'] for m in mutations if m['type'] == 'Permutation']
    perm_deltas = [m['deltaScore'] for m in mutations if m['type'] == 'Permutation']
    dec_evals = [m['evalNumber'] for m in mutations if m['type'] == 'Decision']
    dec_deltas = [m['deltaScore'] for m in mutations if m['type'] == 'Decision']
    
    if perm_evals:
        ax2.scatter(perm_evals, perm_deltas, c='blue', alpha=0.4, s=0.5, label=f'Permutation (n={len(perm_evals)})')
    if dec_evals:
        ax2.scatter(dec_evals, dec_deltas, c='red', alpha=0.4, s=0.5, label=f'Decision (n={len(dec_evals)})')
    
    ax2.axhline(y=0, color='black', linestyle='--', alpha=0.5)
    ax2.set_ylabel('Delta Score (cycles)')
    ax2.set_title('Performance Delta (Negative = Better)')
    ax2.legend()
    ax2.grid(True, alpha=0.3)
    
    # 2. Rolling ratio (window 500)
    ax_ratio = axes[1]
    window=500
    ratios=[]; centers=[]
    half=window//2
    for i in range(half, len(mutations)-half):
        window_types = mutation_y[i-half:i+half]
        p=sum(1 for t in window_types if t==0)
        ratios.append(p/len(window_types)*100)
        centers.append(eval_numbers[i])
    if ratios:
        ax_ratio.plot(centers, ratios, color='#2ecc71')
    ax_ratio.set_ylim(0,100)
    ax_ratio.set_ylabel('% Permutation')
    ax_ratio.set_xlabel('Evaluation Number')
    ax_ratio.set_title(f'Rolling Permutation Ratio (window={window})')
    ax_ratio.grid(True, alpha=0.3)

    # Layout
    
    # Save outputs
    if output_dir is None:
        output_dir = Path('mutation_sequence_output')
    else:
        output_dir = Path(output_dir)
    output_dir.mkdir(exist_ok=True)
    
    plt.savefig(output_dir / 'mutation_sequence_visualization.png', dpi=300, bbox_inches='tight')
    print(f"\n✅ Visualization saved to {output_dir / 'mutation_sequence_visualization.png'}")
    
    # Generate sequence pattern sample
    sequence_pattern = ''.join(['P' if m['type'] == 'Permutation' else 'D' for m in mutations[:200]])
    
    # Save report
    report_lines = []
    report_lines.append("="*80)
    report_lines.append(f"MUTATION SEQUENCE ANALYSIS REPORT")
    report_lines.append(f"Symbol: {symbol}")
    report_lines.append("="*80)
    report_lines.append(f"\nSUMMARY:")
    report_lines.append(f"  Total mutations: {len(mutations)}")
    report_lines.append(f"  Permutation: {perm_count} ({perm_count/len(mutations)*100:.1f}%)")
    report_lines.append(f"  Decision: {dec_count} ({dec_count/len(mutations)*100:.1f}%)")
    
    if perm_deltas:
        perm_improvements = sum(1 for d in perm_deltas if d < 0)
        report_lines.append(f"\nPERMUTATION MUTATIONS:")
        report_lines.append(f"  Improvements: {perm_improvements}/{len(perm_deltas)} ({perm_improvements/len(perm_deltas)*100:.1f}%)")
        report_lines.append(f"  Mean delta: {np.mean(perm_deltas):.2f} cycles")
    
    if dec_deltas:
        dec_improvements = sum(1 for d in dec_deltas if d < 0)
        report_lines.append(f"\nDECISION MUTATIONS:")
        report_lines.append(f"  Improvements: {dec_improvements}/{len(dec_deltas)} ({dec_improvements/len(dec_deltas)*100:.1f}%)")
        report_lines.append(f"  Mean delta: {np.mean(dec_deltas):.2f} cycles")
    
    report_lines.append(f"\nSEQUENCE PATTERN (first 200 mutations):")
    report_lines.append(f"  {sequence_pattern}")
    
    report_file = output_dir / 'mutation_sequence_report.txt'
    with open(report_file, 'w') as f:
        f.write('\n'.join(report_lines))
    
    print(f"📄 Report saved to {report_file}")
    
    return data

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Analyze CryptOpt mutation sequences')
    parser.add_argument('metrics_file', help='Path to metrics JSON file')
    parser.add_argument('-o', '--output-dir', help='Output directory for visualization', default=None)
    args = parser.parse_args()
    
    analyze_mutation_sequence(args.metrics_file, args.output_dir) 