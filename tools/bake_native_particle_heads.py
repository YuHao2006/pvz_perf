"""Bake native setup-pose meshes once; no mesh deformation is added at runtime."""
from pathlib import Path
from PIL import Image
import numpy as np,json,hashlib,html
import UnityPy
ROOT=Path(__file__).resolve().parents[1]
WORK=ROOT/'assets/source-art/work/live-build-coverage/native-heads'
def main():
    if (WORK/'chat-approval.json').exists():
        raise SystemExit('Approved batch is immutable; create a new review batch to revise artwork.')
    poses=json.loads((WORK/'poses.json').read_text())
    source=Path('C:/Program Files (x86)/Steam/steamapps/common/PVZ Replanted/Replanted_Data/StreamingAssets/aa/StandaloneWindows64/vfx_assets_all_9b7df9192977769564291c8e48484d1c.bundle')
    textures=[o.read() for o in UnityPy.load(str(source)).objects if o.type.name=='Texture2D']
    coverage=json.loads((ROOT/'assets/source-art/work/live-build-coverage/recovery.json').read_text())['unresolved']
    rows=[]
    for skin in poses['skins']:
        atlas=next(t for t in textures if t.m_Name==skin['texture']).image.convert('RGBA');at=np.asarray(atlas,dtype=float)/255
        at[:,:,:3]*=at[:,:,3:4]
        master=ROOT/'assets/source-art/masters/native/particles'/(skin['texture']+'-atlas.png');master.parent.mkdir(parents=True,exist_ok=True);atlas.save(master)
        key='particles/'+skin['original'].lower()
        row=next(r for r in coverage if r['source'].lower().removesuffix('.png')==key)
        vs=np.concatenate([np.asarray(d['vertices']).reshape(-1,2)*[1,-1] for d in skin['draw']])
        lo=np.floor(vs.min(axis=0))-2;hi=np.ceil(vs.max(axis=0))+2;size=np.ceil(hi-lo).astype(int)
        canvas=np.zeros((size[1],size[0],4),float)
        for draw in skin['draw']:
            v=np.asarray(draw['vertices']).reshape(-1,2)*[1,-1]-lo
            uv=np.asarray(draw['uvs']).reshape(-1,2)*[atlas.width,atlas.height]
            layer=np.zeros_like(canvas)
            for tri in np.asarray(draw['triangles']).reshape(-1,3):
                dest=v[tri];src=uv[tri];matrix=np.vstack([dest.T,np.ones(3)])
                if abs(np.linalg.det(matrix))<1e-8:continue
                x0,y0=np.maximum(0,np.floor(dest.min(axis=0))).astype(int);x1,y1=np.minimum(size,np.ceil(dest.max(axis=0))).astype(int)
                if x1<=x0 or y1<=y0:continue
                yy,xx=np.mgrid[y0:y1,x0:x1];q=np.stack([xx+.5,yy+.5,np.ones_like(xx)],axis=-1)
                bary=q@np.linalg.inv(matrix).T;inside=np.all(bary>=-1e-7,axis=-1)
                tex=bary@src-.5;tx=np.clip(tex[:,:,0],0,atlas.width-1);ty=np.clip(tex[:,:,1],0,atlas.height-1)
                ix=np.floor(tx).astype(int);iy=np.floor(ty).astype(int);jx=np.minimum(ix+1,atlas.width-1);jy=np.minimum(iy+1,atlas.height-1);fx=(tx-ix)[:,:,None];fy=(ty-iy)[:,:,None]
                pix=((at[iy,ix]*(1-fx)+at[iy,jx]*fx)*(1-fy)+(at[jy,ix]*(1-fx)+at[jy,jx]*fx)*fy)*draw['alpha']
                layer[y0:y1,x0:x1][inside]=pix[inside]
            canvas=layer+canvas*(1-layer[:,:,3:4])
        alpha=canvas[:,:,3:4];rgb=np.divide(canvas[:,:,:3],alpha,out=np.zeros_like(canvas[:,:,:3]),where=alpha>1e-8)
        im=Image.fromarray(np.clip(np.concatenate([rgb,alpha],axis=2)*255+.5,0,255).astype('uint8'))
        dest=WORK/skin['original'];dest.mkdir(exist_ok=True);im.save(dest/'native-baked.png')
        original=ROOT/'assets/runtime'/row['source'];original=original if original.suffix else original.with_suffix('.png')
        old=Image.open(original).convert('RGBA');bounds=old.getbbox();assert bounds
        # Match original occupied bounds by one uniform fit. Preserve the logical canvas.
        logical=row['logicalSize'];target=Image.new('RGBA',tuple(v*4 for v in logical));tight=im.crop(im.getbbox())
        scale=min((bounds[2]-bounds[0])*4/tight.width,(bounds[3]-bounds[1])*4/tight.height)
        resized=tight.resize((max(1,round(tight.width*scale)),max(1,round(tight.height*scale))),Image.Resampling.LANCZOS)
        xy=(round((bounds[0]+bounds[2])*2-resized.width/2),bounds[3]*4-resized.height);target.alpha_composite(resized,xy);target.save(dest/'candidate-4x.png')
        rows.append({'id':key,'original':original.relative_to(ROOT).as_posix(),'candidate':(dest/'candidate-4x.png').relative_to(ROOT).as_posix(),'nativeMaster':master.relative_to(ROOT).as_posix(),'skin':skin['skin'],'logicalSize':logical,'uniformFit':scale,'position4x':xy,'runtimeIntegrated':False,'reviewStatus':'pending','method':'Native Spine setup pose, skin draw order and mesh baked offline; original particle motion retained'})
    (WORK/'items.json').write_text(json.dumps(rows,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
    cards=''.join(f'<article><h2>{html.escape(r["id"])}</h2><p>重植版皮肤：{r["skin"]} · 原版逻辑画布不变 · 尚未接入</p><div class="pair"><figure><figcaption>原版</figcaption><img src="/{r["original"]}"></figure><figure><figcaption>重植版完整头部（离线烘焙）</figcaption><img src="/{r["candidate"]}"></figure></div><label>审核 <select data-id="{r["id"]}"><option value="pending">待审核</option><option value="approved">通过</option><option value="rejected">不合格</option><option value="further-review">待进一步审核</option></select></label></article>' for r in rows)
    page='''<!doctype html><meta charset="utf-8"><title>重植版掉落头部审核</title><style>body{background:#26352c;color:#eee;font:16px system-ui;margin:24px}main{display:grid;grid-template-columns:repeat(auto-fit,minmax(450px,1fr));gap:20px}article{background:#344a3b;padding:18px}h2{font-size:17px}figure{margin:8px}.pair{display:grid;grid-template-columns:1fr 1fr}.pair img{width:100%;height:240px;object-fit:contain;image-rendering:auto;background:repeating-conic-gradient(#718678 0 25%,#52685a 0 50%) 0/20px 20px}button,select{font:inherit;padding:8px}</style><h1>重植版掉落头部 · 10项</h1><p>按原生皮肤组合头、下巴、头发，网格只在离线烘焙时使用。保留原版粒子轨迹；本页用于检查完整头部造型和对齐，尚未接入游戏。</p><button id="export">导出审核 JSON</button><main>'''+cards+'''</main><script>const key='native-heads-review-v1';const saved=JSON.parse(localStorage.getItem(key)||'{}');for(const s of document.querySelectorAll('select')){s.value=saved[s.dataset.id]||'pending';s.onchange=()=>{saved[s.dataset.id]=s.value;localStorage.setItem(key,JSON.stringify(saved))}}document.querySelector('#export').onclick=()=>{const a=document.createElement('a');a.href=URL.createObjectURL(new Blob([JSON.stringify({format:key,reviews:saved},null,2)],{type:'application/json'}));a.download='native-heads-review.json';a.click()};</script>'''
    (WORK/'index.html').write_text(page,encoding='utf-8')
    print('Prepared native head candidates:',len(rows))
if __name__=='__main__':main()
