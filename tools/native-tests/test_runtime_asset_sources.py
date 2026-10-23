"""Relocated AI art keeps its game paths without packaging authoring archives."""
from pathlib import Path
import json
import sys
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "tools"))
import runtime_asset_sources as sources


class RuntimeAssetSourcesTests(unittest.TestCase):
    def setUp(self):
        self.temporary = tempfile.TemporaryDirectory()
        self.addCleanup(self.temporary.cleanup)
        self.root = Path(self.temporary.name).resolve()
        (self.root / "assets/runtime").mkdir(parents=True)
        self.manifest({})

    def file(self, name, data=b"fixture"):
        path = self.root / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_bytes(data)
        return path

    def manifest(self, files):
        self.file(sources.AI_OVERLAY_MANIFEST, json.dumps({
            "format": "pvz-ai-runtime-overlay-v1", "files": files}).encode())

    def test_relocation_preserves_virtual_names_and_exact_payloads(self):
        self.file("assets/runtime/images/Native.png", b"native RGB")
        original = self.file("assets/runtime/images/Generated.png", b"generated PNG bytes")
        baseline = {name: path.read_bytes() for name, path in sources.inventory(self.root).items()}
        target = self.root / sources.AI_RUNTIME_ROOT / "images/Generated.png"
        target.parent.mkdir(parents=True)
        original.rename(target)
        self.manifest({"images/Generated.png": target.relative_to(self.root).as_posix()})
        relocated = sources.inventory(self.root)
        self.assertEqual({name: path.read_bytes() for name, path in relocated.items()}, baseline)
        self.assertEqual(relocated["images/generated.png"], target)
        self.assertFalse(original.exists())

    def test_raw_masters_inputs_prompts_and_unlisted_cooked_files_are_excluded(self):
        self.file("assets/runtime/images/Native.png", b"native")
        for name in ("master.png", "inputs/input.png", "prompts/request.txt",
                     "runtime/images/Unlisted.png"):
            self.file("assets/source-art/ai/" + name)
        self.assertEqual(set(sources.inventory(self.root)), {"images/native.png"})

    def test_duplicate_native_and_overlay_virtual_paths_fail_case_insensitively(self):
        self.file("assets/runtime/images/Shared.png")
        self.file("assets/source-art/ai/runtime/images/shared.png")
        self.manifest({"IMAGES/SHARED.PNG": "assets/source-art/ai/runtime/images/shared.png"})
        with self.assertRaisesRegex(ValueError, "Duplicate runtime asset"):
            sources.inventory(self.root)

    def test_duplicate_overlay_names_and_source_aliases_fail(self):
        first = "assets/source-art/ai/runtime/images/First.png"
        second = "assets/source-art/ai/runtime/images/Second.png"
        self.file(first)
        self.file(second)
        self.manifest({"images/First.png": first, "IMAGES/FIRST.PNG": second})
        with self.assertRaisesRegex(ValueError, "Duplicate runtime asset"):
            sources.inventory(self.root)
        self.manifest({"images/First.png": first, "images/Alias.png": first})
        with self.assertRaisesRegex(ValueError, "Duplicate AI runtime overlay source"):
            sources.inventory(self.root)

    def test_virtual_and_physical_traversal_and_raw_master_mapping_are_rejected(self):
        good = "assets/source-art/ai/runtime/images/Good.png"
        self.file(good)
        for name in ("../escape.png", "/images/escape.png", "C:/escape.png",
                     "images\\escape.png", "images/./escape.png", "images//escape.png"):
            with self.subTest(virtual=name):
                self.manifest({name: good})
                with self.assertRaisesRegex(ValueError, "Invalid runtime asset relative path"):
                    sources.inventory(self.root)
        for source in ("../escape.png", "/escape.png", "C:/escape.png",
                       "assets/source-art/ai/runtime/../raw.png",
                       "assets/source-art/ai/master.png", "assets/runtime/images/Native.png"):
            with self.subTest(source=source):
                self.manifest({"images/Good.png": source})
                with self.assertRaises(ValueError):
                    sources.inventory(self.root)

    def test_missing_manifest_and_mapped_file_fail_instead_of_dropping_art(self):
        (self.root / sources.AI_OVERLAY_MANIFEST).unlink()
        with self.assertRaisesRegex(ValueError, "Missing AI runtime overlay manifest"):
            sources.inventory(self.root)
        self.manifest({"images/Missing.png": "assets/source-art/ai/runtime/images/Missing.png"})
        with self.assertRaisesRegex(ValueError, "Missing AI runtime overlay source"):
            sources.inventory(self.root)

    def test_duplicate_json_keys_and_bad_schema_fail(self):
        path = self.root / sources.AI_OVERLAY_MANIFEST
        path.write_text('{"format":"pvz-ai-runtime-overlay-v1","files":{},"files":{}}')
        with self.assertRaisesRegex(ValueError, "Duplicate runtime overlay JSON key"):
            sources.inventory(self.root)
        for manifest in ({}, [], {"format": "other", "files": {}},
                         {"format": "pvz-ai-runtime-overlay-v1", "files": []}):
            with self.subTest(manifest=manifest):
                path.write_text(json.dumps(manifest))
                with self.assertRaisesRegex(ValueError, "Invalid AI runtime overlay manifest"):
                    sources.inventory(self.root)

    def test_repository_overlay_contains_only_existing_relocated_game_art(self):
        inventory = sources.inventory(ROOT)
        manifest = json.loads((ROOT / sources.AI_OVERLAY_MANIFEST).read_text(encoding="utf-8"))
        for virtual, physical in manifest["files"].items():
            with self.subTest(virtual=virtual):
                self.assertEqual(inventory[virtual.casefold()], ROOT / physical)
                self.assertFalse((ROOT / "assets/runtime" / virtual).exists())
        self.assertNotIn("assets/source-art/ai/common-menu-paper-hires-v1.png", inventory)
        self.assertIn("images/aquarium1.png", inventory)
        self.assertIn("reanim/selectorscreen_bg_right.png", inventory)

    def test_retired_quickplay_art_remains_in_the_source_inventory(self):
        inventory = sources.inventory(ROOT)
        quickplay = {name for name in inventory if name.startswith("images/quickplay_")}
        quickplay.add("images/selector_morewaystoplay_background.png")
        self.assertEqual(len(quickplay), 12)
        for name in quickplay:
            with self.subTest(name=name):
                self.assertIn(name, inventory)
                self.assertGreater(inventory[name].stat().st_size, 0)


if __name__ == "__main__":
    unittest.main()
