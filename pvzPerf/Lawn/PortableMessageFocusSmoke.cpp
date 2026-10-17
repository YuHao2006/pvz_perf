#include "PortableMessageFocusSmoke.h"
#include "ModernVulkanSmoke.h"
#include "LawnApp.h"
#include "Board.h"
#include "Widget/LawnDialog.h"
#include "widget/WidgetManager.h"
#include <array>
#include <fstream>
#include <memory>
#include <stdexcept>

namespace {
using namespace ModernSmoke;
void Require(bool value, const char* why) { if (!value) throw std::runtime_error(why); }
struct AppAccess : LawnApp { static constexpr auto Cleanup = &AppAccess::ProcessSafeDeleteList; };
constexpr int boxId = DIALOG_MESSAGE, successorId = 8121;
class FocusProbe final : public Widget {
public:
    unsigned keys = 0;
    FocusProbe() { mMouseVisible = false; mWantsFocus = true; Resize(0,0,1,1); }
    void KeyChar(SexyChar) override { ++keys; }
};
class Successor final : public LawnDialog {
    bool& dead;
    unsigned& keys;
public:
    Successor(LawnApp& app, int id, bool& destroyed, unsigned& keyCount)
        : LawnDialog(&app,id,true,("Focus successor"),("Isolated probe"),(""),BUTTONS_YES_NO), dead(destroyed), keys(keyCount) {}
    ~Successor() override { dead = true; }
    void KeyChar(SexyChar) override { ++keys; }
};
enum class Action { Yes, No, Kill, Remove, After, Before, RemoveBefore, SameAfter, SameBefore, Destroy };
struct Case { const char* name; bool focus, child; Action action; };
constexpr std::array cases{
    Case{"root-yes",true,false,Action::Yes}, Case{"root-no",true,false,Action::No},
    Case{"root-cancel",true,false,Action::Kill}, Case{"child-yes",true,true,Action::Yes},
    Case{"remove-root",true,false,Action::Remove}, Case{"remove-parent",true,true,Action::Remove},
    Case{"successor-after",true,false,Action::After}, Case{"successor-before",true,false,Action::Before},
    Case{"null-successor-after",false,false,Action::After}, Case{"null-successor-before",false,false,Action::Before},
    Case{"null-yes",false,false,Action::Yes}, Case{"remove-child-successor-before",true,true,Action::RemoveBefore},
    Case{"same-id-after",true,false,Action::SameAfter}, Case{"same-id-before",true,true,Action::SameBefore},
    Case{"destroy-root",true,false,Action::Destroy}, Case{"destroy-child-through-parent",true,true,Action::Destroy}};

class Reply final : public Widget {
    LawnApp& app; const Case& test; std::unique_ptr<FocusProbe>& old; Widget& parent; Widget& replacement;
    bool& successorDead; unsigned& successorKeys;
    unsigned ticks = 0;
    void RemoveOld() {
        if (test.child) app.mWidgetManager->RemoveWidget(&parent);
        else app.mWidgetManager->RemoveWidget(old.get());
        app.mWidgetManager->SetFocus(&replacement);
    }
    void NewModal(bool sameId) {
        const int id = sameId ? boxId : successorId;
        app.KillDialog(id);
        successor = new Successor(app,id,successorDead,successorKeys);
        app.CenterDialog(successor,successor->mWidth,successor->mHeight);
        app.AddDialog(id,successor); app.mWidgetManager->SetFocus(successor);
    }
public:
    bool answered = false;
    Successor* successor = nullptr;
    Reply(LawnApp& a,const Case& c,std::unique_ptr<FocusProbe>& o,Widget& p,Widget& r,bool& dead,unsigned& keys)
        : app(a), test(c), old(o), parent(p), replacement(r), successorDead(dead), successorKeys(keys) {
        mMouseVisible = false; mWidgetFlagsMod.mAddFlags = WIDGETFLAGS_UPDATE; app.mWidgetManager->AddWidget(this);
    }
    ~Reply() override { if(mWidgetManager) mWidgetManager->RemoveWidget(this); }
    void Update() override {
        if (answered) return;
        Require(++ticks < 500,"Message focus responder timed out");
        auto* dialog = dynamic_cast<LawnDialog*>(app.GetDialog(boxId));
        if (!dialog || (dialog->mButtonDelay >= 0 && dialog->mUpdateCnt <= unsigned(dialog->mButtonDelay))) return;
        answered = true;
        if (test.action == Action::Remove || test.action == Action::RemoveBefore || test.action == Action::Destroy) RemoveOld();
        if (test.action == Action::Destroy) {
            if (test.child) { old.release(); parent.RemoveAllWidgets(true); }
            else old.reset();
        }
        if (test.action == Action::Before || test.action == Action::RemoveBefore) NewModal(false);
        if (test.action == Action::SameBefore) {
            NewModal(true); // original was cancelled by replacement
            Require(!app.SexyAppBase::KillDialog(dialog) && app.GetDialog(boxId) == successor,
                "Closing an old live instance by pointer closed its same-ID successor");
            return;
        }
        if (test.action == Action::Kill) app.KillDialog(boxId);
        else dialog->ButtonDepress(test.action == Action::No ? Dialog::ID_NO : Dialog::ID_YES);
        if (test.action == Action::After || test.action == Action::SameAfter) NewModal(test.action == Action::SameAfter);
    }
};
}

void PortableMessageFocusSmoke(LawnApp& app) {
    Require(app.mBoard && app.mDialogMap.empty() && app.mUpdateAppDepth == 0 && getenv("PVZ_APPDATA_DIR"),
        "Message focus suite requires a live isolated board and an unwound modal stack");
    auto& manager = *app.mWidgetManager;
    const auto modalCount = manager.mPreModalInfoList.size();
    std::ofstream log(ProbePath("message-focus-cases.txt")); Require(bool(log),"Cannot write message focus evidence");
    bool all = true;
    for (const auto& test : cases) {
        auto old = std::make_unique<FocusProbe>(); FocusProbe replacement; Widget parent;
        parent.mMouseVisible = false;
        if(test.child) { manager.AddWidget(&parent); parent.AddWidget(old.get()); }
        else manager.AddWidget(old.get());
        manager.AddWidget(&replacement); manager.SetFocus(test.focus ? old.get() : nullptr);
        bool successorDead = false; unsigned successorKeys = 0;
        {
            Reply reply(app,test,old,parent,replacement,successorDead,successorKeys);
            const int result = app.LawnMessageBox(boxId,("Focus probe"),("Isolated message"),("Yes"),("No"),Dialog::BUTTONS_YES_NO);
            const bool cancelled = test.action == Action::Kill || test.action == Action::SameBefore;
            const int expectedResult = cancelled ? 0 : test.action == Action::No ? Dialog::ID_NO : Dialog::ID_YES;
            Widget* expected = reply.successor ? static_cast<Widget*>(reply.successor) :
                (test.action == Action::Remove || test.action == Action::Destroy) ? &replacement : test.focus ? old.get() : nullptr;
            const int nextId = (test.action == Action::SameAfter || test.action == Action::SameBefore) ? boxId : successorId;
            bool ok = reply.answered && result == expectedResult && manager.mFocusWidget == expected;
            if(reply.successor) ok &= !successorDead && app.GetDialog(nextId) == reply.successor && manager.mBaseModalWidget == reply.successor;
            else ok &= !app.GetDialog(boxId) && !manager.mBaseModalWidget;
            if(ok && expected) {
                manager.KeyChar('k');
                ok &= reply.successor ? successorKeys == 1 : expected == old.get() ? old->keys == 1 : replacement.keys == 1;
            }
            log << test.name << " result=" << result << " expected-result=" << expectedResult
                << " focus-match=" << (manager.mFocusWidget == expected) << " successor-dead=" << successorDead
                << " successor-still-registered=" << (reply.successor && app.GetDialog(nextId) == reply.successor)
                << " old-destroyed=" << !old
                << " pass=" << ok << std::endl;
            all &= ok;
            if(reply.successor) app.KillDialog(nextId);
            app.KillDialog(boxId); app.KillDialog(successorId); (app.*AppAccess::Cleanup)();
            Require(!reply.successor || successorDead,"Successor dialog was not eventually reclaimed");
        }
        if(old && old->mParent) old->mParent->RemoveWidget(old.get());
        if(parent.mParent) parent.mParent->RemoveWidget(&parent);
        if(replacement.mParent) replacement.mParent->RemoveWidget(&replacement);
        Require(app.mDialogMap.empty() && manager.mPreModalInfoList.size() == modalCount,"Message fixture leaked a modal entry");
        manager.SetFocus(app.mBoard);
    }
    log << "message-focus-cases=" << cases.size() << " pass=" << all << std::endl;
    Require(all,"Message box restored a removed focus, stole a successor focus or closed a new same-ID dialog");
    Report("portable-message-16-focus-lifecycle-and-same-id-cases",app);
}
