#!/usr/bin/env python3
"""
Visualize CryptOpt Mutation Sequence Over Time
Shows the order of Permutation (P) and Decision (D) mutations with performance metrics
"""

import json
import matplotlib.pyplot as plt
import numpy as np
from pathlib import Path
import argparse
from datetime import datetime

def load_and_analyze_sequence(metrics_file):
    """Load metrics and analyze mutation sequence"""
    with open(metrics_file, 'r') as f:
        data = json.load(f)
    
    mutations = data['mutationOrder']
    symbol = data['symbolname']
    
    # Extract sequence data
    eval_numbers = []
    mutation_types = []
    delta_scores = []
    mutation_type_numeric = []  # 0 = Permutation, 1 = Decision
    
    for mutation in mutations:
        eval_numbers.append(mutation['evalNumber'])
        mutation_types.append(mutation['type'])
        delta_scores.append(mutation['deltaScore'])
        mutation_type_numeric.append(0 if mutation['type'] == 'Permutation' else 1)
    
    # Calculate rolling metrics
    window_size = 1000  # Calculate metrics over 1000-mutation windows
    
    rolling_success_perm = []
    rolling_success_dec = []
    rolling_delta_perm = []
    rolling_delta_dec = []
    window_centers = []
    
    for i in range(window_size//2, len(mutations) - window_size//2, 100):  # Every 100 mutations
        start_idx = max(0, i - window_size//2)
        end_idx = min(len(mutations), i + window_size//2)
        
        window_mutations = mutations[start_idx:end_idx]
        
        # Separate by type in this window
        perm_deltas = [m['deltaScore'] for m in window_mutations if m['type'] == 'Permutation']
        dec_deltas = [m['deltaScore'] for m in window_mutations if m['type'] == 'Decision']
        
        # Calculate improvement rates (negative delta = improvement)
        perm_improvement_rate = (sum(1 for d in perm_deltas if d < 0) / len(perm_deltas) * 100) if perm_deltas else 0
        dec_improvement_rate = (sum(1 for d in dec_deltas if d < 0) / len(dec_deltas) * 100) if dec_deltas else 0
        
        # Calculate mean deltas
        perm_mean_delta = np.mean(perm_deltas) if perm_deltas else 0
        dec_mean_delta = np.mean(dec_deltas) if dec_deltas else 0
        
        rolling_success_perm.append(perm_improvement_rate)
        rolling_success_dec.append(dec_improvement_rate)
        rolling_delta_perm.append(perm_mean_delta)
        rolling_delta_dec.append(dec_mean_delta)
        window_centers.append(eval_numbers[i])
    
    return {
        'symbol': symbol,
        'eval_numbers': eval_numbers,
        'mutation_types': mutation_types,
        'delta_scores': delta_scores,
        'mutation_type_numeric': mutation_type_numeric,
        'rolling_success_perm': rolling_success_perm,
        'rolling_success_dec': rolling_success_dec,
        'rolling_delta_perm': rolling_delta_perm,
        'rolling_delta_dec': rolling_delta_dec,
        'window_centers': window_centers,
        'total_mutations': len(mutations)
    }

def create_sequence_visualization(data, output_dir='sequence_analysis'):
    """Create comprehensive sequence visualization"""
    output_dir = Path(output_dir)
    output_dir.mkdir(exist_ok=True)
    
    # Create main figure with subplots
    fig = plt.figure(figsize=(20, 16))
    fig.suptitle(f'CryptOpt Mutation Sequence Analysis: {data["symbol"]}\n'
                 f'Total Mutations: {data["total_mutations"]:,}', fontsize=16, fontweight='bold')
    
    # 1. Mutation sequence strip chart (top)
    ax1 = plt.subplot(4, 1, 1)
    
    # Color code mutations: Permutation = blue, Decision = red
    colors = ['#3498db' if t == 'Permutation' else '#e74c3c' for t in data['mutation_types']]
    
    # Create scatter plot showing mutation types over time
    ax1.scatter(data['eval_numbers'], data['mutation_type_numeric'], 
                c=colors, alpha=0.6, s=1, rasterized=True)
    
    ax1.set_ylabel('Mutation Type')
    ax1.set_yticks([0, 1])
    ax1.set_yticklabels(['Permutation', 'Decision'])
    ax1.set_title('Mutation Type Sequence Over Time')
    ax1.grid(True, alpha=0.3)
    ax1.set_xlim(0, max(data['eval_numbers']))
    
    # Add legend
    ax1.scatter([], [], c='#3498db', s=50, label='Permutation', alpha=0.8)
    ax1.scatter([], [], c='#e74c3c', s=50, label='Decision', alpha=0.8)
    ax1.legend(loc='upper right')
    
    # 2. Delta scores over time
    ax2 = plt.subplot(4, 1, 2)
    
    # Plot delta scores with different colors for mutation types
    perm_mask = np.array(data['mutation_type_numeric']) == 0
    dec_mask = np.array(data['mutation_type_numeric']) == 1
    
    ax2.scatter(np.array(data['eval_numbers'])[perm_mask], 
                np.array(data['delta_scores'])[perm_mask],
                c='#3498db', alpha=0.4, s=0.5, label='Permutation', rasterized=True)
    ax2.scatter(np.array(data['eval_numbers'])[dec_mask], 
                np.array(data['delta_scores'])[dec_mask],
                c='#e74c3c', alpha=0.4, s=0.5, label='Decision', rasterized=True)
    
    ax2.axhline(y=0, color='black', linestyle='--', alpha=0.5, linewidth=2)
    ax2.set_ylabel('Delta Score (cycles)')
    ax2.set_title('Performance Delta Over Time (Negative = Better)')
    ax2.legend()
    ax2.grid(True, alpha=0.3)
    
    # Add improvement/degradation zones
    ax2.text(0.02, 0.95, 'IMPROVEMENT ZONE', transform=ax2.transAxes, 
             bbox=dict(boxstyle="round,pad=0.3", facecolor='lightgreen', alpha=0.7),
             fontsize=10, fontweight='bold')
    ax2.text(0.02, 0.05, 'DEGRADATION ZONE', transform=ax2.transAxes,
             bbox=dict(boxstyle="round,pad=0.3", facecolor='lightcoral', alpha=0.7),
             fontsize=10, fontweight='bold')
    
    # 3. Rolling improvement rates
    ax3 = plt.subplot(4, 1, 3)
    
    ax3.plot(data['window_centers'], data['rolling_success_perm'], 
             'o-', color='#3498db', linewidth=2, markersize=4, label='Permutation Improvement Rate')
    ax3.plot(data['window_centers'], data['rolling_success_dec'], 
             's-', color='#e74c3c', linewidth=2, markersize=4, label='Decision Improvement Rate')
    
    ax3.set_ylabel('Improvement Rate (%)')
    ax3.set_title('Rolling Improvement Rate (1000-mutation windows)')
    ax3.legend()
    ax3.grid(True, alpha=0.3)
    ax3.set_ylim(0, max(max(data['rolling_success_perm']), max(data['rolling_success_dec'])) + 5)
    
    # 4. Rolling mean delta scores
    ax4 = plt.subplot(4, 1, 4)
    
    ax4.plot(data['window_centers'], data['rolling_delta_perm'], 
             'o-', color='#3498db', linewidth=2, markersize=4, label='Permutation Mean Δ')
    ax4.plot(data['window_centers'], data['rolling_delta_dec'], 
             's-', color='#e74c3c', linewidth=2, markersize=4, label='Decision Mean Δ')
    
    ax4.axhline(y=0, color='black', linestyle='--', alpha=0.5, linewidth=2)
    ax4.set_ylabel('Mean Delta Score (cycles)')
    ax4.set_xlabel('Evaluation Number')
    ax4.set_title('Rolling Mean Performance Change (1000-mutation windows)')
    ax4.legend()
    ax4.grid(True, alpha=0.3)
    
    plt.tight_layout()
    plt.savefig(output_dir / 'mutation_sequence_analysis.png', dpi=300, bbox_inches='tight')
    plt.close()
    
    # Create detailed statistics
    create_sequence_statistics(data, output_dir)
    
    print(f"✅ Sequence visualization saved to {output_dir}/mutation_sequence_analysis.png")

def create_sequence_statistics(data, output_dir):
    """Create detailed sequence statistics"""
    
    # Calculate overall statistics
    perm_deltas = [data['delta_scores'][i] for i in range(len(data['delta_scores'])) 
                   if data['mutation_type_numeric'][i] == 0]
    dec_deltas = [data['delta_scores'][i] for i in range(len(data['delta_scores'])) 
                  if data['mutation_type_numeric'][i] == 1]
    
    perm_improvement_rate = sum(1 for d in perm_deltas if d < 0) / len(perm_deltas) * 100
    dec_improvement_rate = sum(1 for d in dec_deltas if d < 0) / len(dec_deltas) * 100
    
    perm_mean_delta = np.mean(perm_deltas)
    dec_mean_delta = np.mean(dec_deltas)
    
    # Analyze sequence patterns
    sequence_pattern = ''.join(['P' if t == 'Permutation' else 'D' for t in data['mutation_types']])
    
    # Count consecutive runs
    consecutive_P = []
    consecutive_D = []
    current_run = 1
    current_type = sequence_pattern[0]
    
    for i in range(1, len(sequence_pattern)):
        if sequence_pattern[i] == current_type:
            current_run += 1
        else:
            if current_type == 'P':
                consecutive_P.append(current_run)
            else:
                consecutive_D.append(current_run)
            current_run = 1
            current_type = sequence_pattern[i]
    
    # Add final run
    if current_type == 'P':
        consecutive_P.append(current_run)
    else:
        consecutive_D.append(current_run)
    
    # Generate report
    report_lines = []
    report_lines.append("=" * 80)
    report_lines.append("CRYPTOPT MUTATION SEQUENCE ANALYSIS")
    report_lines.append(f"Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    report_lines.append(f"Symbol: {data['symbol']}")
    report_lines.append("=" * 80)
    
    report_lines.append(f"\n📊 SEQUENCE OVERVIEW:")
    report_lines.append(f"   Total Mutations: {data['total_mutations']:,}")
    report_lines.append(f"   Permutation Count: {len(perm_deltas):,} ({len(perm_deltas)/data['total_mutations']*100:.1f}%)")
    report_lines.append(f"   Decision Count: {len(dec_deltas):,} ({len(dec_deltas)/data['total_mutations']*100:.1f}%)")
    
    report_lines.append(f"\n🎯 PERFORMANCE COMPARISON:")
    report_lines.append(f"   {'Metric':<25} {'Permutation':>15} {'Decision':>15} {'Advantage':>15}")
    report_lines.append(f"   {'-'*25} {'-'*15} {'-'*15} {'-'*15}")
    report_lines.append(f"   {'Improvement Rate':<25} {perm_improvement_rate:>14.1f}% {dec_improvement_rate:>14.1f}% {'Decision' if dec_improvement_rate > perm_improvement_rate else 'Permutation':>15}")
    report_lines.append(f"   {'Mean Delta (cycles)':<25} {perm_mean_delta:>15.1f} {dec_mean_delta:>15.1f} {'Decision' if dec_mean_delta < perm_mean_delta else 'Permutation':>15}")
    
    report_lines.append(f"\n🔄 SEQUENCE PATTERNS:")
    report_lines.append(f"   Average Consecutive Permutations: {np.mean(consecutive_P):.1f} (max: {max(consecutive_P)}, min: {min(consecutive_P)})")
    report_lines.append(f"   Average Consecutive Decisions: {np.mean(consecutive_D):.1f} (max: {max(consecutive_D)}, min: {min(consecutive_D)})")
    report_lines.append(f"   Total Runs: {len(consecutive_P) + len(consecutive_D)}")
    
    # Sample of sequence pattern
    sample_length = min(100, len(sequence_pattern))
    report_lines.append(f"\n📝 SEQUENCE SAMPLE (first {sample_length} mutations):")
    report_lines.append(f"   {sequence_pattern[:sample_length]}")
    
    if len(sequence_pattern) > sample_length:
        report_lines.append(f"   ... (showing first {sample_length} of {len(sequence_pattern)} total)")
    
    # Save report
    report_file = output_dir / 'sequence_analysis_report.txt'
    with open(report_file, 'w') as f:
        f.write('\n'.join(report_lines))
    
    print(f"📄 Sequence analysis report saved to: {report_file}")

def main():
    parser = argparse.ArgumentParser(description='Visualize CryptOpt mutation sequence over time')
    parser.add_argument('metrics_file', help='Path to metrics JSON file')
    parser.add_argument('-o', '--output-dir', default='sequence_analysis',
                       help='Output directory for visualizations')
    
    args = parser.parse_args()
    
    print("📊 Analyzing mutation sequence...")
    data = load_and_analyze_sequence(args.metrics_file)
    
    print("🎨 Creating visualizations...")
    create_sequence_visualization(data, args.output_dir)
    
    print(f"\n✅ Sequence analysis complete! Check {args.output_dir}/ for all outputs.")

if __name__ == "__main__":
    main() 