"""Read reanim v4 records structurally and classify stored frame text."""
import argparse
import collections
import json
import re
import struct
import zlib
from pathlib import Path

class Reader:
    def __init__(self, data): self.data, self.at = data, 0
    def take(self, n):
        assert 0 <= n <= len(self.data)-self.at
        b = self.data[self.at:self.at+n]; self.at += n; return b
    def u32(self): return struct.unpack('<I', self.take(4))[0]
    def text(self): return self.take(self.u32()).decode('utf-8')
    def end(self): assert self.at == len(self.data), (self.at, len(self.data))

def audit(records, header):
    h = header.read_text('utf-8')
    names = {int(i):display for folded,display,ident in re.findall(
        r'\{"([^"]*)", "([^"]*)", ReanimTrackId::([A-Za-z0-9_]+)\}', h)
        for i in [re.search(r'^\s*'+re.escape(ident)+r'\s*=\s*(\d+)',h,re.M).group(1)]}
    result = dict(records=0, tracks=0, frames=0, routing_text_bytes=0, caption_text_bytes=0,
                  marker_text_bytes=0, routing_frames=0, caption_frames=0, marker_frames=0,
                  track_table_hashes=[], examples={})
    hashes = set()
    examples = collections.defaultdict(list)
    for p in sorted(records.glob('*.v4.compiled')):
        r = Reader(p.read_bytes())
        assert r.u32() == 0xDEADFED7
        n, crc = r.u32(), r.u32()
        payload = r.take(n);r.end();assert zlib.crc32(payload)==crc
        b = Reader(payload)
        assert b.u32()==0x34544449
        hashes.add(b.u32());b.u32();b.u32();b.u32()
        count=b.u32();tracks=[]
        for _ in range(count):
            ident, frames, element=b.u32(),b.u32(),b.u32()
            assert element==32
            values=[struct.unpack('<8f',b.take(32)) for _ in range(frames)]
            tracks.append((ident,frames,values))
        for ident,frames,values in tracks:
            name=names.get(ident,'unnamed')
            inherited_font=0
            for fr in range(frames):
                image,font,text=b.u32(),b.u32(),b.text()
                if font:inherited_font=font
                if not text:continue
                if name.lower().startswith('attacher__'):kind='routing'
                elif inherited_font:kind='caption'
                else:kind='marker'
                result[kind+'_text_bytes']+=len(text.encode('utf-8'))
                result[kind+'_frames']+=1
                if len(examples[kind])<18 and (p.name,name,text) not in examples[kind]:
                    examples[kind].append((p.name,name,text))
        seg_tracks=b.u32()
        for _ in range(seg_tracks):
            index,nseg=b.u32(),b.u32()
            assert index<count
            b.take(nseg*24)
        b.end()
        result['records']+=1;result['tracks']+=count
        result['frames']+=sum(t[1] for t in tracks)
    result['examples']=dict(examples)
    result['track_table_hashes']=[f'{x:08x}' for x in sorted(hashes)]
    return result

if __name__=='__main__':
    ap=argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--records',type=Path,required=True)
    ap.add_argument('--header',type=Path,required=True)
    ap.add_argument('--output',type=Path,required=True)
    args=ap.parse_args()
    report=audit(args.records,args.header)
    args.output.write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n','utf-8')
    print(json.dumps(report,ensure_ascii=False))
