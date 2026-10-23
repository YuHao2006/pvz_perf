#!/usr/bin/env python3
"""Read-only NRSC4 PAK64 closure and retired QuickPlay source preservation."""
from __future__ import annotations

import argparse
import hashlib
import io
import json
from pathlib import Path
import posixpath
import struct
import zipfile
from PIL import Image

import build_numeric_runtime_pak64 as pak
import compile_numeric_fonts as fonts
import compile_numeric_resources as resources


ROOT = Path(__file__).resolve().parents[1]
# Author labels and original source paths have no numeric runtime identity.
MENU_IMAGES = (
    ("IMAGE_SELECTORSCREEN_MOREWAYSTOPLAY_BG", "IMAGE_SELECTORSCREEN_MOREWAYSTOPLAY_BG",
     "images/selector_morewaystoplay_background.png", 432161),
    ("IMAGE_QUICKPLAY_MINIGAMES_BUTTON", "IMAGE_QUICKPLAY_MINIGAMES_BUTTON",
     "images/quickplay_minigames_button.png", 31499),
    ("IMAGE_QUICKPLAY_MINIGAMES_BUTTON_HIGHLIGHT", "IMAGE_QUICKPLAY_MINIGAMES_BUTTON_HIGHLIGHT",
     "images/quickplay_minigames_button_highlight.png", 32890),
    ("IMAGE_QUICKPLAY_MINIGAMES_CLOUD", "IMAGE_QUICKPLAY_MINIGAMES_CLOUD",
     "images/quickplay_minigames_cloud.png", 31688),
    ("IMAGE_QUICKPLAY_PUZZLES_BUTTON", "IMAGE_QUICKPLAY_PUZZLES_BUTTON",
     "images/quickplay_puzzles_button.png", 20725),
    ("IMAGE_QUICKPLAY_PUZZLES_BUTTON_HIGHLIGHT", "IMAGE_QUICKPLAY_PUZZLES_BUTTON_HIGHLIGHT",
     "images/quickplay_puzzles_button_highlight.png", 21875),
    ("IMAGE_QUICKPLAY_PUZZLES_CLOUD", "IMAGE_QUICKPLAY_PUZZLES_CLOUD",
     "images/quickplay_puzzles_cloud.png", 27903),
    ("IMAGE_QUICKPLAY_SURVIVAL_BUTTON", "IMAGE_QUICKPLAY_SURVIVAL_BUTTON",
     "images/quickplay_survival_button.png", 31281),
    ("IMAGE_QUICKPLAY_SURVIVAL_BUTTON_HIGHLIGHT", "IMAGE_QUICKPLAY_SURVIVAL_BUTTON_HIGHLIGHT",
     "images/quickplay_survival_button_highlight.png", 32474),
    ("IMAGE_QUICKPLAY_SURVIVAL_CLOUD", "IMAGE_QUICKPLAY_SURVIVAL_CLOUD",
     "images/quickplay_survival_cloud.png", 36278),
)
BACK_BUTTONS = (
    ("IMAGE_QUICKPLAY_BACK_BUTTON", "images/quickplay_back_button"),
    ("IMAGE_QUICKPLAY_BACK_BUTTON_HIGHLIGHT", "images/quickplay_back_button_highlight"),
)


def descriptors(data: bytes) -> dict[tuple[int, int], tuple]:
    """Decode transient group steps; none of these keys are image identities."""
    result = {}
    for group, step, fields, paths, tail in pak.resource_records(data):
        if fields[0] == 0:
            result[group, step] = (group, fields, paths, tail)
    return result


def check_menu_resources(records: dict, available: set[str], root: Path = ROOT) -> None:
    paths = {path for _, _, path, _ in MENU_IMAGES}
    paths.update(path + ".png" for _, path in BACK_BUTTONS)
    stems = {posixpath.splitext(path)[0] for path in paths}
    for path in sorted(paths):
        pak.require((root / "assets/runtime" / path).is_file(),
                    f"Missing preserved QuickPlay source image: {path}")
        pak.require(path not in available, f"Retired QuickPlay image remains packaged: {path}")
    for _, _, resource_paths, _ in records.values():
        pak.require(not any(posixpath.splitext(path.casefold())[0] in stems for path in resource_paths if path),
                    "Retired QuickPlay image remains in a load descriptor")


def check_compiled_images(records: dict, image_ids: set[int]) -> None:
    pak.require(not image_ids, "Production definitions must not contain global image IDs")


def verify(package: Path, root: Path = ROOT) -> dict:
    with zipfile.ZipFile(package) as archive:
        index = pak.archive_index(archive)
        numeric = {name for name in index if pak.numeric_kind(name)}
        counts = {kind: sum(pak.numeric_kind(name) == kind for name in numeric)
                  for kind in set(pak.expected_counts(root)) | {pak.numeric_kind(name) for name in numeric}}
        pak.require(counts == pak.expected_counts(root), f"Incomplete numeric corpus: {counts}")
        audit = pak.source_audit(root, {}, numeric)
        pak.validate_particle_inheritance({name: archive.read(index[name]) for name in numeric
                                          if pak.numeric_kind(name) == "particles"})
        runtime = root / "assets/runtime"
        input_paths = [path.relative_to(runtime).as_posix()
                       for path in sorted(runtime.rglob("*")) if path.is_file()]
        tags = fonts.tag_registry(fonts.load_corpus(root / "assets/definitions/fonts"))
        expected, _, _, _ = resources.compile_manifest(
            root, (root / "assets/definitions/resources.json").read_bytes(), input_paths,
            resources.read_names(root), tags)
        actual = archive.read(index[pak.RESOURCE_PATH])
        definitions_v6 = not audit["static_definitions"] and all(struct.unpack_from("<I", archive.read(index[name]))[0] in
                             (0xDEADFEDB, 0xDEADFEDC)
                             for name in numeric if pak.numeric_kind(name) in ("reanim", "particles"))
        pak.require(actual == expected, "resources.compiled differs from current author manifest")
        available = {name for name, info in index.items() if not info.is_dir()}
        references, image_ids, required_fonts = set(), set(), set()
        bindings = audit["definition_images"]
        variant_bindings = audit["definition_variant_images"]
        if audit["static_definitions"]:
            pak.require(not any(pak.numeric_kind(name) in ("reanim", "particles", "projectiles")
                                for name in available),
                        "Static definitions must not ship compiled behavior records")
            expected_roots = set().union(*(
                set(rows) for rows in audit["numeric_definition_tables"].values())) | {pak.PROJECTILE_PATH}
            if (root / "pvzPerf/Lawn/Widget/ZombatarResources.h").exists():
                expected_roots.add(pak.ZOMBATAR_DEFINITION_PATH)
            pak.require(pak.ZOMBATAR_DEFINITION_PATH not in available,
                        "Zombatar atlas geometry must be native static data")
            pak.require(set(bindings) == expected_roots,
                        "Static program definition bindings differ from runtime catalogs")
            expected_atlases = ({image for rows in variant_bindings.values() for image in rows if image}
                               | set(audit.get("scene_atlases", {})))
            pak.require({name for name in available if name.endswith(".atlas.png")} == expected_atlases
                        == set(audit["static_atlas_extents"]),
                        "Packaged static atlases differ from generated loading functions")
            for name, dimensions in audit["static_atlas_extents"].items():
                with Image.open(io.BytesIO(archive.read(index[name]))) as image:
                    pak.require(image.format == "PNG" and image.mode == "RGBA" and image.size == dimensions,
                                f"Static atlas dimensions or encoding mismatch: {name}")
                references.add(("atlas", name))
            for sheet in audit.get("scene_sheets", []):
                with Image.open(io.BytesIO(archive.read(index[sheet["atlas"]]))) as image:
                    x, y, width, height = sheet["rect"]
                    pak.require(x >= 2 and y >= 2 and width > 0 and height > 0
                                and x + width + 2 <= image.width and y + height + 2 <= image.height,
                                f"Scene source sheet outside its atlas: {sheet['source']}")
                    pixels = image.crop((x, y, x + width, y + height)).tobytes()
                    pak.require(hashlib.sha256(pixels).hexdigest() == sheet["rgba_sha256"],
                                f"Scene source sheet pixels changed: {sheet['source']}")
        elif definitions_v6:
            pak.require(set(bindings) == {name for name in numeric
                                         if pak.numeric_kind(name) in ("reanim", "particles", "projectiles")},
                        "Program definition image bindings do not cover the numeric corpus")
            pak.require({name for name in available if name.endswith(".atlas.png")} ==
                        {image for rows in variant_bindings.values() for image in rows if image},
                        "Packaged atlas images differ from program bindings")
        report_path = package.with_name("manifest.json")
        report_bindings = {}
        if report_path.exists():
            report_bindings = json.loads(report_path.read_text(encoding="utf-8")).get("definition_atlases", {})
        checked_atlases = {}
        for name in sorted(numeric):
            data = expected if name == pak.RESOURCE_PATH else archive.read(index[name])
            required_fonts.update(pak.validate_numeric(
                name, data, audit["registries"], references, image_ids=image_ids,
                atlas_paths=variant_bindings.get(name),
                atlas_path=bindings.get(name)))
            if pak.numeric_kind(name) == "projectiles":
                atlas = pak.parse_projectiles(name, data)
                atlas_path = bindings.get(name, pak.PROJECTILE_ATLAS_PATH)
                pak.require(atlas_path in index, f"Missing projectile atlas: {atlas_path}")
                pak.validate_projectile_atlas_image(atlas, archive.read(index[atlas_path]), atlas_path)
                if name in report_bindings:
                    pak.require(report_bindings[name]["atlas_path"] == atlas_path,
                                f"Program/report projectile atlas binding differs: {name}")
                continue
            if pak.numeric_kind(name) in ("reanim", "particles") and struct.unpack_from("<I", data)[0] in (0xDEADFEDB, 0xDEADFEDC):
                atlas = pak.parse_definition_atlas(name, data)
                pak.require(name in bindings, f"Missing program definition image binding: {name}")
                atlas_path = bindings[name]
                if "variant_count" in atlas:
                    paths = variant_bindings[name]
                    pak.require(len(paths) == atlas["variant_count"], "Incomplete reanim variant bindings")
                    report_rows = report_bindings.get(name, {}).get("variants", [])
                    if report_rows:
                        pak.require([row["atlas_path"] for row in report_rows] == paths,
                                    "Program/report reanim variant binding differs")
                    for variant, path in enumerate(paths):
                        count = atlas["variant_counts"][variant]
                        pak.require(bool(path) == bool(count), "Invalid reanim variant atlas binding")
                        if not path:
                            continue
                        pak.require(path in index, f"Missing definition atlas: {path}")
                        if path in checked_atlases:
                            pak.require(checked_atlases[path] == atlas["variant_dimensions"][variant],
                                        f"Inconsistent definition atlas dimensions: {path}")
                            continue
                        with Image.open(io.BytesIO(archive.read(index[path]))) as image:
                            pak.require(image.format == "PNG" and image.mode == "RGBA" and
                                        image.size == atlas["variant_dimensions"][variant],
                                        f"Invalid definition atlas: {path}")
                            image.load()
                            checked_atlases[path] = image.size
                    continue
                if name in report_bindings:
                    pak.require(report_bindings[name]["atlas_path"] == atlas_path,
                                f"Program/report definition atlas binding differs: {name}")
                if atlas["count"]:
                    pak.require(bool(atlas_path), f"Nonempty definition has no program atlas binding: {name}")
                    pak.require(atlas_path in index, f"Missing definition atlas: {atlas_path}")
                    with Image.open(io.BytesIO(archive.read(index[atlas_path]))) as image:
                        pak.require(image.format == "PNG" and image.mode == "RGBA" and
                                    image.size == (atlas["width"], atlas["height"]),
                                    f"Invalid definition atlas: {atlas_path}")
                        image.load()
                else:
                    pak.require(not atlas_path, f"Empty definition has an atlas binding: {name}")
        pak.require(required_fonts <= numeric,
                    f"Missing numeric fonts: {sorted(required_fonts - numeric)}")
        resolved = set()
        for kind, path in sorted(references):
            resolved.update(pak.physical_references(kind, path, available))
        records = descriptors(actual)
        check_menu_resources(records, available, root)
        check_compiled_images(records, image_ids)
        return {
            "mode": "package verification",
            "entries": len(index),
            "numeric_counts": counts,
            "physical_references": len(resolved),
            "compiled_image_ids": len(image_ids),
            "static_definitions": audit["static_definitions"],
            "definition_v6": definitions_v6,
            "definition_atlases": sum(kind == "atlas" for kind, _ in references),
            "scene_atlases": len(audit.get("scene_atlases", {})),
            "scene_source_sheets": len(audit.get("scene_sheets", [])),
            "retired_menu_images": len(MENU_IMAGES) + len(BACK_BUTTONS),
            "preserved_menu_source_bytes": sum((root / "assets/runtime" / path).stat().st_size
                                               for _, _, path, _ in MENU_IMAGES)
                + sum((root / "assets/runtime" / (path + ".png")).stat().st_size
                      for _, path in BACK_BUTTONS),
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
