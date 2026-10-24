"""Native source-handle integration without program image IDs or real assets."""
from __future__ import annotations

import os
from pathlib import Path
import struct
import subprocess
import sys
import tempfile
import unittest
import zlib

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import definition_atlas


COMPILER = os.environ.get("PVZ_RESOURCE_COMPILER") or os.environ.get("PVZ_ATLAS_COMPILER")
ALPHA = "NOT_IN_PROGRAM_IDS_A"
ZED = "NOT_IN_PROGRAM_IDS_Z"


def string(value: str) -> bytes:
    encoded = value.encode("utf-8")
    return struct.pack("<I", len(encoded)) + encoded


def particle_gold(names: list[str]) -> bytes:
    """Minimal x64 author-comparison data; contains no program image numbers."""
    payload = bytearray(struct.pack("<I", 3767703017) + bytes(16) + struct.pack("<I", 688))
    struct.pack_into("<I", payload, 12, len(names))
    for _ in names:
        dump = bytearray(688)
        struct.pack_into("<I", dump, 16, 1)  # ImageFrames, no pointer/registry.
        payload.extend(dump)
    for name in names:
        payload.extend(string("GOLD_IMAGE_IS_NOT_THE_AUTHOR_SOURCE"))
        payload.extend(string(name))
        payload.extend(struct.pack("<I", 0))  # SystemDuration track.
        payload.extend(string(""))  # OnDuration.
        payload.extend(bytes(21 * 4))  # Other system tracks.
        payload.extend(struct.pack("<2I", 40, 40))  # Two empty field arrays.
        payload.extend(bytes(16 * 4))  # Particle tracks.
    return struct.pack("<2I", 0xDEADFED5, len(payload)) + payload


def particle_source_emitters(payload: bytes):
    """Walk IDR4 without depending on the packer's layout implementation."""
    magic, registry, _, count, size = struct.unpack_from("<5I", payload)
    assert magic == 0x46524449 and registry == 0
    at = 20
    result = []
    def track():
        nonlocal at
        nodes = struct.unpack_from("<I", payload, at)[0]
        at += 4 + 24 * nodes
    for _ in range(count):
        images = struct.unpack_from("<I", payload, at)[0]
        at += 4
        offsets = list(range(at, at + images * 4, 4))
        handles = [struct.unpack_from("<I", payload, p)[0] for p in offsets]
        at += images * 4
        motion = at
        frames, animated, flags, kind = struct.unpack_from("<4I", payload, at)
        at += 16
        for _ in range(22):
            track()
        for _ in range(2):
            fields = struct.unpack_from("<I", payload, at)[0]
            at += 4
            for _ in range(fields):
                at += 4
                track()
                track()
        for _ in range(16):
            track()
        result.append(dict(offsets=offsets, handles=handles,
                           frames=frames, animated=animated, flags=flags,
                           kind=kind, motion=payload[motion:at]))
    assert at == 20 + size
    assert struct.unpack_from("<2I", payload, at) == (0x33544449, count)
    assert struct.unpack_from("<2I", payload, at + 8 + count * 4) == (0x35544449, count)
    return result


@unittest.skipUnless(COMPILER, "Set PVZ_RESOURCE_COMPILER or PVZ_ATLAS_COMPILER")
class DefinitionCompilerSourceTests(unittest.TestCase):
    def setUp(self):
        self.compiler = Path(COMPILER).resolve()
        self.assertTrue(self.compiler.is_file(), f"Missing native compiler: {self.compiler}")
        temporary = tempfile.TemporaryDirectory(prefix="compiler-sources-test-")
        self.addCleanup(temporary.cleanup)
        self.directory = Path(temporary.name)

    def run_compiler(self, *arguments):
        completed = subprocess.run([str(self.compiler), *map(str, arguments)],
                                   capture_output=True, text=True, encoding="utf-8",
                                   errors="replace", timeout=30)
        self.assertEqual(completed.returncode, 0, completed.stdout + completed.stderr)
        return completed

    def assert_independent_headers(self, directory):
        headers = [p for p in directory.iterdir() if p.suffix in (".h", ".cpp")]
        self.assertTrue(headers)
        for path in headers:
            text = path.read_text(encoding="utf-8")
            for forbidden in ("ImageSymbolId", "ProgramImageSymbols", "NumericResourceBindings",
                              "gImageSymbol", "TodDefinitionLoadImage", "image_symbol_ids"):
                self.assertNotIn(forbidden, text, f"{path.name} depends on {forbidden}")

    def read_record(self, path: Path, cookie: int, kind: str):
        data = path.read_bytes()
        actual, size, checksum = struct.unpack_from("<3I", data)
        self.assertEqual(actual, cookie)
        self.assertEqual(size, len(data) - 12)
        self.assertEqual(checksum, zlib.crc32(data[12:]))
        payload = data[12:]
        hash_offset = 8 if kind == "reanim" else 4
        self.assertEqual(struct.unpack_from("<I", payload, hash_offset)[0], 0)
        offsets = ([p for e in particle_source_emitters(payload) for p in e["offsets"]]
                   if kind == "particles" else definition_atlas.image_offsets(kind, payload))
        handles = [struct.unpack_from("<I", payload, offset)[0] for offset in offsets]
        return handles

    def test_reanimation_uses_sorted_author_source_handles_without_program_ids(self):
        source, types, fonts = (self.directory / name for name in
                                ("fixture.dsl", "types.txt", "fonts.bin"))
        source.write_text(
            'export component IndependentReanim {\n'
            ' fps: 12;\n Track {\n source-name: "layer";\n frame-count: 3;\n'
            f' frame 0 {{ cel: 0; image: "{ZED}"; }}\n'
            f' frame 1 {{ cel: 0; image: "{ALPHA}"; }}\n'
            f' frame 2 {{ cel: 0; image: "{ZED}"; }}\n'
            ' }\n}\n', encoding="utf-8")
        types.write_text("independentreanim 0\n", encoding="utf-8")
        fonts.write_bytes(struct.pack("<2I", 0x4953594D, 0))
        output = self.directory / "reanim"
        self.run_compiler("compile-v2", "--input", source, "--output", output,
                          "--type-map", types, "--font-registry", fonts)
        self.assertEqual((output / "image_sources.txt").read_text(), f"{ALPHA}\n{ZED}\n")
        records = list(output.glob("*.source-record"))
        self.assertEqual([p.name for p in records], ["IndependentReanim.source-record"])
        self.assertEqual(self.read_record(records[0], 0xDEADFED7, "reanim"), [2, 1, 2])
        self.assertFalse((output / "IndependentReanim.compiled").exists())
        self.assert_independent_headers(output)

    def test_particle_uses_dsl_image_sources_instead_of_gold_or_program_ids(self):
        source, output, gold = (self.directory / name for name in ("fixture.dsl", "particles", "gold"))
        source.write_text(
            'export component IndependentParticle {\n kind: particle;\n'
            ' source-name: "independent";\n'
            f' Emitter {{ images: ["{ZED}", "{ALPHA}", "{ZED}"]; name: "First"; imageFrames: 1; emitterType: Circle; }}\n'
            f' Emitter {{ image: "{ALPHA}"; name: "Second"; imageFrames: 1; emitterType: Circle; }}\n'
            '}\n', encoding="utf-8")
        gold.mkdir()
        (gold / "Independent.xml.compiled").write_bytes(particle_gold(["First", "Second"]))
        self.run_compiler("compile-particle-v2", "--input", source, "--output", output,
                          "--gold64", gold)
        self.assertEqual((output / "image_sources.txt").read_text(), f"{ALPHA}\n{ZED}\n")
        records = list(output.glob("*.source-record"))
        self.assertEqual([p.name for p in records], ["Independent.source-record"])
        self.assertEqual(self.read_record(records[0], 0xDEADFED8, "particles"), [2, 1, 2, 1])
        emitters = particle_source_emitters(records[0].read_bytes()[12:])
        self.assertEqual(emitters[0]["handles"], [2, 1, 2])
        self.assertEqual(emitters[1]["handles"], [1])
        self.assertEqual([e["frames"] for e in emitters], [1, 1])
        self.assertNotIn("GOLD_IMAGE", (output / "image_sources.txt").read_text())
        self.assertFalse((output / "Independent.compiled").exists())
        self.assert_independent_headers(output)

    def test_both_commands_reject_the_removed_image_registry_option(self):
        for command in ("compile-v2", "compile-particle-v2"):
            with self.subTest(command=command):
                completed = subprocess.run(
                    [str(self.compiler), command, "--image-registry",
                     str(self.directory / "this-registry-does-not-exist.bin")],
                    capture_output=True, text=True, encoding="utf-8", errors="replace", timeout=30)
                self.assertEqual(completed.returncode, 2)
                self.assertIn("unknown option --image-registry", completed.stderr)

    def test_v7_reanim_float_precision_and_integer_cel(self):
        source = self.directory / "exact.dsl"
        source.write_text("export component Exact {\n fps: 13.3072289;\n Track {\n"
                          'source-name: "layer"; frame-count: 2;\n'
                          "frame 0 { x: -0.123456789; y: 2147483.647; "
                          "skew-x: 1e-4; scale-x: 0.791999996; cel: 2147483647; alpha: 1.0000; }\n"
                          "} }", encoding="utf-8")
        types, fonts = self.directory / "types.txt", self.directory / "fonts.bin"
        types.write_text("exact 0\n")
        fonts.write_bytes(struct.pack("<2I", 0x4953594D, 0))
        output = self.directory / "exact"
        self.run_compiler("compile-v2", "--input", source, "--output", output,
                          "--type-map", types, "--font-registry", fonts)
        payload = (output / "Exact.source-record").read_bytes()[12:]
        self.assertEqual(struct.unpack_from("<I", payload)[0], 0x46544449)
        self.assertEqual(payload[16:20], struct.pack("<f", 13.3072289))
        expected = struct.pack("<6fif", -.123456789, 2147483.647, 1e-4, -10000,
                               .791999996, -10000, 2147483647, 1)
        self.assertEqual(payload[40:72], expected)
        self.assertEqual(payload[72:104], expected)
        stale = bytearray(payload)
        struct.pack_into("<I", stale, 0, 0x37544449)
        with self.assertRaisesRegex(ValueError, "compiler payload"):
            definition_atlas.image_offsets("reanim", stale)

    def test_v7_rejects_nonfinite_overflow_nondecimal_with_line_field_and_text(self):
        for field, literal in (("x", "3.5e38"), ("x", "-3.5e38"), ("x", "0x10"),
                               ("x", "NaN"), ("x", "Inf"), ("cel", "1.2")):
            with self.subTest(field=field, literal=literal):
                source = self.directory / "bad.dsl"
                source.write_text('export component Bad {\n Track { source-name: "layer";\n'
                                  f"frame 0 {{ {field}: {literal}; }}\n }} }}")
                result = subprocess.run([str(self.compiler), "compile", "--input", str(source),
                                         "--output", str(self.directory / "bad.compiled")],
                                        capture_output=True, text=True, timeout=30)
                self.assertNotEqual(result.returncode, 0)
                self.assertIn("line 3", result.stderr)
                self.assertIn(field, result.stderr)
                self.assertIn(literal, result.stderr)

    def compile_storage(self, source_text, output_name="storage", fonts=True, success=True):
        source = self.directory / "storage.dsl"
        source.write_text(source_text, encoding="utf-8")
        types, registry = self.directory / "types.txt", self.directory / "fonts.bin"
        types.write_text("root 0\nother 1\n", encoding="utf-8")
        registry.write_bytes(struct.pack("<3I", 0x4953594D, 1, 1) + string("CAPTION_FONT"))
        output = self.directory / output_name
        arguments = [str(self.compiler), "compile-v2", "--input", str(source),
                     "--output", str(output), "--type-map", str(types)]
        if fonts:
            arguments += ["--font-registry", str(registry)]
        result = subprocess.run(arguments, capture_output=True, text=True,
                                encoding="utf-8", errors="replace", timeout=30)
        self.assertEqual(result.returncode == 0, success, result.stdout + result.stderr)
        return output, result

    @staticmethod
    def storage_track(name, text=False):
        return ('Track { source-name: "' + name + '"; frame-count: 1; frame 0 {'
                ' x: 7; cel: 0;' + (' font: CAPTION_FONT; text: "caption";' if text else '') + '} }')

    @staticmethod
    def source_track_headers(path):
        payload = path.read_bytes()[12:]
        count = struct.unpack_from("<I", payload, 20)[0]
        at, tracks = 24, []
        for _ in range(count):
            track_id, frames, stride, flags = struct.unpack_from("<4I", payload, at)
            tracks.append((track_id, frames, stride, flags))
            at += 16 + frames * stride
        return tracks

    def test_storage_defaults_and_explicit_both_preserve_all_outputs_bytewise(self):
        tracks = self.storage_track("z") + self.storage_track("a", text=True)
        implicit, _ = self.compile_storage("export component Root {" + tracks + "}", "implicit")
        explicit, _ = self.compile_storage("export component Root {both:" + tracks + "}", "explicit")
        for name in ("Root.source-record", "Root.reanim.v2.compiled",
                     "reanim_track_ids.bin", "ReanimTrackId.h", "ReanimTrackMphfGlobal.h"):
            self.assertEqual((implicit / name).read_bytes(), (explicit / name).read_bytes(), name)
        self.assertEqual([t[3] for t in self.source_track_headers(implicit / "Root.source-record")],
                         [0, 1])

    def test_storage_regions_preserve_logical_order_text_flag_and_component_scope(self):
        source = ("export component Root {" + self.storage_track("z")
                  + "cpu:" + self.storage_track("a", text=True)
                  + "gpu:gpu:" + self.storage_track("m")
                  + "both:" + self.storage_track("b") + "}"
                  + "export component Other {" + self.storage_track("q") + "}")
        output, _ = self.compile_storage(source)
        tracks = self.source_track_headers(output / "Root.source-record")
        # IDs remain sorted by track name, while descriptor order stays authored.
        self.assertEqual([t[0] for t in tracks], [5, 1, 3, 2])
        self.assertEqual([t[3] for t in tracks], [0, 3, 4, 0])
        self.assertEqual([(t[1], t[2]) for t in tracks], [(1, 32)] * 4)
        self.assertEqual(self.source_track_headers(output / "Other.source-record")[0][3], 0)
        self.assertFalse((output / "Root.reanim.v2.compiled").exists())
        self.assertTrue((output / "Other.reanim.v2.compiled").is_file())

    def test_storage_regions_reject_malformed_nested_unknown_and_variant_annotations(self):
        cases = [
            ("export component Root { cpu " + self.storage_track("a") + "}", "expected ':'"),
            ("export component Root { gpu:; }", "expected '}'"),
            ("export component Root { gpu: { } }", "expected '}'"),
            ("export component Root { cpu: both; }", "expected ':'"),
            ("export component Root { cpus: }", "unknown storage region"),
            ('export component Root { Track {source-name:"a"; cpu:} }', "unknown track property"),
            ('export component Root { variant-of:Other; images:[]; both: }', "cannot override storage"),
            ('export component Root { gpu: variant-of:Other; images:[]; }', "cannot override storage"),
        ]
        for i, (source, diagnostic) in enumerate(cases):
            with self.subTest(source=source):
                _, result = self.compile_storage(source, f"bad-{i}", success=False)
                self.assertIn(diagnostic, result.stderr)

    def test_storage_requires_source_records_and_legacy_compile_rejects_loss(self):
        source = "export component Root {gpu:" + self.storage_track("layer") + "}"
        _, result = self.compile_storage(source, fonts=False, success=False)
        self.assertIn("track storage requires", result.stderr)
        legacy = subprocess.run(
            [str(self.compiler), "compile", "--input", str(self.directory / "storage.dsl"),
             "--output", str(self.directory / "legacy.compiled")],
            capture_output=True, text=True, encoding="utf-8", errors="replace", timeout=30)
        self.assertNotEqual(legacy.returncode, 0)
        self.assertIn("cannot represent track storage", legacy.stderr)
        self.assertFalse((self.directory / "legacy.compiled").exists())

    def test_storage_variant_inherits_root_record_without_extra_behavior(self):
        source = ("export component Root {gpu:" + self.storage_track("layer") + "}"
                  "export component Variant {variant-of:Root; images:[[]];}")
        output, _ = self.compile_storage(source)
        self.assertEqual([p.name for p in output.glob("*.source-record")], ["Root.source-record"])
        self.assertEqual(self.source_track_headers(output / "Root.source-record")[0][3], 4)


if __name__ == "__main__":
    unittest.main()
