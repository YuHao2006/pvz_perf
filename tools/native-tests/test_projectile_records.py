"""PRJ1 wire, program-binding and package-closure validation without a build."""
from pathlib import Path
import io
import struct
import sys
import tempfile
import unittest
import zipfile

from PIL import Image

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import build_numeric_runtime_pak64 as pak
import verify_compact_image_symbols as compact


def record():
    data = bytearray(struct.pack("<5I", 0x314A5250, 1, 14, 128, 64))
    for index in range(14):
        data.extend(struct.pack("<4if", *((0, 0, 0, 0) if index == 6 else
                                        (2, 2, 10, 12)), 1.0))
    data.extend(struct.pack("<8i", 20, 2, 12, 10, 36, 2, 16, 8))
    return bytes(data)


def changed(data, offset, fmt, *values):
    result = bytearray(data)
    struct.pack_into(fmt, result, offset, *values)
    return bytes(result)


def png(size=(128, 64), mode="RGBA"):
    output = io.BytesIO()
    Image.new(mode, size).save(output, format="PNG")
    return output.getvalue()


class ProjectileRecordTests(unittest.TestCase):
    def reject(self, data):
        with self.assertRaises(ValueError):
            pak.validate_numeric(pak.PROJECTILE_PATH, data, {})

    def test_wire_and_default_atlas_reference(self):
        data = record()
        self.assertEqual(len(data), 332)
        parsed = pak.parse_projectiles(pak.PROJECTILE_PATH, data)
        self.assertEqual((parsed["width"], parsed["height"], parsed["count"]), (128, 64, 14))
        self.assertEqual(parsed["regions"][0], parsed["regions"][13])
        self.assertEqual(parsed["regions"][6], (0, 0, 0, 0))
        self.assertEqual(len(parsed["shadows"]), 2)
        references, image_ids = set(), set()
        self.assertEqual(pak.validate_numeric(pak.PROJECTILE_PATH, data, {}, references,
                                              image_ids=image_ids), set())
        self.assertEqual(image_ids, set())
        self.assertEqual(references, {("atlas", pak.PROJECTILE_ATLAS_PATH)})
        self.assertEqual(pak.physical_references("atlas", pak.PROJECTILE_ATLAS_PATH,
                                               {pak.PROJECTILE_ATLAS_PATH}),
                         {pak.PROJECTILE_ATLAS_PATH})
        with self.assertRaises(ValueError):
            pak.physical_references("atlas", pak.PROJECTILE_ATLAS_PATH, set())

    def test_supplied_binding_and_invalid_bindings(self):
        references = set()
        path = "compiled/atlases/shared.atlas.png"
        pak.validate_numeric(pak.PROJECTILE_PATH, record(), {}, references, atlas_path=path)
        self.assertEqual(references, {("atlas", path)})
        for path in ("", "../escape.atlas.png", "images/projectiles.png", "compiled/a.png"):
            with self.subTest(path=path), self.assertRaises(ValueError):
                pak.validate_numeric(pak.PROJECTILE_PATH, record(), {}, atlas_path=path)

    def test_only_canonical_projectile_record_is_numeric(self):
        self.assertEqual(pak.numeric_kind(pak.PROJECTILE_PATH), "projectiles")
        self.assertEqual(pak.migrated_numeric_path(pak.PROJECTILE_PATH), pak.PROJECTILE_PATH)
        self.assertEqual(pak.migrated_numeric_path(pak.PROJECTILE_ATLAS_PATH),
                         pak.PROJECTILE_ATLAS_PATH)
        for path in ("compiled/projectiles/other.compiled",
                     "compiled/projectiles/projectiles.xml.compiled",
                     "projectiles/projectiles.compiled", pak.PROJECTILE_ATLAS_PATH):
            self.assertIsNone(pak.numeric_kind(path))

    def test_rejects_size_magic_version_count_and_dimensions(self):
        data = record()
        for damaged in (data[:-1], data + b"\0"):
            self.reject(damaged)
        for offset, value in ((0, 0), (4, 2), (8, 13), (8, 15),
                              (12, 0), (16, 0), (12, 0x80000000), (16, 0xFFFFFFFF)):
            with self.subTest(offset=offset, value=value):
                self.reject(changed(data, offset, "<I", value))

    def test_rejects_missing_extrusion_nonpositive_and_overflowing_rectangles(self):
        for offset in (20 + 20, 300, 316):
            for rect in ((1, 2, 10, 10), (2, 1, 10, 10), (-1, 2, 10, 10),
                         (2, 2, 0, 10), (2, 2, 10, -1), (117, 2, 10, 10),
                         (2, 53, 10, 10), (0x7FFFFFFF, 2, 1, 1)):
                with self.subTest(offset=offset, rect=rect):
                    self.reject(changed(record(), offset, "<4i", *rect))

    def test_fireball_is_exactly_empty_and_other_slots_are_nonempty(self):
        for index in range(14):
            with self.subTest(index=index):
                rect = (2, 2, 1, 1) if index == 6 else (0, 0, 0, 0)
                self.reject(changed(record(), 20 + 20 * index, "<4i", *rect))
        self.reject(changed(record(), 20 + 20 * 6, "<4i", 1, 0, 0, 0))

    def test_scales_are_finite_and_positive_including_fireball(self):
        for index in range(14):
            for scale in (0.0, -0.0, -1.0, float("inf"), float("-inf"), float("nan")):
                with self.subTest(index=index, scale=scale):
                    self.reject(changed(record(), 36 + 20 * index, "<f", scale))

    def test_zombie_pea_can_have_a_distinct_source(self):
        data = changed(record(), 20 + 20 * 13, "<4i", 18, 2, 10, 12)
        parsed = pak.parse_projectiles(pak.PROJECTILE_PATH, data)
        self.assertNotEqual(parsed["regions"][0], parsed["regions"][13])
        self.assertEqual(pak.validate_numeric(pak.PROJECTILE_PATH, data, {}), set())

    def test_png_matches_record_dimensions_and_rgba(self):
        parsed = pak.parse_projectiles(pak.PROJECTILE_PATH, record())
        pak.validate_projectile_atlas_image(parsed, png(), pak.PROJECTILE_ATLAS_PATH)
        for data in (png((127, 64)), png(mode="RGB")):
            with self.assertRaises(ValueError):
                pak.validate_projectile_atlas_image(parsed, data, pak.PROJECTILE_ATLAS_PATH)

    def test_count_opt_in_preserves_historical_roots(self):
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            self.assertNotIn("projectiles", pak.expected_counts(root))
            path = root / "assets/definitions/projectiles/Projectiles.projectile.dsl"
            path.parent.mkdir(parents=True)
            path.touch()
            self.assertEqual(pak.expected_counts(root)["projectiles"], 1)

    def test_generated_binding_requires_variant_zero(self):
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            path = root / "pvzPerf/Sexy.TodLib/generated/DefinitionImageBindings.h"
            path.parent.mkdir(parents=True)
            path.write_text('{"' + pak.PROJECTILE_PATH + '", 0, "' +
                            pak.PROJECTILE_ATLAS_PATH + '"},\n', encoding="utf-8")
            self.assertEqual(pak.read_definition_image_binding_rows(root),
                             {pak.PROJECTILE_PATH: [pak.PROJECTILE_ATLAS_PATH]})
            self.assertEqual(pak.expected_counts(root)["projectiles"], 1)
            path.write_text(path.read_text().replace('", 0, "', '", 1, "'), encoding="utf-8")
            with self.assertRaises(ValueError):
                pak.read_definition_image_binding_rows(root)

    def test_legacy_image_symbol_compactor_rejects_projectile_kind(self):
        with self.assertRaisesRegex(ValueError, "no image-symbol fields"):
            compact.parse_record(record(), "projectiles", "fixture", 999)

    def test_package_stages_and_repackages_projectile_record_and_atlas(self):
        # Reuse the frozen archive fixture; all publications stay in its temp root.
        import test_numeric_runtime_pak64 as fixtures
        fixture = fixtures.NumericRuntimePak64Tests()
        fixture.setUp()
        self.addCleanup(fixture.doCleanups)
        fixture.build()
        fixture.write(fixture.stage / pak.PROJECTILE_PATH, record())
        fixture.write(fixture.stage / pak.PROJECTILE_ATLAS_PATH, png())
        binding = fixture.root / "pvzPerf/Sexy.TodLib/generated/DefinitionImageBindings.h"
        fixture.write(binding, ('{"' + pak.PROJECTILE_PATH + '", 0, "' +
                                pak.PROJECTILE_ATLAS_PATH + '"},\n').encode())
        candidate = fixture.base / "projectiles.pak64"
        result = fixtures.pak.build(fixture.output, fixture.stage, candidate, fixture.root,
                                    replace_definitions=True)
        self.assertEqual(result["numeric_counts"]["projectiles"], 1)
        self.assertEqual(result["numeric_file_references"][pak.PROJECTILE_PATH],
                         [pak.PROJECTILE_ATLAS_PATH])
        with zipfile.ZipFile(candidate) as archive:
            self.assertEqual(archive.read(pak.PROJECTILE_PATH), record())
            self.assertEqual(archive.read(pak.PROJECTILE_ATLAS_PATH), png())
        repacked = fixture.base / "projectiles-repacked.pak64"
        fixtures.pak.build(candidate, fixture.stage, repacked, fixture.root,
                           replace_definitions=True)
        fixture.write(fixture.stage / pak.PROJECTILE_ATLAS_PATH, png((128, 63)))
        with self.assertRaisesRegex(ValueError, "projectile atlas image"):
            fixtures.pak.build(candidate, fixture.stage, fixture.base / "bad-size.pak64",
                               fixture.root, replace_definitions=True)
        (fixture.stage / pak.PROJECTILE_ATLAS_PATH).unlink()
        with self.assertRaisesRegex(ValueError, "Missing staged projectile atlas"):
            fixtures.pak.build(candidate, fixture.stage, fixture.base / "missing.pak64",
                               fixture.root, replace_definitions=True)


if __name__ == "__main__":
    unittest.main()
