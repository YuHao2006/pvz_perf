"""NRSC4 acceptance: direct named bindings and image decoding metadata only."""
from copy import deepcopy
import json
from pathlib import Path
import re
import struct
import sys
import tempfile
import unittest
import zlib

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import build_numeric_runtime_pak64 as pak
import compile_numeric_resources as resources


def node(tag, **attrs):
    return {"tag": tag, "attrs": attrs, "children": []}


def group(name, *children):
    return {"tag": "Resources", "attrs": {"id": name}, "children": list(children)}


def encode(groups):
    return json.dumps({"format": "pvz-resources-authoring-v1",
                       "manifest": {"tag": "ResourceManifest", "attrs": {},
                                    "children": groups}}).encode()


def reframe(data, plan):
    """Reframe edited records, allowing structural validation beyond CRC checks."""
    payload = b""
    for entry in plan:
        block = b"".join(struct.pack("<I", len(record["data"])) + record["data"]
                         for record in entry["records"])
        payload += struct.pack("<3I", entry["group"], len(entry["records"]), len(block)) + block
    header = list(struct.unpack_from("<8I", data))
    header[3:5] = len(plan), sum(len(entry["records"]) for entry in plan)
    header[6:] = zlib.crc32(payload), len(payload)
    return struct.pack("<8I", *header) + payload


class ResourceLoadPlanTests(unittest.TestCase):
    def setUp(self):
        temporary = tempfile.TemporaryDirectory()
        self.addCleanup(temporary.cleanup)
        self.root = Path(temporary.name)
        generated = self.root / "pvzPerf/Sexy.TodLib/generated"
        generated.mkdir(parents=True)
        (self.root / "pvzPerf/ResourceGroupId.h").write_text(
            "enum class ResourceGroupId { Invalid = 0,\n"
            + "".join(f"G{i} = {i},\n" for i in range(1, 30)) + "};\n")
        (self.root / "pvzPerf/Resources.h").write_text(
            "extern Image* IMAGE_ONE;\nextern Image* IMAGE_TWO;\n")
        (self.root / "pvzPerf/consumer.cpp").write_text(
            "auto one = IMAGE_ONE;\nauto two = IMAGE_TWO;\n")
        self.groups = [
            group("G2", node("Image", id="IMAGE_TWO", path="images/two"),
                  node("Sound", id="SOUND_TWO", path="sounds/two", volume="0.5")),
            group("G1", node("Font", id="FONT_BASE", path="data/base.txt"),
                  node("Image", id="IMAGE_ONE", path="images/one"),
                  node("Font", id="FONT_COPY", path="!ref:FONT_BASE"),
                  node("Image", id="IMAGE_RETIRED", path="images/retired")),
        ]

    def compile(self, groups=None):
        return resources.compile_manifest(self.root, encode(self.groups if groups is None else groups),
                                          [])

    def validate(self, data, references=None):
        header = struct.unpack_from("<8I", data)
        registries = {"image_count": 2, "binding_crc": header[5], "groups": 29,
                      "plan_records": header[4], "plan_crc": header[6]}
        return pak.validate_numeric(pak.RESOURCE_PATH, data, registries, references)

    def test_canonical_groups_preserve_order_and_cover_all_resource_kinds(self):
        data, plan, _, names = self.compile()
        self.assertEqual([entry["group"] for entry in plan], [1, 2])
        records = pak.resource_records(data)
        self.assertEqual([(g, step, fields[0]) for g, step, fields, _, _ in records],
                         [(1, 0, 2), (1, 1, 0), (1, 2, 2), (2, 0, 0), (2, 1, 1)])
        self.assertEqual(records[2][2][-1], 0, "Font reference is the prior local record index")
        self.assertNotIn("IMAGE_RETIRED", names)
        references = set()
        self.assertEqual(self.validate(data, references), {"compiled/fonts/base.compiled"})
        self.assertEqual(references, {("image", "images/one"), ("image", "images/two"),
                                      ("sound", "sounds/two")})
        self.assertNotIn(b"FONT_BASE", data)
        self.assertNotIn(b"IMAGE_ONE", data)
        self.assertEqual(struct.unpack_from("<2I", data), (resources.MAGIC, 4))
        for _, _, fields, _, tail in records:
            self.assertEqual(len(fields), 4)
            if fields[0] == 0:
                self.assertEqual(tail, struct.pack("<I", 0xFFFFFF))

    def test_offline_grid_does_not_change_wire_or_cache_recipe(self):
        original = self.compile()[0]
        groups = deepcopy(self.groups)
        groups[0]["children"][0]["attrs"].update(rows="6", cols="7", anim="none")
        self.assertEqual(self.compile(groups)[0], original)

    def test_unsupported_live_animation_is_rejected_instead_of_discarded(self):
        for attrs in ({"anim": "loop"}, {"anim": "pingpong"}, {"anim": "once"},
                      {"framedelay": "19"}, {"begindelay": "7"}, {"enddelay": "11"},
                      {"perframedelay": "13,17"}, {"framemap": "2,1,0"}):
            groups = deepcopy(self.groups)
            groups[0]["children"][0]["attrs"].update(attrs)
            with self.subTest(attrs=attrs), self.assertRaisesRegex(ValueError, "animation|Animation"):
                self.compile(groups)

    def test_multicell_alpha_grid_is_rejected_until_expanded_offline(self):
        for rows, cols in ((2, 1), (1, 2), (3, 4)):
            groups = deepcopy(self.groups)
            groups[0]["children"][0]["attrs"].update(
                alphagrid="images/mask", rows=str(rows), cols=str(cols))
            with self.subTest(rows=rows, cols=cols), self.assertRaisesRegex(
                    ValueError, "alpha.*grid|alphagrid|Alpha"):
                self.compile(groups)

    def test_single_cell_alpha_grid_remains_a_physical_decode_reference(self):
        groups = deepcopy(self.groups)
        groups[0]["children"][0]["attrs"].update(
            alphagrid="images/mask", rows="1", cols="1")
        data, _, _, _ = self.compile(groups)
        images = {paths[0]: (fields, paths, tail)
                  for _, _, fields, paths, tail in pak.resource_records(data) if fields[0] == 0}
        self.assertEqual(images["images/two"][1][2], "images/mask")
        self.assertEqual(images["images/two"][2], struct.pack("<I", 0xFFFFFF))
        references = set()
        self.validate(data, references)
        self.assertIn(("image", "images/mask"), references)

    def test_same_path_uses_one_recipe_despite_different_offline_grids(self):
        groups = deepcopy(self.groups)
        groups[0]["children"][0]["attrs"].update(
            path="images/shared", rows="3", cols="4")
        groups[1]["children"][1]["attrs"].update(
            path="images/shared", rows="7", cols="2", anim="none")
        data, _, _, _ = self.compile(groups)
        images = [record for record in pak.resource_records(data) if record[2][0] == 0]
        self.assertEqual([record[2][2] for record in images], [0, 0])
        self.assertEqual(images[0][2:], images[1][2:])
        self.validate(data)

    def test_image_alpha_color_remains_in_the_decoding_tail(self):
        groups = deepcopy(self.groups)
        groups[0]["children"][0]["attrs"]["alphacolor"] = "123456"
        data, _, _, _ = self.compile(groups)
        images = {paths[0]: tail for _, _, fields, paths, tail in pak.resource_records(data)
                  if fields[0] == 0}
        self.assertEqual(images["images/two"], struct.pack("<I", 0x123456))
        self.validate(data)

    def test_author_group_reordering_does_not_change_baked_plan(self):
        self.assertEqual(self.compile()[0], self.compile(list(reversed(self.groups)))[0])

    def test_pointer_declaration_order_does_not_change_the_wire_plan(self):
        original = self.compile()[0]
        (self.root / "pvzPerf/Resources.h").write_text(
            "extern Image* IMAGE_TWO;\nextern Image* IMAGE_ONE;\n")
        self.assertEqual(self.compile()[0], original)

    def test_named_assignment_contract_changes_without_putting_names_in_records(self):
        original, _, _, _ = self.compile()
        groups = deepcopy(self.groups)
        for entry in groups:
            for child in entry["children"]:
                name = child["attrs"].get("id")
                if name in {"IMAGE_ONE", "IMAGE_TWO"}:
                    child["attrs"]["id"] = {"IMAGE_ONE": "IMAGE_TWO", "IMAGE_TWO": "IMAGE_ONE"}[name]
        renamed, _, _, _ = self.compile(groups)
        self.assertEqual(original[32:], renamed[32:])
        self.assertNotEqual(struct.unpack_from("<8I", original)[5],
                            struct.unpack_from("<8I", renamed)[5])
        self.assertNotIn(b"IMAGE_", renamed)

    def test_explicit_load_release_pairs_are_symmetric_and_release_reverse_order(self):
        data, plan, crc, names = self.compile()
        resources.emit_headers(self.root, plan, crc, names)
        generated = self.root / "pvzPerf/Sexy.TodLib/generated"
        bindings = (generated / "ResourceLoadBindings.inc").read_text()
        loads = re.findall(r"manager\.Load(Image|Sound|Font)\([^;]*?Sexy::(\w+)", bindings)
        releases = re.findall(r"manager\.Release(Image|Sound|Font)\(Sexy::(\w+)", bindings)
        expected = [(("Image", "Sound", "Font")[r["kind"]], r["name"])
                    for entry in plan for r in entry["records"]]
        reverse = [(("Image", "Sound", "Font")[r["kind"]], r["name"])
                   for entry in plan for r in reversed(entry["records"])]
        self.assertEqual(loads, expected)
        self.assertEqual(releases, reverse)
        self.assertIn("plan.mImages[plan.mNextImage++]", bindings)
        header = (generated / "NumericResourceBindings.h").read_text()
        self.assertIn(f"0x{struct.unpack_from('<8I', data)[6]:08X}u", header)
        self.assertNotRegex(header + bindings, r"ResourceId|ResourceSlot|gNumericResourceKinds|NextImage\(")
        self.assertFalse((generated / "ResourceId.h").exists())

    def test_missing_live_image_is_rejected(self):
        groups = deepcopy(self.groups)
        groups[0]["children"] = groups[0]["children"][1:]
        with self.assertRaisesRegex(ValueError, "Live image globals missing"):
            self.compile(groups)

    def test_duplicate_target_or_group_is_rejected(self):
        for duplicate in ("target", "group"):
            groups = deepcopy(self.groups)
            if duplicate == "target":
                groups[0]["children"].append(node("Sound", id="FONT_BASE", path="sounds/other"))
            else:
                groups.append(deepcopy(groups[0]))
            with self.subTest(duplicate=duplicate), self.assertRaisesRegex(ValueError, "uplicate"):
                self.compile(groups)

    def test_font_dependency_rejects_forward_cross_group_and_nonfont_targets(self):
        for target in ("FONT_LATER", "FONT_OTHER_GROUP", "IMAGE_ONE"):
            groups = deepcopy(self.groups)
            groups[1]["children"][2]["attrs"]["path"] = "!ref:" + target
            groups[1]["children"].append(node("Font", id="FONT_LATER", path="data/later.txt"))
            groups[0]["children"].append(node("Font", id="FONT_OTHER_GROUP", path="data/other.txt"))
            with self.subTest(target=target), self.assertRaisesRegex(ValueError, "prior font"):
                self.compile(groups)

    def test_baked_crc_and_record_count_are_required(self):
        data, _, _, _ = self.compile()
        header = struct.unpack_from("<8I", data)
        for field, value in (("plan_crc", header[6] ^ 1), ("plan_records", header[4] + 1)):
            registries = {"image_count": 2, "binding_crc": header[5], "groups": 29,
                          "plan_records": header[4], "plan_crc": header[6], field: value}
            with self.subTest(field=field), self.assertRaisesRegex(ValueError, "baked load-plan"):
                pak.validate_numeric(pak.RESOURCE_PATH, data, registries)

    def test_wire_rejects_missing_image_records_and_nonimage_recipe_variants(self):
        data, plan, _, _ = self.compile()
        edited = deepcopy(plan)
        record = bytearray(edited[1]["records"][1]["data"])
        struct.pack_into("<I", record, 8, 1)
        edited[1]["records"][1]["data"] = bytes(record)
        with self.assertRaisesRegex(ValueError, "metadata"):
            self.validate(reframe(data, edited))
        edited = deepcopy(plan)
        del edited[1]["records"][0]
        with self.assertRaisesRegex(ValueError, "Image load record count"):
            self.validate(reframe(data, edited))

    def test_wire_rejects_invalid_kind_dependency_and_group_order(self):
        data, plan, _, _ = self.compile()
        for offset, value in ((0, 3), (12, 1), (12, 2), (12, 99)):
            edited = deepcopy(plan)
            record = bytearray(edited[0]["records"][2]["data"])
            struct.pack_into("<I", record, offset, value)
            edited[0]["records"][2]["data"] = bytes(record)
            with self.subTest(offset=offset, value=value), self.assertRaisesRegex(ValueError, "metadata"):
                self.validate(reframe(data, edited))
        with self.assertRaisesRegex(ValueError, "canonically ordered"):
            self.validate(reframe(data, list(reversed(plan))))

    def test_payload_corruption_truncation_and_old_versions_are_rejected(self):
        data, _, _, _ = self.compile()
        corrupted = bytearray(data)
        corrupted[-1] ^= 1
        old_version = bytearray(data)
        struct.pack_into("<I", old_version, 4, 3)
        for malformed in (data[:-1], bytes(corrupted), bytes(old_version),
                          struct.pack("<9I", resources.MAGIC, 1, *([0] * 7))):
            with self.subTest(size=len(malformed)), self.assertRaises(ValueError):
                self.validate(malformed)

    def test_legacy_grid_image_tail_is_rejected_in_the_current_wire_format(self):
        data, plan, _, _ = self.compile()
        edited = deepcopy(plan)
        record = edited[0]["records"][1]
        record["data"] += struct.pack("<ii6I", 1, 1, 0, 0, 0, 0, 0, 0)
        with self.assertRaises(ValueError):
            self.validate(reframe(data, edited))


if __name__ == "__main__":
    unittest.main()
