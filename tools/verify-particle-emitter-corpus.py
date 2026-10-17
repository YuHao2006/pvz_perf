"""Verify compact particle records against native gold values and raw track nodes."""
import argparse
import json
import re
import struct
import sys
import zlib
from pathlib import Path

class Reader:
    def __init__(self, data):
        self.data, self.at = data, 0
    def take(self, size):
        assert 0 <= size <= len(self.data) - self.at
        out = self.data[self.at:self.at + size]
        self.at += size
        return out
    def u32(self):
        return struct.unpack('<I', self.take(4))[0]
    def text(self):
        return self.take(self.u32()).decode('ascii')
    def track(self):
        start = self.at
        count = self.u32()
        self.take(count * 20)
        return self.data[start:self.at]
    def end(self):
        assert self.at == len(self.data), (self.at, len(self.data))

def container(path):
    r = Reader(path.read_bytes())
    cookie, length, crc = r.u32(), r.u32(), r.u32()
    payload = r.take(length)
    r.end()
    assert zlib.crc32(payload) == crc
    return cookie, payload

def old_record(path):
    cookie, payload = container(path)
    assert cookie == 0xDEADFED7
    r = Reader(payload)
    assert r.u32() == 0x33504449
    assert r.u32() == 3767703017
    top = r.take(16)
    count = struct.unpack_from('<I', top, 8)[0]
    assert r.u32() == 688
    dumps = [r.take(688) for _ in range(count)]
    emitters = []
    for dump in dumps:
        image, name = r.text(), r.text()
        tracks = [r.track()]
        on_duration = r.text()
        tracks += [r.track() for _ in range(21)]
        fields = []
        for offset in [408, 424]:
            assert r.u32() == 40
            n = struct.unpack_from('<I', dump, offset)[0]
            types = [struct.unpack_from('<I', r.take(40))[0] for _ in range(n)]
            fields.append([(ty, r.track(), r.track()) for ty in types])
        particles = [r.track() for _ in range(16)]
        scalars = list(struct.unpack_from('<6I', dump, 8))
        emitters.append((image, name, on_duration, scalars, tracks, fields, particles))
    assert r.u32() == count
    links = [r.u32() for _ in range(count)]
    r.end()
    return emitters, links

def compact_record(path):
    cookie, payload = container(path)
    assert cookie == 0xDEADFED8
    r = Reader(payload)
    assert r.u32() == 0x35504449
    image_hash, name_hash, count, body_size = [r.u32() for _ in range(4)]
    body = Reader(r.take(body_size))
    emitters = []
    for _ in range(count):
        image = body.u32()
        scalars = [body.u32() for _ in range(6)]
        tracks = [body.track() for _ in range(22)]
        fields = []
        for _ in range(2):
            fields.append([(body.u32(), body.track(), body.track()) for _ in range(body.u32())])
        particles = [body.track() for _ in range(16)]
        emitters.append((image, scalars, tracks, fields, particles))
    body.end()
    assert r.u32() == 0x33544449 and r.u32() == count
    links = [r.u32() for _ in range(count)]
    assert r.u32() == 0x35544449 and r.u32() == count
    names = [r.u32() for _ in range(count)]
    r.end()
    return emitters, links, names, name_hash, image_hash

def verify(args):
    registry = args.image_registry.read_bytes()
    rr = Reader(registry)
    rr.take(4)
    image_names = {}
    for _ in range(rr.u32()):
        ident, n = rr.u32(), rr.u32()
        image_names[rr.take(n).decode('ascii')] = ident
    rr.end()
    records = {}
    gold_paths = {}
    all_names = set()
    for p in sorted(args.gold_v2.glob('*.xml.v2.compiled')):
        filename = p.name[:-len('.xml.v2.compiled')] + '.compiled'
        if filename.casefold() in gold_paths:
            raise ValueError(f'Case-aliased particle gold: {p}')
        gold_paths[filename.casefold()] = p
        records[filename] = old_record(p)
        all_names.update(e[1].lower() for e in records[filename][0] if e[1])
    if not records:
        raise ValueError(f'No offline particle gold records: {args.gold_v2}')
    actual = set()
    for p in args.compiled.glob('*.compiled'):
        if p.name.endswith('.xml.v2.compiled'):
            continue  # Explicit offline gold, never a production output.
        if any(part in p.name.casefold().split('.') for part in ('xml', 'reanim', 'v2', 'v4')):
            raise ValueError(f'Non-production particle output name: {p.name}')
        if p.name.casefold() in actual:
            raise ValueError(f'Case-aliased particle output: {p}')
        actual.add(p.name.casefold())
    if actual != set(gold_paths):
        raise ValueError('Numeric particle outputs must exactly match the offline gold corpus')
    names = {n: i + 1 for i, n in enumerate(sorted(all_names))}
    stream = b''.join(struct.pack('<I', i) + n.encode() + b'\0' for n, i in names.items())
    name_hash = zlib.crc32(stream)
    tracks = unnamed = named = 0
    old_bytes = new_bytes = 0
    for filename, (gold, gold_links) in records.items():
        p = args.compiled / filename
        decoded, links, ids, nh, ih = compact_record(p)
        assert nh == name_hash and ih == zlib.crc32(registry)
        assert links == gold_links and len(decoded) == len(gold)
        for a, b, ident in zip(gold, decoded, ids):
            image, name, on_duration, scalars, system, fields, particle = a
            assert b == (image_names.get(image, 0), scalars, system, fields, particle), filename
            assert ident == names.get(name.lower(), 0)
            named += bool(ident)
            unnamed += not ident
            tracks += len(system) + len(particle) + sum(len(f) * 2 for f in fields)
        old_bytes += gold_paths[filename.casefold()].stat().st_size
        new_bytes += p.stat().st_size
    header = (args.compiled / 'ParticleEmitterName.h').read_text('utf-8')
    assert 'const char' not in header and 'std::string' not in header
    assert 'All' not in header[header.index('enum class'):header.index('struct ParticleEmitterNameRange')]
    assert f'top = {len(names)+1}' in header
    enum_body = header[header.index('enum class'):header.index('struct ParticleEmitterNameRange')]
    identifiers = {symbol: int(number) for symbol, number in
                   re.findall(r'^\s*([a-zA-Z0-9_]+)\s*=\s*(\d+)', enum_body, re.M)}
    folded_by_id = {ident: folded for folded, ident in names.items()}
    for family, first, last in re.findall(
        r'ParticleEmitterNameRange\s+([a-zA-Z0-9_]+)\{ParticleEmitterName::([a-zA-Z0-9_]+), ParticleEmitterName::([a-zA-Z0-9_]+)\}', header):
        lo, hi = identifiers[first], identifiers[last]
        assert lo < hi
        if family == 'All':
            assert (lo, hi) == (0, len(names)+1)
            continue
        assert lo > 0, (family, 'nonempty prefix must not include unnamed')
        group = [folded_by_id[i] for i in range(lo, hi)]
        prefix = group[0]
        for folded in group[1:]:
            while not folded.startswith(prefix):
                prefix = prefix[:-1]
        assert prefix and len(group) >= 2
        assert {ident for folded, ident in names.items() if folded.startswith(prefix)} == set(range(lo, hi))
    report = dict(records=len(records), emitter_name_count=len(names), named_emitters=named,
                  unnamed_emitters=unnamed, raw_track_streams=tracks, name_table_crc32=f'{name_hash:08x}',
                  old_v2_bytes=old_bytes, numeric_bytes=new_bytes, status='passed')
    args.output.write_text(json.dumps(report, indent=2)+'\n','utf-8')
    (args.compiled / 'particle-emitter-names.txt').write_text(
        '0 unnamed\n' + ''.join(f'{i} {n}\n' for n, i in names.items()) + f'{len(names)+1} top (sentinel)\n','utf-8')
    print(json.dumps(report))
    return report


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--gold-v2', type=Path, required=True)
    parser.add_argument('--compiled', type=Path, required=True)
    parser.add_argument('--image-registry', type=Path, required=True)
    parser.add_argument('--output', type=Path, required=True)
    args = parser.parse_args()
    try:
        verify(args)
    except (AssertionError, OSError, ValueError, struct.error) as error:
        print(f'Particle corpus verification failed: {error}', file=sys.stderr)
        return 1
    return 0

if __name__ == '__main__':
    raise SystemExit(main())
