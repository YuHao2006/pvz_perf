import {validModifiedAt,nextModifiedAt,savedTime,preferCloud,newSlot,validSlot,previousSnapshot,discardOldSnapshot} from './shared-storage.js';
import {LineupLibrary,normalizeLineupLibrary} from './lineup-library.js';
import {defaultLineups,decodeLineup} from './lineups.js';
import {encode,decode,digest,unpack,cloudCall,deadline} from './progress-storage.js';
export {LineupLibrary};
const headKey='pvz_lineups_v1',chunkSize=1000,chunkCount=60;
const chunkKey=(slot,index)=>'pvz_lineups_'+slot+'_'+index;
// This is a complete JSON library, not per-row integer IDs. Publishing the
// index last also commits deletions (including a deliberately empty library).
export class LineupStorage {
 constructor(storage,{cloudEnabled,remote,report,uploadState=()=>{}}){
  Object.assign(this,{cloudEnabled,remote,report,uploadState});
  this.storage=storage;this.modifiedAt=0;this.localText='';
  this.library=new LineupLibrary(storage,defaultLineups);this.head=null;this.cloudRead=false;this.lastCloud='';this.pending=null;this.saving=null;
 }
 async validate(value){const next=normalizeLineupLibrary(value);for(const entry of next.lineups)await decodeLineup(entry.code);return next}
 async readCloud(){
  const toy=await this.remote(),rows=await deadline(cloudCall(()=>toy.getCloudStorage([headKey]))),raw=rows[headKey];
  if(!raw){this.head=null;this.cloudRead=true;this.lastCloud='';return null}
  const head=JSON.parse(raw);
  if(!validSlot(head)||!Number.isInteger(head.count)||head.count<1||head.count>chunkCount||!/^[a-f0-9]{64}$/.test(head.digest))throw Error('云端阵型库索引无效');
  const keys=Array.from({length:head.count},(_,i)=>chunkKey(head.slot,i)),data=await deadline(cloudCall(()=>toy.getCloudStorage(keys)));
  if(keys.some(k=>typeof data[k]!=='string'||data[k].length>chunkSize))throw Error('云端阵型库分片缺失');
  const bytes=decode(keys.map(k=>data[k]).join(''));
  if(await digest(bytes)!==head.digest)throw Error('云端阵型库校验失败，保留本地阵型');
  const value=await this.validate(await unpack(bytes));
  if(toy.finishLegacyRead&&!await deadline(cloudCall(()=>toy.finishLegacyRead())))return this.readCloud();
  this.head=head;this.cloudRead=true;this.lastCloud=JSON.stringify(value);
  return {value,savedAt:head.savedAt,modifiedAt:head.modifiedAt,digest:head.digest,text:this.lastCloud};
 }
 async prepare(){
  if(!this.cloudEnabled)return;
  try{const meta=JSON.parse(this.storage.getItem('pvz_lineups_sync_v1')||'null');this.localText=JSON.stringify(this.library.snapshot());if(meta?.text===this.localText)this.modifiedAt=meta.modifiedAt}catch{}
  try{
   const saved=await this.readCloud(),local=this.library.snapshot();
   if(saved&&(!this.library.existed||JSON.stringify(local)!==saved.text&&preferCloud(this.modifiedAt,saved))){
    if(this.library.existed)this.backupConflict(local,this.modifiedAt);
    this.restore(saved);this.report('阵型库已按时间戳自动恢复');
   }else await this.writeCloud(local,this.modifiedAt);
  }catch(error){this.report('云端阵型库暂不可用，继续使用本地：'+error.message)}
 }
 backupConflict(value,modifiedAt){this.storage.setItem('pvz_lineups_conflict_v1',JSON.stringify({value,modifiedAt}))}
 restore(saved){
  this.library.replace(saved.value);this.modifiedAt=savedTime(saved);this.localText=JSON.stringify(this.library.snapshot());
  this.storage.setItem('pvz_lineups_sync_v1',JSON.stringify({text:this.localText,modifiedAt:this.modifiedAt}));
 }
 async writeCloud(value,modifiedAt=this.modifiedAt,refresh=false){
  if(!this.cloudEnabled)return;
  const text=JSON.stringify(value);if(text===this.lastCloud&&!refresh)return;
  const saved=await this.readCloud();
  if(text===this.lastCloud)return;
  if(preferCloud(modifiedAt,saved)){
   if(this.localText&&this.localText!==text)return;
   this.backupConflict(value,modifiedAt);this.restore(saved);this.report('阵型库已按时间戳自动恢复');return;
  }
  const previous=this.head,expectedHead=previous?JSON.stringify(previous):'';
  this.uploadState(true);
  try{
   const bytes=new Uint8Array(await new Response(new Blob([text]).stream().pipeThrough(new CompressionStream('gzip'))).arrayBuffer()),encoded=encode(bytes),count=Math.ceil(encoded.length/chunkSize);
   if(count>chunkCount)throw Error('阵型库超过当前云端容量，请导出 JSON 备份；本地阵型已保留');
   const toy=await this.remote(),slot=newSlot(),values={};
   for(let i=0;i<count;++i)values[chunkKey(slot,i)]=encoded.slice(i*chunkSize,(i+1)*chunkSize);
   const head={format:2,slot,count,digest:await digest(bytes),modifiedAt,savedAt:Date.now(),previous:previousSnapshot(previous)};
   // Reclaim the older backup before allocating a new version, so normal
  // uploads need at most current + staged chunks within the KV quota.
  await deadline(cloudCall(()=>discardOldSnapshot(toy,'pvz_lineups_',previous?.previous)));
  await deadline(cloudCall(()=>toy.setCloudStorage(values)));
   const current=await deadline(cloudCall(()=>toy.getCloudStorage([headKey])));
   if((current[headKey]||'')!==expectedHead){this.report('云端阵型库已更新，稍后自动同步');return}
   await deadline(cloudCall(()=>toy.setCloudStorage({[headKey]:JSON.stringify(head)})));
   this.head=head;this.lastCloud=text;

   this.report('阵型库已备份到当前 B 站账号');
  }finally{this.uploadState(false)}
 }
 async save(refresh=false){
  if(!this.cloudEnabled)return Promise.resolve();
  const value=this.library.snapshot(),text=JSON.stringify(value);
  if(text!==this.localText){this.modifiedAt=nextModifiedAt(this.modifiedAt);this.localText=text;this.storage.setItem('pvz_lineups_sync_v1',JSON.stringify({text,modifiedAt:this.modifiedAt}))}
  this.pending={value,modifiedAt:this.modifiedAt,refresh:refresh||!!this.pending?.refresh};if(this.saving)return this.saving;
  this.saving=(async()=>{let error;while(this.pending){const next=this.pending;this.pending=null;try{await this.writeCloud(next.value,next.modifiedAt,next.refresh);error=null}catch(e){error=e}}if(error)throw error})().finally(()=>{this.saving=null});
  return this.saving;
 }
}
