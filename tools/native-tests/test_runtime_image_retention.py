"""Production keeps consumed image descriptors; source-only QuickPlay art remains available."""
from pathlib import Path
import re
import struct
import sys
import unittest
import zlib

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "tools"))
import build_numeric_runtime_pak64 as pak
import compile_numeric_fonts as fonts
import compile_numeric_resources as resources
import runtime_asset_sources


class RuntimeImageRetentionTests(unittest.TestCase):
    def test_retention_selects_only_code_and_excludes_retired_menu_art(self):
        names = ["IMAGE_UNUSED", "IMAGE_QUICKPLAY_CLOUD", "IMAGE_CODE"]
        self.assertEqual(resources.production_image_roots(names, {"IMAGE_CODE"}),
                         {"IMAGE_CODE"})
        self.assertEqual(resources.production_image_roots(names, set(names)),
                         {"IMAGE_UNUSED", "IMAGE_CODE"})

    def test_unregistered_code_root_is_rejected(self):
        with self.assertRaisesRegex(ValueError, "absent from declarations"):
            resources.production_image_roots(["IMAGE_ONE"], {"IMAGE_MISSING"})

    @classmethod
    def setUpClass(cls):
        cls.files = runtime_asset_sources.inventory(ROOT)
        cls.names = resources.read_names(ROOT)
        cls.code = resources.code_image_roots(ROOT, cls.names)
        cls.retained = resources.production_image_roots(cls.names, cls.code)
        cls.fonts = fonts.load_corpus(ROOT / "assets/definitions/fonts")
        cls.tags = fonts.tag_registry(cls.fonts)
        cls.data, cls.plan, _, _ = resources.compile_manifest(
            ROOT, (ROOT / "assets/definitions/resources.json").read_bytes(), list(cls.files),
            cls.names, cls.tags)

    def test_actual_descriptors_are_exactly_code_without_quickplay_art(self):
        observed = {record["name"] for group in self.plan for record in group["records"]
                    if record["kind"] == 0}
        self.assertEqual(observed, self.retained)
        quickplay_files = {path for path in self.files if path.startswith("images/quickplay_")}
        quickplay_files.add("images/selector_morewaystoplay_background.png")
        self.assertEqual(len(quickplay_files), 12)
        self.assertTrue(quickplay_files <= set(self.files))
        self.assertFalse(any(resources.excluded_image(name) for name in observed))
        unused = {
            "FONT_IMAGE_HOUSEOFTERROR28", "IMAGE_POOL_NIGHT", "IMAGE_WHITEWATER",
            "IMAGE_ZOMBATAR_ACCEPT_BUTTON", "IMAGE_ZOMBATAR_ACCEPT_BUTTON_HIGHLIGHT",
            "IMAGE_ZOMBATAR_ACCESSORY_7", "IMAGE_ZOMBATAR_BEGIN_BUTTON",
            "IMAGE_ZOMBATAR_BEGIN_BUTTON_HIGHLIGHT", "IMAGE_ZOMBATAR_COLORPICKER_HIGHLIGHT",
            "IMAGE_ZOMBATAR_COLORS_BG_SMALL", "IMAGE_ZOMBATAR_TOS_ARROW",
            "IMAGE_ZOMBATAR_TOS_SLIDER", "IMAGE_ZOMBATAR_TOS_SLIDER_THUMB", "IMAGE_ZOMBATAR_TRIPTYCH",
        }
        self.assertFalse(unused & observed)
        self.assertFalse(unused & set(self.names))
        self.assertEqual(set(self.names), self.retained)
        bindings = (ROOT / "pvzPerf/Sexy.TodLib/generated/NumericResourceBindings.h").read_text("utf-8")
        expected_images = int(re.search(r"RESOURCE_LOAD_IMAGE_COUNT\s*=\s*(\d+)", bindings)[1])
        expected_records = int(re.search(r"RESOURCE_LOAD_PLAN_RECORD_COUNT\s*=\s*(\d+)", bindings)[1])
        self.assertEqual(len(observed), expected_images)
        self.assertEqual(sum(len(group["records"]) for group in self.plan), expected_records)
        self.assertEqual(struct.unpack_from("<2I", self.data), (resources.MAGIC, 4))
        image_records = [record for record in pak.resource_records(self.data)
                         if record[2][0] == 0]
        self.assertEqual(len(image_records), expected_images)
        self.assertTrue(all(len(record[4]) == 4 for record in image_records))

    def test_font_bitmap_closure_survives_without_the_unused_font_image_global(self):
        self.assertNotIn("FONT_IMAGE_HOUSEOFTERROR28", self.retained)
        references = set()
        for font in self.fonts:
            name = fonts.resolve_compiled_font_path(font.source_path).casefold()
            pak.validate_numeric(name, font.encode(self.tags), {}, references)
        self.assertIn(("image", "data/HouseofTerror28"), references)
        available = set(self.files)
        physical = set().union(*(pak.physical_references(kind, path, available)
                                 for kind, path in references))
        self.assertTrue(any("houseofterror28" in path for path in physical))
        self.assertTrue(physical <= available)
        self.assertFalse(any(path.startswith("particles/frames/") for path in physical))


if __name__ == "__main__":
    unittest.main()
