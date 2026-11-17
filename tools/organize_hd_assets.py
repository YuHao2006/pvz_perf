"""One-time, reversible move from dated HD work folders to the asset library.

Run --plan first. --apply consumes the saved plan. No image is resampled, no
file is deleted, and the existing Release is never touched.
"""
from pathlib import Path
from PIL import Image
import argparse,collections,hashlib,json,re,shutil,zipfile

ROOT=Path(__file__).resolve().parents[1]
STAMP='2026-11-16-pre-library'
ARCHIVE=f'assets/source-art/archive/{STAMP}'
WORK=ROOT/'out/asset-library-migration-20261116'
TEXT={'.json','.jsonl','.html','.js','.mjs','.py','.ps1','.cmd','.md','.txt','.dsl','.pvzbuild','.cpp','.h','.hpp','.cmake','.xml','.svg'}
SELF=Path(__file__).resolve()
def digest(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def rel(p):return p.relative_to(ROOT).as_posix()
def safe(p):
 p=Path(p).resolve();p.relative_to(ROOT);assert p!=ROOT;return p
def write(p,data):p.parent.mkdir(parents=True,exist_ok=True);p.write_text(json.dumps(data,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
def canon(k):return re.sub(r'\.(png|jpg|jpeg|gif|tga)$','',k.lower())
def plan():
 WORK.mkdir(parents=True,exist_ok=True);assert not(ROOT/ARCHIVE).exists(),'Migration archive already exists'
 cfg=json.loads((ROOT/'assets/high-resolution/images.json').read_text());fonts=json.loads((ROOT/'assets/high-resolution/fonts.json').read_text());stage=ROOT/'assets/source-art/corrections/package4x-staging-20261116';p=json.loads((stage/'plan.json').read_text());cards=json.loads((stage/'cards/cards4x-staged.json').read_text());font4=json.loads((stage/'fonts/validation.json').read_text());prov=json.loads((ROOT/'assets/high-resolution/provenance.json').read_text());audit={x['id']:x for x in json.loads((ROOT/'out/media/replanted-audit/current-audit/audit.json').read_text())['items']};moves=[];copies=[];pathmap={};used=set();byFile=collections.defaultdict(list);catalog={};masters={};rawByHash={};rawCopies=[]
 def destination(prefix,name,signature):
  path=prefix+'/'+name
  if path.lower()in used:path=str(Path(path).with_name(Path(path).stem+'__'+signature[:8]+Path(path).suffix)).replace('\\','/')
  assert path.lower()not in used,path;used.add(path.lower());return path
 for key,file in cfg['images'].items():byFile[file].append(key)
 for file,aliases in sorted(byFile.items()):
  owner=sorted({canon(x)for x in aliases},key=lambda x:(len(x),x))[0];src=ROOT/'assets/high-resolution'/file;assert src.is_file(),src;sha=digest(src);dest=destination('assets/high-resolution/current',owner+'.png',sha);moves.append({'src':rel(src),'dst':dest,'sha256':sha,'role':'current-image','aliases':aliases});pathmap[rel(src)]=dest
  catalog.setdefault(owner,{'id':owner,'kind':owner.split('/')[0],'aliases':[]})['aliases']+=aliases
  catalog[owner]['current']={'path':dest,'sha256':sha,'physicalSize':list(Image.open(src).size),'logicalSize':next((cfg['logicalSizes'][x]for x in aliases if x in cfg['logicalSizes']),None)}
 for seed,file in cfg.get('cards',{}).items():
  src=ROOT/'assets'/file;sha=digest(src);dest=destination('assets/high-resolution/current',f'cards/special_{seed}.png',sha);moves.append({'src':rel(src),'dst':dest,'sha256':sha,'role':'current-card','seedId':int(seed)});pathmap[rel(src)]=dest;catalog['cards/'+seed]={'id':'cards/'+seed,'kind':'cards','aliases':[],'current':{'path':dest,'sha256':sha,'physicalSize':list(Image.open(src).size),'logicalSize':[50,70]}}
 for font in fonts['fonts']:
  for layer in font['layers']:
   src=ROOT/'assets'/layer['image'];sha=digest(src);key=f"fonts/{font['font']}/{layer['id']}"
   if rel(src)in pathmap:dest=pathmap[rel(src)]
   else:
    dest=destination('assets/high-resolution/current',f"fonts/{font['font']}/{layer['id']}.png",sha);moves.append({'src':rel(src),'dst':dest,'sha256':sha,'role':'current-font','font':font['font'],'layer':layer['id']});pathmap[rel(src)]=dest
   catalog[key]={'id':key,'kind':'fonts','aliases':[],'current':{'path':dest,'sha256':sha,'physicalSize':list(Image.open(src).size),'logicalSize':layer['logicalSize']}}
 def sourceFile(value,owner):
  if not isinstance(value,str):return None
  src=Path(value);src=src if src.is_absolute()else ROOT/src
  if not src.is_file()or src.suffix.lower()not in{'.png','.jpg','.jpeg','.tga','.svg','.ttf','.otf','.json','.csv'}:return None
  try:name=rel(src)
  except ValueError:return None
  if name.startswith('assets/high-resolution/')or re.search(r'[-_]2x\.',src.name,re.I):return None
  origin='native'if'/replanted/'in name else'ai'if'/ai/'in name or 'ai-master'in src.name or 'raw-ai'in src.name else'vector'if'/vector/'in name else'original'if'/runtime/'in name or'/original/'in name else'generated'
  sha=digest(src);sig=(origin,sha,src.suffix.lower())
  if sig not in rawByHash:
   basename=src.name
   if basename.lower()in{'ai-master.png','ai-full-raw.png','master.png','manifest.json','generation.json','recipe.json','input-proof.json'}:basename=owner.rsplit('/',1)[-1]+'__'+basename
   prefix='assets/source-art/reference/original'if origin=='original'else f'assets/source-art/masters/{origin}'
   dest=destination(prefix+'/'+owner.split('/')[0],basename,sha);rawByHash[sig]=dest;rawCopies.append({'src':name,'dst':dest,'sha256':sha,'role':'source','origin':origin})
  return {'path':rawByHash[sig],'origin':origin,'originalPath':name}
 def addMaster(key,row):
  src=ROOT/row['master'];logical=row['logicalSize'];assert Image.open(src).size==tuple(v*4 for v in logical),(key,src);sha=digest(src);sig=(sha,tuple(logical));entry=catalog.setdefault(key,{'id':key,'kind':key.split('/')[0],'aliases':[]})
  if sig not in masters:
   dest=destination('assets/high-resolution/exports4x',key+'.png',sha);masters[sig]=dest;copies.append({'src':rel(src),'dst':dest,'sha256':sha,'role':'export4x'})
  entry.update(status='ready',master={'path':masters[sig],'pixelScale':4,'physicalSize':list(Image.open(src).size),'logicalSize':logical,'sha256':sha},history=row,sources=[])
  sources=row.get('source',[]);sources=sources if isinstance(sources,list)else[sources]
  meta=[x for x in prov['images']if canon(x.get('original','').removeprefix('assets/runtime/'))==key]
  for m in meta[-1:]:
   for field in ['source','correction','nativeSources','alphaSource','original']:
    value=m.get(field,[]);sources+=value if isinstance(value,list)else[value]
  for candidate in list(sources)+[row['master']]:
   if isinstance(candidate,str):
    parent=(ROOT/candidate).parent
    for name in ['ai-master.png','ai-full-raw.png']:
     if(parent/name).is_file():sources.append(rel(parent/name))
  for value in sources:
   info=sourceFile(value,key)
   if info and info['path']not in {x['path']for x in entry['sources']}:entry['sources'].append(info)
 for row in p['bindings']:addMaster(row['id'],row)
 for row in cards['cards']:addMaster('cards/'+str(row['seedId']),row)
 for row in font4['ready']:addMaster(f"fonts/{row['font']}/{row['layer']}",row)
 # The old staged font manifest used intended future paths, rather than the
 # location at which its PNGs were actually retained. Give those references a
 # real canonical destination as part of the same move.
 stagedFonts=json.loads((stage/'fonts/fonts4x-staged.json').read_text())
 for font in stagedFonts['fonts']:
  for layer in font['layers']:
   key=f"fonts/{font['font']}/{layer['id']}";pathmap['assets/'+layer['image']]=catalog[key]['master']['path']
 for row in p['unresolved']:catalog.setdefault(row['id'],{'id':row['id'],'kind':row['id'].split('/')[0],'aliases':[]}).update(status='pending',pending=row)
 for key,row in catalog.items():
  row.setdefault('status','outside-current-build-scope');a=audit.get(key,{});row.update(category=a.get('category',row['kind']),group=a.get('group',row['kind']),owners=a.get('owners',[]),original=a.get('original'));row.setdefault('sources',[])
 # All old work is kept in one archive. Ordinary image/font files which are
 # not currently referenced move there too, rather than staying in the inputs.
 planned={x['src']for x in moves}
 for folder in ['assets/high-resolution/images','assets/high-resolution/fonts']:
  for src in(ROOT/folder).rglob('*'):
   if src.is_file()and rel(src)not in planned:pathmap[rel(src)]=ARCHIVE+'/runtime-inputs/'+rel(src).removeprefix('assets/high-resolution/')
 archiveMoves=[{'src':'assets/source-art/'+x.name,'dst':ARCHIVE+'/'+x.name}for x in(ROOT/'assets/source-art').iterdir()if x.is_dir()and x.name!='archive']
 archiveMoves += [{'src':'assets/high-resolution-masters','dst':ARCHIVE+'/legacy-masters'}]
 archiveMoves += [{'src':'assets/high-resolution/'+n,'dst':ARCHIVE+'/runtime-inputs/'+n}for n in ['images','fonts']]
 textFiles=[]
 roots=[ROOT/'assets',ROOT/'docs',ROOT/'tools',ROOT/'CMake',ROOT/'Tests',ROOT/'out/media/replanted-audit',ROOT/'out/verification',ROOT.parent/'PvzDevTools/tools/hd-assets']
 seen=set()
 for folder in roots:
  for f in folder.rglob('*'):
   if f.is_file()and f.suffix.lower()in TEXT and f.resolve()!=SELF and not any(x in f.parts for x in['art-pythondeps','node_modules','__pycache__','.git']):
    if f.resolve()not in seen:seen.add(f.resolve());textFiles.append(str(f.resolve()))
 result={'format':'pvz-hd-library-migration-v1','archive':ARCHIVE,'currentMoves':moves,'masterCopies':copies,'sourceCopies':rawCopies,'archiveMoves':archiveMoves,'pathMap':pathmap,'textFiles':textFiles,'catalogEntries':list(catalog.values()),'fixedDataTextures':p['dataTextures'],'counts':{'readyImages':p['ready'],'pendingImages':p['pending'],'cards':cards['ready'],'fontLayers':len(font4['ready'])}}
 write(WORK/'plan.json',result)
 for f in ['images.json','fonts.json','provenance.json']:shutil.copy2(ROOT/'assets/high-resolution'/f,WORK/('before-'+f))
 print(json.dumps({'currentFiles':len(moves),'unique4xExports':len(copies),'originalResolutionSourceFiles':len(rawCopies),'textFilesToCheck':len(textFiles),'counts':result['counts']},ensure_ascii=False))

def apply():
 d=json.loads((WORK/'plan.json').read_text());assert not(ROOT/d['archive']).exists(),'Migration already applied'
 def archivePath(s):
  for m in sorted(d['archiveMoves'],key=lambda x:len(x['src']),reverse=True):
   if s==m['src']or s.startswith(m['src']+'/'):return m['dst']+s[len(m['src']):]
  return s
 def sourcePath(s):
  candidates=[ROOT/s,ROOT/d['pathMap'].get(s,s),ROOT/archivePath(s)]
  return next((p for p in candidates if p.is_file()),candidates[0])
 # Validate the complete operation before touching any path.
 for row in d['currentMoves']+d['masterCopies']+d['sourceCopies']:
  src=safe(sourcePath(row['src']));dst=safe(ROOT/row['dst'])
  if dst.exists():assert digest(dst)==row['sha256'],dst
  else:assert src.is_file()and digest(src)==row['sha256'],src
 def copy(row):
  src=safe(sourcePath(row['src']));dst=safe(ROOT/row['dst'])
  if dst.exists():assert digest(dst)==row['sha256'];return
  dst.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(src,dst);assert digest(dst)==row['sha256']
 # Copy canonical sources before their dated work folders are moved. New
 # source JSON joins the path rewrite, while the new final catalog is emitted last.
 for row in d['sourceCopies']:copy(row)
 for row in d['currentMoves']:
  src=safe(ROOT/row['src']);dst=safe(ROOT/row['dst'])
  if dst.exists():assert digest(dst)==row['sha256'];continue
  dst.parent.mkdir(parents=True,exist_ok=True);src.rename(dst)
 for row in d['archiveMoves']:
  src=safe(ROOT/row['src']);dst=safe(ROOT/row['dst']);dst.parent.mkdir(parents=True,exist_ok=True);assert src.exists()and not dst.exists();src.rename(dst)
 for row in d['masterCopies']:
  old=sourcePath(row['src']);dst=ROOT/row['dst'];dst.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(old,dst);assert digest(dst)==row['sha256']
 pathmap=d['pathMap'];bare={k.removeprefix('assets/high-resolution/'):Path(v).relative_to(ROOT/'assets/high-resolution').as_posix()if Path(v).is_absolute()else str(Path(__import__('os').path.relpath(ROOT/v,ROOT/'assets/high-resolution'))).replace('\\','/') for k,v in pathmap.items()}
 # Match known full file names first, then old work prefixes. Never create
 # junctions/symlinks: all current references resolve to real final locations.
 filePattern=re.compile(r'assets[\\/]+high-resolution[\\/]+(?:images|fonts|fonts4x)[\\/]+[^\s\"\'<>(),;]+')
 prefixPattern=re.compile(r'assets[\\/]+source-art[\\/]+(ai|corrections|landscape-ui|original|replanted|vector)(?=[\\/]|$)|assets[\\/]+high-resolution-masters[\\/]+(main-menu|reanim|selector-state-pairs)(?=[\\/]|$)')
 def value(s,bareAllowed=False):
  if bareAllowed and s in bare:return bare[s]
  if bareAllowed and s.startswith('high-resolution/')and 'assets/'+s in pathmap:return pathmap['assets/'+s].removeprefix('assets/')
  def file(m):
   key=re.sub(r'[\\/]+','/',m.group());return pathmap.get(key,m.group())
  s=filePattern.sub(file,s)
  def prefix(m):return d['archive']+'/'+m.group(1)if m.group(1)else d['archive']+'/legacy-masters/'+m.group(2)
  return prefixPattern.sub(prefix,s)
 def tree(x):
  if isinstance(x,str):return value(x,True)
  if isinstance(x,list):return [tree(v)for v in x]
  if isinstance(x,dict):return {value(k):tree(v)for k,v in x.items()}
  return x
 changed=[];skipped=[];backups=WORK/'path-rewrites-before.zip'
 files=[Path(s)for s in d['textFiles']]+[ROOT/x['dst']for x in d['sourceCopies']if Path(x['dst']).suffix.lower()in TEXT]
 def location(f):
  try:return ROOT/archivePath(rel(f))
  except ValueError:return f
 with zipfile.ZipFile(backups,'w',compression=zipfile.ZIP_DEFLATED)as z:
  for f in files:
   f=location(f)
   if not f.is_file():continue
   data=f.read_bytes()
   try:text=data.decode('utf-8-sig')
   except UnicodeError:skipped.append(str(f));continue
   if not any(x in text for x in ['source-art','high-resolution','images/']):continue
   new=value(text)
   if f.suffix.lower()=='.json':
    try:
     obj=json.loads(text);updated=tree(obj)
     if updated!=obj:new=json.dumps(updated,ensure_ascii=False,indent=2 if '\n'in text else None)
    except ValueError:pass
   else:new=re.sub(r'([\"\'])(images/[^\"\']+)\1',lambda m:m.group(1)+bare.get(m.group(2),m.group(2))+m.group(1),new)
   if new==text:continue
   name=str(f).replace(':','').replace('\\','/').lstrip('/');z.writestr(name,data);f.write_text(new,encoding='utf-8');changed.append(str(f))
 cfg=json.loads((WORK/'before-images.json').read_text());fonts=json.loads((WORK/'before-fonts.json').read_text())
 for key,file in list(cfg['images'].items()):cfg['images'][key]=pathmap['assets/high-resolution/'+file].removeprefix('assets/high-resolution/')
 for seed,file in list(cfg.get('cards',{}).items()):cfg['cards'][seed]=pathmap['assets/'+file].removeprefix('assets/')
 for font in fonts['fonts']:
  for layer in font['layers']:layer['image']=pathmap['assets/'+layer['image']].removeprefix('assets/')
 write(ROOT/'assets/high-resolution/images.json',cfg);write(ROOT/'assets/high-resolution/fonts.json',fonts)
 entries=tree(d['catalogEntries'])
 for entry in entries:
  for source in entry.get('sources',[]):
   source['originalPath']=archivePath(source['originalPath']);source['sha256']=digest(ROOT/source['path'])
 # Final package scale is independent of master resolution. Imported source
 # bytes retain their native/AI resolution; registered 4x rasters are exports.
 originals={x['id']:x for x in d['catalogEntries']}
 for entry in entries:
  if originals[entry['id']].get('master'):entry['export4x']=originals[entry['id']]['master'];entry.pop('master',None)
  entry['sourceKinds']=sorted({x['origin']for x in entry.get('sources',[])})
  entry['masters']=[]
  for source in entry.get('sources',[]):
   if source['origin']=='original':continue
   p=ROOT/source['path'];info={k:v for k,v in source.items()if k!='originalPath'}
   try:info['physicalSize']=list(Image.open(p).size)
   except (OSError,ValueError):info['type']=p.suffix.lstrip('.')
   entry['masters'].append(info)
 catalog={'format':'pvz-hd-asset-library-v1','buildPixelScale':4,'masterResolution':'preserve-native-or-approved-source-resolution','masterDownsampledOnImport':False,'counts':d['counts'],'entries':entries,'fixedDataTextures':d['fixedDataTextures'],'archive':d['archive'],'workflow':'Native/AI/vector masters retain original resolution. Registered 4x outputs are separate build exports. Current inputs retain their existing pixels and scale until full migration. Historical candidates/recipes/reviews stay in the archive.'}
 write(ROOT/'assets/source-art/catalog.json',catalog)
 validation={'currentFiles':len(d['currentMoves']),'canonical4xExports':len(d['masterCopies']),'sourceFiles':len(d['sourceCopies']),'rewrittenTextFiles':len(changed),'unreadableTextFiles':skipped,'currentContentChanges':[],'exportContentChanges':[],'releaseRebuilt':False}
 for row in d['currentMoves']:
  if digest(ROOT/row['dst'])!=row['sha256']:validation['currentContentChanges'].append(row['dst'])
 for row in d['masterCopies']:
  if digest(ROOT/row['dst'])!=row['sha256']:validation['exportContentChanges'].append(row['dst'])
 assert not validation['currentContentChanges']and not validation['exportContentChanges']
 # Glyph geometry, logical sizes, card indices and all non-path configuration
 # fields remain exactly the same as before organization.
 oldCfg=json.loads((WORK/'before-images.json').read_text());assert cfg['logicalSizes']==oldCfg['logicalSizes']and cfg['pixelScale']==oldCfg['pixelScale'];assert set(cfg['images'])==set(oldCfg['images'])
 write(WORK/'result.json',validation);write(ROOT/(d['archive']+'/migration-result.json'),validation);print(json.dumps(validation,ensure_ascii=False))

if __name__=='__main__':
 ap=argparse.ArgumentParser();g=ap.add_mutually_exclusive_group(required=True);g.add_argument('--plan',action='store_true');g.add_argument('--apply',action='store_true');a=ap.parse_args();plan()if a.plan else apply()
