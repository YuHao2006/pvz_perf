import assert from 'node:assert/strict';
const {chromium}=await import(process.env.PVZ_PLAYWRIGHT_MODULE);
const browser=await chromium.launch({headless:true,executablePath:'C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe',args:process.env.PVZ_TEST_BACKEND==='webgpu'?['--enable-unsafe-webgpu','--ignore-gpu-blocklist']:['--use-angle=swiftshader','--enable-unsafe-swiftshader']});
try{
 const page=await browser.newPage({viewport:{width:1440,height:900}}),errors=[];
 page.on('pageerror',error=>errors.push(error.message));
 await page.addInitScript(({model,backend})=>{if(model)localStorage.setItem('pvz_wasm_memory_override',model);if(backend)localStorage.setItem('pvz_graphics_backend',backend)},{model:process.env.PVZ_TEST_MEMORY_MODEL,backend:process.env.PVZ_TEST_BACKEND});
 await page.goto(process.env.PVZ_WEBGPU_URL||'http://127.0.0.1:18093/');
 await page.waitForFunction(()=>!document.getElementById('start').disabled||!document.getElementById('error').hidden,null,{timeout:60000});
 assert.equal(await page.locator('#error').isVisible(),false,await page.locator('#error').textContent());
 if(process.env.PVZ_TEST_BACKEND)assert.equal(await page.evaluate(()=>Module.pvzSelectedBackend),process.env.PVZ_TEST_BACKEND);
 if(process.env.PVZ_TEST_MEMORY_MODEL)assert.equal(await page.evaluate(()=>Module.pvzMemoryModel),process.env.PVZ_TEST_MEMORY_MODEL);
 await page.locator('#advanced-settings>summary').click();
 await page.locator('#aspect').selectOption('4:3');
 const size=await page.evaluate(()=>Module.FS.stat('/main.pak64').size);
 if(process.env.PVZ_TEST_REJECT_PACKAGE){
  await page.evaluate(()=>{Module.FS.lookupPath('/main.pak64').node.contents[0]=0});
  await page.locator('#start').click();
  await page.waitForFunction(()=>!document.getElementById('error').hidden,null,{timeout:30000});
  assert.match(await page.locator('#error').textContent(),/invalid.*resource archive/);
  assert.equal(await page.evaluate(()=>Module.FS.analyzePath('/main.pak64').exists),true,'Rejected package must retain its source');
  assert.equal(await page.evaluate(()=>Module.pvzPackageBytes||0),0);
  console.log(JSON.stringify({passed:true,rejectedPackageRetained:true,packageBytes:size}));
 }else{
 const start=async()=>{
  await page.locator('#start').click();
  await page.waitForFunction(()=>Module._pvz_web_loading_complete?.(),null,{timeout:60000});
  assert.equal(await page.evaluate(()=>Module.FS.analyzePath('/main.pak64').exists),false,'MEMFS must release its full package copy');
  assert.equal(await page.evaluate(()=>Module.pvzPackageBytes),size);
 };
 await start();
 const loadedMemory=await page.evaluate(()=>Module.pvzMemory.buffer.byteLength);
 const growth=await page.evaluate(()=>{
  const before=Module.pvzMemory.buffer.byteLength,requested=before+1048576;
  const ptr=_malloc(Module.pvzMemoryModel==='wasm64'?BigInt(requested):requested);
  if(!ptr)throw Error('Cannot allocate the memory-growth probe');
  _free(ptr);return {before,after:Module.pvzMemory.buffer.byteLength};
 });
 assert.ok(growth.after>growth.before,'Probe must actually grow Wasm memory');
 const click=async(x,y)=>{const box=await page.locator('#canvas').boundingBox();await page.mouse.click(box.x+x/800*box.width,box.y+y/600*box.height)};
 await page.waitForFunction(tick=>Module._pvz_web_updates()>=tick+3,await page.evaluate(()=>Module._pvz_web_updates()),{timeout:10000});
 // The title's own ready flag follows the resource barrier and bar animation.
 for(let attempt=0;attempt<5&&await page.evaluate(()=>Module._pvz_web_scene())===0;attempt++){
  await click(400,550);
  try{await page.waitForFunction(()=>Module._pvz_web_scene()===1,null,{timeout:2000})}catch(error){if(attempt===4)throw error}
 }
 assert.equal(await page.evaluate(()=>Module._pvz_web_scene()),1);
 // Quit on the selector and confirm. The second app must rebuild its index
 // with the source file absent and the original JavaScript heap view detached.
 await page.waitForFunction(tick=>Module._pvz_web_updates()>=tick+150,await page.evaluate(()=>Module._pvz_web_updates()),{timeout:10000});
 await click(740,530);
 await page.waitForFunction(tick=>Module._pvz_web_updates()>=tick+3,await page.evaluate(()=>Module._pvz_web_updates()),{timeout:10000});
 await click(300,395);
 try{await page.waitForFunction(()=>!document.body.classList.contains('playing'),null,{timeout:20000})}catch(error){await page.screenshot({path:'out/verification/pak-single-copy-quit.png'});console.error(await page.evaluate(()=>({scene:Module._pvz_web_scene(),error:document.getElementById('error').textContent})));throw error}
 await start();
 assert.equal(await page.evaluate(()=>Module.FS.streams.filter(s=>s?.path==='/main.pak64').length),0,'No package FD should retain the original file node');
 assert.deepEqual(errors,[]);
 console.log(JSON.stringify({passed:true,packageBytes:size,releasedMemfsBytes:size,loadedMemory,growth,restartedMemory:await page.evaluate(()=>Module.pvzMemory.buffer.byteLength),backend:await page.evaluate(()=>Module.pvzSelectedBackend),model:await page.evaluate(()=>Module.pvzMemoryModel)},null,2));
}
}finally{await browser.close()}
