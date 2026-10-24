#include "OpenGLApi.h"
#include "OpenGLContext.h"
#include "OpenGLRenderer.h"
#include "misc/FastMath.h"
#include <algorithm>
#include <array>
#include <chrono>
#include <cmath>
#include <iostream>
#include <numeric>
#include <stdexcept>
#include <vector>
namespace {
using namespace Sexy;
void Require(bool ok,const char* text){if(!ok)throw std::runtime_error(text);}
struct Window {
 HWND hwnd{};
 Window(){
  WNDCLASSW cls{};cls.style=CS_OWNDC;cls.lpfnWndProc=DefWindowProcW;
  cls.hInstance=GetModuleHandleW(nullptr);cls.lpszClassName=L"PvzOpenGLReanimTests";
  Require(RegisterClassW(&cls)!=0,"Register hidden test class");
  hwnd=CreateWindowExW(0,cls.lpszClassName,L"Resident reanimation tests",WS_POPUP,
   0,0,800,600,nullptr,nullptr,cls.hInstance,nullptr);
  Require(hwnd!=nullptr,"Create hidden test window");
 }
 ~Window(){if(hwnd)DestroyWindow(hwnd);UnregisterClassW(L"PvzOpenGLReanimTests",GetModuleHandleW(nullptr));}
};
struct Triangles {
 std::array<GpuVertex,18> vertices{};size_t count=0;
 operator std::span<const GpuVertex>()const{return{vertices.data(),count};}
};
Triangles Reference(const GpuReanimKey&a,const GpuReanimKey&b,const GpuReanimGeometry&base,
 const GpuReanimGeometry&source,const GpuReanimDraw&job,uint32_t slot,const GpuClip*clip){
 const auto lerp=[&](float x,float y){return x+(y-x)*job.fraction;};
 const int alpha=std::clamp(int(lerp(a.alpha,b.alpha)*float(job.color>>24)+.5f),0,255);
 if(a.frame<0||!a.imageSlot||!alpha||source.width<=0||source.height<=0||
  (job.truncate&&a.frame!=-1&&b.frame==-1&&job.fraction>0))return{};
 const float x=-(lerp(a.skewX,b.skewX)*.017453292f),y=-(lerp(a.skewY,b.skewY)*.017453292f);
 const float m00=FastCos(x)*lerp(a.scaleX,b.scaleX),m10=-FastSin(x)*lerp(a.scaleX,b.scaleX);
 const float m01=FastSin(y)*lerp(a.scaleY,b.scaleY),m11=FastCos(y)*lerp(a.scaleY,b.scaleY);
 const float cx=m00*(base.width*.5f)+m01*(base.height*.5f)+lerp(a.transX,b.transX);
 const float cy=m10*(base.width*.5f)+m11*(base.height*.5f)+lerp(a.transY,b.transY);
 const float xx=job.overlay00*m00+job.overlay01*m10,xy=job.overlay00*m01+job.overlay01*m11;
 const float yx=job.overlay10*m00+job.overlay11*m10,yy=job.overlay10*m01+job.overlay11*m11;
 const float ox=(job.overlay00*cx+job.overlay01*cy+job.overlay02)+job.translateX;
 const float oy=(job.overlay10*cx+job.overlay11*cy+job.overlay12)+job.translateY;
 using Point=std::array<float,4>;
 std::array<Point,8> p{{
  {-source.width*.5f,-source.height*.5f,source.u0,source.v0},
  {-source.width*.5f,source.height*.5f,source.u0,source.v1},
  {source.width*.5f,source.height*.5f,source.u1,source.v1},
  {source.width*.5f,-source.height*.5f,source.u1,source.v0}}};
 size_t count=4;
 for(size_t i=0;i<4;++i){const auto lx=p[i][0],ly=p[i][1];p[i][0]=xx*lx+xy*ly+ox;p[i][1]=yx*lx+yy*ly+oy;}
 if(clip){
  const float bounds[]{float(clip->x),float(clip->y),float(int64_t(clip->x)+clip->width),float(int64_t(clip->y)+clip->height)};
  for(int edge=0;edge<4;++edge){
   std::array<Point,8> out{};size_t written=0;
   for(size_t i=0;i<count;++i){
    const auto&a0=p[(i+count-1)%count];const auto&b0=p[i];const int axis=edge%2;
    const bool ai=edge<2?a0[axis]>=bounds[edge]:a0[axis]<bounds[edge];
    const bool bi=edge<2?b0[axis]>=bounds[edge]:b0[axis]<bounds[edge];
    if(ai!=bi){const float f=(bounds[edge]-a0[axis])/(b0[axis]-a0[axis]);Point v{};
     for(int j=0;j<4;++j)v[j]=a0[j]+(b0[j]-a0[j])*f;out[written++]=v;}
    if(bi)out[written++]=b0;
   }
   p=out;count=written;
  }
 }
 Triangles out;
 const auto emit=[&](const Point&v){
  out.vertices[out.count++]={v[0],v[1],float((job.color>>16)&255)/255,float((job.color>>8)&255)/255,
   float(job.color&255)/255,float(alpha)/255,v[2],v[3],slot|job.samplingFlags,job.sampler};
 };
 if(clip){for(size_t i=1;i+1<count;++i){emit(p[0]);emit(p[i]);emit(p[i+1]);}}
 else for(int i:{0,1,3,1,3,2})emit(p[size_t(i)]);
 return out;
}
void Clear(OpenGLRenderer&r){
 const auto s=OpenGLRenderer::SlotOf(r.whiteTexture);const float w=float(r.sceneWidth),h=float(r.sceneHeight);
 const GpuVertex v[]{
  {0,0,0,0,0,1,0,0,s,0},{w,0,0,0,0,1,1,0,s,0},{w,h,0,0,0,1,1,1,s,0},
  {0,0,0,0,0,1,0,0,s,0},{w,h,0,0,0,1,1,1,s,0},{0,h,0,0,0,1,0,1,s,0}};
 r.SubmitTriangles(v,r.whiteTexture,false,false,GpuBlend::Opaque);
}
struct Error {
 unsigned maximum=0;uint64_t sum=0,components=0;
 void Compare(const std::vector<uint32_t>&a,const std::vector<uint32_t>&b){
  Require(a.size()==b.size(),"Pixel count mismatch");
  for(size_t i=0;i<a.size();++i)for(unsigned shift:{0u,8u,16u,24u}){
   const auto d=unsigned(std::abs(int((a[i]>>shift)&255)-int((b[i]>>shift)&255)));
   if(d>3)std::cerr<<"pixel mismatch index="<<i<<" componentShift="<<shift
    <<" expected="<<((a[i]>>shift)&255)<<" actual="<<((b[i]>>shift)&255)<<'\n';
   maximum=std::max(maximum,d);sum+=d;++components;
  }
  Require(maximum<=3,"OpenGL native-trig reanimation pixel maximum exceeds3");
 }
};
void Correct(OpenGLContext&context){
 OpenGLRenderer r(context,64,64,{});
 std::array<GpuReanimKey,2> keys{{
  {5.25f,8.125f,-15,23,1.15f,.9f,.8f,INT32_MAX,1},
  {13.5f,11.25f,37,-18,-.75f,1.1f,.35f,-1,1}}};
 const std::array<GpuReanimTrack,3> tracks{{{0,2},{GpuReanimNoKeys,0},{0,2}}};
 const std::array<GpuReanimGeometry,4> geo{{{},{20,24,0,0,1,1},{},{28,12,1,0,0,1}}};
 auto upload=keys;auto geometry=geo;
 auto*definition=r.UploadReanimDefinition({tracks,upload,geometry,2,2});
 if(context.majorVersion<3||(context.majorVersion==3&&context.minorVersion<2)){
  Require(!definition,"GL3.0 unexpectedly enabled optional geometry backend");
  Require(r.BeginScene(),"CPU fallback scene");Clear(r);r.EndSceneAndPresent();
  std::cout<<"PASS baseline CPU renderer; SKIP optional resident GS on GL<3.2\n";return;
 }
 Require(definition!=nullptr,"GL3.2 resident shader unavailable on capable test context");
 upload={};geometry={};
 const uint32_t texels[]{0xffff0000,0xff00ff00,0xff0000ff,0xffffff00};
 auto*texture=r.CreateTexture(2,2,texels,8);
 const GpuClip clips[]{{10,10,22,25},{-20,-10,110,100},{100,100,4,4}};
 Error error;unsigned cases=0;
 for(unsigned variant:{0u,1u})for(float t:{0.f,.375f,1.f})for(int clipping:{-1,0,1,2})
  for(bool truncate:{false,true})for(unsigned sampling:{0u,1u,2u,3u}){
   GpuReanimDraw job{};job.track=2;job.after=1;job.variant=variant;job.fraction=t;
   job.overlay00=1;job.overlay01=.15f;job.overlay02=8;job.overlay10=-.1f;job.overlay11=1;job.overlay12=5;
   job.translateX=-.5f;job.translateY=1.25f;job.color=0xc0e0d0ff;job.truncate=truncate;job.sampler=sampling;
   const auto*clip=clipping<0?nullptr:&clips[clipping];
   const auto cpu=Reference(keys[0],keys[1],geo[1],geo[variant*2+1],job,OpenGLRenderer::SlotOf(texture),clip);
   Require(r.BeginScene(),"CPU scene");Clear(r);
   for(auto blend:{GpuBlend::Normal,GpuBlend::Additive,GpuBlend::Normal})
    r.SubmitTriangles(cpu,texture,sampling&1,sampling&2,blend);
   r.EndSceneAndPresent();const auto expected=r.ReadScenePixels();
   Require(r.BeginScene(),"GPU scene");Clear(r);auto unsupported=job;unsupported.track=1;
   Require(!r.SubmitReanim(definition,texture,unsupported,false,false,GpuBlend::Normal),"CPU-only track was densified");
   Require(r.SubmitReanim(definition,texture,job,sampling&1,sampling&2,GpuBlend::Normal,clip),"Valid resident job rejected");
   r.SubmitTriangles(cpu,texture,sampling&1,sampling&2,GpuBlend::Additive);
   Require(r.SubmitReanim(definition,texture,job,sampling&1,sampling&2,GpuBlend::Normal,clip),"Later resident job rejected");
   r.EndSceneAndPresent();error.Compare(expected,r.ReadScenePixels());++cases;
  }
 auto secondKeys=keys;secondKeys[0].transX+=4;secondKeys[1].transY-=3;
 auto blank=geo;blank[3]={};
 auto*second=r.UploadReanimDefinition({tracks,secondKeys,blank,2,2});
 const uint32_t otherTexels[]{0xff20c040,0xffe02060,0xff8060f0,0xffe0a020};
 auto*other=r.CreateTexture(2,2,otherTexels,8);std::vector<uint32_t> mixed;
 for(bool gpu:{false,true}){
  Require(r.BeginScene(),"Mixed scene");Clear(r);
  for(unsigned i=0;i<48;++i){
   const bool useSecond=i%3==1;auto*image=useSecond?other:texture;
   GpuReanimDraw job{};job.track=2;job.after=1;job.fraction=float(i%7)/7;job.variant=i%2;
   job.overlay00=i%4==0?-.75f:1;job.overlay11=.8f;job.overlay01=.125f;job.overlay10=-.25f;
   job.overlay02=float(i%5)*3+8;job.overlay12=float(i%3)*4+4;job.translateX=-.5f;job.translateY=.25f;
   job.color=0x9070c0e0;job.samplingFlags=(i%4)*0x10000000u;job.sampler=i%4;
   const auto*clip=i%4==0?nullptr:&clips[i%3];const auto blend=GpuBlend(i%3);
   const auto&k=useSecond?secondKeys:keys;const auto&g=useSecond?blank:geo;
   const auto cpu=Reference(k[0],k[1],g[1],g[job.variant*2+1],job,OpenGLRenderer::SlotOf(image),clip);
   if(gpu)Require(r.SubmitReanim(useSecond?second:definition,image,job,i%2,(i/2)%2,blend,clip),"Mixed job rejected");
   else r.SubmitTriangles(cpu,image,i%2,(i/2)%2,blend);
   if(i%3==2)r.SubmitTriangles(cpu,image,i%2,(i/2)%2,GpuBlend::Normal);
  }
  r.EndSceneAndPresent();const auto actual=r.ReadScenePixels();if(!gpu)mixed=actual;else error.Compare(mixed,actual);
 }
 r.DestroyReanimDefinition(second);r.DestroyTexture(other);
 auto*target=r.CreateRenderImage(64,64);r.SetRenderImage(target);Require(r.BeginScene(),"Image-only scene");
 GpuReanimDraw job{};job.track=0;job.overlay00=job.overlay11=1;job.color=0xffffffff;
 Require(r.SubmitReanim(definition,texture,job,false,false,GpuBlend::Normal,&clips[0]),"Image-only resident rejected");
 r.DestroyReanimDefinition(definition);r.DestroyTexture(texture);
 r.EndSceneAndPresent();r.SetRenderImage(nullptr);r.DestroyTexture(target);
 Require(r.BeginScene(),"Retirement scene");r.EndSceneAndPresent();
 GL3::CheckError("resident correctness");
 const auto mean=double(error.sum)/double(error.components);
 Require(mean<=.001,"Native-trig resident mean pixel error exceeds .001 byte");
 std::cout<<"PASS OpenGL native sin/cos no-precise resident cases="<<cases
  <<" mixed_jobs=48 full_int32_frame logical_CPU_sentinel upload_staging_release lifetime"
  <<" max_RGBA8="<<error.maximum<<" mean_RGBA8="<<mean<<'\n';
 // Exercise the explicit version fallback policy on the same real context.
 const auto major=context.majorVersion,minor=context.minorVersion;context.majorVersion=3;context.minorVersion=0;
 {OpenGLRenderer fallback(context,64,64,{});
  Require(!fallback.UploadReanimDefinition({tracks,keys,geo,2,2}),"GL3.0 policy unexpectedly required geometry shaders");}
 context.majorVersion=major;context.minorVersion=minor;
 std::cout<<"PASS GL3.0 capability policy keeps CPU fallback (version simulation, not old-driver execution)\n";
}
using GenQuery=void(APIENTRY*)(GLsizei,GLuint*);
using BeginQuery=void(APIENTRY*)(GLenum,GLuint);
using EndQuery=void(APIENTRY*)(GLenum);
using Query64=void(APIENTRY*)(GLuint,GLenum,unsigned long long*);
template<class T>T Proc(const char*n){auto p=reinterpret_cast<T>(GL3::GetProcAddress(n));Require(p!=nullptr,n);return p;}
double Median(std::vector<double>v){std::sort(v.begin(),v.end());return v[v.size()/2];}
double Mean(const std::vector<double>&v){return std::accumulate(v.begin(),v.end(),0.)/v.size();}
void Benchmark(OpenGLContext&context,bool mixed){
 OpenGLRenderer r(context,800,600,{});const uint32_t pixels[]{0xffff8020,0xff20ff80,0xff8020ff,0xffe0e020};
 auto*texture=r.CreateTexture(2,2,pixels,8);constexpr int Burst=16;
 std::array<GLuint,Burst>queries{};auto gen=Proc<GenQuery>("glGenQueries");gen(Burst,queries.data());
 auto begin=Proc<BeginQuery>("glBeginQuery");auto end=Proc<EndQuery>("glEndQuery");
 auto get=Proc<Query64>("glGetQueryObjectui64v");
 unsigned gates=0,meanGates=0,total=0;
 std::cout<<"OpenGL actual renderer native-trig GS benchmark mixed="<<mixed
  <<" unlocked clocks; CPU includes interpolation/clip or80Bjob preparation,batching,upload,flush,presentcall;"
  <<" GPU query starts after CPU queues jobs and includes actual upload+draw+presentquad; no vertex/pixel readback\n";
 for(unsigned count:{256u,512u,2048u,8192u}){
  std::vector<GpuReanimTrack>tracks(count);std::vector<GpuReanimKey>keys(count*2);
  std::vector<GpuReanimDraw>jobs(count);const std::array<GpuReanimGeometry,2>geo{{{},{10,12,0,0,1,1}}};
  for(unsigned i=0;i<count;++i){
   tracks[i]={i*2,2};keys[i*2]={.25f,.125f,-15,23,1.15f,.9f,.8f,0,1};
   keys[i*2+1]={1.5f,1.25f,37,-18,.75f,1.1f,.35f,0,1};
   auto&j=jobs[i];j.track=i;j.after=1;j.overlay00=j.overlay11=1;j.translateX=j.translateY=-.5f;
   j.overlay02=float(i%64)*12+4;j.overlay12=float((i/64)%48)*12+4;j.color=0xc0e0d0ff;
  }
  std::vector<OpenGLReanim*>definitions;
  for(unsigned i=0;i<(mixed?4u:1u);++i){auto*d=r.UploadReanimDefinition({tracks,keys,geo,2,1});Require(d!=nullptr,"Benchmark GPU unavailable");definitions.push_back(d);}
  for(bool clipped:{false,true}){
   std::array<std::vector<double>,4>samples;const GpuClip clip{6,6,782,582};
   for(int round=-3;round<12;++round)for(int order=0;order<2;++order){
    const int path=(order+round+4)%2;
    for(int frame=0;frame<Burst;++frame){
     Require(r.BeginScene(),"Benchmark scene");
     const auto start=std::chrono::steady_clock::now();Clear(r);
     for(unsigned i=0;i<count;++i){
      auto&j=jobs[i];j.fraction=float((round+3+frame)%31)/31;
      if(path)Require(r.SubmitReanim(definitions[(i/32)%definitions.size()],texture,j,false,false,GpuBlend::Normal,clipped?&clip:nullptr),"Benchmark resident rejected");
      else r.SubmitTriangles(Reference(keys[i*2],keys[i*2+1],geo[1],geo[1],j,OpenGLRenderer::SlotOf(texture),clipped?&clip:nullptr),
       texture,false,false,GpuBlend::Normal);
      if(mixed&&i%32==31){
       const auto white=OpenGLRenderer::SlotOf(r.whiteTexture);
       const GpuVertex marker[]{{795,595,1,1,1,.1f,0,0,white,0},{797,595,1,1,1,.1f,1,0,white,0},{795,597,1,1,1,.1f,0,1,white,0}};
       r.SubmitTriangles(marker,r.whiteTexture,false,false,GpuBlend::Normal);
      }
     }
     begin(0x88BF,queries[frame]);r.EndSceneAndPresent();
     const double cpu=std::chrono::duration<double,std::micro>(std::chrono::steady_clock::now()-start).count();end(0x88BF);
     if(round>=0)samples[path].push_back(cpu);
    }
    glFinish();for(auto q:queries){unsigned long long ns;get(q,0x8866,&ns);if(round>=0)samples[2+path].push_back(ns*.001);}
   }
   const auto saved=Median(samples[0])-Median(samples[1]),added=Median(samples[3])-Median(samples[2]);
   const bool pass=saved>std::max(0.,added);const bool meanPass=Mean(samples[0])-Mean(samples[1])>std::max(0.,Mean(samples[3])-Mean(samples[2]));
   gates+=pass;meanGates+=meanPass;++total;
   std::cout<<"tracks="<<count<<" clipped="<<clipped<<" mixed="<<mixed
    <<" CPU_us="<<Median(samples[0])<<"->"<<Median(samples[1])
    <<" GPU_us="<<Median(samples[2])<<"->"<<Median(samples[3])
    <<" CPU_saved="<<saved<<" GPU_added="<<added<<" gate="<<(pass?"PASS":"FAIL")
    <<" meanGate="<<(meanPass?"PASS":"FAIL")<<'\n';
  }
  for(auto*d:definitions)r.DestroyReanimDefinition(d);
 }
 r.DestroyTexture(texture);GL3::CheckError("resident benchmark");
 std::cout<<"GATES median="<<gates<<"/"<<total<<" mean="<<meanGates<<"/"<<total<<'\n';
}
}
int main(int argc,char**argv)try{
 Window native;OpenGLContext context(native.hwnd,true);
 std::cout<<"adapter="<<context.adapterDescription<<" GL="<<context.majorVersion<<'.'<<context.minorVersion<<'\n';
 if(argc>1&&std::string(argv[1])=="--benchmark")Benchmark(context,false);
 else if(argc>1&&std::string(argv[1])=="--benchmark-mixed")Benchmark(context,true);
 else Correct(context);
 return 0;
}catch(const std::exception&e){std::cerr<<"FAIL "<<e.what()<<'\n';return 1;}
