import json,struct,subprocess,sys
from pathlib import Path
import numpy as np
from PIL import Image
sys.path.insert(0,'out/verification/art-pythondeps');import cv2
c=json.loads(Path('assets/source-art/catalog.json').read_text());base=Path('assets/source-art/work');exe=Path('out/media/atlas-2x-experiment/anime4k/offline.exe').resolve()
for e in c['entries']:
 if e['status']!='pending' or '/acheesements_' not in e['id']:continue
 d=base/e['id'];d.mkdir(parents=True,exist_ok=True);p=Path(e['original']);p=p if p.exists() else Path('assets/runtime')/e['original'];im=Image.open(p).convert('RGBA')
 for nm in ['_'+p.stem,p.stem+'_']:
  mask=next((p.parent/(nm+s) for s in ['.png','.jpg','.gif','.tga'] if (p.parent/(nm+s)).exists()),None)
  if mask:im.putalpha(Image.open(mask).convert('RGB').getchannel('B'));break
 a=np.array(im);vis=(a[:,:,3]>0).astype('uint8');_,labels=cv2.distanceTransformWithLabels(1-vis,cv2.DIST_L2,5,labelType=cv2.DIST_LABEL_PIXEL);y,x=np.where(vis);col=a[y,x,:3];idx=np.clip(labels-1,0,len(col)-1);a[:,:,:3]=np.where(vis[:,:,None].astype(bool),a[:,:,:3],col[idx]);im=Image.fromarray(a);im.save(d/'original-mask-baked.png');inp=d/'original.rgba';inp.write_bytes(struct.pack('<II',*im.size)+im.tobytes());subprocess.run([str(exe),str(inp.resolve()),str((d/'anime4k').resolve())],check=True,stdout=subprocess.DEVNULL)
 for level in [1,2]:
  sz=tuple(v*2**level for v in im.size);out=Image.frombytes('RGBA',sz,(d/f'anime4k-pass{level}.rgba').read_bytes());out.putalpha(im.getchannel('A').resize(sz,Image.Resampling.LANCZOS));out.save(d/f'anime4k-pass{level}.png')
 print(e['id'],'mask first -> two actual Anime4K passes',flush=True)
