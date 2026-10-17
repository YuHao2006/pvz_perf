#define WIN32_LEAN_AND_MEAN
#define NOMINMAX
#include <windows.h>
#include "SexyAppFramework/platform/windows/NativeMessagePumpBudget.h"
#include <array>
#include <cstdio>
#include <stdexcept>

namespace {
using Budget=Sexy::NativeMessagePumpBudget;
constexpr unsigned Count=128;
constexpr std::array<UINT,4> Kinds{WM_KEYDOWN,WM_KEYUP,WM_LBUTTONDOWN,WM_LBUTTONUP};
struct Received {
    unsigned count=0;
    std::array<unsigned,4> kinds{};
    bool valid=true;
};
void Require(bool value,const char* message) {
    if(!value) throw std::runtime_error(message);
}
LRESULT CALLBACK WindowProc(HWND window,UINT message,WPARAM w,LPARAM l) {
    auto* state=reinterpret_cast<Received*>(GetWindowLongPtrW(window,GWLP_USERDATA));
    if(message==WM_NCCREATE) {
        state=static_cast<Received*>(reinterpret_cast<CREATESTRUCTA*>(l)->lpCreateParams);
        SetWindowLongPtrW(window,GWLP_USERDATA,reinterpret_cast<LONG_PTR>(state));
    }
    for(unsigned kind=0;kind<Kinds.size();++kind) if(message==Kinds[kind] && state) {
        const auto begin=Budget::Clock::now();
        while(Budget::Clock::now()-begin<std::chrono::microseconds(200)) {}
        if(state->count>=Count || message!=Kinds[state->count%Kinds.size()] ||
            l!=LPARAM(state->count+1) || w!=VK_F24)
            state->valid=false;
        ++state->count;
        ++state->kinds[kind];
        return 0;
    }
    return DefWindowProcA(window,message,w,l);
}
void Post(HWND window) {
    for(unsigned i=0;i<Count;++i)
        Require(PostMessageW(window,Kinds[i%Kinds.size()],VK_F24,LPARAM(i+1))!=FALSE,
            "Posting ordered input failed");
}
struct Result {double microseconds;unsigned delivered;bool yielded;};
Result Pump(HWND window,Received& received,bool bounded) {
    const auto first=received.count;
    Budget budget;
    MSG message{};
    const auto start=Budget::Clock::now();
    while((!bounded || budget.NextAllowed()) &&
        PeekMessageW(&message,window,0,0,PM_REMOVE)) {
        TranslateMessage(&message);
        DispatchMessageW(&message);
    }
    const auto elapsed=std::chrono::duration<double,std::micro>(Budget::Clock::now()-start).count();
    return {elapsed,received.count-first,budget.mYielded};
}
void Check(const Received& received) {
    Require(received.valid && received.count==Count,"Input was lost or reordered");
    for(const auto count:received.kinds)
        Require(count==Count/Kinds.size(),"Input kind count changed");
}
}
int main() {
    try {
        const auto instance=GetModuleHandleW(nullptr);
        WNDCLASSA type{};type.hInstance=instance;type.lpfnWndProc=WindowProc;
        type.lpszClassName="MessageBudgetFIFOTest";
        Require(RegisterClassA(&type)!=0,"RegisterClass failed");
        Received received;
        HWND window=CreateWindowExA(0,type.lpszClassName,"",0,0,0,0,0,
            HWND_MESSAGE,nullptr,instance,&received);
        Require(window!=nullptr,"Message-only window creation failed");
        struct Destroy {HWND handle;~Destroy(){DestroyWindow(handle);}} destroy{window};
        Post(window);
        const auto control=Pump(window,received,false);
        Check(received);
        Require(control.delivered==Count && !control.yielded,"Unbounded control did not drain");
        received={};
        Post(window);
        const auto first=Pump(window,received,true);
        Require(first.yielded && first.delivered>0 && first.delivered<Count,
            "Budget did not return while input remained queued");
        unsigned pumps=1;
        const auto deadline=Budget::Clock::now()+std::chrono::seconds(3);
        while(received.count<Count && Budget::Clock::now()<deadline) {
            Pump(window,received,true);
            ++pumps;
        }
        Check(received);
        Require(pumps>1,"Budget did not make room between input batches");
        std::printf("control_us=%.3f first_budget_us=%.3f first_delivered=%u total=%u pumps=%u\n",
            control.microseconds,first.microseconds,first.delivered,received.count,pumps);
        std::puts("PASS keyboard/button FIFO, all inputs retained, pending-queue yield; synthetic cost, no HID/GPU");
        return 0;
    }catch(const std::exception& error) {
        std::fprintf(stderr,"FAIL %s win32=%lu\n",error.what(),GetLastError());
        return 1;
    }
}
