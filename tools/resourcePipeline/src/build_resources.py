"""Build authored definitions, generated C++ and the runtime reference closure."""
from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
import re
import subprocess
import sys
import tempfile
import zipfile

ROOT = Path(__file__).resolve().parents[3]
sys.path.insert(0, str(ROOT / "tools"))
import build_numeric_runtime_pak64 as pak
import compile_numeric_fonts as fonts
import compile_numeric_resources as resources
from stage_runtime_package import PARTICLE_COMPILER_FIXTURES


def publish(path: Path, data: bytes) -> None:
    if not path.exists() or path.read_bytes() != data:
        path.parent.mkdir(parents=True, exist_ok=True)
        temporary = path.with_name(path.name + ".tmp")
        temporary.write_bytes(data)
        temporary.replace(path)


def run(*arguments: object) -> None:
    subprocess.run([str(arg) for arg in arguments], cwd=ROOT, check=True)


def append_symbols(cache: Path, label: str, symbols: set[str]) -> None:
    inventory = cache / (label + "-symbols.txt")
    publish(inventory, ("\n".join(sorted(symbols)) + "\n").encode())
    run(sys.executable, "-B", ROOT / "tools/gen_image_symbol_registry.py",
        inventory, "--root", ROOT, "--append-new")


def build(args: argparse.Namespace, work: Path) -> None:
    cache = args.cache.resolve()
    cache.mkdir(parents=True, exist_ok=True)
    game = ROOT / "pvzPerf"
    definitions = ROOT / "assets/definitions"
    generated = game / "Sexy.TodLib/generated"
    sidecar = generated / "image_symbol_ids.bin"
    source_files = [p for p in game.rglob("*") if p.suffix in {".cpp", ".h", ".hpp", ".inl"}
                    and "generated" not in p.parts]

    # Preserve old IDs, append each corpus in compilation order.
    for kind in ("reanim", "particles"):
        names = set()
        for source in (definitions / kind).rglob("*.dsl"):
            for quoted, token in re.findall(r'\bimage\s*:\s*(?:"([^"]+)"|((?:IMAGE_|FONT_IMAGE_)\w+))',
                                           source.read_text(encoding="utf-8-sig")):
                names.add(quoted or token)
        append_symbols(cache, kind, names)
    symbol_names = dict(resources.read_symbols(sidecar)[0])
    enum_names = {
        identifier: symbol_names[int(number)]
        for identifier, number in re.findall(r"^\s*(\w+)\s*=\s*(\d+),",
            (generated / "ImageSymbolId.h").read_text(encoding="utf-8"), re.M)
        if int(number) in symbol_names
    }
    code_symbols = set()
    for source in source_files:
        for identifier in re.findall(r"\bImageSymbolId::((?:IMAGE_|FONT_IMAGE_)\w+)",
                                     pak.clean_comments(source.read_text(encoding="utf-8-sig"))):
            code_symbols.add(enum_names.get(identifier, identifier))
    append_symbols(cache, "code", code_symbols)

    reanim = work / "reanim"
    particles = work / "particles"
    run(args.compiler, "compile-v2", "--input", definitions / "reanim/root.dsl",
        "--output", reanim, "--type-map", ROOT / "tools/reanim_type_map.txt",
        "--family-file", ROOT / "tools/reanim_track_families.txt",
        "--font-registry", ROOT / "tools/font_symbol_ids.bin",
        "--image-registry", sidecar)
    run(args.compiler, "compile-particle-v2", "--input", definitions / "particles/all.root.dsl",
        "--output", particles, "--gold64", definitions / "particle-reference",
        "--image-registry", sidecar)
    for name in ("ReanimTrackId.h", "ReanimTrackMphfGlobal.h"):
        publish(game / "Sexy.TodLib" / name, (reanim / name).read_bytes())
    publish(generated / "ParticleEmitterName.h", (particles / "ParticleEmitterName.h").read_bytes())

    strings = work / "strings"
    run(args.compiler, "bake-strings", "--input", definitions / "LawnStrings.txt",
        "--output-dir", strings)
    for name in ("LawnStrings.h", "LawnStrings.cpp"):
        publish(generated / name, (strings / name).read_bytes())

    records = {}
    for kind, directory in (("reanim", reanim), ("particles", particles)):
        for path in directory.glob("*.compiled"):
            if path.name.casefold() in PARTICLE_COMPILER_FIXTURES:
                continue
            # Standalone compiler also emits its offline comparison dialect.
            if any(token in path.name.casefold().split(".") for token in ("reanim", "xml", "v2")):
                continue
            records[f"compiled/{kind}/{path.name.casefold()}"] = path.read_bytes()
    font_corpus = fonts.load_corpus(definitions / "fonts")
    tag_ids = fonts.tag_registry(font_corpus)
    for font in font_corpus:
        records[fonts.resolve_compiled_font_path(font.source_path).casefold()] = font.encode(tag_ids)

    raw_files = {}
    for path in sorted((ROOT / "assets/runtime").rglob("*")):
        if path.is_file():
            name = pak.file_key(path.relative_to(ROOT / "assets/runtime").as_posix())
            if name in raw_files:
                raise ValueError(f"Duplicate runtime resource: {name}")
            raw_files[name] = path
    resource_data, mapping, crc, names = resources.compile_manifest(
        ROOT, (definitions / "resources.json").read_bytes(),
        [path.relative_to(ROOT / "assets/runtime").as_posix() for path in raw_files.values()],
        sidecar, tag_ids)
    records[pak.RESOURCE_PATH] = resource_data
    # The generator owns these source files; unchanged content keeps its mtime.
    resources.emit_headers(ROOT, mapping, crc, names)
    run(sys.executable, "-B", ROOT / "tools/gen_reanim_attacher_masks.py")

    expected = {"reanim": 146, "particles": 106, "fonts": 20, "resources": 1}
    counts = {kind: sum(pak.numeric_kind(name) == kind for name in records) for kind in expected}
    if counts != expected:
        raise ValueError(f"Incomplete numeric resource corpus: {counts}")
    audit = pak.source_audit(ROOT, {}, set(records))
    references = set()
    for name, data in records.items():
        pak.validate_numeric(name, data, audit["registries"], references)
    selected = set()
    available = set(raw_files)
    for kind, name in references:
        selected.update(pak.physical_references(kind, name, available))
    for source in source_files:
        for _, value in pak.literals(pak.clean_comments(source.read_text(encoding="utf-8-sig"))):
            normalized = value.replace("\\", "/").casefold()
            if normalized in available:
                selected.add(normalized)
            elif normalized.startswith(("images/", "reanim/", "particles/", "data/")):
                path = Path(normalized)
                stems = (normalized, path.with_name("_" + path.name).as_posix(), normalized + "_")
                if any(stem + suffix in available for stem in stems
                       for suffix in (".png", ".jpg", ".gif", ".tga")):
                    selected.update(pak.physical_references("image", normalized, available))
            elif normalized.startswith("sounds/") and any(
                    normalized + suffix in available for suffix in (".wav", ".ogg", ".au")):
                selected.update(pak.physical_references("sound", normalized, available))
    # Resource descriptions are compile inputs. Runtime UI terms remain package data.
    for name in available:
        if Path(name).suffix.casefold() not in {".png", ".jpg", ".jpeg", ".gif", ".bmp",
                                              ".ogg", ".wav", ".au", ".mo3"}:
            if name != "properties/lawnstrings.txt":
                selected.add(name)
    for name in sorted(selected):
        records[name] = raw_files[name].read_bytes()
    output = cache / "main.pak64"
    temporary = output.with_suffix(".tmp")
    with zipfile.ZipFile(temporary, "w", compression=zipfile.ZIP_STORED) as archive:
        for name, data in sorted(records.items()):
            info = zipfile.ZipInfo(name, (1980, 1, 1, 0, 0, 0))
            info.create_system, info.external_attr = 0, 0x20
            archive.writestr(info, data)
    temporary.replace(output)
    report = {
        "format": "pvz-resource-build-v1",
        "numeric_counts": counts,
        "code_image_symbols": sorted(code_symbols),
        "runtime_inputs": len(raw_files),
        "runtime_included": len(selected),
        "runtime_omitted": sorted(available - selected),
        "files": {name: {"bytes": len(data), "sha256": hashlib.sha256(data).hexdigest()}
                  for name, data in sorted(records.items())},
    }
    publish(cache / "manifest.json", (json.dumps(report, indent=2) + "\n").encode())
    (cache / "resources.stamp").write_text("complete\n", encoding="ascii")
    print(f"Resource package: {output}; {len(records)} entries; omitted {len(available - selected)} inputs")


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--compiler", type=Path, required=True)
    parser.add_argument("--cache", type=Path, required=True)
    args = parser.parse_args()
    args.cache = args.cache.resolve()
    args.cache.mkdir(parents=True, exist_ok=True)
    with tempfile.TemporaryDirectory(prefix="compile-", dir=args.cache) as temporary:
        build(args, Path(temporary))


if __name__ == "__main__":
    main()
