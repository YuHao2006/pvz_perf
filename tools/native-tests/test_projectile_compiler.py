"""Offline projectile DSL frontend: source metadata and author diagnostics."""
from __future__ import annotations

import json
import os
from pathlib import Path
import re
import subprocess
import tempfile
import unittest


ROOT = Path(__file__).resolve().parents[2]
SOURCE = ROOT / "assets/definitions/projectiles/Projectiles.projectile.dsl"
COMPILER = os.environ.get("PVZ_RESOURCE_COMPILER") or os.environ.get("PVZ_ATLAS_COMPILER")
NAMES = [
    "PROJECTILE_PEA", "PROJECTILE_SNOWPEA", "PROJECTILE_CABBAGE", "PROJECTILE_MELON",
    "PROJECTILE_PUFF", "PROJECTILE_WINTERMELON", "PROJECTILE_FIREBALL", "PROJECTILE_STAR",
    "PROJECTILE_SPIKE", "PROJECTILE_BASKETBALL", "PROJECTILE_KERNEL", "PROJECTILE_COBBIG",
    "PROJECTILE_BUTTER", "PROJECTILE_ZOMBIE_PEA",
]
IMAGES = [
    "images/ProjectilePea.png", "images/ProjectileSnowPea.png",
    "reanim/Cabbagepult_cabbage.png", "reanim/Melonpult_melon.png",
    "particles/PuffShroom_puff1.png", "reanim/WinterMelon_projectile.png",
    None, "images/Projectile_star.png", "images/ProjectileCactus.png",
    "reanim/Zombie_catapult_basketball.png", "reanim/Cornpult_kernal.png",
    "reanim/CobCannon_cob.png", "reanim/Cornpult_butter.png", "images/ProjectilePea.png",
]
SCALES = [1, 1, 1, 1, .3, 1, 1, 1, 1, 1.1, .95, .9, .8, 1]


@unittest.skipUnless(COMPILER, "Set PVZ_RESOURCE_COMPILER or PVZ_ATLAS_COMPILER")
class ProjectileCompilerTests(unittest.TestCase):
    def setUp(self):
        self.compiler = Path(COMPILER).resolve()
        self.assertTrue(self.compiler.is_file())
        temporary = tempfile.TemporaryDirectory(prefix="projectile-compiler-test-")
        self.addCleanup(temporary.cleanup)
        self.directory = Path(temporary.name)
        self.source = SOURCE.read_text(encoding="utf-8")

    def compile(self, text, *, success=True):
        source = self.directory / "fixture.projectile.dsl"
        output = self.directory / f"output-{len(list(self.directory.glob('output-*')))}.json"
        source.write_text(text, encoding="utf-8")
        result = subprocess.run(
            [str(self.compiler), "compile-projectile", "--input", str(source), "--output", str(output)],
            capture_output=True, text=True, encoding="utf-8", errors="replace", timeout=30)
        if success:
            self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
            return output.read_bytes()
        self.assertNotEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertFalse(output.exists(), "Invalid DSL must not create metadata")
        self.assertRegex(result.stderr, r"fixture\.projectile\.dsl:\d+:")
        return result.stderr

    def test_shipped_definition_preserves_all_slots_defaults_and_shadow_crops(self):
        data = json.loads(self.compile(self.source))
        self.assertEqual(set(data), {"format", "name", "projectiles", "shadows"})
        self.assertEqual(data["format"], "pvz-projectile-sources-v1")
        self.assertEqual(data["name"], "Projectiles")
        self.assertEqual(data["projectiles"], [
            dict(name=name, image=image, scale=scale)
            for name, image, scale in zip(NAMES, IMAGES, SCALES)])
        self.assertEqual(data["shadows"], [
            dict(name="day", image="images/pea_shadows.png", rect=[0, 0, 21, 9]),
            dict(name="night", image="images/pea_shadows.png", rect=[21, 0, 21, 9])])

    def test_declaration_order_and_comments_do_not_change_output(self):
        blocks = re.findall(r"(?:projectile|shadow)\s+\w+\s*\{[^}]*\}", self.source)
        permuted = "/* definition */\nexport component Projectiles {\n" + "\n".join(reversed(blocks))
        permuted += "\n// kind may appear last\nkind: projectile;\n}\n"
        self.assertEqual(self.compile(self.source), self.compile(permuted))

    def test_paths_are_authored_without_symbol_registry_or_file_lookup(self):
        text = self.source.replace("images/ProjectilePea.png", "custom/NotAProgramSymbol.full.png")
        data = json.loads(self.compile(text))
        self.assertEqual(data["projectiles"][0]["image"], "custom/NotAProgramSymbol.full.png")

    def test_invalid_projectile_slots(self):
        pea = re.search(r"projectile PROJECTILE_PEA\s*\{[^}]*\}", self.source).group()
        variants = [
            (self.source.replace(pea, ""), "missing projectile slot"),
            (self.source.replace(pea, pea + "\n" + pea), "duplicate projectile slot"),
            (self.source.replace("projectile PROJECTILE_PEA", "projectile PROJECTILE_UNKNOWN"), "unknown projectile slot"),
            (self.source.replace('image: none;', 'image: "images/Unexpected.png";'), "FIREBALL image must be none"),
            (self.source.replace('image: "images/ProjectilePea.png";', "image: none;"), "image must be a relative PNG path"),
        ]
        for text, diagnostic in variants:
            with self.subTest(diagnostic=diagnostic):
                self.assertIn(diagnostic, self.compile(text, success=False))

    def test_invalid_shadow_slots_and_crops(self):
        day = re.search(r"shadow day\s*\{[^}]*\}", self.source).group()
        variants = [
            (self.source.replace(day, ""), "missing shadow slot"),
            (self.source.replace(day, day + "\n" + day), "duplicate shadow slot"),
            (self.source.replace("shadow day", "shadow dusk"), "unknown shadow slot"),
            (self.source.replace("[0, 0, 21, 9]", "[0, 0, 0, 9]"), "positive dimensions"),
            (self.source.replace("[0, 0, 21, 9]", "[-1, 0, 21, 9]"), "nonnegative integers"),
            (self.source.replace("[0, 0, 21, 9]", "[0, 0, 1.5, 9]"), "nonnegative integers"),
            (self.source.replace("[0, 0, 21, 9]", "[2147483647, 0, 21, 9]"), "fit runtime"),
        ]
        for text, diagnostic in variants:
            with self.subTest(diagnostic=diagnostic):
                self.assertIn(diagnostic, self.compile(text, success=False))

    def test_scales_must_fit_positive_finite_runtime_float(self):
        for scale in ["0", "-1", "nan", "inf", "1e999", "1e100", "1e-100", '"1"', "1garbage"]:
            with self.subTest(scale=scale):
                text = self.source.replace("scale: 1;", f"scale: {scale};", 1)
                self.assertIn("scale must be", self.compile(text, success=False))
        text = self.source.replace("scale: 1;", "scale: 1.25e-1;", 1)
        self.assertEqual(json.loads(self.compile(text))["projectiles"][0]["scale"], .125)

    def test_unsafe_paths_and_symbol_names_are_rejected(self):
        for path in [
            "../images/Pea.png", "images/../Pea.png", "/images/Pea.png", "C:/images/Pea.png",
            "images//Pea.png", "./images/Pea.png", "IMAGE_PROJECTILEPEA", "17",
            "images/Pea.jpg", "images\\Pea.png", "images/Pea\n.png", "images/Pea\x00.png",
            "images/Pea?.png",
        ]:
            with self.subTest(path=path):
                self.compile(self.source.replace("images/ProjectilePea.png", path), success=False)

    def test_strict_grammar_and_required_properties(self):
        variants = [
            self.source.replace("kind: projectile;", ""),
            self.source.replace("kind: projectile;", "kind: projectile; kind: projectile;"),
            self.source.replace("kind: projectile;", "kind: particle;"),
            self.source.replace("export component Projectiles", "component Projectiles"),
            self.source.replace("export component Projectiles", "export component Other"),
            self.source.replace("scale: 1;", "", 1),
            self.source.replace("scale: 1;", "scale: 1; scale: 2;", 1),
            self.source.replace("scale: 1;", "damage: 20;", 1),
            self.source.replace("scale: 1;", "scale: 1", 1),
            self.source.replace('image: "images/ProjectilePea.png";', "", 1),
            self.source.replace("rect: [0, 0, 21, 9];", ""),
            self.source + "unexpected",
            self.source + "/* unterminated",
            self.source[:-2],
        ]
        for index, text in enumerate(variants):
            with self.subTest(case=index):
                self.compile(text, success=False)

    def test_command_rejects_unknown_duplicate_and_missing_options(self):
        for args in [
            ["--image-registry", "no.bin"],
            ["--input"],
            ["--input", str(SOURCE)],
            ["--input", str(SOURCE), "--input", str(SOURCE), "--output", "unused.json"],
        ]:
            with self.subTest(args=args):
                result = subprocess.run(
                    [str(self.compiler), "compile-projectile", *args], capture_output=True,
                    text=True, encoding="utf-8", errors="replace", timeout=30)
                self.assertEqual(result.returncode, 2, result.stdout + result.stderr)


if __name__ == "__main__":
    unittest.main()
