"""Offline retirement guards; no game, compiler or production package writes."""
from pathlib import Path
import sys
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import verify_runtime_resources as verify


def records():
    result = {
        slot: ((slot, symbol, 28, 0, verify.resources.PALLETIZE,
                verify.resources.NONE, 0), ("images/blank", "", "", ""), b"")
        for _, slot, symbol, _, _ in verify.RETIRED
    }
    for slot, symbol, path in verify.BACK_BUTTONS:
        result[slot] = ((slot, symbol, 28, 0, 1040, verify.resources.NONE, 0),
                        (path, "", "", ""), b"")
    return result


class RetirementGuards(unittest.TestCase):
    def test_valid_stable_blank_descriptors(self):
        verify.check_retired_descriptors(records(), set())
        self.assertEqual(sum(item[4] for item in verify.RETIRED), 698774)

    def test_compiled_reference_revival_fails(self):
        with self.assertRaisesRegex(ValueError, "Compiled animation/particle revived"):
            verify.check_retired_descriptors(records(), {verify.RETIRED[0][2]})

    def test_symbol_remap_fails(self):
        data = records()
        fields, paths, tail = data[100]
        data[100] = ((fields[0], 1944, *fields[2:]), paths, tail)
        with self.assertRaisesRegex(ValueError, "identity or flags"):
            verify.check_retired_descriptors(data, set())

    def test_alpha_reenabled_fails(self):
        data = records()
        fields, paths, tail = data[100]
        data[100] = ((*fields[:4], 1040, *fields[5:]), paths, tail)
        with self.assertRaisesRegex(ValueError, "identity or flags"):
            verify.check_retired_descriptors(data, set())

    def test_back_button_replaced_fails(self):
        data = records()
        fields, _, tail = data[122]
        data[122] = (fields, ("images/blank", "", "", ""), tail)
        with self.assertRaisesRegex(ValueError, "Active QuickPlay back button"):
            verify.check_retired_descriptors(data, set())

    def test_comments_and_string_identifiers_do_not_revive(self):
        verify.check_cpp_text(
            '// IMAGE_QUICKPLAY_MINIGAMES_BUTTON\n'
            'const char* hint = "IMAGE_QUICKPLAY_MINIGAMES_BUTTON";\n'
            '#if 0\nuse(IMAGE_QUICKPLAY_MINIGAMES_BUTTON);\n#endif\n', "fixture.cpp")

    def test_unknown_preprocessor_branch_and_resource_id_revive(self):
        with self.assertRaisesRegex(ValueError, "Retired menu symbol"):
            verify.check_cpp_text(
                '#if FUTURE_MENU\nload(ResourceId::IMAGE_QUICKPLAY_MINIGAMES_BUTTON_ID);'
                '\n#endif\n', "fixture.cpp")

    def test_physical_literal_revives(self):
        with self.assertRaisesRegex(ValueError, "Retired menu path"):
            verify.check_cpp_text(
                'load("images/quickplay_minigames_button.png");', "fixture.cpp")

    def test_compiled_symbol_token_revives(self):
        with self.assertRaisesRegex(ValueError, "Retired menu symbol"):
            verify.check_cpp_text(
                'load(ImageSymbolId::IMAGE_SELECTORSCREEN_MOREWAYSTOPLAY_BG);', "fixture.cpp")


if __name__ == "__main__":
    unittest.main()
