import assert from 'node:assert/strict';
import {LocalSaveStorage} from './game/local-save-storage.js';
// Test dependency only; no npm dependencies are shipped in the game package.
const {IDBFactory}=await import(process.env.PVZ_INDEXEDDB_TEST_MODULE||'../../out/verification/browser-storage-deps/node_modules/fake-indexeddb/build/esm/index.js');
globalThis.indexedDB=new IDBFactory();
const path='/persist/development-v331/game1_58.dat64',profile='/persist/development-v331/users.dat';
const bytes=text=>new TextEncoder().encode(text),text=value=>new TextDecoder().decode(value);
function fileSystem(legacy={}){
 const nodes=new Map([['/persist',{dir:true}]]);let imports=0,mounts=0;
 const fs={nodes,get imports(){return imports},get mounts(){return mounts},
  isDir:mode=>mode===1,stat:p=>{const row=nodes.get(p);if(!row)throw Error('ENOENT '+p);return {mode:row.dir?1:2,mtime:new Date(row.mtime||0)}},
  readdir:p=>['.','..',...Array.from(nodes.keys()).filter(k=>k.startsWith(p+'/')&&!k.slice(p.length+1).includes('/')).map(k=>k.slice(p.length+1))],
  mkdirTree:p=>{let current='';for(const part of p.split('/').filter(Boolean)){current+='/'+part;nodes.set(current,nodes.get(current)||{dir:true})}},
  close(){},readFile:p=>{const value=nodes.get(p).data.slice();fs.close({path:p,flags:0});return value},
  writeFile(p,data){fs.mkdirTree(p.slice(0,p.lastIndexOf('/')));nodes.set(p,{data:data.slice(),mtime:Date.now()});fs.close({path:p,flags:2})},
  utime(p,atime,mtime){nodes.get(p).mtime=mtime},unlink(p){if(!nodes.delete(p))throw Error('ENOENT '+p)},rename(from,to){nodes.set(to,nodes.get(from));nodes.delete(from)},
  mount(){mounts++},unmount(){for(const key of nodes.keys())if(key.startsWith('/persist/'))nodes.delete(key)},
  syncfs(populate,done){assert.equal(populate,true,'IDBFS must only be read during migration');imports++;for(const [p,data] of Object.entries(legacy))fs.writeFile(p,data);done(null)}
 };return fs;
}
const fs=fileSystem({[path]:bytes('PVZDAT64 old checkpoint'),[profile]:bytes('users')}),storage=new LocalSaveStorage(fs);
await storage.prepare();assert.equal(fs.imports,1);assert.equal(text(fs.readFile(path)),'PVZDAT64 old checkpoint');
fs.writeFile(path,bytes('PVZDAT64 current'));fs.utime(path,12345,12345);await storage.flush();
const db=await storage.database;
const row=await new Promise((resolve,reject)=>{const r=db.transaction('files').objectStore('files').get(path);r.onsuccess=()=>resolve(r.result);r.onerror=()=>reject(r.error)});
assert.equal(row.mtime,12345,'Cloud restore must preserve its timestamp without a whole-directory rescan');
assert.equal(text(row.bytes),'PVZDAT64 current','Close must persist a checkpoint without a whole-directory sync');
const fs2=fileSystem({[path]:bytes('obsolete legacy checkpoint')}),storage2=new LocalSaveStorage(fs2);
await storage2.prepare();assert.equal(fs2.imports,0);assert.equal(fs2.mounts,0,'Steady-state startup must not mount IDBFS');
assert.equal(text(fs2.readFile(path)),'PVZDAT64 current','Legacy data must never replace the migrated database');
fs2.readFile(path);await storage2.flush();assert.equal(text(fs2.readFile(path)),'PVZDAT64 current','Reading a checkpoint must not consume it');
fs2.unlink(path);await storage2.flush();
const fs3=fileSystem(),storage3=new LocalSaveStorage(fs3);await storage3.prepare();assert.ok(!fs3.nodes.has(path),'Intentional deletion must survive reload');
fs3.writeFile(path,bytes('PVZDAT64 renamed'));fs3.rename(path,path.replace('game1','game2'));await storage3.flush();
const fs4=fileSystem(),storage4=new LocalSaveStorage(fs4);await storage4.prepare();assert.ok(!fs4.nodes.has(path));assert.ok(fs4.nodes.has(path.replace('game1','game2')),'Rename must not resurrect its pending source');
// Failed transactions keep the previous complete checkpoint and pending data.
fs4.writeFile(path,bytes('PVZDAT64 retry'));
let rejectWrites=true;
const ownDb=await storage4.database,ownTransaction=ownDb.transaction.bind(ownDb);
ownDb.transaction=(names,mode,options)=>{const tx=ownTransaction(names,mode,options);if(mode==='readwrite'&&rejectWrites)queueMicrotask(()=>tx.abort());return tx};
await assert.rejects(storage4.flush());assert.ok(storage4.pending.has(path));rejectWrites=false;await storage4.flush();
assert.equal(storage4.pending.size,0);ownDb.transaction=ownTransaction;
let requests=0;assert.equal(await storage4.requestPersistence({persisted:async()=>true,persist:async()=>{requests++;return true}}),true);assert.equal(requests,0);
assert.equal(await storage4.requestPersistence({persisted:async()=>false,persist:async()=>false}),false);
assert.equal(await storage4.requestPersistence({persisted:async()=>{throw Error('denied')},persist:async()=>false}),null);
console.log('Direct IndexedDB saves: atomic legacy migration, close-to-commit, reload, reads, deletion, rename, retry and persistent-storage denial passed');

// Exercise the actual bundled editor mutation plan through durable storage.
const {ProfileStore,encodeSummary,newProfile}=await import('../bin/web/save-codec.js');
const root='/persist/development-v331';
fs4.analyzePath=path=>({exists:fs4.nodes.has(path)});
fs4.writeFile(root+'/users.dat',encodeSummary([{id:1,name:'Player1',useSeq:1},{id:11,name:'Player11',useSeq:2}]));
for(const id of [1,11]){
 fs4.writeFile(root+'/user'+id+'.dat64',newProfile());
 for(const mode of [0,58,72])fs4.writeFile(root+'/game'+id+'_'+mode+'.dat64',bytes('checkpoint '+id));
}
await storage4.flush();
const plan=new ProfileStore(fs4,root).remove(1);
assert.deepEqual([...plan.removes].sort(),['user1.dat64','game1_0.dat64','game1_58.dat64','game1_72.dat64'].sort());
for(const [name,value] of plan.writes)fs4.writeFile(root+'/'+name,value);
for(const name of plan.removes)fs4.unlink(root+'/'+name);
await storage4.flush();
const reloaded=fileSystem(),reloadedStorage=new LocalSaveStorage(reloaded);await reloadedStorage.prepare();
reloaded.analyzePath=path=>({exists:reloaded.nodes.has(path)});
assert.deepEqual(new ProfileStore(reloaded,root).rows().map(row=>row.id),[11]);
for(const name of plan.removes)assert.ok(!reloaded.nodes.has(root+'/'+name),'Deleted user checkpoint resurrected: '+name);
for(const name of ['user11.dat64','game11_0.dat64','game11_58.dat64','game11_72.dat64'])assert.ok(reloaded.nodes.has(root+'/'+name),'Another user was affected: '+name);
console.log('PASS editor user deletion: all owned modes removed from IndexedDB across reload; user 11 retained when deleting user 1');
