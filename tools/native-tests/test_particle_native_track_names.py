"""Native-reference field names agree with an independent wire decoder."""
from pathlib import Path
from fractions import Fraction
import re
import struct
import sys
import unittest

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "tools"))
import audit_pak64_semantics as audit
import migrate_particle_v7 as migration

MIGRATED_FIELDS = (
    "EmitterPath", "EmitterSkewX", "EmitterSkewY", "LaunchSpeed", "LaunchAngle",
    "SystemRed", "SystemGreen", "SystemBlue", "SystemAlpha", "SystemBrightness",
)
CURVES = {name: index for index, name in enumerate(migration.CURVES) if index != 8}


def bits(nodes):
    return tuple(tuple(struct.pack("<f" if i < 3 else "<i", value)
                       for i, value in enumerate(node)) for node in nodes)


def explicit_nodes(text):
    """Decode authored nodes independently, preserving exact time anchors."""
    rows = []
    for body in re.findall(r"\{([^{}]*)\}", text):
        values = dict(re.findall(r"([A-Za-z]+)\s*:\s*([^;]+);", body))
        if not {"low", "high"} <= values.keys():
            raise ValueError("Authored node must contain low and high")
        rows.append([
            Fraction(values["time"]) if "time" in values else None,
            float(values["low"]), float(values["high"]),
            CURVES[values.get("curve", "Linear")],
            CURVES[values.get("distribution", "Linear")],
        ])
    # Explicit decimal anchors stay rational. Only omitted times are inferred,
    # evenly between anchors, beginning at zero and ending at one. This is the
    # nodes{} grammar; it must not use the retired legacy track-string rule.
    base, previous = 0, Fraction(0)
    while base < len(rows):
        anchor = base
        while anchor < len(rows) and rows[anchor][0] is None:
            anchor += 1
        following = rows[anchor][0] if anchor < len(rows) else Fraction(1)
        if base == 0:
            span = len(rows) - 1 if anchor == len(rows) else anchor
        else:
            span = len(rows) - base if anchor == len(rows) else anchor - base + 1
        for index in range(base, anchor):
            step = index - base + (0 if base == 0 else 1)
            rows[index][0] = previous + (following - previous) * Fraction(step, span or 1)
        previous = following
        base = anchor + 1
    return [tuple(float(value) if index == 0 else value
                  for index, value in enumerate(row)) for row in rows]


def emitter_bodies(text):
    previous = 0
    for match in re.finditer(r"\bEmitter\s*\{", text):
        if match.start() < previous:
            continue
        end = migration.block_end(text, match.end() - 1)
        yield text[match.end():end - 1]
        previous = end


def authored_track(body, name):
    property_name = name[0].lower() + name[1:]
    matches = list(re.finditer(
        r"(?m)^\s*" + re.escape(property_name) + r"\s*:\s*nodes\s*\{", body))
    if not matches:
        return ()
    if len(matches) != 1:
        raise ValueError("Duplicate authored track " + property_name)
    match = matches[0]
    end = migration.block_end(body, match.end() - 1)
    return bits(explicit_nodes(body[match.end() - 1:end]))


class ParticleNativeTrackNames(unittest.TestCase):
    def test_all_native_reference_tracks_keep_their_serialized_names(self):
        paths = sorted((ROOT / "assets/definitions/particle-reference").glob("*.compiled"))
        self.assertGreaterEqual(len(paths), 100)
        for path in paths:
            expected = audit.decode_particle(path.read_bytes())[3]
            actual = migration.read_gold(path)
            self.assertEqual(len(actual), len(expected), path.name)
            for index, (decoded, emitter) in enumerate(zip(expected, actual)):
                tracks = dict((*decoded[4], *decoded[6]))
                self.assertEqual(set(emitter["tracks"]), set(tracks), path.name)
                for name, nodes in emitter["tracks"].items():
                    with self.subTest(file=path.name, emitter=index, track=name):
                        self.assertEqual(bits(nodes), tracks[name])

    def test_pool_skew_and_powie_launch_are_not_color_tracks(self):
        directory = ROOT / "assets/definitions/particle-reference"
        pool = migration.read_gold(directory / "PoolSparkly.xml.compiled")[0]["tracks"]
        self.assertAlmostEqual(pool["EmitterSkewX"][0][1], -0.3)
        self.assertEqual(pool["EmitterSkewY"], [])
        cloud = migration.read_gold(directory / "Powie.xml.compiled")[0]["tracks"]
        self.assertEqual(cloud["LaunchSpeed"][0][1:3], (2000, 2500))
        self.assertEqual([node[1:3] for node in cloud["SystemAlpha"]], [(1, 1), (0, 0)])

    def test_authored_tracks_keep_native_names_and_every_node_bit(self):
        references = {path.name.casefold(): path for path in
                      (ROOT / "assets/definitions/particle-reference").glob("*.compiled")}
        roots = emitters = tracks = 0
        for path in sorted((ROOT / "assets/definitions/particles").rglob("*.particle.dsl")):
            text = path.read_text(encoding="utf-8")
            root_body = text[:migration.block_end(text, text.index("{"))]
            if re.search(r"\bvariant-of\s*:", root_body):
                continue
            source = re.search(r'\bsource-name\s*:\s*"([^"]+)"', root_body)
            self.assertIsNotNone(source, str(path))
            reference = references[source[1].casefold() + ".xml.compiled"]
            # Compare directly with the independent wire decoder, not with
            # migration.read_gold, so matching importer/compiler mistakes
            # cannot turn a renamed launch-speed track into an accepted color.
            expected = audit.decode_particle(reference.read_bytes())[3]
            bodies = list(emitter_bodies(root_body))
            self.assertEqual(len(bodies), len(expected), path.name)
            roots += 1
            for index, (body, decoded) in enumerate(zip(bodies, expected)):
                native_tracks = dict(decoded[4])
                emitters += 1
                for name in MIGRATED_FIELDS:
                    with self.subTest(file=path.name, emitter=index, track=name):
                        self.assertEqual(authored_track(body, name), native_tracks[name])
                    tracks += 1
        self.assertEqual(roots, len(references))
        self.assertGreaterEqual(roots, 100)
        print(f"Authored/native audit: roots={roots} emitters={emitters} "
              f"tracks={tracks}, including omitted tracks; zero node-bit differences")

    def test_authored_implicit_times_retain_exact_anchor_spacing(self):
        def nodes(*times):
            return "{\n" + "\n".join(
                "{ " + (f"time: {time}; " if time is not None else "") +
                "low: 1; high: 2; }" for time in times) + "\n}"
        self.assertEqual([row[0] for row in explicit_nodes(nodes(None))], [0.0])
        self.assertEqual([row[0] for row in explicit_nodes(nodes(None, None, None))],
                         [0.0, 0.5, 1.0])
        actual = explicit_nodes(nodes(None, "0.25", None, None, "1"))
        self.assertEqual([row[0] for row in actual], [0.0, 0.25, 0.5, 0.75, 1.0])
        actual = explicit_nodes(nodes(None, None, "0.6", None))
        self.assertEqual([row[0] for row in actual], [0.0, 0.3, 0.6, 1.0])


if __name__ == "__main__":
    unittest.main()
