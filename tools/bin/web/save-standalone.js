// Independent editor with either browser snapshots or a native save directory.
import {ProfileStore,modes,decodeProfile} from './save-codec.js';
import {LineupLibrary} from './lineup-library.js';
import {defaultLineups,decodeLineup,encodeLineup,makeRecipe} from './save-lineups.js';
import {runIndependentSaveTool} from './save-tool-client.js';

async function openBrowserStorage() {
 const db=await new Promise((resolve,reject)=>{
  const open=indexedDB.open('pvz_devtools_save_editor_v4',1);
  open.onupgradeneeded=()=>open.result.createObjectStore('files');
  open.onsuccess=()=>resolve(open.result);open.onerror=()=>reject(open.error);
 });
 const saved=await new Promise((resolve,reject)=>{
  const request=db.transaction('files','readonly').objectStore('files').get('snapshot');
  request.onsuccess=()=>resolve(request.result||[]);request.onerror=()=>reject(request.error);
 });
 let files=new Map(saved.map(([name,bytes])=>[name,new Uint8Array(bytes)]));
 return {
  list:()=>[...files.keys()],
  read(name){
   const value=files.get(name);
   if(!value)throw Error('存档文件不存在');
   return value.slice();
  },
  async commit(plan){
   const next=new Map(files);
   for(const [name,bytes]of plan.writes)next.set(name,bytes.slice());
   for(const name of plan.removes)if(!plan.writes.has(name))next.delete(name);
   await new Promise((resolve,reject)=>{
    const tx=db.transaction('files','readwrite');
    tx.objectStore('files').put([...next],'snapshot');
    tx.oncomplete=resolve;tx.onerror=()=>reject(tx.error);
    tx.onabort=()=>reject(tx.error||Error('本地保存被中断'));
   });
   files=next;
  }
 };
}

export async function createStandalone(nativeStorage) {
 const storage=nativeStorage||await openBrowserStorage(),root='/data';
 let files=new Set(storage.list());
 const validPath=path=>{
  if(!path.startsWith(root+'/')||path.slice(root.length+1).includes('/'))throw Error('存档路径无效');
  return path.slice(root.length+1);
 };
 const fs={
  readdir:path=>{if(path!==root)throw Error('存档目录无效');return ['.','..',...files]},
  analyzePath:path=>({exists:files.has(validPath(path))}),
  readFile:path=>storage.read(validPath(path))
 };
 const store=new ProfileStore(fs,root),library=new LineupLibrary(localStorage,defaultLineups,{
  key:'pvz_devtools_lineup_library_v1',customKey:'pvz_devtools_lineups'
 });
 const names=()=>[...files].filter(name=>/^game[1-9]\d*_\d+\.dat64$/.test(name)).sort();
 const listed=()=>({presets:library.snapshot().lineups,custom:[]});
 const slot=name=>{
  const match=/^game([1-9]\d*)_(\d+)\.dat64$/.exec(name);
  if(!match||!modes[Number(match[2])]?.checkpoint)throw Error('关卡文件名无效，见“存档文件名对照”');
  const id=Number(match[1]);
  if(!store.rows().some(row=>row.id===id))throw Error('请先新增目标用户');
  return {id,mode:Number(match[2])};
 };
 const read=name=>{
  slot(name);
  if(!files.has(name))throw Error('没有选中的关卡存档');
  return storage.read(name);
 };
 async function commit(plan){
  await storage.commit(plan);
  files=new Set(storage.list());
  return {id:plan.id,profiles:store.list(),saves:names()};
 }
 if(!nativeStorage&&!files.has('users.dat'))await commit(store.add());
 return {
  async initial(){
   const entries=listed(),first=entries.presets[0];
   const lineup=first?await decodeLineup(first.code):{scene:2,rake:0,cells:Array(54).fill(0)};
   return {...entries,lineup,code:first?.code||await encodeLineup(lineup),profiles:store.list(),saves:names()};
  },
  async request(op,payload={}){
   if(op==='close'){storage.close?.();return {}}
   if(op==='add-user')return commit(store.add({perfect:payload.perfect===true}));
   if(op==='edit-user')return commit(store.edit(payload));
   if(op==='delete-user')return commit(store.remove(payload.id));
   if(op==='export-users')return {files:[...files].filter(name=>/^(?:users\.dat|user[1-9]\d*\.dat64)$/.test(name))
    .map(name=>[name,storage.read(name)])};
   if(op==='delete-lineup'){library.remove(payload.code);return listed()}
   if(op==='save-lineup'){
    const decoded=await decodeLineup(payload.code);
    library.add({name:String(payload.name||'我的阵型').trim().slice(0,60),code:decoded.code});
    return listed();
   }
   if(op==='replace-lineups'){
    for(const entry of payload.lineups||[])await decodeLineup(entry.code);
    library.replace(payload);return listed();
   }
   if(op==='import'){
    const {name,bytes}=payload;
    if(!(bytes instanceof Uint8Array)||!bytes.length||bytes.length>32*1024*1024)throw Error('DAT64 文件无效');
    const profile=nativeStorage&&/^user([1-9]\d*)\.dat64$/.exec(name);
    if(profile){
     if(!store.rows().some(row=>row.id===Number(profile[1])))throw Error('请先新增同 ID 的用户。');
     decodeProfile(bytes);
    }else{
     await runIndependentSaveTool({op:'validate',mode:slot(name).mode},bytes);
    }
    return commit({writes:new Map([[name,bytes]]),removes:[]});
   }
   const target=slot(payload.name);
   if(op==='export')return {bytes:read(payload.name)};
   if(op==='extract'||op==='repair-plant-attacks')return runIndependentSaveTool({op,mode:target.mode},read(payload.name));
   if(op==='generate'){
    const r=payload.recipe,recipe=makeRecipe(r,r.flags,r.seed,r.scene,r.sun);
    const result=await runIndependentSaveTool({op:'generate',mode:target.mode,recipe},null,store.details(target.id));
    return commit({writes:new Map([[payload.name,result.bytes]]),removes:[]});
   }
   throw Error('不支持的工具操作');
  }
 };
}

