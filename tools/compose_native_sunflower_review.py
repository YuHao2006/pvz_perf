"""Offline expression experiment using retained Replanted parts; no runtime tracks added."""
from pathlib import Path
from PIL import Image,ImageOps
import json,hashlib,shutil,html
ROOT=Path(__file__).resolve().parents[1]
WORK=ROOT/'assets/source-art/work/live-build-coverage/sunflower-composed-v1'
def save(p,d):p.write_text(json.dumps(d,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
def main():
    if (WORK/'chat-approval.json').exists():raise SystemExit('Approved batch is immutable')
    WORK.mkdir(exist_ok=True);native=ROOT/'assets/source-art/masters/native/reanim'
    normal=Image.open(native/'SunFlower_head.png').convert('RGBA').resize((228,172),Image.Resampling.LANCZOS)
    blank=Image.open(native/'SunFlower_head2.png').convert('RGBA').resize((228,172),Image.Resampling.LANCZOS)
    mouths={n:Image.open(native/(n+'.png')).convert('RGBA') for n in ['sunflower-yawn','sunflower_inhale','sunflower_exhale']}
    # These are preview-only original logical mouth envelopes. Native pixels are
    # composed once and no per-frame scaling or additional draw calls are added.
    specs=[('sing1',None,None,False),('sing2','sunflower-yawn',(94,27),False),('sing3','sunflower_inhale',(96,25),True),('sing4','sunflower-yawn',(94,47),False),('sing5','sunflower_exhale',(32,24),False),('wink',None,None,False)]
    rows=[]
    for suffix,mouth,size,flip in specs:
        im=normal.copy() if mouth is None else blank.copy();recipe={'base':'SunFlower_head' if mouth is None else 'SunFlower_head2','mouth':mouth,'mouthSize4x':size,'mouthFlipVertical':flip,'mouthCenter4x':[131,126]}
        if mouth:
            part=mouths[mouth]
            if flip:part=ImageOps.flip(part)
            part=part.resize(size,Image.Resampling.LANCZOS);im.alpha_composite(part,(round(131-size[0]/2),round(126-size[1]/2)))
        if suffix=='wink':
            # Native setup-pose quads, transformed from world into head texture
            # coordinates. Use only the left half of the two-eye blink attachment.
            blink=Image.open(native/'SunFlower_blink1.png').convert('RGBA')
            pos=(65.7584457397461*228/230,36.2034*172/170)
            blink=blink.resize((round(119.99817*228/230),round(63.999*172/170)),Image.Resampling.LANCZOS)
            left=blink.crop((0,0,round(114-pos[0]),blink.height));im.alpha_composite(left,(round(pos[0]),round(pos[1])))
            recipe['blink']={'source':'SunFlower_blink1','position4x':pos,'leftEyeClipX':114,'placement':'Native setup pose transformed relative to head; no guessed track offset'}
        dest=WORK/('sunflower_head_'+suffix+'-4x.png');im.save(dest)
        key='reanim/sunflower_head_'+suffix
        rows.append({'id':key,'suffix':suffix,'candidate':dest.relative_to(ROOT).as_posix(),'original':'assets/runtime/reanim/SunFlower_head_'+suffix+'.png','logicalSize':[57,43],'physicalSize':[228,172],'sha256':hashlib.sha256(dest.read_bytes()).hexdigest(),'recipe':recipe,'method':'Offline composition of Replanted native face/mouth/blink parts; original expression shapes are approximated for review, not exact duplicates','reviewStatus':'pending','runtimeIntegrated':False})
    save(WORK/'items.json',rows)
    save(WORK/'recipe.json',{'format':'pvz-native-sunflower-expression-composition-v1','nativeMasters':[str(p.relative_to(ROOT).as_posix()) for p in [native/'SunFlower_head.png',native/'SunFlower_head2.png',native/'SunFlower_blink1.png']+[native/(n+'.png') for n in mouths]],'noAI':True,'newRuntimeTracks':0,'newRuntimeDrawCalls':0,'originalTimingUnchanged':True,'notes':'Three native mouth shapes are reused with offline size/flip variations. Teeth and tongue shapes differ from the original; review these explicitly.','expressions':rows})
    # Existing source-record reanim player: actual original frame transforms,
    # action intervals and variants. Refresh every other part from active HD.
    base=ROOT/'out/media/replanted-audit/pending39-4x/motion';playerRoot=ROOT/'out/verification/hd-contours-800/player'
    allcat=json.loads((playerRoot/'catalog.json').read_text());meta=next(x for x in allcat['definitions'] if x['name']=='SunFlower');definition=json.loads((playerRoot/meta['file']).read_text())
    symbols={s for t in definition['tracks'] for s in t['images'] if s}
    for variant in definition['variants']:
        for images in variant['images']:symbols.update(s for s in images if s)
    cfg=json.loads((ROOT/'assets/high-resolution/images.json').read_text());assets={}
    for sym in symbols:
        old=allcat['assets'][sym];a=dict(old);original=a['original'].removeprefix('assets/runtime/').lower();key=original.removesuffix('.png').removesuffix('.jpg')
        item=next((r for r in rows if r['id']==key),None)
        if item:
            # The old side intentionally retains the six original expressions.
            url=a['url'];url=url if url.startswith('/') else '/out/verification/hd-contours-800/player/'+url
            a['url']=url;a['baselineHD']={'url':url,'mapping':{'logicalDrawRect':[0,0,57,43]}}
            a['hd']={'url':'/'+item['candidate'],'mapping':{'logicalDrawRect':[0,0,57,43]}};a['status']='pending'
        else:
            file=cfg['images'].get(key) or cfg['images'].get(key+'.png');assert file,(sym,key)
            logical=cfg['logicalSizes'].get(key)or cfg['logicalSizes'][key+'.png'];url='/assets/high-resolution/'+file
            a.update(url=url,hd={'url':url,'mapping':{'logicalDrawRect':[0,0,*logical]}},status='approved');a['baselineHD']=a['hd']
        assets[sym]=a
    motion=WORK/'motion';motion.mkdir(exist_ok=True)
    meta=dict(meta,file='/out/verification/hd-contours-800/player/'+meta['file']);save(motion/'catalog.json',{'definitions':[meta],'assets':assets});save(motion/'feedback.json',[])
    page=(base/'index.html').read_text().replace('当前已通过的高清效果','已接入高清部件＋原版表情').replace('本轮4×修复后的完整效果','相同高清部件＋重植版组合表情').replace('Reanim 新旧动画同步对照','向日葵完整动画／表情对照').replace('<select id="variant"></select>','<select id="variant"></select><label><input id="autoSing" type="checkbox" checked>连续切换5种唱歌口型</label>')
    (motion/'index.html').write_text(page,encoding='utf-8')
    js=(base/'player.js').read_text().replace("pvz-hd-pending39-4x-motion","pvz-hd-native-sunflower-v1").replace("||'Credits_stage'","||'SunFlower'")
    js=js.replace('variantMaps.forEach(mp=>mp.forEach(s=>s&&syms.add(s)));','variantMaps.forEach(mp=>mp.forEach(s=>s&&syms.add(s)));for(const variant of def.variants)for(const images of variant.images)for(const s of images)if(s)syms.add(s);')
    js=js.replace('let bulkReviews={};','let singLast=-1;let bulkReviews={};')
    js=js.replace('function tick(now){','function tick(now){if(def&&!pending&&playing&&$("autoSing").checked){const pattern=[1,2,3,4,2,5,3,4],pick=pattern[Math.floor(now/280)%pattern.length];if(pick!==singLast){singLast=pick;$("variant").value=String(pick);setupVariant();updateStatus();restoreReview();}}')
    js+='\n$("variant").addEventListener("change",()=>{$("autoSing").checked=false});\n'
    js=js.replace('Math.min(3,fitScale)','Math.min(7,fitScale*.9)').replace('高清 ${hd.length}/${syms.size} 个图像；其余保留原图。','当前外观 ${hd.length}/${syms.size} 项高清输入；两侧其余部件一致，仅表情不同。')
    js=js.replace('${escapeHtml(v.name)}</option>','${["默认笑脸","sing1 · 微笑","sing2 · 窄张嘴","sing3 · 浅张嘴","sing4 · 大张嘴","sing5 · 圆嘴","wink · 单眼眨眼"][i]||escapeHtml(v.name)}</option>')
    page=page.replace('连续切换5种唱歌口型','连续口型演示（非歌词时间轴）').replace('缺少已通过高清对应的部件保留原图；','本页其余部件全部使用已通过高清输入；六张原版表情仅用于左侧对照。')
    (motion/'index.html').write_text(page,encoding='utf-8')
    (motion/'player.js').write_text(js,encoding='utf-8')
    cards=''.join(f'<article><h2>{r["suffix"]}</h2><div class="pair"><figure><figcaption>原版表情</figcaption><img src="/{r["original"]}"></figure><figure><figcaption>重植版部件组合</figcaption><img src="/{r["candidate"]}"></figure></div><p>{html.escape(str(r["recipe"]))}</p><select data-id="{r["id"]}"><option value="pending">待审核</option><option value="approved">通过</option><option value="rejected">不合格</option><option value="further-review">待进一步审核</option></select></article>' for r in rows)
    static='''<!doctype html><meta charset="utf-8"><title>向日葵原生部件组合</title><style>body{background:#26382d;color:#eee;font:16px/1.6 system-ui;margin:24px}main{display:grid;grid-template-columns:repeat(auto-fit,minmax(400px,1fr));gap:20px}article{background:#36503f;padding:18px}.pair{display:grid;grid-template-columns:1fr 1fr}figure{margin:8px}img{width:100%;height:200px;object-fit:contain;background:#51664e}p{overflow-wrap:anywhere}button,select{font:inherit;padding:8px}a{color:#c9e79f}</style><h1>向日葵6种表情 · 原生部件离线组合</h1><p>没有使用AI。复用重植版头部、3种嘴部和眨眼片，口型尺寸／翻转均在离线烘焙时完成。原版牙齿、舌头和笑容细节有差异，当前是待审试验，尚未接入。</p><p><a href="motion/?definition=SunFlower">打开完整向日葵同步动画与连续口型切换</a></p><button id="export">导出审核JSON</button><main>'''+cards+'''</main><script>const key='sunflower-native-composed-v1',saved=JSON.parse(localStorage.getItem(key)||'{}');for(const s of document.querySelectorAll('select')){s.value=saved[s.dataset.id]||'pending';s.onchange=()=>{saved[s.dataset.id]=s.value;localStorage.setItem(key,JSON.stringify(saved))}}document.querySelector('#export').onclick=()=>{const a=document.createElement('a');a.href=URL.createObjectURL(new Blob([JSON.stringify({format:key,reviews:saved},null,2)],{type:'application/json'}));a.download='sunflower-native-composed-review.json';a.click()};</script>'''
    (WORK/'index.html').write_text(static,encoding='utf-8');print('Prepared 6 expressions and complete source-record animation; other HD parts:',len(assets)-6)
if __name__=='__main__':main()
