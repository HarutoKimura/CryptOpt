#!/usr/bin/env python3
"""
CORRECTED CryptOpt Metrics Analysis - Fixed Delta Sign Interpretation
Key Fix: Negative delta = BETTER performance (fewer cycles)
         Positive delta = WORSE performance (more cycles)
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
        """Perform comprehensive mutation analysis with CORRECTED delta interpretation"""
        # Separate mutations by type
        perm_mutations = [m for m in self.mutations if m['type'] == 'Permutation']
        dec_mutations = [m for m in self.mutations if m['type'] == 'Decision']
        
        # Extract delta scores
        perm_deltas = [m['deltaScore'] for m in perm_mutations]
        dec_deltas = [m['deltaScore'] for m in dec_mutations]
        
        # Get ACTUAL success rates from bet phases (where we track kept/reverted)
        actual_success_rates = self._calculate_actual_success_rates()
        
        # Calculate statistics with CORRECTED interpretation
        stats = {
            'total_mutations': len(self.mutations),
            'perm_count': len(perm_mutations),
            'dec_count': len(dec_mutations),
            'perm_ratio': len(perm_mutations) / len(self.mutations) * 100,
            'perm_stats': self._calculate_stats_corrected(perm_deltas),
            'dec_stats': self._calculate_stats_corrected(dec_deltas),
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
    
    def _calculate_stats_corrected(self, values):
        """Calculate comprehensive statistics with CORRECTED delta interpretation"""
        if not values:
            return {'mean': 0, 'median': 0, 'std': 0, 'min': 0, 'max': 0, 
                    'q1': 0, 'q3': 0, 'improvement_rate': 0, 'worse_rate': 0}
        
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
            # CORRECTED: Negative delta = improvement (fewer cycles)
            'improvement_rate': sum(1 for v in values if v < 0) / n * 100,
            # Positive delta = worse performance (more cycles)
            'worse_rate': sum(1 for v in values if v > 0) / n * 100
        }
    
    def create_comprehensive_plots(self, output_dir='analysis_output_corrected'):
        """Create all visualization plots with CORRECTED interpretation"""
        output_dir = Path(output_dir)
        output_dir.mkdir(exist_ok=True)
        
        # Get analysis data
        mutation_stats = self.analyze_mutations()
        
        # Create figure with key insights
        fig = plt.figure(figsize=(16, 10))
        fig.suptitle(f'CryptOpt Mutation Analysis - CORRECTED INTERPRETATION\n'
                     f'"{self.data["symbolname"]}" - {self.data["args"]["evals"]:,} Evaluations\n'
                     f'⚠️ Negative Δ = BETTER (fewer cycles), Positive Δ = WORSE (more cycles)', 
                     fontsize=14, fontweight='bold')
        
        # Create 3x3 grid
        gs = fig.add_gridspec(3, 3, hspace=0.35, wspace=0.3)
        
        # 1. Mutation type distribution pie chart
        ax1 = fig.add_subplot(gs[0, 0])
        sizes = [mutation_stats['perm_count'], mutation_stats['dec_count']]
        labels = [f'Permutation\n{mutation_stats["perm_count"]:,}', 
                  f'Decision\n{mutation_stats["dec_count"]:,}']
        colors = ['#3498db', '#e74c3c']
        ax1.pie(sizes, labels=labels, colors=colors, autopct='%1.1f%%', startangle=90)
        ax1.set_title('Mutation Type Distribution')
        
        # 2. CORRECTED Success rates vs improvements
        ax2 = fig.add_subplot(gs[0, 1])
        success_rates = [mutation_stats['actual_perm_success'], mutation_stats['actual_dec_success']]
        improvement_rates = [mutation_stats['perm_stats']['improvement_rate'], 
                            mutation_stats['dec_stats']['improvement_rate']]
        
        x = np.arange(2)
        width = 0.35
        
        bars1 = ax2.bar(x - width/2, success_rates, width, label='Actually Kept', color=['#2471A3', '#C0392B'])
        bars2 = ax2.bar(x + width/2, improvement_rates, width, label='Improved (Δ<0)', color=['#52BE80', '#F7DC6F'])
        
        ax2.set_ylabel('Rate (%)')
        ax2.set_title('CORRECTED: Success vs Improvement Rates')
        ax2.set_xticks(x)
        ax2.set_xticklabels(['Permutation', 'Decision'])
        ax2.legend()
        ax2.set_ylim(0, max(max(success_rates), max(improvement_rates)) + 10)
        
        # Add value labels
        for bars in [bars1, bars2]:
            for bar in bars:
                height = bar.get_height()
                ax2.text(bar.get_x() + bar.get_width()/2., height + 1,
                        f'{height:.1f}%', ha='center', va='bottom', fontsize=9)
        
        # 3. Mean performance comparison (CORRECTED LABELS)
        ax3 = fig.add_subplot(gs[0, 2])
        means = [mutation_stats['perm_stats']['mean'], mutation_stats['dec_stats']['mean']]
        bars = ax3.bar(['Permutation', 'Decision'], means, color=colors)
        ax3.set_ylabel('Mean Δ Score (cycles)')
        ax3.set_title('Average Performance Change\n(Negative = Better)')
        ax3.axhline(y=0, color='black', linestyle='-', alpha=0.3)
        
        for bar, mean in zip(bars, means):
            height = bar.get_height()
            label_text = f'{mean:.1f}'
            if mean < 0:
                label_text += ' ✓'  # Good
                color = 'green'
            else:
                label_text += ' ✗'  # Bad
                color = 'red'
            
            ax3.text(bar.get_x() + bar.get_width()/2., height,
                    label_text, ha='center', va='bottom' if height > 0 else 'top',
                    color=color, fontweight='bold')
        
        # 4. Distribution box plot with corrected interpretation
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
        ax4.set_ylabel('Δ Score (cycles)')
        ax4.set_title('Delta Score Distribution (Negative = Better Performance)')
        ax4.axhline(y=0, color='black', linestyle='--', alpha=0.5, linewidth=2)
        ax4.text(0.02, 0.98, 'BETTER ←', transform=ax4.transAxes, va='top', ha='left', 
                 fontweight='bold', color='green', fontsize=12)
        ax4.text(0.02, 0.02, 'WORSE ←', transform=ax4.transAxes, va='bottom', ha='left', 
                 fontweight='bold', color='red', fontsize=12)
        ax4.grid(True, alpha=0.3)
        
        # 5. CORRECTED Key metrics table
        ax5 = fig.add_subplot(gs[2, :])
        ax5.axis('tight')
        ax5.axis('off')
        
        # Create corrected statistics table
        table_data = [
            ['Metric', 'Permutation', 'Decision', 'Difference', 'Interpretation'],
            ['Total Count', f"{mutation_stats['perm_count']:,}", f"{mutation_stats['dec_count']:,}", 
             f"{mutation_stats['perm_count'] - mutation_stats['dec_count']:+,}", ''],
            ['Distribution %', f"{mutation_stats['perm_ratio']:.1f}%", 
             f"{100-mutation_stats['perm_ratio']:.1f}%", '', 'Natural ratio'],
            ['Success Rate (Kept)', f"{mutation_stats['actual_perm_success']:.1f}%", 
             f"{mutation_stats['actual_dec_success']:.1f}%",
             f"{mutation_stats['actual_perm_success'] - mutation_stats['actual_dec_success']:+.1f}%", 
             'Actually accepted'],
            ['IMPROVEMENT Rate (Δ<0)', f"{mutation_stats['perm_stats']['improvement_rate']:.1f}%", 
             f"{mutation_stats['dec_stats']['improvement_rate']:.1f}%",
             f"{mutation_stats['perm_stats']['improvement_rate'] - mutation_stats['dec_stats']['improvement_rate']:+.1f}%",
             'Made it faster'],
            ['Worse Rate (Δ>0)', f"{mutation_stats['perm_stats']['worse_rate']:.1f}%", 
             f"{mutation_stats['dec_stats']['worse_rate']:.1f}%",
             f"{mutation_stats['perm_stats']['worse_rate'] - mutation_stats['dec_stats']['worse_rate']:+.1f}%",
             'Made it slower'],
            ['Mean Δ (cycles)', f"{mutation_stats['perm_stats']['mean']:.1f}", 
             f"{mutation_stats['dec_stats']['mean']:.1f}",
             f"{mutation_stats['perm_stats']['mean'] - mutation_stats['dec_stats']['mean']:+.1f}",
             'Avg cycle change'],
            ['Median Δ', f"{mutation_stats['perm_stats']['median']:.1f}", 
             f"{mutation_stats['dec_stats']['median']:.1f}",
             f"{mutation_stats['perm_stats']['median'] - mutation_stats['dec_stats']['median']:+.1f}", '']
        ]
        
        table = ax5.table(cellText=table_data, loc='center', cellLoc='center')
        table.auto_set_font_size(False)
        table.set_fontsize(9)
        table.scale(1.2, 1.8)
        
        # Style the header row
        for i in range(5):
            table[(0, i)].set_facecolor('#34495e')
            table[(0, i)].set_text_props(weight='bold', color='white')
        
        # Highlight the success rate row in blue
        for i in range(5):
            table[(3, i)].set_facecolor('#EBF3FD')
            table[(3, i)].set_text_props(weight='bold')
        
        # Highlight the improvement rate row in green
        for i in range(5):
            table[(4, i)].set_facecolor('#E8F5E8')
            table[(4, i)].set_text_props(weight='bold')
        
        plt.tight_layout()
        plt.savefig(output_dir / 'mutation_analysis_CORRECTED.png', dpi=300, bbox_inches='tight')
        plt.close()
        
        # Create corrected improvement analysis plot
        self._plot_improvement_analysis(mutation_stats, output_dir)
        
        print(f"✅ CORRECTED plots saved to {output_dir}/")
    
    def _plot_improvement_analysis(self, mutation_stats, output_dir):
        """Create detailed improvement analysis with corrected interpretation"""
        fig, ((ax1, ax2), (ax3, ax4)) = plt.subplots(2, 2, figsize=(15, 10))
        fig.suptitle('CORRECTED Analysis: Understanding CryptOpt Mutation Results\n'
                     'Key: Negative Δ = BETTER (fewer cycles), Positive Δ = WORSE (more cycles)', 
                     fontsize=13, fontweight='bold')
        
        # 1. Corrected delta categories
        ax1.set_title('Delta Score Categories (CORRECTED)')
        
        perm_deltas = [m['deltaScore'] for m in mutation_stats['perm_mutations']]
        dec_deltas = [m['deltaScore'] for m in mutation_stats['dec_mutations']]
        
        categories = ['Much Better\n(<-100)', 'Better\n(-100 to -10)', 'Slightly Better\n(-10 to 0)', 
                     'Slightly Worse\n(0 to 10)', 'Worse\n(10 to 100)', 'Much Worse\n(>100)']
        perm_cats = self._categorize_deltas_corrected(perm_deltas)
        dec_cats = self._categorize_deltas_corrected(dec_deltas)
        
        x = np.arange(len(categories))
        width = 0.35
        
        bars1 = ax1.bar(x - width/2, perm_cats, width, label='Permutation', color='#3498db')
        bars2 = ax1.bar(x + width/2, dec_cats, width, label='Decision', color='#e74c3c')
        
        # Color bars based on improvement/worse
        for i, (bar1, bar2) in enumerate(zip(bars1[:3], bars2[:3])):  # Better performance
            bar1.set_color('#52BE80')  # Green for improvements
            bar2.set_color('#52BE80')
        for i, (bar1, bar2) in enumerate(zip(bars1[3:], bars2[3:])):  # Worse performance
            bar1.set_color('#E74C3C')  # Red for worse
            bar2.set_color('#E74C3C')
        
        ax1.set_ylabel('Percentage of Mutations')
        ax1.set_xticks(x)
        ax1.set_xticklabels(categories, rotation=45, ha='right')
        ax1.legend()
        ax1.grid(True, alpha=0.3)
        
        # 2. Success vs Improvement comparison
        ax2.set_title('Success Rate vs Improvement Rate')
        
        metrics = ['Permutation', 'Decision']
        success_rates = [mutation_stats['actual_perm_success'], mutation_stats['actual_dec_success']]
        improvement_rates = [mutation_stats['perm_stats']['improvement_rate'], 
                            mutation_stats['dec_stats']['improvement_rate']]
        
        x = np.arange(len(metrics))
        width = 0.35
        
        ax2.bar(x - width/2, success_rates, width, label='Actually Kept', color='#3498db', alpha=0.7)
        ax2.bar(x + width/2, improvement_rates, width, label='Actually Improved (Δ<0)', color='#27AE60', alpha=0.7)
        
        ax2.set_ylabel('Rate (%)')
        ax2.set_xticks(x)
        ax2.set_xticklabels(metrics)
        ax2.legend()
        ax2.grid(True, alpha=0.3)
        
        # Add annotations
        for i, (success, improvement) in enumerate(zip(success_rates, improvement_rates)):
            ax2.annotate(f'{success:.1f}%', (i - width/2, success + 1), ha='center', fontsize=10)
            ax2.annotate(f'{improvement:.1f}%', (i + width/2, improvement + 1), ha='center', fontsize=10)
        
        # 3. Explanation with corrected understanding
        ax3.text(0.5, 0.9, 'CORRECTED Understanding of CryptOpt Results', 
                 ha='center', va='top', fontsize=14, fontweight='bold', transform=ax3.transAxes)
        
        ax3.text(0.05, 0.75, '✅ TRUTH: Most mutations actually HURT performance', 
                 ha='left', va='top', fontsize=12, color='red', fontweight='bold', transform=ax3.transAxes)
        ax3.text(0.05, 0.65, '• ~33% make it faster (negative Δ)', 
                 ha='left', va='top', fontsize=11, transform=ax3.transAxes)
        ax3.text(0.05, 0.55, '• ~67% make it slower (positive Δ)', 
                 ha='left', va='top', fontsize=11, transform=ax3.transAxes)
        
        ax3.text(0.05, 0.4, '🎯 Success rate (~20-30%) makes sense now:', 
                 ha='left', va='top', fontsize=12, color='blue', fontweight='bold', transform=ax3.transAxes)
        ax3.text(0.05, 0.3, '• Only best improvements are actually kept', 
                 ha='left', va='top', fontsize=11, transform=ax3.transAxes)
        ax3.text(0.05, 0.2, '• Many "improvements" still lose to the other function', 
                 ha='left', va='top', fontsize=11, transform=ax3.transAxes)
        
        ax3.text(0.05, 0.05, '❌ Previous bug: Counted positive Δ as "improvements"', 
                 ha='left', va='top', fontsize=11, color='gray', transform=ax3.transAxes)
        
        ax3.axis('off')
        
        # 4. Summary statistics table
        ax4.axis('tight')
        ax4.axis('off')
        ax4.set_title('CORRECTED Performance Summary', fontweight='bold', pad=20)
        
        summary_data = [
            ['Mutation Type', 'Improved (Δ<0)', 'Made Worse (Δ>0)', 'Actually Kept', 'Mean Δ'],
            ['Permutation', 
             f"{mutation_stats['perm_stats']['improvement_rate']:.1f}%", 
             f"{mutation_stats['perm_stats']['worse_rate']:.1f}%",
             f"{mutation_stats['actual_perm_success']:.1f}%",
             f"{mutation_stats['perm_stats']['mean']:.1f}"],
            ['Decision', 
             f"{mutation_stats['dec_stats']['improvement_rate']:.1f}%", 
             f"{mutation_stats['dec_stats']['worse_rate']:.1f}%",
             f"{mutation_stats['actual_dec_success']:.1f}%",
             f"{mutation_stats['dec_stats']['mean']:.1f}"]
        ]
        
        table = ax4.table(cellText=summary_data, loc='center', cellLoc='center')
        table.auto_set_font_size(False)
        table.set_fontsize(11)
        table.scale(1.2, 2)
        
        # Style header
        for i in range(5):
            table[(0, i)].set_facecolor('#34495e')
            table[(0, i)].set_text_props(weight='bold', color='white')
        
        # Color code the data
        for row in range(1, 3):
            table[(row, 1)].set_facecolor('#E8F5E8')  # Green for improvements
            table[(row, 2)].set_facecolor('#FADBD8')  # Red for worse
            table[(row, 3)].set_facecolor('#EBF3FD')  # Blue for kept
        
        plt.tight_layout()
        plt.savefig(output_dir / 'improvement_analysis_CORRECTED.png', dpi=300, bbox_inches='tight')
        plt.close()
    
    def _categorize_deltas_corrected(self, deltas):
        """Categorize delta scores with correct interpretation"""
        total = len(deltas)
        if total == 0:
            return [0, 0, 0, 0, 0, 0]
        
        much_better = sum(1 for d in deltas if d < -100) / total * 100    # Much better
        better = sum(1 for d in deltas if -100 <= d < -10) / total * 100   # Better
        slightly_better = sum(1 for d in deltas if -10 <= d < 0) / total * 100  # Slightly better
        slightly_worse = sum(1 for d in deltas if 0 <= d < 10) / total * 100    # Slightly worse
        worse = sum(1 for d in deltas if 10 <= d < 100) / total * 100      # Worse
        much_worse = sum(1 for d in deltas if d >= 100) / total * 100       # Much worse
        
        return [much_better, better, slightly_better, slightly_worse, worse, much_worse]
    
    def generate_report(self, output_dir='analysis_output_corrected'):
        """Generate comprehensive text report with CORRECTED interpretation"""
        output_dir = Path(output_dir)
        output_dir.mkdir(exist_ok=True)
        
        stats = self.analyze_mutations()
        
        report_lines = []
        report_lines.append("=" * 80)
        report_lines.append("CRYPTOPT MUTATION ANALYSIS REPORT - *** CORRECTED ***")
        report_lines.append(f"Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
        report_lines.append(f"File: {self.metrics_file}")
        report_lines.append("=" * 80)
        
        # Critical correction notice
        report_lines.append(f"\n🚨 CRITICAL CORRECTION:")
        report_lines.append(f"   Previous analysis had WRONG sign interpretation!")
        report_lines.append(f"   ✅ CORRECT: Negative Δ = BETTER performance (fewer cycles)")
        report_lines.append(f"   ❌ WRONG:   Positive Δ = WORSE performance (more cycles)")
        
        # Overview
        report_lines.append(f"\n📊 EXPERIMENT OVERVIEW:")
        report_lines.append(f"   Symbol: {self.data['symbolname']}")
        report_lines.append(f"   Total Evaluations: {self.data['args']['evals']:,}")
        report_lines.append(f"   Total Mutations: {stats['total_mutations']:,}")
        report_lines.append(f"   Natural Distribution: {stats['perm_ratio']:.1f}% Permutation / {100-stats['perm_ratio']:.1f}% Decision")
        
        # CORRECTED performance analysis
        report_lines.append(f"\n🎯 CORRECTED PERFORMANCE ANALYSIS:")
        report_lines.append(f"   {'Metric':<30} {'Permutation':>15} {'Decision':>15} {'Gap':>10}")
        report_lines.append(f"   {'-'*30} {'-'*15} {'-'*15} {'-'*10}")
        report_lines.append(f"   {'Success Rate (Actually Kept)':<30} {stats['actual_perm_success']:>14.1f}% {stats['actual_dec_success']:>14.1f}% {stats['actual_dec_success']-stats['actual_perm_success']:>9.1f}%")
        report_lines.append(f"   {'IMPROVEMENT Rate (Δ<0)':<30} {stats['perm_stats']['improvement_rate']:>14.1f}% {stats['dec_stats']['improvement_rate']:>14.1f}% {stats['dec_stats']['improvement_rate']-stats['perm_stats']['improvement_rate']:>9.1f}%")
        report_lines.append(f"   {'Made WORSE Rate (Δ>0)':<30} {stats['perm_stats']['worse_rate']:>14.1f}% {stats['dec_stats']['worse_rate']:>14.1f}% {stats['dec_stats']['worse_rate']-stats['perm_stats']['worse_rate']:>9.1f}%")
        report_lines.append(f"   {'Mean Δ (cycles)':<30} {stats['perm_stats']['mean']:>15.1f} {stats['dec_stats']['mean']:>15.1f} {stats['dec_stats']['mean']-stats['perm_stats']['mean']:>10.1f}")
        
        # Key insights
        report_lines.append(f"\n💡 KEY INSIGHTS (CORRECTED):")
        
        if stats['perm_stats']['improvement_rate'] > stats['dec_stats']['improvement_rate']:
            better_type = "Permutation"
            worse_type = "Decision"
            gap = stats['perm_stats']['improvement_rate'] - stats['dec_stats']['improvement_rate']
        else:
            better_type = "Decision"
            worse_type = "Permutation"
            gap = stats['dec_stats']['improvement_rate'] - stats['perm_stats']['improvement_rate']
        
        report_lines.append(f"   1. {better_type} mutations are {gap:.1f}% more likely to improve performance")
        report_lines.append(f"   2. Most mutations (~{stats['perm_stats']['worse_rate']:.0f}%) actually HURT performance")
        report_lines.append(f"   3. Only ~{stats['perm_stats']['improvement_rate']:.0f}% of mutations actually help")
        report_lines.append(f"   4. Success rates (~{stats['actual_perm_success']:.0f}%) are reasonable given this context")
        
        # What was wrong before
        report_lines.append(f"\n❌ WHAT WAS WRONG IN PREVIOUS ANALYSIS:")
        report_lines.append(f"   • Counted positive Δ as 'improvements' (~67%)")
        report_lines.append(f"   • Created false 'paradox' of high improvement but low success")
        report_lines.append(f"   • Truth: Most mutations made performance WORSE")
        
        # Save report
        report_content = '\n'.join(report_lines)
        report_file = output_dir / 'analysis_report_CORRECTED.txt'
        with open(report_file, 'w') as f:
            f.write(report_content)
        
        print(report_content)
        print(f"\n📄 Full CORRECTED report saved to: {report_file}")
        
        return report_content

def main():
    parser = argparse.ArgumentParser(description='Analyze CryptOpt metrics with CORRECTED delta interpretation')
    parser.add_argument('metrics_file', help='Path to metrics JSON file')
    parser.add_argument('-o', '--output-dir', default='analysis_output_corrected',
                       help='Output directory for plots and reports')
    
    args = parser.parse_args()
    
    # Create analyzer
    analyzer = CryptOptAnalyzer(args.metrics_file)
    
    # Generate report and plots
    print("📊 Analyzing metrics with CORRECTED delta interpretation...")
    print("🚨 KEY FIX: Negative Δ = BETTER (fewer cycles), Positive Δ = WORSE (more cycles)")
    analyzer.generate_report(args.output_dir)
    analyzer.create_comprehensive_plots(args.output_dir)
    
    print(f"\n✅ CORRECTED analysis complete! Check {args.output_dir}/ for all outputs.")

if __name__ == "__main__":
    main() 