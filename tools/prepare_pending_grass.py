from pathlib import Path
from PIL import Image
import struct,subprocess,sys,numpy as np
sys.path.insert(0,'out/verification/art-pythondeps');import cv2
exe=Path('out/media/atlas-2x-experiment/anime4k/offline.exe').resolve()
for name in ['sod1row','sod3row']:
 d=Path('assets/source-art/work/images')/name;im=Image.open('assets/runtime/images/'+name+'.jpg').convert('RGBA');im.putalpha(Image.open('assets/runtime/images/'+name+'_.png').convert('RGB').getchannel('B'));a=np.array(im);vis=(a[:,:,3]>0).astype('uint8');_,labels=cv2.distanceTransformWithLabels(1-vis,cv2.DIST_L2,5,labelType=cv2.DIST_LABEL_PIXEL);y,x=np.where(vis);col=a[y,x,:3];ix=np.clip(labels-1,0,len(col)-1);a[:,:,:3]=np.where(vis[:,:,None].astype(bool),a[:,:,:3],col[ix]);im=Image.fromarray(a);im.save(d/'original-mask-baked.png');inp=d/'grass-original.rgba';inp.write_bytes(struct.pack('<II',*im.size)+im.tobytes());subprocess.run([str(exe),str(inp.resolve()),str((d/'grass-anime4k').resolve())],check=True,stdout=subprocess.DEVNULL)
 for level in [1,2]:
  sz=tuple(v*2**level for v in im.size);out=Image.frombytes('RGBA',sz,(d/f'grass-anime4k-pass{level}.rgba').read_bytes());out.putalpha(im.getchannel('A').resize(sz,Image.Resampling.LANCZOS));out.save(d/f'anime4k-pass{level}.png')
 bg=Image.new('RGBA',out.size,(110,110,110,255));bg.alpha_composite(out);bg.convert('RGB').save(d/'grass-ai-reference.png')
 print(name,'prepared',out.size)
