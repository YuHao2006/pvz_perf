"""Focused JSON resource build manifest and read-only font audit fixtures."""

from __future__ import annotations

from contextlib import redirect_stderr, redirect_stdout
import io
import json
from pathlib import Path
import struct
import sys
import tempfile
import unittest
from unittest import mock
import zipfile
import zlib


TOOLS = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(TOOLS))
import verify_numeric_fonts as verifier


def node(tag, **attrs):
    return {"tag": tag, "attrs": attrs, "children": []}


def build_manifest(count=20):
    return {"format": "pvz-resources-authoring-v1", "manifest": {
        "tag": "ResourceManifest", "attrs": {}, "children": [
            {"tag": "Resources", "attrs": {"id": "Fixture"}, "children": [
                node("SetDefaults", path="data", idprefix="FONT_"),
                *[node("Font", id=f"F{i:02}", path=f"Font{i:02}.txt") for i in range(count)],
            ]},
        ],
    }}


def encoded(manifest):
    return json.dumps(manifest).encode()


class ResourceBuildManifestTests(unittest.TestCase):
    def setUp(self):
        self.manifest = build_manifest()
        self.nodes = self.manifest["manifest"]["children"][0]["children"]
        self.sources = {f"data/font{i:02}.txt" for i in range(20)}

    def verify(self):
        return verifier.manifest_font_sources(encoded(self.manifest))

    def test_exact_twenty_fonts_from_json(self):
        self.assertEqual(self.verify(), self.sources)

    def test_retail_resource_build_manifest_identifies_twenty_fonts(self):
        data = (TOOLS / "test-data/resources-authoring.json").read_bytes()
        sources = verifier.manifest_font_sources(data)
        self.assertEqual(len(sources), 20)
        self.assertIn("data/briannetod16.txt", sources)
        self.assertIn("data/pix118bold.txt", sources)

    def test_defaults_cross_groups_without_resetting_path_or_idprefix(self):
        group = self.manifest["manifest"]["children"][0]
        self.manifest["manifest"]["children"].append({
            "tag": "Resources", "attrs": {"id": "Second"}, "children": group["children"][11:]})
        group["children"] = group["children"][:11]
        self.assertEqual(self.verify(), self.sources)

    def test_case_and_windows_path_separators_preserve_physical_membership(self):
        self.nodes[0]["attrs"]["path"] = "DATA\\"
        self.nodes[1]["attrs"]["path"] = "FONT00.TXT"
        self.assertEqual(self.verify(), self.sources)

    def test_font_references_and_program_fonts_do_not_add_physical_files(self):
        self.nodes += [
            node("Font", id="ALIAS", path="!ref:FONT_F00"),
            node("Font", id="CHAIN", path="!ref:FONT_ALIAS"),
            node("Font", id="PROGRAM", path="!program"),
            node("Font", id="PROGRAM_ALIAS", path="!ref:FONT_PROGRAM"),
        ]
        self.assertEqual(self.verify(), self.sources)

    def test_reference_can_point_forward_to_a_font(self):
        self.nodes.insert(1, node("Font", id="ALIAS", path="!ref:FONT_F19"))
        self.assertEqual(self.verify(), self.sources)

    def test_reference_uses_declared_idprefix(self):
        self.nodes += [
            node("SetDefaults", idprefix="OTHER_"),
            node("Font", id="ALIAS", path="!ref:FONT_F00"),
            node("Font", id="CHAIN", path="!ref:OTHER_ALIAS"),
        ]
        self.assertEqual(self.verify(), self.sources)

    def test_dangling_font_reference_is_rejected(self):
        self.nodes.append(node("Font", id="ALIAS", path="!ref:FONT_MISSING"))
        with self.assertRaisesRegex(ValueError, "Unknown font reference"):
            self.verify()

    def test_reference_to_image_or_sound_is_rejected(self):
        for kind in ("Image", "Sound"):
            manifest = build_manifest()
            nodes = manifest["manifest"]["children"][0]["children"]
            nodes += [node(kind, id="NOTFONT", path="Other"),
                      node("Font", id="ALIAS", path="!ref:FONT_NOTFONT")]
            with self.subTest(kind=kind), self.assertRaisesRegex(ValueError, "does not name a font"):
                verifier.manifest_font_sources(encoded(manifest))

    def test_reference_cycles_and_self_reference_are_rejected(self):
        for reference in ("FONT_ALIAS", "FONT_CHAIN"):
            manifest = build_manifest()
            nodes = manifest["manifest"]["children"][0]["children"]
            nodes += [node("Font", id="ALIAS", path="!ref:" + reference),
                      node("Font", id="CHAIN", path="!ref:FONT_ALIAS")]
            with self.subTest(reference=reference), self.assertRaisesRegex(ValueError, "Cyclic"):
                verifier.manifest_font_sources(encoded(manifest))

    def test_duplicate_logical_resource_ids_are_rejected(self):
        self.nodes.append(node("Font", id="F00", path="Font00.txt"))
        with self.assertRaisesRegex(ValueError, "Duplicate resource build ID"):
            self.verify()

    def test_missing_or_extra_physical_font_is_rejected(self):
        for count in (19, 21):
            with self.subTest(count=count), self.assertRaisesRegex(ValueError, "exactly 20"):
                verifier.manifest_font_sources(encoded(build_manifest(count)))

    def test_distinct_font_paths_with_colliding_compiled_basename_are_rejected(self):
        self.nodes[2]["attrs"]["path"] = "nested/Font00.txt"
        with self.assertRaisesRegex(ValueError, "basename collision"):
            self.verify()

    def test_system_font_and_unknown_control_tokens_have_no_fallback(self):
        for path in ("!sys:Arial", "!unknown", "!ref:"):
            manifest = build_manifest()
            manifest["manifest"]["children"][0]["children"].append(node("Font", id="EXTRA", path=path))
            with self.subTest(path=path), self.assertRaises(ValueError):
                verifier.manifest_font_sources(encoded(manifest))

    def test_invalid_or_non_dsl_font_paths_are_rejected(self):
        for path in ("../outside.txt", "/outside.txt", "C:/outside.txt", "nested//Font00.txt",
                     "./Font00.txt", "Font00.font.compiled", ""):
            manifest = build_manifest()
            manifest["manifest"]["children"][0]["children"][1]["attrs"]["path"] = path
            with self.subTest(path=path), self.assertRaisesRegex(ValueError, "Invalid font source path"):
                verifier.manifest_font_sources(encoded(manifest))

    def test_non_json_and_xml_input_are_rejected(self):
        for data in (b"", b"<ResourceManifest/>", b'<?xml version="1.0"?><ResourceManifest/>',
                     b"not JSON", b"[]"):
            with self.subTest(data=data), self.assertRaises(ValueError):
                verifier.manifest_font_sources(data)

    def test_duplicate_json_members_are_rejected(self):
        with self.assertRaisesRegex(ValueError, "Duplicate"):
            verifier.manifest_font_sources(
                b'{"format":"pvz-resources-authoring-v1","format":"again","manifest":{}}')

    def test_bad_json_node_types_attributes_and_missing_path_are_rejected(self):
        for change in ("numeric_path", "missing_path", "nested", "unknown_type", "nul"):
            manifest = build_manifest()
            font = manifest["manifest"]["children"][0]["children"][1]
            if change == "numeric_path":
                font["attrs"]["path"] = 10
            elif change == "missing_path":
                del font["attrs"]["path"]
            elif change == "nested":
                font["children"] = [node("Font", path="nested.txt")]
            elif change == "unknown_type":
                font["tag"] = "Other"
            else:
                font["attrs"]["path"] = "a\0b"
            with self.subTest(change=change), self.assertRaises(ValueError):
                verifier.manifest_font_sources(encoded(manifest))

    def test_existing_27_command_and_malformed_numeric_checks_still_pass(self):
        self.assertGreater(verifier.synthetic_commands(), 0)


class FontAuditCliTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.source_dir = self.root / "source/data"
        self.source_dir.mkdir(parents=True)
        self.output = self.root / "stage"
        self.archive = self.root / "source.pak64"
        self.manifest = self.root / "resources-build.json"
        self.manifest.write_bytes(encoded(build_manifest()))
        self.entries = []
        for i in range(20):
            path = f"data/Font{i:02}.txt"
            raw = (
                "Define CharList ('A', 'B');\n"
                f"Define WidthList ({5 + i}, {6 + i});\n"
                "Define RectList ((0, 0, 1, 1), (1, 0, 1, 1));\n"
                "Define OffsetList ((0, 0), (0, 0));\n"
                "Define PairList ('AB',);\n"
                "Define KernList (-1,);\n"
                "CreateLayer Main;\n"
                "LayerSetImage Main 'Glyph';\n"
                "SetDefaultPointSize 12;\n"
                "LayerSetCharWidths Main CharList WidthList;\n"
                "LayerSetImageMap Main CharList RectList;\n"
                "LayerSetCharOffsets Main CharList OffsetList;\n"
                "LayerSetKerningPairs Main PairList KernList;\n"
            ).encode()
            self.entries.append((path, raw))
            (self.source_dir / f"Font{i:02}.txt").write_bytes(raw)
            font = verifier.compiler.FontCompiler(path, raw).run()
            numeric = self.output / verifier.compiler.resolve_compiled_font_path(path)
            numeric.parent.mkdir(parents=True, exist_ok=True)
            numeric.write_bytes(font.encode({}))
        self.make_archive()
        (self.source_dir / "Glyph.png").write_bytes(
            b"\x89PNG\r\n\x1a\n" + struct.pack(">I4sII", 13, b"IHDR", 2, 1))
        properties = self.source_dir.parent / "properties"
        properties.mkdir()
        (properties / "resources.xml").write_bytes(b"Obsolete XML is never read\xff")

    def make_archive(self):
        with zipfile.ZipFile(self.archive, "w") as archive:
            for name, data in self.entries:
                archive.writestr(name, data)

    def run_audit(self, explicit_manifest=True):
        args = ["verify_numeric_fonts.py", "--archive", str(self.archive),
                "--source-dir", str(self.source_dir), "--image-dir", str(self.source_dir),
                "--output-dir", str(self.output)]
        if explicit_manifest:
            args += ["--manifest", str(self.manifest)]
        output = io.StringIO()
        with mock.patch("sys.argv", args), redirect_stdout(output), \
                mock.patch.object(verifier, "verify_windows_glyph_conversion", return_value=3) as windows, \
                mock.patch.object(verifier, "verify_production_guards") as production, \
                mock.patch.object(verifier.compiler, "ROOT", self.root):
            verifier.main()
        windows.assert_called_once()
        self.assertEqual(len(windows.call_args.args[0]), 20)
        production.assert_called_once_with(self.root)
        return output.getvalue()

    def test_explicit_json_manifest_verifies_twenty_exact_fonts_without_writes(self):
        before = {path: path.read_bytes() for path in self.root.rglob("*") if path.is_file()}
        text = self.run_audit()
        self.assertEqual(sum(line.startswith("PASS data/Font") for line in text.splitlines()), 20)
        self.assertIn("fonts=20 layers=20 ASCII-glyphs=40 kerning-pairs=20 original-defines=120", text)
        self.assertEqual({path: path.read_bytes() for path in self.root.rglob("*") if path.is_file()}, before)

    def test_font_compiler_emits_only_clean_paths_and_rejects_legacy_names(self):
        destination = self.root / "fresh-font-compile"
        args = ["compile_numeric_fonts.py", "--archive", str(self.archive),
                "--source-dir", str(self.source_dir), "--output-dir", str(destination)]
        with mock.patch("sys.argv", args), redirect_stdout(io.StringIO()):
            verifier.compiler.main()
        paths = list(destination.rglob("*"))
        files = [p for p in paths if p.is_file()]
        self.assertEqual(len(files), 20)
        self.assertTrue(all(p.parent == destination / "compiled/fonts" and
                            p.suffix == ".compiled" and not p.name.endswith(".font.compiled")
                            for p in files))
        with self.assertRaisesRegex(ValueError, "offline-only"):
            verifier.compiler.resolve_compiled_font_path("compiled/fonts/Font00.font.compiled")

    def test_default_manifest_is_json_not_the_original_source_xml(self):
        default = self.root / "assets/definitions/resources.json"
        default.parent.mkdir(parents=True)
        default.write_bytes(self.manifest.read_bytes())
        self.assertIn("fonts=20", self.run_audit(explicit_manifest=False))

    def test_explicit_manifest_does_not_fall_back_to_default_or_xml(self):
        self.manifest.write_bytes(b"<ResourceManifest/>")
        default = self.root / "assets/definitions/resources.json"
        default.parent.mkdir(parents=True)
        default.write_bytes(encoded(build_manifest()))
        with self.assertRaises(ValueError):
            self.run_audit()

    def test_missing_explicit_manifest_is_not_recovered_from_xml(self):
        self.manifest.unlink()
        with self.assertRaises(FileNotFoundError):
            self.run_audit()

    def test_json_membership_is_compared_as_full_paths_not_only_basenames(self):
        manifest = build_manifest()
        manifest["manifest"]["children"][0]["children"][1]["attrs"]["path"] = "nested/Font00.txt"
        self.manifest.write_bytes(encoded(manifest))
        with self.assertRaisesRegex(ValueError, "corpus paths differ"):
            self.run_audit()

    def test_font_corpus_must_still_contain_twenty_files(self):
        (self.source_dir / "Font19.txt").unlink()
        with self.assertRaisesRegex(ValueError, "corpus must contain exactly 20"):
            self.run_audit()

    def test_invalid_authored_font_source_is_rejected(self):
        (self.source_dir / "Font00.txt").write_bytes(b"different original font bytes")
        with self.assertRaisesRegex(ValueError, "Invalid authored font description"):
            self.run_audit()

    def test_changed_numeric_metrics_are_rejected(self):
        path = self.output / "compiled/fonts/Font00.compiled"
        data = bytearray(path.read_bytes())
        struct.pack_into("<i", data, 16, 13)
        path.write_bytes(data)
        with self.assertRaises(AssertionError):
            self.run_audit()

    def test_equivalent_metrics_with_different_numeric_bytes_are_rejected(self):
        path = self.output / "compiled/fonts/Font00.compiled"
        original = path.read_bytes()
        reader = verifier.Reader(original)
        reader.take("<4Ii3I")
        reader.take("<I")
        reader.path()
        self.assertEqual(reader.take("<I"), 0)
        self.assertEqual(reader.take("<I"), 0)
        reader.take("<22i")
        self.assertEqual(reader.take("<I"), 2)
        begin = reader.pos
        first = reader.take("<I8iI")
        self.assertEqual(first[-1], 1)
        reader.take("<Ii")
        middle = reader.pos
        reader.take("<I8iI")
        end = reader.pos
        data = bytearray(original[:begin] + original[middle:end] + original[begin:middle] + original[end:])
        struct.pack_into("<I", data, 12, zlib.crc32(data[32:]))
        self.assertEqual(verifier.decode_numeric_font(data), verifier.decode_numeric_font(original))
        path.write_bytes(data)
        with self.assertRaises(AssertionError):
            self.run_audit()

    def test_existing_archive_source_and_output_cli_options_are_preserved(self):
        with mock.patch("sys.argv", ["verify_numeric_fonts.py", "--xml", "old.xml"]), \
                redirect_stderr(io.StringIO()), self.assertRaises(SystemExit) as raised:
            verifier.main()
        self.assertEqual(raised.exception.code, 2)


if __name__ == "__main__":
    unittest.main()
