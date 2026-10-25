#include "OpenGLRendererInternal.h"
#include <cstdio>
#include <stdexcept>
#include <string>

#if defined(PVZ_OPENGL_REANIM_COMPUTE_EXPERIMENT)
namespace Sexy {
using namespace GL3;
namespace {
constexpr GLenum StorageBuffer=0x90D2,CopyRead=0x8F36,CopyWrite=0x8F37;
constexpr const char* ComputeExpansion=R"GLSL(
layout(local_size_x=64)in;
layout(std430,binding=0)readonly buffer Inputs{uint inputWords[];};
layout(std430,binding=1)writeonly buffer Vertices{uint vertexWords[];};
layout(std430,binding=2)writeonly buffer Elements{uint elementWords[];};
layout(std430,binding=3)readonly buffer Jobs{uvec2 jobs[];};
uniform uint jobCount,firstOutputVertex;
void storeVertex(uint index,vec4 p,vec4 tint,uvec2 metadata){
 p.xy=vec2(dot(trackOverlayX.xy,p.xy)+trackOverlayX.z,dot(trackOverlayY.xy,p.xy)+trackOverlayY.z);
 uint at=index*10u;
 vertexWords[at]=floatBitsToUint(p.x);vertexWords[at+1u]=floatBitsToUint(p.y);
 vertexWords[at+2u]=floatBitsToUint(tint.r);vertexWords[at+3u]=floatBitsToUint(tint.g);
 vertexWords[at+4u]=floatBitsToUint(tint.b);vertexWords[at+5u]=floatBitsToUint(tint.a);
 vertexWords[at+6u]=floatBitsToUint(p.z);vertexWords[at+7u]=floatBitsToUint(p.w);
 vertexWords[at+8u]=metadata.x;vertexWords[at+9u]=metadata.y;
}
bool insideClip(vec4 p,int edge,float boundary){
 float value=edge%2==0?p.x:p.y;return edge<2?value>=boundary:value<boundary;
}
void main(){
 uint job=gl_GlobalInvocationID.x;if(job>=jobCount)return;
 uvec2 location=jobs[job];uint inputAt=location.x*10u;
 uvec4 marker=uvec4(inputWords[inputAt],inputWords[inputAt+1u],
  inputWords[inputAt+2u],inputWords[inputAt+3u]);
 vec2 shake=vec2(uintBitsToFloat(inputWords[inputAt+4u]),uintBitsToFloat(inputWords[inputAt+5u]));
 evaluateTrack(marker,shake);
 uint base=firstOutputVertex+job*8u,first=location.y;
 // Every padding triangle is degenerate, including invisible/opaque jobs.
 // The first vertex is initialized even when clipping removes the polygon.
 storeVertex(base,vec4(0),vec4(0),uvec2(0));
 for(uint i=0u;i<18u;++i)elementWords[first+i]=base;
 if(trackInfo.w==0u)return;
 if(trackInfo.z==1u){
  storeVertex(base,point0,trackColor,trackInfo.xy);
  storeVertex(base+1u,point1,trackColor,trackInfo.xy);
  storeVertex(base+2u,point2,trackColor,trackInfo.xy);
  storeVertex(base+3u,point3,trackColor,trackInfo.xy);
  elementWords[first]=base;elementWords[first+1u]=base+1u;elementWords[first+2u]=base+3u;
  elementWords[first+3u]=base+1u;elementWords[first+4u]=base+3u;elementWords[first+5u]=base+2u;
  return;
 }
 vec4 polygon[8];polygon[0]=point0;polygon[1]=point1;polygon[2]=point2;polygon[3]=point3;
 int count=4;
 for(int edge=0;edge<4;++edge){
  if(count<2)return;
  vec4 clipped[8];int written=0;
  for(int i=0;i<count;++i){
   vec4 p=polygon[(i+count-1)%count],q=polygon[i];
   bool pin=insideClip(p,edge,trackClip[edge]),qin=insideClip(q,edge,trackClip[edge]);
   if(pin!=qin){
    float av=edge%2==0?p.x:p.y,bv=edge%2==0?q.x:q.y;
    float t=(trackClip[edge]-av)/(bv-av);clipped[written++]=p+(q-p)*t;
   }
   if(qin)clipped[written++]=q;
  }
  count=written;for(int i=0;i<count;++i)polygon[i]=clipped[i];
 }
 if(count<3)return;
 for(int i=0;i<count;++i)storeVertex(base+uint(i),polygon[i],trackColor,trackInfo.xy);
 uint at=first;
 for(int i=1;i+1<count;++i){
  elementWords[at++]=base;elementWords[at++]=base+uint(i);elementWords[at++]=base+uint(i+1);
 }
}
)GLSL";
}
void OpenGLRenderer::Impl::DestroyReanimCompute()
{
    if(reanimComputeProgram)glDeleteProgram(reanimComputeProgram);
    if(reanimComputeVao)glDeleteVertexArrays(1,&reanimComputeVao);
    if(reanimComputeOutput)glDeleteBuffers(1,&reanimComputeOutput);
    if(reanimComputeJobBuffer)glDeleteBuffers(1,&reanimComputeJobBuffer);
    reanimComputeProgram=reanimComputeVao=reanimComputeOutput=reanimComputeJobBuffer=0;
}
void OpenGLRenderer::Impl::InitReanimCompute()
{
    if(context.majorVersion<4||(context.majorVersion==4&&context.minorVersion<3))return;
    using Integer64=void(APIENTRY*)(GLenum,long long*);
    using IntegerIndexed=void(APIENTRY*)(GLenum,GLuint,GLint*);
    const auto integer64=reinterpret_cast<Integer64>(GL3::GetProcAddress("glGetInteger64v"));
    const auto integerIndexed=reinterpret_cast<IntegerIndexed>(GL3::GetProcAddress("glGetIntegeri_v"));
    bindComputeBuffer=reinterpret_cast<BindBufferBaseFn>(GL3::GetProcAddress("glBindBufferBase"));
    dispatchCompute=reinterpret_cast<DispatchComputeFn>(GL3::GetProcAddress("glDispatchCompute"));
    computeBarrier=reinterpret_cast<MemoryBarrierFn>(GL3::GetProcAddress("glMemoryBarrier"));
    if(!integer64||!integerIndexed||!bindComputeBuffer||!dispatchCompute||!computeBarrier)return;
    long long maximumBytes=0;GLint maximumGroups=0;
    integer64(0x90DE,&maximumBytes);integerIndexed(0x91BE,0,&maximumGroups);
    if(maximumBytes<=0||maximumGroups<=0)return;
    reanimComputeMaximumBytes=size_t(maximumBytes);reanimComputeMaximumGroups=unsigned(maximumGroups);
    unsigned int shader=0;
    try{
        const std::string source=std::string("#version 430\n#define PVZ_REANIM_COMPUTE_SHADER 1\n"
            "#define PVZ_REANIM_SHADER_CLIP 1\n")+
            OpenGLReanimEvaluationShader+ComputeExpansion;
        const char* text=source.data();const int length=int(source.size());
        shader=glCreateShader(0x91B9);glShaderSource(shader,1,&text,&length);glCompileShader(shader);
        int ok=0;glGetShaderiv(shader,GL_COMPILE_STATUS,&ok);
        if(!ok){
            std::string log(8192,'\0');int used=0;glGetShaderInfoLog(shader,int(log.size()),&used,log.data());
            log.resize(used);throw std::runtime_error("OpenGL compute experiment shader: "+log);
        }
        reanimComputeProgram=glCreateProgram();glAttachShader(reanimComputeProgram,shader);
        glLinkProgram(reanimComputeProgram);glGetProgramiv(reanimComputeProgram,GL_LINK_STATUS,&ok);
        if(!ok){
            std::string log(8192,'\0');int used=0;glGetProgramInfoLog(reanimComputeProgram,int(log.size()),&used,log.data());
            log.resize(used);throw std::runtime_error("OpenGL compute experiment link: "+log);
        }
        constexpr const char* names[]{"jobCount","firstOutputVertex","residentData","instances"};
        for(unsigned i=0;i<std::size(names);++i)reanimComputeUniforms[i]=glGetUniformLocation(reanimComputeProgram,names[i]);
        glGenBuffers(1,&reanimComputeOutput);glGenBuffers(1,&reanimComputeJobBuffer);
        glGenVertexArrays(1,&reanimComputeVao);glBindVertexArray(reanimComputeVao);
        glBindBuffer(GL_ARRAY_BUFFER,reanimComputeOutput);
        glEnableVertexAttribArray(0);glVertexAttribPointer(0,2,GL_FLOAT,GL_FALSE,sizeof(GpuVertex),nullptr);
        glEnableVertexAttribArray(1);glVertexAttribPointer(1,4,GL_FLOAT,GL_FALSE,sizeof(GpuVertex),reinterpret_cast<void*>(8));
        glEnableVertexAttribArray(2);glVertexAttribPointer(2,2,GL_FLOAT,GL_FALSE,sizeof(GpuVertex),reinterpret_cast<void*>(24));
        glEnableVertexAttribArray(3);glVertexAttribIPointer(3,1,GL_UNSIGNED_INT,sizeof(GpuVertex),reinterpret_cast<void*>(32));
        glEnableVertexAttribArray(4);glVertexAttribIPointer(4,1,GL_UNSIGNED_INT,sizeof(GpuVertex),reinterpret_cast<void*>(36));
        glBindBuffer(GL_ELEMENT_ARRAY_BUFFER,reanimIndexBuffer);
        GL3::CheckError("Initialize optional compute reanimation experiment");
    }catch(const std::exception& error){
        std::fprintf(stderr,"Optional OpenGL compute experiment falls back to GS: %s\n",error.what());
        DestroyReanimCompute();
    }
    if(shader)glDeleteShader(shader);
#if defined(PVZ_OPENGL_REANIM_DIAGNOSTICS)
    if(frameTiming)frameTiming->computeAvailable=reanimComputeProgram!=0;
#endif
}
void OpenGLRenderer::Impl::ExpandReanimCompute()
{
    static_assert(sizeof(Vertex)==40&&sizeof(ReanimComputeJob)==8);
    const auto prefixBytes=vertices.size()*sizeof(Vertex);
    const auto outputBytes=prefixBytes+reanimComputeJobs.size()*8*sizeof(GpuVertex);
    glBindBuffer(StorageBuffer,reanimComputeJobBuffer);
    glBufferData(StorageBuffer,reanimComputeJobs.size()*sizeof(ReanimComputeJob),reanimComputeJobs.data(),GL_STREAM_DRAW);
    glBindBuffer(CopyWrite,reanimComputeOutput);glBufferData(CopyWrite,outputBytes,nullptr,GL_STREAM_DRAW);
    glBindBuffer(CopyRead,stream);
    bindComputeBuffer(StorageBuffer,0,stream);bindComputeBuffer(StorageBuffer,1,reanimComputeOutput);
    bindComputeBuffer(StorageBuffer,2,reanimIndexBuffer);bindComputeBuffer(StorageBuffer,3,reanimComputeJobBuffer);
    glUseProgram(reanimComputeProgram);
    glUniform1ui(reanimComputeUniforms[0],unsigned(reanimComputeJobs.size()));
    glUniform1ui(reanimComputeUniforms[1],unsigned(vertices.size()));
    glUniform1i(reanimComputeUniforms[2],1);glUniform1i(reanimComputeUniforms[3],2);
#if defined(PVZ_OPENGL_REANIM_DIAGNOSTICS)
    if(frameTiming&&frameTiming->computeBeginTimestamp&&queryCounter)
        queryCounter(frameTiming->computeBeginTimestamp,0x8E28);
#endif
    copyBuffer(CopyRead,CopyWrite,0,0,prefixBytes);
    dispatchCompute(unsigned((reanimComputeJobs.size()+63)/64),1,1);
    // Both shader-written stores (output and EBO) are replaced with BufferData
    // before the next Flush updates them. Reusing either store in place would
    // additionally require GL_BUFFER_UPDATE_BARRIER_BIT before that API update.
    computeBarrier(0x00000001|0x00000002); // Vertex attribute + element array visibility.
}
}
#endif
