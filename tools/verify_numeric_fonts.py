#!/usr/bin/env python3
"""Offline font audit: independent binary decoder and authored-corpus oracle.

No game/test executable is launched. The source oracle uses Python literal
parsing for the 98 authored Define lists instead of the compiler DSL parser.
Font membership comes only from the JSON resource build manifest.
"""
from __future__ import annotations

import argparse
import ast
import copy
import ctypes
import re
import shlex
import struct
import zlib
import zipfile
from pathlib import Path, PurePosixPath

import compile_numeric_fonts as compiler
from compile_numeric_resources import read_authoring as read_resource_build_manifest


FONT_COUNT = 20


def manifest_font_sources(data: bytes) -> set[str]:
    manifest = read_resource_build_manifest(data)
    default_path, default_prefix = '', ''
    resources = {}
    for group in manifest['children']:
        for node in group['children']:
            attrs = node['attrs']
            if node['tag'] == 'SetDefaults':
                if 'path' in attrs:
                    default_path = attrs['path'].replace('\\', '/').rstrip('/') + '/'
                default_prefix = attrs.get('idprefix', default_prefix).rstrip('/')
                continue
            path = attrs['path'].replace('\\', '/')
            name = default_prefix + attrs.get('id', PurePosixPath(path).stem)
            if name in resources:
                raise ValueError(f'Duplicate resource build ID: {name}')
            resources[name] = (node['tag'], path if path.startswith('!') else default_path + path)

    sources = set()
    for name, (kind, _) in resources.items():
        if kind != 'Font':
            continue
        visited = set()
        while True:
            if name in visited:
                raise ValueError(f'Cyclic font reference: {name}')
            visited.add(name)
            kind, path = resources[name]
            if kind != 'Font':
                raise ValueError(f'Font reference does not name a font: {name}')
            if path == '!program':
                break
            if path.startswith('!ref:'):
                name = path[5:]
                if name not in resources:
                    raise ValueError(f'Unknown font reference: {name}')
                continue
            if path.startswith('!'):
                raise ValueError(f'Unsupported font control token: {path}')
            path = compiler.norm(path)
            if (not path.startswith('data/') or not path.endswith('.txt') or ':' in path
                    or any(part in ('', '.', '..') for part in path.split('/'))):
                raise ValueError(f'Invalid font source path in resource build manifest: {path}')
            sources.add(path)
            break
    if len(sources) != FONT_COUNT:
        raise ValueError(f'Resource build manifest must identify exactly {FONT_COUNT} physical fonts')
    if len({PurePosixPath(path).name for path in sources}) != FONT_COUNT:
        raise ValueError('Font source basename collision')
    return sources


class Reader:
    def __init__(self, data):
        self.data, self.pos = data, 0

    def take(self, fmt):
        size = struct.calcsize(fmt)
        if self.pos + size > len(self.data):
            raise ValueError('Truncated numeric font')
        values = struct.unpack_from(fmt, self.data, self.pos)
        self.pos += size
        return values[0] if len(values) == 1 else list(values)

    def path(self):
        size = self.take('<I')
        if size > 4096 or self.pos + size > len(self.data):
            raise ValueError('Invalid image path length')
        value = self.data[self.pos:self.pos+size].decode('utf-8')
        self.pos += size
        if not value or '\0' in value:
            raise ValueError('Invalid image path')
        return value


def decode_numeric_font(data: bytes):
    if len(data) < 32 or len(data) > 16*1024*1024:
        raise ValueError('Invalid font size')
    reader = Reader(data)
    magic, version, size, crc, point, maps, layers, tags = reader.take('<4Ii3I')
    if magic != 0x544E464E or version != 1 or size != len(data)-32:
        raise ValueError('Invalid numeric font header')
    if zlib.crc32(data[32:]) != crc or maps > 256 or not 0 < layers <= 1024 or tags > 4096:
        raise ValueError('Invalid numeric font payload')
    char_map = {}
    for _ in range(maps):
        from_, to = reader.take('<II')
        if from_ > 255 or to > 255 or from_ in char_map:
            raise ValueError('Invalid character map')
        char_map[from_] = to
    output, layer_ids = [], set()
    for _ in range(layers):
        id_ = reader.take('<I')
        if id_ >= layers or id_ in layer_ids:
            raise ValueError('Invalid layer ID')
        layer_ids.add(id_)
        image = reader.path()
        tag_lists = []
        for _ in range(2):
            count = reader.take('<I')
            if count > 4096:
                raise ValueError('Invalid tag count')
            values = [reader.take('<I') for _ in range(count)]
            if any(v >= tags for v in values):
                raise ValueError('Invalid tag ID')
            tag_lists.append(values)
        values = reader.take('<22i')
        if values[0] not in (-1, 0, 1) or values[13] not in (0, 1):
            raise ValueError('Invalid layer flags')
        glyph_count = reader.take('<I')
        if glyph_count > 128:
            raise ValueError('Invalid glyph count')
        glyphs = {}
        for _ in range(glyph_count):
            ch, *values_ = reader.take('<I8iI')
            kern_count = values_.pop()
            if ch >= 128 or ch in glyphs or kern_count > 256:
                raise ValueError('Invalid glyph record')
            kern = {}
            for _ in range(kern_count):
                next_, offset = reader.take('<Ii')
                if next_ > 255 or next_ in kern:
                    raise ValueError('Invalid kerning record')
                kern[next_] = offset
            glyphs[ch] = dict(rect=values_[:4],offset=values_[4:6],width=values_[6],order=values_[7],kern=kern)
        output.append(dict(id=id_,image=image,required=tag_lists[0],excluded=tag_lists[1],
                           scalars=values[:14],mult=values[14:18],add=values[18:22],glyphs=glyphs))
    if reader.pos != len(data):
        raise ValueError('Trailing font bytes')
    return dict(point_size=point,char_map=char_map,layers=output)


def source_oracle(font):
    text = font.raw.decode('latin1').replace('\r', '')
    defines = {}
    pattern = re.compile(r'^Define\s+(\w+)\s+(\(.*?\))\s*;', re.M | re.S)
    for match in pattern.finditer(text):
        defines[match.group(1).upper()] = ast.literal_eval(match.group(2))
    assert len(defines) == len(font.define_ids)
    # Authored command lines are scalar setters or lists/define references.
    text = pattern.sub('', text)
    layers, layer_map, point = [], {}, 0
    for line in text.split(';'):
        line = line.strip()
        if not line:
            continue
        words = shlex.split(line)
        command, name = words[0].lower(), words[1]
        if command == 'createlayer':
            layer = dict(name=name.upper(),image='',required=[],excluded=[],
                         scalars=[-1,0,0,0,-1,-1,0,0,0,0,0,0,len(layers),1],
                         mult=[255]*4,add=[0]*4,glyphs={})
            layers.append(layer)
            layer_map[name.upper()] = layer
        elif command == 'setdefaultpointsize':
            point = int(name)
        else:
            layer = layer_map[name.upper()]
            if command == 'layersetimage':
                layer['image'] = str(PurePosixPath(font.source_path).parent / words[2])
            elif command == 'layersetcolormult':
                value = int(words[2],0)
                layer['mult']=[(value>>16)&255,(value>>8)&255,value&255,((value>>24)&255) or 255]
            elif command in ('layersetascent','layersetascentpadding','layersetlinespacingoffset','layersetpointsize'):
                index={'layersetascent':7,'layersetascentpadding':8,'layersetlinespacingoffset':11,'layersetpointsize':6}[command]
                layer['scalars'][index]=int(words[2])
            elif command in ('layersetcharwidths','layersetimagemap','layersetcharoffsets','layersetkerningpairs'):
                if words[2].upper() in defines:
                    chars, values = defines[words[2].upper()],defines[words[3].upper()]
                else:
                    match = re.fullmatch(r'LayerSetCharWidths\s+\w+\s+(\(.*\))\s+(\(.*\))',line,re.I)
                    assert match, line
                    chars, values = ast.literal_eval(match.group(1)),ast.literal_eval(match.group(2))
                    if isinstance(chars,str): chars=(chars,)
                    if isinstance(values,int): values=(values,)
                assert len(chars)==len(values)
                for character,value in zip(chars,values):
                    # All non-ASCII authored characters are single invalid UTF8
                    # bytes and therefore write the existing parser's miss slot.
                    if not character.isascii():
                        continue
                    key=ord(character[0])
                    glyph=layer['glyphs'].setdefault(key,dict(rect=[0]*4,offset=[0]*2,width=0,order=0,kern={}))
                    if command=='layersetcharwidths': glyph['width']=value
                    elif command=='layersetimagemap': glyph['rect']=list(value)
                    elif command=='layersetcharoffsets': glyph['offset']=list(value)
                    else: glyph['kern'][ord(character[1])]=value
                if command=='layersetimagemap':
                    layer['scalars'][10]=max([0]+[g['rect'][3]+g['offset'][1] for g in layer['glyphs'].values()])
            else:
                raise AssertionError(f'Authored oracle needs explicit support for {command}')
    ids={name:i for i,name in enumerate(sorted(layer_map))}
    for layer in layers:
        layer['id']=ids[layer.pop('name')]
    return dict(point_size=point,char_map={},layers=layers)


def synthetic_commands():
    raw=b'''# every supported command, alias copy, tags, map first insertion, clone order
Define Chars ('A' 'B');
Define Widths (5 6);
Define Alias Widths;
Define Widths (20 30);
CreateHorzSpanRectList Rects (1 2 99 8) Alias;
SetDefaultPointSize 12;
SetCharMap ('a' 'a') ('A' 'B');
CreateLayer Z;
LayerSetImage Z 'fixture';
LayerRequireTags Z ('Shadow');
LayerExcludeTags Z ('Disabled');
LayerPointRange Z 10 18;
LayerSetPointSize Z 12;
LayerSetHeight Z 19;
LayerSetDrawMode Z 1;
LayerSetColorMult Z (0.5 1 0 0.25);
LayerSetColorAdd Z 0x00112233;
LayerSetAscent Z 7;
LayerSetAscentPadding Z 2;
LayerSetLineSpacingOffset Z -2;
LayerSetOffset Z (3 -4);
LayerSetCharWidths Z Chars Alias;
LayerSetSpacing Z 2;
LayerSetImageMap Z Chars Rects;
LayerSetCharOffsets Z Chars ((-1 1) (2 3));
LayerSetKerningPairs Z ('AB' 'AB') (-2 -3);
LayerSetBaseOrder Z -9;
LayerSetCharOrders Z Chars (4 -5);
LayerSetExInfo Z anything;
CreateLayerFrom A Z;
LayerSetCharWidths A ('A') (99);
'''
    font=compiler.FontCompiler('data/fixture.txt',raw).run()
    tags=compiler.tag_registry([font])
    assert tags=={'DISABLED':0,'SHADOW':1}
    assert set(c[0].lower() for c in font.commands)==set(c.lower() for c in compiler.COMMANDS)
    data=font.encode(tags)
    decoded=decode_numeric_font(data)
    assert decoded==font.numeric_state(tags)
    z,a=decoded['layers']
    assert (z['id'],a['id'])==(1,0) and (z['scalars'][12],a['scalars'][12])==(-9,1)
    assert z['glyphs'][65]['width']==5 and a['glyphs'][65]['width']==99
    assert z['glyphs'][65]['rect']==[1,2,5,8] and z['glyphs'][66]['rect']==[6,2,6,8]
    assert z['scalars'][10]==8  # Offset setter follows ImageMap; never recompute default height.
    assert z['glyphs'][65]['kern']=={66:-3} and decoded['char_map']=={97:65}
    assert z['mult']==[127,255,0,63] and z['add']==[17,34,51,255]
    assert z['required']==[1] and z['excluded']==[0]
    assert all(name.encode() not in data for name in ('DISABLED','SHADOW','Alias','Chars','Widths','Rects'))
    invalid=[]
    for size in (0,1,31,32,len(data)-1): invalid.append(data[:size])
    invalid.append(data+b'\0')
    for offset in (0,4,8,12,len(data)-1):
        bad=bytearray(data);bad[offset]^=1;invalid.append(bytes(bad))
    for offset,value in ((20,257),(24,0),(24,1025),(28,4097),(32,256),(40,2)):
        bad=bytearray(data);struct.pack_into('<I',bad,offset,value);struct.pack_into('<I',bad,12,zlib.crc32(bad[32:]));invalid.append(bytes(bad))
    for bad in invalid:
        try: decode_numeric_font(bad)
        except ValueError: pass
        else: raise AssertionError('Malformed numeric fixture accepted')
    for text in ('head (one (two three)','head (one ("two)','head (one (\'two)','head (one (two(three)))'):
        try: compiler.parse_list(text)
        except ValueError: pass
        else: raise AssertionError('Malformed DSL fixture accepted')
    assert compiler.resolve_compiled_font_path('data\\fixture.TXT')=='compiled/fonts/fixture.compiled'
    assert compiler.resolve_compiled_font_path('compiled/fonts/fixture.compiled')=='compiled/fonts/fixture.compiled'
    return len(invalid)


def verify_windows_glyph_conversion(fonts):
    # Call only the OS conversion interface, never a game/test executable.
    function=ctypes.windll.kernel32.MultiByteToWideChar
    function.argtypes=(ctypes.c_uint,ctypes.c_uint,ctypes.c_char_p,ctypes.c_int,ctypes.c_void_p,ctypes.c_int)
    function.restype=ctypes.c_int
    checked=set()
    for font in fonts:
        for name in ('CHARLIST','PAIRLIST'):
            for value in font.defines.get(name,[]):
                if not isinstance(value,str): continue
                raw=value.encode('latin1')+b'\0'
                count=function(65001,0,raw,len(raw),None,0)
                out=(ctypes.c_uint16*count)()
                assert function(65001,0,raw,len(raw),out,count)==count
                units=[int(v)&255 for v in out][:-1]
                assert units==compiler.wide_chars(value),(font.source_path,value,units)
                checked.add(value)
    return len(checked)


def verify_image_rectangles(fonts, source_dir):
    files={path.name.lower():path for path in source_dir.iterdir() if path.is_file()}
    rectangles=0
    for font in fonts:
        for layer in font.layers:
            image_name=PurePosixPath(layer['image']).name
            candidates=[image_name, '_'+image_name]
            image=next((files[(name+ext).lower()] for name in candidates for ext in ('','.png','.gif','.jpg')
                        if (name+ext).lower() in files),None)
            assert image is not None,layer['image']
            raw=image.read_bytes()
            if raw.startswith(b'\x89PNG\r\n\x1a\n'):
                width,height=struct.unpack_from('>II',raw,16)
            elif raw.startswith((b'GIF87a',b'GIF89a')):
                width,height=struct.unpack_from('<HH',raw,6)
            else:
                raise AssertionError(f'Unsupported font image fixture {image}')
            for glyph in layer['glyphs'].values():
                x,y,w,h=glyph['rect']
                assert x>=0 and y>=0 and w>=0 and h>=0 and x+w<=width and y+h<=height,(image,glyph['rect'])
                rectangles+=1
    return rectangles


def verify_production_guards(root):
    def default_text(path):
        output,stack=[],[True]
        for line in path.read_text(encoding='utf-8').splitlines():
            stripped=line.strip()
            if stripped=='#if defined(SEXY_FONT_TEXT_COMPAT_TEST_ONLY)':stack.append(False)
            elif stripped.startswith('#if'):stack.append(stack[-1])
            elif stripped.startswith('#else'):stack[-1]=not stack[-1] and stack[-2]
            elif stripped.startswith('#endif'):stack.pop()
            elif all(stack):output.append(line)
        assert stack==[True],path
        return '\n'.join(output)
    production='\n'.join(default_text(root/'pvzPerf'/p) for p in ('SexyAppFramework/graphics/ImageFont.cpp','SexyAppFramework/graphics/ImageFont.h','SexyAppFramework/misc/DescParser.cpp'))
    for name in ('LoadDescriptor','HandleCommand','mDefineMap','mFontLayerMap','mLayerName','GetDefine','AddTag(const','RemoveTag(const'):
        assert name not in production,name
    assert 'Load(SexyAppBase*' in production and 'p_fopen(path.c_str(), "rb")' in production


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--archive',type=Path,default=compiler.ROOT/'out/x64-win32-dx12/Release/main.pak64')
    parser.add_argument('--source-dir',type=Path,default=compiler.ROOT/'assets/definitions/fonts')
    parser.add_argument('--image-dir',type=Path,default=compiler.ROOT/'assets/runtime/data')
    parser.add_argument('--output-dir',type=Path)
    parser.add_argument('--manifest',type=Path,
                        default=compiler.ROOT/'assets/definitions/resources.json',
                        help='JSON resource build manifest')
    args=parser.parse_args()
    manifest_sources=manifest_font_sources(args.manifest.read_bytes())
    fonts=compiler.load_corpus(args.source_dir)
    if len(fonts)!=FONT_COUNT:
        raise ValueError(f'Font corpus must contain exactly {FONT_COUNT} fonts')
    if {compiler.norm(font.source_path) for font in fonts}!=manifest_sources:
        raise ValueError('Font corpus paths differ from the resource build manifest')
    tags=compiler.tag_registry(fonts)
    assert not tags,'Authoritative1073 corpus unexpectedly gained logical tags'
    output=args.output_dir or args.archive.parent
    layers=glyphs=kerns=0
    for font in fonts:
        data=(output/compiler.resolve_compiled_font_path(font.source_path)).read_bytes()
        decoded=decode_numeric_font(data)
        assert decoded==source_oracle(font),font.source_path
        assert decoded==font.numeric_state(tags),font.source_path
        assert data==font.encode(tags),font.source_path
        for layer in decoded['layers']:
            layers+=1;glyphs+=len(layer['glyphs']);kerns+=sum(len(g['kern']) for g in layer['glyphs'].values())
        print(f'PASS {font.source_path}: exact expanded metrics/colors/order/kerning/path')
    characters=verify_windows_glyph_conversion(fonts)
    rectangles=verify_image_rectangles(fonts,args.image_dir)
    rejected=synthetic_commands()
    verify_production_guards(compiler.ROOT)
    print(f'PASS fonts={len(fonts)} layers={layers} ASCII-glyphs={glyphs} kerning-pairs={kerns} '
          f'original-defines={sum(len(f.define_ids) for f in fonts)} OS-checked-characters={characters} '
          f'all27-commands=1 malformed-binaries-rejected={rejected} image-rectangles-in-bounds={rectangles} production-string-parser=absent')


if __name__=='__main__':
    main()
