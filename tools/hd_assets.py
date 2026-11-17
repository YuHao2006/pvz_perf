"""Single inspection/work entry point for the HD asset library."""
from pathlib import Path
from PIL import Image
import argparse,hashlib,json,re,math

ROOT=Path(__file__).resolve().parents[1]
CATALOG=ROOT/'assets/source-art/catalog.json'
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def load():return json.loads(CATALOG.read_text(encoding='utf-8'))
def path(value):
 p=(ROOT/value).resolve();p.relative_to(ROOT);return p
def asset_id(value):
 if not re.fullmatch(r'[a-z0-9_/-]+',value)or'..'in value or value.startswith('/'):raise ValueError('Use a canonical resource ID, for example reanim/zombie_bungi_body')
 return value
def check(require_ready=False):
 cat=load();errors=[];seen=set();counts={'currentFiles':0,'exports4x':0,'sourceFiles':0};byAlias={};entries={e['id']:e for e in cat['entries']}
 def verify(row,kind):
  f=path(row['path']);sig=(row['path'],row.get('sha256'))
  if sig in seen:return
  seen.add(sig)
  if not f.is_file():errors.append('Missing '+row['path']);return
  if sha(f)!=row['sha256']:errors.append('Hash differs: '+row['path'])
  counts[kind]+=1
  if row.get('physicalSize'):
   with Image.open(f)as im:
    if list(im.size)!=row['physicalSize']:errors.append('Extent differs: '+row['path'])
 for entry in cat['entries']:
  for alias in entry.get('aliases',[]):byAlias[alias]=entry
  if entry.get('current'):verify(entry['current'],'currentFiles')
  export=entry.get('export4x')
  if export:
   verify(export,'exports4x')
   if export['physicalSize']!=[v*4 for v in export['logicalSize']]:errors.append('Not a 4x export: '+entry['id'])
  for source in entry.get('sources',[]):verify(source,'sourceFiles')
  review=entry.get('history',{}).get('reviewFile')
  if review and not path(review).is_file():errors.append('Missing approval: '+review)
 cfg=json.loads((ROOT/'assets/high-resolution/images.json').read_text());fonts=json.loads((ROOT/'assets/high-resolution/fonts.json').read_text())
 for key,file in cfg['images'].items():
  entry=byAlias.get(key)
  if not file.startswith('current/'):errors.append('Image bypasses current/: '+key)
  if not entry or entry['current']['path']!='assets/high-resolution/'+file:errors.append('Binding/catalog mismatch: '+key)
 for seed,file in cfg.get('cards',{}).items():
  if entries['cards/'+seed]['current']['path']!='assets/'+file:errors.append('Card mismatch: '+seed)
 for font in fonts['fonts']:
  for layer in font['layers']:
   key=f"fonts/{font['font']}/{layer['id']}"
   if entries[key]['current']['path']!='assets/'+layer['image']:errors.append('Font mismatch: '+key)
 pending=[e['id']for e in cat['entries']if e['status']=='pending']
 if require_ready and pending:errors.append(str(len(pending))+' assets still need a reviewed 4x export')
 result={'valid':not errors,'counts':counts,'pendingImages':len(pending),'errors':errors,'masterResolutionPreserved':True,'buildPixelScale':4,'globalActiveScale':cfg['pixelScale']};(ROOT/'assets/source-art/validation.json').write_text(json.dumps(result,ensure_ascii=False,indent=2),encoding='utf-8');print(json.dumps(result,ensure_ascii=False));return not errors
def trim(key):
 entry=next(e for e in load()['entries']if e['id']==key);export=entry.get('export4x')
 if not export:raise ValueError('This asset has no approved 4x export yet')
 im=Image.open(path(export['path'])).convert('RGBA');bounds=im.getchannel('A').getbbox()
 if not bounds:raise ValueError('Fully transparent placeholder: keep it invisible')
 # Preserve the transparent sampling guard, and the even authoring grid used
 # when entire atlas pages are halved to 2x without changing normalized UVs.
 bounds=(max(0,math.floor((bounds[0]-2)/2)*2),max(0,math.floor((bounds[1]-2)/2)*2),min(im.width,math.ceil((bounds[2]+2)/2)*2),min(im.height,math.ceil((bounds[3]+2)/2)*2))
 work=ROOT/'assets/source-art/work'/key;work.mkdir(parents=True,exist_ok=True);dest=work/'trimmed-4x.png';im.crop(bounds).save(dest,compress_level=1)
 descriptor={'assetId':key,'source':export['path'],'sourceSha256':export['sha256'],'logicalCanvas':export['logicalSize'],'sourcePhysicalSize':list(im.size),'trimRectPixels':[bounds[0],bounds[1],bounds[2]-bounds[0],bounds[3]-bounds[1]],'drawOffsetLogical':[bounds[0]/4,bounds[1]/4],'croppedPhysicalSize':[bounds[2]-bounds[0],bounds[3]-bounds[1]],'samplingGuardPixels':2,'coordinateQuantum':2,'cropped':dest.relative_to(ROOT).as_posix(),'bindingChanged':False,'rule':'Preserve the original logical canvas. Add the saved offset in the existing transform and derive UVs from the cropped region at build time; never infer logical geometry from cropped PNG dimensions.'};(work/'trim.json').write_text(json.dumps(descriptor,ensure_ascii=False,indent=2),encoding='utf-8');print(json.dumps(descriptor,ensure_ascii=False))
def main():
 ap=argparse.ArgumentParser();sub=ap.add_subparsers(dest='command',required=True);p=sub.add_parser('check');p.add_argument('--require-ready',action='store_true');p=sub.add_parser('show');p.add_argument('id');p=sub.add_parser('work');p.add_argument('id');p=sub.add_parser('trim-export');p.add_argument('id');args=ap.parse_args()
 if args.command=='check':return 0 if check(args.require_ready)else 1
 key=asset_id(args.id)
 if args.command=='show':print(json.dumps(next(e for e in load()['entries']if e['id']==key),ensure_ascii=False,indent=2))
 elif args.command=='work':p=ROOT/'assets/source-art/work'/key;p.mkdir(parents=True,exist_ok=True);print(str(p))
 elif args.command=='trim-export':trim(key)
 return 0
if __name__=='__main__':raise SystemExit(main())
