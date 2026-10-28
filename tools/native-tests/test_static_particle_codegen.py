"""Compiled particles preserve authored behavior without generated C++ arrays."""
from pathlib import Path
from types import SimpleNamespace
import struct
import sys
import unittest
import zlib

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "tools"))
import static_particle_codegen as compiler


def fixture(curve=8, distribution=13):
    emitters = []
    for _ in range(2):
        body = struct.pack("<2I3iI", 0, 0, 1, 0, 0, 0)
        for index in range(22):
            body += struct.pack("<I", int(index == 17))
            if index == 17:
                body += struct.pack("<2i2f2I", 1, 3, .000123456789, 13.3072289,
                                    curve, distribution)
        body += struct.pack("<II", 1, 3)
        body += struct.pack("<I2i2f2I", 1, 0, 1, 2, 3, 4, 6)
        body += struct.pack("<2I", 0, 0)
        body += struct.pack("<16I", *([0] * 16))
        emitters.append(body)
    body = b"".join(emitters)
    behavior = struct.pack("<5I", 0x46524449, 0, compiler._registry()[1], 2, len(body)) + body
    behavior += struct.pack("<4I", 0x33544449, 2, 1, 0xFFFFFFFF)
    behavior += struct.pack("<4I", 0x35544449, 2, 1, 1)
    payload = struct.pack("<2I", 0x36564150, len(behavior)) + behavior
    payload += struct.pack("<4I", 1, 0, 0, 0)
    return struct.pack("<3I", 0xDEADFEDC, len(payload), zlib.crc32(payload)) + payload


class CompiledParticleTests(unittest.TestCase):
    path = "compiled/particles/test.compiled"
    config = SimpleNamespace(definition_orders={"particle": [("PARTICLE_TEST", "Test")]})

    def test_binary_round_trip_behavior_defaults_fields_duration_and_lookup(self):
        data = fixture()
        definition = compiler._parse(self.path, data, *compiler._registry())
        output = compiler.generate(self.config, {self.path: data})
        self.assertEqual(output["files"], {})
        self.assertEqual(output["declarations"], [])
        self.assertEqual(output["initializers"], [])
        binary = output["runtime_records"]["compiled/particle-runtime/test.compiled"]
        self.assertEqual(struct.unpack_from("<6I", binary),
                         (0x31435450, *compiler._registry(), 2, 1, 0))
        offset = 24
        for expected in definition["emitters"]:
            header = struct.unpack_from("<2I3i4I", binary, offset)
            offset += 36
            self.assertEqual(header, (0, 0, 1, 0, 0, 0, 1,
                                     expected["duration"] & 0xFFFFFFFF, 0))

            def track(nodes):
                nonlocal offset
                count, = struct.unpack_from("<I", binary, offset)
                offset += 4
                self.assertEqual(count, len(nodes))
                for numerator, denominator, low, high, curve, distribution in nodes:
                    actual = struct.unpack_from("<dffII", binary, offset)
                    offset += 24
                    self.assertEqual(actual, (numerator / denominator, low, high, curve, distribution))

            for name in compiler.SYSTEM_TRACKS:
                track(expected["tracks"][name])
            for fields in expected["fields"]:
                count, = struct.unpack_from("<I", binary, offset)
                offset += 4
                self.assertEqual(count, len(fields))
                for field, x, y in fields:
                    self.assertEqual(struct.unpack_from("<I", binary, offset)[0], field)
                    offset += 4
                    track(x)
                    track(y)
            for name in compiler.PARTICLE_TRACKS:
                track(expected["tracks"][name])
        self.assertEqual(binary[offset:], bytes(12))
        self.assertEqual(definition["lookup"][1], 0)
        self.assertEqual(definition["emitters"][0]["tracks"]["ParticleDuration"],
                         [(0, 1, 100., 100., 0, 1)])
        self.assertEqual(output, compiler.generate(self.config, {self.path: data}))

    def test_corrupt_wire_and_missing_definitions_rejected_offline(self):
        for data in (fixture()[:-1], fixture(curve=14), fixture(distribution=14)):
            with self.subTest(size=len(data)), self.assertRaises(ValueError):
                compiler.generate(self.config, {self.path: data})
        with self.assertRaisesRegex(ValueError, "Missing compiled particle"):
            compiler.generate(self.config, {})

    def test_per_variant_uvs_and_atlas_metadata_are_binary(self):
        definition = dict(emitters=[], atlas=dict(
            variant_count=2, slot_count=1, variant_dimensions=[(8, 16), (16, 8)],
            variant_rectangles=[[(2, 4, 4, 8)], [(2, 4, 4, 2)]]))
        binary = compiler.compiled_record(definition, [{"atlas_path": "a.png"}, {"atlas_path": "b.png"}])
        offset = 24
        for width, height, path, expected in (
                (8, 16, b"a.png", (.25, .25, .75, .75, 4, 8)),
                (16, 8, b"b.png", (.125, .5, .375, .75, 4, 2))):
            self.assertEqual(struct.unpack_from("<3I", binary, offset), (width, height, len(path)))
            offset += 12
            self.assertEqual(binary[offset:offset + len(path)], path)
            offset += len(path)
            self.assertEqual(struct.unpack_from("<4f2i", binary, offset), expected)
            offset += 24
        self.assertEqual(offset, len(binary))

    def test_particle_runtime_does_not_emit_gpu_behavior_transport(self):
        output = compiler.generate(self.config, {self.path: fixture(curve=1)})
        self.assertEqual(set(output["runtime_records"]), {"compiled/particle-runtime/test.compiled"})


if __name__ == "__main__":
    unittest.main()
