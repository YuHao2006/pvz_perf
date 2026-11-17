// IndexedDB owns durable files. MEMFS only provides the synchronous file API
// required by C++; IDBFS is used once to import the existing browser saves.
const databaseName='pvz_perf_local_saves_v1';
export function openLocalSaveDatabase(){return new Promise((resolve,reject)=>{
 const request=indexedDB.open(databaseName,1);
 request.onupgradeneeded=()=>{request.result.createObjectStore('files');request.result.createObjectStore('meta')};
 request.onsuccess=()=>resolve(request.result);request.onerror=()=>reject(request.error);
})}
function transaction(db,stores){try{return db.transaction(stores,'readwrite',{durability:'strict'})}catch(error){if(!(error instanceof TypeError))throw error;return db.transaction(stores,'readwrite')}}
function completed(tx){return new Promise((resolve,reject)=>{tx.oncomplete=resolve;tx.onabort=tx.onerror=()=>reject(tx.error||Error('本地存档事务失败'))})}
function requested(request){return new Promise((resolve,reject)=>{request.onsuccess=()=>resolve(request.result);request.onerror=()=>reject(request.error)})}
export class LocalSaveStorage {
 constructor(fs,{openDatabase=openLocalSaveDatabase,legacyFileSystem=fs.filesystems?.IDBFS,report=()=>{}}={}){this.fs=fs;this.legacyFileSystem=legacyFileSystem;this.openDatabase=openDatabase;this.report=report;this.pending=new Map();this.known=new Set();this.active=null;this.persistent=null}
 get database(){return this.connection??=this.openDatabase().then(db=>{db.onversionchange=()=>{db.close();this.connection=null};return db}).catch(error=>{this.connection=null;throw error})}
 valid(path){return typeof path==='string'&&path.startsWith('/persist/')&&!path.split('/').some(part=>part==='.'||part==='..')}
 snapshot(){
  const rows=new Map(),fs=this.fs;
  const visit=path=>{for(const name of fs.readdir(path)){if(name==='.'||name==='..')continue;const child=path+'/'+name,stat=fs.stat(child);if(fs.isDir(stat.mode))visit(child);else rows.set(child,{bytes:fs.readFile(child),mtime:Number(stat.mtime),mode:stat.mode})}};
  visit('/persist');return rows;
 }
 async prepare(){
  const db=await this.database;
  const migrated=await requested(db.transaction('meta','readonly').objectStore('meta').get('idbfsImported'));
  if(!migrated){
   // Do not mark migration complete until the entire import transaction commits.
   this.fs.mount(this.legacyFileSystem,{autoPersist:false},'/persist');
   let rows;
   try{await new Promise((resolve,reject)=>this.fs.syncfs(true,error=>error?reject(error):resolve()));rows=this.snapshot()}
   finally{this.fs.unmount('/persist')}
   const tx=transaction(db,['files','meta']);const done=completed(tx);
   const marker=tx.objectStore('meta').get('idbfsImported');
   marker.onsuccess=()=>{if(!marker.result){for(const [path,value] of rows)tx.objectStore('files').put(value,path);tx.objectStore('meta').put(true,'idbfsImported')}};
   await done;
  }
  await this.readRows(db);
  this.watch();
 }
 async readRows(db){
  const tx=db.transaction('files','readonly'),store=tx.objectStore('files');
  const [keys,rows]=await Promise.all([requested(store.getAllKeys()),requested(store.getAll())]);
  for(let i=0;i<keys.length;i++){
   const path=keys[i],row=rows[i];if(!this.valid(path))throw Error('本地存档路径无效');
   this.fs.mkdirTree(path.slice(0,path.lastIndexOf('/')));this.fs.writeFile(path,row.bytes);
   if(Number.isFinite(row.mtime))this.fs.utime(path,row.mtime,row.mtime);
   this.known.add(path);
  }
 }
 capture(path){
  if(!this.valid(path))return;
  const stat=this.fs.stat(path);if(this.fs.isDir(stat.mode))return;
  this.pending.set(path,{bytes:this.fs.readFile(path),mtime:Number(stat.mtime),mode:stat.mode});this.schedule();
 }
 erase(path){if(this.valid(path)){this.pending.set(path,null);this.schedule()}}
 schedule(){if(this.scheduled)return;this.scheduled=true;queueMicrotask(()=>{this.scheduled=false;this.flush().catch(error=>this.report('本地保存失败：'+error.message+'。请重试或导出存档，不要刷新。'))})}
 flush(){
  if(this.active)return this.active;
  this.active=(async()=>{
   const db=await this.database;
   while(this.pending.size){
    const batch=this.pending;this.pending=new Map();
    try{
     const tx=transaction(db,'files'),done=completed(tx),store=tx.objectStore('files');
     for(const [path,row] of batch)row?store.put(row,path):store.delete(path);
     await done;for(const [path,row] of batch)row?this.known.add(path):this.known.delete(path);
    }catch(error){for(const [path,row] of batch)if(!this.pending.has(path))this.pending.set(path,row);throw error}
   }
  })().finally(()=>{this.active=null});return this.active;
 }
 async sync(){
  // Explicit saves/imports reconcile deletions too, including renamed users.
  const rows=this.snapshot();for(const path of new Set([...this.known,...this.pending.keys()]))if(!rows.has(path))this.pending.set(path,null);
  for(const [path,row] of rows)this.pending.set(path,row);
  await this.flush();
 }
 watch(){
  const fs=this.fs,owner=this,close=fs.close,unlink=fs.unlink,rename=fs.rename,utime=fs.utime;
  fs.close=function(stream){const path=stream.path,written=(stream.flags&3)!==0;const result=close.call(this,stream);if(written)owner.capture(path);return result};
  fs.utime=function(path,atime,mtime){const result=utime.call(this,path,atime,mtime);const row=owner.pending.get(path);if(row)row.mtime=Number(this.stat(path).mtime);return result};
  fs.unlink=function(path){const result=unlink.call(this,path);owner.erase(path);return result};
  fs.rename=function(from,to){const result=rename.call(this,from,to);if(owner.valid(from)||owner.valid(to))owner.sync().catch(error=>owner.report('本地改名保存失败：'+error.message));return result};
 }
 async requestPersistence(storage=globalThis.navigator?.storage){
  if(!storage?.persisted||!storage?.persist)return null;
  try{this.persistent=await storage.persisted()||await storage.persist();return this.persistent}catch{return null}
 }
}
