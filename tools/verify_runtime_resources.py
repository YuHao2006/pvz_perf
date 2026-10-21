#!/usr/bin/env python3
"""Read-only numeric PAK64 closure and preserved QuickPlay resource checks.

Verifies a package against the current author manifest. The published v1.3
retirement policy belongs to that tag; this tool requires all original menu
images and descriptors, and never creates or changes a package or source file.
"""
from __future__ import annotations

import argparse
from pathlib import Path
import posixpath
import struct
import zipfile

import build_numeric_runtime_pak64 as pak
import compile_numeric_fonts as fonts
import compile_numeric_resources as resources


ROOT = Path(__file__).resolve().parents[1]
# Explicit stable identities, not positions inferred from a filtered registry.
# name, ResourceId slot, ImageSymbolId, original file, audited payload bytes.
MENU_IMAGES = (
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


def check_menu_resources(records: dict[int, tuple], available: set[str]) -> None:
    for name, slot, symbol, path, _ in MENU_IMAGES:
        fields, paths, _ = records[slot]
        pak.require(fields == (slot, symbol, 28, 0, resources.PALLETIZE | resources.AUTO_ALPHA,
                               resources.NONE, 0),
                    f"Preserved menu descriptor identity or flags changed: {name}")
        pak.require(paths == (posixpath.splitext(path)[0], "", "", ""),
                    f"Preserved menu descriptor must retain its original path: {name}")
        pak.require(path in available, f"Missing preserved menu image: {path}")
    for slot, symbol, path in BACK_BUTTONS:
        fields, paths, _ = records[slot]
        pak.require(fields == (slot, symbol, 28, 0, resources.PALLETIZE | resources.AUTO_ALPHA,
                               resources.NONE, 0) and paths == (path, "", "", ""),
                    f"Active QuickPlay back button changed: {path}")
        pak.require(path + ".png" in available, f"Missing active back button: {path}")


def check_compiled_images(records: dict[int, tuple], image_ids: set[int]) -> None:
    """Every image referenced by compiled animations/particles must be loadable."""
    by_symbol = {fields[1]: (fields, paths)
                 for fields, paths, _ in records.values() if fields[3] == 0 and fields[1]}
    for symbol in image_ids:
        pak.require(symbol in by_symbol, f"Compiled image lacks descriptor: {symbol}")
        fields, paths = by_symbol[symbol]
        pak.require(not fields[4] & (resources.PROGRAM | resources.UNAVAILABLE) and bool(paths[0]),
                    f"Compiled image descriptor is not loadable: {symbol}")


def verify(package: Path, root: Path = ROOT) -> dict:
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
        pak.require(actual == expected, "resources.compiled differs from current author manifest")
        available = {name for name, info in index.items() if not info.is_dir()}
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
        records = descriptors(actual)
        check_menu_resources(records, available)
        check_compiled_images(records, image_ids)
        return {
            "mode": "package verification",
            "entries": len(index),
            "numeric_counts": counts,
            "physical_references": len(resolved),
            "compiled_image_ids": len(image_ids),
            "preserved_menu_images": len(MENU_IMAGES) + len(BACK_BUTTONS),
            "preserved_menu_payload_bytes": sum(index[path].file_size
                                                for _, _, _, path, _ in MENU_IMAGES),
            "resource_manifest_bytes": len(actual),
        }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("package", type=Path)
    parser.add_argument("--root", type=Path, default=ROOT)
    args = parser.parse_args()
    try:
        report = verify(args.package, args.root)
    except (ValueError, OSError, KeyError, zipfile.BadZipFile, struct.error) as error:
        parser.exit(1, f"Runtime resource verification failed: {error}\n")
    for key, value in report.items():
        print(f"{key}: {value}")


if __name__ == "__main__":
    main()
