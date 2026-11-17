from pathlib import Path
from PIL import Image
import json,sys,numpy as np
sys.path.insert(0,'out/verification/art-pythondeps');import cv2
c=json.loads(Path('assets/source-art/catalog.json').read_text());e={x['id']:x for x in c['entries']};day=Image.open(e['images/background1']['export4x']['path']).convert('RGBA');out=Path('out/media/replanted-audit/last3-scenes');day.crop((880,0,4080,2400)).save(out/'five-row-reference.png',compress_level=1)
# Compare exactly the same world rectangle, not averages over different rows.
box=(239*4,265*4,(239+771)*4,(265+127)*4);day.crop(box).save(out/'middle-row-5.png',compress_level=1)
one=Image.open('assets/source-art/work/images/sod1row/candidate-4x.png').convert('RGBA');one.save(out/'middle-row-1.png',compress_level=1);three=Image.open('assets/source-art/work/images/sod3row/candidate-4x.png').convert('RGBA');three.crop(((239-235)*4,(265-149)*4,(239-235+771)*4,(265-149+127)*4)).save(out/'middle-row-3.png',compress_level=1)
report={}
for name,x,y,w,h in [('sod1row',239,265,771,127),('sod3row',235,149,771,355)]:
 im=np.array(Image.open('assets/source-art/work/images/'+name+'/candidate-4x.png').convert('RGBA'));target=np.array(day.crop((x*4,y*4,(x+w)*4,(y+h)*4)));mask=np.array(Image.open('assets/runtime/images/'+name+'_.png').convert('RGB').getchannel('B').resize((w*4,h*4),Image.Resampling.LANCZOS));dist=cv2.distanceTransform((mask>128).astype('uint8'),cv2.DIST_L2,5)/4;v=dist>20;diff=abs(im[:,:,:3].astype(float)-target[:,:,:3].astype(float));report[name]={'coreRGBMeanErrorTo5Row':float(diff[v].mean()),'coreRGBMaxErrorTo5Row':float(diff[v].max()),'calibrationReference':e['images/background1']['export4x']['path'],'mapLogicalRect':[x,y,w,h]}
# Direct AI restoration: report measured differences without forcing color equality.
(out/'brightness-proof.json').write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n',encoding='utf-8');print(json.dumps(report,ensure_ascii=False))
