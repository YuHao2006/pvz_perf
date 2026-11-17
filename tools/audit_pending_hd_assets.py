from pathlib import Path
import json,hashlib,collections,re
from PIL import Image
R=Path('.');A='assets/source-art/archive/2026-11-16-pre-library';cp=R/'assets/source-art/catalog.json';c=json.loads(cp.read_text());prov=json.loads((R/'assets/high-resolution/provenance.json').read_text())['images'];records=[]
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def size(p):
 try:
  with Image.open(p) as im:return list(im.size)
 except (OSError,ValueError):return None
special={
'reanim/tree_bg':('native-background-recipe','原生背景已找到（2048×1080）。DelayLoad_TreeOfWisdom仍以IMAGE_BACKGROUND_TREEOFWISDOM绘制此资源，不是废弃轨道图；需恢复原生背景的裁切/比例处理，生成4×导出。',['pvzPerf/Lawn/Challenge.cpp:5683','assets/definitions/resources.json:5175']),
'images/zombatar_background_blank':('field-reconstruction','大头贴BACKGROUNDS第一个可选背景及180×180画布依据，仍会进入肖像绘制，不等于已经烘焙的编辑器UI。现有仅2×，需重建填色/边缘。',['pvzPerf/Lawn/Widget/ZombatarItems.cpp:367','pvzPerf/Lawn/Widget/ZombatarItems.cpp:705','pvzPerf/Lawn/Widget/ZombatarItems.cpp:1575']),
'images/credits_playbutton':('ai-master-recipe','已批准AI母图1275×1233、两遍Anime4K输入和integration.json均存在；缺的是将原配准复现到4×，并非缺AI母图。',[]),
'images/shovel':('native-registration-recipe','原生铲子来源及修正配准manifest都在；当前采用缩小可见区域的2×成品，需从高密度原生图复现配准，不能直接放大该成品。',[]),
'images/landscape_ui/shovel':('native-registration-recipe','已有高清Shovel_hi_res，横板铲子为离线旋转45度后配准；需重播合成至4×。',[]),
'images/pool':('composition-recipe','现有pool75合成为2×。原生水面及高清地图仍在，可重建4×；此资源仍被Credits背景绘制，战斗PoolEffect也读取其逻辑尺寸，不能因pool_base存在而删除。',['pvzPerf/Lawn/Widget/CreditScreen.cpp:935','pvzPerf/Lawn/System/PoolEffect.cpp:80']),
'images/flagmeterparts':('native-composition-recipe','ui102明确记录原生僵尸头、脑旗和各单元位置；杆仍源于旧覆盖场，需生成4×单元合成。',[]),
'images/selectorscreen_levelnumbers':('palette-recipe','当前是去黑轮廓后的白字2×，修正记录存在。需从字形来源重建4×并继续保留纯白、不加黑边。',[]),
}
for e in c['entries']:
 if e['status']!='pending':continue
 key=e['id'];assert sha(e['current']['path'])==e['current']['sha256'];assert e['current']['physicalSize']==[v*2 for v in e['current']['logicalSize']]
 matches=[x for x in prov if x.get('file')==e['current']['path'].removeprefix('assets/high-resolution/')];pr=matches[-1] if matches else None
 if key in special:category,note,usage=special[key]
 elif 'selectorscreen_minigames_' in key:category='shared-stone-recipe';note='普通/hover共用底图的manifest及1923×817原始AI图都在；历史标为4×的该对底图明确来自2×放大，不可作为合格母图，须恢复原始AI的轮廓/颜色处理后再生成两态。';usage=['pvzPerf/Lawn/Widget/GameSelector.cpp:165','pvzPerf/Lawn/Widget/GameSelector.cpp:1049']
 elif '/acheesements_' in key:category='composition-with-lowres-residual';note='原生主要图层及composition-candidates.json存在，但仅重植版图层覆盖部分原版细节；当前2×合成仍混有原版裂纹/小石残余，须补残余细节后重建4×。';usage=[]
 elif '/store_nextbutton' in key or '/store_prevbutton' in key:category='native-text-bake-recipe';note='重植版车灯、Anton字体及文字样式/位置均有记录，三态文字烘焙成品仅2×；需直接从原生灯图和TTF重做4×烘焙，保持三态对齐。';usage=[]
 elif key in ['images/sod1row','images/sod3row']:category='composition-with-lowres-residual';note='批准的高清白天地图存在；当前2×草坪内部来自地图，毛边颜色/alpha仍取原版。须在4×重建边缘并保留毛草形状，不可直接放大当前2×成品。';usage=[]
 else:category='field-reconstruction';note='历史覆盖场/几何/渐变处理和原始输入存在，但已登记的成品仅2×；需由原始形状或程序配方直接重建4×。不能把“覆盖场”自动视为纯色，也不能把2×PNG直接放大算完成。';usage=[]
 evidence=[]
 if pr:
  p=Path(pr['source'].replace('\\','/'));assert p.is_file();h=sha(p);assert not pr.get('sourceSha256') or h==pr['sourceSha256'];evidence.append({'path':p.as_posix(),'physicalSize':size(p),'sha256':h,'role':'recorded-current-input-not-necessarily-master'})
  for k in ['details','reviewFile']:
   if pr.get(k):
    p=Path(pr[k].replace('\\','/'));assert p.is_file();evidence.append({'path':p.as_posix(),'role':k})
 if 'selectorscreen_minigames_' in key:
  mp=Path(A)/'legacy-masters/selector-state-pairs/manifest.json';pair=next(x for x in json.loads(mp.read_text())['pairs'] if x['name']=='Minigames');p=mp.parent/pair['rawAI'];assert sha(p)==pair['rawAISha256'];assert sha(Path('assets/high-resolution')/pair['normalRuntime'])==pair['normalRuntimeSha256'];assert sha(Path('assets/high-resolution')/pair['highlightRuntime'])==pair['highlightRuntimeSha256'];evidence.extend([{'path':mp.as_posix(),'role':'exact-current-pair-hash-proof'},{'path':p.as_posix(),'physicalSize':size(p),'sha256':sha(p),'role':'retained-original-AI-master'}])
 # Verify retained upstream native/AI/font inputs as well as the immediate 2x output.
 upstream=[]
 if key=='images/credits_playbutton':upstream=[Path(A)/'ai/credits-play-button62/ai-master.png']
 elif key=='reanim/tree_bg':upstream=[Path(pr['source'])]
 elif key in ['images/shovel','images/landscape_ui/shovel']:
  upstream=[Path('assets/source-art/masters/native/images/Shovel_hi_res--47b68468abc622b9.png')]
 elif '/store_nextbutton' in key or '/store_prevbutton' in key:
  direction='Next' if '/store_nextbutton' in key else 'Prev';state='_Disabled' if key.endswith('disabled') else '_Over' if key.endswith('highlight') else ''
  upstream=[Path(A)/f'replanted/store-native-audit/SPR_Store_Button{direction}{state}_EN.png',Path(A)/'replanted/localization-study/fonts/FNT_Anton-Regular.ttf',Path(A)/'corrections/user-audit-20261114/store-button-text-candidates.json']
 elif key=='images/flagmeterparts':
  upstream=[Path(A)/'replanted/native74/SPR_MainHud_FlagMeter_ZombieHead.png',Path(A)/'replanted/native74/SPR_MainHud_FlagMeter_Flag.png']
 elif key=='images/pool':
  upstream=[Path(A)/'replanted/native74/Area3_PoolWater.png']
 elif '/acheesements_' in key:
  meta=Path(A)/'corrections/achievements97/composition-candidates.json';row=next(x for x in json.loads(meta.read_text()) if x['key'].removesuffix('.png')==key)
  nativeRoot=Path(A)/'replanted';names={x.name:x for x in nativeRoot.rglob('*.png')}
  upstream=[meta]
  for name in row['nativeLayers']:
   if name.startswith('SPR_'):
    assert name+'.png' in names,name
    upstream.append(names[name+'.png'])
 for p in upstream:
  assert p.is_file(),p
  if p.as_posix() not in [x['path'] for x in evidence]:evidence.append({'path':p.as_posix(),'physicalSize':size(p),'sha256':sha(p),'role':'retained-upstream-input'})
 record={'id':key,'classification':category,'finding':note,'evidence':evidence,'usageEvidence':usage,'currentHashVerified':True,'currentScale':2,'export4xVerified':False,'sourceRecordRecovered':bool(pr) or bool(evidence)}
 e['pending']['previousReason']=e['pending'].get('previousReason',e['pending']['reason']);e['pending']['reason']=category;e['pending']['finding']=note;e['verification']=record
 if pr:e['history']=pr
 records.append(record)
assert len(records)==39 and all(x['sourceRecordRecovered'] for x in records)
report={'format':'pvz-pending-39-audit-v1','date':'2026-11-16','count':39,'classifications':dict(collections.Counter(x['classification'] for x in records)),'allCurrentFilesVerified':True,'allCurrentFilesAre2x':True,'allHaveSourceOrRecipeEvidence':True,'readyStatusChanged':False,'runtimeOrReleaseChanged':False,'records':records}
out=R/'assets/source-art/work/pending-audit';out.mkdir(parents=True,exist_ok=True);(out/'verification.json').write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n',encoding='utf-8');cp.write_text(json.dumps(c,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
lines=['# 39项待处理资源核实','', '39项当前成品均为2×，哈希全部通过。38项来源记录存在且文件可读，带来源哈希者全部匹配；另1项小游戏hover通过共用石牌manifest与当前两态哈希补回来源链。全部保留pending，未替换图片、运行时或Release。','', '智慧树背景及大头贴空背景都仍有用途，不能直接从包中删去。旧石牌母图虽标4×，manifest明确记录来自2×放大，继续排除。','']
for x in records:
 lines+=['## '+x['id'],'',x['finding'],'']
 lines += ['- `'+s['path']+'`'+(' '+str(s['physicalSize']) if s.get('physicalSize') else '') for s in x['evidence']]
 lines+=['']
(R/'docs/hd-pending-39-verification-20261116.md').write_text('\n'.join(lines)+'\n',encoding='utf-8');print(json.dumps({k:v for k,v in report.items() if k!='records'},ensure_ascii=False))
