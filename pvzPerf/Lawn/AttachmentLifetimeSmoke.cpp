#include "AttachmentLifetimeSmoke.h"
#include "ModernVulkanSmoke.h"
#include "PortableFixesSmoke.h"
#include "LawnApp.h"
#include "Board.h"
#include "Coin.h"
#include "Projectile.h"
#include "Zombie.h"
#include "Sexy.TodLib/Attachment.h"
#include "Sexy.TodLib/EffectSystem.h"
#include "Sexy.TodLib/Reanimator.h"
#include "Sexy.TodLib/TodParticle.h"
#include "Sexy.TodLib/Definition.h"
#include "graphics/DDInterface.h"
#include "graphics/DDImage.h"
#include "graphics/RenderInterface.h"
#include "Widget/CreditScreen.h"
#include "Widget/GameSelector.h"
#include "Widget/TitleScreen.h"
#include <array>
#include <fstream>
#include <stdexcept>
#include <type_traits>

namespace {
using PoolCounts=std::array<unsigned,5>;  // Trail 池已退役
PoolCounts Count(EffectSystem& effects) {
    auto& particles=*effects.mParticleHolder;
    return {effects.mAttachmentHolder->mAttachments.mSize,
        effects.mReanimationHolder->mReanimations.mSize,particles.mParticleSystems.mSize,
        particles.mEmitters.mSize,particles.mParticles.mSize};
}
void Require(bool ok,const char* message) {if(!ok) throw std::runtime_error(message);}
struct OwnedTestAttachment {
    EffectSystem& effects;
    AttachmentID saved=AttachmentID::ATTACHMENTID_NULL;
    ~OwnedTestAttachment() {
        // Keep the original ID only in the test, so a deliberately failing old
        // implementation can be diagnosed without leaving test objects behind.
        AttachmentDie(saved);
        effects.ProcessDeleteQueue();
    }
};
}

void AttachmentLifetimeSmoke(LawnApp& app) {
    using namespace ModernSmoke;
    auto& effects=*app.mEffectSystem;
    effects.ProcessDeleteQueue();
    const auto baseline=Count(effects);
    std::ofstream log(ProbePath("attachment-lifetime.txt"));
    if(!log) throw std::runtime_error("Cannot write attachment lifetime evidence");
    for(unsigned iteration=0;iteration<256;++iteration) {
        {
            AttachmentID owner=AttachmentID::ATTACHMENTID_NULL;
            OwnedTestAttachment cleanup{effects};
            auto* first=app.AddTodParticle(100,100,0,PARTICLE_COIN_PICKUP_ARROW);
            Require(first!=nullptr,"Could not allocate first attachment test particle");
            AttachParticle(owner,first,0,0);cleanup.saved=owner;
            const auto originalOwner=owner;
            auto* survivor=app.AddReanimation(0,0,0,REANIM_SUN);
            const auto survivorID=app.ReanimationGetID(survivor);
            AttachReanim(owner,survivor,0,0);
            auto* second=app.AddTodParticle(100,100,0,PARTICLE_COIN_PICKUP_ARROW);
            Require(second!=nullptr,"Could not allocate second attachment test particle");
            AttachParticle(owner,second,0,0);
            auto* carrier=effects.mAttachmentHolder->mAttachments.DataArrayGet(static_cast<unsigned>(owner));
            Require(carrier->mNumEffects==3,"Mixed attachment fixture has the wrong shape");
            AttachmentDetachCrossFadeParticleType(owner,PARTICLE_ZAMBONI_SMOKE);
            Require(owner==originalOwner && !first->mDead && !second->mDead,
                "Removing an absent particle type changed its owner");
            AttachmentDetachCrossFadeParticleType(owner,PARTICLE_COIN_PICKUP_ARROW);
            log<<"iteration="<<iteration<<" ownerPreserved="<<(owner==originalOwner)
                <<" firstDead="<<first->mDead<<" secondDead="<<second->mDead
                <<" slots="<<effects.mAttachmentHolder->mAttachments.mSize<<std::endl;
            Require(owner==originalOwner,"Particle detach discarded the entire attachment ID");
            Require(first->mDead && second->mDead && carrier->mEffectArray[0].mEffectID==0 &&
                carrier->mEffectArray[2].mEffectID==0,"Matching child effect IDs were not cleared");
            Require(carrier->mEffectArray[1].mEffectID==unsigned(survivorID) && !survivor->mDead,
                "Particle detach destroyed a different child effect");
            AttachmentUpdateAndMove(owner,100,100);
            effects.ProcessDeleteQueue();
            carrier=effects.mAttachmentHolder->mAttachments.DataArrayGet(static_cast<unsigned>(owner));
            Require(carrier->mNumEffects==1 && FindReanimAttachment(owner)==survivor,
                "Attachment update did not compact only the cleared children");
            AttachmentDie(owner);
            Require(owner==AttachmentID::ATTACHMENTID_NULL && survivor->mDead && carrier->mDead,
                "AttachmentDie did not clear the owner and finish its descendants");
            effects.ProcessDeleteQueue();
            Require(app.ReanimationTryToGet(survivorID)==nullptr &&
                effects.mAttachmentHolder->mAttachments.DataArrayTryToGet(static_cast<unsigned>(originalOwner))==nullptr,
                "Ended attachment/reanimation IDs still resolve after deletion queue");
        }
        Require(Count(effects)==baseline,"Attachment test leaked allocated effect pool slots");
    }
    // Last matching child: keep the owner until normal update/deletion, then
    // clear its now-stale ID on the following owner update (1073 semantics).
    {
        AttachmentID owner=AttachmentID::ATTACHMENTID_NULL;
        OwnedTestAttachment cleanup{effects};
        auto* particle=app.AddTodParticle(100,100,0,PARTICLE_COIN_PICKUP_ARROW);
        Require(particle!=nullptr,"Could not allocate lone attachment test particle");
        AttachParticle(owner,particle,0,0);cleanup.saved=owner;
        AttachmentDetachCrossFadeParticleType(owner,PARTICLE_COIN_PICKUP_ARROW);
        Require(owner==cleanup.saved,"Last child detach discarded its carrier before update");
        AttachmentUpdateAndMove(owner,100,100);
        effects.ProcessDeleteQueue();
        AttachmentUpdateAndMove(owner,100,100);
        Require(owner==AttachmentID::ATTACHMENTID_NULL,"Reclaimed carrier ID was not cleared by owner update");
    }
    Require(Count(effects)==baseline,"Lone attachment removal leaked effect pool slots");
    log<<"PASS 256 mixed cycles + last-child cycle; all six allocated pool counts returned to baseline\n";
    Report("attachment-lifetime-256-cycles-no-live-slot-growth",app);
}

void AttachmentCrossFadeSmoke(LawnApp& app) {
    Require(getenv("PVZ_MODERN_HIDDEN") && getenv("PVZ_APPDATA_DIR") && app.mBoard,
        "Cross-fade probe must use an isolated hidden gameplay process");
    auto* original=app.mEffectSystem;
    Require(gEffectSystem==original,"Effect system globals disagree before cross-fade probe");
    const auto baseline=Count(*original);
    std::ofstream log(ModernSmoke::ProbePath("attachment-cross-fade.txt"));
    Require(bool(log),"Cannot write cross-fade evidence");
    struct PrivateEffects {
        LawnApp& app; EffectSystem* old; EffectSystem effects;
        explicit PrivateEffects(LawnApp& a) : app(a),old(a.mEffectSystem) {
            // No ordinary scene updates run while this synchronous probe owns
            // its private pools. Loaded definitions/images stay shared/read-only.
            gEffectSystem=nullptr; app.mEffectSystem=&effects;
            try { effects.EffectSystemInitialize(); }
            catch (...) { effects.EffectSystemDispose(); app.mEffectSystem=old; gEffectSystem=old; throw; }
        }
        ~PrivateEffects() {
            effects.EffectSystemDispose(); app.mEffectSystem=old; gEffectSystem=old;
        }
    };
    auto render=[&](TodParticleSystem* particle,bool reference=false) {
        auto* screen=app.mDDInterface->mScreenImage;
        screen->FillRect(Rect(0,0,800,600),Color(19,31,47),0);
        Graphics g(screen);
        if(particle && !reference) particle->Draw(&g);
        else if(particle) {
            auto& holder=*particle->mParticleHolder;
            for(int ei=0;ei<particle->EmitterRosterCount();++ei) {
                auto* emitter=particle->EmitterRosterEmitterAt(ei);
                if(!FloatTrackIsSet(emitter->mEmitterDef->mCrossFadeDuration)) continue;
                Require(emitter->mEmitterDef->mImage==nullptr,"FadeOut reference requires the original image-less target");
                TodTriangleGroup group;
                for(int pi=emitter->ParticleRosterCount()-1;pi>=0;--pi) {
                    auto* target=emitter->ParticleRosterParticleAt(pi);
                    auto* source=holder.mParticles.DataArrayGet(unsigned(target->mCrossFadeParticleID));
                    // 1073 SpawnParticle 00520810 calls UpdateParticle before
                    // returning: the target is already age 1, NOT zero.
                    Require(target->mParticleAge==1 && source->mCrossFadeDuration==50,
                        "Initial cross-fade age/duration differs from original spawning");
                    ParticleRenderParams params;
                    Require(TodParticleEmitter::GetRenderParams(source,&params) && params.mAlphaIsSet,
                        "Cross-fade source render parameters are unavailable");
                    const float alpha=255.0f*TodParticleEmitter::ParticleTrackEvaluate(
                        emitter->mEmitterDef->mParticleAlpha,target,TRACK_PARTICLE_ALPHA);
                    params.mAlpha+=(alpha-params.mAlpha)*(1.0f/49.0f);
                    Color color(ClampInt(FloatRoundToInt(params.mRed),0,255),
                        ClampInt(FloatRoundToInt(params.mGreen),0,255),
                        ClampInt(FloatRoundToInt(params.mBlue),0,255),
                        ClampInt(FloatRoundToInt(params.mAlpha),0,255));
                    // FadeOut defines alpha only; geometry and the image frame
                    // stay on the source. Follow target-list order, not source
                    // order, because SpawnParticle inserts at the list head.
                    if(color.mAlpha>0) RenderParticle(&g,source,color,&params,&group);
                }
                group.DrawGroup(&g);
            }
        }
        auto& renderer=*app.mDDInterface->mRenderInterface;
        renderer.Flush(); return renderer.mRenderer->ReadScenePixels();
    };
    unsigned cases=0,visibleCases=0;
    for (auto type:{PROJECTILE_SNOWPEA,PROJECTILE_PUFF}) for (int warmup:{0,6,20}) for (int path=0;path<3;++path) {
        {
            PrivateEffects privateEffects(app); auto& effects=privateEffects.effects;
            auto& systems=effects.mParticleHolder->mParticleSystems;
            Projectile projectile;
            projectile.mAttachmentID=ATTACHMENTID_NULL; // safe destruction if initialization throws
            projectile.ProjectileInitialize(250,270,400000,1,type);
            auto& owner=projectile.mAttachmentID; const auto originalOwner=owner;
            auto* carrier=effects.mAttachmentHolder->mAttachments.DataArrayGet(unsigned(owner));
            Require(carrier->mNumEffects==1 && carrier->mEffectArray[0].mEffectType==EFFECT_PARTICLE,
                "Projectile did not create its ordinary trail particle attachment");
            std::vector<unsigned> ids{carrier->mEffectArray[0].mEffectID};
            auto* first=systems.DataArrayGet(ids[0]); const auto particleType=first->mEffectType;
            int fadeIndex=-1;
            for(int i=0;i<first->mParticleDef->mEmitterDefCount;++i) {
                if(static_cast<ParticleEmitterName>(first->mParticleDef->mEmitterDefs[i].mNameId)==ParticleEmitterName::fadeout) {
                    fadeIndex=i; break;
                }
            }
            Require(fadeIndex>=0 && FloatTrackIsSet(first->mParticleDef->mEmitterDefs[fadeIndex].mCrossFadeDuration)
                && FloatTrackEvaluate(first->mParticleDef->mEmitterDefs[fadeIndex].mCrossFadeDuration,0,0)==50,
                "Original trail definition has no expected 50-tick FadeOut emitter");
            ReanimationID survivorID=REANIMATIONID_NULL;
            if(path==2) {
                auto* survivor=app.AddReanimation(0,0,0,REANIM_SUN);
                survivorID=app.ReanimationGetID(survivor); AttachReanim(owner,survivor,0,0);
                auto* second=app.AddTodParticle(250,270,400000,particleType);
                Require(second!=nullptr,"Cannot allocate second fading particle");
                ids.push_back(systems.DataArrayGetID(second)); AttachParticle(owner,second,0,0);
            }
            for(int tick=0;tick<warmup;++tick) AttachmentUpdateAndMove(owner,250+tick,270);
            const auto before=render(first);
            Require(before.size()==480000,"Invalid cross-fade capture size");
            unsigned visible=0;
            for(auto pixel:before) visible+=pixel!=0xff131f2fu;
            Require((warmup==0 && visible==0) || (warmup>0 && visible>0),
                "Cross-fade fixture visibility does not match particle warmup");
            if(path==0) {
                // The actual ordinary-game path: CrossFade then Detach in Die.
                projectile.Die();
                Require(projectile.mDead && owner==ATTACHMENTID_NULL && carrier->mDead,
                    "Projectile death did not detach its fading trail");
            } else {
                // Framework API branch not called with a name by ordinary Lawn
                // type-removal callers; validate it without claiming 1073 usage.
                AttachmentDetachCrossFadeParticleType(owner, particleType, ParticleEmitterName::fadeout);
                Require(owner==originalOwner && !carrier->mDead,
                    "Typed cross-fade prematurely discarded its parent attachment");
                Require(carrier->mEffectArray[0].mEffectID==0 &&
                    (path!=2 || (carrier->mNumEffects==3 && carrier->mEffectArray[2].mEffectID==0
                        && carrier->mEffectArray[1].mEffectID==unsigned(survivorID))),
                    "Typed cross-fade did not clear only matching child IDs");
            }
            for(auto id:ids) {
                auto* particle=systems.DataArrayGet(id);
                Require(!particle->mDead && !particle->mIsAttachment && particle->EmitterRosterCount()==2,
                    "Detached particle lost its normal update ownership or FadeOut emitter");
            }
            const auto atStart=render(first);
            const auto reference=render(first,true);
            unsigned changed=0;
            for(size_t i=0;i<before.size();++i) changed+=before[i]!=atStart[i];
            log << "start projectile=" << int(type) << " warmup=" << warmup << " path=" << path
                << " changed-from-before=" << changed << " reference-equal=" << (atStart==reference) << std::endl;
            Require(atStart==reference,"Cross-fade first image differs from source geometry and age-1 alpha blend");
            const auto survivorsAlive=[&] {
                for(auto id:ids) if(systems.DataArrayTryToGet(id)) return true;
                return false;
            };
            unsigned ticks=0;
            while(survivorsAlive() && ticks<100) {
                if(path!=0) AttachmentUpdateAndMove(owner,250+warmup+int(ticks),270);
                effects.Update(); effects.ProcessDeleteQueue(); ++ticks;
            }
            Require(!survivorsAlive(),"Detached FadeOut particles did not naturally finish and reclaim");
            if(path==2) {
                Require(owner==originalOwner && app.ReanimationTryToGet(survivorID)
                    && !app.ReanimationGet(survivorID)->mDead && FindReanimAttachment(owner)==app.ReanimationGet(survivorID),
                    "Typed fade damaged the nonmatching live reanimation");
                AttachmentDie(owner); effects.ProcessDeleteQueue();
            } else {
                if(path==1) AttachmentUpdateAndMove(owner,250,270);
                Require(owner==ATTACHMENTID_NULL,"Empty carrier ID was not cleared after its normal reclaim");
            }
            Require(Count(effects)==PoolCounts{},"Cross-fade left allocated effect pool slots after completion");
            log << "case=" << ++cases << " projectile=" << int(type) << " warmup=" << warmup << " path=" << path
                << " initial-particles-visible=" << visible << " start-reference-equal=1 finish-ticks=" << ticks
                << " all-six-pools-empty=1" << std::endl;
            visibleCases+=visible>0;
        }
        Require(app.mEffectSystem==original && gEffectSystem==original && Count(*original)==baseline,
            "Private cross-fade probe changed the actual scene effect pools");
    }
    Require(cases==18 && visibleCases==12,"Cross-fade test coverage incomplete");
    log << "cases=" << cases << " visible=" << visibleCases << " original-scene-pools-unchanged=1" << std::endl;
    ModernSmoke::Report("portable-attachment-crossfade-18-private-pools-12-visible-starts",app);
}

void CreditsAttachmentRetentionProbe(LawnApp& app) {
    using namespace ModernSmoke;
    auto& effects=*app.mEffectSystem;
    std::ofstream log(ProbePath("credits-exit-pools.txt"));
    if(!log) throw std::runtime_error("Cannot write Credits exit pool evidence");
    Require(!app.mCreditScreen && !app.mGameSelector && !app.mBoard,
        "Credits exit probe requires an isolated scene boundary");
    app.ShowGameSelector();
    effects.ProcessDeleteQueue();
    const auto menuBaseline=Count(effects);
    const auto record=[&](const char* phase,int cycle,ReanimationID oldRoot) {
        const auto counts=Count(effects);
        log<<phase<<" cycle="<<cycle<<" oldRootResolves="<<(app.ReanimationTryToGet(oldRoot)!=nullptr);
        for(unsigned count:counts) log<<' '<<count;
        log<<std::endl;
    };
    ReanimationID previousRoot=ReanimationID::REANIMATIONID_NULL;
    record("baseline-menu",-1,previousRoot);
    for(int cycle=0;cycle<8;++cycle) {
        app.KillGameSelector();app.ProcessSafeDeleteList();
        app.ShowCreditScreen();
        Require(app.ReanimationTryToGet(previousRoot)==nullptr,
            "Entering Credits did not reclaim the previous movie root");
        auto* credits=app.mCreditScreen;
        credits->PreLoadCredits();credits->PlayReanim(1);
        credits->mCreditsPaused=true;credits->mDrawCount=3;
        for(int tick=0;tick<3000;++tick) {
            credits->UpdateMovie();
            effects.ProcessDeleteQueue();
        }
        previousRoot=credits->mCreditsReanimID;
        record("before-exit",cycle,previousRoot);
        // Actual Main Menu button callback; it writes only the isolated smoke
        // profile, not the user's data. Do not inject an extra FreeAll on exit.
        credits->ButtonDepress(1);
        app.ProcessSafeDeleteList();effects.ProcessDeleteQueue();
        Require(app.mCreditScreen==nullptr && app.mGameSelector!=nullptr,
            "Credits Main Menu did not complete its scene transition");
        record("after-exit",cycle,previousRoot);
    }
    log<<"baseline-counts";for(unsigned count:menuBaseline) log<<' '<<count;log<<'\n';
    app.KillGameSelector();app.ProcessSafeDeleteList();
    // Test cleanup ONLY after the measurements; it is not evidence that the
    // scene's own exit path reclaimed its objects.
    effects.EffectSystemFreeAll();
    Require(Count(effects)==PoolCounts{},"EffectSystemFreeAll left allocated pool slots");
    Report("credits-eight-real-exits-pool-retention-observed",app);
}

std::vector<std::uint64_t> SnapshotAttachmentBindings(Board& board) {
    auto& effects=*board.mApp->mEffectSystem;
    std::vector<std::uint64_t> words;
    const auto put=[&](auto value){words.push_back(static_cast<std::uint64_t>(value));};
    for(auto count:Count(effects)) put(count);
    const auto owners=[&](auto& pool,unsigned kind) {
        put(kind);put(pool.mSize);
        using T=std::remove_reference_t<decltype(pool.mBlock[0].mItem)>;
        T* object=nullptr;
        while(pool.IterateNext(object)) {
            put(pool.DataArrayGetID(object));put(object->mAttachmentID);
        }
    };
    owners(board.mZombies,1);owners(board.mCoins,2);owners(board.mProjectiles,3);
    put(4);
    Attachment* attachment=nullptr;
    while(effects.mAttachmentHolder->mAttachments.IterateNext(attachment)) {
        put(effects.mAttachmentHolder->mAttachments.DataArrayGetID(attachment));
        put(attachment->mDead);put(attachment->mNumEffects);
        Require(attachment->mNumEffects>=0 && attachment->mNumEffects<=MAX_EFFECTS_PER_ATTACHMENT,
            "Invalid attachment shape in save/load snapshot");
        for(int i=0;i<attachment->mNumEffects;++i) {
            const auto& child=attachment->mEffectArray[i];
            put(child.mEffectType);put(child.mEffectID);
            put(child.mDontDrawIfParentHidden);put(child.mDontPropogateColor);
        }
    }
    put(5);
    Reanimation* reanim=nullptr;
    while(effects.mReanimationHolder->mReanimations.IterateNext(reanim)) {
        Require(reanim->mReanimationHolder==effects.mReanimationHolder.get() && reanim->mDefinition,
            "Reloaded reanimation lacks its live holder/definition binding");
        put(effects.mReanimationHolder->mReanimations.DataArrayGetID(reanim));
        put(reanim->mReanimationType);put(reanim->mIsAttachment);put(reanim->mDead);
        put(reanim->mDefinition->mTracks.count);
        for(int track=0;track<reanim->mDefinition->mTracks.count;++track)
            put(reanim->mTrackInstances[track].mAttachmentID);
    }
    put(6);
    TodParticleSystem* particle=nullptr;
    while(effects.mParticleHolder->mParticleSystems.IterateNext(particle)) {
        Require(particle->mParticleHolder==effects.mParticleHolder.get() && particle->mParticleDef,
            "Reloaded particle lacks its live holder/definition binding");
        put(effects.mParticleHolder->mParticleSystems.DataArrayGetID(particle));
        put(particle->mIsAttachment);put(particle->mDead);
        put(particle->mParticleDef-gParticleDefArray);
    }
    return words;
}

void ParticleEmitterSelectorsSmoke(LawnApp& app)
{
    using Name = ParticleEmitterName;
    using Range = ParticleEmitterNameRange;
    auto* original = app.mEffectSystem;
    const auto baseline = Count(*original);
    struct PrivateEffects {
        LawnApp& app;
        EffectSystem* previous;
        EffectSystem effects;
        explicit PrivateEffects(LawnApp& value) : app(value), previous(value.mEffectSystem) {
            gEffectSystem = nullptr;
            app.mEffectSystem = &effects;
            try { effects.EffectSystemInitialize(); }
            catch (...) { effects.EffectSystemDispose(); app.mEffectSystem = previous; gEffectSystem = previous; throw; }
        }
        ~PrivateEffects() {
            effects.EffectSystemDispose();
            app.mEffectSystem = previous;
            gEffectSystem = previous;
        }
    };
    std::ofstream log(ModernSmoke::ProbePath("particle-emitter-selectors.txt"));
    Require(bool(log), "Cannot write emitter selector evidence");
    unsigned cases = 0;
    {
        PrivateEffects fixture(app);
        auto& definition = gParticleDefArray[PARTICLE_SEED_PACKET_PICKUP];
        auto* system = fixture.effects.mParticleHolder->AllocParticleSystemFromDef(0, 0, 0, &definition, PARTICLE_SEED_PACKET_PICKUP);
        Require(system && system->EmitterRosterCount() > 2, "Award fixture lacks its named emitters");
        const auto exact = system->EmitterRosterEmitterAt(0)->mEmitterDef->mNameId;
        const Range family = ParticleEmitterRanges::awardray;
        auto* marker = system->EmitterRosterEmitterAt(0)->mEmitterDef->mImage;
        const Color color(21, 42, 63, 84);
        const auto test = [&]<typename Selector>(Selector selector) {
            const auto matches = [&](Name id) {
                if constexpr (std::is_same_v<Selector, Name>) return id == selector;
                else return selector.Contains(id);
            };
            for (int i = 0; i < system->EmitterRosterCount(); ++i) {
                auto* e = system->EmitterRosterEmitterAt(i);
                e->mColorOverride = Color::White;
                e->mScaleOverride = 1;
                e->mFrameOverride = -1;
                e->mImageOverride = nullptr;
                e->mExtraAdditiveDrawOverride = false;
            }
            system->OverrideColor(selector, color);
            system->OverrideScale(selector, 2.5f);
            system->OverrideFrame(selector, 2);
            system->OverrideImage(selector, marker);
            system->OverrideExtraAdditiveDraw(selector, true);
            unsigned hits = 0;
            for (int i = 0; i < system->EmitterRosterCount(); ++i) {
                auto* e = system->EmitterRosterEmitterAt(i);
                const bool hit = matches(e->mEmitterDef->mNameId);
                hits += hit;
                Require(e->mColorOverride == (hit ? color : Color::White) &&
                    e->mScaleOverride == (hit ? 2.5f : 1) && e->mFrameOverride == (hit ? 2 : -1) &&
                    e->mImageOverride == (hit ? marker : nullptr) && e->mExtraAdditiveDrawOverride == hit,
                    "Exact/range override selected the wrong runtime emitters");
            }
            log << "case=" << ++cases << " emitters=" << system->EmitterRosterCount() << " hits=" << hits << '\n';
        };
        test(exact);
        test(Name::unnamed);
        test(family);
        test(ParticleEmitterRanges::All);
        test(Range{Name::awardray1, Name::awardray1});
        test(Range{Name::top, Name::unnamed});
        Require(family.Contains(Name::awardray1) && family.Contains(Name::awardray8) && !family.Contains(family.mEnd),
            "Emitter IDT range is not half-open");
    }
    {
        PrivateEffects fixture(app);
        auto& holder = *fixture.effects.mParticleHolder;
        auto* system = holder.AllocParticleSystem(0, 0, 0, PARTICLE_SNOWPEA_TRAIL);
        Require(system && system->EmitterRosterCount() == 1, "Snow trail has wrong initial emitter count");
        system->OverrideColor(Name::unnamed, Color(1, 2, 3, 4));
        Require(system->EmitterRosterEmitterAt(0)->mColorOverride == Color(1, 2, 3, 4),
            "Anonymous emitter is not created or selected");
        system->CrossFade(Range{Name::fadeout, Name::fireball_trail_embers});
        Require(system->EmitterRosterCount() == 2 && system->EmitterRosterEmitterAt(1)->mEmitterDef->mNameId == Name::fadeout,
            "Range crossfade did not use the FadeOut definition");
        for (int tick = 0; tick < 60; ++tick) {
            fixture.effects.Update();
            fixture.effects.ProcessDeleteQueue();
        }
        Require(Count(fixture.effects) == PoolCounts{}, "Range crossfade left live effect slots");
        ++cases;
    }
    Require(app.mEffectSystem == original && gEffectSystem == original && Count(*original) == baseline,
        "Emitter selector fixture altered the real scene");
    log << "PASS cases=" << cases << " exact/range/unnamed/all/empty/reversed boundaries; all private pools reclaimed\n";
    ModernSmoke::Report("particle-emitter-seven-selector-cases", app);
}

void ParticleEmitterSmokeTick(LawnApp& app)
{
    static int stage = 0;
    if (stage == 0) {
        if (!app.mLoaded || !app.mTitleScreen || !app.mTitleScreen->mLoadingThreadComplete) return;
        app.LoadingCompleted();
        stage = 1;
        return;
    }
    if (stage == 1) {
        app.KillGameSelector();
        app.mGameMode = GAMEMODE_ADVENTURE;
        app.MakeNewBoard();
        ParticleEmitterSelectorsSmoke(app);
        PortableFrameTimeSmoke(app);
        PortableShadowSmoke(app);
        PortableAlphaCompositionSmoke(app);
        AttachmentCrossFadeSmoke(app);
        ModernSmoke::ProbeScreenshot(app);
        ModernSmoke::Report("PASS particle-emitters; selectors and snow/puff projectile trail reclaim", app);
        app.CloseRequestAsync();
        stage = 2;
    }
}
