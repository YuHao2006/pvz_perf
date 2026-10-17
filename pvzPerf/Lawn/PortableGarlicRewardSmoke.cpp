#include "PortableFixesSmoke.h"
#include "ModernVulkanSmoke.h"
#include "LawnApp.h"
#include "Board.h"
#include "Challenge.h"
#include "ZenGarden.h"
#include "CursorObject.h"
#include "Plant.h"
#include "Zombie.h"
#include "Coin.h"
#include "Projectile.h"
#include "System/PlayerInfo.h"
#include "Sexy.TodLib/EffectSystem.h"
#include "Sexy.TodLib/Reanimator.h"
#include <algorithm>
#include <array>
#include <fstream>
#include <set>
#include <stdexcept>

namespace {
void Require(bool ok,const char* message){if(!ok)throw std::runtime_error(message);}
void DeleteQueue(LawnApp& app){app.mBoard->ProcessDeleteQueue();app.mEffectSystem->ProcessDeleteQueue();}

bool GarlicCases(LawnApp& app,std::ostream& log) {
    auto& board=*app.mBoard;DeleteQueue(app);
    const auto baseline=board.mZombies.mSize;
    struct Restore { Board& board;std::array<PlantRowType,6> rows;
        ~Restore(){std::copy(rows.begin(),rows.end(),board.mPlantRow);}
    } restore{board,{}};
    std::copy(std::begin(board.mPlantRow),std::end(board.mPlantRow),restore.rows.begin());
    constexpr std::array<PlantRowType,6> pool{PLANTROW_NORMAL,PLANTROW_NORMAL,PLANTROW_POOL,PLANTROW_POOL,PLANTROW_NORMAL,PLANTROW_NORMAL};
    constexpr std::array<PlantRowType,6> day{PLANTROW_NORMAL,PLANTROW_NORMAL,PLANTROW_NORMAL,PLANTROW_NORMAL,PLANTROW_NORMAL,PLANTROW_DIRT};
    unsigned cases=0,wrong=0;
    auto check=[&](int row) {
        auto* zombie=board.AddZombieInRow(ZOMBIE_NORMAL,row,0);
        zombie->mYuckyFace=true;zombie->mYuckyFaceCounter=169;
        const auto allowed=[&](int target) {
            return target>=0 && target<6 && board.mPlantRow[target]!=PLANTROW_DIRT &&
                (board.mPlantRow[target]==PLANTROW_POOL)==(board.mPlantRow[row]==PLANTROW_POOL);
        };
        // The oracle does not call RowCanHaveZombies or the production selector.
        zombie->UpdateYuckyFace();
        const bool good=std::abs(zombie->mRow-row)==1 && allowed(zombie->mRow) &&
            zombie->mRenderOrder==0x49f9c+10000*zombie->mRow && zombie->mYuckyFaceCounter==170;
        ++cases;wrong+=!good;
        log<<"garlic row="<<row<<" up="<<allowed(row-1)<<" down="<<allowed(row+1)
            <<" selected="<<zombie->mRow<<" pass="<<good<<std::endl;
        zombie->SetRow(row);zombie->DieNoLoot();DeleteQueue(app);
    };
    std::copy(pool.begin(),pool.end(),board.mPlantRow);
    // On a bad build these interior rows expose all reversed choices without
    // intentionally invoking SetRow(-1)'s assertion at the top edge.
    for(int row:{1,2,3,4})check(row);
    Require(board.mZombies.mSize==baseline,"Garlic direction fixture leaked a zombie");
    if(wrong){log<<"garlic-direction-cases="<<cases<<" wrong="<<wrong<<std::endl;return false;}
    for(const auto& rows:{day,pool}) {
        std::copy(rows.begin(),rows.end(),board.mPlantRow);
        for(int repeat=0;repeat<8;++repeat)for(int row=0;row<6;++row)
            if(rows[row]!=PLANTROW_DIRT)check(row);
    }

    // Exercise the actual garlic target/chew -> face -> row switch -> clear,
    // not just the counter=169 boundary above. Pool row1 must move to row0.
    std::copy(pool.begin(),pool.end(),board.mPlantRow);
    const auto plants=board.mPlants.mSize;
    auto* garlic=board.NewPlant(5,1,SEED_GARLIC);
    auto* zombie=board.AddZombieInRow(ZOMBIE_NORMAL,1,0);
    for(int x=garlic->mX-100;x<=garlic->mX+100;++x) {
        zombie->mPosX=float(x);zombie->mX=x;
        if(zombie->FindPlantTarget(ATTACKTYPE_CHEW)==garlic)break;
    }
    Require(zombie->FindPlantTarget(ATTACKTYPE_CHEW)==garlic,"Garlic chew fixture does not hit garlic");
    zombie->AnimateChewSound();Require(zombie->mYuckyFace && zombie->mYuckyFaceCounter==0,"Actual chew did not start garlic reaction");
    for(int tick=1;tick<=271;++tick) {
        zombie->UpdateYuckyFace();
        Require(zombie->mRow==(tick<170?1:0),"Garlic changed row at the wrong time or direction");
    }
    Require(!zombie->mYuckyFace && zombie->mYuckyFaceCounter==0,"Garlic face did not clear at 271");
    zombie->DieNoLoot();garlic->Die();DeleteQueue(app);
    Require(board.mPlants.mSize==plants && board.mZombies.mSize==baseline,"Garlic chew fixture retained objects");
    log<<"garlic-direction-cases="<<cases<<" wrong="<<wrong<<" chew-ticks=271 pass=1"<<std::endl;
    return true;
}

void DancerFacingCases(LawnApp& app,std::ostream& log) {
    auto& board=*app.mBoard;DeleteQueue(app);const auto baseline=board.mZombies.mSize;
    unsigned cases=0,wrong=0;
    for(auto type:{ZOMBIE_DANCER,ZOMBIE_BACKUP_DANCER}) {
        auto* zombie=board.AddZombieInRow(type,0,0);
        auto* body=app.ReanimationGet(zombie->mBodyReanimID);
        Require(body!=nullptr,"Dancer probe has no real body animation");
        for(int phase:{0x28,0x2c,0x2d,0x2e,0x2f,0x30,0x31})for(bool eating:{false,true})
            for(bool mind:{false,true})for(float scale:{0.5f,1.0f}) {
                zombie->mZombiePhase=static_cast<ZombiePhase>(phase);zombie->mIsEating=eating;
                zombie->mMindControlled=mind;zombie->mScaleZombie=scale;
                zombie->mZombieHeight=HEIGHT_ZOMBIE_NORMAL;zombie->mAltitude=0;
                ZombieDrawPosition draw;zombie->GetDrawPos(draw);
                // 1073 0053CC00: only entering phase28, then mind inversion.
                const bool mirrored=((phase==0x28)&&!eating)!=mind;
                const float x=draw.mImageOffsetX+45.0f+(mirrored?90.0f*scale:0.0f)-30.0f*scale;
                zombie->UpdateReanim();
                const bool good=body->mOverlayMatrix.m00==(mirrored?-scale:scale)&&body->mOverlayMatrix.m02==x;
                ++cases;wrong+=!good;
                log<<"dancer type="<<int(type)<<" phase="<<phase<<" eating="<<eating<<" mind="<<mind
                    <<" scale="<<scale<<" m00="<<body->mOverlayMatrix.m00<<" m02="<<body->mOverlayMatrix.m02<<" pass="<<good<<'\n';
            }
        zombie->mMindControlled=false;zombie->mIsEating=false;zombie->mScaleZombie=1;
        zombie->mZombiePhase=PHASE_DANCER_DANCING_LEFT;zombie->DieNoLoot();DeleteQueue(app);
    }
    log<<"dancer-facing-real-cases="<<cases<<" wrong="<<wrong<<std::endl;
    Require(board.mZombies.mSize==baseline,"Dancer probe retained a zombie");
    Require(wrong==0,"Dancer facing differs from original 1073; see garlic-split-cases.txt");
}

void SplitPeaOriginalCases(LawnApp& app,std::ostream& log) {
    auto& board=*app.mBoard;DeleteQueue(app);
    auto* split=board.NewPlant(6,0,SEED_SPLITPEA);
    auto* front=app.ReanimationGet(split->mHeadReanimID);
    auto* back=app.ReanimationGet(split->mHeadReanimID2);
    unsigned cases=0,wrong=0;
    for(int launch:{0,24,25,26,100})for(int heads=0;heads<4;++heads) {
        front->mLoopType=heads&1?REANIM_PLAY_ONCE_AND_HOLD:REANIM_LOOP;
        back->mLoopType=heads&2?REANIM_PLAY_ONCE_AND_HOLD:REANIM_LOOP;
        split->mShootingCounter=2;split->mLaunchCounter=launch;
        std::set<Projectile*> old;Projectile* projectile=nullptr;
        while(board.IterateProjectiles(projectile))old.insert(projectile);
        split->UpdateShooting();
        unsigned forwards=0,backwards=0;projectile=nullptr;
        while(board.IterateProjectiles(projectile))if(!old.contains(projectile)) {
            if(projectile->mMotionType==MOTION_STRAIGHT)++forwards;
            else if(projectile->mMotionType==MOTION_BACKWARDS)++backwards;
            else ++wrong;
            projectile->Die();
        }
        const bool good=forwards==unsigned(bool(heads&1)) && backwards==unsigned(bool(heads&2));
        ++cases;wrong+=!good;
        log<<"split-original launch="<<launch<<" heads="<<heads<<" forwards="<<forwards
            <<" backwards="<<backwards<<" pass="<<good<<'\n';
        DeleteQueue(app);
    }
    split->Die();DeleteQueue(app);
    log<<"split-original-cases="<<cases<<" wrong="<<wrong<<std::endl;
    Require(wrong==0,"1073 Split Pea firing semantics changed");
}

void SplitPeaTwoShotCases(LawnApp& app,std::ostream& log) {
    auto& board=*app.mBoard;DeleteQueue(app);
    unsigned cases=0,wrong=0;
    // Exercise the missing transition between two real target selections,
    // not just UpdateShooting with manually chosen head loop flags.
    for(bool frontTarget:{false,true})for(float bodyRate:{0.0f,12.0f,23.0f}) {
        auto* split=board.NewPlant(4,0,SEED_SPLITPEA);
        auto* front=app.ReanimationGet(split->mHeadReanimID);
        auto* back=app.ReanimationGet(split->mHeadReanimID2);
        auto* body=app.ReanimationGet(split->mBodyReanimID);
        auto* behind=board.AddZombieInRow(ZOMBIE_NORMAL,0,0);
        behind->mPosX=100;behind->mX=100;
        Zombie* ahead=nullptr;
        if(frontTarget){ahead=board.AddZombieInRow(ZOMBIE_NORMAL,0,0);ahead->mPosX=720;ahead->mX=720;}
        Require(split->FindTargetZombie(0,WEAPON_SECONDARY)==behind,"Split fixture missed back target");
        Require(split->FindTargetZombie(0,WEAPON_PRIMARY)==ahead,"Split fixture front target mismatch");
        front->mLoopType=back->mLoopType=REANIM_LOOP;
        front->mLoopCount=back->mLoopCount=0;
        front->SetFramesForLayer(ReanimTrackId::anim_head_idle);
        back->SetFramesForLayer(ReanimTrackId::anim_splitpea_idle);
        body->mAnimRate=bodyRate;body->mAnimTime=.375f;
        split->mShootingCounter=0;split->mLaunchRate=150;split->mLaunchCounter=26;
        auto fireShot=[&](int stage) {
            std::set<Projectile*> old;Projectile* p=nullptr;
            while(board.IterateProjectiles(p))old.insert(p);
            // Real animations/targets are retained; advancing the firing
            // countdown alone exposes a still-playing front head at rollover.
            for(int tick=0;tick<25;++tick)split->UpdateShooting();
            unsigned forwards=0,backwards=0;p=nullptr;
            while(board.IterateProjectiles(p))if(!old.contains(p)){
                if(p->mMotionType==MOTION_STRAIGHT)++forwards;
                else if(p->mMotionType==MOTION_BACKWARDS)++backwards;
                else ++wrong;
                p->Die();
            }
            const bool good=forwards==unsigned(stage==1&&frontTarget)&&backwards==1;
            ++cases;wrong+=!good;
            log<<"split-two-shot stage="<<stage<<" frontTarget="<<frontTarget<<" rate="<<bodyRate
                <<" forwards="<<forwards<<" backwards="<<backwards<<" pass="<<good<<std::endl;
            DeleteQueue(app);
        };
        split->UpdateShooter();fireShot(1);
        split->mLaunchCounter=1;split->UpdateShooter();
        int idleStart=0,idleCount=0;front->GetFramesForLayer(ReanimTrackId::anim_head_idle,idleStart,idleCount);
        const bool reset=front->mLoopType==REANIM_LOOP&&front->mFrameStart==idleStart&&front->mFrameCount==idleCount&&
            front->mAnimRate==body->mAnimRate&&front->mAnimTime==body->mAnimTime&&back->mLoopType==REANIM_PLAY_ONCE_AND_HOLD;
        ++cases;wrong+=!reset;log<<"split-front-reset rate="<<bodyRate<<" pass="<<reset<<std::endl;
        fireShot(2);
        split->Die();behind->DieNoLoot();if(ahead)ahead->DieNoLoot();DeleteQueue(app);
    }
    log<<"split-two-shot-cases="<<cases<<" wrong="<<wrong<<std::endl;
    Require(wrong==0,"Split Pea did not restore its front idle head at the 1073 rollover");

    unsigned tickCases=0,tickWrong=0;
    for(bool frontTarget:{false,true}) {
        auto* split=board.NewPlant(4,0,SEED_SPLITPEA);
        auto* body=app.ReanimationGet(split->mBodyReanimID);
        auto* behind=board.AddZombieInRow(ZOMBIE_NORMAL,0,0);behind->mPosX=100;behind->mX=100;
        Zombie* ahead=nullptr;
        if(frontTarget){ahead=board.AddZombieInRow(ZOMBIE_NORMAL,0,0);ahead->mPosX=720;ahead->mX=720;}
        split->mShootingCounter=0;split->mLaunchCounter=26;split->mLaunchRate=150;
        // Full Plant::Update performs UpdateShooting before UpdateShooter.
        // Update only its root reanim: it advances attached heads recursively.
        for(int tick=0;tick<101;++tick) {
            std::set<Projectile*> old;Projectile* p=nullptr;
            while(board.IterateProjectiles(p))old.insert(p);
            split->Update();body->Update();
            unsigned forwards=0,backwards=0;p=nullptr;
            while(board.IterateProjectiles(p))if(!old.contains(p)) {
                if(p->mMotionType==MOTION_STRAIGHT)++forwards;
                else if(p->mMotionType==MOTION_BACKWARDS)++backwards;
                else ++tickWrong;
                p->Die();
            }
            const bool good=forwards==unsigned(frontTarget&&tick==25)&&backwards==unsigned(tick==25||tick==50);
            ++tickCases;tickWrong+=!good;
            if(forwards||backwards||!good)log<<"split-full-tick="<<tick<<" frontTarget="<<frontTarget
                <<" forwards="<<forwards<<" backwards="<<backwards<<" pass="<<good<<std::endl;
            DeleteQueue(app);
        }
        split->Die();behind->DieNoLoot();if(ahead)ahead->DieNoLoot();DeleteQueue(app);
    }
    log<<"split-full-update-ticks="<<tickCases<<" wrong="<<tickWrong<<std::endl;
    Require(tickWrong==0,"Split Pea full update/reanim two-shot timeline differs from 1073");
}
}

void PortableGarlicSmoke(LawnApp& app) {
    Require(getenv("PVZ_MODERN_HIDDEN") && getenv("PVZ_APPDATA_DIR") && app.mGameScene==SCENE_PLAYING,
        "Garlic probe is not isolated gameplay");
    std::ofstream log(ModernSmoke::ProbePath("garlic-split-cases.txt"));Require(bool(log),"Cannot write garlic evidence");
    const bool garlic=GarlicCases(app,log);SplitPeaOriginalCases(app,log);
    SplitPeaTwoShotCases(app,log);
    DancerFacingCases(app,log);
    Require(garlic,"Garlic selected the wrong row; see garlic-split-cases.txt");
    ModernSmoke::Report("portable-garlic-92-directions-real-chew-and-original-split20",app);
}

void PortableVaseRewardSmoke(LawnApp& app) {
    Require(getenv("PVZ_MODERN_HIDDEN") && getenv("PVZ_APPDATA_DIR") && app.mNoSoundNeeded &&
        app.mGameMode==GAMEMODE_SCARY_POTTER_ENDLESS,"Reward probe is not isolated end-of-vase fixture");
    auto& board=*app.mBoard;
    PlayerInfo player=*app.mPlayerInfo;player.mCoins=1000;
    struct Restore { LawnApp& app;PlayerInfo* player;GameMode mode;
        ~Restore(){app.mPlayerInfo=player;app.mGameMode=mode;}
    } restore{app,app.mPlayerInfo,app.mGameMode};
    app.mPlayerInfo=&player;
    std::ofstream log(ModernSmoke::ProbePath("vase-reward-cases.txt"));Require(bool(log),"Cannot write reward evidence");
    struct Case {GameMode mode;CoinType award,drop;unsigned count;};
    constexpr Case cases[]{
        {GAMEMODE_SCARY_POTTER_1,COIN_AWARD_MONEY_BAG,COIN_GOLD,2},
        {GAMEMODE_SCARY_POTTER_9,COIN_AWARD_MONEY_BAG,COIN_GOLD,2},
        {GAMEMODE_SCARY_POTTER_1,COIN_TROPHY,COIN_GOLD,5},
        {GAMEMODE_SCARY_POTTER_ENDLESS,COIN_AWARD_MONEY_BAG,COIN_GOLD,5},
        {GAMEMODE_SCARY_POTTER_ENDLESS,COIN_AWARD_BAG_DIAMOND,COIN_DIAMOND,1}};
    unsigned wrong=0;
    for(const auto& item:cases) {
        app.mGameMode=item.mode;board.mBoardFadeOutCounter=-1;board.mNextSurvivalStageCounter=0;
        board.mLevelComplete=false;
        DeleteQueue(app);std::set<Coin*> old;Coin* coin=nullptr;
        while(board.IterateCoins(coin))old.insert(coin);
        const int before=player.mCoins;
        auto* award=board.AddCoin(400,300,item.award,COIN_MOTION_COIN);
        award->Collect();
        unsigned count=0;coin=nullptr;
        while(board.IterateCoins(coin))if(coin!=award && !old.contains(coin)) {
            ++count;
            wrong+=coin->mType!=item.drop || coin->mCoinMotion!=COIN_MOTION_FROM_PRESENT;
            coin->ScoreCoin();coin->Die();
        }
        const int expectedValue=int(item.count)*(item.drop==COIN_GOLD?5:100);
        const bool good=count==item.count && player.mCoins-before==expectedValue;
        wrong+=!good;
        log<<"vase-reward mode="<<int(item.mode)<<" award="<<int(item.award)<<" drop="<<int(item.drop)
            <<" count="<<count<<" expected="<<item.count<<" coins-delta="<<player.mCoins-before
            <<" expected-value="<<expectedValue<<" pass="<<good<<std::endl;
        award->Die();DeleteQueue(app);
    }
    log<<"vase-reward-cases=5 wrong="<<wrong<<std::endl;
    Require(wrong==0,"Vase reward differs from 1073; see vase-reward-cases.txt");

    unsigned stageCases=0,stageWrong=0;
    unsigned chocolateSeed=0;
    for(unsigned seed=1;seed<10000;++seed){Sexy::SRand(seed);const int hit=Sexy::Rand(100);if(hit>=15&&hit<30){chocolateSeed=seed;break;}}
    Require(chocolateSeed!=0,"Cannot construct deterministic chocolate roll");
    player.mPurchases[STORE_ITEM_STINKY_THE_SNAIL]=1;
    for(auto mode:{GAMEMODE_SCARY_POTTER_ENDLESS,GAMEMODE_PUZZLE_I_ZOMBIE_ENDLESS})
    for(int stage:{0,1,2,3,8,9,10,19}) {
        app.mGameMode=mode;board.mChallenge->mSurvivalStage=stage;
        board.mBoardFadeOutCounter=-1;board.mNextSurvivalStageCounter=0;board.mLevelComplete=false;board.mLevelAwardSpawned=false;
        player.mPurchases[STORE_ITEM_CHOCOLATE]=PURCHASE_COUNT_OFFSET;
        std::set<Coin*> old;Coin* coin=nullptr;while(board.IterateCoins(coin))old.insert(coin);
        Sexy::SRand(chocolateSeed);board.mChallenge->PuzzlePhaseComplete(4,1);
        Coin* reward=nullptr;unsigned created=0;coin=nullptr;
        while(board.IterateCoins(coin))if(!old.contains(coin)){++created;reward=coin;}
        const bool expected=mode==GAMEMODE_SCARY_POTTER_ENDLESS?(stage+1)%10==0:(stage+1)%3==0;
        bool good=created==unsigned(expected)&&board.mNextSurvivalStageCounter==(expected?0:500)&&!board.mLevelComplete;
        if(reward){good &= reward->mType==COIN_AWARD_CHOCOLATE&&reward->IsLevelAward();reward->Die();}
        ++stageCases;stageWrong+=!good;
        log<<"puzzle-award-stage mode="<<int(mode)<<" stage="<<stage<<" completed="<<stage+1
            <<" expected="<<expected<<" created="<<created<<" pass="<<good<<std::endl;
        DeleteQueue(app);
    }
    log<<"puzzle-award-stage-cases="<<stageCases<<" wrong="<<stageWrong<<std::endl;
    Require(stageWrong==0,"Endless puzzle rewards use the wrong zero-based stage");

    // Award chocolate must both enter inventory and schedule the next board.
    app.mGameMode=GAMEMODE_SCARY_POTTER_ENDLESS;board.mChallenge->mSurvivalStage=9;
    board.mPaused=false;board.mBoardFadeOutCounter=-1;board.mNextSurvivalStageCounter=0;
    board.mLevelComplete=false;board.mLevelAwardSpawned=false;board.mChallenge->mChallengeState=STATECHALLENGE_NORMAL;
    board.mCursorObject->mCursorType=CURSOR_TYPE_NORMAL;app.mCrazyDaveState=CRAZY_DAVE_OFF;
    player.mPurchases[STORE_ITEM_CHOCOLATE]=PURCHASE_COUNT_OFFSET;
    Require(app.mZenGarden->CanDropChocolate()&&board.CanInteractWithBoardButtons(),"Reward fixture cannot start");
    std::set<Coin*> old;Coin* coin=nullptr;while(board.IterateCoins(coin))old.insert(coin);
    Sexy::SRand(chocolateSeed);board.mChallenge->PuzzlePhaseComplete(4,1);
    Coin* chocolate=nullptr;coin=nullptr;
    while(board.IterateCoins(coin))if(!old.contains(coin)){Require(!chocolate,"Multiple phase awards");chocolate=coin;}
    Require(chocolate&&chocolate->mType==COIN_AWARD_CHOCOLATE,"Tenth vase board did not drop award chocolate");
    Require(board.CanInteractWithBoardButtons(),"Uncollected ground award blocked menu");
    const int beforeChocolate=board.mChocolateCollected;chocolate->Collect();
    Require(player.mPurchases[STORE_ITEM_CHOCOLATE]==PURCHASE_COUNT_OFFSET+1&&board.mChocolateCollected==beforeChocolate+1&&
        board.mNextSurvivalStageCounter==500&&!board.mLevelComplete,"Award chocolate did not collect/advance");
    for(int tick=0;tick<500;++tick)board.UpdateLevelEndSequence();
    Require(board.mChallenge->mSurvivalStage==10&&board.mNextSurvivalStageCounter==0&&!board.mLevelComplete,
        "Award chocolate did not reach the next vase board");
    unsigned pots=0;GridItem* grid=nullptr;while(board.IterateGridItems(grid))pots+=grid->mGridItemType==GRIDITEM_SCARY_POT;
    Require(pots==35,"Post-chocolate next board has wrong vase count");
    for(int fade:{-1,0,1,600}){
        board.mBoardFadeOutCounter=fade;
        Require(board.CanInteractWithBoardButtons()==(fade<0),"Reward fade/menu boundary differs from 1073");
    }
    board.mBoardFadeOutCounter=-1;
    log<<"puzzle-award-chocolate-collect-next-stage=10 pots="<<pots<<" fade-menu-boundaries=4 pass=1"<<std::endl;
    ModernSmoke::Report("portable-vase-reward-five-real-collect-and-score-cases",app);
}
