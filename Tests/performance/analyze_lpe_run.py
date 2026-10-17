"""Summarize an endless LPE fps_probe run against the Oct 6 baseline protocol.

Usage: python analyze_lpe_run.py <fps.csv> [cpu.csv]
Baseline (log/endless/modern-fps.csv, valid window 400s): mean 80.2 / median 83 /
p10 56 / min 37 / 0 seconds below 30 fps.
"""
import csv
import statistics
import sys

BASELINE = {"mean": 80.2, "median": 83, "p10": 56, "min": 37, "low30": 0}


def main() -> int:
    rows = list(csv.DictReader(open(sys.argv[1])))
    frames = [int(r["changed_frames"]) for r in rows]
    # valid window: first sustained gameplay second (>=30 for 5 consecutive)
    # until the last nonzero second (trailing zeros = window occluded/lost)
    start = next((i for i, f in enumerate(frames)
                  if f >= 30 and all(x >= 25 for x in frames[i:i + 5])), 0)
    end = len(frames)
    while end > start and frames[end - 1] == 0:
        end -= 1
    game = frames[start:end]
    if len(game) < 60:
        print(f"ERROR: valid window too short ({len(game)}s from t={start})")
        return 1
    stats = {
        "mean": statistics.mean(game),
        "median": statistics.median(game),
        "p10": sorted(game)[len(game) // 10],
        "min": min(game),
        "low30": sum(1 for f in game if f < 30),
    }
    print(f"valid window t={start}..{end - 1} ({len(game)}s of {len(frames)}s sampled)")
    print(f"  mean={stats['mean']:.1f}  median={stats['median']:.0f}  "
          f"p10={stats['p10']}  min={stats['min']}  max={max(game)}  "
          f"secs<30fps={stats['low30']}")
    print(f"baseline: mean={BASELINE['mean']} median={BASELINE['median']} "
          f"p10={BASELINE['p10']} min={BASELINE['min']} low30={BASELINE['low30']}")
    verdict = (stats["mean"] >= BASELINE["mean"] * 0.95 and
               stats["p10"] >= BASELINE["p10"] * 0.9)
    print("VERDICT:", "PASS (within tolerance)" if verdict else "FAIL (worse than baseline)")
    if len(sys.argv) > 2:
        cpu = list(csv.DictReader(open(sys.argv[2])))
        seg = [float(r["cpu_percent"]) for r in cpu
               if start <= float(r["elapsed_s"]) < end]
        if seg:
            print(f"cpu: mean={statistics.mean(seg):.1f}% "
                  f"peak={max(seg):.1f}% samples={len(seg)}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
