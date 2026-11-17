"""Prepare native-only missing variants for review; never activate unapproved images."""
from pathlib import Path
from PIL import Image
import json,hashlib,shutil,html
ROOT=Path(__file__).resolve().parents[1]
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def save(p,d):p.write_text(json.dumps(d,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
def main():
    root=ROOT;wp=root/'assets/source-art/work/live-build-coverage/native-heads'
    if (wp/'chat-approval.json').exists():
        raise SystemExit('This review batch is approved; create a new batch instead of overwriting it.')
    rows=json.loads((wp/'items.json').read_text());rows=[r for r in rows if 'uniformFit' in r]
    cov=json.loads((root/'assets/source-art/work/live-build-coverage/recovery.json').read_text())['unresolved']
    for row in cov:
        source=row['source'];key=source.lower().removesuffix('.png');src=None
        if 'zombie_boss_iceball_particles_r0_c' in key:
            src=root.parent/'replanted_assets/ui_sprites'/('SPR_ZombieBossSpitIceBall_'+key[-1]+'.png');kind='particles'
        elif key in ['reanim/zombie_pogo_stickdamage2','reanim/zombie_pogo_stickhands2']:
            src=root/'assets/source-art/archive/2026-11-16-pre-library/replanted/native-parts'/(source.split('/')[-1]+'.png');kind='reanim'
        if src is None:continue
        im=Image.open(src).convert('RGBA');logical=row['logicalSize'];target=Image.new('RGBA',tuple(v*4 for v in logical))
        scale=min(target.width/im.width,target.height/im.height);im=im.resize((round(im.width*scale),round(im.height*scale)),Image.Resampling.LANCZOS)
        target.alpha_composite(im,((target.width-im.width)//2,(target.height-im.height)//2))
        folder=root/'assets/source-art/work/live-build-coverage'/key;folder.mkdir(parents=True,exist_ok=True);dest=folder/'candidate-4x.png';target.save(dest)
        master=root/'assets/source-art/masters/native'/kind/src.name;master.parent.mkdir(parents=True,exist_ok=True)
        if master.exists():assert sha(master)==sha(src)
        else:shutil.copy2(src,master)
        old=root/'assets/runtime'/source
        if not old.suffix:old=old.with_suffix('.png')
        assert old.exists(),old
        rows.append({'id':key,'original':old.relative_to(root).as_posix(),'candidate':dest.relative_to(root).as_posix(),'nativeMaster':master.relative_to(root).as_posix(),'skin':src.stem,'logicalSize':logical,'runtimeIntegrated':False,'reviewStatus':'pending','method':'Native image, uniform scale into unchanged original logical canvas; no AI'})
    save(wp/'items.json',rows)
    cp=root/'assets/source-art/catalog.json';cat=json.loads(cp.read_text());es={e['id']:e for e in cat['entries']}
    for row in rows:
        e=es[row['id']];p=root/row['candidate'];e['repairCandidate']={'path':row['candidate'],'candidate':row['candidate'],'sha256':sha(p),'physicalSize':list(Image.open(p).size),'reviewStatus':'pending','reviewUrl':'/assets/source-art/work/live-build-coverage/native-heads/','method':row['method']}
        e['pending']['finding']='重植版原生来源已提取／离线烘焙，等待审核；尚未接入。'
        master=root/row['nativeMaster'];s={'path':row['nativeMaster'],'origin':'native','sha256':sha(master),'physicalSize':list(Image.open(master).size)}
        if not any(x['path']==s['path'] for x in e['sources']):e['sources'].append(s)
        e['masters']=[s for s in e['sources'] if s['origin']!='original'];e['sourceKinds']=sorted({s['origin'] for s in e['sources']})
    cat['counts']['awaitingReviewImages']=len(rows);save(cp,cat)
    page=(wp/'index.html').read_text();start=page.index('<main>');end=page.index('</main>',start)
    cards=''.join(f'<article><h2>{html.escape(r["id"])}</h2><p>{html.escape(r["skin"])} · 重植版原生 · 尚未接入</p><div class="pair"><figure><figcaption>原版</figcaption><img src="/{r["original"]}"></figure><figure><figcaption>重植版完整候选</figcaption><img src="/{r["candidate"]}"></figure></div><label>审核 <select data-id="{r["id"]}"><option value="pending">待审核</option><option value="approved">通过</option><option value="rejected">不合格</option><option value="further-review">待进一步审核</option></select></label></article>' for r in rows)
    page=page[:start]+'<main>'+cards+page[end:]
    a=page.index('<h1>');b=page.index('</h1>',a);page=page[:a]+f'<h1>重植版补缺 · {len(rows)}项'+page[b:]
    (wp/'index.html').write_text(page,encoding='utf-8');print('Native candidates pending review:',len(rows))
if __name__=='__main__':main()
