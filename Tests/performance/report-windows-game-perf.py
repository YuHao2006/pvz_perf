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


def plot_game_timeline(rows, summary, label, destination, stem):
    selected = [r for r in rows if r["segment"] == "game"]
    seconds = summary["seconds"]
    font = FontProperties(fname="C:/Windows/Fonts/msyh.ttc")
    plt.rcParams.update({"axes.spines.top":False,"axes.spines.right":False,"axes.titleweight":"bold"})
    fig, axes = plt.subplots(2, 1, figsize=(12, 7.4), sharex=True,
                             gridspec_kw={"height_ratios":[2,1]})
    times = [float(r["elapsed_s"]) for r in rows]
    values={}
    for field in ("draw_fps","cpu_percent","cpu_ms_per_draw_frame"):
        values[field]=[]
        for r in rows:
            if r["segment"] != "game": values[field].append(float("nan")); continue
            value=(float(r["cpu_percent"])*10/float(r["draw_fps"])
                   if field=="cpu_ms_per_draw_frame" else float(r[field]))
            values[field].append(value)
    for field,color,title in [("draw_fps","#176b92","绘制FPS"),
                               ("cpu_percent","#dc7b18","CPU占用（单核100%）")]:
        axes[0].plot(times,values[field],color=color,linewidth=1.2,label=title)
    axes[0].set_ylabel("绘制FPS／CPU占用（%）",fontproperties=font)
    axes[0].set_ylim(0,max(110,summary["fps_max"]*1.05,max(float(r["cpu_percent"])for r in selected)*1.08))
    axes[0].legend(prop=font,loc="lower left",ncol=2)
    axes[1].plot(times,values["cpu_ms_per_draw_frame"],color="#7053a0",linewidth=1.1)
    axes[1].axhline(summary["cpu_ms_per_frame"],color="#7053a0",linewidth=.85,linestyle="--",
                    label=f"整体 {summary['cpu_ms_per_frame']:.3f} ms／帧")
    axes[1].set_ylabel("CPU ms／绘制帧",fontproperties=font)
    axes[1].set_ylim(bottom=0)
    axes[1].legend(prop=font,loc="upper right")
    for ax in axes:
        ax.grid(alpha=.2)
        ax.set_xlim(0,max(times))
    axes[-1].set_xlabel("观测开始后的时间（秒）；剔除区间保留缺口",fontproperties=font)
    fig.suptitle(label,fontproperties=font,fontsize=15,y=.98)
    fig.text(.09,.925,f"有效战斗 {seconds:.3f}s  |  波次 {summary['wave_first']}→{summary['wave_last']}  |  "
             f"{summary['fps']:.3f} FPS  |  CPU {summary['cpu_percent']:.2f}%  |  {summary['cpu_ms_per_frame']:.3f} ms／帧",
             fontproperties=font,fontsize=10)
    fig.text(.09,.018,"只绘制 game 有效前台样本；1秒区间统计，非独立逐帧计时；CPU为整个进程。GPU频率本轮未核验。",
             fontproperties=font,fontsize=9)
    fig.tight_layout(rect=(.02,.04,.99,.91))
    fig.savefig(destination / f"{stem}-timeline.png",dpi=160)
    fig.savefig(destination / f"{stem}-timeline.svg")
    plt.close(fig)


def report(source, destination):
    destination.mkdir(parents=True, exist_ok=True)
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

        plot_game_timeline(rows, dict(fps=entry["fps_mean"],
            cpu_percent=entry["cpu_percent"], cpu_ms_per_frame=entry["cpu_ms_per_draw_frame"],
            seconds=seconds, wave_first=selected[0]["wave"], wave_last=selected[-1]["wave"],
            fps_max=max(float(r["draw_fps"]) for r in selected)),
            f"{label} · {metadata['core']} {metadata['multiplier']}", destination, kind)
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


def report_single(source, destination, label):
    destination.mkdir(parents=True, exist_ok=True)
    metadata = json.loads((source / "measurement.json").read_text(encoding="utf-8"))
    with (source / "samples.csv").open(newline="", encoding="utf-8") as stream:
        rows = list(csv.DictReader(stream))
    selected = [r for r in rows if r["segment"] == "game"]
    if not selected or any(r["valid"] != "1" or r["scene"] != "3" or r["foreground"] != "1" for r in selected):
        raise ValueError("No consistent foreground game samples")
    seconds = sum(float(r["interval_s"]) for r in selected)
    frames = sum(float(r["draw_fps"]) * float(r["interval_s"]) for r in selected)
    cpu = sum(float(r["cpu_percent"]) * float(r["interval_s"]) / 100 for r in selected)
    updates = sum(float(r["update_hz"]) * float(r["interval_s"]) for r in selected)
    summary = dict(label=label, selection="segment=game, valid=1, scene=3, foreground=1",
        seconds=seconds, valid_samples=len(selected), recorded_seconds=metadata["recorded_seconds"],
        frames=round(frames), cpu_seconds=cpu, fps=frames/seconds, update_hz=updates/seconds,
        cpu_percent=cpu/seconds*100, cpu_ms_per_frame=cpu*1000/frames,
        wave_first=int(selected[0]["wave"]), wave_last=int(selected[-1]["wave"]),
        fps_min=min(float(r["draw_fps"]) for r in selected),
        fps_max=max(float(r["draw_fps"]) for r in selected),
        max_interval_cpu_ms=max(float(r["cpu_percent"])*10/float(r["draw_fps"]) for r in selected),
        excluded=dict(Counter(r["segment"] for r in rows if r["segment"] != "game")),
        executable_sha256=metadata["executable_sha256"], stop_reason=metadata["stop_reason"])
    plot_game_timeline(rows, summary, label, destination, metadata["kind"])
    for name in ("samples.csv","measurement.json"):
        shutil.copy2(source/name,destination/name)
    (destination/"summary.json").write_text(json.dumps(summary,ensure_ascii=False,indent=2),encoding="utf-8")
    print(json.dumps(summary,ensure_ascii=False,indent=2))


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("source", type=Path)
    parser.add_argument("destination", type=Path)
    parser.add_argument("--single", action="store_true")
    parser.add_argument("--label", default="pvz_perf / Vulkan · LPE14 11x")
    args = parser.parse_args()
    if args.single: report_single(args.source,args.destination,args.label)
    else: report(args.source, args.destination)
