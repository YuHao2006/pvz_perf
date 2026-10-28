#define WIN32_LEAN_AND_MEAN
#define NOMINMAX
#include <windows.h>
#include <windowsx.h>
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
// Mirrors only the native retrieval/dispatch contract. This is not the full
// SexyAppBase pump: deferred widget actions, GPU work and hardware input are absent.
unsigned Pump(HWND mainWindow,unsigned* discardedMotion=nullptr) {
    unsigned count=0;
    MSG message{};
    while(PeekMessageW(&message,nullptr,0,0,PM_REMOVE)) {
        Require(message.message!=WM_QUIT,"Unexpected quit while draining");
        ++count;
        if(message.hwnd==mainWindow &&
            (message.message==WM_MOUSEMOVE || message.message==WM_MOUSELEAVE)) {
            if(discardedMotion) ++*discardedMotion;
            continue;
        }
        TranslateMessage(&message);
        DispatchMessageW(&message);
    }
    return count;
}
void Post(HWND window,const Event& event) {
    Require(PostMessageW(window,event.kind,event.value,event.position)!=FALSE,
        "PostMessage failed");
}

void CheckWindowLiveness(HINSTANCE instance,const wchar_t* className,HWND mainWindow) {
    struct Probe {
        std::atomic<HWND> window{};
        std::atomic<unsigned> updates=0;
        std::atomic<unsigned> discardedMotion=0;
        std::exception_ptr error;
    } serviced;
    std::jthread thread([&](std::stop_token stop) {
        HWND window=nullptr;
        try {
            window=CreateWindowExW(0,className,L"",WS_OVERLAPPEDWINDOW,0,0,32,32,
                nullptr,nullptr,instance,nullptr);
            Require(window!=nullptr,"Cannot create top-level liveness window");
            serviced.window=window;
            while(!stop.stop_requested()) {
                unsigned removed=0;
                Pump(window,&removed);
                serviced.discardedMotion.fetch_add(removed);
                ++serviced.updates;
                Sleep(5);
            }
        } catch(...) { serviced.error=std::current_exception(); }
        if(window) DestroyWindow(window);
    });
    bool hung=false;
    const auto deadline=GetTickCount64()+6200;
    while(GetTickCount64()<deadline) {
        Pump(mainWindow);
        if(const auto window=serviced.window.load()) {
            Post(window,{WM_MOUSEMOVE,0,MAKELPARAM(7,11)});
            Post(window,{WM_MOUSELEAVE,0,0});
            hung=IsHungAppWindow(window)!=FALSE;
            if(hung) break;
        }
        Sleep(10);
    }
    thread.request_stop();thread.join();
    if(serviced.error) std::rethrow_exception(serviced.error);
    Require(!hung,"Drained move-only queue became unresponsive");
    Require(serviced.updates>100 && serviced.discardedMotion>100,
        "Top-level liveness probe did not remove queued movement");
    std::printf("PASS top-level move-only queue drained for 6.2 seconds; updates=%u removed=%u; no USER hung state\n",
        serviced.updates.load(),serviced.discardedMotion.load());
}

}

int main() {
    try {
        const auto instance=GetModuleHandleW(nullptr);
        WNDCLASSW type{};type.hInstance=instance;type.lpfnWndProc=WindowProc;
        type.lpszClassName=L"MessageReadinessContractTest";
        Require(RegisterClassW(&type)!=0,"RegisterClass failed");
        Received received;received.events.reserve(512);
        HWND window=CreateWindowExW(0,type.lpszClassName,L"",0,0,0,0,0,
            HWND_MESSAGE,nullptr,instance,&received);
        Require(window!=nullptr,"Message-only window creation failed");
        struct Destroy {HWND value;~Destroy(){DestroyWindow(value);}} destroy{window};
        Pump(window);received.events.clear();
        Require(Pump(window)==0,"Drained queue still contained messages");

        const std::array<Event,13> mixed{{
            {WM_LBUTTONDOWN,MK_LBUTTON,MAKELPARAM(-12,25)},
            {WM_KEYDOWN,VK_F1,1},
            {WM_MOUSEMOVE,0,MAKELPARAM(200,220)},
            {WM_LBUTTONUP,0,MAKELPARAM(37,-8)},
            {WM_KEYUP,VK_F1,1},
            {WM_RBUTTONDOWN,MK_RBUTTON,MAKELPARAM(120,150)},
            {WM_CHAR,'x',1},
            {WM_RBUTTONUP,0,MAKELPARAM(130,160)},
            {WM_MBUTTONDOWN,MK_MBUTTON,MAKELPARAM(240,250)},
            {WM_MBUTTONUP,0,MAKELPARAM(241,251)},
            {WM_MOUSEWHEEL,MAKEWPARAM(0,120),MAKELPARAM(8,9)},
            {WM_CLOSE,0,0},
            {WM_APP+1,17,29}}};
        for(const auto& event:mixed) Post(window,event);
        GetQueueStatus(QS_ALLINPUT|QS_ALLPOSTMESSAGE); // Previously seen messages must still be removed.
        unsigned discarded=0;
        Require(Pump(window,&discarded)==mixed.size(),"Mixed message batch was not fully removed");
        std::vector<Event> expected;
        for(const auto& event:mixed) if(event.kind!=WM_MOUSEMOVE) expected.push_back(event);
        Require(discarded==1 && received.events==expected,
            "Removing movement reordered or changed other input events");
        Require(GET_X_LPARAM(received.events[0].position)==-12 &&
            GET_Y_LPARAM(received.events[2].position)==-8,
            "Signed button coordinates changed");
        std::puts("PASS mixed keyboard/button/text/wheel/close FIFO; signed coordinates; previously seen input removed");

        received.events.clear();
        received.slow=true;
        for(unsigned i=0;i<400;++i)
            Post(window,{UINT(i%2?WM_LBUTTONUP:WM_LBUTTONDOWN),i,MAKELPARAM(i,i+1)});
        const auto batchStart=std::chrono::steady_clock::now();
        Require(Pump(window)==400 && received.events.size()==400,"Finite input batch was not fully consumed");
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
            Pump(window);
            SwitchToThread();
        }
        sender.join();
        Require(sendPassed && received.sent==1,"Sent callback was starved");
        Pump(window);
        std::puts("PASS cross-thread sent callback; quiet queue after delivery");
        CheckWindowLiveness(instance,type.lpszClassName,window);

        PostQuitMessage(37);
        MSG message{};
        Require(PeekMessageW(&message,nullptr,0,0,PM_REMOVE)!=FALSE &&
            message.message==WM_QUIT && message.wParam==37,"WM_QUIT was lost");
        std::puts("PASS WM_QUIT retrieval and exit code");
        std::puts("LIMIT copied native retrieval/dispatch contract only; no full app pump, hardware movement or GPU performance tested");
        return 0;
    }catch(const std::exception& error) {
        std::fprintf(stderr,"FAIL %s win32=%lu\n",error.what(),GetLastError());
        return 1;
    }
}
