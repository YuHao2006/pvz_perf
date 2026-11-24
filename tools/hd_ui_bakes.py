"""Build HD UI pieces in the selected view. Inputs always come from the library."""
import hashlib
import re
from pathlib import Path
from tempfile import TemporaryDirectory

from PIL import Image, ImageChops

ROOT = Path(__file__).resolve().parents[1]
HD = 'high-resolution/current/'
UI = 'definitions/ui/'
RAW = 'runtime/images/hd_ui/'
DECOR = ('almanac_indexpanels', 'almanac_plantdecor', 'almanac_zombiedecor')
STRIPS = ('selectorscreen_achievements_bg', 'acheesements_hole_tile', 'acheesements_china',
          'acheesements_bejeweled', 'acheesements_bookworm', 'acheesements_chuzzle',
          'acheesements_peggle', 'acheesements_pipe', 'acheesements_zuma')
SHADOWS = {'Survival': 'shadow_survival', 'Challenges': 'shadow_challenge',
           'ZenGarden': 'shadow_zengarden'}
ACTION = 'definitions/reanim/units/SelectorScreen.dsl'
VARIANTS = 'definitions/reanim/appearances/SelectorScreen.dsl'
HEADER = 'HdUiPieces.h'


def rgba(path):
    with Image.open(path) as image:
        return image.convert('RGBA')


def save(out, key, image):
    path = out/key
    path.parent.mkdir(parents=True, exist_ok=True)
    image.save(path, compress_level=3)


def put(out, key, text):
    path = out/key
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(text, encoding='utf-8')


def strips(sources, out):
    tiles = []
    for name in STRIPS:
        image = rgba(sources[HD+'images/'+name+'.png'])
        if image.size != (5600, 900):
            raise ValueError(f'Unexpected achievement strip size: {name} {image.size}')
        left, _, right, _ = image.getchannel('A').getbbox()
        # Preserve four transparent texels, align the origin to logical pixels.
        left = max(0, (left//4-1)*4)
        right = min(image.width, ((right+3)//4+1)*4)
        tiles.append((name, image.crop((left, 0, right, image.height)), left//4))
    # Put the full-width strips on their own shelves, pair the other six.
    shelves = []
    for tile in sorted(tiles, key=lambda t: -t[1].width):
        for shelf in shelves:
            if sum(t[1].width+8 for t in shelf)+tile[1].width+8 <= 5608:
                shelf.append(tile)
                break
        else:
            shelves.append([tile])
    w = max(sum(t[1].width+8 for t in shelf) for shelf in shelves)
    h = len(shelves)*908
    page = Image.new('RGBA', (w,h))
    header = [f'inline constexpr int StripPageWidth={w}, StripPageHeight={h}, StripHeight=225;',
              'struct Strip { Sexy::TextureRegion region; int left; };']
    for row, shelf in enumerate(shelves):
        x, y = 4, row*908+4
        for name,tile,left in shelf:
            # Extend outer pixels into the four-texel filter gutter.
            for dx in (-4,0,tile.width):
                for dy in (-4,0,tile.height):
                    sx,sw = (0,1) if dx<0 else (tile.width-1,1) if dx else (0,tile.width)
                    sy,sh = (0,1) if dy<0 else (tile.height-1,1) if dy else (0,tile.height)
                    patch = tile.crop((sx,sy,sx+sw,sy+sh)).resize((4 if dx else sw,4 if dy else sh),Image.Resampling.NEAREST)
                    page.paste(patch,(x+dx,y+dy))
            coords=f'{x}.0f/{w}, {y}.0f/{h}, {x+tile.width}.0f/{w}, {y+tile.height}.0f/{h}'
            header.append('inline constexpr Strip '+name.upper()+'{{'+coords+f', {tile.width//4}, 225'+'}, '+str(left)+'};')
            x+=tile.width+8
    save(out,RAW+'achievements_strips.atlas.png',page)
    key=UI+'Achievements.atlas.dsl'
    text=sources[key].read_text(encoding='utf-8')
    for name in STRIPS:
        text,n=re.subn(r'(?m)^\s* sprite '+name.upper()+r' \{[^}]*\}', '',text)
        if n!=1: raise ValueError('Missing achievement sprite '+name)
    put(out,key,text)
    return header


BORDER_EDGES = {1: 'top', 3: 'left', 4: 'right', 6: 'bottom'}
BORDER_PAGES = ('index', 'plant', 'zombie')


def trim_border_edges(sources, out, dsl):
    for page in BORDER_PAGES:
        for index, edge in BORDER_EDGES.items():
            name = f'almanac_{page}_border_{index}.png'
            key = HD + 'images/' + name
            image = rgba(sources[key])
            box = image.getchannel('A').getbbox()
            if box is None:
                raise ValueError('Empty almanac border: ' + name)
            # The draw excludes one logical texel around the source rectangle.
            # Keep another transparent logical texel for linear filtering inside it.
            left = top = 0
            right, bottom = image.size
            if edge == 'top':
                bottom = min(bottom, ((box[3] + 3) // 4 + 2) * 4)
            elif edge == 'left':
                right = min(right, ((box[2] + 3) // 4 + 2) * 4)
            elif edge == 'right':
                left = max(0, (box[0] // 4 - 2) * 4)
            else:
                top = max(0, (box[1] // 4 - 2) * 4)
            tile = image.crop((left, top, right, bottom))
            save(out, RAW + name, tile)
            pattern = re.escape('image: "' + key + '";') + r'\s*logical_size: \[\d+, \d+\];'
            binding = (f'image: "images/hd_ui/{name}"; '
                       f'logical_size: [{tile.width // 4}, {tile.height // 4}];')
            dsl, count = re.subn(pattern, binding, dsl)
            if count != 1:
                raise ValueError('Missing almanac border binding: ' + name)
    return dsl


def almanac(sources, out):
    # Each decoration is one fixed-size artwork. Strip only empty outer margins.
    # The existing eight border sprites are the only part stretched with the window.
    key = UI + 'Almanac.atlas.dsl'
    dsl = sources[key].read_text(encoding='utf-8')
    header = ['struct DecorationOrigin { int x, y; };']
    for name in DECOR:
        image = rgba(sources[HD + 'images/' + name + '.png'])
        left, top, right, bottom = image.getchannel('A').getbbox()
        left = max(0, (left // 4 - 1) * 4)
        top = max(0, (top // 4 - 1) * 4)
        right = min(image.width, ((right + 3) // 4 + 1) * 4)
        bottom = min(image.height, ((bottom + 3) // 4 + 1) * 4)
        tile = image.crop((left, top, right, bottom))
        restored = Image.new('RGBA', image.size)
        restored.paste(tile, (left, top))
        if any(channel.getbbox() for channel in ImageChops.difference(
                restored.convert('RGBa'), image.convert('RGBa')).split()):
            raise ValueError('Decoration crop removed visible pixels: ' + name)
        save(out, RAW + name + '.png', tile)
        row = (f'    sprite {name.upper()} {{ image: "images/hd_ui/{name}.png"; '
               f'logical_size: [{tile.width // 4}, {tile.height // 4}]; }}')
        dsl, count = re.subn(r'(?m)^ *sprite ' + name.upper() + r' \{[^}]*\}', row, dsl)
        if count != 1:
            raise ValueError('Missing almanac decoration: ' + name)
        header.append(f'inline constexpr DecorationOrigin {name.upper()}'
                      f'{{{left // 4}, {top // 4}}};')
    put(out, key, trim_border_edges(sources, out, dsl))
    return header


def menu(sources,out):
    base=HD+'reanim/selectorscreen_'
    image=rgba(sources[base+'bg_right.png'])
    action=sources[ACTION].read_text(encoding='utf-8')
    variants=sources[VARIANTS].read_text(encoding='utf-8')
    def track_xy(name):
        track=action.split(f'source-name: "{name}";',1)[1].split('    }\n    Track',1)[0]
        x=y=0
        for frame,changes in re.findall(r'frame (\d+) \{([^}]+)',track):
            if int(frame)>12:break
            for axis,value in re.findall(r'\b(x|y): ([-.\d]+);',changes):
                if float(value)==-10000:continue
                if axis=='x':x=float(value)
                else:y=float(value)
        return x,y
    stone=track_xy('SelectorScreen_BG_Right')
    for track,source in SHADOWS.items():
        x,y=track_xy('SelectorScreen_'+track+'_shadow')
        offset=(round((x-stone[0])*4),round((y-stone[1])*4))
        image.alpha_composite(rgba(sources[base+source+'.png']),offset)
        symbol='IMAGE_REANIM_SELECTORSCREEN_'+source.upper()
        if action.count('image: '+symbol+';')!=1:raise ValueError('Unexpected shadow binding '+symbol)
        action=action.replace('image: '+symbol+';', 'image: none;')
        variants=variants.replace('["'+symbol+'"]','[]')
    save(out,base+'bg_right.png',image)
    put(out,ACTION,action)
    put(out,VARIANTS,variants)


def original_canvas_inputs(sources, cache):
    """Supply original-canvas coordinates to legacy HD bindings and atlas recipes."""
    import json

    layout = sources.get('definitions/ui/source-crops.json')
    if not layout:
        return {}
    cache = cache / 'ui-source-canvases'
    cache.mkdir(exist_ok=True)
    restored = {}
    for key, crop in json.loads(layout.read_text(encoding='utf-8'))['images'].items():
        path = sources[key]
        image = rgba(path)
        size = tuple(crop['canvas'])
        if image.size == size:
            continue  # A variant can still override the source with its original canvas.
        left, top, right, bottom = crop['bounds']
        if not (0 <= left < right <= size[0] and 0 <= top < bottom <= size[1]
                and image.size == (right-left, bottom-top)):
            raise ValueError(f'Invalid UI source crop for {key}: {image.size}')
        signature = hashlib.sha256(path.read_bytes() + str((size,left,top)).encode()).hexdigest()
        output = cache / (signature + '.png')
        if not output.exists():
            canvas = Image.new('RGBA', size)
            canvas.paste(image, (left, top))
            temporary = output.with_suffix('.tmp')
            canvas.save(temporary, format='PNG', compress_level=3)
            temporary.replace(output)
        restored[key] = output
    return restored


def derived_inputs(sources,cache):
    key_names=[UI+'Achievements.atlas.dsl',UI+'Almanac.atlas.dsl',ACTION,VARIANTS]
    key_names += [HD+'images/'+name+'.png' for name in STRIPS+DECOR]
    key_names += [HD+'reanim/selectorscreen_'+name+'.png' for name in ('bg_right',*SHADOWS.values())]
    key_names += [HD + f'images/almanac_{page}_border_{index}.png'
                  for page in BORDER_PAGES for index in BORDER_EDGES]
    digest=hashlib.sha256(Path(__file__).read_bytes())
    for key in key_names:
        digest.update(sources[key].read_bytes())
    folder=cache/'ui-bakes'/digest.hexdigest()
    if not folder.is_dir():
        folder.parent.mkdir(exist_ok=True)
        with TemporaryDirectory(dir=folder.parent) as td:
            out=Path(td)/'baked'
            rows=strips(sources,out)+almanac(sources,out)
            menu(sources,out)
            put(out,HEADER,'// Generated from the selected HD artwork.\n#pragma once\n#include "graphics/TextureRegion.h"\nnamespace HdUi {\n'+'\n'.join(rows)+'\n}\n')
            out.rename(folder)
    generated=ROOT/'pvzPerf/Sexy.TodLib/generated'/HEADER
    content=(folder/HEADER).read_bytes()
    if not generated.exists() or generated.read_bytes()!=content:
        tmp=generated.with_suffix('.new');tmp.write_bytes(content);tmp.replace(generated)
    return {p.relative_to(folder).as_posix():p for p in folder.rglob('*') if p.is_file() and p.name!=HEADER}
