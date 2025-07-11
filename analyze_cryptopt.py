#!/usr/bin/env python3
"""
CryptOpt Mutation Analysis Tool
Analyzes the effectiveness of Permutation vs Decision mutations
"""

import json
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import numpy as np
from pathlib import Path
import argparse

def load_metrics(metrics_file):
    """Load and parse CryptOpt metrics JSON file"""
    with open(metrics_file, 'r') as f:
        return json.load(f)

def analyze_mutations(data):
    """Analyze mutation patterns and effectiveness"""
    
    # Convert mutation order to DataFrame
    mutations_df = pd.DataFrame(data['mutationOrder'])
    
    # Add optimization stage (early/mid/late)
    total_mutations = len(mutations_df)
    mutations_df['stage'] = pd.cut(
        mutations_df['evalNumber'], 
        bins=[0, total_mutations*0.25, total_mutations*0.75, total_mutations],
        labels=['Early', 'Mid', 'Late']
    )
    
    # Add improvement category
    mutations_df['improvement_category'] = pd.cut(
        mutations_df['deltaScore'],
        bins=[-float('inf'), 0, 10, 100, float('inf')],
        labels=['Negative', 'Small (0-10)', 'Medium (10-100)', 'Large (>100)']
    )
    
    return mutations_df

def analyze_bet_phases(data):
    """Analyze bet phase statistics"""
    bet_data = []
    
    for bet in data.get('betPhaseDetails', []):
        bet_stats = bet['phaseStats'][0]['mutations']
        bet_info = {
            'betIndex': bet['betIndex'],
            'seed': bet['seed'],
            'totalMutations': bet_stats['permutation'] + bet_stats['decision'],
            'permutationCount': bet_stats['permutation'],
            'decisionCount': bet_stats['decision'],
            'permutationKept': bet_stats['permutationKept'],
            'decisionKept': bet_stats['decisionKept'],
            'permutationSuccessRate': bet_stats['permutationKept'] / bet_stats['permutation'] if bet_stats['permutation'] > 0 else 0,
            'decisionSuccessRate': bet_stats['decisionKept'] / bet_stats['decision'] if bet_stats['decision'] > 0 else 0,
            'fallbacks': bet_stats['decisionToPermutationFallbacks'],
            'finalRatio': bet['finalRatio']
        }
        bet_data.append(bet_info)
    
    return pd.DataFrame(bet_data)

def create_visualizations(mutations_df, bet_df, output_dir):
    """Create comprehensive visualizations"""
    
    # Set up the plotting style
    plt.style.use('seaborn-v0_8')
    sns.set_palette("husl")
    
    # Create output directory
    output_dir = Path(output_dir)
    output_dir.mkdir(exist_ok=True)
    
    # 1. Mutation Type Distribution Over Time
    fig, (ax1, ax2) = plt.subplots(2, 1, figsize=(15, 10))
    
    # Rolling average of mutation types
    window = 100
    mutations_df['is_permutation'] = (mutations_df['type'] == 'Permutation').astype(int)
    mutations_df['permutation_ratio'] = mutations_df['is_permutation'].rolling(window=window, center=True).mean()
    
    ax1.plot(mutations_df['evalNumber'], mutations_df['permutation_ratio'] * 100, 
             color='blue', alpha=0.7, linewidth=2)
    ax1.axhline(y=50, color='red', linestyle='--', alpha=0.5, label='50% baseline')
    ax1.set_ylabel('Permutation %')
    ax1.set_title(f'Mutation Type Distribution Over Time (Rolling {window}-eval average)')
    ax1.legend()
    ax1.grid(True, alpha=0.3)
    
    # Delta score over time
    ax2.scatter(mutations_df['evalNumber'], mutations_df['deltaScore'], 
                c=mutations_df['type'].map({'Permutation': 'blue', 'Decision': 'orange'}),
                alpha=0.6, s=1)
    ax2.set_xlabel('Evaluation Number')
    ax2.set_ylabel('Delta Score (cycles)')
    ax2.set_title('Performance Improvement by Mutation Type')
    ax2.grid(True, alpha=0.3)
    
    # Create custom legend
    import matplotlib.patches as mpatches
    blue_patch = mpatches.Patch(color='blue', label='Permutation')
    orange_patch = mpatches.Patch(color='orange', label='Decision')
    ax2.legend(handles=[blue_patch, orange_patch])
    
    plt.tight_layout()
    plt.savefig(output_dir / 'mutation_trends_over_time.png', dpi=300, bbox_inches='tight')
    plt.show()
    
    # 2. Statistical Comparison
    fig, ((ax1, ax2), (ax3, ax4)) = plt.subplots(2, 2, figsize=(15, 12))
    
    # Box plot of delta scores
    sns.boxplot(data=mutations_df, x='type', y='deltaScore', ax=ax1)
    ax1.set_title('Delta Score Distribution by Mutation Type')
    ax1.set_ylabel('Delta Score (cycles)')
    
    # Violin plot for better distribution visualization
    sns.violinplot(data=mutations_df, x='type', y='deltaScore', ax=ax2)
    ax2.set_title('Delta Score Density by Mutation Type')
    ax2.set_ylabel('Delta Score (cycles)')
    
    # Improvement categories
    improvement_counts = mutations_df.groupby(['type', 'improvement_category']).size().unstack(fill_value=0)
    improvement_percentages = improvement_counts.div(improvement_counts.sum(axis=1), axis=0) * 100
    improvement_percentages.plot(kind='bar', ax=ax3, stacked=True)
    ax3.set_title('Improvement Categories by Mutation Type (%)')
    ax3.set_ylabel('Percentage')
    ax3.legend(title='Improvement', bbox_to_anchor=(1.05, 1), loc='upper left')
    ax3.tick_params(axis='x', rotation=0)
    
    # Success rates over optimization stages
    stage_stats = mutations_df.groupby(['stage', 'type'])['deltaScore'].agg(['mean', 'count']).reset_index()
    stage_pivot = stage_stats.pivot(index='stage', columns='type', values='mean')
    stage_pivot.plot(kind='bar', ax=ax4)
    ax4.set_title('Average Delta Score by Optimization Stage')
    ax4.set_ylabel('Average Delta Score')
    ax4.tick_params(axis='x', rotation=0)
    ax4.legend(title='Mutation Type')
    
    plt.tight_layout()
    plt.savefig(output_dir / 'statistical_comparison.png', dpi=300, bbox_inches='tight')
    plt.show()
    
    # 3. Bet Phase Analysis (if available)
    if not bet_df.empty:
        fig, ((ax1, ax2), (ax3, ax4)) = plt.subplots(2, 2, figsize=(15, 12))
        
        # Success rates comparison
        success_data = bet_df[['permutationSuccessRate', 'decisionSuccessRate']].melt(
            var_name='MutationType', value_name='SuccessRate'
        )
        success_data['MutationType'] = success_data['MutationType'].map({
            'permutationSuccessRate': 'Permutation',
            'decisionSuccessRate': 'Decision'
        })
        
        sns.boxplot(data=success_data, x='MutationType', y='SuccessRate', ax=ax1)
        ax1.set_title('Success Rates by Mutation Type (Bet Phases)')
        ax1.set_ylabel('Success Rate')
        
        # Mutation counts
        count_data = bet_df[['permutationCount', 'decisionCount']].melt(
            var_name='MutationType', value_name='Count'
        )
        count_data['MutationType'] = count_data['MutationType'].map({
            'permutationCount': 'Permutation',
            'decisionCount': 'Decision'
        })
        
        sns.boxplot(data=count_data, x='MutationType', y='Count', ax=ax2)
        ax2.set_title('Mutation Counts by Type (Bet Phases)')
        ax2.set_ylabel('Count')
        
        # Fallback analysis
        ax3.bar(bet_df['betIndex'], bet_df['fallbacks'])
        ax3.set_title('Decision to Permutation Fallbacks by Bet')
        ax3.set_xlabel('Bet Index')
        ax3.set_ylabel('Fallback Count')
        
        # Final performance correlation
        ax4.scatter(bet_df['permutationSuccessRate'], bet_df['finalRatio'], 
                   alpha=0.7, label='vs Permutation Success')
        ax4.scatter(bet_df['decisionSuccessRate'], bet_df['finalRatio'], 
                   alpha=0.7, label='vs Decision Success')
        ax4.set_xlabel('Success Rate')
        ax4.set_ylabel('Final Performance Ratio')
        ax4.set_title('Success Rate vs Final Performance')
        ax4.legend()
        
        plt.tight_layout()
        plt.savefig(output_dir / 'bet_phase_analysis.png', dpi=300, bbox_inches='tight')
        plt.show()

def generate_report(mutations_df, bet_df, data):
    """Generate a text-based analysis report"""
    
    report = []
    report.append("=" * 60)
    report.append("CRYPTOPT MUTATION ANALYSIS REPORT")
    report.append("=" * 60)
    
    # Basic statistics
    total_mutations = len(mutations_df)
    perm_count = len(mutations_df[mutations_df['type'] == 'Permutation'])
    dec_count = len(mutations_df[mutations_df['type'] == 'Decision'])
    
    report.append(f"\n📊 OVERVIEW:")
    report.append(f"   Total Evaluations: {data['args']['evals']:,}")
    report.append(f"   Total Mutations: {total_mutations:,}")
    report.append(f"   Permutation Mutations: {perm_count:,} ({perm_count/total_mutations*100:.1f}%)")
    report.append(f"   Decision Mutations: {dec_count:,} ({dec_count/total_mutations*100:.1f}%)")
    
    # Performance comparison
    perm_stats = mutations_df[mutations_df['type'] == 'Permutation']['deltaScore']
    dec_stats = mutations_df[mutations_df['type'] == 'Decision']['deltaScore']
    
    report.append(f"\n🎯 PERFORMANCE COMPARISON:")
    report.append(f"   Permutation - Mean: {perm_stats.mean():.1f}, Median: {perm_stats.median():.1f}, Std: {perm_stats.std():.1f}")
    report.append(f"   Decision - Mean: {dec_stats.mean():.1f}, Median: {dec_stats.median():.1f}, Std: {dec_stats.std():.1f}")
    
    # Improvement categories
    improvement_summary = mutations_df.groupby(['type', 'improvement_category']).size().unstack(fill_value=0)
    report.append(f"\n📈 IMPROVEMENT BREAKDOWN:")
    for mut_type in ['Permutation', 'Decision']:
        if mut_type in improvement_summary.index:
            row = improvement_summary.loc[mut_type]
            total = row.sum()
            report.append(f"   {mut_type}:")
            for category in row.index:
                count = row[category]
                pct = count / total * 100 if total > 0 else 0
                report.append(f"     {category}: {count} ({pct:.1f}%)")
    
    # Bet phase summary
    if not bet_df.empty:
        report.append(f"\n🎲 BET PHASE ANALYSIS:")
        report.append(f"   Number of Bets: {len(bet_df)}")
        report.append(f"   Avg Permutation Success Rate: {bet_df['permutationSuccessRate'].mean():.3f}")
        report.append(f"   Avg Decision Success Rate: {bet_df['decisionSuccessRate'].mean():.3f}")
        report.append(f"   Total Fallbacks: {bet_df['fallbacks'].sum()}")
    
    # Key insights
    report.append(f"\n💡 KEY INSIGHTS:")
    
    # Which type performs better on average?
    if perm_stats.mean() > dec_stats.mean():
        report.append(f"   • Permutation mutations show higher average improvement ({perm_stats.mean():.1f} vs {dec_stats.mean():.1f} cycles)")
    else:
        report.append(f"   • Decision mutations show higher average improvement ({dec_stats.mean():.1f} vs {perm_stats.mean():.1f} cycles)")
    
    # Distribution analysis
    if perm_stats.std() > dec_stats.std():
        report.append(f"   • Permutation mutations are more variable (std: {perm_stats.std():.1f} vs {dec_stats.std():.1f})")
    else:
        report.append(f"   • Decision mutations are more variable (std: {dec_stats.std():.1f} vs {perm_stats.std():.1f})")
    
    # Natural ratio
    natural_ratio = perm_count / total_mutations * 100
    report.append(f"   • Natural mutation ratio settled at {natural_ratio:.1f}% Permutation / {100-natural_ratio:.1f}% Decision")
    
    if abs(natural_ratio - 50) > 5:
        if natural_ratio > 50:
            report.append(f"   • System naturally favors Permutation mutations (+{natural_ratio-50:.1f}% above 50/50)")
        else:
            report.append(f"   • System naturally favors Decision mutations (+{50-natural_ratio:.1f}% above 50/50)")
    
    return "\n".join(report)

def main():
    parser = argparse.ArgumentParser(description='Analyze CryptOpt mutation effectiveness')
    parser.add_argument('metrics_file', help='Path to metrics JSON file')
    parser.add_argument('--output-dir', default='./analysis_output', help='Output directory for plots')
    
    args = parser.parse_args()
    
    # Load data
    print("Loading metrics data...")
    data = load_metrics(args.metrics_file)
    
    # Analyze mutations
    print("Analyzing mutations...")
    mutations_df = analyze_mutations(data)
    bet_df = analyze_bet_phases(data)
    
    # Generate visualizations
    print("Creating visualizations...")
    create_visualizations(mutations_df, bet_df, args.output_dir)
    
    # Generate report
    print("Generating report...")
    report = generate_report(mutations_df, bet_df, data)
    
    # Save report
    report_file = Path(args.output_dir) / 'analysis_report.txt'
    with open(report_file, 'w') as f:
        f.write(report)
    
    # Print report
    print(report)
    print(f"\n📁 Analysis complete! Check {args.output_dir}/ for detailed plots and {report_file} for full report.")

if __name__ == "__main__":
    main()