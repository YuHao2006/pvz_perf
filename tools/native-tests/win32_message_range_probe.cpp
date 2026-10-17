#define WIN32_LEAN_AND_MEAN
#define NOMINMAX
#include <windows.h>
#include <windowsx.h>
#include <array>
#include <cstdio>
#include <stdexcept>
#include <vector>

namespace {
constexpr unsigned MoveCount=1000;
struct Event {
    UINT kind;
    WPARAM value;
    LPARAM position;
};
void Require(bool ok,const char* why) {
    if(!ok) throw std::runtime_error(why);
}
void Post(HWND window,const Event& event) {
    Require(PostMessageW(window,event.kind,event.value,event.position)!=FALSE,"PostMessage failed");
}
bool PeekWithoutClientMove(MSG& message) {
    return PeekMessageW(&message,nullptr,0,WM_MOUSEMOVE-1,PM_REMOVE)!=FALSE ||
        PeekMessageW(&message,nullptr,WM_MOUSEMOVE+1,0xFFFF,PM_REMOVE)!=FALSE;
}
std::vector<UINT> Drain(bool filtered) {
    std::vector<UINT> kinds;
    MSG message{};
    while(filtered?PeekWithoutClientMove(message):
        PeekMessageW(&message,nullptr,0,0,PM_REMOVE)!=FALSE) {
        kinds.push_back(message.message);
    }
    return kinds;
}
void Print(const char* label,const std::vector<UINT>& kinds) {
    std::printf("%s",label);
    for(const auto kind:kinds) std::printf(" 0x%04X",kind);
    std::putchar('\n');
}
}

int main() {
    try {
        Require(SetProcessAffinityMask(GetCurrentProcess(),DWORD_PTR(0x8000))!=FALSE,
            "Cannot pin probe to LP15");
        Require(SetPriorityClass(GetCurrentProcess(),BELOW_NORMAL_PRIORITY_CLASS)!=FALSE,
            "Cannot lower probe priority");
        const auto instance=GetModuleHandleW(nullptr);
        WNDCLASSW type{};
        type.hInstance=instance;type.lpfnWndProc=DefWindowProcW;
        type.lpszClassName=L"MouseRangeContractProbe";
        Require(RegisterClassW(&type)!=0,"RegisterClass failed");
        HWND window=CreateWindowExW(WS_EX_NOACTIVATE|WS_EX_TOOLWINDOW,type.lpszClassName,L"",
            WS_POPUP,-32000,-32000,640,480,nullptr,nullptr,instance,nullptr);
        Require(window!=nullptr,"Hidden window creation failed");
        struct Destroy {HWND value;~Destroy(){DestroyWindow(value);}} destroy{window};
        Require(!IsWindowVisible(window),"Probe window became visible");
        Drain(false);
        POINT current{};
        Require(GetCursorPos(&current)!=FALSE && ScreenToClient(window,&current)!=FALSE,
            "Initial position query failed");

        constexpr std::array<Event,6> buttons{{
            {WM_LBUTTONDOWN,MK_LBUTTON,MAKELPARAM(-12,25)},
            {WM_LBUTTONUP,0,MAKELPARAM(37,-8)},
            {WM_RBUTTONDOWN,MK_RBUTTON,MAKELPARAM(140,55)},
            {WM_RBUTTONUP,0,MAKELPARAM(143,58)},
            {WM_MBUTTONDOWN,MK_MBUTTON,MAKELPARAM(280,140)},
            {WM_MBUTTONUP,0,MAKELPARAM(281,141)}}};
        for(unsigned i=0;i<MoveCount;++i)
            Post(window,{WM_MOUSEMOVE,0,MAKELPARAM(i%640,i%480)});
        for(const auto& event:buttons) Post(window,event);
        unsigned count=0;
        MSG message{};
        while(PeekWithoutClientMove(message)) {
            Require(count<buttons.size(),"Unexpected returned event");
            const auto& expected=buttons[count++];
            Require(message.message==expected.kind && message.wParam==expected.value &&
                message.lParam==expected.position,"Button coordinates or FIFO changed");
        }
        Require(count==buttons.size(),"Button event was lost");
        Require(GetCursorPos(&current)!=FALSE && ScreenToClient(window,&current)!=FALSE,
            "Range filtering disabled position queries");
        const auto remaining=Drain(false);
        Require(remaining.size()==MoveCount,"Excluded posted move count changed");
        for(const auto kind:remaining) Require(kind==WM_MOUSEMOVE,"Unexpected pending event");
        std::printf("PASS range excludes %u posted moves; %u button events retain coordinates and FIFO\n",
            MoveCount,count);
        std::puts("PASS GetCursorPos/ScreenToClient before and after filtering; no pointer movement injected");

        const std::array<Event,4> mixed{{
            {WM_LBUTTONDOWN,MK_LBUTTON,MAKELPARAM(100,120)},
            {WM_KEYDOWN,'A',1},
            {WM_LBUTTONUP,0,MAKELPARAM(130,150)},
            {WM_KEYUP,'A',1}}};
        for(const auto& event:mixed) Post(window,event);
        const auto control=Drain(false);
        for(const auto& event:mixed) Post(window,event);
        const auto filtered=Drain(true);
        Print("unfiltered",control);
        Print("range-filtered",filtered);
        Require(control==std::vector<UINT>{WM_LBUTTONDOWN,WM_KEYDOWN,WM_LBUTTONUP,WM_KEYUP},
            "Unfiltered control did not preserve posted order");
        if(filtered!=control) {
            std::puts("REJECT mixed keyboard/button FIFO: filtering changes event order");
            std::puts("LIMIT posted-message contract only; no physical HID or GPU performance tested");
            return 2;
        }
        std::puts("PASS mixed keyboard/button FIFO");
        return 0;
    }catch(const std::exception& error) {
        std::fprintf(stderr,"ERROR %s win32=%lu\n",error.what(),GetLastError());
        return 1;
    }
}
