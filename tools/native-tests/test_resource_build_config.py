"""Build configuration selection, grouping and diagnostics."""
from pathlib import Path
import sys
import tempfile
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import resource_build_config as build


class ResourceBuildConfigTests(unittest.TestCase):
    def setUp(self):
        self.temporary = tempfile.TemporaryDirectory()
        self.root = Path(self.temporary.name)
        for directory, name in (("reanim", "Pea"), ("particle", "Splat")):
            (self.root / directory).mkdir()
            (self.root / directory / (name + ".dsl")).touch()
        self.prefix = ('resource_build(1)\nsources(reanim "reanim/*.dsl")\n'
                       'sources(particle "particle/*.dsl")\n')

    def tearDown(self):
        self.temporary.cleanup()

    def load(self, text):
        path = self.root / "ResourceBuild.pvzbuild"
        path.write_text(text, encoding="utf-8")
        return build.load(path)

    def test_cross_kind_group_and_exact_configuration(self):
        config = self.load(self.prefix + '''
            # All sources belong to the build configuration, not a root DSL.
            atlas_defaults(solver exact require_optimal true time_limit_seconds 3 workers 1)
            atlas(peas reanim:Pea particle:Splat)
            atlas_settings(peas time_limit_seconds unlimited)
        ''')
        self.assertEqual(config.defaults.time_limit_seconds, 3)
        self.assertIsNone(config.settings["peas"].time_limit_seconds)
        self.assertTrue(config.defaults.require_optimal)
        self.assertEqual(config.atlases["peas"],
                         ["compiled/reanim/pea.compiled", "compiled/particles/splat.compiled"])
        self.assertEqual(len(config.sources["reanim"]), 1)

    def test_bad_or_duplicate_members_rejected(self):
        for tail in ("atlas(a reanim:Pea)\natlas(b reanim:Pea)",
                     "atlas(a reanim:Pea reanim:Pea)",
                     "atlas(a texture:Pea)", "atlas(con reanim:Pea)",
                     "atlas(a ../Pea)", "atlas_settings(missing workers 1)"):
            with self.subTest(tail=tail), self.assertRaises(ValueError):
                self.load(self.prefix + tail)

    def test_api_defaults_remain_strict_and_unlimited(self):
        settings = build.AtlasSettings()
        self.assertIsNone(settings.time_limit_seconds)
        self.assertTrue(settings.require_optimal)
        self.assertEqual(settings.solver, "exact")

    def test_explicit_bounded_production_opt_out_and_strict_group_override(self):
        config = self.load(self.prefix + '''
            atlas_defaults(solver exact time_limit_seconds 60 require_optimal false)
            atlas(proved reanim:Pea particle:Splat)
            atlas_settings(proved time_limit_seconds unlimited require_optimal true)
        ''')
        self.assertEqual(config.defaults.time_limit_seconds, 60)
        self.assertFalse(config.defaults.require_optimal)
        self.assertTrue(config.settings["proved"].require_optimal)
        self.assertIsNone(config.settings["proved"].time_limit_seconds)

    def test_unproven_publication_requires_positive_bounded_time(self):
        for options in ("require_optimal false",
                        "time_limit_seconds unlimited require_optimal false",
                        "time_limit_seconds 0 require_optimal false",
                        "time_limit_seconds -1 require_optimal false",
                        "time_limit_seconds 86401 require_optimal false",
                        "time_limit_seconds inf require_optimal false",
                        "time_limit_seconds nan require_optimal false",
                        "time_limit_seconds 60 require_optimal maybe",
                        "solver maxrects time_limit_seconds 60 require_optimal false"):
            with self.subTest(options=options), self.assertRaises(ValueError):
                self.load(self.prefix + f"atlas_defaults({options})")
        config = self.load(self.prefix + "atlas_defaults(time_limit_seconds 86400 require_optimal false)")
        self.assertEqual(config.defaults.time_limit_seconds, 86400)

    def test_relaxed_group_override_cannot_remove_its_budget(self):
        with self.assertRaises(ValueError):
            self.load(self.prefix + '''
                atlas_defaults(time_limit_seconds 60 require_optimal false)
                atlas(probed reanim:Pea particle:Splat)
                atlas_settings(probed time_limit_seconds unlimited)
            ''')

    def test_settings_and_language_errors_rejected(self):
        for tail in ("atlas_defaults(solver unknown)", "atlas_defaults(solver maxrects)",
                     "atlas_defaults(require_optimal false)", "atlas_defaults(padding 0)",
                     "atlas_defaults(workers 0)", "atlas_defaults(time_limit_seconds nan)",
                     "atlas_defaults(workers 1 workers 2)", "unknown(a)",
                     "atlas(unclosed reanim:Pea", "atlas(a (reanim:Pea))"):
            with self.subTest(tail=tail), self.assertRaises(ValueError):
                self.load(self.prefix + tail)

    def test_source_selection_is_explicit_and_bounded(self):
        for tail in ('sources(reanim "reanim/*.dsl")',
                     'sources(reanim "../outside/*.dsl")',
                     'sources(reanim "missing/*.dsl")'):
            with self.subTest(tail=tail), self.assertRaises(ValueError):
                self.load(self.prefix + tail)

    def test_actual_configuration_has_no_root_dsl(self):
        root = Path(__file__).resolve().parents[2]
        config = build.load(root / "assets/definitions/ResourceBuild.pvzbuild")
        self.assertEqual(len(config.sources["reanim"]), 146)
        self.assertEqual(len(config.sources["particle"]), 112)
        self.assertFalse((root / "assets/definitions/reanim/root.dsl").exists())
        self.assertFalse((root / "assets/definitions/particles/all.root.dsl").exists())
        self.assertEqual(len(config.atlases["pea_family"]), 6)
        self.assertEqual(config.defaults.time_limit_seconds, 60)
        self.assertFalse(config.defaults.require_optimal)
        self.assertEqual(config.defaults.solver, "exact")

    def test_component_names_resolve_explicit_particle_output_names(self):
        (self.root / "particle/Splat.dsl").write_text(
            'export component DustFoot {\n source-name: "dust_foot";\n}\n', encoding="utf-8")
        config = self.load(self.prefix + "atlas(dust reanim:Pea particle:DustFoot)")
        available = {"compiled/reanim/pea.compiled", "compiled/particles/dust_foot.compiled"}
        self.assertEqual(build.resolve_atlases(config, available)["dust"],
                         ["compiled/reanim/pea.compiled", "compiled/particles/dust_foot.compiled"])
        with self.assertRaisesRegex(ValueError, "unknown definitions"):
            build.resolve_atlases(config, available - {"compiled/particles/dust_foot.compiled"})

    def test_output_alias_cannot_assign_a_definition_twice(self):
        (self.root / "particle/Splat.dsl").write_text(
            'export component DustFoot {\n source-name: "dust_foot";\n}\n', encoding="utf-8")
        config = self.load(self.prefix + "atlas(a particle:DustFoot)\natlas(b particle:Dust_foot)")
        with self.assertRaisesRegex(ValueError, "multiple atlas groups"):
            build.resolve_atlases(config, {"compiled/particles/dust_foot.compiled"})


if __name__ == "__main__":
    unittest.main()
