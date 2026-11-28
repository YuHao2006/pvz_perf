import {ProfileStore,modes,decodeProfile} from './save-codec.js';
import {LineupLibrary,normalizeLineupLibrary} from './lineup-library.js';
import {defaultLineups,decodeLineup,encodeLineup,makeRecipe} from './save-lineups.js';

const CHUNK=128*1024,LIMIT=32*1024*1024,root='/data';
function unpack(reply){
 const result=JSON.parse(reply);
 if(result.error)throw Error(result.error);
 return result.value;
}
function call(op,name='',data='',offset=0,first=false){
 return unpack(ArkSave.command(op,name,data,offset,first));
}
async function action(op,name=''){return unpack(await ArkSave.action(op,name))}
function read(name){
 const chunks=[];let length=0;
 for(;;){
  const chunk=call('read',name,'',length);
  if(!chunk)break;
  const bytes=Uint8Array.from(atob(chunk),c=>c.charCodeAt(0));
  if(bytes.length>CHUNK || length+bytes.length>LIMIT)throw Error('DAT64 超过 32 MiB');
  chunks.push(bytes);length+=bytes.length;
  if(bytes.length<CHUNK)break;
 }
 const result=new Uint8Array(length);let offset=0;
 for(const chunk of chunks){result.set(chunk,offset);offset+=chunk.length}
 return result;
}
function chunks(op,name,bytes){
 if(!(bytes instanceof Uint8Array)||!bytes.length||bytes.length>LIMIT)throw Error('存档大小无效');
 for(let offset=0;offset<bytes.length;offset+=CHUNK){
  let text='';
  const part=bytes.subarray(offset,offset+CHUNK);
  for(let i=0;i<part.length;i+=8192)text+=String.fromCharCode(...part.subarray(i,i+8192));
  call(op,name,btoa(text),0,offset===0);
 }
}
let executor;
async function tool(op,mode,bytes,recipe,profile){
 executor??=import('./save-tool-executor.js').catch(error=>{executor=null;throw error});
 const {execute}=await executor;
 return execute({name:'game1_'+mode+'.dat64',bytes,profile,request:{op,mode,recipe}});
}

export async function createHarmonyHost(){
 let names=new Set(JSON.parse(call('list')));
 const pathName=path=>{
  if(!path.startsWith(root+'/')||path.slice(root.length+1).includes('/'))throw Error('存档路径无效');
  return path.slice(root.length+1);
 };
 const fs={
  readdir:path=>{if(path!==root)throw Error('存档目录无效');return ['.','..',...names]},
  analyzePath:path=>({exists:names.has(pathName(path))}),
  readFile:path=>read(pathName(path))
 };
 const store=new ProfileStore(fs,root);
 const library=new LineupLibrary(localStorage,defaultLineups,{key:'pvz_harmony_lineups_v1',customKey:'pvz_harmony_lineups'});
 const saves=()=>[...names].filter(name=>/^game[1-9]\d*_\d+\.dat64$/.test(name)).sort();
 const listed=()=>({presets:library.snapshot().lineups});
 async function shareCopy(name,bytes){
  chunks('shareChunk',name,bytes);
  await action('sharePrepared',name);
  return {message:'已打开系统分享。'};
 }
 function shareJson(name,value){
  return shareCopy(name,new TextEncoder().encode(JSON.stringify(value,null,2)+'\n'));
 }
 function validateRecipe(recipe){
  return makeRecipe(recipe,recipe.flags,recipe.seed,recipe.scene,recipe.sun);
 }
 const slot=name=>{
  const match=/^game([1-9]\d*)_(\d+)\.dat64$/.exec(name);
  if(!match||!modes[Number(match[2])]?.checkpoint)throw Error('关卡文件名无效，见存档文件名对照。');
  const id=Number(match[1]);
  if(!store.rows().some(row=>row.id===id))throw Error('请先新增目标用户。');
  return {id,mode:Number(match[2])};
 };
 function commit(plan){
  call('begin');
  try{
   for(const [name,bytes] of plan.writes)chunks('write',name,bytes);
   for(const name of plan.removes)if(!plan.writes.has(name))call('drop',name);
   call('finish');
  }catch(error){try{call('abort')}catch{}throw error}
  names=new Set(JSON.parse(call('list')));
  return {id:plan.id,profiles:store.list(),saves:saves()};
 }
 return {
  async initial(){
   const entries=listed(),first=entries.presets[0],lineup=first?await decodeLineup(first.code):{scene:2,rake:0,cells:Array(54).fill(0)};
   return {...entries,lineup,code:first?.code||await encodeLineup(lineup),profiles:store.list(),saves:saves(),modes};
  },
  async request(op,payload={}){
   if(op==='decode-lineup'){const result=await decodeLineup(payload.code);return {lineup:result,code:result.code}}
   if(op==='encode-lineup')return {code:await encodeLineup(payload.recipe)};
   if(op==='add-user')return commit(store.add({perfect:payload.perfect===true}));
   if(op==='edit-user')return commit(store.edit(payload));
   if(op==='delete-user')return commit(store.remove(payload.id));
   if(op==='export-users'){await action('share','@profiles');return {message:'已打开系统分享。'}}
   if(op==='export-lineups')return shareJson('pvz-lineups.json',library.snapshot());
   if(op==='export-recipe')return shareJson('pvz-lineup.json',validateRecipe(payload.recipe));
   if(op==='import-lineups'){
    const data=normalizeLineupLibrary(JSON.parse(new TextDecoder('utf-8',{fatal:true}).decode(read('@lineups'))));
    for(const entry of data.lineups)await decodeLineup(entry.code);
    library.replace(data);
    return {...listed(),message:'已导入阵型库，当前布阵保留。'};
   }
   if(op==='delete-lineup'){library.remove(payload.code);return listed()}
   if(op==='save-lineup'){const code=await encodeLineup(payload.recipe);library.add({name:payload.name.slice(0,60),code});return {...listed(),code,message:'阵型已保存。'}}
   if(op==='import'){
    const bytes=read('@import'),profile=/^user([1-9]\d*)\.dat64$/.exec(payload.name);
    if(profile){
     if(!store.rows().some(row=>row.id===Number(profile[1])))throw Error('请先新增同 ID 的用户。');
     decodeProfile(bytes);
    }else{
     const target=slot(payload.name);
     await tool('validate',target.mode,bytes);
    }
    if(payload.confirm!==true)return null;
    return commit({writes:new Map([[payload.name,bytes]]),removes:[]});
   }
   const target=slot(payload.name);
   if(op==='export'){await action('share',payload.name);return {message:'已打开系统分享。'}}
   if(op==='extract')return tool(op,target.mode,read(payload.name));
   if(op==='repair-plant-attacks'){
    const result=await tool(op,target.mode,read(payload.name));
    if(!result.bytes)return {message:'没有发现已知植物卡死状态。'};
    await shareCopy(payload.name.replace(/\.dat64$/,'.repaired.dat64'),result.bytes);
    return {message:'已生成修复副本。'};
   }
   if(op==='generate'){
    const recipe=validateRecipe(payload.recipe);
    const result=await tool('generate',target.mode,undefined,recipe,store.details(target.id));
    return commit({writes:new Map([[payload.name,result.bytes]]),removes:[]});
   }
   throw Error('不支持的存档操作：'+op);
  }
 };
}
