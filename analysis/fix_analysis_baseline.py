#!/usr/bin/env python3
"""
Fix baseline in existing analysis files using data from metrics.json
"""

import json
from pathlib import Path
import sys

def fix_analysis_file(analysis_path: Path) -> bool:
    """Fix a single analysis file by reading correct baseline from metrics.json"""

    # Find corresponding metrics.json file
    # analysis: seed*_final_analysis.json
    # metrics: seed*_ratio*_metrics.json

    seed = analysis_path.stem.split('_')[0]  # Extract seed part
    metrics_pattern = f"{seed}_ratio*_metrics.json"

    metrics_files = list(analysis_path.parent.glob(metrics_pattern))
    if not metrics_files:
        print(f"  ⚠️  No metrics.json found for {analysis_path.name}")
        return False

    if len(metrics_files) > 1:
        print(f"  ⚠️  Multiple metrics.json found for {analysis_path.name}, using first")

    metrics_path = metrics_files[0]

    try:
        # Read both files
        with open(analysis_path, 'r') as f:
            analysis_data = json.load(f)

        with open(metrics_path, 'r') as f:
            metrics_data = json.load(f)

        # Get correct performance data from metrics.json
        correct_baseline = metrics_data['finalPerformance']['baselineCycles']
        correct_final = metrics_data['finalPerformance']['cycles']
        correct_improvement = metrics_data['finalPerformance']['improvement']

        # Update analysis.json
        analysis_data['performance']['baseline'] = correct_baseline
        analysis_data['performance']['final'] = correct_final
        analysis_data['performance']['improvementPercent'] = round(correct_improvement, 2)
        analysis_data['performance']['improvementCycles'] = round(correct_baseline - correct_final, 2)

        # Write back
        with open(analysis_path, 'w') as f:
            json.dump(analysis_data, f, indent=2)

        return True

    except Exception as e:
        print(f"  ❌ Error processing {analysis_path.name}: {e}")
        return False

def main():
    if len(sys.argv) < 2:
        base_dir = Path.home() / "CryptOpt/results/pd-analysis"
    else:
        base_dir = Path(sys.argv[1])

    if not base_dir.exists():
        print(f"Error: Directory not found: {base_dir}")
        sys.exit(1)

    print(f"Searching for analysis files in: {base_dir}")
    analysis_files = list(base_dir.rglob("*_final_analysis.json"))
    print(f"Found {len(analysis_files)} analysis files to fix\n")

    fixed = 0
    failed = 0

    for analysis_path in analysis_files:
        print(f"Processing: {analysis_path.parent.name}/{analysis_path.name}")
        if fix_analysis_file(analysis_path):
            fixed += 1
            print(f"  ✅ Fixed")
        else:
            failed += 1

    print(f"\n{'='*60}")
    print(f"Summary:")
    print(f"  Fixed: {fixed}")
    print(f"  Failed: {failed}")
    print(f"  Total: {len(analysis_files)}")
    print(f"{'='*60}")

if __name__ == "__main__":
    main()
