// Standalone candidate-path benchmark; all measured GPU output stays on GPU.
// Reuse the validated formula/helpers, excluding the correctness executable main.
#define PVZ_POOL_TRIG_SHARED_ONLY
#include "gpu_pool_trig_experiment.cpp"
#include "graphics/GpuTypes.h"
#include "graphics/opengl/OpenGLShaders.h"
#include <wincodec.h>
#include <wrl/client.h>
#include <chrono>
#include <cstdlib>
#include <filesystem>
#include <thread>

namespace {
using Microsoft::WRL::ComPtr;
using Clock = std::chrono::steady_clock;
constexpr int TargetW=800, TargetH=600, Frames=256, Rounds=18, Burst=32, WarmupBlocks=64;
constexpr GLenum TimeElapsed=0x88BF, QueryResult=0x8866, QueryAvailable=0x8867;
using GenQueries = void (APIENTRY*)(GLsizei,GLuint*);
using DeleteQueries = void (APIENTRY*)(GLsizei,const GLuint*);
using BeginQuery = void (APIENTRY*)(GLenum,GLuint);
using EndQuery = void (APIENTRY*)(GLenum);
using QueryInt = void (APIENTRY*)(GLuint,GLenum,GLint*);
using Query64 = void (APIENTRY*)(GLuint,GLenum,unsigned long long*);
using QueryBits = void (APIENTRY*)(GLenum,GLenum,GLint*);
struct Timer {
    GenQueries gen=LoadExtra<GenQueries>("glGenQueries");
    DeleteQueries del=LoadExtra<DeleteQueries>("glDeleteQueries");
    BeginQuery begin=LoadExtra<BeginQuery>("glBeginQuery");
    EndQuery end=LoadExtra<EndQuery>("glEndQuery");
    QueryInt available=LoadExtra<QueryInt>("glGetQueryObjectiv");
    Query64 result=LoadExtra<Query64>("glGetQueryObjectui64v");
    QueryBits bits=LoadExtra<QueryBits>("glGetQueryiv");
    std::array<GLuint,Burst> ids{};
    Timer()
    {
        GLint count=0;
        bits(TimeElapsed,0x8864,&count); // GL_QUERY_COUNTER_BITS
        Require(count>=32,"GPU elapsed-time query has insufficient counter bits");
        gen(Burst,ids.data());
        std::printf("timer_query_counter_bits %d\n",count);
    }
    ~Timer() { del(Burst,ids.data()); }
    void Collect(std::vector<double>& gpu)
    {
        // Flush once per burst. Availability polling and scalar readback occur
        // outside all CPU intervals; no glFinish or per-draw blocking query.
        glFlush();
        const auto deadline=Clock::now()+std::chrono::seconds(10);
        GLint ready=0;
        while (!ready) {
            available(ids.back(),QueryAvailable,&ready);
            Require(Clock::now()<deadline,"GPU query timeout");
            if (!ready) std::this_thread::yield();
        }
        for (const auto id:ids) {
            unsigned long long ns=0;
            result(id,QueryResult,&ns);
            gpu.push_back(double(ns)/1000.0);
        }
    }
};
struct Image {
    UINT w{},h{};
    std::vector<unsigned char> rgba;
};
Image LoadImage(IWICImagingFactory* factory,const std::filesystem::path& path)
{
    ComPtr<IWICBitmapDecoder> decoder;
    Require(SUCCEEDED(factory->CreateDecoderFromFilename(path.c_str(),nullptr,
        GENERIC_READ,WICDecodeMetadataCacheOnLoad,&decoder)),"WIC decode");
    ComPtr<IWICBitmapFrameDecode> frame;
    Require(SUCCEEDED(decoder->GetFrame(0,&frame)),"WIC frame");
    Image image;
    Require(SUCCEEDED(frame->GetSize(&image.w,&image.h)),"WIC dimensions");
    ComPtr<IWICFormatConverter> convert;
    Require(SUCCEEDED(factory->CreateFormatConverter(&convert)),"WIC converter");
    Require(SUCCEEDED(convert->Initialize(frame.Get(),GUID_WICPixelFormat32bppRGBA,
        WICBitmapDitherTypeNone,nullptr,0,WICBitmapPaletteTypeCustom)),"WIC RGBA");
    image.rgba.resize(std::size_t(image.w)*image.h*4);
    Require(SUCCEEDED(convert->CopyPixels(nullptr,image.w*4,UINT(image.rgba.size()),
        image.rgba.data())),"WIC pixels");
    return image;
}
GLuint Texture(const Image& image)
{
    GLuint texture{};
    glGenTextures(1,&texture);
    glBindTexture(GL_TEXTURE_2D,texture);
    glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_NEAREST);
    glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_NEAREST);
    glTexImage2D(GL_TEXTURE_2D,0,GL_RGBA8,GLsizei(image.w),GLsizei(image.h),0,
        GL_RGBA,GL_UNSIGNED_BYTE,image.rgba.data());
    return texture;
}
GLuint Program(std::string_view vertex)
{
    const auto fragment=GL::SceneFragmentShader();
    const std::string vsText(vertex),fsText(fragment);
    const GLuint vs=Shader(GL_VERTEX_SHADER,vsText.c_str()),fs=Shader(GL_FRAGMENT_SHADER,fsText.c_str());
    const GLuint program=GL::glCreateProgram();
    GL::glAttachShader(program,vs); GL::glAttachShader(program,fs);
    const char* names[]{"inPosition","inColor","inUV","inSlot","inSampler","phase"};
    for (GLuint i=0;i<6;++i) GL::glBindAttribLocation(program,i,names[i]);
    GL::glBindFragDataLocation(program,0,"outColor");
    GL::glLinkProgram(program);
    GLint linked=0;
    GL::glGetProgramiv(program,GL_LINK_STATUS,&linked);
    if (!linked) {
        std::array<char,8192> log{};
        GL::glGetProgramInfoLog(program,GLsizei(log.size()),nullptr,log.data());
        throw std::runtime_error(std::string("program link: ")+log.data());
    }
    GL::glDeleteShader(vs); GL::glDeleteShader(fs);
    return program;
}
std::string GpuVertexSource()
{
    // Share the exact shader formula with the float/feedback correctness test.
    const std::string validated(VertexSource);
    const auto from=validated.find("    float x ="),to=validated.find("    gl_Position=");
    Require(from!=std::string::npos && to>from,"shared GPU wave source");
    return std::string(R"GLSL(#version 130
in vec2 inPosition; in vec4 inColor; in vec2 inUV;
in uint inSlot; in uint inSampler; in vec2 phase;
uniform vec4 waveTime; uniform vec2 targetExtent;
out vec4 color; out vec2 uv; flat out uint slot; flat out uint samplerIndex;
void main() {
    ivec3 grid=ivec3(ivec2(inUV),int(inSlot & 3u));
    vec4 result;
)GLSL")+validated.substr(from,to-from)+R"GLSL(
    uv=result.xy; color=inColor; slot=inSlot; samplerIndex=inSampler;
    gl_Position=vec4(inPosition/targetExtent*2.0-1.0,0.0,1.0);
}
)GLSL";
}
struct StaticVertex { Sexy::GpuVertex draw; float xPhase,yPhase; };
static_assert(sizeof(StaticVertex)==48);
struct Pipeline {
    GLuint program{},vao{},vbo{},ebo{};
    GLint extent{},image{},premultiplied{},coverage{},wave{};
    bool indexed=false,cpu=false;
};
struct Benchmark {
    std::vector<Vertex> grid;
    std::vector<StaticVertex> unique,triangles;
    std::vector<unsigned> indices;
    std::vector<Sexy::GpuVertex> dynamic;
    std::array<Value,288> values{};
    Pipeline paths[3]{};
    GLuint textures[3]{},target{},fbo{};
    Benchmark(IWICImagingFactory* factory)
    {
        const auto root=std::filesystem::current_path()/"assets/runtime/images";
        const auto pool=LoadImage(factory,root/"pool.jpg");
        const char* names[]{"pool_base.jpg","pool_shading.jpg","pool_caustic_effect.jpg"};
        for (int i=0;i<3;++i) {
            const auto image=LoadImage(factory,root/names[i]);
            textures[i]=Texture(image);
            std::printf("texture %s %ux%u\n",names[i],image.w,image.h);
        }
        std::printf("pool_geometry %ux%u, render_target %dx%d RGBA8\n",pool.w,pool.h,TargetW,TargetH);
        for (int layer=0;layer<3;++layer)
            for (int x=0;x<=15;++x) for (int y=0;y<=5;++y) {
                const Vertex v{x,y,layer,float(x*3.0f*2*PI/15.0f),float(y*3.0f*2*PI/5.0f)};
                grid.push_back(v);
                const float px=layer==2 ? (704.0f/15)*x+45 : (pool.w/15.0f)*x+35;
                const float py=layer==2 ? 30.0f*y+288 : (pool.h/5.0f)*y+279;
                float alpha=1;
                if (layer==2) alpha=(x==0 || x==15 || y==0) ? 32.0f/255 :
                    x<=7 ? 192.0f/255 : 128.0f/255;
                unique.push_back({{px,py,1,1,1,alpha,float(x),float(y),
                    0x04000000u|unsigned(layer),layer==2 ? 3u : 1u},v.xPhase,v.yPhase});
            }
        constexpr int ox[]{0,0,1,0,1,1},oy[]{0,1,1,0,1,0};
        for (int layer=0;layer<3;++layer) for (int x=0;x<15;++x) for (int y=0;y<5;++y)
            for (int k=0;k<6;++k) {
                const auto index=unsigned(At(layer,x+ox[k],y+oy[k]));
                indices.push_back(index); triangles.push_back(unique[index]);
            }
        dynamic.resize(triangles.size());
        for (int path=0;path<3;++path) {
            auto& p=paths[path]; p.cpu=path==0; p.indexed=path==2;
            p.program=Program(p.cpu ? std::string(GL::SceneVertexShader()) : GpuVertexSource());
            GL::glUseProgram(p.program);
            p.extent=GL::glGetUniformLocation(p.program,"targetExtent");
            p.image=GL::glGetUniformLocation(p.program,"image");
            p.premultiplied=GL::glGetUniformLocation(p.program,"premultipliedOutput");
            p.coverage=GL::glGetUniformLocation(p.program,"coverageInput");
            p.wave=GL::glGetUniformLocation(p.program,"waveTime");
            GL::glGenVertexArrays(1,&p.vao); GL::glBindVertexArray(p.vao);
            GL::glGenBuffers(1,&p.vbo); GL::glBindBuffer(GL_ARRAY_BUFFER,p.vbo);
            const auto& source=p.indexed ? unique : triangles;
            GL::glBufferData(GL_ARRAY_BUFFER,source.size()*sizeof(StaticVertex),
                source.data(),GL_STATIC_DRAW);
            const GLsizei stride=p.cpu ? sizeof(Sexy::GpuVertex) : sizeof(StaticVertex);
            for (GLuint a=0;a<5;++a) GL::glEnableVertexAttribArray(a);
            GL::glVertexAttribPointer(0,2,GL_FLOAT,GL_FALSE,stride,nullptr);
            GL::glVertexAttribPointer(1,4,GL_FLOAT,GL_FALSE,stride,reinterpret_cast<void*>(8));
            GL::glVertexAttribPointer(2,2,GL_FLOAT,GL_FALSE,stride,reinterpret_cast<void*>(24));
            GL::glVertexAttribIPointer(3,1,GL_UNSIGNED_INT,stride,reinterpret_cast<void*>(32));
            GL::glVertexAttribIPointer(4,1,GL_UNSIGNED_INT,stride,reinterpret_cast<void*>(36));
            if (!p.cpu) {
                GL::glEnableVertexAttribArray(5);
                GL::glVertexAttribPointer(5,2,GL_FLOAT,GL_FALSE,stride,reinterpret_cast<void*>(40));
            }
            if (p.indexed) {
                GL::glGenBuffers(1,&p.ebo); GL::glBindBuffer(GL_ELEMENT_ARRAY_BUFFER,p.ebo);
                GL::glBufferData(GL_ELEMENT_ARRAY_BUFFER,indices.size()*sizeof(unsigned),indices.data(),GL_STATIC_DRAW);
            }
        }
        glGenTextures(1,&target); glBindTexture(GL_TEXTURE_2D,target);
        glTexImage2D(GL_TEXTURE_2D,0,GL_RGBA8,TargetW,TargetH,0,GL_RGBA,GL_UNSIGNED_BYTE,nullptr);
        GL::glGenFramebuffers(1,&fbo); GL::glBindFramebuffer(GL_FRAMEBUFFER,fbo);
        GL::glFramebufferTexture2D(GL_FRAMEBUFFER,GL_COLOR_ATTACHMENT0,GL_TEXTURE_2D,target,0);
        Require(GL::glCheckFramebufferStatus(GL_FRAMEBUFFER)==GL_FRAMEBUFFER_COMPLETE,"target FBO");
        glDrawBuffer(GL_COLOR_ATTACHMENT0); glReadBuffer(GL_COLOR_ATTACHMENT0);
        glViewport(0,0,TargetW,TargetH);
        glDisable(GL_DEPTH_TEST); glDisable(GL_CULL_FACE); glDisable(GL_DITHER);
        glDisable(GL_FRAMEBUFFER_SRGB); glEnable(GL_SCISSOR_TEST);
        glScissor(0,0,TargetW,TargetH); glEnable(GL_BLEND);
        GL::glBlendFuncSeparate(GL_SRC_ALPHA,GL_ONE_MINUS_SRC_ALPHA,GL_ONE,GL_ONE_MINUS_SRC_ALPHA);
        GL::glActiveTexture(GL_TEXTURE0);
    }
    Times Prepare(int path,unsigned tick)
    {
        const auto t=CpuTimes(tick);
        if (path==0) {
            // Once per unique grid point, not once per expanded triangle vertex.
            for (std::size_t i=0;i<grid.size();++i) values[i]=CpuValue(grid[i],t);
            for (std::size_t i=0;i<indices.size();++i) {
                dynamic[i]=triangles[i].draw;
                dynamic[i].u=values[indices[i]].u; dynamic[i].v=values[indices[i]].v;
            }
        }
        return t;
    }
    void Draw(int path,Times t)
    {
        const auto& p=paths[path];
        GL::glUseProgram(p.program); GL::glBindVertexArray(p.vao);
        GL::glUniform2f(p.extent,float(TargetW),float(TargetH));
        GL::glUniform1i(p.image,0); GL::glUniform1i(p.premultiplied,0); GL::glUniform1i(p.coverage,0);
        if (p.cpu) {
            GL::glBindBuffer(GL_ARRAY_BUFFER,p.vbo);
            GL::glBufferData(GL_ARRAY_BUFFER,dynamic.size()*sizeof(Sexy::GpuVertex),
                dynamic.data(),GL_STREAM_DRAW);
        } else GL::glUniform4f(p.wave,t.t1,t.t2,t.t3,t.t5);
        glClearColor(0.05f,0.1f,0.15f,1); glClear(GL_COLOR_BUFFER_BIT);
        for (int layer=0;layer<3;++layer) {
            glBindTexture(GL_TEXTURE_2D,textures[layer]);
            if (p.indexed) glDrawElements(GL_TRIANGLES,450,GL_UNSIGNED_INT,
                reinterpret_cast<void*>(std::uintptr_t(layer*450*sizeof(unsigned))));
            else glDrawArrays(GL_TRIANGLES,layer*450,450);
        }
    }
    void Correctness()
    {
        std::vector<unsigned char> base(TargetW*TargetH*4),got(base.size());
        unsigned maxError=0; double sumError=0; std::uint64_t count=0;
        for (const unsigned tick:{0u,158399u,158400u,1771218101u}) {
            Draw(0,Prepare(0,tick));
            glReadPixels(0,0,TargetW,TargetH,GL_RGBA,GL_UNSIGNED_BYTE,base.data());
            for (int path=1;path<3;++path) {
                Draw(path,Prepare(path,tick));
                glReadPixels(0,0,TargetW,TargetH,GL_RGBA,GL_UNSIGNED_BYTE,got.data());
                for (std::size_t i=0;i<got.size();++i) {
                    const auto d=unsigned(std::abs(int(base[i])-int(got[i])));
                    maxError=std::max(maxError,d); sumError+=d; ++count;
                }
            }
        }
        std::printf("PRE-TIMING image validation max_byte_error %u mean_abs_byte_error %.9g\n",
            maxError,sumError/count);
        Require(maxError<=16,"textured image validation exceeded tolerance");
        GL::CheckError("pre-timing correctness");
    }
    ~Benchmark()
    {
        for (auto& p:paths) {
            GL::glDeleteProgram(p.program); GL::glDeleteBuffers(1,&p.vbo);
            if (p.ebo) GL::glDeleteBuffers(1,&p.ebo);
            GL::glDeleteVertexArrays(1,&p.vao);
        }
        GL::glDeleteFramebuffers(1,&fbo); glDeleteTextures(1,&target); glDeleteTextures(3,textures);
    }
};
struct Samples { std::vector<double> prepare,submit,total,gpu; };
double Percentile(std::vector<double> values,double p)
{
    std::sort(values.begin(),values.end());
    return values[std::size_t((values.size()-1)*p)];
}
void PrintDistribution(const char* component,const std::vector<double>& values)
{
    std::printf(" %s_us_p10=%.4f p50=%.4f p90=%.4f p99=%.4f",component,
        Percentile(values,.1),Percentile(values,.5),Percentile(values,.9),Percentile(values,.99));
}
double Microseconds(Clock::time_point a,Clock::time_point b)
{
    return std::chrono::duration<double,std::micro>(b-a).count();
}
}

#ifndef PVZ_POOL_BENCH_SHARED_ONLY
int main(int argc,char** argv)
try {
    const unsigned cpu=argc>1 ? unsigned(std::strtoul(argv[1],nullptr,10)) : 0;
    const unsigned order=argc>2 ? unsigned(std::strtoul(argv[2],nullptr,10))%3 : 0;
    Require(cpu<sizeof(DWORD_PTR)*8,"CPU index");
    DWORD_PTR allowed=0,system=0;
    Require(GetProcessAffinityMask(GetCurrentProcess(),&allowed,&system)!=0,"process affinity");
    const auto mask=DWORD_PTR(1)<<cpu;
    Require((allowed&mask)!=0 && SetThreadAffinityMask(GetCurrentThread(),mask)!=0,"thread affinity");
    Window window;
    Sexy::OpenGLContext context(window.hwnd,true);
    if (argc>3 && std::strcmp(argv[3],"--adapter-only")==0) {
        std::printf("adapter %s\n",context.adapterDescription.c_str());
        return 0;
    }
    const bool timerAvailable=context.majorVersion>3 ||
        (context.majorVersion==3 && context.minorVersion>=3) || GL::HasExtension("GL_ARB_timer_query");
    Require(timerAvailable,"performance mode requires GL 3.3 or GL_ARB_timer_query; production target remains GL3.0");
    std::printf("adapter %s\nMSVC %d affinity 0x%llx order %u, normal_single_pool, frames_per_round %d rounds %d burst %d\n",
        context.adapterDescription.c_str(),_MSC_FULL_VER,
        static_cast<unsigned long long>(mask),order,Frames,Rounds,Burst);
    Require(SUCCEEDED(CoInitializeEx(nullptr,COINIT_MULTITHREADED)),"COM initialize");
    ComPtr<IWICImagingFactory> factory;
    Require(SUCCEEDED(CoCreateInstance(CLSID_WICImagingFactory,nullptr,CLSCTX_INPROC_SERVER,
        IID_PPV_ARGS(&factory))),"WIC factory");
    {
        Benchmark benchmark(factory.Get());
        benchmark.Correctness(); // Only here do any output pixels cross to CPU.
        Timer timer;
        std::vector<double> warmupGpu;
        for (int path=0;path<3;++path) for (int block=0;block<WarmupBlocks;++block) {
            for (int frame=0;frame<Burst;++frame) {
                const auto t=benchmark.Prepare(path,unsigned(block*Burst+frame));
                timer.begin(TimeElapsed,timer.ids[frame]);
                benchmark.Draw(path,t);
                timer.end(TimeElapsed);
            }
            timer.Collect(warmupGpu);
        }
        Samples samples[3];
        unsigned seed=0x60191981;
        std::array<unsigned,Frames> ticks{};
        for (int round=0;round<Rounds;++round) {
            for (auto& tick:ticks) {
                seed^=seed<<13; seed^=seed>>17; seed^=seed<<5; tick=seed;
            }
            // Forward/reverse round order with balanced rotations.
            for (int position=0;position<3;++position) {
                const int path=int((order+round+(round&1 ? 2-position : position))%3);
                auto& s=samples[path];
                const std::size_t first=s.total.size();
                for (int block=0;block<Frames/Burst;++block) {
                    for (int frame=0;frame<Burst;++frame) {
                        const auto start=Clock::now();
                        const auto t=benchmark.Prepare(path,ticks[block*Burst+frame]);
                        const auto prepared=Clock::now();
                        timer.begin(TimeElapsed,timer.ids[frame]);
                        benchmark.Draw(path,t);
                        timer.end(TimeElapsed);
                        const auto submitted=Clock::now();
                        s.prepare.push_back(Microseconds(start,prepared));
                        s.submit.push_back(Microseconds(prepared,submitted));
                        s.total.push_back(Microseconds(start,submitted));
                    }
                    timer.Collect(s.gpu); // Outside measured CPU intervals.
                }
                const std::vector<double> roundTotal(s.total.begin()+first,s.total.end());
                const std::vector<double> roundGpu(s.gpu.begin()+first,s.gpu.end());
                std::printf("round %d path %c cpu_total_p50_us %.4f gpu_p50_us %.4f\n",
                    round,'A'+path,Percentile(roundTotal,.5),Percentile(roundGpu,.5));
            }
        }
        GL::CheckError("performance samples complete");
        std::puts("SUMMARY (CPU wall preparation/driver submission; GPU interval includes buffer upload/clear/3 draws; query collection excluded)");
        for (int path=0;path<3;++path) {
            const auto& s=samples[path];
            std::printf("path %c samples %zu",'A'+path,s.total.size());
            PrintDistribution("cpu_prepare",s.prepare); PrintDistribution("cpu_submit",s.submit);
            PrintDistribution("cpu_total",s.total); PrintDistribution("gpu",s.gpu);
            std::putchar('\n');
        }
        std::puts("PASS: measured GPU path VS->production fragment texture sampling->RGBA8 FBO; no timed UV/pixel readback, no swap, no glFinish.");
    }
    factory.Reset(); CoUninitialize();
    return 0;
} catch (const std::exception& error) {
    std::fprintf(stderr,"FAIL: %s\n",error.what());
    return 1;
}
#endif
