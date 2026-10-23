"""Read-only audit of the retired native-reference particle migration."""
from pathlib import Path
import struct
import re
from fractions import Fraction
import argparse
import json

ROOT = Path(__file__).resolve().parents[1]
SYSTEM = ("SystemDuration CrossFadeDuration SpawnRate SpawnMinActive SpawnMaxActive "
          "SpawnMaxLaunched EmitterRadius EmitterOffsetX EmitterOffsetY EmitterBoxX EmitterBoxY "
          "EmitterSkewX EmitterSkewY EmitterPath ParticleDuration LaunchSpeed LaunchAngle "
          "SystemRed SystemGreen SystemBlue SystemAlpha SystemBrightness").split()
PARTICLE = ("ParticleRed ParticleGreen ParticleBlue ParticleAlpha ParticleBrightness "
            "ParticleSpinAngle ParticleSpinSpeed ParticleScale ParticleStretch CollisionReflect "
            "CollisionSpin ClipTop ClipBottom ClipLeft ClipRight AnimationRate").split()
FIELDS = ("", "Friction", "Acceleration", "Attractor", "MaxVelocity", "Velocity",
          "Position", "SystemPosition", "GroundConstraint", "Shake", "Circle", "Away")
CURVES = ("Constant", "Linear", "EaseIn", "EaseOut", "EaseInOut", "EaseInOutWeak",
          "FastInOut", "FastInOutWeak", "Constant", "Bounce", "BounceFastMiddle",
          "BounceSlowMiddle", "SinWave", "EaseSinWave")
FLAGS = ("randomLaunchSpin", "alignLaunchSpin", "alignToPixel", "systemLoops",
         "particleLoops", "particlesDontFollow", "randomStartTime", "dieIfOverloaded",
         "additive", "fullScreen", "softwareOnly", "hardwareOnly")
EMITTERS = ("Circle", "Box", "BoxPath", "CirclePath", "CircleEvenSpacing")


def f32(value):
    return struct.pack("<f", value)


def decimal(value):
    for digits in range(1, 10):
        text = format(value, f".{digits}g")
        if f32(float(text)) == f32(value):
            return text
    raise ValueError(f"No finite float32 equivalent: {value}")


def time_ratio(value):
    # Recover the exact authored/implicit rational, verifying the old float32.
    rational = Fraction(value).limit_denominator(100000)
    if f32(float(rational)) != f32(value):
        raise ValueError(f"No short time rational: {value}")
    return rational.numerator, rational.denominator


def read_gold(path):
    data = path.read_bytes()
    assert struct.unpack_from("<I", data)[0] == 0xDEADFED5
    count = struct.unpack_from("<I", data, 20)[0]
    size = struct.unpack_from("<I", data, 28)[0]
    assert size == 688
    dumps, at = data[32:32 + count * size], 32 + count * size
    def take(fmt):
        nonlocal at
        result = struct.unpack_from(fmt, data, at)
        at += struct.calcsize(fmt)
        return result
    def string():
        nonlocal at
        length, = take("<I")
        value = data[at:at + length].decode("utf-8")
        at += length
        return value
    def track():
        return [take("<3f2i") for _ in range(take("<I")[0])]
    emitters = []
    for i in range(count):
        image, name = string(), string()
        tracks = {SYSTEM[0]: track()}
        duration = string()
        tracks.update((key, track()) for key in SYSTEM[1:])
        fields = []
        for offset in (408, 424):
            fields_count = struct.unpack_from("<I", dumps, i * size + offset)[0]
            assert take("<I")[0] == 40
            kinds = []
            for _ in range(fields_count):
                kinds.append(take("<i")[0])
                at += 36
            fields.append([(kind, track(), track()) for kind in kinds])
        tracks.update((key, track()) for key in PARTICLE)
        header = struct.unpack_from("<4i", dumps, i * size + 16)
        emitters.append(dict(name=name, header=header, tracks=tracks, fields=fields))
    assert at == len(data)
    return emitters


def block_end(text, opening):
    depth = 0
    for match in re.finditer(r'"(?:\\.|[^"\\])*"|//[^\n]*|/\*[\s\S]*?\*/|[{}]', text[opening:]):
        if match[0] == "{":
            depth += 1
        elif match[0] == "}":
            depth -= 1
            if depth == 0:
                return opening + match.end()
    raise ValueError("Unclosed source block")


def render_track(name, nodes, indent):
    if not nodes:
        return ""
    rows = [f"{indent}{name}: nodes {{"]
    for time, low, high, curve, distribution in nodes:
        try:
            time_text = f"time: {decimal(time)}; "
        except ValueError:
            time_text = ""  # Exact thirds are restored from adjacent time anchors.
        rows.append(f"{indent}    {{ {time_text}low: {decimal(low)}; "
                    f"high: {decimal(high)}; curve: {CURVES[curve]}; "
                    f"distribution: {CURVES[distribution]}; }}")
    rows.append(f"{indent}}}")
    return "\n".join(rows) + "\n"


def migrate(text, emitters):
    pieces, previous, index = [], 0, 0
    for match in re.finditer(r"\bEmitter\s*\{", text):
        if match.start() < previous:
            continue
        end = block_end(text, match.end() - 1)
        body = text[match.end():end - 1]
        keep, at = [], 0
        # Top-level properties: retain images, metadata and integer properties.
        while at < len(body):
            item = re.search(r"\b([\w-]+)\s*(?::|\{)", body[at:])
            if item is None:
                break
            start = at + item.start()
            value_at = at + item.end()
            key = item[1]
            if body[value_at - 1] == "{":
                item_end = block_end(body, value_at - 1)
            else:
                scan = re.match(r"\s*(?:track|range|nodes)\s*\{", body[value_at:])
                item_end = block_end(body, value_at + scan.end() - 1) if scan else body.index(";", value_at) + 1
            if key not in {s[0].lower() + s[1:] for s in SYSTEM + PARTICLE} and key not in (
                    "field", "systemField", "imageFrames", "animated", "emitterType", *FLAGS):
                keep.append("        " + body[start:item_end].strip())
            at = item_end
        emitter = emitters[index]
        rows = ["\n" + "\n".join(keep) + "\n"]
        frames, animated, flags, type_ = emitter["header"]
        rows.append(f"        imageFrames: {frames};\n        animated: {animated};\n"
                    f"        emitterType: {EMITTERS[type_]};\n")
        rows.extend(f"        {name}: 1;\n" for bit, name in enumerate(FLAGS) if flags & (1 << bit))
        for name, nodes in emitter["tracks"].items():
            rows.append(render_track(name[0].lower() + name[1:], nodes, "        "))
        for field_name, fields in zip(("field", "systemField"), emitter["fields"]):
            for kind, x, y in fields:
                rows.append(f"        {field_name} {{\n            fieldType: {FIELDS[kind]};\n")
                rows.append(render_track("x", x, "            "))
                rows.append(render_track("y", y, "            "))
                rows.append("        }\n")
        pieces.extend((text[previous:match.end()], "".join(rows), "    }"))
        previous, index = end, index + 1
    assert index == len(emitters)
    pieces.append(text[previous:])
    return "".join(pieces)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--apply", action="store_true")
    args = parser.parse_args()
    if args.apply:
        parser.error("native-reference injection is retired; authored DSL is authoritative")
    gold = {p.name.casefold(): p for p in (ROOT / "assets/definitions/particle-reference").glob("*.compiled")}
    counts = dict(files=0, emitters=0, nodes=0, fields=0)
    for path in (ROOT / "assets/definitions/particles").rglob("*.particle.dsl"):
        text = path.read_text(encoding="utf-8")
        first_component = text[:block_end(text, text.index("{"))]
        if re.search(r"\bvariant-of\s*:", first_component):
            continue
        source = re.search(r'\bsource-name\s*:\s*"([^"]+)"', text)[1]
        emitters = read_gold(gold[source.casefold() + ".xml.compiled"])
        result = migrate(text, emitters)
        for emitter in emitters:
            counts["emitters"] += 1
            counts["nodes"] += sum(map(len, emitter["tracks"].values()))
            for fields in emitter["fields"]:
                counts["fields"] += len(fields)
                counts["nodes"] += sum(len(x) + len(y) for _, x, y in fields)
        counts["files"] += result != text
    print(json.dumps(counts))


if __name__ == "__main__":
    main()
