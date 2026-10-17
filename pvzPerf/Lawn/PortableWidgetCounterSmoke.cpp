#include "PortableWidgetCounterSmoke.h"
#include "ModernVulkanSmoke.h"
#include "LawnApp.h"
#include "Widget/LawnDialog.h"
#include "Widget/GameButton.h"
#include "widget/WidgetManager.h"
#include "widget/DialogListener.h"
#include <algorithm>
#include <array>
#include <bit>
#include <cstdint>
#include <fstream>
#include <stdexcept>
#include <type_traits>

namespace {
void Require(bool value,const char* message){if(!value) throw std::runtime_error(message);}
struct ProbeWidget : Sexy::Widget {
    unsigned calls=0;
    void Update() override {Widget::Update();++calls;}
};
struct ProbeListener : Sexy::DialogListener {
    unsigned releases=0;
    void DialogButtonPress(int,int) override {}
    void DialogButtonDepress(int,int) override {++releases;}
};
struct ObservedButton final : Sexy::DialogButton {
    unsigned& resizes;
    unsigned& destroyed;
    ObservedButton(int id, Sexy::ButtonListener* listener, unsigned& calls, unsigned& deaths)
        : DialogButton(nullptr,id,listener),resizes(calls),destroyed(deaths) {}
    ~ObservedButton() override {++destroyed;}
    void Resize(int x,int y,int width,int height) override {
        ++resizes;
        Widget::Resize(x,y,width,height);
    }
};
struct DetachWidgets {
    Sexy::WidgetManager& manager;
    ~DetachWidgets(){manager.RemoveAllWidgets(false,true);}
};
void VerifyDialogButtons(LawnApp& app,std::ostream& log) {
    using namespace Sexy;
    for(int mode:{Dialog::BUTTONS_NONE,Dialog::BUTTONS_YES_NO,Dialog::BUTTONS_FOOTER}) {
        unsigned resizes=0,destroyed=0;
        const unsigned expected=mode==Dialog::BUTTONS_NONE?0:mode==Dialog::BUTTONS_FOOTER?1:2;
        {
            WidgetManager manager(&app);manager.mWidth=800;manager.mHeight=600;
            LawnDialog dialog(&app,DIALOG_PAUSED,false,("button ownership"),(""),("Close"),mode);
            if(dialog.mYesButton) {
                delete dialog.mYesButton;
                dialog.mYesButton=new ObservedButton(Dialog::ID_YES,&dialog,resizes,destroyed);
            }
            if(dialog.mNoButton) {
                delete dialog.mNoButton;
                dialog.mNoButton=new ObservedButton(Dialog::ID_NO,&dialog,resizes,destroyed);
            }
            dialog.Resize(dialog.mX,dialog.mY,dialog.mWidth,dialog.mHeight);
            resizes=0;
            DetachWidgets cleanup{manager};
            manager.AddWidget(&dialog);
            auto verify=[&] {
                Require(manager.mWidgets.size()==1 && manager.mWidgets.front()==&dialog,
                    "Lawn buttons were also registered as top-level widgets");
                Require(dialog.mWidgets.size()==expected+1,
                    "Lawn child buttons or animation were registered more than once");
                for(auto* button:{dialog.mYesButton,dialog.mNoButton}) if(button) {
                    Require(button->mParent==&dialog && button->mWidgetManager==&manager &&
                        std::count(dialog.mWidgets.begin(),dialog.mWidgets.end(),button)==1,
                        "Dialog button child registration is not unique");
                }
            };
            verify();
            const int yesX=dialog.mYesButton?dialog.mYesButton->mX:0;
            const int yesY=dialog.mYesButton?dialog.mYesButton->mY:0;
            const int noX=dialog.mNoButton?dialog.mNoButton->mX:0;
            const int noY=dialog.mNoButton?dialog.mNoButton->mY:0;
            dialog.Resize(111,73,dialog.mWidth,dialog.mHeight);
            Require(resizes==expected,"Lawn buttons passed through both classic and local layouts");
            Require((!dialog.mYesButton || (dialog.mYesButton->mX==yesX && dialog.mYesButton->mY==yesY)) &&
                (!dialog.mNoButton || (dialog.mNoButton->mX==noX && dialog.mNoButton->mY==noY)),
                "Moving a Lawn dialog changed child-local button coordinates");
            manager.BringToFront(&dialog);verify();
            manager.RemoveWidget(&dialog);
            Require(manager.mWidgets.empty() && dialog.mWidgets.empty(),
                "Dialog removal retained registered child buttons");
            manager.AddWidget(&dialog);verify();
        }
        Require(destroyed==expected,"Dialog buttons were not destroyed exactly once");
        log<<"shared-buttons mode="<<mode<<" layout-calls="<<resizes
           <<" destroyed="<<destroyed<<" expected="<<expected<<std::endl;
    }
    {
        WidgetManager manager(&app);manager.mWidth=800;manager.mHeight=600;
        Dialog dialog(nullptr,nullptr,0,false,("classic"),(""),(""),Dialog::BUTTONS_YES_NO);
        DetachWidgets cleanup{manager};
        dialog.Resize(45,60,300,180);
        manager.AddWidget(&dialog);
        Require(manager.mWidgets.size()==3 && dialog.mWidgets.empty() &&
            dialog.mYesButton->mParent==&manager && dialog.mNoButton->mParent==&manager,
            "Classic dialog top-level button registration changed");
        log<<"classic-buttons top-level=2 child-buttons=0"<<std::endl;
    }
}
}

void PortableWidgetCounterSmoke(LawnApp& app) {
    std::ofstream log(ModernSmoke::ProbePath("widget-counter-boundaries.txt"));
    Require(bool(log),"Cannot write widget counter evidence");
    Sexy::WidgetManager manager(&app);
    ProbeWidget parent,child;
    struct RemoveChildren {
        Sexy::WidgetManager& manager;
        ~RemoveChildren(){manager.RemoveAllWidgets(false,true);}
    } cleanup{manager};
    manager.AddWidget(&parent);parent.AddWidget(&child);
    // Never execute the old signed ++ at INT_MAX just to make a red test:
    // that is UB. Prove the old type mismatch separately, and exercise wrap
    // only when the actual production fields have defined unsigned semantics.
    constexpr bool unsignedCounters=std::is_same_v<decltype(manager.mUpdateCnt),std::uint32_t> &&
        std::is_same_v<decltype(parent.mUpdateCnt),std::uint32_t> &&
        std::is_same_v<decltype(manager.mLastWMUpdateCount),std::uint32_t> &&
        std::is_same_v<decltype(manager.mLastInputUpdateCnt),std::uint32_t>;
    bool counters=unsignedCounters;
    log<<"fixed-width-unsigned-counters="<<unsignedCounters<<std::endl;
    if constexpr(unsignedCounters) {
        counters &= manager.mLastInputUpdateCnt==0;
        manager.mLastMouseX=0;manager.mLastMouseY=0;
        for(std::uint32_t start:{0x7ffffffeU,0xfffffffeU}) {
            manager.mUpdateCnt=start;parent.mUpdateCnt=start;child.mUpdateCnt=start;
            manager.mLastWMUpdateCount=start;parent.mLastWMUpdateCount=start;child.mLastWMUpdateCount=start;
            parent.calls=0;child.calls=0;
            for(unsigned tick=1;tick<=3;++tick) {
                const std::uint32_t expected=start+tick;
                manager.UpdateFrame();
                Sexy::ModalFlags flags;manager.InitModalFlags(&flags);
                parent.UpdateAll(&flags); // Same manager tick must not update twice.
                manager.MouseMove(1,2);
                const bool correct=manager.mUpdateCnt==expected && parent.mUpdateCnt==expected &&
                    child.mUpdateCnt==expected && parent.mLastWMUpdateCount==expected &&
                    child.mLastWMUpdateCount==expected && manager.mLastInputUpdateCnt==expected &&
                    parent.calls==tick && child.calls==tick;
                log<<"start="<<start<<" tick="<<tick<<" expected="<<expected
                    <<" parent-calls="<<parent.calls<<" child-calls="<<child.calls
                    <<" correct="<<correct<<std::endl;
                counters &= correct;
            }
        }
    }
    ProbeListener listener;
    LawnDialog dialog(&app,DIALOG_PAUSED,false,("counter probe"),(""),(""),Sexy::Dialog::BUTTONS_YES_NO);
    dialog.mDialogListener=&listener;
    bool buttons=true;
    struct ButtonCase {std::uint32_t count;int delay;bool accepted;};
    for(const auto& test:std::to_array<ButtonCase>({
        ButtonCase{0,-1,true},{0,-7,true},{0,0,false},{1,0,true},
        {29,30,false},{30,30,false},{31,30,true},
        {0x7fffffffU,30,true},{0x80000000U,30,true},{0xffffffffU,30,true},
        {0x80000000U,-1,true},{0xffffffffU,-1,true}})) {
        // Signed old fields receive the original bit pattern without a
        // signed-overflow operation; the real ButtonDepress comparison runs.
        dialog.mUpdateCnt=std::bit_cast<decltype(dialog.mUpdateCnt)>(test.count);
        dialog.mButtonDelay=test.delay;
        const unsigned before=listener.releases;
        dialog.ButtonDepress(Sexy::Dialog::ID_YES);
        const bool accepted=listener.releases==before+1;
        log<<"button count="<<test.count<<" delay="<<test.delay<<" expected="<<test.accepted
            <<" accepted="<<accepted<<std::endl;
        buttons &= accepted==test.accepted;
    }
    // 1073 Update (0x45ABA0) enables buttons when widget age reaches the
    // threshold; the field is not a separately decremented countdown.
    dialog.mUpdateCnt=0;dialog.SetButtonDelay(30);
    bool delayed=true;
    for(unsigned tick=1;tick<=31;++tick) {
        dialog.Update();
        const bool enabled=!dialog.mYesButton->mDisabled && !dialog.mNoButton->mDisabled;
        delayed &= enabled==(tick>=30);
        const unsigned before=listener.releases;
        dialog.ButtonDepress(Sexy::Dialog::ID_YES);
        delayed &= (listener.releases==before+1)==(tick>30);
        if(tick>=29) log<<"delay tick="<<tick<<" enabled="<<enabled<<" accepted="
            <<(listener.releases==before+1)<<std::endl;
    }
    Require(counters,"Widget counters must be unsigned32 and update once across INT_MAX/UINT_MAX");
    Require(buttons,"Dialog button age comparison blocks after INT_MAX or loses negative-delay semantics");
    Require(delayed,"Delayed dialog buttons do not enable at the original threshold");
    VerifyDialogButtons(app,log);
    ModernSmoke::Report("portable-dialog-shared-buttons-local-layout-readd-and-single-destruction",app);
    ModernSmoke::Report("portable-widget-counters-wrap-dialog-delay-and-input-stamp",app);
}
