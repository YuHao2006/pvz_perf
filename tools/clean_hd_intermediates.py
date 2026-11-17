"""Remove byte-verified redundant raw buffers; keep lossless PNGs and provenance."""
from pathlib import Path
from PIL import Image
import argparse,hashlib,json,shutil

ROOT=Path(__file__).resolve().parents[1]
def main():
    ap=argparse.ArgumentParser();ap.add_argument('--apply',action='store_true');args=ap.parse_args()
    art=(ROOT/'assets/source-art').resolve();removed=[]
    for raw in sorted(art.rglob('*.rgba')):
        raw.resolve().relative_to(art)
        png=raw.with_suffix('.png')
        if not png.is_file():continue
        with Image.open(png) as im:im=im.convert('RGBA')
        if raw.stat().st_size!=im.width*im.height*4 or raw.read_bytes()!=im.tobytes():continue
        removed.append({'path':raw.relative_to(ROOT).as_posix(),'bytes':raw.stat().st_size,'sha256':hashlib.sha256(raw.read_bytes()).hexdigest(),'losslessReplacement':png.relative_to(ROOT).as_posix(),'restore':'PIL.Image.open(replacement).convert("RGBA").tobytes()'})
        if args.apply:raw.unlink()
    # This unapproved detour was explicitly rejected in favour of tracing native assets.
    rejected=(art/'work/live-build-coverage/new-repairs').resolve();rejected.relative_to(art/'work')
    rejected_files=[]
    if rejected.is_dir():
        for f in rejected.rglob('*'):
            if f.is_file():rejected_files.append({'path':f.relative_to(ROOT).as_posix(),'bytes':f.stat().st_size})
        # Never remove material registered by a later edit.
        registered=(art/'catalog.json').read_text()+(ROOT/'assets/high-resolution/images.json').read_text()+(ROOT/'assets/high-resolution/provenance.json').read_text()
        assert 'live-build-coverage/new-repairs/' not in registered
        if args.apply:shutil.rmtree(rejected)
    report={'applied':args.apply,'redundantRawBuffers':removed,'discardedUnapprovedDetour':rejected_files,'removedFiles':len(removed)+len(rejected_files),'removedBytes':sum(x['bytes'] for x in removed+rejected_files),'mastersAndReferencesRemoved':False}
    out=art/'work/cleanup';out.mkdir(exist_ok=True)
    (out/'report.json').write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
    print(json.dumps({k:report[k] for k in ['applied','removedFiles','removedBytes','mastersAndReferencesRemoved']}))
if __name__=='__main__':main()
