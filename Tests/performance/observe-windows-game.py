"""Observe a manually played game and show temporary charts without a report."""

import argparse
import hashlib
import json
import os
from pathlib import Path
import subprocess
import tempfile
import time

from windows_game_probe import Game, checked, kernel, measure


def plot_samples(directory, label):
    import csv
    import matplotlib

    matplotlib.use("Agg")
    import matplotlib.pyplot as plt

    with (directory / "samples.csv").open(newline="", encoding="utf-8") as stream:
        rows = list(csv.DictReader(stream))
    if not any(row["segment"] == "game" for row in rows):
        print("No active foreground gameplay samples; no chart produced.", flush=True)
        return None
    times = [float(row["elapsed_s"]) for row in rows]

    def values(field):
        return [
            float(row[field]) if row["segment"] == "game" and row[field] else float("nan")
            for row in rows
        ]

    fig, axes = plt.subplots(2, 1, figsize=(13, 7), sharex=True,
                             gridspec_kw={"height_ratios": [2, 1]})
    axes[0].plot(times, values("draw_fps"), color="#13834b", label="FPS")
    axes[0].plot(times, values("cpu_percent"), color="#bd4a2a", label="CPU % (one core)")
    axes[0].set_ylim(0, 100)
    axes[0].set_ylabel("FPS / CPU %")
    axes[0].set_title(f"{label} | LP14 | active gameplay only")
    axes[0].legend(loc="lower right")
    axes[1].plot(times, values("cpu_ms_per_draw_frame"), color="#3259aa")
    axes[1].set_ylim(bottom=0)
    axes[1].set_ylabel("CPU ms / draw frame")
    axes[1].set_xlabel("Elapsed time (seconds)")
    for axis in axes:
        axis.grid(alpha=0.22)
    fig.tight_layout()
    image = directory / "endless.png"
    fig.savefig(image, dpi=150)
    plt.close(fig)
    return image


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--executable", required=True, type=Path)
    parser.add_argument("--layout-tool", required=True, type=Path)
    parser.add_argument("--output", type=Path)
    parser.add_argument("--label", default="pvz_perf / Win7 OpenGL")
    parser.add_argument("--window-events", action="store_true",
                        help="Record foreground, focus and capture events outside the game")
    args = parser.parse_args()
    executable = args.executable.resolve()
    directory = args.output.resolve() if args.output else Path(
        tempfile.mkdtemp(prefix="pvz-opengl-observation-"))
    directory.mkdir(parents=True, exist_ok=True)
    layout = directory / "layout.json"
    offsets = json.loads(subprocess.check_output([str(args.layout_tool.resolve())], text=True))
    offsets["executable_sha256"] = hashlib.sha256(executable.read_bytes()).hexdigest()
    layout.write_text(json.dumps(offsets), encoding="utf-8")
    environment = {key: value for key, value in os.environ.items()
                   if not key.startswith(("PVZ_", "VK_"))}
    process = subprocess.Popen([str(executable)], cwd=executable.parent, env=environment)
    window_events = None
    if args.window_events:
        from windows_window_events import WindowEvents
        window_events = WindowEvents(process.pid, directory / "window-events.jsonl")
        window_events.start()
    handle = checked(kernel.OpenProcess(0x200 | 0x1000, False, process.pid))
    try:
        checked(kernel.SetProcessAffinityMask(handle, 0x4000))
    finally:
        kernel.CloseHandle(handle)
    time.sleep(1)
    game = Game(process.pid, "project", layout)
    try:
        print(f"Game PID {process.pid}, pinned to LP14.", flush=True)
        print("Prepare the endless scene manually; leave Start/Resume pending.", flush=True)
        input("Press Enter here to begin observation, then click Start/Resume at t=3 seconds. ")
        result = measure(game, None, "endless", None, directory / "measurement",
                         preroll=3, interactive=True)
        print(f"Observation ended: {result['stop_reason']}", flush=True)
        image = plot_samples(directory / "measurement", args.label)
        if image:
            print(f"Chart: {image}", flush=True)
            os.startfile(image)
        print(f"Temporary samples: {directory}", flush=True)
    finally:
        game.close()
        if window_events is not None:
            window_events.stop()
            print(f"Window events: {window_events.output}", flush=True)
    input("Press Enter to close this observer. The game can remain open. ")


if __name__ == "__main__":
    main()
