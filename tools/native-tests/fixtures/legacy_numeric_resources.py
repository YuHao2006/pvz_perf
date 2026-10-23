#!/usr/bin/env python3
"""Frozen NRSC1 compiler for historical container regression fixtures only.

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

ROOT = Path(__file__).resolve().parents[3]
MAGIC = 0x4353524E
VERSION = 1
NONE = 0xFFFFFFFF
PROGRAM, SYSTEM_FONT, REFERENCE_FONT, KEEP_BITS = 1, 2, 4, 8
PALLETIZE, A4, A8, DDS, PURGE, MIN_SUBDIVIDE, AUTO_ALPHA = 16, 32, 64, 128, 256, 512, 1024
PURGE_3D, PURGE_2D, UNAVAILABLE = 2048, 4096, 8192


def binding_registries(production, constant, registries):
    """Decode frozen NRSC1 fake-source registries for container tests."""
    result = {"legacy_fixture": True,
              "slots": constant("NUMERIC_RESOURCE_SLOT_COUNT", "Sexy.TodLib/generated/NumericResourceBindings.h")}
    bindings = production["Sexy.TodLib/generated/NumericResourceBindings.h"]
    for field, array in (("resource_kinds", "gNumericResourceKinds"),
                         ("image_slots", "gImageSymbolResourceSlots")):
        match = re.search(r"\b" + array + r"\[(\d+)\]\s*=\s*\{([^}]*)\}", bindings, re.S)
        if not match:
            raise ValueError(f"Missing registry array: {array}")
        values = [v.strip() for v in match[2].split(",") if v.strip()]
        if len(values) != int(match[1]) or not all(
                re.fullmatch(r"(?:0[xX][0-9A-Fa-f]+|\d+)[uU]?", v) for v in values):
            raise ValueError(f"Invalid registry array: {array}")
        result[field] = [int(v.rstrip("uU"), 0) for v in values]
    if not (result["slots"] >= 879 and len(result["resource_kinds"]) == 879
            and all(v <= 3 for v in result["resource_kinds"])
            and len(result["image_slots"]) == registries["image_max"] + 1
            and result["image_slots"][0] == NONE):
        raise ValueError("Invalid numeric resource binding registries")
    legacy = set()
    for enum in re.findall(
            r"symbol\s*==\s*0\s*&&\s*slot\s*!=\s*static_cast<unsigned>\(ResourceId::(\w+)\)",
            production.get("SexyAppFramework/misc/ResourceManager.cpp", "")):
        match = re.search(r"\b" + enum + r"\s*=\s*(\d+)\s*[,}]",
                          production.get("Sexy.TodLib/generated/ResourceId.h", ""))
        if not match:
            raise ValueError(f"Missing legacy-only image resource enum: {enum}")
        legacy.add(int(match[1]))
    result["legacy_image_slots"] = sorted(legacy)
    mapped = [v for v in result["image_slots"][1:] if v != NONE]
    expected = {slot for slot in range(result["slots"])
                if (slot >= 879 or result["resource_kinds"][slot] == 0) and slot not in legacy}
    if (any(slot >= 879 or result["resource_kinds"][slot] != 0 for slot in legacy)
            or len(mapped) != len(set(mapped)) or set(mapped) != expected):
        raise ValueError("Invalid numeric resource binding registries")
    return result


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


def program_symbols_path(root: Path) -> Path:
    program = root / 'pvzPerf/Sexy.TodLib/ProgramImageSymbols.h'
    return program if program.exists() else root / 'pvzPerf/Sexy.TodLib/generated/ImageSymbolId.h'


def read_symbols(path: Path) -> tuple[list[tuple[int, str]], int]:
    """Read program source IDs, or a historical binary registry for fixtures."""
    data = path.read_bytes()
    if path.suffix.casefold() == '.h':
        text = data.decode('utf-8-sig')
        block = re.search(r'enum\s+class\s+ImageSymbolId\s*:\s*std::uint32_t\s*\{(.*?)\};',
                          text, re.S)
        if not block:
            raise ValueError('Program ImageSymbolId enum not found')
        result = []
        for identifier, number, original in re.findall(
                r'^\s*(\w+)\s*=\s*(\d+)\s*,[ \t]*(?://[ \t]*registry-name:[ \t]*"([^"]+)")?',
                block[1], re.M):
            symbol = int(number)
            if symbol == 0 and identifier == 'None':
                continue
            if symbol != len(result) + 1:
                raise ValueError('Image symbols must preserve dense existing IDs')
            result.append((symbol, original or identifier))
        if not result:
            raise ValueError('Program image symbol enum is empty')
        canonical = bytearray(struct.pack('<II', 0x4953594D, len(result)))
        for symbol, name in result:
            raw_name = name.encode('utf-8')
            canonical.extend(struct.pack('<II', symbol, len(raw_name)))
            canonical.extend(raw_name)
        crc = zlib.crc32(canonical)
        declared = re.search(r'\bIMAGE_SYMBOL_ID_REGISTRY_CRC\s*=\s*(0x[0-9A-Fa-f]+|\d+)[uU]?\s*;', text)
        if declared and int(declared[1], 0) != crc:
            raise ValueError('Program image symbol CRC differs from the declared stable registry')
        return result, crc
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
    code_image_roots(root, dict(symbols),
                     required_names=set(enum_names) - {enum_names[2]})
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
                # ResourceId is a saved, stable slot space. Retiring an image
                # symbol removes its descriptor, never its authoring position.
                continue
            emit(slot, symbol, groups[group_name], kind, flags, ref, variant, path,
                 default_path + a['alphaimage'] if 'alphaimage' in a else '',
                 default_path + a['alphagrid'] if 'alphagrid' in a else '', a.get('image', ''), a)
    if names != enum_names:
        raise ValueError('Author manifest must contain every stable ResourceId')
    next_slot = len(enum_names)
    for symbol, name in symbols:
        if mapping[symbol] != NONE:
            continue
        suffix = name[len('IMAGE_REANIM_'):] if name.startswith('IMAGE_REANIM_') else name[len('IMAGE_'):] if name.upper().startswith('IMAGE_') else ''
        directories = ('reanim', 'images', 'particles') if name.startswith('IMAGE_REANIM_') else ('particles', 'images', 'reanim')
        candidates = [paths[f'{directory}/{suffix}'.lower()] for directory in directories if f'{directory}/{suffix}'.lower() in paths]
        slot = next_slot
        next_slot += 1
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
                         next_slot, len(records), registry_crc, zlib.crc32(payload), len(payload))
    return header + payload, mapping, registry_crc, enum_names


def prune_definition_images(data: bytes, mapping: list[int],
                            code_symbols: set[int],
                            definition_image_symbols: set[int] | None = None, *,
                            retained_image_symbols: set[int] | None = None
                            ) -> tuple[bytes, list[int], list[int], set[int]]:
    """Code roots always survive; known definition-only images need no global copy.

    Production passes retained_image_symbols explicitly: only those symbols and
    code roots retain global descriptors. Compiled font image paths remain
    independent physical references and do not need an unused image descriptor.
    Without that argument, preserve the historical conservative UI policy.
    """
    header = list(struct.unpack_from('<9I', data))
    base = header[2]
    records, kinds, removed = [], [3] * base, set()
    new_mapping = [NONE] * len(mapping)
    next_slot = base
    offset = 36
    for _ in range(header[5]):
        length = struct.unpack_from('<I', data, offset)[0]
        record = bytearray(data[offset + 4:offset + 4 + length])
        offset += 4 + length
        slot, symbol, _, kind = struct.unpack_from('<4I', record)
        path_length = struct.unpack_from('<I', record, 28)[0]
        path = record[32:32 + path_length].decode('utf-8').casefold()
        ui = (slot < base and not path.startswith(('reanim/', 'particles/'))
              and (definition_image_symbols is None or symbol not in definition_image_symbols))
        retained = (symbol in code_symbols or
                    (symbol in retained_image_symbols if retained_image_symbols is not None else ui))
        if kind == 0 and symbol and not retained:
            removed.add(symbol)
            continue
        if slot < base:
            kinds[slot] = kind
        else:
            slot = next_slot
            next_slot += 1
            struct.pack_into('<I', record, 0, slot)
        if symbol:
            new_mapping[symbol] = slot
        records.append(struct.pack('<I', len(record)) + record)
    payload = b''.join(records)
    header[4] = next_slot
    header[5], header[7], header[8] = len(records), zlib.crc32(payload), len(payload)
    return struct.pack('<9I', *header) + payload, new_mapping, kinds, removed


def production_image_roots(symbol_names: dict[int, str], code_symbols: set[str]) -> set[str]:
    """Keep actual consumers plus the intentionally retained QuickPlay artwork.

    Font layer bitmaps are referenced by compiled font records. Their file-path
    closure survives independently of declaration-only FONT_IMAGE_* globals.
    """
    registered = set(symbol_names.values())
    if not code_symbols <= registered:
        raise ValueError(f"Code image roots absent from registry: {sorted(code_symbols - registered)}")
    return code_symbols | {name for name in registered
                           if name.startswith("IMAGE_QUICKPLAY_")
                           or name == "IMAGE_SELECTORSCREEN_MOREWAYSTOPLAY_BG"}


def code_image_roots(root: Path, symbol_names: dict[int, str], *,
                     required_names: set[str] | None = None) -> set[str]:
    """Find real uses, including legacy globals, ResourceId wrappers and tables."""
    exact = set(symbol_names.values())
    enum_path = program_symbols_path(root)
    aliases = ({identifier: symbol_names[int(number)]
                for identifier, number in re.findall(r'^\s*(\w+)\s*=\s*(\d+),',
                    enum_path.read_text(encoding='utf-8'), re.M) if int(number) in symbol_names}
               if enum_path.exists() else {})
    roots = set()
    for source in (root / 'pvzPerf').rglob('*'):
        if source.suffix not in {'.cpp', '.h', '.hpp', '.inl'} or 'generated' in source.parts:
            continue
        if source.name in {'Resources.cpp', 'Resources.h', 'ProgramImageSymbols.h'}:
            continue
        # Import lazily: the standalone compiler has no package-audit dependency.
        import build_numeric_runtime_pak64 as pak
        text = pak.clean_comments(source.read_text(encoding='utf-8-sig'))
        for token in re.findall(r'\b(?:IMAGE_|FONT_IMAGE_)\w+', text):
            name = token[:-3] if token.endswith('_ID') else token
            name = aliases.get(name, name)
            if required_names is not None and name in required_names and name not in exact:
                raise ValueError(f'Code image absent from program symbol registry: {name} ({source})')
            if name in exact:
                roots.add(name)
    return roots


def emit_headers(root: Path, mapping: list[int], registry_crc: int, enum_names: list[str],
                 resource_kinds: list[int] | None = None) -> None:
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
    kinds = resource_kinds
    if kinds is None:
        mapped_slots = set(mapping)
        kinds = [0 if name.startswith('IMAGE_') or name == 'FONT_IMAGE_HOUSEOFTERROR28'
                 else 1 if name.startswith('SOUND_') else 2 for name in enum_names]
        kinds = [3 if kind == 0 and slot not in mapped_slots and slot != 2 else kind
                 for slot, kind in enumerate(kinds)]
    slot_count = max(len(enum_names), max((slot + 1 for slot in mapping if slot != NONE), default=0))
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
    ap.add_argument('--sidecar', type=Path, help='program symbol header (historical .bin accepted for fixtures)')
    ap.add_argument('--output', type=Path)
    ap.add_argument('--headers', action='store_true')
    ap.add_argument('--verify', action='store_true', help='compare with existing output without writing')
    args = ap.parse_args()
    authoring = args.authoring or args.root / 'assets/definitions/resources.json'
    sidecar = args.sidecar or program_symbols_path(args.root)
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
