"""Check every packaged atlas region against its offline source pixel digest."""
from __future__ import annotations

import hashlib
import io
import json
import os
from pathlib import Path
import struct
import unittest
import zipfile
import sys

from PIL import Image


ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "tools"))
import build_numeric_runtime_pak64 as pak
PACKAGE = Path(os.environ.get(
    "PVZ_RESOURCE_PACKAGE", ROOT / "out/x64-win32-vulkan/cache/resources/main.pak64"))


class DefinitionAtlasCorpusTests(unittest.TestCase):
    def test_all_regions_preserve_source_pixels_and_grids(self):
        report = json.loads(PACKAGE.with_name("manifest.json").read_text(encoding="utf-8"))
        definitions = report["definition_atlases"]
        self.assertEqual(len(definitions), 252)
        regions_checked = 0
        physical_atlases = set()
        bindings = pak.read_definition_image_bindings(ROOT)
        atlas_images, owner_dimensions, shared_sources, source_metadata, owner_regions = {}, {}, {}, {}, {}
        with zipfile.ZipFile(PACKAGE) as archive:
            index = pak.archive_index(archive)
            available = {name for name, info in index.items() if not info.is_dir()}
            numeric = {name for name in available if pak.numeric_kind(name)}
            self.assertEqual({kind: sum(pak.numeric_kind(name) == kind for name in numeric)
                              for kind in pak.COUNTS}, pak.COUNTS)
            self.assertEqual(set(definitions), {name for name in numeric
                                               if pak.numeric_kind(name) in ("reanim", "particles")})
            self.assertEqual(set(bindings), set(definitions))
            self.assertEqual(set(report["files"]), available)
            for name, definition in definitions.items():
                with self.subTest(definition=name):
                    record = archive.read(name)
                    magic, width, height = struct.unpack_from("<3I", record, 12)
                    parsed = pak.parse_definition_atlas(name, record)
                    count = parsed["count"]
                    expected_magic = 0x35564152 if "/reanim/" in name else 0x35564150
                    self.assertEqual(magic, expected_magic)
                    self.assertEqual((width, height, count),
                                     (definition["atlas_width"], definition["atlas_height"],
                                      definition["region_count"]))
                    self.assertEqual(count, len(definition["images"]))
                    self.assertEqual(set(parsed["regions"]),
                                     {tuple(image["region"]) for image in definition["images"]})
                    atlas_name = definition["atlas_path"]
                    self.assertEqual(bindings[name], atlas_name)
                    if count == 0:
                        self.assertEqual(atlas_name, "")
                        self.assertEqual((width, height), (0, 0))
                        self.assertTrue(all(field == (0,) * 6 for field in parsed["image_fields"]))
                        continue
                    physical_atlases.add(atlas_name)
                    self.assertEqual(owner_dimensions.setdefault(atlas_name, (width, height)), (width, height))
                    if atlas_name not in atlas_images:
                        with Image.open(io.BytesIO(archive.read(index[atlas_name]))) as decoded:
                            self.assertEqual((decoded.format, decoded.mode), ("PNG", "RGBA"))
                            atlas_images[atlas_name] = decoded.convert("RGBA")
                    atlas = atlas_images[atlas_name]
                    self.assertEqual(atlas.size, (width, height))
                    for image in definition["images"]:
                        # New builds identify authored image sources by name.
                        # Older cached reports used numeric fixture symbols.
                        source = image.get("source", image.get("symbol"))
                        self.assertIsNotNone(source)
                        if "source" in image:
                            self.assertIsInstance(source, str)
                            self.assertTrue(source)
                            self.assertNotIn("symbol", image)
                        else:
                            self.assertIsInstance(source, int)
                        region = tuple(image["region"])
                        self.assertIn(region, parsed["regions"])
                        x, y, w, h, rows, cols = region
                        self.assertEqual((w, h), (image["width"], image["height"]))
                        self.assertEqual((rows, cols), (image["rows"], image["cols"]))
                        metadata = (w, h, rows, cols, image["rgba_sha256"])
                        self.assertEqual(source_metadata.setdefault(source, metadata), metadata)
                        shared = (region, image["rgba_sha256"])
                        self.assertEqual(shared_sources.setdefault((atlas_name, source), shared), shared)
                        geometry = (x, y, w, h)
                        owner = owner_regions.setdefault(atlas_name, {})
                        self.assertEqual(owner.setdefault(geometry, image["rgba_sha256"]), image["rgba_sha256"])
                        self.assertGreater(rows, 0)
                        self.assertGreater(cols, 0)
                        self.assertGreaterEqual(x, 2)
                        self.assertGreaterEqual(y, 2)
                        self.assertLessEqual(x + w + 2, width)
                        self.assertLessEqual(y + h + 2, height)
                        pixels = atlas.crop((x, y, x + w, y + h))
                        self.assertEqual(hashlib.sha256(pixels.tobytes()).hexdigest(),
                                         image["rgba_sha256"])
                        # Every pixel of the four two-pixel borders and corners
                        # must replicate the original logical image's RGBA edge.
                        for source_box, output_box in (
                            ((0, 0, w, 1), (x, y - 2, x + w, y)),
                            ((0, h - 1, w, h), (x, y + h, x + w, y + h + 2)),
                            ((0, 0, 1, h), (x - 2, y, x, y + h)),
                            ((w - 1, 0, w, h), (x + w, y, x + w + 2, y + h)),
                            ((0, 0, 1, 1), (x - 2, y - 2, x, y)),
                            ((w - 1, 0, w, 1), (x + w, y - 2, x + w + 2, y)),
                            ((0, h - 1, 1, h), (x - 2, y + h, x, y + h + 2)),
                            ((w - 1, h - 1, w, h), (x + w, y + h, x + w + 2, y + h + 2)),
                        ):
                            expected = pixels.crop(source_box).resize(
                                (output_box[2] - output_box[0], output_box[3] - output_box[1]),
                                Image.Resampling.NEAREST)
                            self.assertEqual(atlas.crop(output_box).tobytes(), expected.tobytes())
                        regions_checked += 1
            self.assertEqual({name for name in available if name.endswith(".atlas.png")}, physical_atlases)
        for path, owner in owner_regions.items():
            rectangles = []
            for x, y, w, h in owner:
                padded = (x - 2, y - 2, x + w + 2, y + h + 2)
                self.assertTrue(all(padded[2] <= old[0] or old[2] <= padded[0] or
                                    padded[3] <= old[1] or old[3] <= padded[1] for old in rectangles),
                                f"Cross-definition padded regions overlap in {path}")
                rectangles.append(padded)
        self.assertEqual(len(physical_atlases), report["atlas_memory"]["definition_atlas_count"])
        self.assertEqual(sum(width * height * 4 for width, height in owner_dimensions.values()),
                         report["atlas_memory"]["rgba_bytes"])
        self.assertGreater(regions_checked, 1000)


if __name__ == "__main__":
    unittest.main()
