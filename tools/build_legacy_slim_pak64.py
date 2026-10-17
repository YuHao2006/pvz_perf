"""Create the manually audited Legacy 1073 distribution PAK64.

The general-purpose converter intentionally stays XML-complete.  This script
is the project-only trim step: it starts from the already audited complete
main.pak64 and removes only definitions proven not to be called by official
1073.  It never recompiles or guesses from filenames.
"""

from __future__ import annotations

import argparse
import copy
import hashlib
import json
import pathlib
import sys
import zipfile


ROOT = pathlib.Path(__file__).parents[1]
DEFAULT_OUTPUT = ROOT / "Tests/reference/legacy1073-resources/legacy1073-slim.pak64"

REMOVED_COMPILED = {
    "compiled/particles/artchallengeplant.xml.compiled",
    "compiled/particles/circleevenspacing.xml.compiled",
    "compiled/particles/kernelsplat.xml.compiled",
    "compiled/particles/perftest.xml.compiled",
    "compiled/particles/seedpacketpickup.xml.compiled",
    "compiled/particles/simpleparticle.xml.compiled",
    "compiled/reanim/zombie_dancer.reanim.compiled",
    "compiled/reanim/zombie_jackson.reanim.compiled",
}


def norm(name: str) -> str:
    return name.replace("\\", "/").lower()


def is_definition_source(name: str) -> bool:
    lower = norm(name)
    return (lower.startswith(("reanim/", "particles/")) and
            lower.endswith((".reanim", ".xml", ".trail")))


def is_obsolete_dancer_asset(name: str) -> bool:
    lower = norm(name)
    if not lower.startswith("reanim/") or not lower.endswith(".png"):
        return False
    basename = lower.rsplit("/", 1)[1]
    if basename.startswith("zombie_jackson_"):
        return True
    return basename.startswith("zombie_dancer_") and basename != "zombie_dancer__head.png"


def should_remove(name: str) -> bool:
    lower = norm(name)
    return (is_definition_source(lower) or
            lower in REMOVED_COMPILED or
            is_obsolete_dancer_asset(lower))


def compiled_image_refs(archive: zipfile.ZipFile):
    # Import the checked-in decoder rather than maintaining a second compiled
    # format parser in the trim tool.
    sys.path.insert(0, str(ROOT / "tools"))
    import audit_pak64_semantics as audit

    refs: list[tuple[str, str]] = []
    for info in archive.infolist():
        lower = norm(info.filename)
        if not lower.startswith("compiled/") or not lower.endswith(".compiled"):
            continue
        relative = lower[len("compiled/"):]
        decoded = audit.decode(relative, archive.read(info.filename))
        if relative.startswith("reanim/"):
            for track in decoded[3]:
                for image, _font, _text in track[2]:
                    if image:
                        refs.append((image.lower(), lower))
        elif relative.endswith(".trail.compiled"):
            if decoded[2]:
                refs.append((decoded[2].lower(), lower))
        else:
            for emitter in decoded[3]:
                if emitter[1]:
                    refs.append((emitter[1].lower(), lower))
    return refs


def ref_can_use_removed_asset(resource: str, removed: set[str]) -> bool:
    if resource.startswith("image_reanim_"):
        basename = resource[len("image_reanim_"):]
    elif resource.startswith("image_"):
        basename = resource[len("image_"):]
    else:
        return False
    for path in removed:
        if not path.endswith(".png"):
            continue
        if path.rsplit("/", 1)[-1][:-4] == basename:
            return True
    return False


def sha256(path: pathlib.Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(block)
    return digest.hexdigest().upper()


def trim(source: pathlib.Path, output: pathlib.Path) -> dict:
    output.parent.mkdir(parents=True, exist_ok=True)
    if output.resolve() == source.resolve():
        raise RuntimeError("output must not overwrite the complete source archive")

    with zipfile.ZipFile(source) as source_zip:
        source_names = {norm(info.filename): info.filename for info in source_zip.infolist()}
        if any(info.flag_bits & 1 or info.compress_type != zipfile.ZIP_STORED
               for info in source_zip.infolist()):
            raise RuntimeError("complete source is not an unencrypted stored PAK64")

        removed = {lower for lower in source_names if should_remove(lower)}
        if not REMOVED_COMPILED.issubset(removed):
            raise RuntimeError("complete source is missing one or more expected uncalled compiled records")
        retained = set(source_names) - removed

        with zipfile.ZipFile(output, "w", compression=zipfile.ZIP_STORED) as target:
            for info in source_zip.infolist():
                lower = norm(info.filename)
                if lower in removed:
                    continue
                copied = copy.copy(info)
                copied.compress_type = zipfile.ZIP_STORED
                copied.flag_bits &= ~1
                target.writestr(copied, source_zip.read(info.filename))

        with zipfile.ZipFile(output) as trimmed_zip:
            output_names = {norm(info.filename) for info in trimmed_zip.infolist()}
            if output_names != retained:
                raise RuntimeError("trimmed entry set differs from the calculated closure")
            if any(info.flag_bits & 1 or info.compress_type != zipfile.ZIP_STORED
                   for info in trimmed_zip.infolist()):
                raise RuntimeError("trimmed output is encrypted or compressed")
            for resource, compiled in compiled_image_refs(trimmed_zip):
                if ref_can_use_removed_asset(resource, removed):
                    raise RuntimeError(f"{compiled} still references removed asset for {resource}")

    return {
        "format": "legacy1073-slim-pak64-v1",
        "source": str(source.resolve()),
        "source_sha256": sha256(source),
        "output": str(output.resolve()),
        "output_sha256": sha256(output),
        "entries": len(retained),
        "compiled_definitions": sum(x.startswith("compiled/") and x.endswith(".compiled") for x in retained),
        "source_definitions": sum(is_definition_source(x) for x in retained),
        "removed_entries": len(removed),
        "removed_compiled": sorted(REMOVED_COMPILED),
        "kept_shared_asset": "reanim/zombie_dancer__head.png",
        "audit_command": "python tools/audit_pak64_semantics.py --trimmed <this package>",
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("source", type=pathlib.Path, help="explicit complete legacy-format source archive")
    parser.add_argument("output", nargs="?", type=pathlib.Path, default=DEFAULT_OUTPUT)
    args = parser.parse_args()
    manifest = trim(args.source, args.output)
    manifest_path = args.output.with_suffix(".manifest.json")
    manifest_path.write_text(json.dumps(manifest, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(manifest, ensure_ascii=False, indent=2))
    print(f"manifest: {manifest_path}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
