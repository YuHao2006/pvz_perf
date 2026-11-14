#pragma once
#include "Lawn/System/Music.h"
#include "Lawn/Widget/CreditScreen.h"
#include "SexyAppFramework/sound/SoundInstance.h"

// Include after the ImageRuntimeTests game headers. Actual resource groups,
// animation definitions and silent sound playback must already be available.
inline void CheckStepCueEvents(LawnApp& app)
{
    using namespace Sexy;
    const auto require=[](bool value,const char* message) {
        if(!value)throw std::runtime_error(message);
    };
    require(!app.mBoard&&!app.mSeedChooserScreen&&!app.mCreditScreen,
        "Cue interval fixture requires no existing Board, chooser or Credits");
    DummyMusicInterface backend;
    Music music;music.mMusicInterface=&backend;music.SetMusicDisabled(true);
    TodFoley foley;
    PoolEffect pool;pool.PoolEffectInitialize();
    PlayerInfo profile;ZenGarden garden;
    struct Restore {
        LawnApp& app;PlayerInfo* player=app.mPlayerInfo;ZenGarden* garden=app.mZenGarden;
        Music* music=app.mMusic;TodFoley* foley=app.mSoundSystem;PoolEffect* pool=app.mPoolEffect;
        GameMode mode=app.mGameMode;GameScenes scene=app.mGameScene;
        std::int64_t application=app.mApplicationTimeNs;
        std::uint64_t targetInterval=app.mFrameTiming.mIntervalNs;
        bool mute=app.mMuteSoundsForCutscene;
        unsigned long long interval=Sexy::gUpdateIntervalNs,phase=Sexy::gLegacyTickPhaseNs;
        int whole=Sexy::gWholeLegacyTicks;
        double ticks=Sexy::gUpdateTicks,steps=Sexy::gStepsPerLegacyTick;
        std::int64_t visual=app.mEffectSystem->mReanimationHolder->mVisualTimeNs;
        std::int64_t battle=app.mEffectSystem->mReanimationHolder->mBattleTimeNs;
        ~Restore() {
            app.mEffectSystem->EffectSystemFreeAll();
            app.mBoard=nullptr;app.mCreditScreen=nullptr;
            app.mPlayerInfo=player;app.mZenGarden=garden;app.mMusic=music;
            app.mSoundSystem=foley;app.mPoolEffect=pool;app.mGameMode=mode;app.mGameScene=scene;
            app.mApplicationTimeNs=application;app.mMuteSoundsForCutscene=mute;
            app.mFrameTiming.mIntervalNs=targetInterval;
            Sexy::gUpdateIntervalNs=interval;Sexy::gLegacyTickPhaseNs=phase;
            Sexy::gWholeLegacyTicks=whole;Sexy::gUpdateTicks=ticks;Sexy::gStepsPerLegacyTick=steps;
            app.mEffectSystem->mReanimationHolder->mVisualTimeNs=visual;
            app.mEffectSystem->mReanimationHolder->mBattleTimeNs=battle;
        }
    } restore{app};
    profile.mId=47;profile.mLevel=8;profile.mFinishedAdventure=0;
    app.mPlayerInfo=&profile;app.mZenGarden=&garden;app.mMusic=&music;
    app.mSoundSystem=&foley;app.mPoolEffect=&pool;app.mMuteSoundsForCutscene=false;
    auto& clocks=*app.mEffectSystem->mReanimationHolder;

    // The first interval crosses both night cues (7.25s and 7s remaining).
    // The second also crosses expiry; both must reach real StartBurst before
    // the warning is consumed. No mocked scheduler or copied cue predicate.
    for(const std::uint64_t step:{600'000'000ULL,7'600'000'000ULL}) {
        app.mGameMode=GAMEMODE_ADVENTURE;app.mGameScene=SCENE_PLAYING;
        clocks.mVisualTimeNs=clocks.mBattleTimeNs=0;
        music.mCurMusicTune=MUSIC_TUNE_NIGHT_MOONGRAINS;
        music.mMusicBurstState=MUSIC_BURST_OFF;music.mBurstEndTimeNs=0;
        app.mApplicationTimeNs=static_cast<std::int64_t>(step);
        {
            Board board(&app);
            board.mLevel=8;board.mBackground=BACKGROUND_2_NIGHT;
            board.mCurrentWave=1;board.mNumWaves=20;
            for(auto& wave:board.mZombiesInWave)
                for(auto& type:wave)type=ZOMBIE_INVALID;
            board.mHugeWaveCountDown=750;
            board.mNextZombieWaveTimeNs=7'500'000'000;
            board.mZombieWaveCountdownDurationNs=7'500'000'000;
            Sexy::ApplySimulationStep(step);
            board.mLevelTimeNs=step;
            board.UpdateZombieSpawning();
            require(music.mMusicBurstState==MUSIC_BURST_STARTING&&
                music.mBurstEndTimeNs==static_cast<std::int64_t>(step)+4'000'000'000,
                "Huge-wave interval discarded the night burst cue when voice or expiry also crossed");
            require(board.mCurrentWave==(step<7'500'000'000ULL?1:2),
                "Huge-wave cue processing changed the authoritative spawn deadline");
            const auto burstEnd=music.mBurstEndTimeNs;
            music.mMusicBurstState=MUSIC_BURST_OFF;
            board.UpdateZombieSpawning();
            require(music.mMusicBurstState==MUSIC_BURST_OFF&&music.mBurstEndTimeNs==burstEnd,
                "Huge-wave cue repeated without an advancing owner interval");
        }
        app.mBoard=nullptr;app.mEffectSystem->ProcessDeleteQueue();
        std::cout<<"PASS real huge-wave night cues intervalNs="<<step<<'\n';
    }

    app.mGameScene=SCENE_CREDIT;
    clocks.mVisualTimeNs=clocks.mBattleTimeNs=0;
    {
        CreditScreen credits(&app);app.mCreditScreen=&credits;
        auto* movie=credits.PlayReanim(1);
        const auto movieId=credits.mCreditsReanimID;
        const auto frameCount=movie->mDefinition->mTracks.tracks[0].mTransforms.count-1;
        require(frameCount>336,"Credits fixture has no terminal scream-stop event");
        movie->Seek(335,frameCount);
        credits.mBlinkCountdown=INT_MAX;

        // A fake playback backend stays live until production StopFoley calls
        // Release. Its callback records which movie still owns that action.
        struct ScreamPlayback final:SoundInstance {
            CreditScreen& credits;Reanimation& movie;ReanimationID id;
            bool released=false,stoppedBeforeTransition=false;
            ScreamPlayback(CreditScreen& c,Reanimation& m,ReanimationID value)
                :credits(c),movie(m),id(value){}
            void Release() override {
                stoppedBeforeTransition=credits.mCreditsPhase==CreditsPhase::CREDITS_MAIN1&&
                    credits.mCreditsReanimID==id&&!movie.mDead;
                released=true;
            }
            void SetBaseVolume(double) override {}
            void SetBasePan(int) override {}
            void AdjustPitch(double) override {}
            void SetVolume(double) override {}
            void SetPan(int) override {}
            bool Play(bool,bool) override {return true;}
            void Stop() override {}
            bool IsPlaying() override {return !released;}
            bool IsReleased() override {return released;}
        } scream(credits,*movie,movieId);
        auto& slot=foley.mFoleyTypeData[FOLEY_SCREAM].mFoleyInstances[0];
        slot.mInstance=&scream;slot.mRefCount=1;slot.mPaused=false;
        struct ClearPlayback {
            FoleyInstance& slot;
            ~ClearPlayback(){slot.mInstance=nullptr;slot.mRefCount=0;slot.mPaused=false;}
        } clear{slot};
        Sexy::ApplySimulationStep(static_cast<std::uint64_t>(movie->mPeriodNs)+1);
        credits.UpdateMovie();
        require(scream.released&&scream.stoppedBeforeTransition&&slot.mInstance==nullptr,
            "Credits replaced its retiring movie before consuming its terminal scream-stop event");
        require(credits.mCreditsPhase==CreditsPhase::CREDITS_MAIN2&&credits.mCreditsReanimID!=movieId,
            "Credits terminal event handling prevented the normal movie transition");

        // Drive the production sync loop with a stopped, deterministic timer:
        // an app step of 100ms and a 4ms rendering target must consume the
        // missing 100ms total, not consume that whole app step 25 times.
        clocks.mVisualTimeNs=0;
        credits.PlayReanim(1);credits.mCreditsPhase=CreditsPhase::CREDITS_MAIN1;
        credits.mDrawCount=1;credits.mUpdateCount=2;credits.mPreloaded=true;credits.mDontSync=false;
        credits.mTimerSinceStart.Start();credits.mTimerSinceStart.SetStartTime(100);credits.mTimerSinceStart.Stop();
        const auto expectedNs=static_cast<std::int64_t>(credits.mTimerSinceStart.GetDuration())*1'000'000;
        app.mFrameTiming.mIntervalNs=4'000'000;
        Sexy::ApplySimulationStep(100'000'000);
        credits.Update();
        require(clocks.mVisualTimeNs==expectedNs&&Sexy::gUpdateIntervalNs==100'000'000,
            "Credits catch-up multiplied elapsed time or changed the shared app step");
        app.mCreditScreen=nullptr;
    }
    app.mEffectSystem->EffectSystemFreeAll();
    std::cout<<"PASS real Credits terminal StopFoley and bounded catch-up time budget\n";
}
