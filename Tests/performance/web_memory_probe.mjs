// Compare unmodified release runtimes. Each run uses a fresh browser context
// and the same bundled checkpoint; no writes to the user's browser profile.
import fs from 'node:fs';
import path from 'node:path';
import assert from 'node:assert/strict';
const {chromium}=await import(process.env.PVZ_PLAYWRIGHT_MODULE);
const out=path.resolve(process.env.PVZ_PROBE_OUTPUT||'out/measurements/wasm-memory-v336');fs.mkdirSync(out,{recursive:true});
const url=process.env.PVZ_WEBGPU_URL||'http://127.0.0.1:18094/';
const seconds=Number(process.env.PVZ_PROBE_SECONDS||40),backend=process.env.PVZ_PROBE_BACKEND||'webgpu';
const browser=await chromium.launch({headless:true,executablePath:'C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe',args:['--enable-unsafe-webgpu','--ignore-gpu-blocklist','--disable-frame-rate-limit','--disable-gpu-vsync']});
const all=[];
try{
 for(const [index,memory] of ['wasm32','wasm64','wasm64','wasm32'].entries()){
  const context=await browser.newContext({viewport:{width:1400,height:800}}),page=await context.newPage();
  const errors=[];page.on('pageerror',e=>errors.push(String(e)));
  await page.addInitScript(({memory,backend})=>{localStorage.setItem('pvz_wasm_memory_model',memory);localStorage.setItem('pvz_graphics_backend',backend)},{memory,backend});
  await page.goto(url);
  await page.waitForFunction(()=>!document.getElementById('start').disabled,null,{timeout:120000});
  assert.equal(await page.evaluate(()=>Module.pvzMemoryModel),memory);
  const desired='pvz-perf'+(backend==='webgl'?'-webgl':'')+(memory==='wasm64'?'-wasm64':'');
  assert.equal(await page.evaluate(()=>Module.pvzRuntimeStem),desired);
  const checkpoint=await page.evaluate(async()=>{const b=Module.FS.readFile('/persist/development-v331/game1_58.dat64');return {bytes:b.length,sha:Array.from(new Uint8Array(await crypto.subtle.digest('SHA-256',b))).map(x=>x.toString(16).padStart(2,'0')).join('')}});
  await page.locator('#advanced-settings').evaluate(e=>e.open=true);
  await page.locator('#aspect').selectOption('21:9');await page.locator('#auto-fps').uncheck();await page.locator('#target-fps').fill('240');await page.locator('#landscape-ui').uncheck();
  await page.locator('#start').click();
  await page.waitForFunction(()=>Module._pvz_web_loading_complete?.()&&Module._pvz_web_draws()>3,null,{timeout:120000});
  await page.waitForTimeout(3000);
  const click=async(x,y)=>{const b=await page.locator('#canvas').boundingBox();await page.mouse.click(b.x+x*b.width/1400,b.y+y*b.height/600)};
  await click(700,550);await page.waitForFunction(()=>Module._pvz_web_scene()===1,null,{timeout:30000});await page.waitForTimeout(3000);
  await click(850,380);await page.waitForFunction(()=>Module._pvz_web_scene()===7);await click(700,470);await page.waitForFunction(()=>Module._pvz_web_has_board());await page.waitForTimeout(700);await click(500,370);
  await page.waitForFunction(()=>Module._pvz_web_scene()===3&&!Module._pvz_web_paused(),null,{timeout:30000});
  const cdp=await context.newCDPSession(page);await cdp.send('Performance.enable');
  const get=async()=>Object.fromEntries((await cdp.send('Performance.getMetrics')).metrics.map(m=>[m.name,m.value]));
  let previous=await get(),prior=await page.evaluate(()=>({time:performance.now(),draws:Module._pvz_web_draws(),updates:Module._pvz_web_updates()}));
  const samples=[];
  console.log(`START ${index+1}/4 ${memory}/${backend}, checkpoint ${checkpoint.sha}`);
  for(let i=0;i<seconds;i++){
   if(i===20){await page.keyboard.press('Space');await page.waitForFunction(()=>Module._pvz_web_paused()===1);prior=await page.evaluate(()=>({time:performance.now(),draws:Module._pvz_web_draws(),updates:Module._pvz_web_updates()}));previous=await get()}
   await page.waitForTimeout(1000);
   const s=await page.evaluate(()=>({time:performance.now(),draws:Module._pvz_web_draws(),updates:Module._pvz_web_updates(),paused:Module._pvz_web_paused(),scene:Module._pvz_web_scene(),wasmBytes:Module._pvz_web_heap_bytes?.()??null})),m=await get();
   const dt=(s.time-prior.time)/1000;
   samples.push({phase:i<20?'battle':'paused',fps:(s.draws-prior.draws)/dt,ups:(s.updates-prior.updates)/dt,rendererCpuPercent:m.ProcessTime!==undefined?(m.ProcessTime-previous.ProcessTime)/dt*100:null,mainTaskMsPerFrame:(m.TaskDuration-previous.TaskDuration)*1000/Math.max(1,s.draws-prior.draws),seconds:dt,draws:s.draws-prior.draws,updates:s.updates-prior.updates,paused:s.paused,scene:s.scene,wasmBytes:s.wasmBytes});
   // Elapsed sample coordinates use measured wall time, never an assumed 1s.
   samples.at(-1).second=samples.reduce((sum,row)=>sum+row.seconds,0);
   previous=m;prior=s;
   assert.equal(s.scene,3,'Battle ended during capture');assert.equal(s.paused,i<20?0:1);
  }
  const result={run:index+1,memory,backend,checkpoint,browser:await browser.version(),headless:true,targetFps:240,viewport:[1400,800],logicCanvas:[1400,600],affinity:'not changed',frequency:'not controlled',metric:'game draw counter / wall time; not physical presentation FPS',errors,samples};
  fs.writeFileSync(path.join(out,`run-${index+1}-${memory}.json`),JSON.stringify(result,null,2));all.push(result);
  console.log(`END ${memory}: ${(samples.reduce((s,x)=>s+x.draws,0)/samples.reduce((s,x)=>s+x.seconds,0)).toFixed(2)} FPS`);
  await context.close();
 }
 fs.writeFileSync(path.join(out,'runs.json'),JSON.stringify(all,null,2));
}finally{await browser.close()}
