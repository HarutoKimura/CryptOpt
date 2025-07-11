#!/usr/bin/env python3
"""
Simple CryptOpt Mutation Analysis Tool
Analyzes the effectiveness of Permutation vs Decision mutations using basic Python
"""

import json
import sys
from collections import defaultdict, Counter

def load_metrics(metrics_file):
    """Load and parse CryptOpt metrics JSON file"""
    with open(metrics_file, 'r') as f:
        return json.load(f)

def analyze_mutations(data):
    """Analyze mutation patterns and effectiveness"""
    
    mutations = data['mutationOrder']
    total_mutations = len(mutations)
    
    # Basic statistics by type
    perm_deltas = []
    dec_deltas = []
    perm_count = 0
    dec_count = 0
    
    # Time-based analysis
    stages = {'Early': [], 'Mid': [], 'Late': []}
    stage_boundaries = [total_mutations * 0.25, total_mutations * 0.75]
    
    # Improvement categories
    improvement_cats = {
        'Permutation': {'Negative': 0, 'Small': 0, 'Medium': 0, 'Large': 0},
        'Decision': {'Negative': 0, 'Small': 0, 'Medium': 0, 'Large': 0}
    }
    
    for i, mut in enumerate(mutations):
        delta = mut['deltaScore']
        mut_type = mut['type']
        
        if mut_type == 'Permutation':
            perm_deltas.append(delta)
            perm_count += 1
        else:
            dec_deltas.append(delta)
            dec_count += 1
        
        # Categorize improvement
        if delta < 0:
            cat = 'Negative'
        elif delta < 10:
            cat = 'Small'
        elif delta < 100:
            cat = 'Medium'
        else:
            cat = 'Large'
        improvement_cats[mut_type][cat] += 1
        
        # Stage analysis
        if i < stage_boundaries[0]:
            stage = 'Early'
        elif i < stage_boundaries[1]:
            stage = 'Mid'
        else:
            stage = 'Late'
        stages[stage].append((mut_type, delta))
    
    return {
        'perm_deltas': perm_deltas,
        'dec_deltas': dec_deltas,
        'perm_count': perm_count,
        'dec_count': dec_count,
        'total_mutations': total_mutations,
        'stages': stages,
        'improvement_cats': improvement_cats
    }

def analyze_bet_phases(data):
    """Analyze bet phase statistics"""
    bet_stats = []
    
    for bet in data.get('betPhaseDetails', []):
        if bet['phaseStats']:
            stats = bet['phaseStats'][0]['mutations']
            bet_info = {
                'betIndex': bet['betIndex'],
                'permutationCount': stats['permutation'],
                'decisionCount': stats['decision'],
                'permutationKept': stats['permutationKept'],
                'decisionKept': stats['decisionKept'],
                'permutationSuccessRate': stats['permutationKept'] / stats['permutation'] if stats['permutation'] > 0 else 0,
                'decisionSuccessRate': stats['decisionKept'] / stats['decision'] if stats['decision'] > 0 else 0,
                'fallbacks': stats['decisionToPermutationFallbacks'],
                'finalRatio': bet['finalRatio']
            }
            bet_stats.append(bet_info)
    
    return bet_stats

def calculate_stats(values):
    """Calculate basic statistics for a list of values"""
    if not values:
        return {'mean': 0, 'median': 0, 'std': 0, 'min': 0, 'max': 0}
    
    values = sorted(values)
    n = len(values)
    mean = sum(values) / n
    median = values[n//2] if n % 2 == 1 else (values[n//2-1] + values[n//2]) / 2
    
    # Standard deviation
    variance = sum((x - mean) ** 2 for x in values) / n
    std = variance ** 0.5
    
    return {
        'mean': mean,
        'median': median,
        'std': std,
        'min': min(values),
        'max': max(values)
    }

def generate_report(analysis, bet_stats, data):
    """Generate a comprehensive text-based analysis report"""
    
    print("=" * 80)
    print("CRYPTOPT MUTATION ANALYSIS REPORT")
    print("=" * 80)
    
    # Basic overview
    print(f"\n📊 OVERVIEW:")
    print(f"   Total Evaluations: {data['args']['evals']:,}")
    print(f"   Total Mutations: {analysis['total_mutations']:,}")
    print(f"   Permutation Mutations: {analysis['perm_count']:,} ({analysis['perm_count']/analysis['total_mutations']*100:.1f}%)")
    print(f"   Decision Mutations: {analysis['dec_count']:,} ({analysis['dec_count']/analysis['total_mutations']*100:.1f}%)")
    
    # Performance statistics
    perm_stats = calculate_stats(analysis['perm_deltas'])
    dec_stats = calculate_stats(analysis['dec_deltas'])
    
    print(f"\n🎯 PERFORMANCE STATISTICS:")
    print(f"   Permutation Mutations:")
    print(f"     Mean Δ: {perm_stats['mean']:8.1f} cycles")
    print(f"     Median: {perm_stats['median']:8.1f} cycles")
    print(f"     Std Dev: {perm_stats['std']:7.1f} cycles")
    print(f"     Range: {perm_stats['min']:8.1f} to {perm_stats['max']:8.1f} cycles")
    
    print(f"   Decision Mutations:")
    print(f"     Mean Δ: {dec_stats['mean']:8.1f} cycles")
    print(f"     Median: {dec_stats['median']:8.1f} cycles")
    print(f"     Std Dev: {dec_stats['std']:7.1f} cycles")
    print(f"     Range: {dec_stats['min']:8.1f} to {dec_stats['max']:8.1f} cycles")
    
    # Improvement breakdown
    print(f"\n📈 IMPROVEMENT BREAKDOWN:")
    for mut_type in ['Permutation', 'Decision']:
        cats = analysis['improvement_cats'][mut_type]
        total = sum(cats.values())
        print(f"   {mut_type} ({total} mutations):")
        for cat, count in cats.items():
            pct = count / total * 100 if total > 0 else 0
            print(f"     {cat:8}: {count:4} ({pct:5.1f}%)")
    
    # Stage analysis
    print(f"\n⏱️  PERFORMANCE BY OPTIMIZATION STAGE:")
    for stage, mutations in analysis['stages'].items():
        if mutations:
            perm_in_stage = [delta for mut_type, delta in mutations if mut_type == 'Permutation']
            dec_in_stage = [delta for mut_type, delta in mutations if mut_type == 'Decision']
            
            print(f"   {stage} Stage ({len(mutations)} mutations):")
            if perm_in_stage:
                perm_stage_stats = calculate_stats(perm_in_stage)
                print(f"     Permutation: {len(perm_in_stage):3} mutations, avg Δ = {perm_stage_stats['mean']:6.1f}")
            if dec_in_stage:
                dec_stage_stats = calculate_stats(dec_in_stage)
                print(f"     Decision:    {len(dec_in_stage):3} mutations, avg Δ = {dec_stage_stats['mean']:6.1f}")
    
    # Bet phase analysis
    if bet_stats:
        print(f"\n🎲 BET PHASE ANALYSIS:")
        print(f"   Number of Bet Phases: {len(bet_stats)}")
        
        avg_perm_success = sum(b['permutationSuccessRate'] for b in bet_stats) / len(bet_stats)
        avg_dec_success = sum(b['decisionSuccessRate'] for b in bet_stats) / len(bet_stats)
        total_fallbacks = sum(b['fallbacks'] for b in bet_stats)
        
        print(f"   Average Permutation Success Rate: {avg_perm_success:.3f}")
        print(f"   Average Decision Success Rate: {avg_dec_success:.3f}")
        print(f"   Total Decision→Permutation Fallbacks: {total_fallbacks}")
        
        print(f"\n   Detailed Bet Results:")
        print(f"   {'Bet':>3} {'P-Count':>7} {'D-Count':>7} {'P-Success':>9} {'D-Success':>9} {'Fallbacks':>9} {'Final':>8}")
        print(f"   {'-'*3} {'-'*7} {'-'*7} {'-'*9} {'-'*9} {'-'*9} {'-'*8}")
        for bet in bet_stats:
            print(f"   {bet['betIndex']:3} {bet['permutationCount']:7} {bet['decisionCount']:7} "
                  f"{bet['permutationSuccessRate']:9.3f} {bet['decisionSuccessRate']:9.3f} "
                  f"{bet['fallbacks']:9} {bet['finalRatio']:8.4f}")
    
    # Key insights
    print(f"\n💡 KEY INSIGHTS:")
    
    # Performance comparison
    if perm_stats['mean'] > dec_stats['mean']:
        diff = perm_stats['mean'] - dec_stats['mean']
        print(f"   • Permutation mutations show {diff:.1f} cycles better average improvement")
    elif dec_stats['mean'] > perm_stats['mean']:
        diff = dec_stats['mean'] - perm_stats['mean']
        print(f"   • Decision mutations show {diff:.1f} cycles better average improvement")
    else:
        print(f"   • Both mutation types show similar average improvement")
    
    # Consistency comparison
    if perm_stats['std'] > dec_stats['std']:
        print(f"   • Permutation mutations are more variable (std: {perm_stats['std']:.1f} vs {dec_stats['std']:.1f})")
    elif dec_stats['std'] > perm_stats['std']:
        print(f"   • Decision mutations are more variable (std: {dec_stats['std']:.1f} vs {perm_stats['std']:.1f})")
    else:
        print(f"   • Both mutation types show similar variability")
    
    # Natural distribution
    natural_perm_ratio = analysis['perm_count'] / analysis['total_mutations'] * 100
    print(f"   • Natural distribution: {natural_perm_ratio:.1f}% Permutation / {100-natural_perm_ratio:.1f}% Decision")
    
    if abs(natural_perm_ratio - 50) > 2:
        if natural_perm_ratio > 50:
            print(f"   • System naturally favors Permutation (+{natural_perm_ratio-50:.1f}% above 50/50)")
        else:
            print(f"   • System naturally favors Decision (+{50-natural_perm_ratio:.1f}% above 50/50)")
    else:
        print(f"   • System maintains near-balanced mutation distribution")
    
    # Success rate comparison (if bet data available)
    if bet_stats:
        if avg_perm_success > avg_dec_success:
            print(f"   • Permutation mutations have higher success rate ({avg_perm_success:.3f} vs {avg_dec_success:.3f})")
        elif avg_dec_success > avg_perm_success:
            print(f"   • Decision mutations have higher success rate ({avg_dec_success:.3f} vs {avg_perm_success:.3f})")
        
        if total_fallbacks > 0:
            fallback_rate = total_fallbacks / sum(b['decisionCount'] for b in bet_stats) * 100
            print(f"   • Decision fallback rate: {fallback_rate:.1f}% (when no hot decisions available)")

def main():
    if len(sys.argv) != 2:
        print("Usage: python3 simple_analysis.py <metrics_file.json>")
        sys.exit(1)
    
    metrics_file = sys.argv[1]
    
    try:
        # Load data
        print("Loading metrics data...")
        data = load_metrics(metrics_file)
        
        # Analyze mutations
        print("Analyzing mutations...")
        analysis = analyze_mutations(data)
        bet_stats = analyze_bet_phases(data)
        
        # Generate report
        generate_report(analysis, bet_stats, data)
        
    except FileNotFoundError:
        print(f"Error: File '{metrics_file}' not found")
        sys.exit(1)
    except json.JSONDecodeError:
        print(f"Error: Invalid JSON in '{metrics_file}'")
        sys.exit(1)
    except Exception as e:
        print(f"Error: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()