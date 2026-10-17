"""Analyze the manually confirmed credits run without rewriting raw measurements."""

import argparse
from collections import Counter
import csv
import hashlib
import json
import math
from pathlib import Path


def analyze(directory):
    cases = {}
    for kind in ("original", "project"):
        case = directory / f"{kind}-credits-25x"
        metadata = json.loads((case / "measurement/measurement.json").read_text())
        with (case / "measurement/samples.csv").open(newline="") as stream:
            rows = list(csv.DictReader(stream))
        # This run was manually started at t=3. Project credits retained scene 5.
        selected = {}
        for index, row in enumerate(rows):
            elapsed = float(row["elapsed_s"])
            second = math.floor(elapsed)
            previous = rows[index - 1] if index else None
            if not (4 <= second <= 163 and previous
                    and row["foreground"] == previous["foreground"] == "1"):
                continue
            if kind == "original" and row["segment"] != "game":
                continue
            if kind == "project" and not (
                    row["scene"] == "5" and row["segment"] == "other-scene"):
                continue
            if second in selected:
                raise ValueError(f"Duplicate sample second: {kind}, {second}")
            selected[second] = row
        cases[kind] = (metadata, rows, selected)
    common = set(cases["original"][2]) & set(cases["project"][2])
    if common != set(range(4, 164)):
        raise ValueError("The manually confirmed common interval is incomplete")
    results = []
    for kind, (metadata, rows, selected) in cases.items():
        total_time = total_cpu = total_frames = 0.0
        fields = list(rows[0]) + ["analysis_selected", "analysis_cpu_ms_per_draw_frame"]
        with (directory / f"{kind}-credits-analysis.csv").open("w", newline="") as stream:
            writer = csv.DictWriter(stream, fieldnames=fields)
            writer.writeheader()
            for row in rows:
                row = dict(row)
                second = math.floor(float(row["elapsed_s"]))
                included = second in common and selected.get(second) == row
                row["analysis_selected"] = int(included)
                row["analysis_cpu_ms_per_draw_frame"] = ""
                if included:
                    interval = float(row["interval_s"])
                    frames = float(row["draw_fps"]) * interval
                    cpu = float(row["cpu_percent"]) / 100 * interval
                    if frames <= 0:
                        raise ValueError("Selected interval has no draw frames")
                    row["analysis_cpu_ms_per_draw_frame"] = cpu * 1000 / frames
                    total_time += interval
                    total_cpu += cpu
                    total_frames += frames
                writer.writerow(row)
        results.append({
            "kind": kind,
            "core": metadata["core"],
            "multiplier": metadata["multiplier"],
            "executable_sha256": metadata["executable_sha256"],
            "samples": len(common),
            "seconds": total_time,
            "draw_frames": round(total_frames),
            "cpu_seconds": total_cpu,
            "cpu_ms_per_draw_frame": total_cpu * 1000 / total_frames,
            "fps_mean": total_frames / total_time,
            "cpu_percent": total_cpu / total_time * 100,
            "raw_segment_counts": dict(Counter(r["segment"] for r in rows)),
        })
    original, project = results
    summary = {
        "selection": "Common endpoint seconds 4..163; both foreground endpoints; "
                     "original segment=game; project scene=5 and raw segment=other-scene.",
        "project_scene_evidence": {
            "manual_confirmation": "User confirms this run played project credits.",
            "source": "pvzPerf/LawnApp.cpp::ShowCreditScreen",
            "mechanism": "Creates CreditScreen without assigning mGameScene; "
                         "the previous award scene (5) remains.",
            "limitation": "Raw CSV has no CreditScreen pointer or playback position; "
                          "credits attribution relies on manual confirmation and source audit.",
        },
        "method": "sum(process CPU seconds) * 1000 / sum(draw frames); "
                  "one-second interval averages, not individual-frame timings.",
        "limitations": [
            "One serial pair, not repeated ABBA.",
            "Manual t=3 start does not prove frame-exact playback alignment.",
            "One-second endpoint checks cannot exclude all subsecond interruptions.",
        ],
        "results": results,
        "cpu_ms_per_frame_reduction_percent": (
            1 - project["cpu_ms_per_draw_frame"] / original["cpu_ms_per_draw_frame"]) * 100,
    }
    (directory / "analysis-summary.json").write_text(
        json.dumps(summary, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    manifest = {}
    for path in sorted(directory.rglob("*")):
        if path.is_file() and path != directory / "evidence-manifest.json":
            content = path.read_bytes()
            manifest[path.relative_to(directory).as_posix()] = {
                "bytes": len(content), "sha256": hashlib.sha256(content).hexdigest()
            }
    (directory / "evidence-manifest.json").write_text(
        json.dumps(manifest, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(summary, ensure_ascii=False, indent=2))


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("directory", type=Path)
    analyze(parser.parse_args().directory)
