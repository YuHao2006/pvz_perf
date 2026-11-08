import assert from 'node:assert/strict';
import {createDiagnostics} from './game/diagnostics.js';
const values=new Map(),storage={getItem:k=>values.get(k)||null,setItem:(k,v)=>values.set(k,v)};
let time=1000,hidden=false,running=true,next=0;const timers=new Map();
const make=()=>createDiagnostics({storage,defaultEnabled:true,environment:()=>({version:'lifecycle-test'}),
 readState:()=>({running,hidden,draws:10}),now:()=>time,
 schedule:fn=>{const id=++next;timers.set(id,fn);return id},cancel:id=>timers.delete(id)});
const d=make();d.record('page-ready');d.start();assert.equal(timers.size,1);
d.pagehide();assert.equal(timers.size,1,'Host pagehide must not cancel the ordinary diagnostic timer');time+=65000;
d.lifecycle('pageshow',JSON.stringify({persisted:false}));assert.equal(timers.size,1,'Non-BFCache pageshow must restore sampling');
assert.equal(d.report().current.events.filter(e=>e.type==='game-start').length,1,'Resume is not another game start');
hidden=true;d.lifecycle('visibilitychange');assert.equal(timers.size,1,'Hidden report must not create a diagnostic blind spot');
hidden=false;d.lifecycle('visibilitychange');assert.equal(timers.size,1);
d.lifecycle('focus');d.lifecycle('pageshow','{"persisted":true}');assert.equal(timers.size,1,'No duplicate samplers');
d.lifecycle('freeze');assert.equal(timers.size,1);d.lifecycle('resume');assert.equal(timers.size,1);
for(let i=0;i<110;i++){time+=10000;[...timers.values()][0]()}
assert.equal(d.report().current.events.length,90);assert.ok(d.report().current.gameStarted);
d.quit();running=false;assert.equal(timers.size,0);d.lifecycle('pageshow');assert.equal(timers.size,0,'Quit must not restart sampling');
const once=make();once.record('page-ready');assert.ok(once.report().lastGame.gameStarted);once.pagehide();
const twice=make();twice.record('page-ready');assert.ok(twice.report().lastGame.gameStarted,'Reloading settings must retain last real gameplay');
assert.ok(twice.report().lastGame.normalQuit);assert.equal(twice.report().current.gameStarted,undefined);
console.log('PASS non-persisted/BFCache restore, hidden/visible/freeze/resume, single timer, bounded history, preserved gameplay and no sampling after Quit');
