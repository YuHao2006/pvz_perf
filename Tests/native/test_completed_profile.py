"""Check completed-profile flags independently of DAT format roundtrip checks."""

from pathlib import Path
import runpy
import struct
import unittest


ROOT = Path(__file__).resolve().parents[2]


class CompletedProfileTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        namespace = runpy.run_path(str(ROOT / "tools/package-test-saves.py"))
        cls.profile = namespace["completed_profile"]()
        cls.records = struct.unpack_from("<100i", cls.profile, 24)

    def test_wire_version(self):
        self.assertEqual(self.profile[:8], b"PVZUSR64")
        self.assertEqual(struct.unpack_from("<i", self.profile, 8)[0], 13)

    def test_all_ten_survival_trophies(self):
        # LawnApp::HasBeatenChallenge compares completed flags, not a boolean.
        normal = self.records[66:71]
        hard = self.records[61:66]
        self.assertEqual(sum(record >= 5 for record in normal), 5)
        self.assertEqual(sum(record >= 10 for record in hard), 5)

    def test_other_finite_challenges(self):
        for mode in (*range(1, 21), *range(36, 45), *range(46, 55)):
            with self.subTest(mode=mode):
                self.assertGreater(self.records[mode], 0)

    def test_all_achievements_and_minigames(self):
        self.assertEqual(self.profile[828:868], b"\1\1" * 20)
        self.assertEqual(self.profile[873:893], b"\1" * 20)


if __name__ == "__main__":
    unittest.main()
