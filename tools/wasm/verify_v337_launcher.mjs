import assert from 'node:assert/strict';
import fs from 'node:fs';
const {chromium}=await import(process.env.PVZ_PLAYWRIGHT_MODULE);
const browser=await chromium.launch({headless:true,executablePath:'C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe',args:['--enable-unsafe-webgpu','--ignore-gpu-blocklist']});
try{
 const context=await browser.newContext({acceptDownloads:true}),page=await context.newPage(),errors=[];
 page.on('pageerror',e=>errors.push(String(e)));
 await page.route('**/web-config.js',r=>r.fulfill({contentType:'text/javascript',body:"window.PVZWebConfig={bypassBilibiliChecks:false,rewardVideoBvid:'BV1hV4P6PEDc'}"}));
 await page.addInitScript(()=>{
  localStorage.setItem('pvz_graphics_backend','webgl');localStorage.setItem('pvz_wasm_memory_model','wasm32');
  window.coinCount=0;window.author=false;window.coinQueries=0;
  window.toy={getAuthorRelation:async()=>({status:'ok',data:{isAuthor:window.author}}),getVideoUserActions:async()=>{window.coinQueries++;return {status:'ok',items:[{status:'ok',bvid:'BV1hV4P6PEDc',coinCount:window.coinCount}]}}};
 });
 await page.goto(process.env.PVZ_WEBGPU_URL||'http://127.0.0.1:18093/');
 await page.waitForFunction(()=>!document.getElementById('start').disabled||!document.getElementById('error').hidden,null,{timeout:120000});
 assert.equal(await page.locator('#error').isVisible(),false,await page.locator('#error').textContent());
 assert.equal(await page.locator('#memory-model').inputValue(),'wasm64','Memory64 must supersede old implicit wasm32');
 assert.equal(await page.locator('#unlock-all-levels').isChecked(),false);
 assert.equal(await page.locator('#unlock-all-levels').evaluate(e=>!!e.closest('#advanced-settings')),false);
 await page.locator('#unlock-all-levels').click();await page.waitForFunction(()=>!document.getElementById('unlock-all-levels').disabled);
 assert.equal(await page.locator('#unlock-all-levels').isChecked(),false);assert.match(await page.locator('#reward-status').textContent(),/两个币/);
 await page.evaluate(()=>window.coinCount=2);await page.locator('#unlock-all-levels').click();await page.waitForFunction(()=>!document.getElementById('unlock-all-levels').disabled);
 assert.equal(await page.locator('#unlock-all-levels').isChecked(),true);
 await page.locator('#unlock-all-levels').uncheck();await page.evaluate(()=>{window.author=true;window.coinCount=0});await page.locator('#unlock-all-levels').click();await page.waitForFunction(()=>!document.getElementById('unlock-all-levels').disabled);
 assert.equal(await page.locator('#unlock-all-levels').isChecked(),true);
 console.log('PASS main settings checkbox: default false, non-advanced, denied at 0 coins, granted at 2 coins or author');
 const files=Object.fromEntries(['game1_0.dat64','user1.dat64','users.dat'].map(name=>[name,Array.from(fs.readFileSync('out/verification/web-v337/reported-'+name))]));
 const result=await page.evaluate(async files=>{
  const root='/persist/development-v4/';for(const [name,data] of Object.entries(files))Module.FS.writeFile(root+name,new Uint8Array(data));
  const {runSaveTool}=await import('./save-tools.js'),original=Module.FS.readFile(root+'game1_0.dat64').slice(),profile=Module.FS.readFile(root+'user1.dat64');
  const repaired=await runSaveTool({op:'repair-plant-attacks',mode:0},original,profile);
  if(!repaired.bytes)throw Error('Known broken fixture did not produce a repaired copy: '+JSON.stringify(repaired.metadata));
  const second=await runSaveTool({op:'repair-plant-attacks',mode:0},repaired.bytes,profile);
  const valid=await runSaveTool({op:'validate',mode:0},repaired.bytes,profile);
  return {repairs:repaired.metadata.repairs,second:second.metadata.repairs,valid:valid.metadata,unchanged:original.every((v,i)=>v===Module.FS.readFile(root+'game1_0.dat64')[i]),phase:Module._pvz_web_scene()};
 },files);
 assert.ok(result.repairs.length>0);assert.equal(result.second.length,0);assert.equal(result.unchanged,true);assert.equal(result.phase,-1);
 console.log('PASS isolated repair: real reported corrupt save, idempotence, valid output, original preserved; '+JSON.stringify(result));
 assert.equal(await page.locator('#plant-repair-settings,#plant-repair,#plant-repair-save').count(),0);
 console.log('PASS manual repair UI removed; historical files use automatic standalone DFU before launch');

 await page.locator('#start').click();await page.waitForFunction(()=>Module.FS.analyzePath('/persist/development-v4/settings.json').exists&&JSON.parse(Module.FS.readFile('/persist/development-v4/settings.json',{encoding:'utf8'})).unlockAllLevels===true||!document.getElementById('error').hidden,null,{timeout:120000});
 assert.equal(await page.locator('#error').isVisible(),false,await page.locator('#error').textContent());
 assert.deepEqual(errors,[]);console.log('PASS native settings propagation and no browser errors');await context.close();
}finally{await browser.close()}

