"""Independent RGBA and extrusion checks for every authored Zombatar image."""
from __future__ import annotations

import copy
import hashlib
import json
from pathlib import Path
import sys
import unittest

from PIL import Image

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "tools"))
import definition_atlas
import zombatar_atlas as zombatar


def independently_decode(row, files):
    """Decode the original PNG and optional blue-channel sidecar with Pillow."""
    path = files[row["image"].lower()]
    with Image.open(path) as image:
        result = image.convert("RGBA")
    if row["auto_alpha"]:
        for candidate in (path.with_name("_" + path.name),
                          path.with_name(path.stem + "_" + path.suffix)):
            if candidate.is_file():
                with Image.open(candidate) as alpha:
                    if alpha.size != result.size:
                        raise ValueError("Independent alpha dimensions differ")
                    result.putalpha(alpha.convert("RGB").getchannel("B"))
                break
    return result


class ZombatarAtlasTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.document = json.loads(
            (ROOT / "assets/definitions/zombatar/Zombatar.zombatar.json").read_text("utf-8"))
        cls.source_root = ROOT / "assets/runtime"
        cls.files = {
            str(path.relative_to(cls.source_root)).replace("\\", "/").lower(): path
            for path in (cls.source_root / "images").rglob("*") if path.is_file()
        }
        overlay = ROOT / "assets/source-art/ai/runtime"
        cls.files.update({
            str(path.relative_to(overlay)).replace("\\", "/").lower(): path
            for path in overlay.rglob("*") if path.is_file()
        })
        cls.symbols = zombatar.validate_sources(cls.document)
        cls.descriptors = zombatar.descriptors(cls.document)
        cls.originals = {
            row["image"]: independently_decode(row, cls.files)
            for row in cls.document["images"]
        }
        # Production packing and decoding are deliberately kept out of the
        # expected-pixel implementation above.
        logical = [
            definition_atlas.logical_image(cls.descriptors[name], cls.files)[0]
            for name in cls.symbols
        ]
        cls.layout = definition_atlas.shelf_layout([image.size for image in logical], 2)
        cls.atlas, _ = definition_atlas.pack(logical, layout=cls.layout)
        cls.report = zombatar.compile_definition(
            cls.document, cls.descriptors, cls.files, cls.layout, cls.symbols,
            "compiled/atlases/zombatar.atlas.png")

    def test_all_209_regions_and_two_pixel_borders_match_original_sources(self):
        self.assertEqual(len(self.report["images"]), 209)
        for row in self.report["images"]:
            with self.subTest(image=row["name"]):
                expected = self.originals[row["source"]]
                x, y, width, height, rows, columns = row["region"]
                self.assertEqual((width, height), expected.size)
                self.assertEqual((rows, columns), (1, 1))
                self.assertEqual(self.atlas.crop((x, y, x + width, y + height)).tobytes(),
                                 expected.tobytes())
                self.assertEqual(row["rgba_sha256"],
                                 hashlib.sha256(expected.tobytes()).hexdigest())
                # Independently construct the padded oracle, including corners.
                padded = Image.new("RGBA", (width + 4, height + 4))
                padded.paste(expected, (2, 2))
                for offset in (0, 1):
                    padded.paste(expected.crop((0, 0, width, 1)), (2, offset))
                    padded.paste(expected.crop((0, height - 1, width, height)),
                                 (2, height + 2 + offset))
                    padded.paste(expected.crop((0, 0, 1, height)), (offset, 2))
                    padded.paste(expected.crop((width - 1, 0, width, height)),
                                 (width + 2 + offset, 2))
                for px, py, sx, sy in (
                    (0, 0, 0, 0), (width + 2, 0, width - 1, 0),
                    (0, height + 2, 0, height - 1),
                    (width + 2, height + 2, width - 1, height - 1),
                ):
                    padded.paste(expected.getpixel((sx, sy)), (px, py, px + 2, py + 2))
                self.assertEqual(self.atlas.crop(
                    (x - 2, y - 2, x + width + 2, y + height + 2)).tobytes(),
                    padded.tobytes())

    def test_generated_native_order_and_geometry_preserve_frozen_image_indices(self):
        generated = zombatar.generate(self.document, self.report)
        enum = generated["ZombatarImage.h"].decode()
        native = generated["ZombatarAtlasData.cpp"].decode()
        for index, row in enumerate(self.document["images"]):
            self.assertIn(f'{row["name"]} = {index},', enum)
            self.assertIn("{" + ", ".join(map(str, self.report["images"][index]["region"][:4]))
                          + "},", native)
        self.assertIn("Count = 209", enum)
        self.assertIn("None = Count", enum)
        self.assertIn("compiled/atlases/zombatar.atlas.png", native)
        self.assertNotIn(zombatar.PATH, native)
        self.assertEqual(set(generated), {"ZombatarImage.h", "ZombatarAtlasData.cpp"})

    def test_invalid_or_duplicate_entries_are_rejected(self):
        changes = (
            lambda doc: doc["images"].pop(),
            lambda doc: doc["images"][0].update(name=doc["images"][1]["name"]),
            lambda doc: doc["images"][0].update(image=doc["images"][1]["image"]),
            lambda doc: doc["images"][0].update(image="../images/a.png"),
            lambda doc: doc["images"][0].update(image="images/a.jpg"),
            lambda doc: doc["images"][0].update(auto_alpha=1),
            lambda doc: doc["images"][0].update(name="None"),
            lambda doc: doc.update(unexpected=True),
        )
        for change in changes:
            document = copy.deepcopy(self.document)
            change(document)
            with self.subTest(change=change), self.assertRaises(ValueError):
                zombatar.validate_sources(document)

    def test_missing_sources_changed_dimensions_and_reordered_enum_are_rejected(self):
        with self.assertRaises(ValueError):
            zombatar.compile_definition(self.document, self.descriptors, self.files,
                                        self.layout, self.symbols[1:], "atlas.png")
        layout = copy.deepcopy(self.layout)
        x, y, width, height = layout["regions"][0]
        layout["regions"][0] = (x, y, width + 1, height)
        with self.assertRaises(ValueError):
            zombatar.compile_definition(self.document, self.descriptors, self.files,
                                        layout, self.symbols, "atlas.png")
        report = copy.deepcopy(self.report)
        report["images"].reverse()
        with self.assertRaises(ValueError):
            zombatar.generate(self.document, report)


if __name__ == "__main__":
    unittest.main()
