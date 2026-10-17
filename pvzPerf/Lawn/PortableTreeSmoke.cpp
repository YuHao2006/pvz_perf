#include "PortableTreeSmoke.h"
#include "PortablePoolTimingSmoke.h"
#include "ModernVulkanSmoke.h"
#include "PortableStoreRegistration.h"
#include "LawnApp.h"
#include "Board.h"
#include "Challenge.h"
#include "Cutscene.h"
#include "CursorObject.h"
#include "SeedPacket.h"
#include "GridItem.h"
#include "System/PlayerInfo.h"
#include "System/SaveGame.h"
#include "Widget/TitleScreen.h"
#include "Widget/GameButton.h"
#include "Widget/StoreScreen.h"
#include "Widget/LawnDialog.h"
#include "Resources.h"
#include "Sexy.TodLib/TodCommon.h"
#include "Sexy.TodLib/TodFoley.h"
#include "sound/SoundManager.h"
#include "graphics/DDInterface.h"
#include "graphics/DDImage.h"
#include "graphics/Graphics.h"
#include "graphics/RenderInterface.h"
#include "Sexy.TodLib/EffectSystem.h"
#include "Sexy.TodLib/Reanimator.h"
#include "widget/WidgetManager.h"
#include "graphics/GpuBackend.h"
#include <algorithm>
#include <array>
#include <cstddef>
#include <cstring>
#include <fstream>
#include <stdexcept>

namespace
{
using namespace ModernSmoke;
void Require(bool value, const char* message) { if (!value) throw std::runtime_error(message); }
bool ShovelCases(LawnApp& app, std::ostream& log)
{
    auto& board = *app.mBoard; auto& player = *app.mPlayerInfo;
    struct Restore
    {
        LawnApp& app; GameMode mode; int profileLevel, finished, boardLevel; bool shown;
        ~Restore(){ app.mGameMode = mode; app.mPlayerInfo->mLevel = profileLevel;
            app.mPlayerInfo->mFinishedAdventure = finished; app.mBoard->mLevel = boardLevel; app.mBoard->mShowShovel = shown; }
    } restore{app, app.mGameMode, player.mLevel, player.mFinishedAdventure, board.mLevel, board.mShowShovel};
    static_assert(GAMEMODE_TREE_OF_WISDOM == GAME_MODE_TREE_OF_WISDOM_VALUE &&
    GAMEMODE_PUZZLE_I_ZOMBIE_1 == GAME_MODE_PUZZLE_FIRST && GAMEMODE_PUZZLE_I_ZOMBIE_ENDLESS == GAME_MODE_PUZZLE_LAST);
    unsigned cases = 0, wrong = 0;
    for (int mode = 0; mode < NUM_GAME_MODES; ++mode) for (int level : {1, 4, 5, 15, 35, 50})
        for (int finished : {0, 1}) for (bool initiallyShown : {false, true})
        {
            app.mGameMode = static_cast<GameMode>(mode); player.mLevel = board.mLevel = level;
            player.mFinishedAdventure = finished; board.mShowShovel = initiallyShown;
            // 1073 0043F380 exclusions, expressed in the current GameMode enum.
            const bool excluded = mode == GAMEMODE_MINIGAME_WHACK_A_ZOMBIE ||
                mode == GAMEMODE_MINIGAME_WALLNUT_BOWLING || mode == GAMEMODE_MINIGAME_WALLNUT_BOWLING_2 ||
                mode == GAMEMODE_MINIGAME_BEGHOULED || mode == GAMEMODE_MINIGAME_BEGHOULED_TWIST ||
                mode == GAMEMODE_LIMBO_ZEN_GARDEN || mode == GAMEMODE_MINIGAME_ZOMBIQUARIUM ||
                mode == GAMEMODE_TREE_OF_WISDOM ||
                (mode >= GAMEMODE_PUZZLE_I_ZOMBIE_1 && mode <= GAMEMODE_PUZZLE_I_ZOMBIE_ENDLESS) ||
                (mode == GAMEMODE_ADVENTURE && (level == 5 || level == 15));
            const bool expected = initiallyShown || (!excluded && !(mode == GAMEMODE_ADVENTURE && !finished && level <= 4));
            board.mCutScene->ShowShovel(); ++cases;
            if (board.mShowShovel != expected)
            {
                ++wrong; log << "shovel mode=" << mode << " level=" << level << " finished=" << finished
                    << " initially=" << initiallyShown << " actual=" << board.mShowShovel << " expected=" << expected << '\n';
            }
        }
    log << "shovel-cases=" << cases << " wrong=" << wrong << std::endl;
    return wrong == 0;
}
bool AppearanceCases(LawnApp& app, std::ostream& log)
{
    const int index = app.GetCurrentChallengeIndex();
    auto& player = *app.mPlayerInfo;
    struct Restore { PlayerInfo& player; int index, height, food;
        ~Restore(){ player.mChallengeRecords[index] = height; player.mPurchases[STORE_ITEM_TREE_FOOD] = food; }
    } restore{player, index, player.mChallengeRecords[index], player.mPurchases[STORE_ITEM_TREE_FOOD]};
    auto& effects = *app.mEffectSystem; effects.ProcessDeleteQueue();
    const auto baseline = effects.mReanimationHolder->mReanimations.mSize;
    constexpr ReanimTrackId growthTracks[] = {
        ReanimTrackId::anim_grow1, ReanimTrackId::anim_grow2, ReanimTrackId::anim_grow3,
        ReanimTrackId::anim_grow4, ReanimTrackId::anim_grow5, ReanimTrackId::anim_grow6,
        ReanimTrackId::anim_grow7, ReanimTrackId::anim_grow8, ReanimTrackId::anim_grow9,
        ReanimTrackId::anim_grow10, ReanimTrackId::anim_grow11, ReanimTrackId::anim_grow12,
        ReanimTrackId::anim_grow13, ReanimTrackId::anim_grow14, ReanimTrackId::anim_grow15,
        ReanimTrackId::anim_grow16, ReanimTrackId::anim_grow17, ReanimTrackId::anim_grow18,
        ReanimTrackId::anim_grow19, ReanimTrackId::anim_grow20, ReanimTrackId::anim_grow21,
        ReanimTrackId::anim_grow22, ReanimTrackId::anim_grow23, ReanimTrackId::anim_grow24,
        ReanimTrackId::anim_grow25, ReanimTrackId::anim_grow26, ReanimTrackId::anim_grow27,
        ReanimTrackId::anim_grow28, ReanimTrackId::anim_grow29, ReanimTrackId::anim_grow30,
        ReanimTrackId::anim_grow31, ReanimTrackId::anim_grow32, ReanimTrackId::anim_grow33,
        ReanimTrackId::anim_grow34, ReanimTrackId::anim_grow35, ReanimTrackId::anim_grow36,
        ReanimTrackId::anim_grow37, ReanimTrackId::anim_grow38, ReanimTrackId::anim_grow39,
        ReanimTrackId::anim_grow40, ReanimTrackId::anim_grow41, ReanimTrackId::anim_grow42,
        ReanimTrackId::anim_grow43, ReanimTrackId::anim_grow44, ReanimTrackId::anim_grow45,
        ReanimTrackId::anim_grow46, ReanimTrackId::anim_grow47, ReanimTrackId::anim_grow48,
        ReanimTrackId::anim_grow49, ReanimTrackId::anim_grow50,
    };
    static_assert(std::size(growthTracks) == 50);
    bool passed = true;
    for (int height : {0, 1, 2, 50, 51, 100}) for (int food : {0, 999, 1000, 1003})
    {
        player.mChallengeRecords[index] = height; player.mPurchases[STORE_ITEM_TREE_FOOD] = food;
        Challenge scratch; scratch.TreeOfWisdomInit();
        auto* tree = app.ReanimationGet(scratch.mReanimChallenge);
        const auto track = growthTracks[std::clamp(height, 1, int(std::size(growthTracks))) - 1];
        Require(tree->GetTrackId(tree->FindTrackIndex(track)) == track, "Growth track absent from compiled tree");
        int first = 0, frames = 0; tree->GetFramesForLayer(track, first, frames);
        const bool firstAppearance = height <= 1 && food < PURCHASE_COUNT_OFFSET;
        const int expectedFirst = firstAppearance ? 0 : first;
        const int expectedFrames = firstAppearance ? first + frames : frames;
        const bool correct = tree->mFrameStart == expectedFirst && tree->mFrameCount == expectedFrames &&
            tree->mAnimTime == (firstAppearance ? 0.0f : 0.99f) && tree->mAnimRate == 18;
        log << "appearance height=" << height << " food=" << food << " range=" << tree->mFrameStart << ',' << tree->mFrameCount
            << " phase=" << tree->mAnimTime << " expected=" << expectedFirst << ',' << expectedFrames
            << " expected-phase=" << (firstAppearance ? 0 : 0.99f) << " pass=" << correct << std::endl;
        passed &= correct;
        app.RemoveReanimation(scratch.mReanimChallenge);
        for (auto id : scratch.mReanimClouds) app.RemoveReanimation(id);
        effects.ProcessDeleteQueue();
        Require(effects.mReanimationHolder->mReanimations.mSize == baseline, "Appearance fixture left a tree/cloud animation alive");
    }
    return passed;
}

bool ToolbarLayoutCases(LawnApp& app, std::ostream& log)
{
    auto& board=*app.mBoard;auto& player=*app.mPlayerInfo;
    struct Restore {
        LawnApp& app;GameMode mode;int finished;std::array<long,80> purchases;
        ~Restore(){app.mGameMode=mode;app.mPlayerInfo->mFinishedAdventure=finished;
            std::copy(purchases.begin(),purchases.end(),app.mPlayerInfo->mPurchases);}
    } restore{app,app.mGameMode,player.mFinishedAdventure,{}};
    std::copy(std::begin(player.mPurchases),std::end(player.mPurchases),restore.purchases.begin());
    static_assert(OBJECT_TYPE_WATERING_CAN==6 && OBJECT_TYPE_TREE_FOOD==14 && OBJECT_TYPE_NEXT_GARDEN==15);
    unsigned checked=0,wrong=0;
    const std::array<StoreItem,6> items{STORE_ITEM_FERTILIZER,STORE_ITEM_BUG_SPRAY,STORE_ITEM_PHONOGRAPH,
        STORE_ITEM_CHOCOLATE,STORE_ITEM_GARDENING_GLOVE,STORE_ITEM_WHEEL_BARROW};
    for(unsigned flags=0;flags<128;++flags) for(bool next:{false,true}) {
        app.mGameMode=GAMEMODE_LIMBO_ZEN_GARDEN;
        for(unsigned i=0;i<items.size();++i) player.mPurchases[items[i]]=(flags&(1u<<i))?PURCHASE_COUNT_OFFSET+3:0;
        player.mFinishedAdventure=(flags>>6)&1;
        player.mPurchases[STORE_ITEM_MUSHROOM_GARDEN]=next;
        player.mPurchases[STORE_ITEM_AQUARIUM_GARDEN]=0;player.mPurchases[STORE_ITEM_TREE_OF_WISDOM]=0;
        const std::array<bool,10> usable{true,bool(flags&1),bool(flags&2),bool(flags&4),bool(flags&8),
            bool(flags&16),bool(flags&64),bool(flags&32),false,next};
        // 1073 0040D7B0 includes NEXT_GARDEN in the completeness check,
        // skips TREE_FOOD, and increments by literal 70, not the image width.
        for(int object=6;object<=15;++object) {
            Rect actual(456,9,83,77);int expected=flags==127 && next?0:30;
            for(int preceding=6;preceding<object;++preceding) if(usable[preceding-6]) expected+=70;
            board.GetZenButtonRect(static_cast<GameObjectType>(object),actual);++checked;
            if(actual!=Rect(expected,9,83,77)) {++wrong;log<<"zen flags="<<flags<<" next="<<next<<" tool="<<object
                <<" x="<<actual.mX<<" expected="<<expected<<'\n';}
        }
    }
    app.mGameMode=GAMEMODE_TREE_OF_WISDOM;
    for(int origin:{-12,456}) for(int object=6;object<=15;++object) {
        Rect actual(origin,9,83,77);board.GetZenButtonRect(static_cast<GameObjectType>(object),actual);
        const int expected=object==14?30:origin;++checked;
        if(actual!=Rect(expected,9,83,77)) {++wrong;log<<"tree origin="<<origin<<" tool="<<object
            <<" x="<<actual.mX<<" expected="<<expected<<'\n';}
    }
    log<<"toolbar-layout-cases="<<checked<<" wrong="<<wrong<<std::endl;
    return wrong==0;
}

class TreePurchaseAnswers final : public Widget
{
    LawnApp& app;
    std::ostream& log;
    int scenario;
    unsigned updates=0;
public:
    unsigned answers=0;
    TreePurchaseAnswers(LawnApp& a,std::ostream& l,int s):app(a),log(l),scenario(s) {
        mMouseVisible=false;
        mWidgetFlagsMod.mAddFlags=WIDGETFLAGS_UPDATE;
        app.mWidgetManager->AddWidget(this);
    }
    ~TreePurchaseAnswers() override {if(mWidgetManager)mWidgetManager->RemoveWidget(this);}
    void Update() override {
        Require(++updates<500,"Purchase modal did not complete within 500 updates");
        auto* dialog=dynamic_cast<LawnDialog*>(app.GetDialog(scenario==0?DIALOG_NOT_ENOUGH_MONEY:DIALOG_STORE_PURCHASE));
        if(!dialog || dialog->mResult!=0x7fffffff)return;
        if(dialog->mButtonDelay>=0 && dialog->mUpdateCnt<=static_cast<std::uint32_t>(dialog->mButtonDelay))return;
        Require(answers<(scenario<2?1u:2u),"Unexpected extra purchase modal");
        const int reply=scenario==1 || (scenario==2 && answers==1)?Dialog::ID_NO:Dialog::ID_YES;
        log<<"purchase-modal scenario="<<scenario<<" ordinal="<<answers<<" reply="<<reply
            <<" header="<<dialog->mDialogHeader<<std::endl;
        ++answers;
        // Real derived-button dispatch and the existing nested WaitForResult loop.
        // Do not dereference dialog after dispatch: the application removes it.
        dialog->ButtonDepress(reply);
    }
};

bool TreePurchaseCases(LawnApp& app,std::ostream& log)
{
    Require(getenv("PVZ_APPDATA_DIR") && app.mDialogMap.empty(),"Purchase probe needs isolated storage/no dialogs");
    auto& board=*app.mBoard;
    PlayerInfo fixture=*app.mPlayerInfo;
    fixture.mId=107300;fixture.mName="Tree purchase probe";fixture.mDetailsLoadRejected=false;
    struct Restore {
        LawnApp& app;PlayerInfo* player;GameMode mode;FlagsMod flags;bool paused;Widget* focus;
        ~Restore(){app.mPlayerInfo=player;app.mGameMode=mode;app.mBoard->mWidgetFlagsMod=flags;
            app.mBoard->mPaused=paused;app.mWidgetManager->SetFocus(focus);}
    } restore{app,app.mPlayerInfo,app.mGameMode,board.mWidgetFlagsMod,board.mPaused,app.mWidgetManager->mFocusWidget};
    app.mPlayerInfo=&fixture;app.mGameMode=GAMEMODE_LIMBO_ZEN_GARDEN;
    // Modal waits must update the dialog/answer widget, but not advance the tree fixture underneath.
    board.mWidgetFlagsMod.mRemoveFlags|=WIDGETFLAGS_UPDATE;
    const auto widgets=app.mWidgetManager->mWidgets.size();
    static_assert(GAMEMODE_TREE_OF_WISDOM == GAME_MODE_TREE_OF_WISDOM_VALUE &&
    GAMEMODE_SURVIVAL_NORMAL_STAGE_1 >= GAME_MODE_SURVIVAL_FIRST &&
    GAMEMODE_SURVIVAL_NORMAL_STAGE_1 <= GAME_MODE_SURVIVAL_LAST);
    static_assert(GAMEMODE_SCARY_POTTER_1 == GAME_MODE_SCARY_POTTER_FIRST);
    unsigned checked=0,wrong=0;
    // 存档 v13：树高记录槽=GameMode 直下标（TREE_OF_WISDOM=71）；两侧邻槽做
    // 哨兵，断言购买只动 71 号槽。
    constexpr int kTreeSlot=(int)GameMode::GAMEMODE_TREE_OF_WISDOM;
    for(int adjacent:{0,7}) for(int scenario=0;scenario<4;++scenario) {
        for(int i=0;i<100;++i)fixture.mChallengeRecords[i]=1000+i;
        fixture.mChallengeRecords[kTreeSlot]=0;
        fixture.mChallengeRecords[kTreeSlot-1]=adjacent;fixture.mChallengeRecords[kTreeSlot+1]=adjacent;
        fixture.mPurchases[STORE_ITEM_TREE_OF_WISDOM]=0;fixture.mCoins=scenario==0?999:5000;
        std::array<int,100> records{};std::copy(std::begin(fixture.mChallengeRecords),std::end(fixture.mChallengeRecords),records.begin());
        std::array<long,80> purchases{};std::copy(std::begin(fixture.mPurchases),std::end(fixture.mPurchases),purchases.begin());
        const bool buy=scenario>=2;
        if(buy){records[kTreeSlot]=1;purchases[STORE_ITEM_TREE_OF_WISDOM]=1;}
        const int expectedCoins=fixture.mCoins-(buy?1000:0);
        fixture.SaveDetails();
        const std::string file=GetAppDataFolder()+StrFormat("user%d.dat64",fixture.mId);
        Require(app.FileExists(file),"Initial purchase fixture was not saved");
        unsigned answers=0;bool storeState=false;
        {
            StoreScreen store(&app);
            PortableStoreRegistration registration(app,store);
            store.StorePreload();
            TreePurchaseAnswers responder(app,log,scenario);
            store.PurchaseItem(STORE_ITEM_TREE_OF_WISDOM);
            answers=responder.answers;
            storeState=!store.mWaitForDialog && store.mGoToTreeNow==(scenario==3) &&
                store.mResult==(scenario==3?Dialog::ID_YES:0x7fffffff);
        }
        Require(app.mBoard==&board && app.mDialogMap.empty() && app.mDialogList.empty() &&
            app.mWidgetManager->mWidgets.size()==widgets,"Purchase left a modal/widget or changed boards");
        const bool memory=fixture.mCoins==expectedCoins &&
            std::equal(records.begin(),records.end(),fixture.mChallengeRecords) &&
            std::equal(purchases.begin(),purchases.end(),fixture.mPurchases);
        PlayerInfo loaded;loaded.mId=fixture.mId;
        Require(loaded.LoadDetails() && !loaded.mDetailsLoadRejected,"Purchase save could not be read back");
        const bool disk=loaded.mCoins==expectedCoins &&
            std::equal(records.begin(),records.end(),loaded.mChallengeRecords) &&
            std::equal(purchases.begin(),purchases.end(),loaded.mPurchases);
        const bool correct=memory && disk && storeState && answers==(buy?2u:1u);
        ++checked;wrong+=!correct;
        log<<"tree-purchase scenario="<<scenario<<" adjacent-before="<<adjacent
            <<" height="<<fixture.mChallengeRecords[kTreeSlot]
            <<" adjacent-after="<<fixture.mChallengeRecords[kTreeSlot-1]<<","<<fixture.mChallengeRecords[kTreeSlot+1]
            <<" memory="<<memory<<" disk="<<disk<<" store="<<storeState<<" answers="<<answers<<" pass="<<correct<<std::endl;
    }
    log<<"tree-purchase-real-modal-and-save-cases="<<checked<<" wrong="<<wrong<<std::endl;
    return wrong==0;
}

bool TreeGiftAndStockCases(LawnApp& app, std::ostream& log)
{
    auto& board=*app.mBoard;auto& player=*app.mPlayerInfo;
    Require(app.mCrazyDaveState==CRAZY_DAVE_OFF && !app.ReanimationTryToGet(app.mCrazyDaveReanimID),
        "Tree gift fixture needs no live Dave");
    Require(board.mStoreButton!=nullptr,"Tree gift fixture needs its store button");
    struct Restore {
        LawnApp& app;std::array<long,80> purchases;bool menuHidden,storeHidden;
        ~Restore(){app.CrazyDaveDie();std::copy(purchases.begin(),purchases.end(),app.mPlayerInfo->mPurchases);
            app.mBoard->mMenuButton->mBtnNoDraw=menuHidden;app.mBoard->mStoreButton->mBtnNoDraw=storeHidden;}
    } restore{app,{},board.mMenuButton->mBtnNoDraw,board.mStoreButton->mBtnNoDraw};
    std::copy(std::begin(player.mPurchases),std::end(player.mPurchases),restore.purchases.begin());
    static_assert(STORE_ITEM_TREE_FOOD==28 && STORE_ITEM_FIRSTAID==29);
    unsigned checked=0,wrong=0;
    for(long aid:{0L,1L}) for(long food:{0L,1000L,1007L}) for(bool skip:{false,true}) {
        player.mPurchases[STORE_ITEM_FIRSTAID]=aid;player.mPurchases[STORE_ITEM_TREE_FOOD]=food;
        std::array<long,80> expected{};std::copy(std::begin(player.mPurchases),std::end(player.mPurchases),expected.begin());
        expected[28]=1005;
        board.mMenuButton->mBtnNoDraw=true;board.mStoreButton->mBtnNoDraw=true;
        app.CrazyDaveEnter();app.CrazyDaveTalkIndex(3200);
        board.mCutScene->AdvanceCrazyDaveDialog(skip);
        const bool correct=std::equal(expected.begin(),expected.end(),player.mPurchases) &&
            !board.mMenuButton->mBtnNoDraw && !board.mStoreButton->mBtnNoDraw;
        ++checked;wrong+=!correct;
        log<<"tree-gift aid="<<aid<<" food="<<food<<" skip="<<skip<<" result-food="<<player.mPurchases[28]
            <<" result-aid="<<player.mPurchases[29]<<" pass="<<correct<<std::endl;
        app.CrazyDaveDie();app.mEffectSystem->ProcessDeleteQueue();
    }
    log<<"tree-gift-real-dialog-cases="<<checked<<" wrong="<<wrong<<std::endl;
    // Construct the real store but never register/show it or make a purchase.
    StoreScreen store(&app);unsigned stockChecks=0,stockWrong=0;
    for(auto item:{STORE_ITEM_TREE_FOOD,STORE_ITEM_FERTILIZER,STORE_ITEM_BUG_SPRAY})
        for(long stock:{0L,999L,1000L,1005L,1009L,1010L,1011L,1015L,1016L,1020L}) {
            player.mPurchases[item]=stock;
            const bool expected=item==STORE_ITEM_TREE_FOOD?stock>=1010:stock>1015;
            ++stockChecks;stockWrong+=store.IsItemSoldOut(item)!=expected;
        }
    log<<"store-consumable-stock-cases="<<stockChecks<<" wrong="<<stockWrong<<std::endl;
    return wrong==0 && stockWrong==0;
}

bool PickerCases(LawnApp& app,std::ostream& log)
{
    auto& board=*app.mBoard;
    struct Restore {
        LawnApp& app;GameMode mode;int level,numWaves,wave,stage,fade,next;
        std::array<bool,NUM_ZOMBIE_TYPES> allowed;
        std::array<std::byte,sizeof(Board::mZombiesInWave)> waves;
        ~Restore(){auto& b=*app.mBoard;app.mGameMode=mode;b.mLevel=level;b.mNumWaves=numWaves;
            b.mCurrentWave=wave;b.mChallenge->mSurvivalStage=stage;b.mBoardFadeOutCounter=fade;b.mNextSurvivalStageCounter=next;
            std::copy(allowed.begin(),allowed.end(),b.mZombieAllowed);
            std::memcpy(b.mZombiesInWave,waves.data(),waves.size());}
    } restore{app,app.mGameMode,board.mLevel,board.mNumWaves,board.mCurrentWave,
        board.mChallenge->mSurvivalStage,board.mBoardFadeOutCounter,board.mNextSurvivalStageCounter,{},{}};
    std::copy(std::begin(board.mZombieAllowed),std::end(board.mZombieAllowed),restore.allowed.begin());
    // Unused wave tails need not have initialized enum values; preserve their object representation.
    std::memcpy(restore.waves.data(),board.mZombiesInWave,restore.waves.size());
    unsigned checked=0,wrong=0;
    for(int pass=0;pass<100;++pass) {
        ZombiePicker picker;picker.mZombieCount=17;picker.mZombiePoints=91;
        std::fill(std::begin(picker.mZombieTypeCount),std::end(picker.mZombieTypeCount),33);
        for(int type=0;type<NUM_ZOMBIE_TYPES;++type)picker.mAllWavesZombieTypeCount[type]=100*pass+type+1;
        ZombiePickerInitForWave(&picker);
        bool correct=picker.mZombieCount==0 && picker.mZombiePoints==0;
        for(int type=0;type<NUM_ZOMBIE_TYPES;++type)
            correct &= picker.mZombieTypeCount[type]==0 && picker.mAllWavesZombieTypeCount[type]==100*pass+type+1;
        ++checked;wrong+=!correct;
        ZombiePickerInit(&picker);
        correct=picker.mZombieCount==0 && picker.mZombiePoints==0;
        for(int type=0;type<NUM_ZOMBIE_TYPES;++type)correct &= picker.mZombieTypeCount[type]==0 && picker.mAllWavesZombieTypeCount[type]==0;
        ++checked;wrong+=!correct;
    }
    log<<"picker-reset-cases="<<checked<<" wrong="<<wrong<<std::endl;
    app.mGameMode=GAMEMODE_SURVIVAL_ENDLESS_STAGE_3;board.mLevel=1;board.mCurrentWave=0;
    board.mBoardFadeOutCounter=-1;board.mNextSurvivalStageCounter=0;
    std::fill(std::begin(board.mZombieAllowed),std::end(board.mZombieAllowed),false);
    board.mZombieAllowed[ZOMBIE_NORMAL]=board.mZombieAllowed[ZOMBIE_REDEYE_GARGANTUAR]=true;
    unsigned violations=0,rounds=0;
    // Actual 20-wave generation. This changes only the isolated test process's RNG;
    // no production random algorithm or spawn formula is replaced.
    for(int flags:{10,50,110}) for(unsigned seed=1;seed<=12;++seed) {
        board.mChallenge->mSurvivalStage=flags/2;
        Require(board.GetSurvivalFlagsCompleted()==flags,"Picker fixture has wrong flags");
        Sexy::SRand(seed);board.PickZombieWaves();
        Require(board.mNumWaves==20,"Endless picker did not produce twenty waves");
        // 1073 0051BEA0 rounds with +/-0.5 before conversion, rather than truncating.
        const int normalLimit=flags==10?1:flags==50?21:50;
        const int flagLimit=flags==10?1:flags==50?22:50;
        int cumulative=0,flagReds=0,normalReds=0;
        for(int w=0;w<20;++w) {
            int inWave=0;const bool flag=w==9 || w==19;
            for(int slot=0;slot<MAX_ZOMBIES_IN_WAVE;++slot) {
                const auto type=board.mZombiesInWave[w][slot];if(type==ZOMBIE_INVALID)break;
                if(type!=ZOMBIE_REDEYE_GARGANTUAR)continue;
                if((flag && inWave>=flagLimit) || (!flag && cumulative>=normalLimit))++violations;
                ++inWave;++cumulative;if(flag)++flagReds;else ++normalReds;
            }
        }
        if(!flagReds || !normalReds)++violations;
        ++rounds;log<<"picker flags="<<flags<<" seed="<<seed<<" normal="<<normalReds<<" flag="<<flagReds
            <<" all="<<cumulative<<" violations-so-far="<<violations<<'\n';
    }
    log<<"picker-real-rounds="<<rounds<<" waves="<<rounds*20<<" violations="<<violations<<std::endl;
    return wrong==0 && violations==0;
}

bool ToolHitCases(LawnApp& app, std::ostream& log)
{
    auto& board = *app.mBoard;
    const int index = app.GetCurrentChallengeIndex();
    struct Restore {
        LawnApp& app; GameMode mode; int packets, index, height; CursorType cursor;
        ~Restore(){app.mGameMode=mode;app.mBoard->mSeedBank->mNumPackets=packets;
            app.mPlayerInfo->mChallengeRecords[index]=height;app.mBoard->mCursorObject->mCursorType=cursor;}
    } restore{app,app.mGameMode,board.mSeedBank->mNumPackets,index,
        app.mPlayerInfo->mChallengeRecords[index],board.mCursorObject->mCursorType};
    unsigned checked=0, wrong=0;
    // Literal 1073 dimensions and seed-bank increments, independent of resource getters.
    const std::array<int,5> extras{0,60,76,112,153};
    for (auto mode : {GAMEMODE_ADVENTURE,GAMEMODE_MINIGAME_SLOT_MACHINE,GAMEMODE_LIMBO_SQUIRREL,
                      GAMEMODE_LIMBO_ZEN_GARDEN,GAMEMODE_TREE_OF_WISDOM})
        for(int packets=6;packets<=10;++packets) {
            app.mGameMode=mode;board.mSeedBank->mNumPackets=packets;
            const int x=(mode==GAMEMODE_MINIGAME_SLOT_MACHINE || mode==GAMEMODE_LIMBO_SQUIRREL)?600:456+extras[packets-6];
            const auto rect=board.GetShovelButtonRect();++checked;
            wrong+=rect!=Rect(x,0,70,72);
        }
    app.mGameMode=restore.mode;board.mSeedBank->mNumPackets=restore.packets;
    for(int y : {0,71,72,86,87}) {
        HitResult hit{};board.MouseHitTest(65,y,&hit);++checked;
        const bool expected=y<72;
        wrong+=((hit.mObjectType==OBJECT_TYPE_TREE_FOOD)!=expected);
    }
    log<<"tool-rect-and-real-input-cases="<<checked<<" wrong="<<wrong<<std::endl;
    unsigned treeChecks=0, treeWrong=0;
    for(int height : {0,1,2,6,7,11,12,50}) {
        app.mPlayerInfo->mChallengeRecords[index]=height;
        const Rect expected=height<=1?Rect(310,275,175,175):height<7?Rect(290,255,205,195):
            height<12?Rect(290,215,205,225):Rect(280,155,225,305);
        for(int y=0;y<600;++y) for(int x=0;x<800;++x) {
            HitResult hit{&board,OBJECT_TYPE_SHOVEL};
            const bool actual=board.mChallenge->TreeOfWisdomHitTest(x,y,&hit)!=0;
            const bool inside=x>=expected.mX && x<expected.mX+expected.mWidth &&
                y>=expected.mY && y<expected.mY+expected.mHeight;
            ++treeChecks;
            treeWrong+=actual!=inside || hit.mObject!=nullptr ||
                hit.mObjectType!=(inside?OBJECT_TYPE_TREE_OF_WISDOM:OBJECT_TYPE_NONE);
        }
        // Exercise Board's dispatch, including the first-tree area missed by the old rectangle.
        board.mCursorObject->mCursorType=CURSOR_TYPE_TREE_FOOD;
        HitResult hit{};board.MouseHitTest(390,400,&hit);++treeChecks;
        treeWrong+=hit.mObjectType!=OBJECT_TYPE_TREE_OF_WISDOM;
    }
    log<<"tree-hit-pixel-and-dispatch-cases="<<treeChecks<<" wrong="<<treeWrong<<std::endl;
    return wrong==0 && treeWrong==0;
}

class ToolTestSound final : public SoundInstance
{
public:
    unsigned plays=0;bool playing=false;
    void Release() override {playing=false;}
    void SetBaseVolume(double) override {}
    void SetBasePan(int) override {}
    void AdjustPitch(double) override {}
    void SetVolume(double) override {}
    void SetPan(int) override {}
    bool Play(bool,bool) override {++plays;playing=true;return true;}
    void Stop() override {playing=false;}
    bool IsPlaying() override {return playing;}
    bool IsReleased() override {return !playing;}
};
class ToolTestSounds final : public SoundManager
{
public:
    ToolTestSound sound;unsigned requests=0,id=0;
    ToolTestSounds() { mInitialized = true; }
    bool LoadSound(unsigned,const std::string&) override {return true;}
    int LoadSound(const std::string&) override {return 0;}
    void ReleaseSound(unsigned) override {}
    void SetVolume(double) override {}
    bool SetBaseVolume(unsigned,double) override {return true;}
    bool SetBasePan(unsigned,int) override {return true;}
    SoundInstance* GetSoundInstance(unsigned value) override {++requests;id=value;return &sound;}
    void ReleaseSounds() override {}
    void ReleaseChannels() override {}
    void Flush() override {}
    void SetCooperativeWindow(HWND) override {}
    void StopAllSounds() override {sound.Stop();}
    int GetFreeSoundId() override {return 0;}
    int GetNumSounds() override {return 1;}
};
bool ToolSoundCases(LawnApp& app,std::ostream& log)
{
    auto& board=*app.mBoard;
    struct Restore {
        LawnApp& app;SoundManager* manager;TodFoley* foley;bool muted,paused;
        GameScenes scene;TutorialState tutorial;ChallengeState state;CursorType cursor;SeedType seed;
        std::array<long,80> purchases;int tap,buzzer;
        ~Restore(){app.mSoundManager=manager;app.mSoundSystem=foley;app.mMuteSoundsForCutscene=muted;
            app.mGameScene=scene;auto& b=*app.mBoard;b.mPaused=paused;b.mTutorialState=tutorial;
            b.mChallenge->mChallengeState=state;b.mCursorObject->mCursorType=cursor;b.mCursorObject->mType=seed;
            std::copy(purchases.begin(),purchases.end(),app.mPlayerInfo->mPurchases);SOUND_TAP2=tap;SOUND_BUZZER=buzzer;}
    } restore{app,app.mSoundManager,app.mSoundSystem,app.mMuteSoundsForCutscene,board.mPaused,
        app.mGameScene,board.mTutorialState,board.mChallenge->mChallengeState,
        board.mCursorObject->mCursorType,board.mCursorObject->mType,{},SOUND_TAP2,SOUND_BUZZER};
    std::copy(std::begin(app.mPlayerInfo->mPurchases),std::end(app.mPlayerInfo->mPurchases),restore.purchases.begin());
    // The silent fixture does not load real sounds. Distinct IDs verify selection without using an audio device.
    SOUND_TAP2=200;SOUND_BUZZER=201;app.mMuteSoundsForCutscene=false;board.mTutorialState=TUTORIAL_OFF;
    struct Tool {GameObjectType object;StoreItem item;CursorType cursor;};
    const std::array<Tool,4> tools{{
        {OBJECT_TYPE_FERTILIZER,STORE_ITEM_FERTILIZER,CURSOR_TYPE_FERTILIZER},
        {OBJECT_TYPE_BUG_SPRAY,STORE_ITEM_BUG_SPRAY,CURSOR_TYPE_BUG_SPRAY},
        {OBJECT_TYPE_CHOCOLATE,STORE_ITEM_CHOCOLATE,CURSOR_TYPE_CHOCOLATE},
        {OBJECT_TYPE_TREE_FOOD,STORE_ITEM_TREE_FOOD,CURSOR_TYPE_TREE_FOOD}}};
    unsigned checked=0,wrong=0;
    for(const auto& tool:tools) for(int stock:{0,999,1000,1001,1003}) for(int gate=0;gate<4;++gate) {
        ToolTestSounds sounds;TodFoley foley;
        app.mSoundManager=&sounds;app.mSoundSystem=&foley;
        app.mPlayerInfo->mPurchases[tool.item]=stock;board.mPaused=gate==1;
        app.mGameScene=gate==2?SCENE_MENU:SCENE_PLAYING;
        board.mChallenge->mChallengeState=gate==3?STATECHALLENGE_TREE_JUST_GREW:STATECHALLENGE_NORMAL;
        board.mCursorObject->mCursorType=CURSOR_TYPE_NORMAL;board.mCursorObject->mType=SEED_SUNFLOWER;
        board.PickUpTool(tool.object);
        const bool early=gate==1 || gate==2, blocked=early || (gate==3 && tool.object==OBJECT_TYPE_TREE_FOOD);
        const bool picked=!blocked && stock>1000;
        const unsigned expectedPlays=blocked?0:1;
        const bool correct=sounds.requests==expectedPlays && sounds.sound.plays==expectedPlays &&
            (blocked || sounds.id==(picked?200u:201u)) &&
            board.mCursorObject->mCursorType==(picked?tool.cursor:CURSOR_TYPE_NORMAL) &&
            board.mCursorObject->mType==(early?SEED_SUNFLOWER:SEED_NONE) &&
            app.mPlayerInfo->mPurchases[tool.item]==stock;
        ++checked;if(!correct){++wrong;log<<"tool-sound object="<<int(tool.object)<<" stock="<<stock<<" gate="<<gate
            <<" requests="<<sounds.requests<<" plays="<<sounds.sound.plays<<" sound="<<sounds.id<<'\n';}
        sounds.StopAllSounds();SoundSystemReleaseFinishedInstances(&foley);
        app.mSoundManager=restore.manager;app.mSoundSystem=restore.foley;
    }
    log<<"tool-pickup-sound-cases="<<checked<<" wrong="<<wrong<<std::endl;
    return wrong==0;
}

bool ToolbarPixels(LawnApp& app,std::ostream& log)
{
    auto& board=*app.mBoard;auto& challenge=*board.mChallenge;
    struct Restore {
        LawnApp& app;long food;CursorType cursor;ChallengeState state;int counter;bool hidden;
        ~Restore(){app.mPlayerInfo->mPurchases[STORE_ITEM_TREE_FOOD]=food;
            auto& b=*app.mBoard;b.mCursorObject->mCursorType=cursor;b.mChallenge->mChallengeState=state;
            b.mChallenge->mChallengeStateCounter=counter;b.mMenuButton->mBtnNoDraw=hidden;b.MarkAllDirty();}
    } restore{app,app.mPlayerInfo->mPurchases[STORE_ITEM_TREE_FOOD],board.mCursorObject->mCursorType,
        challenge.mChallengeState,challenge.mChallengeStateCounter,board.mMenuButton->mBtnNoDraw};
    board.mMenuButton->mBtnNoDraw=false;
    auto* screen=app.mDDInterface->mScreenImage;auto& render=*app.mDDInterface->mRenderInterface;
    const auto* cpu=screen->mBits;const auto version=screen->mBitsChangedCount;
    unsigned errors=0,cases=0;
    for(int variant=0;variant<6;++variant) {
        const int charges=(variant&1)?3:0;const bool blocked=variant==2 || variant==3;
        const bool held=variant==4,fade=variant==5;
        app.mPlayerInfo->mPurchases[STORE_ITEM_TREE_FOOD]=PURCHASE_COUNT_OFFSET+charges;
        board.mCursorObject->mCursorType=held?CURSOR_TYPE_TREE_FOOD:CURSOR_TYPE_NORMAL;
        challenge.mChallengeState=fade?STATECHALLENGE_ZEN_FADING:(blocked?STATECHALLENGE_TREE_JUST_GREW:STATECHALLENGE_NORMAL);
        challenge.mChallengeStateCounter=25;
        const int y=fade?-36:0; // 50 -> 0 ease-in/out midpoint at 25.
        screen->FillRect(Rect(0,0,800,600),Color(18,26,34),0);
        Graphics actual(screen);board.DrawZenButtons(&actual);render.Flush();
        const auto actualPixels=render.mRenderer->ReadScenePixels();
        screen->FillRect(Rect(0,0,800,600),Color(18,26,34),0);
        Graphics expected(screen);
        // Independent original layout: tree food at x30, icon x24, count x94;
        // NEXT_GARDEN has its own x564 rectangle and image offset +2.
        expected.DrawImage(IMAGE_SHOVELBANK,30,y);
        if(!held) {
            if(charges==0 || blocked){expected.mColorizeImages = true;expected.mColor = Color(128,128,128);}
            expected.DrawImage(IMAGE_TREEFOOD,24,y-7);expected.mColorizeImages = false;
            TodDrawString(&expected,StrFormat("x%d",charges),94,y+65,FONT_HOUSEOFTERROR16,Color::White,DS_ALIGN_RIGHT);
        }
        expected.DrawImage(IMAGE_ZEN_NEXTGARDEN,566,y);render.Flush();
        const auto reference=render.mRenderer->ReadScenePixels();
        unsigned delta=0;for(std::size_t i=0;i<reference.size();++i) delta+=actualPixels[i]!=reference[i];
        errors+=delta;++cases;log<<"toolbar-pixels variant="<<variant<<" errors="<<delta<<std::endl;
    }
    Require(screen->mBits==cpu && screen->mBitsChangedCount==version,"Toolbar probe modified CPU screen storage");
    log<<"toolbar-gpu-cases="<<cases<<" errors="<<errors<<std::endl;return errors==0;
}
}

void PortableTreeSmokeTick(LawnApp& app)
{
    using namespace ModernSmoke;
    static unsigned stage = 0;
    static std::uint32_t started = 0, deadline = 0, feedStarted = 0;
    static int recordIndex = -1;
    static ReanimationID savedTree = REANIMATIONID_NULL;
    Require(getenv("PVZ_MODERN_HIDDEN") && getenv("PVZ_APPDATA_DIR") && app.mNoSoundNeeded &&
        app.mGpuContext && !IsWindowVisible(app.mHWnd), "Tree probe is not hidden/isolated/silent");
    if (stage == 0)
    {
        if (!app.mLoaded || !app.mTitleScreen || !app.mTitleScreen->mLoadingThreadComplete) return;
        app.LoadingCompleted(); started = app.mUpdateCount; deadline = started + 100; stage = 1; return;
    }
    if (stage == 7) return;
    Require(app.mUpdateCount - started < 4000, "Tree regression timed out");
    if (app.mUpdateCount < deadline) return;
    if (stage == 1)
    {
        app.KillGameSelector(); app.mPlayerInfo->mFinishedAdventure = 1; app.mPlayerInfo->mLevel = 50;
        app.mGameMode = GAMEMODE_TREE_OF_WISDOM; recordIndex = app.GetCurrentChallengeIndex();
        app.mPlayerInfo->mChallengeRecords[recordIndex] = 2;
        app.mPlayerInfo->mPurchases[STORE_ITEM_TREE_FOOD] = PURCHASE_COUNT_OFFSET + 3;
        app.PreNewGame(GAMEMODE_TREE_OF_WISDOM, false); app.mBoard->mCutScene->CancelIntro();
        stage = 2; return;
    }
    if (stage == 2)
    {
        if (app.mGameScene != SCENE_PLAYING) return;
        auto& board = *app.mBoard;
        Require(board.CanInteractWithBoardButtons(), "Tree input is blocked before the probe");
        std::ofstream log(ProbePath("tree-cases.txt")); Require(bool(log), "Cannot write tree evidence");
        const auto toolbar = board.GetShovelButtonRect();
        const int x = 30 + toolbar.mWidth / 2, y = toolbar.mY + toolbar.mHeight / 2;
        HitResult hit{}; board.MouseHitTest(x, y, &hit);
        const bool input = !board.mShowShovel && hit.mObjectType == OBJECT_TYPE_TREE_FOOD;
        log << "startup-show-shovel=" << board.mShowShovel << " toolbar-hit=" << int(hit.mObjectType)
            << " expected-food=" << int(OBJECT_TYPE_TREE_FOOD) << " pass=" << input << std::endl;
        const bool shovel = ShovelCases(app, log);
        const bool appearance = AppearanceCases(app, log);
        const bool layout = ToolbarLayoutCases(app, log);
        const bool pixels = ToolbarPixels(app, log);
        const bool hitCases = ToolHitCases(app, log);
        const bool sounds = ToolSoundCases(app, log);
        const bool gifts = TreeGiftAndStockCases(app, log);
        const bool picker = PickerCases(app, log);
        const bool purchase = TreePurchaseCases(app, log);
        HitResult oldSlot{};board.MouseHitTest(toolbar.mX+toolbar.mWidth/2,y,&oldSlot);
        const bool oldSlotClear=oldSlot.mObjectType!=OBJECT_TYPE_TREE_FOOD;
        log<<"original-food-x=30 hit="<<input<<" old-slot-has-no-food="<<oldSlotClear<<std::endl;
        Require(input && shovel && appearance && layout && pixels && oldSlotClear && hitCases && sounds && gifts && picker && purchase,
            "Tree differs from 1073; see tree-cases.txt");
        Report("portable-tree-purchase-eight-modal-and-save-cases",app);
        Report("portable-tree-gift-stock-and-endless-picker-cumulative-counts",app);
        Report("portable-tree-original-tool-height-small-tree-hit-and-pickup-sounds",app);
        Report("portable-tree-toolbar-original-layout-pixels-and-hit",app);
        Report("portable-tree-shovel-all-modes-and-24-appearance-cases", app);
        PortablePoolTimingSmoke(app);
        board.MouseDown(x, y, 1); board.MouseUp(x, y, 1);
        Require(board.mCursorObject->mCursorType == CURSOR_TYPE_TREE_FOOD, "Tree food click picked an invisible shovel");
        board.MouseDown(390, 330, 1); board.MouseUp(390, 330, 1);
        Require(app.mPlayerInfo->mPurchases[STORE_ITEM_TREE_FOOD] == PURCHASE_COUNT_OFFSET + 2 &&
            board.mCursorObject->mCursorType == CURSOR_TYPE_NORMAL && !board.mChallenge->TreeOfWisdomCanFeed(),
            "Actual feeding did not consume exactly one food/start its tool animation");
        feedStarted = app.mUpdateCount; stage = 3; return;
    }
    if (stage == 3)
    {
        auto& board = *app.mBoard;
        if (board.mChallenge->TreeOfWisdomGetSize() == 2)
        { Require(app.mUpdateCount - feedStarted < 600, "Tree food animation never grew the tree"); return; }
        Require(board.mChallenge->TreeOfWisdomGetSize() == 3 &&
            app.mPlayerInfo->mPurchases[STORE_ITEM_TREE_FOOD] == PURCHASE_COUNT_OFFSET + 2, "Tree feeding grew/spent more than once");
        board.Pause(true); savedTree = board.mChallenge->mReanimChallenge;
        std::ofstream log(ProbePath("tree-cases.txt"), std::ios::app);
        Require(bool(log), "Cannot append tree evidence");
        log << "fed-once-grown-to=3 updates=" << app.mUpdateCount - feedStarted << std::endl;
        Report("portable-tree-real-food-click-animation-and-growth", app);
        Require(LawnSaveGame(&board, ProbePath("tree.dat64")), "Cannot save tree fixture");
        app.DoBackToMain(); deadline = app.mUpdateCount + 50; stage = 4; return;
    }
    if (stage == 4)
    {
        Require(!app.mBoard && app.mGameSelector, "Tree did not leave to the menu");
        app.KillGameSelector(); app.mGameMode = GAMEMODE_TREE_OF_WISDOM; app.MakeNewBoard();
        Require(app.mBoard->LoadGame(ProbePath("tree.dat64")), "Cannot reload tree dat64");
        app.mBoard->Pause(true); deadline = app.mUpdateCount + 50; stage = 5; return;
    }
    if (stage == 5)
    {
        auto& board = *app.mBoard;
        Require(!board.mShowShovel && board.mChallenge->mReanimChallenge == savedTree && app.ReanimationTryToGet(savedTree) &&
            board.mChallenge->TreeOfWisdomGetSize() == 3 && app.mPlayerInfo->mPurchases[STORE_ITEM_TREE_FOOD] == PURCHASE_COUNT_OFFSET + 2,
            "Tree dat64 lost its animation/toolbar/profile state");
        board.MarkAllDirty(); if (!app.mWidgetManager->DrawScreen()) return;
        Capture("tree-restored", app); ProbeScreenshot(app);
        Report("portable-tree-dat64-menu-reload", app);
        app.DoBackToMain(); deadline = app.mUpdateCount + 50; stage = 6; return;
    }
    Require(!app.mBoard && app.mGameSelector, "Final tree cleanup did not return to menu");
    Report("PASS tree; original shovel exclusions, appearance, feeding and dat64", app);
    app.CloseRequestAsync(); stage = 7;
}
