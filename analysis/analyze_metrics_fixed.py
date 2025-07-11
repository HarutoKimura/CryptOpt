#!/usr/bin/env python3
"""
Fixed CryptOpt Metrics Analysis with Correct Success Rate Calculation
"""

import json
import matplotlib.pyplot as plt
import numpy as np
from pathlib import Path
import argparse
from datetime import datetime
import matplotlib.patches as mpatches

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
        
        # Get ACTUAL success rates from bet phases (where we track kept/reverted)
        actual_success_rates = self._calculate_actual_success_rates()
        
        # Calculate statistics
        stats = {
            'total_mutations': len(self.mutations),
            'perm_count': len(perm_mutations),
            'dec_count': len(dec_mutations),
            'perm_ratio': len(perm_mutations) / len(self.mutations) * 100,
            'perm_stats': self._calculate_stats(perm_deltas),
            'dec_stats': self._calculate_stats(dec_deltas),
            'perm_mutations': perm_mutations,
            'dec_mutations': dec_mutations,
            'actual_perm_success': actual_success_rates['permutation'],
            'actual_dec_success': actual_success_rates['decision']
        }
        
        return stats
    
    def _calculate_actual_success_rates(self):
        """Calculate actual success rates from bet phase data"""
        if not self.bet_phases:
            return {'permutation': 0, 'decision': 0}
        
        total_perm = 0
        total_perm_kept = 0
        total_dec = 0
        total_dec_kept = 0
        
        for bet in self.bet_phases:
            if bet.get('phaseStats') and bet['phaseStats']:
                stats = bet['phaseStats'][0]['mutations']
                total_perm += stats['permutation']
                total_perm_kept += stats['permutationKept']
                total_dec += stats['decision']
                total_dec_kept += stats['decisionKept']
        
        return {
            'permutation': (total_perm_kept / total_perm * 100) if total_perm > 0 else 0,
            'decision': (total_dec_kept / total_dec * 100) if total_dec > 0 else 0
        }
    
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
    
    def create_comprehensive_plots(self, output_dir='analysis_output'):
        """Create all visualization plots"""
        output_dir = Path(output_dir)
        output_dir.mkdir(exist_ok=True)
        
        # Get analysis data
        mutation_stats = self.analyze_mutations()
        
        # Create figure with key insights
        fig = plt.figure(figsize=(16, 10))
        fig.suptitle(f'CryptOpt Mutation Analysis - {self.data["args"]["evals"]:,} Evaluations\n'
                     f'{self.data["symbolname"]}', fontsize=16, fontweight='bold')
        
        # Create 3x3 grid
        gs = fig.add_gridspec(3, 3, hspace=0.3, wspace=0.3)
        
        # 1. Mutation type distribution pie chart
        ax1 = fig.add_subplot(gs[0, 0])
        sizes = [mutation_stats['perm_count'], mutation_stats['dec_count']]
        labels = [f'Permutation\n{mutation_stats["perm_count"]:,}', 
                  f'Decision\n{mutation_stats["dec_count"]:,}']
        colors = ['#3498db', '#e74c3c']
        ax1.pie(sizes, labels=labels, colors=colors, autopct='%1.1f%%', startangle=90)
        ax1.set_title('Mutation Type Distribution')
        
        # 2. Success rates comparison - FIXED
        ax2 = fig.add_subplot(gs[0, 1])
        success_rates = [mutation_stats['actual_perm_success'], mutation_stats['actual_dec_success']]
        positive_rates = [mutation_stats['perm_stats']['positive_rate'], 
                         mutation_stats['dec_stats']['positive_rate']]
        
        x = np.arange(2)
        width = 0.35
        
        bars1 = ax2.bar(x - width/2, success_rates, width, label='Actual Success (Kept)', color=['#2471A3', '#C0392B'])
        bars2 = ax2.bar(x + width/2, positive_rates, width, label='Positive Delta', color=['#85C1E9', '#EC7063'])
        
        ax2.set_ylabel('Rate (%)')
        ax2.set_title('Success Rates: Actual vs Positive Delta')
        ax2.set_xticks(x)
        ax2.set_xticklabels(['Permutation', 'Decision'])
        ax2.legend()
        ax2.set_ylim(0, 100)
        
        # Add value labels
        for bars in [bars1, bars2]:
            for bar in bars:
                height = bar.get_height()
                ax2.text(bar.get_x() + bar.get_width()/2., height + 1,
                        f'{height:.1f}%', ha='center', va='bottom', fontsize=9)
        
        # 3. Mean performance comparison
        ax3 = fig.add_subplot(gs[0, 2])
        means = [mutation_stats['perm_stats']['mean'], mutation_stats['dec_stats']['mean']]
        bars = ax3.bar(['Permutation', 'Decision'], means, color=colors)
        ax3.set_ylabel('Mean Delta Score (cycles)')
        ax3.set_title('Average Performance Change')
        ax3.axhline(y=0, color='black', linestyle='-', alpha=0.3)
        
        for bar, mean in zip(bars, means):
            height = bar.get_height()
            ax3.text(bar.get_x() + bar.get_width()/2., height,
                    f'{mean:.1f}', ha='center', va='bottom' if height > 0 else 'top')
        
        # 4. Distribution box plot
        ax4 = fig.add_subplot(gs[1, :])
        perm_deltas = [m['deltaScore'] for m in mutation_stats['perm_mutations']]
        dec_deltas = [m['deltaScore'] for m in mutation_stats['dec_mutations']]
        
        bp = ax4.boxplot([perm_deltas, dec_deltas], 
                         tick_labels=['Permutation', 'Decision'], 
                         patch_artist=True,
                         showmeans=True, 
                         meanline=True)
        
        bp['boxes'][0].set_facecolor(colors[0])
        bp['boxes'][1].set_facecolor(colors[1])
        ax4.set_ylabel('Delta Score (cycles)')
        ax4.set_title('Delta Score Distribution (Box Plot)')
        ax4.axhline(y=0, color='black', linestyle='--', alpha=0.3)
        ax4.grid(True, alpha=0.3)
        
        # 5. Key metrics table
        ax5 = fig.add_subplot(gs[2, :])
        ax5.axis('tight')
        ax5.axis('off')
        
        # Create enhanced statistics table
        table_data = [
            ['Metric', 'Permutation', 'Decision', 'Difference', 'Note'],
            ['Total Count', f"{mutation_stats['perm_count']:,}", f"{mutation_stats['dec_count']:,}", 
             f"{mutation_stats['perm_count'] - mutation_stats['dec_count']:+,}", ''],
            ['Distribution', f"{mutation_stats['perm_ratio']:.1f}%", 
             f"{100-mutation_stats['perm_ratio']:.1f}%", '', 'Natural ratio'],
            ['ACTUAL Success Rate', f"{mutation_stats['actual_perm_success']:.1f}%", 
             f"{mutation_stats['actual_dec_success']:.1f}%",
             f"{mutation_stats['actual_perm_success'] - mutation_stats['actual_dec_success']:+.1f}%", 
             'Mutations kept'],
            ['Positive Delta Rate', f"{mutation_stats['perm_stats']['positive_rate']:.1f}%", 
             f"{mutation_stats['dec_stats']['positive_rate']:.1f}%",
             f"{mutation_stats['perm_stats']['positive_rate'] - mutation_stats['dec_stats']['positive_rate']:+.1f}%",
             'Improved performance'],
            ['Mean Δ (cycles)', f"{mutation_stats['perm_stats']['mean']:.1f}", 
             f"{mutation_stats['dec_stats']['mean']:.1f}",
             f"{mutation_stats['perm_stats']['mean'] - mutation_stats['dec_stats']['mean']:+.1f}",
             'Average change'],
            ['Median Δ', f"{mutation_stats['perm_stats']['median']:.1f}", 
             f"{mutation_stats['dec_stats']['median']:.1f}",
             f"{mutation_stats['perm_stats']['median'] - mutation_stats['dec_stats']['median']:+.1f}", ''],
            ['Std Dev', f"{mutation_stats['perm_stats']['std']:.1f}", 
             f"{mutation_stats['dec_stats']['std']:.1f}",
             f"{mutation_stats['perm_stats']['std'] - mutation_stats['dec_stats']['std']:+.1f}", '']
        ]
        
        table = ax5.table(cellText=table_data, loc='center', cellLoc='center')
        table.auto_set_font_size(False)
        table.set_fontsize(10)
        table.scale(1.2, 2)
        
        # Style the header row
        for i in range(5):
            table[(0, i)].set_facecolor('#34495e')
            table[(0, i)].set_text_props(weight='bold', color='white')
        
        # Highlight the actual success rate row
        for i in range(5):
            table[(3, i)].set_facecolor('#F8F9F9')
            table[(3, i)].set_text_props(weight='bold')
        
        plt.tight_layout()
        plt.savefig(output_dir / 'mutation_analysis_fixed.png', dpi=300, bbox_inches='tight')
        plt.close()
        
        # Create success rate analysis plot
        self._plot_success_rate_analysis(mutation_stats, output_dir)
        
        print(f"✅ Plots saved to {output_dir}/")
    
    def _plot_success_rate_analysis(self, mutation_stats, output_dir):
        """Create detailed success rate analysis"""
        fig, ((ax1, ax2), (ax3, ax4)) = plt.subplots(2, 2, figsize=(15, 10))
        fig.suptitle('Success Rate Analysis: Why Most Improvements Are Rejected', 
                     fontsize=14, fontweight='bold')
        
        # 1. Success rate comparison across bet phases
        if self.bet_phases:
            ax1.set_title('Success Rates Across Bet Phases')
            bet_indices = []
            perm_success = []
            dec_success = []
            
            for bet in self.bet_phases[:10]:  # First 10 bets
                if bet.get('phaseStats') and bet['phaseStats']:
                    stats = bet['phaseStats'][0]['mutations']
                    bet_indices.append(bet['betIndex'])
                    perm_rate = stats['permutationKept'] / stats['permutation'] * 100 if stats['permutation'] > 0 else 0
                    dec_rate = stats['decisionKept'] / stats['decision'] * 100 if stats['decision'] > 0 else 0
                    perm_success.append(perm_rate)
                    dec_success.append(dec_rate)
            
            ax1.plot(bet_indices, perm_success, 'o-', color='#3498db', 
                     linewidth=2, markersize=8, label='Permutation')
            ax1.plot(bet_indices, dec_success, 's-', color='#e74c3c', 
                     linewidth=2, markersize=8, label='Decision')
            ax1.set_xlabel('Bet Index')
            ax1.set_ylabel('Success Rate (%)')
            ax1.legend()
            ax1.grid(True, alpha=0.3)
            ax1.set_ylim(0, 60)
        
        # 2. Delta score categories
        ax2.set_title('Delta Score Categories')
        
        perm_deltas = [m['deltaScore'] for m in mutation_stats['perm_mutations']]
        dec_deltas = [m['deltaScore'] for m in mutation_stats['dec_mutations']]
        
        categories = ['Negative\n(<0)', 'Small\n(0-10)', 'Medium\n(10-100)', 'Large\n(>100)']
        perm_cats = self._categorize_deltas(perm_deltas)
        dec_cats = self._categorize_deltas(dec_deltas)
        
        x = np.arange(len(categories))
        width = 0.35
        
        ax2.bar(x - width/2, perm_cats, width, label='Permutation', color='#3498db')
        ax2.bar(x + width/2, dec_cats, width, label='Decision', color='#e74c3c')
        ax2.set_ylabel('Percentage of Mutations')
        ax2.set_xticks(x)
        ax2.set_xticklabels(categories)
        ax2.legend()
        ax2.grid(True, alpha=0.3)
        
        # 3. Explanation diagram
        ax3.text(0.5, 0.9, 'Why High Positive Delta ≠ High Success Rate', 
                 ha='center', va='top', fontsize=14, fontweight='bold', transform=ax3.transAxes)
        
        ax3.text(0.1, 0.7, '1. Mutation improves current function (positive Δ)', 
                 ha='left', va='top', fontsize=12, transform=ax3.transAxes)
        ax3.text(0.1, 0.5, '2. But OTHER function might still be better', 
                 ha='left', va='top', fontsize=12, transform=ax3.transAxes)
        ax3.text(0.1, 0.3, '3. So mutation is REJECTED (not kept)', 
                 ha='left', va='top', fontsize=12, transform=ax3.transAxes)
        ax3.text(0.1, 0.1, '→ Result: ~80% positive Δ but only ~30% success', 
                 ha='left', va='top', fontsize=12, fontweight='bold', 
                 color='red', transform=ax3.transAxes)
        
        ax3.axis('off')
        
        # 4. Summary statistics
        ax4.axis('tight')
        ax4.axis('off')
        
        summary_data = [
            ['Mutation Type', 'Positive Δ Rate', 'Actual Success', 'Rejection Rate'],
            ['Permutation', f"{mutation_stats['perm_stats']['positive_rate']:.1f}%", 
             f"{mutation_stats['actual_perm_success']:.1f}%",
             f"{mutation_stats['perm_stats']['positive_rate'] - mutation_stats['actual_perm_success']:.1f}%"],
            ['Decision', f"{mutation_stats['dec_stats']['positive_rate']:.1f}%", 
             f"{mutation_stats['actual_dec_success']:.1f}%",
             f"{mutation_stats['dec_stats']['positive_rate'] - mutation_stats['actual_dec_success']:.1f}%"]
        ]
        
        table = ax4.table(cellText=summary_data, loc='center', cellLoc='center')
        table.auto_set_font_size(False)
        table.set_fontsize(12)
        table.scale(1.2, 2)
        
        # Style header
        for i in range(4):
            table[(0, i)].set_facecolor('#34495e')
            table[(0, i)].set_text_props(weight='bold', color='white')
        
        plt.tight_layout()
        plt.savefig(output_dir / 'success_rate_analysis.png', dpi=300, bbox_inches='tight')
        plt.close()
    
    def _categorize_deltas(self, deltas):
        """Categorize delta scores"""
        total = len(deltas)
        if total == 0:
            return [0, 0, 0, 0]
        
        negative = sum(1 for d in deltas if d < 0) / total * 100
        small = sum(1 for d in deltas if 0 <= d < 10) / total * 100
        medium = sum(1 for d in deltas if 10 <= d < 100) / total * 100
        large = sum(1 for d in deltas if d >= 100) / total * 100
        
        return [negative, small, medium, large]
    
    def generate_report(self, output_dir='analysis_output'):
        """Generate comprehensive text report with fixed success rates"""
        output_dir = Path(output_dir)
        output_dir.mkdir(exist_ok=True)
        
        stats = self.analyze_mutations()
        
        report_lines = []
        report_lines.append("=" * 80)
        report_lines.append("CRYPTOPT MUTATION ANALYSIS REPORT (FIXED)")
        report_lines.append(f"Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
        report_lines.append(f"File: {self.metrics_file}")
        report_lines.append("=" * 80)
        
        # Overview
        report_lines.append(f"\n📊 EXPERIMENT OVERVIEW:")
        report_lines.append(f"   Symbol: {self.data['symbolname']}")
        report_lines.append(f"   Total Evaluations: {self.data['args']['evals']:,}")
        report_lines.append(f"   Total Mutations: {stats['total_mutations']:,}")
        report_lines.append(f"   Natural Distribution: {stats['perm_ratio']:.1f}% Permutation / {100-stats['perm_ratio']:.1f}% Decision")
        
        # Key insight about success rates
        report_lines.append(f"\n⚠️  SUCCESS RATE CLARIFICATION:")
        report_lines.append(f"   Positive Delta Rate ≠ Success Rate")
        report_lines.append(f"   - Positive Delta: Mutation improved the current function")
        report_lines.append(f"   - Success (Kept): Mutation was actually accepted by optimizer")
        report_lines.append(f"   - Many mutations improve performance but are still rejected!")
        
        # Performance comparison
        report_lines.append(f"\n🎯 PERFORMANCE COMPARISON:")
        report_lines.append(f"   {'Metric':<25} {'Permutation':>15} {'Decision':>15}")
        report_lines.append(f"   {'-'*25} {'-'*15} {'-'*15}")
        report_lines.append(f"   {'ACTUAL Success Rate':<25} {stats['actual_perm_success']:>14.1f}% {stats['actual_dec_success']:>14.1f}%")
        report_lines.append(f"   {'Positive Delta Rate':<25} {stats['perm_stats']['positive_rate']:>14.1f}% {stats['dec_stats']['positive_rate']:>14.1f}%")
        report_lines.append(f"   {'Mean Delta (cycles)':<25} {stats['perm_stats']['mean']:>15.1f} {stats['dec_stats']['mean']:>15.1f}")
        report_lines.append(f"   {'Median Delta':<25} {stats['perm_stats']['median']:>15.1f} {stats['dec_stats']['median']:>15.1f}")
        
        # Save report
        report_content = '\n'.join(report_lines)
        report_file = output_dir / 'analysis_report_fixed.txt'
        with open(report_file, 'w') as f:
            f.write(report_content)
        
        print(report_content)
        print(f"\n📄 Full report saved to: {report_file}")
        
        return report_content

def main():
    parser = argparse.ArgumentParser(description='Analyze CryptOpt metrics with fixed success rates')
    parser.add_argument('metrics_file', help='Path to metrics JSON file')
    parser.add_argument('-o', '--output-dir', default='analysis_output_fixed',
                       help='Output directory for plots and reports')
    
    args = parser.parse_args()
    
    # Create analyzer
    analyzer = CryptOptAnalyzer(args.metrics_file)
    
    # Generate report and plots
    print("📊 Analyzing metrics with correct success rate calculation...")
    analyzer.generate_report(args.output_dir)
    analyzer.create_comprehensive_plots(args.output_dir)
    
    print(f"\n✅ Analysis complete! Check {args.output_dir}/ for all outputs.")

if __name__ == "__main__":
    main()