"""Restore omitted active variants only when the retained native recipe reproduces approved2x pixels."""
from pathlib import Path
from PIL import Image
import numpy as np,json,hashlib
R=Path('.');coverage=json.loads((R/'out/x64-win32-vulkan/cache/resources/hd4x-live-coverage.json').read_text());cat=json.loads((R/'assets/source-art/catalog.json').read_text());entries={e['id']:e for e in cat['entries']};prov=json.loads((R/'assets/high-resolution/provenance.json').read_text())['images'];w=R/'assets/source-art/work/live-build-coverage';w.mkdir(exist_ok=True);ready=[];unresolved=[]
norm=lambda s:s.lower().removesuffix('.png').removesuffix('.jpg')
for row in coverage['unresolved']:
 key=norm(row['source']);e=entries.get(key)
 if e and e.get('export4x'):
  ready.append(dict(row,id=key,master=e['export4x']['path'],method='Existing verified4x export; missing manifest alias',proof='catalog export hash and approval retained'));continue
 if not e:
  unresolved.append(dict(row,reason='Missing canonical alias/catalog entry'));continue
 current=R/e['current']['path'];old=Image.open(current).convert('RGBA');logical=row['logicalSize'];records=[m for m in prov if m.get('file')==e['current']['path'].removeprefix('assets/high-resolution/')];accepted=None
 for m in reversed(records):
  rect=m.get('mapping',{}).get('logicalDrawRect');source=R/m.get('source','')
  if not source.is_file()or not rect or '-2x'in source.name or '/runtime/'in source.as_posix():continue
  native=Image.open(source).convert('RGBA');x,y,width,height=rect
  if min(native.width/width,native.height/height)<2:continue
  def affine(scale):return native.convert('RGBa').transform(tuple(v*scale for v in logical),Image.Transform.AFFINE,(native.width/(scale*width),0,-x*native.width/width,0,native.height/(scale*height),-y*native.height/height),Image.Resampling.BICUBIC).convert('RGBA')
  trial=affine(2);a=np.asarray(old,float);b=np.asarray(trial,float)
  if a.shape!=b.shape:continue
  visible=(a[:,:,3]>128)&(b[:,:,3]>128);ae=float(abs(a[:,:,3]-b[:,:,3]).mean());ce=float(abs(a[:,:,:3]-b[:,:,:3])[visible].mean())if visible.any()else 0
  if ae<=.01 and ce<=.01:
   out=w/key;out.mkdir(parents=True,exist_ok=True);dest=out/'candidate-4x.png';affine(4).save(dest);proof={'source':source.as_posix(),'sourceSha256':hashlib.sha256(source.read_bytes()).hexdigest(),'originalApprovedRecipe':m,'approved2xAlphaMAE':ae,'approved2xVisibleRGBMAE':ce,'sampler':'premultiplied bicubic affine','logicalSize':logical,'physicalSize':[v*4 for v in logical],'noRuntime2xUpscale':True,'runtimeChanged':False};(out/'recipe.json').write_text(json.dumps(proof,ensure_ascii=False,indent=2),encoding='utf-8');accepted=dict(row,id=key,master=dest.as_posix(),method='Exact approved native source recipe regenerated at4x',proof=(out/'recipe.json').as_posix(),source=source.as_posix());break
 if accepted:ready.append(accepted)
 else:unresolved.append(dict(row,id=key,reason='Retained source registration still needs resolution'))
report={'recovered':ready,'unresolved':unresolved,'counts':{'missing':len(coverage['unresolved']),'recovered':len(ready),'unresolved':len(unresolved)},'runtimeBindingsChanged':False};(w/'recovery.json').write_text(json.dumps(report,ensure_ascii=False,indent=2),encoding='utf-8');print(json.dumps(report['counts']));print('Recovered:',[r['id']for r in ready]);print('Unresolved:',[r['source']for r in unresolved])
