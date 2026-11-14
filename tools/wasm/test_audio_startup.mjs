import assert from 'node:assert/strict';
import {prepareMusic} from './game/audio/music-engine.js';
const originalFetch=globalThis.fetch,originalTimer=globalThis.setTimeout;
let behavior='ready',closed=0,connected=0;
globalThis.fetch=async()=>({ok:true,arrayBuffer:async()=>new Uint8Array([0,97,115,109,1,0,0,0]).buffer});
globalThis.setTimeout=(callback,delay,...args)=>originalTimer(callback,delay>29000?15:delay,...args);
class Context{
 constructor(){this.destination={};this.state='running';this.audioWorklet={addModule:async()=>{if(behavior==='module-error')throw Error('module denied')}}}
 resume(){return Promise.resolve()}
 createGain(){return {connect(){},disconnect(){}}}
 close(){closed++;return Promise.resolve()}
}
class Worklet{
 constructor(){if(behavior==='clone-error')throw new DOMException('module clone failed','DataCloneError');this.port={close(){},postMessage(){}}}
 connect(){connected++;if(behavior==='ready')queueMicrotask(()=>this.port.onmessage({data:{ready:true}}))}
 disconnect(){}
}
globalThis.AudioContext=Context;globalThis.AudioWorkletNode=Worklet;
try{
 const engine=await prepareMusic();await engine.unlock();assert.equal(engine.backend,'AudioWorklet');assert.equal(connected,1);
 for(const [mode,pattern] of [['clone-error',/clone/],['module-error',/module denied/]]){
  behavior=mode;const failed=await prepareMusic();await assert.doesNotReject(()=>failed.unlock());
  assert.equal(failed.disabled,true);assert.match(failed.error,pattern);assert.ok(failed.sound,'Sound effects must survive a music-worker failure');
  failed.close();assert.equal(failed.context,null,'A fresh game session must be able to retry music');
  behavior='ready';await failed.unlock();assert.equal(failed.backend,'AudioWorklet');
 }
 assert.equal(closed,2);
 behavior='silent';const delayed=await prepareMusic();await delayed.unlock();
 assert.equal(delayed.disabled,false,'Readiness timeout must keep the graph for late recovery');
 assert.equal(delayed.ready,false);assert.ok(delayed.sound);
 const late=delayed.node,voice=delayed.load(new Uint8Array([1,2,3]),false);
 delayed.command(voice,'gain',0.7);delayed.command(voice,'play');
 assert.equal(await delayed.waitForLoads(),false,'The exhausted shared deadline must not block again');
 assert.equal(delayed.queued.length,3,'Load/gain/play survive a delayed worker');
 const replay=[];late.port.postMessage=c=>replay.push(c.op);
 late.port.onmessage({data:{ready:true}});await new Promise(resolve=>originalTimer(resolve,0));
 assert.equal(delayed.ready,true);assert.deepEqual(replay,['load','gain','play']);
 late.port.onmessage({data:{loaded:voice}});assert.equal(delayed.pendingLoads.size,0);
 assert.equal(await delayed.waitForLoads(),true,'Late decoder acknowledgement restores availability');
 delayed.close();
 behavior='silent';const pending=await prepareMusic();await pending.unlock();pending.startupDeadline=performance.now()+30000;
 pending.load(new Uint8Array([1]),false);const waiting=pending.waitForLoads();pending.close();assert.equal(await waiting,false,'Quit cancels startup load waiters');
 behavior='ready';
 globalThis.fetch=async()=>({ok:false,status:404});const missing=await prepareMusic();await missing.unlock();assert.equal(missing.disabled,true);assert.match(missing.error,/404/);assert.ok(missing.sound);
 console.log('Audio graph before readiness; module/clone/readiness/download failures stay nonfatal, retain effects and allow a new-session retry: passed');
}finally{globalThis.fetch=originalFetch;globalThis.setTimeout=originalTimer}
