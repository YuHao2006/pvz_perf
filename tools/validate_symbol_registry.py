#!/usr/bin/env python3
"""Validate the image-symbol registry against the compiled reanim corpus.

Every per-frame image string in every .v2.compiled record must resolve to a
registry symbol (else v4 baking would orphan that reference). Font strings
are censused (input to the font mini-registry). Text strings are content,
not symbols — ignored.

Usage: validate_symbol_registry.py <compiled_dir> <image_symbol_dump>
"""
import struct
import sys
from pathlib import Path


def parse_record(path):
    data = path.read_bytes()
    if len(data) < 16:
        return None
    cookie, declared = struct.unpack_from('<II', data, 0)
    payload = data[12:]
    if len(payload) != declared:
        raise SystemExit(f'{path}: payload size mismatch')
    at = 0

    def take32():
        nonlocal at
        v = struct.unpack_from('<I', payload, at)[0]
        at += 4
        return v

    def takestr():
        nonlocal at
        n = take32()
        s = payload[at:at + n]
        at += n
        return s.decode('latin1')

    take32(); take32()  # magic, table hash
    fps_bits, track_count = take32(), take32()
    images, fonts = set(), set()
    for _t in range(track_count):
        take32(); take32(); take32()  # id, frames, elem
        frames = struct.unpack_from('<I', payload, at - 8 + 8)[0] if False else None
        # re-read frames properly: we already consumed (id, frames, elem)
        # — recompute from consumed values is messy; parse again cleanly below.
        break
    # clean two-phase parse
    at = 8
    track_count = struct.unpack_from('<I', payload, at - 4)[0] if False else track_count
    at = 8  # after magic+hash: fps + count consumed as 2 u32 => at=8
    fps_bits = take32()
    track_count = take32()
    for _t in range(track_count):
        tid, frames, elem = take32(), take32(), take32()
        at += frames * 56
        for _f in range(frames * 3):
            s = takestr()
            if _f % 3 == 0 and s:
                images.add(s)
            elif _f % 3 == 1 and s:
                fonts.add(s)
    return images, fonts


def main():
    compiled_dir = Path(sys.argv[1])
    dump = Path(sys.argv[2])
    registry = {ln.strip() for ln in dump.read_text(encoding='utf-8').splitlines() if ln.strip()}
    missing_images, all_fonts = {}, {}
    records = 0
    for rec in sorted(compiled_dir.glob('*.v2.compiled')):
        records += 1
        parsed = parse_record(rec)
        if parsed is None:
            continue
        images, fonts = parsed
        for img in images:
            if img not in registry:
                missing_images.setdefault(img, []).append(rec.stem)
        for f in fonts:
            all_fonts[f] = all_fonts.get(f, 0) + 1
    print(f'records={records} registry={len(registry)}')
    print(f'distinct image refs missing from registry: {len(missing_images)}')
    for img, where in sorted(missing_images.items())[:20]:
        print(f'  MISSING {img}  (in {len(where)} records, e.g. {where[0]})')
    # 语料侧图像全集落盘（注册表生成器的第二输入——运行时 dump 是会话
    # 相关的，Zombie_dancer/Jackson 教训：credits 未跑的会话 dump 缺 39 图）
    out = Path(sys.argv[3]) if len(sys.argv) > 3 else None
    if out:
        all_images = set()
        for rec in sorted(compiled_dir.glob('*.v2.compiled')):
            parsed = parse_record(rec)
            if parsed:
                all_images |= parsed[0]
        out.write_text('\n'.join(sorted(all_images)) + '\n', encoding='utf-8')
        print(f'corpus image set written: {len(all_images)} -> {out}')
    print(f'distinct fonts in corpus: {len(all_fonts)}')
    for f, n in sorted(all_fonts.items()):
        print(f'  font {f} (records: {n})')


if __name__ == '__main__':
    main()
