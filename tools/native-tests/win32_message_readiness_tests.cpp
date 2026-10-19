#define WIN32_LEAN_AND_MEAN
#define NOMINMAX
#include <windows.h>
#include <windowsx.h>
#include "SexyAppFramework/platform/windows/NativeMessageReadiness.h"
#include <array>
#include <atomic>
#include <chrono>
#include <cstdio>
#include <stdexcept>
#include <thread>
#include <vector>

namespace {
constexpr UINT SentMessage=WM_APP+23;
struct Event {
    UINT kind;
    WPARAM value;
    LPARAM position;
    bool operator==(const Event&) const=default;
};
struct Received {
    std::vector<Event> events;
    unsigned sent=0;
    bool slow=false;
};
void Require(bool value,const char* message) {
    if(!value) throw std::runtime_error(message);
}
LRESULT CALLBACK WindowProc(HWND window,UINT kind,WPARAM value,LPARAM position) {
    auto* state=reinterpret_cast<Received*>(GetWindowLongPtrW(window,GWLP_USERDATA));
    if(kind==WM_NCCREATE) {
        state=static_cast<Received*>(reinterpret_cast<CREATESTRUCTW*>(position)->lpCreateParams);
        SetWindowLongPtrW(window,GWLP_USERDATA,reinterpret_cast<LONG_PTR>(state));
    }
    if(state) {
        if(kind==SentMessage) {
            ++state->sent;
            return 73;
        }
        switch(kind) {
        case WM_KEYDOWN:case WM_KEYUP:case WM_CHAR:
        case WM_LBUTTONDOWN:case WM_LBUTTONUP:
        case WM_RBUTTONDOWN:case WM_RBUTTONUP:
        case WM_MBUTTONDOWN:case WM_MBUTTONUP:
        case WM_MOUSEMOVE:case WM_MOUSEWHEEL:
        case WM_CLOSE:case WM_APP+1:
            if(state->slow) {
                const auto start=std::chrono::steady_clock::now();
                while(std::chrono::steady_clock::now()-start<std::chrono::microseconds(25)) {}
            }
            state->events.push_back({kind,value,position});
            return 0;
        }
    }
    return DefWindowProcW(window,kind,value,position);
}
unsigned Pump() {
    unsigned count=0;
    MSG message{};
    const auto deadline=GetTickCount64()+1000;
    while(Sexy::NativeNonMoveReady()) {
        Require(GetTickCount64()<deadline,"Readiness did not become quiet");
        if(!PeekMessageW(&message,nullptr,0,0,PM_REMOVE)) break;
        Require(message.message!=WM_QUIT,"Unexpected quit while draining");
        DispatchMessageW(&message);
        ++count;
    }
    return count;
}
void Post(HWND window,const Event& event) {
    Require(PostMessageW(window,event.kind,event.value,event.position)!=FALSE,
        "PostMessage failed");
}

void CheckWindowLiveness(HINSTANCE instance,const wchar_t* className) {
    struct Probe {
        std::atomic<HWND> window{};
        std::atomic<unsigned> updates=0;
        std::exception_ptr error;
    } idle,serviced;
    const auto run=[&](std::stop_token stop,Probe& probe,bool service) {
        try {
            const auto window=CreateWindowExW(0,className,L"",0,0,0,32,32,
                nullptr,nullptr,instance,nullptr);
            Require(window!=nullptr,"Cannot create hidden liveness window");
            MSG message{};
            PeekMessageW(&message,nullptr,0,0,PM_NOREMOVE);
            probe.window=window;
            Sexy::NativeFrameMotionPoll poll;
            unsigned update=0;
            while(!stop.stop_requested()) {
                if(service) poll.PollHeartbeat(update);
                // Match the game's idle readiness query, with no queued input.
                Sexy::NativeNonMoveReady();
                probe.updates=++update;
                Sleep(10);
            }
            DestroyWindow(window);
        } catch(...) {
            probe.error=std::current_exception();
        }
    };
    std::jthread idleThread([&](std::stop_token stop){run(stop,idle,false);});
    std::jthread servicedThread([&](std::stop_token stop){run(stop,serviced,true);});
    bool idleHung=false,servicedHung=false;
    const auto deadline=GetTickCount64()+9000;
    while(GetTickCount64()<deadline) {
        Pump();
        if(idle.window && serviced.window) {
            idleHung=IsHungAppWindow(idle.window)!=FALSE;
            servicedHung=IsHungAppWindow(serviced.window)!=FALSE;
            if(idleHung || servicedHung) break;
        }
        Sleep(10);
    }
    idleThread.request_stop();servicedThread.request_stop();
    idleThread.join();servicedThread.join();
    if(idle.error) std::rethrow_exception(idle.error);
    if(serviced.error) std::rethrow_exception(serviced.error);
    Require(idle.updates>100 && serviced.updates>100,"Liveness probes did not keep updating");
    Require(idleHung,"Unserviced updating window did not reproduce USER hung detection");
    Require(!servicedHung,"Heartbeat queue observation still became unresponsive");
    std::puts("PASS live updating window reproduces hung detection without PeekMessage; nonremoving heartbeat stays responsive");
}
}

int main() {
    try {
        Require(SetProcessAffinityMask(GetCurrentProcess(),DWORD_PTR(0x8000))!=FALSE,
            "Cannot pin test to LP15");
        const auto instance=GetModuleHandleW(nullptr);
        WNDCLASSW type{};type.hInstance=instance;type.lpfnWndProc=WindowProc;
        type.lpszClassName=L"MessageReadinessContractTest";
        Require(RegisterClassW(&type)!=0,"RegisterClass failed");
        Received received;received.events.reserve(512);
        HWND window=CreateWindowExW(0,type.lpszClassName,L"",0,0,0,0,0,
            HWND_MESSAGE,nullptr,instance,&received);
        Require(window!=nullptr,"Message-only window creation failed");
        struct Destroy {HWND value;~Destroy(){DestroyWindow(value);}} destroy{window};
        Pump();received.events.clear();
        Require(!Sexy::NativeNonMoveReady(),"Empty queue reported pending work");

        Sexy::NativeFrameMotionPoll motionPoll;
        unsigned nativeMotionPolls=0,heartbeatPolls=0;
        for(unsigned frame=0;frame<100;++frame) {
            for(unsigned report=0;report<1000;++report) {
                if(motionPoll.Allow(frame,(report&1)!=0)) ++nativeMotionPolls;
                if(motionPoll.PollHeartbeat(frame)) ++heartbeatPolls;
            }
        }
        Require(nativeMotionPolls==100,"Repeated boundary crossings created extra motion polls");
        Require(heartbeatPolls==100,"Responsiveness observation exceeded one call per update");
        Require(!motionPoll.Allow(99,false) && !motionPoll.Allow(100,true) &&
            motionPoll.Allow(100,false) && !motionPoll.Allow(100,false),
            "Native motion cadence depends on crossing count instead of updates");
        std::puts("PASS 100 updates x 1000 simulated boundary transitions; one extra native motion query per update");

        const std::array<Event,13> mixed{{
            {WM_LBUTTONDOWN,MK_LBUTTON,MAKELPARAM(-12,25)},
            {WM_KEYDOWN,'A',1},
            {WM_MOUSEMOVE,0,MAKELPARAM(200,220)},
            {WM_LBUTTONUP,0,MAKELPARAM(37,-8)},
            {WM_KEYUP,'A',1},
            {WM_RBUTTONDOWN,MK_RBUTTON,MAKELPARAM(120,150)},
            {WM_CHAR,'x',1},
            {WM_RBUTTONUP,0,MAKELPARAM(130,160)},
            {WM_MBUTTONDOWN,MK_MBUTTON,MAKELPARAM(240,250)},
            {WM_MBUTTONUP,0,MAKELPARAM(241,251)},
            {WM_MOUSEWHEEL,MAKEWPARAM(0,120),MAKELPARAM(8,9)},
            {WM_CLOSE,0,0},
            {WM_APP+1,17,29}}};
        for(const auto& event:mixed) Post(window,event);
        motionPoll.PollHeartbeat(101);
        Require(received.events.empty(),"Heartbeat observation consumed posted button/key/motion messages");
        Require(Sexy::NativeNonMoveReady(),"Posted input did not become ready");
        GetQueueStatus(QS_ALLINPUT|QS_ALLPOSTMESSAGE);
        Require(Sexy::NativeNonMoveReady() && Sexy::NativeNonMoveReady(),
            "Already-seen input stopped waking before removal");
        Pump();
        Require(received.events==std::vector<Event>(mixed.begin(),mixed.end()),
            "Readiness reordered events or changed message coordinates");
        Require(GET_X_LPARAM(received.events[0].position)==-12 &&
            GET_Y_LPARAM(received.events[3].position)==-8,
            "Signed button coordinates changed");
        std::puts("PASS mixed keyboard/button/text/wheel/close FIFO; event coordinates; old input readiness");

        received.events.clear();
        received.slow=true;
        for(unsigned i=0;i<400;++i)
            Post(window,{UINT(i%2?WM_LBUTTONUP:WM_LBUTTONDOWN),i,MAKELPARAM(i,i+1)});
        const auto batchStart=std::chrono::steady_clock::now();
        Require(Pump()==400 && received.events.size()==400,"Finite input batch was not fully consumed");
        const auto batchUs=std::chrono::duration<double,std::micro>(
            std::chrono::steady_clock::now()-batchStart).count();
        received.slow=false;
        for(unsigned i=0;i<400;++i)
            Require(received.events[i].value==i && received.events[i].position==MAKELPARAM(i,i+1),
                "Finite batch FIFO or coordinates changed");
        std::printf("PASS 400 pending button events consumed without a time budget; synthetic_us=%.3f\n",
            batchUs);

        std::atomic<bool> started=false,done=false,sendPassed=false;
        std::jthread sender([&] {
            started=true;
            DWORD_PTR result=0;
            sendPassed=SendMessageTimeoutW(window,SentMessage,0,0,
                SMTO_ABORTIFHUNG,2000,&result)!=0 && result==73;
            done=true;
        });
        const auto deadline=GetTickCount64()+3000;
        while(!started.load() && GetTickCount64()<deadline) SwitchToThread();
        while(!done.load() && GetTickCount64()<deadline) {
            motionPoll.PollHeartbeat(++heartbeatPolls+1000);
            SwitchToThread();
        }
        sender.join();
        Require(sendPassed && received.sent==1,"Sent callback was starved");
        Pump();
        std::puts("PASS cross-thread sent callback; quiet queue after delivery");
        CheckWindowLiveness(instance,type.lpszClassName);

        PostQuitMessage(37);
        Require(Sexy::NativeNonMoveReady(),"WM_QUIT did not wake readiness");
        MSG message{};
        Require(PeekMessageW(&message,nullptr,0,0,PM_REMOVE)!=FALSE &&
            message.message==WM_QUIT && message.wParam==37,"WM_QUIT was lost");
        std::puts("PASS WM_QUIT readiness and retrieval");
        std::puts("LIMIT posted/sent contract only; no hardware movement or GPU performance tested");
        return 0;
    }catch(const std::exception& error) {
        std::fprintf(stderr,"FAIL %s win32=%lu\n",error.what(),GetLastError());
        return 1;
    }
}
