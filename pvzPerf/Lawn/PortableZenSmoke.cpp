#include "PortableFixesSmoke.h"
#include "ModernVulkanSmoke.h"
#include "LawnApp.h"
#include "Board.h"
#include "Plant.h"
#include "GridItem.h"
#include "Coin.h"
#include "CursorObject.h"
#include "Cutscene.h"
#include "Challenge.h"
#include "ZenGarden.h"
#include "System/PlayerInfo.h"
#include "System/StinkyTimestamp.h"
#include "Widget/TitleScreen.h"
#include "Widget/StoreScreen.h"
#include "Widget/GameButton.h"
#include "widget/WidgetManager.h"
#include "Sexy.TodLib/EffectSystem.h"
#include "Sexy.TodLib/Reanimator.h"
#include "graphics/GpuBackend.h"
#include "graphics/DDInterface.h"
#include "graphics/DDImage.h"
#include "graphics/RenderInterface.h"
#include "graphics/Font.h"
#include <array>
#include <fstream>
#include <limits>
#include <set>
#include <span>
#include <stdexcept>
#include <string_view>

namespace {
using namespace ModernSmoke;
void Require(bool ok,const char* message){if(!ok)throw std::runtime_error(message);}
void DeleteQueue(LawnApp& app){app.mBoard->ProcessDeleteQueue();app.mEffectSystem->ProcessDeleteQueue();}
std::array<Plant*,4> Pots(LawnApp& app) {
    std::array<Plant*,4> result{};Plant* plant=nullptr;
    while(app.mBoard->IteratePlants(plant))if(plant->mPottedPlantIndex>=0) {
        Require(plant->mPottedPlantIndex<4 && !result[plant->mPottedPlantIndex],"Unexpected duplicate potted plant");
        result[plant->mPottedPlantIndex]=plant;
    }
    for(auto* plant:result)Require(plant!=nullptr,"Zen startup omitted a fixture pot");
    return result;
}

bool storeCloseUnwound=false,storeCloseCleaned=false;
bool StoreCloseEnabled() {
    const char* scenario=getenv("PVZ_MODERN_GAMEPLAY_SMOKE");
    return getenv("PVZ_MODERN_SMOKE") && scenario &&
        (std::string_view(scenario)=="ZenClose" || std::string_view(scenario)=="TreeClose");
}
class StoreCloseAnswer final : public Widget {
    LawnApp& app;
    std::ostream& log;
    bool close,tree,opening=false;
    unsigned updates=0;
public:
    bool answered=false,returned=false;
    StoreCloseAnswer(LawnApp& a,std::ostream& l,bool quit,bool wisdom):app(a),log(l),close(quit),tree(wisdom) {
        mMouseVisible=false; mWidgetFlagsMod.mAddFlags=WIDGETFLAGS_UPDATE;
        app.mWidgetManager->AddWidget(this);
    }
    ~StoreCloseAnswer() override {if(mWidgetManager)mWidgetManager->RemoveWidget(this);}
    void Update() override {
        if(returned)return;
        if(!opening) {
            opening=true;
            Require(app.mUpdateAppDepth>0,"Store opener did not run inside an ordinary widget update");
            log<<"open-store outer-depth="<<app.mUpdateAppDepth<<std::endl;
            if(tree)app.mBoard->mChallenge->TreeOfWisdomOpenStore();else app.mZenGarden->OpenStore();
            returned=true;
            return;
        }
        if(answered)return;
        Require(++updates<500,"Store-close responder timed out in a nested modal loop");
        auto* store=dynamic_cast<StoreScreen*>(app.GetDialog(DIALOG_STORE));
        if(!store)return;
        Require(app.mUpdateAppDepth>1 && app.mBoard && app.mZenGarden && app.mEffectSystem,
            "Store-close probe did not enter a live nested update");
        answered=true;
        log<<"nested-response close="<<close<<" depth="<<app.mUpdateAppDepth<<std::endl;
        if(!close) {store->ButtonDepress(store->mBackButton->mId);return;}
        auto* board=app.mBoard;auto* garden=app.mZenGarden;auto* effects=app.mEffectSystem;
        SendMessageW(app.mHWnd,WM_CLOSE,0,0);
        app.DrainWindowMessages();
        Require(app.mCloseRequest && app.mExitToTop && !app.mShutdown,
            "Close request did not request deferred exit");
        Require(app.mBoard==board && app.mZenGarden==garden && app.mEffectSystem==effects &&
            app.GetDialog(DIALOG_STORE)==store,"Close request freed objects while the modal caller was active");
        log<<"request-kept-live-board-garden-effects-dialog=1"<<std::endl;
    }
};
}

void PortableStoreCloseSmokeTick(LawnApp& app,bool tree) {
    static unsigned stage=0;static std::uint32_t deadline=0,started=0;
    Require(StoreCloseEnabled() && getenv("PVZ_MODERN_HIDDEN") && getenv("PVZ_APPDATA_DIR") &&
        app.mNoSoundNeeded && !IsWindowVisible(app.mHWnd),
        "Store-close probe must be hidden/isolated/silent");
    if(stage==0) {
        if(!app.mLoaded || !app.mTitleScreen || !app.mTitleScreen->mLoadingThreadComplete)return;
        app.LoadingCompleted();started=app.mUpdateCount;deadline=started+100;stage=1;return;
    }
    Require(app.mUpdateCount-started<3000,"Store-close scenario timed out");
    if(stage==3 || app.mUpdateCount<deadline)return;
    if(stage==1) {
        auto& player=*app.mPlayerInfo;player.mFinishedAdventure=1;player.mLevel=50;
        player.mNumPottedPlants=0;player.mPurchases[STORE_ITEM_STINKY_THE_SNAIL]=0;
        player.mPurchases[STORE_ITEM_TREE_OF_WISDOM]=1;
        player.mChallengeRecords[(int)GameMode::GAMEMODE_TREE_OF_WISDOM]=10;  // 树高记录 v13 直下标
        app.mZenGarden->mGardenType=GARDEN_MAIN;
        app.KillGameSelector();app.PreNewGame(tree?GAMEMODE_TREE_OF_WISDOM:GAMEMODE_LIMBO_ZEN_GARDEN,false);
        app.mBoard->mCutScene->CancelIntro();app.mBoard->mTutorialState=TUTORIAL_OFF;
        stage=2;deadline=app.mUpdateCount+50;return;
    }
    if(app.mGameScene!=SCENE_PLAYING)return;
    std::ofstream log(ProbePath("store-close.txt"));Require(bool(log),"Cannot write store-close evidence");
    auto* board=app.mBoard;auto* garden=app.mZenGarden;auto* effects=app.mEffectSystem;
    const auto depth=app.mUpdateAppDepth;
    for(bool quit:{false,true}) {
        {
            StoreCloseAnswer responder(app,log,quit,tree);
            while(!responder.returned)
                Require(app.UpdateAppStep(nullptr),"Store opener stopped before the modal caller unwound");
            Require(responder.answered,"Store wait returned without exercising its nested responder");
        }
        Require(app.mUpdateAppDepth==depth && app.mBoard==board && app.mZenGarden==garden &&
            app.mEffectSystem==effects && !app.GetDialog(DIALOG_STORE),
            "Returning from the real store lost its live caller or modal registration");
        Require(!app.mShutdown && app.mCloseRequest==quit,"Store return changed shutdown state prematurely");
        log<<"returned close="<<quit<<" depth="<<depth<<" board-live=1 safe-delete-pending="
            <<app.mSafeDeleteList.size()<<std::endl;
        if(!quit)ProbeScreenshot(app);
    }
    storeCloseUnwound=true;stage=3;
    Report("portable-store-close-back-then-real-request-nested-unwound",app);
}

void PortableStoreCloseAfterShutdown(LawnApp& app) {
    if(!StoreCloseEnabled())return;
    Require(storeCloseUnwound && app.mShutdown && app.mUpdateAppDepth==0 &&
        !app.mBoard && !app.mZenGarden && !app.mEffectSystem && !app.mPoolEffect && !app.mReanimatorCache &&
        app.mDialogMap.empty() && app.mSafeDeleteList.empty() && !app.mLoadingThread.joinable(),
        "Store-close outer shutdown did not join and release gameplay resources");
    storeCloseCleaned=true;
    Report("portable-store-close-outer-shutdown-cleaned",app);
}
void PortableStoreCloseAfterDestruction() {
    if(!StoreCloseEnabled())return;
    Require(storeCloseCleaned && !gLawnApp && !gSexyAppBase && !gEffectSystem,
        "Store-close destruction left global owners alive");
    std::ofstream log(ProbePath("result.log"),std::ios::app);
    Require(bool(log),"Cannot write store-close final evidence");
    log<<"PASS store-close; back/request/nested-return/outer-cleanup/destruction verified\n";
}
namespace {
void SetCachedTime(ZenGarden& garden,__time64_t value) {
    garden.mFrameTime=value;
    Require(_localtime64_s(&garden.mFrameLocalTime,&garden.mFrameTime)==0,"Cannot prepare cached calendar fixture");
}
bool CheckFreshGardenTime(LawnApp& app,__time64_t before,const char* label,std::ostream& log,bool plants) {
    auto& garden=*app.mZenGarden;auto& player=*app.mPlayerInfo;
    const auto after=_time64(nullptr);
    const bool fresh=garden.mFrameTime>=before && garden.mFrameTime<=after;
    tm expected{};Require(_localtime64_s(&expected,&garden.mFrameTime)==0,"Cannot inspect garden calendar");
    const auto& actual=garden.mFrameLocalTime;
    const bool calendar=actual.tm_year==expected.tm_year && actual.tm_yday==expected.tm_yday &&
        actual.tm_hour==expected.tm_hour && actual.tm_min==expected.tm_min && actual.tm_sec==expected.tm_sec;
    auto* snail=garden.GetStinky();
    Require(snail!=nullptr,"Garden time fixture did not create Stinky");
    const bool sleeping=snail->mGridItemState==GRIDITEM_STINKY_SLEEPING;
    bool minutes=true;
    if(plants) {
        auto* plant=Pots(app)[0];const auto fulfilled=player.mPottedPlant[0].mLastNeedFulfilledTime;
        const int elapsed=garden.PlantGetMinutesSinceHappy(plant);
        minutes=elapsed>=(before-fulfilled)/60 && elapsed<=(after-fulfilled)/60;
        log<<label<<" plant-minutes="<<elapsed<<" expected-range="<<(before-fulfilled)/60<<','<<(after-fulfilled)/60<<std::endl;
    }
    log<<label<<" before="<<before<<" cached="<<garden.mFrameTime<<" after="<<after
        <<" fresh="<<fresh<<" calendar="<<calendar<<" snail-state="<<int(snail->mGridItemState)
        <<" sleeping="<<sleeping<<" minutes="<<minutes<<std::endl;
    return fresh && calendar && sleeping && minutes;
}
class StoreTimeAnswer final : public Widget {
    LawnApp& app;std::ostream& log;bool opening=false,answered=false;
    unsigned updates=0;__time64_t before=0;
public:
    bool returned=false,correct=false;
    StoreTimeAnswer(LawnApp& a,std::ostream& output):app(a),log(output) {
        mMouseVisible=false;mWidgetFlagsMod.mAddFlags=WIDGETFLAGS_UPDATE;
        app.mWidgetManager->AddWidget(this);
    }
    ~StoreTimeAnswer() override {if(mWidgetManager)mWidgetManager->RemoveWidget(this);}
    void Update() override {
        if(returned)return;
        if(!opening) {
            opening=true;
            Require(app.mUpdateAppDepth>0,"Store time opener is outside the normal update loop");
            app.mZenGarden->OpenStore();
            // Inspect before a later outer frame can hide the stale-cache bug.
            Require(answered && !app.GetDialog(DIALOG_STORE),"Store time responder did not close its dialog");
            correct=CheckFreshGardenTime(app,before,"store-return",log,false);
            returned=true;return;
        }
        if(answered)return;
        Require(++updates<500,"Store time responder timed out");
        auto* store=dynamic_cast<StoreScreen*>(app.GetDialog(DIALOG_STORE));
        if(!store)return;
        Require(app.mUpdateAppDepth>1,"Store time responder did not enter the nested loop");
        before=_time64(nullptr);
        app.mPlayerInfo->mPurchases[STORE_ITEM_STINKY_THE_SNAIL]=before-240;
        app.mPlayerInfo->mLastStinkyChocolateTime=0;
        SetCachedTime(*app.mZenGarden,before-7200);
        // Simulate time elapsed while ZenGardenUpdate is skipped by the store.
        // Only this isolated game's cache is changed, never the OS clock.
        answered=true;store->ButtonDepress(store->mBackButton->mId);
    }
};
void BugSprayPixels(LawnApp& app) {
    auto& board=*app.mBoard;auto& player=*app.mPlayerInfo;
    struct Restore {
        Board& board;PlayerInfo& player;PlayerInfo saved;CursorType cursor;ChallengeState state;int counter;
        ~Restore(){player=saved;board.mCursorObject->mCursorType=cursor;board.mChallenge->mChallengeState=state;
            board.mChallenge->mChallengeStateCounter=counter;}
    } restore{board,player,player,board.mCursorObject->mCursorType,board.mChallenge->mChallengeState,board.mChallenge->mChallengeStateCounter};
    std::fill(std::begin(player.mPurchases),std::end(player.mPurchases),0);
    player.mFinishedAdventure=0;
    auto& renderer=*app.mDDInterface->mRenderInterface;auto* screen=app.mDDInterface->mScreenImage;
    auto pixels=[&](){renderer.Flush();return renderer.mRenderer->ReadScenePixels();};
    std::ofstream log(ProbePath("zen-bugspray-pixels.txt"));Require(bool(log),"Cannot write bug spray evidence");
    unsigned cases=0,wrong=0;
    struct Fade {ChallengeState state;int counter,offset;};
    constexpr std::array<Fade,3> fades{{{STATECHALLENGE_NORMAL,0,0},{STATECHALLENGE_ZEN_FADING,25,-36},{STATECHALLENGE_ZEN_FADING,0,-72}}};
    for(int charges:{0,1,5})for(bool held:{false,true})for(auto fade:fades){
        player.mPurchases[STORE_ITEM_BUG_SPRAY]=PURCHASE_COUNT_OFFSET+charges;
        board.mCursorObject->mCursorType=held?CURSOR_TYPE_BUG_SPRAY:CURSOR_TYPE_NORMAL;
        board.mChallenge->mChallengeState=fade.state;board.mChallenge->mChallengeStateCounter=fade.counter;
        auto rect=board.GetShovelButtonRect();board.GetZenButtonRect(OBJECT_TYPE_BUG_SPRAY,rect);
        Require(rect.mX==100 && rect.mY==0,"Unexpected two-tool Zen fixture");
        screen->FillRect(Sexy::Rect(0,0,800,600),Sexy::Color(17,23,31),0);
        Sexy::Graphics actualGraphics(screen);board.DrawZenButtons(&actualGraphics);const auto actual=pixels();
        screen->FillRect(Sexy::Rect(0,0,800,600),Sexy::Color(17,23,31),0);
        Sexy::Graphics g(screen);
        g.DrawImage(Sexy::IMAGE_SHOVELBANK,30,fade.offset);g.DrawImage(Sexy::IMAGE_WATERINGCAN,28,fade.offset-6);
        g.DrawImage(Sexy::IMAGE_SHOVELBANK,100,fade.offset);
        const auto bankOnly=pixels();unsigned spriteInk=0;
        if(!held){
            g.mColorizeImages = charges==0;g.mColor = Sexy::Color(128,128,128);
            // 1073 0041AE60 reads 0072693C, initialized from IMAGE_BUG_SPRAY.
            g.DrawImage(Sexy::IMAGE_BUG_SPRAY,100,fade.offset-1);g.mColorizeImages = false;
            const auto sprite=pixels();Require(sprite.size()==bankOnly.size(),"Invalid isolated spray capture");
            for(size_t i=0;i<sprite.size();++i)spriteInk+=sprite[i]!=bankOnly[i];
            Require(fade.offset==-72 || spriteInk>50,"Visible spray reference contains no icon pixels");
            const auto label=StrFormat("x%d",charges);auto* font=Sexy::FONT_HOUSEOFTERROR16;
            font->DrawString(&g,164-font->StringWidth(label),65+fade.offset,label,Sexy::Color::White,g.mClipRect);
        }
        const auto expected=pixels();Require(actual.size()==480000 && expected.size()==actual.size(),"Invalid Zen GPU capture");
        unsigned different=0,ink=0;
        for(size_t i=0;i<actual.size();++i){different+=actual[i]!=expected[i];ink+=expected[i]!=0xff11171fu;}
        Require(fade.offset==-72 || ink>500,"Visible Zen reference is blank");
        ++cases;wrong+=different!=0;
        log<<"charges="<<charges<<" held="<<held<<" offset="<<fade.offset<<" different="<<different
           <<" ink="<<ink<<" sprite-ink="<<spriteInk<<std::endl;
    }
    log<<"bugspray-cases="<<cases<<" wrong="<<wrong<<std::endl;
    Require(cases==18 && !wrong,"Zen toolbar uses the wrong bug spray image; see zen-bugspray-pixels.txt");
    Report("portable-zen-18-bugspray-original-gpu-cases",app);
}

bool StinkyTimestampCases(LawnApp& app) {
    auto& player=*app.mPlayerInfo;auto& garden=*app.mZenGarden;
    struct Restore {PlayerInfo& player;PlayerInfo value;~Restore(){player=value;}} restore{player,player};
    std::ofstream log(ProbePath("stinky-timestamp-cases.txt"));Require(bool(log),"Cannot write Stinky timestamp evidence");
    struct Case {std::int64_t seconds;std::int32_t expected;};
    constexpr auto low=std::numeric_limits<std::int32_t>::min(),high=std::numeric_limits<std::int32_t>::max();
    constexpr std::array<Case,17> inputs{{{0,1},{1,1},{2,2},{1700000000,1700000000},
        {2147483646,high-1},{2147483647,high},{2147483648,low},
        {4294967294,-2},{4294967295,-1},{4294967296,1},{4294967297,1},
        {-1,-1},{-2147483648,low},{-2147483649,high},{-4294967296,1},
        {std::numeric_limits<std::int64_t>::min(),1},{std::numeric_limits<std::int64_t>::max(),-1}}};
    unsigned wrong=0;
    player.mPurchases[STORE_ITEM_STINKY_THE_SNAIL]=0;
    Require(!garden.HasPurchasedStinky(),"Unpurchased sentinel should remain zero");
    for(const auto& test:inputs) {
        const auto encoded=StinkyTimestamp::EncodeWakeTime(test.seconds);
        player.mPurchases[STORE_ITEM_STINKY_THE_SNAIL]=encoded;
        const bool owned=garden.HasPurchasedStinky();
        player.SaveDetails();PlayerInfo disk;disk.mId=player.mId;
        Require(disk.LoadDetails() && !disk.mDetailsLoadRejected,"Cannot reload timestamp profile fixture");
        bool otherPurchases=true;
        for(int i=0;i<80;++i)if(i!=STORE_ITEM_STINKY_THE_SNAIL)
            otherPurchases &= disk.mPurchases[i]==restore.value.mPurchases[i];
        const bool pass=encoded==test.expected && owned &&
            disk.mPurchases[STORE_ITEM_STINKY_THE_SNAIL]==test.expected && otherPurchases &&
            disk.mLastStinkyChocolateTime==restore.value.mLastStinkyChocolateTime;
        wrong+=!pass;
        log<<"seconds="<<test.seconds<<" encoded="<<encoded<<" expected="<<test.expected
           <<" purchased="<<owned<<" disk="<<disk.mPurchases[STORE_ITEM_STINKY_THE_SNAIL]
           <<" other-purchases="<<otherPurchases<<" pass="<<pass<<std::endl;
    }
    // Also exercise the actual wake path with the real clock. Synthetic zero
    // values above test the shared encoder, not an OS-clock hook at each caller.
    const auto before=_time64(nullptr);garden.WakeStinky();const auto after=_time64(nullptr);
    const auto stamp=player.mPurchases[STORE_ITEM_STINKY_THE_SNAIL];
    const bool wake=before<=stamp && stamp<=after && garden.HasPurchasedStinky() && player.mHasWokenStinky;
    player=restore.value;player.SaveDetails();
    log<<"timestamp-cases="<<inputs.size()<<" wrong="<<wrong<<" real-wake="<<wake<<std::endl;
    if(!wrong && wake)Report("portable-stinky-17-encoded-profile-roundtrips-real-wake",app);
    return wrong==0 && wake;
}

void StinkyCalendarCases(LawnApp& app) {
    auto& player=*app.mPlayerInfo;auto& garden=*app.mZenGarden;
    auto* liveSnail=garden.GetStinky();Require(liveSnail!=nullptr,"Calendar test requires the live garden snail");
    auto* animation=app.ReanimationGet(liveSnail->mGridItemReanimID);
    struct Restore {PlayerInfo& player;PlayerInfo value;ZenGarden& garden;__time64_t time;
        Reanimation& animation;int loops;
        ~Restore(){player=value;garden.mFrameTime=time;animation.mLoopCount=loops;}
    } restore{player,player,garden,garden.mFrameTime,*animation,animation->mLoopCount};
    std::ofstream log(ProbePath("stinky-calendar-cases.txt"));Require(bool(log),"Cannot write snail calendar evidence");
    animation->mLoopCount=0;
    unsigned cases=0,wrong=0;
    for(const std::int64_t now:{1700000000LL,2147483647LL,2147483648LL,2147487200LL,3000000000LL,4294967294LL})
        for(int wakeAge:{-1,180,181})for(int chocolateAge:{-1,3599,3600}) {
            garden.mFrameTime=now; // no change to Windows time or localtime cache
            player.mPurchases[STORE_ITEM_STINKY_THE_SNAIL]=StinkyTimestamp::EncodeWakeTime(now-wakeAge);
            player.mLastStinkyChocolateTime=static_cast<std::int32_t>(now-chocolateAge);
            const auto wake=player.mPurchases[STORE_ITEM_STINKY_THE_SNAIL],chocolate=player.mLastStinkyChocolateTime;
            player.SaveDetails();PlayerInfo disk;disk.mId=player.mId;
            Require(disk.LoadDetails() && !disk.mDetailsLoadRejected,"Cannot reload calendar profile fixture");
            Require(disk.mPurchases[STORE_ITEM_STINKY_THE_SNAIL]==wake && disk.mLastStinkyChocolateTime==chocolate,
                "Calendar profile roundtrip changed timestamp bits");
            player=disk;
            const bool before= garden.IsStinkyHighOnChocolate()==(chocolateAge<3600) &&
                garden.ShouldStinkyBeAwake()==(chocolateAge<3600 || wakeAge<=180);
            GridItem snail=*liveSnail;
            snail.mGridItemState=GRIDITEM_STINKY_FALLING_ASLEEP;
            garden.StinkyUpdate(&snail); // full production controller, real borrowed reanimation
            const bool reset=wakeAge<0 || chocolateAge<0;
            const bool pass=before && player.mPurchases[STORE_ITEM_STINKY_THE_SNAIL]==(reset?2:wake) &&
                player.mLastStinkyChocolateTime==(reset?0:chocolate) &&
                garden.ShouldStinkyBeAwake()==(!reset && (chocolateAge<3600 || wakeAge<=180));
            ++cases;wrong+=!pass;
            log<<"now="<<now<<" wake-age="<<wakeAge<<" chocolate-age="<<chocolateAge
               <<" reset="<<reset<<" pass="<<pass<<std::endl;
        }
    player=restore.value;player.SaveDetails();
    log<<"calendar-cases="<<cases<<" wrong="<<wrong<<std::endl;
    Require(cases==54 && wrong==0,"Snail calendar/update/profile regression; see stinky-calendar-cases.txt");
    Report("portable-stinky-54-calendar-profile-update-cases",app);
}

bool GardenTimeBoundaryCases(LawnApp& app) {
    auto& garden=*app.mZenGarden;auto& player=*app.mPlayerInfo;
    std::ofstream log(ProbePath("zen-time-cases.txt"),std::ios::app);
    Require(bool(log),"Cannot append garden time evidence");
    unsigned cases=0,wrong=0;
    constexpr __time64_t now=1700000000;
    SetCachedTime(garden,now);
    for(int awakeSeconds:{179,180,181,240})for(int chocolateSeconds:{3599,3600,3601}) {
        player.mPurchases[STORE_ITEM_STINKY_THE_SNAIL]=now-awakeSeconds;
        player.mLastStinkyChocolateTime=now-chocolateSeconds;
        const bool expected=chocolateSeconds<3600 || awakeSeconds<=180; // 1073 0052CA40
        const bool actual=garden.ShouldStinkyBeAwake();
        const bool chocolate=garden.IsStinkyHighOnChocolate();
        const bool pass=actual==expected && chocolate==(chocolateSeconds<3600);
        ++cases;wrong+=!pass;
        log<<"snail-boundary awake-seconds="<<awakeSeconds<<" chocolate-seconds="<<chocolateSeconds
            <<" awake="<<actual<<" expected="<<expected<<" pass="<<pass<<std::endl;
    }
    garden.RefreshTimeCache();player.mLastStinkyChocolateTime=0;
    player.mPurchases[STORE_ITEM_STINKY_THE_SNAIL]=_time64(nullptr)-240;
    auto* board=app.mBoard;const auto depth=app.mUpdateAppDepth;
    bool store=false;
    {
        StoreTimeAnswer responder(app,log);
        while(!responder.returned)Require(app.UpdateAppStep(nullptr),"Store time test stopped before returning");
        store=responder.correct;
    }
    Require(app.mBoard==board && app.mZenGarden->mBoard==board && app.mUpdateAppDepth==depth,
        "Store time test lost its caller or update depth");
    log<<"snail-boundary-cases="<<cases<<" wrong="<<wrong<<" store-return="<<store<<std::endl;
    // Return to the original four-pot/no-snail watering fixture.
    garden.LeaveGarden();DeleteQueue(app);
    player.mPurchases[STORE_ITEM_STINKY_THE_SNAIL]=0;garden.RefreshTimeCache();
    return cases==12 && wrong==0 && store;
}

bool WateringCases(LawnApp& app) {
    auto& board=*app.mBoard;auto& garden=*app.mZenGarden;auto& player=*app.mPlayerInfo;
    auto plants=Pots(app);
    std::ofstream log(ProbePath("zen-watering-cases.txt"));Require(bool(log),"Cannot write watering evidence");
    unsigned checked=0,wrong=0;
    // Keep the original ten direct-tool cases, then thirty routed-event cases:
    // move from another pot / move from empty space / right-click cancellation.
    for(int input=0;input<4;++input)for(bool gold:{false,true})for(int target=0;target<5;++target) {
        const bool miss=target==4;
        const bool cancel=input==3;
        for(auto* plant:plants) {
            auto& pot=player.mPottedPlant[plant->mPottedPlantIndex];
            pot.mTimesFed=0;pot.mFeedingsPerGrow=5;pot.mLastWateredTime=0;
            pot.mLastNeedFulfilledTime=0;pot.mLastFertilizedTime=0;
        }
        garden.RefreshTimeCache();
        for(auto* plant:plants)Require(garden.GetPlantsNeed(&player.mPottedPlant[plant->mPottedPlantIndex])==PLANTNEED_WATER,
            "Watering fixture is not thirsty");
        player.mPurchases[STORE_ITEM_GOLD_WATERINGCAN]=gold?1:0;
        const int x=miss?795:plants[target]->mX+40;
        const int y=miss?590:plants[target]->mY+40;
        board.PickUpTool(OBJECT_TYPE_WATERING_CAN);
        Require(board.mCursorObject->mCursorType==CURSOR_TYPE_WATERING_CAN,"Actual water-can pickup failed");
        if(input==0) {
            Plant* plant=nullptr;while(board.IteratePlants(plant))plant->mHighlighted=false;
            board.HighlightPlantsForMouse(x,y); // The existing settled-frame control.
            if(!gold && !miss)Require(plants[target]->mHighlighted,"Normal can hit the wrong pot");
        } else {
            auto& manager=*app.mWidgetManager;
            const auto origin=board.GetAbsPos();
            const auto* previous=plants[(target+1)%plants.size()];
            const int oldX=input==2?795:previous->mX+40;
            const int oldY=input==2?590:previous->mY+40;
            Require(!manager.mLastDownWidget && !manager.mDownButtons,"Water input starts with a captured button");
            manager.MouseMove(origin.mX+oldX,origin.mY+oldY);
            board.UpdateMousePosition(); // Last rendered frame at the previous position.
        }
        std::set<Coin*> oldCoins;Coin* coin=nullptr;
        while(board.IterateCoins(coin))oldCoins.insert(coin);
        const auto gridBaseline=board.mGridItems.mSize;
        const auto reanimBaseline=app.mEffectSystem->mReanimationHolder->mReanimations.mSize;
        if(input==0)board.MouseDownWithTool(x,y,1,CURSOR_TYPE_WATERING_CAN);
        else {
            auto& manager=*app.mWidgetManager;const auto origin=board.GetAbsPos();
            Require(manager.GetWidgetAt(origin.mX+x,origin.mY+y,nullptr,nullptr)==&board,
                "Rapid watering coordinates do not hit the board");
            const auto updates=board.mUpdateCnt;
            manager.MouseMove(origin.mX+x,origin.mY+y);
            manager.MouseDown(origin.mX+x,origin.mY+y,cancel?-1:1);
            manager.MouseUp(origin.mX+x,origin.mY+y,cancel?-1:1);
            Require(board.mUpdateCnt==updates && !manager.mLastDownWidget && !manager.mDownButtons &&
                !manager.mActualDownButtons,"Rapid click advanced the board or retained capture");
            log<<"routed-event input="<<input<<" target="<<target<<" gold="<<gold<<" board-updates=0"<<std::endl;
        }
        GridItem* tool=nullptr;GridItem* item=nullptr;
        while(board.IterateGridItems(item))if(item->mGridItemType==GRIDITEM_ZEN_TOOL) {
            Require(tool==nullptr,"One click created multiple watering tools");tool=item;
        }
        unsigned steps=0;bool good=(miss || cancel)?tool==nullptr:tool!=nullptr;
        if(tool) {
            const auto state=gold?GRIDITEM_STATE_ZEN_TOOL_GOLD_WATERING_CAN:GRIDITEM_STATE_ZEN_TOOL_WATERING_CAN;
            good &= tool->mGridItemState==state;
            auto* animation=app.ReanimationGet(tool->mGridItemReanimID);
            const auto id=tool->mGridItemReanimID;
            int first=0,frames=0;
            animation->GetFramesForLayer(gold?ReanimTrackId::anim_water_area:ReanimTrackId::anim_water,first,frames);
            good &= animation->mFrameStart==first && animation->mFrameCount==frames &&
                animation->mLoopType==REANIM_PLAY_ONCE_AND_HOLD;
            log<<"water gold="<<gold<<" target="<<target<<" state="<<int(tool->mGridItemState)
                <<" expected-state="<<int(state)<<" frames="<<first<<','<<frames;
            while(!tool->mDead && steps<2000) {
                // Use the actual reanimation/ZenToolUpdate chain; no forced
                // loop count or direct DoFeedingTool/PlantWatered invocation.
                animation->Update();garden.ZenToolUpdate(tool);++steps;
                if(!tool->mDead)for(const auto& pot:std::span(player.mPottedPlant,4))
                    Require(pot.mTimesFed==0,"Water applied before the animation completed");
            }
            Require(tool->mDead && steps<2000,"Watering animation never completed");
            Require(tool->mGridItemReanimID==REANIMATIONID_NULL,"Finished watering retained its owner ID");
            DeleteQueue(app);
            Require(app.ReanimationTryToGet(id)==nullptr,"Finished watering retained a live animation");
        }
        unsigned expectedCount=0;
        for(unsigned i=0;i<plants.size();++i) {
            const int cx=plants[i]->mX+40,cy=plants[i]->mY+40;
            const bool expected=!cancel && !miss && (gold?(cx>=x-70 && cx<x+90 && cy>=y-80 && cy<y+80):int(i)==target);
            expectedCount+=expected;
            good &= player.mPottedPlant[i].mTimesFed==int(expected);
            good &= expected?player.mPottedPlant[i].mLastWateredTime>0:player.mPottedPlant[i].mLastWateredTime==0;
        }
        unsigned dropped=0;coin=nullptr;
        while(board.IterateCoins(coin))if(!oldCoins.contains(coin)) {
            ++dropped;good &= coin->mType==COIN_SILVER;coin->Die();
        }
        good &= dropped==expectedCount;
        player.SaveDetails();PlayerInfo disk;disk.mId=player.mId;
        Require(disk.LoadDetails(),"Cannot reload the watering fixture profile");
        good &= !disk.mDetailsLoadRejected && disk.mNumPottedPlants==4;
        for(unsigned i=0;i<4;++i)good &= disk.mPottedPlant[i].mTimesFed==player.mPottedPlant[i].mTimesFed &&
            disk.mPottedPlant[i].mLastWateredTime==player.mPottedPlant[i].mLastWateredTime;
        DeleteQueue(app);
        Require(board.mGridItems.mSize==gridBaseline &&
            app.mEffectSystem->mReanimationHolder->mReanimations.mSize==reanimBaseline,
            "Watering test retained extra tool/reanimation objects");
        ++checked;wrong+=!good;
        log<<" input="<<input<<" gold="<<gold<<" target="<<target<<" steps="<<steps<<" silver="<<dropped
            <<" expected="<<expectedCount<<" pass="<<good<<std::endl;
    }
    log<<"zen-watering-cases="<<checked<<" wrong="<<wrong<<std::endl;
    Require(checked==40,"Watering input coverage incomplete");
    if(wrong==0)Report("portable-zen-30-routed-fast-clicks-cancel-no-board-update",app);
    return wrong==0;
}
}

namespace {
// Official 1073 PE 0071D398 / 0071D418. Native tests independently read all
// three complete tables directly from the SHA-identified original executable.
struct GardenPixel {int mX,mY;};
constexpr std::array<GardenPixel,8> kMushroomPositions{{{110,441},{237,360},{298,458},{355,296},{387,203},{460,385},{486,478},{552,283}}};
constexpr std::array<GardenPixel,8> kAquariumPositions{{{113,185},{306,85},{356,213},{522,105},{669,270},{122,355},{365,458},{504,417}}};

void GardenGridRoundTrips(LawnApp& app) {
    auto& board=*app.mBoard;auto& garden=*app.mZenGarden;auto& player=*app.mPlayerInfo;
    const PlayerInfo savedPlayer=player;
    Require(garden.mGardenType==GARDEN_MAIN&&board.mBackground==BACKGROUND_GREENHOUSE&&player.mNumPottedPlants==4,
        "Garden grid fixture must start in the restored four-pot greenhouse");
    std::ofstream log(ProbePath("zen-grid-1073-cases.txt"));Require(bool(log),"Cannot write garden grid evidence");
    player.mPurchases[STORE_ITEM_MUSHROOM_GARDEN]=1;player.mPurchases[STORE_ITEM_AQUARIUM_GARDEN]=1;
    player.mPurchases[STORE_ITEM_WHEEL_BARROW]=1;player.mPurchases[STORE_ITEM_TREE_OF_WISDOM]=0;
    // The preceding watering test intentionally ends with Stinky unpurchased.
    player.mPurchases[STORE_ITEM_STINKY_THE_SNAIL]=StinkyTimestamp::EncodeWakeTime(_time64(nullptr)-240);
    player.mHasSeenStinky=1;player.mHasWokenStinky=true;player.mLastStinkyChocolateTime=0;
    player.mNumPottedPlants=16;
    for(int i=4;i<16;++i) {
        auto& pot=player.mPottedPlant[i];pot.InitializePottedPlant(i<12?SEED_PUFFSHROOM:SEED_SEASHROOM);
        pot.mPlantAge=PLANTAGE_FULL;pot.mFeedingsPerGrow=5;pot.mY=0;
        pot.mWhichZenGarden=i<12?GARDEN_MUSHROOM:GARDEN_AQUARIUM;
        pot.mX=i<12?i-4:2*(i-12);
    }
    auto& renderer=*app.mDDInterface->mRenderInterface;auto* screen=app.mDDInterface->mScreenImage;
    auto pixels=[&](){renderer.Flush();return renderer.mRenderer->ReadScenePixels();};
    unsigned transitions=0,placements=0,shadows=0,goals=0;
    for(int cycle=0;cycle<2;++cycle) {
        for(int i=12;i<16;++i)player.mPottedPlant[i].mX=2*(i-12)+cycle;
        for(auto expected:{GARDEN_MUSHROOM,GARDEN_AQUARIUM,GARDEN_MAIN}) {
            garden.GotoNextGarden();++transitions;
            const auto expectedBackground=expected==GARDEN_MUSHROOM?BACKGROUND_MUSHROOM_GARDEN:
                expected==GARDEN_AQUARIUM?BACKGROUND_ZOMBIQUARIUM:BACKGROUND_GREENHOUSE;
            Require(app.mBoard==&board&&garden.mBoard==&board&&garden.mGardenType==expected&&board.mBackground==expectedBackground,
                "Real next-garden transition selected the wrong background or rebuilt the board");
            auto grids=garden.GetSpecialGridPlacements();
            Require(grids.size()==(expected==GARDEN_MAIN?32:8),"Real garden table size differs from 1073");
            unsigned found=0;Plant* plant=nullptr;
            while(board.IteratePlants(plant))if(!plant->mDead&&plant->mPottedPlantIndex>=0) {
                const int index=int(plant->mPottedPlantIndex);Require(index<player.mNumPottedPlants,"Garden created an invalid pot index");
                const auto& pot=player.mPottedPlant[index];Require(pot.mWhichZenGarden==expected,"Garden retained a plant from the previous room");
                if(expected!=GARDEN_MAIN) {
                    const auto& position=(expected==GARDEN_MUSHROOM?kMushroomPositions:kAquariumPositions).at(pot.mX);
                    Require(plant->mX==position.mX&&plant->mY==position.mY&&plant->mPlantCol==pot.mX&&plant->mRow==0,
                        "Placed plant coordinates differ from the original 1073 garden table");
                    ++placements;
                }
                ++found;
            }
            Require(found==(expected==GARDEN_MUSHROOM?8:4),"Real garden transition lost or duplicated potted plants");
            auto* snail=garden.GetStinky();
            log<<"snail-check garden="<<int(expected)<<" purchased="<<garden.HasPurchasedStinky()<<" present="<<(snail!=nullptr)<<" coins="<<board.mCoins.mSize<<std::endl;
            if(expected==GARDEN_MAIN) {
                Require(snail!=nullptr&&board.mCoins.mSize==0,"Main garden snail fixture requires a live snail and no coin target");
                snail->mGoalX=snail->mPosX;snail->mGoalY=snail->mPosY;garden.StinkyPickGoal(snail);
                Require(std::any_of(grids.begin(),grids.end(),[&](const auto& grid){return snail->mGoalX==grid.mPixelX+15&&snail->mGoalY==grid.mPixelY+80;}),
                    "Real snail target did not come from the main garden grid");
                ++goals;
            } else Require(snail==nullptr,"Secondary gardens must not create Stinky");
            if(expected==GARDEN_AQUARIUM) {
                for(auto cursor:{CURSOR_TYPE_NORMAL,CURSOR_TYPE_PLANT_FROM_WHEEL_BARROW,CURSOR_TYPE_WHEEELBARROW,CURSOR_TYPE_PLANT_FROM_GLOVE}) {
                    board.mCursorObject->mCursorType=cursor;
                    screen->FillRect(Sexy::Rect(0,0,800,600),Sexy::Color(13,19,23),0);
                    Sexy::Graphics actualGraphics(screen);garden.DrawBackdrop(&actualGraphics);const auto actual=pixels();
                    screen->FillRect(Sexy::Rect(0,0,800,600),Sexy::Color(13,19,23),0);
                    const auto background=pixels();Sexy::Graphics referenceGraphics(screen);
                    if(cursor!=CURSOR_TYPE_NORMAL)for(int col=0;col<8;++col)if(col%2!=cycle) {
                        const auto& position=kAquariumPositions[col];
                        TodDrawImageCelScaled(&referenceGraphics,Sexy::IMAGE_PLANTSHADOW,position.mX-35,position.mY+33,0,0,1.7f,1.7f);
                    }
                    const auto reference=pixels();Require(reference.size()==800*600&&actual==reference,"Aquarium empty-slot shadow GPU pixels differ from 1073 positions");
                    Require((reference!=background)==(cursor!=CURSOR_TYPE_NORMAL),"Aquarium shadow reference has the wrong visibility");
                    ++shadows;
                }
                board.mCursorObject->mCursorType=CURSOR_TYPE_NORMAL;
            }
            board.MarkAllDirty();Require(app.mWidgetManager->DrawScreen(),"Garden did not redraw after changing rooms");
            const auto frame=pixels();Require(frame.size()==800*600&&std::any_of(frame.begin(),frame.end(),[](auto p){return (p&0xffffffu)!=0;}),"New garden frame is empty");
            log<<"cycle="<<cycle<<" garden="<<int(expected)<<" grids="<<grids.size()<<" plants="<<found<<" snail-present="<<(snail!=nullptr);
            if(snail)log<<" goal="<<snail->mGoalX<<','<<snail->mGoalY;
            log<<std::endl;
        }
    }
    Require(transitions==6&&placements==24&&shadows==8&&goals==2,"Garden grid regression coverage incomplete");
    garden.LeaveGarden();DeleteQueue(app);
    player=savedPlayer;board.mCursorObject->mCursorType=CURSOR_TYPE_NORMAL;
    DeleteQueue(app);Pots(app);
    log<<"transitions="<<transitions<<" placements="<<placements<<" shadow-gpu="<<shadows<<" snail-goals="<<goals<<" restored=1"<<std::endl;
    Report("portable-zen-six-room-transitions-24-original-placements-eight-gpu-shadows",app);
}
}

void PortableZenSmokeTick(LawnApp& app) {
    static unsigned stage=0;static std::uint32_t started=0,deadline=0;static bool correct=false;
    static bool initialTime=false,timeBoundaries=false;
    Require(getenv("PVZ_MODERN_HIDDEN") && getenv("PVZ_APPDATA_DIR") && app.mNoSoundNeeded &&
        app.mGpuContext && !IsWindowVisible(app.mHWnd),
        "Zen probe is not hidden/isolated/silent");
    if(stage==0) {
        if(!app.mLoaded || !app.mTitleScreen || !app.mTitleScreen->mLoadingThreadComplete)return;
        app.LoadingCompleted();started=app.mUpdateCount;deadline=started+100;stage=1;return;
    }
    if(stage==4)return;
    Require(app.mUpdateCount-started<4000,"Zen probe timed out");
    if(app.mUpdateCount<deadline)return;
    if(stage==1) {
        auto& player=*app.mPlayerInfo;player.mFinishedAdventure=1;player.mLevel=50;
        const auto before=_time64(nullptr);
        player.mPurchases[STORE_ITEM_STINKY_THE_SNAIL]=before-240;
        player.mHasSeenStinky=1;player.mHasWokenStinky=true;player.mLastStinkyChocolateTime=0;
        player.mPurchases[STORE_ITEM_GOLD_WATERINGCAN]=0;
        player.mNumPottedPlants=4;
        constexpr std::array<std::array<int,2>,4> positions{{{1,1},{2,1},{1,2},{7,3}}};
        for(int i=0;i<4;++i) {
            auto& pot=player.mPottedPlant[i];pot.InitializePottedPlant(SEED_MARIGOLD);
            pot.mX=positions[i][0];pot.mY=positions[i][1];pot.mFeedingsPerGrow=5;
        }
        player.mPottedPlant[0].mLastNeedFulfilledTime=before-1200;
        app.mZenGarden->mGardenType=GARDEN_MAIN;
        app.KillGameSelector();
        SetCachedTime(*app.mZenGarden,before-7200);
        app.PreNewGame(GAMEMODE_LIMBO_ZEN_GARDEN,false);
        std::ofstream log(ProbePath("zen-time-cases.txt"));Require(bool(log),"Cannot write garden time evidence");
        initialTime=CheckFreshGardenTime(app,before,"garden-entry",log,true);
        app.mBoard->mCutScene->CancelIntro();stage=2;deadline=app.mUpdateCount+50;return;
    }
    if(stage==2) {
        if(app.mGameScene!=SCENE_PLAYING)return;
        Require(app.mBoard && app.mZenGarden->mBoard==app.mBoard && app.mBoard->mBackground==BACKGROUND_GREENHOUSE,
            "Zen startup did not initialize the real greenhouse");
        app.mBoard->mTutorialState=TUTORIAL_OFF;
        BugSprayPixels(app);
        Require(StinkyTimestampCases(app),"Stinky timestamp collides with unpurchased sentinel; see stinky-timestamp-cases.txt");
        StinkyCalendarCases(app);
        timeBoundaries=GardenTimeBoundaryCases(app);
        correct=WateringCases(app);
        GardenGridRoundTrips(app);
        // GPU icon/reference probes overwrite the diagnostic canvas. Redraw
        // the actual restored garden before capturing the gameplay result.
        app.mBoard->MarkAllDirty();
        Require(app.mWidgetManager->DrawScreen(),"Garden redraw failed after the GPU toolbar probe");
        Capture("zen-watering-finished",app);ProbeScreenshot(app);
        app.DoBackToMain();stage=3;deadline=app.mUpdateCount+50;return;
    }
    Require(!app.mBoard && app.mGameSelector,"Zen watering did not return to the actual menu");
    Require(correct,"Watering click target or animation semantics are wrong; see zen-watering-cases.txt");
    Require(initialTime && timeBoundaries,"Garden time boundaries differ from 1073; see zen-time-cases.txt");
    Report("portable-zen-entry-store-fresh-time-and-12-snail-boundaries",app);
    Report("portable-zen-ten-real-watering-animation-state-neighbours-and-save-cases",app);
    Report("PASS zen; ordinary/gold/miss, animation completion, silver drops, profile save and cleanup",app);
    app.CloseRequestAsync();stage=4;
}
