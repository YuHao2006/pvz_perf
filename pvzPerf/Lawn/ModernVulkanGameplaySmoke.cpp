#include "ModernVulkanSmoke.h"
#include "PortableFixesSmoke.h"
#include "PortablePoolReadSmoke.h"
#include "PortableSaveFailureSmoke.h"
#include "PortableWhackSmoke.h"
#include "PortableIZombieSmoke.h"
#include "PortableTreeSmoke.h"
#include "PortableShovelSmoke.h"
#include "PortableRainCoffeeSmoke.h"
#include "AttachmentLifetimeSmoke.h"
#include "LawnApp.h"
#include "Board.h"
#include "BoardStateDigest.h"
#include "Coin.h"
#include "Plant.h"
#include "Zombie.h"
#include "Cutscene.h"
#include "SeedPacket.h"
#include "System/PlayerInfo.h"
#include "System/PoolEffect.h"
#include "System/SaveGame.h"
#include "System/Music.h"
#include "Resources.h"
#include "Widget/TitleScreen.h"
#include "Widget/SeedChooserScreen.h"
#include "Widget/LawnDialog.h"
#include "Widget/GameButton.h"
#include "Sexy.TodLib/EffectSystem.h"
#include "Sexy.TodLib/TodParticle.h"
#include "Sexy.TodLib/Reanimator.h"
#include "graphics/DDInterface.h"
#include "graphics/RenderInterface.h"
#include "graphics/MemoryImage.h"
#include "graphics/DDImage.h"
#include "sound/BassMusicInterface.h"
#include "sound/BassLoader.h"
#include "platform/Audio.h"
#include "sound/SoundInstance.h"
#include "widget/WidgetManager.h"
#include "misc/StableTime.h"
#include <algorithm>
#include <array>
#include <cstdio>
#include <cstdlib>
#include <fstream>
#include <iomanip>
#include <memory>
#include <set>
#include <stdexcept>
#include <utility>
#include <vector>

namespace {
using namespace ModernSmoke;
void Require(bool condition,const char* message) {
    if(!condition) throw std::runtime_error(message);
}
auto& Renderer(LawnApp& app) {return *app.mDDInterface->mRenderInterface->mRenderer;}
unsigned AudioPosition(LawnApp& app,bool fog,const char* stage,bool playing) {
    Require(!app.mNoSoundNeeded && app.mMusicVolume==0 && app.mSfxVolume==0,
        "Audio probe must use real engines with application-only volume zero");
    Require(dynamic_cast<Sexy::BassMusicInterface*>(app.mMusicInterface) &&
        dynamic_cast<Sexy::DSoundManager*>(app.mSoundManager) && app.mSoundManager->mInitialized,
        "Real BASS/DirectSound engines not initialized");
    Require(Sexy::gBass && Sexy::gBass->BASS_GetConfig(BASS_CONFIG_GVOL_MUSIC)==0 &&
        Sexy::gBass->BASS_GetConfig(BASS_CONFIG_GVOL_STREAM)==0,"BASS probe is not application-muted");
    Require(app.mMusic->mCurMusicTune==(fog?MUSIC_TUNE_FOG_RIGORMORMIST:MUSIC_TUNE_POOL_WATERYGRAVES),
        "Pool/fog music tune is wrong");
    const auto handle=app.mMusic->GetBassMusicHandle(app.mMusic->mCurMusicFileMain);
    Require(handle!=0,"No native BASS module handle");
    const auto active=Sexy::gBass->BASS_ChannelIsActive(handle);
    const auto position=Sexy::gBass->BASS_ChannelGetPosition(handle,BASS_POS_MUSIC_ORDER);
    const auto decodePosition=Sexy::gBass->BASS_ChannelGetPosition(handle,BASS_POS_MUSIC_ORDER|BASS_POS_DECODE);
    Require(position!=QWORD(-1),"Cannot read BASS order/row position");
    Require(decodePosition!=QWORD(-1),"Cannot read BASS decoder order/row position");
    Require(playing?active==BASS_ACTIVE_PLAYING:active==BASS_ACTIVE_STOPPED,
        "Native BASS playback state differs from game pause state");
    std::unique_ptr<FILE,decltype(&fclose)> log(fopen(ProbePath("audio-state.log").c_str(),"a"),&fclose);
    Require(log!=nullptr,"Cannot write audio state log");
    fprintf(log.get(),"%s version=%08lX tune=%d handle=%lu active=%lu position=%08llX decode=%08llX saved=%08X sounds=%d\n",
        stage,Sexy::gBass->BASS_GetVersion(),int(app.mMusic->mCurMusicTune),handle,active,
        static_cast<unsigned long long>(position),static_cast<unsigned long long>(decodePosition),
        unsigned(app.mMusic->mPauseOffset),app.mSoundManager->GetNumSounds());
    Report(stage,app);
    return static_cast<unsigned>(position);
}
std::vector<uint32_t> Pixels(LawnApp& app) {
    app.mDDInterface->mRenderInterface->Flush();
    return Renderer(app).ReadScenePixels();
}
void RequireMap(LawnApp& app) {
    const auto pixels=Pixels(app);
    // Inspect the MAP, not the UI: an intact seed bank must not make a black
    // lawn pass. Separate land/water/near-right regions exercise pool and fog.
    for(const auto& region:std::array<std::array<int,4>,3>{{
        {100,140,260,220},{270,300,440,430},{570,410,740,530}}}) {
        std::set<uint32_t> colors;
        size_t nonblack=0,total=0;
        for(int y=region[1];y<region[3];++y) for(int x=region[0];x<region[2];++x) {
            const auto color=pixels[size_t(y)*800+x]&0xffffff;
            colors.insert(color);nonblack+=color!=0;++total;
        }
        if(colors.size()<=128 || nonblack<=total*9/10) {
            Capture("gameplay-map-failure",app);
            throw std::runtime_error("Gameplay map region "+std::to_string(region[0])+","+
                std::to_string(region[1])+" colors="+std::to_string(colors.size())+
                " nonblack="+std::to_string(nonblack)+"/"+std::to_string(total)+
                " board="+std::to_string(app.mBoard->mX)+","+std::to_string(app.mBoard->mY));
        }
    }
}
void ResizeRetained(LawnApp& app,int width,int height) {
    const auto before=Pixels(app);
    app.ResizeWindowClient(width,height);
    app.UpdateWindowGeometry();
    app.mDDInterface->mRenderInterface->PresentRetainedFrame();
    Require(before==Pixels(app),"Gameplay resize changed the retained logical scene");
}
void StateReport(LawnApp& app,const char* stage) {
    Report(stage,app);
    std::unique_ptr<FILE,decltype(&fclose)> log(fopen(ProbePath("gameplay-state.log").c_str(),"a"),&fclose);
    Require(log!=nullptr,"Cannot write gameplay state log");
    auto& b=*app.mBoard;
    fprintf(log.get(),"%s mode=%d background=%d main=%u plants=%u zombies=%u projectiles=%u coins=%u particles=%u pool=%u fog=%.3f\n",
        stage,int(app.mGameMode),int(b.mBackground),b.mMainCounter,b.mPlants.mSize,b.mZombies.mSize,
        b.mProjectiles.mSize,b.mCoins.mSize,app.mEffectSystem->mParticleHolder->mParticles.mSize,
        app.mPoolEffect->mPoolCounter,b.mFogOffset);
}
struct Snapshot {
    unsigned plants,zombies,projectiles,coins,main;
    int sun;
    BackgroundType background;
    struct Unit {unsigned id;float x,y;int hp,ice;std::vector<std::pair<int,Sexy::Image*>> imageOverrides;};
    std::vector<Unit> units;
    explicit Snapshot(Board& board):plants(board.mPlants.mSize),zombies(board.mZombies.mSize),
        projectiles(board.mProjectiles.mSize),coins(board.mCoins.mSize),main(board.mMainCounter),
        sun(board.mSunMoney),background(board.mBackground) {
        Zombie* zombie=nullptr;
        unsigned images=0;
        while(board.IterateZombies(zombie)) {
            units.push_back({board.mZombies.DataArrayGetID(zombie),zombie->mPosX,zombie->mPosY,
                zombie->mBodyHealth,zombie->mIceTrapCounter,{}});
            if(auto* body=board.mApp->ReanimationTryToGet(zombie->mBodyReanimID))
                for(int i=0;i<body->mDefinition->mTracks.count;++i)
                    if(auto* image=body->mTrackInstances[i].mImageOverride) {
                        units.back().imageOverrides.emplace_back(i,image);++images;
                    }
        }
        Require(images>=2,"Save probe lacks the damaged cone/bucket image overrides");
    }
    void Check(Board& board) const {
        Require(plants==board.mPlants.mSize && zombies==board.mZombies.mSize &&
            projectiles==board.mProjectiles.mSize && coins==board.mCoins.mSize &&
            main==board.mMainCounter && sun==board.mSunMoney && background==board.mBackground,
            "dat64 round-trip changed board state");
        for(const auto& unit:units) {
            auto* zombie=board.mZombies.DataArrayTryToGet(unit.id);
            Require(zombie && zombie->mBoard==&board && zombie->mApp==board.mApp &&
                zombie->mPosX==unit.x && zombie->mPosY==unit.y && zombie->mBodyHealth==unit.hp &&
                zombie->mIceTrapCounter==unit.ice,"dat64 zombie identity/state/bindings changed");
            std::vector<std::pair<int,Sexy::Image*>> restored;
            if(auto* body=board.mApp->ReanimationTryToGet(zombie->mBodyReanimID))
                for(int i=0;i<body->mDefinition->mTracks.count;++i)
                    if(auto* image=body->mTrackInstances[i].mImageOverride) restored.emplace_back(i,image);
            Require(restored==unit.imageOverrides,"dat64 reload lost/changed a zombie image override");
        }
    }
};

void FrozenDrawBenchmark(LawnApp& app) {
    using namespace Sexy;
    Require(getenv("PVZ_MODERN_HIDDEN") && getenv("PVZ_APPDATA_DIR"),
        "Frozen draw benchmark requires isolated hidden gameplay");
    SRand(0x13579bdu);
    app.PreNewGame(GAMEMODE_SURVIVAL_ENDLESS_STAGE_3,false);
    app.StartPlaying();
    auto& board=*app.mBoard;
    SRand(0x13579bdu);
    constexpr std::array<SeedType,4> plants{SEED_PEASHOOTER,SEED_SUNFLOWER,SEED_WALLNUT,SEED_SNOWPEA};
    constexpr std::array<ZombieType,4> zombies{ZOMBIE_NORMAL,ZOMBIE_TRAFFIC_CONE,ZOMBIE_PAIL,ZOMBIE_FLAG};
    constexpr std::array<int,4> rows{0,1,4,5};
    for(int r=0;r<4;++r) for(int col=0;col<8;++col)
        board.AddPlant(col,rows[r],plants[(col+r)%plants.size()]);
    for(int r=0;r<4;++r) for(int col=0;col<10;++col) {
        auto* zombie=board.AddZombieInRow(zombies[(col+r)%zombies.size()],rows[r],0);
        zombie->mPosX=320.0f+float(col)*43.0f;
        zombie->mVelX=0;
    }
    board.mMainCounter=1000;
    app.mPoolEffect->mPoolCounter=256;
    const auto fixedDrawCount=board.mDrawCount;
    const auto fixedMainCounter=board.mMainCounter;
    const auto fixedPlants=board.mPlants.mSize,fixedZombies=board.mZombies.mSize;
    Require(fixedPlants==32 && fixedZombies==40,"Frozen benchmark fixture population differs");
    auto& render=*app.mDDInterface->mRenderInterface;
    auto& gpu=*render.mRenderer;
    auto* screen=app.mDDInterface->mScreenImage;
    render.Flush();
    render.SetCausticsFrame(app.mPoolEffect->mPoolCounter);
    LARGE_INTEGER frequency{};
    Require(QueryPerformanceFrequency(&frequency)!=FALSE,"Frozen draw clock frequency failed");
    const auto draw=[&] {
        board.mDrawCount=fixedDrawCount;
        SRand(0x2468aceu);
        render.Flush();
        screen->FillRect(Rect(0,0,800,600),Color::Black,Graphics::DRAWMODE_NORMAL);
        app.mWidgetManager->MarkAllDirty();
        LARGE_INTEGER begin{},end{};
        ULONG64 cyclesBegin=0,cyclesEnd=0;
        Require(QueryThreadCycleTime(GetCurrentThread(),&cyclesBegin)!=FALSE,"Frozen draw start cycles failed");
        Require(QueryPerformanceCounter(&begin)!=FALSE,"Frozen draw start clock failed");
        Require(app.mWidgetManager->DrawScreen(),"Frozen widget draw failed");
        Require(QueryPerformanceCounter(&end)!=FALSE,"Frozen draw end clock failed");
        Require(QueryThreadCycleTime(GetCurrentThread(),&cyclesEnd)!=FALSE,"Frozen draw end cycles failed");
        render.Flush();
        return std::pair{double(end.QuadPart-begin.QuadPart)*1e6/double(frequency.QuadPart),
            cyclesEnd-cyclesBegin};
    };
    for(unsigned i=0;i<128;++i) draw();
    const auto expected=gpu.ReadScenePixels();
    Require(std::any_of(expected.begin(),expected.end(),[](auto pixel){return pixel!=0xff000000u;}),
        "Frozen draw benchmark produced a blank scene");
    const auto expectedState=pvz::legacy::ComputeBoardStateDigest(board);
    {
        std::ofstream pixels(ProbePath("frozen-draw-pixels.bin"),std::ios::binary);
        pixels.write(reinterpret_cast<const char*>(expected.data()),
            std::streamsize(expected.size()*sizeof(expected[0])));
        pixels.close();
        Require(bool(pixels),"Cannot write frozen draw pixel reference");
    }
    const auto hash=[](const auto& pixels) {
        std::uint64_t value=14695981039346656037ull;
        for(auto pixel:pixels) {value^=pixel;value*=1099511628211ull;}
        return value;
    };
    const auto pixelHash=hash(expected);
    const auto textureCount=gpu.GetResourceCounts().textures;
    std::ofstream log(ProbePath("frozen-draw-perf.csv"));
    Require(bool(log),"Cannot write frozen draw benchmark");
    log<<"round,sample,draw_cpu_us,thread_cycles,pixel_hash,plants,zombies,textures\n";
    log<<std::fixed<<std::setprecision(3);
    for(unsigned round=0;round<20;++round) {
        for(unsigned sample=0;sample<32;++sample) {
            const auto elapsed=draw();
            log<<round<<','<<sample<<','<<elapsed.first<<','<<elapsed.second<<','<<pixelHash<<','
                <<fixedPlants<<','<<fixedZombies<<','<<textureCount<<'\n';
        }
        Require(gpu.ReadScenePixels()==expected,"Frozen benchmark changed exact pixels");
        Require(board.mMainCounter==fixedMainCounter && board.mPlants.mSize==fixedPlants &&
            board.mZombies.mSize==fixedZombies && gpu.GetResourceCounts().textures==textureCount &&
            pvz::legacy::ComputeBoardStateDigest(board)==expectedState,
            "Frozen benchmark advanced simulation or allocated textures");
    }
    log.close();
    Require(bool(log),"Frozen draw benchmark output failed");
    board.mDrawCount=fixedDrawCount;
    Report("frozen-draw-640-samples-32-plants-40-zombies-exact-pixels",app);
}
}

static void BossSpawnSmokeTick(LawnApp& app) {
    Require(getenv("PVZ_MODERN_HIDDEN") && getenv("PVZ_MODERN_SMOKE") && getenv("PVZ_APPDATA_DIR"),
        "Boss probe requires isolated hidden smoke process");
    Require(app.mGpuContext && !IsWindowVisible(app.mHWnd),
        "Boss probe became visible");
    struct Case { int row,age,seed; ZombieType expected; };
    static std::vector<Case> cases;
    static size_t next=0;
    static int stage=0;
    static std::uint32_t started=0,deadline=0;
    static unsigned bossId=0;
    if(stage==0) {
        if(!app.mLoaded || !app.mTitleScreen || !app.mTitleScreen->mLoadingThreadComplete) return;
        started=app.mUpdateCount; app.LoadingCompleted(); stage=1; deadline=started+100; return;
    }
    if(app.mUpdateCount-started>=3500) {
        Report("boss-timeout",app);
        throw std::runtime_error("Boss smoke timed out at stage "+std::to_string(stage));
    }
    if(app.mUpdateCount<deadline) return;
    if(stage==1) {
        app.KillGameSelector();
        app.mPlayerInfo->mFinishedAdventure=0; app.mPlayerInfo->mLevel=50;
        app.PreNewGame(GAMEMODE_ADVENTURE,false);
        // This is a spawn regression, not a test of the click-through Dave
        // dialogue. Use the game's own skip-intro path without UI input.
        app.mBoard->mCutScene->CancelIntro();
        Report("boss-level-created",app); stage=2; return;
    }
    if(stage==2) {
        if(app.mGameScene!=SCENE_PLAYING) return;
        Require(app.mBoard && app.mBoard->mBackground==BACKGROUND_6_BOSS,"Not the 5-10 boss map");
        Zombie* zombie=nullptr;
        while(app.mBoard->IterateZombies(zombie)) if(zombie->mZombieType==ZOMBIE_BOSS) {
            bossId=app.mBoard->ZombieGetID(zombie); break;
        }
        Require(bossId!=0,"No actual boss object in 5-10");
        app.mBoard->Pause(true);
        constexpr ZombieType types[]={ZOMBIE_TRAFFIC_CONE,ZOMBIE_PAIL,ZOMBIE_FOOTBALL,
            ZOMBIE_POLEVAULTER,ZOMBIE_JACK_IN_THE_BOX,ZOMBIE_LADDER,ZOMBIE_ZAMBONI,
            ZOMBIE_CATAPULT,ZOMBIE_POGO,ZOMBIE_NEWSPAPER,ZOMBIE_DOOR,ZOMBIE_GARGANTUAR};
        for(int row=0;row<5;++row) {
            for(int age:{0,3499,3500,7999,8000,12499})
                cases.push_back({row,age,1073,age<3500?ZOMBIE_NORMAL:age<8000?ZOMBIE_TRAFFIC_CONE:ZOMBIE_PAIL});
            const int count=row==0?11:12;
            for(int age:{12500,20000}) for(int index=0;index<count;++index) {
                int seed=0;
                for(;seed<10000;++seed) { Sexy::SRand(seed); if(Sexy::Rand(count)==index) break; }
                Require(seed<10000,"Could not exercise every boss candidate");
                cases.push_back({row,age,seed,types[index]});
            }
        }
        Report("boss-spawn-probe-ready",app); stage=3; return;
    }
    if(stage==3 && next<cases.size()) {
        auto& board=*app.mBoard;
        auto* boss=board.mZombies.DataArrayTryToGet(bossId);
        Require(boss && board.mPaused,"Boss probe lost paused fixture");
        const auto& test=cases[next];
        std::set<unsigned> before;
        Zombie* zombie=nullptr;
        while(board.IterateZombies(zombie)) before.insert(board.ZombieGetID(zombie));
        const auto oldAge=boss->mZombieAge; const auto oldRow=boss->mTargetRow;
        boss->mZombieAge=test.age; boss->mTargetRow=test.row; Sexy::SRand(test.seed);
        boss->BossSpawnContact();
        boss->mZombieAge=oldAge; boss->mTargetRow=oldRow;
        Zombie* spawned=nullptr; zombie=nullptr;
        while(board.IterateZombies(zombie)) if(!before.contains(board.ZombieGetID(zombie))) {
            Require(spawned==nullptr,"Boss spawned multiple children at one contact"); spawned=zombie;
        }
        Require(spawned && spawned->mZombieType==test.expected && spawned->mRow==test.row &&
            spawned->mPosX==600.0f,"Boss child type/row/position differs from original candidate index");
        spawned->DieNoLoot(); board.mZombies.DataArrayFree(spawned);
        ++next;
        if(next==cases.size()) {
            Report("boss-spawn-all-candidates",app);
            board.Pause(false); stage=4; deadline=app.mUpdateCount+20;
        }
        return;
    }
    if(stage==4) {
        Capture("boss-after-spawn-probe",app); ProbeScreenshot(app);
        Report("PASS boss; 148 spawn contacts, all five rows, age boundaries and every late-game candidate",app);
        app.CloseRequestAsync(); stage=5;
    }
}

void ModernVulkanGameplaySmokeTick(LawnApp& app,const std::string& scenario) {
    if(scenario=="ParticleEmitters") { ParticleEmitterSmokeTick(app); return; }
    if(scenario=="SaveReject") { PortableSaveFailureSmokeTick(app); return; }
    if(scenario=="Survival") { PortableSurvivalSmokeTick(app); return; }
    if(scenario=="Continue") { PortableContinueSmokeTick(app); return; }
    if(scenario=="Boss") { BossSpawnSmokeTick(app); return; }
    if(scenario=="Squirrel") { ModernVulkanSquirrelSmokeTick(app); return; }
    if(scenario=="Vase") { ModernVulkanAwardVaseSmokeTick(app); return; }
    if(scenario=="Aquarium") { ModernVulkanAquariumSmokeTick(app); return; }
    if(scenario=="Upsell") { ModernVulkanUpsellSmokeTick(app); return; }
    if(scenario=="Beghouled") { ModernVulkanBeghouledSmokeTick(app); return; }
    if(scenario=="Whack") { PortableWhackSmokeTick(app); return; }
    if(scenario=="IZombie") { PortableIZombieSmokeTick(app); return; }
    if(scenario=="Tree") { PortableTreeSmokeTick(app); return; }
    if(scenario=="Shovel") { PortableShovelSmokeTick(app); return; }
    if(scenario=="Zen") { PortableZenSmokeTick(app); return; }
    if(scenario=="ZenLifetime") { PortableZenLifetimeSmokeTick(app); return; }
    if(scenario=="ModalLifetime") { PortableModalLifetimeSmokeTick(app); return; }
    if(scenario=="ZenClose" || scenario=="TreeClose") { PortableStoreCloseSmokeTick(app,scenario=="TreeClose"); return; }
    Require(scenario=="Pool" || scenario=="Fog","Unknown gameplay smoke scenario");
    Require(getenv("PVZ_MODERN_HIDDEN") && getenv("PVZ_MODERN_SMOKE") && getenv("PVZ_APPDATA_DIR"),
        "Gameplay probe requires an isolated hidden smoke process");
    Require(app.mGpuContext && !IsWindowVisible(app.mHWnd) &&
        app.mIsWindowed,"Gameplay probe window became visible/fullscreen");
    static int stage=0;
    static std::uint32_t deadline=0,started=0;
    static std::int64_t firstPlayingDraw=-1;
    static HWND original=nullptr;
    static unsigned pausedMain=0,poolCounter=0,sunId=0,zombieId=0;
    static int sunBefore=0;
    static float zombieX=0;
    static std::vector<uint32_t> earlierPixels;
    static std::vector<uint32_t> earlierCaustic;
    const bool audio=getenv("PVZ_MODERN_AUDIO_SMOKE")!=nullptr;
    static unsigned earlierMusic=0,pausedMusic=0;
    static int savedMusicOffset=0;
    static bool pausedAudioSettled=false;
    static Sexy::SoundInstance* sound=nullptr; // DSoundManager owns/reclaims this instance.
    static std::unique_ptr<Snapshot> savedBoard;
    static std::vector<std::uint64_t> savedAttachments;
    static unsigned reloadCycles=0;
    if(stage==0) {
        if(!app.mLoaded || !app.mTitleScreen || !app.mTitleScreen->mLoadingThreadComplete) return;
        Report("gameplay-loaded",app);
        PortableFixesSmoke(app);
        original=app.mHWnd;started=app.mUpdateCount;
        app.LoadingCompleted();stage=1;deadline=app.mUpdateCount+100;
        return;
    }
    Require(original==app.mHWnd,"Gameplay replaced its native window");
    if(app.mUpdateCount-started>5000)
        throw std::runtime_error("Gameplay probe timed out in stage "+std::to_string(stage));
    if(app.mUpdateCount<deadline) return;
    const bool fog=scenario=="Fog";
    switch(stage) {
    case 1:
        app.KillGameSelector();
        app.mPlayerInfo->mFinishedAdventure=1;app.mPlayerInfo->mLevel=50;
        app.PreNewGame(fog?GAMEMODE_SURVIVAL_ENDLESS_STAGE_4:GAMEMODE_SURVIVAL_ENDLESS_STAGE_3,false);
        Require(app.mBoard && app.mBoard->mBackground==(fog?BACKGROUND_4_FOG:BACKGROUND_3_POOL),
            "Game did not select the requested map");
        break;
    case 2: {
        if(!app.mSeedChooserScreen || !app.mSeedChooserScreen->mMouseVisible) return;
        Capture("gameplay-chooser",app);
        PortableSeedAvailabilitySmoke(app);
        PortableChooserTimingSmoke(app);
        PortablePreviewTooltipSmoke(app);
        PortableAlmanacSmoke(app);
        PortableChooserTextSmoke(app);
        auto& chooser=*app.mSeedChooserScreen;
        const int slots=app.mBoard->mSeedBank->mNumPackets;
        Require(slots>=3 && slots<=10,"Unexpected seed bank capacity");
        constexpr SeedType seeds[]={SEED_SUNFLOWER,SEED_LILYPAD,SEED_CACTUS,SEED_PEASHOOTER,
            SEED_ICESHROOM,SEED_SNOWPEA,SEED_SEASHROOM,SEED_PUFFSHROOM,SEED_MELONPULT,SEED_CHERRYBOMB};
        for(auto seed:seeds) {
            if(chooser.mSeedsInBank==slots) break;
            chooser.ClickedSeedInChooser(chooser.mChosenSeeds[seed]);
        }
        Require(chooser.mSeedsInBank==slots,"Gameplay test did not fill seed bank");
        break;
    }
    case 3:
        Require(app.mSeedChooserScreen->mSeedsInFlight==0,"Selected seed animation did not land");
        Require(app.mSeedChooserScreen->PickedPlantType(SEED_SUNFLOWER) &&
            app.mSeedChooserScreen->PickedPlantType(SEED_LILYPAD) &&
            app.mSeedChooserScreen->PickedPlantType(SEED_CACTUS),
            "Smoke seed bank would trigger a modal repick warning");
        Capture("gameplay-chooser-filled",app);
        app.mSeedChooserScreen->OnStartButton();
        break;
    case 4: {
        if(app.mGameScene!=SCENE_PLAYING) return;
        // The game can enter SCENE_PLAYING in an update with no redraw yet.
        // Inspect a completed frame of that state, not the last intro frame.
        if(firstPlayingDraw<0) {firstPlayingDraw=app.mDrawCount;return;}
        if(app.mDrawCount==firstPlayingDraw) return;
        Require(app.mSeedChooserScreen==nullptr,"Seed chooser survived StartPlaying");
        RequireMap(app);Capture("gameplay-map",app);
        PortablePlantFixesSmoke(app);
        PortableRainCoffeeSmoke(app);
        PortableGarlicSmoke(app);
        PortableTutorialFirstPacketSmoke(app);
        PortableNutArmorSmoke(app);
        PortableSplashFreezeSmoke(app);
        PortableFrameTimeSmoke(app);
        PortableShadowSmoke(app);
        PortableBoardTextSmoke(app);
        PortableMatrixFontSmoke(app);
        PortableFontAtlasSmoke(app);
        AttachmentCrossFadeSmoke(app);
        auto& b=*app.mBoard;
        b.NewPlant(1,2,SEED_LILYPAD);b.NewPlant(1,2,SEED_PEASHOOTER);
        b.NewPlant(1,1,SEED_SUNFLOWER);b.NewPlant(2,4,SEED_SNOWPEA);
        b.NewPlant(3,3,SEED_SEASHROOM);
        auto* zombie=b.AddZombieInRow(ZombieType::ZOMBIE_TRAFFIC_CONE,4,0);
        zombie->mPosX=660;zombieX=zombie->mPosX;zombieId=b.mZombies.DataArrayGetID(zombie);
        auto* water=b.AddZombieInRow(ZombieType::ZOMBIE_NORMAL,2,0);water->mPosX=690;
        auto* bucket=b.AddZombieInRow(ZombieType::ZOMBIE_PAIL,1,0);bucket->mPosX=720;
        zombie->TakeHelmDamage(zombie->mHelmMaxHealth/2,0);
        bucket->TakeHelmDamage(bucket->mHelmMaxHealth*3/4,0);
        Require(app.ReanimationGet(zombie->mBodyReanimID)->GetImageOverride(ReanimTrackId::anim_cone)==Sexy::IMAGE_REANIM_ZOMBIE_CONE2 &&
            app.ReanimationGet(bucket->mBodyReanimID)->GetImageOverride(ReanimTrackId::anim_bucket)==Sexy::IMAGE_REANIM_ZOMBIE_BUCKET3,
            "Save fixture did not acquire both damaged armor images");
        auto* sun=b.AddCoin(350,220,COIN_SUN,COIN_MOTION_FROM_SKY);sunId=b.mCoins.DataArrayGetID(sun);
        StateReport(app,"gameplay-populated");
        if(audio) {
            earlierMusic=AudioPosition(app,fog,"audio-playing",true);
            sound=app.mSoundManager->GetSoundInstance(Sexy::SOUND_BUTTONCLICK);
            Require(sound!=nullptr,"No decoded buttonclick DirectSound instance");
            sound->SetVolume(0);
            Require(sound->Play(true,false) && sound->IsPlaying(),"DirectSound loop did not start");
        }
        break;
    }
    case 5: {
        if(audio) {
            Require(AudioPosition(app,fog,"audio-advanced",true)!=earlierMusic,"Muted BASS music did not advance");
            Require(sound && sound->IsPlaying(),"Muted DirectSound loop did not keep playing");
            sound->Release();sound=nullptr;
        }
        auto& b=*app.mBoard;
        auto* zombie=b.mZombies.DataArrayTryToGet(zombieId);
        Require(zombie && zombie->mPosX<zombieX,"Gameplay zombie did not move");
        RequireMap(app);Capture("gameplay-units",app);
        earlierPixels=Pixels(app);poolCounter=app.mPoolEffect->mPoolCounter;
        auto* caustics=app.mDDInterface->mRenderInterface->GetCausticsTexture();
        Require(app.mPoolEffect->mCausticGPU && caustics,"Gameplay pool requires resident GPU caustics");
        earlierCaustic=Renderer(app).ReadTexturePixels(caustics).pixels;
        Require(earlierCaustic.size()==CAUSTIC_IMAGE_WIDTH*CAUSTIC_IMAGE_HEIGHT,"GPU caustic readback dimensions changed");
        sunBefore=b.mSunMoney;
        auto* sun=b.mCoins.DataArrayTryToGet(sunId);
        Require(sun && !sun->mDead,"Test sun disappeared before collection");sun->Collect();
        break;
    }
    case 6: {
        auto& b=*app.mBoard;
        Require(b.mSunMoney==sunBefore+25,"Sun collection did not update gameplay state");
        const auto caustics=Renderer(app).ReadTexturePixels(
            app.mDDInterface->mRenderInterface->GetCausticsTexture()).pixels;
        Require(app.mPoolEffect->mPoolCounter>poolCounter && earlierCaustic!=caustics,
            "Pool caustic GPU animation stopped");
        const auto current=Pixels(app);
        size_t changedWater=0;
        for(int y=300;y<430;++y) for(int x=300;x<470;++x)
            changedWater+=(current[size_t(y)*800+x]&0xffffff)!=(earlierPixels[size_t(y)*800+x]&0xffffff);
        Require(changedWater>100,"GPU pool region did not animate");
        StateReport(app,"gameplay-water-and-sun");Capture("gameplay-water",app);
        // Trigger the actual plant implementation, not a mock particle draw.
        // In daytime this explicitly activates a mushroom (no coffee UI test).
        b.NewPlant(3,0,SEED_ICESHROOM)->DoSpecial();
        break;
    }
    case 7: {
        auto& b=*app.mBoard;
        auto* zombie=b.mZombies.DataArrayTryToGet(zombieId);
        Require(zombie && zombie->mIceTrapCounter>0,"Ice-shroom did not freeze the test zombie");
        Require(app.mEffectSystem->mParticleHolder->mParticles.mSize>0,"Ice-shroom produced no live particles");
        RequireMap(app);Capture("gameplay-ice",app);StateReport(app,"gameplay-ice");
        app.DoPauseDialog();pausedMain=b.mMainCounter;
        auto* pause=dynamic_cast<LawnDialog*>(app.GetDialog(DIALOG_PAUSED));
        Require(pause && pause->mDialogHeader==("GAME PAUSED") &&
            pause->mDialogLines==("Click to resume game") && pause->mYesButton &&
            pause->mYesButton->mLabel==("Resume Game") && !pause->mNoButton,
            "Actual pause dialog has reversed header/button or wrong controls");
        Require(app.mWidgetManager->DrawScreen(),"Pause dialog GPU draw failed");
        Capture("gameplay-real-pause-dialog",app);
        Report("portable-pause-real-dialog-original-labels",app);
        if(audio) {
            Require(app.mMusic->mPaused,"Game did not pause its music");
            pausedMusic=AudioPosition(app,fog,"audio-paused",false);
            savedMusicOffset=app.mMusic->mPauseOffset;
        }
        break;
    }
    case 8: {
        auto& b=*app.mBoard;
        Require(b.mPaused && b.mMainCounter==pausedMain,"Paused board simulation advanced");
        if(audio) {
            Require(app.mMusic->mPaused && savedMusicOffset==app.mMusic->mPauseOffset,
                "Game changed its saved music resume position during pause");
            if(!pausedAudioSettled) {
                // Inspect twice AFTER the stop has settled, as well as logging
                // the immediate post-stop position. On BASS 2.4.17 the reported
                // playback position can finish a few sub-rows after Stop.
                pausedMusic=AudioPosition(app,fog,"audio-pause-settled",false);
                pausedAudioSettled=true;deadline=app.mUpdateCount+100;return;
            }
            Require(AudioPosition(app,fog,"audio-pause-held",false)==pausedMusic,
                "Stopped BASS music continued advancing after settling");
        }
        ResizeRetained(app,1281,721);ResizeRetained(app,800,600);RequireMap(app);
        if(app.mModernScalePrepared) {
            ToggleScale(app,true);ToggleScale(app,false);ToggleScale(app,true);
            RequireMap(app);Report("gameplay-scale-retained",app);
        }
        auto* pause=dynamic_cast<LawnDialog*>(app.GetDialog(DIALOG_PAUSED));
        Require(pause!=nullptr,"Pause dialog disappeared before resume");
        pause->ButtonDepress(Dialog::ID_YES);
        Require(!app.GetDialog(DIALOG_PAUSED) && !b.mPaused,"Resume button did not close/unpause the board");
        if(audio) {
            const auto resumed=AudioPosition(app,fog,"audio-resumed",true);
            Require(!app.mMusic->mPaused && LOWORD(resumed)==LOWORD(app.mMusic->mPauseOffset),
                "Music did not resume at its saved order");
        }
        // Keep live, uncollected objects with reanimation attachments in the
        // saved graph; the earlier test had already collected its only sun.
        b.AddCoin(300,240,COIN_SUN,COIN_MOTION_FROM_SKY);
        b.AddCoin(400,240,COIN_SILVER,COIN_MOTION_FROM_SKY);
        b.AddCoin(500,240,COIN_DIAMOND,COIN_MOTION_FROM_SKY);
        b.ProcessDeleteQueue();app.mEffectSystem->ProcessDeleteQueue();
        savedBoard=std::make_unique<Snapshot>(b);
        savedAttachments=SnapshotAttachmentBindings(b);
        const auto path=ProbePath("gameplay.dat64");
        Require(LawnSaveGame(&b,path),"Gameplay dat64 write failed");
        PortablePoolReadSmoke(app);
        // Use the actual leave-to-menu boundary, giving deferred destruction
        // its normal event-loop opportunity before restoring saved IDs.
        app.DoBackToMain();
        break;
    }
    case 9: {
        Require(!app.mBoard && app.mGameSelector,"Save reload did not reach the real menu boundary");
        RequireDeletionBoundary(app,"gameplay-old-board-before-reload");
        app.KillGameSelector();
        app.MakeNewBoard();
        Require(app.mBoard->LoadGame(ProbePath("gameplay.dat64")),"Gameplay dat64 reload failed");
        savedBoard->Check(*app.mBoard);
        Require(SnapshotAttachmentBindings(*app.mBoard)==savedAttachments,
            "dat64 reload changed attachment ownership, child IDs or allocated effect counts");
        app.mBoard->Pause(true);
        break;
    }
    case 10: {
        // Recheck after the next ordinary deferred-delete/update boundary,
        // not only immediately after LoadGame returned.
        RequireDeletionBoundary(app,"gameplay-old-selector-after-reload");
        savedBoard->Check(*app.mBoard);
        Require(SnapshotAttachmentBindings(*app.mBoard)==savedAttachments,
            "Deferred teardown changed newly restored attachment bindings");
        ++reloadCycles;
        StateReport(app,"gameplay-attachment-reload-stable");
        if(reloadCycles<8) {
            app.DoBackToMain();stage=9;deadline=app.mUpdateCount+50;return;
        }
        app.mBoard->Pause(false);
        StateReport(app,"gameplay-save-roundtrip");
        Report("attachment-dat64-eight-menu-reloads-stable",app);
        Report("portable-gameplay-eight-real-deferred-board-selector-deletions",app);
        Report("gameplay-damaged-armor-eight-menu-reloads-stable",app);
        break;
    }
    case 11:
        Require(app.mBoard->mMainCounter>pausedMain,"Loaded board did not resume simulation");
        if(audio) AudioPosition(app,fog,"audio-save-reloaded",true);
        RequireMap(app);Capture("gameplay-resumed",app);StateReport(app,"gameplay-resumed");ProbeScreenshot(app);
        if(getenv("PVZ_FROZEN_DRAW_BENCH")) FrozenDrawBenchmark(app);
        Report("PASS gameplay; pool/fog, live units, sun, ice, pause, resize and dat64 verified; ordinary shutdown",app);
        app.CloseRequestAsync();
        break;
    }
    ++stage;deadline=app.mUpdateCount+(stage==4?10:stage==7?20:stage==3?35:100);
}
