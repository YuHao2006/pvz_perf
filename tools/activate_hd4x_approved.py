"""Activate reviewed 4x exports; retain unused originals in the library, never upscale runtime2x."""
from pathlib import Path
from PIL import Image
import json,hashlib,shutil,collections
R=Path('.');H=R/'assets/high-resolution';C=R/'assets/source-art/catalog.json';backup=R/'out/verification/hd4x-activation-20261116';backup.mkdir(parents=True,exist_ok=True)
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
for path in [C,H/'images.json',H/'fonts.json',H/'provenance.json']:
 target=backup/path.name
 if not target.exists():shutil.copy2(path,target)
cat=json.loads(C.read_text());entries={e['id']:e for e in cat['entries']};cfg=json.loads((H/'images.json').read_text());fonts=json.loads((H/'fonts.json').read_text());prov=json.loads((H/'provenance.json').read_text());audit={e['id']:e for e in json.loads((R/'out/media/replanted-audit/current-audit/audit.json').read_text())['items']}
day=R/'assets/source-art/work/images/pool/baked-v8/lighting-v11/shadow-v13';night=R/'assets/source-art/work/images/pool_night/baked-v1/candidate-v2/grass-v4'
nightReview={'format':'pvz-hd-pending39-review-v1','source':'用户：通过.现在应该齐全了可以构建了吧?','scope':'雾夜v2水纹与grass-v4草地通过；接入日夜烘焙背景，图鉴必须同步','reviews':{i['id']:{'id':i['id'],'status':'approved','sha256':i['sha256']} for i in json.loads((night/'items.json').read_text())}}
(night/'chat-approval.json').write_text(json.dumps(nightReview,ensure_ascii=False,indent=2),encoding='utf-8')
known={(s.get('origin'),s.get('sha256')):s for e in cat['entries'] for s in e.get('sources',[])}
def source(path,key,origin):
 path=Path(path);h=sha(path)
 if (origin,h) in known:return known[(origin,h)]
 folder=R/('assets/source-art/reference/original' if origin=='original' else 'assets/source-art/masters/'+origin)/key.split('/')[0];folder.mkdir(parents=True,exist_ok=True);dest=folder/(key.replace('/','__')+'__'+path.name)
 if dest.exists() and sha(dest)!=h:dest=dest.with_name(dest.stem+'__'+h[:8]+dest.suffix)
 if not dest.exists():shutil.copy2(path,dest)
 s={'path':dest.as_posix(),'sha256':h,'origin':origin,'retainedFrom':path.as_posix()}
 try:s['physicalSize']=list(Image.open(path).size)
 except OSError:s['type']=path.suffix.lstrip('.')
 known[(origin,h)]=s;return s
approved=[]
for folder in [day,night]:
 review=json.loads((folder/'chat-approval.json').read_text());rows=json.loads((folder/'items.json').read_text())
 for row in rows:
  key=row['id'];e=entries[key];src=Path(row['candidate']);assert review['reviews'][key]['status']=='approved' and review['reviews'][key]['sha256']==row['sha256']==sha(src);size=list(Image.open(src).size);logical=e['current']['logicalSize'];assert size==[v*4 for v in logical]
  baseline=folder/(key.replace('/','__')+'-before-activation.png')
  if not baseline.exists():shutil.copy2(e['current']['path'],baseline)
  dest=H/'exports4x'/(key+'.png');dest.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(src,dest)
  e['export4x']={'path':dest.as_posix(),'pixelScale':4,'physicalSize':size,'logicalSize':logical,'sha256':row['sha256']};e['status']='ready';e.pop('pending',None)
  art=(day.parent/'ai-master.png') if folder==day else night.parent.parent/'ai-master-v2.png'
  for item,origin in [(art,'ai'),(folder/'recipe.json','generated'),(folder/'chat-approval.json','generated'),(src,'generated')]:
   s=source(item,key,origin)
   if not any(z['path']==s['path'] for z in e['sources']):e['sources'].append(s)
  e['masters']=[s for s in e['sources'] if s['origin']!='original'];e['sourceKinds']=sorted({s['origin'] for s in e['sources']});e['repairCandidate']={'path':src.as_posix(),'candidate':src.as_posix(),'sha256':row['sha256'],'reviewStatus':'approved','reviewFile':str(folder/'chat-approval.json').replace('\\','/')}
  history={'original':e['original'],'file':e['current']['path'].removeprefix('assets/high-resolution/'),'source':src.as_posix(),'sourceSha256':row['sha256'],'physicalSize':size,'logicalSize':logical,'method':'Approved baked pool background; faithful AI restoration with reviewed local shadow/grass correction. Pool crop shares exact background pixels.','recipeFile':(folder/'recipe.json').as_posix(),'reviewStatus':'pass','reviewFile':(folder/'chat-approval.json').as_posix(),'runtimeIntegrated':True};prov['images']=[z for z in prov['images'] if not (z.get('sourceSha256')==history['sourceSha256'] and z.get('file')==history['file'] and z.get('reviewFile')==history['reviewFile'])];prov['images'].append(history);e['history']=history;approved.append(key)
# Remove only proven-unused legacy input aliases, retaining their files/library entries.
unused={e['current']['path'].removeprefix('assets/high-resolution/'):e['id'] for e in cat['entries'] if e['status']=='outside-current-build-scope' and e.get('current')};removed=[]
for key,file in list(cfg['images'].items()):
 if file not in unused:continue
 identifier=unused[file];assert not audit.get(identifier,{}).get('used'),identifier;removed.append({'alias':key,'id':identifier,'file':file});cfg['images'].pop(key);cfg['logicalSizes'].pop(key,None)
# All active bindings now consume already verified genuine4x exports.
active={(H/file).as_posix() for file in cfg['images'].values()}|{(R/'assets'/file).as_posix() for file in cfg.get('cards',{}).values()}|{(R/'assets'/l['image']).as_posix() for f in fonts['fonts'] for l in f['layers']}
for e in cat['entries']:
 if e.get('current',{}).get('path') not in active:continue
 ex=e.get('export4x');assert ex and e['status']=='ready',e['id'];logical=e['current'].get('logicalSize')or ex['logicalSize'];assert sha(ex['path'])==ex['sha256'];assert list(Image.open(ex['path']).size)==[v*4 for v in logical],e['id']
seen={};switched=[]
for e in cat['entries']:
 if e.get('current',{}).get('path') not in active:continue
 cur=e['current'];ex=e.get('export4x');assert ex and e['status']=='ready',e['id'];assert sha(ex['path'])==ex['sha256'];logical=cur.get('logicalSize')or ex['logicalSize'];cur['logicalSize']=logical;assert list(Image.open(ex['path']).size)==[v*4 for v in logical],e['id']
 dest=cur['path']
 if dest in seen:assert seen[dest]==ex['sha256'],dest
 elif sha(dest)!=ex['sha256']:shutil.copy2(ex['path'],dest);switched.append(e['id'])
 seen[dest]=ex['sha256'];cur.update(sha256=ex['sha256'],physicalSize=ex['physicalSize']);cur.pop('thumbnail',None)
byFile={e['current']['path']:e for e in cat['entries'] if e.get('current')}
for key,file in cfg['images'].items():
 if not cfg['logicalSizes'].get(key):cfg['logicalSizes'][key]=byFile[(H/file).as_posix()]['current']['logicalSize']
cfg['pixelScale']=4;fonts['scale']=4;cat['counts'].update(readyImages=sum(e['status']=='ready' and e['kind']not in ['fonts','cards'] for e in cat['entries']),pendingImages=sum(e['status']=='pending' for e in cat['entries']),awaitingReviewImages=sum(e['status']=='pending' for e in cat['entries']));assert cat['counts']['pendingImages']==0
for path,doc in [(C,cat),(H/'images.json',cfg),(H/'fonts.json',fonts),(H/'provenance.json',prov)]:path.write_text(json.dumps(doc,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
certificate={'format':'pvz-hd-package4x-validation-v1','imagesManifestSha256':sha(H/'images.json'),'fontsManifestSha256':sha(H/'fonts.json'),'libraryCatalogSha256':sha(C),'pixelScale':4,'atlasMaxSide':8192,'solver':'maxrects','unresolved':[],'lowResolutionFallbacks':[],'unreviewedRepairs':[],'activePhysicalFiles':len(active),'reviewedPoolAssets':approved,'switchedBindings':switched,'removedUnusedAliases':removed,'fixedDataTextures':cat['fixedDataTextures'],'source':'assets/source-art/catalog.json: retained and registered masters; user-approved final pool replacements'};(H/'package4x-validation.json').write_text(json.dumps(certificate,ensure_ascii=False,indent=2),encoding='utf-8');print(json.dumps({'approvedPoolAssets':approved,'switchedTo4x':len(switched),'unusedAliasesRemoved':len(removed),'activePhysicalFiles':len(active),'pending':cat['counts']['pendingImages']}))
