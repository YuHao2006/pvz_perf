#include "PortableSaveFailureSmoke.h"
#include "PortablePoolReadSmoke.h"
#include "LawnCommon.h"
#include "ModernVulkanSmoke.h"
#include "LawnApp.h"
#include "Board.h"
#include "Zombie.h"
#include "Plant.h"
#include "Projectile.h"
#include "Coin.h"
#include "LawnMower.h"
#include "GridItem.h"
#include "Challenge.h"
#include "CursorObject.h"
#include "MessageWidget.h"
#include "SeedPacket.h"
#include "System/PlayerInfo.h"
#include "System/Music.h"
#include "System/SaveGame.h"
#include "System/LevelSaveFormat.h"
#include "Widget/TitleScreen.h"
#include "Sexy.TodLib/EffectSystem.h"
#include "Sexy.TodLib/TodParticle.h"
#include "Sexy.TodLib/Reanimator.h"
#include "Sexy.TodLib/Attachment.h"
#include "graphics/GpuBackend.h"
#include <zlib.h>
#include <fstream>
#include <stdexcept>
#include <vector>

namespace {
using namespace ModernSmoke;
using Bytes=std::vector<unsigned char>;
void Require(bool ok,const char* text){if(!ok)throw std::runtime_error(text);}
unsigned Read32(const Bytes& b,size_t at){unsigned n=0;for(unsigned i=0;i<4;++i)n|=unsigned(b.at(at+i))<<(8*i);return n;}
void Put32(Bytes& b,size_t at,unsigned n){for(unsigned i=0;i<4;++i)b.at(at+i)=static_cast<unsigned char>(n>>(8*i));}
void Write(LawnApp& app,const std::string& path,const Bytes& bytes){Buffer b;b.SetData(bytes);Require(app.WriteBufferToFile(path,&b),"Cannot write isolated save rejection fixture");}
Bytes Read(LawnApp& app,const std::string& path){Buffer b;Require(app.ReadBufferFromFile(path,&b,false),"Cannot read save rejection fixture");return b.mData;}
void Bindings(Board& b){
    auto pool=[&](auto& p){
        auto* item=static_cast<decltype(&p.mBlock[0].mItem)>(nullptr);
        while(p.IterateNext(item))Require(item->mApp==b.mApp&&item->mBoard==&b,"Restored pool lost runtime owner pointers");};
    pool(b.mZombies);pool(b.mPlants);pool(b.mProjectiles);pool(b.mCoins);pool(b.mLawnMowers);pool(b.mGridItems);
    Require(b.mAdvice->mApp==b.mApp && b.mCursorObject->mApp==b.mApp && b.mCursorObject->mBoard==&b &&
        b.mCursorPreview->mApp==b.mApp && b.mCursorPreview->mBoard==&b && b.mSeedBank->mApp==b.mApp &&
        b.mSeedBank->mBoard==&b && b.mChallenge->mApp==b.mApp && b.mChallenge->mBoard==&b &&
        b.mApp->mMusic->mApp==b.mApp && b.mApp->mMusic->mMusicInterface==b.mApp->mMusicInterface,
        "Restored singleton lost runtime owner pointers");
    for(auto& packet:b.mSeedBank->mSeedPackets)Require(packet.mApp==b.mApp&&packet.mBoard==&b,"Restored seed packet lost owner");
}
}
void PortableSaveFailureSmokeTick(LawnApp& app){
    using namespace ModernSmoke;
    Require(getenv("PVZ_MODERN_HIDDEN")&&getenv("PVZ_APPDATA_DIR")&&app.mNoSoundNeeded&&
        app.mGpuContext&&!IsWindowVisible(app.mHWnd),"Save rejection probe must remain isolated/hidden/silent");
    CallbackScope callback(app); // Also safe when invoked directly by a diagnostic caller.
    static unsigned stage=0,which=0,deadline=0,resumeCounter=0;
    static Bytes valid;static std::vector<Bytes> invalid;static std::ofstream log;
    static std::string saveName;
    if(stage==0){
        if(!app.mLoaded||!app.mTitleScreen||!app.mTitleScreen->mLoadingThreadComplete)return;
        app.LoadingCompleted();stage=1;deadline=app.mUpdateCount+100;return;
    }
    if(stage==6||app.mUpdateCount<deadline)return;
    if(stage==1){
        app.KillGameSelector();app.mPlayerInfo->mLevel=11;app.mPlayerInfo->mFinishedAdventure=1;
        app.PreNewGame(GAMEMODE_ADVENTURE,false);app.StartPlaying();auto& b=*app.mBoard;b.Pause(true);
        for(auto type:{ZOMBIE_DANCER,ZOMBIE_BACKUP_DANCER,ZOMBIE_JACK_IN_THE_BOX,ZOMBIE_DIGGER}){
            auto* z=b.AddZombieInRow(type,0,0);Require(z!=nullptr,"Cannot allocate sound-owning zombie fixture");
            if(type==ZOMBIE_JACK_IN_THE_BOX||type==ZOMBIE_DIGGER)z->mPlayingSong=true;
        }
        Require(b.NewPlant(0,0,SEED_SUNFLOWER)&&b.AddProjectile(200,200,0,0,PROJECTILE_PEA)&&
            b.AddCoin(300,200,COIN_SUN,COIN_MOTION_FROM_SKY)&&b.AddALadder(2,0),"Missing owned board fixture");
        Require(app.AddTodParticle(300,200,0,PARTICLE_COIN_PICKUP_ARROW)!=nullptr,"Missing particle stream fixture");
        b.InitLawnMowers();
        Require(b.mLawnMowers.mSize>0,"Save rejection fixture lacks lawnmowers");
        Bindings(b);
        Require(LawnSaveGame(&b,ProbePath("save-reject-valid.dat64")),"Cannot save valid control");
        valid=Read(app,ProbePath("save-reject-valid.dat64"));
        invalid.push_back(valid);invalid.back().back()^=1; // incorrect final marker
        invalid.push_back(valid);invalid.back().pop_back(); // partial marker
        invalid.push_back(valid);invalid.back().push_back(0x42); // trailing byte
        constexpr auto musicSize=LevelSaveFormat::GetRecordLayout(LevelSaveFormat::RecordKind::Music).mDat64Size;
        constexpr auto challengeSize=LevelSaveFormat::GetRecordLayout(LevelSaveFormat::RecordKind::Challenge).mDat64Size;
        invalid.push_back(valid);invalid.back().resize(valid.size()-12-musicSize/2); // partial Music
        invalid.push_back(valid);invalid.back().resize(valid.size()-12-4-musicSize-challengeSize/2);
        size_t next=LevelSaveFormat::DAT64_HEADER_SIZE+4+LevelSaveFormat::DAT64_BOARD_STATE_SIZE;
        for(unsigned pool=0;pool<11;++pool)next+=16+Read32(valid,next+12);
        Require(app.mEffectSystem->mParticleHolder->mParticleSystems.mSize>0,"No first particle definition to reject");
        invalid.push_back(valid);Put32(invalid.back(),next,0xffffffffu); // valid pools, invalid first definition
        for(auto& bytes:invalid){
            const auto length=bytes.size()-LevelSaveFormat::DAT64_HEADER_SIZE;
            Put32(bytes,24,unsigned(length));Put32(bytes,28,0);
            Put32(bytes,32,crc32(0,bytes.data()+LevelSaveFormat::DAT64_HEADER_SIZE,uInt(length)));
        }
        saveName=GetSavedGameName(app.mGameMode,app.mPlayerInfo->mId);
        log.open(ProbePath("save-reject-cases.txt"));Require(bool(log),"Cannot log save rejection evidence");
        log<<"fixture zombies="<<b.mZombies.mSize<<" plants="<<b.mPlants.mSize<<" projectiles="<<b.mProjectiles.mSize
            <<" coins="<<b.mCoins.mSize<<" mowers="<<b.mLawnMowers.mSize<<" grid="<<b.mGridItems.mSize<<std::endl;
        app.DoBackToMain();stage=2;deadline=app.mUpdateCount+50;return;
    }
    if(stage==2){
        log<<"source-boundary board="<<bool(app.mBoard)<<" selector="<<bool(app.mGameSelector)<<" pending="<<app.mSafeDeleteList.size()<<std::endl;
        for(const auto& pending:app.mSafeDeleteList)log<<"queued="<<typeid(*pending.mWidget).name()<<" at-depth="<<pending.mUpdateAppDepth
            <<" current-depth="<<app.mUpdateAppDepth<<" holds="<<pending.mWidget->mDeferredDeleteHolds<<std::endl;
        Require(!app.mBoard&&app.mSafeDeleteList.empty(),"Save source did not finish ordinary deferred deletion");
        app.KillGameSelector();
        Write(app,saveName,invalid.at(which));
        log<<"case="<<which<<" entering-TryLoadGame=1 bytes="<<invalid[which].size()<<std::endl;
        bool rejected=false;
        try {
            app.TryLoadGame();
        } catch(const SaveGameLoadRejected& error) {
            rejected=true;
            log<<"case="<<which<<" explicit-load-rejection=1 message="<<error.what()<<std::endl;
        }
        Require(rejected&&!app.mBoard,"Invalid save did not raise a load rejection or failed board remained active");
        log<<"case="<<which<<" failed-return=1 pending-deletes="<<app.mSafeDeleteList.size()<<std::endl;
        Require(Read(app,saveName)==invalid[which],"Failure erased or rewrote the user's interruption file");
        stage=3;deadline=app.mUpdateCount+50;return;
    }
    if(stage==3){
        Require(!app.mBoard&&app.mSafeDeleteList.empty(),"Rejected board did not finish deferred destruction");
        auto& e=*app.mEffectSystem;
        Require(e.mParticleHolder->mParticleSystems.mSize==0&&e.mParticleHolder->mEmitters.mSize==0&&
            e.mParticleHolder->mParticles.mSize==0&&e.mReanimationHolder->mReanimations.mSize==0&&
            e.mAttachmentHolder->mAttachments.mSize==0,
            "Rejected board retained live effect objects");
        log<<"case="<<which<<" deferred-destroyed=1 effect-pools-empty=1"<<std::endl;
        if(++which<invalid.size()){stage=2;return;}
        app.KillGameSelector();app.MakeNewBoard();
        Require(app.mBoard->LoadGame(ProbePath("save-reject-valid.dat64")),"Valid save could not load after rejected boards");
        Bindings(*app.mBoard);
        PortablePoolReadSmoke(app);
        app.mBoard->Pause(false);resumeCounter=app.mBoard->mMainCounter;
        Report("portable-save-six-rejections-real-tryload-deferred-cleanup",app);
        stage=4;deadline=app.mUpdateCount+100;return;
    }
    if(stage==4){
        Require(app.mBoard->mMainCounter>resumeCounter,"Valid restored board did not resume after rejections");
        Bindings(*app.mBoard);ProbeScreenshot(app);
        log<<"valid-reload-resumed=1 owner-pointers=1"<<std::endl;
        app.DoBackToMain();stage=5;deadline=app.mUpdateCount+50;return;
    }
    Require(!app.mBoard&&app.mSafeDeleteList.empty(),"Final control board still queued for deletion");
    Report("PASS save-reject; six late/definition failures, real deferred destruction and valid resumed control",app);
    app.CloseRequestAsync();stage=6;
}
