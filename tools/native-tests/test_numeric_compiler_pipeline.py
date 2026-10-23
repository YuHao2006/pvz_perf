"""Fixtures for compiler naming, production overlays and candidate-only publication."""

import importlib.util
from pathlib import Path
import shutil
import struct
import sys
from types import SimpleNamespace
import unittest
from unittest import mock
import zipfile
import zlib

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import build_numeric_runtime_pak64 as pak
import stage_runtime_package as stage
import verify_numeric_compiler as compiler_check
import test_numeric_runtime_pak64 as fixtures
pak = fixtures.pak  # Explicit historical NRSC1 fixtures; production uses NRSC4.


class NumericCompilerPipelineTests(unittest.TestCase):
    def setUp(self):
        self.fixture = fixtures.NumericRuntimePak64Tests()
        self.fixture.setUp()
        self.addCleanup(self.fixture.doCleanups)
        self.fixture.build()
        self.source = self.fixture.output
        self.base = self.fixture.base
        self.outputs = {}
        for kind in ("reanim", "particles"):
            directory = self.base / ("compiler-" + kind)
            directory.mkdir()
            for path in (self.fixture.stage / "compiled" / kind).glob("*.compiled"):
                shutil.copyfile(path, directory / path.name)
            self.outputs[kind] = directory

    def test_direct_compiler_outputs_match_all_production_bytes(self):
        for kind, count in (("reanim", 146), ("particles", 106)):
            report = compiler_check.verify_output(self.source, self.outputs[kind], kind)
            self.assertEqual(report["production_records"], count)
            self.assertTrue(report["all_production_payloads_byte_identical"])

    def test_old_executable_names_are_rejected_without_renaming(self):
        for kind, suffix in (("reanim", ".reanim.v4.compiled"),
                             ("particles", ".xml.v4.compiled")):
            path = next(self.outputs[kind].glob("*.compiled"))
            path.rename(path.with_name(path.stem + suffix))
            with self.subTest(kind=kind), self.assertRaisesRegex(ValueError, "directly"):
                compiler_check.verify_output(self.source, self.outputs[kind], kind)

    def test_compiler_payload_changes_are_rejected_by_rename_verifier(self):
        target = self.outputs["particles"] / "asset000.compiled"
        target.write_bytes(fixtures.particle(2))
        with self.assertRaisesRegex(ValueError, "payload changed"):
            compiler_check.verify_output(self.source, self.outputs["particles"], "particles")

    def test_only_six_known_compiler_particle_fixtures_are_excluded_from_package(self):
        for name in stage.PARTICLE_COMPILER_FIXTURES:
            (self.outputs["particles"] / name).write_bytes(fixtures.particle())
        report = compiler_check.verify_output(self.source, self.outputs["particles"], "particles")
        self.assertEqual(len(report["compiler_only_fixtures"]), 6)
        destination = self.base / "new-stage"
        result = stage.stage_runtime(self.source, destination, self.outputs)
        self.assertEqual(result["compiler_replacements"], {"reanim": 146, "particles": 106})
        self.assertEqual(len(list((destination / "compiled/particles").glob("*"))), 106)
        (self.outputs["particles"] / "Unknown.compiled").write_bytes(fixtures.particle())
        with self.assertRaisesRegex(ValueError, "Unexpected compiler"):
            stage.stage_runtime(self.source, self.base / "rejected-stage", self.outputs)
        self.assertFalse((self.base / "rejected-stage").exists())

    def test_missing_compiler_record_never_falls_back_to_existing_package(self):
        (self.outputs["particles"] / "asset000.compiled").unlink()
        with self.assertRaisesRegex(ValueError, "missing runtime record"):
            stage.stage_runtime(self.source, self.base / "missing-stage",
                                {"particles": self.outputs["particles"]})

    def test_changed_definition_requires_explicit_rebuild_and_updates_only_candidate(self):
        original = pak.fingerprint(self.source)
        updated = fixtures.particle(2)
        (self.outputs["particles"] / "asset000.compiled").write_bytes(updated)
        destination = self.base / "new-stage"
        stage.stage_runtime(self.source, destination, {"particles": self.outputs["particles"]})
        output = self.base / "updated.pak64"
        with self.assertRaisesRegex(ValueError, "collision"):
            pak.build(self.source, destination, output, self.fixture.root)
        result = pak.build(self.source, destination, output, self.fixture.root,
                           replace_definitions=True)
        self.assertEqual(pak.fingerprint(self.source), original)
        self.assertEqual(len(result["removed"]), 1)
        self.assertEqual(result["removed"][0]["reason"], "numeric_record_rebuild")
        self.assertEqual(len(result["added"]), 1)
        with zipfile.ZipFile(output) as archive:
            self.assertEqual(archive.read("compiled/particles/asset000.compiled"), updated)
            self.assertEqual(sum(pak.numeric_kind(n) == "particles" for n in archive.namelist()), 106)

    def test_definition_rebuild_flag_does_not_allow_other_asset_replacement(self):
        destination = self.base / "new-stage"
        stage.stage_runtime(self.source, destination)
        target = destination / "compiled/fonts/Font00.compiled"
        target.write_bytes(fixtures.font("data/glyph.png"))
        with self.assertRaisesRegex(ValueError, "collision"):
            pak.build(self.source, destination, self.base / "invalid.pak64", self.fixture.root,
                      replace_definitions=True)

    def test_existing_verifier_output_directory_is_untouched(self):
        destination = self.base / "existing"
        destination.mkdir()
        marker = destination / "user.txt"
        marker.write_bytes(b"user data")
        with mock.patch.object(sys, "argv", [
                "verify_numeric_compiler.py", "--root", str(self.fixture.root),
                "--compiler", str(self.source), "--source-pak", str(self.source),
                "--output", str(destination)]):
            self.assertEqual(compiler_check.main(), 1)
        self.assertEqual(list(destination.iterdir()), [marker])


class ParticleVerifierNamesTests(unittest.TestCase):
    def setUp(self):
        self.temp = fixtures.tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        path = Path(__file__).resolve().parents[1] / "verify-particle-emitter-corpus.py"
        spec = importlib.util.spec_from_file_location("particle_verifier", path)
        self.verifier = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(self.verifier)
        registry = struct.pack("<2I", 0x4953594D, 0)
        self.registry = self.root / "images.bin"
        self.registry.write_bytes(registry)
        old = struct.pack("<2I", 0x33504449, 3767703017) + bytes(16) + struct.pack("<2I", 688, 0)
        (self.root / "Empty.xml.v2.compiled").write_bytes(fixtures.envelope(0xDEADFED7, old))
        new = struct.pack("<9I", 0x35504449, zlib.crc32(registry), 0, 0, 0,
                          0x33544449, 0, 0x35544449, 0)
        self.record = self.root / "Empty.compiled"
        self.record.write_bytes(fixtures.envelope(0xDEADFED8, new))
        (self.root / "ParticleEmitterName.h").write_text(
            "enum class ParticleEmitterName { unnamed = 0, top = 1 };\n"
            "struct ParticleEmitterNameRange {};\n", encoding="utf-8")

    def verify(self):
        return self.verifier.verify(SimpleNamespace(
            gold_v2=self.root, compiled=self.root, image_registry=self.registry,
            output=self.root / "verification.json"))

    def test_clean_output_is_verified_against_frozen_v2_filename(self):
        self.assertEqual(self.verify()["records"], 1)

    def test_old_numeric_suffix_is_rejected(self):
        self.record.rename(self.root / "Empty.xml.v4.compiled")
        with self.assertRaisesRegex(ValueError, "Non-production"):
            self.verify()

    def test_empty_gold_never_reports_a_vacuous_pass(self):
        (self.root / "Empty.xml.v2.compiled").unlink()
        with self.assertRaisesRegex(ValueError, "No offline"):
            self.verify()

    def test_compiler_probe_rejects_stale_binary_and_accepts_clean_contract(self):
        def usage(text):
            def invoke(*args, **kwargs):
                kwargs["stdout"].write(text.encode())
                return SimpleNamespace(returncode=2)
            return invoke
        with mock.patch.object(compiler_check.subprocess, "run",
                               side_effect=usage("<Module>.reanim.v2.compiled")):
            with self.assertRaisesRegex(ValueError, "predates"):
                compiler_check.probe_compiler(self.root / "compiler.exe", self.root / "old.log")
        with mock.patch.object(compiler_check.subprocess, "run",
                               side_effect=usage("<Module>.compiled <name>.compiled")):
            compiler_check.probe_compiler(self.root / "compiler.exe", self.root / "new.log")


if __name__ == "__main__":
    unittest.main()
