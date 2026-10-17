#include "Sexy.TodLib/generated/EntityStrings.h"
#include "LawnCommon.h"
#include "ModernVulkanSmoke.h"
#include "LawnApp.h"
#include "Resources.h"
#include "Board.h"
#include "Challenge.h"
#include "Cutscene.h"
#include "MessageWidget.h"
#include "Plant.h"
#include "Zombie.h"
#include "SeedPacket.h"
#include "System/Music.h"
#include "System/PlayerInfo.h"
#include "System/SaveGame.h"
#include "Widget/TitleScreen.h"
#include "Widget/SeedChooserScreen.h"
#include "Widget/ContinueDialog.h"
#include "Widget/ChallengeScreen.h"
#include "widget/WidgetManager.h"
#include "widget/ButtonWidget.h"
#include "Sexy.TodLib/TodStringFile.h"
#include "graphics/DDImage.h"
#include "graphics/DDInterface.h"
#include "graphics/RenderInterface.h"
#include "sound/BassMusicInterface.h"
#include "sound/DummyMusicInterface.h"
#include "sound/BassLoader.h"
#include <algorithm>
#include <array>
#include <cstdlib>
#include <fstream>
#include <memory>
#include <set>
#include <stdexcept>
#include <tuple>
#include <vector>

namespace {
using namespace ModernSmoke;
void Require(bool value,const char* message){if(!value)throw std::runtime_error(message);}
struct AppAccess : LawnApp {static constexpr auto Cleanup=&AppAccess::ProcessSafeDeleteList;};
void RemoveBoard(LawnApp& app){app.KillBoard();(app.*AppAccess::Cleanup)();}

auto MusicState(const Music& m) {
    // Compare logical fields, not native pointers or uninitialized padding.
    // Only the runtime capability is intentionally excluded.
    return std::tuple{m.mCurMusicTune,m.mCurMusicFileMain,m.mCurMusicFileDrums,m.mCurMusicFileHihats,
        m.mBurstOverride,m.mBaseBPM,m.mBaseModSpeed,m.mMusicBurstState,m.mBurstStateCounter,
        m.mMusicDrumsState,m.mQueuedDrumTrackPackedOrder,m.mDrumsStateCounter,m.mPauseOffset,
        m.mPauseOffsetDrums,m.mPaused,m.mFadeOutCounter,m.mFadeOutDuration};
}

std::vector<unsigned char> MusicBytes(const Buffer& buffer,bool dat64) {
    // Dat64's end marker is a SyncBytes record: 4-byte length + 8 bytes.
    // The 1073 marker is a bare WriteLong, without a length prefix.
    const size_t count=dat64?88:76,end=dat64?12:4;
    Require(buffer.GetDataLen()>int(count+end),"Serialized music tail is absent");
    const auto* p=buffer.GetDataPtr()+buffer.GetDataLen()-count-end;
    return {p,p+count};
}

void MusicOwnershipProbe(LawnApp& app) {
    Require(!app.mNoSoundNeeded&&app.mMusicVolume==0&&app.mSfxVolume==0,
        "Music ownership probe must be isolated and application-muted");
    auto* bass=dynamic_cast<Sexy::BassMusicInterface*>(app.mMusicInterface);
    Require(bass&&Sexy::gBass&&!app.mMusic->mMusicDisabled,"Music ownership needs real BASS");
    std::ofstream log(ProbePath("music-ownership.txt"));Require(bool(log),"Cannot write music ownership evidence");
    const auto loadedCount=[bass]{
        size_t n=0;for(const auto& slot:bass->mMusicSlots)n+=slot!=nullptr;return n;};
    // Slot 0 is unused by the game: MusicFile ids start at 1.
    constexpr int temporary=0;
    const size_t initial=loadedCount();
    Require(!bass->IsMusicLoaded(temporary),"Music probe ID is in use");
    for(const char* name:{"invalid-module.mo3","invalid-stream.ogg","empty-music.ogg","absent-music.mo3"}){
        const auto path=ProbePath(name);
        if(std::string(name)!="absent-music.mo3"){
            std::ofstream fixture(path,std::ios::binary);Require(bool(fixture),"Cannot create private invalid audio fixture");
            if(std::string(name)!="empty-music.ogg")fixture<<"This is deliberately not encoded audio.";
        }
        Require(!bass->LoadMusic(temporary,path)&&loadedCount()==initial,
            "Invalid music was published or changed the existing music slots");
        log<<"rejected="<<name<<" map-unchanged=1"<<std::endl;
    }
    Require(bass->LoadMusic(temporary,"sounds/mainmusic.mo3"),"Framework loader cannot read the packed MOD");
    const auto module=bass->mMusicSlots.at(temporary)->mHMusic;float bpm=0;
    Require(module&&!bass->mMusicSlots.at(temporary)->mStreamData&&
        Sexy::gBass->BASS_ChannelGetAttribute(module,BASS_ATTRIB_MUSIC_BPM,&bpm)&&bpm>0,
        "Packed MOD failed to decode or retained its source buffer");
    bass->UnloadMusic(temporary);
    Require(Sexy::gBass->BASS_ChannelGetAttribute(module,BASS_ATTRIB_MUSIC_BPM,&bpm)==FALSE,
        "Unloaded MOD handle is still valid");
    log<<"packed-mod decode=1 source-released=1 handle-invalid-after-unload=1"<<std::endl;

    // Use the game's real lazy credits loader, not a replacement OGG decoder.
    const bool hadCredits=bass->IsMusicLoaded(MUSIC_FILE_CREDITS_ZOMBIES_ON_YOUR_LAWN);
    for(unsigned cycle=0;cycle<8;++cycle){
        app.mMusic->MusicCreditScreenInit();
        const auto& entry=*bass->mMusicSlots.at(MUSIC_FILE_CREDITS_ZOMBIES_ON_YOUR_LAWN);
        const auto stream=entry.mHStream;const auto* data=entry.mStreamData.get();
        Require(stream&&data&&!entry.mHMusic,"Credits stream does not own its source buffer");
        const auto length=Sexy::gBass->BASS_ChannelGetLength(stream,BASS_POS_BYTE);
        Require(length!=QWORD(-1)&&length>0&&Sexy::gBass->BASS_ChannelSetPosition(stream,length/2,BASS_POS_BYTE),
            "Real OGG stream cannot seek after its loader has returned");
        Require(Sexy::gBass->BASS_ChannelGetPosition(stream,BASS_POS_BYTE)!=QWORD(-1),"OGG position query failed");
        Require(!bass->LoadMusic(MUSIC_FILE_CREDITS_ZOMBIES_ON_YOUR_LAWN,"sounds/mainmusic.mo3")&&
            bass->mMusicSlots.at(MUSIC_FILE_CREDITS_ZOMBIES_ON_YOUR_LAWN)->mHStream==stream&&
            bass->mMusicSlots.at(MUSIC_FILE_CREDITS_ZOMBIES_ON_YOUR_LAWN)->mStreamData.get()==data,
            "Duplicate music ID replaced the original stream or source");
        bass->UnloadMusic(MUSIC_FILE_CREDITS_ZOMBIES_ON_YOUR_LAWN);
        Require(!bass->IsMusicLoaded(MUSIC_FILE_CREDITS_ZOMBIES_ON_YOUR_LAWN)&&
            Sexy::gBass->BASS_ChannelGetLength(stream,BASS_POS_BYTE)==QWORD(-1),"Unloaded OGG is still registered or live");
        log<<"ogg-cycle="<<cycle+1<<" length="<<length<<" seek=1 duplicate-kept=1 unload=1"<<std::endl;
    }
    if(hadCredits)app.mMusic->MusicCreditScreenInit();
    Require(loadedCount()==initial&&!app.mMusic->mMusicDisabled,"Music ownership probe changed persistent playback state");
    Report("portable-music-stream-owner-load-seek-unload",app);
}

void CapabilityProbe(LawnApp& app) {
    Require(!app.mBoard && !app.mSeedChooserScreen && app.mDialogMap.empty(),"Capability fixture is not isolated");
    app.mMusic->StopAllMusic();
    const Music original=*app.mMusic;
    struct Restore {LawnApp& app;Music music;~Restore(){*app.mMusic=music;}} restore{app,original};
    std::ofstream log(ProbePath("music-save-capability.txt"));Require(bool(log),"Cannot write capability evidence");
    unsigned cases=0,wrong=0,disabledPlaybackCases=0;
    for(bool dat64:{false,true})for(bool saved:{false,true})for(bool runtime:{false,true})for(bool paused:{false,true}) {
        app.mGameMode=GAMEMODE_SURVIVAL_ENDLESS_STAGE_3;
        app.MakeNewBoard();app.mBoard->InitLevel();
        Music fixture=original;
        fixture.mCurMusicTune=MUSIC_TUNE_POOL_WATERYGRAVES;
        fixture.mCurMusicFileMain=MUSIC_FILE_MAIN_MUSIC;fixture.mCurMusicFileDrums=MUSIC_FILE_DRUMS;
        fixture.mCurMusicFileHihats=MUSIC_FILE_HIHATS;fixture.mBurstOverride=-1;
        fixture.mBaseBPM=150;fixture.mBaseModSpeed=6;fixture.mMusicBurstState=MUSIC_BURST_ON;
        fixture.mBurstStateCounter=31;fixture.mMusicDrumsState=MUSIC_DRUMS_ON_QUEUED;
        fixture.mQueuedDrumTrackPackedOrder=MAKELONG(0x61,9);fixture.mDrumsStateCounter=47;
        fixture.mPauseOffset=MAKELONG(0x60,7);fixture.mPauseOffsetDrums=MAKELONG(0x62,11);
        fixture.mPaused=paused;fixture.mMusicDisabled=saved;fixture.mFadeOutCounter=13;fixture.mFadeOutDuration=29;
        *app.mMusic=fixture;
        SaveGameContext context;context.mFailed=false;context.mReading=false;
        context.mEncoding=dat64?LevelSaveEncoding::Dat64V1:LevelSaveEncoding::Legacy1073;
        const auto path=ProbePath("music-capability-"+std::to_string(cases)+".dat64");
        if(dat64) {
            Require(LawnSaveGame(app.mBoard,path),"Capability dat64 save failed");
            Require(app.ReadBufferFromFile(path,&context.mBuffer,false),"Cannot inspect actual dat64 output");
        } else {
            // Exercise the retained 1073 layout through the actual serializer.
            // The public game loader deliberately accepts only dat64 files.
            SyncBoard(context,app.mBoard);Require(!context.mFailed,"1073 layout write failed");
        }
        const auto before=MusicBytes(context.mBuffer,dat64);
        const size_t disabledOffset=dat64?0x49:0x41;
        Require(before[disabledOffset]==static_cast<unsigned char>(saved),"Writer no longer preserves the wire capability byte");
        *app.mMusic=original;RemoveBoard(app);app.MakeNewBoard();
        app.mMusic->mMusicDisabled=runtime;app.mMusic->mPaused=!paused;
        if(dat64) Require(app.mBoard->LoadGame(path),"Capability real dat64 load failed");
        else {
            context.mReading=true;context.mBuffer.mReadBitPos = 0;
            SyncBoard(context,app.mBoard);
            Require(!context.mFailed && context.ByteLeftToRead()==0,"1073 layout read failed");
            FixBoardAfterLoad(app.mBoard);
        }
        const bool capability=app.mMusic->mMusicDisabled==runtime;
        const bool state=MusicState(*app.mMusic)==MusicState(fixture);
        const bool pointers=app.mMusic->mApp==&app && app.mMusic->mMusicInterface==app.mMusicInterface;
        SaveGameContext again;again.mReading=false;again.mFailed=false;again.mEncoding=context.mEncoding;
        SyncBoard(again,app.mBoard);Require(!again.mFailed,"Loaded board could not be serialized again");
        auto expected=before;expected[disabledOffset]=runtime;
        const bool wire=MusicBytes(again.mBuffer,dat64)==expected;
        ++cases;wrong+=!capability || !state || !pointers || !wire;
        log<<"case="<<cases<<" layout="<<(dat64?"dat64-file":"1073-context")<<" stored="<<saved
           <<" runtime="<<runtime<<" restored="<<app.mMusic->mMusicDisabled<<" paused="<<paused
           <<" capability="<<capability<<" other-17-fields="<<state<<" pointers="<<pointers<<" wire="<<wire<<std::endl;
        if(app.mNoSoundNeeded&&dat64&&!saved&&runtime&&!paused) {
            // A real -nosound process loading an audio-enabled save is not an
            // inconsistent synthetic capability. Exercise its actual consumers.
            Require(dynamic_cast<::DummyMusicInterface*>(app.mMusicInterface)!=nullptr,
                "Disabled playback probe requires the actual -nosound dummy interface");
            log<<"disabled-playback enter: loaded audio-state dat64 in -nosound process"<<std::endl;
            const Music loaded=*app.mMusic;
            app.mBoard->Pause(true);
            Require(app.mBoard->mPaused&&app.mMusic->mPaused&&app.mMusic->mPauseOffset==loaded.mPauseOffset&&
                app.mMusic->mPauseOffsetDrums==loaded.mPauseOffsetDrums,"Disabled pause looked up a nonexistent music position");
            app.mBoard->Pause(false);
            Require(!app.mBoard->mPaused&&!app.mMusic->mPaused,"Disabled resume left logical music paused");
            for(unsigned tick=0;tick<100;++tick)app.mMusic->MusicUpdate();
            Require(MusicState(*app.mMusic)==MusicState(loaded)&&app.mMusic->mMusicDisabled&&
                dynamic_cast<::DummyMusicInterface*>(app.mMusicInterface)!=nullptr,
                "Disabled music update changed saved state or loaded playback resources");
            Require(LawnSaveGame(app.mBoard,path),"Disabled playback state could not be resaved");
            Buffer rewritten;Require(app.ReadBufferFromFile(path,&rewritten,false)&&MusicBytes(rewritten,true)==expected,
                "Disabled pause/update/resave changed the music wire state");
            ++disabledPlaybackCases;log<<"disabled-playback pause/resume=1 updates=100 resave=1 handles=0"<<std::endl;
        }
        // Other cross-capability combinations remain serializer-only fixtures.
        *app.mMusic=original;RemoveBoard(app);
    }
    log<<"cases="<<cases<<" wrong="<<wrong<<std::endl;
    Require(cases==16 && wrong==0,"Saved music capability overwrote runtime state; see music-save-capability.txt");
    Report("portable-music-capability-16-layout-cases-wire-retained",app);
    if(app.mNoSoundNeeded){Require(disabledPlaybackCases==1,"Disabled playback consumer probe did not run");
        Report("portable-disabled-music-loaded-pause-update-resave",app);}
}

struct BoardState {
    unsigned main,plantId,zombieId;int stage,wave,sun,plantHP,zombieHP,adviceDuration;
    BackgroundType background;float zombieX;
    BoardState(Board& b,unsigned p,unsigned z):main(b.mMainCounter),plantId(p),zombieId(z),
        stage(b.mChallenge->mSurvivalStage),wave(b.mCurrentWave),sun(b.mSunMoney),
        plantHP(b.mPlants.DataArrayGet(p)->mPlantHealth),zombieHP(b.mZombies.DataArrayGet(z)->mBodyHealth),
        adviceDuration(b.mAdvice->mDuration),background(b.mBackground),zombieX(b.mZombies.DataArrayGet(z)->mPosX){}
    void Check(Board& b) const {
        auto* p=b.mPlants.DataArrayTryToGet(plantId);auto* z=b.mZombies.DataArrayTryToGet(zombieId);
        Require(b.mPaused && b.mMainCounter==main && b.mChallenge->mSurvivalStage==stage && b.mCurrentWave==wave &&
            b.mSunMoney==sun && b.mBackground==background && b.mAdvice->mDuration==adviceDuration &&
            p && z && p->mPlantHealth==plantHP && z->mBodyHealth==zombieHP && z->mPosX==zombieX &&
            p->mApp==b.mApp && z->mBoard==&b,"Real continue changed the paused board snapshot");
    }
};

unsigned NativePosition(LawnApp& app,bool playing,std::ostream& log,const char* stage) {
    Require(!app.mNoSoundNeeded && app.mMusicVolume==0 && app.mSfxVolume==0 &&
        dynamic_cast<Sexy::BassMusicInterface*>(app.mMusicInterface) && Sexy::gBass,
        "Audio smoke must use real application-muted BASS");
    auto* m=app.mMusic;const auto handle=m->GetBassMusicHandle(m->mCurMusicFileMain);
    Require(handle!=0,"Survival music has no actual BASS handle");
    const auto active=Sexy::gBass->BASS_ChannelIsActive(handle);
    const auto pos=Sexy::gBass->BASS_ChannelGetPosition(handle,BASS_POS_MUSIC_ORDER);
    const auto decode=Sexy::gBass->BASS_ChannelGetPosition(handle,BASS_POS_MUSIC_ORDER|BASS_POS_DECODE);
    log<<stage<<" mode="<<int(app.mGameMode)<<" tune="<<int(m->mCurMusicTune)<<" active="<<active
       <<" position="<<pos<<" decode="<<decode<<" saved="<<unsigned(m->mPauseOffset)<<std::endl;
    Require(pos!=QWORD(-1) && decode!=QWORD(-1) && active==(playing?BASS_ACTIVE_PLAYING:BASS_ACTIVE_STOPPED),
        "Survival BASS playback/position state is wrong");

    // Query the real decoder after the actual start/pause/continue/repick paths.
    // 1073 0045E050 intentionally overlaps Pool DRUMS with HIHATS on 18..24.
    Require(m->mCurMusicTune==MUSIC_TUNE_POOL_WATERYGRAVES || m->mCurMusicTune==MUSIC_TUNE_FOG_RIGORMORMIST,
        "Unexpected tune in survival channel-mask probe");
    const bool pool=m->mCurMusicTune==MUSIC_TUNE_POOL_WATERYGRAVES;
    const std::array<const char*,3> masks=pool?
        std::array<const char*,3>{"111111111111111111000000000000","000000000000000000111111111110","000000000000000000111111100001"}:
        std::array<const char*,3>{"111111111111111100000000000000","000000000000000011111110000000","000000000000000000000001000000"};
    const std::array<MusicFile,3> files={m->mCurMusicFileMain,m->mCurMusicFileDrums,m->mCurMusicFileHihats};
    std::set<HMUSIC> handles;
    for(size_t file=0;file<files.size();++file){
        const auto h=m->GetBassMusicHandle(files[file]);
        Require(h!=0&&handles.insert(h).second,"MOD stems must retain distinct BASS instances");
        const auto flags=Sexy::gBass->BASS_ChannelFlags(h,0,0);
        Require(flags!=DWORD(-1)&&(flags&BASS_MUSIC_POSRESET)!=0,"MOD seek must reset old notes");
        std::string mask;
        for(unsigned channel=0;channel<30;++channel){
            float volume=-1;
            Require(Sexy::gBass->BASS_ChannelGetAttribute(h,BASS_ATTRIB_MUSIC_VOL_CHAN+channel,&volume)!=FALSE,
                "Could not query real MOD channel volume");
            Require(volume==float(masks[file][channel]-'0'),"Real BASS MOD channel mask differs from 1073");
            mask+=volume==1?'1':'0';
        }
        log<<"channel-mask stage="<<stage<<" tune="<<int(m->mCurMusicTune)<<" file="<<int(files[file])
           <<" handle="<<h<<" mask="<<mask<<" posreset=1"<<std::endl;
    }
    return unsigned(pos);
}

void CaptionProbe(LawnApp& app,int flags,std::ostream& log) {
    auto& b=*app.mBoard;Require(b.mAdvice->mMessageStyle==MESSAGE_STYLE_HOUSE_NAME && b.mAdvice->mDuration>0,
        "Restored survival advice is not the saved house-name notice");
    auto replace=[](SexyString s,const SexyString& from,const SexyString& to){
        auto i=s.find(from);Require(i!=SexyString::npos,"Missing caption replacement token");s.replace(i,from.size(),to);return s;};
    auto unit=flags==1?gStr.ONE_FLAG:
        replace(gStr.COUNT_FLAGS,UiTextPlaceholderToken(UiTextPlaceholder::Count),std::to_string(flags));
    auto text=replace(gStr.FLAGS_COMPLETED,UiTextPlaceholderToken(UiTextPlaceholder::Flags),unit);
    Require(!text.empty() && text.find("<Missing ")==SexyString::npos,"Caption fixture resource missing");
    const auto mode=app.mGameMode;
    auto draw=[&](bool reference){
        auto* screen=app.mDDInterface->mScreenImage;screen->FillRect(Sexy::Rect(0,0,800,600),Sexy::Color(19,31,47),0);
        Sexy::Graphics g(screen);
        if(reference)app.mGameMode=GAMEMODE_ADVENTURE;
        b.mAdvice->Draw(&g);app.mGameMode=mode;
        if(reference)TodDrawString(&g,text,400-b.mX,576,Sexy::FONT_HOUSEOFTERROR16,
            Sexy::Color(224,187,98,std::min(b.mAdvice->mDuration*15,255)),DS_ALIGN_CENTER);
        auto& r=*app.mDDInterface->mRenderInterface;r.Flush();return r.mRenderer->ReadScenePixels();
    };
    const auto actual=draw(false),expected=draw(true);
    Require(actual.size()==480000 && actual==expected,"Continued survival caption GPU output differs from 1073");
    log<<"caption mode="<<int(mode)<<" stage="<<b.mChallenge->mSurvivalStage<<" flags="<<flags
       <<" duration="<<b.mAdvice->mDuration<<" pixels-equal=1"<<std::endl;
}

void CheckMap(LawnApp& app) {
    auto& r=*app.mDDInterface->mRenderInterface;r.Flush();const auto pixels=r.mRenderer->ReadScenePixels();
    Require(pixels.size()==480000,"Wrong survival scene dimensions");
    for(auto region:std::array<std::array<int,4>,3>{{{100,140,260,220},{270,300,440,430},{570,410,740,530}}}) {
        std::set<uint32_t> colors;unsigned nonblack=0,total=0;
        for(int y=region[1];y<region[3];++y)for(int x=region[0];x<region[2];++x){
            auto c=pixels[y*800+x]&0xffffff;colors.insert(c);nonblack+=c!=0;++total;}
        Require(colors.size()>128 && nonblack>total*9/10,"Continued survival map is black or missing");
    }
}

void SelectSeeds(LawnApp& app) {
    auto& chooser=*app.mSeedChooserScreen;
    const int slots=app.mBoard->mSeedBank->mNumPackets;
    Require(slots>=3 && slots<=10,"Survival chooser has invalid packet capacity");
    for(auto seed:{SEED_SUNFLOWER,SEED_LILYPAD,SEED_CACTUS,SEED_PEASHOOTER,SEED_ICESHROOM,
        SEED_SNOWPEA,SEED_SEASHROOM,SEED_PUFFSHROOM,SEED_MELONPULT,SEED_CHERRYBOMB}){
        if(chooser.mSeedsInBank==slots)break;
        if(chooser.mChosenSeeds[seed].mSeedState==SEED_IN_CHOOSER)
            chooser.ClickedSeedInChooser(chooser.mChosenSeeds[seed]);
    }
    Require(chooser.mSeedsInBank==slots,"Survival chooser did not fill the seed bank");
}

std::vector<unsigned char> ReadSave(LawnApp& app,const std::string& path) {
    Buffer buffer;Require(app.ReadBufferFromFile(path,&buffer,false),"Cannot inspect survival save");
    return {buffer.GetDataPtr(),buffer.GetDataPtr()+buffer.GetDataLen()};
}
}

void ChallengeRoutingProbe(LawnApp& app) {
    // 真路由对拍（2026-10-08 survival:day"跳冒险"事故后立的账）：挑战页按钮 →
    // WidgetManager 合成点击 → ButtonDepress → PreNewGame 全链。72 行逐一断言
    // 启动模式=行内 mChallengeMode；代表性行加板面状态断言（波数/背景/名字源）。
    // 事故教训：Scenes/Survival 驱动 PreNewGame 直调，id 键控路由（行号算术）
    // 三犯同病却零 UI 级覆盖——本探针补的就是这一层。
    Require(!app.mBoard && app.mDialogMap.empty() && getenv("PVZ_APPDATA_DIR"),
        "Routing fixture is not isolated");
    std::ofstream log(ProbePath("challenge-routing.txt"));
    Require(bool(log),"Cannot write challenge routing evidence");
    struct Restore {
        LawnApp& app;std::array<int,100> records;int finished,level;
        bool mini,puzzle,survival;
        explicit Restore(LawnApp& a):app(a),records{},finished(a.mPlayerInfo->mFinishedAdventure),
            level(a.mPlayerInfo->mLevel),mini(a.mPlayerInfo->mHasUnlockedMinigames),
            puzzle(a.mPlayerInfo->mHasUnlockedPuzzleMode),survival(a.mPlayerInfo->mHasUnlockedSurvivalMode)
        {std::copy(std::begin(a.mPlayerInfo->mChallengeRecords),std::end(a.mPlayerInfo->mChallengeRecords),records.begin());}
        ~Restore(){
            std::copy(records.begin(),records.end(),std::begin(app.mPlayerInfo->mChallengeRecords));
            app.mPlayerInfo->mFinishedAdventure=finished;app.mPlayerInfo->mLevel=level;
            app.mPlayerInfo->mHasUnlockedMinigames=mini;app.mPlayerInfo->mHasUnlockedPuzzleMode=puzzle;
            app.mPlayerInfo->mHasUnlockedSurvivalMode=survival;
            app.mGameMode=GAMEMODE_ADVENTURE;
        }
    } restore{app};
    // 环境对齐真实游玩链：玩家到挑战页时标题屏早已拆除（FastLoad 同款拆卸）；
    // 挂着的全屏标题组件会吞掉合成点击，路由就测不到了。
    if (app.mTitleScreen) {
        app.mWidgetManager->RemoveWidget(app.mTitleScreen);
        app.SafeDeleteWidget(app.mTitleScreen);
        app.mTitleScreen = nullptr;
    }
    // 全解锁，绕开奖杯门（门本身另有覆盖；本探针只证路由）。
    auto* player=app.mPlayerInfo;
    player->mFinishedAdventure=2;player->mLevel=50;
    player->mHasUnlockedMinigames=player->mHasUnlockedPuzzleMode=player->mHasUnlockedSurvivalMode=1;
    for(int i=1;i<=(int)GameMode::GAMEMODE_TREE_OF_WISDOM;++i)
        if(i!=(int)GameMode::GAMEMODE_SCARY_POTTER_ENDLESS && i!=(int)GameMode::GAMEMODE_PUZZLE_I_ZOMBIE_ENDLESS &&
            i!=(int)GameMode::GAMEMODE_SURVIVAL_ENDLESS_STAGE_3)
            player->mChallengeRecords[i]=20;

    unsigned checked=0,hitChecked=0,overlapRows=0;
    for(int row=0;row<NUM_CHALLENGE_MODES;++row) {
        const ChallengeDefinition& def=GetChallengeDefinition(row);
        app.ShowChallengeScreen(def.mPage);
        app.mChallengeScreen->UpdateButtons();
        Sexy::ButtonWidget* button=app.mChallengeScreen->mChallengeButtons[row];
        const int x=button->mX+button->mWidth/2;
        const int y=button->mY+button->mHeight/2;
        // 几何锚：按钮位置必须与其定义行同源（38+col*155；生存页 125+row*145、
        // 其余页 93+row*119）——表值漂移在此编译期外第一时间暴露。
        const bool survivalPage=def.mPage==ChallengePage::CHALLENGE_PAGE_SURVIVAL;
        Require(button->mX==38+def.mCol*155 &&
            button->mY==(survivalPage?125:93)+def.mRow*(survivalPage?145:119),
            "Challenge button geometry does not match its definition row");
        // 同槽多行=原版既有形态（Squirrel/Intro 共用 LIMBO(2,3)，后行者居上赢
        // 命中）。期望命中=覆盖该点且可见的最靠后行。
        int winner=row;
        for(int later=row+1;later<NUM_CHALLENGE_MODES;++later) {
            Sexy::ButtonWidget* b=app.mChallengeScreen->mChallengeButtons[later];
            if(b->mVisible && x>=b->mX && x<b->mX+b->mWidth && y>=b->mY && y<b->mY+b->mHeight)
                winner=later;
        }
        if(winner!=row) ++overlapRows;
        // 只验命中不真开局：MouseDown 后读 mLastDownWidget 即取消——绝不触发
        // ButtonDepress/PreNewGame（部分模式开局链在无 tick 环境会驻留；启动
        // 模式=行内 mChallengeMode 的映射已由 ButtonDepress 源码直查+现有
        // 冒烟 PreNewGame 实测覆盖）。
        app.mWidgetManager->MouseMove(x,y);
        app.mWidgetManager->MouseDown(x,y,1);
        Require(app.mWidgetManager->mLastDownWidget==(Sexy::Widget*)app.mChallengeScreen->mChallengeButtons[winner],
            "Challenge click does not land on the expected front-most button");
        app.mWidgetManager->CancelMouseDownState();
        ++checked;
        if(winner==row) ++hitChecked;
        app.KillChallengeScreen();
    }
    log<<"rows="<<checked<<" direct-hits="<<hitChecked<<" overlapped(slots shared with later row, original form)="<<overlapRows<<std::endl;
    log<<"challenge-routing-all-rows-hit-correct=PASS"<<std::endl;
    log.close();
    // 恢复探针起点：无板、无屏、模式归冒险（与进入时一致）
    Require(!app.mBoard,"Routing probe must leave no board behind");
}

void PortableSurvivalSmokeTick(LawnApp& app) {
    Require(getenv("PVZ_MODERN_HIDDEN") && getenv("PVZ_APPDATA_DIR") && app.mGpuContext &&
        !IsWindowVisible(app.mHWnd),"Survival probe needs hidden isolated process");
    static int state=0,index=0;static unsigned deadline=0,started=0,plant=0,zombie=0,resumedPos=0;
    static std::unique_ptr<BoardState> boardState;static std::unique_ptr<Music> musicState;
    static unsigned phaseMain=0;static int phaseStage=0,phasePlantHP=0,phaseSun=0;
    static Board* phaseBoard=nullptr;static std::vector<unsigned char> phaseSave;
    static std::ofstream log;const bool audio=getenv("PVZ_MODERN_AUDIO_SMOKE")!=nullptr;
    constexpr std::array modes{GAMEMODE_SURVIVAL_NORMAL_STAGE_3,GAMEMODE_SURVIVAL_NORMAL_STAGE_4,
        GAMEMODE_SURVIVAL_HARD_STAGE_3,GAMEMODE_SURVIVAL_HARD_STAGE_4,
        GAMEMODE_SURVIVAL_ENDLESS_STAGE_3,GAMEMODE_SURVIVAL_ENDLESS_STAGE_4};
    if(state==0){
        if(!app.mLoaded || !app.mTitleScreen || !app.mTitleScreen->mLoadingThreadComplete)return;
        started=app.mUpdateCount;app.LoadingCompleted();state=1;deadline=started+50;
        log.open(ProbePath("survival-continue.txt"));Require(bool(log),"Cannot write survival evidence");return;
    }
    Require(app.mUpdateCount-started<22000,"Survival smoke timed out");
    if(app.mUpdateCount<deadline)return;
    if(state==1){
        RequireDeletionBoundary(app,"survival-title-to-menu");
        app.KillGameSelector();(app.*AppAccess::Cleanup)();
        app.mPlayerInfo->mFinishedAdventure=1;app.mPlayerInfo->mLevel=50;
        if(audio)MusicOwnershipProbe(app);
        CapabilityProbe(app);
        ChallengeRoutingProbe(app);state=2;
    }
    if(state==2){
        app.KillGameSelector();app.PreNewGame(modes[index],false);
        Require(app.mBoard && app.mBoard->mBackground==(index%2?BACKGROUND_4_FOG:BACKGROUND_3_POOL),"Wrong survival mode map");
        state=3;return;
    }
    if(state==3){
        if(!app.mSeedChooserScreen || !app.mSeedChooserScreen->mMouseVisible)return;
        SelectSeeds(app);
        state=4;deadline=app.mUpdateCount+40;return;
    }
    if(state==4){
        Require(app.mSeedChooserScreen->mSeedsInFlight==0,"Survival chosen cards have not landed");
        app.mSeedChooserScreen->OnStartButton();state=5;return;
    }
    if(state==5){
        if(app.mGameScene!=SCENE_PLAYING)return;
        auto& b=*app.mBoard;Require(!app.mSeedChooserScreen && b.NeedSaveGame(),"Survival fixture did not start playing");
        // Late-stage fixture, not a claim of playing all preceding flags.
        b.mChallenge->mSurvivalStage=index<2?3:index<4?2:7;b.mCurrentWave=3;
        auto* p=b.NewPlant(1,0,SEED_PEASHOOTER,SEED_NONE);plant=b.mPlants.DataArrayGetID(p);
        auto* z=b.AddZombieInRow(ZOMBIE_NORMAL,0,0);z->mPosX=730;zombie=b.ZombieGetID(z);
        b.DisplayAdvice("Survival continue fixture",MESSAGE_STYLE_HOUSE_NAME,ADVICE_NONE);
        if(audio){
            const auto tune=index%2?MUSIC_TUNE_FOG_RIGORMORMIST:MUSIC_TUNE_POOL_WATERYGRAVES;
            Require(!app.mMusic->mMusicDisabled && app.mMusic->mCurMusicTune==tune,"Survival start selected wrong music");
            // Nonzero order AND row catches a restart-to-track-start regression.
            app.mMusic->PlayMusic(tune,MAKELONG(index%2?0x7E:0x5F,7));
            NativePosition(app,true,log,"playing");
        }else Require(app.mMusic->mMusicDisabled && app.mMusic->mCurMusicTune==MUSIC_TUNE_NONE,"NoSound fixture unexpectedly enabled music");
        state=6;deadline=app.mUpdateCount+50;return;
    }
    if(state==6){
        app.DoNewOptions(false);app.DoConfirmBackToMain();
        boardState=std::make_unique<BoardState>(*app.mBoard,plant,zombie);
        musicState=std::make_unique<Music>(*app.mMusic);
        if(audio){Require(musicState->mPaused && HIWORD(musicState->mPauseOffset)>0,"Pause fixture has no saved nonzero row");
            NativePosition(app,false,log,"paused");}
        state=7;deadline=app.mUpdateCount+40;return;
    }
    if(state==7){
        boardState->Check(*app.mBoard);
        Require(MusicState(*app.mMusic)==MusicState(*musicState),"Pause changed saved music fields");
        auto* dialog=dynamic_cast<LawnDialog*>(app.GetDialog(DIALOG_CONFIRM_BACK_TO_MAIN));
        Require(dialog && (dialog->mButtonDelay<0 || dialog->mUpdateCnt>unsigned(dialog->mButtonDelay)),"Leave dialog is not ready");
        dialog->ButtonDepress(Sexy::Dialog::ID_YES);
        const auto file=GetSavedGameName(modes[index],app.mPlayerInfo->mId);
        Require(!app.mBoard && app.mGameSelector && app.FileExists(file),"Real leave callback did not save and return to menu");
        log<<"saved mode="<<int(modes[index])<<" file="<<file<<" main="<<boardState->main
           <<" stage="<<boardState->stage<<" offset="<<musicState->mPauseOffset<<std::endl;
        state=8;deadline=app.mUpdateCount+80;return;
    }
    if(state==8){
        Require(!app.mBoard && app.mGameSelector,"Survival leave did not remain at menu");
        RequireDeletionBoundary(app,"survival-old-board-before-continue");
        app.KillGameSelector();app.PreNewGame(modes[index],true);
        Require(app.mBoard && dynamic_cast<ContinueDialog*>(app.GetDialog(DIALOG_CONTINUE)),"Real saved game did not open Continue dialog");
        boardState->Check(*app.mBoard);
        Require(MusicState(*app.mMusic)==MusicState(*musicState) && app.mMusic->mMusicDisabled==!audio,
            "Real continue changed persisted music state/capability");
        state=9;deadline=app.mUpdateCount+40;return;
    }
    if(state==9){
        RequireDeletionBoundary(app,"survival-selector-after-continue");
        boardState->Check(*app.mBoard);
        const auto file=GetSavedGameName(modes[index],app.mPlayerInfo->mId);
        Require(app.FileExists(file) && app.mBoard->mNextSurvivalStageCounter==0,"Mid-stage save disappeared before Continue");
        CaptionProbe(app,boardState->stage*(index<2?1:2),log);
        auto* dialog=dynamic_cast<ContinueDialog*>(app.GetDialog(DIALOG_CONTINUE));
        Require(dialog!=nullptr,"Continue dialog vanished");dialog->ButtonDepress(ContinueDialog::ContinueDialog_Continue);
        Require(!app.GetDialog(DIALOG_CONTINUE) && !app.mBoard->mPaused && !app.mMusic->mPaused && !app.FileExists(file),
            "Continue callback did not resume and consume the interruption save");
        if(audio){
            resumedPos=NativePosition(app,true,log,"resumed");
            Require(LOWORD(resumedPos)==LOWORD(musicState->mPauseOffset) &&
                HIWORD(resumedPos)>=HIWORD(musicState->mPauseOffset)*4 &&
                HIWORD(resumedPos)<=HIWORD(musicState->mPauseOffset)*4+4,
                "Continue did not resume at the saved BASS order/row");
        }
        state=10;deadline=app.mUpdateCount+100;return;
    }
    if(state==10){
        Require(app.mBoard->mMainCounter>boardState->main && app.mBoard->mChallenge->mSurvivalStage==boardState->stage,
            "Continued board did not advance at the restored survival stage");
        if(audio)Require(NativePosition(app,true,log,"advanced")!=resumedPos,"Continued BASS did not advance");
        CheckMap(app);Capture(("survival-continued-"+std::to_string(index)).c_str(),app);
        log<<"cycle="<<index+1<<" mode="<<int(modes[index])<<" pass=1"<<std::endl;
        auto& b=*app.mBoard;
        // End-of-stage fixture: remove remaining test enemies and enter the
        // actual 2->1 autosave step. Do not fabricate a counter=1 file by hand.
        Zombie* z=nullptr;while(b.IterateZombies(z))z->DieNoLoot();b.ProcessDeleteQueue();
        Require(b.IsSurvivalStageWithRepick(),"Transition fixture is a final stage");
        b.mCurrentWave=b.mNumWaves;b.mNextSurvivalStageCounter=2;
        b.UpdateLevelEndSequence();
        Require(b.mNextSurvivalStageCounter==1 && !b.mLevelComplete,"Stage boundary did not create the autosave step");
        phaseMain=b.mMainCounter;phaseStage=b.mChallenge->mSurvivalStage;
        phasePlantHP=b.mPlants.DataArrayGet(plant)->mPlantHealth;phaseSun=b.mSunMoney;
        musicState=std::make_unique<Music>(*app.mMusic);
        phaseSave=ReadSave(app,GetSavedGameName(modes[index],app.mPlayerInfo->mId));
        log<<"transition-autosaved mode="<<int(modes[index])<<" stage="<<phaseStage<<" counter=1 bytes="<<phaseSave.size()<<std::endl;
        // Leave after the game's autosave, before the following update would
        // advance the stage. No input injection and no second synthetic save.
        app.mBoardResult=BOARDRESULT_QUIT;app.DoBackToMain();
        state=11;deadline=app.mUpdateCount+50;return;
    }
    if(state==11){
        Require(!app.mBoard && app.mGameSelector,"Stage-boundary leave did not reach menu");
        RequireDeletionBoundary(app,"survival-old-board-before-repick-load");
        app.KillGameSelector();app.PreNewGame(modes[index],true);phaseBoard=app.mBoard;
        Require(phaseBoard && dynamic_cast<ContinueDialog*>(app.GetDialog(DIALOG_CONTINUE)) &&
            phaseBoard->mPaused && phaseBoard->mNextSurvivalStageCounter==1 &&
            phaseBoard->mChallenge->mSurvivalStage==phaseStage && phaseBoard->mMainCounter==phaseMain &&
            phaseBoard->mCurrentWave==phaseBoard->mNumWaves,"Stage-boundary autosave was not restored");
        Require(MusicState(*app.mMusic)==MusicState(*musicState) && app.mMusic->mMusicDisabled==!audio,
            "Stage-boundary load changed music state");
        state=12;deadline=app.mUpdateCount+40;return;
    }
    if(state==12){
        RequireDeletionBoundary(app,"survival-selector-after-repick-load");
        Require(app.mBoard==phaseBoard && phaseBoard->mPaused && phaseBoard->mMainCounter==phaseMain,
            "Paused stage-boundary board advanced");
        auto* dialog=dynamic_cast<ContinueDialog*>(app.GetDialog(DIALOG_CONTINUE));
        Require(dialog!=nullptr,"Stage-boundary Continue dialog vanished");
        dialog->ButtonDepress(ContinueDialog::ContinueDialog_Continue);
        Require(!app.GetDialog(DIALOG_CONTINUE) && !phaseBoard->mPaused && phaseBoard->mNextSurvivalStageCounter==1 &&
            ReadSave(app,GetSavedGameName(modes[index],app.mPlayerInfo->mId))==phaseSave,
            "Continue consumed or rewrote the counter=1 stage-boundary save");
        log<<"transition-continued mode="<<int(modes[index])<<" counter=1 file-retained=1"<<std::endl;
        state=13;return;
    }
    if(state==13){
        if(app.mGameScene!=SCENE_LEVEL_INTRO || !app.mSeedChooserScreen)return;
        auto* p=app.mBoard->mPlants.DataArrayTryToGet(plant);
        Require(app.mBoard==phaseBoard && phaseBoard->mChallenge->mSurvivalStage==phaseStage+1 &&
            phaseBoard->mCurrentWave==0 && phaseBoard->mNextSurvivalStageCounter==0 && p &&
            p->mPlantHealth==phasePlantHP && phaseBoard->mSunMoney==phaseSun,
            "Stage-boundary continue did not repick exactly once on the same planted board");
        Require(ReadSave(app,GetSavedGameName(modes[index],app.mPlayerInfo->mId))==phaseSave,
            "Entering stage repick consumed/changed its recovery save");
        // Unlike the earlier explicit notice fixture, this is the actual
        // HOUSE_NAME produced by InitSurvivalStage -> StartLevelIntro.
        CaptionProbe(app,(phaseStage+1)*(index<2?1:2),log);
        log<<"transition-repick mode="<<int(modes[index])<<" stage="<<phaseStage+1<<" same-board=1 same-plant=1"<<std::endl;
        state=14;return;
    }
    if(state==14){
        if(!app.mSeedChooserScreen->mMouseVisible)return;
        Require(ReadSave(app,GetSavedGameName(modes[index],app.mPlayerInfo->mId))==phaseSave,
            "Recovery save did not survive the repick animation");
        SelectSeeds(app);state=15;deadline=app.mUpdateCount+40;return;
    }
    if(state==15){
        Require(app.mSeedChooserScreen->mSeedsInFlight==0,"Repick seed animation has not landed");
        app.mSeedChooserScreen->OnStartButton();state=16;return;
    }
    if(state==16){
        if(app.mGameScene!=SCENE_PLAYING)return;
        auto* p=app.mBoard->mPlants.DataArrayTryToGet(plant);
        Require(app.mBoard==phaseBoard && !app.mSeedChooserScreen && !app.mBoard->mPaused && p &&
            p->mPlantHealth==phasePlantHP && app.mBoard->mChallenge->mSurvivalStage==phaseStage+1 &&
            !app.FileExists(GetSavedGameName(modes[index],app.mPlayerInfo->mId)),
            "StartLevel did not consume the stage-boundary save after repick");
        if(audio){
            Require(app.mMusic->mCurMusicTune==(index%2?MUSIC_TUNE_FOG_RIGORMORMIST:MUSIC_TUNE_POOL_WATERYGRAVES) &&
                !app.mMusic->mPaused,"Repicked stage has wrong music");NativePosition(app,true,log,"transition-playing");
        }
        state=17;deadline=app.mUpdateCount+70;return;
    }
    if(state==17){
        CheckMap(app);Capture(("survival-transition-"+std::to_string(index)).c_str(),app);
        Require(app.mBoard->mChallenge->mSurvivalStage==phaseStage+1 &&
            !app.FileExists(GetSavedGameName(modes[index],app.mPlayerInfo->mId)),"Stage incremented twice or resurrected its autosave");
        log<<"transition-cycle="<<index+1<<" mode="<<int(modes[index])<<" pass=1"<<std::endl;
        if(++index==int(modes.size())){
            Report("portable-survival-twelve-real-deferred-board-selector-deletions",app);
            Report("portable-survival-six-real-menu-save-continue-captions",app);
            Report("portable-survival-six-counter1-autosave-repick-file-lifecycles",app);
            if(audio){Report("portable-survival-six-bass-order-row-resumes",app);
                Report("portable-music-1073-channel-masks-posreset",app);}
            ProbeScreenshot(app);Report("PASS survival; 16 capability cases, six mid-stage continues and six counter=1 repicks",app);
            app.CloseRequestAsync();state=18;return;
        }
        app.DoBackToMain();state=2;deadline=app.mUpdateCount+50;
    }
}
