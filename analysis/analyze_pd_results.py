#!/usr/bin/env python3
"""
Analysis script for P:D ratio experiments
Aggregates results and creates visualizations
"""

import json
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from pathlib import Path
import numpy as np
from typing import List, Dict
import sys

# Set style for publication-quality plots
sns.set_style("whitegrid")
plt.rcParams['figure.dpi'] = 300
plt.rcParams['savefig.dpi'] = 300
plt.rcParams['font.size'] = 10

def collect_results(base_dir: Path) -> List[Dict]:
    """Collect all _final_analysis.json files"""
    print(f"Searching for analysis files in: {base_dir}")

    analysis_files = list(base_dir.rglob("*_final_analysis.json"))
    print(f"Found {len(analysis_files)} analysis files")

    results = []
    for file_path in analysis_files:
        try:
            with open(file_path, 'r') as f:
                data = json.load(f)
                # Add file path for reference
                data['file_path'] = str(file_path)
                results.append(data)
        except Exception as e:
            print(f"Error reading {file_path}: {e}")

    return results

def create_dataframe(results: List[Dict]) -> pd.DataFrame:
    """Convert results to a structured DataFrame"""
    rows = []
    for r in results:
        row = {
            # Metadata
            'curve': r['metadata']['curve'],
            'method': r['metadata']['method'],
            'symbolname': r['metadata']['symbolname'],
            'scheduleRatio': r['metadata']['scheduleRatio'],
            'seed': r['metadata']['seed'],
            'totalEvals': r['metadata']['totalEvals'],

            # Performance
            'baseline': r['performance']['baseline'],
            'final': r['performance']['final'],
            'improvementPercent': r['performance']['improvementPercent'],
            'improvementCycles': r['performance']['improvementCycles'],

            # Distribution
            'totalMutations': r['distribution']['totalMutations'],
            'permCount': r['distribution']['permutation']['count'],
            'permPercent': r['distribution']['permutation']['percent'],
            'permSuccessRate': r['distribution']['permutation']['successRate'],
            'decCount': r['distribution']['decision']['count'],
            'decPercent': r['distribution']['decision']['percent'],
            'decSuccessRate': r['distribution']['decision']['successRate'],
            'fallbacks': r['distribution']['fallbacks'],

            # Delta distribution
            'improvements': r['deltaDistribution']['improvements']['count'],
            'degradations': r['deltaDistribution']['degradations']['count'],
            'overallSuccessRate': r['deltaDistribution']['overallSuccessRate'],
            'avgImprovement': r['deltaDistribution']['improvements']['avgDelta'],
            'bestImprovement': r['deltaDistribution']['improvements']['best'],
            'avgDegradation': r['deltaDistribution']['degradations']['avgDelta'],
            'worstDegradation': r['deltaDistribution']['degradations']['worst'],
        }

        # Add decision type data
        for dec_type, stats in r['decisionTypes'].items():
            row[f'dec_{dec_type}_count'] = stats['count']
            row[f'dec_{dec_type}_avgDelta'] = stats['avgDelta']
            row[f'dec_{dec_type}_successRate'] = stats['successRate']

        # Add permutation distance data
        for dist_cat, stats in r['permutationDistances'].items():
            row[f'perm_{dist_cat}_count'] = stats['count']
            row[f'perm_{dist_cat}_avgDelta'] = stats['avgDelta']
            row[f'perm_{dist_cat}_successRate'] = stats['successRate']

        rows.append(row)

    return pd.DataFrame(rows)

def create_summary_tables(df: pd.DataFrame, output_dir: Path):
    """Create summary tables"""
    output_dir.mkdir(exist_ok=True, parents=True)

    # 1. Performance by curve and ratio
    print("\n=== Performance by Curve and Ratio ===")
    pivot = df.pivot_table(
        values='improvementPercent',
        index='curve',
        columns='scheduleRatio',
        aggfunc='mean'
    )
    print(pivot)
    pivot.to_csv(output_dir / 'performance_by_curve_ratio.csv')

    # 2. Success rates by mutation type
    print("\n=== Success Rates by Ratio ===")
    success_summary = df.groupby('scheduleRatio').agg({
        'permSuccessRate': 'mean',
        'decSuccessRate': 'mean',
        'overallSuccessRate': 'mean'
    }).round(2)
    print(success_summary)
    success_summary.to_csv(output_dir / 'success_rates_by_ratio.csv')

    # 3. Best configurations per curve
    print("\n=== Best Configuration per Curve ===")
    best_configs = df.loc[df.groupby('curve')['improvementPercent'].idxmax()]
    best_summary = best_configs[['curve', 'method', 'scheduleRatio', 'improvementPercent', 'overallSuccessRate']]
    print(best_summary)
    best_summary.to_csv(output_dir / 'best_configurations.csv', index=False)

    # 4. Decision type effectiveness (for decision-heavy ratios)
    decision_heavy = df[df['scheduleRatio'] <= 50]
    if not decision_heavy.empty:
        print("\n=== Decision Type Effectiveness (P:D ≤ 50:50) ===")
        dec_cols = [col for col in df.columns if col.startswith('dec_') and col.endswith('_count')]
        dec_types = [col.replace('dec_', '').replace('_count', '') for col in dec_cols]

        dec_summary = []
        for dec_type in dec_types:
            if f'dec_{dec_type}_count' in decision_heavy.columns:
                total_count = decision_heavy[f'dec_{dec_type}_count'].sum()
                avg_delta = decision_heavy[f'dec_{dec_type}_avgDelta'].mean()
                avg_success = decision_heavy[f'dec_{dec_type}_successRate'].mean()
                dec_summary.append({
                    'type': dec_type,
                    'totalCount': total_count,
                    'avgDelta': round(avg_delta, 2),
                    'avgSuccessRate': round(avg_success, 2)
                })

        dec_df = pd.DataFrame(dec_summary).sort_values('totalCount', ascending=False)
        print(dec_df)
        dec_df.to_csv(output_dir / 'decision_type_effectiveness.csv', index=False)

def create_visualizations(df: pd.DataFrame, output_dir: Path):
    """Create visualizations"""
    output_dir.mkdir(exist_ok=True, parents=True)

    # 1. Heatmap: Performance improvement by curve × ratio
    plt.figure(figsize=(12, 8))
    pivot = df.pivot_table(
        values='improvementPercent',
        index='curve',
        columns='scheduleRatio',
        aggfunc='mean'
    )
    sns.heatmap(pivot, annot=True, fmt='.2f', cmap='RdYlGn', center=0,
                cbar_kws={'label': 'Improvement (%)'})
    plt.title('Performance Improvement by Curve and P:D Ratio')
    plt.xlabel('P:D Ratio (% Permutation)')
    plt.ylabel('Curve')
    plt.tight_layout()
    plt.savefig(output_dir / 'heatmap_performance.png')
    plt.close()
    print("✓ Created: heatmap_performance.png")

    # 2. Line plot: Performance vs ratio (aggregated)
    plt.figure(figsize=(10, 6))
    agg = df.groupby('scheduleRatio').agg({
        'improvementPercent': ['mean', 'std']
    })['improvementPercent']
    plt.errorbar(agg.index, agg['mean'], yerr=agg['std'],
                 marker='o', capsize=5, linewidth=2)
    plt.xlabel('P:D Ratio (% Permutation)')
    plt.ylabel('Performance Improvement (%)')
    plt.title('Average Performance Improvement Across All Curves')
    plt.grid(True, alpha=0.3)
    plt.tight_layout()
    plt.savefig(output_dir / 'line_performance_vs_ratio.png')
    plt.close()
    print("✓ Created: line_performance_vs_ratio.png")

    # 3. Bar chart: Success rates by ratio
    plt.figure(figsize=(12, 6))
    success_data = df.groupby('scheduleRatio').agg({
        'permSuccessRate': 'mean',
        'decSuccessRate': 'mean'
    })

    x = np.arange(len(success_data))
    width = 0.35

    plt.bar(x - width/2, success_data['permSuccessRate'], width,
            label='Permutation', alpha=0.8)
    plt.bar(x + width/2, success_data['decSuccessRate'], width,
            label='Decision', alpha=0.8)

    plt.xlabel('P:D Ratio (% Permutation)')
    plt.ylabel('Success Rate (%)')
    plt.title('Mutation Success Rates by P:D Ratio')
    plt.xticks(x, success_data.index)
    plt.legend()
    plt.grid(True, alpha=0.3, axis='y')
    plt.tight_layout()
    plt.savefig(output_dir / 'bar_success_rates.png')
    plt.close()
    print("✓ Created: bar_success_rates.png")

    # 4. Box plot: Improvement distribution by ratio
    plt.figure(figsize=(12, 6))
    df.boxplot(column='improvementPercent', by='scheduleRatio', figsize=(12, 6))
    plt.xlabel('P:D Ratio (% Permutation)')
    plt.ylabel('Performance Improvement (%)')
    plt.title('Distribution of Performance Improvement by P:D Ratio')
    plt.suptitle('')  # Remove default title
    plt.tight_layout()
    plt.savefig(output_dir / 'boxplot_improvement_distribution.png')
    plt.close()
    print("✓ Created: boxplot_improvement_distribution.png")

    # 5. Stacked bar: Decision type distribution (for decision-heavy ratios)
    decision_heavy = df[df['scheduleRatio'] <= 50]
    if not decision_heavy.empty:
        plt.figure(figsize=(12, 6))
        dec_cols = [col for col in df.columns if col.startswith('dec_') and col.endswith('_count')]
        dec_types = [col.replace('dec_', '').replace('_count', '') for col in dec_cols]

        dec_data = decision_heavy.groupby('scheduleRatio')[[f'dec_{dt}_count' for dt in dec_types]].mean()
        dec_data.columns = dec_types

        dec_data.plot(kind='bar', stacked=True, figsize=(12, 6), colormap='tab10')
        plt.xlabel('P:D Ratio (% Permutation)')
        plt.ylabel('Average Decision Count')
        plt.title('Decision Type Distribution by P:D Ratio')
        plt.legend(title='Decision Type', bbox_to_anchor=(1.05, 1), loc='upper left')
        plt.tight_layout()
        plt.savefig(output_dir / 'stacked_decision_types.png')
        plt.close()
        print("✓ Created: stacked_decision_types.png")

    # 6. Per-curve comparison
    fig, axes = plt.subplots(2, 5, figsize=(20, 8))
    axes = axes.flatten()

    for idx, curve in enumerate(sorted(df['curve'].unique())):
        if idx >= len(axes):
            break
        curve_data = df[df['curve'] == curve].groupby('scheduleRatio')['improvementPercent'].mean()
        axes[idx].plot(curve_data.index, curve_data.values, marker='o', linewidth=2)
        axes[idx].set_title(curve)
        axes[idx].set_xlabel('P:D Ratio')
        axes[idx].set_ylabel('Improvement (%)')
        axes[idx].grid(True, alpha=0.3)

    plt.suptitle('Performance Improvement by Curve', fontsize=16)
    plt.tight_layout()
    plt.savefig(output_dir / 'per_curve_comparison.png')
    plt.close()
    print("✓ Created: per_curve_comparison.png")

def main():
    if len(sys.argv) < 2:
        base_dir = Path.home() / "CryptOpt/results/pd-analysis"
    else:
        base_dir = Path(sys.argv[1])

    if not base_dir.exists():
        print(f"Error: Directory not found: {base_dir}")
        sys.exit(1)

    output_dir = base_dir / "analysis_output"
    print(f"Output directory: {output_dir}")

    # Create output directory
    output_dir.mkdir(exist_ok=True, parents=True)

    # Collect and process results
    results = collect_results(base_dir)
    if not results:
        print("No analysis files found!")
        sys.exit(1)

    df = create_dataframe(results)
    print(f"\nProcessed {len(df)} experiments")
    print(f"Curves: {df['curve'].nunique()}")
    print(f"Ratios: {sorted(df['scheduleRatio'].unique())}")

    # Save raw data
    df.to_csv(output_dir / 'all_results.csv', index=False)
    print(f"\n✓ Saved all results to: {output_dir / 'all_results.csv'}")

    # Create summary tables
    create_summary_tables(df, output_dir)

    # Create visualizations
    print("\nGenerating visualizations...")
    create_visualizations(df, output_dir)

    print(f"\n✅ Analysis complete! Check: {output_dir}")
    print(f"\nGenerated files:")
    print(f"  - Tables: *.csv")
    print(f"  - Plots: *.png")

if __name__ == "__main__":
    main()
