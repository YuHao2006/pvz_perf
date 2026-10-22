"""Build-only exact solver certificates, incumbent preservation and cache tests."""
from __future__ import annotations

import copy
import importlib.util
import json
from pathlib import Path
import sys
import tempfile
import unittest
from unittest import mock

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import definition_atlas
import exact_atlas


SIZES = [(56, 96), (36, 56), (36, 36)]


def native(sizes=SIZES, padding=2):
    result = definition_atlas.shelf_layout(sizes, padding)
    result.update(method="native-maxrects", shelf_area=result["width"] * result["height"],
                  search_attempts=23, search_microseconds=71)
    return result


class ExactAtlasTests(unittest.TestCase):
    def test_empty_and_single_are_proven_without_loading_solver(self):
        batches = [[], [(7, 11)]]
        with mock.patch.object(exact_atlas, "_cp_api", side_effect=AssertionError("unnecessary solver")):
            results = exact_atlas.optimize_layouts(batches, [native(b) for b in batches])
        for result in results:
            self.assertEqual(result["exact"]["status"], "LOWER_BOUND_PROVEN")
            self.assertTrue(result["exact"]["optimal"])
            self.assertEqual(result["exact"]["gap"], 0)
            self.assertEqual(result["exact"]["best_bound"], result["width"] * result["height"])

    def test_zero_budget_preserves_incumbent_and_marks_unknown(self):
        initial = native()
        before = copy.deepcopy(initial)
        result = exact_atlas.optimize_layouts([SIZES], [initial], time_limit_seconds=0,
                                              require_optimal=False)[0]
        self.assertEqual(initial, before)
        self.assertEqual(result["regions"], initial["regions"])
        self.assertEqual(result["method"], "native-maxrects")
        self.assertEqual(result["exact"]["status"], "UNKNOWN")
        self.assertFalse(result["exact"]["optimal"])
        self.assertGreater(result["exact"]["gap"], 0)

    def test_feasible_status_remains_explicitly_unproven(self):
        with mock.patch.object(exact_atlas, "_solve",
                               return_value=(native(), "FEASIBLE", 10000, False)):
            result = exact_atlas.optimize_layouts([SIZES], [native()], require_optimal=False)[0]
        self.assertEqual(result["exact"]["status"], "FEASIBLE")
        self.assertFalse(result["exact"]["optimal"])
        self.assertAlmostEqual(result["exact"]["gap"], 1 / 6)

    def test_cache_reuse_skips_solver_and_preserves_unproven_status(self):
        with tempfile.TemporaryDirectory() as directory:
            cache = Path(directory)
            first = exact_atlas.optimize_layouts([SIZES], [native()], cache=cache,
                                                 time_limit_seconds=0, require_optimal=False)[0]
            with mock.patch.object(exact_atlas, "_solve", side_effect=AssertionError("cache missed")):
                second = exact_atlas.optimize_layouts([SIZES], [native()], cache=cache,
                                                      time_limit_seconds=0, require_optimal=False)[0]
            self.assertFalse(first["exact"]["cache_hit"])
            self.assertTrue(second["exact"]["cache_hit"])
            self.assertFalse(second["exact"]["optimal"])
            self.assertEqual(first["regions"], [tuple(region) for region in second["regions"]])
            self.assertEqual(len(list(cache.glob("*.json"))), 1)
            self.assertFalse(list(cache.glob("*.tmp")))

    def test_cache_settings_and_geometry_change_keys(self):
        results = [exact_atlas.optimize_layouts([SIZES], [native()], time_limit_seconds=0, require_optimal=False)[0],
                   exact_atlas.optimize_layouts([SIZES], [native()], time_limit_seconds=0, workers=2,
                                                require_optimal=False)[0],
                   exact_atlas.optimize_layouts([list(reversed(SIZES))],
                                               [native(list(reversed(SIZES)))],
                                               time_limit_seconds=0, require_optimal=False)[0]]
        self.assertEqual(results[0]["exact"]["cache_key"], results[1]["exact"]["cache_key"])
        self.assertNotEqual(results[0]["exact"]["cache_key"], results[2]["exact"]["cache_key"])

    def test_corrupt_cache_is_ignored_and_replaced(self):
        with tempfile.TemporaryDirectory() as directory:
            cache = Path(directory)
            result = exact_atlas.optimize_layouts([SIZES], [native()], cache=cache,
                                                  time_limit_seconds=0, require_optimal=False)[0]
            path = cache / (result["exact"]["cache_key"] + ".json")
            path.write_text('{"format":"broken"}', encoding="utf-8")
            result = exact_atlas.optimize_layouts([SIZES], [native()], cache=cache,
                                                  time_limit_seconds=0, require_optimal=False)[0]
            self.assertFalse(result["exact"]["cache_hit"])
            self.assertEqual(json.loads(path.read_text())["format"], exact_atlas.SCHEMA)

    def test_better_new_native_hint_never_regresses_to_cached_layout(self):
        with tempfile.TemporaryDirectory() as directory:
            cache = Path(directory)
            exact_atlas.optimize_layouts([SIZES], [native()], cache=cache, time_limit_seconds=0,
                                         require_optimal=False)
            improved = native()
            improved.update(width=100, height=100,
                            regions=[(2, 2, 56, 96), (62, 2, 36, 56), (62, 62, 36, 36)])
            result = exact_atlas.optimize_layouts([SIZES], [improved], cache=cache,
                                                  time_limit_seconds=0)[0]
            self.assertEqual(result["width"] * result["height"], 10000)
            self.assertEqual(result["regions"], improved["regions"])
            self.assertGreaterEqual(result["exact"]["gap"], 0)

    def test_invalid_orientation_overlap_limits_and_options_rejected(self):
        bad = native()
        bad["regions"][0] = (2, 2, 96, 56)
        with self.assertRaisesRegex(ValueError, "orientation"):
            exact_atlas.optimize_layouts([SIZES], [bad])
        bad = native()
        bad["regions"][1] = (2, 2, 36, 56)
        with self.assertRaisesRegex(ValueError, "overlap"):
            exact_atlas.optimize_layouts([SIZES], [bad])
        for options in ({"workers": 0}, {"max_side": 0}, {"padding": -1},
                        {"time_limit_seconds": -1}, {"time_limit_seconds": float("inf")}):
            with self.subTest(options=options), self.assertRaises(ValueError):
                exact_atlas.optimize_layouts([SIZES], [native()], **options)

    def test_unproven_probe_is_refused_by_default_and_checkpointed(self):
        with tempfile.TemporaryDirectory() as directory:
            cache = Path(directory)
            with self.assertRaisesRegex(exact_atlas.UnprovenAtlasError, "publication refused"):
                exact_atlas.optimize_layouts([SIZES], [native()], cache=cache, time_limit_seconds=0)
            saved = json.loads(next(cache.glob("*.json")).read_text())["layout"]
            self.assertFalse(saved["exact"]["optimal"])

    def test_feasible_cache_is_incumbent_and_solver_runs_again(self):
        with tempfile.TemporaryDirectory() as directory:
            cache = Path(directory)
            exact_atlas.optimize_layouts([SIZES], [native()], cache=cache,
                                         time_limit_seconds=0, require_optimal=False)
            with mock.patch.object(exact_atlas, "_solve",
                                   return_value=(native(), "FEASIBLE", 10000, False)) as solve:
                with self.assertRaises(exact_atlas.UnprovenAtlasError):
                    exact_atlas.optimize_layouts([SIZES], [native()], cache=cache)
            solve.assert_called_once()

    def test_legacy_optimal_claim_is_hint_only_and_not_a_proof(self):
        with tempfile.TemporaryDirectory() as directory:
            cache = Path(directory)
            old = native()
            old.update(width=110, height=100,
                       regions=[(2, 2, 56, 96), (62, 2, 36, 56), (62, 62, 36, 36)],
                       exact={"optimal": True, "status": "OPTIMAL"})
            (cache / "legacy.json").write_text(json.dumps({"format": "pvz-exact-atlas-v1", "layout": old}))
            with mock.patch.object(exact_atlas, "_solve",
                                   return_value=(old, "FEASIBLE", 10000, False)) as solve:
                with self.assertRaises(exact_atlas.UnprovenAtlasError):
                    exact_atlas.optimize_layouts([SIZES], [native()], cache=cache)
            self.assertEqual(solve.call_args.args[1]["width"], 110)

    def test_mutated_proof_digest_is_not_trusted(self):
        with tempfile.TemporaryDirectory() as directory:
            cache = Path(directory)
            probe = exact_atlas.optimize_layouts([SIZES], [native()], cache=cache,
                                                 time_limit_seconds=0, require_optimal=False)[0]
            path = cache / (probe["exact"]["cache_key"] + ".json")
            record = json.loads(path.read_text())
            record["layout"]["exact"].update(optimal=True, status="OPTIMAL", best_bound=12000)
            path.write_text(json.dumps(record))
            with mock.patch.object(exact_atlas, "_solve",
                                   return_value=(native(), "FEASIBLE", 10000, False)) as solve:
                with self.assertRaises(exact_atlas.UnprovenAtlasError):
                    exact_atlas.optimize_layouts([SIZES], [native()], cache=cache)
            solve.assert_called_once()

    def test_lower_bound_proof_cache_is_rechecked_mathematically(self):
        with tempfile.TemporaryDirectory() as directory:
            cache = Path(directory)
            probe = exact_atlas.optimize_layouts([SIZES], [native()], cache=cache,
                                                 time_limit_seconds=0, require_optimal=False)[0]
            # Even an intact cache checksum must not turn an invalid area
            # relaxation equality into a mathematical certificate.
            probe["exact"].update(optimal=True, status="LOWER_BOUND_PROVEN", best_bound=12000)
            path = cache / (probe["exact"]["cache_key"] + ".json")
            exact_atlas._write_cache(path, probe["exact"]["cache_key"], probe)
            with mock.patch.object(exact_atlas, "_solve",
                                   return_value=(native(), "FEASIBLE", 10000, False)) as solve:
                with self.assertRaises(exact_atlas.UnprovenAtlasError):
                    exact_atlas.optimize_layouts([SIZES], [native()], cache=cache)
            solve.assert_called_once()

    def test_completed_bounded_cache_reuses_equal_and_smaller_budgets(self):
        with tempfile.TemporaryDirectory() as directory:
            cache = Path(directory)
            with mock.patch.object(exact_atlas, "_solve",
                                   return_value=(native(), "FEASIBLE", 10000, False)):
                first = exact_atlas.optimize_layouts(
                    [SIZES], [native()], cache=cache, time_limit_seconds=60, require_optimal=False)[0]
            self.assertTrue(first["exact"]["search_complete"])
            self.assertEqual(first["exact"]["solve_budget_seconds"], 60)
            for seconds in (60, 30):
                with mock.patch.object(exact_atlas, "_solve", side_effect=AssertionError("completed cache missed")):
                    second = exact_atlas.optimize_layouts(
                        [SIZES], [native()], cache=cache, time_limit_seconds=seconds, require_optimal=False)[0]
                self.assertFalse(second["exact"]["optimal"])
                self.assertEqual(second["exact"]["status"], "FEASIBLE")
                self.assertEqual(second["exact"]["elapsed_seconds"], first["exact"]["elapsed_seconds"])
                self.assertTrue(second["exact"]["cache_hit"])
                self.assertEqual(second["exact"]["solve_budget_seconds"], 60)

    def test_larger_budget_and_strict_policy_continue_completed_unproven_cache(self):
        with tempfile.TemporaryDirectory() as directory:
            cache = Path(directory)
            with mock.patch.object(exact_atlas, "_solve",
                                   return_value=(native(), "FEASIBLE", 10000, False)) as solve:
                exact_atlas.optimize_layouts(
                    [SIZES], [native()], cache=cache, time_limit_seconds=60, require_optimal=False)
                second = exact_atlas.optimize_layouts(
                    [SIZES], [native()], cache=cache, time_limit_seconds=120, require_optimal=False)[0]
            self.assertEqual(solve.call_count, 2)
            self.assertEqual(second["exact"]["solve_budget_seconds"], 120)
            with mock.patch.object(exact_atlas, "_solve",
                                   return_value=(native(), "FEASIBLE", 10000, False)) as solve:
                with self.assertRaises(exact_atlas.UnprovenAtlasError):
                    exact_atlas.optimize_layouts(
                        [SIZES], [native()], cache=cache, time_limit_seconds=60, require_optimal=True)
            solve.assert_called_once()

    def test_interrupted_checkpoint_never_satisfies_a_completed_budget(self):
        with tempfile.TemporaryDirectory() as directory:
            cache = Path(directory)

            def interrupted(sizes, initial, padding, max_side, seconds, workers, lower, progress):
                progress(native(), 10000)
                raise RuntimeError("interrupted fixture")

            with mock.patch.object(exact_atlas, "_solve", side_effect=interrupted):
                with self.assertRaisesRegex(RuntimeError, "interrupted fixture"):
                    exact_atlas.optimize_layouts(
                        [SIZES], [native()], cache=cache, time_limit_seconds=60, require_optimal=False)
            record = json.loads(next(cache.glob("*.json")).read_text())["layout"]
            self.assertFalse(record["exact"]["search_complete"])
            self.assertIsNone(record["exact"]["solve_budget_seconds"])
            with mock.patch.object(exact_atlas, "_solve",
                                   return_value=(native(), "UNKNOWN", 10000, False)) as solve:
                result = exact_atlas.optimize_layouts(
                    [SIZES], [native()], cache=cache, time_limit_seconds=60, require_optimal=False)[0]
            solve.assert_called_once()
            self.assertEqual(result["exact"]["status"], "UNKNOWN")
            self.assertFalse(result["exact"]["optimal"])

    def legacy_completion_fixture(self, cache, *, checkpoint=False):
        key = exact_atlas._cache_key(SIZES, 2, 16384, exact_atlas._version())
        layout = native()
        layout["exact"] = exact_atlas._metadata(
            "FEASIBLE", 10000, layout, optimal=False, elapsed=60.5,
            key=key, hit=False, version=exact_atlas._version())
        if not checkpoint:
            layout["exact"].pop("search_complete")
            layout["exact"].pop("solve_budget_seconds")
        exact_atlas._write_cache(cache / (key + ".json"), key, layout)
        member = "compiled/reanim/fixture.compiled"
        manifest = {"atlas_groups": {"fixture": {
            "solver": "exact", "require_optimal": False, "time_limit_seconds": 60,
            "width": layout["width"], "height": layout["height"],
            "members": [member], "exact": copy.deepcopy(layout["exact"])}},
            "definition_atlases": {member: {"images": [
                {"source": f"IMAGE_{i}", "width": w, "height": h} for i, (w, h) in enumerate(SIZES)]}}}
        return key, layout, manifest

    def test_published_matching_old_final_record_imports_completed_budget_only(self):
        with tempfile.TemporaryDirectory() as directory:
            cache = Path(directory)
            key, _, manifest = self.legacy_completion_fixture(cache)
            self.assertEqual(exact_atlas.import_completed_budget(cache, manifest), 1)
            self.assertEqual(exact_atlas.import_completed_budget(cache, manifest), 0)
            imported = json.loads((cache / (key + ".json")).read_text())["layout"]["exact"]
            self.assertTrue(imported["search_complete"])
            self.assertEqual(imported["solve_budget_seconds"], 60)
            self.assertFalse(imported["optimal"])
            with mock.patch.object(exact_atlas, "_solve", side_effect=AssertionError("imported cache missed")):
                result = exact_atlas.optimize_layouts(
                    [SIZES], [native()], cache=cache, time_limit_seconds=60, require_optimal=False)[0]
            self.assertFalse(result["exact"]["optimal"])
            with mock.patch.object(exact_atlas, "_solve",
                                   return_value=(native(), "UNKNOWN", 10000, False)) as solve:
                with self.assertRaises(exact_atlas.UnprovenAtlasError):
                    exact_atlas.optimize_layouts([SIZES], [native()], cache=cache, time_limit_seconds=60)
            solve.assert_called_once()

    def test_legacy_elapsed_alone_does_not_satisfy_bounded_budget(self):
        with tempfile.TemporaryDirectory() as directory:
            cache = Path(directory)
            self.legacy_completion_fixture(cache)
            with mock.patch.object(exact_atlas, "_solve",
                                   return_value=(native(), "FEASIBLE", 10000, False)) as solve:
                exact_atlas.optimize_layouts(
                    [SIZES], [native()], cache=cache, time_limit_seconds=60, require_optimal=False)
            solve.assert_called_once()

    def test_import_rejects_partial_mismatched_and_forged_records(self):
        mutations = (
            lambda m: m["atlas_groups"]["fixture"]["exact"].update(elapsed_seconds=59),
            lambda m: m["atlas_groups"]["fixture"]["exact"].update(best_bound=9999),
            lambda m: m["atlas_groups"]["fixture"]["exact"].update(status="OPTIMAL", optimal=True),
            lambda m: m["atlas_groups"]["fixture"].update(require_optimal=True),
            lambda m: m["atlas_groups"]["fixture"].update(time_limit_seconds=None),
            lambda m: m["atlas_groups"]["fixture"].update(width=1),
            lambda m: m["definition_atlases"]["compiled/reanim/fixture.compiled"]["images"][0].update(width=57),
        )
        for mutate in mutations:
            with self.subTest(mutation=mutate), tempfile.TemporaryDirectory() as directory:
                cache = Path(directory)
                _, _, manifest = self.legacy_completion_fixture(cache)
                mutate(manifest)
                self.assertEqual(exact_atlas.import_completed_budget(cache, manifest), 0)
        with tempfile.TemporaryDirectory() as directory:
            cache = Path(directory)
            self.legacy_completion_fixture(cache, checkpoint=True)
            _, _, manifest = self.legacy_completion_fixture(cache, checkpoint=True)
            self.assertEqual(exact_atlas.import_completed_budget(cache, manifest), 0)

    def test_completed_false_optimal_marker_does_not_forge_a_proof(self):
        with tempfile.TemporaryDirectory() as directory:
            cache = Path(directory)
            key, layout, _ = self.legacy_completion_fixture(cache)
            layout["exact"].update(search_complete=True, solve_budget_seconds=60,
                                    status="OPTIMAL", optimal=False)
            exact_atlas._write_cache(cache / (key + ".json"), key, layout)
            with mock.patch.object(exact_atlas, "_solve",
                                   return_value=(native(), "UNKNOWN", 10000, False)) as solve:
                result = exact_atlas.optimize_layouts(
                    [SIZES], [native()], cache=cache, time_limit_seconds=60, require_optimal=False)[0]
            solve.assert_called_once()
            self.assertFalse(result["exact"]["optimal"])

    def test_export_selects_current_manifest_only_and_strips_host_metadata(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            cache, destination = root / "cache", root / "portable"
            key, layout, manifest = self.legacy_completion_fixture(cache)
            layout["machine_path"] = "C:/Users/private/build"
            layout["exact"]["source_path"] = "C:/Users/private/source"
            exact_atlas._write_cache(cache / (key + ".json"), key, layout)
            manifest["atlas_groups"]["fixture"]["exact"] = copy.deepcopy(layout["exact"])
            # This valid but unrelated proof must not enter the curated export.
            exact_atlas.optimize_layouts([[(7, 11)]], [native([(7, 11)])], cache=cache)
            (cache / "legacy-junk.json").write_text('{"format":"old"}')
            self.assertEqual(exact_atlas.export_completed_cache(cache, manifest, destination), 1)
            self.assertEqual([p.name for p in destination.glob("*.json")], [key + ".json"])
            exported = (destination / (key + ".json")).read_text()
            self.assertNotIn("C:/Users", exported)
            record = json.loads(exported)
            self.assertEqual(record["format"], exact_atlas.SCHEMA)
            self.assertEqual(record["geometry"], {"padding": 2, "max_side": 16384})
            self.assertTrue(record["layout"]["exact"]["search_complete"])
            self.assertFalse(record["layout"]["exact"]["optimal"])

    def test_export_rejects_unfinished_or_different_published_geometry(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            cache, destination = root / "cache", root / "portable"
            _, _, manifest = self.legacy_completion_fixture(cache, checkpoint=True)
            self.assertEqual(exact_atlas.export_completed_cache(cache, manifest, destination), 0)
            _, _, manifest = self.legacy_completion_fixture(cache)
            manifest["atlas_groups"]["fixture"]["width"] += 1
            self.assertEqual(exact_atlas.export_completed_cache(cache, manifest, destination), 0)

    def test_portable_bounded_seed_is_reused_without_becoming_optimal(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            cache, portable, local = root / "cache", root / "portable", root / "local"
            _, _, manifest = self.legacy_completion_fixture(cache)
            self.assertEqual(exact_atlas.export_completed_cache(cache, manifest, portable), 1)
            self.assertEqual(exact_atlas.seed_completed_cache(portable, local), 1)
            self.assertEqual(exact_atlas.seed_completed_cache(portable, local), 0)
            with mock.patch.object(exact_atlas, "_solve", side_effect=AssertionError("seed cache missed")):
                result = exact_atlas.optimize_layouts(
                    [SIZES], [native()], cache=local, time_limit_seconds=60, require_optimal=False)[0]
            self.assertFalse(result["exact"]["optimal"])
            self.assertTrue(result["exact"]["cache_hit"])
            with mock.patch.object(exact_atlas, "_solve",
                                   return_value=(native(), "FEASIBLE", 10000, False)) as solve:
                with self.assertRaises(exact_atlas.UnprovenAtlasError):
                    exact_atlas.optimize_layouts([SIZES], [native()], cache=local, time_limit_seconds=60)
            solve.assert_called_once()

    def test_seed_preserves_any_existing_local_file_and_leaves_no_temporary_file(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            cache, portable, local = root / "cache", root / "portable", root / "local"
            key, _, manifest = self.legacy_completion_fixture(cache)
            exact_atlas.export_completed_cache(cache, manifest, portable)
            local.mkdir()
            target = local / (key + ".json")
            target.write_bytes(b"local search checkpoint -- do not replace")
            self.assertEqual(exact_atlas.seed_completed_cache(portable, local), 0)
            self.assertEqual(target.read_bytes(), b"local search checkpoint -- do not replace")
            self.assertFalse(list(local.glob("*.tmp")))

    def test_seed_rejects_corrupt_checkpoint_foreign_model_and_invalid_key(self):
        mutations = (
            lambda r: r.update(layout_sha256="invalid"),
            lambda r: r.update(key="0" * 64),
            lambda r: r["geometry"].update(max_side=1000),
            lambda r: r["layout"]["exact"].update(search_complete=False),
            lambda r: r["layout"]["exact"].update(solve_budget_seconds=0),
            lambda r: r["layout"]["exact"].update(solve_budget_seconds=None),
            lambda r: r["layout"]["exact"].update(model_version="old-model"),
            lambda r: r["layout"]["exact"].update(solver_version="old-solver"),
            lambda r: r["layout"]["exact"].update(status="OPTIMAL", optimal=False),
            lambda r: r["layout"]["exact"].update(status="FEASIBLE", optimal=True),
            lambda r: r["layout"]["regions"][0].__setitem__(0, -1),
        )
        for mutate in mutations:
            with self.subTest(mutation=mutate), tempfile.TemporaryDirectory() as directory:
                root = Path(directory)
                cache, portable, local = root / "cache", root / "portable", root / "local"
                key, _, manifest = self.legacy_completion_fixture(cache)
                exact_atlas.export_completed_cache(cache, manifest, portable)
                path = portable / (key + ".json")
                record = json.loads(path.read_text())
                mutate(record)
                if record["layout_sha256"] != "invalid":
                    record["layout_sha256"] = exact_atlas._layout_digest(record["layout"])
                path.write_text(json.dumps(record))
                self.assertEqual(exact_atlas.seed_completed_cache(portable, local), 0)
                self.assertFalse(list(local.glob("*.json")))

    def test_portable_optimal_proof_supports_nondefault_geometry(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            cache, portable, local = root / "cache", root / "portable", root / "local"
            sizes = [(7, 11)]
            layout = exact_atlas.optimize_layouts([sizes], [native(sizes)], cache=cache, max_side=256)[0]
            member = "compiled/reanim/single.compiled"
            manifest = {"atlas_groups": {"single": {
                "solver": "exact", "max_side": 256, "padding": 2,
                "members": [member], "width": layout["width"], "height": layout["height"],
                "exact": layout["exact"]}},
                "definition_atlases": {member: {"images": [
                    {"source": "IMAGE_SINGLE", "width": 7, "height": 11}]}}}
            self.assertEqual(exact_atlas.export_completed_cache(cache, manifest, portable), 1)
            self.assertEqual(exact_atlas.seed_completed_cache(portable, local), 1)
            with mock.patch.object(exact_atlas, "_solve", side_effect=AssertionError("proof seed missed")):
                result = exact_atlas.optimize_layouts([sizes], [native(sizes)], cache=local, max_side=256)[0]
            self.assertTrue(result["exact"]["optimal"])
            self.assertTrue(result["exact"]["cache_hit"])


@unittest.skipUnless(importlib.util.find_spec("ortools"), "Install ortools to test CP-SAT")
class CpSatAtlasTests(unittest.TestCase):
    def test_solver_version_change_invalidates_optimal_cache_proof(self):
        sizes = [(6, 2), (2, 6)]
        with tempfile.TemporaryDirectory() as directory:
            cache = Path(directory)
            first = exact_atlas.optimize_layouts([sizes], [native(sizes, 0)], cache=cache,
                                                 padding=0, max_side=8)[0]
            original = exact_atlas._solve
            with mock.patch.object(exact_atlas, "_version", return_value="different-solver-version"):
                with mock.patch.object(exact_atlas, "_solve", wraps=original) as solve:
                    second = exact_atlas.optimize_layouts([sizes], [native(sizes, 0)], cache=cache,
                                                          padding=0, max_side=8)[0]
                solve.assert_called_once()
            self.assertNotEqual(first["exact"]["cache_key"], second["exact"]["cache_key"])
            self.assertTrue(second["exact"]["optimal"])

    def test_global_optimum_can_be_wider_than_the_incumbent(self):
        initial = native()
        initial.update(width=60, height=200,
                       regions=[(2, 2, 56, 96), (2, 102, 36, 56), (2, 162, 36, 36)])
        result = exact_atlas.optimize_layouts([SIZES], [initial], max_side=256)[0]
        self.assertEqual(result["width"] * result["height"], 10000)
        self.assertGreater(result["width"], initial["width"])
        self.assertTrue(result["exact"]["optimal"])

    def test_small_models_match_independent_exhaustive_pixel_packing(self):
        def fits(sizes, width, height):
            if not sizes:
                return True
            (w, h), *remaining = sizes
            positions = [sum(((1 << w) - 1) << (x + (y + row) * width) for row in range(h))
                         for y in range(height - h + 1) for x in range(width - w + 1)]

            def search(index, occupied):
                if index == len(sizes):
                    return True
                iw, ih = sizes[index]
                for y in range(height - ih + 1):
                    for x in range(width - iw + 1):
                        mask = sum(((1 << iw) - 1) << (x + (y + row) * width) for row in range(ih))
                        if not mask & occupied and search(index + 1, occupied | mask):
                            return True
                return False
            return any(search(1, mask) for mask in positions)

        for sizes in ([(3, 1), (1, 3)], [(2, 2), (1, 3), (3, 1)],
                      [(1, 2), (1, 2), (2, 1)], [(3, 2), (2, 3), (1, 1)]):
            with self.subTest(sizes=sizes):
                # Enumerate every integer W,H and pixel placement, no symmetry
                # assumptions; independent of CP-SAT and its lower bound.
                optimum = min(w * h for w in range(1, 8) for h in range(1, 8)
                              if all(iw <= w and ih <= h for iw, ih in sizes) and fits(sizes, w, h))
                result = exact_atlas.optimize_layouts([sizes], [native(sizes, 0)], padding=0, max_side=7)[0]
                self.assertEqual(result["width"] * result["height"], optimum)

    def test_small_gap_fixture_reaches_optimal_area_and_certificate(self):
        result = exact_atlas.optimize_layouts([SIZES], [native()], max_side=256,
                                              time_limit_seconds=10)[0]
        self.assertEqual(result["width"] * result["height"], 10000)
        self.assertEqual(result["exact"]["status"], "OPTIMAL")
        self.assertTrue(result["exact"]["optimal"])
        self.assertEqual(result["exact"]["best_bound"], 10000)
        self.assertEqual(result["exact"]["gap"], 0)
        self.assertEqual([(w, h) for _, _, w, h in result["regions"]], SIZES)

    def test_no_rotation_cross_fixture_and_unlimited_budget(self):
        sizes = [(6, 2), (2, 6)]
        result = exact_atlas.optimize_layouts([sizes], [native(sizes, 0)],
                                              padding=0, max_side=8,
                                              time_limit_seconds=None)[0]
        self.assertEqual(result["width"] * result["height"], 48)
        self.assertTrue(result["exact"]["optimal"])
        self.assertEqual([(w, h) for _, _, w, h in result["regions"]], sizes)

    def test_optimal_cache_reuses_certificate_without_resolving(self):
        with tempfile.TemporaryDirectory() as directory:
            cache = Path(directory)
            first = exact_atlas.optimize_layouts([SIZES], [native()], cache=cache,
                                                 time_limit_seconds=10)[0]
            with mock.patch.object(exact_atlas, "_solve", side_effect=AssertionError("cache missed")):
                second = exact_atlas.optimize_layouts([SIZES], [native()], cache=cache,
                                                      time_limit_seconds=10)[0]
            self.assertTrue(first["exact"]["optimal"])
            self.assertTrue(second["exact"]["optimal"])
            self.assertTrue(second["exact"]["cache_hit"])


if __name__ == "__main__":
    unittest.main()
