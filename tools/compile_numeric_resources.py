#!/usr/bin/env python3
"""Compile the ordered JSON author manifest and stable image sidecar into numeric resources.

All logical resource names are resolved offline. The runtime record contains
numeric slots, enum properties and file paths only. Existing enum IDs never move.
Use --authoring to select another JSON manifest; XML is not an input format.
"""
from __future__ import annotations
import argparse
import json
import re
import struct
import zlib
import zipfile
from pathlib import Path, PurePosixPath

ROOT = Path(__file__).resolve().parents[1]
MAGIC = 0x4353524E
VERSION = 1
NONE = 0xFFFFFFFF
PROGRAM, SYSTEM_FONT, REFERENCE_FONT, KEEP_BITS = 1, 2, 4, 8
PALLETIZE, A4, A8, DDS, PURGE, MIN_SUBDIVIDE, AUTO_ALPHA = 16, 32, 64, 128, 256, 512, 1024
PURGE_3D, PURGE_2D, UNAVAILABLE = 2048, 4096, 8192


def write_changed(path: Path, text: str) -> None:
    data = text.encode("utf-8")
    if not path.exists() or path.read_bytes() != data:
        path.write_bytes(data)


def read_authoring(data: bytes) -> dict:
    def unique_members(pairs: list[tuple[str, object]]) -> dict:
        result = {}
        for name, value in pairs:
            if name in result:
                raise ValueError(f'Duplicate author manifest member: {name}')
            result[name] = value
        return result

    author = json.loads(data, object_pairs_hook=unique_members)
    if (not isinstance(author, dict) or set(author) != {'format', 'manifest'}
            or author['format'] != 'pvz-resources-authoring-v1'):
        raise ValueError('Expected pvz-resources-authoring-v1 JSON manifest')

    def validate_node(node: object, tags: tuple[str, ...]) -> None:
        if (not isinstance(node, dict) or set(node) != {'tag', 'attrs', 'children'}
                or node['tag'] not in tags or not isinstance(node['attrs'], dict)
                or not isinstance(node['children'], list)):
            raise ValueError('Invalid author manifest node')
        if any(not isinstance(value, str) or '\0' in name or '\0' in value
               for name, value in node['attrs'].items()):
            raise ValueError('Author attributes must be strings without NUL')

    manifest = author['manifest']
    validate_node(manifest, ('ResourceManifest',))
    for group in manifest['children']:
        validate_node(group, ('Resources',))
        if not group['attrs'].get('id'):
            raise ValueError('Author resource group has no id')
        for node in group['children']:
            validate_node(node, ('SetDefaults', 'Image', 'Sound', 'Font'))
            if node['children'] or node['tag'] != 'SetDefaults' and 'path' not in node['attrs']:
                raise ValueError('Author resource must be a leaf with a path')
    return manifest


def read_symbols(path: Path) -> tuple[list[tuple[int, str]], int]:
    data = path.read_bytes()
    magic, count = struct.unpack_from('<II', data)
    if magic != 0x4953594D:
        raise ValueError('Invalid image symbol sidecar')
    result, offset = [], 8
    for expected in range(1, count + 1):
        symbol, length = struct.unpack_from('<II', data, offset)
        offset += 8
        name = data[offset:offset + length].decode('utf-8')
        offset += length
        if symbol != expected:
            raise ValueError('Image symbols must preserve dense existing IDs')
        result.append((symbol, name))
    if offset != len(data):
        raise ValueError('Trailing image symbol bytes')
    return result, zlib.crc32(data)


def resource_enum(root: Path) -> tuple[list[str], str]:
    shared = root / 'pvzPerf/Sexy.TodLib/generated/ResourceId.h'
    source = shared if shared.exists() else root / 'pvzPerf/Resources.h'
    text = source.read_text(encoding='utf-8')
    match = re.search(r'    enum class ResourceId : int\s*\{.*?\n    \};', text, re.S)
    if not match:
        raise ValueError('Existing ResourceId enum not found')
    names = re.findall(r'\b(\w+)_ID\s*(?:=\s*\d+)?\s*,', match.group())
    if len(names) != 879:
        raise ValueError(f'Expected 879 existing ResourceId values, found {len(names)}')
    return names, match.group()


def group_ids(root: Path) -> dict[str, int]:
    text = (root / 'pvzPerf/ResourceGroupId.h').read_text(encoding='utf-8')
    block = text[text.index('enum class ResourceGroupId'):text.index('};')]
    result = {name: int(value) for name, value in re.findall(r'(\w+)\s*=\s*(\d+)', block)}
    if result.get('Invalid') != 0 or len(result) != 30:
        raise ValueError('Expected Invalid0 and 29 canonical resource groups')
    return result


def path_string(value: str) -> str:
    return value.replace(chr(92), '/')


def str_record(value: str) -> bytes:
    raw = value.encode('utf-8')
    return struct.pack('<I', len(raw)) + raw


def int_vector(values: list[int]) -> bytes:
    return struct.pack('<I', len(values)) + b''.join(struct.pack('<i', value) for value in values)


def vec(value: str) -> list[int]:
    return [int(v.strip()) for v in value.split(',')] if value else []


def compile_manifest(root: Path, authoring: bytes, archive_paths: list[str], sidecar: Path,
                     font_tag_ids: dict[str, int] | None = None) -> tuple[bytes, list[int], int, list[str]]:
    manifest = read_authoring(authoring)
    enum_names, _ = resource_enum(root)
    ids = {name: index for index, name in enumerate(enum_names)}
    symbols, registry_crc = read_symbols(sidecar)
    # Sidecar can contain case aliases; the author spelling receives its exact symbol.
    exact_symbols = {name: symbol for symbol, name in symbols}
    groups = group_ids(root)
    paths = {}
    for p in archive_paths:
        normalized = path_string(p)
        if PurePosixPath(normalized).suffix.lower() in ('.png', '.jpg', '.jpeg', '.bmp', '.gif'):
            stem = str(PurePosixPath(normalized).with_suffix('')).lower()
            paths.setdefault(stem, normalized)
    records, names, mapping = [], [], [NONE] * (len(symbols) + 1)
    image_residency: list[tuple[tuple[str, int], int] | None] = []
    default_path, default_prefix = '', ''
    variants: dict[str, int] = {}
    font_tags = font_tag_ids or {}
    def emit(slot: int, symbol: int, group: int, kind: int, flags: int, ref: int,
             variant: int, path: str, alpha: str = '', alpha_grid: str = '', font_image: str = '',
             attrs: dict[str, str] | None = None) -> None:
        a = attrs or {}
        common = struct.pack('<7I', slot, symbol, group, kind, flags, ref, variant)
        common += b''.join(str_record(p) for p in (path, alpha, alpha_grid, font_image))
        if kind == 0:
            rows, cols = int(a.get('rows', '1')), int(a.get('cols', '1'))
            if rows <= 0 or cols <= 0 or rows > 2147483647 or cols > 2147483647:
                raise ValueError('Invalid image grid')
            anim = {'none': 0, 'once': 1, 'pingpong': 2, 'loop': 3}[a.get('anim', 'none').lower()]
            common += struct.pack('<iiIIiii', rows, cols, int(a.get('alphacolor', 'FFFFFF'), 16),
                                  anim, int(a.get('framedelay', '0')), int(a.get('begindelay', '0')),
                                  int(a.get('enddelay', '0')))
            common += int_vector(vec(a.get('perframedelay', ''))) + int_vector(vec(a.get('framemap', '')))
        elif kind == 1:
            common += struct.pack('<di', float(a.get('volume', '-1')), int(a.get('pan', '0')))
        else:
            style = sum(bit for name, bit in [('bold', 1), ('italic', 2), ('underline', 4), ('shadow', 8)] if name in a)
            common += struct.pack('<iI', int(a.get('size', '0')), style)
            tags = re.findall(r'[^,\s]+', a.get('tags', ''))
            unknown = [tag for tag in tags if tag not in font_tags]
            if unknown:
                raise ValueError(f'Font tags need existing numeric registry: {unknown}')
            common += int_vector([font_tags[tag] for tag in tags])
        records.append(struct.pack('<I', len(common)) + common)
        image_residency.append(((path.casefold(), variant), flags)
                               if kind == 0 and path and not flags & UNAVAILABLE else None)
        if symbol:
            mapping[symbol] = slot

    for group in manifest['children']:
        group_name = group['attrs']['id']
        if group_name not in groups:
            if any(e['tag'] != 'SetDefaults' for e in group['children']):
                raise ValueError(f'Nonempty author group has no approved enum: {group_name}')
            continue
        for elem in group['children']:
            a = elem['attrs']
            if elem['tag'] == 'SetDefaults':
                if 'path' in a:
                    default_path = path_string(a['path']).rstrip('/') + '/'
                default_prefix = a.get('idprefix', default_prefix).rstrip('/')
                continue
            original_path = path_string(a['path'])
            name = default_prefix + a.get('id', PurePosixPath(original_path).stem)
            slot = len(names)
            if slot >= len(enum_names) or name != enum_names[slot]:
                raise ValueError(f'ResourceId order changed at {slot}: {name}')
            names.append(name)
            path = original_path if original_path.startswith('!') else default_path + original_path
            if name == 'IMAGE_PARTNER_LOGO':
                path = 'images/blank'
            flags, ref = 0, NONE
            if path == '!program':
                flags |= PROGRAM
                path = ''
            elif path.startswith('!ref:'):
                flags |= REFERENCE_FONT
                ref = ids[path[5:]]
                path = ''
            elif path.startswith('!sys:'):
                raise ValueError('System fonts require an offline compiled bitmap font')
            elif path.startswith('!'):
                raise ValueError(f'Unknown resource control token: {path}')
            if path.lower().startswith('reanim/'):
                flags |= KEEP_BITS
            kind = {'Image': 0, 'Sound': 1, 'Font': 2}[elem['tag']]
            if kind == 0:
                flags |= 0 if 'nopal' in a else PALLETIZE
                # 1073 editbox_.gif is 96x33, not the 90x42 editbox.gif's alpha.
                # Declare the asset policy; the runtime rejects mismatched sidecars.
                flags |= 0 if 'noalpha' in a or name == 'IMAGE_EDITBOX' else AUTO_ALPHA
                for key, bit in [('a4r4g4b4', A4), ('a8r8g8b8', A8), ('ddsurface', DDS),
                                 ('nobits', PURGE), ('minsubdivide', MIN_SUBDIVIDE), ('nobits3d', PURGE_3D), ('nobits2d', PURGE_2D)]:
                    if key in a:
                        flags |= bit
            variant_name = a.get('variant', '')
            if variant_name:
                variant = variants.setdefault(variant_name, len(variants) + 1)
            else:
                variant = 0
            symbol = exact_symbols.get(name, 0) if kind == 0 else 0
            if kind == 0 and not symbol and slot != 2:
                raise ValueError(f'Declared image absent in stable symbol sidecar: {name}')
            emit(slot, symbol, groups[group_name], kind, flags, ref, variant, path,
                 default_path + a['alphaimage'] if 'alphaimage' in a else '',
                 default_path + a['alphagrid'] if 'alphagrid' in a else '', a.get('image', ''), a)
    if names != enum_names:
        raise ValueError('Author manifest must contain every stable ResourceId')
    for symbol, name in symbols:
        if mapping[symbol] != NONE:
            continue
        suffix = name[len('IMAGE_REANIM_'):] if name.startswith('IMAGE_REANIM_') else name[len('IMAGE_'):] if name.upper().startswith('IMAGE_') else ''
        directories = ('reanim', 'images', 'particles') if name.startswith('IMAGE_REANIM_') else ('particles', 'images', 'reanim')
        candidates = [paths[f'{directory}/{suffix}'.lower()] for directory in directories if f'{directory}/{suffix}'.lower() in paths]
        slot = len(records)
        if not candidates:
            # The stable corpus includes two unused, absent 1073 assets. Keep their
            # IDs as explicit unavailable descriptors, matching old load failure.
            if name not in ('IMAGE_PROJECTILE', 'IMAGE_SUN'):
                raise ValueError(f'Image symbol has no FILE PATH in archive: {symbol} {name}')
            emit(slot, symbol, 0, 0, UNAVAILABLE, NONE, 0, '')
            continue
        path = str(PurePosixPath(candidates[0]).with_suffix(''))
        flags = KEEP_BITS | AUTO_ALPHA  # dynamic DefinitionLoadImage retains source pixels
        emit(slot, symbol, 0, 0, flags, NONE, 0, path)
    # SharedImage caches by physical path/variant. Any CPU consumer applies to
    # every descriptor alias before the first upload can purge that shared data.
    retained = {key for entry in image_residency if entry is not None
                for key, flags in (entry,) if flags & KEEP_BITS}
    for index, entry in enumerate(image_residency):
        if entry is not None:
            key, flags = entry
            if key in retained and not flags & KEEP_BITS:
                record = bytearray(records[index])
                struct.pack_into('<I', record, 4 + 4 * 4, flags | KEEP_BITS)
                records[index] = bytes(record)
    payload = b''.join(records)
    header = struct.pack('<9I', MAGIC, VERSION, len(enum_names), len(symbols) + 1,
                         len(records), len(records), registry_crc, zlib.crc32(payload), len(payload))
    return header + payload, mapping, registry_crc, enum_names


def emit_headers(root: Path, mapping: list[int], registry_crc: int, enum_names: list[str]) -> None:
    _, original_enum = resource_enum(root)
    header = '// Shared stable 1073 resource slots. Generated; do not renumber.\n#pragma once\n#include <cstdint>\nnamespace Sexy\n{\n'
    header += '    enum class ResourceId : int\n    {\n'
    header += ''.join(f'        {name}_ID = {index},\n' for index, name in enumerate(enum_names))
    header += '        RESOURCE_ID_MAX = 879\n    };\n'
    header += '    inline constexpr unsigned RESOURCE_SLOT_NONE = 0xFFFFFFFFu;\n}\n'
    target = root / 'pvzPerf/Sexy.TodLib/generated/ResourceId.h'
    write_changed(target, header)
    resources = root / 'pvzPerf/Resources.h'
    text = resources.read_text(encoding='utf-8')
    if 'enum class ResourceId' in text:
        text = text.replace(original_enum, '')
        text = text.replace('#include <cstdint>', '#include <cstdint>\n#include "Sexy.TodLib/generated/ResourceId.h"', 1)
        write_changed(resources, text)
    kinds = [0 if name.startswith('IMAGE_') or name == 'FONT_IMAGE_HOUSEOFTERROR28' else 1 if name.startswith('SOUND_') else 2 for name in enum_names]
    slot_count = max(slot for slot in mapping if slot != NONE) + 1
    output = ['// Generated numeric image bindings; no logical name registry.', '#pragma once', '#include <cstdint>',
              f'inline constexpr std::uint32_t IMAGE_SYMBOL_REGISTRY_CRC = 0x{registry_crc:08X}u;',
              f'inline constexpr unsigned NUMERIC_RESOURCE_SLOT_COUNT = {slot_count};',
              'inline constexpr unsigned char gNumericResourceKinds[879] = {']
    for start in range(0, len(kinds), 32):
        output.append('    ' + ', '.join(str(value) for value in kinds[start:start + 32]) + ',')
    output += ['};', 'constexpr unsigned ResourceKindForSlot(unsigned slot) noexcept', '{',
               '    return slot < 879 ? gNumericResourceKinds[slot] : 0u;', '}',
               f'inline constexpr unsigned gImageSymbolResourceSlots[{len(mapping)}] = {{']
    for start in range(0, len(mapping), 16):
        output.append('    ' + ', '.join('0xFFFFFFFFu' if v == NONE else f'{v}u' for v in mapping[start:start + 16]) + ',')
    output += ['};', 'constexpr unsigned ResourceSlotForImageSymbol(unsigned symbol) noexcept', '{',
               f'    return symbol < {len(mapping)} ? gImageSymbolResourceSlots[symbol] : 0xFFFFFFFFu;', '}']
    write_changed(root / 'pvzPerf/Sexy.TodLib/generated/NumericResourceBindings.h',
                  '\n'.join(output) + '\n')


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--root', type=Path, default=ROOT)
    ap.add_argument('--archive', type=Path, default=ROOT / 'out/x64-win32-dx12/Release/main.pak64')
    ap.add_argument('--authoring', type=Path, help='ordered JSON resource author manifest')
    ap.add_argument('--sidecar', type=Path)
    ap.add_argument('--output', type=Path)
    ap.add_argument('--headers', action='store_true')
    ap.add_argument('--verify', action='store_true', help='compare with existing output without writing')
    args = ap.parse_args()
    authoring = args.authoring or args.root / 'assets/definitions/resources.json'
    sidecar = args.sidecar or args.root / 'pvzPerf/Sexy.TodLib/generated/image_symbol_ids.bin'
    output = args.output or args.archive.parent / 'compiled/resources.compiled'
    with zipfile.ZipFile(args.archive) as archive:
        data, mapping, crc, names = compile_manifest(args.root, authoring.read_bytes(), archive.namelist(), sidecar)
    if args.verify:
        if output.read_bytes() != data:
            raise ValueError(f'Numeric manifest is stale: {output}')
    else:
        output.parent.mkdir(parents=True, exist_ok=True)
        output.write_bytes(data)
        if args.headers:
            emit_headers(args.root, mapping, crc, names)
    values = struct.unpack_from('<9I', data)
    print(f'base={values[2]} image-symbols={values[3]-1} descriptor-slots={values[4]} bytes={len(data)} registry-crc={crc:08X}')
    print(output)
    return 0


if __name__ == '__main__':
    raise SystemExit(main())
