import assert from 'node:assert/strict';
const {chromium}=await import(process.env.PVZ_PLAYWRIGHT_MODULE);
const browser=await chromium.launch({headless:true,executablePath:'C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe',args:['--ignore-gpu-blocklist']});
try{
 const page=await browser.newPage({viewport:{width:1000,height:700}}),errors=[];
 page.setDefaultTimeout(30000);
 await page.route('**/web-config.js',route=>route.fulfill({contentType:'text/javascript',body:'window.PVZWebConfig={bypassBilibiliChecks:true,diagnosticsDefault:true}'}));
 page.on('pageerror',e=>errors.push(e.message));
 await page.addInitScript(()=>{
  localStorage.setItem('pvz_graphics_backend','webgl');localStorage.setItem('pvz_diagnostics_enabled_v1','true');
  const real=window.setInterval.bind(window);window.setInterval=(fn,ms,...args)=>real(fn,ms===10000?200:ms,...args);
 });
 await page.goto(process.env.PVZ_DIAGNOSTICS_URL||'http://127.0.0.1:18107/');
 const ready=()=>page.waitForFunction(()=>!document.querySelector('#start').disabled,null,{timeout:120000});await ready();console.log('Ready');
 await page.locator('#memory-model').selectOption('wasm32');
 await page.locator('#start').click();await page.waitForFunction(()=>Module._pvz_web_loading_complete?.()&&Module._pvz_web_draws()>0,null,{timeout:120000});
 console.log('Checkpoint');await page.waitForFunction(()=>JSON.parse(localStorage.getItem('pvz_diagnostics_v1')).events.some(e=>e.type==='sample'&&e.state.draws>0));
 console.log('Game sampled');const snapshot=await page.evaluate(()=>{
  window.__diagHidden=false;Object.defineProperty(document,'hidden',{configurable:true,get:()=>__diagHidden});
  Object.defineProperty(document,'visibilityState',{configurable:true,get:()=>__diagHidden?'hidden':'visible'});
  const before=Module._pvz_web_draws();window.dispatchEvent(new PageTransitionEvent('pagehide',{persisted:false}));
  return {before,samples:JSON.parse(localStorage.getItem('pvz_diagnostics_v1')).events.filter(e=>e.type==='sample').length};
 });
 await page.waitForFunction(n=>JSON.parse(localStorage.getItem('pvz_diagnostics_v1')).events.filter(e=>e.type==='sample').length>n,snapshot.samples);
 assert.ok(await page.evaluate(()=>Module._pvz_web_draws())>snapshot.before,'pagehide itself must not stop rendering');
 await page.evaluate(()=>{__diagHidden=true;document.dispatchEvent(new Event('visibilitychange'));window.dispatchEvent(new Event('blur'))});
 console.log('Checkpoint');await page.waitForFunction(()=>JSON.parse(localStorage.getItem('pvz_diagnostics_v1')).events.some(e=>e.type==='sample'&&e.state.hidden));
 await page.evaluate(()=>{__diagHidden=false;document.dispatchEvent(new Event('visibilitychange'));window.dispatchEvent(new PageTransitionEvent('pageshow',{persisted:false}));window.dispatchEvent(new Event('focus'))});
 await page.waitForFunction(()=>{const es=JSON.parse(localStorage.getItem('pvz_diagnostics_v1')).events;return es.at(-1).type==='sample'&&!es.at(-1).state.hidden});
 console.log('Lifecycle resumed');const current=await page.evaluate(()=>JSON.parse(localStorage.getItem('pvz_diagnostics_v1')));
 assert.equal(current.events.filter(e=>e.type==='game-start').length,1);
 assert.ok(current.events.some(e=>e.type==='pageshow'&&JSON.parse(e.detail).persisted===false&&JSON.parse(e.detail).trusted===false));
 assert.ok(current.events.some(e=>e.state.visibilityState==='hidden'&&typeof e.state.monotonicMs==='number'));
 for(let i=0;i<2;i++){console.log('Reload',i);await page.reload();await ready()}
 await page.locator('#export-diagnostics').click();const report=JSON.parse(await page.locator('#diagnostics-text').inputValue());
 assert.ok(report.lastGame.gameStarted);assert.ok(report.lastGame.events.some(e=>e.state.draws>0));
 assert.ok(!report.previous.gameStarted,'Previous settings page should not masquerade as gameplay');
 assert.ok(report.lastGame.events.some(e=>e.type==='pageshow'));
 assert.deepEqual(errors,[]);
 console.log(JSON.stringify({passed:true,pagehideDidNotStopRendering:true,hiddenSampling:true,nonPersistedRecovery:true,gameStartCount:1,settingsReloads:2,lastGamePreserved:true,backend:report.lastGame.events.find(e=>e.state.backend)?.state.backend,errors},null,2));
}finally{await browser.close()}
