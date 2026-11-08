import {runIndependentSaveTool,releaseIndependentSaveTool} from './save-tool-client.js';
export {releaseIndependentSaveTool as releaseSaveTools};
let cached;
async function fetchResource(input,options){
 const base=new URL('./',document.baseURI).href;
 const absolute=typeof input==='string'?new URL(input,document.baseURI).href:input;
 const resource=typeof absolute==='string'&&absolute.startsWith(base)?'./'+absolute.slice(base.length):absolute;
 const label=typeof resource==='string'?resource.split('/').at(-1).split('?')[0]:'资源';
 let response;
 try{response=await fetch(resource,options)}catch(error){throw Error('资源请求失败：'+label+'（'+(error.message||error)+'；可能是网络或宿主安全策略拦截）')}
 if(!response.ok)throw Error('资源读取失败：'+label+'（HTTP '+response.status+'）');
 return response;
}
export async function loadSaveBundle(){
 return cached ||= (async()=>{
  const response=await fetchResource('./save-bundle.json');
  const bundle=await response.json(),files={};
  for(const name of ['users.dat','user1.dat64','game1_58.dat64']){
   if(typeof bundle[name]!=='string')throw Error('预置存档包缺少 '+name);
   files[name]=Uint8Array.from(atob(bundle[name]),c=>c.charCodeAt(0));
  }
  if(new TextDecoder().decode(files['user1.dat64'].slice(0,8))!=='PVZUSR64'||new TextDecoder().decode(files['game1_58.dat64'].slice(0,8))!=='PVZDAT64')throw Error('预置存档包内容无效');
  return files;
 })().catch(error=>{cached=null;throw error});
}
// The host only supplies files. All processing is owned by the independent
// wasm32 tool worker; no game Module, hidden game or audio decoder is used.
export async function runSaveTool(request,input,profile){
 if(request?.op==='generate'&&!profile)profile=(await loadSaveBundle())['user1.dat64'];
 return runIndependentSaveTool(request,input,profile);
}
export function downloadSave(bytes,name='game1_58.dat64'){
 const url=URL.createObjectURL(new Blob([bytes],{type:'application/octet-stream'}));
 const link=document.createElement('a');link.href=url;link.download=name;link.click();setTimeout(()=>URL.revokeObjectURL(url),60000);
}
