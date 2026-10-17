#!/usr/bin/env python3
"""Decode numeric runtime trace v1 to JSON Lines; not linked into the game."""
import argparse
import json
import math
import struct
from pathlib import Path


HEADER = struct.Struct("<IHHIId")
RECORD = struct.Struct("<IHBBQqQ")
MAGIC = 0x545A5650
EVENTS = (
    None, "update-gap", "update-total", "update-audio", "update-image-cleanup",
    "lawn-music-update", "process-demo", "deferred-drain", "timer-bookkeeping",
    "ice-shroom-freeze", "audio-play-foley", "sand-image", "load-reanim",
    "load-image", "first-draw-upload", "texture-create-skip-empty",
    "screensaver-config", "screensaver-clear", "screensaver-active",
    "process-begin", "update-decision", "no-update-draw", "no-update-sleep",
    "load-group", None, "reanim-preload-all", "reanim-upload-skip",
    "reanim-upload-all", "selector-slide-start", "selector-slide-end",
    "portable-counter-trace-probe",
)
PERF = (
    "unknown", "update-total", "present", "draw-dirty-total", "draw-widgets",
    "update-widgets", "resource-alpha-image", "resource-image",
    "resource-ddsurface", "resource-palette", "resource-sound", "resource-font",
)
PHASE = (
    "app-update", "board-update", "zombie-update", "plant-update",
    "effect-system-update", "particle-system-update", "board-draw",
    "reanimation-draw", "particle-draw", "build-render-items", "render-sort",
    "zombie-body-draw", "backdrop-draw", "backdrop-bg-blit", "pool-effect-draw",
    "create-textures", "submit-triangles", "submit-impl-draw", "ui-draw",
)
SCHEMAS = {
    11: (("path", "path"), ("width", "i"), ("height", "i")),
    12: (("path", "path"), ("preload", "?")),
    13: (("path", "path"), ("variant", "I")),
    14: (("path", "path"), ("width", "i"), ("height", "i"),
         ("image_address", "Q"), ("texture_data", "?"), ("bits", "?"),
         ("bits_version", "I")),
    15: (("image_present", "?"), ("path", "path"), ("width", "i"), ("height", "i")),
    16: (("timeout_ms", "I"), ("enabled", "?")),
    17: (("timeout_ms", "I"), ("idle_ms", "I")),
    18: (("timeout_ms", "I"), ("idle_ms", "I")),
    19: (("state", "i"), ("accumulator_ms", "d"), ("non_draw_count", "i"),
         ("pending_draw", "?")),
    20: (("do_update", "?"), ("accumulator_ms", "d"), ("frame_ms", "d"),
         ("vsync", "?")),
    21: (("accumulator_ms", "d"),),
    22: (("accumulator_ms", "d"), ("wait_ms", "i")),
    23: (("group", "I"), ("duration_ms", "i")),
    25: (("count", "I"),),
    26: (("path", "path"), ("width", "i"), ("height", "i")),
    27: (("images", "i"),),
    28: (("start_x", "i"), ("start_y", "i"), ("destination_x", "i"),
         ("destination_y", "i"), ("counter", "i"), ("state", "i")),
    29: (("elapsed_us", "Q"), ("updates", "I"),
         ("destination_x", "i"), ("destination_y", "i")),
    30: (),
}


class Payload:
    def __init__(self, data):
        self.data = data
        self.offset = 0

    def scalar(self, code):
        size = struct.calcsize("<" + code)
        if size > len(self.data) - self.offset:
            raise ValueError("Truncated trace scalar")
        value, = struct.unpack_from("<" + code, self.data, self.offset)
        self.offset += size
        return value

    def field(self, kind):
        if kind == "path":
            size = self.scalar("I")
            if size > len(self.data) - self.offset:
                raise ValueError("Truncated trace path")
            raw = self.data[self.offset:self.offset + size]
            self.offset += size
            # Paths are preserved as bytes even when the native input is not UTF-8.
            return {"bytes_hex": raw.hex()}
        if kind == "?":
            value = self.scalar("B")
            if value not in (0, 1):
                raise ValueError("Invalid trace boolean")
            return bool(value)
        value = self.scalar(kind)
        if isinstance(value, float) and not math.isfinite(value):
            raise ValueError("Nonfinite trace scalar")
        return value


def decode(stream, size):
    raw = stream.read(HEADER.size)
    if len(raw) != HEADER.size:
        raise ValueError("Missing numeric trace header")
    magic, version, header_size, record_size, ticks, threshold = HEADER.unpack(raw)
    if (magic, version, header_size, record_size, ticks) != (
            MAGIC, 1, HEADER.size, RECORD.size, 1000000):
        raise ValueError("Unsupported numeric trace contract")
    if not math.isfinite(threshold) or threshold <= 0:
        raise ValueError("Invalid trace threshold")
    yield {"version": version, "ticks_per_second": ticks,
           "stall_threshold_ms": threshold}
    while stream.tell() < size:
        offset = stream.tell()
        raw = stream.read(RECORD.size)
        if len(raw) != RECORD.size:
            raise ValueError(f"Truncated trace header at {offset}")
        length, identity, domain, kind, timestamp, update, duration = RECORD.unpack(raw)
        if length < RECORD.size or length > size - offset:
            raise ValueError(f"Invalid trace framing at {offset}")
        if domain > 2 or kind > 1:
            raise ValueError(f"Invalid trace domain/kind at {offset}")
        names = (EVENTS, PERF, PHASE)[domain]
        if identity >= len(names) or names[identity] is None:
            raise ValueError(f"Unknown trace identity at {offset}: {domain}/{identity}")
        payload = Payload(stream.read(length - RECORD.size))
        if kind == 1:
            if payload.data or duration / 1000 < threshold:
                raise ValueError(f"Invalid duration record at {offset}")
            fields = {}
        else:
            if domain != 0 or identity not in SCHEMAS or duration != 0:
                raise ValueError(f"Invalid instant contract at {offset}")
            fields = {name: payload.field(field) for name, field in SCHEMAS[identity]}
            if payload.offset != len(payload.data):
                raise ValueError(f"Trailing trace payload at {offset}")
        yield {"offset": offset, "domain": domain, "id": identity,
               "event": names[identity], "kind": ("instant", "duration")[kind],
               "time_us": timestamp, "update": update,
               "duration_us": duration, "fields": fields}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("input", type=Path)
    parser.add_argument("output", type=Path)
    args = parser.parse_args()
    if args.input.resolve() == args.output.resolve():
        raise ValueError("Trace input and decoded output must be separate")
    with args.input.open("rb") as source, args.output.open(
            "w", encoding="utf-8", newline="\n") as destination:
        for record in decode(source, args.input.stat().st_size):
            destination.write(json.dumps(record, ensure_ascii=True, allow_nan=False) + "\n")


if __name__ == "__main__":
    main()
