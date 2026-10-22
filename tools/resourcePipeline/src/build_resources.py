"""Build authored definitions, generated C++ and the runtime reference closure."""
from __future__ import annotations

import argparse
from contextlib import contextmanager
import hashlib
import json
import math
from pathlib import Path
import struct
import subprocess
import sys
import tempfile
import time
import threading
import zipfile

ROOT = Path(__file__).resolve().parents[3]
sys.path.insert(0, str(ROOT / "tools"))
import build_numeric_runtime_pak64 as pak
import compile_numeric_fonts as fonts
import compile_numeric_resources as resources
import definition_atlas
import resource_build_config
import exact_atlas
from stage_runtime_package import PARTICLE_COMPILER_FIXTURES


def publish(path: Path, data: bytes) -> None:
    if not path.exists() or path.read_bytes() != data:
        path.parent.mkdir(parents=True, exist_ok=True)
        temporary = path.with_name(path.name + ".tmp")
        temporary.write_bytes(data)
        temporary.replace(path)


def emit_definition_image_bindings(path: Path, definitions: dict[str, dict]) -> None:
    """Bind definition GPU images in the program, outside compiled geometry."""
    rows = [
        f"    {{{json.dumps(name)}, {json.dumps(report['atlas_path'])}}},"
        for name, report in sorted(definitions.items())
    ]
    text = (
        "// Generated from ResourceBuild.pvzbuild; definition images are program bindings.\n"
        "#pragma once\n#include <array>\n#include <string_view>\n\n"
        "namespace DefinitionImageBindings {\n"
        "struct Binding { std::string_view definition; std::string_view image; };\n"
        f"inline constexpr std::array<Binding, {len(rows)}> Bindings{{{{\n"
        + "\n".join(rows) + "\n}};\n}\n"
    )
    publish(path, text.encode("ascii"))


def run(*arguments: object) -> None:
    subprocess.run([str(arg) for arg in arguments], cwd=ROOT, check=True)


def require_publishable_atlas(unit: dict, layout: dict) -> None:
    """Enforce proof or explicitly bounded fallback without relabeling results."""
    settings = unit["settings"]
    exact = layout.get("exact", {})
    area = layout["width"] * layout["height"]
    message = f"Atlas {unit['name']} fails configured solve policy; publication refused"
    bound, gap = exact.get("best_bound"), exact.get("gap")
    pak.require(settings.solver == "exact"
                and exact.get("objective_area") == area
                and exact.get("model_version") == exact_atlas.MODEL_VERSION
                and exact.get("solver_version") == exact_atlas._version()
                and exact.get("solver") == "ortools-cp-sat"
                and type(bound) is int and 0 <= bound <= area
                and type(gap) in (int, float) and math.isfinite(gap)
                and math.isclose(gap, (area - bound) / area if area else 0.0,
                                 rel_tol=1e-12, abs_tol=1e-12),
                message)
    proven = (exact.get("optimal") is True
              and exact.get("status") in {"OPTIMAL", "LOWER_BOUND_PROVEN"} and bound == area)
    unproven = (exact.get("optimal") is False
                and exact.get("status") in {"FEASIBLE", "UNKNOWN"})
    bounded = (type(settings.time_limit_seconds) in (int, float)
               and math.isfinite(settings.time_limit_seconds)
               and 0 < settings.time_limit_seconds <= 86400)
    pak.require(isinstance(settings.require_optimal, bool)
                and (settings.require_optimal or bounded)
                and (proven or (not settings.require_optimal and bounded and unproven)), message)


@contextmanager
def atlas_proof_progress(cache: Path, name: str, index: int, total: int, started: float, *,
                         require_optimal: bool = True, time_limit_seconds: float | None = None):
    """Heartbeat remains observable even during a long proof with no new solution."""
    stopped, lock, state = threading.Event(), threading.Lock(), {}

    def update(exact=None):
        with lock:
            if exact is not None:
                state["exact"] = exact
            publish(cache / "atlas-proof-progress.json", (json.dumps({
                "atlas": name, "index": index, "total": total, "phase": "solving",
                "elapsed_seconds": time.monotonic() - started,
                "exact": state.get("exact"),
                "require_optimal": require_optimal, "time_limit_seconds": time_limit_seconds,
                "publication": "previous package and generated headers retained until all configured atlas policies pass",
            }, indent=2) + "\n").encode())

    def heartbeat():
        while not stopped.wait(30):
            update()

    update()
    thread = threading.Thread(target=heartbeat, name="atlas-proof-progress", daemon=True)
    thread.start()
    try:
        yield update
    finally:
        stopped.set()
        thread.join()


def build(args: argparse.Namespace, work: Path) -> None:
    cache = args.cache.resolve()
    cache.mkdir(parents=True, exist_ok=True)
    game = ROOT / "pvzPerf"
    definitions = ROOT / "assets/definitions"
    config = resource_build_config.load(args.config)
    seeded = exact_atlas.seed_completed_cache(
        definitions / "atlas-cache", cache / "atlas-layout-cache")
    if seeded:
        print(f"Seeded {seeded} validated atlas searches from the source cache", flush=True)
    # Published manifests identify completed legacy searches. Live checkpoints
    # have no such evidence and must continue solving, even in bounded mode.
    manifest_path = cache / "manifest.json"
    if manifest_path.exists():
        try:
            previous = json.loads(manifest_path.read_text(encoding="utf-8"))
        except (OSError, ValueError):
            previous = {}
        imported = exact_atlas.import_completed_budget(cache / "atlas-layout-cache", previous)
        if imported:
            print(f"Recovered {imported} completed atlas search budgets from the published manifest",
                  flush=True)
    deferred_headers = {}
    generated = game / "Sexy.TodLib/generated"
    program_symbols = game / "Sexy.TodLib/ProgramImageSymbols.h"
    source_files = [p for p in game.rglob("*") if p.suffix in {".cpp", ".h", ".hpp", ".inl"}
                    and "generated" not in p.parts]

    # Game symbols are ordinary C++ source. Definition compilers never read them.
    symbol_names = dict(resources.read_symbols(program_symbols)[0])
    code_symbols = resources.code_image_roots(ROOT, symbol_names)

    reanim = work / "reanim"
    particles = work / "particles"
    reanim_list, particle_list = work / "reanim-inputs.txt", work / "particle-inputs.txt"
    publish(reanim_list, ("\n".join(str(path) for path in config.sources["reanim"]) + "\n").encode())
    publish(particle_list, ("\n".join(str(path) for path in config.sources["particle"]) + "\n").encode())
    run(args.compiler, "compile-v2", "--input-list", reanim_list,
        "--output", reanim, "--type-map", ROOT / "tools/reanim_type_map.txt",
        "--family-file", ROOT / "tools/reanim_track_families.txt",
        "--font-registry", ROOT / "tools/font_symbol_ids.bin")
    run(args.compiler, "compile-particle-v2", "--input-list", particle_list,
        "--output", particles, "--gold64", definitions / "particle-reference")
    for name in ("ReanimTrackId.h", "ReanimTrackMphfGlobal.h"):
        deferred_headers[game / "Sexy.TodLib" / name] = (reanim / name).read_bytes()
    deferred_headers[generated / "ParticleEmitterName.h"] = (particles / "ParticleEmitterName.h").read_bytes()

    strings = work / "strings"
    run(args.compiler, "bake-strings", "--input", definitions / "LawnStrings.txt",
        "--output-dir", strings)
    for name in ("LawnStrings.h", "LawnStrings.cpp"):
        deferred_headers[generated / name] = (strings / name).read_bytes()

    records = {}
    source_names = {}
    for kind, directory in (("reanim", reanim), ("particles", particles)):
        image_names = (directory / "image_sources.txt").read_text(encoding="utf-8").splitlines()
        pak.require(len(set(image_names)) == len(image_names) and all(image_names),
                    f"Invalid compiler source image names: {kind}")
        source_names[kind] = dict(enumerate(image_names, 1))
        for path in directory.glob("*.source-record"):
            name = path.stem.casefold() + ".compiled"
            if name in PARTICLE_COMPILER_FIXTURES:
                continue
            records[f"compiled/{kind}/{name}"] = path.read_bytes()
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
        program_symbols, tag_ids)
    source_images = definition_atlas.authoring_descriptors(
        (definitions / "resources.json").read_bytes(), raw_files,
        {name for names in source_names.values() for name in names.values()})
    atlas_report = {}
    definition_names = sorted(name for name in records if pak.numeric_kind(name) in ("reanim", "particles"))
    dimensions, definition_symbols = {}, {}
    for name in definition_names:
        body = records[name][12:]
        offsets = definition_atlas.image_offsets(pak.numeric_kind(name), body)
        handles = source_names[pak.numeric_kind(name)]
        symbols = sorted({handles[index] for offset in offsets
                          if (index := struct.unpack_from("<I", body, offset)[0]) != 0})
        for symbol in symbols:
            if symbol not in dimensions:
                image, _ = definition_atlas.logical_image(source_images[symbol], raw_files)
                dimensions[symbol] = image.size
        definition_symbols[name] = symbols
    grouped = set()
    units = []
    for group, members in resource_build_config.resolve_atlases(config, set(definition_names)).items():
        grouped.update(members)
        units.append({"name": group, "path": f"compiled/atlases/{group}.atlas.png",
                      "members": members, "settings": config.settings.get(group, config.defaults)})
    units.extend({"name": name, "path": "", "members": [name], "settings": config.defaults}
                 for name in definition_names if name not in grouped)
    for unit in units:
        unit["symbols"] = sorted({symbol for name in unit["members"] for symbol in definition_symbols[name]})
    batches = [[dimensions[symbol] for symbol in unit["symbols"]] for unit in units]
    layouts = definition_atlas.native_layouts(args.compiler, batches)
    proof_started = time.monotonic()
    progress_path = cache / "atlas-proof-progress.json"
    for index, (unit, sizes) in enumerate(zip(units, batches)):
        settings = unit["settings"]
        print(f"Solving atlas {index + 1}/{len(units)}: {unit['name']} "
              f"({len(sizes)} images, time limit={settings.time_limit_seconds or 'unlimited'}, "
              f"proof required={settings.require_optimal})", flush=True)

        try:
            pak.require(settings.solver == "exact",
                        "Production atlases require the exact solver; MaxRects is only an incumbent")
            with atlas_proof_progress(
                    cache, unit["name"], index + 1, len(units), proof_started,
                    require_optimal=settings.require_optimal,
                    time_limit_seconds=settings.time_limit_seconds) as progress:
                layouts[index] = exact_atlas.optimize_layouts(
                    [sizes], [layouts[index]], max_side=settings.max_side, padding=settings.padding,
                    time_limit_seconds=settings.time_limit_seconds,
                    cache=cache / "atlas-layout-cache", workers=settings.workers,
                    require_optimal=settings.require_optimal, progress=progress)[0]
            exact_atlas._validate(sizes, layouts[index], settings.padding, settings.max_side)
            require_publishable_atlas(unit, layouts[index])
            result = layouts[index]["exact"]
            print(f"Atlas result {unit['name']}: {result['status']}, "
                  f"area={result['objective_area']}, bound={result['best_bound']}, "
                  f"gap={result['gap']:.6%}, optimal={result['optimal']}", flush=True)
        except BaseException as error:
            publish(progress_path, (json.dumps({
                "atlas": unit["name"], "index": index + 1, "total": len(units),
                "phase": "interrupted" if isinstance(error, KeyboardInterrupt) else "failed",
                "error": str(error), "elapsed_seconds": time.monotonic() - proof_started,
                "publication": "previous package and generated headers retained",
            }, indent=2) + "\n").encode())
            raise
        pak.require(layouts[index]["width"] <= settings.max_side and layouts[index]["height"] <= settings.max_side,
                    f"Atlas {unit['name']} exceeds configured dimension limit")
    # All atlas layouts must pass their configured policy before publication.
    # Checkpoint caches/progress are the only durable writes during solving.
    for path, data in deferred_headers.items():
        publish(path, data)
    for unit, layout in zip(units, layouts):
        emitted = False
        for name in unit["members"]:
            records[name], png, atlas_report[name] = definition_atlas.compile_definition(
                name, records[name], source_images, raw_files, layout=layout,
                atlas_symbols=unit["symbols"], atlas_path=unit["path"],
                source_names=source_names[pak.numeric_kind(name)],
                emit_png=not emitted and bool(definition_symbols[name]))
            if png is not None:
                records[unit["path"] or name.removesuffix(".compiled") + ".atlas.png"] = png
                emitted = True
    emit_definition_image_bindings(generated / "DefinitionImageBindings.h", atlas_report)
    live_symbols = {symbol for symbol, name in symbol_names.items() if name in code_symbols}
    resource_data, mapping, resource_kinds, retired_symbols = resources.prune_definition_images(
        resource_data, mapping, live_symbols)
    records[pak.RESOURCE_PATH] = resource_data
    # The generator owns these source files; unchanged content keeps its mtime.
    resources.emit_headers(ROOT, mapping, crc, names, resource_kinds)
    run(sys.executable, "-B", ROOT / "tools/gen_reanim_attacher_masks.py")

    expected = {"reanim": 146, "particles": 106, "fonts": 20, "resources": 1}
    counts = {kind: sum(pak.numeric_kind(name) == kind for name in records) for kind in expected}
    if counts != expected:
        raise ValueError(f"Incomplete numeric resource corpus: {counts}")
    audit = pak.source_audit(ROOT, {}, set(records))
    references = set()
    for name, data in records.items():
        if pak.numeric_kind(name) is None:
            continue
        pak.validate_numeric(name, data, audit["registries"], references,
                             atlas_path=atlas_report[name]["atlas_path"] if name in atlas_report else None)
    selected = set()
    available = set(raw_files) | set(records)
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
        if name in raw_files:
            records[name] = raw_files[name].read_bytes()
    output = cache / "main.pak64"
    temporary = output.with_suffix(".tmp")
    with zipfile.ZipFile(temporary, "w", compression=zipfile.ZIP_STORED) as archive:
        for name, data in sorted(records.items()):
            info = zipfile.ZipInfo(name, (1980, 1, 1, 0, 0, 0))
            info.create_system, info.external_attr = 0, 0x20
            archive.writestr(info, data)
    temporary.replace(output)
    image_occurrences = [image for definition in atlas_report.values() for image in definition["images"]]
    unique_pixels = {(image["rgba_sha256"], image["width"], image["height"]): image["rgba_bytes"]
                     for image in image_occurrences}
    program_ids = {name: identifier for identifier, name in symbol_names.items()}
    global_overlap = {(image["rgba_sha256"], image["width"], image["height"]): image["rgba_bytes"]
                      for image in image_occurrences
                      if image["source"] in program_ids
                      and mapping[program_ids[image["source"]]] != resources.NONE}
    source_bytes = sum(dimensions[symbol][0] * dimensions[symbol][1] * 4
                       for unit in units for symbol in unit["symbols"])
    atlas_bytes = sum(layout["width"] * layout["height"] * 4 for layout in layouts)
    padded_bytes = sum((width + 4) * (height + 4) * 4 for sizes in batches for width, height in sizes)
    report = {
        "format": "pvz-resource-build-v5",
        "numeric_counts": counts,
        "code_image_symbols": sorted(code_symbols),
        "runtime_inputs": len(raw_files),
        "runtime_included": len(set(raw_files) & selected),
        "runtime_omitted": sorted(set(raw_files) - selected),
        "retired_image_symbols": sorted(retired_symbols),
        "definition_atlases": atlas_report,
        "build_config": str(config.path.relative_to(ROOT)),
        "atlas_groups": {unit["name"]: {"members": unit["members"],
                                      "path": unit["path"], "images": len(unit["symbols"]),
                                      "width": layout["width"], "height": layout["height"],
                                      "solver": unit["settings"].solver,
                                      "time_limit_seconds": unit["settings"].time_limit_seconds,
                                      "require_optimal": unit["settings"].require_optimal,
                                      "exact": layout.get("exact")}
                         for unit, layout in zip(units, layouts)},
        "atlas_memory": {
            "rgba_bytes": atlas_bytes, "source_occurrence_rgba_bytes": source_bytes,
            "unique_source_rgba_bytes": sum(unique_pixels.values()),
            "duplicate_source_rgba_bytes": source_bytes - sum(unique_pixels.values()),
            "source_pixels_also_retained_globally_rgba_bytes": sum(global_overlap.values()),
            "padding_and_unused_rgba_bytes": atlas_bytes - source_bytes,
            "extrusion_rgba_bytes": padded_bytes - source_bytes,
            "unused_gap_rgba_bytes": atlas_bytes - padded_bytes,
            "padded_region_occupancy": padded_bytes / atlas_bytes if atlas_bytes else 1.0,
            "definition_atlas_count": sum(bool(unit["symbols"]) for unit in units),
            "packing_shelf_rgba_bytes": sum(layout["shelf_area"] * 4 for layout in layouts),
            "packing_saved_rgba_bytes": sum(layout["shelf_area"] * 4 for layout in layouts) - atlas_bytes,
            "packing_search_attempts": sum(layout["search_attempts"] for layout in layouts),
            "packing_search_microseconds": sum(layout["search_microseconds"] for layout in layouts),
        },
        "files": {name: {"bytes": len(data), "sha256": hashlib.sha256(data).hexdigest()}
                  for name, data in sorted(records.items())},
    }
    publish(cache / "manifest.json", (json.dumps(report, indent=2) + "\n").encode())
    (cache / "resources.stamp").write_text("complete\n", encoding="ascii")
    publish(progress_path, (json.dumps({
        "phase": "published", "total": len(units),
        "elapsed_seconds": time.monotonic() - proof_started,
        "publication": "all configured atlas policies passed",
        "unproven_atlases": [unit["name"] for unit, layout in zip(units, layouts)
                             if not layout["exact"]["optimal"]],
    }, indent=2) + "\n").encode())
    print(f"Resource package: {output}; {len(records)} entries; omitted {len(set(raw_files) - selected)} inputs")


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--compiler", type=Path, required=True)
    parser.add_argument("--cache", type=Path, required=True)
    parser.add_argument("--config", type=Path, default=ROOT / "assets/definitions/ResourceBuild.pvzbuild")
    args = parser.parse_args()
    args.cache = args.cache.resolve()
    args.cache.mkdir(parents=True, exist_ok=True)
    with tempfile.TemporaryDirectory(prefix="compile-", dir=args.cache) as temporary:
        build(args, Path(temporary))


if __name__ == "__main__":
    main()
