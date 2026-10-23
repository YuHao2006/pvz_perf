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


def record(frames, resources, *, mode=1, segments=(), track=7, source_float=False):
    body = struct.pack("<4IfI", 0x46544449 if source_float else 0x36544449, 11, 0, 33, 12.0, 1)
    body += struct.pack("<4I", track, len(frames), 32, mode)
    body += b"".join(struct.pack("<6fif" if source_float else "<8f", *frame) for frame in frames)
    for slot, font, text in resources:
        body += struct.pack("<2I", slot, font)
        if mode:
            body += struct.pack("<I", len(text)) + text
    body += struct.pack("<I", bool(segments))
    if segments:
        body += struct.pack("<2I", 0, len(segments))
        body += b"".join(struct.pack("<4If3I", *segment) for segment in segments)
    appearance = struct.pack("<5I", 1, 1, 0, 0, 0) + struct.pack("<4i", 0, 0, 0, 0)
    payload = struct.pack("<2I", 0x37564152, len(body)) + body + appearance
    return struct.pack("<3I", 0xDEADFEDB, len(payload), zlib.crc32(payload)) + payload


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
        self.assertIn("constinit const Sexy::Rect Reanim0Rects[16]", source)
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


if __name__ == "__main__":
    unittest.main()
