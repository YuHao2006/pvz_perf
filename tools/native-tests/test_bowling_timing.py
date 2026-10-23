"""Execute production UpdateBowling with minimal collaborators and real time counters."""
from pathlib import Path
import os
import re
import subprocess
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[2]


def function(source, signature):
    start = source.index(signature)
    opening = source.index("{", start)
    depth = 1
    for at in range(opening + 1, len(source)):
        depth += (source[at] == "{") - (source[at] == "}")
        if not depth:
            return source[start:at + 1]
    raise ValueError("Unclosed production function")


def ground_values():
    source = (ROOT / "assets/definitions/reanim/units/Wallnut.dsl").read_text()
    track = function(source, "Track {")
    if 'source-name: "_ground";' not in track:
        raise ValueError("Production bowling ground track moved")
    # All three bowling seeds use Wallnut; active ground frames are 43..55.
    values = [float(value) for value in re.findall(r"\bx:\s*([-\d.]+)", track)]
    if len(values) != 13:
        raise ValueError("Production bowling ground frame count changed")
    return values


class BowlingTimingTests(unittest.TestCase):
    @unittest.skipUnless(os.environ.get("PVZ_TEST_CXX"), "Set PVZ_TEST_CXX to a C++20 compiler")
    def test_actual_bowling_equal_elapsed_time(self):
        source = (ROOT / "pvzPerf/Lawn/Plant.cpp").read_text(encoding="utf-8")
        body = function(source, "void Plant::UpdateBowling()")
        harness = (ROOT / "Tests/native/PlantBowlingTests.cpp").read_text()
        harness = harness.replace("BOWLING_GROUND_VALUES",
            ",".join(f"{value:.9f}f" for value in ground_values()))
        compiler = os.environ["PVZ_TEST_CXX"]
        with tempfile.TemporaryDirectory(prefix="pvz-bowling-timing-") as temporary:
            directory = Path(temporary)
            (directory / "PlantBowlingBody.inc").write_text(body, encoding="utf-8")
            probe = directory / "probe.cpp"
            probe.write_text(harness, encoding="utf-8")
            executable = directory / ("probe.exe" if os.name == "nt" else "probe")
            include = ROOT / "pvzPerf/SexyAppFramework"
            if Path(compiler).name.lower() == "cl.exe":
                args = [compiler, "/nologo", "/EHsc", "/std:c++20", str(probe),
                    f"/I{include}", f"/Fo{directory / 'probe.obj'}", f"/Fe{executable}"]
            else:
                args = [compiler, "-std=c++20", str(probe), f"-I{include}", "-o", str(executable)]
            compiled = subprocess.run(args, capture_output=True, text=True,
                errors="replace", timeout=60, cwd=directory)
            self.assertEqual(compiled.returncode, 0, compiled.stdout + compiled.stderr)
            run = subprocess.run([executable], capture_output=True, text=True, timeout=30)
            self.assertEqual(run.returncode, 0, run.stdout + run.stderr)
            print(run.stdout.strip())


if __name__ == "__main__":
    unittest.main()
