from pathlib import Path
import json,shutil
R=Path('.');base=Path('assets/source-art/work/pending-audit');doc=json.loads((base/'rebuilt-candidates.json').read_text());catalog=json.loads(Path('assets/source-art/catalog.json').read_text());entries={x['id']:x for x in catalog['entries']};out=Path('out/media/replanted-audit/pending39-4x');out.mkdir(parents=True,exist_ok=True)
for row in doc['items']:
 e=entries[row['id']];row['group']=e['group'];row['original']=e['original'];row['kind']=e['kind'];e['repairCandidate']={k:row[k] for k in ['candidate','sha256','physicalSize','logicalSize','reviewStatus']};e['repairCandidate']['reviewUrl']='/out/media/replanted-audit/pending39-4x/'
(out/'items.json').write_text(json.dumps(doc,ensure_ascii=False,indent=2),encoding='utf-8');Path('assets/source-art/catalog.json').write_text(json.dumps(catalog,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
# Use the established source-record player for complete motions, identical DSL timeline.
source=Path('out/media/replanted-audit/credits-parts-20261115/motion');motion=out/'motion';motion.mkdir(exist_ok=True)
a=json.loads((source/'catalog.json').read_text());b=json.loads(Path('out/media/replanted-audit/splash-original-timeline-20261115/motion/catalog.json').read_text());a['definitions']+=b['definitions'];a['assets'].update(b['assets']);candidates={};by={r['id']:r for r in doc['items']}
for sym,asset in a['assets'].items():
 original=asset.get('original','').replace('assets/runtime/','').lower();key=original.rsplit('.',1)[0];e=entries.get(key)
 if e and e.get('current'):
  url='/'+by.get(key,{}).get('baseline',e['current']['path']);mapping={'logicalDrawRect':[0,0,*(e['current']['logicalSize'] or [asset['width'],asset['height']])]};asset['url']=url;asset['hd']={'url':url,'mapping':mapping,'requiresMeshBake':False};asset['baselineHD']=asset['hd'].copy()
 if key in by:
  asset['hd']={'url':'/'+by[key]['candidate'],'mapping':{'logicalDrawRect':[0,0,*by[key]['logicalSize']]},'requiresMeshBake':False};candidates[sym]=asset['hd']
(motion/'catalog.json').write_text(json.dumps(a,ensure_ascii=False),encoding='utf-8');(motion/'candidates.json').write_text(json.dumps(candidates),encoding='utf-8');(motion/'feedback.json').write_text('[]',encoding='utf-8')
for f in ['index.html','player.js']:
 text=(source/f).read_text(encoding='utf-8').replace('pvz-hd-credits-parts-20261115','pvz-hd-pending39-4x-motion').replace('当前全部高清部件（本轮仍用原图）','当前已通过的高清效果').replace('当前全部高清部件＋本轮候选','本轮4×修复后的完整效果');(motion/f).write_text(text,encoding='utf-8')
print('Review items',len(doc['items']),'full animation replacements',len(candidates),'definitions',len(a['definitions']))
