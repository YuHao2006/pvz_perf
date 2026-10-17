#!/usr/bin/env python3
"""Package audited numeric runtime assets without modifying any input.

Usage: python -B tools/build_numeric_runtime_pak64.py SOURCE STAGE OUTPUT --root ROOT

OUTPUT must be a new, separately named archive, not main.pak64. The adjacent
manifest is also exclusively created, before the archive publication marker.
The two names are not a crash-atomic transaction. No compiler, game, or subprocess runs.
This is a packaging/reference audit, NOT a complete compiled-string audit.
Font author removals come from the validated staged numeric resource manifest.
Legacy XML entries are removal-only bytes, never parsed.
"""

from __future__ import annotations

import argparse
import hashlib
import io
import json
import math
import os
from pathlib import Path, PurePosixPath
import posixpath
import re
import stat
import struct
import tempfile
import zipfile
import zlib


ROOT = Path(__file__).resolve().parents[1]
COUNTS = {"reanim": 146, "particles": 106, "fonts": 20, "resources": 1}
RESOURCE_PATH = "compiled/resources.compiled"
LEGACY_RESOURCE_PATH = "compiled/properties/resources.numeric.resources"
RESOURCE_KIND_NONE = 3
RESOURCE_SLOT_NONE = 0xFFFFFFFF
SHADER_HEADERS = (b"VSFX", b"\x03\x02\x23\x07", b"DXBC", b"DXIL")
TEST_MACROS = (
    "SEXY_DEFINITION_COMPAT_TEST_ONLY",
    "SEXY_FONT_TEXT_COMPAT_TEST_ONLY",
)
TOKEN = re.compile(
    r'R"(?P<delimiter>[^ ()\\\t\r\n]{0,16})\(.*?\)(?P=delimiter)"'
    r'|"(?:\\.|[^"\\])*"|\'(?:\\.|[^\'\\])*\'|//[^\n]*|/\*.*?\*/',
    re.S,
)
CPP_SUFFIXES = {".cpp", ".c", ".h", ".hpp", ".inl"}


def require(condition: bool, message: str) -> None:
    if not condition:
        raise ValueError(message)


def key(name: str) -> str:
    path = name.replace("\\", "/")
    parts = (path[:-1] if path.endswith("/") else path).split("/")
    require(bool(path) and not path.startswith("/") and "\0" not in path
            and all(p and p not in (".", "..") and not any(c in p for c in ':<>|"*?')
                    and p == p.rstrip(" .") and not any(ord(c) < 32 for c in p)
                    and not re.fullmatch(r"(?i:con|prn|aux|nul|com[1-9]|lpt[1-9])", p.split(".")[0])
                    for p in parts), f"Unsafe archive path: {name!r}")
    return "/".join(parts).casefold()


def file_key(name: str) -> str:
    require(not name.endswith(("/", "\\")), f"File reference names a directory: {name!r}")
    return key(name)


def digest(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def fingerprint(path: Path) -> dict:
    with path.open("rb") as stream:
        h = hashlib.sha256()
        for block in iter(lambda: stream.read(1024 * 1024), b""):
            h.update(block)
        return {"sha256": h.hexdigest(), "bytes": stream.tell()}


def clean_comments(text: str) -> str:
    return TOKEN.sub(lambda m: re.sub(r"[^\n]", " ", m[0])
                     if m[0].startswith(("//", "/*")) else m[0], text)


def production_text(text: str) -> str:
    """Exclude only proven-off test gates; retain BOTH unknown branches."""
    text = clean_comments(text)
    stack = []
    active = True
    result = []
    for line in text.splitlines(keepends=True):
        directive = re.match(r"\s*#\s*(if|ifdef|ifndef|elif|else|endif)\b(.*)", line)
        if not directive:
            if active:
                require(not re.match(r"\s*#\s*define\s+(?:" + "|".join(TEST_MACROS)
                                     + r")\b", line), "Production enables a test-only importer")
                result.append(line)
            else:
                result.append("\n" if line.endswith("\n") else "")
            continue
        op, expression = directive.groups()
        expression = expression.strip()
        if op in ("if", "ifdef", "ifndef", "elif"):
            value = None
            if expression in ("0", "1") and op in ("if", "elif"):
                value = expression == "1"
            for macro in TEST_MACROS:
                if expression == macro and op in ("ifdef", "ifndef"):
                    value = op == "ifndef"
                elif re.fullmatch(r"!?\s*defined\s*(?:\(\s*" + macro
                                  + r"\s*\)|" + macro + r")", expression):
                    value = expression.startswith("!")
                elif macro in expression:
                    raise ValueError(f"Unsupported test-gate expression: {line.strip()}")
        if op in ("if", "ifdef", "ifndef"):
            stack.append([active, value, False])
            active = active and value is not False
        elif op == "elif":
            require(bool(stack) and not stack[-1][2], "Unbalanced #elif")
            parent, previous, _ = stack[-1]
            active = parent and previous is not True and value is not False
            stack[-1][1] = True if previous is True or value is True else (
                False if previous is False and value is False else None)
        elif op == "else":
            require(bool(stack) and not stack[-1][2], "Unbalanced #else")
            parent, value, _ = stack[-1]
            stack[-1][2] = True
            active = parent and value is not True
        else:
            require(bool(stack), "Unbalanced #endif")
            active = stack.pop()[0]
        result.append("\n" if line.endswith("\n") else "")
    require(not stack, "Unclosed production preprocessor gate")
    return "".join(result)


def literals(text: str):
    for match in TOKEN.finditer(text):
        value = match[0]
        if value.startswith('R"'):
            delimiter = match["delimiter"]
            yield match, value[len(delimiter) + 3:-(len(delimiter) + 2)]
        elif value.startswith('"'):
            value = value[1:-1]
            value = re.sub(r'\\([\\"])', r"\1", value)
            yield match, value


def source_audit(root: Path, removed: dict[str, str], numeric_names: set[str]) -> dict:
    game = root / "pvzPerf"
    paths = {p for p in game.iterdir() if p.is_file() and p.suffix in CPP_SUFFIXES}
    for directory in ("Lawn", "Sexy.TodLib", "SexyAppFramework"):
        require((game / directory).is_dir(), f"Missing runtime source tree: {directory}")
        paths.update(p for p in (game / directory).rglob("*")
                     if p.is_file() and p.suffix in CPP_SUFFIXES)
    paths.update(root.glob("CMakeLists.txt"))
    paths.update((root / "CMake").rglob("*.cmake"))
    for directory in ("Lawn", "Sexy.TodLib", "SexyAppFramework"):
        paths.update((game / directory).rglob("CMakeLists.txt"))
    raw, production, records = {}, {}, []
    for path in sorted(paths):
        relative = path.relative_to(game if path.is_relative_to(game) else root).as_posix()
        data = path.read_bytes()
        raw[relative] = data.decode("utf-8-sig")
        records.append({"name": relative, "sha256": digest(data), "bytes": len(data)})
        if path.suffix in CPP_SUFFIXES:
            production[relative] = production_text(raw[relative])
        else:
            text = re.sub(r"#[^\n]*", "", raw[relative])
            # These explicit offline targets may bake assets; they must never
            # enable the authoring macro on, or link into, a production target.
            offline = {"compile_numeric_scale", "sexy_scale_authoring"}
            text = re.sub(
                r"target_compile_definitions\s*\(\s*(?:compile_numeric_scale|sexy_scale_authoring)"
                r"\s+(?:PRIVATE|PUBLIC)\s+SEXY_SCALE_EFFECT_AUTHORING=1\s*\)", "", text)
            require(not any(m in text for m in TEST_MACROS),
                    f"Build source mentions a disabled importer: {relative}")
            for command in re.finditer(r"target_link_libraries\s*\(\s*(\S+)\s+([^)]*)\)", text):
                target, dependencies = command.groups()
                if set(dependencies.split()) & offline:
                    require(target in offline or target.endswith("_tests"),
                            f"Production links an offline authoring target: {relative}: {target}")

    routes = {
        "LawnApp.cpp": ['ParseResourcesFile("compiled/resources.compiled")'],
        "Sexy.TodLib/Reanimator.cpp": [
            'DefinitionCompiledPath(gReanimationParamArray[(int)theReanimType].mReanimFileName)',
            "DefinitionOpenCompiledFile(aV4Path.c_str())",
            "0x35544449u", "ReanimationTryLoadDefinitionV4(theReanimType, aReanimDef)",
        ],
        "Sexy.TodLib/TodParticle.cpp": [
            'DefinitionCompiledPath(theParticleFileName)',
            "DefinitionOpenCompiledFile(path.c_str())",
            "0x35504449u", "TodParticleTryLoadDefinitionV4(theParticleDef, theParticleFileName)",
        ],
        "SexyAppFramework/graphics/ImageFont.cpp": [
            "ResolveCompiledFontPath(theFontDescFileName)", '"compiled/fonts/"',
            'const std::string suffix = ".compiled"', "0x544E464Eu",
        ],
        "SexyAppFramework/misc/ResourceManager.cpp": [
            "return ParseNumericResourcesFile(theFilename)", "0x4353524Eu",
        ],
        "SexyAppFramework/effect/ScaleEffectCompiler.cpp": [
            'path+=".vfx"', "0x58465356u",
        ],
        "SexyAppFramework/SexyAppBase.cpp": [
            "sourceCompiler.CompileFile(sourcePath,{},metadata,error)",
            "sourceCompiler.CompileD3d12(sourcePath,{},metadata,error)",
            "metadata.mSourcePath=sourcePath;",
        ],
        "SexyAppFramework/graphics/vulkan/VulkanScalePipeline.cpp": [
            "std::filesystem::path(effect.mSourcePath).parent_path()/texture.mSource",
        ],
    }
    for name, markers in routes.items():
        require(name in production and all(m in production[name] for m in markers),
                f"Numeric production route changed or missing: {name}")
    binary_readers, offline_readers = [], []
    for name, text in production.items():
        if "ScaleEffectBinary::Load" not in text:
            continue
        if "/tests/" in name:
            offline_readers.append(name)
        else:
            without_definition = re.sub(r"\bbool\s+ScaleEffectBinary::Load\s*\(",
                                        "bool OfflineScaleLoadDefinition(", text)
            if "ScaleEffectBinary::Load" in without_definition:
                binary_readers.append(name)
    require(not binary_readers, f"Production scale binary reader prevents VFX retirement: {binary_readers}")
    for backend in ("vulkan", "d3d12"):
        name = f"SexyAppFramework/graphics/{backend}/CMakeLists.txt"
        require(re.search(r"target_compile_definitions\s*\(\s*sexy_" + backend
                          + r"_effects\s+PUBLIC\s+SEXY_SCALE_EFFECT_AUTHORING=1\s*\)",
                          re.sub(r"#[^\n]*", "", raw.get(name, ""))),
                f"Missing startup HLSL compiler definition: {name}")
    forbidden = r"\b(?:LoadDescriptor|LoadTextForTest|DoParseResources|DefinitionReadXML|DefinitionLoadXML)\s*\("
    accepted = []
    reanim_types = 0
    table_paths = {"reanim": set(), "particles": set()}
    for name, text in production.items():
        require(not re.search(r"\b(?:XMLParser|XMLElement|SEXY_RESOURCE_XML_TEST_IMPORTER)\b", text),
                f"XML importer in production: {name}")
        calls = text
        if PurePosixPath(name).suffix in (".h", ".hpp"):
            calls = re.sub(
                r"\b(?:virtual\s+)?bool\s+(?:LoadDescriptor|LoadTextForTest|DoParseResources"
                r"|DefinitionReadXML|DefinitionLoadXML)\s*\([^;{}]*\)\s*;", "", calls)
        require(not re.search(forbidden, calls), f"Author importer in production: {name}")
        # The generic legacy reader may be defined, but may not have callers.
        occurrences = len(re.findall(r"\bDefinitionReadCompiledFile\s*\(", text))
        require(occurrences <= (1 if name in ("Sexy.TodLib/Definition.cpp", "Sexy.TodLib/Definition.h") else 0),
                f"Old compiled-definition consumer in production: {name}")
        for match, value in literals(text):
            if not value or "\n" in value:
                continue
            require(value != ".v4.compiled" and
                    (value != ".compiled" or name in
                     ("Sexy.TodLib/Definition.cpp", "SexyAppFramework/graphics/ImageFont.cpp")),
                    f"Legacy compiled suffix in production: {name}")
            try:
                normalized = key(value)
            except ValueError:
                continue
            before = text[max(0, match.start() - 180):match.start()]
            after = text[match.end():match.end() + 90]
            reanim_table = (
                name == "Sexy.TodLib/Reanimator.cpp"
                and re.search(r"\{\s*ReanimationType::\w+\s*,\s*$", before)
                and re.match(r"\s*,", after)
            )
            particle_table = (
                name == "Sexy.TodLib/TodParticle.cpp"
                and re.search(r"\{\s*ParticleEffect::\w+\s*,\s*$", before)
                and re.match(r"\s*\}", after)
            )
            table = bool(reanim_table or particle_table)
            if table:
                numeric_path = definition_path(normalized)
                require(numeric_path in numeric_names, f"Production definition lacks numeric equivalent: {value}")
                table_paths["reanim" if reanim_table else "particles"].add(numeric_path)
                if reanim_table:
                    reanim_types += 1
            if normalized not in removed:
                continue
            font = (removed[normalized] == "font_dsl"
                    and re.search(r"(?:ImageFont(?:\s+\w+)?|ResolveCompiledFontPath)\s*\([^;{}]*$", before)
                    and font_path(normalized) in numeric_names)
            require(bool(table or font), f"Removed file still has a production reference: {name}: {value}")
            accepted.append({"source": name, "path": value, "consumer": "numeric_path_resolver"})
    require(table_paths["particles"] ==
            {n for n in numeric_names if numeric_kind(n) == "particles"},
            "Staged IDP5 corpus must exactly match the live 106-entry particle table")
    require(bool(table_paths["reanim"]), "Missing live reanimation table")

    def constant(name: str, source: str) -> int:
        match = re.search(r"\b" + name + r"\s*=\s*(0[xX][0-9A-Fa-f]+|\d+)[uU]?\s*;", production.get(source, ""))
        require(match is not None, f"Missing registry constant: {name}")
        return int(match[1], 0)

    font_hash = re.search(r"TodFontSymbolRegistryHash\(\)\s*\{\s*return\s+(0x[0-9A-Fa-f]+)[uU]?\s*;",
                         production.get("Sexy.TodLib/TodCommon.cpp", ""))
    require(font_hash is not None, "Font-symbol registry hash changed")
    registries = {
        "track": constant("PVZ_REANIM_TRACK_TABLE_HASH", "Sexy.TodLib/ReanimTrackId.h"),
        "image": constant("IMAGE_SYMBOL_REGISTRY_CRC", "Sexy.TodLib/generated/NumericResourceBindings.h"),
        "font": int(font_hash[1], 0),
        "emitter": constant("kParticleEmitterNameTableHash", "Sexy.TodLib/generated/ParticleEmitterName.h"),
        "slots": constant("NUMERIC_RESOURCE_SLOT_COUNT", "Sexy.TodLib/generated/NumericResourceBindings.h"),
        "track_max": constant("PVZ_REANIM_TRACK_ID_COUNT", "Sexy.TodLib/ReanimTrackId.h"),
        "track_capacity": constant("kReanimActiveMaskCapacityBits", "Sexy.TodLib/Reanimator.h"),
        "image_max": constant("IMAGE_SYMBOL_ID_MAX", "Sexy.TodLib/generated/ImageSymbolId.h"),
        "emitter_count": constant("kParticleEmitterNameCount", "Sexy.TodLib/generated/ParticleEmitterName.h") + 1,
        "groups": constant("RESOURCE_GROUP_COUNT", "ResourceGroupId.h"),
        "reanim_types": reanim_types,
    }
    bindings = production["Sexy.TodLib/generated/NumericResourceBindings.h"]
    for field, array in (("resource_kinds", "gNumericResourceKinds"),
                         ("image_slots", "gImageSymbolResourceSlots")):
        match = re.search(r"\b" + array + r"\[(\d+)\]\s*=\s*\{([^}]*)\}", bindings, re.S)
        require(match is not None, f"Missing registry array: {array}")
        values = [v.strip() for v in match[2].split(",") if v.strip()]
        require(len(values) == int(match[1]) and
                all(re.fullmatch(r"(?:0[xX][0-9A-Fa-f]+|\d+)[uU]?", v) for v in values),
                f"Invalid registry array: {array}")
        registries[field] = [int(v.rstrip("uU"), 0) for v in values]
    require(registries["slots"] >= 879 and len(registries["resource_kinds"]) == 879
            and all(v <= RESOURCE_KIND_NONE for v in registries["resource_kinds"])
            and len(registries["image_slots"]) == registries["image_max"] + 1
            and registries["image_slots"][0] == RESOURCE_SLOT_NONE,
            "Invalid numeric resource binding registries")
    legacy_image_slots = set()
    for enum in re.findall(
            r"symbol\s*==\s*0\s*&&\s*slot\s*!=\s*static_cast<unsigned>\(ResourceId::(\w+)\)",
            production.get("SexyAppFramework/misc/ResourceManager.cpp", "")):
        match = re.search(r"\b" + enum + r"\s*=\s*(\d+)\s*[,}]",
                          production.get("Sexy.TodLib/generated/ResourceId.h", ""))
        require(match is not None, f"Missing legacy-only image resource enum: {enum}")
        legacy_image_slots.add(int(match[1]))
    require(all(slot < 879 and registries["resource_kinds"][slot] == 0
                for slot in legacy_image_slots), "Invalid legacy-only image resource slot")
    registries["legacy_image_slots"] = sorted(legacy_image_slots)
    image_slots = [v for v in registries["image_slots"][1:] if v != RESOURCE_SLOT_NONE]
    expected_image_slots = {slot for slot in range(registries["slots"])
                            if (slot >= 879 or registries["resource_kinds"][slot] == 0)
                            and slot not in legacy_image_slots}
    require(len(image_slots) == len(set(image_slots))
            and set(image_slots) == expected_image_slots,
            "Invalid numeric resource binding registries")
    track_source = production["Sexy.TodLib/ReanimTrackId.h"]
    attacher = re.search(r"\battacher__\s*\{\s*ReanimTrackId::(\w+)\s*,\s*ReanimTrackId::(\w+)\s*\}",
                        track_source)
    require(attacher is not None, "Missing numeric attacher track range")
    bounds = []
    for enum in attacher.groups():
        match = re.search(r"\b" + enum + r"\s*=\s*(\d+)\s*[,}]", track_source)
        require(match is not None, f"Missing numeric track enum: {enum}")
        bounds.append(int(match[1]))
    require(0 < bounds[0] <= bounds[1] <= registries["track_max"] + 1,
            "Invalid numeric attacher track range")
    registries["attacher_range"] = bounds
    return {"method": "conservative lexical reference audit; unknown preprocessor branches retained",
            "disabled_test_macros": list(TEST_MACROS), "files": records,
            "fingerprint": digest(json.dumps(records, sort_keys=True).encode()),
            "accepted_numeric_references": accepted,
            "scale_binary_readers": binary_readers, "offline_scale_binary_readers": offline_readers,
            "numeric_definition_tables": {k: sorted(v) for k, v in table_paths.items()},
            "registries": registries}


def font_path(name: str) -> str:
    normalized = file_key(name)
    require(not normalized.endswith(".font.compiled"), f"Legacy font path is offline-only: {name}")
    if normalized.endswith(".compiled"):
        require(numeric_kind(normalized) == "fonts", "Font numeric path outside compiled/fonts")
        return normalized
    filename = PurePosixPath(normalized).name
    if filename.endswith(".txt"):
        filename = filename[:-4]
    return "compiled/fonts/" + filename + ".compiled"


class Reader:
    def __init__(self, data: bytes):
        self.data, self.at = data, 0

    def take(self, size: int) -> bytes:
        require(0 <= size <= len(self.data) - self.at, "Truncated numeric asset")
        result = self.data[self.at:self.at + size]
        self.at += size
        return result

    def word(self) -> int:
        return struct.unpack("<I", self.take(4))[0]

    def unpack(self, format_: str) -> tuple:
        return struct.unpack(format_, self.take(struct.calcsize(format_)))

    def vector(self, limit: int = 16384) -> tuple:
        count = self.count(4, limit)
        return self.unpack(f"<{count}i")

    def count(self, stride: int = 1, limit: int = 1 << 20) -> int:
        count = self.word()
        require(count <= limit and count * stride <= len(self.data) - self.at,
                "Invalid numeric collection size")
        return count

    def path(self) -> str:
        raw = self.take(self.count(limit=4096))
        require(b"\0" not in raw, "NUL in numeric file path")
        return raw.decode("utf-8")

    def finish(self) -> None:
        require(self.at == len(self.data), "Trailing numeric asset bytes")


def definition_path(name: str) -> str:
    normalized = file_key(name)
    require(normalized.startswith(("reanim/", "particles/")) and
            normalized.endswith((".reanim", ".xml")), f"Invalid definition source path: {name}")
    return "compiled/" + normalized.rsplit(".", 1)[0] + ".compiled"


def numeric_kind(name: str) -> str | None:
    normalized = key(name)
    if any(part in normalized.split(".") for part in ("xml", "reanim", "trail", "v4")):
        return None
    if normalized.startswith("compiled/reanim/") and normalized.endswith(".compiled"):
        return "reanim"
    if normalized.startswith("compiled/particles/") and normalized.endswith(".compiled"):
        return "particles"
    if (normalized.startswith("compiled/fonts/") and normalized.endswith(".compiled")
            and not normalized.endswith(".font.compiled")):
        return "fonts"
    if normalized == RESOURCE_PATH:
        return "resources"
    return None


def validate_reanim(reader: Reader, count: int, registries: dict) -> None:
    tracks = []
    lo, hi = registries["attacher_range"]
    for _ in range(count):
        track, frames, stride, mode = reader.unpack("<4I")
        require(track <= registries["track_max"] and stride == 32 and mode <= 1
                and not (lo <= track < hi and mode != 0) and 0 < frames <= 1 << 20,
                "Invalid IDT5 track header")
        values = reader.take(frames * 32)
        require(all(math.isfinite(v) for frame in struct.iter_unpack("<8f", values) for v in frame),
                "Nonfinite IDT5 transform")
        tracks.append((track, frames, mode))
    for _, frames, mode in tracks:
        for _ in range(frames):
            image, font = reader.unpack("<2I")
            require(image <= registries["image_max"] and font <= 1
                    and (image == 0 or registries["image_slots"][image] != RESOURCE_SLOT_NONE),
                    "Invalid IDT5 resource ID")
            if mode:
                length = reader.count(limit=0x7FFFFFFE)
                require(b"\0" not in reader.take(length), "NUL in IDT5 UI caption")
    previous_track = -1
    for _ in range(reader.count(8, count)):
        index, segments = reader.unpack("<2I")
        require(previous_track < index < count, "Invalid IDT5 attacher track index")
        previous_track = index
        track, frames, mode = tracks[index]
        require(lo <= track < hi and mode == 0 and segments <= frames,
                "Invalid IDT5 attacher track or count")
        previous_end = 0
        for _ in range(segments):
            start, end, target, action, rate, loop, run_start, run_end = reader.unpack("<4If3I")
            require(previous_end <= start < end <= frames and run_start <= start
                    and end <= run_end <= frames and run_start < run_end
                    and (target == 0xFFFFFFFF or target < registries["reanim_types"])
                    and action <= registries["track_max"] and math.isfinite(rate) and loop <= 2,
                    "Invalid IDT5 attacher segment")
            previous_end = end
    reader.finish()


def validate_particle(reader: Reader, count: int, body_size: int, registries: dict) -> None:
    body = Reader(reader.take(body_size))

    def track() -> None:
        for _ in range(body.count(20, 100000)):
            time, low, high, curve, distribution = body.unpack("<3f2I")
            require(all(math.isfinite(v) for v in (time, low, high))
                    and curve <= 13 and distribution <= 13, "Invalid IDP5 track node")

    for _ in range(count):
        image = body.word()
        body.take(20)
        require(image <= registries["image_max"] and body.word() <= 4
                and (image == 0 or registries["image_slots"][image] != RESOURCE_SLOT_NONE),
                "Invalid IDP5 emitter identity")
        for _ in range(22):
            track()
        for _ in range(2):
            for _ in range(body.count(12, 4)):
                require(0 < body.word() < 12, "Invalid IDP5 field type")
                track()
                track()
        for _ in range(16):
            track()
    body.finish()
    require(reader.word() == 0x33544449 and reader.word() == count, "Invalid IDP5 IDT3 section")
    for _ in range(count):
        target = reader.word()
        require(target == 0xFFFFFFFF or target < count, "Invalid IDP5 duration target")
    require(reader.word() == 0x35544449 and reader.word() == count, "Invalid IDP5 IDT5 section")
    for _ in range(count):
        require(reader.word() < registries["emitter_count"], "Invalid IDP5 emitter name ID")
    reader.finish()


def validate_font(reader: Reader, maps: int, layers: int, tags: int,
                  references: set[tuple[str, str]]) -> None:
    seen = set()
    for _ in range(maps):
        source, target = reader.unpack("<2I")
        require(source <= 255 and target <= 255 and source not in seen, "Invalid font character map")
        seen.add(source)
    seen = set()
    for _ in range(layers):
        layer = reader.word()
        require(layer < layers and layer not in seen, "Invalid font layer ID")
        seen.add(layer)
        path = reader.path()
        require(bool(path), "Font layer has no image path")
        file_key(path)
        references.add(("image", path))
        for _ in range(2):
            for _ in range(reader.count(4, 4096)):
                require(reader.word() < tags, "Invalid font tag ID")
        scalars = reader.unpack("<22i")
        require(-1 <= scalars[0] <= 1 and scalars[13] in (0, 1), "Invalid font scalar flags")
        glyphs = set()
        for _ in range(reader.count(40, 128)):
            glyph = reader.word()
            require(glyph < 128 and glyph not in glyphs, "Invalid font glyph ID")
            glyphs.add(glyph)
            glyph_values = reader.unpack("<8i")
            require(all(v >= 0 for v in glyph_values[:4]), "Invalid font glyph rectangle")
            kerns = set()
            for _ in range(reader.count(8, 256)):
                next_, _ = reader.unpack("<Ii")
                require(next_ <= 255 and next_ not in kerns, "Invalid font kerning ID")
                kerns.add(next_)
    reader.finish()


def validate_numeric(name: str, data: bytes, registries: dict,
                     references: set[tuple[str, str]] | None = None, *,
                     font_sources: set[str] | None = None) -> set[str]:
    references = references if references is not None else set()
    kind = numeric_kind(name)
    require(kind is not None, f"Unrecognized numeric asset: {name}")
    if kind in ("reanim", "particles"):
        require(len(data) >= (40 if kind == "reanim" else 48), f"Truncated {kind} header: {name}")
        cookie, size, crc = struct.unpack_from("<3I", data)
        require(cookie == (0xDEADFED7 if kind == "reanim" else 0xDEADFED8)
                and size == len(data) - 12 and zlib.crc32(data[12:]) == crc,
                f"Invalid {kind} envelope: {name}")
        if kind == "reanim":
            magic, track, image, font, fps, count = struct.unpack_from("<4IfI", data, 12)
            require(magic == 0x35544449 and (track, image, font) ==
                    (registries["track"], registries["image"], registries["font"])
                    and math.isfinite(fps) and fps > 0 and 0 < count <= registries["track_capacity"],
                    f"Invalid IDT5 header: {name}")
            validate_reanim(Reader(data[36:]), count, registries)
        else:
            magic, image, emitter, count, body = struct.unpack_from("<5I", data, 12)
            require(magic == 0x35504449 and (image, emitter) ==
                    (registries["image"], registries["emitter"])
                    and count <= 1000 and body + 36 + 8 * count == size,
                    f"Invalid IDP5 header: {name}")
            validate_particle(Reader(data[32:]), count, body, registries)
        return set()
    if kind == "fonts":
        require(32 <= len(data) <= 16 * 1024 * 1024, f"Invalid font size: {name}")
        magic, version, size, crc, _, maps, layers, tags = struct.unpack_from("<4Ii3I", data)
        require(magic == 0x544E464E and version == 1 and size == len(data) - 32
                and zlib.crc32(data[32:]) == crc and maps <= 256
                and 0 < layers <= 1024 and tags <= 4096, f"Invalid numeric font header: {name}")
        validate_font(Reader(data[32:]), maps, layers, tags, references)
        return set()
    require(len(data) >= 36, "Truncated numeric.resources")
    magic, version, base, symbols, slots, records, image, crc, size = struct.unpack_from("<9I", data)
    require(magic == 0x4353524E and version == 1 and base == 879 and symbols == registries["image_max"] + 1
            and slots == registries["slots"]
            and records == slots - registries["resource_kinds"].count(RESOURCE_KIND_NONE)
            and image == registries["image"]
            and size == len(data) - 36 and zlib.crc32(data[36:]) == crc,
            "Invalid numeric.resources header")
    expected_slots = {slot for slot in range(slots)
                      if slot >= base or registries["resource_kinds"][slot] != RESOURCE_KIND_NONE}
    expected_symbols = {symbol for symbol in range(1, symbols)
                        if registries["image_slots"][symbol] != RESOURCE_SLOT_NONE}
    legacy_image_slots = set(registries.get("legacy_image_slots", []))
    require(all(slot < base and registries["resource_kinds"][slot] == 0
                and slot not in {registries["image_slots"][symbol] for symbol in expected_symbols}
                for slot in legacy_image_slots), "Invalid legacy-only image resource slot")
    reader, fonts, seen = Reader(data[36:]), set(), set()
    image_symbols, kinds, font_targets = set(), {}, {}
    for _ in range(records):
        record = Reader(reader.take(reader.word()))
        slot, symbol, group, type_, flags, reference, _ = record.unpack("<7I")
        require(slot in expected_slots and slot not in seen and type_ <= 2 and flags <= 16383
                and type_ == (registries["resource_kinds"][slot] if slot < base else 0)
                and (0 < group <= registries["groups"] if slot < base else group == 0)
                and (reference == RESOURCE_SLOT_NONE or type_ == 2 and reference in expected_slots)
                and ((symbol == 0 and slot in legacy_image_slots or
                      symbol in expected_symbols and symbol not in image_symbols
                      and registries["image_slots"][symbol] == slot) if type_ == 0 else symbol == 0),
                "Invalid resource descriptor identity")
        seen.add(slot)
        kinds[slot] = type_
        path, alpha, alpha_grid, font_image = (record.path() for _ in range(4))
        active = not flags & (1 | 8192)
        require(not active or bool(path) or reference != 0xFFFFFFFF, "Resource has no file path")
        if type_ == 0:
            if symbol:
                image_symbols.add(symbol)
            require(not flags & 6 and not font_image, "Invalid image resource flags/paths")
            rows, cols, _, anim, delay, begin, end = record.unpack("<iiII3i")
            per_frame, frame_map = record.vector(), record.vector()
            require(rows > 0 and cols > 0 and anim <= 3
                    and (anim == 0 or max(rows, cols) <= 16384)
                    and min(delay, begin, end, *per_frame) >= 0
                    and all(0 <= f < max(rows, cols) for f in frame_map),
                    "Invalid numeric image grid or animation")
            if active:
                references.add(("image", path))
                references.update(("image", p) for p in (alpha, alpha_grid) if p)
        elif type_ == 1:
            require(not flags & 6 and not any((alpha, alpha_grid, font_image)),
                    "Invalid sound resource flags/paths")
            volume, _ = record.unpack("<di")
            require(math.isfinite(volume), "Invalid numeric sound volume")
            if active:
                references.add(("sound", path))
        else:
            require(not alpha and not alpha_grid and not font_image
                    and not flags & 2
                    and bool(flags & 4) == (reference != 0xFFFFFFFF),
                    "Invalid font resource flags/paths")
            size, style = record.unpack("<iI")
            require(style <= 15
                    and all(t > 0 for t in record.vector()), "Invalid numeric font style/tags")
            if active:
                if reference == 0xFFFFFFFF:
                    fonts.add(font_path(path))
                    if font_sources is not None:
                        font_sources.add(file_key(path))
                else:
                    font_targets[slot] = reference
        for p in (path, alpha, alpha_grid, font_image):
            if p:
                file_key(p)
        record.finish()
    reader.finish()
    require(seen == expected_slots, "Missing numeric resource slot")
    require(image_symbols == expected_symbols, "Missing numeric image symbol binding")
    done = set()
    for slot in font_targets:
        chain = set()
        while slot in font_targets and slot not in done:
            require(slot not in chain, "Cyclic numeric font reference")
            chain.add(slot)
            slot = font_targets[slot]
            require(kinds.get(slot) == 2, "Numeric font reference does not name a font slot")
        done.update(chain)
    return fonts


def effect_references(name: str, data: bytes) -> set[str]:
    """Walk the VSFX disk framing, paths and SPIR-V instructions, not text grep."""
    reader = Reader(data)
    require(reader.word() == 0x58465356 and reader.word() == 1, f"Invalid VSFX header: {name}")
    source = reader.path().replace("\\", "/")
    runtime_path = name.replace("\\", "/")[:-4]
    require(source.casefold() == runtime_path.casefold()
            or source.casefold().endswith("/" + runtime_path.casefold()),
            f"Effect bake path differs: {name}: {source}")
    # Production explicitly rebases this field before resolving DDS paths.
    key(runtime_path)
    input_, output = reader.unpack("<2I")
    protocol_keys = set()
    for index in range(reader.count(36)):
        protocol, id_, integer, default, minimum, maximum, step, inline = reader.unpack("<Q2I5f")
        require(id_ == index and integer <= 1 and protocol not in protocol_keys
                and all(math.isfinite(v) for v in (default, minimum, maximum, step, inline))
                and minimum <= maximum and step > 0, "Invalid VSFX parameter metadata")
        protocol_keys.add(protocol)

        def normalized(value: float) -> float:
            if integer:
                value = math.copysign(math.floor(abs(value) + 0.5), value)
                require(-2147483648 <= value <= 2147483647, "VSFX integer parameter overflow")
                value = struct.unpack("<f", struct.pack("<f", value))[0]
                require(-2147483648 <= value <= 2147483647, "VSFX integer parameter rounding overflow")
            require(minimum <= value <= maximum, "VSFX parameter outside range")
            return value

        normalized(default)
        require(normalized(inline) == inline, "Invalid VSFX inline parameter")

    def expression() -> None:
        count = reader.count(8)
        depth = 0
        for _ in range(count):
            op, literal = reader.unpack("<Ii")
            require(op <= 8 and (literal >= 0 if op == 0 else literal == 0),
                    "Invalid VSFX size expression")
            if op <= 4:
                depth += 1
            else:
                require(depth >= 2, "Invalid VSFX expression stack")
                depth -= 1
        require(count == 0 or depth == 1, "Invalid VSFX expression result")

    refs = set()
    textures = reader.count(20)
    require(input_ < textures and output < textures and input_ != output, "Invalid VSFX input/output IDs")
    produced, external = {input_}, set()
    # Disk values of the 20 VkFormats accepted by VulkanEffectFormats.h.
    formats = {109, 97, 91, 92, 103, 64, 122, 37, 38, 83, 77, 78, 100, 16, 17, 76, 70, 71, 9, 10}
    for index in range(textures):
        id_, format_ = reader.unpack("<2I")
        require(id_ == index and format_ in formats, "Invalid VSFX texture identity/format")
        path = reader.path().replace("\\", "/")
        if path:
            require(index not in (input_, output), "VSFX input/output has an external source")
            require(not path.startswith("/") and ":" not in path, "Absolute effect dependency is not portable")
            require(not path.endswith("/"), "Effect DDS dependency names a directory")
            relative = posixpath.normpath((PurePosixPath(runtime_path).parent / path).as_posix())
            normalized = key(relative)
            require(normalized.endswith(".dds"),
                    f"Effect dependency must be a DDS asset: {name}: {path}")
            refs.add(relative)
            produced.add(index)
            external.add(index)
        for _ in range(2):
            expression()
    for _ in range(reader.count(8)):
        filter_, address = reader.unpack("<2I")
        require(filter_ <= 1 and address <= 3, "Invalid VSFX sampler enums")
    passes = reader.count(40)
    require(passes > 0, "VSFX has no passes")
    for index in range(passes):
        id_, style, *dimensions = reader.unpack("<2I5i")
        require(id_ == index and style <= 1 and all(v > 0 for v in dimensions),
                "Invalid VSFX pass metadata")
        inputs = {reader.word() for _ in range(reader.count(4))}
        outputs = [reader.word() for _ in range(reader.count(4))]
        require(inputs <= produced and outputs and len(set(outputs)) == len(outputs)
                and all(v < textures and v != input_ and v not in external and v not in inputs
                        for v in outputs), "Invalid VSFX pass resource graph")
        produced.update(outputs)
        words = Reader(reader.take(reader.count(4) * 4))
        require(words.word() == 0x07230203, f"Invalid effect SPIR-V: {name}")
        words.take(16)
        while words.at < len(words.data):
            instruction = words.word()
            count, opcode = instruction >> 16, instruction & 65535
            # A three-word OpSource carries language/version enums only.
            require(count > 0 and opcode not in (2, 4, 5, 6, 7, 330)
                    and (opcode != 3 or count == 3),
                    f"Effect contains source/debug instructions or invalid SPIR-V: {name}")
            words.take((count - 1) * 4)
    reader.finish()
    require(output in produced, "VSFX output texture is never produced")
    return refs


def archive_index(archive: zipfile.ZipFile) -> dict:
    result = {}
    for info in archive.infolist():
        normalized = key(info.orig_filename)
        require(normalized not in result, f"Duplicate/casefold archive collision: {info.filename}")
        require(not info.flag_bits & (1 | 64) and info.compress_type == zipfile.ZIP_STORED
                and info.file_size == info.compress_size,
                f"Encrypted or non-stored input: {info.filename}")
        require(not stat.S_ISLNK(info.external_attr >> 16), f"Symlink archive entry: {info.filename}")
        result[normalized] = info
    return result


def removal_plan(archive: zipfile.ZipFile, index: dict,
                 particle_names: set[str], fonts: set[str]) -> tuple[dict, set[str]]:
    # A current production package is an authoritative physical-asset input.
    # Never resurrect images from the original archive while repacking it.
    if (RESOURCE_PATH in index or LEGACY_RESOURCE_PATH in index) and "properties/resources.xml" not in index:
        removed, definitions = {}, {"reanim": set(), "particles": set()}
        migrated_paths = set()
        for name, info in index.items():
            if external_shader(name):
                removed[name] = "external_shader"
                continue
            if info.is_dir():
                continue
            converted = migrated_numeric_path(name)
            kind = numeric_kind(converted) if converted else None
            if converted:
                require(converted not in migrated_paths, f"Numeric source path collision: {name}")
                migrated_paths.add(converted)
            if kind in definitions:
                definitions[kind].add(converted)
            if converted and converted != name:
                removed[name] = ("numeric_definition_rename" if kind in definitions
                                 else "numeric_asset_rename")
            require(not name.startswith("compiled/") or converted is not None or external_shader(name),
                    f"Unclassified compiled asset requires a separate source audit: {name}")
            require(not name.endswith((".xml", ".reanim", ".trail")),
                    f"Author definition in numeric production source: {name}")
        require(len(definitions["reanim"]) == COUNTS["reanim"] and
                definitions["particles"] == particle_names,
                "Numeric source lacks the exact 146 reanim/106 live particle counterparts")
        return removed, definitions["reanim"] | particle_names | {font_path(n) for n in fonts} | {RESOURCE_PATH}
    require("properties/resources.xml" in index and not index["properties/resources.xml"].is_dir(),
            "Source must contain the original resources XML as a removal-only entry")
    require(len(fonts) == COUNTS["fonts"],
            "Numeric resource font paths must identify exactly 20 physical font DSL files")
    for path in fonts:
        require(path.startswith("data/") and path.endswith(".txt") and path in index
                and not index[path].is_dir(),
                f"Numeric resource font paths name a missing/unrecognized original font DSL: {path}")
    require(len({font_path(n) for n in fonts}) == len(fonts), "Original font basename collision")
    removed = {}
    for name in index:
        if external_shader(name):
            removed[name] = "external_shader"
            continue
        if index[name].is_dir():
            continue
        if name.startswith("compiled/reanim/") and name.endswith(".reanim.compiled"):
            removed[name] = "old_reanim"
        elif name.startswith("compiled/particles/") and name.endswith((".xml.compiled", ".trail.compiled")):
            removed[name] = "old_particle_or_trail"
        elif name.startswith("reanim/") and name.endswith(".reanim"):
            removed[name] = "author_reanim"
        elif name.startswith("particles/") and name.endswith((".xml", ".trail")):
            removed[name] = "author_particle_or_trail"
        elif name == "properties/resources.xml":
            removed[name] = "resource_xml"
        elif name in fonts:
            removed[name] = "font_dsl"
        elif name.startswith("data/") and name.endswith(".txt"):
            require(not re.search(rb"(?im)(?:^|;)\s*CreateLayer(?:From)?\s+\S+",
                                  archive.read(index[name])),
                    f"Unlisted font DSL requires a separate source audit: {name}")
        require(not name.startswith("compiled/") or name in removed or numeric_kind(name),
                f"Unclassified compiled asset requires a separate source audit: {name}")
        require(not name.endswith(".xml") or name in removed,
                f"Unclassified XML author asset requires a separate source audit: {name}")
    reanims = {definition_path(n[len("compiled/"):-len(".compiled")])
               for n in removed if removed[n] == "old_reanim"}
    particles = {definition_path(n[len("compiled/"):-len(".compiled")]) for n in removed
                 if n.startswith("compiled/particles/") and n.endswith(".xml.compiled")}
    require(len(reanims) == COUNTS["reanim"] and len(particle_names) == COUNTS["particles"]
            and particle_names <= particles,
            "Source lacks the expected 146 reanim/106 live particle counterparts")
    return removed, reanims | particle_names | {font_path(n) for n in fonts} | {RESOURCE_PATH}


def external_shader(name: str) -> bool:
    return name == "shaders" or name.endswith((".dxil", ".spv")) or name.startswith("shaders/")


def retired_effect_binary(name: str) -> bool:
    return name.startswith("effects/") and name.endswith(".vfx")


def matching_external_dds(name: str, data: bytes, root: Path) -> Path | None:
    if not name.startswith("effects/") or not name.endswith(".dds"):
        return None
    base = root / "effects"
    if not base.is_dir():
        return None
    require(not base.is_symlink() and not getattr(base, "is_junction", lambda: False)(),
            f"Linked external effects directory: {base}")
    matches = [p for p in base.rglob("*") if p.is_file() and
               key(p.relative_to(root).as_posix()) == name]
    require(len(matches) <= 1, f"External DDS casefold collision: {name}")
    if matches:
        path = matches[0]
        require(not path.is_symlink() and not getattr(path, "is_junction", lambda: False)(),
                f"Linked external DDS: {path}")
        if path.read_bytes() == data:
            return path
    return None


def effect_retirement(archive: zipfile.ZipFile, index: dict, root: Path) -> tuple[dict, list]:
    removed, mirrors = {}, []
    for name, info in index.items():
        if info.is_dir():
            continue
        if retired_effect_binary(name):
            removed[name] = "retired_scale_binary"
        elif name.startswith("effects/") and name.endswith(".dds"):
            data = archive.read(info)
            external = matching_external_dds(name, data, root)
            if external:
                removed[name] = "external_scale_dds"
                mirrors.append({"name": name, "external": str(external.resolve()),
                                "bytes": len(data), "sha256": digest(data)})
    if mirrors:
        script = root / "CMake/StageNumericEffects.cmake"
        staging = script.read_text(encoding="utf-8")
        require(all(token in staging for token in ('"${SOURCE}/*.hlsl"', '"${SOURCE}/*.hlsli"',
                                                    '"${SOURCE}/*.dds"', "COPYONLY")),
                "External effects source/DDS staging contract changed")
        framework = (root / "pvzPerf/SexyAppFramework/CMakeLists.txt").read_text(encoding="utf-8")
        require(all(token in framework for token in ("StageNumericEffects.cmake",
                    "-DSOURCE=${CMAKE_SOURCE_DIR}/effects", "/effects", "POST_BUILD")),
                "Game no longer stages external effects")
    return removed, mirrors


def migrated_numeric_path(name: str) -> str | None:
    """Offline import only. Production never probes historical names."""
    normalized = file_key(name)
    if normalized == LEGACY_RESOURCE_PATH:
        return RESOURCE_PATH
    if normalized.startswith("compiled/fonts/") and normalized.endswith(".font.compiled"):
        return normalized[:-len(".font.compiled")] + ".compiled"
    for directory, suffix in (("reanim", ".reanim.v4.compiled"),
                              ("particles", ".xml.v4.compiled")):
        if normalized.startswith(f"compiled/{directory}/") and normalized.endswith(suffix):
            return normalized[:-len(suffix)] + ".compiled"
    return normalized if numeric_kind(normalized) else None


def physical_references(kind: str, path: str, available: set[str]) -> set[str]:
    normalized = file_key(path)
    if kind == "sound":
        # DSoundManager appends an extension even when the supplied stem has one.
        found = {normalized + suffix for suffix in (".wav", ".ogg", ".au")} & available
    else:
        suffixes = (".tga", ".jpg", ".png", ".gif")

        def candidates(stem: str) -> set[str]:
            extension = PurePosixPath(stem).suffix
            return ({stem} if extension in suffixes else
                    {stem + suffix for suffix in suffixes} if not extension else set()) & available

        parent, filename = posixpath.split(normalized)
        found = candidates(normalized)
        # ImageLib supports alpha-only images as well as optional alpha companions.
        found |= candidates(posixpath.join(parent, "_" + filename))
        found |= candidates(normalized + "_")
    require(bool(found), f"Missing referenced {kind} asset: {path}")
    return found


def stage_inventory(stage: Path) -> dict[str, tuple[str, Path]]:
    result = {}
    for path in stage.rglob("*"):
        require(path.suffix.casefold() != ".xml",
                f"XML author file in numeric stage: {path.relative_to(stage)}")
        require(not external_shader(path.relative_to(stage).as_posix().casefold()),
                f"Shaders must remain outside pak64 staging: {path.relative_to(stage)}")
        require(not path.is_file() or not path.name.casefold().endswith(".vfx"),
                f"VFX shader artifacts must remain outside production staging: {path.relative_to(stage)}")
    for directory in ("compiled", "effects"):
        base = stage / directory
        if not os.path.lexists(base):
            require(directory != "compiled", "Missing staged compiled directory")
            continue
        require(not base.is_symlink() and not getattr(base, "is_junction", lambda: False)(),
                f"Symlink/junction in staged assets: {base}")
        require(base.is_dir(), f"Staged asset tree is not a directory: {base}")
        for path in base.rglob("*"):
            require(not path.is_symlink() and not getattr(path, "is_junction", lambda: False)(),
                    f"Symlink/junction in staged assets: {path}")
            if not path.is_file():
                continue
            name = path.relative_to(stage).as_posix()
            normalized = key(name)
            require(not external_shader(normalized), f"Shaders must remain outside pak64: {name}")
            require(normalized not in result, f"Staged casefold collision: {name}")
            result[normalized] = name, path
    return result


def central_records(archive: zipfile.ZipFile, stream) -> list[bytes]:
    stream.seek(archive.start_dir)
    records = []
    for _ in archive.infolist():
        fixed = stream.read(46)
        require(len(fixed) == 46 and fixed[:4] == b"PK\x01\x02", "Invalid ZIP central directory")
        lengths = struct.unpack_from("<3H", fixed, 28)
        require(struct.unpack_from("<H", fixed, 34)[0] == 0, "Multi-disk PAK64 is unsupported")
        variable = stream.read(sum(lengths))
        require(len(variable) == sum(lengths), "Truncated ZIP central directory")
        records.append(fixed + variable)
    return records


def relocate_central(record: bytes, offset: int) -> bytes:
    record = bytearray(record)
    old = struct.unpack_from("<I", record, 42)[0]
    if old != 0xFFFFFFFF and offset < 0xFFFFFFFF:
        struct.pack_into("<I", record, 42, offset)
        return bytes(record)
    name_size, extra_size = struct.unpack_from("<2H", record, 28)
    start, end = 46 + name_size, 46 + name_size + extra_size
    at = start
    while at < end:
        require(at + 4 <= end, "Malformed ZIP extra field")
        tag, size = struct.unpack_from("<2H", record, at)
        require(at + 4 + size <= end, "Malformed ZIP extra field size")
        if tag == 1:
            field = at + 4
            field += 8 * (struct.unpack_from("<I", record, 24)[0] == 0xFFFFFFFF)
            field += 8 * (struct.unpack_from("<I", record, 20)[0] == 0xFFFFFFFF)
            if old == 0xFFFFFFFF:
                require(field + 8 <= at + 4 + size, "Missing ZIP64 local offset")
                struct.pack_into("<Q", record, field, offset)
            else:
                require(field <= at + 4 + size and extra_size + 8 <= 65535,
                        "Invalid ZIP64 size field or overflowing extras")
                record[field:field] = struct.pack("<Q", offset)
                struct.pack_into("<H", record, at + 2, size + 8)
                struct.pack_into("<H", record, 30, extra_size + 8)
                struct.pack_into("<I", record, 42, 0xFFFFFFFF)
                record[4] = max(record[4], 45)
                record[6] = max(record[6], 45)
            return bytes(record)
        at += 4 + size
    require(old != 0xFFFFFFFF, "Missing ZIP64 extra field")
    require(extra_size + 12 <= 65535, "Overflowing ZIP64 extras")
    record[end:end] = struct.pack("<HHQ", 1, 8, offset)
    struct.pack_into("<H", record, 30, extra_size + 12)
    struct.pack_into("<I", record, 42, 0xFFFFFFFF)
    record[4] = max(record[4], 45)
    record[6] = max(record[6], 45)
    return bytes(record)


def local_size(stream, info: zipfile.ZipInfo) -> int:
    stream.seek(info.header_offset)
    header = stream.read(30)
    require(len(header) == 30 and header[:4] == b"PK\x03\x04", "Invalid local ZIP header")
    flags, method = struct.unpack_from("<2H", header, 6)
    require(flags == info.flag_bits and method == 0, "Local/central ZIP flags or compression differ")
    name_size, extra_size = struct.unpack_from("<2H", header, 26)
    name, extra = stream.read(name_size), stream.read(extra_size)
    require(len(name) == name_size and len(extra) == extra_size, "Truncated local ZIP name/extra")
    require(name.decode("utf-8" if flags & 2048 else "cp437") == info.orig_filename,
            "Local/central ZIP names differ")
    crc, compressed, uncompressed = struct.unpack_from("<3I", header, 14)
    wide = 0xFFFFFFFF in (compressed, uncompressed)
    if wide:
        at, values = 0, None
        while at < len(extra):
            require(at + 4 <= len(extra), "Malformed local ZIP extra field")
            tag, length = struct.unpack_from("<2H", extra, at)
            at += 4
            require(at + length <= len(extra), "Malformed local ZIP extra field size")
            if tag == 1:
                require(values is None, "Duplicate local ZIP64 extra field")
                values = Reader(extra[at:at + length])
            at += length
        require(values is not None, "Missing local ZIP64 size field")
        if uncompressed == 0xFFFFFFFF:
            uncompressed = values.unpack("<Q")[0]
        if compressed == 0xFFFFFFFF:
            compressed = values.unpack("<Q")[0]
    require((crc, compressed, uncompressed) == (info.CRC, info.compress_size, info.file_size)
            or flags & 8 and crc in (0, info.CRC) and compressed in (0, info.compress_size)
            and uncompressed in (0, info.file_size), "Local/central ZIP CRC or sizes differ")
    size = 30 + name_size + extra_size + info.compress_size
    if flags & 8:
        stream.seek(info.header_offset + size)
        signature = stream.read(4)
        has_signature = signature == b"PK\x07\x08"
        if not has_signature:
            stream.seek(-4, os.SEEK_CUR)
        fmt = "<IQQ" if wide else "<III"
        descriptor = stream.read(struct.calcsize(fmt))
        require(len(descriptor) == struct.calcsize(fmt)
                and struct.unpack(fmt, descriptor) == (info.CRC, info.compress_size, info.file_size),
                "Invalid stored ZIP data descriptor")
        size += len(descriptor) + 4 * has_signature
    return size


def write_end(stream, records: list[bytes], comment: bytes) -> None:
    offset = stream.tell()
    for record in records:
        stream.write(record)
    size = stream.tell() - offset
    count = len(records)
    if count >= 65535 or size >= 0xFFFFFFFF or offset >= 0xFFFFFFFF:
        end = stream.tell()
        stream.write(struct.pack("<4sQ2H2I4Q", b"PK\x06\x06", 44, 45, 45, 0, 0,
                                 count, count, size, offset))
        stream.write(struct.pack("<4sIQI", b"PK\x06\x07", 0, end, 1))
    stream.write(struct.pack("<4s4H2IH", b"PK\x05\x06", 0, 0, min(count, 65535),
                             min(count, 65535), min(size, 0xFFFFFFFF),
                             min(offset, 0xFFFFFFFF), len(comment)) + comment)


def entry_hash(archive: zipfile.ZipFile, info: zipfile.ZipInfo) -> str:
    with archive.open(info) as stream:
        h = hashlib.sha256()
        for block in iter(lambda: stream.read(1024 * 1024), b""):
            h.update(block)
        return h.hexdigest()


def metadata(info: zipfile.ZipInfo) -> tuple:
    return (info.filename, info.date_time, info.compress_type, info.flag_bits,
            info.create_system, info.create_version, info.extract_version,
            info.reserved, info.volume, info.internal_attr, info.external_attr,
            info.extra, info.comment, info.CRC, info.file_size, info.compress_size)


def safe_destinations(source: Path, stage: Path, output: Path, manifest: Path, root: Path) -> None:
    require(source.is_file() and stage.is_dir() and root.is_dir(), "Missing source, stage, or source root")
    require(output.resolve() != manifest.resolve(), "Archive and manifest alias")
    for path in (output, manifest):
        require(not os.path.lexists(path), f"Refusing to overwrite existing output: {path}")
        require(path.resolve() != source.resolve(), "Input/output alias")
        require(path.name.casefold() != "main.pak64", "Output must not be a runtime main.pak64")
        resolved = path.resolve()
        require(not resolved.is_relative_to(stage.resolve()), "Output must be outside the staged input tree")
        for directory in ("compiled", "reanim", "particles", "properties", "data", "effects",
                          "images", "sounds", "music", "fonts"):
            require(not resolved.is_relative_to((root / directory).resolve()),
                    f"Output must not enter author/numeric assets: {path}")
        require(path.parent.is_dir(), f"Output parent must already exist: {path.parent}")


def build(source: Path, stage: Path, output: Path, root: Path = ROOT,
          manifest_path: Path | None = None, *, replace_definitions: bool = False) -> dict:
    source, stage, output, root = map(Path, (source, stage, output, root))
    manifest_path = Path(manifest_path) if manifest_path else output.with_suffix(".manifest.json")
    safe_destinations(source, stage, output, manifest_path, root)
    source_fingerprint = fingerprint(source)
    staged = stage_inventory(stage)
    with zipfile.ZipFile(source) as original:
        index = archive_index(original)
        with source.open("rb") as stream:
            ordered = sorted(original.infolist(), key=lambda i: i.header_offset)
            for index_, info in enumerate(ordered):
                boundary = ordered[index_ + 1].header_offset if index_ + 1 < len(ordered) else original.start_dir
                require(info.header_offset + local_size(stream, info) <= boundary,
                        "Local ZIP record overlaps another record or the central directory")
        numeric = {n for n in staged if numeric_kind(n)}
        require(RESOURCE_PATH in numeric,
                "Staged numeric paths differ from the complete 146/106/20/1 corpus")
        # Registry validation precedes font-source extraction. Repeat the source
        # audit with the removal set so no removed-file consumer escapes it.
        initial_audit = source_audit(root, {}, numeric)
        resource_data = staged[RESOURCE_PATH][1].read_bytes()
        resource_references, font_sources = set(), set()
        font_refs = validate_numeric(RESOURCE_PATH, resource_data, initial_audit["registries"],
                                     resource_references, font_sources=font_sources)
        removed, required = removal_plan(original, index,
                                         {n for n in numeric if numeric_kind(n) == "particles"},
                                         font_sources)
        retired, external_dds = effect_retirement(original, index, root)
        removed.update(retired)
        require(numeric == required, "Staged numeric paths differ from the complete 146/106/20/1 corpus")
        require(not any(n.startswith("compiled/") and n not in numeric for n in staged),
                "Unexpected non-numeric file in staged compiled tree")
        audit = source_audit(root, removed, numeric)
        require(initial_audit["fingerprint"] == audit["fingerprint"],
                "Runtime sources changed during packaging")
        selected = set(numeric) | {n for n in staged if n.startswith("effects/") and
                                  n.endswith(".dds") and n not in retired}
        require(not any(n.startswith("effects/") and n.endswith((".hlsl", ".fx"))
                        for n in index), "Authored effect source in input; requires a separate source audit")
        existing_numeric = {n for n in index if numeric_kind(n)}
        require(existing_numeric <= required, "Unexpected numeric record in source")
        file_refs = {RESOURCE_PATH: resource_references}
        validated_stamps = {RESOURCE_PATH: {"sha256": digest(resource_data), "bytes": len(resource_data)}}
        for name in sorted(selected):
            if name == RESOURCE_PATH:
                continue
            data = staged[name][1].read_bytes() if name in selected else original.read(index[name])
            if name in selected:
                validated_stamps[name] = {"sha256": digest(data), "bytes": len(data)}
            if numeric_kind(name):
                dependencies = set()
                font_refs.update(validate_numeric(name, data, audit["registries"], dependencies))
                file_refs[name] = dependencies
        require(font_refs == {n for n in required if numeric_kind(n) == "fonts"},
                "Numeric resource font paths do not cover the original 20 fonts")
        available = {n for n, info in index.items() if n not in removed and not info.is_dir()} | selected
        resolved_refs = {}
        for name, dependencies in sorted(file_refs.items()):
            resolved_refs[name] = sorted({p for kind, path in dependencies
                                          for p in physical_references(kind, path, available)})
        inputs, additions = [], []
        for name in sorted(selected):
            spelling, path = staged[name]
            stamp = fingerprint(path)
            if name in validated_stamps:
                require(stamp == validated_stamps[name], f"Staged input changed after validation: {spelling}")
            inputs.append({"name": spelling, **stamp})
            if name in index and name not in removed:
                require(spelling == index[name].filename,
                        f"Staged/archive collision differs in name or bytes: {spelling}")
                if stamp["sha256"] != entry_hash(original, index[name]):
                    require(replace_definitions and numeric_kind(name) in ("reanim", "particles"),
                            f"Staged/archive collision differs in name or bytes: {spelling}")
                    removed[name] = "numeric_record_rebuild"
                    additions.append(name)
            else:
                additions.append(name)
        retained = [i for i in original.infolist() if key(i.filename) not in removed]
        input_stamps = {i["name"]: i for i in inputs}
        retained_rows = [{"name": i.filename, "bytes": i.file_size,
                          "source_sha256": entry_hash(original, i)} for i in retained]
        removed_rows = [{"name": index[n].filename, "bytes": index[n].file_size,
                         "sha256": entry_hash(original, index[n]), "reason": removed[n]}
                        for n in index if n in removed]
        temporary = []
        published = []
        try:
            fd, temp_name = tempfile.mkstemp(prefix=".numeric-pak64-", dir=output.parent)
            temporary.append(Path(temp_name))
            with os.fdopen(fd, "wb") as target, source.open("rb") as stream:
                raw_records = central_records(original, stream)
                records = []
                # Retained local records are copied verbatim, including descriptors.
                for info, record in zip(original.infolist(), raw_records):
                    if key(info.filename) in removed:
                        continue
                    size = local_size(stream, info)
                    records.append(relocate_central(record, target.tell()))
                    stream.seek(info.header_offset)
                    remaining = size
                    while remaining:
                        block = stream.read(min(remaining, 1024 * 1024))
                        require(bool(block), "Truncated local ZIP record")
                        target.write(block)
                        remaining -= len(block)
                for name in additions:
                    spelling, path = staged[name]
                    data = path.read_bytes()
                    stamp = input_stamps[spelling]
                    require(digest(data) == stamp["sha256"], f"Staged input changed: {spelling}")
                    buffer = io.BytesIO()
                    info = zipfile.ZipInfo(spelling, (1980, 1, 1, 0, 0, 0))
                    info.create_system, info.external_attr = 0, 0x20
                    with zipfile.ZipFile(buffer, "w", compression=zipfile.ZIP_STORED) as single:
                        single.writestr(info, data)
                    buffer.seek(0)
                    with zipfile.ZipFile(buffer) as single:
                        central = central_records(single, buffer)[0]
                        records.append(relocate_central(central, target.tell()))
                        buffer.seek(0)
                        target.write(buffer.read(single.start_dir))
                write_end(target, records, original.comment)
                target.flush()
                os.fsync(target.fileno())
            with zipfile.ZipFile(temporary[0]) as rebuilt:
                output_index = archive_index(rebuilt)
                with temporary[0].open("rb") as stream:
                    copied_records = central_records(rebuilt, stream)
                require(set(output_index) == (set(index) - set(removed)) | set(additions),
                        "Output entry closure differs")
                require(not any(external_shader(n) or ".xml" in n or ".v4." in n
                                or n.endswith(".vfx")
                                or n.endswith(".font.compiled") or n == LEGACY_RESOURCE_PATH
                                for n in output_index), "Forbidden production package path")
                for info in rebuilt.infolist():
                    if not info.is_dir():
                        with rebuilt.open(info) as entry:
                            require(entry.read(4) not in SHADER_HEADERS,
                                    f"Shader payload under a non-shader filename: {info.filename}")
                require([i.filename for i in rebuilt.infolist()[:len(retained)]] ==
                        [i.filename for i in retained] and rebuilt.comment == original.comment,
                        "Retained order or archive comment changed")
                for index_, (info, row) in enumerate(zip(retained, retained_rows)):
                    copied = output_index[key(info.filename)]
                    row["output_sha256"] = entry_hash(rebuilt, copied)
                    # Compare the exact relocated central record: ZIP64 offsets
                    # and required version promotions are not metadata corruption.
                    row["metadata_preserved"] = records[index_] == copied_records[index_]
                    require(row["source_sha256"] == row["output_sha256"] and row["metadata_preserved"],
                            f"Retained bytes/metadata changed: {info.filename}")
                added_rows = []
                for name in additions:
                    info = output_index[name]
                    stamp = input_stamps[info.filename]
                    require(entry_hash(rebuilt, info) == stamp["sha256"], f"Added asset changed: {info.filename}")
                    added_rows.append({"name": info.filename, "bytes": info.file_size, "sha256": stamp["sha256"]})
            require(fingerprint(source) == source_fingerprint, "Source archive changed during packaging")
            require(stage_inventory(stage) == staged, "Staged file inventory changed during packaging")
            for stamp in inputs:
                require(fingerprint(staged[key(stamp["name"])][1]) ==
                        {k: stamp[k] for k in ("sha256", "bytes")}, f"Staged input changed: {stamp['name']}")
            reference_removals = {n: reason for n, reason in removed.items()
                                  if reason != "numeric_record_rebuild"}
            require(source_audit(root, reference_removals, numeric) == audit,
                    "Runtime sources changed during packaging")
            for mirror in external_dds:
                require(fingerprint(Path(mirror["external"])) ==
                        {k: mirror[k] for k in ("bytes", "sha256")},
                        f"External DDS changed during packaging: {mirror['name']}")
            manifest = {
                "format": "numeric-runtime-pak64-v2",
                "source": {"path": str(source.resolve()), **source_fingerprint},
                "output": {"path": str(output.resolve()), **fingerprint(temporary[0])},
                "staged_inputs": inputs, "staged_fingerprint": digest(json.dumps(inputs, sort_keys=True).encode()),
                "source_reference_audit": audit, "numeric_counts": COUNTS,
                "package_layout": {
                    "definitions": "compiled/{reanim,particles}/<stem>.compiled",
                    "fonts": "compiled/fonts/<stem>.compiled",
                    "resources": RESOURCE_PATH,
                    "built_in_shaders": "external build output; never packaged",
                    "custom_scale_hlsl": "startup compilation from external author sources",
                },
                "font_author_sources_from_numeric_resources": sorted(font_sources),
                "retained": retained_rows, "removed": removed_rows, "added": added_rows,
                "external_scale_dds": external_dds,
                "effect_file_references": {},
                "numeric_file_references": {n: p for n, p in resolved_refs.items() if p},
                "verification_scope": [
                    "Stored unencrypted archive, safe unique paths, retained order/metadata and per-entry SHA256 equality",
                    "Numeric envelope/header/CRC/registry and IDT5/IDP5/font/resource record framing, IDs and finite values",
                    "Resource font, image/alpha, sound and font-glyph file path closure; retained UI bytes are unchanged",
                    "Font DSL removals derive from validated staged numeric.resources; legacy XML is removal-only",
                    "No production VFX reader; retired VFX removed including embedded SPIR-V",
                    "Effects DDS removed only with byte-identical external copies and CMake deployment contract",
                    "NOT decoder/GPU/SPIR-V semantic validation or proof that every non-UI/non-path string is absent",
                    "Source audit assumes definition/font test importers are disabled; custom HLSL compiles at startup",
                    "Fsynced files; exclusive manifest-first/archive-last publication, NOT a two-file crash-atomic transaction",
                ],
            }
            fd, temp_name = tempfile.mkstemp(prefix=".numeric-manifest-", dir=manifest_path.parent)
            temporary.append(Path(temp_name))
            with os.fdopen(fd, "wb") as stream:
                stream.write((json.dumps(manifest, indent=2, sort_keys=True) + "\n").encode("utf-8"))
                stream.flush()
                os.fsync(stream.fileno())
            # The archive is the completion marker. Record ownership before link
            # so an interruption immediately after creation can still roll back.
            for temporary_path, destination in ((temporary[1], manifest_path), (temporary[0], output)):
                published.append((temporary_path.stat(), destination))
                os.link(temporary_path, destination)
            for path in temporary:
                path.unlink()
            temporary.clear()
            return manifest
        except BaseException:
            for identity, destination in reversed(published):
                if os.path.lexists(destination) and os.path.samestat(identity, destination.lstat()):
                    destination.unlink()
            raise
        finally:
            for path in temporary:
                path.unlink(missing_ok=True)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("source", type=Path)
    parser.add_argument("stage", type=Path)
    parser.add_argument("output", type=Path)
    parser.add_argument("--root", type=Path, default=ROOT)
    parser.add_argument("--manifest", type=Path)
    parser.add_argument("--replace-definitions", action="store_true",
                        help="replace validated animation/particle records in a numeric source package")
    args = parser.parse_args()
    try:
        manifest = build(args.source, args.stage, args.output, args.root, args.manifest,
                         replace_definitions=args.replace_definitions)
    except (ValueError, OSError, zipfile.BadZipFile, struct.error) as error:
        parser.exit(1, f"numeric runtime packaging failed: {error}\n")
    print(f"Created {args.output}: retained={len(manifest['retained'])} "
          f"removed={len(manifest['removed'])} added={len(manifest['added'])}")
    print(f"Manifest: {args.manifest or args.output.with_suffix('.manifest.json')}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
