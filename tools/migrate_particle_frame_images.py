"""Validate published particle PNGs; historical migration requires original inputs.

Normal --check verifies immutable published RGBA hashes and source geometry,
without retired sheets. Historical --migrate / --backup additionally require
--original-root pointing to a separately retained virtual-path input directory.
"""
from __future__ import annotations

import argparse
from dataclasses import dataclass
from datetime import datetime
import json
from pathlib import Path
import re
import shutil
import hashlib
import struct

from PIL import Image

import definition_atlas as atlas
import runtime_asset_sources


ROOT = Path(__file__).resolve().parents[1]
CORPUS = Path("assets/definitions/particles")
LIVE_ORIGINALS = {"IMAGE_FOG", "IMAGE_ZOMBIEPOGO"}
LEX = re.compile(r'//[^\n]*|/\*.*?\*/|"(?:\\.|[^"\\])*"|'
                 r'[A-Za-z_][A-Za-z_0-9-]*|-?\d+(?:\.\d+)?|[^\s]', re.S)


@dataclass
class Token:
    text: str
    start: int
    end: int


class Source:
    """Small lossless lexer: braces in tracks, strings and comments stay distinct."""

    def __init__(self, text: str):
        self.text = text
        self.tokens = [Token(m[0], m.start(), m.end()) for m in LEX.finditer(text)
                       if not m[0].startswith(("//", "/*"))]
        self.ends = {}
        stack = []
        for i, token in enumerate(self.tokens):
            if token.text in ("{", "["):
                stack.append(i)
            elif token.text in ("}", "]"):
                opening = stack.pop()
                assert (self.tokens[opening].text, token.text) in (("{", "}"), ("[", "]"))
                self.ends[opening] = i
        assert not stack

    def children(self, opening: int):
        i = opening + 1
        while i < self.ends[opening]:
            yield i
            i = self.ends[i] + 1 if i in self.ends else i + 1

    def properties(self, opening: int):
        result = {}
        for i in self.children(opening):
            if i + 1 < len(self.tokens) and self.tokens[i + 1].text == ":":
                result[self.tokens[i].text] = i
        return result

    def scalar(self, props, key, default=None):
        if key not in props:
            return default
        i = props[key]
        assert self.tokens[i + 3].text == ";", (key, self.tokens[i:i + 6])
        value = self.tokens[i + 2].text
        return json.loads(value) if value.startswith('"') else value

    def value(self, props, key):
        i = props[key] + 2
        end = self.ends.get(i, i)
        return json.loads(self.text[self.tokens[i].start:self.tokens[end].end])

    def components(self):
        result = {}
        for i, token in enumerate(self.tokens):
            if token.text == "component":
                name = self.tokens[i + 1].text
                opening = i + 2
                assert self.tokens[opening].text == "{"
                emitters = [j + 1 for j in self.children(opening)
                            if self.tokens[j].text == "Emitter"]
                result[name] = (opening, emitters)
        return result

    def scalar_span(self, props, key):
        i = props[key]
        assert self.tokens[i + 3].text == ";"
        start, end = self.tokens[i].start, self.tokens[i + 3].end
        line = self.text.rfind("\n", 0, start) + 1
        if not self.text[line:start].strip() and self.text[end:end + 1] == "\n":
            return line, end + 1
        return start, end


def originals(directory: Path):
    return {p.relative_to(directory): Source(p.read_text(encoding="utf-8-sig"))
            for p in sorted(directory.rglob("*.particle.dsl"))}


def image_metadata(root, sources, original_root=None):
    names = set()
    for source in sources.values():
        for opening, emitters in source.components().values():
            for block in [opening, *emitters]:
                name = source.scalar(source.properties(block), "image")
                if name and name.lower() != "none":
                    names.add(name)
    files = runtime_asset_sources.inventory(root)
    if original_root is not None:
        if not original_root.is_dir():
            raise ValueError(f"Missing historical original input directory: {original_root}")
        for path in sorted(original_root.rglob("*")):
            if path.is_file():
                files.setdefault(atlas.pak.file_key(path.relative_to(original_root).as_posix()), path)
    descriptors = atlas.authoring_descriptors(
        (root / "assets/definitions/resources.json").read_bytes(), files, names)
    result = {}
    for name, descriptor in descriptors.items():
        if descriptor.flags & (1 | 8192):
            assert descriptor.cols == descriptor.rows == 1, name
            result[name] = (1, 1, 1, 1, None)
            continue
        image, _ = atlas.logical_image(descriptor, files)
        result[name] = (image.width, image.height, descriptor.cols, descriptor.rows, image)
    return result


def check_published_frames(root):
    """Check every published frame against its immutable migration provenance.

    The retired sheets are unnecessary: hashes include all original RGBA bytes,
    including RGB under transparent pixels. Sheets still used by gameplay also
    receive an independent pixel-for-pixel crop comparison.
    """
    sidecar = json.loads((root / "assets/definitions/particle-frame-images.json").read_text(
        encoding="utf-8"))
    assert sidecar["format"] == "pvz-particle-frame-images-v1"
    records = sidecar["images"]
    files = runtime_asset_sources.inventory(root)
    declared = {atlas.pak.file_key(record["path"]) for record in records}
    assert len(declared) == len(records), "Duplicate published frame paths"
    actual = {name for name in files if name.startswith("particles/frames/") and name.endswith(".png")}
    assert actual == declared, "Untracked or missing published particle PNG"
    live_names = {record["source"] for record in records} & LIVE_ORIGINALS
    descriptors = atlas.authoring_descriptors(
        (root / "assets/definitions/resources.json").read_bytes(), files, live_names)
    live = {name: atlas.logical_image(descriptor, files)[0]
            for name, descriptor in descriptors.items()}
    geometry, cells = {}, {}
    compared = 0
    for record in records:
        name, path = record["source"], files[atlas.pak.file_key(record["path"])]
        shape = tuple(record[key] for key in ("source_width", "source_height", "source_cols", "source_rows"))
        assert all(type(value) is int and value > 0 for value in shape), record["path"]
        assert name not in geometry or geometry[name] == shape, f"Inconsistent source geometry: {name}"
        geometry[name] = shape
        width, height, cols, rows = shape
        x, y, w, h = record["crop"]
        assert all(type(value) is int for value in record["crop"]), record["path"]
        assert w == width // cols and h == height // rows and min(w, h) > 0, record["path"]
        assert x >= 0 and y >= 0 and x % w == y % h == 0, record["path"]
        col, row = x // w, y // h
        assert col < cols and row < rows, record["path"]
        source_cells = cells.setdefault(name, set())
        assert (col, row) not in source_cells, f"Duplicate source cell: {name}, {col}, {row}"
        source_cells.add((col, row))
        header = path.read_bytes()[:33]
        assert header[:8] == b"\x89PNG\r\n\x1a\n" and header[12:16] == b"IHDR", path
        png_w, png_h, depth, color, _, _, _ = struct.unpack(">IIBBBBB", header[16:29])
        assert (png_w, png_h, depth, color) == (w, h, 8, 6), path
        with Image.open(path) as decoded:
            assert (decoded.format, decoded.mode, decoded.size) == ("PNG", "RGBA", (w, h)), path
            rgba = decoded.tobytes()
        assert re.fullmatch("[0-9a-f]{64}", record["rgba_sha256"]), path
        assert hashlib.sha256(rgba).hexdigest() == record["rgba_sha256"], path
        if name in live:
            original, descriptor = live[name], descriptors[name]
            assert original.size == (width, height), name
            assert (descriptor.cols, descriptor.rows) == (cols, rows), name
            assert rgba == original.crop((x, y, x + w, y + h)).tobytes(), path
            compared += 1
    for name, (width, height, cols, rows) in geometry.items():
        assert cells[name] == {(col, row) for row in range(rows) for col in range(cols)}, name
    return {"decoded_png_frames": len(records), "source_sheets": len(geometry),
            "live_source_crops_compared": compared}


def old_spec(source, opening, metadata, replacement=None):
    props = source.properties(opening)
    name = replacement or source.scalar(props, "image")
    frames = int(source.scalar(props, "imageFrames", "1"))
    col = int(source.scalar(props, "imageCol", "0"))
    row = int(source.scalar(props, "imageRow", "0"))
    if min(col, row) < 0 or frames < 1:
        raise ValueError(f"Negative grid offset or invalid frame count: {name}, {col}, {row}, {frames}")
    if not name or name.lower() == "none":
        return name, frames, col, row, None
    geometry = metadata[name]
    w, h, cols, rows, _ = geometry
    cw, ch = w // cols, h // rows
    if cw < 1 or ch < 1 or col >= cols:
        raise ValueError(f"Out-of-bounds source grid: {name}, {geometry}, col={col}, row={row}")
    # The old renderer explicitly clamps rows, including intentionally oversized rows.
    return name, frames, col, row, geometry


def rectangles(spec):
    _, _, col, row, geometry = spec
    if geometry is None:
        return []
    w, h, cols, rows, _ = geometry
    cw, ch = w // cols, h // rows
    return [[(col + frame) * cw, min(row, rows - 1) * ch, cw, ch]
            for frame in range(max(1, cols - col))]


def compact(value):
    return json.dumps(value, separators=(",", ":"))


def frame_path(name, row, col):
    stem = re.sub(r"[^a-z0-9_]", "_", name.removeprefix("IMAGE_").casefold())
    return f"particles/frames/{stem}_r{row}_c{col}.png"


def images(spec):
    name, _, col, row, geometry = spec
    if geometry is None:
        return []
    _, _, cols, rows, _ = geometry
    if cols == rows == 1:
        return [name]
    return [frame_path(name, min(row, rows - 1), frame)
            for frame in range(col, cols)]


def write_frames(root, metadata):
    manifest = {"format": "pvz-particle-frame-images-v1", "images": []}
    paths = set()
    for name, (w, h, cols, rows, original) in sorted(metadata.items()):
        if cols == rows == 1:
            continue
        cw, ch = w // cols, h // rows
        for row in range(rows):
            for col in range(cols):
                path = frame_path(name, row, col)
                assert path not in paths, f"Frame filename collision: {path}"
                paths.add(path)
                destination = root / "assets/runtime" / path
                crop = original.crop((col * cw, row * ch, (col + 1) * cw, (row + 1) * ch))
                assert crop.mode == "RGBA"
                if destination.exists():
                    with Image.open(destination) as existing:
                        assert existing.mode == "RGBA" and existing.size == crop.size
                        assert existing.tobytes() == crop.tobytes(), f"Existing frame differs: {path}"
                else:
                    destination.parent.mkdir(parents=True, exist_ok=True)
                    crop.save(destination, format="PNG")
                with Image.open(destination) as decoded:
                    assert decoded.mode == "RGBA" and decoded.size == crop.size
                    assert decoded.tobytes() == crop.tobytes(), f"PNG pixel mismatch: {path}"
                manifest["images"].append({
                    "path": path, "source": name, "source_width": w, "source_height": h,
                    "source_cols": cols, "source_rows": rows,
                    "crop": [col * cw, row * ch, cw, ch],
                    "rgba_sha256": hashlib.sha256(crop.tobytes()).hexdigest(),
                })
    return manifest


def transform(source, metadata, bases):
    edits = []
    for name, (opening, emitters) in source.components().items():
        props = source.properties(opening)
        parent = source.scalar(props, "variant-of")
        if parent:
            base_source, base_emitters = bases[parent]
            replacement = source.scalar(props, "image")
            lists = [images(old_spec(base_source, block, metadata, replacement))
                     for block in base_emitters]
            image_i = props["image"]
            start = source.tokens[image_i].start
            end = source.tokens[image_i + 3].end
            edits.append((start, end, "images: " + compact(lists) + ";"))
        else:
            for block in emitters:
                emitter_props = source.properties(block)
                spec = old_spec(source, block, metadata)
                sequence = images(spec)
                for key in ("imageCol", "imageRow"):
                    if key in emitter_props:
                        start, end = source.scalar_span(emitter_props, key)
                        edits.append((start, end, ""))
                if spec[-1] is not None and spec[-1][2:4] != (1, 1):
                    image_i = emitter_props["image"]
                    start = source.tokens[image_i].start
                    end = source.tokens[image_i + 3].end
                    edits.append((start, end, "images: " + compact(sequence) + ";"))
    text = source.text
    for start, end, replacement in sorted(edits, reverse=True):
        text = text[:start] + replacement + text[end:]
    return text


def audit(root, backup, original_root):
    before = originals(backup)
    after = originals(root / CORPUS)
    assert before.keys() == after.keys(), "Particle file set changed"
    metadata = image_metadata(root, before, original_root)
    bases = {name: (source, emitters) for source in before.values()
             for name, (opening, emitters) in source.components().items()
             if not source.scalar(source.properties(opening), "variant-of")}
    stats = dict(files=len(before), base_emitters=0, variants=0,
                 variant_emitters=0, images=len(metadata), compared_frames=0,
                 clamped_source_rows=0, decoded_png_frames=0)
    for path, old in before.items():
        new = after[path]
        # Exact identity outside the prescribed source rewrite also preserves all
        # motion, randomization, text, flags and logical frame-count expressions.
        assert new.text == transform(old, metadata, bases), f"Unexpected source change: {path}"
        assert not any(t.text in ("imageRow", "imageCol", "rects") for t in new.tokens), path
        components = new.components()
        for name, (opening, emitters) in old.components().items():
            props = old.properties(opening)
            parent = old.scalar(props, "variant-of")
            if parent:
                stats["variants"] += 1
                base_source, old_emitters = bases[parent]
                replacement = old.scalar(props, "image")
                actual_lists = new.value(new.properties(components[name][0]), "images")
                stats["variant_emitters"] += len(old_emitters)
            else:
                base_source, old_emitters, replacement = old, emitters, None
                actual_lists = []
                for block in components[name][1]:
                    current = new.properties(block)
                    actual_lists.append(new.value(current, "images") if "images" in current
                                        else [new.scalar(current, "image")]
                                        if new.scalar(current, "image", "none").lower() != "none"
                                        else [])
                stats["base_emitters"] += len(old_emitters)
            assert len(actual_lists) == len(old_emitters), name
            for block, sequence in zip(old_emitters, actual_lists):
                spec = old_spec(base_source, block, metadata, replacement)
                image, logical_count, col, row, geometry = spec
                assert sequence == images(spec), (path, name, image)
                if geometry is None:
                    assert sequence == []
                    continue
                w, h, cols, rows, original = geometry
                stats["clamped_source_rows"] += int(row >= rows)
                rects = rectangles(spec)
                for x, y, rw, rh in rects:
                    assert 0 <= x < x + rw <= w and 0 <= y < y + rh <= h
                # Enumerate random imageFrames and every possible OverrideFrame
                # source cel, plus high values proving the clamping tail.
                for frame in range(max(logical_count, cols + 2) + 1):
                    cw, ch = w // cols, h // rows
                    expected = [min(col + frame, cols - 1) * cw,
                                min(row, rows - 1) * ch, cw, ch]
                    actual = rects[min(frame, len(rects) - 1)]
                    assert expected == actual, (path, name, frame, expected, actual)
                    selected = sequence[min(frame, len(sequence) - 1)]
                    if selected != image:
                        with Image.open(root / "assets/runtime" / selected) as decoded:
                            x, y, rw, rh = expected
                            assert decoded.mode == "RGBA" and decoded.size == (rw, rh)
                            assert decoded.tobytes() == original.crop((x, y, x + rw, y + rh)).tobytes()
                    stats["compared_frames"] += 1
    sidecar = json.loads((root / "assets/definitions/particle-frame-images.json").read_text())
    for record in sidecar["images"]:
        path = root / "assets/runtime" / record["path"]
        original = metadata[record["source"]][-1]
        x, y, w, h = record["crop"]
        crop = original.crop((x, y, x + w, y + h))
        with Image.open(path) as decoded:
            assert decoded.mode == "RGBA" and decoded.size == (w, h)
            assert decoded.tobytes() == crop.tobytes(), path
            assert hashlib.sha256(decoded.tobytes()).hexdigest() == record["rgba_sha256"]
        stats["decoded_png_frames"] += 1
    return stats


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--root", type=Path, default=ROOT)
    parser.add_argument("--migrate", action="store_true")
    parser.add_argument("--backup", type=Path)
    parser.add_argument("--original-root", type=Path,
                        help="Historical sheets by virtual path; required only for migration/backup audit")
    parser.add_argument("--check", action="store_true",
                        help="Read-only published frame hash/geometry validation (the default)")
    args = parser.parse_args()
    root = args.root.resolve()
    if args.check and (args.migrate or args.backup):
        parser.error("--check cannot be combined with historical migration/backup audit")
    if not args.migrate and args.backup is None:
        print(json.dumps(check_published_frames(root), indent=2))
        return
    if args.original_root is None:
        parser.error("Historical migration/backup audit requires --original-root; use --check for current assets")
    if args.migrate:
        sources = originals(root / CORPUS)
        assert not any(t.text in ("rects", "images") for s in sources.values() for t in s.tokens), \
            "Corpus already migrated; use --backup to audit it"
        metadata = image_metadata(root, sources, args.original_root.resolve())
        bases = {name: (source, emitters) for source in sources.values()
                 for name, (opening, emitters) in source.components().items()
                 if not source.scalar(source.properties(opening), "variant-of")}
        # Validate and prepare every rewrite before taking the mandatory snapshot.
        changed = {p: transform(s, metadata, bases) for p, s in sources.items()}
        backup = args.backup or root.parent / "Temp" / (
            "particle-frame-images-" + datetime.now().strftime("%Y%m%d-%H%M%S-%f"))
        assert not backup.exists(), f"Refusing to overwrite backup: {backup}"
        shutil.copytree(root / CORPUS, backup)
        manifest = write_frames(root, metadata)
        (root / "assets/definitions/particle-frame-images.json").write_text(
            json.dumps(manifest, indent=2) + "\n", encoding="utf-8", newline="\n")
        for path, text in changed.items():
            (root / CORPUS / path).write_text(text, encoding="utf-8", newline="\n")
        print(f"Original particle source backup: {backup}")
    else:
        if not args.backup:
            parser.error("--backup is required for read-only regression verification")
        backup = args.backup
    print(json.dumps(audit(root, backup, args.original_root.resolve()), indent=2))


if __name__ == "__main__":
    main()
