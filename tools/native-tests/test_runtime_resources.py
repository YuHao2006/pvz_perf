"""Read-only guards for retired menu source art and symbol-free runtime records."""
from pathlib import Path
import posixpath
import sys
import tempfile
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import verify_runtime_resources as verify


def menu_files():
    return {path for _, _, path, _ in verify.MENU_IMAGES} | {
        path + ".png" for _, path in verify.BACK_BUTTONS}

def records(path="images/live"):
    return {(1, 0): (1, (0, verify.resources.PALLETIZE | verify.resources.AUTO_ALPHA,
                             0, verify.resources.NONE), (path, "", "", ""), b"")}


class RuntimeResourceGuards(unittest.TestCase):
    def setUp(self):
        temporary = tempfile.TemporaryDirectory()
        self.addCleanup(temporary.cleanup)
        self.root = Path(temporary.name)
        for name in menu_files():
            path = self.root / "assets/runtime" / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_bytes(b"source-only test fixture")

    def test_original_menu_source_paths_preserved_without_runtime_descriptors(self):
        verify.check_menu_resources(records(), {"images/live.png"}, self.root)
        self.assertEqual(len(menu_files()), 12)
        self.assertEqual(sum(item[3] for item in verify.MENU_IMAGES), 698774)

    def test_retired_menu_file_in_package_fails(self):
        for name in menu_files():
            with self.subTest(name=name), self.assertRaisesRegex(ValueError, "remains packaged"):
                verify.check_menu_resources(records(), {name}, self.root)

    def test_retired_menu_load_descriptor_fails(self):
        for name in menu_files():
            with self.subTest(name=name), self.assertRaisesRegex(ValueError, "load descriptor"):
                verify.check_menu_resources(records(posixpath.splitext(name)[0]), set(), self.root)

    def test_missing_preserved_source_image_fails(self):
        name = next(iter(menu_files()))
        (self.root / "assets/runtime" / name).unlink()
        with self.assertRaisesRegex(ValueError, "Missing preserved QuickPlay source image"):
            verify.check_menu_resources(records(), set(), self.root)

    def test_production_definitions_have_no_global_image_ids(self):
        verify.check_compiled_images(records(), set())
        with self.assertRaisesRegex(ValueError, "must not contain global image IDs"):
            verify.check_compiled_images(records(), {1})

    def test_missing_font_glyph_physical_reference_fails(self):
        with self.assertRaisesRegex(ValueError, "Missing referenced image asset"):
            verify.pak.physical_references("image", "data/HouseofTerror28", set())


if __name__ == "__main__":
    unittest.main()
