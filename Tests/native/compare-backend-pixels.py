"""Compare diagnostic BGRA snapshots without scaling or resampling."""
import argparse
import array
import json
from pathlib import Path

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument("reference", type=Path)
parser.add_argument("candidate", type=Path)
parser.add_argument("--width", type=int, default=320)
parser.add_argument("--height", type=int, default=256)
args = parser.parse_args()
reference, candidate = array.array("I"), array.array("I")
reference.frombytes(args.reference.read_bytes())
candidate.frombytes(args.candidate.read_bytes())
extent = args.width * args.height
if extent <= 0 or len(reference) != len(candidate) or len(reference) % extent:
    raise SystemExit("Comparison inputs have incompatible dimensions")
names = ["scene-filters-samplers", "generated-straight-diagnostic",
         "generated-composited-black", "font-double-weights"]
results = []
for case in range(len(reference) // extent):
    changed = channels = maximum = alpha_zero = 0
    samples = []
    for offset in range(extent):
        a, b = reference[case * extent + offset], candidate[case * extent + offset]
        if a == b:
            continue
        changed += 1
        alpha_zero += (a >> 24) == (b >> 24) == 0
        deltas = [abs(((a >> shift) & 255) - ((b >> shift) & 255))
                  for shift in (0, 8, 16, 24)]
        channels += sum(delta != 0 for delta in deltas)
        maximum = max(maximum, *deltas)
        if len(samples) < 4:
            samples.append({"x": offset % args.width, "y": offset // args.width,
                            "reference": hex(a), "candidate": hex(b)})
    results.append({"case": names[case] if case < len(names) else str(case),
                    "pixels": extent, "different_pixels": changed,
                    "different_channels": channels, "max_channel_delta": maximum,
                    "different_with_both_alpha_bytes_zero": alpha_zero,
                    "examples": samples})
print(json.dumps(results, indent=2))
raise SystemExit(1 if any(case["different_pixels"] for case in results) else 0)
