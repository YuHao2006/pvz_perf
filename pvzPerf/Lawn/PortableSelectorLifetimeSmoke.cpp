#include "PortableSelectorLifetimeSmoke.h"
#include "LawnCommon.h"
#include "ModernVulkanSmoke.h"
#include "LawnApp.h"
#include "Board.h"
#include "System/Music.h"
#include "System/SaveGame.h"
#include "Widget/GameSelector.h"
#include "Widget/StoreScreen.h"
#include "Widget/LawnDialog.h"
#include "Sexy.TodLib/Reanimator.h"
#include "widget/WidgetManager.h"
#include "widget/WidgetLifetimeHold.h"
#include <fstream>
#include <memory>
#include <optional>
#include <stdexcept>

namespace {
using namespace ModernSmoke;
void Require(bool ok,const char* why){if(!ok)throw std::runtime_error(why);}
struct AppAccess:LawnApp{static constexpr auto Cleanup=&AppAccess::ProcessSafeDeleteList;};
class ObservedSelector final:public GameSelector {
    bool& dead;
public:
    ObservedSelector(LawnApp& app,bool& flag):GameSelector(&app),dead(flag){}
    ~ObservedSelector()override{dead=true;}
};
void Init(PlayerInfo& p,int id,int level=30){
    p.mId=id;p.mUseSeq=1;p.mName="Selector fixture "+std::to_string(id);
    p.mLevel=level;p.mFinishedAdventure=0;p.mCoins=5000;
    p.mPurchases[STORE_ITEM_TREE_OF_WISDOM]=1;p.SaveDetails();
}
ObservedSelector* Open(LawnApp& app,bool& dead){
    app.KillGameSelector();app.KillBoard();app.KillChallengeScreen();(app.*AppAccess::Cleanup)();
    app.mGameScene=SCENE_MENU;app.mGameMode=GAMEMODE_ADVENTURE;
    auto* selector=new ObservedSelector(app,dead);app.mGameSelector=selector;
    selector->Resize(0,0,2400,3000);app.mWidgetManager->AddWidget(selector);selector->SetVisible(false);
    // Invoke exactly one tested callback/update; nested waits still update
    // their real child dialogs without advancing this fixture's intro.
    selector->mWidgetFlagsMod.mRemoveFlags|=WIDGETFLAGS_UPDATE;
    selector->mSelectorState=SELECTOR_IDLE;
    return selector;
}
enum class Path{Store,Almanac,Replay,Complete,Taco};
enum class Change{Back,Cancel,Removed,Replaced,Board,Profile,Reuse,Epoch,Sync,Reenter,Detach,SyncLoading,Throw};
struct Case{Path path;Change change;bool tree=false;};
class Reply final:public Widget{
    LawnApp& app;ObservedSelector& caller;bool& dead;bool& newDead;
    std::optional<PlayerInfo>& a;PlayerInfo& b;Case test;unsigned ticks=0;
public:
    bool acted=false,held=false,reentrySafe=true,ownerClosedChild=true;
    std::unique_ptr<WidgetLifetimeHold> emergency;
    Board* replacementBoard=nullptr;GameSelector* replacementSelector=nullptr;
    Reply(LawnApp& x,ObservedSelector& c,bool& d,bool& nd,std::optional<PlayerInfo>& p,PlayerInfo& q,Case value)
      :app(x),caller(c),dead(d),newDead(nd),a(p),b(q),test(value){
        mMouseVisible=false;mWidgetFlagsMod.mAddFlags=WIDGETFLAGS_UPDATE;app.mWidgetManager->AddWidget(this);
    }
    ~Reply()override{if(mWidgetManager)mWidgetManager->RemoveWidget(this);}
    void Update()override{
        if(acted)return;
        Require(++ticks<700,"Selector responder timed out");
        const int id=test.path==Path::Store||test.path==Path::Taco?DIALOG_STORE:
            test.path==Path::Almanac?DIALOG_ALMANAC:DIALOG_MESSAGE;
        auto* dialog=app.GetDialog(id);if(!dialog)return;
        if(auto* lawn=dynamic_cast<LawnDialog*>(dialog);lawn&&lawn->mButtonDelay>=0&&lawn->mUpdateCnt<=unsigned(lawn->mButtonDelay))return;
        acted=true;held=caller.mDeferredDeleteHolds>0;
        if(!held)emergency=std::make_unique<WidgetLifetimeHold>(caller);
        WidgetLifetimeHold child(*dialog);
        if(test.change==Change::Throw)throw std::runtime_error("Expected selector callback unwind");
        if(test.change==Change::Detach){
            app.KillGameSelector();
            ownerClosedChild=app.GetDialog(id)!=dialog&&app.mWidgetManager->mFocusWidget!=&caller;
        }
        if(test.change==Change::Reenter){
            caller.ButtonDepress(caller.mAdventureButton->mId);
            reentrySafe=!caller.mStartingGame;
        }
        if(app.GetDialog(id)!=dialog){}
        else if(id==DIALOG_STORE){
            auto* shop=static_cast<StoreScreen*>(dialog);shop->mGoToTreeNow=test.tree;
            if(test.change!=Change::Cancel)shop->ButtonDepress(shop->mBackButton->mId);
            // End the shop before installing successor music. A still-live
            // shop may legitimately select TITLE in this very update pass.
            app.KillStoreScreen();
        }else if(id==DIALOG_ALMANAC)app.KillAlmanacDialog();
        else if(test.change==Change::Cancel)app.KillDialog(id);
        else dialog->ButtonDepress(Dialog::ID_YES);
        switch(test.change){
        case Change::Removed:app.KillGameSelector();break;
        case Change::Replaced:replacementSelector=Open(app,newDead);break;
        case Change::Board:
            app.KillGameSelector();app.PreNewGame(GAMEMODE_MINIGAME_WAR_AND_PEAS,false);
            replacementBoard=app.mBoard;replacementBoard->mSunMoney=777;break;
        case Change::Profile:app.mPlayerInfo=&b;break;
        case Change::Reuse:a.reset();a.emplace();Init(*a,940003);app.mPlayerInfo=&*a;break;
        case Change::Epoch:++a->mUseSeq;break;
        case Change::Sync:caller.SyncProfile(false);break;
        case Change::SyncLoading:caller.SyncProfile(true);break;
        default:break;
        }
        if(test.change!=Change::Back&&test.change!=Change::Cancel&&test.change!=Change::Reenter){
            if(app.mBoard)app.DoDialog(DIALOG_PAUSED,true,"Successor pause","Isolated fixture","",Dialog::BUTTONS_NONE);
            app.mMusic->mCurMusicTune=MUSIC_TUNE_FOG_RIGORMORMIST;
            app.mMusic->mPaused=true;app.mMusic->mPauseOffset=0x3579;
        }
        (app.*AppAccess::Cleanup)();Require(!dead,"Selector died inside its modal callback");
    }
};
bool Run(LawnApp& app,Case test,std::ostream& log){
    log<<"begin path="<<int(test.path)<<" change="<<int(test.change)<<" tree="<<test.tree<<std::endl;
    app.KillStoreScreen();app.KillDialog(DIALOG_MESSAGE);app.KillBoard();app.KillGameSelector();(app.*AppAccess::Cleanup)();
    auto* original=app.mPlayerInfo;const bool trial=app.mDebugTrialLocked;
    std::optional<PlayerInfo> a{std::in_place};PlayerInfo b;Init(*a,940001,test.path==Path::Taco?35:30);Init(b,940002);
    app.mPlayerInfo=&*a;app.mDebugTrialLocked=test.path==Path::Replay;
    bool dead=false,newDead=false;auto* caller=Open(app,dead);
    const auto fileA=GetSavedGameName(GAMEMODE_ADVENTURE,a->mId),fileB=GetSavedGameName(GAMEMODE_ADVENTURE,b.mId);
    if(test.path==Path::Replay){
        // Deletion sentinels only; these are never presented to the save reader.
        Require(app.WriteBytesToFile(fileA,"selector-delete-sentinel",24)&&app.WriteBytesToFile(fileB,"selector-delete-sentinel",24),"Cannot write isolated deletion sentinels");
    }
    if(test.path==Path::Taco){a->mNeedsMagicTacoReward=1;caller->mStartingGame=true;caller->mStartingGameCounter=450;}
    if(test.path==Path::Complete){
        a->mNeedsMessageOnGameSelector=1;caller->mSelectorState=SELECTOR_OPEN;caller->mHasTrophy=false;
        app.ReanimationGet(caller->mSelectorReanimID)->mLoopCount=1;
        for(auto& counter:caller->mCloudCounter)counter=50000;
    }
    Reply reply(app,*caller,dead,newDead,a,b,test);
    bool unwound=false;
    const auto depthBefore=app.mUpdateAppDepth;
    try{
        if(test.path==Path::Store||test.path==Path::Almanac)caller->ButtonDepress(test.path==Path::Store?caller->mStoreButton->mId:caller->mAlmanacButton->mId);
        else if(test.path==Path::Replay)caller->ClickedAdventure();
        else caller->Update();
    }catch(const std::runtime_error& error){
        if(test.change!=Change::Throw||std::string(error.what())!="Expected selector callback unwind")throw;
        unwound=true;
    }
    Require(reply.acted&&!dead,"Selector callback returned without a live observed caller");
    const bool stale=test.change!=Change::Back&&test.change!=Change::Cancel&&test.change!=Change::Reenter;
    bool state=true;
    if(stale&&test.change!=Change::Throw){
        state &= app.mMusic->mCurMusicTune==MUSIC_TUNE_FOG_RIGORMORMIST&&app.mMusic->mPaused&&app.mMusic->mPauseOffset==0x3579;
        if(test.change==Change::Board)state &= app.mBoard==reply.replacementBoard&&app.mBoard->mSunMoney==777;
        else state &= !app.mBoard;
        if(test.change==Change::Replaced)state &= app.mGameSelector==reply.replacementSelector;
    }
    if(test.path==Path::Replay){
        const bool start=test.change==Change::Back;
        state &= caller->mStartingGame==start&&a->mLevel==(start?24:30)&&b.mLevel==30;
        state &= app.FileExists(fileA)==!start&&app.FileExists(fileB);
    }else if(test.path==Path::Complete){
        state &= caller->mCloudCounter[0]==(stale?50000:49999);
        if(test.change!=Change::Reuse)state &= !a->mNeedsMessageOnGameSelector;
    }else if(test.path==Path::Taco&&!stale){
        state &= test.change==Change::Back?(app.mBoard&&app.mGameMode==GAMEMODE_ADVENTURE&&!app.mGameSelector):(!app.mBoard&&app.mGameSelector);
    }else if(test.tree&&!stale){
        state &= test.change==Change::Back?(app.mBoard&&app.mGameMode==GAMEMODE_TREE_OF_WISDOM&&!app.mGameSelector):(!app.mBoard&&app.mGameSelector==caller);
    }
    const bool children=!app.GetDialog(DIALOG_STORE)&&!app.GetDialog(DIALOG_ALMANAC)&&!app.GetDialog(DIALOG_MESSAGE);
    const bool ok=state&&children&&reply.held&&reply.reentrySafe&&reply.ownerClosedChild&&
        unwound==(test.change==Change::Throw)&&app.mUpdateAppDepth==depthBefore&&!caller->mWaitingDialog;
    log<<"state="<<state<<" children="<<children<<" held="<<reply.held<<" reentry="<<reply.reentrySafe<<" pass="<<ok
       <<" mode="<<int(app.mGameMode)<<" tune="<<int(app.mMusic->mCurMusicTune)<<" cloud="<<caller->mCloudCounter[0]
       <<" owner-closed-child="<<reply.ownerClosedChild<<" unwind="<<unwound<<" depth="<<app.mUpdateAppDepth<<std::endl;
    reply.emergency.reset();app.KillStoreScreen();app.KillDialog(DIALOG_MESSAGE);app.KillBoard();app.KillGameSelector();(app.*AppAccess::Cleanup)();
    Require(dead&&(test.change!=Change::Replaced||newDead),"Selector callback retained retired pages");
    if(test.path==Path::Replay){app.EraseFile(fileA);app.EraseFile(fileB);}
    app.mPlayerInfo=original;app.mDebugTrialLocked=trial;
    return ok;
}
}
void SelectorSlideInputs(LawnApp& app){
    bool dead=false;
    auto* selector=Open(app,dead);
    unsigned checked=0;
    for(int counter:{75,1,-1})for(int button=100;button<=114;++button){
        selector->mSlideCounter=counter;
        selector->ButtonDepress(button);
        Require(app.mGameSelector==selector&&!app.mBoard&&app.mDialogMap.empty()&&
            !selector->mStartingGame&&selector->mSlideCounter==counter&&app.mGameScene==SCENE_MENU,
            "Sliding selector dispatched an action that 1073 rejects");
        ++checked;
    }
    selector->SlideTo(-1000,-300);
    Require(selector->mSlideCounter==75&&selector->mDestX==-1000&&selector->mDestY==-300,"Active SlideTo was wrongly blocked");
    selector->SlideTo(-800,0);
    Require(selector->mSlideCounter==75&&selector->mDestX==-800&&selector->mDestY==0,"Repeated SlideTo lost original retargeting");
    selector->mSlideCounter=0;
    selector->ButtonDepress(selector->mAchievementsButton->mId);
    Require(selector->mSlideCounter==75&&selector->mDestX==-800&&selector->mDestY==-600,"Stationary selector could not open achievements");
    app.KillGameSelector();(app.*AppAccess::Cleanup)();Require(dead&&checked==45,"Slide fixture retained a selector");
    Report("portable-selector-45-slide-inputs-original-retarget",app);
}
void PortableSelectorLifetimeSmoke(LawnApp& app){
    Require(app.mNoSoundNeeded&&getenv("PVZ_APPDATA_DIR")&&!app.mUpdateAppDepth,"Selector fixture must be isolated/no-audio");
    std::ofstream log(ProbePath("selector-modal-lifetime.txt"));Require(bool(log),"Cannot write selector evidence");
    unsigned count=0,failures=0;
    const auto run=[&](Case test){failures+=!Run(app,test,log);++count;};
    for(Path path:{Path::Store,Path::Almanac,Path::Replay})
        for(Change change:{Change::Back,Change::Cancel,Change::Removed,Change::Replaced,Change::Board,Change::Profile,Change::Reuse,Change::Epoch})run({path,change});
    for(Change change:{Change::Back,Change::Replaced,Change::Profile})run({Path::Store,change,true});
    for(Change change:{Change::Sync,Change::Reenter})run({Path::Store,change});
    for(Change change:{Change::Back,Change::Removed,Change::Replaced,Change::Profile})run({Path::Complete,change});
    for(Path path:{Path::Store,Path::Almanac,Path::Complete})run({path,Change::Detach});
    run({Path::Store,Change::SyncLoading});
    for(Path path:{Path::Store,Path::Almanac,Path::Replay,Path::Complete})run({path,Change::Throw});
    log<<"pre-transition cases="<<count<<" failures="<<failures<<std::endl;
    Require(!failures,"Selector resumed an expired modal session or failed to retain its caller");
    // The original retires the selector before entering the taco wait. Only
    // run its forced-collection cases after ordinary caller retention passes.
    for(Change change:{Change::Back,Change::Cancel,Change::Replaced,Change::Board,Change::Profile,Change::Reuse})run({Path::Taco,change});
    Require(count==47&&!failures,"Selector taco handoff affected a replacement scene");
    SelectorSlideInputs(app);
    Report("portable-selector-47-menu-replay-completion-taco-lifecycles",app);
}
