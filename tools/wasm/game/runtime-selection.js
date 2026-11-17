// Runtime selection changes only which game binary is loaded. Resources,
// settings and save storage are shared by all memory models/backends.
export function supportsMemory64(){
 try{return WebAssembly.validate(new Uint8Array([0,97,115,109,1,0,0,0,5,3,1,4,1]))}catch{return false}
}
export function supportsSimd128(){
 try{return WebAssembly.validate(new Uint8Array([0,97,115,109,1,0,0,0,1,5,1,96,0,1,123,3,2,1,0,10,22,1,20,0,253,12,...Array(16).fill(0),11]))}catch{return false}
}
export function memoryModels(config,supported,simdSupported=true){
 if(config.simd128&&!simdSupported){
  if(config.memory64||config.webgpu&&!config.fallback)throw Error('此包需要 WebAssembly SIMD128；请更新浏览器或 B站 App。');
  return ['wasm32'];
 }

 if(config.memory64){
  if(!supported)throw Error('此诊断包需要 Wasm Memory64；当前浏览器不支持。64 位手机或操作系统不等于浏览器支持 Memory64。');
  return ['wasm64'];
 }
 return config.memory64Available&&supported?['wasm32','wasm64']:['wasm32'];
}
export function selectMemoryModel(models,saved){return models.includes(saved)?saved:models.includes('wasm64')?'wasm64':models[0]}
export function runtimeStem(config,backend,memoryModel){
 if(config.webgpuMemory64Only&&backend==='webgpu'&&memoryModel!=='wasm64')throw Error('WebGPU 仅提供 Memory64 版本；32 位请使用 WebGL 2。');
 const base=config.webgpu&&backend==='webgl'?'pvz-perf-webgl':'pvz-perf';
 return base+(memoryModel==='wasm64'&&!config.memory64?'-wasm64':'');
}

// Only advertise HD when its configured destination and all required features exist.
export function highResolutionLink(config,memory64,simd128,webgpu){
 if(!memory64||!simd128||!webgpu||typeof config?.highResolutionUrl!=='string'||!config.highResolutionUrl.trim())return '';
 try{const url=new URL(config.highResolutionUrl);return ['https:','http:'].includes(url.protocol)?url.href:''}catch{return ''}
}
