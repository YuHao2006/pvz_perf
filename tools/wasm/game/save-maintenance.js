const levelName=/^game[1-9]\d*_(\d+)\.dat64$/;
const originalName=/^(?:game[1-9]\d*_\d+\.dat64|user[1-9]\d*\.dat64|users\.dat)$/;
const exportName=/^(?:game[1-9]\d*_\d+\.dat64|user[1-9]\d*\.dat64|users\.dat)(?:\.before-survival-repair|\.before-text-restore-\d+)?$/;
export function saveAsText(name,bytes){
 if(!exportName.test(name)||!(bytes instanceof Uint8Array)||bytes.length>32*1024*1024)throw Error('存档文件无效或超过 32 MiB');
 let binary='';
 for(let i=0;i<bytes.length;i+=8192)binary+=String.fromCharCode(...bytes.subarray(i,i+8192));
 return JSON.stringify({format:'pvz-save-export-v1',files:[{name,base64:btoa(binary)}]},null,2);
}
export function savesFromText(text){
 if(typeof text!=='string'||text.length>48*1024*1024)throw Error('存档文本超过 48 MiB');
 let data;try{data=JSON.parse(text)}catch{throw Error('存档文本不完整或不是有效 JSON，请粘贴完整内容')}
 if(data?.format!=='pvz-save-export-v1'||!Array.isArray(data.files)||!data.files.length||data.files.length>1000)throw Error('不是受支持的存档文本');
 const files=new Map();let size=0;
 for(const entry of data.files){
  if(typeof entry?.name!=='string'||!exportName.test(entry.name)||typeof entry.base64!=='string')throw Error('存档文本包含无效文件名或内容');
  const name=entry.name.replace(/\.before-(?:survival-repair|text-restore-\d+)$/,'');
  if(files.has(name))throw Error('存档文本包含重复的目标文件：'+name);
  const encoded=entry.base64.replace(/\s/g,'');
  if(!encoded||encoded.length%4||!/^[A-Za-z0-9+/]*={0,2}$/.test(encoded))throw Error('存档编码不完整：'+name);
  let binary;try{binary=atob(encoded)}catch{throw Error('存档编码无效：'+name)}
  if(btoa(binary)!==encoded)throw Error('存档编码校验失败：'+name);
  size+=binary.length;if(size>32*1024*1024)throw Error('恢复的存档总计超过 32 MiB');
  files.set(name,Uint8Array.from(binary,c=>c.charCodeAt(0)));
 }
 return files;
}

// Settings-only operations. The independent wasm32 worker owns format parsing;
// this adapter supplies files and persists a validated replacement while stopped.
export function connectSaveMaintenance({module,root,ready,idle,running,setActive,sync,tools}){
 const $=id=>document.getElementById(id),dialog=$('save-maintenance-dialog'),select=$('maintenance-save');
 const repair=$('maintenance-repair'),text=$('maintenance-text'),status=$('maintenance-status');
 let operation='text',busy=false,importedBinary=null,readGeneration=0;
 const available=()=>module.FS.readdir(root).filter(name=>(operation==='repair'?levelName:exportName).test(name)).sort();
 const read=()=>{const name=select.value;if(!available().includes(name))throw Error('请选择有效存档');return module.FS.readFile(root+'/'+name).slice()};
 function showText(){
  if(operation==='text'&&select.value==='all'){
   const files=available().filter(name=>originalName.test(name)).map(name=>JSON.parse(saveAsText(name,module.FS.readFile(root+'/'+name))).files[0]);
   text.value=JSON.stringify({format:'pvz-save-export-v1',files},null,2);
  }else text.value=operation==='text'&&select.value?saveAsText(select.value,read()):'';
  text.hidden=operation==='repair';text.readOnly=operation!=='restore';
  $('maintenance-export-actions').hidden=operation!=='text';$('maintenance-restore-actions').hidden=operation!=='restore';
  $('maintenance-file-field').hidden=operation==='restore';repair.disabled=!select.value;
  $('maintenance-download-binary').disabled=!select.value||select.value==='all';
 }
 async function open(kind){
  if(!ready()||running()||!idle())return;
  operation=kind;++readGeneration;setActive(true);
  try{
   $('maintenance-title').textContent=kind==='repair'?'无尽换轮卡档修复':kind==='restore'?'恢复存档（DAT64／文本）':'导出存档（DAT64／文本）';
   $('maintenance-description').textContent=kind==='repair'?'仅修复上一轮结束后无法进入选卡的已知状态，保留阵型、阳光、随机数种子和进度。修复前保留原档副本。':kind==='restore'?'选择 DAT64／用户资料文件、之前导出的 TXT，或粘贴完整存档文本。校验通过后覆盖同名存档，其他存档保留。覆盖前保留原档副本。':'可直接保存原始存档文件，也可复制完整文本或分享 TXT，方便下载受限的手机。请勿截断文本。关卡存档不会上传云端。';
   select.replaceChildren(...available().map(name=>new Option(name,name)));
   if(kind==='text'&&select.options.length)select.add(new Option('全部用户资料与关卡（不含修复前副本）','all'));
   if([...select.options].some(option=>option.value==='game1_58.dat64'))select.value='game1_58.dat64';
   status.textContent=kind==='restore'?'':select.value?'':'当前浏览器没有可用存档。';repair.hidden=kind!=='repair';
   $('maintenance-overwrite').checked=false;$('maintenance-restore').disabled=true;$('maintenance-import-file').value='';
   importedBinary=null;$('maintenance-target-name').value='';$('maintenance-target-name').disabled=true;
   showText();dialog.showModal();
  }catch(error){status.textContent=error.message;setActive(false)}
 }
 $('repair-level-save').onclick=()=>open('repair');$('export-save-text').onclick=()=>open('text');
 $('restore-save-text').onclick=()=>open('restore');
 select.onchange=()=>{status.textContent='';showText()};
 repair.onclick=async()=>{
  if(busy||running()||!ready())return;
  busy=true;repair.disabled=true;select.disabled=true;$('maintenance-close').disabled=true;status.textContent='正在检查存档…';
  const name=select.value;let before,backupCreated=false,written=false;
  try{
   before=read();const saveTools=await tools;
   const result=await saveTools.runSaveTool({op:'repair-survival-transition',mode:Number(levelName.exec(name)[1])},before);
   if(!result.bytes){status.textContent='没有发现已知的换轮卡档状态，原档未改动。';return}
   const backup=root+'/'+name+'.before-survival-repair';
   if(!module.FS.analyzePath(backup).exists){module.FS.writeFile(backup,before);backupCreated=true}
   module.FS.writeFile(root+'/'+name,result.bytes);written=true;await sync();
   status.textContent='已修复。继续关卡后会正常进入下一轮选卡。原档副本可在“存档转文本导出”中选择。';
  }catch(error){
   if(written){module.FS.writeFile(root+'/'+name,before);if(backupCreated)module.FS.unlink(root+'/'+name+'.before-survival-repair');try{await sync()}catch{}}
   status.textContent='修复未完成，原档已保留：'+error.message;
  }finally{(await tools).releaseSaveTools();busy=false;repair.disabled=!select.value;select.disabled=false;$('maintenance-close').disabled=false}
 };
 const restoreEnabled=()=>{$('maintenance-restore').disabled=busy||!$('maintenance-overwrite').checked||!text.value.trim()};
 text.oninput=()=>{++readGeneration;importedBinary=null;$('maintenance-target-name').disabled=true;restoreEnabled()};$('maintenance-overwrite').onchange=restoreEnabled;
 const binaryText=()=>{
  if(!importedBinary)return;
  try{const name=$('maintenance-target-name').value.trim();if(!originalName.test(name))throw Error('目标文件名必须是有效的关卡或用户存档文件名');text.value=saveAsText(name,importedBinary);status.textContent=''}catch(error){text.value='';status.textContent=error.message}
  restoreEnabled();
 };
 $('maintenance-target-name').oninput=binaryText;
 $('maintenance-import-file').onchange=async()=>{
  if(busy)return;
  const file=$('maintenance-import-file').files[0];if(!file)return;
  const generation=++readGeneration;text.value='';importedBinary=null;restoreEnabled();
  if(file.size>48*1024*1024){status.textContent='文件超过 48 MiB';return}
  try{
  if(/\.dat64$|^users\.dat$/i.test(file.name)){
   if(file.size>32*1024*1024){status.textContent='存档超过 32 MiB';return}
   const bytes=new Uint8Array(await file.arrayBuffer());if(generation!==readGeneration||!dialog.open)return;
   importedBinary=bytes;$('maintenance-target-name').disabled=false;
   $('maintenance-target-name').value=originalName.test(file.name)?file.name:'game1_58.dat64';binaryText();
  }else{const value=await file.text();if(generation!==readGeneration||!dialog.open)return;importedBinary=null;$('maintenance-target-name').disabled=true;text.value=value;restoreEnabled()}
  }catch(error){if(generation===readGeneration&&dialog.open)status.textContent='无法读取所选文件：'+error.message}
 };
 $('maintenance-restore').onclick=async()=>{
  if(busy||running()||!ready()||!$('maintenance-overwrite').checked)return;
  busy=true;++readGeneration;restoreEnabled();$('maintenance-close').disabled=true;$('maintenance-import-file').disabled=true;$('maintenance-target-name').disabled=true;text.readOnly=true;status.textContent='正在校验存档…';
  const before=new Map();let mutated=false;
  try{
   const files=savesFromText(text.value),saveTools=await tools;
   const {decodeSummary,decodeProfile,validId,modes}=await import('./save-codec.js');
   const get=name=>files.get(name)||(module.FS.analyzePath(root+'/'+name).exists?module.FS.readFile(root+'/'+name):null);
   const summary=get('users.dat'),rows=summary?decodeSummary(summary):[];
   for(const row of rows){const profile=get('user'+row.id+'.dat64');if(!profile)throw Error('缺少用户资料：user'+row.id+'.dat64；请同时恢复用户列表与资料');decodeProfile(profile)}
   for(const [name,bytes]of files){
    if(name==='users.dat')continue;
    const profile=/^user([1-9]\d*)\.dat64$/.exec(name),level=/^game([1-9]\d*)_(\d+)\.dat64$/.exec(name);
    const id=validId(Number((profile||level)[1]));
    if(!rows.some(row=>row.id===id))throw Error('用户 '+id+' 不存在，请先新增用户，或同时恢复 users.dat 和对应用户资料');
    if(profile){decodeProfile(bytes);continue}
    const mode=Number(level[2]);if(!modes[mode]?.checkpoint)throw Error('不支持的关卡存档槽位：'+name);
    await saveTools.runSaveTool({op:'validate',mode},bytes);
    if(new DataView(bytes.buffer,bytes.byteOffset,bytes.byteLength).getUint32(8,true)===4){const result=await saveTools.runSaveTool({op:'dfu',mode},bytes);if(result.bytes)files.set(name,result.bytes)}
   }
   const writes=new Map(files);let suffix=Date.now();
   for(const name of files.keys())if(module.FS.analyzePath(root+'/'+name).exists){
    let backup;do{backup=name+'.before-text-restore-'+suffix++}while(module.FS.analyzePath(root+'/'+backup).exists);
    writes.set(backup,module.FS.readFile(root+'/'+name).slice());
   }
   for(const name of writes.keys())before.set(name,module.FS.analyzePath(root+'/'+name).exists?module.FS.readFile(root+'/'+name).slice():null);
   mutated=true;for(const [name,bytes]of writes)module.FS.writeFile(root+'/'+name,bytes);await sync();
   status.textContent='已恢复 '+files.size+' 个存档。原档副本可在“存档转文本导出”中选择。关卡存档仅保存在本地。';
  }catch(error){
   if(mutated){for(const [name,bytes]of before){if(bytes)module.FS.writeFile(root+'/'+name,bytes);else if(module.FS.analyzePath(root+'/'+name).exists)module.FS.unlink(root+'/'+name)}try{await sync()}catch{}}
   status.textContent='恢复未完成，原档未改动：'+error.message;
  }finally{(await tools).releaseSaveTools();busy=false;restoreEnabled();$('maintenance-close').disabled=false;$('maintenance-import-file').disabled=false;$('maintenance-target-name').disabled=!importedBinary;text.readOnly=false}
 };
 $('maintenance-copy').onclick=async()=>{try{await navigator.clipboard.writeText(text.value);status.textContent='已复制完整存档文本。'}catch{text.focus();text.select();status.textContent='无法自动复制，请长按文本框并全选复制。'}};
 async function offerFile(file){
  if(navigator.canShare?.({files:[file]}))try{await navigator.share({files:[file]});return}catch(error){if(error.name==='AbortError')return}
  const url=URL.createObjectURL(file),link=document.createElement('a');link.href=url;link.download=file.name;document.body.append(link);link.click();link.remove();setTimeout(()=>URL.revokeObjectURL(url),60000);
  status.textContent='已请求保存文件；若宿主拦截下载，请改用复制全文。';
 }
 $('maintenance-download').onclick=()=>{
  if(text.value)return offerFile(new File([text.value],(select.value==='all'?'pvz-saves':select.value)+'.txt',{type:'text/plain'}));
 };
 $('maintenance-download-binary').onclick=()=>{
  if(!select.value||select.value==='all')return;
  const name=select.value.replace(/\.before-(?:survival-repair|text-restore-\d+)$/,'');
  return offerFile(new File([read()],name,{type:'application/octet-stream'}));
 };
 $('maintenance-close').onclick=()=>dialog.close();dialog.addEventListener('cancel',event=>{if(busy)event.preventDefault()});
 dialog.addEventListener('close',()=>{++readGeneration;importedBinary=null;text.value='';$('maintenance-import-file').value='';setActive(false)});
}
