#include "PortableChooserLifetimeSmoke.h"
#include "ModernVulkanSmoke.h"
#include "LawnApp.h"
#include "Board.h"
#include "Cutscene.h"
#include "SeedPacket.h"
#include "System/Music.h"
#include "System/PlayerInfo.h"
#include "Widget/SeedChooserScreen.h"
#include "Widget/GameButton.h"
#include "Widget/StoreScreen.h"
#include "Widget/Almanac.h"
#include "widget/WidgetManager.h"
#include "widget/WidgetLifetimeHold.h"
#include <array>
#include <fstream>
#include <memory>
#include <stdexcept>

namespace {
using namespace ModernSmoke;
void Require(bool ok,const char* why){if(!ok)throw std::runtime_error(why);}
struct AppAccess:LawnApp{static constexpr auto Cleanup=&AppAccess::ProcessSafeDeleteList;};
class ObservedChooser final:public SeedChooserScreen {
    bool& dead;
public:
    explicit ObservedChooser(bool& value):dead(value){}
    ~ObservedChooser() override{dead=true;}
};
ObservedChooser* Open(LawnApp& app,bool& dead,bool sun=true) {
    app.KillStoreScreen();app.KillBoard();app.KillGameSelector();app.KillChallengeScreen();
    (app.*AppAccess::Cleanup)();
    app.mPlayerInfo->mLevel=23;app.mPlayerInfo->mFinishedAdventure=1;
    app.mPlayerInfo->mPurchases[STORE_ITEM_TREE_OF_WISDOM]=1;
    app.PreNewGame(GAMEMODE_MINIGAME_WAR_AND_PEAS,false);
    app.KillSeedChooserScreen();(app.*AppAccess::Cleanup)();
    auto* chooser=new ObservedChooser(dead);app.mSeedChooserScreen=chooser;
    chooser->Resize(0,0,800,600);app.mWidgetManager->AddWidget(chooser);
    chooser->SetVisible(false);chooser->mMouseVisible=true;chooser->mChooseState=CHOOSE_NORMAL;
    const auto choose=[&](SeedType seed) {
        if(chooser->mSeedsInBank>=app.mBoard->mSeedBank->mNumPackets ||
           chooser->mChosenSeeds[seed].mSeedState!=SEED_IN_CHOOSER || !app.SeedTypeAvailable(seed))return;
        chooser->ClickedSeedInChooser(chooser->mChosenSeeds[seed]);
        chooser->LandFlyingSeed(chooser->mChosenSeeds[seed]);
    };
    if(sun)choose(SEED_SUNFLOWER);
    for(auto seed:{SEED_CACTUS,SEED_LILYPAD,SEED_FLOWERPOT,SEED_PEASHOOTER,SEED_SNOWPEA,SEED_WALLNUT,
                   SEED_CHERRYBOMB,SEED_POTATOMINE,SEED_CHOMPER,SEED_SQUASH})choose(seed);
    Require(chooser->mSeedsInBank==app.mBoard->mSeedBank->mNumPackets && !chooser->mSeedsInFlight,
        "Cannot fill chooser fixture bank");
    app.mBoard->mSunMoney=555;
    return chooser;
}
enum class Path{Store,Almanac,Warning};
enum class Change{Back,Cancel,ChooserGone,BoardGone,Replace,Profile,ProfileEpoch,Hidden};
struct Case{Path path;Change change;bool tree=false;};
class Reply final:public Widget {
    LawnApp& app;ObservedChooser& caller;bool& dead;bool& replacementDead;PlayerInfo& other;Case test;
    unsigned updates=0;
public:
    bool acted=false,ownHold=false,retained=false;
    std::unique_ptr<WidgetLifetimeHold> emergency;
    Board* replacement=nullptr;
    Reply(LawnApp& a,ObservedChooser& c,bool& died,bool& otherDead,PlayerInfo& profile,Case value)
      :app(a),caller(c),dead(died),replacementDead(otherDead),other(profile),test(value){
        mMouseVisible=false;mWidgetFlagsMod.mAddFlags=WIDGETFLAGS_UPDATE;app.mWidgetManager->AddWidget(this);
    }
    ~Reply() override{if(mWidgetManager)mWidgetManager->RemoveWidget(this);}
    void Update() override {
        if(acted)return;
        Require(++updates<500,"Chooser modal responder timed out");
        const int id=test.path==Path::Store?DIALOG_STORE:test.path==Path::Almanac?DIALOG_ALMANAC:DIALOG_CHOOSER_WARNING;
        auto* dialog=app.GetDialog(id);if(!dialog)return;
        if(auto* lawn=dynamic_cast<LawnDialog*>(dialog);lawn && lawn->mButtonDelay>=0 && lawn->mUpdateCnt<=unsigned(lawn->mButtonDelay))return;
        acted=true;ownHold=caller.mDeferredDeleteHolds>0;
        // Keep the negative-test caller valid instead of deliberately reading
        // freed memory. This is never used by the corrected implementation.
        if(!ownHold)emergency=std::make_unique<WidgetLifetimeHold>(caller);
        if(test.path==Path::Store){
            auto* store=static_cast<StoreScreen*>(dialog);store->mGoToTreeNow=test.tree;
            if(test.change==Change::Cancel)app.KillStoreScreen();
            else store->ButtonDepress(store->mBackButton->mId);
        } else if(test.path==Path::Almanac)app.KillAlmanacDialog();
        else if(test.change==Change::Cancel)app.KillDialog(id);
        else dialog->ButtonDepress(Dialog::ID_YES);
        if(test.path==Path::Store && test.change!=Change::Back && test.change!=Change::Cancel)
            app.KillStoreScreen();
        // A back-button result alone does not unregister the store. It may
        // still Update later in this same widget pass and legitimately select
        // its music. Mutate the successor scene only after closing the store,
        // while its caller is still suspended inside the real WaitForResult.
        switch(test.change){
        case Change::ChooserGone:app.KillSeedChooserScreen();break;
        case Change::BoardGone:app.KillBoard();break;
        case Change::Replace:Open(app,replacementDead);replacement=app.mBoard;replacement->mSunMoney=777;break;
        case Change::Profile:app.mPlayerInfo=&other;break;
        case Change::ProfileEpoch:++app.mPlayerInfo->mUseSeq;break;
        case Change::Hidden:caller.mMouseVisible=false;break;
        default:break;
        }
        if(test.change!=Change::Back && test.change!=Change::Cancel){
            // The replacement pause must have a real owner. Without another
            // dialog, closing the store legitimately runs ModalClose/Pause(false)
            // before the chooser's caller resumes; that is not a stale-result bug.
            if(app.mBoard) {
                app.DoDialog(DIALOG_PAUSED,true,("Successor pause"),("Isolated fixture"),(""),Dialog::BUTTONS_NONE);
                Require(app.NeedPauseGame() && app.mBoard->mPaused,"Successor pause did not own the board pause");
            }
            app.mMusic->mCurMusicTune=MUSIC_TUNE_FOG_RIGORMORMIST;
            app.mMusic->mPaused=true;app.mMusic->mPauseOffset=0x2468;
        }
        (app.*AppAccess::Cleanup)();retained=!dead;
        Require(retained,"Chooser was destroyed before the modal caller returned");
    }
};
bool Run(LawnApp& app,Case test,std::ostream& log){
    bool dead=false,newDead=false;
    PlayerInfo other;other.mId=920001;other.mUseSeq=1;other.mLevel=23;other.mFinishedAdventure=1;
    auto* originalProfile=app.mPlayerInfo;
    auto* chooser=Open(app,dead);
    auto* board=app.mBoard;
    bool warningAccepted=false;
    Reply reply(app,*chooser,dead,newDead,other,test);
    if(test.path==Path::Warning)warningAccepted=chooser->DisplayRepickWarningDialog(gStr.SEED_CHOOSER_SUN_WARNING.c_str());
    else chooser->ButtonDepress(test.path==Path::Store?chooser->mStoreButton->mId:chooser->mAlmanacButton->mId);
    Require(reply.acted && !dead,"Chooser modal did not return with a live caller");
    const bool stale=test.change!=Change::Back && test.change!=Change::Cancel;
    bool ok=true;
    if(stale){
        ok &= !warningAccepted && app.mMusic->mCurMusicTune==MUSIC_TUNE_FOG_RIGORMORMIST &&
            app.mMusic->mPaused && app.mMusic->mPauseOffset==0x2468;
        if(test.change==Change::Replace)ok &= app.mBoard==reply.replacement && app.mBoard->mSunMoney==777;
        else if(test.change==Change::BoardGone)ok &= !app.mBoard;
        else ok &= app.mBoard==board && board->mSunMoney==555;
    }else if(test.tree)ok &= app.mGameMode==GAMEMODE_TREE_OF_WISDOM && app.mBoard && app.mBoard!=board;
    else if(test.path==Path::Warning)ok &= warningAccepted==(test.change==Change::Back) && app.mBoard==board;
    else ok &= app.mBoard==board && app.mSeedChooserScreen==chooser;
    ok &= !app.GetDialog(DIALOG_STORE)&&!app.GetDialog(DIALOG_ALMANAC)&&!app.GetDialog(DIALOG_CHOOSER_WARNING);
    const bool stateOk=ok;
    ok &= reply.ownHold && reply.retained;
    log<<"path="<<int(test.path)<<" change="<<int(test.change)<<" tree="<<test.tree
       <<" hold="<<reply.ownHold<<" warning-accepted="<<warningAccepted<<" state="<<stateOk<<" pass="<<ok
       <<" tune="<<int(app.mMusic->mCurMusicTune)<<" music-paused="<<app.mMusic->mPaused
       <<" offset="<<app.mMusic->mPauseOffset<<" mode="<<int(app.mGameMode)
       <<" same-board="<<(app.mBoard==board)<<" sun="<<(app.mBoard?app.mBoard->mSunMoney:-1)
       <<" same-replacement="<<(app.mBoard==reply.replacement)<<" pause-dialog="<<(app.GetDialog(DIALOG_PAUSED)!=nullptr)
       <<" board-paused="<<(app.mBoard?app.mBoard->mPaused:false)<<std::endl;
    reply.emergency.reset();app.KillStoreScreen();app.KillBoard();(app.*AppAccess::Cleanup)();
    Require(dead && (test.change!=Change::Replace || newDead),"Chooser lifetime leaked a retired page");
    app.mPlayerInfo=originalProfile;
    return ok;
}

void RealStartFlow(LawnApp& app,std::ostream& log){
    unsigned count=0;
    for(int which=0;which<5;++which){
        bool dead=false,newDead=false;
        PlayerInfo other;other.mId=920002;other.mUseSeq=1;other.mFinishedAdventure=1;other.mLevel=23;
        auto* profile=app.mPlayerInfo;
        auto* chooser=Open(app,dead,which==0);
        const auto change=which==2?Change::Cancel:which==3?Change::Replace:which==4?Change::Profile:Change::Back;
        std::unique_ptr<Reply> reply;
        if(which)reply=std::make_unique<Reply>(app,*chooser,dead,newDead,other,Case{Path::Warning,change});
        chooser->OnStartButton();
        Require(!dead && !app.GetDialog(DIALOG_CHOOSER_WARNING),"Real start flow did not unwind its warning");
        if(which==0 || which==1)
            Require(!chooser->mMouseVisible && !app.mBoard->mCutScene->mSeedChoosing,"Accepted live start did not end seed selection");
        else if(which==3)
            Require(app.mBoard==reply->replacement && app.mBoard->mSunMoney==777 && app.mSeedChooserScreen->mMouseVisible,
                "An old accepted start consumed the replacement board's chooser");
        else Require(chooser->mMouseVisible,"Cancelled/expired start closed the chooser");
        if(reply)Require(reply->acted && reply->ownHold && !reply->emergency,"Real start did not exercise a protected nested wait");
        app.KillStoreScreen();app.KillBoard();(app.*AppAccess::Cleanup)();
        Require(dead && (which!=3 || newDead),"Real start flow retained a chooser");
        app.mPlayerInfo=profile;
        log<<"actual-OnStartButton case="<<which<<" pass=1"<<std::endl;++count;
    }
    Require(count==5,"Missing real start path");
    Report("portable-chooser-five-real-start-warning-flows",app);
}
}

void PortableChooserLifetimeSmoke(LawnApp& app){
    Require(app.mNoSoundNeeded && getenv("PVZ_APPDATA_DIR") && !app.mUpdateAppDepth,
        "Chooser session probe must be hidden, isolated, no-audio and outside nested updates");
    std::ofstream log(ProbePath("chooser-modal-lifetime.txt"));Require(bool(log),"Cannot write chooser evidence");
    unsigned count=0,failures=0;
    for(Path path:{Path::Store,Path::Almanac,Path::Warning})
        for(Change change:{Change::Back,Change::Cancel,Change::ChooserGone,Change::BoardGone,Change::Replace,
                           Change::Profile,Change::ProfileEpoch,Change::Hidden}){
            failures+=!Run(app,{path,change},log);++count;
        }
    for(Change change:{Change::Back,Change::Replace,Change::Profile}){
        failures+=!Run(app,{Path::Store,change,true},log);++count;
    }
    log<<"cases="<<count<<" failures="<<failures<<" actual-audio=0"<<std::endl;
    Require(!failures,"Chooser modal result affected a retired page, replacement board or profile");
    // Only after the safe helper/lifetime checks succeed do we enter the real
    // caller that would otherwise dereference a disposed Board after YES.
    RealStartFlow(app,log);
    Report("portable-chooser-27-store-almanac-warning-session-cases",app);
}
