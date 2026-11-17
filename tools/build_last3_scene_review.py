from pathlib import Path
from PIL import Image,ImageDraw
import json
W=Path('assets/source-art/work');cat=json.loads(Path('assets/source-art/catalog.json').read_text());E={e['id']:e for e in cat['entries']};out=Path('out/media/replanted-audit/last3-scenes');out.mkdir(parents=True,exist_ok=True)
def resize(im,size):return im.convert('RGBa').resize(size,Image.Resampling.LANCZOS).convert('RGBA')
def original(k):
 e=E[k];p=Path(e['original']);im=Image.open(p).convert('RGBA')
 for n in ['_'+p.stem,p.stem+'_']:
  m=next((p.parent/(n+x) for x in ['.png','.jpg','.tga'] if (p.parent/(n+x)).exists()),None)
  if m:im.putalpha(Image.open(m).convert('RGB').getchannel('B'));break
 return im
rows=json.loads((W/'pending-audit/rebuilt-candidates.json').read_text())['items'];items=[]
for key in ['images/sod1row','images/sod3row','images/pool']:
 row=next(x for x in rows if x['id']==key).copy();name=key.split('/')[-1];row['kind']='images';row['group']='场景与地图';candidate=Image.open(row['candidate']).convert('RGBA');pool=name=='pool';bg='images/background3' if pool else 'images/background1unsodded';old=resize(original(bg),(5600,2400));new=Image.open(E[bg]['export4x']['path']).convert('RGBA');x,y=(254,278) if pool else (239,265) if name=='sod1row' else (235,149);old.alpha_composite(resize(original(key),candidate.size),(x*4,y*4));new.alpha_composite(candidate,(x*4,y*4));old=old.crop((880,0,4080,2400));new=new.crop((880,0,4080,2400));a=out/(name+'-original-scene.png');b=out/(name+'-hd-scene.png');old.save(a,compress_level=1);new.save(b,compress_level=1);row['sceneOld']=a.as_posix();row['sceneNew']=b.as_posix();row['sceneDrawLogical']=[x-220,y];row['physicalSize']=list(candidate.size);row['logicalSize']=E[key]['current']['logicalSize'];items.append(row)
(out/'items.json').write_text(json.dumps({'count':3,'items':items},ensure_ascii=False,indent=2)+'\n',encoding='utf-8');html=Path('out/media/replanted-audit/pending39-4x/index.html').read_text();html=html.replace('39项4×补齐审核','最后3项场景复核').replace('39项资源 · 4×补齐审核','草坪毛边与泳池坐标 · 3项复核').replace("key='pvz-hd-pending39-4x-v1'","key='pvz-hd-last3-scenes-v2'").replace("a.download='pvz-hd-pending39-review.json'","a.download='pvz-hd-last3-review.json'");html=html.replace('<a href="motion/">完整动画同步对照</a>','<a href="../pending39-4x/">返回39项</a>');html=html.replace('<div class="review">','<h2>完整场景：左为原版1073，右为本轮高清（真实关卡绘制坐标）</h2><div class="pair"><img id="sceneOld" style="width:100%"><img id="sceneNew" style="width:100%"></div><div class="review">');html=html.replace("$('#old').src='/'+r.baseline;", "$('#sceneOld').src='/'+r.sceneOld;$('#sceneNew').src='/'+r.sceneNew;$('#old').src='/'+r.baseline;");html=html.replace('39项均已生成候选。新修复仍需审核，审核前不计入已完成4×资源。','其余36项已按导出结果接入。本页只审核草坪毛边与泳池坐标修正。');start=html.find('<details><summary>完整 reanim');end=html.find('</details>',start)
if start>=0:html=html[:start]+html[end+10:]
html=html.replace("$('#motion').onclick=()=>", "if($('#motion'))$('#motion').onclick=()=>")
(out/'index.html').write_text(html,encoding='utf-8');print('Prepared 3 full scene pairs at native logical coordinates')
