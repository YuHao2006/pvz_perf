"""The offline overlap audit understands current DSL component/image syntax."""
from pathlib import Path
import sys
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from audit_definition_atlas_overlap import component_image_sources


class AtlasOverlapSourcesTests(unittest.TestCase):
    def test_particle_image_lists_variants_and_multiple_components_stay_separate(self):
        text = '''
        export component Base {
            kind: particle;
            source-name: "MiXeD_Base";
            Emitter {
                images: ["A", "B", "A"];
                name: "ignore image: \\"WRONG\\"; // braces }";
                particleScale: track { 0 1; 1 2; }
            }
            Emitter { image: "C"; }
        }
        // Exported variants share their file with their base.
        export component Replacement {
            kind: particle;
            source-name: "MiXeD_Variant";
            variant-of: Base;
            images: [["D", "E", "D"], ["F"]];
        }
        export component Empty {
            kind: particle;
            source-name: "EMPTY";
            Emitter { images: []; }
        }
        '''
        self.assertEqual(component_image_sources(text, "particle"), [
            ("Base", "mixed_base", {"A", "B", "C"}),
            ("Replacement", "mixed_variant", {"D", "E", "F"}),
            ("Empty", "empty", set()),
        ])

    def test_comments_inside_strings_survive_and_real_comments_are_ignored(self):
        text = '''
        /* export component Wrong { Emitter { image: "BAD"; } } */
        export component Actual {
            source-name: "AcTuAl";
            Emitter {
                images: ["particles/frames/a//b.png", "particles/frames/a/*b*/c.png"];
                // image: "COMMENT";
                name: "string with { [ // text";
            }
        }
        '''
        self.assertEqual(component_image_sources(text, "particle"), [
            ("Actual", "actual", {"particles/frames/a//b.png", "particles/frames/a/*b*/c.png"}),
        ])

    def test_reanim_image_attributes_keep_component_name_and_ignore_track_source_names(self):
        text = '''
        export component SomeReanim {
            Track {
                source-name: "different_track_name";
                frame 0 { image: "IMAGE_A"; }
                frame 1 { image: IMAGE_B; }
                frame 2 { image: none; }
            }
        }
        export component OtherReanim {
            Track { frame 0 { image: "IMAGE_C"; } }
        }
        '''
        self.assertEqual(component_image_sources(text, "reanim"), [
            ("SomeReanim", "somereanim", {"IMAGE_A", "IMAGE_B"}),
            ("OtherReanim", "otherreanim", {"IMAGE_C"}),
        ])


if __name__ == "__main__":
    unittest.main()
