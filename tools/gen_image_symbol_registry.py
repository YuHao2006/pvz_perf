#!/usr/bin/env python3
"""Emit numeric ImageSymbolId enum and baked CRC from the stable offline sidecar.

The sidecar remains an offline compiler input. No spelling table or name resolver
is emitted into production headers. Regeneration preserves every existing ID;
new symbols may only be appended explicitly using --append-new. Removing a
symbol compacts the registry; every DSL consumer must be recompiled together.
"""
import argparse
import struct
import sys
import zlib
from pathlib import Path


def sanitized(name: str) -> str:
    return ''.join(ch if ch.isalnum() or ch == '_' else '_' for ch in name)


def read_sidecar(path: Path) -> list[str]:
    data = path.read_bytes()
    magic, count = struct.unpack_from('<II', data)
    if magic != 0x4953594D:
        raise ValueError('Invalid image symbol sidecar')
    names, offset = [], 8
    for expected in range(1, count + 1):
        identifier, length = struct.unpack_from('<II', data, offset)
        offset += 8
        if identifier != expected or length > len(data) - offset:
            raise ValueError('Invalid stable image symbol ID')
        names.append(data[offset:offset + length].decode('utf-8'))
        offset += length
    if offset != len(data):
        raise ValueError('Trailing image symbol sidecar bytes')
    return names


def sidecar_bytes(names: list[str]) -> bytes:
    result = bytearray(struct.pack('<II', 0x4953594D, len(names)))
    for identifier, name in enumerate(names, 1):
        raw = name.encode('utf-8')
        result += struct.pack('<II', identifier, len(raw)) + raw
    return bytes(result)


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('dump', nargs='*', help='optional offline corpus sources; existing IDs remain authoritative')
    ap.add_argument('--header', default='pvzPerf/Sexy.TodLib/generated/ImageSymbolId.h')
    ap.add_argument('--sidecar', default='pvzPerf/Sexy.TodLib/generated/image_symbol_ids.bin')
    ap.add_argument('--root', default=str(Path(__file__).resolve().parents[1]))
    ap.add_argument('--append-new', action='store_true', help='append new names without renumbering existing IDs')
    ap.add_argument('--remove', action='append', default=[], help='remove an unused symbol and compact IDs')
    args = ap.parse_args()
    root = Path(args.root)
    sidecar = root / args.sidecar
    original_names = read_sidecar(sidecar)
    removed = set(args.remove)
    if not removed <= set(original_names):
        raise ValueError('Cannot remove symbols absent from the registry')
    names = [name for name in original_names if name not in removed]
    requested = set()
    for source in args.dump:
        requested.update(line.strip() for line in (root / source).read_text(encoding='utf-8', errors='replace').splitlines() if line.strip())
    if removed & requested:
        raise ValueError('Removed image symbols are still referenced by the supplied corpus')
    added = sorted(requested - set(names), key=lambda name: (name.lower(), name))
    if added and not args.append_new:
        raise ValueError(f'{len(added)} symbols are outside the existing stable registry; use --append-new explicitly')
    names.extend(added)
    data = sidecar_bytes(names)
    header_path = root / args.header
    existing = {}
    if header_path.exists():
        import re
        existing = {int(value): ident for ident, value in re.findall(r'^\s+(\w+)\s*=\s*(\d+)\s*,', header_path.read_text(encoding='utf-8'), re.M)}
    identifiers = {name: existing.get(identifier, sanitized(name))
                   for identifier, name in enumerate(original_names, 1)}
    output = ['// Generated numeric image IDs; spellings exist only in offline sidecar.', '#pragma once', '#include <cstdint>',
              'enum class ImageSymbolId : std::uint32_t', '{', '    None = 0,']
    used = {'None'}
    for identifier, name in enumerate(names, 1):
        ident = identifiers.get(name, sanitized(name))
        while ident in used:
            ident += '_'
        used.add(ident)
        output.append(f'    {ident} = {identifier},')
    output += ['};', f'inline constexpr std::uint32_t IMAGE_SYMBOL_ID_COUNT = {len(names) + 1};',
               f'inline constexpr std::uint32_t IMAGE_SYMBOL_ID_MAX = {len(names)};',
               f'inline constexpr std::uint32_t IMAGE_SYMBOL_ID_REGISTRY_CRC = 0x{zlib.crc32(data):08X}u;']
    header_data = ('\n'.join(output) + '\n').encode('utf-8')
    if not header_path.exists() or header_path.read_bytes() != header_data:
        header_path.write_bytes(header_data)
    if added or removed:
        sidecar.write_bytes(data)
    print(f'symbols={len(names)} crc={zlib.crc32(data):08X} removed={len(removed)} -> {header_path}')
    return 0


if __name__ == '__main__':
    sys.exit(main())
