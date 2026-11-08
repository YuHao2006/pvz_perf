import assert from 'node:assert/strict';
const {chromium}=await import(process.env.PVZ_PLAYWRIGHT_MODULE);
const browser=await chromium.launch({headless:true,executablePath:'C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe',args:['--enable-unsafe-webgpu','--ignore-gpu-blocklist']});
try{
 const context=await browser.newContext(),page=await context.newPage(),errors=[];
 page.on('pageerror',error=>errors.push(String(error)));
 await page.goto(process.env.PVZ_WEBGPU_URL||'http://127.0.0.1:18103/');
 const ready=async()=>{
  await page.waitForFunction(()=>!document.getElementById('start').disabled||!document.getElementById('error').hidden,null,{timeout:120000});
  assert.equal(await page.locator('#error').isVisible(),false,await page.locator('#error').textContent());
 };
 await ready();
 for(const [memory,backend] of [['wasm32','webgl'],['wasm64','webgpu']]){
  for(const [id,value] of [['memory-model',memory],['graphics-backend',backend]]){
   if(await page.locator('#'+id).inputValue()!==value){
    await page.locator('#advanced-settings').evaluate(el=>el.open=true);
    await Promise.all([page.waitForEvent('load'),page.locator('#'+id).selectOption(value)]);await ready();
   }
  }
  const requests=[],blocked=/\.(?:data|wasm(?:\.gz)?)(?:\?|$)/;
  await page.route(blocked,route=>{requests.push(route.request().url());return route.abort()});
  const session=await context.newCDPSession(page);await session.send('Emulation.setCPUThrottlingRate',{rate:4});
  const result=await page.evaluate(async()=>{
   const {runSaveTool,loadSaveBundle}=await import('./save-tools.js');
   const bundle=await loadSaveBundle(),original=Module.FS.readFile('/persist/development-v4/game1_58.dat64').slice();
   const compiled=Module.pvzMemory,started=performance.now(),initialFrames=document.querySelectorAll('iframe').length;
   const baseline=await runSaveTool({op:'extract',mode:58},bundle['game1_58.dat64']);
   const recipe={cells:baseline.metadata.cells,flags:128,seed:114514,scene:2,rake:0,sun:4321};
   const generated=await runSaveTool({op:'generate',mode:58,recipe});
   const extracted=await runSaveTool({op:'extract',mode:58},generated.bytes);
   const current=Module.FS.readFile('/persist/development-v4/game1_58.dat64');
   return {milliseconds:performance.now()-started,generated:generated.metadata,extracted:extracted.metadata,
    sameModule:compiled===Module.pvzMemory,samePersistentSave:original.length===current.length&&original.every((b,i)=>b===current[i]),
    frames:document.querySelectorAll('iframe').length,initialFrames,activeJob:!!window.PVZSaveToolJob,scene:Module._pvz_web_scene()};
  });
  await session.send('Emulation.setCPUThrottlingRate',{rate:1});await session.detach();await page.unroute(blocked);
  assert.deepEqual(requests,[],'Independent tool must not fetch another game Wasm binary or resource package');
  assert.equal(result.sameModule,true);assert.equal(result.samePersistentSave,true);assert.equal(result.activeJob,false);assert.equal(result.frames,result.initialFrames);assert.equal(result.scene,-1);
  for(const key of ['flags','seed','sun','scene','mowers','cells','healthyPlants'])assert.deepEqual(result.extracted[key],result.generated[key]);
  assert.equal(result.generated.flags,128);assert.equal(result.generated.seed,114514);assert.equal(result.generated.sun,4321);assert.equal(result.generated.mowers,0);
  console.log('PASS '+memory+'/'+backend+': extract/generate/extract at 4x CPU throttle, standalone wasm32 tool, no game binary/data fetch, host file preserved; '+Math.round(result.milliseconds)+'ms');
 }
 assert.deepEqual(errors,[]);await context.close();
}finally{await browser.close()}
