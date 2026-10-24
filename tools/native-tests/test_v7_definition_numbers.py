"""Exact authored-number boundary and corpus compatibility checks."""
import os
from pathlib import Path
import struct
import subprocess
import sys
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "tools"))
import migrate_particle_v7 as migration
from normalize_reanim_v7 import normalize
from test_definition_compiler_sources import particle_gold

COMPILER = os.environ.get("PVZ_RESOURCE_COMPILER") or os.environ.get("PVZ_ATLAS_COMPILER")

# The new source record follows its own field order. It must not reuse the
# retired native-reference order: that made the old migration bug self-verify.
SOURCE_SYSTEM_TRACKS = (
    "SystemDuration CrossFadeDuration SpawnRate SpawnMinActive SpawnMaxActive "
    "SpawnMaxLaunched EmitterRadius EmitterOffsetX EmitterOffsetY EmitterBoxX EmitterBoxY "
    "EmitterSkewX EmitterSkewY EmitterPath ParticleDuration LaunchSpeed LaunchAngle "
    "SystemRed SystemGreen SystemBlue SystemAlpha SystemBrightness").split()


def particle_source(data):
    at = 12
    def take(fmt):
        nonlocal at
        result = struct.unpack_from(fmt, data, at)
        at += struct.calcsize(fmt)
        return result
    magic, _, _, count, size = take("<5I")
    assert magic == 0x46524449
    end = at + size
    def track():
        return [take("<2i2f2i") for _ in range(take("<I")[0])]
    emitters = []
    for _ in range(count):
        images = take("<I")[0]
        at += 4 * images
        header = take("<4i")
        tracks = {key: track() for key in SOURCE_SYSTEM_TRACKS}
        fields = []
        for _ in range(2):
            fields.append([(take("<I")[0], track(), track()) for _ in range(take("<I")[0])])
        tracks.update((key, track()) for key in migration.PARTICLE)
        emitters.append(dict(header=header, tracks=tracks, fields=fields))
    assert at == end
    return emitters


class MigrationTests(unittest.TestCase):
    def test_reanim_normalizer_preserves_strings_comments_and_float32(self):
        self.assertEqual(normalize('x: -9.80000019; scale-x: 0.791999996; '
                                   'text: "x: 1.00000012"; // y: 1.00000012\n'),
                         'x: -9.8; scale-x: 0.792; '
                         'text: "x: 1.00000012"; // y: 1.00000012\n')
        self.assertEqual(normalize("x: 0.123456;"), "x: 0.123456;")


@unittest.skipUnless(COMPILER, "Set PVZ_RESOURCE_COMPILER")
class NativeNumberTests(unittest.TestCase):
    def setUp(self):
        self.temporary = tempfile.TemporaryDirectory(prefix="v7-numbers-")
        self.addCleanup(self.temporary.cleanup)
        self.directory = Path(self.temporary.name)

    def run_compiler(self, *args, success=True):
        completed = subprocess.run([COMPILER, *map(str, args)], capture_output=True,
                                   text=True, errors="replace", timeout=60)
        self.assertEqual(completed.returncode == 0, success, completed.stdout + completed.stderr)
        return completed

    def test_particle_explicit_and_implicit_times_are_exact_rationals(self):
        source = self.directory / "fixture.dsl"
        source.write_text('export component Test { kind: particle; source-name: "test";'
                          'Emitter { name: "First"; spawnRate: nodes {'
                          '{time: 0; low: -1.23456789; high: 1.23456789; curve: Linear; distribution: Linear;}'
                          '{low: .001; high: .792; curve: EaseIn; distribution: Constant;}'
                          '{low: 1; high: 2; curve: Linear; distribution: Linear;}'
                          '{time: 1; low: 0; high: 0; curve: Linear; distribution: Linear;}'
                          '} particleScale: nodes {'
                          '{time: .123456789123; low: 13.3072289; high: .000123456789;'
                          'curve: Linear; distribution: Linear;} } } }')
        gold = self.directory / "gold"
        gold.mkdir()
        (gold / "Test.xml.compiled").write_bytes(particle_gold(["First"]))
        output = self.directory / "output"
        self.run_compiler("compile-particle-v2", "--input", source, "--output", output,
                          "--gold64", gold)
        nodes = particle_source((output / "Test.source-record").read_bytes())[0]["tracks"]["SpawnRate"]
        f32 = lambda value: struct.unpack("<f", struct.pack("<f", value))[0]
        self.assertEqual(nodes, [(0, 1, f32(-1.23456789), f32(1.23456789), 1, 1),
                                 (1, 3, f32(.001), f32(.792), 2, 0), (2, 3, 1, 2, 1, 1),
                                 (1, 1, 0, 0, 1, 1)])
        node = particle_source((output / "Test.source-record").read_bytes())[0]["tracks"]["ParticleScale"][0]
        self.assertAlmostEqual(node[0] / node[1], .123456789123, places=14)
        self.assertEqual(node[2:4], (f32(13.3072289), f32(.000123456789)))

    def test_particle_rejects_invalid_literals_even_in_discarded_legacy_tokens(self):
        for value in ("3.5e38", "-3.5e38", "1.0junk", "0x10", "NaN", "Inf"):
            for raw in (value, "track { 1 " + value + "; }",
                        "nodes { {low: " + value + "; high: 1;} }"):
                with self.subTest(raw=raw):
                    source = self.directory / "bad.dsl"
                    source.write_text('export component Bad { kind: particle; source-name: "bad";\n'
                                      'Emitter { spawnRate: ' + raw + '; } }')
                    result = self.run_compiler("compile-particle-v2", "--input", source,
                                               "--output", self.directory / "bad",
                                               "--gold64", self.directory, success=False)
                    self.assertIn("line 2", result.stderr)
                    self.assertIn("spawnRate", result.stderr)
                    self.assertIn(value, result.stderr)

    def test_particle_node_diagnostic_keeps_literal_line(self):
        source = self.directory / "bad.dsl"
        source.write_text('export component Bad { kind: particle; source-name: "bad";\n'
                          'Emitter { spawnRate: nodes {\n'
                          ' {time: 0; low: 1; high: 2;}\n'
                          ' {time: .5; low: 3.5e38; high: 2;}\n'
                          '} } }')
        result = self.run_compiler("compile-particle-v2", "--input", source,
                                   "--output", self.directory / "bad",
                                   "--gold64", self.directory, success=False)
        self.assertIn("line 4", result.stderr)
        self.assertIn("spawnRate", result.stderr)
        self.assertIn("3.5e38", result.stderr)

    def test_all_migrated_particle_nodes_recover_preserved_native_values(self):
        sources = sorted((ROOT / "assets/definitions/particles").rglob("*.particle.dsl"))
        inputs = self.directory / "inputs.txt"
        inputs.write_text("\n".join(map(str, sources)) + "\n")
        output = self.directory / "output"
        self.run_compiler("compile-particle-v2", "--input-list", inputs, "--output", output,
                          "--gold64", ROOT / "assets/definitions/particle-reference")
        records = {p.name.casefold(): p for p in output.glob("*.source-record")}
        count = 0
        def compare_nodes(expected, actual):
            nonlocal count
            self.assertEqual(len(actual), len(expected))
            for old, new in zip(expected, actual):
                num, den, low, high, curve, distribution = new
                self.assertEqual(tuple(map(migration.f32, (num / den, low, high))),
                                 tuple(map(migration.f32, old[:3])))
                self.assertEqual((migration.CURVES[curve], migration.CURVES[distribution]),
                                 (migration.CURVES[old[3]], migration.CURVES[old[4]]))
                count += 1
        for gold in (ROOT / "assets/definitions/particle-reference").glob("*.compiled"):
            record = records.get(gold.name[:-13].casefold() + ".source-record")
            if record is None:
                continue  # Historical comparison-only fixtures outside author corpus.
            expected = migration.read_gold(gold)
            actual = particle_source(record.read_bytes())
            self.assertEqual(len(actual), len(expected), gold.name)
            for old, new in zip(expected, actual):
                self.assertEqual(new["header"], old["header"], gold.name)
                for name, nodes in old["tracks"].items():
                    with self.subTest(file=gold.name, track=name):
                        compare_nodes(nodes, new["tracks"][name])
                for old_fields, new_fields in zip(old["fields"], new["fields"]):
                    self.assertEqual(len(old_fields), len(new_fields))
                    for (kind, x, y), (new_kind, new_x, new_y) in zip(old_fields, new_fields):
                        self.assertEqual(new_kind, kind)
                        compare_nodes(x, new_x)
                        compare_nodes(y, new_y)
        self.assertEqual(count, 3133)


if __name__ == "__main__":
    unittest.main()
