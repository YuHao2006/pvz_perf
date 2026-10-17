#include "PortableFixesSmoke.h"
#include "ModernVulkanSmoke.h"
#include "LawnApp.h"
#include "Board.h"
#include "System/PlayerInfo.h"
#include "System/DataSync.h"
#include "Widget/AchievementsWidget.h"
#include <algorithm>
#include <array>
#include <cstring>
#include <cstdint>
#include <fstream>
#include <iterator>
#include <limits>
#include <memory>
#include <stdexcept>
#include <type_traits>

namespace {
void Require(bool ok,const char* message){if(!ok) throw std::runtime_error(message);}
using Bytes=std::vector<unsigned char>;
Bytes Encode(PlayerInfo& player) {
    DataWriter writer;writer.OpenMemory();DataSync sync(writer);
    Require(player.SyncDetails(sync),"Cannot encode completion fixture");
    const auto* data=static_cast<const unsigned char*>(writer.GetDataPtr());
    return {data,data+writer.GetDataLen()};
}
// v3 模式面：1073 的完成记账族在 v1 枚举上是"非冒险 ∧ 非生存 ∧ 非谜题/花瓶"
//（IsAdventureMode/IsSurvivalMode/IsPuzzleMode 谓词在 v1 值域的同语义）；v3
// 改名聚簇后即 MINIGAME∪LIMBO∪INTRO∪TREE∪CUSTOM（枚举值 1..35、71、72）。
bool OriginalCompletionFamily(int mode) {
    return mode!=0 && !(mode>=36 && mode<=70);
}
// 存档 v13：小游戏完成位槽=MINIGAME 区间即槽（1..20 → 槽 0..19）。
bool HasCompletionSlot(int mode){return mode>=(int)GameMode::GAMEMODE_MINIGAME_BEGHOULED && mode<=(int)GameMode::GAMEMODE_MINIGAME_ZOMBIQUARIUM;}
struct GuardedPlayer {
    std::array<unsigned char,64> before;
    PlayerInfo player;
    std::array<unsigned char,64> after;
};

void OriginalAchievementConditions(LawnApp& app,Board& board,PlayerInfo& player){
    std::ofstream log(ModernSmoke::ProbePath("postgame-achievement-conditions.txt"));
    Require(bool(log),"Cannot write original achievement condition evidence");
    unsigned cases=0,wrong=0,repeatWrong=0;
    std::array<unsigned,9> byBackground{};
    static_assert(BACKGROUND_ZOMBIQUARIUM==8);
    // Keep the oracle in retail numbering; translate only the game's input.
    // Conveyor status is an input, not a proof of that helper's policy.
    constexpr int retailModeCount=std::size(kGameModeRemapV1ToV3);
    for(int retailMode=0;retailMode<retailModeCount;++retailMode)for(int profileLevel:{1,5,15,35,50})
    for(int boardLevel:{3,50})for(int background=0;background<9;++background)for(unsigned flags=0;flags<16;++flags){
        const auto mode=kGameModeRemapV1ToV3[retailMode];
        app.mGameMode=mode;player.mLevel=profileLevel;player.mFinishedAdventure=1;
        board.mLevel=boardLevel;board.mBackground=static_cast<BackgroundType>(background);
        board.mPeaShooterUsed=(flags&1)!=0;board.mCatapultPlantsUsed=(flags&2)!=0;
        board.mMushroomsUsed=(flags&4)!=0;board.mMushroomAndCoffeeBeansOnly=(flags&8)!=0;
        std::fill_n(player.mMiniGamesCompleted,20,false);
        std::fill_n(player.mEarnedAchievements,MAX_ACHIEVEMENTS,false);
        std::fill_n(player.mShownAchievements,MAX_ACHIEVEMENTS,false);
        std::array<bool,MAX_ACHIEVEMENTS> expected{};
        const bool family=retailMode==0||(retailMode>=1&&retailMode<=15)||(retailMode>=51&&retailMode<=70);
        const bool excluded=retailMode==30||(retailMode==0&&profileLevel==15)||(retailMode>=51&&retailMode<=60)||
            (retailMode==0&&profileLevel==35)||retailMode==17||retailMode==33||(retailMode==0&&profileLevel==5);
        if(family&&!excluded){
            expected[HomeSecurity]=retailMode==0&&boardLevel==50;
            expected[DontPea]=background==2&&!(flags&1);
            expected[Grounded]=(background==4||background==5)&&!board.HasConveyorBeltSeedBank()&&!(flags&2);
            const bool night=background==1||background==3||background==5||background==6||background==8;
            expected[NoFungusAmongUs]=night&&!(flags&4);
            expected[GoodMorning]=!night&&(flags&8);
        }
        const bool wantAny=std::any_of(expected.begin(),expected.end(),[](bool b){return b;});
        const bool granted=board.CheckForPostGameAchievements();
        const bool pass=granted==wantAny&&std::equal(expected.begin(),expected.end(),player.mEarnedAchievements)&&
            std::none_of(std::begin(player.mShownAchievements),std::end(player.mShownAchievements),[](bool b){return b;});
        if(!pass){
            if(wrong<12)log<<"retail="<<retailMode<<" modern="<<int(mode)<<" profile="<<profileLevel<<" board="<<boardLevel<<" bg="<<background
                <<" flags="<<flags<<" home="<<player.mEarnedAchievements[HomeSecurity]<<'/'<<expected[HomeSecurity]
                <<" morning="<<player.mEarnedAchievements[GoodMorning]<<'/'<<expected[GoodMorning]<<std::endl;
            ++wrong;++byBackground[background];
        }
        const auto first=std::to_array(player.mEarnedAchievements);
        const bool repeat=board.CheckForPostGameAchievements();
        repeatWrong+=repeat||!std::equal(first.begin(),first.end(),player.mEarnedAchievements);
        ++cases;
    }
    log<<"cases="<<cases<<" wrong="<<wrong<<" repeatWrong="<<repeatWrong<<" backgroundWrong=";
    for(auto n:byBackground)log<<n<<',';
    log<<std::endl;
    Require(cases==retailModeCount*5*2*9*16&&!wrong&&!repeatWrong,
        "Postgame achievement conditions differ from the 1073 mode/map/plant table");
    ModernSmoke::Report("portable-postgame-original-mode-map-plant-table-repeat",app);
}
}

void PortableMiniGameCompletionSmoke(LawnApp& app) {
    using namespace ModernSmoke;
    Require(app.mBoard && getenv("PVZ_MODERN_HIDDEN") && getenv("PVZ_APPDATA_DIR"),
        "Completion fixture must run on an isolated hidden board");
    auto& board=*app.mBoard;
    struct Restore {
        LawnApp& app;Board& board;PlayerInfo* player;GameMode mode;int level;BackgroundType background;
        bool pea,catapult,mushrooms,onlyMushrooms;
        ~Restore(){
            app.mPlayerInfo=player;app.mGameMode=mode;board.mLevel=level;board.mBackground=background;
            board.mPeaShooterUsed=pea;board.mCatapultPlantsUsed=catapult;board.mMushroomsUsed=mushrooms;
            board.mMushroomAndCoffeeBeansOnly=onlyMushrooms;
        }
    };
    // Give inactive records/padding known storage bytes before construction;
    // the representation comparison must not depend on uninitialized stack data.
    alignas(GuardedPlayer) std::array<std::byte,sizeof(GuardedPlayer)> storage;
    storage.fill(std::byte{0xcc});
    auto& guarded=*std::construct_at(reinterpret_cast<GuardedPlayer*>(storage.data()));
    struct Destroy {GuardedPlayer& value;~Destroy(){std::destroy_at(&value);}} destroy{guarded};
    Restore restore{app,board,app.mPlayerInfo,app.mGameMode,board.mLevel,board.mBackground,
        board.mPeaShooterUsed,board.mCatapultPlantsUsed,board.mMushroomsUsed,board.mMushroomAndCoffeeBeansOnly};
    guarded.before.fill(0xa5);guarded.after.fill(0x5a);
    auto& player=guarded.player;
    app.mPlayerInfo=&player;
    board.mLevel=1;board.mBackground=BACKGROUND_1_DAY;
    board.mPeaShooterUsed=true;board.mCatapultPlantsUsed=true;board.mMushroomsUsed=true;
    board.mMushroomAndCoffeeBeansOnly=false;
    std::ofstream log(ProbePath("minigame-completion-bounds.txt"));
    Require(bool(log),"Cannot write completion evidence");
    static_assert(sizeof(bool)==1 && std::extent_v<decltype(PlayerInfo::mMiniGamesCompleted)> == 20);
    const auto offset=[&](const void* field){
        return reinterpret_cast<std::uintptr_t>(field)-reinterpret_cast<std::uintptr_t>(&player);
    };
    const auto flagsOffset=offset(player.mMiniGamesCompleted);
    const auto rejectedOffset=offset(&player.mDetailsLoadRejected);
    log<<"sizeof-player="<<sizeof(player)<<" flags-offset="<<flagsOffset
        <<" load-rejected-offset="<<rejectedOffset<<" delta="<<rejectedOffset-flagsOffset<<'\n';

    // Model the ORIGINAL branch using integers only. Do not execute its UB or
    // dereference the out-of-bounds target, even inside a padded fixture.
    // 原版按 v1 值算槽（mode-16）：族内无槽模式（limbo/intro/tree/custom）在
    // 原式下会越界写。见证行按 v3→v1 回映射显示原版会落到的下标。
    const auto legacySlot=[&](int v3Mode){
        for(int m=0;m<72;++m) if((int)kGameModeRemapV1ToV3[m]==v3Mode) return m-16;
        return -1;  // v3 72（自制关卡）没有 v1 对应值
    };
    unsigned oldUnsafe=0;
    for(int mode=0;mode<NUM_GAME_MODES;++mode) if(OriginalCompletionFamily(mode) && !HasCompletionSlot(mode)) {
        const int slot=legacySlot(mode);
        ++oldUnsafe;
        log<<"old-routing-witness mode="<<mode<<" legacy-index="<<slot<<" count=20 target-offset="
            <<flagsOffset+slot<<" aliases-load-rejected="<<(flagsOffset+slot==rejectedOffset)<<'\n';
    }
    // v3 无槽族模式 = LIMBO 14 + INTRO 1 + TREE 1 + CUSTOM 1。
    Require(oldUnsafe==17,"Mode inventory no longer matches the audited original routing");
    unsigned cases=0;
    const auto reset=[&](){
        player.Reset();player.mName="isolated-completion";player.mId=1700000;player.mUseSeq=0;
        player.mCoins=1234;
        for(int i=0;i<100;++i) player.mChallengeRecords[i]=700+i;
    };
    const auto invoke=[&](int mode,bool expectedAward,const std::array<bool,20>& expectedFlags){
        app.mGameMode=static_cast<GameMode>(mode);
        // Copy object representation, not inactive Zombatar members as typed
        // values. Every byte except the specified bool slots must remain intact.
        std::array<unsigned char,sizeof(PlayerInfo)> expectedBytes{},actualBytes{};
        std::memcpy(expectedBytes.data(),&player,sizeof(player));
        for(std::size_t i=0;i<expectedFlags.size();++i)
            std::memcpy(expectedBytes.data()+flagsOffset+i,&expectedFlags[i],sizeof(bool));
        const bool expectedEarned=player.mEarnedAchievements[BeyondTheGrave] || expectedAward;
        std::memcpy(expectedBytes.data()+offset(&player.mEarnedAchievements[BeyondTheGrave]),&expectedEarned,sizeof(bool));
        const bool awarded=board.CheckForPostGameAchievements();
        std::memcpy(actualBytes.data(),&player,sizeof(player));
        Require(actualBytes==expectedBytes,"Completion changed an unrelated player field or padding");
        Require(std::all_of(guarded.before.begin(),guarded.before.end(),[](auto b){return b==0xa5;}) &&
            std::all_of(guarded.after.begin(),guarded.after.end(),[](auto b){return b==0x5a;}),
            "Completion wrote outside its player object");
        Require(awarded==expectedAward && !player.mShownAchievements[BeyondTheGrave],
            "Completion achievement return or deferred notification changed");
        Require(std::equal(expectedFlags.begin(),expectedFlags.end(),player.mMiniGamesCompleted),
            "Completion set the wrong persisted mode slot");
        ++cases;
    };
    std::vector<int> modes;
    for(int mode=0;mode<NUM_GAME_MODES;++mode) modes.push_back(mode);
    // Do not static_cast out-of-range integers into this unfixed enum: that
    // conversion itself would be UB. Invalid numbers are integer-only checks.
    Require(!HasCompletionSlot(-1) && !HasCompletionSlot((std::numeric_limits<int>::max)()),
        "Invalid integer passed the completion-domain check");
    for(int mode:modes) {
        reset();std::array<bool,20> flags{};
        if(HasCompletionSlot(mode)) flags[static_cast<unsigned>(mode-(int)GameMode::GAMEMODE_MINIGAME_BEGHOULED)]=true;
        invoke(mode,false,flags);
        // The original still reconciles a fully completed array on hidden
        // modes. Preserve that timing instead of restricting the whole block.
        reset();flags.fill(true);
        std::copy(flags.begin(),flags.end(),player.mMiniGamesCompleted);
        invoke(mode,OriginalCompletionFamily(mode),flags);
        log<<"mode="<<mode<<" single-slot-and-full-reconciliation=PASS\n";
    }
    for(int missing=0;missing<20;++missing) {
        reset();std::array<bool,20> flags;flags.fill(true);flags[missing]=false;
        std::copy(flags.begin(),flags.end(),player.mMiniGamesCompleted);
        flags[missing]=true;
        invoke(missing+(int)GameMode::GAMEMODE_MINIGAME_BEGHOULED,true,flags); // Every possible last completion.
        invoke(missing+(int)GameMode::GAMEMODE_MINIGAME_BEGHOULED,false,flags); // No duplicate notification/result.
    }
    reset();player.mDetailsLoadRejected=true;
    invoke(36,false,{}); // Never clear an already legitimate read-rejection flag.
    Require(player.mDetailsLoadRejected,"Completion cleared the rejected-save state");

    reset();std::array<bool,20> pattern{};
    for(int i=0;i<20;++i) if(i%3==1) pattern[i]=true;
    std::copy(pattern.begin(),pattern.end(),player.mMiniGamesCompleted);
    const auto before=Encode(player);
    invoke(GAMEMODE_LIMBO_ART_CHALLENGE_WALLNUT,false,pattern);
    const auto after=Encode(player);
    Require(before==after && after.size()==886,"Hidden completion changed the 1073 detail wire layout");
    const std::size_t flagWireOffset=865; // Original no-plants/no-avatars detail tail.
    for(std::size_t i=0;i<pattern.size();++i)
        Require(after[flagWireOffset+i]==(pattern[i]?1:0),"Completion flags moved in the native detail file");
    Require(after.back()==0,"Desktop-message flag after the 20 completion bytes changed");
    player.SaveDetails();
    PlayerInfo loaded;loaded.mId=player.mId;loaded.mUseSeq=0;loaded.mName=player.mName;
    Require(loaded.LoadDetails() && !loaded.mDetailsLoadRejected && Encode(loaded)==after,
        "Native user.dat did not round-trip after a hidden completion");
    log<<"cases="<<cases<<" object/canary/award=PASS native-detail-bytes=886 flag-offset=865 roundtrip=PASS\n";
    Report("portable-minigame-completion-all-modes-canaries-native-dat",app);
    OriginalAchievementConditions(app,board,player);
}
