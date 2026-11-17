import {sharedStorage,validModifiedAt,nextModifiedAt,hasOwn,savedTime,preferCloud,newSlot,validSlot,previousSnapshot,discardOldSnapshot} from './shared-storage.js';
// Profile cloud persistence is event-driven, outside update/draw. Battle DAT64
// files belong to LocalSaveStorage and must never be replaced by profile sync.
const profileName=name=>/^(users\.dat|user[1-9]\d*\.dat64)$/.test(name);
const headKey='pvz_progress_v1',chunkSize=1000,chunkCount=60;
const key=(slot,index)=>'pvz_progress_'+slot+'_'+index;
export const encode=bytes=>{let text='';for(let i=0;i<bytes.length;i+=16384)text+=String.fromCharCode(...bytes.subarray(i,i+16384));return btoa(text)};
export const decode=text=>Uint8Array.from(atob(text),c=>c.charCodeAt(0));
export async function digest(bytes){return [...new Uint8Array(await crypto.subtle.digest('SHA-256',bytes))].map(v=>v.toString(16).padStart(2,'0')).join('')}
export async function unpack(bytes){
 const reader=new Blob([bytes]).stream().pipeThrough(new DecompressionStream('gzip')).getReader(),parts=[];let size=0;
 try{for(;;){const {done,value}=await reader.read();if(done)break;size+=value.length;if(size>2*1024*1024)throw Error('云端进度解压后过大');parts.push(value)}}finally{reader.releaseLock()}
 const out=new Uint8Array(size);let offset=0;for(const part of parts){out.set(part,offset);offset+=part.length}return JSON.parse(new TextDecoder().decode(out));
}
function validate(files){
 if(!files||typeof files!=='object'||Array.isArray(files))throw Error('进度内容无效');
 for(const [name,value] of Object.entries(files)){
  if(!profileName(name)||typeof value!=='string')throw Error('进度文件名无效');
  const bytes=decode(value);
  if(bytes.length>2*1024*1024||name!=='users.dat'&&new TextDecoder().decode(bytes.subarray(0,8))!=='PVZUSR64')throw Error('进度文件无效：'+name);
 }
 if(!hasOwn(files,'users.dat'))throw Error('进度缺少用户列表');
 return Object.fromEntries(Object.entries(files).sort(([a],[b])=>a.localeCompare(b)));
}
function localDatabase(){return new Promise((resolve,reject)=>{
 const open=indexedDB.open('pvz_perf_progress_backup_v1',1);
 open.onupgradeneeded=()=>open.result.createObjectStore('backup');open.onsuccess=()=>resolve(open.result);open.onerror=()=>reject(open.error);
})}
async function backup(operation,value,record='profiles'){
 const db=await localDatabase();
 try{return await new Promise((resolve,reject)=>{
  const tx=db.transaction('backup',operation==='get'?'readonly':'readwrite'),store=tx.objectStore('backup');
  const request=operation==='get'?store.get(record):store.put(value,record);let result;
  request.onsuccess=()=>{result=request.result};tx.oncomplete=()=>resolve(result);tx.onerror=tx.onabort=()=>reject(tx.error||Error('进度备份失败'));
 })}finally{db.close()}
}
export async function cloudCall(operation){
 for(let attempt=0;;++attempt)try{return await operation()}catch(error){
  if(Number(error?.code)!==307044||attempt>=2)throw error;
  await new Promise(resolve=>setTimeout(resolve,1000*2**attempt+Math.random()*250));
 }
}
export function deadline(operation){let timer;return Promise.race([operation,new Promise((_,reject)=>{timer=setTimeout(()=>reject(Error('云端进度请求超时')),15000)})]).finally(()=>clearTimeout(timer))}
export class ProgressStorage {
 constructor(fs,root,{cloudEnabled,provideToy,report,sharedStorageId='',canApplyRemote=()=>true,onRestore=async()=>{},uploadState=()=>{}}){Object.assign(this,{fs,root,cloudEnabled,provideToy,report,sharedStorageId,canApplyRemote,onRestore,uploadState});this.head=null;this.saving=null;this.pending=null;this.lastLocal='';this.lastCloud='';this.localText='';this.modifiedAt=0;this.applying=false}
 snapshot(){
  const files={};for(const name of this.fs.readdir(this.root).filter(profileName).sort())files[name]=encode(this.fs.readFile(this.root+'/'+name));
  return hasOwn(files,'users.dat')?files:null;
 }
 apply(files,modifiedAt=0){
  files=validate(files);this.applying=true;
  try{
  for(const name of this.fs.readdir(this.root).filter(profileName))if(!hasOwn(files,name))this.fs.unlink(this.root+'/'+name);
  for(const [name,value] of Object.entries(files)){this.fs.writeFile(this.root+'/'+name,decode(value));if(validModifiedAt(modifiedAt)&&this.fs.utime)this.fs.utime(this.root+'/'+name,modifiedAt,modifiedAt)}
  this.localText=JSON.stringify(files);this.modifiedAt=modifiedAt;
  }finally{this.applying=false}
 }
 async remote(){
  if(!this.cloudEnabled)throw Error('云端进度仅在登录后的 B 站 Toy 中可用');
  const toy=await deadline(this.provideToy());
  if(typeof toy?.getCloudStorage!=='function'||typeof toy?.setCloudStorage!=='function')throw Error('当前宿主未开放云存储');
  return this.sharedStorageId?sharedStorage(toy,this.sharedStorageId,this.uploadState):toy;
 }
 async readCloud(){
  const toy=await this.remote(),rows=await deadline(cloudCall(()=>toy.getCloudStorage([headKey]))),raw=rows[headKey];
  if(!raw){this.head=null;this.lastCloud='';return null}
  const head=JSON.parse(raw);
  if(!validSlot(head)||!Number.isInteger(head.count)||head.count<1||head.count>chunkCount||!/^[a-f0-9]{64}$/.test(head.digest))throw Error('云端进度索引无效');
  const keys=Array.from({length:head.count},(_,i)=>key(head.slot,i));
  const data=await deadline(cloudCall(()=>toy.getCloudStorage(keys)));
  if(keys.some(k=>typeof data[k]!=='string'||data[k].length>chunkSize))throw Error('云端进度分片缺失');
  const bytes=decode(keys.map(k=>data[k]).join(''));
  if(await digest(bytes)!==head.digest)throw Error('云端进度校验失败，保留本地存档');
  const files=validate(await unpack(bytes));
  if(toy.finishLegacyRead&&!await deadline(cloudCall(()=>toy.finishLegacyRead())))return this.readCloud();
  this.head=head;this.lastCloud=JSON.stringify(files);
  return {files,savedAt:head.savedAt,modifiedAt:head.modifiedAt,digest:head.digest,text:this.lastCloud};
 }
 async prepare(){
  let restored=false;
  try{
   const saved=await backup('get'),current=this.snapshot();
   const newest=Math.max(0,...this.fs.readdir(this.root).filter(profileName).map(name=>Number(this.fs.stat(this.root+'/'+name).mtime)));
   if(saved?.files&&(!current||saved.savedAt>newest&&JSON.stringify(saved.files)!==JSON.stringify(current))){this.apply(saved.files,saved.modifiedAt||saved.savedAt);restored=true;this.report('已从浏览器独立备份恢复用户进度')}
   const local=this.snapshot();if(local){this.localText=JSON.stringify(local);this.modifiedAt=saved&&JSON.stringify(saved.files)===this.localText?(saved.modifiedAt||saved.savedAt):newest}
  }catch(error){this.report('本地进度备份不可用：'+error.message)}
  if(this.cloudEnabled)try{
   const saved=await this.readCloud(),local=this.snapshot();
   if(saved&&(!local||JSON.stringify(local)!==saved.text&&preferCloud(this.modifiedAt,saved))){
    if(local)await backup('put',{files:local,savedAt:this.modifiedAt,modifiedAt:this.modifiedAt},'conflict');
    this.apply(saved.files,savedTime(saved));restored=true;this.report('已自动恢复云端用户进度；关卡状态仍使用本地 DAT64');
   }else if(local){const result=await this.writeCloud(local,this.modifiedAt);if(result==='uploaded'||result==='same')this.report('用户进度已自动同步')}
  }catch(error){this.report('云端暂不可用，继续使用本地存档：'+error.message)}
  return restored;
 }
 async writeCloud(files,modifiedAt=this.modifiedAt,refresh=false){
  files=validate(files);const text=JSON.stringify(files);if(text===this.lastCloud&&!refresh)return 'same';
  const saved=await this.readCloud();
  if(text===this.lastCloud)return 'same';
  if(preferCloud(modifiedAt,saved)){
   if(this.localText&&this.localText!==text)return 'deferred';
   await backup('put',{files,savedAt:modifiedAt,modifiedAt},'conflict');
   if(!this.canApplyRemote()){this.report('云端进度较新，已保留本地备份，退出游戏后自动同步');return 'deferred'}
   this.apply(saved.files,savedTime(saved));await this.onRestore();
   this.report('已按时间戳自动恢复云端用户进度');return 'restored';
  }
  const previous=this.head,expectedHead=previous?JSON.stringify(previous):'';
  this.uploadState(true);
  try{
  const bytes=new Uint8Array(await new Response(new Blob([text]).stream().pipeThrough(new CompressionStream('gzip'))).arrayBuffer()),encoded=encode(bytes),count=Math.ceil(encoded.length/chunkSize);
  if(count>chunkCount)throw Error('用户进度超过云端容量，本地存档仍保留；关卡 DAT64 请导出');
  const toy=await this.remote(),slot=newSlot(),values={};
  for(let i=0;i<count;++i)values[key(slot,i)]=encoded.slice(i*chunkSize,(i+1)*chunkSize);
  const head={format:2,slot,count,digest:await digest(bytes),modifiedAt,savedAt:Date.now(),previous:previousSnapshot(previous)};
  // Publish data before switching the index. An interrupted upload cannot
  // replace the last complete snapshot with missing or truncated chunks.
  // Reclaim the older backup before allocating a new version, so normal
  // uploads need at most current + staged chunks within the KV quota.
  await deadline(cloudCall(()=>discardOldSnapshot(toy,'pvz_progress_',previous?.previous)));
  await deadline(cloudCall(()=>toy.setCloudStorage(values)));
  const current=await deadline(cloudCall(()=>toy.getCloudStorage([headKey])));
  if((current[headKey]||'')!==expectedHead){this.report('上传期间云端已更新，稍后自动同步');return 'deferred'}
  await deadline(cloudCall(()=>toy.setCloudStorage({[headKey]:JSON.stringify(head)})));
  this.head=head;this.lastCloud=text;return 'uploaded';

  }finally{this.uploadState(false)}
 }
 async store(files,modifiedAt=this.modifiedAt,refresh=false){
   const text=JSON.stringify(files);
   let localError;
   if(text!==this.lastLocal)try{await backup('put',{files,savedAt:modifiedAt,modifiedAt});this.lastLocal=text}catch(error){localError=error}
   if(this.cloudEnabled){const result=await this.writeCloud(files,modifiedAt,refresh);if(result==='uploaded'||result==='same')this.report('用户进度已自动同步；关卡 DAT64 仅在本地')}
   else if(localError)throw localError;
 }
 async save(refresh=false){
  const files=this.snapshot();if(!files)return Promise.resolve();
  // At most the active snapshot and newest pending snapshot survive. Do not
  // enqueue every intermediate profile write behind a slow network request.
  const text=JSON.stringify(files);
  if(text!==this.localText){this.modifiedAt=nextModifiedAt(this.modifiedAt);this.localText=text}
  this.pending={files,modifiedAt:this.modifiedAt,refresh:refresh||!!this.pending?.refresh};if(this.saving)return this.saving;
  this.saving=(async()=>{
   let error;
   while(this.pending){const next=this.pending;this.pending=null;try{await this.store(next.files,next.modifiedAt,next.refresh);error=null}catch(e){error=e}}
   if(error)throw error;
  })().finally(()=>{this.saving=null});
  return this.saving;
 }
 watchProfileWrites(){
  const original=this.fs.close,owner=this;let queued=false;
  this.fs.close=function(stream){
   const path=stream.path,written=(stream.flags&3)!==0;const result=original.call(this,stream);
   if(!owner.applying&&written&&path?.startsWith(owner.root+'/user')&&profileName(path.slice(owner.root.length+1))&&!queued){
    queued=true;queueMicrotask(()=>{queued=false;Promise.resolve().then(()=>owner.save()).catch(error=>owner.report('进度备份未完成：'+error.message))});
   }
   return result;
  };
 }
}
