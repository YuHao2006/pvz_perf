#!/usr/bin/env python3
"""Read-only numeric PAK64 closure and retired-menu regression checks.

Normal mode verifies an already rebuilt package. --predict-retirement substitutes
only an in-memory resources.compiled and excludes the ten retired images while
checking an older package; it never creates or changes a package or source file.
"""
from __future__ import annotations

import argparse
from pathlib import Path
import posixpath
import re
import struct
import zipfile

import build_numeric_runtime_pak64 as pak
import compile_numeric_fonts as fonts
import compile_numeric_resources as resources


ROOT = Path(__file__).resolve().parents[1]
# Explicit stable identities, not positions inferred from a filtered registry.
# name, ResourceId slot, ImageSymbolId, original file, audited payload bytes.
RETIRED = (
    ("IMAGE_SELECTORSCREEN_MOREWAYSTOPLAY_BG", 100, 1943,
     "images/selector_morewaystoplay_background.png", 432161),
    ("IMAGE_QUICKPLAY_MINIGAMES_BUTTON", 113, 197,
     "images/quickplay_minigames_button.png", 31499),
    ("IMAGE_QUICKPLAY_MINIGAMES_BUTTON_HIGHLIGHT", 114, 198,
     "images/quickplay_minigames_button_highlight.png", 32890),
    ("IMAGE_QUICKPLAY_MINIGAMES_CLOUD", 115, 199,
     "images/quickplay_minigames_cloud.png", 31688),
    ("IMAGE_QUICKPLAY_PUZZLES_BUTTON", 116, 200,
     "images/quickplay_puzzles_button.png", 20725),
    ("IMAGE_QUICKPLAY_PUZZLES_BUTTON_HIGHLIGHT", 117, 201,
     "images/quickplay_puzzles_button_highlight.png", 21875),
    ("IMAGE_QUICKPLAY_PUZZLES_CLOUD", 118, 202,
     "images/quickplay_puzzles_cloud.png", 27903),
    ("IMAGE_QUICKPLAY_SURVIVAL_BUTTON", 119, 203,
     "images/quickplay_survival_button.png", 31281),
    ("IMAGE_QUICKPLAY_SURVIVAL_BUTTON_HIGHLIGHT", 120, 204,
     "images/quickplay_survival_button_highlight.png", 32474),
    ("IMAGE_QUICKPLAY_SURVIVAL_CLOUD", 121, 205,
     "images/quickplay_survival_cloud.png", 36278),
)
BACK_BUTTONS = (
    (122, 195, "images/quickplay_back_button"),
    (123, 196, "images/quickplay_back_button_highlight"),
)


def descriptors(data: bytes) -> dict[int, tuple]:
    """Decode identities/paths; validate_numeric separately checks every tail."""
    reader = pak.Reader(data[36:])
    result = {}
    while reader.at < len(reader.data):
        record = pak.Reader(reader.take(reader.word()))
        fields = record.unpack("<7I")
        paths = tuple(record.path() for _ in range(4))
        pak.require(fields[0] not in result, "Duplicate resource slot")
        result[fields[0]] = (fields, paths, record.take(len(record.data) - record.at))
    return result


def check_retired_descriptors(records: dict[int, tuple], image_ids: set[int]) -> None:
    for name, slot, symbol, _, _ in RETIRED:
        fields, paths, _ = records[slot]
        pak.require(fields == (slot, symbol, 28, 0, resources.PALLETIZE,
                               resources.NONE, 0),
                    f"Retired descriptor identity or flags changed: {name}")
        pak.require(paths == ("images/blank", "", "", ""),
                    f"Retired descriptor must load blank with no alpha: {name}")
        pak.require(symbol not in image_ids,
                    f"Compiled animation/particle revived retired image: {name}")
    for slot, symbol, path in BACK_BUTTONS:
        fields, paths, _ = records[slot]
        pak.require(fields[:4] == (slot, symbol, 28, 0) and paths[0] == path
                    and not fields[4] & (resources.PROGRAM | resources.UNAVAILABLE),
                    f"Active QuickPlay back button changed: {path}")


def check_cpp_text(text: str, label: str) -> None:
    """Conservative C++ token audit, retaining unknown preprocessor branches.

    Ignore comments/string contents as identifiers; inspect string literals
    separately for physical paths. This is not a general C++ reachability proof.
    """
    text = pak.production_text(text)
    identifiers = set(re.findall(r"\b[A-Za-z_]\w*\b",
                                pak.TOKEN.sub(lambda match: " " * len(match[0]), text)))
    retired_names = {name for name, *_ in RETIRED}
    revived = identifiers & (retired_names | {name + "_ID" for name in retired_names})
    pak.require(not revived, f"Retired menu symbol used in {label}: {sorted(revived)}")
    retired_stems = {posixpath.splitext(path)[0].casefold() for _, _, _, path, _ in RETIRED}
    for _, value in pak.literals(text):
        normalized = value.replace("\\", "/").casefold()
        stem = posixpath.splitext(normalized)[0]
        pak.require(normalized not in retired_stems and stem not in retired_stems,
                    f"Retired menu path used in {label}: {value}")


def check_cpp_sources(root: Path) -> None:
    game = root / "pvzPerf"
    for path in sorted(game.rglob("*")):
        if (path.suffix not in pak.CPP_SUFFIXES or "generated" in path.parts
                or path.name in ("Resources.cpp", "Resources.h")):
            continue
        # Resources.cpp/.h intentionally retain stable global declarations,
        # extraction and ID lookup tables. They are not rendering consumers.
        check_cpp_text(path.read_text(encoding="utf-8-sig"),
                       path.relative_to(root).as_posix())


def verify(package: Path, root: Path = ROOT, *, predict_retirement: bool = False) -> dict:
    check_cpp_sources(root)
    with zipfile.ZipFile(package) as archive:
        index = pak.archive_index(archive)
        numeric = {name for name in index if pak.numeric_kind(name)}
        counts = {kind: sum(pak.numeric_kind(name) == kind for name in numeric)
                  for kind in pak.COUNTS}
        pak.require(counts == pak.COUNTS, f"Incomplete numeric corpus: {counts}")
        audit = pak.source_audit(root, {}, numeric)
        runtime = root / "assets/runtime"
        input_paths = [path.relative_to(runtime).as_posix()
                       for path in sorted(runtime.rglob("*")) if path.is_file()]
        tags = fonts.tag_registry(fonts.load_corpus(root / "assets/definitions/fonts"))
        expected, _, _, _ = resources.compile_manifest(
            root, (root / "assets/definitions/resources.json").read_bytes(), input_paths,
            root / "pvzPerf/Sexy.TodLib/generated/image_symbol_ids.bin", tags)
        actual = archive.read(index[pak.RESOURCE_PATH])
        retired_paths = {path for _, _, _, path, _ in RETIRED}
        if predict_retirement:
            before, after = descriptors(actual), descriptors(expected)
            pak.require(before.keys() == after.keys(), "Prediction changed resource slot inventory")
            retired_slots = {slot for _, slot, _, _, _ in RETIRED}
            for slot in before.keys() - retired_slots:
                pak.require(before[slot] == after[slot],
                            f"Prediction would change unrelated descriptor: {slot}")
            for name, slot, symbol, path, _ in RETIRED:
                fields, paths, tail = before[slot]
                pak.require(fields == (slot, symbol, 28, 0, 1040, resources.NONE, 0)
                            and paths == (str(Path(path).with_suffix("")).replace("\\", "/"),
                                          "", "", "")
                            and tail == after[slot][2],
                            f"Prediction input is not the audited old menu descriptor: {name}")
            pak.require(retired_paths <= index.keys(), "Prediction input lacks retired images")
        else:
            pak.require(actual == expected, "resources.compiled differs from current author manifest")
            pak.require(not retired_paths & index.keys(), "Retired menu images remain in package")
        available = {name for name, info in index.items() if not info.is_dir()} - retired_paths
        references, image_ids, required_fonts = set(), set(), set()
        for name in sorted(numeric):
            data = expected if name == pak.RESOURCE_PATH else archive.read(index[name])
            required_fonts.update(pak.validate_numeric(
                name, data, audit["registries"], references, image_ids=image_ids))
        pak.require(required_fonts <= numeric,
                    f"Missing numeric fonts: {sorted(required_fonts - numeric)}")
        resolved = set()
        for kind, path in sorted(references):
            resolved.update(pak.physical_references(kind, path, available))
        check_retired_descriptors(descriptors(expected), image_ids)
        for _, _, path in BACK_BUTTONS:
            pak.require(path + ".png" in available, f"Missing active back button: {path}")
        removed_bytes = sum(index[path].file_size for path in retired_paths if path in index)
        return {
            "mode": "prediction (no files changed)" if predict_retirement else "package verification",
            "entries": len(index) - (len(retired_paths) if predict_retirement else 0),
            "numeric_counts": counts,
            "physical_references": len(resolved),
            "compiled_image_ids": len(image_ids),
            "retired_image_payload_bytes": removed_bytes if predict_retirement else sum(
                item[4] for item in RETIRED),
            "resource_manifest_bytes_before": len(actual),
            "resource_manifest_bytes_after": len(expected),
        }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("package", type=Path)
    parser.add_argument("--root", type=Path, default=ROOT)
    parser.add_argument("--predict-retirement", action="store_true")
    args = parser.parse_args()
    try:
        report = verify(args.package, args.root, predict_retirement=args.predict_retirement)
    except (ValueError, OSError, KeyError, zipfile.BadZipFile, struct.error) as error:
        parser.exit(1, f"Runtime resource verification failed: {error}\n")
    for key, value in report.items():
        print(f"{key}: {value}")


if __name__ == "__main__":
    main()
