"""Offline static reanimations preserve resolved runtime semantics."""
from pathlib import Path
from types import SimpleNamespace
import struct
import sys
import unittest
import zlib

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import static_reanim_codegen as static
import test_reanim_variants as fixtures
import definition_atlas as atlas
import build_numeric_runtime_pak64 as pak


def record(frames, resources, *, mode=1, segments=(), track=7, source_float=False):
    body = struct.pack("<4IfI", 0x46544449 if source_float else 0x36544449, 11, 0, 33, 12.0, 1)
    body += struct.pack("<4I", track, len(frames), 32, mode)
    body += b"".join(struct.pack("<6fif" if source_float else "<8f", *frame) for frame in frames)
    for slot, font, text in resources:
        body += struct.pack("<2I", slot, font)
        if mode & 1:
            body += struct.pack("<I", len(text)) + text
    body += struct.pack("<I", bool(segments))
    if segments:
        body += struct.pack("<2I", 0, len(segments))
        body += b"".join(struct.pack("<4If3I", *segment) for segment in segments)
    appearance = struct.pack("<5I", 1, 1, 0, 0, 0) + struct.pack("<4i", 0, 0, 0, 0)
    payload = struct.pack("<2I", 0x37564152, len(body)) + body + appearance
    return struct.pack("<3I", 0xDEADFEDB, len(payload), zlib.crc32(payload)) + payload


def storage_source(flags=(0, 4, 3), *, authored=True):
    """Three logical tracks with distinct image handles and varying frame counts."""
    body = struct.pack("<4IfI", 0x46544449 if authored else 0x35544449,
                       11, 0, 33, 12.0, 3)
    for index, (track_id, count, mode) in enumerate(zip((19, 7, 19), (1, 2, 3), flags)):
        body += struct.pack("<4I", track_id, count, 32, mode)
        for frame in range(count):
            body += struct.pack("<6fif" if authored else "<8f",
                                index + frame / 4, 0, 0, 0, 1, 1, 0, 1)
    for index, (count, mode) in enumerate(zip((1, 2, 3), flags)):
        for frame in range(count):
            body += struct.pack("<2I", index + 1, int(bool(mode & 1)))
            if mode & 1:
                text = b"caption" if frame == 0 else b""
                body += struct.pack("<I", len(text)) + text
    body += struct.pack("<I", 0)
    return struct.pack("<3I", 0xDEADFED7, len(body), zlib.crc32(body)) + body


def pack_storage_source(source):
    labels = ["A", "B", "C"]
    metadata = {"tracks": ["first", "middle", "last"],
                "variants": [{"name": "Root", "images": [[label] for label in labels]}]}
    layout = {"width": 64, "height": 16,
              "regions": [(2 + i * 12, 2, 8, 8) for i in range(3)]}
    descriptors = {label: atlas.ImageDescriptor(label, "", "", "", 0, 1, 1, 0xFFFFFF)
                   for label in labels}
    return atlas.compile_reanim_variants(
        "compiled/reanim/root.compiled", source, metadata,
        [{"symbols": labels, "layout": layout}], dict(enumerate(labels, 1)), descriptors)[0]


class StaticReanimTests(unittest.TestCase):
    def generate(self, data):
        return static.generate(SimpleNamespace(definition_orders={"reanim": [("REANIM_ROOT", "Root")]}),
                               {"compiled/reanim/root.compiled": data})

    def test_current_appearance_fixture_generates_eight_aggregate_shards(self):
        data, _ = fixtures.ReanimVariantPackingTests().fixture()
        output = self.generate(data)
        self.assertEqual(len(output["files"]), 8)
        source = output["files"]["ReanimData00.cpp"].decode()
        self.assertTrue(source.startswith('#include "../GeneratedDefinitions.h"\n'))
        self.assertIn("constinit const Sexy::TextureRegion Reanim0Rects[16]", source)
        self.assertNotIn("Reanim0Widths", source)
        self.assertNotIn("Reanim0Heights", source)
        self.assertIn("constinit std::uint32_t Reanim0ActionStarts[2] = {\n    0u,\n    2u,", source)
        self.assertIn("constinit std::uint32_t Reanim0ActionCounts[2] = {\n    2u,\n    2u,", source)
        self.assertIn("constinit std::uint32_t Reanim0Options[8] = {\n"
                      "    0u,\n    0u,\n    1u,\n    0u,\n    0u,\n    1u,\n    1u,\n    1u,", source)
        self.assertEqual(output["attacher_initializers"], ["{}"])
        self.assertEqual(output["summary"]["frames"], 4)
        self.assertEqual(output, self.generate(data))

    def test_float_source_record_preserves_submilli_values_and_full_integer_cel(self):
        values = (.000123456789, -.123456789, 29.3125, 25.59375, .791999996, 1, 2147483647, .123456789)
        data = record([values], [(0, 0, b"")], mode=0, source_float=True)
        parsed = static._parse("compiled/reanim/root.compiled", data, 1)
        expected = struct.unpack("<6fif", struct.pack("<6fif", *values))
        self.assertEqual(parsed["tracks"][0]["frames"][0]["values"], expected)
        source = self.generate(data)["files"]["ReanimData00.cpp"].decode()
        self.assertIn("2147483647", source)
        self.assertIn("29.3125f, 25.59375f", source)
        self.assertIn("0.00012345679f", source)
        for bad in (float("nan"), float("inf")):
            with self.subTest(value=bad), self.assertRaises(ValueError):
                self.generate(record([(bad, *values[1:])], [(0, 0, b"")], mode=0, source_float=True))

    def test_placeholders_inherit_caption_and_font_with_float_roundtrip(self):
        missing = (-10000.0,) * 8
        special = struct.unpack("<f", bytes.fromhex("0100803f"))[0]
        data = record([missing, (special, *missing[1:]), missing],
                      [(0, 0, b""), (0, 1, "字幕".encode()), (0, 0, b"")])
        output = self.generate(data)
        source = output["files"]["ReanimData00.cpp"].decode()
        self.assertIn("{0.0f, 0.0f, 0.0f, 0.0f, 1.0f, 1.0f, 0, 1.0f, 0u, nullptr, nullptr}", source)
        self.assertEqual(source.count("1.00000012f"), 2)
        self.assertEqual(source.count('"\\xe5\\xad\\x97\\xe5\\xb9\\x95"'), 2)
        self.assertEqual(output["font_bindings"],
                         ["Reanim0Frames0[1].mFont = font;", "Reanim0Frames0[2].mFont = font;"])
        self.assertEqual(output["font_resets"],
                         ["Reanim0Frames0[1].mFont = nullptr;", "Reanim0Frames0[2].mFont = nullptr;"])

    def test_attacher_action_ranges_baked_from_normalized_first_and_last_visibility(self):
        frames = [(0, 0, 0, 0, 1, 1, cel, 1) for cel in (-1, 0, -10000, -1)]
        data = record(frames, [(0, 0, b"")] * 4, mode=0,
                      segments=[(0, 4, 0, 7, 12.0, 0, 0, 4)])
        output = self.generate(data)
        self.assertIn("{0u, 0u, 4u, 0u, 7u, 12.0f, 0u, 0u, 4u, 1, 2}",
                      output["files"]["ReanimData00.cpp"].decode())
        self.assertEqual(output["attacher_initializers"], ["{Reanim0Segments, 1}"])
        hidden = record([frames[0]], [(0, 0, b"")], mode=0,
                        segments=[(0, 1, 0, 7, 12.0, 0, 0, 1)])
        self.assertIn("0u, 1u, 0, 1}", self.generate(hidden)["files"]["ReanimData00.cpp"].decode())

    def test_invalid_font_text_nonfinite_and_trailing_behavior_fail_offline(self):
        frame = (0, 0, 0, 0, 1, 1, 0, 1)
        for data in (
                record([frame], [(0, 2, b"")]),
                record([frame], [(0, 0, b"\0")]),
                record([frame], [(0, 0, b"\xff")]),
                record([(float("nan"), *frame[1:])], [(0, 0, b"")])):
            with self.subTest(data=data), self.assertRaises(ValueError):
                self.generate(data)
        data = record([frame], [(0, 0, b"")])
        payload = bytearray(data[12:])
        size = struct.unpack_from("<I", payload, 4)[0]
        payload[8 + size:8 + size] = b"tail"
        struct.pack_into("<I", payload, 4, size + 4)
        changed = struct.pack("<3I", 0xDEADFEDB, len(payload), zlib.crc32(payload)) + payload
        with self.assertRaisesRegex(ValueError, "Trailing"):
            self.generate(changed)

    def test_config_order_drives_dense_ids_and_fixed_shards(self):
        data = record([(0, 0, 0, 0, 1, 1, 0, 1)], [(0, 0, b"")])
        names = ["Zed", "Alpha", "C", "D", "E", "F", "G", "H", "I"]
        config = SimpleNamespace(definition_orders={
            "reanim": [(f"REANIM_{name.upper()}", name) for name in names]})
        records = {f"compiled/reanim/{name.casefold()}.compiled": data for name in names}
        output = static.generate(config, records)
        self.assertEqual(len(output["initializers"]), 9)
        self.assertTrue(output["initializers"][1].startswith("{{Reanim1Tracks, 1},"))
        self.assertIn(b"Reanim8Frames0", output["files"]["ReanimData00.cpp"])
        self.assertNotIn(b"Reanim8Frames0", output["files"]["ReanimData01.cpp"])
        del records["compiled/reanim/alpha.compiled"]
        with self.assertRaisesRegex(ValueError, "Missing static reanimation"):
            static.generate(config, records)

    def test_storage_flags_survive_image_remap_and_preserve_logical_null_slot(self):
        source_record = storage_source()
        offsets = atlas.image_offsets("reanim", source_record[12:])
        self.assertEqual([struct.unpack_from("<I", source_record, 12 + at)[0] for at in offsets],
                         [1, 2, 2, 3, 3, 3])
        data = pack_storage_source(source_record)
        parsed = static._parse("compiled/reanim/root.compiled", data, 1)
        self.assertEqual([track["id"] for track in parsed["tracks"]], [19, 7, 19])
        self.assertEqual([track["storage"] for track in parsed["tracks"]], [0, 2, 1])
        self.assertEqual([track["mode"] for track in parsed["tracks"]], [0, 0, 1])
        self.assertEqual([len(track["frames"]) for track in parsed["tracks"]], [1, 2, 3])
        self.assertEqual([frame["slot"] for track in parsed["tracks"] for frame in track["frames"]],
                         [1, 2, 2, 3, 3, 3])
        self.assertEqual([frame["text"] for frame in parsed["tracks"][1]["frames"]], [None, None])
        self.assertEqual([frame["text"] for frame in parsed["tracks"][2]["frames"]],
                         ["caption"] * 3)
        output = self.generate(data)
        generated = output["files"]["ReanimData00.cpp"].decode()
        self.assertIn("{static_cast<ReanimTrackId>(19u), {Reanim0Frames0, 1}}", generated)
        self.assertIn("{static_cast<ReanimTrackId>(7u), {nullptr, 2, ReanimTrackStorage::Gpu}}",
                      generated)
        self.assertIn("{static_cast<ReanimTrackId>(19u), "
                      "{Reanim0Frames2, 3, ReanimTrackStorage::Cpu}}", generated)
        self.assertNotIn("Reanim0Frames1", generated)
        self.assertTrue(output["initializers"][0].startswith("{{Reanim0Tracks, 3},"))
        self.assertEqual(output["font_bindings"],
                         [f"Reanim0Frames2[{index}].mFont = font;" for index in range(3)])
        self.assertEqual(output["summary"]["storage_tracks"], {"both": 1, "cpu": 1, "gpu": 1})
        self.assertEqual((output["summary"]["tracks"], output["summary"]["frames"]), (3, 6))

    def test_all_both_authored_and_legacy_generate_identical_cpu_sources(self):
        authored = self.generate(pack_storage_source(storage_source((0, 0, 1))))
        legacy = self.generate(pack_storage_source(storage_source((0, 0, 1), authored=False)))
        self.assertEqual(authored, legacy)
        self.assertEqual(authored["summary"]["storage_tracks"], {"both": 3, "cpu": 0, "gpu": 0})
        generated = authored["files"]["ReanimData00.cpp"].decode()
        self.assertNotIn("ReanimTrackStorage::", generated)
        for index, count in enumerate((1, 2, 3)):
            self.assertIn(f"Reanim0Frames{index}, {count}}}", generated)

    def test_gpu_only_font_and_caption_are_rejected_before_emitting_cpu_bindings(self):
        frame = (0, 0, 0, 0, 1, 1, 0, 1)
        for mode, font, text in ((4, 1, b""), (5, 0, b"caption"), (5, 1, b"caption")):
            with self.subTest(mode=mode, font=font, text=text):
                data = record([frame], [(0, font, text)], mode=mode, source_float=True)
                with self.assertRaisesRegex(ValueError, "GPU-only"):
                    self.generate(data)

    def test_invalid_storage_bits_and_legacy_storage_fail_at_every_entry_point(self):
        for authored, flags in ((True, 6), (True, 7), (True, 8), (True, 0x80),
                                (False, 2), (False, 3), (False, 4), (False, 5)):
            with self.subTest(authored=authored, flags=flags):
                source = storage_source((0, flags, 0), authored=authored)
                with self.assertRaisesRegex(ValueError, "track flags"):
                    pak.reanim_track_flags(flags, authored=authored)
                with self.assertRaisesRegex(ValueError, "track flags"):
                    atlas.image_offsets("reanim", source[12:])
                with self.assertRaisesRegex(ValueError, "track flags"):
                    pack_storage_source(source)
                # Static parsing must also reject a malformed final RAV7,
                # independently of the offline image remapper.
                data = record([(0, 0, 0, 0, 1, 1, 0, 1)], [(0, 0, b"")],
                              mode=flags, source_float=authored)
                with self.assertRaisesRegex(ValueError, "track flags"):
                    self.generate(data)

    def test_gpu_transport_keeps_cpu_only_logical_slot_without_allocating_its_keys(self):
        data = pack_storage_source(storage_source((0, 2, 4)))
        output = self.generate(data)
        self.assertEqual(list(output["gpu_records"]), ["compiled/gpu-reanim/root.compiled"])
        gpu = output["gpu_records"]["compiled/gpu-reanim/root.compiled"]
        self.assertEqual(struct.unpack_from("<8I", gpu),
                         (0x31555247, 3, 4, 4, 1, 16, 48, 32))
        self.assertEqual([struct.unpack_from("<4I", gpu, 32 + index * 16) for index in range(3)],
                         [(0, 1, 0, 0), (0xFFFFFFFF, 2, 0, 0), (1, 3, 0, 0)])
        key_start = 32 + 3 * 16
        keys = [struct.unpack_from("<7fi4I", gpu, key_start + index * 48) for index in range(4)]
        # Logical track 1 remains addressable as a descriptor. Its two CPU
        # frames do not consume GPU keys or shift the third logical track.
        self.assertEqual([key[0] for key in keys], [0, 2, 2.25, 2.5])
        self.assertEqual([key[8] for key in keys], [1, 3, 3, 3])
        self.assertEqual([key[9:] for key in keys], [(0, 0, 0)] * 4)
        self.assertEqual(len(gpu), 32 + 3 * 16 + 4 * 48 + 4 * 32)
        self.assertEqual(output["summary"]["gpu_record_bytes"], len(gpu))
        parsed = static._parse("compiled/reanim/root.compiled", data, 1)
        self.assertEqual(gpu, static.gpu_record(parsed))
        self.assertEqual(gpu, self.generate(data)["gpu_records"]["compiled/gpu-reanim/root.compiled"])

    def test_gpu_keys_preserve_full_integer_cel_and_float_bits_in_contract_order(self):
        values = (.000123456789, -.123456789, 29.3125, 25.59375,
                  .791999996, 1.00000012, 2147483647, .123456789)
        data = record([values], [(0, 0, b"")], mode=4, source_float=True)
        gpu = self.generate(data)["gpu_records"]["compiled/gpu-reanim/root.compiled"]
        self.assertEqual(struct.unpack_from("<8I", gpu), (0x31555247, 1, 1, 1, 1, 16, 48, 32))
        self.assertEqual(struct.unpack_from("<4I", gpu, 32), (0, 1, 0, 0))
        expected = struct.pack("<7fi4I", *values[:6], values[7], values[6], 0, 0, 0, 0)
        self.assertEqual(gpu[48:96], expected)
        self.assertEqual(struct.unpack_from("<i", gpu, 48 + 28)[0], 2147483647)
        self.assertEqual(struct.unpack_from("<6f2I", gpu, 96), (0.0,) * 6 + (0, 0))
        self.assertEqual(len(gpu), 128)

    def test_gpu_geometry_is_variant_major_with_normalized_uv_and_base_pixel_size(self):
        data, _ = fixtures.ReanimVariantPackingTests().fixture()
        gpu = self.generate(data)["gpu_records"]["compiled/gpu-reanim/root.compiled"]
        magic, tracks, keys, slots, variants, track_size, key_size, geometry_size = (
            struct.unpack_from("<8I", gpu))
        self.assertEqual((magic, slots, variants, geometry_size), (0x31555247, 4, 4, 32))
        geometry_start = 32 + tracks * track_size + keys * key_size

        def geometry(variant, slot):
            return struct.unpack_from("<6f2I", gpu,
                                      geometry_start + (variant * slots + slot) * geometry_size)

        for variant in range(4):
            self.assertEqual(geometry(variant, 0), (0.0,) * 6 + (0, 0))
        self.assertEqual(geometry(0, 1), (10, 8, 2 / 64, 2 / 64, 12 / 64, 10 / 64, 0, 0))
        self.assertEqual(geometry(0, 2), (10, 8, 12 / 64, 2 / 64, 22 / 64, 10 / 64, 0, 0))
        self.assertEqual(geometry(0, 3), (4, 6, 2 / 64, 14 / 64, 6 / 64, 20 / 64, 0, 0))
        self.assertEqual(geometry(1, 1), (13, 7, 2 / 64, 24 / 64, 15 / 64, 31 / 64, 0, 0))
        self.assertEqual(geometry(1, 1), geometry(1, 2))
        self.assertEqual(geometry(2, 3), (0.0,) * 6 + (0, 0))
        self.assertEqual(geometry(3, 1), geometry(1, 1))
        self.assertEqual(geometry(3, 3), (0.0,) * 6 + (0, 0))
        self.assertEqual(len(gpu), geometry_start + variants * slots * geometry_size)


if __name__ == "__main__":
    unittest.main()
