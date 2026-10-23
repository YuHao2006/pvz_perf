"""Turn final offline PAV6 records into native, constant-initialized particles."""
from __future__ import annotations

import math
from pathlib import Path
import re

import build_numeric_runtime_pak64 as pak
from static_definition_codegen import array, cpp_float

SHARD_COUNT = 8
CURVES = ("Constant", "Linear", "EaseIn", "EaseOut", "EaseInOut",
          "EaseInOutWeak", "FastInOut", "FastInOutWeak", "Constant",
          "Bounce", "BounceFastMiddle", "BounceSlowMiddle", "SinWave", "EaseSinWave")
SYSTEM_TRACKS = (
    "SystemDuration", "CrossFadeDuration", "SpawnRate", "SpawnMinActive",
    "SpawnMaxActive", "SpawnMaxLaunched", "EmitterRadius", "EmitterOffsetX",
    "EmitterOffsetY", "EmitterBoxX", "EmitterBoxY", "EmitterSkewX", "EmitterSkewY",
    "EmitterPath", "ParticleDuration", "LaunchSpeed", "LaunchAngle", "SystemRed",
    "SystemGreen", "SystemBlue", "SystemAlpha", "SystemBrightness")
PARTICLE_TRACKS = (
    "ParticleRed", "ParticleGreen", "ParticleBlue", "ParticleAlpha",
    "ParticleBrightness", "ParticleSpinAngle", "ParticleSpinSpeed", "ParticleScale",
    "ParticleStretch", "CollisionReflect", "CollisionSpin", "ClipTop", "ClipBottom",
    "ClipLeft", "ClipRight", "AnimationRate")
DEFAULTS = {
    **dict.fromkeys(("SpawnMinActive", "SpawnMaxActive", "SpawnMaxLaunched"), -1.0),
    "ParticleDuration": 100.0,
    **dict.fromkeys(("SystemRed", "SystemGreen", "SystemBlue", "SystemAlpha",
                     "SystemBrightness", "ParticleRed", "ParticleGreen", "ParticleBlue",
                     "ParticleAlpha", "ParticleBrightness", "ParticleScale",
                     "ParticleStretch"), 1.0),
}
RENDER_TRACKS = (
    "SystemRed", "SystemGreen", "SystemBlue", "SystemAlpha", "SystemBrightness",
    "ParticleRed", "ParticleGreen", "ParticleBlue", "ParticleAlpha", "ParticleBrightness",
    "ParticleScale", "ParticleStretch", "ParticleSpinSpeed", "ParticleSpinAngle")


def _registry() -> tuple[int, int]:
    header = (Path(__file__).resolve().parents[1] /
              "pvzPerf/Sexy.TodLib/generated/ParticleEmitterName.h").read_text(encoding="utf-8")
    count = re.search(r"\btop\s*=\s*(\d+)", header)
    hash_ = re.search(r"\bkParticleEmitterNameTableHash\s*=\s*(\d+)", header)
    pak.require(count is not None and hash_ is not None, "Missing particle emitter name registry")
    return int(count[1]), int(hash_[1])


def _parse(path: str, data: bytes, name_count: int, name_hash: int) -> dict:
    atlas = pak.parse_definition_atlas(path, data)
    pak.require(atlas is not None and "variant_rectangles" in atlas
                and data[:4] == b"\xdc\xfe\xad\xde",
                f"Static particles require PAV6: {path}")
    reader = pak.Reader(data[20:atlas["appearance_offset"]])
    magic, total, hash_, count, body_size = reader.unpack("<5I")
    pak.require(magic == 0x36524449 and hash_ == name_hash
                and count == atlas["emitter_count"] and total == atlas["slot_count"],
                f"Invalid static IDR6 header: {path}")
    body = pak.Reader(reader.take(body_size))

    def track() -> list[tuple]:
        nodes = [body.unpack("<3f2I") for _ in range(body.count(20, 100000))]
        pak.require(all(all(math.isfinite(v) for v in node[:3])
                        and node[3] < len(CURVES) and node[4] < len(CURVES)
                        for node in nodes), "Invalid static IDR6 track node")
        return nodes

    emitters = []
    for index in range(count):
        offset, frames, image_frames, animated, flags, type_ = body.unpack("<2I3iI")
        pak.require(offset == atlas["slot_offsets"][index]
                    and frames == atlas["frame_counts"][index]
                    and image_frames > 0 and animated in (0, 1)
                    and 0 <= flags < (1 << 12) and type_ <= 4,
                    "Invalid static IDR6 emitter")
        tracks = dict(zip(SYSTEM_TRACKS, (track() for _ in SYSTEM_TRACKS)))
        fields = []
        for _ in range(2):
            row = []
            for _ in range(body.count(12, 4)):
                type_id = body.word()
                pak.require(0 < type_id < 12, "Invalid static IDR6 field type")
                row.append((type_id, track(), track()))
            fields.append(row)
        tracks.update(zip(PARTICLE_TRACKS, (track() for _ in PARTICLE_TRACKS)))
        for name, value in DEFAULTS.items():
            if not tracks[name]:
                tracks[name] = [(0.0, value, value, 0, 1)]
        mask = sum(1 << bit for bit, name in enumerate(RENDER_TRACKS)
                   if tracks[name] and CURVES[tracks[name][0][3]] != "Constant")
        emitters.append({"offset": offset, "frames": frames, "image_frames": image_frames,
                         "animated": animated, "flags": flags, "type": type_,
                         "tracks": tracks, "fields": fields, "mask": mask})
    body.finish()
    pak.require(reader.unpack("<2I") == (0x33544449, count), "Invalid static IDT3 section")
    for emitter in emitters:
        target = reader.word()
        pak.require(target == 0xFFFFFFFF or target < count, "Invalid static duration target")
        emitter["duration"] = -1 if target == 0xFFFFFFFF else target
    pak.require(reader.unpack("<2I") == (0x35544449, count), "Invalid static IDT5 section")
    lookup = [-1] * name_count
    for index, emitter in enumerate(emitters):
        name = reader.word()
        pak.require(name < name_count, "Invalid static emitter name ID")
        emitter["name"] = name
        if lookup[name] == -1:
            lookup[name] = index
    reader.finish()
    return {"atlas": atlas, "emitters": emitters, "lookup": lookup}


def generate(config, records: dict[str, bytes]) -> dict:
    """Return fixed eight source shards and central root-table fragments."""
    order = config.definition_orders.get("particle")
    pak.require(bool(order), "Static particles require definition_order(particle ...)")
    name_count, name_hash = _registry()
    shards = [[
        '#include "../GeneratedDefinitions.h"',
        '#include "../GeneratedDefinitionStorage.h"',
        "namespace GeneratedDefinitions {",
        f"static_assert(static_cast<unsigned>(ParticleEmitterName::top) == {name_count}u);",
        f"static_assert(kParticleEmitterNameTableHash == {name_hash}u);",
    ] for _ in range(SHARD_COUNT)]
    declarations, initializers = [], []
    summary = dict(definitions=len(order), emitters=0, nodes=0, fields=0,
                   variants=0, rectangles=0, rectangle_bytes=0, shards=SHARD_COUNT)
    expected = set()
    for index, (_, name) in enumerate(order):
        path = f"compiled/particles/{name.casefold()}.compiled"
        pak.require(path not in expected, f"Duplicate static particle root: {path}")
        expected.add(path)
        pak.require(path in records, f"Missing static particle record: {path}")
        definition = _parse(path, records[path], name_count, name_hash)
        atlas, emitters = definition["atlas"], definition["emitters"]
        code = shards[index % SHARD_COUNT]
        prefix = f"Particle{index}"
        node_number = 0

        def emit_track(nodes: list[tuple]) -> str:
            nonlocal node_number
            values = ["{" + ", ".join((*map(cpp_float, node[:3]),
                       "Curves::" + CURVES[node[3]], "Curves::" + CURVES[node[4]])) + "}"
                      for node in nodes]
            pointer = array(declarations, code, "FloatParameterTrackNode",
                            f"{prefix}Nodes{node_number}", values)
            node_number += 1
            summary["nodes"] += len(nodes)
            return "{" + pointer + f", {len(nodes)}" + "}"

        emitter_values = []
        for emitter_index, emitter in enumerate(emitters):
            tracks = {name: emit_track(emitter["tracks"][name])
                      for name in (*SYSTEM_TRACKS, *PARTICLE_TRACKS)}
            fields = []
            for field_index, row in enumerate(emitter["fields"]):
                values = ["{static_cast<ParticleFieldType>(" + str(type_) + "), "
                          + emit_track(x) + ", " + emit_track(y) + "}"
                          for type_, x, y in row]
                pointer = array(declarations, code, "ParticleField",
                                f"{prefix}Emitter{emitter_index}Fields{field_index}", values)
                fields.append("{" + pointer + f", {len(row)}" + "}")
                summary["fields"] += len(row)
            values = [str(emitter["offset"]) + "u", str(emitter["frames"]),
                      str(emitter["image_frames"]), str(emitter["animated"]), str(emitter["flags"]),
                      f"static_cast<EmitterType>({emitter['type']})",
                      f"static_cast<ParticleEmitterName>({emitter['name']})",
                      *(tracks[name] for name in SYSTEM_TRACKS), *fields,
                      *(tracks[name] for name in PARTICLE_TRACKS),
                      str(emitter["duration"]), str(emitter["mask"]) + "u"]
            emitter_values.append("{" + ", ".join(values) + "}")
        emitter_pointer = array(declarations, code, "TodEmitterDefinition",
                                prefix + "Emitters", emitter_values)
        variants, slots = atlas["variant_count"], atlas["slot_count"]
        texture_pointer = array(declarations, code, "Sexy::GpuTexture*",
                                prefix + "Textures", ["nullptr"] * variants)
        width_pointer = array(declarations, code, "int", prefix + "TextureWidths",
                              [str(dim[0]) for dim in atlas["variant_dimensions"]])
        height_pointer = array(declarations, code, "int", prefix + "TextureHeights",
                               [str(dim[1]) for dim in atlas["variant_dimensions"]])
        rectangles = ["{" + ", ".join(map(str, rect)) + "}"
                      for row in atlas["variant_rectangles"] for rect in row]
        rectangle_pointer = array(declarations, code, "Sexy::Rect", prefix + "Rects",
                                  rectangles, readonly=True)
        initializers.append("{" + ", ".join((
            texture_pointer, width_pointer, height_pointer, f"{variants}u", f"{slots}u",
            rectangle_pointer, emitter_pointer, str(len(emitters)),
            "{{" + ", ".join(map(str, definition["lookup"])) + "}}")) + "}")
        summary["emitters"] += len(emitters)
        summary["variants"] += variants
        summary["rectangles"] += len(rectangles)
    summary["rectangle_bytes"] = summary["rectangles"] * 16
    summary["unindexed_records"] = sorted(path for path in records
                                         if pak.numeric_kind(path) == "particles"
                                         and path not in expected)
    return {
        "files": {f"ParticleData{index:02d}.cpp": ("\n".join(code + ["}"]) + "\n").encode()
                  for index, code in enumerate(shards)},
        "declarations": declarations, "initializers": initializers, "summary": summary,
    }
