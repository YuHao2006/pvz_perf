"""Monotonic palette restoration against matching five-row regions; geometry/alpha untouched."""
from pathlib import Path
from PIL import Image
import json,sys,hashlib,numpy as np
sys.path.insert(0,'out/verification/art-pythondeps');import cv2
W=Path('assets/source-art/work/images');cat=json.loads(Path('assets/source-art/catalog.json').read_text());E={e['id']:e for e in cat['entries']};five=Image.open(E['images/background1']['export4x']['path']).convert('RGBA');rows=[]
for name,x,y,w,h in [('sod1row',239,265,771,127),('sod3row',235,149,771,355)]:
 d=W/name;im=Image.open(d/'candidate-4x.png').convert('RGBA');a=np.array(im);ref=np.array(five.crop((x*4,y*4,(x+w)*4,(y+h)*4)));mask=Image.open('assets/runtime/images/'+name+'_.png').convert('RGB').getchannel('B').resize(im.size,Image.Resampling.LANCZOS);distance=cv2.distanceTransform((np.array(mask)>128).astype('uint8'),cv2.DIST_L2,5)/4;valid=(a[:,:,3]>250)&(distance>20);q=np.linspace(0,1,1025);luts=[];out=a.copy()
 for ch in range(3):
  values,counts=np.unique(a[:,:,ch][valid],return_counts=True);cdf=(np.cumsum(counts)-counts/2)/counts.sum();target=np.quantile(ref[:,:,ch][valid],cdf);xp=np.concatenate([[0],values[values>0], [255]]);yp=np.concatenate([[0],target[values>0],[255]]);# duplicate endpoint values are made unique before interpolation.
  pairs={int(k):float(v) for k,v in zip(xp,yp)};pairs[0]=0;pairs[255]=255;xx=np.array(sorted(pairs));yy=np.maximum.accumulate([pairs[k] for k in xx]);lut=np.rint(np.interp(np.arange(256),xx,yy)).clip(0,255).astype('uint8');out[:,:,ch]=lut[a[:,:,ch]];luts.append(lut.tolist())
 assert np.array_equal(out[:,:,3],a[:,:,3]);dest=d/'candidate-color-preserved-4x.png';Image.fromarray(out).save(dest,compress_level=1)
 def metric(rgb):
  rgb=rgb.astype(float)/255;lin=np.where(rgb<=.04045,rgb/12.92,((rgb+.055)/1.055)**2.4);return {'meanRGB':np.round(rgb[valid].mean(0)*255,3).tolist(),'meanLinearY':float((lin[valid]@np.array([.2126,.7152,.0722])).mean())}
 record={'id':'images/'+name,'candidate':dest.as_posix(),'baseline':(d/'candidate-4x.png').as_posix(),'colorReference':E['images/background1']['export4x']['path'],'referenceLogicalRect':[x,y,w,h],'method':'Per-channel monotonic quantile palette mapping, identical algorithm and sampling rules for both assets; reference is same-coordinate five-row region; preserve alpha byte-for-byte, no spatial filtering or blending','sourceSha256':hashlib.sha256((d/'candidate-4x.png').read_bytes()).hexdigest(),'sha256':hashlib.sha256(dest.read_bytes()).hexdigest(),'physicalSize':list(im.size),'logicalSize':[w,h],'alphaIdentical':True,'reviewStatus':'pending','productionBindingsChanged':False,'curvesRGB':luts,'metrics':{'AI':metric(a[:,:,:3]),'colorPreserved':metric(out[:,:,:3]),'reference5Row':metric(ref[:,:,:3])}};(d/'color-preservation-recipe.json').write_text(json.dumps(record,ensure_ascii=False,indent=2)+'\n',encoding='utf-8');rows.append(record);print(name,json.dumps(record['metrics'],ensure_ascii=False))
Path('assets/source-art/work/pending-audit/color-preservation-trial.json').write_text(json.dumps({'items':rows,'modelSelectionSupported':False,'originalAIOutputsPreserved':True},ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
