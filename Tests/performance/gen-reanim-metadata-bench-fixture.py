"""Verify IDT4/IDT5 reanim files offline and emit a standalone benchmark fixture.

Reads authored binary records and offline track tables only. Never builds or runs
an executable. --verify-only writes nothing; normal output belongs in a temporary
benchmark build directory, not in game runtime data.
"""
import argparse
import hashlib
import json
import math
import re
import struct
import sys
import zlib
from pathlib import Path

sys.dont_write_bytecode = True
DEFAULT_OLD = Path('C:/Users/Administrator/AppData/Local/Temp/pvz-strings-baseline-20261010/compiled/reanim')
DEFAULT_NEW = Path('C:/Users/Administrator/CLionProjects/codex/openPvz/.generated/rootcorpus/out-idt5-final-20261010')
DEFAULT_PROJECT = Path(__file__).resolve().parents[2]


def need(ok, message):
    if not ok:
        raise ValueError(message)


class Reader:
    def __init__(self, data, label):
        self.data, self.at, self.label = data, 0, str(label)

    def take(self, count):
        need(0 <= count <= len(self.data) - self.at, f'{self.label}: truncated at {self.at}')
        result = self.data[self.at:self.at + count]
        self.at += count
        return result

    def u32(self):
        return struct.unpack('<I', self.take(4))[0]

    def text(self):
        result = self.take(self.u32())
        need(b'\0' not in result, f'{self.label}: embedded text NUL')
        result.decode('utf-8')
        return result

    def end(self):
        need(self.at == len(self.data), f'{self.label}: trailing bytes at {self.at}')


def table_contract(path, header_path):
    data = path.read_bytes()
    r = Reader(data, path)
    need(r.u32() == 0x324C4254, 'Track table must be TBL2')
    count = r.u32()
    entries, mapping = [], bytearray()
    for ident in range(1, count + 1):
        need(r.u32() == ident, 'Track IDs must ascend from 1')
        folded, display = r.text(), r.text()
        r.u32()  # Offline occurrence count is not part of the mapping checksum.
        need(folded and folded == folded.lower(), 'Invalid folded track label')
        folded.decode('ascii')
        display.decode('ascii')
        entries.append((ident, folded, display))
        mapping += struct.pack('<I', ident)
        for value in (folded, display):
            mapping += struct.pack('<I', len(value)) + value
    r.end()
    need([e[1] for e in entries] == sorted(set(e[1] for e in entries)), 'Nonunique/unsorted labels')
    header = header_path.read_text('utf-8')
    body = re.search(r'enum class ReanimTrackId[^\{]*\{(.*?)\};', header, re.S)
    need(body is not None, 'Missing numeric track enum')
    enum = dict((label, int(ident)) for label, ident in re.findall(r'\b(\w+)\s*=\s*(\d+)', body[1]))
    need(enum.get('None') == 0 and set(enum.values()) == set(range(count + 1)), 'Enum ID/zero contract differs')
    header_count = re.search(r'PVZ_REANIM_TRACK_ID_COUNT\s*=\s*(\d+)', header)
    header_hash = re.search(r'PVZ_REANIM_TRACK_TABLE_HASH\s*=\s*(\d+)', header)
    checksum = zlib.crc32(mapping)
    need(header_count and int(header_count[1]) == count, 'Numeric ID count differs')
    need(header_hash and int(header_hash[1]) == checksum, 'Numeric table checksum differs')
    labels = set()
    for ident, folded, display in entries:
        label = re.sub(r'[^a-zA-Z_0-9]', '_', display.decode('ascii'))
        if label[0].isdigit():
            label = '_' + label
        if label in labels:
            suffix = 2
            while label + '_' + str(suffix) in labels:
                suffix += 1
            label += '_' + str(suffix)
        labels.add(label)
        need(enum.get(label) == ident, f'Numeric label differs: {label}')
    attacher = [ident for ident, name, _ in entries if name.startswith(b'attacher__')]
    need(attacher == list(range(min(attacher), max(attacher) + 1)), 'Attacher family is not contiguous')
    need(re.search(r'return\s+static_cast<std::uint32_t>\(theId\)\s*>=\s*static_cast<std::uint32_t>\(mLo\)\s*&&\s*static_cast<std::uint32_t>\(theId\)\s*<\s*static_cast<std::uint32_t>\(mHi\)', header), 'Expected half-open range')
    range_match = re.search(r'ReanimTrackIdRange\s+attacher__\s*\{ReanimTrackId::(\w+),\s*ReanimTrackId::(\w+)\}', header)
    need(range_match and (enum[range_match[1]], enum[range_match[2]]) == (min(attacher), max(attacher) + 1), 'Attacher endpoints differ')
    return entries, checksum, (min(attacher), max(attacher) + 1), len(mapping), data


def parse_record(path, version, contract, image_max, type_count):
    entries, table_hash, bounds = contract
    data = path.read_bytes()
    r = Reader(data, path)
    need(r.u32() == 0xDEADFED7, f'{path}: invalid v4 cookie')
    size, crc = r.u32(), r.u32()
    payload = r.take(size)
    r.end()
    need(zlib.crc32(payload) == crc, f'{path}: CRC mismatch')
    b = Reader(payload, path)
    need(b.u32() == (0x34544449 if version == 4 else 0x35544449), f'{path}: expected IDT{version}')
    hashes = (b.u32(), b.u32(), b.u32())
    need(hashes[0] == table_hash, f'{path}: track hash mismatch')
    fps, count = b.u32(), b.u32()
    need(math.isfinite(struct.unpack('<f', struct.pack('<I', fps))[0]) and struct.unpack('<f', struct.pack('<I', fps))[0] > 0, 'Invalid FPS')
    need(0 < count <= 256, f'{path}: unsupported track count')
    tracks = []
    for _ in range(count):
        ident, frames, element = b.u32(), b.u32(), b.u32()
        mode = b.u32() if version == 5 else None
        need(ident <= len(entries) and frames > 0 and element == 32, f'{path}: invalid track header')
        need(mode in (None, 0, 1), f'{path}: invalid text mode')
        is_attacher = bounds[0] <= ident < bounds[1]
        need(not is_attacher or mode != 1, f'{path}: routing caption mode')
        values = b.take(frames * 32)
        need(all(math.isfinite(v[0]) for v in struct.iter_unpack('<f', values)), f'{path}: nonfinite transform')
        tracks.append(dict(id=ident, frames=frames, mode=mode, values=values, refs=[], texts=[], attacher=is_attacher))
    for track in tracks:
        for _ in range(track['frames']):
            image, font = b.u32(), b.u32()
            need(image <= image_max and font <= 1, f'{path}: resource ID out of range')
            track['refs'].append((image, font))
            track['texts'].append(b.text() if version == 4 or track['mode'] else b'')
    segment_tracks, previous_track = b.u32(), -1
    need(segment_tracks <= count, f'{path}: too many segment tracks')
    segments = {}
    for _ in range(segment_tracks):
        index, nseg = b.u32(), b.u32()
        need(previous_track < index < count and tracks[index]['attacher'], f'{path}: invalid segment track')
        previous_track = index
        need(0 < nseg <= tracks[index]['frames'], f'{path}: invalid segment count')
        group, end = [], 0
        for _ in range(nseg):
            seg = tuple(b.u32() for _ in range(8 if version == 5 else 6))
            start, finish, target, action, rate, loop = seg[:6]
            need(end <= start < finish <= tracks[index]['frames'], f'{path}: segment bounds')
            need(target == 0xFFFFFFFF or target < type_count, f'{path}: target bound')
            need(action <= len(entries) and loop <= 2 and math.isfinite(struct.unpack('<f', struct.pack('<I', rate))[0]), f'{path}: segment value')
            if version == 5:
                need(seg[6] <= start < finish <= seg[7] <= tracks[index]['frames'], f'{path}: routing-run bounds')
            end = finish
            group.append(seg)
        segments[index] = group
    b.end()
    return dict(bytes=data, hashes=hashes, fps=fps, tracks=tracks, segments=segments)


def source_runs(track):
    # Each explicit nonempty field owns a distinct pointer, even equal text.
    starts = [0] + [i for i, text in enumerate(track['texts']) if text and i != 0]
    result = [None] * track['frames']
    for start, end in zip(starts, starts[1:] + [track['frames']]):
        result[start:end] = [(start, end)] * (end - start)
    return result


def ui_mode(track):
    if track['attacher']:
        return 0
    image = font = 0
    cel, alpha, text = 0.0, 1.0, b''
    caption_runs, runs = set(), source_runs(track)
    for index, ((im, fo), raw) in enumerate(zip(track['refs'], track['texts'])):
        image, font = im or image, fo or font
        text = raw or text
        values = struct.unpack_from('<8f', track['values'], index * 32)
        cel = cel if values[6] == -10000.0 else values[6]
        alpha = alpha if values[7] == -10000.0 else values[7]
        if text and font and not image and cel != -1.0 and alpha > 0:
            need(not text.startswith(b'attacher__'), 'Routing text rendered as caption')
            caption_runs.add(runs[index][0])
    if caption_runs:
        need(all(not text or runs[i][0] in caption_runs for i, text in enumerate(track['texts'])), 'Mixed caption/nonUI text')
    return int(bool(caption_runs))


def inherited_caption(track, keep):
    text, source = b'', -1
    result = []
    for index, raw in enumerate(track['texts']):
        if keep and raw:
            text, source = raw, index
        result.append((text, source))
    return result


def compare(a, b, filename):
    need(a['hashes'] == b['hashes'] and a['fps'] == b['fps'], f'{filename}: headers differ')
    need(len(a['tracks']) == len(b['tracks']), f'{filename}: track count differs')
    stats = dict(tracks=0, frames=0, ui_tracks=0, caption_allocations=0, caption_bytes=0,
                 non_ui_allocations=0, non_ui_bytes=0, old_segments=0, new_segments=0, run_checks=0)
    for old, new in zip(a['tracks'], b['tracks']):
        need((old['id'], old['frames'], old['values'], old['refs']) == (new['id'], new['frames'], new['values'], new['refs']), f'{filename}: numeric float/resource/track values differ')
        mode = ui_mode(old)
        need(new['mode'] == mode, f'{filename}: caption mode differs')
        need(new['texts'] == (old['texts'] if mode else [b''] * old['frames']), f'{filename}: explicit captions differ')
        need(inherited_caption(old, mode) == inherited_caption(new, mode), f'{filename}: caption pointer runs differ')
        stats['tracks'] += 1
        stats['frames'] += old['frames']
        stats['ui_tracks'] += mode
        category = 'caption' if mode else 'non_ui'
        stats[category + '_allocations'] += sum(bool(text) for text in old['texts'])
        stats[category + '_bytes'] += sum(map(len, old['texts']))
    need(a['segments'].keys() == b['segments'].keys(), f'{filename}: segment track membership differs')
    for index in a['segments']:
        old, new = a['segments'][index], b['segments'][index]
        # Compare piecewise meaning; IDT5 may split an old segment at a source run.
        ai = bi = frame = 0
        while ai < len(old) and bi < len(new):
            x, y = old[ai], new[bi]
            need(x[2:6] == y[2:6] and max(x[0], y[0]) == frame, f'{filename}: segment meaning/gap differs')
            frame = min(x[1], y[1])
            ai += x[1] == frame
            bi += y[1] == frame
        need(ai == len(old) and bi == len(new) and frame == a['tracks'][index]['frames'], f'{filename}: segment coverage differs')
        runs = source_runs(a['tracks'][index])
        for seg in new:
            need(all(runs[f] == seg[6:8] for f in range(seg[0], seg[1])), f'{filename}: exact inherited routing run differs')
            stats['run_checks'] += 1
        stats['old_segments'] += len(old)
        stats['new_segments'] += len(new)
    return stats


def cpp_string(value):
    return json.dumps(value, ensure_ascii=True)


def generate(args):
    old_root, new_root = args.old_dir.resolve(), args.new_dir.resolve()
    table_path = (args.track_table or new_root / 'reanim_track_ids.bin').resolve()
    header_path = (args.numeric_header or new_root / 'ReanimTrackId.h').resolve()
    entries, checksum, bounds, mapping_bytes, table_data = table_contract(table_path, header_path)
    image_header = args.project / 'pvzPerf/Sexy.TodLib/generated/ImageSymbolId.h'
    image_max = int(re.search(r'IMAGE_SYMBOL_ID_MAX\s*=\s*(\d+)', image_header.read_text('utf-8'))[1])
    type_map = args.project / 'tools/reanim_type_map.txt'
    type_count = 1 + max(int(value) for value in re.findall(r'^\S+\s+(\d+)\s*$', type_map.read_text('utf-8'), re.M))
    def files(root):
        result = {}
        for path in sorted(root.rglob('*.v4.compiled')):
            key = path.name.casefold()
            need(key not in result, f'Ambiguous record basename: {path.name}')
            result[key] = path
        need(result, f'No .v4.compiled records in {root}')
        return result
    old_files, new_files = files(old_root), files(new_root)
    need(old_files.keys() == new_files.keys(), 'Old/new corpus filenames differ')
    rows, modes, totals, old_digest, new_digest = [], [], {}, hashlib.sha256(), hashlib.sha256()
    hashes = None
    for key, old_path in old_files.items():
        new_path = new_files[key]
        old = parse_record(old_path, 4, (entries, checksum, bounds), image_max, type_count)
        new = parse_record(new_path, 5, (entries, checksum, bounds), image_max, type_count)
        stats = compare(old, new, old_path.name)
        mode_begin = len(modes)
        modes.extend(track['mode'] for track in new['tracks'])
        need(hashes is None or hashes == old['hashes'], 'Mixed resource registries')
        hashes = old['hashes']
        for name, value in stats.items():
            totals[name] = totals.get(name, 0) + value
        for digest, record in ((old_digest, old), (new_digest, new)):
            digest.update(key.encode('ascii') + b'\0' + record['bytes'])
        rows.append(dict(file=old_path.name, old_relative=old_path.relative_to(old_root).as_posix(),
                         new_relative=new_path.relative_to(new_root).as_posix(),
                         mode_begin=mode_begin, old_bytes=len(old['bytes']), new_bytes=len(new['bytes']),
                         old_crc=zlib.crc32(old['bytes'][12:]), new_crc=zlib.crc32(new['bytes'][12:]),
                         old_sha256=hashlib.sha256(old['bytes']).hexdigest(),
                         new_sha256=hashlib.sha256(new['bytes']).hexdigest(), **stats))
    if not args.allow_other_corpus:
        need((len(rows), len(entries), totals['frames'], totals['caption_bytes'], totals['non_ui_allocations']) == (146, 1829, 404950, 962, 257), 'Default authored corpus contract differs; inspect or explicitly use --allow-other-corpus')
    report = dict(status='passed_offline_semantics', benchmark_executed=False,
                  old_format='IDT4 inside v4 container', new_format='IDT5 inside v4 container',
                  old_directory=str(old_root), new_directory=str(new_root), record_count=len(rows),
                  track_id_count=len(entries), track_table_hash=checksum, image_hash=hashes[1], font_hash=hashes[2],
                  image_id_max=image_max, font_id_max=1, target_type_count=type_count,
                  attacher_begin=bounds[0], attacher_end=bounds[1], mapping_bytes=mapping_bytes,
                  old_bytes=sum(row['old_bytes'] for row in rows), new_bytes=sum(row['new_bytes'] for row in rows),
                  old_corpus_sha256=old_digest.hexdigest(), new_corpus_sha256=new_digest.hexdigest(),
                  track_table_sha256=hashlib.sha256(table_data).hexdigest(), **totals, records=rows)
    if not args.verify_only:
        need(args.output is not None and args.manifest is not None, '--output and --manifest are required unless --verify-only')
        lines = ['// Generated benchmark fixture only: no game-header dependency.', '#pragma once',
                 '#include <array>', '#include <cstdint>', 'namespace fixture {',
                 'struct Name { const char* folded; const char* display; std::uint32_t id; };',
                 'struct Record { const char* oldPath; const char* newPath; std::uint64_t oldBytes, newBytes;',
                 '    std::uint32_t oldCrc, newCrc, tracks, frames, captions, nonUi, oldSegments, newSegments, modeBegin; };']
        constants = {'TrackIdCount': len(entries), 'TrackHash': checksum, 'ImageHash': hashes[1], 'FontHash': hashes[2],
                     'ImageMax': image_max, 'FontMax': 1, 'TypeCount': type_count, 'AttacherBegin': bounds[0],
                     'AttacherEnd': bounds[1], 'Frames': totals['frames'], 'Tracks': totals['tracks'],
                     'CaptionAllocations': totals['caption_allocations'], 'NonUiAllocations': totals['non_ui_allocations'],
                     'CaptionBytes': totals['caption_bytes'], 'NonUiBytes': totals['non_ui_bytes'], 'MappingBytes': mapping_bytes}
        lines += [f'inline constexpr std::uint32_t {name} = {value}u;' for name, value in constants.items()]
        lines += [f'inline constexpr char {name}[] = {cpp_string(value)};' for name, value in
                  [('DefaultOldDirectory', old_root.as_posix()), ('DefaultNewDirectory', new_root.as_posix()),
                   ('OldCorpusSha256', old_digest.hexdigest()), ('NewCorpusSha256', new_digest.hexdigest())]]
        lines += ['constexpr bool IsAttacher(std::uint32_t id) noexcept { return id >= AttacherBegin && id < AttacherEnd; }',
                  'static_assert(!IsAttacher(0) && IsAttacher(AttacherBegin) && !IsAttacher(AttacherEnd));',
                  f'inline constexpr std::array<Name, {len(entries)}> Names{{{{']
        lines += [f'    {{{cpp_string(folded.decode("ascii"))}, {cpp_string(display.decode("ascii"))}, {ident}u}},'
                  for ident, folded, display in entries]
        lines += ['}};', f'inline constexpr std::array<Record, {len(rows)}> Records{{{{']
        for row in rows:
            values = [row[k] for k in ('old_bytes', 'new_bytes', 'old_crc', 'new_crc', 'tracks', 'frames',
                                       'caption_allocations', 'non_ui_allocations', 'old_segments', 'new_segments', 'mode_begin')]
            lines.append('    {' + cpp_string(row['old_relative']) + ', ' + cpp_string(row['new_relative']) + ', ' +
                         ', '.join(str(v) + ('ull' if i < 2 else 'u') for i, v in enumerate(values)) + '},')
        lines += ['}};', f'inline constexpr std::array<std::uint32_t, {len(modes)}> TextModes{{{{',
                  '    ' + ', '.join(str(mode) + 'u' for mode in modes), '}};', '} // namespace fixture', '']
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text('\n'.join(lines), encoding='utf-8')
        report['fixture_sha256'] = hashlib.sha256(args.output.read_bytes()).hexdigest()
        args.manifest.parent.mkdir(parents=True, exist_ok=True)
        args.manifest.write_text(json.dumps(report, indent=2) + '\n', encoding='utf-8')
    print(json.dumps({key: value for key, value in report.items() if key != 'records'}, indent=2))
    return report


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--project', type=Path, default=DEFAULT_PROJECT)
    ap.add_argument('--old-dir', type=Path, default=DEFAULT_OLD)
    ap.add_argument('--new-dir', type=Path, default=DEFAULT_NEW)
    ap.add_argument('--track-table', type=Path)
    ap.add_argument('--numeric-header', type=Path)
    ap.add_argument('--output', type=Path)
    ap.add_argument('--manifest', type=Path)
    ap.add_argument('--verify-only', action='store_true')
    ap.add_argument('--allow-other-corpus', action='store_true')
    generate(ap.parse_args())


if __name__ == '__main__':
    main()
