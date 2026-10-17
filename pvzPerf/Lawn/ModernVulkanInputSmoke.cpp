#include "ModernVulkanInputSmoke.h"
#include "LawnApp.h"
#include "Resources.h"
#include "ModernVulkanSmoke.h"
#include "graphics/DDInterface.h"
#include "graphics/RenderInterface.h"
#include "widget/Widget.h"
#include "widget/WidgetManager.h"
#include "widget/EditWidget.h"
#include <array>
#include <algorithm>
#include <chrono>
#include <cstdint>
#include <fstream>
#include <stdexcept>
#include <vector>

namespace {
POINT fixtureMousePosition{};
unsigned fixtureMouseReads=0;
POINT ReadFixtureMousePosition(HWND) { ++fixtureMouseReads;return fixtureMousePosition; }
void Require(bool ok,const char* why) {if(!ok) throw std::runtime_error(why);}
struct Event {int x,y,count;};
struct ProbeWidget : Sexy::Widget {
    LawnApp& app;
    std::vector<Event> downs,ups,drags,moves;
    explicit ProbeWidget(LawnApp& a):app(a) {Resize(50,50,700,500);}
    void MouseEnter() override {app.SetCursor(Sexy::CURSOR_HAND);}
    void MouseLeave() override {app.SetCursor(Sexy::CURSOR_POINTER);}
    void MouseDown(int x,int y,int count) override {downs.push_back({x,y,count});}
    void MouseUp(int x,int y,int count) override {ups.push_back({x,y,count});}
    void MouseDrag(int x,int y) override {drags.push_back({x,y,0});}
    void MouseMove(int x,int y) override {moves.push_back({x,y,0});}
};
std::array<double,2> WindowPoint(LawnApp& app,int x,int y) {
    RECT client{};
    Require(GetClientRect(app.mHWnd,&client)!=FALSE,"Cannot query input fixture client");
    const auto rect=app.mDDInterface->mRenderInterface->mRenderer->PresentRect(
        client.right-client.left,client.bottom-client.top);
    return {rect.x+(x+.5)*rect.width/app.mWidth,rect.y+(y+.5)*rect.height/app.mHeight};
}
void CheckCursor(LawnApp& app,int cursor,int index,bool hidden) {
    app.SetCursor(cursor);
    Require(app.mNativeCursorIndex==index,"LawnApp bypassed native cursor selection");
    Require(app.mSysCursor==!hidden,"System/game cursor visibility disagrees");
    Require((app.mNativeAppliedCursor==nullptr)==hidden,"Native cursor handle visibility disagrees");
}
void Message(LawnApp& app,UINT message,WPARAM value,LPARAM detail=0) {
    SendMessageW(app.mHWnd,message,value,detail);
    app.DrainWindowMessages();
}
void Key(LawnApp& app,int key,bool down,bool repeat=false) {
    const auto scan=MapVirtualKeyW(static_cast<UINT>(key),MAPVK_VK_TO_VSC);
    const LPARAM flags=LPARAM(1)|(LPARAM(scan)<<16)|
        ((repeat || !down)?LPARAM(1)<<30:0)|(!down?LPARAM(1)<<31:0);
    Message(app,down?WM_KEYDOWN:WM_KEYUP,static_cast<WPARAM>(key),flags);
}
}

void ModernVulkanKeyboardSmoke(LawnApp& app) {
    using namespace Sexy;
    Require(getenv("PVZ_MODERN_HIDDEN") && getenv("PVZ_MODERN_SMOKE"),"Keyboard probe is hidden-only");
    auto& manager=*app.mWidgetManager;
    struct KeyboardWidget : Widget {
        std::vector<SexyChar> chars;
        std::vector<int> wheels;
        unsigned downs=0,ups=0;
        void KeyChar(SexyChar c) override {chars.push_back(c);}
        void KeyDown(KeyCode) override {++downs;}
        void KeyUp(KeyCode) override {++ups;}
        void MouseWheel(int delta) override {wheels.push_back(delta);}
    } probe;
    EditWidget edit(901,nullptr);
    edit.SetFont(FONT_DWARVENTODCRAFT15);edit.Resize(50,50,400,50);
    struct Restore {
        WidgetManager& manager;Widget& probe;Widget& edit;Widget* focus;Widget* tab;std::array<bool,255> keys;
        ~Restore(){manager.RemoveWidget(&edit);manager.RemoveWidget(&probe);manager.SetFocus(focus);
            manager.mDefaultTab=tab;
            std::copy(keys.begin(),keys.end(),std::begin(manager.mKeyDown));}
    } restore{manager,probe,edit,manager.mFocusWidget,manager.mDefaultTab,{}};
    struct RestoreWheel {
        decltype(app.mNativeWheelRemainder)& value;decltype(app.mNativeWheelRemainder) old;
        ~RestoreWheel(){value=old;}
    } restoreWheel{app.mNativeWheelRemainder,app.mNativeWheelRemainder};
    std::copy(std::begin(manager.mKeyDown),std::end(manager.mKeyDown),restore.keys.begin());
    manager.AddWidget(&probe);manager.AddWidget(&edit);manager.SetFocus(&probe);
    manager.mDefaultTab=&probe;
    std::fill(std::begin(manager.mKeyDown),std::end(manager.mKeyDown),false);
    std::ofstream log(ModernSmoke::ProbePath("win32-keyboard-cases.txt"));
    Require(bool(log),"Cannot write keyboard evidence");
    log<<"source=SendMessageW+DrainWindowMessages native-hid=0 translated-char-sequence=explicit\n";
    auto text=[&](unsigned c){Message(app,WM_CHAR,c,1);};
    unsigned chords=0;
    // SendMessage does not run TranslateMessage. Supply its character messages
    // explicitly, including Ctrl+A..Z; never alter the desktop keyboard state.
    for(int k='A';k<='Z';++k) for(bool shift:{false,true}) {
        Key(app,VK_CONTROL,true);
        if(shift) Key(app,VK_SHIFT,true);
        probe.chars.clear();probe.downs=probe.ups=0;
        Key(app,k,true);
        Require(probe.chars.empty(),"Keydown synthesized text before WM_CHAR");
        text(unsigned(k-'A'+1));
        Key(app,k,true,true);text(unsigned(k-'A'+1));Key(app,k,false);
        Require(probe.chars==std::vector<SexyChar>(2,static_cast<SexyChar>(k-'A'+1)) &&
            probe.downs==2 && probe.ups==1,"Native control character/repeat sequence differs");
        if(shift) Key(app,VK_SHIFT,false);
        Key(app,VK_CONTROL,false);
        log<<"control="<<k<<" shift="<<shift<<" exact=1\n";++chords;
    }
    Key(app,VK_CONTROL,true);Key(app,VK_MENU,true);
    probe.chars.clear();Key(app,'V',true);Key(app,'V',false);
    Require(probe.chars.empty(),"AltGr-like keydown synthesized a control character");
    text('@');Require(probe.chars==std::vector<SexyChar>{'@'},"AltGr character was discarded");
    Key(app,VK_MENU,false);Key(app,VK_CONTROL,false);
    probe.chars.clear();
    for(unsigned c:{1u,3u,22u,24u,26u,127u}) text(c);
    Require(probe.chars==std::vector<SexyChar>{1,3,22,24,26,127},"WM_CHAR filtered native control characters");
    manager.SetFocus(&edit);edit.SetText("before");text('x');
    Require(edit.mString=="x","Real edit fixture did not replace selection");
    Key(app,VK_CONTROL,true);Key(app,'Z',true);text(26);Key(app,'Z',false);Key(app,VK_CONTROL,false);
    Require(edit.mString=="before","Native WM_CHAR undo did not reach the real edit");
    ModernSmoke::Report("portable-win32-52-control-chords-real-edit-undo-no-clipboard",app);
    manager.SetFocus(&probe);
    unsigned printable=0;
    for(unsigned c=32;c<=126;++c) {
        const int physical=(c>='a' && c<='z')?int(c-'a'+'A'):
            (c>='A' && c<='Z') || (c>='0' && c<='9')?int(c):VK_OEM_1;
        probe.chars.clear();Key(app,physical,true);
        Require(probe.chars.empty(),"Physical keydown duplicated printable text");
        text(c);Key(app,physical,true,true);
        Require(probe.chars==std::vector<SexyChar>{static_cast<SexyChar>(c)},"Repeat synthesized printable text");
        text(c);Key(app,physical,false);
        Require(probe.chars==std::vector<SexyChar>(2,static_cast<SexyChar>(c)),"Native printable WM_CHAR differs");
        ++printable;
    }
    const std::array<std::pair<int,SexyChar>,16> keypad{{
        {VK_NUMPAD0,'0'},{VK_NUMPAD1,'1'},{VK_NUMPAD2,'2'},{VK_NUMPAD3,'3'},
        {VK_NUMPAD4,'4'},{VK_NUMPAD5,'5'},{VK_NUMPAD6,'6'},{VK_NUMPAD7,'7'},
        {VK_NUMPAD8,'8'},{VK_NUMPAD9,'9'},{VK_ADD,'+'},{VK_SUBTRACT,'-'},
        {VK_MULTIPLY,'*'},{VK_DIVIDE,'/'},{VK_DECIMAL,'.'},{VK_OEM_PLUS,'='}}};
    for(const auto& [key,c]:keypad) {
        probe.chars.clear();Key(app,key,true);
        Require(probe.chars.empty(),"Keypad keydown synthesized text");
        text(c);Key(app,key,false);
        Require(probe.chars==std::vector<SexyChar>{c},"Native keypad char differs");
    }
    manager.SetFocus(&edit);edit.SetText("");
    for(const auto& [key,c]:keypad){Key(app,key,true);text(c);Key(app,key,false);}
    Require(edit.mString=="0123456789+-*/.=","Real edit lost keypad text");
    manager.SetFocus(&probe);app.mNativeWheelRemainder=0;
    struct WheelCase {int xTicks,yTicks,emitted,remainderTicks;};
    const std::array<WheelCase,24> wheels{{
        {0,120,1,0},{0,-120,-1,0},{0,360,3,0},{0,-240,-2,0},{0,0,0,0},{120,0,0,0},
        {0,30,0,30},{0,30,0,60},{0,30,0,90},{0,30,1,0},
        {0,-30,0,-30},{0,-30,0,-60},{0,-30,0,-90},{0,-30,-1,0},
        {0,90,0,90},{0,-60,0,30},{0,-30,0,0},{0,300,2,60},{0,-60,0,0},
        {0,-300,-2,-60},{0,60,0,0},{0,2400,20,0},{0,-2400,-20,0},{-360,0,0,0}}};
    for(const auto& item:wheels) {
        probe.wheels.clear();
        Message(app,item.xTicks?WM_MOUSEHWHEEL:WM_MOUSEWHEEL,
            MAKEWPARAM(0,static_cast<WORD>(item.xTicks?item.xTicks:item.yTicks)));
        Require(probe.wheels==(item.emitted?std::vector<int>{item.emitted}:std::vector<int>{}) &&
            app.mNativeWheelRemainder==item.remainderTicks/double(WHEEL_DELTA),
            "Native wheel tick accumulation/horizontal filtering differs");
        log<<"wheel-x-ticks="<<item.xTicks<<" y-ticks="<<item.yTicks
            <<" emitted="<<item.emitted<<" remainder-ticks="<<item.remainderTicks<<" exact=1\n";
    }
    probe.wheels.clear();
    manager.SetFocus(nullptr);Message(app,WM_MOUSEWHEEL,MAKEWPARAM(0,120));
    Require(probe.wheels.empty(),"Unfocused probe received wheel input");
    log<<"chords="<<chords<<" printable="<<printable<<" keypad=16 wheel=24 exact=1\n";
    ModernSmoke::Report("portable-win32-95-printable-16-keypad-real-edit-24-wheel",app);
}

void ModernVulkanInputSmoke(LawnApp& app) {
    using namespace Sexy;
    Require(getenv("PVZ_MODERN_HIDDEN") && getenv("PVZ_MODERN_SMOKE") &&
        !IsWindowVisible(app.mHWnd),"Input probe is hidden-smoke only");
    auto& manager=*app.mWidgetManager;
    ProbeWidget widget(app);
    struct Restore {
        LawnApp& app;ProbeWidget& widget;Widget* focus;bool active,mouseIn,managerMouseIn;int x,y,cursor;
        ~Restore(){
            auto& manager=*app.mWidgetManager;
            manager.CancelMouseDownState();manager.RemoveWidget(&widget);manager.SetFocus(focus);
            manager.mLastMouseX=x;manager.mLastMouseY=y;manager.mMouseIn=managerMouseIn;
            app.mOverrideCursor=nullptr;app.mNativeLastClickTime.fill(-1000);
            app.NativeFocusChanged(active);app.mMouseIn=mouseIn;manager.mMouseIn=managerMouseIn;app.SetCursor(cursor);
        }
    } restore{app,widget,manager.mFocusWidget,app.mActive,app.mMouseIn,manager.mMouseIn,
        manager.mLastMouseX,manager.mLastMouseY,app.mCursorNum};
    manager.AddWidget(&widget);manager.BringToFront(&widget);
    manager.CancelMouseDownState();app.mNativeLastClickTime.fill(-1000);app.NativeMouseLeave();
    struct RestoreMouseSource {
        LawnApp& app;
        decltype(app.mNativeMousePositionForTest) previous;
        ~RestoreMouseSource() { app.mNativeMousePositionForTest=previous; }
    } restoreMouseSource{app,app.mNativeMousePositionForTest};
    app.mNativeMousePositionForTest=ReadFixtureMousePosition;
    const auto p=WindowPoint(app,400,300),q=WindowPoint(app,420,300),outside=WindowPoint(app,-10,-10);
    const double interval=GetDoubleClickTime()/2000.0;
    double time=100;
    auto button=[&](int b,bool down,const std::array<double,2>& point){
        app.NativeMouseButton(b,down,point[0],point[1],time);
    };
    app.mNativeResizePending=true;
    button(0,true,p);
    Require(!app.mNativeResizePending && widget.downs.size()==1 && widget.downs.back().count==1 &&
        widget.downs.back().x==350 && widget.downs.back().y==250,"First native click geometry differs");
    Require(app.mMouseIn && manager.mMouseIn && app.mNativeCursorIndex==1,"First click did not synchronize hover");
    button(0,false,p);time+=interval;button(0,true,p);
    Require(widget.downs.back().count==2,"Native left double-click count");
    button(0,false,p);time+=interval;button(0,true,p);
    Require(widget.downs.back().count==1,"Third press did not begin a new pair");
    button(0,false,p);time+=10;button(1,true,p);
    Require(widget.downs.back().count==-1,"Native right click sign");
    button(1,false,p);time+=interval;button(1,true,p);
    Require(widget.downs.back().count==-2,"Native right double-click sign");
    button(1,false,p);button(2,true,p);
    Require(widget.downs.back().count==3,"Native middle click encoding");button(2,false,p);
    const auto count=widget.downs.size();
    Message(app,WM_XBUTTONDOWN,MAKEWPARAM(0,XBUTTON1),MAKELPARAM(int(p[0]),int(p[1])));
    Message(app,WM_XBUTTONUP,MAKEWPARAM(0,XBUTTON1),MAKELPARAM(int(p[0]),int(p[1])));
    Require(widget.downs.size()==count,"Extra native mouse button became a left click");
    time+=10;button(0,true,p);app.NativeMouseMove(outside[0],outside[1]);
    Require(!widget.drags.empty() && widget.drags.back().x<0 && !app.mMouseIn && !manager.mMouseIn,
        "Captured native drag outside viewport differs");
    const auto ups=widget.ups.size();button(0,false,outside);
    Require(manager.mDownButtons==0 && manager.mActualDownButtons==0 && !widget.mIsDown &&
        widget.ups.size()==ups+1 && widget.ups.back().x==-50 && widget.ups.back().y==-50,
        "Outside release did not clamp and finish capture");
    const auto before=widget.downs.size();button(0,true,outside);
    Require(widget.downs.size()==before && manager.mDownButtons==0,"Outside press entered the game");
    RECT client{};Require(GetClientRect(app.mHWnd,&client)!=FALSE,"Cannot query native client");
    const std::array<double,2> offWindow{-1,(client.bottom-client.top)/2.0};
    app.NativeMouseMove(offWindow[0],offWindow[1]);button(0,true,offWindow);
    Require(!app.mMouseIn && !manager.mMouseIn && widget.downs.size()==before,"Off-window press entered canvas");
    app.NativeMouseMove(p[0],p[1]);
    for(auto pair:std::array<std::array<int,2>,10>{{{CURSOR_POINTER,0},{CURSOR_HAND,1},{CURSOR_TEXT,2},
        {CURSOR_DRAGGING,3},{CURSOR_SIZEALL,3},{CURSOR_CIRCLE_SLASH,4},{CURSOR_SIZEWE,5},
        {CURSOR_SIZENS,6},{CURSOR_SIZENESW,7},{CURSOR_SIZENWSE,8}}})
        CheckCursor(app,pair[0],pair[1],false);
    CheckCursor(app,CURSOR_WAIT,9,false);
    const auto cursors=app.mNativeCursors;
    for(int i=0;i<100;++i){CheckCursor(app,CURSOR_HAND,1,false);CheckCursor(app,CURSOR_NONE,0,true);}
    Require(cursors==app.mNativeCursors,"Native cursor handles were reallocated");
    CheckCursor(app,CURSOR_CUSTOM,0,true);app.NativeMouseLeave();
    Require(app.mSysCursor && app.mNativeAppliedCursor,"Hidden cursor leaked outside window");
    app.NativeMouseMove(p[0],p[1]);app.mOverrideCursor=app.mNativeCursors[1];
    CheckCursor(app,CURSOR_NONE,-2,false);
    Require(app.mNativeAppliedCursor==app.mOverrideCursor,"Native override precedence");
    app.mOverrideCursor=nullptr;CheckCursor(app,CURSOR_POINTER,0,false);
    time+=10;button(0,true,p);const auto beforeFocusUps=widget.ups.size();
    app.NativeFocusChanged(false);button(0,false,p);
    Require(manager.mDownButtons==0 && manager.mActualDownButtons==0 && !widget.mIsDown &&
        widget.ups.size()==beforeFocusUps && !app.mMouseIn && !manager.mMouseIn,"Focus loss left click activity");
    app.NativeFocusChanged(true);time+=interval;button(0,true,p);
    Require(widget.downs.back().count==1,"Focus loss did not reset click tracking");button(0,false,p);
    widget.moves.clear();
    for(unsigned frame=0;frame<100;++frame) {
        const auto& position=(frame&1)?p:q;
        fixtureMousePosition={LONG(position[0]),LONG(position[1])};
        const auto oldMoves=widget.moves.size();
        const auto queueSize=app.mDeferredMessages.size();
        for(unsigned report=0;report<10;++report) {
            SendMessageW(app.mHWnd,WM_MOUSEMOVE,0,MAKELPARAM(-100,-100));
            SendMessageW(app.mHWnd,WM_SETCURSOR,WPARAM(app.mHWnd),MAKELPARAM(HTCLIENT,WM_MOUSEMOVE));
        }
        Require(widget.moves.size()==oldMoves && app.mDeferredMessages.size()==queueSize,
            "Native motion/cursor message performed input work or entered deferred queue");
        app.SampleNativeMousePosition();
        Require(widget.moves.size()==oldMoves+1 &&
            manager.mLastMouseX==((frame&1)?400:420) && manager.mLastMouseY==300,"Heartbeat did not sample current position");
    }
    const auto buttonReads=fixtureMouseReads;
    for(const auto pair:std::array<std::array<UINT,2>,5>{{
        {WM_LBUTTONDOWN,WM_LBUTTONUP},{WM_RBUTTONDOWN,WM_RBUTTONUP},
        {WM_MBUTTONDOWN,WM_MBUTTONUP},{WM_LBUTTONDBLCLK,WM_LBUTTONUP},
        {WM_RBUTTONDBLCLK,WM_RBUTTONUP}}}) {
        const auto oldDowns=widget.downs.size(),oldUps=widget.ups.size();
        fixtureMousePosition={LONG(p[0]),LONG(p[1])};
        SendMessageW(app.mHWnd,pair[0],0,MAKELPARAM(int(q[0]),int(q[1])));
        fixtureMousePosition={LONG(q[0]),LONG(q[1])};
        SendMessageW(app.mHWnd,pair[1],0,MAKELPARAM(int(p[0]),int(p[1])));
        Require(widget.downs.size()==oldDowns && widget.ups.size()==oldUps,
            "Button event bypassed the ordered deferred queue");
        fixtureMousePosition={LONG(outside[0]),LONG(outside[1])};
        app.DrainWindowMessages();
        Require(widget.downs.size()==oldDowns+1 && widget.ups.size()==oldUps+1 &&
            widget.downs.back().x==370 && widget.ups.back().x==350 &&
            manager.mLastMouseX==400 && fixtureMouseReads==buttonReads,
            "Button message coordinates were replaced, reordered or sampled again");
    }
    fixtureMousePosition={LONG(outside[0]),LONG(outside[1])};
    app.SampleNativeMousePosition();
    Require(!app.mMouseIn && !manager.mMouseIn,"Heartbeat did not detect pointer leaving client");
    if(getenv("PVZ_INPUT_MOVE_PERF")) {
        std::array<double,21> immediate{},coalesced{};
        const auto measure=[&](bool queued){
            widget.moves.clear();const auto begin=std::chrono::steady_clock::now();
            for(unsigned report=0;report<1000;++report){
                const auto& position=(report&1)?p:q;
                if(queued) {
                    fixtureMousePosition={LONG(position[0]),LONG(position[1])};
                    SendMessageW(app.mHWnd,WM_MOUSEMOVE,0,MAKELPARAM(int(position[0]),int(position[1])));
                    SendMessageW(app.mHWnd,WM_SETCURSOR,WPARAM(app.mHWnd),MAKELPARAM(HTCLIENT,WM_MOUSEMOVE));
                    if(report%10==9) app.SampleNativeMousePosition();
                } else app.NativeMouseMove(position[0],position[1]);
            }
            return std::chrono::duration<double,std::micro>(std::chrono::steady_clock::now()-begin).count();
        };
        for(unsigned sample=0;sample<21;++sample){
            if(sample&1){coalesced[sample]=measure(true);immediate[sample]=measure(false);}
            else{immediate[sample]=measure(false);coalesced[sample]=measure(true);}
        }
        std::sort(immediate.begin(),immediate.end());std::sort(coalesced.begin(),coalesced.end());
        std::ofstream perf(ModernSmoke::ProbePath("win32-mouse-processing-perf.txt"));
        perf<<"reports=1000 samples=21 heartbeats=100 direct-median-us="<<immediate[10]
            <<" heartbeat-median-us="<<coalesced[10]<<'\n';
        std::ofstream paths(ModernSmoke::ProbePath("win32-mouse-native-paths.txt"));
        Require(bool(paths),"Cannot write native mouse dispatch evidence");
        const auto engineProc=reinterpret_cast<std::uintptr_t>(&SexyAppBase::WindowProc);
        const auto windowProc=GetWindowLongPtrA(app.mHWnd,GWLP_WNDPROC);
        const auto windowProcW=GetWindowLongPtrW(app.mHWnd,GWLP_WNDPROC);
        const auto classProc=GetClassLongPtrA(app.mHWnd,GCLP_WNDPROC);
        paths<<"engine_proc="<<engineProc<<" window_proc="<<windowProc
            <<" window_proc_w="<<windowProcW<<" class_proc="<<classProc
            <<" unicode="<<(IsWindowUnicode(app.mHWnd)!=FALSE)<<'\n';
        for(const auto address:{engineProc,std::uintptr_t(windowProc),std::uintptr_t(windowProcW),std::uintptr_t(classProc)}) {
            HMODULE module{};
            if(GetModuleHandleExA(GET_MODULE_HANDLE_EX_FLAG_FROM_ADDRESS |
                GET_MODULE_HANDLE_EX_FLAG_UNCHANGED_REFCOUNT,reinterpret_cast<LPCSTR>(address),&module)) {
                std::array<char,32768> name{};
                Require(GetModuleFileNameA(module,name.data(),DWORD(name.size()))!=0,
                    "Cannot resolve mouse procedure module path");
                paths<<"procedure="<<address<<" module="<<name.data()<<'\n';
            } else paths<<"procedure="<<address<<" module_error="<<GetLastError()<<'\n';
        }
        WNDPROC volatile directProc=&SexyAppBase::WindowProc;
        for(const auto message:{UINT(WM_MOUSEMOVE),UINT(WM_SETCURSOR)}) {
            std::array<double,21> sent{},direct{},chained{};
            const LPARAM detail=message==WM_SETCURSOR?MAKELPARAM(HTCLIENT,WM_MOUSEMOVE):MAKELPARAM(400,300);
            const WPARAM value=message==WM_SETCURSOR?WPARAM(app.mHWnd):0;
            const auto timePath=[&](unsigned path) {
                const auto begin=std::chrono::steady_clock::now();
                for(unsigned i=0;i<1000;++i) {
                    if(path==0) SendMessageW(app.mHWnd,message,value,detail);
                    else if(path==1) directProc(app.mHWnd,message,value,detail);
                    else CallWindowProcW(reinterpret_cast<WNDPROC>(windowProcW),app.mHWnd,message,value,detail);
                }
                return std::chrono::duration<double,std::micro>(std::chrono::steady_clock::now()-begin).count();
            };
            for(unsigned sample=0;sample<sent.size();++sample) {
                if(sample&1) {sent[sample]=timePath(0);direct[sample]=timePath(1);chained[sample]=timePath(2);}
                else {chained[sample]=timePath(2);direct[sample]=timePath(1);sent[sample]=timePath(0);}
            }
            std::sort(sent.begin(),sent.end());std::sort(direct.begin(),direct.end());std::sort(chained.begin(),chained.end());
            paths<<"message="<<message<<" reports=1000 samples=21 send_median_us="<<sent[10]
                <<" engine_entry_median_us="<<direct[10]<<" window_chain_median_us="<<chained[10]<<'\n';
        }
    }
    std::ofstream mouseLog(ModernSmoke::ProbePath("win32-mouse-coalescing.txt"));
    mouseLog<<"native-reports=1000 logical-updates=100 motion-discarded=1 setcursor-discarded=1 button-event-position=1 button-position-reads=0 heartbeat-leave=1\n";
    ModernSmoke::Report("portable-win32-1000-cursor-reports-100-updates-button-leave-order",app);
}
