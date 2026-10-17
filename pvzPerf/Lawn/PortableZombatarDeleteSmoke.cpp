#include "Sexy.TodLib/generated/EntityStrings.h"
#include "PortableZombatarDeleteSmoke.h"
#include "ModernVulkanSmoke.h"
#include "LawnApp.h"
#include "Widget/GameSelector.h"
#include "Widget/ZombatarScreen.h"
#include "Widget/ZombatarItems.h"
#include "Sexy.TodLib/EffectSystem.h"
#include "Sexy.TodLib/TodStringFile.h"
#include "widget/WidgetManager.h"
#include "widget/WidgetLifetimeHold.h"
#include <array>
#include <cstring>
#include <fstream>
#include <memory>
#include <optional>
#include <stdexcept>
#include <vector>

namespace {
using namespace ModernSmoke;
void Require(bool ok,const char* why) { if(!ok) throw std::runtime_error(why); }
struct AppAccess : LawnApp { static constexpr auto Cleanup=&AppAccess::ProcessSafeDeleteList; };
using Records=std::vector<Zombatar>;
Records ReadRecords(const PlayerInfo& player) { return {player.mZombatars,player.mZombatars+player.mNumZombatars}; }
bool Equal(const Records& a,const Records& b) {
    return a.size()==b.size() && (a.empty() || !std::memcmp(a.data(),b.data(),a.size()*sizeof(Zombatar)));
}
void Fill(PlayerInfo& player,int id,int count) {
    player.mId=id;player.mName="Delete fixture "+std::to_string(id);player.mUseSeq=1;
    player.mFinishedAdventure=1;player.mLevel=23;player.mNumZombatars=count;
    for(int i=0;i<count;++i) {
        auto& z=player.mZombatars[i];
        std::fill(std::begin(z.mItems),std::end(z.mItems),-1);
        std::fill(std::begin(z.mColors),std::end(z.mColors),-1);
        z.mColors[ZOMBATAR_CUSTOM_SKIN]=i%12;
        z.mItems[ZOMBATAR_CUSTOM_BACKDROPS]=i%5;
        z.mColors[ZOMBATAR_CUSTOM_BACKDROPS]=47;
    }
    player.SaveDetails();
}
class ObservedSelector final:public GameSelector {
    bool& dead;
public:
    ObservedSelector(LawnApp& app,bool& flag):GameSelector(&app),dead(flag){}
    ~ObservedSelector() override { dead=true; }
};
ObservedSelector* Open(LawnApp& app,bool& dead) {
    Require(!app.mGameSelector,"Delete fixture has a live selector");
    auto* selector=new ObservedSelector(app,dead);app.mGameSelector=selector;
    app.mGameScene=SCENE_MENU;selector->Resize(0,0,2400,3000);
    app.mWidgetManager->AddWidget(selector);selector->SetVisible(false);
    selector->ShowZombatarScreen();
    return selector;
}
void ClickDelete(ZombatarItems& items) {
    const int x=items.mDeleteRect.mX+items.mDeleteRect.mWidth/2;
    const int y=items.mDeleteRect.mY+items.mDeleteRect.mHeight/2;
    items.MouseDown(x,y,0,1);items.MouseUp(x,y,0,1);
}
enum class Action { None, Selection, Menu, AwayBack, Edit, Profile, ProfileReload, ProfileReuse,
    ReplaceRecord, Append, Shift, OtherRecord, OwnerGone, OwnerReplacement, ProfileDestroy, SameId };
struct Case { const char* name; Action action; int result=Dialog::ID_YES; int count=3,index=1; };
constexpr std::array cases{
    Case{"no",Action::None,Dialog::ID_NO}, Case{"cancel",Action::None,0},
    Case{"delete-first",Action::None,Dialog::ID_YES,3,0},
    Case{"delete-middle",Action::None},Case{"delete-last",Action::None,Dialog::ID_YES,3,2},
    Case{"delete-only",Action::None,Dialog::ID_YES,1,0},
    Case{"delete-full-list",Action::None,Dialog::ID_YES,100,50},
    Case{"selection-changed",Action::Selection},Case{"return-menu",Action::Menu},
    Case{"leave-return-same-index",Action::AwayBack,Dialog::ID_YES,3,0},
    Case{"new-draft",Action::Edit},Case{"switch-profile",Action::Profile},
    Case{"reload-profile",Action::ProfileReload},Case{"same-address-new-profile",Action::ProfileReuse},
    Case{"replace-record",Action::ReplaceRecord},Case{"append-record",Action::Append},
    Case{"shift-list",Action::Shift},Case{"change-other-record",Action::OtherRecord},
    Case{"owner-removed",Action::OwnerGone},Case{"owner-replaced",Action::OwnerReplacement},
    Case{"destroy-profile",Action::ProfileDestroy},Case{"stale-yes-new-dialog",Action::SameId},
    Case{"stale-no-new-dialog",Action::SameId,Dialog::ID_NO}};

class Reply final:public Widget {
    LawnApp& app; ObservedSelector& owner; ZombatarItems& items; const Case& test;
    std::optional<PlayerInfo>& first; PlayerInfo& second; bool& returned; bool& ownerDead; bool& newOwnerDead;
    unsigned ticks=0;
public:
    bool acted=false,nonblocking=false,nonmodal=false,originalUi=false;
    std::unique_ptr<WidgetLifetimeHold> emergency;
    Records expectedA,expectedB;
    Reply(LawnApp& a,ObservedSelector& s,const Case& c,std::optional<PlayerInfo>& p,PlayerInfo& q,
          bool& wasReturned,bool& dead,bool& newDead)
        :app(a),owner(s),items(*s.mZombatarScreen->mZombatarItems),test(c),first(p),second(q),
          returned(wasReturned),ownerDead(dead),newOwnerDead(newDead) {
        mMouseVisible=false;mWidgetFlagsMod.mAddFlags=WIDGETFLAGS_UPDATE;app.mWidgetManager->AddWidget(this);
    }
    ~Reply() override { if(mWidgetManager)mWidgetManager->RemoveWidget(this); }
    void Update() override {
        if(acted)return;
        Require(++ticks<500,"Delete responder timed out");
        if(app.GetDialog(DIALOG_DELETEZOMBATAR)) Act();
    }
    void Act() {
        auto* dialog=dynamic_cast<LawnDialog*>(app.GetDialog(DIALOG_DELETEZOMBATAR));
        Require(dialog && !acted,"Delete confirmation was not created");
        if(dialog->mButtonDelay>=0 && dialog->mUpdateCnt<=unsigned(dialog->mButtonDelay)) return;
        acted=true;nonblocking=returned;nonmodal=!dialog->mIsModal;
        originalUi=dialog->mDialogHeader==EntityTranslate(gStr.ZOMBATAR_DELETE_HEADER) &&
            dialog->mDialogLines==EntityTranslate(gStr.ZOMBATAR_DELETE_BODY) &&
            dialog->mYesButton->mLabel==EntityTranslate(gStr.ZOMBATAR_DELETE_BUTTON) &&
            dialog->mNoButton->mLabel==("Cancel");
        if(returned && test.action==Action::None && test.result==Dialog::ID_NO) {
            Require(app.mWidgetManager->DrawScreen(),"Real deletion dialog did not draw");
            Capture("zombatar-delete-original-dialog",app,24);
        }
        // The old nested-wait implementation must not cause a deliberate UAF
        // in a negative test. Only that implementation needs this rescue.
        if(!returned) emergency=std::make_unique<WidgetLifetimeHold>(owner);
        WidgetLifetimeHold oldDialog(*dialog);
        const Records originalProfile=ReadRecords(*first);
        Dialog* successor=nullptr;
        switch(test.action) {
        case Action::None:break;
        case Action::Selection:items.ButtonDepress(ZombatarItems::BUTTON_NEXT_ZOMBIE);break;
        case Action::Menu:items.ButtonDepress(ZombatarItems::BUTTON_MAIN_MENU);break;
        case Action::AwayBack:
            items.ButtonDepress(ZombatarItems::BUTTON_MAIN_MENU);owner.ShowZombatarScreen();break;
        case Action::Edit:items.ButtonDepress(ZombatarItems::BUTTON_NEW_ZOMBIE);break;
        case Action::Profile:app.mPlayerInfo=&second;break;
        case Action::ProfileReload:Require(first->LoadDetails(),"Cannot reload fixture profile");++first->mUseSeq;break;
        case Action::ProfileReuse:
            first.reset();first.emplace();Fill(*first,910003,3);app.mPlayerInfo=&*first;break;
        case Action::ProfileDestroy:
            app.mPlayerInfo=&second;
            if(returned)first.reset(); // Never deliberately free the old nested-wait fixture's borrow.
            break;
        case Action::SameId:
            items.ButtonDepress(ZombatarItems::BUTTON_NEXT_ZOMBIE);
            if(returned) {
                ClickDelete(items);successor=app.GetDialog(DIALOG_DELETEZOMBATAR);
                Require(successor && successor!=dialog,"Cannot create a replacement confirmation");
            }
            break;
        case Action::ReplaceRecord:first->mZombatars[test.index].mColors[ZOMBATAR_CUSTOM_SKIN]=8;break;
        case Action::Append:first->mZombatars[first->mNumZombatars++]=first->mZombatars[0];break;
        case Action::Shift:{int index=0;first->DeleteZombatarFromIndex(&index);break;}
        case Action::OtherRecord:first->mZombatars[0].mColors[ZOMBATAR_CUSTOM_SKIN]=8;break;
        case Action::OwnerGone:app.KillGameSelector();break;
        case Action::OwnerReplacement:app.KillGameSelector();Open(app,newOwnerDead);break;
        }
        if(first)first->SaveDetails();second.SaveDetails();
        expectedA=first?ReadRecords(*first):originalProfile;expectedB=ReadRecords(second);
        if(test.action==Action::None && test.result==Dialog::ID_YES) expectedA.erase(expectedA.begin()+test.index);
        (app.*AppAccess::Cleanup)();
        if(!returned) Require(!ownerDead,"Negative fixture failed to retain the nested caller");
        if(test.result) dialog->ButtonDepress(test.result);
        else app.KillDialog(DIALOG_DELETEZOMBATAR);
        if(successor) {
            Require(app.GetDialog(DIALOG_DELETEZOMBATAR)==successor &&
                Equal(ReadRecords(*first),expectedA),"A stale dialog callback affected its same-ID successor");
            successor->ButtonDepress(Dialog::ID_NO);
        }
    }
};
}

void PortableZombatarDeleteSmoke(LawnApp& app) {
    Require(getenv("PVZ_APPDATA_DIR") && app.mNoSoundNeeded && !app.mUpdateAppDepth,
        "Delete fixture must be isolated and outside nested updates");
    app.KillBoard();app.KillGameSelector();(app.*AppAccess::Cleanup)();
    struct RestoreUser { LawnApp& app;PlayerInfo* original;~RestoreUser(){app.mPlayerInfo=original;} } restore{app,app.mPlayerInfo};
    std::ofstream log(ProbePath("zombatar-delete-lifecycle.txt"));Require(bool(log),"Cannot write delete evidence");
    unsigned failures=0;
    for(const auto& test:cases) {
        std::optional<PlayerInfo> first{std::in_place};PlayerInfo second;
        Fill(*first,910001,test.count);Fill(second,910002,3);app.mPlayerInfo=&*first;
        bool dead=false,newDead=false,returned=false;
        auto* owner=Open(app,dead);auto* items=owner->mZombatarScreen->mZombatarItems;
        items->mSelectedZombatar=test.index;items->RefreshState();
        Reply reply(app,*owner,test,first,second,returned,dead,newDead);
        ClickDelete(*items);returned=true;
        if(!reply.acted) reply.Act();
        Require(reply.acted,"Delete confirmation button was not exercised");
        bool state=(!first || Equal(ReadRecords(*first),reply.expectedA))&&Equal(ReadRecords(second),reply.expectedB);
        if(test.action==Action::None && test.result==Dialog::ID_YES)
            state &= !dead && items->mSelectedZombatar==std::max(test.index-1,0) &&
                items->mState==(reply.expectedA.empty()?ZombatarEditorState::EDITING:ZombatarEditorState::BROWSING);
        PlayerInfo diskA,diskB;diskA.mId=first?first->mId:910001;diskB.mId=second.mId;
        bool disk=diskA.LoadDetails()&&diskB.LoadDetails()&&Equal(ReadRecords(diskA),reply.expectedA)&&
            Equal(ReadRecords(diskB),reply.expectedB);
        bool ok=reply.nonblocking&&reply.nonmodal&&reply.originalUi&&state&&disk&&!app.GetDialog(DIALOG_DELETEZOMBATAR);
        log<<test.name<<" nonblocking="<<reply.nonblocking<<" nonmodal="<<reply.nonmodal
            <<" original-ui="<<reply.originalUi<<" state="<<state<<" disk="<<disk<<" pass="<<ok<<std::endl;
        failures+=!ok;
        reply.emergency.reset();app.KillGameSelector();(app.*AppAccess::Cleanup)();
        Require(dead && (test.action!=Action::OwnerReplacement || newDead),"Delete fixture retained an owned subtree");
        app.mEffectSystem->EffectSystemFreeAll();app.mPlayerInfo=restore.original;
    }
    log<<"cases="<<cases.size()<<" failures="<<failures<<" exports=0"<<std::endl;
    Require(!failures,"Zombatar delete differs from original callback semantics or affects a changed target");
    Report("portable-zombatar-23-delete-callback-profile-list-lifecycles",app);
}
