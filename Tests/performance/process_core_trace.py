"""Own one named ETW recording and bin target-process scheduler residency."""

import csv
from pathlib import Path
import subprocess


def attribute_rows(rows, slices, begin_qpc, frequency, cores):
    """Split every switch-residency span at actual observer sample boundaries."""
    boundaries = [begin_qpc] + [begin_qpc + round(row["elapsed_s"] * frequency) for row in rows]
    for row in rows:
        for core in cores:
            row[f"cpu_lp{core}_percent"] = 0.0
    import bisect
    for core, start, end in slices:
        if core not in cores or end <= boundaries[0] or start >= boundaries[-1]:
            continue
        index = max(0, bisect.bisect_right(boundaries, start) - 1)
        while index < len(rows) and boundaries[index] < end:
            duration = max(0, min(end, boundaries[index + 1]) - max(start, boundaries[index]))
            interval = boundaries[index + 1] - boundaries[index]
            if interval > 0:
                rows[index][f"cpu_lp{core}_percent"] += duration * 100.0 / interval
            index += 1
    return rows


class ProcessCoreTrace:
    def __init__(self, helper, pid, mask, directory):
        self.directory = Path(directory)
        self.cores = [core for core in range(64) if mask & (1 << core)]
        self.stderr = (self.directory / "core-trace-stderr.txt").open("w", encoding="utf-8")
        self.process = subprocess.Popen(
            [str(helper), str(pid), hex(mask), str(self.directory)],
            stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=self.stderr,
            text=True, creationflags=getattr(subprocess, "CREATE_NO_WINDOW", 0))
        ready = self.process.stdout.readline().strip()
        if not ready.startswith("READY "):
            self.process.wait(timeout=15)
            self.stderr.close()
            detail = (self.directory / "core-trace-stderr.txt").read_text(encoding="utf-8")
            raise RuntimeError("Per-core ETW recording could not start. " + detail)
        self.frequency = int(ready.split()[1])
        self.stopped = False

    def stop(self):
        if self.stopped:
            return
        self.stopped = True
        stdout, _ = self.process.communicate("STOP\n", timeout=180)
        self.stderr.close()
        if self.process.returncode or not stdout.strip().startswith("COMPLETE "):
            detail = (self.directory / "core-trace-stderr.txt").read_text(encoding="utf-8")
            raise RuntimeError("Per-core ETW data is invalid; no substitute curves generated. " + detail)

    def annotate(self, rows, begin_qpc):
        self.stop()
        with (self.directory / "process-core-slices.csv").open(newline="") as stream:
            spans = ((int(row["core"]), int(row["begin_qpc"]), int(row["end_qpc"]))
                     for row in csv.DictReader(stream))
            return attribute_rows(rows, spans, begin_qpc, self.frequency, self.cores)
