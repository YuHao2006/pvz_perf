"""Read-only corpus audit; write a reproducible atlas overlap report.

Uses the cache's decoded RGBA fingerprints/dimensions and validates author image names
against currently selected source DSLs. Packing invokes only pack-atlas-layout,
never resource compilation. Candidate unions preserve author image identity just as
the production builder does; equal pixels under different names are reported
separately, not silently deduplicated.
"""
from __future__ import annotations

import argparse
from collections import defaultdict
import hashlib
import json
from pathlib import Path
import tempfile

import definition_atlas
import resource_build_config
import runtime_asset_sources
from migrate_particle_frame_images import Source
from stage_runtime_package import PARTICLE_COMPILER_FIXTURES

ROOT = Path(__file__).resolve().parents[1]
SOURCE_IMAGE_FIELDS = ("source", "width", "height", "rows", "cols",
                       "rgba_bytes", "rgba_sha256", "files")


def source_image_metadata(row: dict) -> dict:
    """Keep decoded image identity; a source can have different atlas rectangles."""
    return {key: row[key] for key in SOURCE_IMAGE_FIELDS}


def label(name: str) -> str:
    return name.removeprefix("compiled/").removesuffix(".compiled").replace("particles/", "particle:")


def component_image_sources(text: str, kind: str) -> list[tuple[str, str, set[str]]]:
    """Read component-local image references without treating strings as comments."""
    source = Source(text)
    result = []
    for component, (opening, _) in source.components().items():
        props = source.properties(opening)
        source_name = source.scalar(props, "source-name", component) if kind == "particle" else component
        if not isinstance(source_name, str) or not source_name:
            raise ValueError(f"Invalid component source-name: {component}")
        images = set()
        end = source.ends[opening]
        for i in range(opening + 1, end - 1):
            field = source.tokens[i].text
            if field not in ("image", "images") or source.tokens[i + 1].text != ":":
                continue
            if field == "images":
                value = i + 2
                if source.tokens[value].text != "[":
                    raise ValueError(f"Expected image list: {component}")
                values = source.tokens[value + 1:source.ends[value]]
            else:
                values = source.tokens[i + 2:i + 3]
            for token in values:
                if token.text in ("[", "]", ","):
                    continue
                name = json.loads(token.text) if token.text.startswith('"') else token.text
                if name.casefold() != "none":
                    images.add(name)
        result.append((component, source_name.casefold(), images))
    return result


def audit(root: Path, manifest_path: Path, compiler: Path, top: int) -> dict:
    raw_manifest = manifest_path.read_bytes()
    manifest = json.loads(raw_manifest)
    definitions = manifest["definition_atlases"]
    config = resource_build_config.load(root / manifest["build_config"])
    selected, source_hashes, component_names = {}, {}, {}
    normalized_names = {key.replace("_", ""): key for key in definitions}
    for kind, paths in config.sources.items():
        for path in paths:
            text = path.read_text(encoding="utf-8-sig")
            for name, source_name, images in component_image_sources(text, kind):
                if kind == "particle" and f"{name.casefold()}.compiled" in PARTICLE_COMPILER_FIXTURES:
                    continue
                key = f"compiled/{'particles' if kind == 'particle' else kind}/{source_name}.compiled"
                key = normalized_names.get(key.replace("_", ""), key)
                if key in selected:
                    raise ValueError(f"Duplicate selected component source-name: {key}")
                component_names[key] = f"{kind}:{name}"
                selected[key] = images
            source_hashes[path.relative_to(root).as_posix()] = hashlib.sha256(path.read_bytes()).hexdigest()
    if set(selected) != set(definitions):
        raise ValueError(f"Selected source definitions differ from cache manifest: "
                         f"source only={sorted(set(selected) - set(definitions))}; "
                         f"cache only={sorted(set(definitions) - set(selected))}")
    images, members, atlas_members = {}, {}, defaultdict(list)
    alias_differences = {}
    for name, definition in definitions.items():
        members[name] = {row["source"] for row in definition["images"]}
        if selected[name] != members[name]:
            if {source.casefold() for source in selected[name]} != {
                    source.casefold() for source in members[name]}:
                raise ValueError(f"Source DSL author image names differ from cache: {name}; "
                                 f"source only={selected[name] - members[name]}; cache only={members[name] - selected[name]}")
            alias_differences[name] = {"source": sorted(selected[name] - members[name]),
                                       "cache": sorted(members[name] - selected[name])}
        for row in definition["images"]:
            source_name = row["source"]
            source = source_image_metadata(row)
            if source_name in images and images[source_name] != source:
                raise ValueError(f"Inconsistent cached image descriptor: {source_name}")
            images[source_name] = source
        if definition["atlas_path"]:
            atlas_members[definition["atlas_path"]].append(name)
    atlas_sources = {
        path: set().union(*(members[name] for name in group))
        for path, group in atlas_members.items()}
    currently_shared = []
    for path, group in sorted(atlas_members.items()):
        if len(group) < 2:
            continue
        definition = definitions[group[0]]
        currently_shared.append({
            "path": path, "members": sorted(group),
            "components": [component_names[name] for name in sorted(group)],
            "width": definition["atlas_width"], "height": definition["atlas_height"],
            "rgba_bytes": definition["atlas_rgba_bytes"],
            "unique_author_images": len(atlas_sources[path]),
            "png_bytes": manifest["files"][path]["bytes"]})
    raw_files = runtime_asset_sources.inventory(root)
    author_names = set(images) | set().union(*selected.values())
    descriptors = definition_atlas.authoring_descriptors(
        (root / "assets/definitions/resources.json").read_bytes(), raw_files, author_names)
    for source_name in author_names:
        decoded, _ = definition_atlas.logical_image(descriptors[source_name], raw_files)
        digest = hashlib.sha256(decoded.tobytes()).hexdigest()
        if source_name in images:
            cached = images[source_name]
            if (decoded.width, decoded.height, digest) != (
                    cached["width"], cached["height"], cached["rgba_sha256"]):
                raise ValueError(f"Current decoded art differs from manifest: {source_name}")
        # Case aliases must resolve to the same current descriptor/pixels.
        for name, difference in alias_differences.items():
            if source_name in difference["source"]:
                counterparts = [s for s in difference["cache"]
                                if s.casefold() == source_name.casefold()]
                if not counterparts or any(images[s]["rgba_sha256"] != digest or
                                           (images[s]["width"], images[s]["height"]) != decoded.size
                                           for s in counterparts):
                    raise ValueError(f"Case alias pixels differ: {name}, {source_name}")

    def source_bytes(names):
        return sum(images[name]["rgba_bytes"] for name in names)

    def fingerprint(name):
        row = images[name]
        return row["width"], row["height"], row["rgba_sha256"]

    def unique_rgba(names):
        return sum(w * h * 4 for w, h, _ in {fingerprint(name) for name in names})

    # An existing atlas is indivisible for proposed edits: adding one pea member
    # necessarily considers the complete configured pea family.
    def expand(names):
        result = set(names)
        for name in tuple(result):
            path = definitions[name]["atlas_path"]
            if path:
                result.update(atlas_members[path])
        return tuple(sorted(result))

    pairs = []
    seen_physical_pairs = set()
    names = sorted(definitions)
    for i, left in enumerate(names):
        for right in names[i + 1:]:
            if definitions[left]["atlas_path"] and definitions[left]["atlas_path"] == definitions[right]["atlas_path"]:
                continue
            left_path, right_path = definitions[left]["atlas_path"], definitions[right]["atlas_path"]
            physical_pair = tuple(sorted((left_path, right_path)))
            if not left_path or not right_path or physical_pair in seen_physical_pairs:
                continue
            seen_physical_pairs.add(physical_pair)
            left_sources, right_sources = atlas_sources[left_path], atlas_sources[right_path]
            shared = left_sources & right_sources
            pixel_shared = {fingerprint(s) for s in left_sources} & {fingerprint(s) for s in right_sources}
            if not pixel_shared:
                continue
            pairs.append({"members": [left, right], "shared_author_images": len(shared),
                          "physical_paths": list(physical_pair),
                          "expanded_members": list(expand([left, right])),
                          "shared_author_image_rgba_bytes": source_bytes(shared),
                          "shared_exact_rgba_bytes": sum(w * h * 4 for w, h, _ in pixel_shared),
                          "cross_kind": len({name.split("/")[1] for name in expand([left, right])}) > 1})
    pairs.sort(key=lambda row: (-row["shared_author_image_rgba_bytes"], row["members"]))
    candidates = {}

    def add(group, purpose):
        group = expand(group)
        paths = {definitions[name]["atlas_path"] for name in group} - {""}
        if len(paths) > 1:
            candidates[group] = purpose

    for row in pairs[:top]:
        add(row["members"], "highest shared author image RGBA pair")
    for row in [row for row in pairs if row["cross_kind"]][:top]:
        add(row["members"], "highest cross reanim/particle shared author image RGBA pair")
    same_images = defaultdict(list)
    for name in names:
        if members[name]:
            same_images[tuple(sorted(members[name]))].append(name)
    for group in same_images.values():
        if len(group) > 1 and len({definitions[name]["atlas_path"] for name in group}) > 1:
            add(group, "identical author image sets; no additional source pixels")
    families = {
        "sunflower_family": ["reanim/sunflower", "reanim/twinsunflower"],
        "melon_family": ["reanim/melonpult", "reanim/wintermelon"],
        "magnet_family": ["reanim/magnetshroom", "reanim/goldmagnet"],
        "puff_family": ["reanim/puffshroom", "reanim/seashroom"],
        "zombie_body_family": ["reanim/zombie", "reanim/zombie_polevaulter", "reanim/zombie_flagpole"],
        "credits_main_family": ["reanim/credits_main", "reanim/credits_main2", "reanim/credits_main3"],
        "credits_with_brain_throat": ["reanim/credits_main", "reanim/credits_bigbrain", "reanim/credits_throat"],
        "credits_brain_throat": ["reanim/credits_bigbrain", "reanim/credits_throat"],
        "zombie_credits_family": ["reanim/zombie", "reanim/zombie_credits_conehead",
                                  "reanim/zombie_credits_screendoor", "reanim/zombie_credits_dance"],
        "explosion_particles": ["particles/jackexplode", "particles/catapultexplosion", "particles/bossexplosion"],
        "zamboni_with_explosion_particles": ["reanim/zombie_zamboni", "particles/jackexplode",
                                             "particles/catapultexplosion", "particles/bossexplosion"],
        "rising_and_ground_dirt": ["particles/dancerrise", "particles/diggerrise"],
        "ice_trap_particles": ["particles/icetrap", "particles/icetraprelease", "particles/icetrapzombie"],
        "rising_dirt_particles": ["particles/dancerrise", "particles/diggertunnel",
                                  "particles/whackazombierise", "particles/zombierise"],
        "snow_pea_particles": ["particles/snowpeapuff", "particles/snowpeasplat", "particles/snowpeatrail"],
        "zombie_debris": ["reanim/zombie", "particles/zombiearm", "particles/zombiehead",
                          "particles/zombieheadpool", "particles/moweredzombiearm", "particles/moweredzombiehead"],
        "boss_fireball": ["reanim/zombie_boss_fireball", "particles/zombie_boss_fireball",
                          "particles/fireball_trail", "particles/fireballdeath"],
        "boss_iceball": ["reanim/zombie_boss_iceball", "particles/bossiceballtrail",
                         "particles/iceball_trail", "particles/iceballdeath"],
        "portal_circle": ["reanim/portal_circle", "particles/portalcircle"],
        "portal_square": ["reanim/portal_square", "particles/portalsquare"],
        "zamboni_effects": ["reanim/zombie_zamboni", "particles/zamboniexplosion",
                           "particles/zamboniexplosion2", "particles/zambonismoke", "particles/zambonitire"],
    }
    for family, group in families.items():
        add([f"compiled/{name}.compiled" for name in group], family)
    groups = sorted(candidates)
    union_names = [sorted(set().union(*(members[name] for name in group))) for group in groups]
    layouts = definition_atlas.native_layouts(
        compiler, [[(images[s]["width"], images[s]["height"]) for s in names] for names in union_names])
    results = []
    for group, names, layout in zip(groups, union_names, layouts):
        paths = {definitions[name]["atlas_path"] for name in group} - {""}
        baseline = sum(next(definitions[name]["atlas_rgba_bytes"] for name in atlas_members[path])
                       for path in paths)
        occurrences = sum(source_bytes(atlas_sources[path]) for path in paths)
        proposed = layout["width"] * layout["height"] * 4
        singles = [definitions[name]["atlas_rgba_bytes"] for name in group if members[name]]
        results.append({"purpose": candidates[group], "members": list(group),
                        "components": [component_names[name] for name in group],
                        "current_paths": sorted(paths),
                        "current_physical_atlas_count": len(paths),
                        "source_subset_atlases": [path for path in sorted(paths)
                                                  if any(atlas_sources[path] <= atlas_sources[other]
                                                         for other in paths if other != path)],
                        "existing_union_owner_paths": [path for path in sorted(paths)
                                                        if atlas_sources[path] == set(names)],
                        "shared_author_image_rgba_bytes": occurrences - source_bytes(names),
                        "exact_rgba_duplicate_bytes": occurrences - unique_rgba(names),
                        "different_author_name_equal_rgba_bytes": source_bytes(names) - unique_rgba(names),
                        "current_distinct_atlas_rgba_bytes": baseline,
                        "proposed_native_atlas_rgba_bytes": proposed,
                        "native_saved_rgba_bytes": baseline - proposed,
                        "native_width": layout["width"], "native_height": layout["height"],
                        "unique_author_images": len(names),
                        "single_member_extra_rgba_bytes_min": proposed - max(singles, default=0),
                        "single_member_extra_rgba_bytes_max": proposed - min(singles, default=0)})
    results.sort(key=lambda row: (-row["native_saved_rgba_bytes"], row["members"]))
    # Connectivity is diagnostic only: a tiny common effect can join otherwise
    # unrelated definitions, so connected components are never merger proposals.
    adjacency = defaultdict(set)
    for row in pairs:
        if row["shared_author_images"]:
            expanded = row["expanded_members"]
            for left, right in zip(expanded, expanded[1:]):
                adjacency[left].add(right)
                adjacency[right].add(left)
    components, visited = [], set()
    for name in sorted(adjacency):
        if name in visited:
            continue
        pending, component = [name], set()
        while pending:
            current = pending.pop()
            if current not in component:
                component.add(current)
                pending.extend(adjacency[current] - component)
        visited |= component
        components.append(sorted(component))
    components.sort(key=lambda group: (-len(group), group))
    return {"manifest": manifest_path.relative_to(root).as_posix(),
            "manifest_sha256": hashlib.sha256(raw_manifest).hexdigest(),
            "build_config_sha256": hashlib.sha256(config.path.read_bytes()).hexdigest(),
            "source_sha256": source_hashes,
            "source_case_alias_differences": alias_differences,
            "current_decoded_pixels_verified": True,
            "component_names": component_names,
            "currently_shared_atlases": currently_shared,
            "method": "current author-name DSL parity and decoded RGBA verification; native MaxRects union, padding 2",
            "definition_count": len(definitions), "unique_author_images": len(images),
            "source_occurrence_rgba_bytes": sum(source_bytes(names) for names in members.values()),
            "unique_author_image_rgba_bytes": source_bytes(images),
            "unique_exact_rgba_bytes": unique_rgba(images),
            "cached_atlas_memory": manifest["atlas_memory"],
            "pairs": pairs, "candidates": results, "connected_components": components}


def markdown(data: dict) -> str:
    shared = data["currently_shared_atlases"]
    lines = ["# Definition atlas overlap audit", "",
             "Generated from the current cache and source DSLs. All sizes below are decoded RGBA bytes, "
             "not compressed PNG or pak bytes. Native packing is a feasible estimate, not a proof of optimality. "
             "The current atlas baseline includes its cached exact-solver improvements; proposed unions use native "
             "MaxRects only, so the comparison is conservative about possible future exact packing.", "",
             f"- Manifest SHA-256: `{data['manifest_sha256']}`",
             f"- Source definitions verified: {data['definition_count']}; unique author image names: {data['unique_author_images']}. "
             "Every referenced current source image was decoded with runtime alpha rules and checked against cache dimensions/hash.",
             f"- Source/cache case-alias name differences: {len(data['source_case_alias_differences'])}; "
             "all resolve to identical decoded pixels (details in JSON).",
             f"- Per-definition source RGBA occurrences: {data['source_occurrence_rgba_bytes']:,} bytes.",
             f"- Unique author image RGBA: {data['unique_author_image_rgba_bytes']:,} bytes; unique exact RGBA: "
             f"{data['unique_exact_rgba_bytes']:,} bytes.",
             f"- Current physically distinct atlas RGBA: {data['cached_atlas_memory']['rgba_bytes']:,} bytes.",
             f"- Current nonempty physical atlas PNG count: {data['cached_atlas_memory']['definition_atlas_count']}.",
             f"- Current physical source occurrences (every existing shared atlas counted once): "
             f"{data['cached_atlas_memory']['source_occurrence_rgba_bytes']:,} bytes; exact RGBA duplicates across "
             f"current physical atlases: {data['cached_atlas_memory']['duplicate_source_rgba_bytes']:,} bytes. "
             "Per-definition occurrences above intentionally count every definition independently.",
             "", "## Currently shared atlases", "",
             f"The manifest already contains {len(shared)} shared physical atlases covering "
             f"{sum(len(row['members']) for row in shared)} definitions. These are implemented groups, "
             "not remaining recommendations. Bytes below count each physical PNG once. Component spellings "
             "come from the selected author DSLs.",
             "",
             "| Physical atlas PNG | Author components | Dimensions | RGBA bytes | PNG bytes |",
             "|---|---|---:|---:|---:|"]
    for row in shared:
        lines.append(f"| {row['path']} | {', '.join(row['components'])} | "
                     f"{row['width']}×{row['height']} | {row['rgba_bytes']:,} | {row['png_bytes']:,} |")
    lines += [
             "", "## Current runtime residency", "",
             "The current application preloads all available definitions and uploads every definition atlas "
             "before completing loading. LawnApp::LoadingThreadProc calls ReanimatorLoadAllDefinitionData "
             "and TodParticleLoadDefinitions; the latter loops over the complete particle parameter array. "
             "LawnApp::UpdateApp waits for the warm queue/final sweep and calls "
             "ReanimatorUploadAllTexturesToGPU. That function waits for both definition-ready flags, collects "
             "all reanim and particle atlas images into a deduplicated set, and uploads them. Its comment "
             "explicitly retains source textures on the GPU while releasing CPU decode pixels.",
             "",
             "Consequently the saving column applies to the current full-preload residency model. The last "
             "column is a hypothetical future risk if loading/eviction changes to individual definitions or "
             "scenes; it is not an extra allocation caused by present runtime requests. These are base RGBA "
             "allocation estimates, excluding backend alignment, texture metadata and transient upload memory.",
             "",
             "Source evidence: pvzPerf/LawnApp.cpp (LoadingThreadProc, UpdateApp); "
             "pvzPerf/Sexy.TodLib/Reanimator.cpp (ReanimatorLoadAllDefinitionData, "
             "ReanimatorUploadAllTexturesToGPU); pvzPerf/Sexy.TodLib/TodParticle.cpp "
             "(TodParticleLoadDefinitions).",
             "",
             "Reanimation references retain inline six-u32 geometry "
             "(x, y, width, height, rows, cols). Particle IDR5 emitters store a frame count followed by "
             "ordered four-i32 rectangles (x, y, width, height), including repeated frames. "
             "Neither format stores a local image ID or atlas path; "
             "the generated DefinitionImageBindings.h provides definition-to-atlas path bindings. "
             "Manifest image rows may carry atlas-specific region coordinates. This audit compares only "
             "source image metadata across occurrences of one author image name, excluding those coordinates and "
             "other layout-specific fields.",
             "", "## Implemented groups and remaining opportunities", "",
             "The currently shared table is the source of truth for implemented consolidation. A proposal "
             "already contained in one physical PNG is omitted from remaining candidates. Expanding one "
             "member of an existing group includes that entire group, so each remaining row requires "
             "combining at least two current physical PNGs. Candidate savings are incremental from this "
             "manifest, not the older ungrouped corpus. Candidate rows can overlap and must not be summed "
             "without checking their full expanded members.",
             "",
             "Shared author image bytes below count occurrences across current physical atlases, excluding "
             "duplicates already removed by implemented groups. Source-subset paths identify an atlas whose "
             "complete source set is contained in another candidate atlas; its definitions need no new source "
             "pixels in that larger atlas. Native layouts are still measured, since a different deterministic "
             "packing order can affect gaps.",
             "",
             "The ResidentImage filter-alias implementation reuses the owning GPU texture and applies the "
             "existing shader sampling flags. It avoids a separate whole-atlas filtered texture allocation, "
             "so TreeOfWisdom whitening only selected tracks does not multiply the atlas allocation by its "
             "filter variants. The table still measures base atlas bytes only, not alias object metadata "
             "or transient upload memory. This conclusion concerns ResidentImage atlases, not unrelated "
             "legacy MemoryImage filter render targets. Source evidence: "
             "pvzPerf/Sexy.TodLib/FilterEffect.cpp (FilterEffectCreateImage) routes ResidentImage to "
             "pvzPerf/SexyAppFramework/graphics/RenderInterface.cpp (CreateResidentFilterImage), which sets "
             "mTexture=original.mTexture, mOwnsTexture=false and filter mSamplingFlags without allocating "
             "a render target.",
             "", "## Remaining candidate unions", "",
             "Saving uses the current full-preload simultaneous residency of the distinct atlases. "
             "The last column models future demand loading with just one member resident. Negative saving means "
             "the measured native layout is worse than the current cached layouts. Members already sharing "
             "an atlas are expanded together. Author image duplicate bytes count repeated name-keyed rectangles; equal "
             "RGBA under different author names does not reduce production union size.", "",
             "| Candidate | Expanded author components | Duplicate physical author image RGBA | Current atlas RGBA | Union atlas RGBA | Incremental current saving | Future demand-load extra for one member |",
             "|---|---|---:|---:|---:|---:|---:|"]
    for row in data["candidates"]:
        names = ", ".join(row["components"])
        lines.append(f"| {row['purpose']} | {names} | {row['shared_author_image_rgba_bytes']:,} | "
                     f"{row['current_distinct_atlas_rgba_bytes']:,} | "
                     f"{row['proposed_native_atlas_rgba_bytes']:,} ({row['native_width']}×{row['native_height']}) | "
                     f"{row['native_saved_rgba_bytes']:,} | {row['single_member_extra_rgba_bytes_min']:,}…"
                     f"{row['single_member_extra_rgba_bytes_max']:,} |")
    if not data["candidates"]:
        lines.append("| No additional candidate spans multiple current physical PNGs | | | | | | |")
    remaining = {row["purpose"]: row for row in data["candidates"]}
    notes = {
        "rising_and_ground_dirt": "The ground-dirt source set is contained in rising dirt; prefer reusing the existing rising-dirt image.",
        "credits_brain_throat": "BigBrain fits in Throat's source set; keep this separate from the much larger stage atlas.",
        "zombie_credits_family": "Two credits variants are source subsets of Zombie; the dance variant adds a small set of images.",
        "explosion_particles": "A smaller particle-only alternative to extending the vehicle family.",
        "zamboni_with_explosion_particles": "Largest measured explosion union; it overlaps the particle-only alternative, so choose one.",
    }
    lines += ["", "### Remaining decisions", ""]
    decisions = [purpose for purpose in notes if purpose in remaining]
    if decisions:
        for purpose in decisions:
            row = remaining[purpose]
            lines.append(f"- {purpose}: incremental native saving {row['native_saved_rgba_bytes']:,} bytes; "
                         f"union {row['proposed_native_atlas_rgba_bytes']:,} bytes. {notes[purpose]}")
    else:
        lines.append("The named follow-up families are already implemented or absent; consult the remaining table for other measured proposals.")
    subsets = [row for row in data["candidates"] if row["source_subset_atlases"]]
    lines += ["", "### Source-subset candidates", ""]
    if subsets:
        for row in subsets:
            lines.append(f"- {row['purpose']}: {', '.join(row['source_subset_atlases'])}; "
                         f"incremental native saving {row['native_saved_rgba_bytes']:,} bytes. "
                         f"Expanded members: {', '.join(row['components'])}. "
                         + ("The complete union source set already exists in "
                            + ", ".join(row["existing_union_owner_paths"]) + "."
                            if row["existing_union_owner_paths"] else
                            "Other candidate sources still add pixels beyond each individual current atlas."))
    else:
        lines.append("No remaining measured candidate contains a complete physical source set in another member atlas.")
    lines += ["", "## Connectivity diagnostics", "",
              f"There are {len(data['connected_components'])} nontrivial shared-author-image components. "
              "Their sizes are " + ", ".join(str(len(c)) for c in data["connected_components"]) + ".",
              "These are not merge recommendations. Current full preloading does make these definitions "
              "co-resident, but a tiny shared sprite does not justify a large union: packing, size limits, "
              "future scene loading and eviction boundaries still matter.", "",
              "## Reproduce", "", "```powershell",
              "python tools/audit_definition_atlas_overlap.py", "```", "",
              "The tool checks all selected source DSL author image names against the cache, allowing only case aliases "
              "with verified identical current decoded pixels and aborting on other mismatches. "
              "It records SHA-256 values for the manifest, build configuration and each source DSL in the JSON. "
              "All original referenced images are re-decoded by definition_atlas.logical_image, including alpha composition. "
              "Source descriptors come from definition_atlas.authoring_descriptors and resources.json. "
              "The audit never reads program image IDs or historical symbol registry binaries, and does not "
              "compile the program numeric resource manifest. "
              "The tool aborts if current dimensions or RGBA pixels differ from the cached fingerprints. "
              "It never writes runtime assets, DSLs or build settings.",
              "", "For additional pairs or alternate source/cache paths, use `--help`. "
              "The JSON includes every overlapping pair, exact-RGBA statistics and full component memberships.", ""]
    return "\n".join(lines)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--manifest", type=Path, default=ROOT / "out/x64-win32-vulkan/cache/resources/manifest.json")
    parser.add_argument("--compiler", type=Path, default=ROOT / "out/x64-win32-vulkan/tools/resourceCompiler/build/reanimc.exe")
    parser.add_argument("--output", type=Path, default=Path(tempfile.gettempdir()) / "definition-atlas-overlap-audit.json")
    parser.add_argument("--report", type=Path, default=Path(tempfile.gettempdir()) / "definition-atlas-overlap-audit.md")
    parser.add_argument("--top", type=int, default=20)
    args = parser.parse_args()
    data = audit(ROOT, args.manifest.resolve(), args.compiler.resolve(), args.top)
    args.output.write_text(json.dumps(data, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    args.report.write_text(markdown(data), encoding="utf-8")
    print(f"Verified {data['definition_count']} DSLs; {len(data['pairs'])} overlap pairs; "
          f"{len(data['candidates'])} packed candidates; wrote {args.report}")


if __name__ == "__main__":
    main()
