#include "HarmonyAudio.h"
#include "sound/LegacyAuDecode.h"
#include <ohaudio/native_audiostreambuilder.h>
#include <ohaudio/native_audiorenderer.h>
#include <libopenmpt/libopenmpt_ext.h>
#define DR_WAV_IMPLEMENTATION
#include "dr_wav.h"
#include <array>
#include <map>
#include <mutex>
#include <vector>
#include <algorithm>
#include <cmath>
#include <cstring>
#include <stdexcept>
#include <string_view>
namespace {
constexpr int rate=48000;
struct Sample { std::vector<float> data; int channels=0, hz=0; };
struct Channel { int sound=-1;double pos=0,gain=1,pitch=0;int pan=0;bool playing=false,loop=false; };
struct Voice {
 openmpt_module_ext* ext=nullptr;openmpt_module* mod=nullptr;
 openmpt_module_ext_interface_interactive controls{};
 Sample pcm; double pos=0,gain=1,amplify=1;int state=0;unsigned flags=0;
 ~Voice(){if(ext)openmpt_module_ext_destroy(ext);}
};
std::mutex mutex;
std::array<Sample,256> samples;
std::array<Channel,32> channels;
std::map<unsigned,Voice> voices;
unsigned nextId=1;
double master=1,musicMaster=1;
OH_AudioRenderer* renderer=nullptr;
void mixSample(const Sample& s,double& pos,float* out,int frames,double stride,double left,double right,bool loop,bool& active) {
 const size_t length=s.channels?s.data.size()/s.channels:0;
 for(int i=0;i<frames;++i) {
  if(!length || pos>=length){if(!loop||!length){active=false;break;}pos=std::fmod(pos,double(length));}
  size_t base=size_t(pos)*s.channels;
  out[2*i]+=float(s.data[base]*left);out[2*i+1]+=float(s.data[base+s.channels-1]*right);pos+=stride;
 }
}
int32_t render(OH_AudioRenderer*,void*,void* buffer,int32_t size){
 auto out=static_cast<float*>(buffer);std::fill_n(out,size/4,0.f);
 std::lock_guard lock(mutex);
 for(auto& c:channels)if(c.playing && c.sound>=0) {
  const auto& s=samples[c.sound];double pan=std::clamp(c.pan/10000.,-1.,1.);
  mixSample(s,c.pos,out,size/8,s.hz/double(rate)*std::exp2(c.pitch/12.),master*c.gain*(1-std::max(0.,pan)),master*c.gain*(1+std::min(0.,pan)),c.loop,c.playing);
 }
 for(auto& [id,v]:voices)if(v.state==1){
  double gain=v.gain*v.amplify*musicMaster;
  if(v.mod){
   std::array<float,1024> temp;
   for(int n=0;n<size/8;){
    int count=std::min(512,size/8-n);
    auto got=openmpt_module_read_interleaved_float_stereo(v.mod,rate,count,temp.data());
    for(size_t i=0;i<got*2;++i)out[2*n+i]+=float(temp[i]*gain);
    if(got<size_t(count)){v.state=0;break;}n+=count;
   }
  }else{bool playing=true;mixSample(v.pcm,v.pos,out,size/8,v.pcm.hz/double(rate),gain,gain,v.flags&4,playing);if(!playing)v.state=0;}
 }
 for(int i=0;i<size/4;++i)out[i]=std::clamp(out[i],-1.f,1.f);
 return 0;
}
}
void startOutput(){
 OH_AudioStreamBuilder* b=nullptr;
 if(OH_AudioStreamBuilder_Create(&b,AUDIOSTREAM_TYPE_RENDERER)!=AUDIOSTREAM_SUCCESS)throw std::runtime_error("OHAudio builder creation failed");
 OH_AudioRenderer_Callbacks cb{};cb.OH_AudioRenderer_OnWriteData=render;
 OH_AudioStreamBuilder_SetSamplingRate(b,rate);OH_AudioStreamBuilder_SetChannelCount(b,2);
 OH_AudioStreamBuilder_SetSampleFormat(b,AUDIOSTREAM_SAMPLE_F32LE);
 OH_AudioStreamBuilder_SetRendererCallback(b,cb,nullptr);
 auto result=OH_AudioStreamBuilder_GenerateRenderer(b,&renderer);OH_AudioStreamBuilder_Destroy(b);
 if(result!=AUDIOSTREAM_SUCCESS||OH_AudioRenderer_Start(renderer)!=AUDIOSTREAM_SUCCESS){stopOutput();throw std::runtime_error("Cannot start HarmonyOS audio renderer");}
}
void stopOutput(){if(renderer){OH_AudioRenderer_Stop(renderer);OH_AudioRenderer_Release(renderer);renderer=nullptr;}}
void sfx_pcm(int id,const float* data,int n,int ch,int hz){Sample s{{data,data+n},ch,hz};std::lock_guard lock(mutex);samples.at(id)=std::move(s);}
void sfx_load(int id,const unsigned char* data,int size){
 std::vector<unsigned char> wave;
 if(size>=4 && std::memcmp(data,".snd",4)==0){wave=Sexy::DecodeLegacyAuToWave({data,size_t(size)});data=wave.data();size=int(wave.size());}
 unsigned ch,hz;drwav_uint64 frames;auto pcm=drwav_open_memory_and_read_pcm_frames_f32(data,size,&ch,&hz,&frames,nullptr);
 if(!pcm)throw std::runtime_error("Cannot decode game sound");sfx_pcm(id,pcm,int(frames*ch),ch,hz);drwav_free(pcm,nullptr);
}
void sfx_release(int id){std::lock_guard lock(mutex);samples.at(id)={};}
int sfx_play(int id,int i,bool loop,double gain,double pitch,int pan){std::lock_guard lock(mutex);channels.at(i)={id,0,gain,pitch,pan,true,loop};return 1;}
void sfx_stop(int i){std::lock_guard lock(mutex);channels.at(i).playing=false;}
bool sfx_playing(int i){std::lock_guard lock(mutex);return channels.at(i).playing;}
void sfx_volume(double v){std::lock_guard lock(mutex);master=v;}
int sfx_pause(int i){std::lock_guard lock(mutex);channels.at(i).playing=false;return int(channels.at(i).pos);}
void sfx_resume(int i,int offset,bool loop){std::lock_guard lock(mutex);auto& c=channels.at(i);c.pos=offset;c.loop=loop;c.playing=true;}
void sfx_parameters(int i,double gain,double pitch,int pan){if(i<0)return;std::lock_guard lock(mutex);auto& c=channels.at(i);c.gain=gain;c.pitch=pitch;c.pan=pan;}
unsigned loadTracker(const void* data,unsigned size,bool){
 auto ext=openmpt_module_ext_create_from_memory(data,size,nullptr,nullptr,nullptr,nullptr,nullptr,nullptr,nullptr);
 if(!ext)return 0;
 std::lock_guard lock(mutex);auto id=nextId++;auto& v=voices[id];v.ext=ext;v.mod=openmpt_module_ext_get_module(ext);
 openmpt_module_ext_get_interface(ext,LIBOPENMPT_EXT_C_INTERFACE_INTERACTIVE,&v.controls,sizeof(v.controls));return id;
}
unsigned beginPcm(int ch,int hz,int frames){Sample s{{},ch,hz};s.data.resize(size_t(ch)*frames);std::lock_guard lock(mutex);auto id=nextId++;voices[id].pcm=std::move(s);return id;}
int writePcm(unsigned id,int ch,int off,const float* in,int count){
 std::lock_guard lock(mutex);auto& s=voices.at(id).pcm;for(int i=0;i<count;++i)s.data[(i+off)*s.channels+ch]=in[i];return 1;
}
void setMusicMaster(double v){std::lock_guard lock(mutex);musicMaster=v;}
double musicCommand(unsigned id,const char* name,double value,int extra){
 std::lock_guard lock(mutex);auto it=voices.find(id);if(it==voices.end())return 0;auto& v=it->second;std::string_view op=name;
 if(op=="free"){voices.erase(it);return 1;}
 if(op=="play"||op=="resume"){if(op=="play"&&value){v.pos=0;if(v.mod)openmpt_module_set_position_order_row(v.mod,0,0);}v.state=1;}
 else if(op=="stop")v.state=0;else if(op=="pause")v.state=3;else if(op=="state")return v.state;
 else if(op=="gain")v.gain=value;else if(op=="amplify")v.amplify=value;
 else if(op=="flags"){v.flags=(v.flags&~extra)|(unsigned(value)&extra);if(v.mod)openmpt_module_set_repeat_count(v.mod,(v.flags&4)?-1:0);return v.flags;}
 else if(op=="seek"){auto pos=uint32_t(value);if(v.mod)return openmpt_module_set_position_order_row(v.mod,pos&65535,pos>>16)>=0;v.pos=pos/(2*std::max(1,v.pcm.channels));}
 else if(op=="position")return v.mod?(openmpt_module_get_current_order(v.mod)|(openmpt_module_get_current_row(v.mod)<<16)):v.pos*2*v.pcm.channels;
 else if(op=="tempoGet"&&v.mod)return openmpt_module_get_current_tempo(v.mod);
 else if(op=="speedGet"&&v.mod)return openmpt_module_get_current_speed(v.mod);
 else if(op=="tempo"&&v.controls.set_current_tempo)v.controls.set_current_tempo(v.ext,int(value));
 else if(op=="speed"&&v.controls.set_current_speed)v.controls.set_current_speed(v.ext,int(value));
 else if(op=="channel"&&v.controls.set_channel_mute_status)v.controls.set_channel_mute_status(v.ext,extra,value==0);
 return 1;
}
