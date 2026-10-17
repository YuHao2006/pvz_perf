#define WIN32_LEAN_AND_MEAN
#define NOMINMAX
#include <windows.h>
#include <windowsx.h>
#include "SexyAppFramework/platform/windows/NativeMessageQueueFlags.h"
#include <array>
#include <atomic>
#include <cstdio>
#include <stdexcept>
#include <thread>

namespace {
constexpr std::array<UINT,10> Kinds{
    WM_KEYDOWN,WM_KEYUP,WM_LBUTTONDOWN,WM_LBUTTONUP,WM_MOUSEWHEEL,
    WM_CHAR,WM_CLOSE,WM_APP+1,WM_MOUSEMOVE,WM_NCMOUSEMOVE};
constexpr unsigned Count=200;
constexpr UINT SentMessage=WM_APP+2;
struct Received {
    unsigned count=0,sent=0,postedMoves=0,buttons=0;
    bool valid=true;
};
void Require(bool value,const char* message) {
    if(!value) throw std::runtime_error(message);
}
LPARAM Position(unsigned index) {
    return MAKELPARAM(short(-300+int(index)),short(200-int(index)));
}
LRESULT CALLBACK WindowProc(HWND window,UINT message,WPARAM w,LPARAM l) {
    auto* received=reinterpret_cast<Received*>(GetWindowLongPtrW(window,GWLP_USERDATA));
    if(message==WM_NCCREATE) {
        received=static_cast<Received*>(reinterpret_cast<CREATESTRUCTA*>(l)->lpCreateParams);
        SetWindowLongPtrW(window,GWLP_USERDATA,reinterpret_cast<LONG_PTR>(received));
    }
    if(message==SentMessage && received) {
        ++received->sent;
        return 73;
    }
    if(received) for(const auto kind:Kinds) if(message==kind) {
        const auto index=received->count;
        if(index>=Count || message!=Kinds[index%Kinds.size()] ||
            w!=WPARAM(index+1) || l!=Position(index))
            received->valid=false;
        if(message==WM_LBUTTONDOWN || message==WM_LBUTTONUP) {
            if(GET_X_LPARAM(l)!=-300+int(index) || GET_Y_LPARAM(l)!=200-int(index))
                received->valid=false;
            ++received->buttons;
        }
        if(message==WM_MOUSEMOVE || message==WM_NCMOUSEMOVE) ++received->postedMoves;
        ++received->count;
        return 0;
    }
    return DefWindowProcW(window,message,w,l);
}
}

int main() {
    try {
        const auto instance=GetModuleHandleW(nullptr);
        WNDCLASSW type{};type.hInstance=instance;type.lpfnWndProc=WindowProc;
        type.lpszClassName=L"MessageQueueFilterTest";
        Require(RegisterClassW(&type)!=0,"RegisterClass failed");
        Received received;
        HWND window=CreateWindowExW(0,type.lpszClassName,L"",0,0,0,0,0,
            HWND_MESSAGE,nullptr,instance,&received);
        Require(window!=nullptr,"Message-only window creation failed");
        struct Destroy {HWND handle;~Destroy(){DestroyWindow(handle);}} destroy{window};
        for(unsigned i=0;i<Count;++i)
            Require(PostMessageW(window,Kinds[i%Kinds.size()],i+1,Position(i))!=FALSE,
                "PostMessage failed");
        const auto status=HIWORD(GetQueueStatus(QS_ALLINPUT));
        Require((status&QS_POSTMESSAGE)!=0,"Posted queue category was absent");
        MSG message{};
        while(PeekMessageW(&message,nullptr,0,0,Sexy::NativeMessageNoMovePeekFlags))
            DispatchMessageW(&message);
        Require(received.valid && received.count==Count && received.buttons==40,
            "Filtered pump lost/reordered posted events or changed button coordinates");
        Require(received.postedMoves==40,
            "Synthetic move did not retain its posted-message classification");

        std::atomic<bool> sending=false,done=false,sendPassed=false;
        std::jthread sender([&] {
            sending=true;
            DWORD_PTR result=0;
            sendPassed=SendMessageTimeoutW(window,SentMessage,0,0,SMTO_ABORTIFHUNG,
                2000,&result)!=0 && result==73;
            done=true;
        });
        const auto deadline=GetTickCount64()+3000;
        while(!sending.load() && GetTickCount64()<deadline) SwitchToThread();
        while(!done.load() && GetTickCount64()<deadline) {
            PeekMessageW(&message,nullptr,0,0,Sexy::NativeMessageNoMovePeekFlags);
            SwitchToThread();
        }
        sender.join();
        Require(sendPassed && received.sent==1,
            "Filtered Peek failed to deliver a nonqueued sent callback");
        PostQuitMessage(37);
        Require(PeekMessageW(&message,nullptr,0,0,Sexy::NativeMessageNoMovePeekFlags)!=FALSE &&
            message.message==WM_QUIT && message.wParam==37,"Filtered pump lost WM_QUIT");
        std::printf("flags=0x%08X posted=%u buttons=%u posted_moves=%u sent=%u\n",
            Sexy::NativeMessageNoMovePeekFlags,received.count,received.buttons,
            received.postedMoves,received.sent);
        std::puts("PASS posted FIFO, button coordinates, close/text, sent callbacks, quit");
        std::puts("LIMIT queue-category filter is not an ID filter; no HID or pointer movement tested");
        return 0;
    }catch(const std::exception& error) {
        std::fprintf(stderr,"FAIL %s win32=%lu\n",error.what(),GetLastError());
        return 1;
    }
}
