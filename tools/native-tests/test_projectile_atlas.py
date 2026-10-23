"""Pixel and metadata checks for the offline projectile atlas integration."""
from __future__ import annotations

import copy
import math
from pathlib import Path
import struct
import sys
import tempfile
import unittest

from PIL import Image

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import definition_atlas
import projectile_atlas as projectile
import resource_build_config


class ProjectileAtlasTests(unittest.TestCase):
    def setUp(self):
        self.temporary = tempfile.TemporaryDirectory(prefix="pvz-projectile-atlas-")
        self.addCleanup(self.temporary.cleanup)
        root = Path(self.temporary.name)
        self.files, self.descriptors = {}, {}
        for index, name in enumerate(("images/body.png", "images/shadow.png")):
            path = root / Path(name).name
            image = Image.new("RGBA", (42, 9))
            image.putdata([(x * 5, y * 21, index * 100, (x + y) % 255)
                           for y in range(9) for x in range(42)])
            image.save(path)
            self.files[name] = path
            self.descriptors[name] = definition_atlas.ImageDescriptor(
                name, name, "", "", 0, 1, 1, 0xFFFFFF)
        self.document = {
            "format": projectile.FORMAT, "name": "Projectiles",
            "projectiles": [{"name": name, "image": None if index == 6 else "images/body.png",
                             "scale": 0.375 if index == 11 else 1.0}
                            for index, name in enumerate(projectile.NAMES)],
            "shadows": [{"name": name, "image": "images/shadow.png",
                         "rect": [index * 21, 0, 21, 9]}
                        for index, name in enumerate(("day", "night"))],
        }
        self.symbols = projectile.validate_sources(self.document)
        self.layout = {"width": 92, "height": 13,
                       "regions": [(2, 2, 42, 9), (48, 2, 42, 9)]}

    def compile(self):
        return projectile.compile_definition(
            self.document, self.descriptors, self.files, self.layout,
            self.symbols, "compiled/atlases/projectiles.atlas.png")

    def test_compiled_rectangles_select_exact_original_pixels_and_keep_scale(self):
        data, report = self.compile()
        self.assertEqual(len(data), 332)
        self.assertEqual(struct.unpack_from("<5I", data),
                         (projectile.MAGIC, 1, 14, 92, 13))
        sources = [definition_atlas.logical_image(self.descriptors[name], self.files)[0]
                   for name in self.symbols]
        packed, _ = definition_atlas.pack(sources, layout=self.layout)
        for index, row in enumerate(self.document["projectiles"]):
            x, y, w, h, scale = struct.unpack_from("<4if", data, 20 + index * 20)
            self.assertEqual(scale, row["scale"])
            if index == 6:
                self.assertEqual((x, y, w, h), (0, 0, 0, 0))
            else:
                self.assertEqual(packed.crop((x, y, x + w, y + h)).tobytes(),
                                 sources[0].tobytes())
        for index in range(2):
            x, y, w, h = struct.unpack_from("<4i", data, 300 + index * 16)
            self.assertEqual(packed.crop((x, y, x + w, y + h)).tobytes(),
                             sources[1].crop((index * 21, 0, (index + 1) * 21, 9)).tobytes())
        self.assertEqual(len(report["images"]), 2)
        self.assertNotIn("symbol", report["projectiles"][0])

    def test_invalid_scale_and_float32_underflow_rejected(self):
        for value in (0, -1, math.inf, math.nan, True, 1e100, 1e-100):
            with self.subTest(value=value):
                self.document["projectiles"][0]["scale"] = value
                with self.assertRaises(ValueError):
                    self.compile()

    def test_shadow_cannot_read_outside_original_image(self):
        self.document["shadows"][1]["rect"] = [22, 0, 21, 9]
        with self.assertRaisesRegex(ValueError, "exceeds"):
            self.compile()

    def test_missing_or_invalid_enum_slots_and_source_paths_rejected(self):
        for change in (
            lambda doc: doc["projectiles"].pop(),
            lambda doc: doc["projectiles"][0].update(name="IMAGE_PROJECTILEPEA"),
            lambda doc: doc["projectiles"][0].update(image="../body.png"),
            lambda doc: doc["projectiles"][0].update(image="images/body.jpg"),
            lambda doc: doc["projectiles"][6].update(image="images/body.png"),
        ):
            with self.subTest(change=change):
                document = copy.deepcopy(self.document)
                change(document)
                with self.assertRaises(ValueError):
                    projectile.validate_sources(document)

    def test_config_adds_projectile_source_and_shared_packer_group(self):
        root = Path(self.temporary.name)
        for name in ("Pea.dsl", "Splat.dsl", "Projectiles.projectile.dsl"):
            (root / name).write_text("export component Projectiles { kind: projectile; }",
                                     encoding="utf-8")
        path = root / "ResourceBuild.pvzbuild"
        path.write_text(
            'resource_build(1)\nsources(reanim "Pea.dsl")\n'
            'sources(particle "Splat.dsl")\nsources(projectile "*.projectile.dsl")\n'
            'atlas(projectiles projectile:Projectiles)\n', encoding="utf-8")
        config = resource_build_config.load(path)
        self.assertEqual(len(config.sources["projectile"]), 1)
        self.assertEqual(resource_build_config.resolve_atlases(config, {projectile.PATH}),
                         {"projectiles": [projectile.PATH]})


if __name__ == "__main__":
    unittest.main()
