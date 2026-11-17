"""Retain native decorations; AI restores the remaining isolated pebbles/cracks."""
from pathlib import Path
from PIL import Image
import numpy as np,json,sys,hashlib
sys.path.insert(0,'out/verification/art-pythondeps');import cv2
A=Path('assets/source-art/archive/2026-11-16-pre-library');W=Path('assets/source-art/work');C=json.loads(Path('assets/source-art/catalog.json').read_text());entries={e['id']:e for e in C['entries']};allRows=[x for x in json.loads((W/'pending-audit/rebuilt-candidates.json').read_text())['items'] if '/acheesements_' not in x['id']]
def rgba(p):return Image.open(p).convert('RGBA')
def res(im,sz):return im.convert('RGBa').resize(tuple(map(int,sz)),Image.Resampling.LANCZOS).convert('RGBA')
def components(im,close):
 a=np.array(im);mask=(a[:,:,3]>48).astype('uint8');mask=cv2.morphologyEx(mask,cv2.MORPH_CLOSE,np.ones((close,close),np.uint8));n,l,stats,cent=cv2.connectedComponentsWithStats(mask,8);rows=[]
 for i in range(1,n):
  x,y,w,h,area=stats[i]
  if area<3*close*close:continue
  rows.append({'box':(int(x),int(y),int(w),int(h)),'center':cent[i],'area':int(area),'label':i})
 return rows,l
baseRows=json.loads((A/'corrections/achievements97/registration.json').read_text())+json.loads((A/'corrections/achievements97/template-registration.json').read_text());baseRows+=json.loads((A/'corrections/achievements97/extra-template-registration.json').read_text())
by={(x['theme'],x['name']):x for x in baseRows};parts=json.loads((A/'corrections/achievements97/pipe-piece-registration.json').read_text());meta=json.loads((A/'corrections/achievements97/composition-candidates.json').read_text())
for theme in ['bejeweled','chuzzle','peggle','pipe','zuma']:
 key='images/acheesements_'+theme;e=entries[key];d=W/key;original=rgba(d/'original-mask-baked.png');ai=rgba(d/'ai-master.png');origComps,_=components(original,3);aiComps,labels=components(ai,5);ob=original.getchannel('A').getbbox();ab=ai.getchannel('A').getbbox();out=Image.new('RGBA',(5600,900));assign=[];used=set()
 def norm(c,b):return [(c[0]-b[0])/(b[2]-b[0]),(c[1]-b[1])/(b[3]-b[1])]
 for oc in sorted(origComps,key=lambda a:-a['area']):
  ocn=np.array(norm(oc['center'],ob));costs=[]
  for j,ac in enumerate(aiComps):
   acn=np.array(norm(ac['center'],ab));relativeArea=ac['area']/max(1,(ab[2]-ab[0])*(ab[3]-ab[1]));orArea=oc['area']/max(1,(ob[2]-ob[0])*(ob[3]-ob[1]));cost=float(np.sum((ocn-acn)**2))+.003*abs(np.log(max(1e-6,relativeArea/orArea)))+(1 if j in used else 0);costs.append((cost,j))
  _,j=min(costs);used.add(j);ac=aiComps[j];selectedAI=ai;selectedLabels=labels
  if theme=='peggle' and oc['area']<250:
   # Pale bone fragments are not pebbles. Reuse a restored brown pebble donor.
   selectedAI=rgba(W/'images/acheesements_bejeweled/ai-master.png');donors,selectedLabels=components(selectedAI,5);options=[]
   for donor in donors:
    dx,dy,dw,dh=donor['box']
    if donor['area']>1500 or donor['area']<12:continue
    colors=np.array(selectedAI)[selectedLabels==donor['label'],:3].mean(axis=0)
    if colors[0]>colors[1]*1.02 and colors[1]>colors[2]*1.02:options.append(donor)
   if options:ac=min(options,key=lambda v:abs(v['box'][2]/v['box'][3]-oc['box'][2]/oc['box'][3]))
   else:selectedAI=ai;selectedLabels=labels
  x,y,w,h=ac['box'];layer=np.array(selectedAI.crop((x,y,x+w,y+h)));region=selectedLabels[y:y+h,x:x+w]==ac['label'];layer[:,:,3]=np.where(region,layer[:,:,3],0);# Remove pale AI matte fragments; main artwork is supplied by native sprites.
  neutralWhite=(layer[:,:,:3].min(axis=2)>180)&(layer[:,:,:3].max(axis=2)-layer[:,:,:3].min(axis=2)<35);layer[:,:,3][neutralWhite]=0
  if oc['area']>1000:
   brown=(layer[:,:,0]>layer[:,:,1]*1.12)&(layer[:,:,1]>layer[:,:,2]*1.10)&(layer[:,:,0]<175);layer[:,:,3]=np.where(brown,layer[:,:,3],0)
  layer=Image.fromarray(layer);ox,oy,ow,oh=oc['box'];gain=min(ow*4/w,oh*4/h);sz=[max(1,round(w*gain)),max(1,round(h*gain))];out.alpha_composite(res(layer,sz),(round((ox+ow/2)*4-sz[0]/2),round((oy+oh/2)*4-sz[1]/2)));assign.append({'originalBounds':oc['box'],'aiBounds':ac['box']})
 nativeInputs=[];nativeLayers=Image.new('RGBA',out.size)
 def warp(raw,M):
  # Matrix is native source -> logical pixels. Premultiply before bicubic sampling.
  a=np.array(raw.convert('RGBa'));m=np.array(M,float)*4;return Image.fromarray(cv2.warpAffine(a,m,out.size,flags=cv2.INTER_CUBIC)).convert('RGBA')
 row=next(x for x in meta if x['key'].removesuffix('.png')==key)
 if theme=='pipe':
  source=A/'replanted/native83/SPR_Achievements_Background_Pipe.png';raw=rgba(source)
  for piece in parts:
   lo,hi=piece['nativeXRange'];M=np.array(piece['matrix'],float);M[:,2]+=M[:,0]*lo;nativeLayers.alpha_composite(warp(raw.crop((lo,0,hi,raw.height)),M))
  nativeInputs.append(str(source))
 else:
  for name in row['nativeLayers']:
   record=by[(theme,name)];source=Path(record['source']);raw=rgba(source)
   if record.get('accepted') and record.get('matrix'):M=record['matrix']
   else:
    assert record.get('templateAccepted'),name
    scale=record['templateScale'];x,y=record['templateLocation'];M=[[scale,0,x],[0,scale,y]]
   nativeLayers.alpha_composite(warp(raw,M));nativeInputs.append(str(source))
 # Native art covers its own main symbols; AI fills only cracks/pebbles outside.
 out.alpha_composite(nativeLayers);coverage=np.array(original.getchannel('A').resize(out.size,Image.Resampling.LANCZOS));a=np.array(out);a[:,:,3]=np.minimum(a[:,:,3],coverage);out=Image.fromarray(a);dest=d/'candidate-4x.png';out.save(dest,compress_level=1);nativeLayers.save(d/'native-layers-4x.png',compress_level=1)
 record={'id':key,'candidate':dest.as_posix(),'logicalSize':[1400,225],'physicalSize':list(out.size),'sha256':hashlib.sha256(dest.read_bytes()).hexdigest(),'method':'Original alpha baked -> two actual Anime4K UL 2x passes -> AI restore residual components -> register components to original positions -> overlay retained native sprites directly at4x','sources':[str(d/'original-mask-baked.png'),str(d/'anime4k-pass2.png'),str(d/'ai-master.png'),*([str(W/'images/acheesements_bejeweled/ai-master.png')] if theme=='peggle' else []),*nativeInputs],'aiComponentRegistration':assign,'baseline':e['current']['path'],'runtime2xUsedAsSource':False,'reviewStatus':'pending','runtimeBindingChanged':False};(d/'recipe.json').write_text(json.dumps(record,ensure_ascii=False,indent=2)+'\n',encoding='utf-8');record['sources']=[s.replace('\\','/') for s in record['sources']];(d/'recipe.json').write_text(json.dumps(record,ensure_ascii=False,indent=2)+'\n',encoding='utf-8');allRows.append(record);print(theme,'native layers',len(nativeInputs),'AI residual groups',len(assign),flush=True)
assert len(allRows)==39
(W/'pending-audit/rebuilt-candidates.json').write_text(json.dumps({'count':39,'items':allRows,'activeBindingsChanged':False},ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
