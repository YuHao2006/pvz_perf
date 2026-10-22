"""Offline v4 -> v5 definition atlases, using the runtime's image decode rules."""
from __future__ import annotations

from dataclasses import dataclass
import hashlib
import io
import math
from pathlib import Path, PurePosixPath
import struct
import subprocess
import tempfile
import zlib

from PIL import Image

import build_numeric_runtime_pak64 as pak


@dataclass(frozen=True)
class ImageDescriptor:
    source_label: str | int
    path: str
    alpha: str
    alpha_grid: str
    flags: int
    rows: int
    cols: int
    color: int


def authoring_descriptors(authoring: bytes, files: dict[str, Path],
                          names: set[str]) -> dict[str, ImageDescriptor]:
    """Resolve author image labels without any program image symbol registry."""
    from compile_numeric_resources import read_authoring
    manifest = read_authoring(authoring)
    declared = {}
    default_path, default_prefix = "", ""
    for group in manifest["children"]:
        for node in group["children"]:
            attrs = node["attrs"]
            if node["tag"] == "SetDefaults":
                if "path" in attrs:
                    default_path = attrs["path"].replace("\\", "/").rstrip("/") + "/"
                default_prefix = attrs.get("idprefix", default_prefix).rstrip("/")
                continue
            if node["tag"] != "Image":
                continue
            original = attrs["path"].replace("\\", "/")
            name = default_prefix + attrs.get("id", PurePosixPath(original).stem)
            if name not in names:
                continue
            pak.require(name not in declared, f"Duplicate author image label: {name}")
            path = original if original.startswith("!") else default_path + original
            if name == "IMAGE_PARTNER_LOGO":
                path = "images/blank"
            flags = 0 if "noalpha" in attrs or name == "IMAGE_EDITBOX" else 1024
            if path == "!program":
                flags |= 1
                path = ""
            else:
                pak.require(not path.startswith("!"), f"Unsupported author image control path: {name}")
            rows, cols = int(attrs.get("rows", "1")), int(attrs.get("cols", "1"))
            pak.require(0 < rows <= 0x7FFFFFFF and 0 < cols <= 0x7FFFFFFF,
                        f"Invalid author image grid: {name}")
            color = int(attrs.get("alphacolor", "FFFFFF"), 16)
            pak.require(0 <= color <= 0xFFFFFFFF, f"Invalid author alpha color: {name}")
            declared[name] = ImageDescriptor(
                name, path, default_path + attrs["alphaimage"].replace("\\", "/")
                if "alphaimage" in attrs else "",
                default_path + attrs["alphagrid"].replace("\\", "/")
                if "alphagrid" in attrs else "", flags, rows, cols, color)
    paths = {}
    for filename in sorted(files):
        normalized = filename.replace("\\", "/")
        if PurePosixPath(normalized).suffix.casefold() in (".png", ".jpg", ".jpeg", ".bmp", ".gif"):
            paths.setdefault(str(PurePosixPath(normalized).with_suffix("")).casefold(), normalized)
    for name in sorted(names - set(declared)):
        reanim = name.startswith("IMAGE_REANIM_")
        suffix = (name[len("IMAGE_REANIM_"):] if reanim else
                  name[len("IMAGE_"):] if name.upper().startswith("IMAGE_") else "")
        directories = ("reanim", "images", "particles") if reanim else ("particles", "images", "reanim")
        candidates = [paths[f"{directory}/{suffix}".casefold()] for directory in directories
                      if f"{directory}/{suffix}".casefold() in paths]
        if not candidates:
            pak.require(name in ("IMAGE_PROJECTILE", "IMAGE_SUN"),
                        f"Author image label has no file path: {name}")
            declared[name] = ImageDescriptor(name, "", "", "", 8192, 1, 1, 0xFFFFFF)
        else:
            declared[name] = ImageDescriptor(name, str(PurePosixPath(candidates[0]).with_suffix("")),
                                             "", "", 1024, 1, 1, 0xFFFFFF)
    return declared


def descriptors(data: bytes) -> dict[int, ImageDescriptor]:
    reader = pak.Reader(data[36:])
    result = {}
    while reader.at < len(reader.data):
        record = pak.Reader(reader.take(reader.word()))
        _, symbol, _, kind, flags, _, _ = record.unpack("<7I")
        path, alpha, grid, _ = (record.path() for _ in range(4))
        if kind == 0 and symbol:
            rows, cols, color = record.unpack("<iiI")
            result[symbol] = ImageDescriptor(symbol, path, alpha, grid, flags,
                                             rows, cols, color)
    return result


def image_offsets(kind: str, payload: bytes) -> list[int]:
    """Locate only image IDs; preserve all transforms, fonts, captions and names."""
    reader = pak.Reader(payload)
    offsets = []
    if kind == "reanim":
        magic, _, _, _, _, count = reader.unpack("<4IfI")
        pak.require(magic == 0x35544449, "Expected IDT5 compiler payload")
        tracks = []
        for _ in range(count):
            _, frames, stride, mode = reader.unpack("<4I")
            pak.require(stride == 32 and mode <= 1, "Invalid compiler track")
            reader.take(frames * stride)
            tracks.append((frames, mode))
        for frames, mode in tracks:
            for _ in range(frames):
                offsets.append(reader.at)
                reader.take(8)
                if mode:
                    reader.take(reader.word())
    else:
        magic, _, _, count, body_bytes = reader.unpack("<5I")
        pak.require(kind == "particles" and magic == 0x35504449,
                    "Expected IDP5 compiler payload")
        end = reader.at + body_bytes

        def track() -> None:
            reader.take(reader.word() * 20)

        for _ in range(count):
            offsets.append(reader.at)
            reader.take(28)
            for _ in range(22):
                track()
            for _ in range(2):
                for _ in range(reader.word()):
                    reader.take(4)
                    track()
                    track()
            for _ in range(16):
                track()
        pak.require(reader.at == end, "Compiler particle body size differs")
    return offsets


def read_image(path: str, files: dict[str, Path], auto: bool = True,
               color: int = 0xFFFFFF) -> tuple[Image.Image, set[str]]:
    """Match ImageLib::GetImage, including alpha-only and blue-channel masks."""
    normalized = pak.file_key(path)
    suffixes = (".tga", ".jpg", ".png", ".gif")
    suffix = PurePosixPath(normalized).suffix

    def decode(stem: str) -> tuple[Image.Image | None, set[str]]:
        ext = PurePosixPath(stem).suffix
        candidates = [stem] if ext else [stem + extension for extension in suffixes]
        for candidate in candidates:
            if candidate in files and (not ext or ext in suffixes):
                with Image.open(files[candidate]) as image:
                    return image.convert("RGBA"), {candidate}
        return None, set()

    image, used = decode(normalized)
    mask = None
    if auto:
        filename = PurePosixPath(normalized).name
        leading = str(PurePosixPath(normalized).with_name("_" + filename))
        mask, mask_used = decode(leading)
        if mask is None:
            trailing = normalized[:-len(suffix)] + "_" + suffix if suffix else normalized + "_"
            mask, mask_used = decode(trailing)
        used |= mask_used
    if mask is not None:
        if image is None:
            image = Image.new("RGBA", mask.size,
                              ((color >> 16) & 255, (color >> 8) & 255, color & 255, 255))
        pak.require(image.size == mask.size, f"Image alpha dimensions differ: {path}")
        image.putalpha(mask.getchannel("B"))
    pak.require(image is not None, f"Definition image missing: {path}")
    return image, used


def logical_image(descriptor: ImageDescriptor, files: dict[str, Path]) -> tuple[Image.Image, set[str]]:
    pak.require(not descriptor.flags & (1 | 8192),
                f"Unavailable definition image: {descriptor.source_label}")
    image, used = read_image(descriptor.path, files,
                             bool(descriptor.flags & 1024) and not (descriptor.alpha or descriptor.alpha_grid),
                             descriptor.color)
    for path, cols, rows in ((descriptor.alpha, 1, 1),
                             (descriptor.alpha_grid, descriptor.cols, descriptor.rows)):
        if not path:
            continue
        mask, mask_used = read_image(path, files)
        used |= mask_used
        pak.require(mask.size == (image.width // cols, image.height // rows),
                    f"Explicit alpha dimensions differ: {path}")
        channel = mask.getchannel("B")
        # The runtime leaves any nondivisible grid remainder unchanged.
        tiled = image.getchannel("A")
        for row in range(rows):
            for col in range(cols):
                tiled.paste(channel, (col * channel.width, row * channel.height))
        image.putalpha(tiled)
    return image, used


def native_layouts(compiler: Path, batches: list[list[tuple[int, int]]],
                   padding: int = 2) -> list[dict]:
    """One compiler process optimizes a complete corpus; failures are fatal."""
    request = bytearray(struct.pack("<3I", 0x314B5041, 1, len(batches)))
    for sizes in batches:
        request.extend(struct.pack("<2I", padding, len(sizes)))
        for width, height in sizes:
            request.extend(struct.pack("<2I", width, height))
    with tempfile.TemporaryDirectory(prefix="atlas-layout-") as temporary:
        source, target = Path(temporary) / "batch.bin", Path(temporary) / "layout.bin"
        source.write_bytes(request)
        subprocess.run([str(compiler.resolve()), "pack-atlas-layout", "--input", str(source),
                        "--output", str(target)], check=True, timeout=180)
        reader = pak.Reader(target.read_bytes())
    pak.require(reader.unpack("<3I") == (0x314C5041, 1, len(batches)), "Invalid native atlas response")
    result = []
    for sizes in batches:
        width, height, count, attempts, baseline, micros = reader.unpack("<4I2Q")
        pak.require(count == len(sizes), "Native atlas region count differs")
        regions, rectangles = [], []
        for w, h in sizes:
            x, y = reader.unpack("<2I")
            pak.require(x >= padding and y >= padding and x + w + padding <= width and
                        y + h + padding <= height, "Native atlas region outside image")
            rect = (x - padding, y - padding, x + w + padding, y + h + padding)
            pak.require(all(rect[2] <= old[0] or old[2] <= rect[0] or rect[3] <= old[1]
                            or old[3] <= rect[1] for old in rectangles), "Native atlas regions overlap")
            rectangles.append(rect)
            regions.append((x, y, w, h))
        pak.require(width <= 16384 and height <= 16384 and (not baseline or width * height <= baseline) and
                    ((count == 0 and width == height == baseline == 0) or count > 0),
                    "Native atlas regresses shelf baseline or dimensions")
        result.append({"width": width, "height": height, "regions": regions,
                       "shelf_area": baseline, "search_attempts": attempts,
                       "search_microseconds": micros, "method": "native-maxrects"})
    reader.finish()
    return result


def shelf_layout(sizes: list[tuple[int, int]], padding: int = 2) -> dict:
    """Reference fixture layout; production calls the mandatory native batch."""
    if not sizes:
        return {"width": 0, "height": 0, "regions": []}
    order = sorted(range(len(sizes)), key=lambda i: (-sizes[i][1], -sizes[i][0], i))
    minimum = max(width + 2 * padding for width, _ in sizes)
    area = sum((width + 2 * padding) * (height + 2 * padding) for width, height in sizes)
    widths = {minimum, max(minimum, math.ceil(math.sqrt(area)))}
    widths.update(1 << power for power in range(5, 15) if 1 << power >= minimum)
    best = None
    for width in sorted(widths):
        if width > 16384:
            continue
        x = y = shelf = used_width = 0
        positions = {}
        for index in order:
            iw, ih = sizes[index]
            w, h = iw + 2 * padding, ih + 2 * padding
            if x + w > width:
                y += shelf
                x = shelf = 0
            positions[index] = (x + padding, y + padding, iw, ih)
            x += w
            used_width = max(used_width, x)
            shelf = max(shelf, h)
        height = y + shelf
        if height <= 16384:
            candidate = (used_width * height, max(used_width, height), used_width, height, positions)
            if best is None or candidate[:4] < best[:4]:
                best = candidate
    pak.require(best is not None, "Definition atlas exceeds 16384 pixels")
    _, _, width, height, positions = best
    return {"width": width, "height": height,
            "regions": [positions[index] for index in range(len(sizes))]}


def pack(images: list[Image.Image], padding: int = 2, *, compiler: Path | None = None,
         layout: dict | None = None) -> tuple[Image.Image | None, list[tuple[int, int, int, int]]]:
    """Apply an offline native layout and replicate its two-pixel RGBA edges."""
    sizes = [image.size for image in images]
    if layout is None:
        layout = native_layouts(compiler, [sizes], padding)[0] if compiler else shelf_layout(sizes, padding)
    if not images:
        return None, []
    width, height, positions = layout["width"], layout["height"], layout["regions"]
    pak.require(len(positions) == len(images), "Image/layout count differs")
    atlas = Image.new("RGBA", (width, height), (0, 0, 0, 0))
    for index, image in enumerate(images):
        x, y, w, h = positions[index]
        atlas.paste(image, (x, y))
        for left, top, right, bottom, box in (
            (0, 0, w, 1, (x, y - padding, w, padding)),
            (0, h - 1, w, h, (x, y + h, w, padding)),
            (0, 0, 1, h, (x - padding, y, padding, h)),
            (w - 1, 0, w, h, (x + w, y, padding, h)),
            (0, 0, 1, 1, (x - padding, y - padding, padding, padding)),
            (w - 1, 0, w, 1, (x + w, y - padding, padding, padding)),
            (0, h - 1, 1, h, (x - padding, y + h, padding, padding)),
            (w - 1, h - 1, w, h, (x + w, y + h, padding, padding)),
        ):
            bx, by, bw, bh = box
            atlas.paste(image.crop((left, top, right, bottom)).resize((bw, bh), Image.Resampling.NEAREST), (bx, by))
    return atlas, positions


def compile_definition(name: str, data: bytes, source_images: dict[int | str, ImageDescriptor],
                       files: dict[str, Path], *, layout: dict | None = None,
                       atlas_symbols: list[int | str] | None = None, atlas_path: str = "",
                       emit_png: bool = True,
                       source_names: dict[int, str] | None = None) -> tuple[bytes, bytes | None, dict]:
    kind = pak.numeric_kind(name)
    cookie, size, crc = struct.unpack_from("<3I", data)
    pak.require(kind in ("reanim", "particles") and cookie == (0xDEADFED7 if kind == "reanim" else 0xDEADFED8)
                and size == len(data) - 12 and zlib.crc32(data[12:]) == crc,
                f"Invalid compiler definition: {name}")
    body = bytearray(data[12:])
    offsets = image_offsets(kind, body)
    handles = {struct.unpack_from("<I", body, offset)[0] for offset in offsets} - {0}
    if source_names is not None:
        pak.require(handles <= set(source_names), f"Unknown definition author image handle: {name}")
    labels = {handle: source_names[handle] if source_names is not None else handle for handle in handles}
    symbols = sorted(set(labels.values()))
    packed_symbols = symbols if atlas_symbols is None else atlas_symbols
    pak.require(set(symbols) <= set(packed_symbols), "Shared atlas misses a definition image")
    images, used, image_rows = [], set(), []
    for symbol in symbols:
        image, dependencies = logical_image(source_images[symbol], files)
        images.append(image)
        used |= dependencies
        image_rows.append({("source" if source_names is not None else "symbol"): symbol,
                           "width": image.width, "height": image.height,
                           "rows": source_images[symbol].rows, "cols": source_images[symbol].cols,
                           "rgba_bytes": image.width * image.height * 4,
                           "rgba_sha256": hashlib.sha256(image.tobytes()).hexdigest(),
                           "files": sorted(dependencies)})
    struct.pack_into("<I", body, 8 if kind == "reanim" else 4, 0)
    if layout is None:
        pak.require(packed_symbols == symbols, "Shared atlas requires a compiled layout")
        layout = shelf_layout([image.size for image in images])
    pak.require(len(layout["regions"]) == len(packed_symbols), "Shared atlas symbol/layout count differs")
    region_by_symbol = dict(zip(packed_symbols, layout["regions"]))
    regions = [region_by_symbol[symbol] for symbol in symbols]
    inline = {symbol: (*region_by_symbol[symbol], source_images[symbol].rows,
                       source_images[symbol].cols) for symbol in symbols}
    for row in image_rows:
        row["region"] = inline[row["source" if source_names is not None else "symbol"]]
    if kind == "particles":
        original_body_size = struct.unpack_from("<I", body, 16)[0]
        struct.pack_into("<I", body, 16, original_body_size + 20 * len(offsets))
    # Copy the body once. Inserting 20 extra bytes into the bytearray for every
    # frame repeatedly shifts the remaining transform data in large animations.
    rectangles = {handle: struct.pack("<6I", *inline[label])
                  for handle, label in labels.items()}
    rectangles[0] = bytes(24)
    parts, previous = [], 0
    for offset in offsets:
        handle = struct.unpack_from("<I", body, offset)[0]
        parts.extend((body[previous:offset], rectangles[handle]))
        previous = offset + 4
    parts.append(body[previous:])
    body = b"".join(parts)
    atlas = None
    if emit_png and packed_symbols:
        packed_images = (images if packed_symbols == symbols else
                         [logical_image(source_images[symbol], files)[0] for symbol in packed_symbols])
        atlas, _ = pack(packed_images, layout=layout)
    width, height = (layout["width"], layout["height"]) if symbols else (0, 0)
    prefix = struct.pack("<3I", 0x35564152 if kind == "reanim" else 0x35564150, width, height)
    payload = prefix + body
    output = struct.pack("<3I", 0xDEADFED9 if kind == "reanim" else 0xDEADFEDA,
                         len(payload), zlib.crc32(payload)) + payload
    png = None
    if atlas:
        buffer = io.BytesIO()
        atlas.save(buffer, format="PNG", compress_level=9)
        png = buffer.getvalue()
    return output, png, {"atlas_width": width, "atlas_height": height,
                         "atlas_path": (atlas_path or name.removesuffix(".compiled") + ".atlas.png") if symbols else "",
                         "atlas_shared": bool(atlas_path) and bool(symbols),
                         "packing": {key: value for key, value in (layout or {}).items()
                                     if key not in ("regions", "width", "height")},
                         "atlas_rgba_bytes": width * height * 4,
                         "padded_region_rgba_bytes": sum((image.width + 4) * (image.height + 4) * 4
                                                        for image in images),
                         "source_rgba_bytes": sum(row["rgba_bytes"] for row in image_rows),
                         "region_count": len(regions), "images": image_rows,
                         "source_files": sorted(used)}
