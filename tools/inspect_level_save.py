#!/usr/bin/env python3
"""Strict structural inspector for PvZ 1.2.0.1073 game*.dat files.

This tool deliberately does not load the game or main.pak.  It follows the
official SaveGame.cpp stream grammar and uses the SyncBytes lengths embedded in
the file to delimit dynamic records.  It is also the executable specification
used while implementing the dat -> dat64 converter.
"""

from __future__ import annotations

import argparse
import functools
import json
import struct
from dataclasses import dataclass
from pathlib import Path
from typing import Any


SAVE_MAGIC = 0xFEEDDEAD
SAVE_VERSION = 2
SAVE_DATE = 0xAC9B80AC
KEY_MASK = 0xFFFF0000


@dataclass(frozen=True)
class ArrayLayout:
    name: str
    object_size: int
    slot_size: int


ARRAY_LAYOUTS = (
    ArrayLayout("Zombie", 356, 360),
    ArrayLayout("Plant", 328, 332),
    ArrayLayout("Projectile", 144, 148),
    ArrayLayout("Coin", 208, 216),
    ArrayLayout("LawnMower", 68, 72),
    ArrayLayout("GridItem", 232, 236),
    ArrayLayout("ParticleSystem", 40, 44),
    ArrayLayout("ParticleEmitter", 172, 176),
    ArrayLayout("Particle", 156, 160),
    ArrayLayout("Reanimation", 156, 160),
    ArrayLayout("Trail", 232, 236),
    ArrayLayout("Attachment", 776, 780),
)


class FormatError(RuntimeError):
    pass


class Reader:
    def __init__(self, data: bytes, offset: int = 0, limit: int | None = None):
        self.data = data
        self.pos = offset
        self.limit = len(data) if limit is None else limit

    def require(self, size: int) -> None:
        if size < 0 or self.pos + size > self.limit:
            raise FormatError(
                f"offset 0x{self.pos:X}: need {size} bytes, "
                f"only {self.limit - self.pos} remain"
            )

    def u32(self) -> int:
        self.require(4)
        value = struct.unpack_from("<I", self.data, self.pos)[0]
        self.pos += 4
        return value

    def i32(self) -> int:
        self.require(4)
        value = struct.unpack_from("<i", self.data, self.pos)[0]
        self.pos += 4
        return value

    def bytes(self, size: int) -> bytes:
        self.require(size)
        value = self.data[self.pos : self.pos + size]
        self.pos += size
        return value

    def sync_bytes(self, expected_size: int) -> bytes:
        actual = self.u32()
        if actual != expected_size:
            raise FormatError(
                f"offset 0x{self.pos - 4:X}: SyncBytes length {actual}, "
                f"expected {expected_size}"
            )
        return self.bytes(expected_size)


def live_slot_ids(block: bytes, layout: ArrayLayout, max_used: int) -> list[int]:
    result: list[int] = []
    for index in range(max_used):
        slot = index * layout.slot_size
        object_id = struct.unpack_from("<I", block, slot + layout.object_size)[0]
        if object_id & KEY_MASK:
            result.append(object_id)
    return result


def parse_id_list(reader: Reader) -> list[int]:
    count = reader.i32()
    if count < 0 or count > 1_000_000:
        raise FormatError(f"offset 0x{reader.pos - 4:X}: invalid ID-list count {count}")
    result = []
    for _ in range(count):
        raw = reader.sync_bytes(4)
        result.append(struct.unpack("<I", raw)[0])
    return result


def track_record_is_plausible(data: bytes, offset: int, count: int) -> bool:
    for index in range(count):
        base = offset + index * 96
        # The final four members are bools in the official x86 layout.
        if any(value not in (0, 1) for value in data[base + 92 : base + 96]):
            return False
    return True


def solve_reanimations(
    data: bytes,
    start: int,
    end: int,
    count: int,
) -> list[dict[str, Any]]:
    """Resolve the only implicit-length portion of the 1073 stream.

    A zero-track reanimation writes only its definition ID.  A non-empty one
    follows that ID with SyncBytes(N*96), then N image resource IDs.  The track
    count is normally obtained from main.pak at runtime; here a memoized grammar
    solver uses the embedded block length, bool invariants, definition/resource
    ID ranges, the known live-object count, and the exact following boundary.
    """

    @functools.lru_cache(maxsize=None)
    def visit(index: int, pos: int) -> tuple[tuple[int, int, int], ...] | None:
        if index == count:
            return () if pos == end else None
        if pos + 4 > end:
            return None

        definition = struct.unpack_from("<i", data, pos)[0]
        if definition < -1 or definition >= 4096:
            return None

        # Prefer the non-empty form.  It is strongly identified by a positive
        # multiple-of-96 SyncBytes length and four valid bool tail bytes per
        # track.  The zero-track branch remains for genuine empty definitions.
        if pos + 8 <= end:
            byte_count = struct.unpack_from("<I", data, pos + 4)[0]
            if byte_count > 0 and byte_count % 96 == 0:
                track_count = byte_count // 96
                track_data = pos + 8
                image_ids = track_data + byte_count
                next_pos = image_ids + track_count * 4
                if (
                    track_count <= 4096
                    and next_pos <= end
                    and track_record_is_plausible(data, track_data, track_count)
                ):
                    resources_ok = True
                    for track in range(track_count):
                        resource = struct.unpack_from("<i", data, image_ids + track * 4)[0]
                        if resource < -1 or resource >= 65536:
                            resources_ok = False
                            break
                    if resources_ok:
                        rest = visit(index + 1, next_pos)
                        if rest is not None:
                            return ((definition, track_count, pos),) + rest

        rest = visit(index + 1, pos + 4)
        if rest is not None:
            return ((definition, 0, pos),) + rest
        return None

    solution = visit(0, start)
    if solution is None:
        raise FormatError(
            f"cannot resolve {count} reanimation records between "
            f"0x{start:X} and 0x{end:X}"
        )
    return [
        {"definition": definition, "track_count": tracks, "offset": offset}
        for definition, tracks, offset in solution
    ]


def parse_music(block: bytes) -> dict[str, Any]:
    fields = struct.unpack_from("<14i", block, 8)
    return {
        "tune": fields[0],
        "main_file": fields[1],
        "drums_file": fields[2],
        "hihats_file": fields[3],
        "burst_override": fields[4],
        "base_bpm_i32": fields[5],
        "base_mod_speed_i32": fields[6],
        "burst_state": fields[7],
        "burst_counter": fields[8],
        "drums_state": fields[9],
        "queued_drums_order": fields[10],
        "drums_counter": fields[11],
        "pause_offset": fields[12],
        "pause_drums_offset": fields[13],
        "paused": block[64],
        "music_disabled": block[65],
        "fade_counter": struct.unpack_from("<i", block, 68)[0],
        "fade_duration": struct.unpack_from("<i", block, 72)[0],
    }


def inspect(path: Path) -> dict[str, Any]:
    data = path.read_bytes()
    reader = Reader(data)

    header = reader.sync_bytes(12)
    magic, version, date = struct.unpack("<III", header)
    if (magic, version, date) != (SAVE_MAGIC, SAVE_VERSION, SAVE_DATE):
        raise FormatError(
            f"not a 1073 level save: {magic:08X}/{version}/{date:08X}"
        )

    board_offset = reader.pos + 4
    board = reader.sync_bytes(22108)

    arrays: list[dict[str, Any]] = []
    array_blocks: dict[str, bytes] = {}
    for layout in ARRAY_LAYOUTS:
        free_head = reader.u32()
        max_used = reader.u32()
        live_count = reader.u32()
        block = reader.sync_bytes(max_used * layout.slot_size)
        ids = live_slot_ids(block, layout, max_used)
        if len(ids) != live_count:
            raise FormatError(
                f"{layout.name}: header live count {live_count}, "
                f"but {len(ids)} live slot IDs"
            )
        arrays.append(
            {
                "name": layout.name,
                "free_list_head": free_head,
                "max_used_count": max_used,
                "live_count": live_count,
                "block_size": len(block),
                "live_ids": ids,
            }
        )
        array_blocks[layout.name] = block

    particle_supplement_offset = reader.pos
    particle_system_ids = arrays[6]["live_ids"]
    for _ in particle_system_ids:
        particle_definition = reader.i32()
        if particle_definition < -1 or particle_definition >= 4096:
            raise FormatError(f"invalid particle definition {particle_definition}")
        emitter_ids = parse_id_list(reader)
        for _emitter_id in emitter_ids:
            emitter_definition_index = reader.i32()
            image_resource_id = reader.i32()
            if emitter_definition_index < 0 or emitter_definition_index >= 4096:
                raise FormatError(
                    f"invalid particle emitter definition index {emitter_definition_index}"
                )
            if image_resource_id < -1 or image_resource_id >= 65536:
                raise FormatError(f"invalid image resource ID {image_resource_id}")
            parse_id_list(reader)

    reanimation_supplement_offset = reader.pos
    fixed_tail_size = 2056
    fixed_tail_offset = len(data) - fixed_tail_size
    if fixed_tail_offset < reader.pos:
        raise FormatError("file is shorter than the fixed 1073 tail")
    trail_count = arrays[10]["live_count"]
    reanimation_end = fixed_tail_offset - trail_count * 4
    reanimations = solve_reanimations(
        data,
        reanimation_supplement_offset,
        reanimation_end,
        arrays[9]["live_count"],
    )

    reader.pos = reanimation_end
    trail_definitions = [reader.i32() for _ in range(trail_count)]
    if reader.pos != fixed_tail_offset:
        raise FormatError("trail definitions did not end at the fixed tail")

    fixed_blocks = {}
    for name, size in (
        ("CursorObject", 76),
        ("CursorPreview", 44),
        ("MessageWidget", 796),
        ("SeedBank", 848),
        ("Challenge", 188),
        ("Music", 76),
    ):
        fixed_blocks[name] = reader.sync_bytes(size)
    end_marker = reader.u32()
    if end_marker != SAVE_MAGIC or reader.pos != len(data):
        raise FormatError(
            f"bad end marker/length: marker={end_marker:08X}, "
            f"remaining={len(data) - reader.pos}"
        )

    game_id = struct.unpack_from("<i", board, 22076)[0]
    return {
        "path": str(path),
        "file_size": len(data),
        "header": {"magic": f"0x{magic:08X}", "version": version, "date": f"0x{date:08X}"},
        "board": {
            "offset": board_offset,
            "size": len(board),
            "paused": board[0],
            "background": struct.unpack_from("<i", board, 0x53E8)[0],
            "level": struct.unpack_from("<i", board, 0x53EC)[0],
            "current_wave": struct.unpack_from("<i", board, 0x541C)[0],
            "num_waves": struct.unpack_from("<i", board, 0x5404)[0],
            "game_id_i32": game_id,
        },
        "arrays": arrays,
        "dynamic": {
            "particle_supplement_offset": particle_supplement_offset,
            "reanimation_supplement_offset": reanimation_supplement_offset,
            "reanimation_end": reanimation_end,
            "fixed_tail_offset": fixed_tail_offset,
            "reanimations": reanimations,
            "trail_definitions": trail_definitions,
        },
        "music": parse_music(fixed_blocks["Music"]),
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("save", type=Path)
    parser.add_argument("--json", action="store_true")
    args = parser.parse_args()

    result = inspect(args.save)
    if args.json:
        print(json.dumps(result, ensure_ascii=False, indent=2))
    else:
        print(f"1073 level save: {result['path']}")
        print(f"size: {result['file_size']} bytes")
        print("board:", result["board"])
        for array in result["arrays"]:
            print(
                f"{array['name']:16} max={array['max_used_count']:4} "
                f"live={array['live_count']:4} bytes={array['block_size']:7}"
            )
        print(
            "reanimations:",
            len(result["dynamic"]["reanimations"]),
            "tracks:",
            sum(item["track_count"] for item in result["dynamic"]["reanimations"]),
        )
        print("music:", result["music"])
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
