"""Normalized generated sampling endpoints retain independent logical extents."""
from pathlib import Path
from types import SimpleNamespace
import struct
import sys
import unittest
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import static_definition_codegen as formatting
import static_definitions
import static_particle_codegen as particles
import static_reanim_codegen as reanimations
import projectile_atlas


def float32(value):
    return struct.unpack("<f", struct.pack("<f", value))[0]


def parse_region(text):
    return tuple(float(value.strip().removesuffix("f"))
                 for value in text.strip("{}").split(","))


class StaticTextureRegionTests(unittest.TestCase):
    def test_normalized_endpoints_round_to_float32_and_keep_logical_dimensions(self):
        values = parse_region(formatting.texture_region((1, 7, 3, 11), 13, 29))
        # C++ parses the literal as float32; decimal spellings need not be exact doubles.
        self.assertEqual(tuple(float32(value) for value in values[:4]),
                         tuple(float32(value) for value in (1/13, 7/29, 4/13, 18/29)))
        self.assertEqual(values[4:], (3, 11))
        self.assertEqual(formatting.texture_region((0, 0, 0, 0), 0, 0),
                         "{0.0f, 0.0f, 0.0f, 0.0f, 0, 0}")
        with self.assertRaises(ValueError):
            formatting.texture_region((0, 0, 3, 11), 0, 0)

    def test_reanimations_use_each_variant_atlas_dimensions(self):
        atlas = dict(variant_count=2, slot_count=1, action_count=0,
                     variant_dimensions=[(8, 16), (16, 8)],
                     variant_rectangles=[[(2, 4, 4, 8)], [(2, 4, 4, 2)]],
                     transitions=[], action_keys=[])
        definition = dict(atlas=atlas, tracks=[], fps=12, segments=[])
        config = SimpleNamespace(definition_orders={"reanim": [("ROOT", "Root")]})
        with patch.object(reanimations, "_parse", return_value=definition):
            result = reanimations.generate(config, {"compiled/reanim/root.compiled": b""})
        source = result["files"]["ReanimData00.cpp"].decode()
        self.assertIn("{0.25f, 0.25f, 0.75f, 0.75f, 4, 8}", source)
        self.assertIn("{0.125f, 0.5f, 0.375f, 0.75f, 4, 2}", source)
        self.assertEqual(result["summary"]["rectangle_bytes"], 48)
        self.assertNotIn("Widths", source)
        self.assertNotIn("Heights", source)

    def test_particles_use_each_variant_atlas_dimensions(self):
        atlas = dict(variant_count=2, slot_count=1,
                     variant_dimensions=[(8, 16), (16, 8)],
                     variant_rectangles=[[(2, 4, 4, 8)], [(2, 4, 4, 2)]])
        definition = dict(atlas=atlas, emitters=[], lookup=[])
        config = SimpleNamespace(definition_orders={"particle": [("ROOT", "Root")]})
        with patch.object(particles, "_parse", return_value=definition):
            result = particles.generate(config, {"compiled/particles/root.compiled": b""})
        source = result["runtime_records"]["compiled/particle-runtime/root.compiled"]
        self.assertIn(struct.pack("<4f2i", .25, .25, .75, .75, 4, 8), source)
        self.assertIn(struct.pack("<4f2i", .125, .5, .375, .75, 4, 2), source)
        self.assertEqual(result["summary"]["rectangle_bytes"], 48)
        self.assertEqual(result["files"], {})

    def test_projectile_static_storage_has_uv_regions_and_loader_retains_size_check(self):
        config = SimpleNamespace(definition_orders={"reanim": [], "particle": []})
        empty = dict(declarations=[], initializers=[], files={}, summary={},
                     attacher_initializers=[], font_bindings=[], font_resets=[])
        projectile = dict(width=8, height=16, regions=[(2, 4, 4, 8)],
                          scales=[1.5], shadows=[(0, 0, 4, 8)])
        reports = {projectile_atlas.PATH: {"atlas_path": "test.atlas.png"}}
        with patch.object(reanimations, "generate", return_value=empty), \
                patch.object(particles, "generate", return_value=empty), \
                patch.object(static_definitions.pak, "parse_projectiles", return_value=projectile):
            files, _ = static_definitions.generate(
                config, {projectile_atlas.PATH: b""}, reports)
        source = files["GeneratedDefinitions.cpp"].decode()
        self.assertIn("{{0.25f, 0.25f, 0.75f, 0.75f, 4, 8},1.5f}", source)
        self.assertIn("{0.0f, 0.0f, 0.5f, 0.5f, 4, 8}", source)
        self.assertNotIn("    8, 16,", source)
        self.assertIn('DefinitionBindAtlasPath(Projectiles.mTexture, 8, 16, "test.atlas.png")',
                      files["GeneratedDefinitionLoading.cpp"].decode())


if __name__ == "__main__":
    unittest.main()
