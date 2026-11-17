"""Replay retained sources into review candidates; never enlarge runtime 2x files."""
from pathlib import Path
from PIL import Image,ImageDraw,ImageFont,ImageOps,ImageFilter
import json,hashlib,sys,math
import numpy as np
sys.path.insert(0,'out/verification/art-pythondeps');import cv2
R=Path('.');A=R/'assets/source-art/archive/2026-11-16-pre-library';C=json.loads((R/'assets/source-art/catalog.json').read_text());E={e['id']:e for e in C['entries']};WORK=R/'assets/source-art/work';records=[]
if E['reanim/selectorscreen_minigames_button']['status']=='ready':raise SystemExit('This batch is already integrated. Use rebuild_last3_scenes.py for remaining scene work; do not regenerate accepted assets.')
def openim(p):return Image.open(p).convert('RGBA')
def resize(im,size):return im.convert('RGBa').resize(tuple(map(int,size)),Image.Resampling.LANCZOS).convert('RGBA')
def original(e):
 p=Path(e['original']);p=p if p.exists() else R/'assets/runtime'/p;im=openim(p)
 for nm in ['_'+p.stem,p.stem+'_']:
  m=next((p.parent/(nm+x) for x in ['.png','.jpg','.tga','.gif'] if (p.parent/(nm+x)).exists()),None)
  if m:im.putalpha(Image.open(m).convert('RGB').getchannel('B'));break
 return im

def fit(im,logical,box):
 im=im.crop(im.getchannel('A').point(lambda a:255 if a>4 else 0).getbbox());factor=min((box[2]-box[0])/im.width,(box[3]-box[1])/im.height);sz=[max(1,round(v*factor*4)) for v in im.size];out=Image.new('RGBA',tuple(v*4 for v in logical));out.alpha_composite(resize(im,sz),(round((box[0]+box[2])*2-sz[0]/2),round((box[1]+box[3])*2-sz[1]/2)));return out

def save(key,im,method,sources,extra=None):
 e=E[key];assert im.size==tuple(v*4 for v in e['current']['logicalSize']),(key,im.size);d=WORK/key;d.mkdir(parents=True,exist_ok=True);dest=d/'candidate-4x.png';im.save(dest,compress_level=1)
 old=openim(e['current']['path']);down=resize(im,old.size);a=np.array(old,float);b=np.array(down,float);v=(a[:,:,3]>128)&(b[:,:,3]>128)
 proof={'id':key,'candidate':dest.as_posix(),'logicalSize':e['current']['logicalSize'],'physicalSize':list(im.size),'method':method,'sources':[str(x).replace('\\','/') for x in sources],'sha256':hashlib.sha256(dest.read_bytes()).hexdigest(),'baseline':e['current']['path'],'reviewStatus':'pending','runtimeBindingChanged':False,'runtime2xUsedAsSource':False,'comparison':{'alphaMAE':float(abs(a[:,:,3]-b[:,:,3]).mean()),'visibleRGBMAE':float(abs(a[:,:,:3]-b[:,:,:3])[v].mean()) if v.any() else None},**(extra or {})};(d/'recipe.json').write_text(json.dumps(proof,ensure_ascii=False,indent=2)+'\n',encoding='utf-8');records.append(proof);print(key,proof['comparison'],flush=True)

# Existing full-resolution AI stone, shared hover alpha and geometry.
p=A/'ai/selector-stones/candidates/SelectorScreen_Minigames_button--outline-raw-v2.png';raw=openim(p);key='reanim/selectorscreen_minigames_button';im=resize(raw,[v*4 for v in E[key]['current']['logicalSize']]);save(key,im,'Retained full AI outline master, shared normal/hover base; no 2x intermediate',[p]);normal=im
orig=original(E[key]);hi=original(E['reanim/selectorscreen_minigames_highlight']);aa=np.array(orig,float);delta=np.array(hi,float)[:,:,:3]-aa[:,:,:3];delta[aa[:,:,3]==0]=0;delta=cv2.resize(delta,normal.size,interpolation=cv2.INTER_LINEAR);a=np.array(normal);weight=np.clip((a[:,:,:3].max(axis=2).astype(float)-24)/32,0,1);a[:,:,:3]=np.rint(np.clip(a[:,:,:3]+delta*weight[:,:,None],0,255)).astype('uint8');save('reanim/selectorscreen_minigames_highlight',Image.fromarray(a),'Same approved black-protected hover delta recipe evaluated on full-resolution AI base',[p,A/'legacy-masters/selector-state-pairs/manifest.json'],{'sharedAlphaIdentical':True})

# Native background is cover-cropped uniformly, never vertically stretched.
key='reanim/tree_bg';p=A/'replanted/reanim-source-round6/tree_bg--b8c23073d56b.png';save(key,ImageOps.fit(openim(p),tuple(v*4 for v in E[key]['current']['logicalSize']),method=Image.Resampling.LANCZOS),'Uniform cover crop directly from native 2048x1080 background',[p])

# Shovel registration; all geometry stays in original logical coordinates.
p=Path(E['images/shovel_hi_res']['export4x']['path']);raw=openim(p);key='images/shovel';box=tuple(v/2 for v in openim(E[key]['current']['path']).getchannel('A').point(lambda a:255 if a>4 else 0).getbbox());candidate=fit(raw,[80,80],box)
sift=cv2.SIFT_create();source=np.array(raw);target=np.array(resize(openim(E[key]['current']['path']),(640,640)));k1,d1=sift.detectAndCompute(cv2.cvtColor(source,cv2.COLOR_RGBA2GRAY),None);k2,d2=sift.detectAndCompute(cv2.cvtColor(target,cv2.COLOR_RGBA2GRAY),None);matches=[a for a,b in cv2.BFMatcher().knnMatch(d1,d2,k=2) if a.distance<.75*b.distance]
if len(matches)>=4:
 M,inliers=cv2.estimateAffinePartial2D(np.float32([k1[m.queryIdx].pt for m in matches]),np.float32([k2[m.trainIdx].pt for m in matches]),method=cv2.RANSAC,ransacReprojThreshold=3)
 if M is not None and int(inliers.sum())>=4:
  M*=.5;candidate=Image.fromarray(cv2.warpAffine(source,M,(320,320),flags=cv2.INTER_CUBIC))
save(key,candidate,'High-density shovel similarity registration to approved visible geometry; no anisotropic scaling',[p])
key='images/landscape_ui/shovel';rot=raw.rotate(-45,Image.Resampling.BICUBIC,expand=True);box=tuple(v/2 for v in openim(E[key]['current']['path']).getchannel('A').point(lambda a:255 if a>4 else 0).getbbox());save(key,fit(rot,E[key]['current']['logicalSize'],box),'Approved high-density shovel rotated clockwise 45deg then uniform original fit',[p])
p=A/'ai/credits-play-button62/ai-master.png';key='images/credits_playbutton';save(key,fit(openim(p),E[key]['current']['logicalSize'],tuple(v/2 for v in openim(E[key]['current']['path']).getchannel('A').point(lambda a:255 if a>4 else 0).getbbox())),'Retained approved AI play icon directly fitted to original alpha bounds',[p])

# Digit crops use original AI master, keep every cell and pure white fill.
p=A/'ai/remaining99/selectorscreen_levelnumbers/ai-master.png';raw=openim(p);layout=json.loads((p.parent/'digit-layout.json').read_text());out=Image.new('RGBA',(480,68),'white');out.putalpha(original(E['images/selectorscreen_levelnumbers']).getchannel('A').resize((480,68),Image.Resampling.LANCZOS))
save('images/selectorscreen_levelnumbers',out,'Original white glyph coverage directly reconstructed at 4x; preserve all 12x17 cells, no added black outline',[E['images/selectorscreen_levelnumbers']['original']],{'retainedAIMaster':str(p),'glyphRGB':[255,255,255]})

# Native flag components + vector pole, 3 fixed 25x25 cells.
key='images/flagmeterparts';out=Image.new('RGBA',(300,100));meta=json.loads((A/'corrections/ui102/manifest.json').read_text());sources=[]
for row in meta['flagParts']:
 p=Path(row['source']);sources.append(p);x,y,w,h=row['outputBounds'];out.alpha_composite(resize(openim(p),(w*2,h*2)),(x*2,y*2))
pole=original(E[key]).crop((25,0,50,25));out.alpha_composite(resize(pole,(100,100)),(100,0));save(key,out,'Replay native head/flag outputBounds directly at 4x; original middle-cell pole coverage',[*sources,E[key]['original']])

# Native paired car lamps + vector-font text, shared registration across states.
fontPath=A/'replanted/localization-study/fonts/FNT_Anton-Regular.ttf'
for direction in ['Next','Prev']:
 for suffix,state in [('', ''),('highlight','_Over'),('disabled','_Disabled')]:
  key=f'images/store_{direction.lower()}button{suffix}';p=A/f'replanted/store-native-audit/SPR_Store_Button{direction}{state}_EN.png';raw=openim(p);logical=E[key]['current']['logicalSize'];out=Image.new('RGBA',tuple(v*4 for v in logical));out.alpha_composite(resize(raw,(round(raw.width*1.2),round(raw.height*1.2))),(0,0))
  font=ImageFont.truetype(str(fontPath),108);text=direction.upper();layer=Image.new('RGBA',(600,200));dr=ImageDraw.Draw(layer);dr.text((35,0),text,font=font,fill=(175 if suffix!='disabled' else 110,0,0,255),stroke_width=1,stroke_fill=(25,0,0,255));layer=layer.transform(layer.size,Image.Transform.AFFINE,(1,.2126,-20,0,1,0),Image.Resampling.BICUBIC);layer=layer.crop(layer.getchannel('A').getbbox());rect=[71,20,175,68] if direction=='Next' else [36,16,139,64];targetW=(rect[2]-rect[0])*2;targetH=(rect[3]-rect[1])*2;gain=min(targetW/layer.width,targetH/layer.height);layer=resize(layer,(round(layer.width*gain),round(layer.height*gain)));mask=layer.getchannel('A');m=np.array(mask,dtype=float)/255;shift=np.zeros_like(m);shift[2:,2:]=m[:-2,:-2];bevel=np.clip(m-shift,0,1);rgb=np.array(layer);rgb[:,:,:3]=np.clip(rgb[:,:,:3].astype(float)+bevel[:,:,None]*np.array([50,65,60]),0,255).astype('uint8');layer=Image.fromarray(rgb);out.alpha_composite(layer,(rect[0]*2+(targetW-layer.width)//2,rect[1]*2+(targetH-layer.height)//2));save(key,out,'Native lamp directly at 4x, Anton vector font italic text baked offline; shared state coordinates',[p,fontPath])

# 17 analytical/coverage fields. Source is ORIGINAL logical coverage, never old2x.
fieldKeys=[e['id'] for e in C['entries'] if e.get('verification',{}).get('classification')=='field-reconstruction']
for key in fieldKeys:
 e=E[key];im=original(e);sz=tuple(v*4 for v in e['current']['logicalSize']);assert im.size==tuple(e['current']['logicalSize'])
 # RGB and alpha are continuous scalar fields for these geometric/lighting assets.
 # Reconstruct each directly at target sampling rate; keep baked PNG alpha.
 out=resize(im,sz)
 if key=='images/zombatar_background_blank':
  arr=np.array(im);yy=np.linspace(0,1,im.height);xx=np.linspace(0,1,im.width);Y,X=np.meshgrid(yy,xx,indexing='ij');M=np.stack([np.ones_like(X),X,Y,X*X,X*Y,Y*Y],axis=-1).reshape(-1,6);coef=np.linalg.lstsq(M,arr[:,:,:3].reshape(-1,3),rcond=None)[0];yy=np.linspace(0,1,sz[1]);xx=np.linspace(0,1,sz[0]);Y,X=np.meshgrid(yy,xx,indexing='ij');M=np.stack([np.ones_like(X),X,Y,X*X,X*Y,Y*Y],axis=-1);rgb=np.clip(np.rint(M@coef),0,255).astype('uint8');out=Image.fromarray(np.dstack([rgb,np.full(sz[::-1],255,np.uint8)]))
  extra={'analyticalGradientCoefficients':coef.tolist()}
 else:extra={'coverageSource':e['original'],'resampling':'premultiplied Lanczos original scalar RGB/alpha field at 4x'}
 save(key,out,'Original geometric/lighting continuous field reconstructed directly at 4x, alpha baked; no runtime2x intermediate',[e['original']],extra)

# Grass uses approved 4x map RGB right up to original ragged scalar boundary.
p=Path(E['images/background1']['export4x']['path']);day=openim(p);meta=json.loads((A/'corrections/sod109/manifest.json').read_text())
for row in meta:
 key=row['key'].rsplit('.',1)[0];e=E[key];x,y,w,h=row['sourceLogicalRect'];out=day.crop((x*4,y*4,(x+w)*4,(y+h)*4));mask=original(e).getchannel('A').resize(out.size,Image.Resampling.LANCZOS);out.putalpha(mask);save(key,out,'Direct 4x approved map crop with original ragged grass coverage; no low-resolution RGB edge band',[p,e['original']],{'mapLogicalRect':row['sourceLogicalRect']})

# Existing shared 4x map supplies the exact day-pool surface/rim crop.
p=Path(E['images/background3']['export4x']['path']);key='images/pool';old=np.array(openim(E[key]['current']['path']).convert('RGB'));map2=np.array(resize(openim(p),(2800,1200)).convert('RGB'));waterMask=(old[:,:,1].astype(float)>old[:,:,0]+18)&(old[:,:,2].astype(float)>old[:,:,0]+18);edgeMask=(~waterMask).astype('uint8')*255;res=cv2.matchTemplate(map2,old,cv2.TM_SQDIFF_NORMED,mask=edgeMask);res[~np.isfinite(res)]=1e9;_,_,loc,_=cv2.minMaxLoc(res);x,y=loc;logical=E[key]['current']['logicalSize'];out=openim(p).crop((x*2,y*2,x*2+logical[0]*4,y*2+logical[1]*4));waterSource=A/'replanted/native74/Area3_PoolWater.png';water=ImageOps.fit(openim(waterSource),out.size,method=Image.Resampling.LANCZOS);water.putalpha(255);mask=Image.fromarray(waterMask.astype('uint8')*255).resize(out.size,Image.Resampling.LANCZOS);out=Image.composite(water,out,mask);save(key,out,'Direct 4x approved map rim plus native water; original water-region coverage is scalar geometry, never RGB from2x',[p,waterSource],{'mapCropPixels4x':[x*2,y*2,logical[0]*4,logical[1]*4]})

(WORK/'pending-audit/rebuilt-candidates.json').write_text(json.dumps({'items':records,'count':len(records),'activeBindingsChanged':False},ensure_ascii=False,indent=2)+'\n',encoding='utf-8');print('BUILT',len(records))
