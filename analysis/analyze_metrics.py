#!/usr/bin/env python3
"""
Comprehensive CryptOpt Metrics Analysis and Visualization Tool
Analyzes mutation effectiveness from metrics JSON files
"""

import json
import matplotlib.pyplot as plt
import numpy as np
from pathlib import Path
import argparse
from datetime import datetime
import matplotlib.patches as mpatches
from matplotlib.gridspec import GridSpec

class CryptOptAnalyzer:
    def __init__(self, metrics_file):
        self.metrics_file = metrics_file
        self.data = self.load_metrics()
        self.mutations = self.data['mutationOrder']
        self.bet_phases = self.data.get('betPhaseDetails', [])
        
    def load_metrics(self):
        """Load metrics from JSON file"""
        with open(self.metrics_file, 'r') as f:
            return json.load(f)
    
    def analyze_mutations(self):
        """Perform comprehensive mutation analysis"""
        # Separate mutations by type
        perm_mutations = [m for m in self.mutations if m['type'] == 'Permutation']
        dec_mutations = [m for m in self.mutations if m['type'] == 'Decision']
        
        # Extract delta scores
        perm_deltas = [m['deltaScore'] for m in perm_mutations]
        dec_deltas = [m['deltaScore'] for m in dec_mutations]
        
        # Calculate statistics
        stats = {
            'total_mutations': len(self.mutations),
            'perm_count': len(perm_mutations),
            'dec_count': len(dec_mutations),
            'perm_ratio': len(perm_mutations) / len(self.mutations) * 100,
            'perm_stats': self._calculate_stats(perm_deltas),
            'dec_stats': self._calculate_stats(dec_deltas),
            'perm_mutations': perm_mutations,
            'dec_mutations': dec_mutations
        }
        
        return stats
    
    def _calculate_stats(self, values):
        """Calculate comprehensive statistics for a list of values"""
        if not values:
            return {'mean': 0, 'median': 0, 'std': 0, 'min': 0, 'max': 0, 
                    'q1': 0, 'q3': 0, 'positive_rate': 0}
        
        values_sorted = sorted(values)
        n = len(values)
        
        return {
            'mean': np.mean(values),
            'median': np.median(values),
            'std': np.std(values),
            'min': min(values),
            'max': max(values),
            'q1': np.percentile(values, 25),
            'q3': np.percentile(values, 75),
            'positive_rate': sum(1 for v in values if v > 0) / n * 100
        }
    
    def analyze_temporal_patterns(self):
        """Analyze how mutation effectiveness changes over time"""
        total = len(self.mutations)
        stages = {
            'Early (0-25%)': self.mutations[:int(total * 0.25)],
            'Mid (25-75%)': self.mutations[int(total * 0.25):int(total * 0.75)],
            'Late (75-100%)': self.mutations[int(total * 0.75):]
        }
        
        stage_analysis = {}
        for stage_name, stage_mutations in stages.items():
            perm_deltas = [m['deltaScore'] for m in stage_mutations if m['type'] == 'Permutation']
            dec_deltas = [m['deltaScore'] for m in stage_mutations if m['type'] == 'Decision']
            
            stage_analysis[stage_name] = {
                'total': len(stage_mutations),
                'perm_count': len(perm_deltas),
                'dec_count': len(dec_deltas),
                'perm_mean': np.mean(perm_deltas) if perm_deltas else 0,
                'dec_mean': np.mean(dec_deltas) if dec_deltas else 0,
                'perm_positive_rate': sum(1 for d in perm_deltas if d > 0) / len(perm_deltas) * 100 if perm_deltas else 0,
                'dec_positive_rate': sum(1 for d in dec_deltas if d > 0) / len(dec_deltas) * 100 if dec_deltas else 0
            }
        
        return stage_analysis
    
    def analyze_bet_phases(self):
        """Analyze bet phase performance"""
        if not self.bet_phases:
            return None
        
        bet_analysis = []
        for bet in self.bet_phases:
            if bet.get('phaseStats') and bet['phaseStats']:
                stats = bet['phaseStats'][0]['mutations']
                analysis = {
                    'betIndex': bet['betIndex'],
                    'seed': bet['seed'],
                    'total_mutations': stats['permutation'] + stats['decision'],
                    'perm_count': stats['permutation'],
                    'dec_count': stats['decision'],
                    'perm_kept': stats['permutationKept'],
                    'dec_kept': stats['decisionKept'],
                    'perm_success_rate': stats['permutationKept'] / stats['permutation'] if stats['permutation'] > 0 else 0,
                    'dec_success_rate': stats['decisionKept'] / stats['decision'] if stats['decision'] > 0 else 0,
                    'fallbacks': stats['decisionToPermutationFallbacks'],
                    'final_ratio': bet['finalRatio']
                }
                bet_analysis.append(analysis)
        
        return bet_analysis
    
    def create_comprehensive_plots(self, output_dir='analysis_output'):
        """Create all visualization plots"""
        output_dir = Path(output_dir)
        output_dir.mkdir(exist_ok=True)
        
        # Get analysis data
        mutation_stats = self.analyze_mutations()
        temporal_analysis = self.analyze_temporal_patterns()
        bet_analysis = self.analyze_bet_phases()
        
        # Create multiple visualizations
        self._plot_overview(mutation_stats, output_dir)
        self._plot_temporal_analysis(temporal_analysis, output_dir)
        self._plot_distribution_comparison(mutation_stats, output_dir)
        self._plot_performance_over_time(output_dir)
        if bet_analysis:
            self._plot_bet_phase_analysis(bet_analysis, output_dir)
        
        print(f"\n✅ All plots saved to {output_dir}/")
    
    def _plot_overview(self, stats, output_dir):
        """Create overview plot with key statistics"""
        fig = plt.figure(figsize=(16, 10))
        gs = GridSpec(3, 3, figure=fig)
        
        # Title
        fig.suptitle(f'CryptOpt Mutation Analysis - {self.data["args"]["evals"]:,} Evaluations\n'
                     f'{self.data["symbolname"]}', fontsize=16, fontweight='bold')
        
        # 1. Mutation counts pie chart
        ax1 = fig.add_subplot(gs[0, 0])
        sizes = [stats['perm_count'], stats['dec_count']]
        labels = [f'Permutation\n({stats["perm_count"]:,})', 
                  f'Decision\n({stats["dec_count"]:,})']
        colors = ['#3498db', '#e74c3c']
        ax1.pie(sizes, labels=labels, colors=colors, autopct='%1.1f%%', startangle=90)
        ax1.set_title('Mutation Type Distribution')
        
        # 2. Mean performance comparison
        ax2 = fig.add_subplot(gs[0, 1])
        means = [stats['perm_stats']['mean'], stats['dec_stats']['mean']]
        x = ['Permutation', 'Decision']
        bars = ax2.bar(x, means, color=colors)
        ax2.set_ylabel('Mean Delta Score (cycles)')
        ax2.set_title('Average Performance Improvement')
        ax2.axhline(y=0, color='black', linestyle='-', alpha=0.3)
        
        # Add value labels on bars
        for bar, mean in zip(bars, means):
            height = bar.get_height()
            ax2.text(bar.get_x() + bar.get_width()/2., height,
                    f'{mean:.1f}', ha='center', va='bottom' if height > 0 else 'top')
        
        # 3. Success rate comparison
        ax3 = fig.add_subplot(gs[0, 2])
        success_rates = [stats['perm_stats']['positive_rate'], 
                        stats['dec_stats']['positive_rate']]
        bars = ax3.bar(x, success_rates, color=colors)
        ax3.set_ylabel('Positive Delta Rate (%)')
        ax3.set_title('Improvement Success Rate')
        ax3.set_ylim(0, 100)
        
        # Add value labels
        for bar, rate in zip(bars, success_rates):
            ax3.text(bar.get_x() + bar.get_width()/2., bar.get_height() + 1,
                    f'{rate:.1f}%', ha='center', va='bottom')
        
        # 4. Box plot comparison
        ax4 = fig.add_subplot(gs[1, :])
        perm_deltas = [m['deltaScore'] for m in stats['perm_mutations']]
        dec_deltas = [m['deltaScore'] for m in stats['dec_mutations']]
        
        bp = ax4.boxplot([perm_deltas, dec_deltas], labels=x, patch_artist=True,
                         showmeans=True, meanline=True)
        
        # Color the boxes
        bp['boxes'][0].set_facecolor(colors[0])
        bp['boxes'][1].set_facecolor(colors[1])
        bp['medians'][0].set_color('darkblue')
        bp['medians'][1].set_color('darkred')
        bp['means'][0].set_color('black')
        bp['means'][1].set_color('black')
        
        ax4.set_ylabel('Delta Score (cycles)')
        ax4.set_title('Delta Score Distribution Comparison')
        ax4.axhline(y=0, color='black', linestyle='--', alpha=0.3)
        ax4.grid(True, alpha=0.3)
        
        # 5. Statistics table
        ax5 = fig.add_subplot(gs[2, :])
        ax5.axis('tight')
        ax5.axis('off')
        
        # Create statistics table
        table_data = [
            ['Metric', 'Permutation', 'Decision', 'Difference'],
            ['Count', f"{stats['perm_count']:,}", f"{stats['dec_count']:,}", 
             f"{stats['perm_count'] - stats['dec_count']:+,}"],
            ['Mean Δ', f"{stats['perm_stats']['mean']:.1f}", 
             f"{stats['dec_stats']['mean']:.1f}",
             f"{stats['perm_stats']['mean'] - stats['dec_stats']['mean']:+.1f}"],
            ['Median Δ', f"{stats['perm_stats']['median']:.1f}", 
             f"{stats['dec_stats']['median']:.1f}",
             f"{stats['perm_stats']['median'] - stats['dec_stats']['median']:+.1f}"],
            ['Std Dev', f"{stats['perm_stats']['std']:.1f}", 
             f"{stats['dec_stats']['std']:.1f}",
             f"{stats['perm_stats']['std'] - stats['dec_stats']['std']:+.1f}"],
            ['Min', f"{stats['perm_stats']['min']:.0f}", 
             f"{stats['dec_stats']['min']:.0f}", ''],
            ['Max', f"{stats['perm_stats']['max']:.0f}", 
             f"{stats['dec_stats']['max']:.0f}", ''],
            ['Success Rate', f"{stats['perm_stats']['positive_rate']:.1f}%", 
             f"{stats['dec_stats']['positive_rate']:.1f}%",
             f"{stats['perm_stats']['positive_rate'] - stats['dec_stats']['positive_rate']:+.1f}%"]
        ]
        
        table = ax5.table(cellText=table_data, loc='center', cellLoc='center')
        table.auto_set_font_size(False)
        table.set_fontsize(10)
        table.scale(1.2, 1.5)
        
        # Style the header row
        for i in range(4):
            table[(0, i)].set_facecolor('#34495e')
            table[(0, i)].set_text_props(weight='bold', color='white')
        
        plt.tight_layout()
        plt.savefig(output_dir / 'overview_analysis.png', dpi=300, bbox_inches='tight')
        plt.close()
    
    def _plot_temporal_analysis(self, temporal_analysis, output_dir):
        """Plot temporal patterns analysis"""
        fig, ((ax1, ax2), (ax3, ax4)) = plt.subplots(2, 2, figsize=(15, 10))
        fig.suptitle('Temporal Pattern Analysis', fontsize=14, fontweight='bold')
        
        stages = list(temporal_analysis.keys())
        colors = ['#3498db', '#e74c3c']
        
        # 1. Mean performance by stage
        perm_means = [temporal_analysis[s]['perm_mean'] for s in stages]
        dec_means = [temporal_analysis[s]['dec_mean'] for s in stages]
        
        x = np.arange(len(stages))
        width = 0.35
        
        ax1.bar(x - width/2, perm_means, width, label='Permutation', color=colors[0])
        ax1.bar(x + width/2, dec_means, width, label='Decision', color=colors[1])
        ax1.set_xlabel('Optimization Stage')
        ax1.set_ylabel('Mean Delta Score')
        ax1.set_title('Performance by Optimization Stage')
        ax1.set_xticks(x)
        ax1.set_xticklabels(stages)
        ax1.legend()
        ax1.grid(True, alpha=0.3)
        
        # 2. Success rate by stage
        perm_success = [temporal_analysis[s]['perm_positive_rate'] for s in stages]
        dec_success = [temporal_analysis[s]['dec_positive_rate'] for s in stages]
        
        ax2.plot(stages, perm_success, 'o-', color=colors[0], linewidth=2, 
                 markersize=8, label='Permutation')
        ax2.plot(stages, dec_success, 's-', color=colors[1], linewidth=2, 
                 markersize=8, label='Decision')
        ax2.set_xlabel('Optimization Stage')
        ax2.set_ylabel('Positive Delta Rate (%)')
        ax2.set_title('Success Rate Evolution')
        ax2.legend()
        ax2.grid(True, alpha=0.3)
        ax2.set_ylim(0, 100)
        
        # 3. Mutation count by stage
        perm_counts = [temporal_analysis[s]['perm_count'] for s in stages]
        dec_counts = [temporal_analysis[s]['dec_count'] for s in stages]
        
        ax3.bar(x - width/2, perm_counts, width, label='Permutation', color=colors[0])
        ax3.bar(x + width/2, dec_counts, width, label='Decision', color=colors[1])
        ax3.set_xlabel('Optimization Stage')
        ax3.set_ylabel('Number of Mutations')
        ax3.set_title('Mutation Distribution Across Stages')
        ax3.set_xticks(x)
        ax3.set_xticklabels(stages)
        ax3.legend()
        ax3.grid(True, alpha=0.3)
        
        # 4. Stage summary table
        ax4.axis('tight')
        ax4.axis('off')
        
        table_data = [['Stage', 'Total', 'P Mean', 'D Mean', 'P Success', 'D Success']]
        for stage in stages:
            data = temporal_analysis[stage]
            table_data.append([
                stage.split()[0],  # Just Early/Mid/Late
                f"{data['total']:,}",
                f"{data['perm_mean']:.0f}",
                f"{data['dec_mean']:.0f}",
                f"{data['perm_positive_rate']:.0f}%",
                f"{data['dec_positive_rate']:.0f}%"
            ])
        
        table = ax4.table(cellText=table_data, loc='center', cellLoc='center')
        table.auto_set_font_size(False)
        table.set_fontsize(11)
        table.scale(1.2, 2)
        
        # Style header
        for i in range(6):
            table[(0, i)].set_facecolor('#34495e')
            table[(0, i)].set_text_props(weight='bold', color='white')
        
        plt.tight_layout()
        plt.savefig(output_dir / 'temporal_analysis.png', dpi=300, bbox_inches='tight')
        plt.close()
    
    def _plot_distribution_comparison(self, stats, output_dir):
        """Plot detailed distribution comparisons"""
        fig, ((ax1, ax2), (ax3, ax4)) = plt.subplots(2, 2, figsize=(15, 10))
        fig.suptitle('Distribution Analysis', fontsize=14, fontweight='bold')
        
        perm_deltas = [m['deltaScore'] for m in stats['perm_mutations']]
        dec_deltas = [m['deltaScore'] for m in stats['dec_mutations']]
        
        # 1. Histogram comparison
        bins = np.linspace(-5000, 5000, 100)
        ax1.hist(perm_deltas, bins=bins, alpha=0.6, label='Permutation', 
                 density=True, color='#3498db')
        ax1.hist(dec_deltas, bins=bins, alpha=0.6, label='Decision', 
                 density=True, color='#e74c3c')
        ax1.set_xlabel('Delta Score (cycles)')
        ax1.set_ylabel('Density')
        ax1.set_title('Delta Score Distribution')
        ax1.legend()
        ax1.grid(True, alpha=0.3)
        ax1.axvline(x=0, color='black', linestyle='--', alpha=0.5)
        
        # 2. Log-scale histogram for better visualization
        # Filter out zeros for log scale
        perm_positive = [d for d in perm_deltas if d > 0]
        dec_positive = [d for d in dec_deltas if d > 0]
        
        if perm_positive and dec_positive:
            bins_log = np.logspace(0, 5, 50)
            ax2.hist(perm_positive, bins=bins_log, alpha=0.6, label='Permutation', 
                     density=True, color='#3498db')
            ax2.hist(dec_positive, bins=bins_log, alpha=0.6, label='Decision', 
                     density=True, color='#e74c3c')
            ax2.set_xscale('log')
            ax2.set_xlabel('Delta Score (cycles, log scale)')
            ax2.set_ylabel('Density')
            ax2.set_title('Positive Delta Distribution (Log Scale)')
            ax2.legend()
            ax2.grid(True, alpha=0.3)
        
        # 3. Cumulative distribution
        perm_sorted = np.sort(perm_deltas)
        dec_sorted = np.sort(dec_deltas)
        
        ax3.plot(perm_sorted, np.linspace(0, 100, len(perm_sorted)), 
                 color='#3498db', linewidth=2, label='Permutation')
        ax3.plot(dec_sorted, np.linspace(0, 100, len(dec_sorted)), 
                 color='#e74c3c', linewidth=2, label='Decision')
        ax3.set_xlabel('Delta Score (cycles)')
        ax3.set_ylabel('Percentile')
        ax3.set_title('Cumulative Distribution')
        ax3.legend()
        ax3.grid(True, alpha=0.3)
        ax3.axvline(x=0, color='black', linestyle='--', alpha=0.5)
        
        # 4. Improvement categories
        categories = ['Large\n(>100)', 'Medium\n(10-100)', 'Small\n(0-10)', 'Negative\n(<0)']
        
        perm_cats = self._categorize_improvements(perm_deltas)
        dec_cats = self._categorize_improvements(dec_deltas)
        
        x = np.arange(len(categories))
        width = 0.35
        
        ax4.bar(x - width/2, perm_cats, width, label='Permutation', color='#3498db')
        ax4.bar(x + width/2, dec_cats, width, label='Decision', color='#e74c3c')
        ax4.set_ylabel('Percentage of Mutations')
        ax4.set_title('Improvement Categories')
        ax4.set_xticks(x)
        ax4.set_xticklabels(categories)
        ax4.legend()
        ax4.grid(True, alpha=0.3)
        
        plt.tight_layout()
        plt.savefig(output_dir / 'distribution_analysis.png', dpi=300, bbox_inches='tight')
        plt.close()
    
    def _categorize_improvements(self, deltas):
        """Categorize improvements into buckets"""
        total = len(deltas)
        if total == 0:
            return [0, 0, 0, 0]
        
        large = sum(1 for d in deltas if d > 100) / total * 100
        medium = sum(1 for d in deltas if 10 < d <= 100) / total * 100
        small = sum(1 for d in deltas if 0 < d <= 10) / total * 100
        negative = sum(1 for d in deltas if d <= 0) / total * 100
        
        return [large, medium, small, negative]
    
    def _plot_performance_over_time(self, output_dir):
        """Plot performance trends over time"""
        fig, (ax1, ax2, ax3) = plt.subplots(3, 1, figsize=(15, 12))
        fig.suptitle('Performance Over Time', fontsize=14, fontweight='bold')
        
        # Extract data
        eval_numbers = [m['evalNumber'] for m in self.mutations]
        delta_scores = [m['deltaScore'] for m in self.mutations]
        types = [m['type'] for m in self.mutations]
        
        # 1. Scatter plot of all mutations
        colors = ['#3498db' if t == 'Permutation' else '#e74c3c' for t in types]
        ax1.scatter(eval_numbers, delta_scores, c=colors, alpha=0.6, s=1)
        ax1.set_xlabel('Evaluation Number')
        ax1.set_ylabel('Delta Score (cycles)')
        ax1.set_title('All Mutations Over Time')
        ax1.axhline(y=0, color='black', linestyle='--', alpha=0.3)
        ax1.grid(True, alpha=0.3)
        
        # Add legend
        blue_patch = mpatches.Patch(color='#3498db', label='Permutation')
        red_patch = mpatches.Patch(color='#e74c3c', label='Decision')
        ax1.legend(handles=[blue_patch, red_patch])
        
        # 2. Rolling average of delta scores
        window = 100
        if len(delta_scores) > window:
            rolling_avg = np.convolve(delta_scores, np.ones(window)/window, mode='valid')
            rolling_x = eval_numbers[window//2:-(window//2)+1]
            ax2.plot(rolling_x, rolling_avg, 'g-', linewidth=2)
            ax2.set_xlabel('Evaluation Number')
            ax2.set_ylabel('Average Delta Score (cycles)')
            ax2.set_title(f'Rolling Average Performance ({window}-mutation window)')
            ax2.axhline(y=0, color='black', linestyle='--', alpha=0.3)
            ax2.grid(True, alpha=0.3)
        
        # 3. Mutation type ratio over time
        window = 100
        perm_ratio = []
        ratio_x = []
        
        for i in range(window, len(types) - window):
            window_types = types[i-window//2:i+window//2]
            perm_count = sum(1 for t in window_types if t == 'Permutation')
            perm_ratio.append(perm_count / len(window_types) * 100)
            ratio_x.append(eval_numbers[i])
        
        if perm_ratio:
            ax3.plot(ratio_x, perm_ratio, 'b-', linewidth=2)
            ax3.axhline(y=50, color='red', linestyle='--', alpha=0.5, label='50% baseline')
            ax3.set_xlabel('Evaluation Number')
            ax3.set_ylabel('Permutation Percentage')
            ax3.set_title(f'Mutation Type Balance ({window}-mutation rolling window)')
            ax3.set_ylim(0, 100)
            ax3.legend()
            ax3.grid(True, alpha=0.3)
        
        plt.tight_layout()
        plt.savefig(output_dir / 'performance_over_time.png', dpi=300, bbox_inches='tight')
        plt.close()
    
    def _plot_bet_phase_analysis(self, bet_analysis, output_dir):
        """Plot bet phase analysis if available"""
        fig, ((ax1, ax2), (ax3, ax4)) = plt.subplots(2, 2, figsize=(15, 10))
        fig.suptitle('Bet Phase Analysis', fontsize=14, fontweight='bold')
        
        bet_indices = [b['betIndex'] for b in bet_analysis]
        
        # 1. Success rates by bet
        perm_success = [b['perm_success_rate'] * 100 for b in bet_analysis]
        dec_success = [b['dec_success_rate'] * 100 for b in bet_analysis]
        
        ax1.plot(bet_indices, perm_success, 'o-', color='#3498db', 
                 linewidth=2, markersize=8, label='Permutation')
        ax1.plot(bet_indices, dec_success, 's-', color='#e74c3c', 
                 linewidth=2, markersize=8, label='Decision')
        ax1.set_xlabel('Bet Index')
        ax1.set_ylabel('Success Rate (%)')
        ax1.set_title('Success Rates Across Bets')
        ax1.legend()
        ax1.grid(True, alpha=0.3)
        ax1.set_ylim(0, 100)
        
        # 2. Final performance ratio
        final_ratios = [b['final_ratio'] for b in bet_analysis]
        ax2.bar(bet_indices, final_ratios, color='#2ecc71')
        ax2.set_xlabel('Bet Index')
        ax2.set_ylabel('Final Performance Ratio')
        ax2.set_title('Final Performance by Bet')
        ax2.grid(True, alpha=0.3)
        
        # 3. Mutation counts
        width = 0.35
        x = np.arange(len(bet_indices))
        perm_counts = [b['perm_count'] for b in bet_analysis]
        dec_counts = [b['dec_count'] for b in bet_analysis]
        
        ax3.bar(x - width/2, perm_counts, width, label='Permutation', color='#3498db')
        ax3.bar(x + width/2, dec_counts, width, label='Decision', color='#e74c3c')
        ax3.set_xlabel('Bet Index')
        ax3.set_ylabel('Number of Mutations')
        ax3.set_title('Mutation Counts by Bet')
        ax3.set_xticks(x)
        ax3.set_xticklabels(bet_indices)
        ax3.legend()
        ax3.grid(True, alpha=0.3)
        
        # 4. Success rate vs performance correlation
        all_success_rates = perm_success + dec_success
        all_final_ratios = final_ratios * 2
        mutation_types = ['Permutation'] * len(perm_success) + ['Decision'] * len(dec_success)
        
        colors = ['#3498db' if t == 'Permutation' else '#e74c3c' for t in mutation_types]
        ax4.scatter(all_success_rates[:len(perm_success)], final_ratios, 
                   c='#3498db', s=100, alpha=0.7, label='Permutation')
        ax4.scatter(all_success_rates[len(perm_success):], final_ratios, 
                   c='#e74c3c', s=100, alpha=0.7, label='Decision')
        ax4.set_xlabel('Success Rate (%)')
        ax4.set_ylabel('Final Performance Ratio')
        ax4.set_title('Success Rate vs Final Performance')
        ax4.legend()
        ax4.grid(True, alpha=0.3)
        
        plt.tight_layout()
        plt.savefig(output_dir / 'bet_phase_analysis.png', dpi=300, bbox_inches='tight')
        plt.close()
    
    def generate_report(self, output_dir='analysis_output'):
        """Generate comprehensive text report"""
        output_dir = Path(output_dir)
        output_dir.mkdir(exist_ok=True)
        
        stats = self.analyze_mutations()
        temporal = self.analyze_temporal_patterns()
        bet_analysis = self.analyze_bet_phases()
        
        report_lines = []
        report_lines.append("=" * 80)
        report_lines.append("CRYPTOPT MUTATION ANALYSIS REPORT")
        report_lines.append(f"Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
        report_lines.append(f"File: {self.metrics_file}")
        report_lines.append("=" * 80)
        
        # Overview
        report_lines.append(f"\n📊 EXPERIMENT OVERVIEW:")
        report_lines.append(f"   Symbol: {self.data['symbolname']}")
        report_lines.append(f"   Total Evaluations: {self.data['args']['evals']:,}")
        report_lines.append(f"   Total Mutations: {stats['total_mutations']:,}")
        report_lines.append(f"   Bet Phases: {len(self.bet_phases)}")
        report_lines.append(f"   Natural Distribution: {stats['perm_ratio']:.1f}% Permutation / {100-stats['perm_ratio']:.1f}% Decision")
        
        # Performance comparison
        report_lines.append(f"\n🎯 PERFORMANCE COMPARISON:")
        report_lines.append(f"   {'Metric':<20} {'Permutation':>15} {'Decision':>15} {'Difference':>15}")
        report_lines.append(f"   {'-'*20} {'-'*15} {'-'*15} {'-'*15}")
        
        metrics = [
            ('Count', stats['perm_count'], stats['dec_count'], stats['perm_count'] - stats['dec_count']),
            ('Mean Δ (cycles)', stats['perm_stats']['mean'], stats['dec_stats']['mean'], 
             stats['perm_stats']['mean'] - stats['dec_stats']['mean']),
            ('Median Δ', stats['perm_stats']['median'], stats['dec_stats']['median'],
             stats['perm_stats']['median'] - stats['dec_stats']['median']),
            ('Std Dev', stats['perm_stats']['std'], stats['dec_stats']['std'],
             stats['perm_stats']['std'] - stats['dec_stats']['std']),
            ('Success Rate (%)', stats['perm_stats']['positive_rate'], stats['dec_stats']['positive_rate'],
             stats['perm_stats']['positive_rate'] - stats['dec_stats']['positive_rate'])
        ]
        
        for name, perm_val, dec_val, diff in metrics:
            if 'Rate' in name:
                report_lines.append(f"   {name:<20} {perm_val:>14.1f}% {dec_val:>14.1f}% {diff:>14.1f}%")
            elif name == 'Count':
                report_lines.append(f"   {name:<20} {perm_val:>15,} {dec_val:>15,} {diff:>15,}")
            else:
                report_lines.append(f"   {name:<20} {perm_val:>15.1f} {dec_val:>15.1f} {diff:>15.1f}")
        
        # Temporal patterns
        report_lines.append(f"\n⏱️  TEMPORAL PATTERNS:")
        for stage, data in temporal.items():
            report_lines.append(f"   {stage}:")
            report_lines.append(f"     Permutation: {data['perm_count']:,} mutations, "
                               f"mean Δ = {data['perm_mean']:.1f}, success = {data['perm_positive_rate']:.1f}%")
            report_lines.append(f"     Decision:    {data['dec_count']:,} mutations, "
                               f"mean Δ = {data['dec_mean']:.1f}, success = {data['dec_positive_rate']:.1f}%")
        
        # Key insights
        report_lines.append(f"\n💡 KEY INSIGHTS:")
        
        # Which type performs better?
        if stats['perm_stats']['mean'] > stats['dec_stats']['mean']:
            report_lines.append(f"   ✓ Permutation mutations show {stats['perm_stats']['mean'] - stats['dec_stats']['mean']:.1f} "
                               f"cycles better average improvement")
        else:
            report_lines.append(f"   ✓ Decision mutations show {stats['dec_stats']['mean'] - stats['perm_stats']['mean']:.1f} "
                               f"cycles better average improvement")
        
        # Natural distribution insight
        if abs(stats['perm_ratio'] - 50) > 2:
            if stats['perm_ratio'] > 50:
                report_lines.append(f"   ✓ System naturally favors Permutation mutations "
                                   f"(+{stats['perm_ratio']-50:.1f}% above balanced)")
            else:
                report_lines.append(f"   ✓ System naturally favors Decision mutations "
                                   f"(+{50-stats['perm_ratio']:.1f}% above balanced)")
        else:
            report_lines.append(f"   ✓ System maintains nearly balanced mutation distribution")
        
        # Consistency
        if stats['perm_stats']['std'] > stats['dec_stats']['std']:
            report_lines.append(f"   ✓ Permutation mutations show higher variability "
                               f"(σ = {stats['perm_stats']['std']:.0f} vs {stats['dec_stats']['std']:.0f})")
        else:
            report_lines.append(f"   ✓ Decision mutations show higher variability "
                               f"(σ = {stats['dec_stats']['std']:.0f} vs {stats['perm_stats']['std']:.0f})")
        
        # Save report
        report_content = '\n'.join(report_lines)
        report_file = output_dir / 'analysis_report.txt'
        with open(report_file, 'w') as f:
            f.write(report_content)
        
        print(report_content)
        print(f"\n📄 Full report saved to: {report_file}")
        
        return report_content

def main():
    parser = argparse.ArgumentParser(description='Analyze CryptOpt metrics JSON files')
    parser.add_argument('metrics_file', help='Path to metrics JSON file')
    parser.add_argument('-o', '--output-dir', default='analysis_output',
                       help='Output directory for plots and reports (default: analysis_output)')
    parser.add_argument('--no-plots', action='store_true',
                       help='Skip plot generation, only generate text report')
    
    args = parser.parse_args()
    
    # Create analyzer
    analyzer = CryptOptAnalyzer(args.metrics_file)
    
    # Generate report
    print("📊 Analyzing metrics...")
    analyzer.generate_report(args.output_dir)
    
    # Generate plots
    if not args.no_plots:
        print("\n📈 Creating visualizations...")
        analyzer.create_comprehensive_plots(args.output_dir)
        print(f"\n✅ Analysis complete! Check {args.output_dir}/ for all outputs.")
    else:
        print("\n✅ Report generation complete!")

if __name__ == "__main__":
    main()