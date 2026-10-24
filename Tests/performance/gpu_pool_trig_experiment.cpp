// Isolated GPU correctness experiment, not a production renderer or timing test.
// Link OpenGLApi.cpp + OpenGLContext.cpp; see docs/validation.md.
#include "graphics/opengl/OpenGLApi.h"
#include "graphics/opengl/OpenGLContext.h"
#include "GameConstants.h"
#include <algorithm>
#include <array>
#include <cmath>
#include <cstdint>
#include <cstdio>
#include <cstring>
#include <stdexcept>
#include <string>
#include <vector>

namespace {
namespace GL = Sexy::GL3;
constexpr unsigned Period = 158400;
constexpr int CellPixels = 8, Width = 15 * CellPixels, Height = 3 * 5 * CellPixels;
constexpr GLenum FeedbackBuffer = 0x8C8E, InterleavedAttribs = 0x8C8C;
constexpr double Tolerance = 0.0002; // normalized UV, not a speed criterion
struct Vertex { GLint x, y, layer; float xPhase, yPhase; };
struct Value { float u, v, dx, dy; };
struct Times { float t1, t2, t3, t5; };

void Require(bool ok, const char* message)
{
    if (!ok) throw std::runtime_error(message);
}
struct Window {
    HWND hwnd{};
    Window()
    {
        WNDCLASSW cls{};
        cls.style = CS_OWNDC;
        cls.lpfnWndProc = DefWindowProcW;
        cls.hInstance = GetModuleHandleW(nullptr);
        cls.lpszClassName = L"PvzGpuPoolTrigExperiment";
        Require(RegisterClassW(&cls) != 0, "RegisterClassW");
        // No WS_VISIBLE and no ShowWindow: this window remains hidden.
        hwnd = CreateWindowExW(0, cls.lpszClassName, L"Pool GPU experiment",
            WS_POPUP, 0, 0, Width, Height, nullptr, nullptr, cls.hInstance, nullptr);
        Require(hwnd != nullptr, "CreateWindowExW");
    }
    ~Window()
    {
        if (hwnd) DestroyWindow(hwnd);
        UnregisterClassW(L"PvzGpuPoolTrigExperiment", GetModuleHandleW(nullptr));
    }
};
template<class T> T LoadExtra(const char* name)
{
    auto proc = reinterpret_cast<T>(GL::GetProcAddress(name));
    Require(proc != nullptr, name);
    return proc;
}
// All five are desktop GL <= 3.0; load only in this experiment, not production.
using FeedbackVaryings = void (APIENTRY*)(GLuint, GLsizei, const GLchar* const*, GLenum);
using BindBase = void (APIENTRY*)(GLenum, GLuint, GLuint);
using BeginFeedback = void (APIENTRY*)(GLenum);
using EndFeedback = void (APIENTRY*)();
using GetBuffer = void (APIENTRY*)(GLenum, GLintptr, GLsizeiptr, void*);

const char* VertexSource = R"GLSL(#version 130
in ivec3 grid;
in vec2 phase;
uniform vec4 waveTime;
out vec4 result;
void main()
{
    float x = float(grid.x), y = float(grid.y);
    float t1=waveTime.x, t2=waveTime.y, t3=waveTime.z, t5=waveTime.w;
    vec2 base = vec2(x/15.0, y/5.0);
    vec2 delta = vec2(0.0);
    if (grid.x!=0 && grid.x!=15 && grid.y!=0 && grid.y!=5) {
        if (grid.z==0) {
            delta.x=sin(phase.y+t2)*0.002+sin(phase.y+t1)*0.005;
            delta.y=sin(phase.x+t5)*0.01+sin(phase.x+t3)*0.015+sin(phase.x+t1)*0.005;
        } else if (grid.z==1) {
            delta.x=sin(phase.y*0.2+t2)*0.015+sin(phase.y*0.2+t1)*0.012;
            delta.y=sin(phase.x*0.2+t5)*0.005+sin(phase.x*0.2+t3)*0.015+
                sin(phase.x*0.2+t1)*0.02;
        } else {
            delta.x=sin(phase.y+t1*1.5)*0.004+sin(phase.y+t2*1.5)*0.005;
            delta.y=sin(phase.x*4.0+t5*2.5)*0.005+sin(phase.x*2.0+t3*2.5)*0.04+
                sin(phase.x*3.0+t1*2.5)*0.02;
        }
    }
    // Production layer 2 preloads base into aOffsetArray, then adds base again.
    result=vec4(grid.z==2 ? (base+delta)+base : delta+base, delta);
    gl_Position=vec4(x/15.0*2.0-1.0,
        (y+float(grid.z)*5.0)/15.0*2.0-1.0, 0.0, 1.0);
}
)GLSL";
const char* FragmentSource = R"GLSL(#version 130
in vec4 result;
out vec4 outputValue;
void main() { outputValue=result; }
)GLSL";

GLuint Shader(GLenum type, const char* source)
{
    const GLuint shader = GL::glCreateShader(type);
    GL::glShaderSource(shader, 1, &source, nullptr);
    GL::glCompileShader(shader);
    GLint ok = 0;
    GL::glGetShaderiv(shader, GL_COMPILE_STATUS, &ok);
    if (!ok) {
        std::array<char,8192> log{};
        GL::glGetShaderInfoLog(shader, GLsizei(log.size()), nullptr, log.data());
        GL::glDeleteShader(shader);
        throw std::runtime_error(std::string("shader compile: ") + log.data());
    }
    return shader;
}
Times CpuTimes(std::uint32_t tick)
{
    // Match PoolEffectDraw's mixed float/double operations before GPU upload.
    const float phase = static_cast<float>(static_cast<float>(tick % Period) * 2 * PI);
    return {float(phase / 800.0), float(phase / 150.0),
        float(phase / 900.0), float(phase / 110.0)};
}
Value CpuValue(const Vertex& p, Times t)
{
    const float xPhase = p.xPhase, yPhase = p.yPhase;
    float dx = 0, dy = 0;
    if (p.x != 0 && p.x != 15 && p.y != 0 && p.y != 5) {
        if (p.layer == 0) {
            dx = std::sin(yPhase+t.t2)*0.002f + std::sin(yPhase+t.t1)*0.005f;
            dy = std::sin(xPhase+t.t5)*0.01f + std::sin(xPhase+t.t3)*0.015f +
                std::sin(xPhase+t.t1)*0.005f;
        } else if (p.layer == 1) {
            dx = std::sin(yPhase*0.2f+t.t2)*0.015f + std::sin(yPhase*0.2f+t.t1)*0.012f;
            dy = std::sin(xPhase*0.2f+t.t5)*0.005f + std::sin(xPhase*0.2f+t.t3)*0.015f +
                std::sin(xPhase*0.2f+t.t1)*0.02f;
        } else {
            dx = std::sin(yPhase+t.t1*1.5f)*0.004f + std::sin(yPhase+t.t2*1.5f)*0.005f;
            dy = std::sin(xPhase*4.0f+t.t5*2.5f)*0.005f +
                std::sin(xPhase*2.0f+t.t3*2.5f)*0.04f +
                std::sin(xPhase*3.0f+t.t1*2.5f)*0.02f;
        }
    }
    const float u = p.x / 15.0f, v = p.y / 5.0f;
    // Keep the production layer-2 order: (base + wave) + base.
    return p.layer == 2 ? Value{(u+dx)+u, (v+dy)+v, dx, dy} :
        Value{dx+u, dy+v, dx, dy};
}
std::size_t At(int layer, int x, int y) { return std::size_t(layer*96+x*6+y); }
std::array<double,4> Components(Value v) { return {v.u, v.v, v.dx, v.dy}; }
struct Errors {
    double uv = 0, offset = 0, sumSquares = 0;
    std::uint64_t components = 0;
    unsigned worstTick = 0;
    void Add(const std::array<double,4>& expected, Value actual, unsigned tick)
    {
        const auto got = Components(actual);
        for (int i = 0; i < 4; ++i) {
            Require(std::isfinite(got[i]), "nonfinite GPU output");
            const double error = std::abs(expected[i] - got[i]);
            if (i < 2 && error > uv) { uv = error; worstTick = tick; }
            if (i >= 2) offset = std::max(offset, error);
            sumSquares += error*error;
            ++components;
        }
    }
    void Print(const char* name) const
    {
        std::printf("%s: max UV abs %.9g, max offset abs %.9g, RMS/all components %.9g, worst tick %u\n",
            name, uv, offset, std::sqrt(sumSquares/components), worstTick);
    }
};
}

#ifndef PVZ_POOL_TRIG_SHARED_ONLY
int main()
try {
    Window window;
    Sexy::OpenGLContext context(window.hwnd, true);
    std::printf("adapter: %s\nGLSL: %s\n", context.adapterDescription.c_str(),
        reinterpret_cast<const char*>(glGetString(GL_SHADING_LANGUAGE_VERSION)));
    const auto varyings = LoadExtra<FeedbackVaryings>("glTransformFeedbackVaryings");
    const auto bindBase = LoadExtra<BindBase>("glBindBufferBase");
    const auto begin = LoadExtra<BeginFeedback>("glBeginTransformFeedback");
    const auto end = LoadExtra<EndFeedback>("glEndTransformFeedback");
    const auto getBuffer = LoadExtra<GetBuffer>("glGetBufferSubData");
    const GLuint vs = Shader(GL_VERTEX_SHADER, VertexSource);
    const GLuint fs = Shader(GL_FRAGMENT_SHADER, FragmentSource);
    const GLuint program = GL::glCreateProgram();
    GL::glAttachShader(program, vs);
    GL::glAttachShader(program, fs);
    GL::glBindAttribLocation(program, 0, "grid");
    GL::glBindAttribLocation(program, 1, "phase");
    GL::glBindFragDataLocation(program, 0, "outputValue");
    const char* varying = "result";
    varyings(program, 1, &varying, InterleavedAttribs);
    GL::glLinkProgram(program);
    GLint ok = 0;
    GL::glGetProgramiv(program, GL_LINK_STATUS, &ok);
    if (!ok) {
        std::array<char,8192> log{};
        GL::glGetProgramInfoLog(program, GLsizei(log.size()), nullptr, log.data());
        throw std::runtime_error(std::string("program link: ") + log.data());
    }
    GL::glDeleteShader(vs);
    GL::glDeleteShader(fs);
    GL::glUseProgram(program);
    const GLint timeLocation = GL::glGetUniformLocation(program, "waveTime");
    Require(timeLocation >= 0, "waveTime uniform");
    std::vector<Vertex> vertices;
    std::vector<unsigned> indices;
    for (int layer = 0; layer < 3; ++layer) {
        for (int x = 0; x <= 15; ++x) for (int y = 0; y <= 5; ++y)
            vertices.push_back({x,y,layer,
                float(x*3.0f*2*PI/15.0f), float(y*3.0f*2*PI/5.0f)});
        constexpr int ox[]{0,0,1,0,1,1}, oy[]{0,1,1,0,1,0};
        for (int x = 0; x < 15; ++x) for (int y = 0; y < 5; ++y)
            for (int k = 0; k < 6; ++k)
                indices.push_back(unsigned(At(layer,x+ox[k],y+oy[k])));
    }
    GLuint vao{}, buffers[3]{}, texture{}, fbo{};
    GL::glGenVertexArrays(1, &vao);
    GL::glBindVertexArray(vao);
    GL::glGenBuffers(3, buffers);
    GL::glBindBuffer(GL_ARRAY_BUFFER, buffers[0]);
    GL::glBufferData(GL_ARRAY_BUFFER, vertices.size()*sizeof(Vertex), vertices.data(), GL_STATIC_DRAW);
    GL::glEnableVertexAttribArray(0);
    GL::glVertexAttribIPointer(0, 3, GL_INT, sizeof(Vertex), nullptr);
    GL::glEnableVertexAttribArray(1);
    GL::glVertexAttribPointer(1, 2, GL_FLOAT, GL_FALSE, sizeof(Vertex),
        reinterpret_cast<const void*>(offsetof(Vertex,xPhase)));
    GL::glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, buffers[1]);
    GL::glBufferData(GL_ELEMENT_ARRAY_BUFFER, indices.size()*sizeof(unsigned), indices.data(), GL_STATIC_DRAW);
    GL::glBindBuffer(FeedbackBuffer, buffers[2]);
    GL::glBufferData(FeedbackBuffer, indices.size()*sizeof(Value), nullptr, GL_STREAM_DRAW);
    bindBase(FeedbackBuffer, 0, buffers[2]);
    glGenTextures(1, &texture);
    glBindTexture(GL_TEXTURE_2D, texture);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA32F, Width, Height, 0, GL_RGBA, GL_FLOAT, nullptr);
    GL::glGenFramebuffers(1, &fbo);
    GL::glBindFramebuffer(GL_FRAMEBUFFER, fbo);
    GL::glFramebufferTexture2D(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, texture, 0);
    Require(GL::glCheckFramebufferStatus(GL_FRAMEBUFFER) == GL_FRAMEBUFFER_COMPLETE, "float FBO incomplete");
    glDrawBuffer(GL_COLOR_ATTACHMENT0);
    glReadBuffer(GL_COLOR_ATTACHMENT0);
    glViewport(0,0,Width,Height);
    glDisable(GL_BLEND);
    glDisable(GL_DEPTH_TEST);
    glDisable(GL_CULL_FACE);
    glDisable(GL_DITHER);
    GL::glClampColor(GL_CLAMP_READ_COLOR, GL_FALSE);
    std::vector<unsigned> ticks{0,1,109,110,149,150,799,800,899,900,79199,79200,
        158398,158399,158400,158401,316799,316800,0xfffffffeu,0xffffffffu};
    std::uint32_t seed = 0x60191981;
    for (int i = 0; i < 256; ++i) {
        seed ^= seed << 13; seed ^= seed >> 17; seed ^= seed << 5;
        ticks.push_back(seed);
    }
    Errors vertexErrors, pixelErrors;
    std::vector<Value> captured(indices.size()), pixels(Width*Height), reference(vertices.size()), first;
    std::uint64_t boundaryChecks = 0;
    for (const auto tick : ticks) {
        const auto t = CpuTimes(tick);
        for (std::size_t i = 0; i < vertices.size(); ++i) reference[i] = CpuValue(vertices[i],t);
        GL::glUniform4f(timeLocation,t.t1,t.t2,t.t3,t.t5);
        glClearColor(-99,-99,-99,-99);
        glClear(GL_COLOR_BUFFER_BIT);
        begin(GL_TRIANGLES);
        glDrawElements(GL_TRIANGLES,GLsizei(indices.size()),GL_UNSIGNED_INT,nullptr);
        end();
        GL::glBindBuffer(FeedbackBuffer,buffers[2]);
        getBuffer(FeedbackBuffer,0,captured.size()*sizeof(Value),captured.data());
        glReadPixels(0,0,Width,Height,GL_RGBA,GL_FLOAT,pixels.data());
        GL::CheckError("pool transform feedback + RGBA32F raster readback");
        if (tick == 0) first = captured;
        if (tick == Period || tick == 2*Period)
            Require(first.size() == captured.size() &&
                std::memcmp(first.data(),captured.data(),captured.size()*sizeof(Value)) == 0,
                "period boundary did not repeat bit-for-bit");
        for (std::size_t i = 0; i < captured.size(); ++i) {
            const auto& p = vertices[indices[i]];
            vertexErrors.Add(Components(reference[indices[i]]),captured[i],tick);
            if (p.x==0 || p.x==15 || p.y==0 || p.y==5) {
                Require(captured[i].dx==0 && captured[i].dy==0, "edge wave offset changed");
                ++boundaryChecks;
            }
        }
        for (int py = 0; py < Height; ++py) for (int px = 0; px < Width; ++px) {
            const int layer=py/(5*CellPixels), localY=py%(5*CellPixels);
            const int x=px/CellPixels, y=localY/CellPixels;
            const double fx=(px%CellPixels+0.5)/CellPixels, fy=(localY%CellPixels+0.5)/CellPixels;
            const auto a=Components(reference[At(layer,x,y)]);
            const auto b=Components(reference[At(layer,x+(fx>fy),y+(fy>=fx))]);
            const auto c=Components(reference[At(layer,x+1,y+1)]);
            std::array<double,4> interpolated{};
            const double wa=1-std::max(fx,fy), wb=std::abs(fx-fy), wc=std::min(fx,fy);
            for (int k=0; k<4; ++k) interpolated[k]=a[k]*wa+b[k]*wb+c[k]*wc;
            pixelErrors.Add(interpolated,pixels[std::size_t(py)*Width+px],tick);
        }
    }
    vertexErrors.Print("transform feedback");
    pixelErrors.Print("RGBA32F triangle interpolation");
    std::printf("cases %zu, unique grid vertices %zu, triangles %zu, feedback values/case %zu, pixels/case %zu\n",
        ticks.size(),vertices.size(),indices.size()/3,indices.size(),pixels.size());
    std::printf("exact zero-offset edge checks %llu; ticks 0/158400/316800 repeat bit-for-bit\n",
        static_cast<unsigned long long>(boundaryChecks));
    Require(vertexErrors.uv <= Tolerance && vertexErrors.offset <= Tolerance &&
        pixelErrors.uv <= Tolerance && pixelErrors.offset <= Tolerance, "UV tolerance exceeded");
    GL::glBindFramebuffer(GL_FRAMEBUFFER,0);
    GL::glDeleteFramebuffers(1,&fbo);
    glDeleteTextures(1,&texture);
    GL::glDeleteBuffers(3,buffers);
    GL::glDeleteVertexArrays(1,&vao);
    GL::glDeleteProgram(program);
    std::puts("PASS: GPU vertex sin executed and both readback paths agree with the CPU reference.");
    return 0;
} catch (const std::exception& error) {
    std::fprintf(stderr,"FAIL: %s\n",error.what());
    return 1;
}
#endif
