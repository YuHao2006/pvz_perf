"""Apply the explicit chat approval for the 18 native gap candidates."""
from pathlib import Path
from PIL import Image
import json,hashlib,shutil
ROOT=Path(__file__).resolve().parents[1]
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def save(p,d):p.write_text(json.dumps(d,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
def main():
    root=ROOT;hd=root/'assets/high-resolution';work=root/'assets/source-art/work/live-build-coverage';folder=work/'native-heads'
    rows=json.loads((folder/'items.json').read_text());assert len(rows)==18
    cp=root/'assets/source-art/catalog.json';cat=json.loads(cp.read_text());es={e['id']:e for e in cat['entries']}
    cfg=json.loads((hd/'images.json').read_text());prov=json.loads((hd/'provenance.json').read_text());recovery=json.loads((work/'recovery.json').read_text())
    approval={'format':'pvz-hd-chat-approval-v1','userMessage':'全部通过','scope':'18 native gap candidates displayed at native-heads/?rev=18-native','reviews':{}}
    for row in rows:
        e=es[row['id']];src=root/row['candidate'];digest=sha(src);logical=row['logicalSize'];physical=list(Image.open(src).size)
        assert physical==[v*4 for v in logical]
        if e.get('repairCandidate'):assert e['repairCandidate']['sha256']==digest
        approval['reviews'][row['id']]={'status':'approved','sha256':digest}
        dest=hd/'exports4x'/(row['id']+'.png');dest.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(src,dest)
        cur=hd/'current'/(row['id']+'.png');cur.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(dest,cur)
        e['current']={'path':cur.relative_to(root).as_posix(),'sha256':digest,'physicalSize':physical,'logicalSize':logical}
        e['export4x']={'path':dest.relative_to(root).as_posix(),'sha256':digest,'physicalSize':physical,'logicalSize':logical,'pixelScale':4}
        e['status']='ready';e.pop('pending',None);e['aliases']=sorted(set(e.get('aliases',[]))|{row['id'],row['id']+'.png'})
        for alias in e['aliases']:cfg['images'][alias]=cur.relative_to(hd).as_posix();cfg['logicalSizes'][alias]=logical
        row.update(reviewStatus='approved',runtimeIntegrated=True)
        e['repairCandidate']['reviewStatus']='approved';e['repairCandidate']['reviewFile']=(folder/'chat-approval.json').relative_to(root).as_posix()
        e['history']={'file':cur.relative_to(hd).as_posix(),'source':row['nativeMaster'],'sourceSha256':sha(root/row['nativeMaster']),'method':row['method'],'reviewFile':e['repairCandidate']['reviewFile'],'reviewStatus':'pass','physicalSize':physical,'logicalSize':logical,'runtimeIntegrated':True}
        prov['images']=[p for p in prov['images'] if not(p.get('file')==e['history']['file'] and p.get('reviewFile')==e['history']['reviewFile'])];prov['images'].append(e['history'])
    ids={r['id'] for r in rows};recovery['unresolved']=[r for r in recovery['unresolved'] if r.get('id',r['source']).lower().removesuffix('.png') not in ids]
    recovery['reviewedNativeBindings']=sorted(ids);recovery['counts'].update(reviewedNative=18,unresolved=len(recovery['unresolved']))
    cat['counts'].update(readyImages=sum(e['status']=='ready' and e['kind'] not in ['fonts','cards'] for e in cat['entries']),pendingImages=sum(e['status']=='pending' for e in cat['entries']),awaitingReviewImages=0)
    for path,doc in [(folder/'items.json',rows),(folder/'chat-approval.json',approval),(work/'recovery.json',recovery),(cp,cat),(hd/'images.json',cfg),(hd/'provenance.json',prov)]:save(path,doc)
    cert=json.loads((hd/'package4x-validation.json').read_text());cert.update(imagesManifestSha256=sha(hd/'images.json'),libraryCatalogSha256=sha(cp),unresolved=recovery['unresolved'],unreviewedRepairs=[]);save(hd/'package4x-validation.json',cert)
    page=(folder/'index.html').read_text();page=page.replace('尚未接入','已通过并绑定4×输入').replace('保留原版粒子轨迹；本页用于检查完整头部造型和对齐，尚未接入游戏。','保留原版粒子轨迹；18项已经用户确认通过。');page=page.replace("s.value=saved[s.dataset.id]||'pending'","s.value='approved';saved[s.dataset.id]='approved';s.disabled=true");(folder/'index.html').write_text(page,encoding='utf-8')
    save(work/'status.json',{'restoredApprovedBindings':54,'approvedNativeBindings':18,'unresolvedCompilerReferences':len(recovery['unresolved']),'nativeCandidatesAwaitingReview':0,'stillTracingNativeSources':[r['source'] for r in recovery['unresolved']],'new4xPackageBuilt':False,'newAIIntegrated':False})
    print('Approved and bound 18 native candidates; remaining:',len(recovery['unresolved']))
if __name__=='__main__':main()
