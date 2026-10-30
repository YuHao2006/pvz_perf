"""Deterministic binning tests; elevated smoke also verifies native ETW capture."""

import argparse
import ctypes
from pathlib import Path
import subprocess
import sys
import tempfile
import time
import unittest

from process_core_trace import ProcessCoreTrace, attribute_rows


class BinningTests(unittest.TestCase):
    def test_split_boundary_and_ignore_other_processors(self):
        rows = [{"elapsed_s": 1.0}, {"elapsed_s": 2.2}]
        attribute_rows(rows, [(14, 90, 160), (15, 150, 280), (1, 100, 320)],
                       100, 100, [14, 15])
        self.assertAlmostEqual(rows[0]["cpu_lp14_percent"], 60.0)
        self.assertAlmostEqual(rows[0]["cpu_lp15_percent"], 50.0)
        self.assertAlmostEqual(rows[1]["cpu_lp14_percent"], 0.0)
        self.assertAlmostEqual(rows[1]["cpu_lp15_percent"], 80.0 / 120 * 100)

    def test_clip_preroll_and_last_partial_interval(self):
        rows = [{"elapsed_s": 0.5}, {"elapsed_s": 1.0}]
        attribute_rows(rows, [(14, 0, 200), (15, 1000, 1100)], 100, 100, [14, 15])
        self.assertEqual([row["cpu_lp14_percent"] for row in rows], [100.0, 100.0])
        self.assertEqual([row["cpu_lp15_percent"] for row in rows], [0.0, 0.0])


def smoke(helper, output):
    child_code = r'''
import ctypes,sys,time
k=ctypes.WinDLL("kernel32",use_last_error=True)
k.GetCurrentProcess.restype=ctypes.c_void_p
k.SetProcessAffinityMask.argtypes=(ctypes.c_void_p,ctypes.c_size_t)
print("READY",flush=True)
sys.stdin.readline()
for core in (14,15):
    if not k.SetProcessAffinityMask(k.GetCurrentProcess(),1<<core): raise ctypes.WinError()
    until=time.perf_counter()+1.0
    while time.perf_counter()<until: pass
'''
    child = subprocess.Popen([sys.executable, "-c", child_code], stdin=subprocess.PIPE,
                             stdout=subprocess.PIPE, text=True)
    if child.stdout.readline().strip() != "READY":
        raise RuntimeError("Smoke workload did not start")
    trace = ProcessCoreTrace(helper, child.pid, 0xC000, output)
    stamp = ctypes.c_longlong()
    if not ctypes.windll.kernel32.QueryPerformanceCounter(ctypes.byref(stamp)):
        raise ctypes.WinError()
    child.communicate("GO\n", timeout=15)
    if child.returncode:
        raise RuntimeError("Smoke workload failed")
    rows = [{"elapsed_s": 1.0}, {"elapsed_s": 2.0}]
    trace.annotate(rows, stamp.value)
    print(rows, flush=True)
    if not (rows[0]["cpu_lp14_percent"] > 60 and rows[0]["cpu_lp15_percent"] < 15 and
            rows[1]["cpu_lp15_percent"] > 60 and rows[1]["cpu_lp14_percent"] < 15):
        raise RuntimeError("ETW core attribution does not match the known pinned workload")
    print("PASS actual ETW per-process LP14 -> LP15 attribution", flush=True)


if __name__ == "__main__":
    if "--smoke" in sys.argv:
        parser = argparse.ArgumentParser()
        parser.add_argument("--smoke", type=Path, required=True)
        parser.add_argument("--output", type=Path)
        args = parser.parse_args()
        output = args.output or Path(tempfile.mkdtemp(prefix="pvz-etw-core-smoke-"))
        output.mkdir(parents=True, exist_ok=True)
        smoke(args.smoke, output)
    else:
        unittest.main()
