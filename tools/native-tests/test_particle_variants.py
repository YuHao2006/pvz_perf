"""Compile-time particle image inheritance with synthetic gold and no game assets."""
from __future__ import annotations

import os
import json
from pathlib import Path
import struct
import subprocess
import tempfile
import unittest
import zlib

from test_definition_compiler_sources import particle_gold, particle_source_emitters
COMPILER = os.environ.get("PVZ_RESOURCE_COMPILER") or os.environ.get("PVZ_ATLAS_COMPILER")
BASE = '''export component Base {
 kind: particle; source-name: "base";
 Emitter {
  name: "First"; onDuration: "Second";
  images: ["IMAGE_A", "frame-second.png", "IMAGE_A"];
  imageFrames: 4; animated: 1; additive: 1;
  systemDuration: range { 5 10; };
  particleScale: track { 1,0 Linear 2,100; };
  field { fieldType: Acceleration; x: 5; y: 6; }
 }
 Emitter { image: none; name: "Second"; launchSpeed: 100; }
}'''


def variant(name="Variant", base="Base", image="IMAGE_Z"):
    return (f'export component {name} {{ kind: particle; source-name: "{name.lower()}"; '
            f'variant-of: {base}; images: [["{image}", "variant-middle.png", "{image}"], '
            f'[]]; }}')


@unittest.skipUnless(COMPILER, "Set PVZ_RESOURCE_COMPILER or PVZ_ATLAS_COMPILER")
class ParticleVariantTests(unittest.TestCase):
    def test_production_corpus_strict_counts_and_all_56_parent_references(self):
        root = Path(__file__).resolve().parents[2]
        paths = sorted((root / "assets/definitions/particles").rglob("*.particle.dsl"))
        inputs = self.write("production-inputs.txt", "\n".join(map(str, paths)) + "\n")
        output = self.directory / "production"
        self.run_compiler("compile-particle-v2", "--input-list", inputs, "--output", output,
                          "--gold64", root / "assets/definitions/particle-reference")
        inheritance = json.loads((output / "particle_inheritance.json").read_text())
        self.assertEqual(len(inheritance), 56)
        metadata = json.loads((output / "particle_variants.json").read_text())["roots"]
        self.assertEqual(sum(len(root["variants"]) - 1 for root in metadata.values()), 56)
        for root in metadata.values():
            self.assertEqual(root["variants"][0]["name"], root["name"])
            self.assertEqual([row["index"] for row in root["variants"]], list(range(len(root["variants"]))))
            self.assertEqual([row["name"] for row in root["variants"][1:]],
                             sorted(row["name"] for row in root["variants"][1:]))
        self.assertIn("enum class ZombieBossFireball", (output / "ParticleVariantId.h").read_text())
        for child, parent in inheritance.items():
            self.assertEqual(child, child.lower())
            self.assertEqual(parent, parent.lower())
            self.assertTrue(child.startswith("compiled/particles/"))
            self.assertTrue(parent.startswith("compiled/particles/"))

    def setUp(self):
        temporary = tempfile.TemporaryDirectory(prefix="particle-variants-test-")
        self.addCleanup(temporary.cleanup)
        self.directory = Path(temporary.name)
        self.compiler = Path(COMPILER).resolve()
        self.assertTrue(self.compiler.is_file())

    def write(self, name, text):
        path = self.directory / name
        path.write_text(text, encoding="utf-8")
        return path

    def run_compiler(self, *arguments, ok=True):
        result = subprocess.run([str(self.compiler), *map(str, arguments)],
                                capture_output=True, text=True, encoding="utf-8",
                                errors="replace", timeout=30)
        if ok:
            self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        else:
            self.assertNotEqual(result.returncode, 0, result.stdout + result.stderr)
        return result

    def gold(self):
        directory = self.directory / "gold"
        directory.mkdir(exist_ok=True)
        # First inherits an OnDuration link to Second; retain a nontrivial gold
        # float-track node so copy-by-layout is checked, too.
        payload = bytearray(particle_gold(["First", "Second"]))
        struct.pack_into("<4I", payload, 8 + 24 + 16, 4, 1, 256, 1)
        at = 8 + 24 + 2 * 688
        image_size = struct.unpack_from("<I", payload, at)[0]
        at += 4 + image_size + 4 + len("First")
        payload[at:at + 4] = struct.pack("<I3f2i", 1, 0.25, 5.0, 10.0, 4, 1)
        at += 24
        payload[at:at + 4] = struct.pack("<I", 6) + b"Second"
        # Both field arrays and a particle track contain real gold nodes. These
        # intentionally differ from DSL tracks: production retains gold motion.
        field_at = at + 4 + 6 + 21 * 4
        node = struct.pack("<I3f2i", 1, 0.5, 12.0, 24.0, 3, 2)
        fields = b"".join(struct.pack("<Ii", 40, kind) + bytes(36) + node +
                          struct.pack("<I", 0) for kind in (2, 7))
        struct.pack_into("<I", payload, 8 + 24 + 408, 1)
        struct.pack_into("<I", payload, 8 + 24 + 424, 1)
        payload[field_at:field_at + 8] = fields
        particle_scale_at = field_at + len(fields) + 7 * 4
        payload[particle_scale_at:particle_scale_at + 4] = node
        struct.pack_into("<I", payload, 4, len(payload) - 8)
        (directory / "Base.xml.compiled").write_bytes(payload)
        return directory

    def record(self, path):
        data = path.read_bytes()
        cookie, size, checksum = struct.unpack_from("<3I", data)
        self.assertEqual(cookie, 0xDEADFED8)
        self.assertEqual(size, len(data) - 12)
        self.assertEqual(checksum, zlib.crc32(data[12:]))
        return data[12:]

    def test_variant_matches_explicit_copy_including_tracks_fields_and_all_emitters(self):
        source = self.write("bundle.dsl", variant() + "\n" + BASE)
        reference = self.write("explicit.dsl", BASE.replace("component Base", "component Explicit")
                               .replace('"base"', '"explicit"')
                               .replace('"IMAGE_A"', '"IMAGE_Z"')
                               .replace('"frame-second.png"', '"variant-middle.png"')
                               )
        self.run_compiler("compile-particle", "--input", source,
                          "--output", self.directory / "inherited")
        self.run_compiler("compile-particle", "--input", reference,
                          "--output", self.directory / "explicit")
        inherited = self.directory / "inherited"
        self.assertEqual((inherited / "variant.xml.compiled").read_bytes(),
                         (self.directory / "explicit/explicit.xml.compiled").read_bytes())
        self.run_compiler("compile-particle", "--input", self.write("base.dsl", BASE),
                          "--output", self.directory / "base-only")
        self.assertEqual((inherited / "base.xml.compiled").read_bytes(),
                         (self.directory / "base-only/base.xml.compiled").read_bytes())

    def test_input_list_closure_chains_images_bindings_and_base_bytes(self):
        source = self.write("base.dsl", BASE)
        middle = self.write("middle.dsl", variant("Middle"))
        child = self.write("child.dsl", variant("Child", "Middle", "IMAGE_ZZ"))
        gold = self.gold()
        baseline = self.directory / "baseline"
        self.run_compiler("compile-particle-v2", "--input", source, "--output", baseline,
                          "--gold64", gold, "--verify", gold)
        results = []
        for index, paths in enumerate(((child, middle, source), (source, middle, child))):
            inputs = self.write(f"inputs-{index}.txt", "\n".join(map(str, paths)) + "\n")
            output = self.directory / f"compiled-{index}"
            self.run_compiler("compile-particle-v2", "--input-list", inputs, "--output", output,
                              "--gold64", gold, "--verify", gold)
            self.assertEqual((output / "image_sources.txt").read_text(),
                             "IMAGE_A\nIMAGE_Z\nIMAGE_ZZ\nframe-second.png\nvariant-middle.png\n")
            # Runtime gold payload and emitter names do not depend on image bindings.
            for filename in ("Base.xml.v2.compiled", "ParticleEmitterName.h"):
                self.assertEqual((output / filename).read_bytes(), (baseline / filename).read_bytes())
            payloads = {}
            for filename, expected in (("Base", [[1, 4, 1], []]),
                                       ("middle", [[2, 5, 2], []]),
                                       ("child", [[3, 5, 3], []])):
                payload = self.record(output / f"{filename}.source-record")
                emitters = particle_source_emitters(payload)
                self.assertEqual([e["handles"] for e in emitters], expected)
                self.assertEqual([e["frames"] for e in emitters], [4, 1])
                self.assertEqual([e["animated"] for e in emitters], [1, 0])
                self.assertEqual([e["flags"] for e in emitters], [256, 0])
                self.assertIn(struct.pack("<I2i2f2i", 1, 0, 1, 5, 10, 1, 1),
                              emitters[0]["motion"])
                self.assertNotIn(struct.pack("<I2i2f2i", 1, 1, 2, 12, 24, 3, 2),
                                 emitters[0]["motion"])
                self.assertIn(struct.pack("<I2i2f2i", 1, 0, 1, 6, 6, 1, 1),
                              emitters[0]["motion"])
                self.assertEqual(len(emitters[0]["handles"]), 3)
                self.assertGreater(emitters[0]["frames"], len(emitters[0]["handles"]))
                # Motion, gold scalars, fields, and prelinked metadata survive
                # image sequence replacement exactly, including variant chains.
                body_size = struct.unpack_from("<I", payload, 16)[0]
                payloads[filename] = ([e["motion"] for e in emitters],
                                      payload[20 + body_size:])
            self.assertEqual(payloads["Base"], payloads["middle"])
            self.assertEqual(payloads["Base"], payloads["child"])
            self.assertEqual(json.loads((output / "particle_inheritance.json").read_text()), {
                "compiled/particles/middle.compiled": "compiled/particles/base.compiled",
                "compiled/particles/child.compiled": "compiled/particles/middle.compiled"})
            variants = json.loads((output / "particle_variants.json").read_text())["roots"]
            self.assertEqual({row["name"]: row["index"] for row in
                              variants["compiled/particles/base.compiled"]["variants"]},
                             {"Base": 0, "Child": 1, "Middle": 2})
            results.append({p.name: p.read_bytes() for p in output.iterdir()})
        self.assertEqual(results[0], results[1])

    def test_forward_bundle_resolves_variant_before_imported_base(self):
        self.write("base.dsl", BASE)
        source = self.write("root.dsl", variant() + '\nimport "base.dsl";\n')
        self.run_compiler("compile-particle-v2", "--input", source,
                          "--output", self.directory / "output", "--gold64", self.gold())
        self.assertTrue((self.directory / "output/variant.source-record").is_file())
        self.assertTrue((self.directory / "output/Base.source-record").is_file())

    def test_invalid_variants_fail_before_output(self):
        cases = [
            (variant(base="Missing"), "missing base"),
            (variant("A", "B") + variant("B", "A"), "cycle"),
            (variant("A", "A"), "cycle"),
            (BASE + variant() + variant(), "duplicate"),
            (BASE + variant("Other").replace('"other"', '"BASE"'), "duplicate particle source-name"),
            (BASE + variant().split("images:", 1)[0] + "}", "requires images"),
            (BASE + variant().replace('images:', 'images: []; images:'), "duplicate variant images"),
            (BASE + variant().replace("variant-of: Base;", "variant-of: Base; variant-of: Base;"), "duplicate variant-of"),
            (BASE + variant().replace('variant-of: Base;', 'variant-of: Base; Emitter {}'), "cannot declare Emitter"),
            (variant().replace("variant-of: Base;", ""), "requires variant-of"),
        ]
        gold = self.gold()
        for index, (text, message) in enumerate(cases):
            with self.subTest(message=message, index=index):
                source = self.write(f"bad-{index}.dsl", text)
                output = self.directory / f"bad-output-{index}"
                result = self.run_compiler("compile-particle-v2", "--input", source,
                                           "--output", output, "--gold64", gold, ok=False)
                self.assertIn(message, result.stderr)
                self.assertFalse(output.exists())

    def test_duplicate_components_across_input_files_fail(self):
        first = self.write("first.dsl", BASE)
        second = self.write("second.dsl", BASE)
        inputs = self.write("inputs.txt", f"{first}\n{second}\n")
        output = self.directory / "output"
        result = self.run_compiler("compile-particle-v2", "--input-list", inputs,
                                   "--output", output, "--gold64", self.gold(), ok=False)
        self.assertIn("duplicate particle module", result.stderr)
        self.assertFalse(output.exists())

    def test_production_rejects_removed_grids_and_invalid_image_lists(self):
        images = '["IMAGE_A", "frame-second.png", "IMAGE_A"]'
        cases = [
            (BASE.replace(images, '[""]'), "non-empty source names"),
            (BASE.replace(images, '["bad\\nname"]'), "without line breaks"),
            (BASE.replace(images, "[42]"), "expected string"),
            (BASE.replace(images, "[none]"), "expected string"),
            (BASE.replace(images, '["a",]'), "expected string"),
            (BASE.replace(images, '["a" "b"]'), "expected ']'"),
            (BASE.replace(images, '["a"]; image: "b"'), "duplicate emitter image/images"),
            (BASE.replace("imageFrames: 4;", "imageFrames: 0;"), "imageFrames must be"),
            (BASE.replace("imageFrames: 4;", "imageFrames: 65537;"), "imageFrames must be"),
            (BASE.replace("imageFrames: 4;", "imageFrames: 4.5;"), "32-bit integer"),
            (BASE.replace("imageFrames: 4;", "imageFrames: 2147483648;"), "32-bit integer"),
            (BASE.replace("imageFrames: 4;", "imageFrames: 4; imageRow: 0;"), "legacy-only"),
            (BASE.replace("imageFrames: 4;", "imageFrames: 4; imageCol: 0;"), "legacy-only"),
            (BASE.replace("image: none;", "image: none; rects: [];"), "unknown emitter property"),
            (BASE + variant().replace(', []', ''), "one images list"),
            (BASE + variant().replace(', []', ', ["extra"]'), "images count differs"),
            (BASE + variant().replace('"IMAGE_Z", "variant-middle.png", "IMAGE_Z"', '"IMAGE_Z"'), "images count differs"),
            (BASE + variant().replace("variant-of: Base;", 'variant-of: Base; image: "IMAGE_Z";'), "per-emitter images"),
        ]
        gold = self.gold()
        for index, (text, message) in enumerate(cases):
            with self.subTest(message=message, index=index):
                source = self.write(f"images-bad-{index}.dsl", text)
                output = self.directory / f"images-bad-output-{index}"
                result = self.run_compiler("compile-particle-v2", "--input", source,
                                           "--output", output, "--gold64", gold, ok=False)
                self.assertIn(message, result.stderr)
                self.assertFalse(output.exists())

    def test_empty_lists_and_single_image_shorthand_preserve_gold_logical_count(self):
        source = self.write("empty.dsl", BASE.replace(
            'images: ["IMAGE_A", "frame-second.png", "IMAGE_A"];', 'image: "IMAGE_A";')
            .replace("image: none;", "images: [];") +
            variant().replace('["IMAGE_Z", "variant-middle.png", "IMAGE_Z"]', '["IMAGE_Z"]'))
        output = self.directory / "empty-output"
        self.run_compiler("compile-particle-v2", "--input", source,
                          "--output", output, "--gold64", self.gold())
        base = particle_source_emitters(self.record(output / "Base.source-record"))
        child = particle_source_emitters(self.record(output / "variant.source-record"))
        self.assertEqual([e["handles"] for e in base], [[1], []])
        self.assertEqual([e["handles"] for e in child], [[2], []])
        self.assertEqual([e["frames"] for e in base], [4, 1])
        self.assertEqual([e["motion"] for e in base], [e["motion"] for e in child])


if __name__ == "__main__":
    unittest.main()
