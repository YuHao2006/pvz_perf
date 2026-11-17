import assert from 'node:assert/strict';
import {ProgressStorage,encode,digest} from './game/progress-storage.js';
import {sharedStorage,preferCloud} from './game/shared-storage.js';
const storageId='st_v1sneoksfl8xqth1',headKey='pvz_progress_v1';
const time=Date.now()-10000;
const files=label=>({'users.dat':encode(new Uint8Array([1,2,3])),'user1.dat64':encode(new TextEncoder().encode('PVZUSR64 '+label))});
const makeFs=initial=>{
 const data=structuredClone(initial);
 return {readdir:()=>Object.keys(data),readFile:path=>Uint8Array.from(atob(data[path.split('/').at(-1)]),c=>c.charCodeAt(0)),
  writeFile:(path,bytes)=>{data[path.split('/').at(-1)]=encode(bytes)},unlink:path=>delete data[path.split('/').at(-1)],stat:()=>({mtime:new Date(time)}),utime(){}};
};
function fixture(){
 const legacy={},shared={},removed=[];let legacyReads=0,hook;
 const select=(rows,keys)=>Object.fromEntries(keys.filter(k=>Object.hasOwn(rows,k)).map(k=>[k,rows[k]]));
 const toy={
  async getCloudStorage(keys){legacyReads++;return select(legacy,keys)},
  async setCloudStorage(){throw Error('Legacy storage must remain read-only')},
  async getSharedStorage(id,keys){assert.equal(id,storageId);return select(shared,keys)},
  async setSharedStorage(id,values){assert.equal(id,storageId);for(const [k,v] of Object.entries(values)){assert.match(k,/^[a-zA-Z0-9_-]{1,128}$/);assert.ok(new TextEncoder().encode(v).length<=1024)}Object.assign(shared,values);if(hook)await hook(values)},
  async removeSharedStorage(id,keys){assert.equal(id,storageId);removed.push(...keys);keys.forEach(k=>delete shared[k])}
 };
 const create=(initial,options={})=>new ProgressStorage(makeFs(initial||files('local')),'/s',{cloudEnabled:true,provideToy:async()=>toy,sharedStorageId:storageId,report(){},...options});
 return {toy,legacy,shared,removed,create,get legacyReads(){return legacyReads},set hook(value){hook=value}};
}
async function legacySnapshot(f,value){
 const bytes=new Uint8Array(await new Response(new Blob([JSON.stringify(value)]).stream().pipeThrough(new CompressionStream('gzip'))).arrayBuffer());
 f.legacy.pvz_progress_a_0=encode(bytes);
 f.legacy[headKey]=JSON.stringify({format:1,slot:'a',count:1,digest:await digest(bytes),savedAt:time});
}
// Minimal IndexedDB transaction harness exercises local metadata across startup.
const backupRows=new Map();globalThis.indexedDB={open(){const request={};queueMicrotask(()=>{request.result={close(){},transaction(){const tx={objectStore:()=>({get(key){const r={};queueMicrotask(()=>{r.result=backupRows.get(key);r.onsuccess?.();queueMicrotask(()=>tx.oncomplete?.())});return r},put(value,key){const r={};queueMicrotask(()=>{backupRows.set(key,structuredClone(value));r.onsuccess?.();queueMicrotask(()=>tx.oncomplete?.())});return r}})};return tx}};request.onsuccess()});return request}};

const f=fixture(),original=files('legacy');await legacySnapshot(f,original);
const legacyBefore=structuredClone(f.legacy),a=f.create();
assert.deepEqual((await a.readCloud()).files,original);
assert.deepEqual(f.shared,f.legacy,'Validated legacy data should migrate without changing its timestamp');
assert.deepEqual(f.legacy,legacyBefore,'Migration must retain the private save');
const reads=f.legacyReads;await f.create().readCloud();assert.equal(f.legacyReads,reads,'Existing shared save takes priority');
assert.equal(preferCloud(time,{savedAt:time}),true,'Legacy upload time is used as a migration fallback');
await a.writeCloud(files('first'),time+10,true);
await a.writeCloud(files('intermediate'),time+20);
const b=f.create();await b.readCloud();
await a.writeCloud(files('newer'),time+100);
assert.equal(await b.writeCloud(files('stale'),time+50),'restored');
assert.deepEqual(b.snapshot(),files('newer'),'Newer cloud progress should restore automatically');
assert.deepEqual((await f.create().readCloud()).files,files('newer'),'A delayed stale snapshot must not overwrite newer progress');
assert.equal(b.needsChoice,undefined,'No manual conflict choice remains');
assert.equal(preferCloud(time,{modifiedAt:time}),true,'Equal timestamps select cloud deterministically');
assert.equal(preferCloud(Date.now()+3600000,{modifiedAt:time}),true,'Invalid local clock cannot claim newer content');
assert.equal(JSON.parse(f.shared[headKey]).modifiedAt,time+100,'Upload must preserve content modification time');
assert.ok(f.removed.length,'Old immutable chunk versions are reclaimed after successful commits');
// A writer losing the pre-commit head check cannot damage the winning chunks.
const winner=fixture();await winner.create().writeCloud(files('winner'),time+300,true);
const winnerRows=structuredClone(winner.shared);f.hook=async values=>{if(!values[headKey]){Object.assign(f.shared,winnerRows);f.hook=null}};
assert.equal(await a.writeCloud(files('racing'),time+200),'deferred');
assert.deepEqual((await f.create().readCloud()).files,files('winner'));
const bad=fixture();await legacySnapshot(bad,original);bad.legacy.pvz_progress_a_0='AAAA';
await assert.rejects(bad.create().readCloud(),/校验失败/);assert.deepEqual(bad.shared,{},'Corrupt legacy data must never migrate');
const race=fixture();await legacySnapshot(race,original);
const sdk=race.toy,adapter=sharedStorage(sdk,storageId);await adapter.getCloudStorage([headKey]);await adapter.getCloudStorage(['pvz_progress_a_0']);
Object.assign(race.shared,winnerRows);assert.equal(await adapter.finishLegacyRead(),false,'Migration must not overwrite a newly published shared save');
assert.deepEqual(race.shared,winnerRows);
let active=true;const live=winner.create(files('active'),{canApplyRemote:()=>!active});
assert.equal(await live.writeCloud(files('active'),time),'deferred');assert.deepEqual(live.snapshot(),files('active'));
active=false;assert.equal(await live.writeCloud(files('active'),time),'restored');assert.deepEqual(live.snapshot(),files('winner'));
const startup=winner.create(files('old local'));startup.modifiedAt=time;await startup.prepare();
assert.deepEqual(startup.snapshot(),files('winner'));
assert.equal(startup.modifiedAt,time+300,'Restoring cloud data must not turn its timestamp into the current time');
assert.deepEqual(backupRows.get('conflict').files,files('old local'),'Automatic restore keeps a recoverable copy of local progress');
let seen;startup.store=async(value,modifiedAt)=>{seen={value,modifiedAt}};
await startup.save();assert.equal(seen.modifiedAt,time+300,'Saving unchanged restored data preserves its version');
console.log('Shared Toy storage: legacy migration, namespace priority, checksum, clock conflicts, stale uploads, racing chunks, cleanup and restore timestamps passed');
