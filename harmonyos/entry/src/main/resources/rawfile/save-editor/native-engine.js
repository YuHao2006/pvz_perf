import {createHarmonyHost} from './harmony-save-host.js';
try {
 const host=await createHarmonyHost();
 window.nativeDat64Preview=async(id,lineup)=>{
  try {
   const value=await host.request('encode-lineup',{recipe:lineup});
   ArkSave.deliver(id,JSON.stringify({value}));
  } catch(error) {
   ArkSave.deliver(id,JSON.stringify({error:error.message||String(error)}));
  }
 };
 let busy=false;
 window.nativeDat64Call=async(id,op,payload)=>{
  if(busy){ArkSave.deliver(id,JSON.stringify({error:'上一项存档操作尚未完成。'}));return}
  busy=true;
  try {
   const value=op==='init'?await host.initial():await host.request(op,JSON.parse(payload));
   ArkSave.deliver(id,JSON.stringify({value}));
  } catch (error) {
   ArkSave.deliver(id,JSON.stringify({error:error.message||String(error)}));
  } finally {busy=false}
 };
 ArkSave.serviceReady('');
} catch (error) {
 ArkSave.serviceReady(error.message||String(error));
}
