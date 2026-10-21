"""Offline resource-preservation guards; no game or production package writes."""
from pathlib import Path
import posixpath
import sys
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import verify_runtime_resources as verify


def records():
    result = {
        slot: ((slot, symbol, 28, 0, 1040, verify.resources.NONE, 0),
               (posixpath.splitext(path)[0], "", "", ""), b"")
        for _, slot, symbol, path, _ in verify.MENU_IMAGES
    }
    for slot, symbol, path in verify.BACK_BUTTONS:
        result[slot] = ((slot, symbol, 28, 0, 1040, verify.resources.NONE, 0),
                        (path, "", "", ""), b"")
    return result


def available():
    return {path for _, _, _, path, _ in verify.MENU_IMAGES} | {
        path + ".png" for _, _, path in verify.BACK_BUTTONS}


class RuntimeResourceGuards(unittest.TestCase):
    def test_original_menu_resources_and_flags_preserved(self):
        verify.check_menu_resources(records(), available())
        self.assertEqual(sum(item[4] for item in verify.MENU_IMAGES), 698774)

    def test_menu_can_be_used_by_compiled_animation(self):
        # Reuse is allowed: this is preservation, not a retired-symbol ban.
        verify.check_compiled_images(records(), {item[2] for item in verify.MENU_IMAGES})

    def test_symbol_remap_fails(self):
        data = records()
        fields, paths, tail = data[100]
        data[100] = ((fields[0], 1944, *fields[2:]), paths, tail)
        with self.assertRaisesRegex(ValueError, "identity or flags"):
            verify.check_menu_resources(data, available())

    def test_noalpha_fails(self):
        data = records()
        fields, paths, tail = data[100]
        data[100] = ((*fields[:4], verify.resources.PALLETIZE, *fields[5:]), paths, tail)
        with self.assertRaisesRegex(ValueError, "identity or flags"):
            verify.check_menu_resources(data, available())

    def test_blank_placeholder_fails(self):
        data = records()
        fields, _, tail = data[100]
        data[100] = (fields, ("images/blank", "", "", ""), tail)
        with self.assertRaisesRegex(ValueError, "original path"):
            verify.check_menu_resources(data, available())

    def test_missing_preserved_menu_image_fails(self):
        files = available() - {verify.MENU_IMAGES[0][3]}
        with self.assertRaisesRegex(ValueError, "Missing preserved menu image"):
            verify.check_menu_resources(records(), files)

    def test_back_button_replaced_fails(self):
        data = records()
        fields, _, tail = data[122]
        data[122] = (fields, ("images/blank", "", "", ""), tail)
        with self.assertRaisesRegex(ValueError, "Active QuickPlay back button"):
            verify.check_menu_resources(data, available())

    def test_missing_back_button_fails(self):
        files = available() - {"images/quickplay_back_button.png"}
        with self.assertRaisesRegex(ValueError, "Missing active back button"):
            verify.check_menu_resources(records(), files)

    def test_compiled_image_without_descriptor_fails(self):
        with self.assertRaisesRegex(ValueError, "Compiled image lacks descriptor"):
            verify.check_compiled_images(records(), {999999})

    def test_compiled_unavailable_image_fails(self):
        data = records()
        fields, paths, tail = data[100]
        data[100] = ((*fields[:4], verify.resources.UNAVAILABLE, *fields[5:]), paths, tail)
        with self.assertRaisesRegex(ValueError, "not loadable"):
            verify.check_compiled_images(data, {1943})

    def test_missing_font_glyph_physical_reference_fails(self):
        with self.assertRaisesRegex(ValueError, "Missing referenced image asset"):
            verify.pak.physical_references("image", "data/HouseofTerror28", available())


if __name__ == "__main__":
    unittest.main()
