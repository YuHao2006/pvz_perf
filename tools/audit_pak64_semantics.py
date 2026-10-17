"""Audit PAK64 definition semantics against the official x64 compiled oracle.

The oracle directory is populated by the official 1073 loader/serializer
(`pak64/compiled64-v1`).  Pointer bytes are intentionally ignored; every
scalar, track node, string, array element, field order, and payload length is
compared after decoding the old zlib wrapper and the new raw PAK64 wrapper.
"""

from __future__ import annotations

import argparse
import pathlib
import struct
import sys
import zipfile
import zlib


class Reader:
    def __init__(self, data: bytes):
        self.data = data
        self.pos = 0

    def raw(self, size: int) -> bytes:
        if size < 0 or self.pos + size > len(self.data):
            raise ValueError(f"truncated payload at {self.pos}, need {size}")
        value = self.data[self.pos : self.pos + size]
        self.pos += size
        return value

    def u32(self) -> int:
        return struct.unpack("<I", self.raw(4))[0]

    def i32(self) -> int:
        return struct.unpack("<i", self.raw(4))[0]

    def f32(self) -> float:
        return struct.unpack("<f", self.raw(4))[0]

    def string(self) -> str:
        return self.raw(self.u32()).decode("utf-8", "replace")


def payload(data: bytes) -> bytes:
    cookie = struct.unpack_from("<I", data)[0]
    if cookie == 0xDEADFED4:
        expected = struct.unpack_from("<I", data, 4)[0]
        value = zlib.decompress(data[8:])
        if len(value) != expected:
            raise ValueError("old compiled size mismatch")
        return value
    if cookie == 0xDEADFED5:
        expected = struct.unpack_from("<I", data, 4)[0]
        value = data[8:]
        if len(value) != expected:
            raise ValueError("PAK64 compiled size mismatch")
        return value
    raise ValueError(f"unknown compiled cookie {cookie:#x}")


def track(reader: Reader):
    result = []
    for _ in range(reader.u32()):
        # Preserve float bit patterns.  Exact bits are useful: the game uses
        # these values in deterministic animation and particle interpolation.
        result.append((reader.raw(4), reader.raw(4), reader.raw(4), reader.raw(4), reader.raw(4)))
    return tuple(result)


def decode_reanim(data: bytes):
    reader = Reader(payload(data))
    schema = reader.u32()
    definition = reader.raw(32)
    count = struct.unpack_from("<I", definition, 8)[0]
    element_size = reader.u32()
    raw_tracks = [reader.raw(element_size) for _ in range(count)]
    tracks = []
    for raw_track in raw_tracks:
        name = reader.string()
        transform_count = struct.unpack_from("<I", raw_track, 16)[0]
        transform_size = reader.u32()
        raw_transforms = [reader.raw(transform_size) for _ in range(transform_count)]
        deep = tuple((reader.string(), reader.string(), reader.string()) for _ in raw_transforms)
        # The last three native fields are relocated pointers and necessarily
        # differ between processes/architectures. The first eight floats are
        # the complete semantic Reanim transform.
        scalar_transforms = tuple(raw[:32] for raw in raw_transforms)
        tracks.append((name, scalar_transforms, deep))
    return schema, count, element_size, tuple(tracks), reader.pos, len(reader.data)


SYSTEM_TRACKS = (
    "SystemDuration", "CrossFadeDuration", "SpawnRate", "SpawnMinActive",
    "SpawnMaxActive", "SpawnMaxLaunched", "EmitterRadius", "EmitterOffsetX",
    "EmitterOffsetY", "EmitterBoxX", "EmitterBoxY", "EmitterPath",
    "EmitterSkewX", "EmitterSkewY", "ParticleDuration", "SystemRed",
    "SystemGreen", "SystemBlue", "SystemAlpha", "SystemBrightness",
    "LaunchSpeed", "LaunchAngle",
)
PARTICLE_TRACKS = (
    "ParticleRed", "ParticleGreen", "ParticleBlue", "ParticleAlpha",
    "ParticleBrightness", "ParticleSpinAngle", "ParticleSpinSpeed",
    "ParticleScale", "ParticleStretch", "CollisionReflect", "CollisionSpin",
    "ClipTop", "ClipBottom", "ClipLeft", "ClipRight", "AnimationRate",
)


def decode_particle(data: bytes):
    reader = Reader(payload(data))
    schema = reader.u32()
    definition = reader.raw(16)
    count = struct.unpack_from("<I", definition, 8)[0]
    element_size = reader.u32()
    raw_emitters = [reader.raw(element_size) for _ in range(count)]
    emitters = []
    for raw_emitter in raw_emitters:
        # Pointer fields are skipped. These are the native scalar fields.
        scalars = tuple(struct.unpack_from("<i", raw_emitter, offset)[0]
                        for offset in (8, 12, 16, 20, 24, 28))
        particle_count = struct.unpack_from("<I", raw_emitter, 408)[0]
        system_count = struct.unpack_from("<I", raw_emitter, 424)[0]
        image = reader.string()
        name = reader.string()
        system = [(SYSTEM_TRACKS[0], track(reader))]
        on_duration = reader.string()
        for track_name in SYSTEM_TRACKS[1:]:
            system.append((track_name, track(reader)))

        fields = []
        for field_count in (particle_count, system_count):
            field_size = reader.u32()
            raw_fields = [reader.raw(field_size) for _ in range(field_count)]
            decoded = []
            for raw_field in raw_fields:
                field_type = struct.unpack_from("<i", raw_field)[0]
                decoded.append((field_type, track(reader), track(reader)))
            fields.append(tuple(decoded))

        particles = tuple((name, track(reader)) for name in PARTICLE_TRACKS)
        emitters.append((scalars, image, name, on_duration, tuple(system),
                         tuple(fields), particles))
    return schema, count, element_size, tuple(emitters), reader.pos, len(reader.data)


TRAIL_TRACKS = ("WidthOverLength", "WidthOverTime", "AlphaOverLength",
                "AlphaOverTime", "TrailDuration")


def decode_trail(data: bytes):
    reader = Reader(payload(data))
    schema = reader.u32()
    definition = reader.raw(104)
    scalars = (struct.unpack_from("<i", definition, 8)[0],
               struct.unpack_from("<f", definition, 12)[0],
               struct.unpack_from("<i", definition, 16)[0])
    image = reader.string()
    tracks = tuple((name, track(reader)) for name in TRAIL_TRACKS)
    return schema, scalars, image, tracks, reader.pos, len(reader.data)


def decode(path_name: str, data: bytes):
    lower = path_name.lower()
    if lower.startswith("reanim/"):
        return decode_reanim(data)
    if lower.endswith(".trail") or lower.endswith(".trail.compiled"):
        return decode_trail(data)
    return decode_particle(data)


def structural_checks(package: pathlib.Path, decoded_records, allow_trimmed=False):
    errors = []
    with zipfile.ZipFile(package) as archive:
        names = archive.namelist()
        normalized = [name.replace('\\', '/').lower() for name in names]
        if len(normalized) != len(set(normalized)):
            errors.append("duplicate case-insensitive ZIP entries")
        if any(info.flag_bits & 1 for info in archive.infolist()):
            errors.append("encrypted ZIP entry present")
        if any(info.compress_type != zipfile.ZIP_STORED or
               info.compress_size != info.file_size
               for info in archive.infolist()):
            errors.append("compressed ZIP entry present (PAK64 requires stored entries)")
        if any(name.startswith(("cached/", "data/cached/"))
               for name in normalized):
            errors.append("legacy cached audio directory present")
        if any(any(part in ("", ".", "..") for part in name.split("/"))
               for name in normalized):
            errors.append("non-canonical or traversal ZIP path present")

        source = {
            name.replace('\\', '/').lower()
            for name in names
            if (name.replace('\\', '/').lower().startswith(('reanim/', 'particles/'))
                and name.lower().endswith(('.reanim', '.xml', '.trail')))
        }
        compiled = {
            name.replace('\\', '/').lower()
            for name in names
            if name.replace('\\', '/').lower().startswith('compiled/')
            and name.lower().endswith('.compiled')
        }
        if source:
            expected = {f"compiled/{path}.compiled" for path in source}
            missing = sorted(expected - compiled)
            extra = sorted(compiled - expected)
            if missing:
                errors.append(f"missing compiled records: {missing[:5]}")
            if extra:
                errors.append(f"compiled records without source definitions: {extra[:5]}")
        elif not allow_trimmed:
            errors.append("source definitions absent; use --trimmed only for an audited release trim")

        for relative, decoded in decoded_records.items():
            try:
                raw = payload(decoded)
            except Exception as error:
                errors.append(f"{relative}: {error}")
                continue
            if struct.unpack_from('<I', decoded)[0] != 0xDEADFED5:
                errors.append(f"{relative}: output is not raw PAK64 format")
            try:
                decoded_value = decode(relative, decoded)
                if decoded_value[-2] != decoded_value[-1]:
                    errors.append(f"{relative}: deep payload has trailing or missing bytes")
                schema = decoded_value[0]
                expected_schema = (166247922 if relative.lower().startswith('reanim/')
                                   else 2223553544 if relative.lower().endswith('.trail.compiled')
                                   else 3767703017)
                if schema != expected_schema:
                    errors.append(f"{relative}: schema hash {schema} != {expected_schema}")
            except Exception as error:
                errors.append(f"{relative}: decode failure: {error}")
    return errors


def compare(oracle: pathlib.Path, package: pathlib.Path, allow_trimmed=False):
    with zipfile.ZipFile(package) as archive:
        packaged = {name.lower(): archive.read(name)
                    for name in archive.namelist()
                    if name.lower().startswith("compiled/")}
    common = 0
    mismatches = []
    decoded_records = {key[len("compiled/"):]: value for key, value in packaged.items()}
    for path in sorted(oracle.rglob("*.compiled")):
        relative = path.relative_to(oracle).as_posix()
        key = f"compiled/{relative}".lower()
        if key not in packaged:
            mismatches.append((relative, "missing"))
            continue
        common += 1
        try:
            left = decode(relative, path.read_bytes())
            right = decode(relative, packaged[key])
            if left != right:
                mismatches.append((relative, "semantic mismatch"))
        except Exception as error:  # Keep auditing all records after one bad file.
            mismatches.append((relative, f"decode failure: {error}"))
    print(f"oracle records: {sum(1 for _ in oracle.rglob('*.compiled'))}")
    print(f"common records: {common}")
    print(f"package compiled records: {len(packaged)}")
    print(f"mismatches: {len(mismatches)}")
    for path, reason in mismatches:
        print(f"  {path}: {reason}")
    structural = structural_checks(package, decoded_records, allow_trimmed)
    print(f"structural errors: {len(structural)}")
    for error in structural:
        print(f"  {error}")
    return not mismatches and not structural


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("package", type=pathlib.Path)
    parser.add_argument("--oracle", type=pathlib.Path,
                        default=pathlib.Path(__file__).parents[2] / "pak64" / "compiled64-v1")
    parser.add_argument("--trimmed", action="store_true",
                        help="allow an independently audited package with source XML removed")
    args = parser.parse_args()
    return 0 if compare(args.oracle, args.package, args.trimmed) else 1


if __name__ == "__main__":
    raise SystemExit(main())
