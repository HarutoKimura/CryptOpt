#!/usr/bin/env python3
"""
Create basic plots for CryptOpt analysis using matplotlib
"""

import json
import sys
import matplotlib.pyplot as plt
import numpy as np

def load_and_analyze(metrics_file):
    with open(metrics_file, 'r') as f:
        data = json.load(f)
    
    mutations = data['mutationOrder']
    
    # Separate by type
    perm_data = [(i, m['deltaScore']) for i, m in enumerate(mutations) if m['type'] == 'Permutation']
    dec_data = [(i, m['deltaScore']) for i, m in enumerate(mutations) if m['type'] == 'Decision']
    
    return perm_data, dec_data, len(mutations)

def create_plots(perm_data, dec_data, total_mutations, output_prefix):
    # Create figure with subplots
    fig, ((ax1, ax2), (ax3, ax4)) = plt.subplots(2, 2, figsize=(15, 12))
    
    # Extract data
    perm_indices, perm_deltas = zip(*perm_data) if perm_data else ([], [])
    dec_indices, dec_deltas = zip(*dec_data) if dec_data else ([], [])
    
    # 1. Scatter plot: Performance over time
    ax1.scatter(perm_indices, perm_deltas, alpha=0.6, s=1, c='blue', label='Permutation')
    ax1.scatter(dec_indices, dec_deltas, alpha=0.6, s=1, c='orange', label='Decision')
    ax1.set_xlabel('Mutation Index')
    ax1.set_ylabel('Delta Score (cycles)')
    ax1.set_title('Performance Improvement Over Time')
    ax1.legend()
    ax1.grid(True, alpha=0.3)
    ax1.axhline(y=0, color='red', linestyle='--', alpha=0.5)
    
    # 2. Rolling average mutation ratio
    window = 100
    all_mutations = [(i, 'Permutation' if any(i == pi for pi, _ in perm_data) else 'Decision') 
                     for i in range(total_mutations)]
    
    rolling_perm_pct = []
    indices = []
    for i in range(window, total_mutations - window):
        window_mutations = all_mutations[i-window//2:i+window//2]
        perm_count = sum(1 for _, mtype in window_mutations if mtype == 'Permutation')
        perm_pct = perm_count / len(window_mutations) * 100
        rolling_perm_pct.append(perm_pct)
        indices.append(i)
    
    ax2.plot(indices, rolling_perm_pct, 'b-', linewidth=2)
    ax2.axhline(y=50, color='red', linestyle='--', alpha=0.5, label='50% baseline')
    ax2.set_xlabel('Mutation Index')
    ax2.set_ylabel('Permutation %')
    ax2.set_title(f'Mutation Type Distribution (Rolling {window}-mutation average)')
    ax2.legend()
    ax2.grid(True, alpha=0.3)
    ax2.set_ylim(0, 100)
    
    # 3. Histogram comparison
    bins = np.linspace(-5000, 5000, 50)
    ax3.hist(perm_deltas, bins=bins, alpha=0.7, label='Permutation', density=True, color='blue')
    ax3.hist(dec_deltas, bins=bins, alpha=0.7, label='Decision', density=True, color='orange')
    ax3.set_xlabel('Delta Score (cycles)')
    ax3.set_ylabel('Density')
    ax3.set_title('Delta Score Distribution')
    ax3.legend()
    ax3.grid(True, alpha=0.3)
    ax3.axvline(x=0, color='red', linestyle='--', alpha=0.5)
    
    # 4. Box plot comparison
    box_data = [list(perm_deltas), list(dec_deltas)]
    box_labels = ['Permutation', 'Decision']
    bp = ax4.boxplot(box_data, labels=box_labels, patch_artist=True)
    bp['boxes'][0].set_facecolor('lightblue')
    bp['boxes'][1].set_facecolor('orange')
    ax4.set_ylabel('Delta Score (cycles)')
    ax4.set_title('Delta Score Distribution (Box Plot)')
    ax4.grid(True, alpha=0.3)
    ax4.axhline(y=0, color='red', linestyle='--', alpha=0.5)
    
    plt.tight_layout()
    plt.savefig(f'{output_prefix}_analysis.png', dpi=300, bbox_inches='tight')
    plt.show()
    
    # Statistics summary
    perm_mean = np.mean(perm_deltas) if perm_deltas else 0
    dec_mean = np.mean(dec_deltas) if dec_deltas else 0
    perm_std = np.std(perm_deltas) if perm_deltas else 0
    dec_std = np.std(dec_deltas) if dec_deltas else 0
    
    print(f"\nPlot saved as '{output_prefix}_analysis.png'")
    print(f"Permutation: μ={perm_mean:.1f}, σ={perm_std:.1f}")
    print(f"Decision:    μ={dec_mean:.1f}, σ={dec_std:.1f}")

def main():
    if len(sys.argv) < 2:
        print("Usage: python3 plot_analysis.py <metrics_file.json> [output_prefix]")
        sys.exit(1)
    
    metrics_file = sys.argv[1]
    output_prefix = sys.argv[2] if len(sys.argv) > 2 else "cryptopt"
    
    try:
        perm_data, dec_data, total_mutations = load_and_analyze(metrics_file)
        create_plots(perm_data, dec_data, total_mutations, output_prefix)
        
    except Exception as e:
        print(f"Error: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()