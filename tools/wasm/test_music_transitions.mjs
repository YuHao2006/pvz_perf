// Replay level changes against the shipped OpenMPT decoder, including a return
// to a previously played order. Each main voice must remain audible on reuse.
import fs from 'node:fs';
import path from 'node:path';
import assert from 'node:assert/strict';
import {createRequire} from 'node:module';
import {pathToFileURL} from 'node:url';
globalThis.require=createRequire(import.meta.url);
globalThis.__dirname=process.cwd();
const distribution=path.resolve(process.argv[2]||'out/wasm-v4.0.2-fixed/toy');
const runtime=pathToFileURL(path.join(distribution,'audio/openmpt-runtime.js')).href;
const source=fs.readFileSync('tools/wasm/game/audio/music-mixer.js','utf8')
 .replace("'./openmpt-runtime.js'",JSON.stringify(runtime));
const {MusicMixer}=await import('data:text/javascript;base64,'+Buffer.from(source).toString('base64'));
const compiled=await WebAssembly.compile(fs.readFileSync(path.join(distribution,'audio/libopenmpt.wasm')));
const mixer=await MusicMixer.create(compiled,48000);
const command=(op,rest={})=>mixer.command({id:1,op,...rest});
const left=new Float32Array(128),right=new Float32Array(128);
function render(seconds){
 let square=0,count=0,peak=0;
 for(let i=0;i<seconds*48000;i+=left.length){
  mixer.render(left,right);
  for(const channel of [left,right])for(const value of channel){square+=value*value;count++;peak=Math.max(peak,Math.abs(value))}
 }
 return {rms:Math.sqrt(square/count),peak,playing:mixer.positions()[0].playing};
}
const tunes={title:[0x98,29],seeds:[0x7a,29],day:[0,23],night:[0x30,29],pool:[0x5e,17],fog:[0x7d,15],roof:[0xb8,17]};
try{
 command('load',{data:fs.readFileSync('assets/runtime/sounds/mainmusic.mo3')});
 for(let round=0;round<3;round++)for(const name of ['title','day','seeds','day','seeds','night','seeds','pool','seeds','fog','seeds','roof']){
  const [order,last]=tunes[name];
  command('stop');
  for(let channel=0;channel<30;channel++)command('channel',{channel,value:channel<=last?1:0});
  command('gain',{value:1});command('loop',{value:true});
  command('seek',{order,row:0,revision:round*100+order});command('play');
  const pcm=render(3);
  console.log(JSON.stringify({round,tune:name,...pcm}));
  assert.ok(pcm.playing&&pcm.peak>.01,`${name} lost its main voice after a level transition`);
 }
 console.log('PASS real Web MO3: title, seed selection and five battle themes survive repeated level transitions');
}finally{mixer.close()}
