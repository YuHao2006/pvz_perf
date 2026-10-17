#!/usr/bin/env python3
"""A/B validate v4 records against their v2 twins (two-phase migration gate 1).

For every module: parse v2 (strings) and v4 (baked u32 symbols) side by side;
verify per-frame floats identical, image symbol == registry id of v2's image
string, font likewise, text identical, IDT3 segment tables identical.

Usage: validate_v4_records.py <dir-with-both> <image_sidecar> <font_sidecar>
"""
import struct
import sys
from pathlib import Path


def load_sidecar(path):
    data = Path(path).read_bytes()
    at = 0
    def take32():
        nonlocal at
        v = struct.unpack_from('<I', data, at)[0]; at += 4; return v
    magic, count = take32(), take32()
    assert magic == 0x4953594D, hex(magic)
    by_id, by_name = {}, {}
    for _ in range(count):
        i, ln = take32(), take32()
        name = data[at:at+ln].decode('latin1'); at += ln
        by_id[i] = name; by_name[name] = i
    return by_id, by_name


def parse_common(payload, magic):
    at = 0
    def take32():
        nonlocal at
        v = struct.unpack_from('<I', payload, at)[0]; at += 4; return v
    m = take32()
    assert m == magic, hex(m)
    track_hash = take32()
    extra = [take32(), take32()]  # v2: none; v4: img/font hashes (read later properly)
    return at, track_hash


def parse_v2(path):
    data = path.read_bytes()
    payload = data[12:]
    at = 0
    def take32():
        nonlocal at
        v = struct.unpack_from('<I', payload, at)[0]; at += 4; return v
    def takestr():
        nonlocal at
        n = take32(); s = payload[at:at+n]; at += n; return s.decode('latin1')
    assert take32() == 0x33544449  # IDT3
    track_hash = take32()
    fps_bits, track_count = take32(), take32()
    tracks = []
    for _ in range(track_count):
        tid, frames, elem = take32(), take32(), take32()
        floats = [struct.unpack_from('<8f', payload, at + i*56) for i in range(frames)]
        at += frames * 56
        strs = []
        for _f in range(frames):
            strs.append((takestr(), takestr(), takestr()))
        tracks.append((tid, frames, floats, strs))
    segs_at = at
    seg_pairs = []
    seg_track_count = take32()
    for _ in range(seg_track_count):
        ti, cnt = take32(), take32()
        blob = payload[at:at+cnt*24]
        at += cnt*24
        seg_pairs.append((ti, blob))
    return dict(track_hash=track_hash, fps=fps_bits, tracks=tracks, segs=seg_pairs)


def parse_v4(path):
    data = path.read_bytes()
    cookie = struct.unpack_from('<I', data, 0)[0]
    assert cookie == 0xDEADFED7, hex(cookie)
    payload = data[12:]
    at = 0
    def take32():
        nonlocal at
        v = struct.unpack_from('<I', payload, at)[0]; at += 4; return v
    def takestr():
        nonlocal at
        n = take32(); s = payload[at:at+n]; at += n; return s.decode('latin1')
    assert take32() == 0x34544449  # IDT4
    track_hash = take32()
    img_hash, font_hash = take32(), take32()
    fps_bits, track_count = take32(), take32()
    tracks = []
    for _ in range(track_count):
        tid, frames, elem = take32(), take32(), take32()
        assert elem == 32
        floats = [struct.unpack_from('<8f', payload, at + i*32) for i in range(frames)]
        at += frames * 32
        tracks.append([tid, frames, floats, None])
    # 第二阶段：不重读轨道头，直接每帧 {img u32, font u32, text str}
    for track in tracks:
        frames = track[1]
        syms = []
        for _f in range(frames):
            img, font = take32(), take32()
            text = takestr()
            syms.append((img, font, text))
        track[3] = syms
    tracks = [tuple(t) for t in tracks]
    seg_pairs = []
    seg_track_count = take32()
    for _ in range(seg_track_count):
        ti, cnt = take32(), take32()
        blob = payload[at:at+cnt*24]
        at += cnt*24
        seg_pairs.append((ti, blob))
    return dict(track_hash=track_hash, fps=fps_bits, tracks=tracks, segs=seg_pairs,
                img_hash=img_hash, font_hash=font_hash)


def main():
    d = Path(sys.argv[1])
    img_by_id, img_by_name = load_sidecar(sys.argv[2])
    font_by_id, font_by_name = load_sidecar(sys.argv[3])
    n = 0
    errors = 0
    for v4 in sorted(d.glob('*.reanim.v4.compiled')):
        v2 = v4.with_name(v4.name.replace('.v4.', '.v2.'))
        a, b = parse_v2(v2), parse_v4(v4)
        n += 1
        tag = v4.name
        if a['track_hash'] != b['track_hash'] or a['fps'] != b['fps']:
            print(f'{tag}: HEADER MISMATCH'); errors += 1; continue
        if len(a['tracks']) != len(b['tracks']):
            print(f'{tag}: TRACK COUNT'); errors += 1; continue
        for (t1, f1, fl1, strs1), (t2, f2, fl2, syms2) in zip(a['tracks'], b['tracks']):
            if t1 != t2 or f1 != f2:
                print(f'{tag}: track {t1} meta'); errors += 1; continue
            for i, (fa, fb) in enumerate(zip(fl1, fl2)):
                if fa != fb:
                    print(f'{tag}: track {t1} frame {i} floats'); errors += 1
            for i, ((img_s, font_s, text_s), (img_id, font_id, text_v4)) in enumerate(zip(strs1, syms2)):
                if img_id != (0 if not img_s else img_by_name.get(img_s, -1)):
                    print(f'{tag}: track {t1} frame {i} image sym {img_id} vs "{img_s}"'); errors += 1
                if font_id != (0 if not font_s else font_by_name.get(font_s, -1)):
                    print(f'{tag}: track {t1} frame {i} font sym'); errors += 1
                if text_s != text_v4:
                    print(f'{tag}: track {t1} frame {i} text'); errors += 1
        if a['segs'] != b['segs']:
            print(f'{tag}: IDT3 segments differ'); errors += 1
        if errors:
            break
    print(f'validated {n} modules, errors={errors}')
    sys.exit(1 if errors else 0)


if __name__ == '__main__':
    main()
