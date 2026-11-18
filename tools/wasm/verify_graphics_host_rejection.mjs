import assert from 'node:assert/strict';
import fs from 'node:fs';
import path from 'node:path';
const {chromium}=await import(process.env.PVZ_PLAYWRIGHT_MODULE);
const base=process.env.PVZ_GRAPHICS_SOURCE_URL||'http://127.0.0.1:18091/tools/wasm/game/';
const output=path.resolve(process.env.PVZ_GRAPHICS_EVIDENCE||'out/verification/web-host-context-rejection');
fs.mkdirSync(output,{recursive:true});
const browser=await chromium.launch({headless:true,executablePath:'C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe'});
const results=[];
try{
 for(const rejected of [false,true]){
  const context=await browser.newContext({userAgent:'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 bilibili/1.19.0 Chrome/108.0.5359.215 Electron/22.3.27 Safari/537.36'});
  const page=await context.newPage();const errors=[];page.on('pageerror',error=>errors.push(error.message));
  await page.route(base+'host-probe-test.html',route=>route.fulfill({contentType:'text/html',body:'<!doctype html><meta charset="utf-8"><pre id="result"></pre>'}));
  await page.goto(base+'host-probe-test.html');
  const report=await page.evaluate(async({rejected,base})=>{
   let requests=0,allocations=0,listenersRemoved=0;
   const create=HTMLCanvasElement.prototype.getContext,remove=HTMLCanvasElement.prototype.removeEventListener;
   HTMLCanvasElement.prototype.removeEventListener=function(name,...args){if(name==='webglcontextcreationerror')listenersRemoved++;return remove.call(this,name,...args)};
   HTMLCanvasElement.prototype.getContext=function(type,...args){
    if(type!=='webgl2')return create.call(this,type,...args);
    requests++;
    if(rejected){this.dispatchEvent(new WebGLContextEvent('webglcontextcreationerror',{statusMessage:'Failed to create a WebGL2 context.'}));return null}
    const gl=create.call(this,type,...args);if(gl){const texture=gl.createTexture.bind(gl);gl.createTexture=()=>{allocations++;return texture()}}return gl;
   };
   const {detectGraphics,capabilityText,graphicsStartupError}=await import(base+'graphics.js');
   // Deliberately unavailable WebGPU matches the supplied embedded-client report.
   const detected=await detectGraphics(undefined),message=detected.backend?'probe succeeded':graphicsStartupError(detected,{fallback:true,userAgent:navigator.userAgent});
   const report={rejected,requests,allocations,listenersRemoved,detected,message,capabilities:capabilityText(detected)};
   document.querySelector('#result').textContent=JSON.stringify(report,null,2);return report;
  },{rejected,base});
  assert.equal(report.requests,1);assert.equal(report.listenersRemoved,1);assert.deepEqual(errors,[]);
  if(rejected){
   assert.equal(report.allocations,0);assert.equal(report.detected.backend,null);
   assert.equal(report.detected.webglFailureStage,'context');
   assert.equal(report.detected.webglContextCreationError,'Failed to create a WebGL2 context.');
   assert.match(report.message,/B 站桌面客户端/);assert.match(report.message,/系统浏览器/);
   assert.match(report.message,/仍会检测实际能力/);
  }else{assert.equal(report.detected.backend,'webgl');assert.ok(report.allocations>0)}
  results.push(report);await page.screenshot({path:path.join(output,rejected?'host-rejected.png':'real-webgl2-pass.png')});await context.close();
 }
 fs.writeFileSync(path.join(output,'results.json'),JSON.stringify(results,null,2));
 console.log('Real WebGL2 and embedded-host rejection: passed (one startup probe, listener cleanup, no allocations after context rejection)');
}finally{await browser.close()}
