"""Restore source-proven live variants and report remaining compiler-discovered gaps."""
from pathlib import Path
from PIL import Image
import hashlib,json,shutil

ROOT=Path(__file__).resolve().parents[1]
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def save(p,d):p.write_text(json.dumps(d,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
def main():
    root=ROOT;hd=root/'assets/high-resolution';cp=root/'assets/source-art/catalog.json'
    cat=json.loads(cp.read_text());cfg=json.loads((hd/'images.json').read_text())
    prov=json.loads((hd/'provenance.json').read_text())
    report=json.loads((root/'assets/source-art/work/live-build-coverage/recovery.json').read_text())
    entries={e['id']:e for e in cat['entries']}
    known={s['sha256']:s for e in cat['entries'] for s in e.get('sources',[]) if s.get('origin')=='native'}
    restored=[]
    for row in report['recovered']:
        key=row['id'];e=entries[key];src=root/row['master'];logical=row['logicalSize']
        with Image.open(src) as im:physical=list(im.size)
        assert physical==[v*4 for v in logical],key
        if row['proof']!='catalog export hash and approval retained':
            proof=json.loads((root/row['proof']).read_text())
            assert proof['approved2xAlphaMAE']<=.01 and proof['approved2xVisibleRGBMAE']<=.01
            native=root/proof['source'];digest=sha(native)
            assert digest==proof['sourceSha256']
            s=known.get(digest)
            if not s:
                dest=root/'assets/source-art/masters/native'/e['kind']/native.name
                if dest.exists() and sha(dest)!=digest:dest=dest.with_name(dest.stem+'__'+digest[:8]+dest.suffix)
                dest.parent.mkdir(parents=True,exist_ok=True)
                if not dest.exists():shutil.copy2(native,dest)
                s={'path':dest.relative_to(root).as_posix(),'sha256':digest,'origin':'native','originalPath':proof['source'],'physicalSize':list(Image.open(native).size)}
                known[digest]=s
            if not any(x['path']==s['path'] for x in e['sources']):e['sources'].append(s)
        export=hd/'exports4x'/(key+'.png');export.parent.mkdir(parents=True,exist_ok=True)
        if src.resolve()!=export.resolve():shutil.copy2(src,export)
        current=hd/'current'/(key+'.png');current.parent.mkdir(parents=True,exist_ok=True)
        shutil.copy2(export,current)
        digest=sha(export)
        e['current']={'path':current.relative_to(root).as_posix(),'sha256':digest,'physicalSize':physical,'logicalSize':logical}
        e['export4x']={'path':export.relative_to(root).as_posix(),'sha256':digest,'physicalSize':physical,'logicalSize':logical,'pixelScale':4}
        # Keep compiler original spelling as an alias as well as canonical ID.
        aliases=set(e.get('aliases',[]))|{key,key+'.png'}
        e['aliases']=sorted(aliases)
        for alias in aliases:cfg['images'][alias]=current.relative_to(hd).as_posix();cfg['logicalSizes'][alias]=logical
        e['status']='ready';e.pop('pending',None)
        e['owners']=sorted(set(e.get('owners',[]))|set(row['definitions']))
        e['masters']=[s for s in e['sources'] if s['origin']!='original']
        e['sourceKinds']=sorted({s['origin'] for s in e['sources']})
        history={'file':current.relative_to(hd).as_posix(),'source':row['source'],'method':row['method'],'recipeFile':row['proof'],'physicalSize':physical,'logicalSize':logical,'runtimeIntegrated':True}
        if not any(x.get('recipeFile')==row['proof'] and x.get('file')==history['file'] for x in prov['images']):prov['images'].append(history)
        e['history']=history;restored.append(key)
    for row in report['unresolved']:
        key=row.get('id',row['source']).lower().removesuffix('.png').removesuffix('.jpg')
        e=entries.get(key)
        if not e:
            e={'id':key,'kind':key.split('/')[0],'aliases':[],'sources':[],'sourceKinds':[],'masters':[],'owners':[],'category':'Reanim' if key.startswith('reanim/') else '粒子','group':'编译确认的变体缺口','original':'assets/runtime/'+row['source'].removeprefix('assets/runtime/').removesuffix('.png')+'.png'}
            cat['entries'].append(e);entries[key]=e
        if e:
            e['status']='pending'
            e['pending']={'reason':'Compiler-confirmed live variant lacks verified 4x binding. Trace native attachments/prefabs first.','definitions':row['definitions']}
            e['owners']=sorted(set(e.get('owners',[]))|set(row['definitions']))
    cat['counts'].update(readyImages=sum(e['status']=='ready' and e['kind'] not in ['fonts','cards'] for e in cat['entries']),pendingImages=sum(e['status']=='pending' for e in cat['entries']),awaitingReviewImages=0)
    for p,d in [(cp,cat),(hd/'images.json',cfg),(hd/'provenance.json',prov)]:save(p,d)
    cert=json.loads((hd/'package4x-validation.json').read_text())
    cert.update(imagesManifestSha256=sha(hd/'images.json'),libraryCatalogSha256=sha(cp),unresolved=report['unresolved'],source='Actual compiler reference coverage including live variants; unresolved items block packaging.')
    save(hd/'package4x-validation.json',cert)
    save(root/'assets/source-art/work/live-build-coverage/integration.json',{'restored':restored,'unresolved':report['unresolved'],'noNewAIIntegrated':True})
    print(json.dumps({'restored':len(restored),'remaining':len(report['unresolved'])}))
if __name__=='__main__':main()
