"""Validate atlas metadata against the cached corpus; never run the compiler or game."""
from __future__ import annotations

import importlib.util
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

SPEC = importlib.util.spec_from_file_location(
    "atlas_resource_pipeline", ROOT / "tools/resourcePipeline/src/build_resources.py")
pipeline = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(pipeline)


def envelope(cookie: int, payload: bytes) -> bytes:
    return struct.pack("<3I", cookie, len(payload), zlib.crc32(payload)) + payload


def reseal(data: bytes) -> bytes:
    return envelope(struct.unpack_from("<I", data)[0], data[12:])


def reanim(registries: dict, images: list[int]) -> bytes:
    payload = struct.pack("<4IfI", 0x35544449, registries["track"], registries["image"],
                          registries["font"], 12.0, 1)
    payload += struct.pack("<4I", 0, len(images), 32, 0)
    payload += struct.pack(f"<{8 * len(images)}f", *([0.0] * (8 * len(images))))
    # A nonzero font ID must never be mistaken for an image symbol.
    payload += b"".join(struct.pack("<2I", image, 1) for image in images)
    return envelope(0xDEADFED7, payload + struct.pack("<I", 0))


def particle(registries: dict, images: list[int]) -> bytes:
    # These five unrelated emitter words deliberately resemble valid image IDs.
    body = b"".join(struct.pack("<7I40I", image, 1, 1, 1, 1, 1, 0, *([0] * 40))
                    for image in images)
    payload = struct.pack("<5I", 0x35504449, registries["image"], registries["emitter"],
                          len(images), len(body)) + body
    payload += struct.pack("<2I", 0x33544449, len(images))
    payload += struct.pack(f"<{len(images)}I", *([0xFFFFFFFF] * len(images)))
    payload += struct.pack("<2I", 0x35544449, len(images))
    payload += struct.pack(f"<{len(images)}I", *([0] * len(images)))
    return envelope(0xDEADFED8, payload)


class AtlasGroupMetadataTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        archive_path = ROOT / "out/x64-win7-opengl/cache/resources/main.pak64"
        with zipfile.ZipFile(archive_path) as archive:
            cls.records = {name: archive.read(name) for name in archive.namelist()
                           if pak.numeric_kind(name) is not None}
        cls.registries = pak.source_audit(ROOT, {}, set(cls.records))["registries"]
        cls.groups = {}
        for name, data in cls.records.items():
            images = set()
            pak.validate_numeric(name, data, cls.registries, image_ids=images)
            if pak.numeric_kind(name) in ("reanim", "particles"):
                cls.groups[name] = images
        cls.names = [name for kind in ("reanim", "particles")
                     for name in sorted(cls.groups) if pak.numeric_kind(name) == kind]

    def header(self, groups=None):
        with tempfile.TemporaryDirectory() as temporary:
            path = Path(temporary) / "ImageAtlasGroups.h"
            pipeline.emit_image_atlas_groups(
                path, self.groups if groups is None else groups, self.registries["image"])
            return path.read_text(encoding="ascii")

    def array(self, text, name):
        match = re.search(r"std::array<unsigned int, (\d+)> " + name + r"\{\n(.*?)\n\};",
                          text, re.S)
        self.assertIsNotNone(match)
        values = [int(value) for value in re.findall(r"(\d+)u", match[2])]
        self.assertEqual(len(values), int(match[1]))
        return values

    def test_complete_corpus_bounds_order_and_shared_symbols(self):
        self.assertEqual({kind: sum(pak.numeric_kind(name) == kind for name in self.records)
                          for kind in pak.COUNTS}, pak.COUNTS)
        self.assertEqual(len(self.groups), 252)
        text = self.header()
        offsets, symbols = self.array(text, "GroupOffsets"), self.array(text, "Symbols")
        self.assertEqual(len(offsets), 253)
        self.assertEqual(offsets[0], 0)
        self.assertEqual(offsets[-1], len(symbols))
        self.assertEqual(offsets, sorted(offsets))
        for index, name in enumerate(self.names):
            group = symbols[offsets[index]:offsets[index + 1]]
            self.assertEqual(group, sorted(self.groups[name]))
            self.assertEqual(len(group), len(set(group)))
            for symbol in group:
                self.assertGreater(symbol, 0)
                self.assertLessEqual(symbol, self.registries["image_max"])
                self.assertNotEqual(self.registries["image_slots"][symbol], pak.RESOURCE_SLOT_NONE)
        reanim_groups = [self.groups[name] for name in self.names[:146]]
        particle_groups = [self.groups[name] for name in self.names[146:]]
        self.assertTrue(any(a & b for i, a in enumerate(reanim_groups)
                            for b in reanim_groups[i + 1:]))
        self.assertTrue(any(a & b for a in reanim_groups for b in particle_groups))
        self.assertIn("namespace Sexy::OpenGLAtlasCorpus {", text)
        self.assertIn("#include <array>", text)
        self.assertIn("ReanimationGroups = 146u;", text)
        self.assertNotIn('"', text)
        self.assertFalse(any(name in text for name in self.names))
        self.assertRegex(text, r"RegistryHash = 0x%08Xu;" % self.registries["image"])
        sidecar = ROOT / "pvzPerf/Sexy.TodLib/generated/image_symbol_ids.bin"
        self.assertEqual(zlib.crc32(sidecar.read_bytes()), self.registries["image"])

    def test_deterministic_publication_preserves_mtime(self):
        reversed_groups = {name: set(reversed(sorted(self.groups[name])))
                           for name in reversed(self.names)}
        self.assertEqual(self.header(), self.header(reversed_groups))
        with tempfile.TemporaryDirectory() as temporary:
            path = Path(temporary) / "generated/ImageAtlasGroups.h"
            pipeline.emit_image_atlas_groups(path, self.groups, self.registries["image"])
            original = path.read_bytes()
            os.utime(path, ns=(1_600_000_000_000_000_000, 1_600_000_000_000_000_000))
            before = path.stat().st_mtime_ns
            pipeline.emit_image_atlas_groups(path, reversed_groups, self.registries["image"])
            self.assertEqual(path.stat().st_mtime_ns, before)
            self.assertEqual(path.read_bytes(), original)
            self.assertEqual(list(path.parent.iterdir()), [path])

    def test_empty_groups_keep_positions_and_terminal_sentinel(self):
        groups = {name: set(ids) for name, ids in self.groups.items()}
        for index in (0, 145, 146, 251):
            groups[self.names[index]] = {0}
        text = self.header(groups)
        offsets, symbols = self.array(text, "GroupOffsets"), self.array(text, "Symbols")
        self.assertEqual(len(offsets), 253)
        for index in (0, 145, 146, 251):
            self.assertEqual(offsets[index], offsets[index + 1])
        self.assertEqual(offsets[-1], len(symbols))
        self.assertNotIn(0, symbols)
        text = self.header(dict.fromkeys(self.names, set()))
        self.assertEqual(self.array(text, "GroupOffsets"), [0] * 253)
        self.assertEqual(self.array(text, "Symbols"), [])

    def test_incomplete_or_unexpected_group_corpus_rejected(self):
        for kind in ("reanim", "particles"):
            groups = dict(self.groups)
            del groups[next(name for name in groups if pak.numeric_kind(name) == kind)]
            with self.assertRaisesRegex(ValueError, "Incomplete atlas"):
                self.header(groups)
        with self.assertRaisesRegex(ValueError, "Unexpected atlas"):
            self.header({**self.groups, pak.RESOURCE_PATH: set()})

    def test_collection_does_not_change_existing_validation_results(self):
        for name, data in self.records.items():
            with self.subTest(name=name):
                references, old_references = set(), set()
                images = {0xFFFFFFFF}
                old = pak.validate_numeric(name, data, self.registries, old_references)
                new = pak.validate_numeric(name, data, self.registries, references,
                                           image_ids=images)
                self.assertEqual(new, old)
                self.assertEqual(references, old_references)
                self.assertEqual(images, self.groups.get(name, set()) | {0xFFFFFFFF})

    def test_collect_only_image_words_and_deduplicate(self):
        symbol = next(symbol for symbol in range(2, self.registries["image_max"] + 1)
                      if self.registries["image_slots"][symbol] != pak.RESOURCE_SLOT_NONE)
        for kind, factory in (("reanim", reanim), ("particles", particle)):
            with self.subTest(kind=kind):
                name = f"compiled/{kind}/fixture.compiled"
                data = factory(self.registries, [symbol, 0, symbol])
                images = set()
                pak.validate_numeric(name, data, self.registries, image_ids=images)
                self.assertEqual(images, {symbol})
                direct = set()
                if kind == "reanim":
                    pak.validate_reanim(pak.Reader(data[36:]), 1, self.registries, direct)
                    pak.validate_reanim(pak.Reader(data[36:]), 1, self.registries)
                else:
                    body = struct.unpack_from("<I", data, 28)[0]
                    pak.validate_particle(pak.Reader(data[32:]), 3, body, self.registries, direct)
                    pak.validate_particle(pak.Reader(data[32:]), 3, body, self.registries)
                self.assertEqual(direct, images)

    def test_corpus_crc_and_registry_validation_remain_required(self):
        for name in self.names:
            original = self.records[name]
            corrupted = bytearray(original)
            corrupted[-1] ^= 1
            with self.subTest(name=name, failure="crc"):
                for collector in (None, set()):
                    with self.assertRaisesRegex(ValueError, "envelope"):
                        pak.validate_numeric(name, bytes(corrupted), self.registries,
                                             image_ids=collector)
            stale = bytearray(original)
            image_offset = 20 if pak.numeric_kind(name) == "reanim" else 16
            struct.pack_into("<I", stale, image_offset, self.registries["image"] ^ 1)
            with self.subTest(name=name, failure="registry"):
                with self.assertRaisesRegex(ValueError, "header"):
                    pak.validate_numeric(name, reseal(stale), self.registries, image_ids=set())

    def test_full_structural_validation_remains_required_with_collector(self):
        for kind, factory in (("reanim", reanim), ("particles", particle)):
            name = f"compiled/{kind}/fixture.compiled"
            original = factory(self.registries, [0])
            cases = []
            invalid_image = bytearray(original)
            struct.pack_into("<I", invalid_image, 84 if kind == "reanim" else 32,
                             self.registries["image_max"] + 1)
            cases.append(invalid_image)
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
                with self.subTest(kind=kind, data=bytes(data)):
                    for collector in (None, set()):
                        with self.assertRaises(ValueError):
                            pak.validate_numeric(name, reseal(data), self.registries,
                                                 image_ids=collector)


if __name__ == "__main__":
    unittest.main()
