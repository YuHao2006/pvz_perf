"""Integrate exact-hash user-approved candidates; never accept pending items."""
from pathlib import Path
import json,hashlib,shutil,argparse,collections
from PIL import Image
ap=argparse.ArgumentParser();ap.add_argument('--review',type=Path,required=True);args=ap.parse_args();R=Path('.');cp=R/'assets/source-art/catalog.json';cat=json.loads(cp.read_text());entries={e['id']:e for e in cat['entries']};batch=R/'assets/source-art/work/pending-audit/rebuilt-candidates.json';doc=json.loads(batch.read_text());rows={r['id']:r for r in doc['items']};review=json.loads(args.review.read_text(encoding='utf-8'));assert review['format']=='pvz-hd-pending39-review-v1';sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest();saved=R/'assets/source-art/work/pending-audit/reviews'/('review-'+sha(args.review)[:16]+'.json');saved.parent.mkdir(parents=True,exist_ok=True)
# Validate the whole request before changing any bindings.
for key,v in review['reviews'].items():
 assert key in rows and v['sha256']==rows[key]['sha256'],key
 assert sha(rows[key]['candidate'])==v['sha256'],key
 assert v['status'] in ['approved','pending','rejected'],v
shutil.copy2(args.review,saved);provPath=R/'assets/high-resolution/provenance.json';prov=json.loads(provPath.read_text());integrated=[];remaining=[]
for key,v in review['reviews'].items():
 e=entries[key];row=rows[key];row['reviewStatus']=v['status'];row['reviewFile']=saved.as_posix();row['reviewNote']=v.get('note','');e['repairCandidate']['reviewStatus']=v['status'];e['repairCandidate']['reviewFile']=saved.as_posix()
 if v['status']!='approved':remaining.append(key);continue
 src=Path(row['candidate']);baseline=src.parent/'baseline-before-4x.png'
 if not baseline.exists():shutil.copy2(e['current']['path'],baseline)
 row['baseline']=baseline.as_posix();dest=R/'assets/high-resolution/exports4x'/(key+'.png');dest.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(src,dest);shutil.copy2(src,e['current']['path']);e['current'].update(sha256=row['sha256'],physicalSize=row['physicalSize']);e['current'].pop('thumbnail',None)
 e['export4x']={'path':dest.as_posix(),'pixelScale':4,'physicalSize':row['physicalSize'],'logicalSize':row['logicalSize'],'sha256':row['sha256']};e['status']='ready';e.pop('pending',None)
 record={'original':e['original'],'file':e['current']['path'].removeprefix('assets/high-resolution/'),'source':row['candidate'],'sourceSha256':row['sha256'],'physicalSize':row['physicalSize'],'logicalSize':row['logicalSize'],'method':row['method'],'recipeFile':str(src.parent/'recipe.json').replace('\\','/'),'reviewStatus':'pass','reviewFile':saved.as_posix(),'runtimeIntegrated':True,'mapping':{'logicalDrawRect':[0,0,*row['logicalSize']],'originalLogicalCanvas':row['logicalSize'],'pixelPerLogical':[4,4]}}
 prov['images'].append(record);e['history']=record;integrated.append(key)
cat['counts']['readyImages']=sum(e['status']=='ready' and e['kind'] not in ['cards','fonts'] for e in cat['entries']);cat['counts']['pendingImages']=sum(e['status']=='pending' for e in cat['entries']);cat['counts']['awaitingReviewImages']=cat['counts']['pendingImages'];cp.write_text(json.dumps(cat,ensure_ascii=False,indent=2)+'\n',encoding='utf-8');provPath.write_text(json.dumps(prov,ensure_ascii=False,indent=2)+'\n',encoding='utf-8');batch.write_text(json.dumps(doc,ensure_ascii=False,indent=2)+'\n',encoding='utf-8');result={'integrated':integrated,'remaining':[e['id'] for e in cat['entries'] if e['status']=='pending'],'reviewFile':saved.as_posix(),'releaseRebuilt':False};(R/'assets/source-art/work/pending-audit/integration.json').write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n',encoding='utf-8');print('Integrated',len(integrated),'remaining',remaining)
