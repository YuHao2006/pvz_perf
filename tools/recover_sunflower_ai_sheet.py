"""Recover the earlier complete AI sheet; preserve approved wink and its master."""
from pathlib import Path
from PIL import Image
import json,hashlib,sys
import numpy as np
ROOT=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(ROOT/'out/verification/art-pythondeps'))
import cv2
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def save(p,d):p.write_text(json.dumps(d,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
def main():
    root=ROOT;folder=root/'assets/source-art/work/live-build-coverage/sunflower-original-v2'
    master=root/'assets/source-art/masters/ai/reanim/SunFlower_expressions-original-six-sheet.png';sheet=Image.open(master).convert('RGBA')
    items=json.loads((folder/'items.json').read_text());wink=next(x for x in items if x['suffix']=='wink');assert wink['reviewStatus']=='approved'
    rows=[]
    for i in range(5):
        name='sing'+str(i+1);out=folder/name;out.mkdir(exist_ok=True)
        box=[round(i%3*sheet.width/3),round(i//3*sheet.height/2),round((i%3+1)*sheet.width/3),round((i//3+1)*sheet.height/2)]
        cell=np.asarray(sheet.crop(box)).copy();binary=(cell[:,:,3]>32).astype('uint8')
        n,labels,stats,_=cv2.connectedComponentsWithStats(binary);component=1+np.argmax(stats[1:,4]);core=(labels==component).astype('uint8')
        keep=cv2.dilate(core,np.ones((3,3),np.uint8));isolated=(cell[:,:,3]>0)&(keep==0);cell[:,:,3][isolated]=0
        # Red export speckles occur at the outer alpha edge. Preserve the red
        # tongue in the opaque interior and replace only contaminated edge RGB.
        dist=cv2.distanceTransform(core,cv2.DIST_L2,5);rgb=cell[:,:,:3].astype(float)
        red=(rgb[:,:,0]>150)&(rgb[:,:,1]<90)&(rgb[:,:,0]>2.5*rgb[:,:,1])&(rgb[:,:,0]>1.6*rgb[:,:,2])&(dist<5)&(cell[:,:,3]>0)
        valid=((core>0)&(~red)).astype('uint8');_,nearest=cv2.distanceTransformWithLabels(1-valid,cv2.DIST_L2,5,labelType=cv2.DIST_LABEL_PIXEL)
        yy,xx=np.where(valid);colors=cell[yy,xx,:3];replacements=colors[np.clip(nearest-1,0,len(colors)-1)];cell[:,:,:3][red]=replacements[red]
        x,y,w,h,_=stats[component];tight=[max(0,int(x)-2),max(0,int(y)-2),min(cell.shape[1],int(x+w)+2),min(cell.shape[0],int(y+h)+2)]
        clean=Image.fromarray(cell).crop(tight);clean.save(out/'sheet-clean-master.png')
        original=root/'assets/runtime/reanim'/('SunFlower_head_'+name+'.png');bounds=Image.open(original).getbbox();assert bounds
        scale=min((bounds[2]-bounds[0])*4/clean.width,(bounds[3]-bounds[1])*4/clean.height)
        resized=clean.resize((round(clean.width*scale),round(clean.height*scale)),Image.Resampling.LANCZOS)
        pos=(round((bounds[0]+bounds[2])*2-resized.width/2),round((bounds[1]+bounds[3])*2-resized.height/2));candidate=Image.new('RGBA',(228,172));candidate.alpha_composite(resized,pos);dest=out/'candidate-4x.png';candidate.save(dest)
        recipe={'master':master.relative_to(root).as_posix(),'masterSha256':sha(master),'masterPhysicalSize':list(sheet.size),'sourceCell':box,'componentBounds':list(map(int,stats[component,:4])),'cleanCrop':tight,'removedIsolatedAlphaPixels':int(isolated.sum()),'repairedRedEdgePixels':int(red.sum()),'redTongueInteriorPreserved':True,'uniformScale':scale,'position4x':pos,'logicalSize':[57,43],'physicalSize':[228,172],'reviewStatus':'pending','runtimeIntegrated':False,'recovery':'Earlier successful AI generation located in original tool output; no new image generation'}
        save(out/'sheet-recovery.json',recipe)
        rows.append({'id':'reanim/sunflower_head_'+name,'suffix':name,'candidate':dest.relative_to(root).as_posix(),'original':original.relative_to(root).as_posix(),'logicalSize':[57,43],'physicalSize':[228,172],'sha256':sha(dest),'master':master.relative_to(root).as_posix(),'recipeFile':(out/'sheet-recovery.json').relative_to(root).as_posix(),'method':'Recovered original six-expression AI sheet; isolated alpha speckles removed, red outer-edge RGB repaired, uniform fit into original logical canvas','reviewStatus':'pending','runtimeIntegrated':False})
    rows.append(wink);save(folder/'items.json',rows)
    # Reuse verified source-record animation; only replace the five reference faces.
    mp=folder/'motion/catalog.json';catalog=json.loads(mp.read_text())
    for row in rows:
        a=catalog['assets']['IMAGE_REANIM_SUNFLOWER_HEAD_'+row['suffix'].upper()];a['hd']={'url':'/'+row['candidate'],'mapping':{'logicalDrawRect':[0,0,57,43]}};a['status']=row['reviewStatus']
    save(mp,catalog)
    page=folder/'motion/index.html';s=page.read_text().replace('原版单眼眨眼修复 · 完整动画对照','原版AI六表情 · 完整动画对照').replace('相同高清部件＋原版AI修复的wink','相同高清部件＋原版AI六表情').replace('口型演示（其余5张尚未修复）','连续口型演示（非歌词时间轴）').replace('id="autoSing" type="checkbox"','id="autoSing" type="checkbox" checked').replace('本轮只完成wink，其余5张保留原版参考，不作为已完成修复。','五种口型来自找回的旧AI整图，wink保留已通过的单独修复版。');page.write_text(s,encoding='utf-8')
    player=folder/'motion/player.js';s=player.read_text().replace('pvz-hd-original-sunflower-wink-v2','pvz-hd-original-sunflower-six-recovered-v3').replace('await choose();$("variant").value="6";setupVariant();await loadImages();requestAnimationFrame(tick)','await choose();requestAnimationFrame(tick)');player.write_text(s,encoding='utf-8')
    cp=root/'assets/source-art/catalog.json';cat=json.loads(cp.read_text());es={e['id']:e for e in cat['entries']}
    for row in rows[:5]:
        e=es[row['id']];e['repairCandidate']={'path':row['candidate'],'candidate':row['candidate'],'sha256':row['sha256'],'physicalSize':[228,172],'reviewStatus':'pending','reviewUrl':'/assets/source-art/work/live-build-coverage/sunflower-original-v2/','method':row['method']};e['pending']['finding']='已找回更早成功生成的6表情AI整图；5种口型已提取清理并对齐，待审核，未绑定。'
        source={'path':master.relative_to(root).as_posix(),'origin':'ai','sha256':sha(master),'physicalSize':list(sheet.size)}
        if not any(x['path']==source['path'] for x in e['sources']):e['sources'].append(source)
        e['masters']=[x for x in e['sources'] if x['origin']!='original'];e['sourceKinds']=sorted({x['origin'] for x in e['sources']})
    cat['counts']['awaitingReviewImages']=5;save(cp,cat)
    save(folder/'generation-status.json',{'completed':['wink'],'approvedAndBound':['wink'],'recoveredHistoricalAI':['sing1','sing2','sing3','sing4','sing5'],'awaitingReview':['sing1','sing2','sing3','sing4','sing5'],'missingCandidates':[],'allRequestsFinished':True,'recentAttemptStillFailed':True,'historicalMaster':master.relative_to(root).as_posix(),'correction':'Recent five generation requests failed, but five usable expressions already existed in an earlier successful sheet. They were omitted from the asset library, not absent.','noNewGeneration':True})
    print('Recovered5 expressions from retained AI sheet; approved wink unchanged')
if __name__=='__main__':main()
