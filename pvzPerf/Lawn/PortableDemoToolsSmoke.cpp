#include "PortableDemoToolsSmoke.h"
#include "ModernVulkanSmoke.h"
#include "misc/DemoDialogTemplate.h"
#include "misc/DemoJumpTime.h"
#include <array>
#include <fstream>
#include <stdexcept>

namespace {
using namespace Sexy::DemoTools;
void Require(bool value,const char* message){if(!value) throw std::runtime_error(message);}
struct DialogProbe {
    DialogKind kind;
    bool initialized=false,valid=true,shown=false;
    unsigned controls=0;
    struct ControlEvidence {int id;RECT expected{},actual{};DWORD style=0;unsigned failures=0;};
    std::array<ControlEvidence,3> evidence{};
    unsigned checked=0;
};
bool ClassIs(HWND hwnd,const wchar_t* expected) noexcept {
    wchar_t text[128]{};
    return GetClassNameW(hwnd,text,128)>0 && wcscmp(text,expected)==0;
}
bool TitleIs(HWND hwnd,const wchar_t* expected) noexcept {
    wchar_t text[128]{};
    GetWindowTextW(hwnd,text,128);
    return wcscmp(text,expected)==0;
}
void CheckTemplateBytes(const std::byte* bytes,DialogKind kind) {
    // Independent reader: verify the specified layout BEFORE Windows changes
    // list-box height/scrollbar flags to fit its current (empty) contents.
    DLGTEMPLATE header{};
    std::memcpy(&header,bytes,sizeof(header));
    const bool markers=kind==DialogKind::Markers;
    Require(header.style==(WS_POPUP|WS_BORDER|WS_SYSMENU|DS_MODALFRAME|WS_CAPTION|DS_SETFONT) &&
        header.dwExtendedStyle==0 && header.cdit==(markers?1:3) && header.x==10 && header.y==10 &&
        header.cx==200 && header.cy==(markers?200:50),"Demo dialog header changed from the original layout");
    std::size_t offset=sizeof(header);
    const auto word=[&](){
        Require(offset+2<=DialogTemplateCapacity,"Template reader exceeded its bounds");
        WORD value;std::memcpy(&value,bytes+offset,2);offset+=2;return value;
    };
    const auto text=[&](std::wstring_view expected){
        for(wchar_t c:expected) Require(word()==static_cast<WORD>(c),"Demo template text changed");
        Require(word()==0,"Demo template string is not terminated");
    };
    Require(word()==0 && word()==0,"Demo template menu or class changed");
    text(markers?L"Marker List":L"Jump To Time");
    Require(word()==8,"Demo dialog font size changed");text(L"Tahoma");
    const auto item=[&](WORD id,WORD klass,short x,short y,short w,short h,
        DWORD style,DWORD extended,std::wstring_view label){
        while(offset%4) Require(bytes[offset++]==std::byte{},"Template alignment padding is not zero");
        Require(offset+sizeof(DLGITEMTEMPLATE)<=DialogTemplateCapacity,"Truncated dialog item");
        DLGITEMTEMPLATE control{};std::memcpy(&control,bytes+offset,sizeof(control));offset+=sizeof(control);
        Require(control.id==id && control.x==x && control.y==y && control.cx==w && control.cy==h &&
            control.style==style && control.dwExtendedStyle==extended,"Raw demo control layout/style changed");
        Require(word()==0xffff && word()==klass,"Demo template control class changed");
        text(label);
        Require(word()==0,"Unexpected demo control creation data");
    };
    if(markers) {
        item(100,0x83,5,5,190,195,WS_VISIBLE|WS_CHILD|WS_VSCROLL|WS_HSCROLL|LBS_NOTIFY,WS_EX_CLIENTEDGE,L"");
    } else {
        item(100,0x81,5,5,190,15,WS_VISIBLE|WS_CHILD,WS_EX_CLIENTEDGE,L"");
        item(IDOK,0x80,30,25,60,15,WS_VISIBLE|WS_CHILD|BS_DEFPUSHBUTTON,0,L"Ok");
        item(IDCANCEL,0x80,100,25,60,15,WS_VISIBLE|WS_CHILD,0,L"Cancel");
    }
}
bool ControlIs(DialogProbe& probe,HWND dialog,int id,const wchar_t* klass,const wchar_t* title,
    int x,int y,int width,int height,DWORD style,DWORD exStyle) noexcept {
    const HWND control=GetDlgItem(dialog,id);
    auto& evidence=probe.evidence[probe.checked++];
    evidence.id=id;
    if(!control){evidence.failures=1;return false;}
    if(!ClassIs(control,klass)) evidence.failures|=2;
    if(!TitleIs(control,title)) evidence.failures|=4;
    RECT expected{x,y,x+width,y+height},actual{};
    if(!MapDialogRect(dialog,&expected) || !GetWindowRect(control,&actual)){evidence.failures|=8;return false;}
    MapWindowPoints(nullptr,dialog,reinterpret_cast<POINT*>(&actual),2);
    // MapDialogRect rounds the edges, while creation can round position and size
    // separately. This is at most one pixel, not a changed dialog-unit layout.
    const auto close=[](LONG a,LONG b){return a>=b-1 && a<=b+1;};
    evidence.expected=expected;evidence.actual=actual;
    bool bottomMatches=close(actual.bottom,expected.bottom);
    if(wcscmp(klass,L"ListBox")==0) {
        // No LBS_NOINTEGRALHEIGHT: Win32 rounds to complete list items. Empty
        // list boxes also remove scroll bars. Raw creation fields are checked
        // independently above; do not change original styles just for this test.
        const LRESULT rowHeight=SendMessageW(control,LB_GETITEMHEIGHT,0,0);
        bottomMatches=rowHeight>0 && actual.bottom<=expected.bottom+1 &&
            expected.bottom-actual.bottom<=rowHeight;
        style&=~(WS_VSCROLL|WS_HSCROLL);
    }
    if(!(close(actual.left,expected.left) && close(actual.top,expected.top) &&
        close(actual.right,expected.right) && bottomMatches)) evidence.failures|=16;
    evidence.style=static_cast<DWORD>(GetWindowLongPtrW(control,GWL_STYLE));
    if((evidence.style&style)!=style) evidence.failures|=32;
    if((static_cast<DWORD>(GetWindowLongPtrW(control,GWL_EXSTYLE))&exStyle)!=exStyle) evidence.failures|=64;
    return evidence.failures==0;
}
INT_PTR CALLBACK ProbeDialog(HWND hwnd,UINT message,WPARAM wParam,LPARAM lParam) noexcept {
    auto* probe=reinterpret_cast<DialogProbe*>(GetWindowLongPtrW(hwnd,DWLP_USER));
    if(message==WM_INITDIALOG) {
        probe=reinterpret_cast<DialogProbe*>(lParam);
        SetWindowLongPtrW(hwnd,DWLP_USER,lParam);
        probe->initialized=true;
        probe->valid=!IsWindowVisible(hwnd);
        for(HWND child=GetWindow(hwnd,GW_CHILD);child;child=GetWindow(child,GW_HWNDNEXT)) ++probe->controls;
        if(probe->kind==DialogKind::Markers) {
            probe->valid=probe->valid && probe->controls==1 && TitleIs(hwnd,L"Marker List") &&
                ControlIs(*probe,hwnd,100,L"ListBox",L"",5,5,190,195,
                    WS_VISIBLE|WS_CHILD|WS_VSCROLL|WS_HSCROLL|LBS_NOTIFY,WS_EX_CLIENTEDGE);
        } else {
            probe->valid=probe->valid && probe->controls==3 && TitleIs(hwnd,L"Jump To Time") &&
                ControlIs(*probe,hwnd,100,L"Edit",L"",5,5,190,15,WS_VISIBLE|WS_CHILD,WS_EX_CLIENTEDGE) &&
                ControlIs(*probe,hwnd,IDOK,L"Button",L"Ok",30,25,60,15,WS_VISIBLE|WS_CHILD|BS_DEFPUSHBUTTON,0) &&
                ControlIs(*probe,hwnd,IDCANCEL,L"Button",L"Cancel",100,25,60,15,WS_VISIBLE|WS_CHILD,0);
        }
        // Microsoft documents this exact path: EndDialog during WM_INITDIALOG
        // destroys the dialog before it is displayed or the focus is set.
        // Do not run the real callback here: it persists the user's demo time.
        EndDialog(hwnd,probe->valid?0x1073:0xdead);
        return FALSE;
    }
    if(probe && message==WM_SHOWWINDOW && wParam) probe->shown=true;
    return FALSE;
}
}

void PortableDemoToolsSmoke() {
    using namespace Sexy::DemoTools;
    std::ofstream log(ModernSmoke::ProbePath("demo-tools-boundaries.txt"));
    Require(bool(log),"Cannot write demo tools evidence");
    struct Allocation {
        void* value=nullptr;
        ~Allocation(){if(value) VirtualFree(value,0,MEM_RELEASE);}
    } allocation;
    // Reserve a real address above 4 GiB, not merely a synthetic pointer value.
    for(std::uintptr_t address:{0x0000020000000000ULL,0x0000030000000000ULL,0x0000040000000000ULL}) {
        allocation.value=VirtualAlloc(reinterpret_cast<void*>(address),4096,MEM_RESERVE|MEM_COMMIT,PAGE_READWRITE);
        if(allocation.value) break;
    }
    Require(allocation.value!=nullptr,"Cannot reserve high-address dialog fixture");
    const auto address=reinterpret_cast<std::uintptr_t>(allocation.value);
    Require(address>0xffffffffULL,"Dialog regression did not use a high address");
    const auto oldAligned=(static_cast<std::uint32_t>(address+1)+3U)&~3U;
    const auto fullAligned=(address+1+3)&~std::uintptr_t(3);
    Require(oldAligned!=fullAligned,"Fixture did not expose the old pointer truncation");
    log<<"address="<<std::hex<<address<<" old-aligned="<<oldAligned<<" correct-aligned="<<fullAligned<<std::dec<<'\n';
    auto* bytes=static_cast<std::byte*>(allocation.value);
    std::fill(bytes,bytes+4096,std::byte{0xcd});
    for(DialogKind kind:{DialogKind::Markers,DialogKind::JumpTime}) {
        auto* dialog=BuildDialogTemplate({bytes,DialogTemplateCapacity},kind);
        CheckTemplateBytes(bytes,kind);
        DialogProbe probe{kind};
        const INT_PTR result=DialogBoxIndirectParamW(GetModuleHandleW(nullptr),dialog,nullptr,ProbeDialog,
            reinterpret_cast<LPARAM>(&probe));
        log<<"dialog="<<(kind==DialogKind::Markers?"markers":"jump")<<" result="<<result
            <<" init="<<probe.initialized<<" controls="<<probe.controls<<" valid="<<probe.valid
            <<" shown="<<probe.shown<<std::endl;
        for(unsigned i=0;i<probe.checked;++i) {
            const auto& c=probe.evidence[i];
            log<<"control="<<c.id<<" failures="<<c.failures<<" style="<<std::hex<<c.style<<std::dec
                <<" expected="<<c.expected.left<<','<<c.expected.top<<','<<c.expected.right<<','<<c.expected.bottom
                <<" actual="<<c.actual.left<<','<<c.actual.top<<','<<c.actual.right<<','<<c.actual.bottom<<std::endl;
        }
        Require(result==0x1073 && probe.initialized && probe.valid && !probe.shown,
            "Real Win32 parser rejected the retained high-address dialog layout");
        Require(std::all_of(bytes+DialogTemplateCapacity,bytes+4096,[](auto b){return b==std::byte{0xcd};}),
            "Dialog template wrote beyond its supplied storage");
    }
    bool rejected=false;
    try{BuildDialogTemplate({bytes+1,DialogTemplateCapacity},DialogKind::Markers);}
    catch(const std::invalid_argument&){rejected=true;}
    Require(rejected,"Misaligned template storage was silently accepted");
    rejected=false;
    try{BuildDialogTemplate({bytes,16},DialogKind::JumpTime);}
    catch(const std::length_error&){rejected=true;}
    Require(rejected,"Undersized template storage was silently accepted");
    log<<"misaligned-and-short-storage-rejected canary-intact=PASS\n";

    struct TimeCase {std::string_view text;std::uint32_t length;int frame;std::uint32_t expected;};
    unsigned valid=0;
    for(const auto& test:std::to_array<TimeCase>({
        {"0",1000,10,900},{"9",1000,10,0},{"10",1000,10,0},
        {"1:30",20000,10,10900},{"90",20000,10,10900},{"1:90",20000,10,4900},
        {"  +1 : 30\t",20000,10,10900},{"1:2:3",1000000,10,627600},
        {"0:0:0:1",1000,10,800},{"0",0,10,0},{"0",77,13,1},
        {"0",76,13,0},{"0",1,1500,1},{"1",1,1500,0},
        {"2147483647",0xffffffffU,10,0},{"4294967295",0xffffffffU,10,0},
        {"18446744073709551615",0xffffffffU,10,0},{"1",0xffffffffU,10,0xffffff37U},
        {"18446744073709551615",0xffffffffU,0x7fffffff,0}})) {
        const auto target=ParseJumpTarget(test.text,test.length,test.frame);
        log<<"time='"<<test.text<<"' length="<<test.length<<" frame="<<test.frame
            <<" target="<<(target?std::to_string(*target):"invalid")<<" expected="<<test.expected<<'\n';
        Require(target && *target==test.expected,"Demo time parser changed a checked valid seek");
        ++valid;
    }
    unsigned invalid=0;
    for(std::string_view input:{""," ","+","-1",":1","1:","1::2","1.5","1foo","1 2",
        "18446744073709551616","307445734561825860:16","999999999999999999999999999999999999"}) {
        Require(!ParseJumpTarget(input,100000,10),"Invalid or overflowing demo time was accepted");
        ++invalid;
    }
    Require(!ParseJumpTarget("0",100,0) && !ParseJumpTarget("0",100,-1),"Invalid frame duration was accepted");
    unsigned arithmetic=0;
    for(std::uint32_t length:{0U,1U,77U,1000U,0x7fffffffU,0xffffffffU})
        for(int frame:{1,10,13,1500,0x7fffffff})
            for(std::uint64_t seconds:{0ULL,1ULL,9ULL,90ULL,2147483647ULL}) {
                // Independent formula over inputs whose multiplication fits uint64.
                const auto offset=(seconds+1)*1000/static_cast<unsigned>(frame);
                const auto expected=offset>=length?0:static_cast<std::uint32_t>(length-offset);
                Require(ParseJumpTarget(std::to_string(seconds),length,frame)==expected,
                    "Clamped parser disagrees with the widened original arithmetic");
                ++arithmetic;
            }
    log<<"valid="<<valid<<" invalid="<<invalid+2<<" wide-formula-cases="<<arithmetic<<" PASS\n";
    std::ofstream result(ModernSmoke::ProbePath("result.log"),std::ios::app);
    Require(bool(result),"Cannot record demo tools result");
    result<<"portable-demo-tools-high-address-dialogs-and-time-parser before-renderer=1\n";
}
