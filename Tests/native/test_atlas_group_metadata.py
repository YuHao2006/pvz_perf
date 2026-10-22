"""Validate program atlas bindings and inline geometry without compiling or launching."""
from __future__ import annotations

import importlib.util
import json
import os
from pathlib import Path
import re
import struct
import sys
import tempfile
import unittest
import zipfile
import zlib


ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "tools"))
import build_numeric_runtime_pak64 as pak
import compile_numeric_resources as resources
import resource_build_config

SPEC = importlib.util.spec_from_file_location(
    "atlas_resource_pipeline", ROOT / "tools/resourcePipeline/src/build_resources.py")
pipeline = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(pipeline)
PACKAGE = Path(os.environ.get(
    "PVZ_RESOURCE_PACKAGE", str(ROOT / "out/x64-win32-vulkan/cache/resources/main.pak64")))


def envelope(cookie: int, payload: bytes) -> bytes:
    return struct.pack("<3I", cookie, len(payload), zlib.crc32(payload)) + payload


def reseal(data: bytes) -> bytes:
    return envelope(struct.unpack_from("<I", data)[0], data[12:])


def legacy_reanim(registries: dict, images: list[int]) -> bytes:
    payload = struct.pack("<4IfI", 0x35544449, registries["track"], registries["image"],
                          registries["font"], 12.0, 1)
    payload += struct.pack("<4I", 0, len(images), 32, 0)
    payload += struct.pack(f"<{8 * len(images)}f", *([0.0] * (8 * len(images))))
    # A nonzero independent font ID must not be collected as an image ID.
    payload += b"".join(struct.pack("<2I", image, 1) for image in images)
    return envelope(0xDEADFED7, payload + struct.pack("<I", 0))


def legacy_particle(registries: dict, images: list[int]) -> bytes:
    body = b"".join(struct.pack("<7I40I", image, 1, 1, 1, 1, 1, 0, *([0] * 40))
                    for image in images)
    payload = struct.pack("<5I", 0x35504449, registries["image"], registries["emitter"],
                          len(images), len(body)) + body
    payload += struct.pack("<2I", 0x33544449, len(images))
    payload += struct.pack(f"<{len(images)}I", *([0xFFFFFFFF] * len(images)))
    payload += struct.pack("<2I", 0x35544449, len(images))
    payload += struct.pack(f"<{len(images)}I", *([0] * len(images)))
    return envelope(0xDEADFED8, payload)


class ProgramAtlasMetadataTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        with zipfile.ZipFile(PACKAGE) as archive:
            cls.records = {name: archive.read(name) for name in archive.namelist()
                           if pak.numeric_kind(name) is not None}
            cls.available = set(archive.namelist())
        cls.report = json.loads(PACKAGE.with_name("manifest.json").read_text(encoding="utf-8"))
        cls.registries = pak.source_audit(ROOT, {}, set(cls.records))["registries"]
        cls.bindings = pak.read_definition_image_bindings(ROOT)
        cls.names = sorted(name for name in cls.records
                           if pak.numeric_kind(name) in ("reanim", "particles"))
        cls.atlases = {name: pak.parse_definition_atlas(name, cls.records[name])
                       for name in cls.names}

    def test_complete_binding_corpus_and_empty_images(self):
        self.assertEqual({kind: sum(pak.numeric_kind(name) == kind for name in self.records)
                          for kind in pak.COUNTS}, pak.COUNTS)
        self.assertEqual(len(self.names), 252)
        self.assertEqual(set(self.bindings), set(self.names))
        self.assertEqual(list(self.bindings), sorted(self.bindings))
        for name in self.names:
            with self.subTest(definition=name):
                atlas, path = self.atlases[name], self.bindings[name]
                self.assertIsNotNone(atlas)
                if atlas["count"]:
                    self.assertTrue(path)
                    self.assertIn(path, self.available)
                    self.assertEqual(path, self.report["definition_atlases"][name]["atlas_path"])
                else:
                    self.assertEqual(path, "")
                    self.assertEqual((atlas["width"], atlas["height"]), (0, 0))
                    self.assertTrue(all(field == (0,) * 6 for field in atlas["image_fields"]))

    def test_configured_groups_share_program_images_across_definition_kinds(self):
        config_path = Path(os.environ.get("PVZ_RESOURCE_BUILD_CONFIG",
                                         str(ROOT / self.report["build_config"].replace("\\", "/"))))
        config = resource_build_config.load(config_path)
        configured_atlases = resource_build_config.resolve_atlases(config, set(self.names))
        report_groups = self.report["atlas_groups"]
        grouped, mixed = set(), []
        for group, members in configured_atlases.items():
            with self.subTest(group=group):
                self.assertTrue(set(members) <= set(self.names))
                self.assertFalse(grouped & set(members))
                grouped.update(members)
                self.assertEqual(report_groups[group]["members"], members)
                image_path = f"compiled/atlases/{group}.atlas.png"
                self.assertEqual(report_groups[group]["path"], image_path)
                active = [name for name in members if self.atlases[name]["count"]]
                self.assertEqual({self.bindings[name] for name in active},
                                 {image_path} if active else set())
                dimensions = {(self.atlases[name]["width"], self.atlases[name]["height"])
                              for name in active}
                self.assertEqual(dimensions, {(report_groups[group]["width"],
                                               report_groups[group]["height"])} if active else set())
                sources = {row.get("source", row.get("symbol")) for name in members
                           for row in self.report["definition_atlases"][name]["images"]}
                self.assertEqual(report_groups[group]["images"], len(sources))
                for name in members:
                    self.assertNotIn(image_path.encode("ascii"), self.records[name])
                    if name not in active:
                        self.assertEqual(self.bindings[name], "")
                if {pak.numeric_kind(name) for name in members} == {"reanim", "particles"}:
                    mixed.append(group)
                    for kind in ("reanim", "particles"):
                        self.assertTrue(all(self.bindings[name] == image_path for name in active
                                            if pak.numeric_kind(name) == kind))
        # Every definition belongs to exactly one configured or standalone unit.
        standalone = set(self.names) - grouped
        self.assertEqual(set(report_groups), set(configured_atlases) | standalone)
        for name in standalone:
            with self.subTest(standalone=name):
                self.assertEqual(report_groups[name]["members"], [name])
                expected = name.removesuffix(".compiled") + ".atlas.png" if self.atlases[name]["count"] else ""
                self.assertEqual(self.bindings[name], expected)
        configured_mixed = [group for group, members in configured_atlases.items()
                            if {pak.numeric_kind(name) for name in members} == {"reanim", "particles"}]
        self.assertEqual(mixed, configured_mixed)
        expected_images = {image for image in self.bindings.values() if image}
        self.assertEqual({name for name in self.available if name.endswith(".atlas.png")}, expected_images)
        self.assertEqual(len(expected_images), self.report["atlas_memory"]["definition_atlas_count"])
        self.assertEqual(set(self.report["files"]), self.available)

    def test_compiled_fields_are_inline_rectangles_without_resource_ids(self):
        unrelated_registry = {**self.registries, "image": 0xBAD0CAFE,
                              "image_max": 0, "image_slots": [pak.RESOURCE_SLOT_NONE]}
        fields_checked = 0
        for name in self.names:
            with self.subTest(definition=name):
                data, atlas = self.records[name], self.atlases[name]
                cookie, size, crc = struct.unpack_from("<3I", data)
                kind = pak.numeric_kind(name)
                self.assertEqual(cookie, 0xDEADFED9 if kind == "reanim" else 0xDEADFEDA)
                self.assertEqual(size, len(data) - 12)
                self.assertEqual(crc, zlib.crc32(data[12:]))
                self.assertEqual(atlas["body_offset"], 24)
                magic, width, height = struct.unpack_from("<3I", data, 12)
                self.assertEqual(magic, 0x35564152 if kind == "reanim" else 0x35564150)
                self.assertEqual((width, height), (atlas["width"], atlas["height"]))
                image_hash_offset = 24 + (8 if kind == "reanim" else 4)
                self.assertEqual(struct.unpack_from("<I", data, image_hash_offset)[0], 0)
                self.assertNotIn(b".atlas.png", data)
                self.assertNotIn(b"compiled/", data)
                self.assertEqual(len(atlas["image_fields"]), len(atlas["image_offsets"]))
                for region, offset in zip(atlas["image_fields"], atlas["image_offsets"]):
                    self.assertEqual(struct.unpack_from("<6I", data, offset), region)
                    if not any(region):
                        self.assertEqual(region, (0,) * 6)
                        continue
                    x, y, w, h, rows, cols = region
                    self.assertGreaterEqual(x, 2)
                    self.assertGreaterEqual(y, 2)
                    self.assertGreaterEqual(w, cols)
                    self.assertGreaterEqual(h, rows)
                    self.assertGreater(cols, 0)
                    self.assertGreater(rows, 0)
                    self.assertLessEqual(x + w + 2, width)
                    self.assertLessEqual(y + h + 2, height)
                    fields_checked += 1
                collected, references = {0xFFFFFFFF}, set()
                pak.validate_numeric(name, data, unrelated_registry, references,
                                     image_ids=collected, atlas_path=self.bindings[name])
                self.assertEqual(collected, {0xFFFFFFFF})
                self.assertEqual(references, {("atlas", self.bindings[name])}
                                 if atlas["count"] else set())
        self.assertGreater(fields_checked, 1000)

    def test_bindings_publication_is_deterministic_and_preserves_mtime(self):
        definitions = self.report["definition_atlases"]
        reverse = dict(reversed(list(definitions.items())))
        with tempfile.TemporaryDirectory() as temporary:
            path = Path(temporary) / "generated/DefinitionImageBindings.h"
            pipeline.emit_definition_image_bindings(path, definitions)
            original = path.read_bytes()
            os.utime(path, ns=(1_600_000_000_000_000_000, 1_600_000_000_000_000_000))
            before = path.stat().st_mtime_ns
            pipeline.emit_definition_image_bindings(path, reverse)
            self.assertEqual(path.stat().st_mtime_ns, before)
            self.assertEqual(path.read_bytes(), original)
            self.assertEqual(list(path.parent.iterdir()), [path])
            self.assertEqual(original, (ROOT / "pvzPerf/Sexy.TodLib/generated/DefinitionImageBindings.h").read_bytes())

    def test_program_registry_crc_comes_from_program_source(self):
        program = ROOT / "pvzPerf/Sexy.TodLib/ProgramImageSymbols.h"
        symbols, crc = resources.read_symbols(program)
        declaration = re.search(r"IMAGE_SYMBOL_ID_REGISTRY_CRC\s*=\s*(0x[0-9A-Fa-f]+)",
                                program.read_text(encoding="utf-8"))
        self.assertIsNotNone(declaration)
        self.assertEqual(crc, int(declaration[1], 0))
        self.assertEqual(crc, self.registries["image"])
        self.assertEqual(len(symbols), self.registries["image_max"])
        with tempfile.TemporaryDirectory() as temporary:
            path = Path(temporary) / "ProgramImageSymbols.h"
            path.write_text(program.read_text(encoding="utf-8").replace(
                declaration[1], f"0x{crc ^ 1:08X}"), encoding="utf-8")
            with self.assertRaisesRegex(ValueError, "CRC|crc|hash"):
                resources.read_symbols(path)

    def test_corpus_crc_hash_and_geometry_validation_remain_required(self):
        for name in self.names:
            original = self.records[name]
            corrupted = bytearray(original)
            corrupted[-1] ^= 1
            with self.subTest(definition=name, failure="crc"):
                with self.assertRaisesRegex(ValueError, "envelope"):
                    pak.validate_numeric(name, bytes(corrupted), self.registries)
            stale = bytearray(original)
            image_offset = 24 + (8 if pak.numeric_kind(name) == "reanim" else 4)
            struct.pack_into("<I", stale, image_offset, 1)
            with self.subTest(definition=name, failure="image hash"):
                with self.assertRaisesRegex(ValueError, "header"):
                    pak.validate_numeric(name, reseal(stale), self.registries)
            for region, offset in zip(self.atlases[name]["image_fields"],
                                      self.atlases[name]["image_offsets"]):
                if not any(region):
                    continue
                malformed = bytearray(original)
                struct.pack_into("<I", malformed, offset, 1)
                with self.subTest(definition=name, failure="geometry"):
                    with self.assertRaisesRegex(ValueError, "region"):
                        pak.validate_numeric(name, reseal(malformed), self.registries)
                break


class LegacyStructuralValidationTests(unittest.TestCase):
    """Offline v4 fixtures still exercise the bounded structural readers."""
    @classmethod
    def setUpClass(cls):
        with zipfile.ZipFile(PACKAGE) as archive:
            numeric = {name for name in archive.namelist() if pak.numeric_kind(name)}
        cls.registries = pak.source_audit(ROOT, {}, numeric)["registries"]

    def test_legacy_collector_reads_only_image_words(self):
        symbol = next(symbol for symbol in range(2, self.registries["image_max"] + 1)
                      if self.registries["image_slots"][symbol] != pak.RESOURCE_SLOT_NONE)
        for kind, factory in (("reanim", legacy_reanim), ("particles", legacy_particle)):
            with self.subTest(kind=kind):
                name = f"compiled/{kind}/fixture.compiled"
                collected = set()
                pak.validate_numeric(name, factory(self.registries, [symbol, 0, symbol]),
                                     self.registries, image_ids=collected)
                self.assertEqual(collected, {symbol})

    def test_legacy_structural_checks_remain_required_with_collector(self):
        for kind, factory in (("reanim", legacy_reanim), ("particles", legacy_particle)):
            name = f"compiled/{kind}/fixture.compiled"
            original = factory(self.registries, [0])
            invalid_image = bytearray(original)
            struct.pack_into("<I", invalid_image, 84 if kind == "reanim" else 32,
                             self.registries["image_max"] + 1)
            cases = [invalid_image]
            malformed = bytearray(original)
            if kind == "reanim":
                struct.pack_into("<f", malformed, 52, float("nan"))
                invalid_font = bytearray(original)
                struct.pack_into("<I", invalid_font, 88, 2)
                cases.append(invalid_font)
            else:
                struct.pack_into("<I", malformed, len(malformed) - 4,
                                 self.registries["emitter_count"])
                invalid_track = bytearray(original)
                struct.pack_into("<I", invalid_track, 60, 100001)
                cases.append(invalid_track)
            cases.append(malformed)
            for data in cases:
                for collector in (None, set()):
                    with self.subTest(kind=kind, failure=bytes(data), collector=collector):
                        with self.assertRaises(ValueError):
                            pak.validate_numeric(name, reseal(data), self.registries,
                                                 image_ids=collector)


if __name__ == "__main__":
    unittest.main()
