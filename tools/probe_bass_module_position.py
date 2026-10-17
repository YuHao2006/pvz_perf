#!/usr/bin/env python3
"""Probe BASS 2.4 tracker order/row seeking without opening an audio device."""

from __future__ import annotations

import argparse
import ctypes
import pathlib
import zipfile


BASS_MUSIC_LOOP = 0x4
BASS_MUSIC_RAMP = 0x200
BASS_MUSIC_POSRESET = 0x8000
BASS_POS_MUSIC_ORDER = 1


def packed_position_text(value: int) -> str:
    return (
        f"0x{value:08X} "
        f"order={value & 0xFFFF} row={(value >> 16) & 0xFFFF}"
    )


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--bass", type=pathlib.Path, required=True)
    parser.add_argument("--pak64", type=pathlib.Path, required=True)
    args = parser.parse_args()

    with zipfile.ZipFile(args.pak64) as archive:
        module_bytes = archive.read("sounds/mainmusic.mo3")

    bass = ctypes.WinDLL(str(args.bass.resolve()))
    bass.BASS_GetVersion.restype = ctypes.c_uint32
    bass.BASS_ErrorGetCode.restype = ctypes.c_int
    bass.BASS_Init.argtypes = [
        ctypes.c_int,
        ctypes.c_uint32,
        ctypes.c_uint32,
        ctypes.c_void_p,
        ctypes.c_void_p,
    ]
    bass.BASS_Init.restype = ctypes.c_int
    bass.BASS_MusicLoad.argtypes = [
        ctypes.c_int,
        ctypes.c_void_p,
        ctypes.c_uint64,
        ctypes.c_uint32,
        ctypes.c_uint32,
        ctypes.c_uint32,
    ]
    bass.BASS_MusicLoad.restype = ctypes.c_uint32
    bass.BASS_ChannelFlags.argtypes = [
        ctypes.c_uint32,
        ctypes.c_uint32,
        ctypes.c_uint32,
    ]
    bass.BASS_ChannelFlags.restype = ctypes.c_uint32
    bass.BASS_ChannelSetPosition.argtypes = [
        ctypes.c_uint32,
        ctypes.c_uint64,
        ctypes.c_uint32,
    ]
    bass.BASS_ChannelSetPosition.restype = ctypes.c_int
    bass.BASS_ChannelGetPosition.argtypes = [ctypes.c_uint32, ctypes.c_uint32]
    bass.BASS_ChannelGetPosition.restype = ctypes.c_uint64
    bass.BASS_MusicFree.argtypes = [ctypes.c_uint32]
    bass.BASS_MusicFree.restype = ctypes.c_int
    bass.BASS_Free.restype = ctypes.c_int

    version = bass.BASS_GetVersion()
    print(f"BASS version: {(version >> 24) & 0xFF}.{(version >> 16) & 0xFF}.{(version >> 8) & 0xFF}.{version & 0xFF}")
    if not bass.BASS_Init(0, 44100, 0, None, None):
        raise RuntimeError(f"BASS_Init failed: {bass.BASS_ErrorGetCode()}")

    module_buffer = ctypes.create_string_buffer(module_bytes)
    handle = bass.BASS_MusicLoad(
        1,
        ctypes.cast(module_buffer, ctypes.c_void_p),
        0,
        len(module_bytes),
        BASS_MUSIC_LOOP | BASS_MUSIC_RAMP,
        0,
    )
    if not handle:
        bass.BASS_Free()
        raise RuntimeError(f"BASS_MusicLoad failed: {bass.BASS_ErrorGetCode()}")

    bass.BASS_ChannelFlags(
        handle,
        BASS_MUSIC_POSRESET | BASS_MUSIC_RAMP | BASS_MUSIC_LOOP,
        0xFFFFFFFF,
    )
    for requested in (0x0000005E, 0x0025005F, 0x00150000):
        ok = bool(
            bass.BASS_ChannelSetPosition(
                handle, requested, BASS_POS_MUSIC_ORDER
            )
        )
        error = bass.BASS_ErrorGetCode()
        actual = int(
            bass.BASS_ChannelGetPosition(handle, BASS_POS_MUSIC_ORDER)
        )
        print(
            f"request {packed_position_text(requested)} -> "
            f"ok={int(ok)} error={error} actual {packed_position_text(actual)}"
        )

    bass.BASS_MusicFree(handle)
    bass.BASS_Free()
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
