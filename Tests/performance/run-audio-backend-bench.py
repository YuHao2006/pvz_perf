"""Serial audio comparison. Never changes the game, system gain, or CPU multiplier."""
import argparse
import ctypes as c
from ctypes import wintypes as w
import csv
import hashlib
import json
import os
from pathlib import Path
import statistics
import subprocess
import time

kernel = c.WinDLL("kernel32", use_last_error=True)
kernel.GetCurrentProcess.restype = w.HANDLE
kernel.SetProcessAffinityMask.argtypes = (w.HANDLE, c.c_size_t)
kernel.QueryPerformanceCounter.argtypes = (c.POINTER(c.c_longlong),)


class Power(c.Structure):
    _fields_ = [("ac", c.c_ubyte), ("flags", c.c_ubyte), ("percent", c.c_ubyte),
                ("status", c.c_ubyte), ("remaining", w.DWORD), ("full", w.DWORD)]


kernel.GetSystemPowerStatus.argtypes = (c.POINTER(Power),)


def ac_state():
    power = Power()
    if not kernel.GetSystemPowerStatus(c.byref(power)):
        raise c.WinError(c.get_last_error())
    return power.ac


def qpc():
    value = c.c_longlong()
    kernel.QueryPerformanceCounter(c.byref(value))
    return value.value


class CounterValue(c.Structure):
    _fields_ = [("status", w.DWORD), ("value", c.c_double)]


class CounterItem(c.Structure):
    _fields_ = [("name", w.LPWSTR), ("value", CounterValue)]


class AudioEngineCPU:
    def __init__(self):
        self.pdh = c.WinDLL("pdh")
        self.query, self.counter = w.HANDLE(), w.HANDLE()
        self.pdh.PdhOpenQueryW.argtypes = (w.LPCWSTR, c.c_size_t, c.POINTER(w.HANDLE))
        self.pdh.PdhAddEnglishCounterW.argtypes = (
            w.HANDLE, w.LPCWSTR, c.c_size_t, c.POINTER(w.HANDLE))
        self.pdh.PdhCollectQueryData.argtypes = (w.HANDLE,)
        self.pdh.PdhGetFormattedCounterArrayW.argtypes = (
            w.HANDLE, w.DWORD, c.POINTER(w.DWORD), c.POINTER(w.DWORD), c.c_void_p)
        self.pdh.PdhCloseQuery.argtypes = (w.HANDLE,)
        for name in ("PdhOpenQueryW", "PdhAddEnglishCounterW", "PdhCollectQueryData",
                     "PdhGetFormattedCounterArrayW", "PdhCloseQuery"):
            getattr(self.pdh, name).restype = w.DWORD
        result = self.pdh.PdhOpenQueryW(None, 0, c.byref(self.query))
        if result:
            raise RuntimeError(f"PDH open failed: {result:#x}")
        result = self.pdh.PdhAddEnglishCounterW(
            self.query, r"\Process(audiodg*)\% Processor Time", 0, c.byref(self.counter))
        if result:
            raise RuntimeError(f"Audio engine PDH counter unavailable: {result:#x}")
        self.previous_qpc = None

    def sample(self):
        status = self.pdh.PdhCollectQueryData(self.query)
        now = qpc()
        before, self.previous_qpc = self.previous_qpc, now
        size, count = w.DWORD(), w.DWORD()
        if status:
            return {"qpc": now, "previous_qpc": before, "status": status, "instances": []}
        status = self.pdh.PdhGetFormattedCounterArrayW(
            self.counter, 0x200 | 0x8000, c.byref(size), c.byref(count), None)
        instances = []
        if status == 0x800007D2:
            buffer = c.create_string_buffer(size.value)
            status = self.pdh.PdhGetFormattedCounterArrayW(
                self.counter, 0x200 | 0x8000, c.byref(size), c.byref(count), buffer)
            if status == 0:
                array = c.cast(buffer, c.POINTER(CounterItem))
                instances = [{"name": array[i].name, "status": array[i].value.status,
                              "cpu_percent": array[i].value.value}
                             for i in range(count.value)]
        return {"qpc": now, "previous_qpc": before, "status": status, "instances": instances}

    def close(self):
        self.pdh.PdhCloseQuery(self.query)


def sha256(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def summarize(directory):
    results = [json.loads(path.read_text()) for path in sorted(directory.glob("run-*/result.json"))]
    groups = {}
    for item in results:
        groups.setdefault((item["workload"], item["backend"]), []).append(item)
    rows = []
    fields = ("cpu_percent_one_core", "cpu_ms_per_tick", "cycles_per_tick", "api_us_mean",
              "api_us_p90", "trigger_us_mean", "trigger_us_p90", "private_bytes",
              "engine_cpu_percent", "combined_cpu_percent")
    for (workload, backend), items in groups.items():
        row = {"workload": workload, "backend": backend, "runs": len(items)}
        for field in fields:
            values = [item[field] for item in items if item.get(field) is not None]
            row[field] = statistics.mean(values) if values else None
            row[field + "_min"] = min(values) if values else None
            row[field + "_max"] = max(values) if values else None
        row["late_us_p99_max"] = max(item["late_us_p99"] for item in items)
        rows.append(row)
    (directory / "summary.json").write_text(json.dumps(rows, indent=2) + "\n")
    if rows:
        with (directory / "summary.csv").open("w", newline="") as stream:
            writer = csv.DictWriter(stream, fieldnames=list(rows[0]))
            writer.writeheader()
            writer.writerows(rows)
    return rows


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--exe", type=Path, required=True)
    parser.add_argument("--pak", type=Path, required=True)
    parser.add_argument("--bass", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--seconds", type=int, default=6)
    parser.add_argument("--warmup", type=int, default=2)
    parser.add_argument("--blocks", type=int, choices=(1, 2, 4), default=4)
    parser.add_argument("--verify", action="store_true")
    parser.add_argument("--sample-src", type=int, choices=range(5), default=0)
    parser.add_argument("--workload", action="append",
                        choices=("music", "loop8", "loop32", "churn100"))
    args = parser.parse_args()
    for name in ("exe", "pak", "bass", "output"):
        setattr(args, name, getattr(args, name).resolve())
    if not kernel.SetProcessAffinityMask(kernel.GetCurrentProcess(), 0x8000):
        raise c.WinError(c.get_last_error())
    equality = subprocess.run([
        str(args.exe), "--pak", str(args.pak), "--bass", str(args.bass),
        "--sample-src", str(args.sample_src), "--output-check", "yes"],
        capture_output=True, text=True, timeout=60,
        creationflags=subprocess.CREATE_NO_WINDOW)
    if equality.returncode:
        status = equality.stderr.strip()
        if equality.stdout.strip():
            check = json.loads(equality.stdout.splitlines()[-1])
            status = ", ".join(case["status"] for case in check["tests"])
        raise RuntimeError(f"Output equivalence gate did not pass ({status}); "
                           "performance comparison refused")
    check = json.loads(equality.stdout.splitlines()[-1])
    if not check["equivalent"]:
        raise RuntimeError("Actual output is not equivalent; performance comparison refused")
    args.output.mkdir(parents=True, exist_ok=False)
    initial_ac = ac_state()
    metadata = {
        "executable": str(args.exe), "executable_sha256": sha256(args.exe),
        "pak": str(args.pak), "pak_sha256": sha256(args.pak),
        "bass": str(args.bass), "bass_sha256": sha256(args.bass),
        "affinity": "LP14 / 0x4000", "observer": "LP15 / 0x8000",
        "multiplier": "unverified; not changed", "initial_ac": initial_ac,
        "seconds": args.seconds, "warmup": args.warmup, "blocks": args.blocks,
        "sample_src": args.sample_src,
        "music": "mainmusic.mo3; BASS/DirectSound output in every arm",
        "pcm": "Production BASS float decode; source PCM divided by 8 in every arm; BASS readback exact",
        "scope": "Standalone real-playback audio workload; not game FPS",
    }
    (args.output / "conditions.json").write_text(json.dumps(metadata, indent=2) + "\n")
    backends = ("dsound", "bass", "dsound-pool", "bass-pool")
    orders = ((0, 1, 2, 3), (1, 0, 3, 2), (3, 2, 1, 0), (2, 3, 0, 1))
    workloads = [("music", 0, 0), ("loop8", 8, 0), ("loop32", 32, 0),
                 ("churn100", 32, 100)]
    if args.workload:
        workloads = [item for item in workloads if item[0] in args.workload]
    if args.verify:
        workloads = [("verify", 32, 100)]
    engine = AudioEngineCPU()
    counter = 0
    try:
        for workload, voices, starts in workloads:
            for block, order in enumerate(orders[:args.blocks]):
                for backend_id in order:
                    if ac_state() != initial_ac:
                        raise RuntimeError("AC/battery state changed; comparison stopped")
                    backend = backends[backend_id]
                    counter += 1
                    folder = args.output / f"run-{counter:03d}-{workload}-{backend}"
                    folder.mkdir()
                    command = [
                        str(args.exe), "--backend", backend, "--pak", str(args.pak),
                        "--bass", str(args.bass), "--trace", str(folder / "ticks.csv"),
                        "--voices", str(voices), "--starts", str(starts),
                        "--seconds", str(args.seconds), "--warmup", str(args.warmup),
                        "--sample-src", str(args.sample_src),
                    ]
                    engine.sample()
                    with (folder / "stdout.jsonl").open("w") as stdout, (
                            folder / "stderr.txt").open("w") as stderr:
                        process = subprocess.Popen(command, stdout=stdout, stderr=stderr,
                                                   creationflags=subprocess.CREATE_NO_WINDOW)
                        samples = []
                        deadline = time.monotonic() + args.seconds + args.warmup + 60
                        while process.poll() is None:
                            if time.monotonic() > deadline:
                                process.kill()
                                process.wait()
                                raise RuntimeError(f"Audio workload timed out: {folder}")
                            samples.append(engine.sample())
                            if ac_state() != initial_ac:
                                process.kill()
                                process.wait()
                                raise RuntimeError("AC/battery state changed during measurement")
                            time.sleep(0.5)
                    (folder / "audio-engine.json").write_text(json.dumps(samples, indent=2) + "\n")
                    if process.returncode:
                        raise RuntimeError(f"Audio workload failed: {folder}\n"
                                           + (folder / "stderr.txt").read_text())
                    messages = [json.loads(line) for line in
                                (folder / "stdout.jsonl").read_text().splitlines()]
                    result = next(item for item in messages if item["phase"] == "result")
                    begin, end = result["measure_begin_qpc"], result["measure_end_qpc"]
                    weighted = total = 0.0
                    for item in samples:
                        before = item["previous_qpc"]
                        if before is None or item["status"] or not item["instances"]:
                            continue
                        if any(i["status"] not in (0, 1) for i in item["instances"]):
                            continue
                        overlap = max(0, min(end, item["qpc"]) - max(begin, before))
                        weighted += overlap * sum(i["cpu_percent"] for i in item["instances"])
                        total += overlap
                    result.update(workload=workload, block=block, engine_coverage=total / (end - begin),
                                  engine_cpu_percent=weighted / total if total else None)
                    result["combined_cpu_percent"] = (
                        result["cpu_percent_one_core"] + result["engine_cpu_percent"]
                        if result["engine_cpu_percent"] is not None else None)
                    (folder / "result.json").write_text(json.dumps(result, indent=2) + "\n")
                    summarize(args.output)
                    print(f"{counter:02d} {workload:8s} {backend:12s} "
                          f"CPU={result['cpu_percent_one_core']:.3f}% "
                          f"API={result['api_us_mean']:.2f}us "
                          f"trigger90={result['trigger_us_p90']:.2f}us "
                          f"engine={result['engine_cpu_percent']} "
                          f"private={result['private_bytes']/1048576:.2f}MiB", flush=True)
    finally:
        engine.close()
        summarize(args.output)
    print(f"Evidence: {args.output}", flush=True)


if __name__ == "__main__":
    main()
