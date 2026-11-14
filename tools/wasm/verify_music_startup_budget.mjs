import assert from 'node:assert/strict';
const {chromium}=await import(process.env.PVZ_PLAYWRIGHT_MODULE);
const browser=await chromium.launch({headless:true,executablePath:'C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe',args:['--enable-unsafe-webgpu','--ignore-gpu-blocklist']});
try{
 for(const mode of ['normal','worker-start','decoder-load']){
  const context=await browser.newContext(),page=await context.newPage(),errors=[];page.on('pageerror',e=>errors.push(e.message));
  await page.addInitScript(mode=>{
   localStorage.setItem('pvz_graphics_backend','webgl');localStorage.setItem('pvz_wasm_memory_override','wasm32');
   const timer=window.setTimeout;window.setTimeout=(fn,delay,...args)=>timer(fn,window.shortMusicBudget&&delay>=29000&&delay<=30000?40:delay,...args);
   const Original=AudioWorkletNode;let blocked=mode!=='normal',held=[];
   window.AudioWorkletNode=class extends Original{constructor(...args){super(...args);const port=this.port;port.addEventListener('message',event=>{
    const defer=mode==='worker-start'?event.data.ready:mode==='decoder-load'&&(event.data.loaded||event.data.voices||event.data.flush);
    if(blocked&&defer){held.push([port,event.data]);event.stopImmediatePropagation()}
   })}};
   window.releaseMusic=()=>{blocked=false;for(const [port,data] of held)port.dispatchEvent(new MessageEvent('message',{data}));held=[]};
  },mode);
  await page.goto(process.env.PVZ_WEBGPU_URL||'http://127.0.0.1:18104/');
  await page.waitForFunction(()=>!document.getElementById('start').disabled||!document.getElementById('error').hidden,null,{timeout:120000});
  assert.equal(await page.locator('#error').isVisible(),false);
  assert.match(await page.locator('#level-save-cloud-warning').textContent(),/高级选项/);
  if(mode!=='normal')await page.evaluate(()=>window.shortMusicBudget=true);
  await page.locator('#start').click();
  await page.waitForFunction(()=>Module._pvz_web_loading_complete?.()&&Module._pvz_web_draws()>2||!document.getElementById('error').hidden,null,{timeout:120000});
  assert.equal(await page.locator('#error').isVisible(),false,await page.locator('#error').textContent());
  const state=await page.evaluate(()=>({ready:Module.pvzMusic.ready,disabled:Module.pvzMusic.disabled,pending:Module.pvzMusic.pendingLoads.size,queued:Module.pvzMusic.queued.length,sounds:Module.pvzMusic.sound.sources.size}));
  assert.equal(state.disabled,false);assert.ok(state.sounds>0);assert.equal(await page.locator('#audio-warning').isVisible(),false,'Timeout must be silent');
  if(mode==='worker-start'){assert.equal(state.ready,false);assert.ok(state.queued>0)}
  if(mode==='decoder-load')assert.ok(state.pending>0);
  await page.evaluate(()=>window.releaseMusic());
  await page.waitForFunction(()=>Module.pvzMusic.ready&&Module.pvzMusic.pendingLoads.size===0,null,{timeout:30000});
  const loaded=await page.evaluate(()=>[...Module.pvzMusic.voices.values()].filter(v=>!v.stream).length);assert.equal(loaded,3);
  assert.deepEqual(errors,[]);console.log('PASS '+mode+': game/effects continue, all three MO3 voices acknowledged, late initialization/load resumes without reload; '+JSON.stringify(state));
  await context.close();
 }
}finally{await browser.close()}
