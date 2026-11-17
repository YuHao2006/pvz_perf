"""Register recovered inputs and recipes; keep candidate bindings separate from approved exports."""
from pathlib import Path
import json,hashlib,shutil
from PIL import Image
R=Path('.');path=R/'assets/source-art/catalog.json';cat=json.loads(path.read_text());by={e['id']:e for e in cat['entries']};rows=json.loads(Path('assets/source-art/work/pending-audit/rebuilt-candidates.json').read_text())['items'];existing={}
for e in cat['entries']:
 for s in e.get('sources',[]):existing[(s.get('origin'),s.get('sha256'))]=s
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def register(source,key,origin=None):
 p=Path(source.replace('\\','/'));assert p.is_file(),p;h=sha(p);kind=key.split('/')[0]
 origin=origin or ('original' if '/runtime/' in p.as_posix() else 'ai' if '/ai/' in p.as_posix() or p.name=='ai-master.png' or 'outline-raw' in p.name else 'native' if '/replanted/' in p.as_posix() else 'generated')
 if (origin,h) in existing:return existing[(origin,h)]
 folder=Path('assets/source-art/reference/original' if origin=='original' else 'assets/source-art/masters/'+origin)/kind;folder.mkdir(parents=True,exist_ok=True);name=key.replace('/','__')+'__'+p.name;dest=folder/name
 if dest.exists() and sha(dest)!=h:dest=dest.with_name(dest.stem+'__'+h[:8]+dest.suffix)
 if not dest.exists():shutil.copy2(p,dest)
 row={'path':dest.as_posix(),'sha256':h,'origin':origin,'type':p.suffix.lstrip('.'),'retainedFrom':p.as_posix()}
 try:
  with Image.open(p) as im:row['physicalSize']=list(im.size)
 except OSError:pass
 existing[(origin,h)]=row;return row
for row in rows:
 key=row['id'];e=by[key]
 if e['status']!='pending':continue
 sources=[]
 for source in row['sources']:
  name=source.replace('\\','/')
  if '/high-resolution/exports4x/' in name:
   parent=next((x for x in cat['entries'] if x.get('export4x',{}).get('path')==name),None);assert parent
   sources.extend(parent.get('masters',[]))
  else:sources.append(register(name,key))
 recipe=register(str(Path(row['candidate']).parent/'recipe.json'),key,'generated');sources.append(recipe)
 for x in sources:
  if not any(s['path']==x['path'] for s in e['sources']):e['sources'].append(x)
 e['masters']=[s for s in e['sources'] if s['origin']!='original'];e['sourceKinds']=sorted({s['origin'] for s in e['sources']});e['pending']['technicalStatus']='candidate-complete-awaiting-user-review';e['pending']['reason']='awaiting-user-review';e['repairCandidate']['recipe']=recipe['path'];e['repairCandidate']['sha256']=row['sha256']
cat['counts']['awaitingReviewImages']=sum(e['status']=='pending' for e in cat['entries']);path.write_text(json.dumps(cat,ensure_ascii=False,indent=2)+'\n',encoding='utf-8');print('Registered source/recipe chains',sum(by[r['id']]['status']=='pending' for r in rows),'approved state unchanged')
