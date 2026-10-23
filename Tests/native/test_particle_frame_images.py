"""Persistent particle frame regression tests; no migration backup is required."""
from collections import defaultdict
import hashlib
import json
from pathlib import Path
import struct
import sys
import tempfile
import unittest

from PIL import Image

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "tools"))

import definition_atlas as atlas
import runtime_asset_sources
from migrate_particle_frame_images import Source, LIVE_ORIGINALS, check_published_frames


class ParticleFrameImagesTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.manifest = json.loads(
            (ROOT / "assets/definitions/particle-frame-images.json").read_text(encoding="utf-8"))
        cls.records = cls.manifest["images"]
        cls.by_path = {record["path"]: record for record in cls.records}
        cls.sources = {
            path: Source(path.read_text(encoding="utf-8-sig"))
            for path in sorted((ROOT / "assets/definitions/particles").rglob("*.particle.dsl"))
        }
        cls.components = {}
        names = {record["source"] for record in cls.records} & LIVE_ORIGINALS
        for path, source in cls.sources.items():
            for name, (opening, emitters) in source.components().items():
                cls.components[name] = (path, source, opening, emitters)
                for block in [opening, *emitters]:
                    props = source.properties(block)
                    image = source.scalar(props, "image")
                    if image and image.casefold() != "none":
                        names.add(image)
                    if "images" in props:
                        lists = source.value(props, "images")
                        if block == opening:
                            lists = [item for sequence in lists for item in sequence]
                        names.update(item for item in lists if item.startswith("IMAGE_"))
        cls.files = runtime_asset_sources.inventory(ROOT)
        cls.descriptors = atlas.authoring_descriptors(
            (ROOT / "assets/definitions/resources.json").read_bytes(), cls.files, names)
        cls.decoded_sources = {
            name: atlas.logical_image(cls.descriptors[name], cls.files)[0]
            for name in {record["source"] for record in cls.records} & LIVE_ORIGINALS
        }

    def test_all_split_pngs_preserve_original_rgba_bytes(self):
        self.assertEqual(self.manifest["format"], "pvz-particle-frame-images-v1")
        self.assertEqual(len(self.records), 213)
        checked = check_published_frames(ROOT)
        self.assertEqual(checked["decoded_png_frames"], 213)
        self.assertEqual(checked["source_sheets"], 36)
        self.assertGreater(checked["live_source_crops_compared"], 0)
        self.assertEqual(len(self.by_path), len(self.records), "Duplicate sidecar paths")
        inventory = {path.relative_to(ROOT / "assets/runtime").as_posix()
                     for path in (ROOT / "assets/runtime/particles/frames").glob("*.png")}
        self.assertEqual(inventory, set(self.by_path), "Untracked or missing split PNG")
        cells = defaultdict(set)
        for record in self.records:
            with self.subTest(path=record["path"]):
                width, height = record["source_width"], record["source_height"]
                cols, rows = record["source_cols"], record["source_rows"]
                x, y, w, h = record["crop"]
                self.assertEqual((w, h), (width // cols, height // rows))
                self.assertGreater(w, 0)
                self.assertGreater(h, 0)
                self.assertEqual((x % w, y % h), (0, 0))
                col, row = x // w, y // h
                self.assertTrue(0 <= col < cols and 0 <= row < rows)
                cells[record["source"]].add((col, row))
                original = self.decoded_sources.get(record["source"])
                path = self.files[atlas.pak.file_key(record["path"])]
                # Check encoded format too: Pillow's RGBA conversion alone could
                # conceal palette quantization or a different PNG bit depth.
                header = path.read_bytes()[:33]
                self.assertEqual(header[:8], b"\x89PNG\r\n\x1a\n")
                self.assertEqual(header[12:16], b"IHDR")
                png_w, png_h, depth, color, _, _, _ = struct.unpack(">IIBBBBB", header[16:29])
                self.assertEqual((png_w, png_h, depth, color), (w, h, 8, 6))
                with Image.open(path) as decoded:
                    self.assertEqual(decoded.format, "PNG")
                    self.assertEqual(decoded.mode, "RGBA")
                    self.assertEqual(decoded.size, (w, h))
                    rgba = decoded.tobytes()
                    # Includes RGB under fully transparent pixels and every alpha
                    # byte; no premultiplication or visual-only equality is used.
                    if original is not None:
                        self.assertEqual(rgba, original.crop((x, y, x + w, y + h)).tobytes())
                    self.assertEqual(hashlib.sha256(rgba).hexdigest(), record["rgba_sha256"])
        for name, observed in cells.items():
            first = next(record for record in self.records if record["source"] == name)
            self.assertEqual(observed, {(col, row) for row in range(first["source_rows"])
                                        for col in range(first["source_cols"])}, name)

    def check_sequence(self, sequence):
        self.assertIsInstance(sequence, list)
        self.assertTrue(sequence, "Image sequences must contain at least one image")
        if len(sequence) == 1 and sequence[0].startswith("IMAGE_"):
            descriptor = self.descriptors[sequence[0]]
            self.assertEqual((descriptor.cols, descriptor.rows), (1, 1))
            return
        records = []
        for image in sequence:
            self.assertIn(image, self.by_path, "Direct frame path must exist in the sidecar")
            records.append(self.by_path[image])
        first = records[0]
        source = first["source"]
        x, y, width, height = first["crop"]
        self.assertEqual(x % width, 0)
        start_col = x // width
        cols = first["source_cols"]
        self.assertEqual(len(records), cols - start_col,
                         "A sequence must retain every remaining OverrideFrame cel")
        for offset, record in enumerate(records):
            self.assertEqual(record["source"], source)
            self.assertEqual(record["crop"], [(start_col + offset) * width, y, width, height],
                             "Frame order and source row must remain stable")

    def test_dsl_uses_valid_ordered_image_sequences(self):
        base_emitters = variants = variant_emitters = 0
        referenced_frames = set()
        for path, source in self.sources.items():
            self.assertFalse({"imageRow", "imageCol", "rects"} &
                             {token.text for token in source.tokens}, str(path))
            for name, (opening, emitters) in source.components().items():
                with self.subTest(component=name):
                    props = source.properties(opening)
                    parent = source.scalar(props, "variant-of")
                    if parent:
                        variants += 1
                        self.assertFalse(emitters)
                        self.assertNotIn("image", props)
                        self.assertIn(parent, self.components)
                        inherited = self.components[parent][3]
                        sequences = source.value(props, "images")
                        self.assertEqual(len(sequences), len(inherited))
                        variant_emitters += len(sequences)
                    else:
                        base_emitters += len(emitters)
                        sequences = []
                        for emitter in emitters:
                            emitter_props = source.properties(emitter)
                            self.assertFalse("image" in emitter_props and "images" in emitter_props)
                            if "images" in emitter_props:
                                sequences.append(source.value(emitter_props, "images"))
                            else:
                                image = source.scalar(emitter_props, "image")
                                self.assertIsNotNone(image, "No-image emitters must use image:none")
                                if image.casefold() != "none":
                                    sequences.append([image])
                            logical_count = int(source.scalar(emitter_props, "imageFrames", "1"))
                            self.assertGreaterEqual(logical_count, 1)
                    for sequence in sequences:
                        self.check_sequence(sequence)
                        referenced_frames.update(item for item in sequence if item in self.by_path)
        self.assertEqual((base_emitters, variants, variant_emitters), (222, 56, 57))
        self.assertTrue(referenced_frames)

    def test_boss_fire_and_ice_use_their_own_source_dimensions(self):
        for source, expected_size, expected_cel in (
                ("IMAGE_ZOMBIE_BOSS_FIREBALL_PARTICLES", (448, 74), (112, 74)),
                ("IMAGE_ZOMBIE_BOSS_ICEBALL_PARTICLES", (348, 46), (87, 46))):
            with self.subTest(source=source):
                records = [record for record in self.records if record["source"] == source]
                self.assertEqual(len(records), 4)
                self.assertTrue(all((record["source_width"], record["source_height"]) == expected_size
                                    for record in records))
                self.assertEqual([record["crop"] for record in records],
                                 [[col * expected_cel[0], 0, *expected_cel] for col in range(4)])

    def test_published_validator_detects_transparent_rgb_and_geometry_corruption(self):
        # A retired synthetic sheet is deliberately absent. Its immutable hash
        # must still detect changes to RGB beneath a fully transparent pixel.
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            target = root / "assets/runtime/particles/frames/retired_r0_c0.png"
            target.parent.mkdir(parents=True)
            rgba = bytes((11, 22, 33, 0))
            Image.frombytes("RGBA", (1, 1), rgba).save(target)
            sidecar = root / "assets/definitions/particle-frame-images.json"
            sidecar.parent.mkdir(parents=True)
            record = {"path": "particles/frames/retired_r0_c0.png", "source": "IMAGE_RETIRED",
                      "source_width": 1, "source_height": 1, "source_cols": 1, "source_rows": 1,
                      "crop": [0, 0, 1, 1], "rgba_sha256": hashlib.sha256(rgba).hexdigest()}
            manifest = {"format": "pvz-particle-frame-images-v1", "images": [record]}
            sidecar.write_text(json.dumps(manifest))
            (sidecar.parent / "resources.json").write_text(json.dumps({
                "format": "pvz-resources-authoring-v1",
                "manifest": {"tag": "ResourceManifest", "attrs": {}, "children": []}}))
            overlay = root / runtime_asset_sources.AI_OVERLAY_MANIFEST
            overlay.parent.mkdir(parents=True)
            overlay.write_text('{"format":"pvz-ai-runtime-overlay-v1","files":{}}')
            self.assertEqual(check_published_frames(root)["decoded_png_frames"], 1)
            Image.frombytes("RGBA", (1, 1), bytes((12, 22, 33, 0))).save(target)
            with self.assertRaises(AssertionError):
                check_published_frames(root)
            Image.frombytes("RGBA", (1, 1), rgba).save(target)
            record["crop"] = [1, 0, 1, 1]
            sidecar.write_text(json.dumps(manifest))
            with self.assertRaises(AssertionError):
                check_published_frames(root)


if __name__ == "__main__":
    unittest.main()
