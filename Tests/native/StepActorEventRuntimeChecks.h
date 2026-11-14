#pragma once

// Include after the normal ImageRuntimeTests game headers. Resources, compiled
// definitions, portrait cache and dummy audio must already be initialized.
// Invoke CheckStepActorEvents(app); no player files are read or written.
inline void CheckStepActorEvents(LawnApp& app)
{
    using namespace Sexy;
    const auto require=[](bool value,const char* message) {
        if(!value)throw std::runtime_error(message);
    };
    auto& clocks=*app.mEffectSystem->mReanimationHolder;
    struct Restore {
        LawnApp& app;Board* board=app.mBoard;PlayerInfo* player=app.mPlayerInfo;
        ZenGarden* garden=app.mZenGarden;GameMode mode=app.mGameMode;GameScenes scene=app.mGameScene;
        unsigned long long interval=Sexy::gUpdateIntervalNs,phase=Sexy::gLegacyTickPhaseNs;
        int whole=Sexy::gWholeLegacyTicks;
        double ticks=Sexy::gUpdateTicks,steps=Sexy::gStepsPerLegacyTick;
        std::int64_t visual=app.mEffectSystem->mReanimationHolder->mVisualTimeNs;
        std::int64_t battle=app.mEffectSystem->mReanimationHolder->mBattleTimeNs;
        ~Restore() {
            app.mBoard=board;app.mPlayerInfo=player;app.mZenGarden=garden;
            app.mGameMode=mode;app.mGameScene=scene;
            Sexy::gUpdateIntervalNs=interval;Sexy::gLegacyTickPhaseNs=phase;
            Sexy::gWholeLegacyTicks=whole;Sexy::gUpdateTicks=ticks;Sexy::gStepsPerLegacyTick=steps;
            app.mEffectSystem->mReanimationHolder->mVisualTimeNs=visual;
            app.mEffectSystem->mReanimationHolder->mBattleTimeNs=battle;
        }
    } restore{app};
    PlayerInfo profile;ZenGarden garden;
    profile.mLevel=31;profile.mFinishedAdventure=1;
    app.mPlayerInfo=&profile;app.mZenGarden=&garden;
    app.mGameMode=GAMEMODE_ADVENTURE;app.mGameScene=SCENE_PLAYING;
    const auto initialize=[&](Board& board) {
        board.mLevel=31;board.mCurrentWave=6;board.mNumWaves=20;
        board.mSeedBank->mNumPackets=0;board.mBackground=BACKGROUND_1_DAY;
        for(int row=0;row<MAX_GRID_SIZE_Y;++row)
            board.mPlantRow[row]=row==5?PLANTROW_DIRT:PLANTROW_NORMAL;
    };
    const auto resetClocks=[&] {
        clocks.mVisualTimeNs=clocks.mBattleTimeNs=0;Sexy::gLegacyTickPhaseNs=0;
    };
    const auto interval=[&](Board& board,Reanimation& animation,float before,float after) {
        animation.SeekRatio(before);
        const auto step=static_cast<std::uint64_t>(std::ceil(double(after-before)*animation.mPeriodNs));
        Sexy::ApplySimulationStep(step);board.mLevelTimeNs=step;
        clocks.mVisualTimeNs=clocks.mBattleTimeNs=step;
        animation.PrepareTimeAt(static_cast<std::int64_t>(step));
        return static_cast<std::int64_t>(step);
    };
    for(const auto seed:{SEED_SPIKEWEED,SEED_SPIKEROCK}) {
        resetClocks();
        {
            Board board(&app);initialize(board);
            auto* plant=board.NewPlant(3,2,seed,SEED_NONE);
            auto* zombie=board.AddZombieInRow(ZOMBIE_NORMAL,2,0);
            zombie->mX=static_cast<float>(plant->mX);zombie->mRootBindingGeneration=0;
            zombie->mBodyHealth=zombie->mBodyMaxHealth=10000;
            plant->mState=STATE_SPIKEWEED_ATTACKING;plant->mStateCountdown=80;
            Sexy::ApplySimulationStep(800'000'000);--plant->mStateCountdown;
            board.mLevelTimeNs=800'000'000;
            plant->UpdateSpikeweed(800'000'000,800'000'000,800'000'000);
            require(zombie->mBodyHealth==10000-(seed==SEED_SPIKEROCK?40:20),
                "Spike damage was discarded or merged when its interval also expired");
            require(plant->mState==STATE_NOTREADY,"Spike attack did not finish in the same interval");
        }
        app.mEffectSystem->ProcessDeleteQueue();
    }
    for(const auto type:{ZOMBIE_PEA_HEAD,ZOMBIE_GATLING_HEAD}) {
        resetClocks();
        {
            Board board(&app);initialize(board);
            auto* zombie=board.AddZombieInRow(type,2,0);
            zombie->mPhaseCounter=110;
            Sexy::ApplySimulationStep(1'100'000'000);--zombie->mPhaseCounter;
            if(type==ZOMBIE_PEA_HEAD)zombie->UpdateZombiePeaHead();
            else zombie->UpdateZombieGatlingHead();
            int shots=0;Projectile* projectile=nullptr;
            while(board.IterateProjectiles(projectile))++shots;
            require(shots==(type==ZOMBIE_PEA_HEAD?1:4),
                "Zombie head lost shots when preparation, firing and expiry crossed together");
            require(zombie->mPhaseCounter.mNanoseconds==TimeCounter::Encode(150),
                "Zombie head failed to reset its next cycle after firing");
        }
        app.mEffectSystem->ProcessDeleteQueue();
    }
    for(const auto type:{ZOMBIE_POLEVAULTER,ZOMBIE_DOLPHIN_RIDER})
    for(const bool complete:{false,true})
    for(const bool blocked:{false,true}) {
        resetClocks();
        {
            Board board(&app);initialize(board);
            Plant* target=blocked?board.NewPlant(5,2,SEED_TALLNUT,SEED_NONE):nullptr;
            auto* zombie=board.AddZombieInRow(type,2,0);
            zombie->mX=target?static_cast<float>(target->mX):500.0f;
            zombie->mY=zombie->GetPosYBasedOnRow(zombie->mRow);
            zombie->mRootBindingGeneration=0;
            zombie->mZombieAttackRect=Rect(0,0,80,120);
            zombie->mZombiePhase=type==ZOMBIE_POLEVAULTER?PHASE_POLEVAULTER_IN_VAULT:PHASE_DOLPHIN_IN_JUMP;
            zombie->PlayZombieReanim(0,type==ZOMBIE_POLEVAULTER?ReanimTrackId::anim_jump:ReanimTrackId::anim_dolphinjump,
                REANIM_PLAY_ONCE_AND_HOLD,0,24.0f);
            if(blocked)require(zombie->FindPlantTarget(ATTACKTYPE_VAULT)==target,
                "Large-step jump fixture failed to align its Tall-nut target");
            auto* animation=app.ReanimationGet(zombie->mBodyReanimID);
            const auto now=interval(board,*animation,type==ZOMBIE_POLEVAULTER?.59f:.2f,
                complete?1.01f:(type==ZOMBIE_POLEVAULTER?.72f:.6f));
            const auto oldX=zombie->mX;
            if(type==ZOMBIE_POLEVAULTER)zombie->UpdateZombiePolevaulter(now);
            else zombie->UpdateZombieDolphinRider(now,now,now);
            const auto expectedPhase=blocked||complete
                ?(type==ZOMBIE_POLEVAULTER?PHASE_POLEVAULTER_POST_VAULT:PHASE_DOLPHIN_WALKING_IN_POOL)
                :(type==ZOMBIE_POLEVAULTER?PHASE_POLEVAULTER_IN_VAULT:PHASE_DOLPHIN_IN_JUMP);
            require(zombie->mZombiePhase==expectedPhase,
                "Jump did not process completion after crossing intermediate events");
            const float expected=blocked?static_cast<float>(target->mX)+(type==ZOMBIE_POLEVAULTER?0.0f:25.0f)
                :oldX-(complete?(type==ZOMBIE_POLEVAULTER?150.0f:94.0f):0.0f);
            require(std::abs(zombie->mX-expected)<.001f,
                "Normal jump completion overwrote a Tall-nut block, or a block was skipped");
            if(type==ZOMBIE_DOLPHIN_RIDER) {
                if(blocked||complete)require(zombie->mAltitude==(blocked?30.0f:0.0f),
                    "Dolphin completion lost the block altitude");
                // StartWalkAnim legitimately randomizes walking speed at
                // completion. The water-entry stop applies only mid-jump.
                if(!blocked&&!complete)require(zombie->mVelX==0.0f,
                    "Dolphin lost its crossed water-entry stop event");
            }
        }
        app.mEffectSystem->ProcessDeleteQueue();
    }
    resetClocks();
    {
        Board board(&app);initialize(board);
        auto* giant=board.AddZombieInRow(ZOMBIE_GARGANTUAR,2,0);
        giant->mZombiePhase=PHASE_ZOMBIE_DYING;
        giant->PlayZombieReanim(0,ReanimTrackId::anim_death,REANIM_PLAY_ONCE_AND_HOLD,0,14.0f);
        auto* animation=app.ReanimationGet(giant->mBodyReanimID);
        const auto now=interval(board,*animation,.88f,.995f);
        giant->UpdateDeath(now,now,now);
        require(board.mShakeAmountY==1,"Gargantuar death discarded its later, smaller shake event");
    }
    app.mEffectSystem->ProcessDeleteQueue();
    std::cout<<"PASS actor event intervals: spikes, head volleys, jump blocks/completion and Gargantuar death\n";
}
