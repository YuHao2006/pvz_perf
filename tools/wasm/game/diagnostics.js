// Opt-in, bounded breadcrumbs. Browser lifecycle events describe the host's
// reported state, not whether the user physically switched away or an OS kill.
export function createDiagnostics({storage,readState,environment,defaultEnabled=false,now=()=>Date.now(),
 schedule=fn=>setInterval(fn,10000),cancel=id=>clearInterval(id)}){
 const key='pvz_diagnostics_v1',flag='pvz_diagnostics_enabled_v1',gameKey='pvz_diagnostics_last_game_v1';
 const read=k=>{try{return storage.getItem(k)}catch{return null}};
 const parse=k=>{try{return JSON.parse(read(k)||'null')}catch{return null}};
 const preference=read(flag);
 let enabled=preference===null?defaultEnabled:preference==='true',timer=null,current=null,storageError='',active=false;
 const previous=parse(key);
 let lastGame=parse(gameKey);
 // Only rotate this extra snapshot on a new page, never on every frame/sample.
 // A later settings-only reload must not erase the last actual game session.
 if(previous&&(previous.gameStarted||previous.events?.some(e=>e.type==='game-start'||e.state?.running))){
  lastGame=previous;
  if(enabled)try{storage.setItem(gameKey,JSON.stringify(lastGame))}catch(error){storageError=String(error.message||error)}
 }
 const persist=()=>{try{storage.setItem(key,JSON.stringify(current));storageError=''}catch(error){storageError=String(error.message||error)}};
 const stop=()=>{if(timer!==null)cancel(timer);timer=null};
 function record(type,detail=''){
  if(!enabled)return;
  if(!current)current={format:1,startedAt:new Date(now()).toISOString(),normalQuit:false,environment:environment(),events:[]};
  let state;try{state=readState()}catch(error){state={readError:String(error.message||error)}}
  current.events.push({at:new Date(now()).toISOString(),type,detail:String(detail).slice(0,3000),state});
  if(current.events.length>90)current.events.splice(0,current.events.length-90);
  persist();return state;
 }
 const arm=()=>{if(enabled&&active&&timer===null)timer=schedule(()=>record('sample'))};
 function lifecycle(type,detail=''){
  record(type,detail);
  // Do not cancel sampling because the host reports hidden: a still-visible
  // embedded WebView can report misleading lifecycle state. The browser itself
  // suspends/throttles this ordinary 10s timer; we do not request a wake lock,
  // poll, or schedule a keepalive. Only Quit/disable ends our sampler.
  // WebViews can resume without a BFCache restore. Visibility/focus is also
  // an opportunity to recover sampling after a host overlay or pagehide.
  if(['pageshow','resume','visibilitychange','focus'].includes(type))arm();
 }
 return {
  get enabled(){return enabled},
  setEnabled(value){enabled=!!value;try{storage.setItem(flag,String(enabled))}catch{}if(!enabled)stop();else record('enabled')},
  record,lifecycle,
  start(){if(!enabled)return;stop();record('game-start');current.gameStarted=true;current.normalQuit=false;active=true;persist();arm()},
  quit(){active=false;stop();if(!enabled)return;record('game-quit');current.normalQuit=true;persist()},
  pagehide(detail=''){lifecycle('pagehide',detail)},
  report(){
   let state,env;
   try{state=readState()}catch(error){state={readError:String(error.message||error)}}
   try{env=environment()}catch(error){env={readError:String(error.message||error)}}
   return {notice:'诊断记录不包含存档或账号。Wasm 字节数不是进程总内存；页面隐藏事件不等于用户切走，异常中止标记不能单独证明崩溃原因。',enabled,environment:env,state,storageError,previous,lastGame,current};
  }
 };
}
