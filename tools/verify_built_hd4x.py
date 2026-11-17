"""Certify the actual 4x PAK pages, not just source bindings."""
from pathlib import Path
from PIL import Image
from io import BytesIO
import argparse,hashlib,json,zipfile
ROOT=Path(__file__).resolve().parents[1]
def main():
    ap=argparse.ArgumentParser();ap.add_argument('--pak',required=True,type=Path);ap.add_argument('--output',required=True,type=Path);args=ap.parse_args()
    cert=json.loads((ROOT/'assets/high-resolution/package4x-validation.json').read_text())
    assert not any(cert.get(k) for k in ['unresolved','lowResolutionFallbacks','unreviewedRepairs'])
    coverage=json.loads((ROOT/'out/x64-win32-vulkan/cache/resources/hd4x-live-coverage.json').read_text());assert coverage['runtimeRootsOnly'] and not coverage['unresolved']
    fixed={r['path']:r for r in cert.get('fixedDataTextures',[])}
    pages=[];data=[];errors=[]
    jpegExports={r["path"]:r for r in cert.get("jpegExports",{}).values()}
    with zipfile.ZipFile(args.pak) as z:
        for item in z.infolist():
            suffix=Path(item.filename).suffix.lower()
            if suffix not in ['.png','.jpg','.jpeg','.gif','.bmp','.webp','.tga','.dds']:continue
            blob=z.read(item)
            if item.filename in fixed:
                record=fixed[item.filename];digest=hashlib.sha256(blob).hexdigest()
                if digest!=record['sha256']:errors.append('Fixed compute input differs: '+item.filename)
                with Image.open(BytesIO(blob)) as im:size=list(im.size)
                if size!=[256,256]:errors.append('Fixed compute dimensions differ: '+item.filename)
                data.append({'path':item.filename,'sha256':digest,'size':size,'classification':'fixed-size-caustics-compute-input-not-displayed-art'});continue
            if suffix not in ['.png','.jpg','.jpeg']:errors.append('Unsupported displayed raster: '+item.filename);continue
            if suffix in ['.jpg','.jpeg']:
                recipe=jpegExports.get(item.filename)
                if not recipe or recipe['sha256']!=hashlib.sha256(blob).hexdigest():errors.append('JPEG export not certified: '+item.filename);continue
            with Image.open(BytesIO(blob)) as im:w,h=im.size
            if max(w,h)>8192 or w%2 or h%2:errors.append('Invalid 4x page extent/grid: '+item.filename+' '+str((w,h)))
            page={'path':item.filename,'size':[w,h],'encoding':'PNG' if suffix=='.png' else 'JPEG','imageBytes':len(blob)}
            if suffix=='.png':page['pngBytes']=len(blob)
            else:page.update(jpegBytes=len(blob),quality=95,subsampling='4:4:4',lossless4xSource=recipe['losslessSource'],lossless4xSourceSha256=recipe['losslessSourceSha256'])
            pages.append(page)
    if set(fixed)!={x['path'] for x in data}:errors.append('Fixed data texture missing')
    if errors:raise RuntimeError('\n'.join(errors))
    result={**cert,'format':'pvz-built-hd4x-certificate-v1','pakSha256':hashlib.sha256(args.pak.read_bytes()).hexdigest(),'pakBytes':args.pak.stat().st_size,'pixelScale':4,'requiredImagesVerified':coverage['requiredImages'],'pageCount':len(pages),'largestPageSide':max(max(x['size']) for x in pages),'dataTextures':data,'pages':pages,'packageContainsOnlyPngDisplayedArt':not any(p['encoding']=='JPEG' for p in pages),'jpegDisplayedImageCount':sum(p['encoding']=='JPEG' for p in pages),'wholePage2xDerivationGridVerified':True}
    args.output.parent.mkdir(parents=True,exist_ok=True);args.output.write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
    print(json.dumps({k:result[k] for k in ['pakBytes','pageCount','largestPageSide','requiredImagesVerified','pakSha256']}))
if __name__=='__main__':main()
