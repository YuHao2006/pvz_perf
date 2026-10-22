"""Program-owned image IDs must preserve the historical numeric resource ABI."""
from pathlib import Path
import sys
import tempfile
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import compile_numeric_resources as resources

ROOT = Path(__file__).resolve().parents[2]


class ProgramImageSymbolsTests(unittest.TestCase):
    def test_program_header_preserves_all_historical_ids_spellings_and_crc(self):
        actual = resources.read_symbols(resources.program_symbols_path(ROOT))
        historical = resources.read_symbols(
            ROOT / "pvzPerf/Sexy.TodLib/generated/image_symbol_ids.bin")
        self.assertEqual(actual, historical)
        self.assertEqual(len(actual[0]), 2287)
        self.assertEqual(actual[1], 0x3AC4FECD)
        self.assertEqual(actual[0][1042], (1043, "IMAGE_REANIM_TANGLEKELP_ARM 8"))
        self.assertEqual(actual[0][1153], (1154, "IMAGE_REANIM_ZENGARDEN-WATERINGCAN4"))

    def test_program_declarations_do_not_count_as_code_resource_uses(self):
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            library = root / "pvzPerf/Sexy.TodLib"
            library.mkdir(parents=True)
            header = library / "ProgramImageSymbols.h"
            header.write_text("enum class ImageSymbolId : std::uint32_t {\n"
                              "    IMAGE_DECLARED = 1,\n    IMAGE_USED = 2,\n};\n")
            (library / "consumer.cpp").write_text("auto image = ImageSymbolId::IMAGE_USED;\n")
            self.assertEqual(resources.code_image_roots(
                root, {1: "IMAGE_DECLARED", 2: "IMAGE_USED"}), {"IMAGE_USED"})

    def test_non_dense_header_is_rejected(self):
        with tempfile.TemporaryDirectory() as temporary:
            header = Path(temporary) / "Symbols.h"
            header.write_text("enum class ImageSymbolId : std::uint32_t {\n"
                              "    None = 0,\n    IMAGE_GAP = 2,\n};\n")
            with self.assertRaisesRegex(ValueError, "dense"):
                resources.read_symbols(header)

    def test_declared_crc_mismatch_is_rejected(self):
        with tempfile.TemporaryDirectory() as temporary:
            header = Path(temporary) / "Symbols.h"
            header.write_text("enum class ImageSymbolId : std::uint32_t {\n"
                              "    None = 0,\n    IMAGE_ONE = 1,\n};\n"
                              "constexpr unsigned IMAGE_SYMBOL_ID_REGISTRY_CRC = 0u;\n")
            with self.assertRaisesRegex(ValueError, "CRC"):
                resources.read_symbols(header)


if __name__ == "__main__":
    unittest.main()
