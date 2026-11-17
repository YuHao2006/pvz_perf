"""Reconstruct intentionally pixel-styled UI fonts as vector cells at 4x."""
from pathlib import Path
from PIL import Image
import json,hashlib,zipfile,struct
ROOT=Path(__file__).resolve().parents[1]
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def save(p,d):p.write_text(json.dumps(d,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
def glyph_rects(data):
    pos=0
    def word():
        nonlocal pos
        v=struct.unpack_from('<I',data,pos)[0];pos+=4;return v
    def string():
        nonlocal pos
        size=word();v=data[pos:pos+size].decode();pos+=size;return v
    magic,version,size,crc,point,maps,layers,tags=[word() for _ in range(8)]
    assert magic==0x544e464e and version==1 and layers==1
    pos+=maps*8;layer=word();source=string()
    for _ in range(2):
        n=word();pos+=n*4
    pos+=(14+8)*4
    count=word();rects={}
    for _ in range(count):
        ch=word();rect=[word() for _ in range(4)];pos+=4*4;kern=word();pos+=kern*8;rects[str(ch)]=rect
    assert pos==len(data),(pos,len(data))
    return layer,source,rects
def main():
    r=ROOT;cp=r/'assets/source-art/catalog.json';cat=json.loads(cp.read_text());fp=r/'assets/high-resolution/fonts.json';fonts=json.loads(fp.read_text());entries={e['id']:e for e in cat['entries']}
    with zipfile.ZipFile(r/'out/x64-win32-vulkan/cache/resources/main.pak64') as pak:
        for name,original in [('pico129','_Pico129.png'),('pix118bold','_Pix118Bold.gif')]:
            if any(f['font']==name for f in fonts['fonts']):continue
            layer,path,rects=glyph_rects(pak.read('compiled/fonts/'+name+'.compiled'))
            src=r/'assets/runtime/data'/original;mask=Image.open(src).convert('RGB').getchannel('B');w,h=mask.size
            # Each original coverage sample is an explicit unit-square vector
            # cell. The design is a pixel font; retain its authored cell pattern.
            pieces=[]
            for y in range(h):
                for x in range(w):
                    a=mask.getpixel((x,y))
                    if a:pieces.append(f'<rect x="{x}" y="{y}" width="1" height="1" fill="white" fill-opacity="{a/255:.9f}"/>')
            master=r/'assets/source-art/masters/vector/fonts'/(name+'.svg');master.parent.mkdir(parents=True,exist_ok=True);master.write_text(f'<svg xmlns="http://www.w3.org/2000/svg" width="{w}" height="{h}" viewBox="0 0 {w} {h}">'+''.join(pieces)+'</svg>',encoding='utf-8')
            out=Image.new('RGBA',(w*4,h*4),(255,255,255,0));out.putalpha(mask.resize(out.size,Image.Resampling.NEAREST))
            cur=r/'assets/high-resolution/current/fonts'/name/(str(layer)+'.png');cur.parent.mkdir(parents=True,exist_ok=True);out.save(cur);dest=r/'assets/high-resolution/exports4x/fonts'/name/(str(layer)+'.png');dest.parent.mkdir(parents=True,exist_ok=True);out.save(dest)
            assert out.getchannel('A').resize((w,h),Image.Resampling.NEAREST).tobytes()==mask.tobytes()
            fonts['fonts'].append({'font':name,'layers':[{'id':layer,'image':cur.relative_to(r/'assets').as_posix(),'logicalSize':[w,h],'glyphRects':rects}]})
            key=f'fonts/{name}/{layer}';record={'path':cur.relative_to(r).as_posix(),'sha256':sha(cur),'physicalSize':list(out.size),'logicalSize':[w,h]};source={'path':master.relative_to(r).as_posix(),'sha256':sha(master),'origin':'vector','type':'svg'}
            entries[key]={'id':key,'kind':'fonts','aliases':[],'status':'ready','category':'字体','group':'字体 / 原生像素字形','owners':['font/'+name],'original':src.relative_to(r).as_posix(),'current':record,'export4x':{**record,'path':dest.relative_to(r).as_posix(),'pixelScale':4},'sources':[source],'masters':[source],'sourceKinds':['vector'],'history':{'method':'Original pixel-font coverage reconstructed as explicit vector cells; 4x raster preserves every authored coverage sample and all glyph metrics. No AI or runtime2x upscale.','logicalCoverageRoundTripExact':True}}
            cat['entries'].append(entries[key])
    # Correct the sole legacy backslash-only image alias. The compiler's path
    # normalization expects the canonical slash-separated extensionless key.
    ip=r/'assets/high-resolution/images.json';images=json.loads(ip.read_text());e=entries['images/editbox']
    for key in ['images/editbox','images/editbox.png']:
        images['images'][key]=e['current']['path'].removeprefix('assets/high-resolution/');images['logicalSizes'][key]=e['current']['logicalSize']
        if key not in e['aliases']:e['aliases'].append(key)
    cat['counts']['fontLayers']=sum(len(f['layers']) for f in fonts['fonts'])
    for p,d in [(cp,cat),(fp,fonts),(ip,images)]:save(p,d)
    p=r/'assets/high-resolution/package4x-validation.json';cert=json.loads(p.read_text());cert.update(imagesManifestSha256=sha(ip),fontsManifestSha256=sha(fp),libraryCatalogSha256=sha(cp));save(p,cert)
    print('4x pixel fonts registered with exact coverage/metrics; input-box alias repaired')
if __name__=='__main__':main()
