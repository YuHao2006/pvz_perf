#include "PortableFixesSmoke.h"
#include "PortableStoreRegistration.h"
#include "ModernVulkanSmoke.h"
#include "LawnApp.h"
#include "System/PlayerInfo.h"
#include "Widget/StoreScreen.h"
#include "Widget/GameButton.h"
#include "Widget/LawnDialog.h"
#include "Widget/AchievementsWidget.h"
#include "widget/WidgetManager.h"
#include <algorithm>
#include <fstream>
#include <stdexcept>

namespace {
void Require(bool ok,const char* text){if(!ok)throw std::runtime_error(text);}
class PurchaseAnswer final:public Sexy::Widget {
    LawnApp& app;bool accept;unsigned updates=0;
public:
    unsigned answers=0;
    PurchaseAnswer(LawnApp& a,bool yes):app(a),accept(yes){
        mMouseVisible=false;mWidgetFlagsMod.mAddFlags=Sexy::WIDGETFLAGS_UPDATE;
        app.mWidgetManager->AddWidget(this);
    }
    ~PurchaseAnswer()override{if(mWidgetManager)mWidgetManager->RemoveWidget(this);}
    void Update()override{
        Require(++updates<500,"Store achievement modal did not return");
        auto* dialog=dynamic_cast<LawnDialog*>(app.GetDialog(DIALOG_STORE_PURCHASE));
        if(!dialog||dialog->mResult!=0x7fffffff)return;
        if(dialog->mButtonDelay>=0&&dialog->mUpdateCnt<=static_cast<uint32_t>(dialog->mButtonDelay))return;
        Require(!answers,"Unexpected extra shop purchase dialog");++answers;
        dialog->ButtonDepress(accept?Sexy::Dialog::ID_YES:Sexy::Dialog::ID_NO);
    }
};
}

void PortableStoreAchievementSmoke(LawnApp& app){
    using namespace Sexy;
    Require(getenv("PVZ_APPDATA_DIR")&&app.mNoSoundNeeded&&!app.mBoard&&app.mDialogMap.empty()&&
        app.mCrazyDaveState==CRAZY_DAVE_OFF,"Shop achievement probe needs an isolated silent menu");
    PlayerInfo player;player.mId=107364;player.mUseSeq=1;player.mName="Shop achievement probe";
    struct Restore{
        LawnApp& app;PlayerInfo* player;GameMode mode;Widget* focus;int x,y,cursor;
        ~Restore(){app.CrazyDaveDie();app.mPlayerInfo=player;app.mGameMode=mode;
            app.mWidgetManager->mLastMouseX=x;app.mWidgetManager->mLastMouseY=y;
            app.mWidgetManager->SetFocus(focus);app.SetCursor(cursor);}
    }restore{app,app.mPlayerInfo,app.mGameMode,app.mWidgetManager->mFocusWidget,
        app.mWidgetManager->mLastMouseX,app.mWidgetManager->mLastMouseY,app.mCursorNum};
    app.mPlayerInfo=&player;app.mGameMode=GAMEMODE_ADVENTURE;
    std::ofstream log(ModernSmoke::ProbePath("store-achievement-dialogue.txt"));
    Require(bool(log),"Cannot write store achievement evidence");
    const auto widgets=app.mWidgetManager->mWidgets.size();
    unsigned completed=0,controls=0;
    for(int scenario=0;scenario<12;++scenario){
        player.Reset();player.mId=107364;player.mName="Shop achievement probe";
        player.mLevel=50;player.mFinishedAdventure=1;player.mCoins=20000;
        std::fill_n(player.mPurchases,9,1);
        const bool full=scenario<9,accept=scenario!=11;
        const auto item=static_cast<StoreItem>(full?scenario:scenario==10?STORE_ITEM_POOL_CLEANER:STORE_ITEM_PLANT_IMITATER);
        player.mPurchases[item]=0;
        if(scenario==9)player.mPurchases[STORE_ITEM_PLANT_GATLINGPEA]=0;
        {
            StoreScreen store(&app);PortableStoreRegistration registration(app,store);store.StorePreload();
            for(int tick=0;tick<300&&app.mCrazyDaveState==CRAZY_DAVE_ENTERING;++tick)app.UpdateCrazyDave();
            Require(app.mCrazyDaveState==CRAZY_DAVE_IDLING,"Dave did not finish entering private shop");
            store.mStoreTime=120;store.mStartDialog=-1;
            app.mWidgetManager->mLastMouseX=790;app.mWidgetManager->mLastMouseY=590;
            const int cost=StoreScreen::GetItemCost(item);
            {PurchaseAnswer responder(app,accept);store.PurchaseItem(item);
                Require(responder.answers==1,"Private shop did not use its real purchase dialog");}
            Require(app.mDialogMap.size()==1&&app.GetDialog(DIALOG_STORE)==&store&&!store.mWaitForDialog,"Purchase retained a dialog/wait flag");
            Require(player.mCoins==20000-(accept?cost:0)&&player.mPurchases[item]==(accept?1:0),
                "Shop confirmation changed purchase or coin semantics");
            log<<"scenario="<<scenario<<" item="<<int(item)<<" earned="<<player.mEarnedAchievements[Morticulturalist]
                <<" countdown="<<store.mBubbleCountDown<<" message="<<app.mCrazyDaveMessageIndex<<std::endl;
            if(full){
                Require(player.mEarnedAchievements[Morticulturalist]&&!player.mShownAchievements[Morticulturalist],
                    "Last plant did not grant a deferred no-board achievement");
                Require(app.mCrazyDaveMessageIndex==4000&&store.mBubbleCountDown==150&&!store.mBubbleClickToContinue,
                    "1073 last-plant greeting must start with 150 timed ticks");
                Require(!store.CanInteractWithButtons(),"Timed achievement greeting allows product interaction");
                // A purchasable pool cleaner lies here. Hover and click may not
                // replace the greeting or open another purchase confirmation.
                app.mWidgetManager->mLastMouseX=240;app.mWidgetManager->mLastMouseY=205;
                store.UpdateMouse();store.MouseDown(240,205,1);store.KeyChar(' ');
                Require(app.mCrazyDaveMessageIndex==4000&&store.mMouseOverItem==STORE_ITEM_INVALID&&app.mDialogMap.size()==1,
                    "Product hover/input replaced the timed achievement greeting");
                for(int tick=0;tick<149;++tick)store.Update();
                Require(app.mCrazyDaveMessageIndex==4000&&store.mBubbleCountDown==1,
                    "Achievement greeting advanced before its 150th update");
                store.Update();
                Require(app.mCrazyDaveMessageIndex==4001&&store.mBubbleClickToContinue&&store.mBubbleCountDown==0,
                    "Timed achievement greeting failed to enter the original click-through continuation");
                for(int message=4002;message<=4004;++message){
                    const int old=app.mCrazyDaveMessageIndex;
                    store.Update();Require(app.mCrazyDaveMessageIndex==old,"Click-through greeting auto-advanced");
                    if(message%2)store.KeyChar(' ');else store.MouseDown(790,590,1);
                    Require(app.mCrazyDaveMessageIndex==message&&store.mBubbleClickToContinue,
                        "Original 4000..4004 achievement dialogue sequence was skipped");
                }
                store.KeyChar('\r');
                Require(!store.mBubbleClickToContinue&&store.mBubbleCountDown==0&&store.mAmbientSpeechCountDown==500&&
                    store.CanInteractWithButtons(),"Finished achievement dialogue did not restore original ambient timer/input");
                log<<"last-plant="<<int(item)<<" timed150/hover/mouse/key/4000-4004/ambient500=PASS"<<std::endl;
                ++completed;
            }else{
                Require(!player.mEarnedAchievements[Morticulturalist]&&app.mCrazyDaveMessageIndex!=4000&&
                    store.CanInteractWithButtons(),"Incomplete/non-plant/cancelled purchase triggered achievement dialogue");
                ++controls;
            }
            app.CrazyDaveDie();
        }
        Require(app.mWidgetManager->mWidgets.size()==widgets&&app.mDialogMap.empty(),"Private shop retained widgets");
    }
    Require(completed==9&&controls==3,"Shop achievement scenario coverage changed");
    log<<"PASS lastPlants=9 controls=3"<<std::endl;
    ModernSmoke::Report("portable-store-nine-last-plants-three-controls-original-dialogue",app);
}
