"""Fail before packaging if the HD authoring corpus is not genuinely ready at 4x."""
import argparse,hashlib,json
from PIL import Image
from pathlib import Path

def raster_size(path):
    with Image.open(path) as image:
        if image.format not in ('PNG','JPEG'):raise ValueError('unsupported HD raster encoding')
        expected={'.png':'PNG','.jpg':'JPEG','.jpeg':'JPEG'}.get(path.suffix.lower())
        if image.format!=expected:raise ValueError('raster encoding does not match its filename extension')
        return image.size

def main():
    ap=argparse.ArgumentParser();ap.add_argument('--root',type=Path,required=True);args=ap.parse_args();root=args.root.resolve();hd=root/'assets/high-resolution'
    policy=json.loads((hd/'package-policy.json').read_text(encoding='utf-8'));images=json.loads((hd/'images.json').read_text(encoding='utf-8'));errors=[]
    scale=policy['authoringPixelScale']
    if scale!=4 or policy['maximumAtlasSide']!=8192:errors.append('policy must author 4x pages with maximum side 8192')
    if images.get('pixelScale')!=scale:errors.append(f"images.json pixelScale={images.get('pixelScale')}, required {scale}; 2x inputs cannot be silently promoted")
    seen=set()
    for key,name in images['images'].items():
        logical=images.get('logicalSizes',{}).get(key)
        pair=(name,tuple(logical or []))
        if pair in seen:continue
        seen.add(pair)
        if not logical:errors.append(key+': missing logical size');continue
        try:
            path=(hd/name).resolve();path.relative_to(hd.resolve());size=raster_size(path)
            if size!=tuple(v*scale for v in logical):errors.append(f'{key}: physical {size}, expected {tuple(v*scale for v in logical)}')
            if max(size)>8192:errors.append(key+': exceeds 8192 before atlas padding; split this asset explicitly')
            if path.suffix.lower() in ('.jpg','.jpeg'):
                recipe=policy.get('jpegExports',{}).get(name)
                if not recipe:raise ValueError('JPEG lacks an explicit opaque-export recipe')
                if recipe['sha256']!=hashlib.sha256(path.read_bytes()).hexdigest():raise ValueError('JPEG recipe hash differs')
                source=(root/recipe['losslessSource']).resolve();source.relative_to(root)
                if hashlib.sha256(source.read_bytes()).hexdigest()!=recipe['losslessSourceSha256']:raise ValueError('Lossless JPEG source hash differs')
                with Image.open(source) as image:
                    if image.size!=size or image.convert('RGBA').getchannel('A').getextrema()!=(255,255):raise ValueError('JPEG source has transparency or changed dimensions')

        except (OSError,ValueError)as e:errors.append(key+': '+str(e))
    # Standalone minigame card overrides are configured outside images[].
    # Validate them too; otherwise an image-only inventory can miss six 2x cards.
    for seed,name in images.get('cards',{}).items():
        try:
            path=(root/'assets'/name).resolve();path.relative_to(hd.resolve());size=raster_size(path)
            if size!=(50*scale,70*scale):errors.append(f'card {seed}: physical {size}, expected {(50*scale,70*scale)}')
        except (OSError,ValueError)as e:errors.append(f'card {seed}: '+str(e))
    fonts=json.loads((hd/'fonts.json').read_text(encoding='utf-8'))
    if fonts.get('scale')!=scale:errors.append('font pages must be regenerated from font sources at 4x')
    certificate=hd/'package4x-validation.json'
    if not certificate.exists():errors.append('missing verified 4x source/registration/coverage certificate')
    else:
        cert=json.loads(certificate.read_text(encoding='utf-8'))
        if cert.get('imagesManifestSha256')!=hashlib.sha256((hd/'images.json').read_bytes()).hexdigest():errors.append('4x certificate does not match the active image bindings')
        if cert.get('unresolved') or cert.get('lowResolutionFallbacks') or cert.get('unreviewedRepairs'):errors.append('4x certificate still contains unresolved, low-resolution or unreviewed artwork')
    if errors:
        print('HD 4x package blocked. Existing Release files are not modified.')
        for e in errors[:12]:print(' - '+e)
        if len(errors)>12:print(f' - ... {len(errors)-12} further issues')
        return 1
    print(f'HD 4x preflight passed: {len(seen)} canonical bindings, atlas limit 8192.');return 0

if __name__=='__main__':raise SystemExit(main())
