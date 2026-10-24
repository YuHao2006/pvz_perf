"""Particle C++ storage agrees with an independent interpretation of the wire."""
from pathlib import Path
from fractions import Fraction
from types import SimpleNamespace
import os
import json
import re
import struct
import sys
import unittest
import zipfile
import zlib

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "tools"))
import resource_build_config
import static_particle_codegen as static

# Declaration-order loader defaults, including the intentionally empty path track.
DEFAULT_VALUES = (
    0, 0, 0, -1, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0)
RENDER_INDICES = (17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 29, 30, 28, 27)
CURVE_NAMES = ("Constant", "Linear", "EaseIn", "EaseOut", "EaseInOut",
               "EaseInOutWeak", "FastInOut", "FastInOutWeak", "Constant",
               "Bounce", "BounceFastMiddle", "BounceSlowMiddle", "SinWave", "EaseSinWave")


def reference(data):
    """Read independently of the production parser and generator implementation."""
    offset = 20

    def take(fmt):
        nonlocal offset
        values = struct.unpack_from(fmt, data, offset)
        offset += struct.calcsize(fmt)
        return values

    _, slots, _, count, body_size = take("<5I")
    body_end = offset + body_size

    def track():
        nodes = [take("<3f2I") for _ in range(take("<I")[0])]
        return [(*Fraction(node[0]).limit_denominator(100000).as_integer_ratio(),
                 node[1], node[2], *node[3:]) for node in nodes]

    emitters = []
    for _ in range(count):
        header = take("<2I3iI")
        tracks = [track() for _ in range(22)]
        fields = []
        for _ in range(2):
            fields.append([(take("<I")[0], track(), track())
                           for _ in range(take("<I")[0])])
        tracks += [track() for _ in range(16)]
        tracks = [nodes if nodes or not default else [(0, 1, default, default, 0, 1)]
                  for nodes, default in zip(tracks, DEFAULT_VALUES)]
        mask = sum(1 << bit for bit, index in enumerate(RENDER_INDICES)
                   if tracks[index] and tracks[index][0][4] not in (0, 8))
        emitters.append(dict(header=header, tracks=tracks, fields=fields, mask=mask))
    assert offset == body_end
    assert take("<2I") == (0x33544449, count)
    targets = take("<" + "I" * count)
    assert take("<2I") == (0x35544449, count)
    names = take("<" + "I" * count)
    return emitters, targets, names, slots


def fixture(curve=8, distribution=13, source_float=False):
    # Two emitters have the same name; first authored occurrence must win.
    emitters = []
    for _ in range(2):
        body = struct.pack("<2I3iI", 0, 0, 1, 0, 0, 0)
        for index in range(22):
            nodes = [(0.0, 0.125, 0.25, curve, distribution)] if index == 17 else []
            body += struct.pack("<I", len(nodes))
            body += b"".join(struct.pack("<2i2f2I", 1, 3, .000123456789, 13.3072289, *node[3:])
                             if source_float else struct.pack("<3f2I", *node) for node in nodes)
        # Particle field X is authored; its empty Y track must stay empty.
        body += struct.pack("<II", 1, 3)
        body += (struct.pack("<I2i2f2I", 1, 0, 1, 2, 3, 4, 6) if source_float else
                 struct.pack("<I3f2I", 1, 0.0, 2.0, 3.0, 4, 6))
        body += struct.pack("<2I", 0, 0)
        body += struct.pack("<16I", *([0] * 16))
        emitters.append(body)
    body = b"".join(emitters)
    behavior = struct.pack("<5I", 0x46524449 if source_float else 0x36524449,
                           0, static._registry()[1], 2, len(body)) + body
    behavior += struct.pack("<4I", 0x33544449, 2, 1, 0xFFFFFFFF)
    behavior += struct.pack("<4I", 0x35544449, 2, 1, 1)
    payload = struct.pack("<2I", 0x36564150, len(behavior)) + behavior
    payload += struct.pack("<4I", 1, 0, 0, 0)
    return struct.pack("<3I", 0xDEADFEDC, len(payload), zlib.crc32(payload)) + payload


class StaticParticleTests(unittest.TestCase):
    def test_float_source_record_keeps_exact_thirds_and_unquantized_bounds(self):
        path = "compiled/particles/test.compiled"
        data = fixture(source_float=True)
        parsed = static._parse(path, data, *static._registry())
        node = parsed["emitters"][0]["tracks"]["SystemRed"][0]
        expected = struct.unpack("<2i2f2I", struct.pack("<2i2f2I", 1, 3, .000123456789, 13.3072289, 8, 13))
        self.assertEqual(node, expected)
        output = static.generate(SimpleNamespace(
            definition_orders={"particle": [("PARTICLE_TEST", "Test")]}), {path: data})
        self.assertIn("double{1} / 3, 0.00012345679f, 13.307229f, 8, 13",
                      output["files"]["ParticleData00.cpp"].decode())

    def test_defaults_alias_mask_lookup_and_static_addresses(self):
        path = "compiled/particles/test.compiled"
        data = fixture()
        parsed = static._parse(path, data, *static._registry())
        first = parsed["emitters"][0]
        self.assertEqual(first["mask"], 0)  # Slot eight aliases the constant function.
        self.assertEqual(first["tracks"]["SpawnMinActive"], [(0, 1, -1, -1, 0, 1)])
        self.assertEqual(first["tracks"]["ParticleStretch"], [(0, 1, 1, 1, 0, 1)])
        self.assertEqual(first["tracks"]["EmitterPath"], [])
        self.assertEqual(first["fields"], [[(3, [(0, 1, 2, 3, 4, 6)], [])], []])
        self.assertEqual(parsed["lookup"][1], 0)
        self.assertEqual(parsed["lookup"][0], -1)
        self.assertEqual([e["duration"] for e in parsed["emitters"]], [1, -1])
        active = static._parse(path, fixture(curve=1), *static._registry())
        self.assertEqual(active["emitters"][0]["mask"], 1)
        output = static.generate(SimpleNamespace(
            definition_orders={"particle": [("PARTICLE_TEST", "Test")]}), {path: data})
        self.assertEqual(set(output["files"]),
                         {f"ParticleData{i:02d}.cpp" for i in range(8)})
        text = b"\n".join(output["files"].values()).decode()
        self.assertIn("double{0} / 1, 0.125f, 0.25f, 8, 13", text)
        self.assertIn("constinit TodEmitterDefinition Particle0Emitters[2]", text)
        self.assertIn("constinit Sexy::GpuTexture* Particle0Textures[1]", text)
        self.assertNotRegex(text, r"\b(?:new|memcpy|TodCurveResolveEval|FloatTrackSetDefault)\b")
        self.assertIn("nullptr, Particle0Emitters, 2,", output["initializers"][0])

    def test_bad_wire_and_missing_roots_fail_offline(self):
        path = "compiled/particles/test.compiled"
        for data in (fixture()[:-1], fixture(curve=14), fixture(distribution=14)):
            with self.subTest(size=len(data)), self.assertRaises(ValueError):
                static._parse(path, data, *static._registry())
        order = SimpleNamespace(definition_orders={"particle": [("PARTICLE_TEST", "Test")]})
        with self.assertRaisesRegex(ValueError, "Missing static particle"):
            static.generate(order, {})
        with self.assertRaises(ValueError):
            static.generate(SimpleNamespace(definition_orders={}), {})

    def test_reference_or_synthetic_arrays_defaults_and_masks(self):
        reference_package = os.environ.get("PVZ_DEFINITION_REFERENCE")
        if reference_package:
            config = resource_build_config.load(ROOT / "assets/definitions/ResourceBuild.pvzbuild")
            with zipfile.ZipFile(reference_package) as archive:
                records = {name: archive.read(name) for name in archive.namelist()
                           if name.startswith("compiled/particles/") and name.endswith(".compiled")}
            self.assertEqual(len(config.definition_orders["particle"]), 106)
        else:
            # Runtime packages intentionally contain no definition records. Keep the
            # independent wire/default/curve test available without an old package.
            config = SimpleNamespace(definition_orders={"particle": [("PARTICLE_TEST", "Test")]})
            records = {"compiled/particles/test.compiled": fixture(curve=1)}
        expected_nodes, counts = [], dict(emitters=0, fields=0, rectangles=0, variants=0)
        for _, name in config.definition_orders["particle"]:
            path = f"compiled/particles/{name.casefold()}.compiled"
            emitters, targets, names, slots = reference(records[path])
            parsed = static._parse(path, records[path], *static._registry())
            self.assertEqual(parsed["atlas"]["slot_count"], slots)
            for index, (actual, expected) in enumerate(zip(parsed["emitters"], emitters)):
                self.assertEqual(list(actual["tracks"].values()), expected["tracks"])
                self.assertEqual(actual["fields"], expected["fields"])
                self.assertEqual((actual["offset"], actual["frames"], actual["image_frames"],
                                  actual["animated"], actual["flags"], actual["type"]),
                                 expected["header"])
                self.assertEqual(actual["mask"], expected["mask"])
                self.assertEqual(actual["name"], names[index])
                self.assertEqual(actual["duration"], -1 if targets[index] == 0xFFFFFFFF
                                 else targets[index])
                self.assertEqual(parsed["lookup"][names[index]], names.index(names[index]))
                expected_nodes.extend(node for track in expected["tracks"] for node in track)
                expected_nodes.extend(node for row in expected["fields"]
                                      for _, x, y in row for nodes in (x, y) for node in nodes)
                counts["fields"] += sum(map(len, expected["fields"]))
            counts["emitters"] += len(emitters)
            counts["variants"] += parsed["atlas"]["variant_count"]
            counts["rectangles"] += sum(map(len, parsed["atlas"]["variant_rectangles"]))
        output = static.generate(config, records)
        self.assertEqual(len(output["initializers"]), len(config.definition_orders["particle"]))
        for key, count in counts.items():
            self.assertEqual(output["summary"][key], count)
        self.assertEqual(output["summary"]["nodes"], len(expected_nodes))
        # Fractions remain exact source expressions, evaluated by the C++ compiler.
        pattern = r"\{double\{(-?\d+)\} / (-?\d+), ([-+.\deE]+)f, ([-+.\deE]+)f, (\d+), (\d+)\}"
        actual_nodes = []
        for source in output["files"].values():
            for match in re.finditer(pattern, source.decode()):
                actual_nodes.append(tuple(float(v) if i in (2, 3) else int(v)
                                          for i, v in enumerate(match.groups())))
        expected_nodes = [tuple(node)
                          for node in expected_nodes]
        self.assertCountEqual(actual_nodes, expected_nodes)
        text = b"\n".join(output["files"].values()).decode()
        for type_, name, count, body in re.findall(
                r"constinit (.*?) (\w+)\[(\d+)\] = \{\n(.*?)\n\};", text, re.S):
            self.assertEqual(len(body.splitlines()), int(count), name)
            self.assertIn(f"extern {type_} {name}[{count}];", output["declarations"])
        self.assertEqual(output, static.generate(config, records))

    def test_published_production_node_counts_match_generated_storage(self):
        package = Path(os.environ.get(
            "PVZ_RESOURCE_PACKAGE", ROOT / "out/x64-win32-vulkan/cache/resources/main.pak64"))
        if not package.with_name("manifest.json").exists():
            self.skipTest("Production resource manifest is unavailable")
        report = json.loads(package.with_name("manifest.json").read_text(encoding="utf-8"))
        self.assertEqual(report["format"], "pvz-resource-build-static-v1")
        summary = report["static_definitions"]["particle"]
        self.assertEqual(summary["definitions"], 106)
        generated = ROOT / "pvzPerf/Sexy.TodLib/generated/definitions"
        paths = sorted(generated.glob("ParticleData*.cpp"))
        self.assertEqual(len(paths), 8)
        source = "\n".join(path.read_text(encoding="utf-8") for path in paths)
        for type_, label, summary_key in (
                ("FloatParameterTrackNode", r"Particle\d+Nodes\d+", "nodes"),
                ("ParticleField", r"Particle\d+Emitter\d+Fields\d+", "fields"),
                ("TodEmitterDefinition", r"Particle\d+Emitters", "emitters"),
                ("const Sexy::TextureRegion", r"Particle\d+Rects", "rectangles"),
                (r"Sexy::GpuTexture\*", r"Particle\d+Textures", "variants")):
            sizes = re.findall(r"constinit " + type_ + " " + label + r"\[(\d+)\]", source)
            self.assertEqual(sum(map(int, sizes)), summary[summary_key], summary_key)
        self.assertEqual(len(re.findall(r"constinit TodEmitterDefinition Particle\d+Emitters\[",
                                       source)), 106)
        with zipfile.ZipFile(package) as archive:
            self.assertFalse(any(name.startswith("compiled/particles/") and name.endswith(".compiled")
                                 for name in archive.namelist()))


if __name__ == "__main__":
    unittest.main()
