import assert from 'node:assert/strict';
import fs from 'node:fs';
const source=fs.readFileSync('tools/wasm/game/runtime-selection.js','utf8');
const {memoryModels,selectMemoryModel,runtimeStem}=await import('data:text/javascript;base64,'+Buffer.from(source).toString('base64'));
const both={webgpu:true,fallback:true,memory64Available:true};
assert.deepEqual(memoryModels(both,true),['wasm32','wasm64']);
assert.deepEqual(memoryModels(both,false),['wasm32']);
assert.equal(selectMemoryModel(memoryModels(both,true),null),'wasm64');
assert.equal(selectMemoryModel(memoryModels(both,true),'wasm64'),'wasm64');
assert.equal(selectMemoryModel(memoryModels(both,false),'wasm64'),'wasm32');
assert.equal(selectMemoryModel(memoryModels(both,true),'invalid'),'wasm64');
assert.equal(selectMemoryModel(memoryModels(both,true),'wasm32'),'wasm32');
assert.deepEqual(memoryModels({},true),['wasm32']);
assert.throws(()=>memoryModels({memory64:true},false),/Memory64/);
assert.deepEqual(memoryModels({memory64:true},true),['wasm64']);
for(const backend of ['webgpu','webgl'])for(const memory of ['wasm32','wasm64']){
 assert.equal(runtimeStem(both,backend,memory),'pvz-perf'+(backend==='webgl'?'-webgl':'')+(memory==='wasm64'?'-wasm64':''));
}
assert.equal(runtimeStem({memory64:true},'webgl','wasm64'),'pvz-perf');
console.log('PASS automatic64, manual override32, unavailable/stale selection, all four filenames, standalone diagnostics');

const {highResolutionLink}=await import('data:text/javascript;base64,'+Buffer.from(source).toString('base64'));
for(const memory64 of [false,true])for(const simd128 of [false,true])for(const webgpu of [false,true]){
 assert.equal(highResolutionLink({highResolutionUrl:'https://example.com/hd'},memory64,simd128,webgpu),memory64&&simd128&&webgpu?'https://example.com/hd':'');
}
for(const highResolutionUrl of ['', '  ', null, 'broken', 'javascript:alert(1)', 'data:text/html,test'])
 assert.equal(highResolutionLink({highResolutionUrl},true,true,true),'');
assert.equal(highResolutionLink({},true,true,true),'');
console.log('PASS HD link requires configured HTTP(S) URL plus Memory64, SIMD128 and WebGPU');

const three={...both,webgpuMemory64Only:true};
assert.equal(runtimeStem(three,'webgpu','wasm64'),'pvz-perf-wasm64');
assert.equal(runtimeStem(three,'webgl','wasm64'),'pvz-perf-webgl-wasm64');
assert.equal(runtimeStem(three,'webgl','wasm32'),'pvz-perf-webgl');
assert.throws(()=>runtimeStem(three,'webgpu','wasm32'),/Memory64/);
console.log('PASS three-runtime package filenames and missing wasm32 WebGPU rejection');
