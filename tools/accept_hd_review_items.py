"""Bind only explicitly approved, hash-pinned items from a review batch."""
from pathlib import Path
from PIL import Image
import argparse,json,hashlib,shutil
ROOT=Path(__file__).resolve().parents[1]
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def save(p,d):p.write_text(json.dumps(d,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
def main():
    ap=argparse.ArgumentParser();ap.add_argument('--batch',required=True);ap.add_argument('--id',action='append',required=True);ap.add_argument('--message',required=True);args=ap.parse_args()
    folder=(ROOT/args.batch).resolve();folder.relative_to(ROOT/'assets/source-art/work')
    rows=json.loads((folder/'items.json').read_text());selected=[x for x in rows if x['id'] in args.id];assert len(selected)==len(set(args.id))
    cp=ROOT/'assets/source-art/catalog.json';cat=json.loads(cp.read_text());es={e['id']:e for e in cat['entries']};hd=ROOT/'assets/high-resolution';cfg=json.loads((hd/'images.json').read_text());prov=json.loads((hd/'provenance.json').read_text());work=ROOT/'assets/source-art/work/live-build-coverage';rec=json.loads((work/'recovery.json').read_text())
    approvalPath=folder/'chat-approval.json';approval=json.loads(approvalPath.read_text()) if approvalPath.exists() else {'format':'pvz-hd-chat-approval-v1','reviews':{}}
    for row in selected:
        key=row['id'];e=es[key];src=ROOT/row['candidate'];digest=sha(src);assert digest==row['sha256'];logical=row['logicalSize'];physical=list(Image.open(src).size);assert physical==[v*4 for v in logical]
        dest=hd/'exports4x'/(key+'.png');dest.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(src,dest);cur=hd/'current'/(key+'.png');cur.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(src,cur)
        e['current']={'path':cur.relative_to(ROOT).as_posix(),'sha256':digest,'physicalSize':physical,'logicalSize':logical};e['export4x']={**e['current'],'path':dest.relative_to(ROOT).as_posix(),'pixelScale':4};e['status']='ready';e.pop('pending',None);e['aliases']=sorted(set(e.get('aliases',[]))|{key,key+'.png'})
        for alias in e['aliases']:cfg['images'][alias]=cur.relative_to(hd).as_posix();cfg['logicalSizes'][alias]=logical
        e['repairCandidate'].update(reviewStatus='approved',reviewFile=approvalPath.relative_to(ROOT).as_posix());row.update(reviewStatus='approved',runtimeIntegrated=True)
        e['history']={'file':cur.relative_to(hd).as_posix(),'source':row.get('master',row.get('nativeMaster',row.get('original'))),'method':row['method'],'reviewStatus':'pass','reviewFile':approvalPath.relative_to(ROOT).as_posix(),'logicalSize':logical,'physicalSize':physical,'runtimeIntegrated':True}
        prov['images']=[x for x in prov['images'] if not(x.get('file')==e['history']['file'] and x.get('reviewFile')==e['history']['reviewFile'])];prov['images'].append(e['history']);approval['reviews'][key]={'status':'approved','sha256':digest,'userMessage':args.message}
    ids={r['id'] for r in selected};rec['unresolved']=[x for x in rec['unresolved'] if x.get('id',x['source']).lower().removesuffix('.png') not in ids];rec['counts']['unresolved']=len(rec['unresolved']);rec['approvedOriginalRepairs']=sorted(set(rec.get('approvedOriginalRepairs',[]))|ids)
    cat['counts'].update(readyImages=sum(e['status']=='ready' and e['kind'] not in ['fonts','cards'] for e in cat['entries']),pendingImages=sum(e['status']=='pending' for e in cat['entries']),awaitingReviewImages=sum(e.get('repairCandidate',{}).get('reviewStatus')=='pending' for e in cat['entries']))
    for p,d in [(cp,cat),(hd/'images.json',cfg),(hd/'provenance.json',prov),(folder/'items.json',rows),(approvalPath,approval),(work/'recovery.json',rec)]:save(p,d)
    cert=json.loads((hd/'package4x-validation.json').read_text());cert.update(imagesManifestSha256=sha(hd/'images.json'),libraryCatalogSha256=sha(cp),unresolved=rec['unresolved'],unreviewedRepairs=[key for key in cert.get('unreviewedRepairs',[]) if key not in ids]);save(hd/'package4x-validation.json',cert)
    status=json.loads((work/'status.json').read_text());status.update(unresolvedCompilerReferences=len(rec['unresolved']),originalRepairCandidatesAwaitingReview=cat['counts']['awaitingReviewImages'],approvedOriginalRepairs=rec['approvedOriginalRepairs'],newAIIntegrated=True);save(work/'status.json',status)
    print('Approved/bound:',sorted(ids),'remaining:',len(rec['unresolved']))
if __name__=='__main__':main()
