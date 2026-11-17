// One adapter per snapshot read. Legacy Toy storage is read-only; only a
// complete, validated snapshot may be copied to the shared storage space.
export function sharedStorage(toy,storageId,uploadState=()=>{}){
 if(!/^st_[a-z0-9]{16}$/.test(storageId)||typeof toy.getSharedStorage!=='function'||typeof toy.setSharedStorage!=='function')throw Error('当前宿主未开放指定的共享存档');
 let legacy=false,headKey,headRaw;const captured={};
 return {
  async getCloudStorage(keys){
   if(keys.length===1&&/^pvz_(progress|lineups)_v1$/.test(keys[0])){
    legacy=false;headKey=keys[0];const rows=await toy.getSharedStorage(storageId,keys);
    if(rows[headKey])return rows;
    legacy=true;
   }
   const rows=legacy?await toy.getCloudStorage(keys):await toy.getSharedStorage(storageId,keys);
   if(legacy){Object.assign(captured,rows);headRaw=captured[headKey]}
   return rows;
  },
  setCloudStorage:values=>toy.setSharedStorage(storageId,values),
  removeCloudStorage:keys=>toy.removeSharedStorage(storageId,keys),
  async finishLegacyRead(){
   if(!legacy||!headRaw)return true;
   // Never overwrite a shared save created by another device while the old
   // snapshot was being downloaded. The caller will read that save instead.
   if((await toy.getSharedStorage(storageId,[headKey]))[headKey])return false;
   const chunks={...captured};delete chunks[headKey];
   uploadState(true);try{
   await toy.setSharedStorage(storageId,chunks);
   if((await toy.getSharedStorage(storageId,[headKey]))[headKey])return false;
   await toy.setSharedStorage(storageId,{[headKey]:headRaw});
   return true;
   }finally{uploadState(false)}
  }
 };
}

export function validModifiedAt(value){return Number.isSafeInteger(value)&&value>0&&value<=Date.now()+300000}
export const nextModifiedAt=previous=>Math.max(Date.now(),validModifiedAt(previous)?previous+1:0);
// Select once: modern browsers keep the native operation without a per-call feature check.
export const hasOwn=Object.hasOwn||Function.prototype.call.bind(Object.prototype.hasOwnProperty);
export const savedTime=saved=>validModifiedAt(saved?.modifiedAt)?saved.modifiedAt:validModifiedAt(saved?.savedAt)?saved.savedAt:0;
// Equal/unknown timestamps use the existing cloud snapshot deterministically;
// the displaced local content is backed up before applying it.
export const preferCloud=(modifiedAt,saved)=>!!saved&&savedTime(saved)>=(validModifiedAt(modifiedAt)?modifiedAt:0);

// Unique chunk names keep overlapping uploads from rewriting each other's
// data before either head is committed. Keep the previous complete snapshot.
export const newSlot=()=>Array.from(crypto.getRandomValues(new Uint8Array(16)),value=>value.toString(16).padStart(2,'0')).join('');
export const validSlot=head=>head.format===1?['a','b'].includes(head.slot):head.format===2&&/^[a-f0-9]{32}$/.test(head.slot);
export function previousSnapshot(head){return head?{slot:head.slot,count:head.count}:undefined}
export async function discardOldSnapshot(toy,prefix,previous){
 if(typeof toy.removeCloudStorage!=='function'||!previous||!/^(?:[ab]|[a-f0-9]{32})$/.test(previous.slot)||!Number.isInteger(previous.count)||previous.count<1||previous.count>60)return;
 await toy.removeCloudStorage(Array.from({length:previous.count},(_,i)=>prefix+previous.slot+'_'+i));
}
