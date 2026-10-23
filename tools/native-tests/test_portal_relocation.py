"""Compile the actual candidate loop against the 1073 portal row rules."""
from pathlib import Path
import os
import subprocess
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[2]


class PortalRelocationTests(unittest.TestCase):
    @unittest.skipUnless(os.environ.get("PVZ_TEST_CXX"), "Set PVZ_TEST_CXX to a C++ compiler")
    def test_all_candidate_cells_follow_original_row_constraints(self):
        source = (ROOT / "pvzPerf/Lawn/Challenge.cpp").read_text(encoding="utf-8")
        body = source.split("void Challenge::MoveAPortal()", 1)[1]
        loop = body[body.index("\tfor (int aGridX"):body.index("\n\tTodWeightedGridArray* aGrid")]
        probe = r"""
#include <cassert>
#define TOD_ASSERT assert
constexpr int MAX_PICK_GRID_SIZE = 50;
struct GridItem { int mGridX; int mGridY; };
struct TodWeightedGridArray { int mX; int mY; float mWeight; };
int main() {
    // Test every old/partner row and column, with a third occupied portal cell.
    for (int oldX = 0; oldX < 10; ++oldX)
    for (int oldY = 0; oldY < 5; ++oldY)
    for (int otherX = 0; otherX < 10; ++otherX)
    for (int otherY = 0; otherY < 5; ++otherY) {
        GridItem old{oldX, oldY}, partner{otherX, otherY}, occupied{4, 2};
        GridItem* aPortal = &old;
        GridItem* aOtherPortal = &partner;
        auto GetPortalAt = [&](int x, int y) -> GridItem* {
            for (GridItem* item : {&old, &partner, &occupied})
                if (item->mGridX == x && item->mGridY == y) return item;
            return nullptr;
        };
        TodWeightedGridArray aGridArray[MAX_PICK_GRID_SIZE]{};
        int aGridArrayCount = 0;
""" + loop + r"""
        bool actual[10][5]{};
        for (int i = 0; i < aGridArrayCount; ++i) {
            const auto& cell = aGridArray[i];
            assert(cell.mWeight == 1);
            assert(!actual[cell.mX][cell.mY]);
            actual[cell.mX][cell.mY] = true;
        }
        for (int x = 0; x < 10; ++x)
        for (int y = 0; y < 5; ++y)
            assert(actual[x][y] == (y != oldY && y != otherY && !(x == 4 && y == 2)));
    }
}
"""
        probe = "#include <initializer_list>\n" + probe
        with tempfile.TemporaryDirectory(prefix="pvz-portal-rules-") as directory:
            directory = Path(directory)
            cpp = directory / "probe.cpp"
            cpp.write_text(probe, encoding="utf-8")
            exe = directory / "probe.exe"
            compiler = os.environ["PVZ_TEST_CXX"]
            if Path(compiler).name.lower() == "cl.exe":
                args = [compiler, "/nologo", "/EHsc", str(cpp), f"/Fe{exe}",
                        f"/Fo{directory / 'probe.obj'}"]
            else:
                args = [compiler, "-std=c++17", str(cpp), "-o", str(exe)]
            result = subprocess.run(args, cwd=directory, capture_output=True, text=True, timeout=60)
            self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
            result = subprocess.run([str(exe)], capture_output=True, text=True, timeout=30)
            self.assertEqual(result.returncode, 0, result.stdout + result.stderr)


if __name__ == "__main__":
    unittest.main()
