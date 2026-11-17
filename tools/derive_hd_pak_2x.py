"""Derive a 2x PAK from certified PNG/JPEG pages without repacking UVs."""
import argparse,hashlib,json,zipfile,copy
from io import BytesIO
from pathlib import Path
from PIL import Image

def derive(source,output,certificate,png_compression=1):
    if not 0<=png_compression<=9:raise ValueError("PNG compression must be between 0 and 9")
    if source.resolve()==output.resolve():raise ValueError('Output must not overwrite the 4x master PAK')
    cert=json.loads(certificate.read_text(encoding='utf-8'))
    if cert.get('pixelScale')!=4 or cert.get('pakSha256')!=hashlib.sha256(source.read_bytes()).hexdigest():raise ValueError('Input is not the exact certified 4x package')
    if cert.get('unresolved')or cert.get('lowResolutionFallbacks')or cert.get('unreviewedRepairs'):raise ValueError('The source package still contains unresolved artwork')
    pages=[];preserved=[];temporary=output.with_suffix(output.suffix+'.tmp')
    dataTextures={item['path']:item for item in cert.get('dataTextures',[])}
    jpegPages={item['path']:item for item in cert.get('pages',[]) if item.get('encoding')=='JPEG'}
    # This one legacy texture is numerical shader input. Its dimensions are
    # enforced by PoolEffectInitialize; no displayed art may use this exception.
    if set(dataTextures)-{'images/pool_caustic_effect.jpg'}:raise ValueError('Unknown fixed-size compute texture exception')
    try:
        with zipfile.ZipFile(source)as src,zipfile.ZipFile(temporary,'w',allowZip64=True)as dst:
            for entry in src.infolist():
                data=src.read(entry)
                if entry.filename in dataTextures:
                    item=dataTextures[entry.filename]
                    if item.get('classification')!='fixed-size-caustics-compute-input-not-displayed-art' or item.get('size')!=[256,256] or hashlib.sha256(data).hexdigest()!=item.get('sha256'):raise ValueError('Compute input certificate mismatch: '+entry.filename)
                    with Image.open(BytesIO(data))as image:
                        if image.size!=(256,256):raise ValueError('Invalid fixed-size caustics input')
                    dst.writestr(copy.copy(entry),data);preserved.append(entry.filename);continue
                if entry.filename.lower().endswith(('.jpg','.jpeg')):
                    recipe=jpegPages.get(entry.filename)
                    if not recipe:raise ValueError('Uncertified displayed JPEG: '+entry.filename)
                    source=Path(__file__).resolve().parents[1]/recipe['lossless4xSource']
                    if not source.is_file() or hashlib.sha256(source.read_bytes()).hexdigest()!=recipe['lossless4xSourceSha256']:raise ValueError('Retained lossless master required to derive JPEG without generation loss: '+entry.filename)
                    with Image.open(source) as master:
                        image=master.convert('RGBA');w,h=image.size
                        if [w,h]!=recipe['size'] or w%2 or h%2 or max(w,h)>8192 or image.getchannel('A').getextrema()!=(255,255):raise ValueError('Invalid opaque JPEG master: '+entry.filename)
                        image=image.convert('RGB').resize((w//2,h//2),Image.Resampling.LANCZOS);buf=BytesIO();image.save(buf,format='JPEG',quality=95,subsampling=0,optimize=True);data=buf.getvalue()
                    pages.append({'path':entry.filename,'4x':[w,h],'2x':[w//2,h//2],'encoding':'JPEG','source':'retained lossless 4x PNG','quality':95,'subsampling':'4:4:4'})
                elif entry.filename.lower().endswith(('.gif','.bmp','.webp')):
                    raise ValueError('Unsupported raster in certified HD package: '+entry.filename)
                if entry.filename.lower().endswith('.png'):
                    with Image.open(BytesIO(data))as image:
                        w,h=image.size
                        if not w or not h or w%2 or h%2 or max(w,h)>8192:raise ValueError('Page does not align to the certified 4x grid: '+entry.filename)
                        # Premultiplied filtering avoids black/white fringes in
                        # transparent borders. Logical metrics and UV data stay.
                        image=image.convert('RGBA').convert('RGBa').resize((w//2,h//2),Image.Resampling.LANCZOS).convert('RGBA');buf=BytesIO();image.save(buf,format='PNG',compress_level=png_compression);data=buf.getvalue();pages.append({'path':entry.filename,'4x':[w,h],'2x':[w//2,h//2]})
                dst.writestr(copy.copy(entry),data)
        if set(preserved)!=set(dataTextures):raise ValueError('Certified compute input missing from source PAK')
        temporary.replace(output)
    except BaseException:
        temporary.unlink(missing_ok=True);raise
    report={'sourcePakSha256':cert['pakSha256'],'derivedPakSha256':hashlib.sha256(output.read_bytes()).hexdigest(),'pixelScale':2,'repacked':False,'nonImageEntriesUnchanged':True,'pngCompressionLevel':png_compression,'dataTexturesPreservedByteIdentically':preserved,'pages':pages};output.with_suffix(output.suffix+'.derivation.json').write_text(json.dumps(report,indent=2),encoding='utf-8');return report

def main():
    ap=argparse.ArgumentParser(description=__doc__);ap.add_argument('--input',type=Path,required=True);ap.add_argument('--output',type=Path,required=True);ap.add_argument('--certificate',type=Path,required=True);ap.add_argument('--png-compression',type=int,default=1);args=ap.parse_args();report=derive(args.input,args.output,args.certificate,args.png_compression);print(f"Derived {len(report['pages'])} whole pages; all non-image data and normalized UVs unchanged.")
if __name__=='__main__':main()
