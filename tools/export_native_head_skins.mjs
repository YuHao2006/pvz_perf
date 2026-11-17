// Inspect native particle-head skins without altering game motion or runtime tracks.
import fs from 'node:fs';
import path from 'node:path';
import {pathToFileURL} from 'node:url';
const core=await import(pathToFileURL(path.resolve('out/media/replanted-audit/match-round3/runtime/node_modules/@esotericsoftware/spine-core/dist/index.js')));
if(fs.existsSync('assets/source-art/work/live-build-coverage/native-heads/chat-approval.json'))throw Error('Approved batch is immutable; create a new review batch.');
const base='../replanted_assets/textassets/vfx_assets_all_9b7df9192977769564291c8e48484d1c/';
const mappings={ZombieHead:{ZombieBackupDancerHead_disco:'BackupDancer',ZombieBobSledHead:'Bobsled',ZombieDancerHead_disco:'Disco',ZombieDiggerHead:'Digger',ZombieDolphinRiderHead:'DolphinRider',ZombieFootballHead:'Football',ZombieImpHead:'Imp',ZombieLadderHead:'Ladder',zombiepolevaulterhead:'Polevaulter',ZombieYetiHead:'Yeti'},ZombieArm:{ZombieDiggerArm:'Zombie_Digger_Arm',ZombieJackboxArm:'Zombie_Jackbox_Hand'}};
const skins=[];
for(const [texture,mapping] of Object.entries(mappings)){
const atlas=new core.TextureAtlas(fs.readFileSync(base+texture+'.atlas.txt','utf8'));
const data=new core.SkeletonBinary(new core.AtlasAttachmentLoader(atlas)).readSkeletonData(new Uint8Array(fs.readFileSync(base+texture+'.skel.bytes')));
for(const [original,skin] of Object.entries(mapping)){
 const s=new core.Skeleton(data);s.setSkinByName(skin);s.setToSetupPose();s.updateWorldTransform(3);const draw=[];
 for(const slot of s.drawOrder){
  const a=slot.attachment;if(!a||slot.color.a*a.color.a<=0.001||!slot.bone.active)continue;
  const region=a instanceof core.RegionAttachment;
  if(!region&&!(a instanceof core.MeshAttachment))throw Error('Unsupported attachment: '+a.name);
  const v=new Float32Array(region?8:a.worldVerticesLength);
  if(region)a.computeWorldVertices(slot,v,0,2);else a.computeWorldVertices(slot,0,v.length,v,0,2);
  draw.push({slot:slot.data.name,attachment:a.region.name,vertices:Array.from(v),uvs:Array.from(a.uvs),triangles:region?[0,1,2,2,3,0]:Array.from(a.triangles),alpha:slot.color.a*a.color.a});
 }
 skins.push({original,skin,texture,draw});
}
}
const out='assets/source-art/work/live-build-coverage/native-heads';fs.mkdirSync(out,{recursive:true});
fs.writeFileSync(out+'/poses.json',JSON.stringify({source:base,pose:'native setup pose; original particle trajectories remain unchanged',skins},null,2));
console.log('Exported native particle skins:',skins.length);
