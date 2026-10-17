#!/usr/bin/env python3
"""Sample an existing native Linux game without adding game instrumentation."""

import argparse
import csv
import hashlib
import json
import os
from pathlib import Path
import statistics
import sys
import time


def process_ticks(pid):
    # comm may contain spaces and parentheses; fields after its closing ')' are fixed.
    fields = Path(f"/proc/{pid}/stat").read_text().rsplit(")", 1)[1].split()
    if fields[0] == "Z":
        raise RuntimeError("The game exited during the measurement")
    return int(fields[11]) + int(fields[12]), int(fields[19])


def cpu_information(cpu):
    directory = Path(f"/sys/devices/system/cpu/cpu{cpu}")
    values = {}
    for name in ("topology/core_id", "topology/physical_package_id",
                 "topology/thread_siblings_list", "topology/core_type",
                 "cpufreq/scaling_governor", "cpufreq/scaling_min_freq",
                 "cpufreq/scaling_max_freq", "cpufreq/scaling_cur_freq",
                 "cpufreq/cpuinfo_max_freq"):
        path = directory / name
        values[name] = path.read_text().strip() if path.exists() else None
    return values


def check_affinity(pid, cpu):
    threads = list(Path(f"/proc/{pid}/task").iterdir())
    if not threads:
        raise RuntimeError("The game has no live threads")
    for thread in threads:
        try:
            allowed = os.sched_getaffinity(int(thread.name))
        except ProcessLookupError:
            continue
        if allowed != {cpu}:
            raise RuntimeError(f"Thread {thread.name} is allowed on {sorted(allowed)}, "
                               f"expected only Linux CPU {cpu}")


def sample(args):
    if sys.platform != "linux":
        raise RuntimeError("Run on native Linux; WSL cannot certify native Ubuntu performance")
    if "microsoft" in os.uname().release.lower():
        raise RuntimeError("WSL detected; run this measurement in native Ubuntu")
    if args.seconds < 5:
        raise RuntimeError("Use at least five seconds")
    output = args.output.absolute()
    output.mkdir()
    metadata = {
        "schema": 1, "pid": args.pid, "scene": args.scene,
        "linux_cpu": args.cpu, "cpu_percent_basis": "one logical CPU = 100%",
        "kernel": os.uname().release, "cpu_before": cpu_information(args.cpu),
        "fps": None, "status": "running",
        "limitation": "CPU accounting only. CPU number does not establish Windows LPE14 "
                      "identity; scaling_cur_freq does not prove a fixed hardware ratio. "
                      "FPS must come from an independent frame capture for the same interval.",
    }
    metadata_path = output / "measurement.json"
    try:
        check_affinity(args.pid, args.cpu)
        executable = Path(f"/proc/{args.pid}/exe").resolve(strict=True)
        with executable.open("rb") as stream:
            checksum = hashlib.sha256()
            for block in iter(lambda: stream.read(1024 * 1024), b""):
                checksum.update(block)
        metadata.update(executable=str(executable), executable_sha256=checksum.hexdigest())
        observer_allowed = os.sched_getaffinity(0) - {args.cpu}
        if not observer_allowed:
            raise RuntimeError("The observer needs a CPU other than the measured game CPU")
        os.sched_setaffinity(0, observer_allowed)
        ticks_per_second = os.sysconf("SC_CLK_TCK")
        metadata.update(clock_ticks_per_second=ticks_per_second,
                        observer_affinity=sorted(os.sched_getaffinity(0)))
        previous_ticks, identity = process_ticks(args.pid)
        begin = previous_time = time.monotonic()
        deadline = begin + args.seconds
        next_deadline = begin + 1
        values = []
        with (output / "cpu.csv").open("w", newline="") as stream:
            writer = csv.writer(stream)
            writer.writerow(("elapsed_s", "interval_s", "cpu_seconds", "cpu_percent",
                             "reported_cpu_khz"))
            while previous_time < deadline:
                time.sleep(max(0.0, next_deadline - time.monotonic()))
                check_affinity(args.pid, args.cpu)
                ticks, current_identity = process_ticks(args.pid)
                now = time.monotonic()
                if current_identity != identity:
                    raise RuntimeError("The measured process identity changed")
                wall = now - previous_time
                cpu_seconds = (ticks - previous_ticks) / ticks_per_second
                percent = cpu_seconds / wall * 100
                values.append((cpu_seconds, wall, percent))
                frequency = cpu_information(args.cpu)["cpufreq/scaling_cur_freq"]
                writer.writerow((now - begin, wall, cpu_seconds, percent, frequency))
                stream.flush()
                previous_ticks, previous_time = ticks, now
                next_deadline = min(
                    begin + int(time.monotonic() - begin) + 1, deadline)
        metadata.update(
            status="complete", seconds=sum(row[1] for row in values),
            cpu_seconds=sum(row[0] for row in values),
            cpu_percent=100 * sum(row[0] for row in values) / sum(row[1] for row in values),
            median_cpu_percent=statistics.median(row[2] for row in values),
            peak_cpu_percent=max(row[2] for row in values),
            cpu_after=cpu_information(args.cpu))
    except BaseException as error:
        metadata.update(status="failed", error=str(error))
        raise
    finally:
        metadata_path.write_text(json.dumps(metadata, indent=2) + "\n")
    print(json.dumps(metadata, indent=2))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--pid", type=int, required=True)
    parser.add_argument("--cpu", type=int, required=True,
                        help="Native Linux CPU ID verified to correspond to the intended LPE core")
    parser.add_argument("--scene", choices=("credits", "endless"), required=True)
    parser.add_argument("--seconds", type=int, default=120)
    parser.add_argument("--output", type=Path, required=True, help="New measurement directory")
    args = parser.parse_args()
    try:
        sample(args)
    except (OSError, ValueError, RuntimeError) as error:
        parser.exit(1, f"measure-linux-process: {error}\n")


if __name__ == "__main__":
    main()
