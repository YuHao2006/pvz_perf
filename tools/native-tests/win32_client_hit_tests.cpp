#define WIN32_LEAN_AND_MEAN
#define NOMINMAX
#include <windows.h>
#include <windowsx.h>
#include <algorithm>
#include <array>
#include <chrono>
#include <cstdio>
#include <cstring>
#include <stdexcept>

namespace {
[[noreturn]] void WindowFailure(const char* name) {
    throw std::runtime_error(name);
}
#include "SexyAppFramework/platform/windows/NativeClientHitTest.inl"
void Require(bool value,const char* text) {if(!value) throw std::runtime_error(text);}
using Clock=std::chrono::steady_clock;
constexpr DWORD Normal=WS_OVERLAPPED|WS_CAPTION|WS_SYSMENU|WS_MINIMIZEBOX;
constexpr DWORD Popup=WS_POPUP|WS_CLIPSIBLINGS|WS_CLIPCHILDREN;
unsigned checked=0,clientPoints=0,framePoints=0;
void Compare(HWND window,int x,int y) {
    const auto position=MAKELPARAM(x,y);
    const auto reference=DefWindowProcA(window,WM_NCHITTEST,0,position);
    const bool client=NativePointInsideClient(window,position);
    if(client && reference!=HTCLIENT) {
        std::fprintf(stderr,"mismatch x=%d y=%d expected=%lld\n",x,y,
            static_cast<long long>(reference));
        throw std::runtime_error("Client shortcut changed native hit result");
    }
    ++checked;
    if(client) ++clientPoints;
    else ++framePoints;
}
void Grid(HWND window) {
    RECT outer{};Require(GetWindowRect(window,&outer)!=FALSE,"GetWindowRect");
    RECT client{};Require(GetClientRect(window,&client)!=FALSE,"GetClientRect");
    POINT origin{};Require(ClientToScreen(window,&origin)!=FALSE,"ClientToScreen");
    for(int y=outer.top-2;y<=outer.bottom+2;y+=19)
        for(int x=outer.left-2;x<=outer.right+2;x+=23) Compare(window,x,y);
    const std::array xs{outer.left-1,outer.left,outer.right-1,outer.right,
        origin.x-1,origin.x,origin.x+client.right-1,origin.x+client.right};
    const std::array ys{outer.top-1,outer.top,outer.bottom-1,outer.bottom,
        origin.y-1,origin.y,origin.y+client.bottom-1,origin.y+client.bottom};
    for(const auto x:xs) for(const auto y:ys) Compare(window,x,y);
}
void Benchmark(HWND window) {
    RECT client{};GetClientRect(window,&client);
    POINT center{client.right/2,client.bottom/2};ClientToScreen(window,&center);
    const auto position=MAKELPARAM(center.x,center.y);
    std::array<double,21> original{},quick{};
    LONG_PTR volatile result=0;
    for(unsigned sample=0;sample<original.size();++sample) {
        const auto measure=[&](bool shortcut) {
            const auto begin=Clock::now();
            for(unsigned i=0;i<1000;++i)
                result=shortcut && NativePointInsideClient(window,position)?
                    HTCLIENT:DefWindowProcA(window,WM_NCHITTEST,0,position);
            return std::chrono::duration<double,std::micro>(Clock::now()-begin).count();
        };
        if(sample&1) {original[sample]=measure(false);quick[sample]=measure(true);}
        else {quick[sample]=measure(true);original[sample]=measure(false);}
    }
    Require(result==HTCLIENT,"Benchmark result");
    std::sort(original.begin(),original.end());std::sort(quick.begin(),quick.end());
    std::printf("client-only reports=1000 samples=21 default_us=%.3f shortcut_us=%.3f\n",
        original[10],quick[10]);
}
}
int main(int argc,char** argv) {
    try {
        const bool benchmark=argc==2 && std::strcmp(argv[1],"--benchmark")==0;
        Require(argc==1 || benchmark,"Expected no arguments or --benchmark");
        Require(SetProcessDpiAwarenessContext(DPI_AWARENESS_CONTEXT_SYSTEM_AWARE)!=FALSE,"System-aware context");
        Require(SetProcessAffinityMask(GetCurrentProcess(),DWORD_PTR(0x8000))!=FALSE,"LP15 affinity");
        const HWND foreground=GetForegroundWindow();
        const auto instance=GetModuleHandleW(nullptr);
        WNDCLASSA type{};type.style=CS_DBLCLKS;type.lpfnWndProc=DefWindowProcA;
        type.hInstance=instance;type.lpszClassName="OffscreenClientHitProbe";
        Require(RegisterClassA(&type)!=0,"RegisterClass");
        const int x=GetSystemMetrics(SM_XVIRTUALSCREEN)-2400;
        const int y=GetSystemMetrics(SM_YVIRTUALSCREEN)-1800;
        for(const auto style:{Normal,Popup}) {
            HWND window=CreateWindowExA(WS_EX_TOOLWINDOW|WS_EX_NOACTIVATE,
                type.lpszClassName,"",style,x,y,800,600,nullptr,nullptr,instance,nullptr);
            Require(window!=nullptr,"CreateWindowEx");
            struct Close {HWND window;~Close(){DestroyWindow(window);}} close{window};
            Grid(window);
            ShowWindow(window,SW_SHOWNOACTIVATE);
            Grid(window);
            Require(SetWindowPos(window,nullptr,x-200,y-200,1600,900,
                SWP_NOACTIVATE|SWP_NOZORDER)!=FALSE,"Resize offscreen window");
            Grid(window);
            if(style==Normal && benchmark) Benchmark(window);
            ShowWindow(window,SW_SHOWMINNOACTIVE);
            Grid(window);
        }
        Require(checked>1000 && clientPoints>1000 && framePoints>0,"Grid coverage");
        Require(GetForegroundWindow()==foreground,"Foreground changed");
        Require(UnregisterClassA(type.lpszClassName,instance)!=FALSE,"UnregisterClass");
        std::printf("PASS checked=%u client=%u delegated=%u signed-coordinates/hidden/shown/resized/minimized/popup\n",
            checked,clientPoints,framePoints);
        return 0;
    }catch(const std::exception& error) {
        std::fprintf(stderr,"FAIL %s win32=%lu\n",error.what(),GetLastError());
        return 1;
    }
}
