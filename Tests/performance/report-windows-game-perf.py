"""Archive one observed run and plot game-only FPS, CPU and CPU time per draw."""

import argparse
from collections import Counter
import csv
import hashlib
import json
from pathlib import Path
import shutil

import matplotlib

matplotlib.use("Agg")
import matplotlib.pyplot as plt
from matplotlib.font_manager import FontProperties


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def report(source, destination):
    destination.mkdir(parents=True, exist_ok=True)
    font = FontProperties(fname="C:/Windows/Fonts/msyh.ttc")
    reports = []
    for kind, label in (("original", "原版 1073"), ("project", "pvz_perf / DX12")):
        case = source / f"{kind}-endless-25x"
        samples = case / "measurement/samples.csv"
        metadata_path = case / "measurement/measurement.json"
        metadata = json.loads(metadata_path.read_text(encoding="utf-8"))
        with samples.open(newline="", encoding="utf-8") as stream:
            rows = list(csv.DictReader(stream))
        selected = [r for r in rows if r["segment"] == "game"]
        if not selected:
            raise ValueError(f"No game samples: {samples}")
        if any(r["valid"] != "1" or r["scene"] != "3" or r["foreground"] != "1"
               for r in selected):
            raise ValueError(f"Inconsistent game flags: {samples}")
        seconds = sum(float(r["interval_s"]) for r in selected)
        frames = sum(float(r["draw_fps"]) * float(r["interval_s"]) for r in selected)
        cpu_seconds = sum(float(r["cpu_percent"]) * float(r["interval_s"]) / 100
                          for r in selected)
        entry = {
            "kind": kind,
            "multiplier": metadata["multiplier"],
            "core": metadata["core"],
            "affinity": metadata["affinity"],
            "selection": "segment == game",
            "valid_samples": len(selected),
            "seconds": seconds,
            "draw_frames": round(frames),
            "cpu_seconds": cpu_seconds,
            "fps_mean": frames / seconds,
            "cpu_percent": cpu_seconds / seconds * 100,
            "cpu_ms_per_draw_frame": cpu_seconds * 1000 / frames,
            "segment_counts": dict(Counter(r["segment"] for r in rows)),
            "executable": metadata["executable"],
            "executable_sha256": metadata["executable_sha256"],
            "qualification": (
                "Retail Board offsets require verification; pause filtering is provisional."
                if kind == "original" else
                "Observed single run; no individual-frame timing was collected."
            ),
        }
        shutil.copy2(samples, destination / f"{kind}-raw.csv")
        shutil.copy2(metadata_path, destination / f"{kind}-measurement.json")
        if (case / "settings.json").exists():
            shutil.copy2(case / "settings.json", destination / f"{kind}-settings.json")
        fields = list(rows[0]) + ["cpu_ms_per_draw_frame"]
        with (destination / f"{kind}-analysis.csv").open(
                "w", newline="", encoding="utf-8") as stream:
            writer = csv.DictWriter(stream, fieldnames=fields)
            writer.writeheader()
            for row in rows:
                row = dict(row)
                row["cpu_ms_per_draw_frame"] = (
                    float(row["cpu_percent"]) * 10 / float(row["draw_fps"])
                    if row["segment"] == "game" and float(row["draw_fps"]) > 0 else "")
                writer.writerow(row)

        times = [float(r["elapsed_s"]) for r in rows]
        values = {}
        for field in ("draw_fps", "cpu_percent", "cpu_ms_per_draw_frame"):
            values[field] = []
            for r in rows:
                value = float("nan")
                if r["segment"] == "game":
                    value = (float(r["cpu_percent"]) * 10 / float(r["draw_fps"])
                             if field == "cpu_ms_per_draw_frame" and float(r["draw_fps"]) > 0
                             else float(r[field]) if field != "cpu_ms_per_draw_frame"
                             else float("nan"))
                values[field].append(value)
        fig, axes = plt.subplots(2, 1, figsize=(12, 6.8), sharex=True,
                                 gridspec_kw={"height_ratios": [2, 1]})
        for field, color, title in (
            ("draw_fps", "#157b49", "帧率（FPS）"),
            ("cpu_percent", "#c44c28", "CPU（单核 %）"),
        ):
            axes[0].plot(times, values[field], color=color, linewidth=1.2, label=title)
        axes[0].set_ylim(0, 100)
        axes[0].set_ylabel("FPS / CPU %", fontproperties=font)
        axes[0].legend(prop=font, loc="lower left")
        axes[0].set_title(
            f"{label} · 统一无尽 · LP14 / 25x"
            + (" · 暂定：暂停识别待核实" if kind == "original" else ""),
            fontproperties=font)
        axes[1].plot(times, values["cpu_ms_per_draw_frame"], color="#6551a0", linewidth=1.2)
        axes[1].axhline(entry["cpu_ms_per_draw_frame"], color="#6551a0",
                        linewidth=.8, linestyle="--",
                        label=f"整体 {entry['cpu_ms_per_draw_frame']:.3f} ms/帧")
        axes[1].set_ylabel("CPU ms / 绘制帧", fontproperties=font)
        axes[1].set_xlabel("观测开始后的时间（秒）", fontproperties=font)
        axes[1].set_ylim(bottom=0)
        axes[1].legend(prop=font, loc="upper left")
        for ax in axes:
            ax.set_xlim(0, max(times))
            ax.grid(alpha=.22)
        fig.text(.07, .015,
                 "仅绘制 segment=game；缺口为剔除样本；1 秒区间采样，非逐帧计时。"
                 "上图范围 0–100，原始数据保留超过 100 的值。",
                 fontproperties=font, fontsize=9)
        fig.tight_layout(rect=(0, .04, 1, 1))
        fig.savefig(destination / f"{kind}-timeline.png", dpi=160)
        plt.close(fig)
        reports.append(entry)
    payload = {
        "source_directory": str(source.resolve()),
        "method": "Time-weighted game-only samples; CPU ms/frame = total CPU time / total draw count.",
        "limitations": [
            "One serial original/project pair, not repeated ABBA.",
            "Retail Board offsets and pause filtering require verification.",
            "Project settings muted audio; retail audio state was not recorded.",
            "One-second samples cannot resolve individual frame costs or all transition boundaries.",
        ],
        "results": reports,
    }
    (destination / "summary.json").write_text(
        json.dumps(payload, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    files = [p for p in destination.iterdir() if p.is_file() and p.name != "manifest.json"]
    (destination / "manifest.json").write_text(json.dumps({
        p.name: {"bytes": p.stat().st_size, "sha256": sha(p)} for p in sorted(files)
    }, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(payload, ensure_ascii=False, indent=2))


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("source", type=Path)
    parser.add_argument("destination", type=Path)
    args = parser.parse_args()
    report(args.source, args.destination)
