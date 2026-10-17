#include "PortableFixesSmoke.h"
#include "ModernVulkanSmoke.h"
#include "Board.h"
#include "LawnApp.h"
#include "Sexy.TodLib/Reanimator.h"
#include "Sexy.TodLib/Attachment.h"
#include "Sexy.TodLib/EffectSystem.h"
#include "Sexy.TodLib/TodParticle.h"
#include "graphics/DDImage.h"
#include "graphics/DDInterface.h"
#include "graphics/RenderInterface.h"
#include <algorithm>
#include <array>
#include <bit>
#include <cmath>
#include <fstream>
#include <iterator>
#include <stdexcept>
#include <string>
#include <vector>

void PortableReanimGroupBoundarySmoke(LawnApp& app) {
    auto& render=*app.mDDInterface->mRenderInterface;
    auto* screen=app.mDDInterface->mScreenImage;
    const auto* screenBits=screen->mBits;
    const auto screenVersion=screen->mBitsChangedCount;
    Reanimation reanim;
    reanim.ReanimationInitializeType(150,100,REANIM_PEASHOOTER);
    reanim.PlayReanim(ReanimTrackId::anim_idle,REANIM_LOOP,0,12);
    std::vector<uint32_t> ordinary;
    for(int group:{0,17,18,31}) {
        for(int track=0;track<reanim.mDefinition->mTracks.count;++track)
            reanim.mTrackInstances[track].mRenderGroup=group;
        reanim.RebuildTrackActivityMasks();
        screen->FillRect(Sexy::Rect(0,0,800,600),Sexy::Color(18,26,34),0);
        Sexy::Graphics graphics(screen);
        reanim.Draw(&graphics);
        render.Flush();
        const auto pixels=render.mRenderer->ReadScenePixels();
        const auto ink=std::count_if(pixels.begin(),pixels.end(),
            [](auto pixel){return pixel!=0xff121a22u;});
        if(pixels.size()!=480000 || (group<18 ? ink==0 : ink!=0))
            throw std::runtime_error("Reanim supported render-group boundary changed");
        if(group==0) ordinary=pixels;
        if(group==17 && pixels!=ordinary)
            throw std::runtime_error("Reanim group 17 differs from group zero");
    }
    if(screen->mBits!=screenBits || screen->mBitsChangedCount!=screenVersion)
        throw std::runtime_error("Reanim group boundary probe wrote CPU screen pixels");
    std::ofstream log(ModernSmoke::ProbePath("reanim-group-boundaries.txt"));
    log<<4<<'\n';
    log.close();
    if(!log) throw std::runtime_error("Cannot write reanim group boundary evidence");
    ModernSmoke::Report("portable-reanim-four-render-group-boundaries",app);
}

namespace {
void Require(bool ok, const char* message) { if (!ok) throw std::runtime_error(message); }
bool Same(const ReanimatorTransform& a, const ReanimatorTransform& b) {
    const auto bits = [](float x){ return std::bit_cast<std::uint32_t>(x); };
    return bits(a.mTransX)==bits(b.mTransX) && bits(a.mTransY)==bits(b.mTransY) &&
        bits(a.mScaleX)==bits(b.mScaleX) && bits(a.mScaleY)==bits(b.mScaleY) &&
        bits(a.mSkewX)==bits(b.mSkewX) && bits(a.mSkewY)==bits(b.mSkewY) &&
        bits(a.mAlpha)==bits(b.mAlpha) && bits(a.mFrame)==bits(b.mFrame) &&
        a.mImage==b.mImage && a.mFont==b.mFont && a.mText==b.mText;
}

bool Same(const ReanimatorTrackInstance& a, const ReanimatorTrackInstance& b) {
    return a.mBlendCounter==b.mBlendCounter && a.mBlendTime==b.mBlendTime &&
        Same(a.mBlendTransform,b.mBlendTransform) && a.mShakeOverride==b.mShakeOverride &&
        a.mShakeX==b.mShakeX && a.mShakeY==b.mShakeY && a.mAttachmentID==b.mAttachmentID &&
        a.mImageOverride==b.mImageOverride && a.mRenderGroup==b.mRenderGroup &&
        a.mTrackColor==b.mTrackColor && a.mIgnoreClipRect==b.mIgnoreClipRect &&
        a.mTruncateDisappearingFrames==b.mTruncateDisappearingFrames &&
        a.mIgnoreColorOverride==b.mIgnoreColorOverride &&
        a.mIgnoreExtraAdditiveColor==b.mIgnoreExtraAdditiveColor;
}

struct ReanimInstanceState {
    ReanimatorTrackInstance* buffer;
    ReanimatorDefinition* definition;
    ReanimationHolder* holder;
    std::vector<ReanimatorTrackInstance> tracks;
    std::array<std::uint64_t,kReanimActiveMaskWords> active;
    std::uint32_t groups;
    float phase,rate,lastFrameTime;
    int frameStart,frameCount,loopCount;
    ReanimLoopType loop;
    bool dead;

    explicit ReanimInstanceState(const Reanimation& r)
        : buffer(r.mTrackInstances),definition(r.mDefinition),holder(r.mReanimationHolder),
          groups(r.mGroupOccMask),phase(r.mAnimTime),rate(r.mAnimRate),lastFrameTime(r.mLastFrameTime),
          frameStart(r.mFrameStart),frameCount(r.mFrameCount),loopCount(r.mLoopCount),
          loop(r.mLoopType),dead(r.mDead) {
        if (buffer) tracks.assign(buffer,buffer+definition->mTracks.count);
        std::copy(std::begin(r.mActiveMask),std::end(r.mActiveMask),active.begin());
    }

    void RequireUnchanged(const Reanimation& r, const char* message) const {
        Require(r.mTrackInstances==buffer && r.mDefinition==definition && r.mReanimationHolder==holder &&
            r.mGroupOccMask==groups && r.mAnimTime==phase && r.mAnimRate==rate &&
            r.mLastFrameTime==lastFrameTime && r.mFrameStart==frameStart && r.mFrameCount==frameCount &&
            r.mLoopCount==loopCount && r.mLoopType==loop && r.mDead==dead &&
            std::equal(active.begin(),active.end(),std::begin(r.mActiveMask)),message);
        if (buffer) {
            Require(r.mDefinition->mTracks.count==int(tracks.size()),message);
            for (size_t i=0;i<tracks.size();++i) Require(Same(tracks[i],buffer[i]),message);
        }
    }
};

void TwoHolderCase(LawnApp& app, std::ostream& log) {
    auto* const board=app.mBoard;
    auto* const effects=app.mEffectSystem;
    Require(board && effects && gEffectSystem==effects && effects->mReanimationHolder &&
        effects->mAttachmentHolder && effects->mParticleHolder,"Two-holder fixture requires active gameplay pools");
    const auto boardRevision=app.mBoardRevision,appCounter=std::uint64_t(app.mAppCounter);
    const auto mainCounter=board->mMainCounter,effectCounter=board->mEffectCounter;
    const auto poolState=[](const auto& pool) {
        return std::array<std::uintptr_t,6>{reinterpret_cast<std::uintptr_t>(pool.mBlock),
            pool.mMaxUsedCount,pool.mMaxSize,pool.mFreeListHead,pool.mSize,pool.mNextKey};
    };
    const auto livePools=[&] {
        const auto& particles=*effects->mParticleHolder;
        return std::array{poolState(board->mPlants),poolState(board->mZombies),poolState(board->mProjectiles),
            poolState(board->mCoins),poolState(board->mLawnMowers),poolState(board->mGridItems),
            poolState(particles.mParticleSystems),poolState(particles.mEmitters),poolState(particles.mParticles),
            poolState(effects->mReanimationHolder->mReanimations),poolState(effects->mAttachmentHolder->mAttachments)};
    };
    const auto beforePools=livePools();
    std::vector<Reanimation*> liveReanims;
    std::vector<ReanimInstanceState> liveStates;
    Reanimation* live=nullptr;
    while (effects->mReanimationHolder->mReanimations.IterateNext(live)) {
        liveReanims.push_back(live);liveStates.emplace_back(*live);
    }
    const auto requireLiveUnchanged=[&] {
        Require(app.mBoard==board && app.mBoardRevision==boardRevision && app.mAppCounter==appCounter &&
            app.mEffectSystem==effects && gEffectSystem==effects && board->mMainCounter==mainCounter &&
            board->mEffectCounter==effectCounter && livePools()==beforePools,
            "Private reanimation holders changed the active board or effect pools");
        for (size_t i=0;i<liveReanims.size();++i)
            liveStates[i].RequireUnchanged(*liveReanims[i],"Private reanimation holders changed a live board reanimation");
    };
    for (auto type : {REANIM_PEASHOOTER,REANIM_SUNFLOWER}) {
        ReanimationHolder firstHolder,secondHolder;
        firstHolder.InitializeHolder();secondHolder.InitializeHolder();
        auto* first=firstHolder.AllocReanimation(10,20,3,type);
        Require(first && first->mTrackInstances && first->mDefinition && first->mFrameCount>0 &&
            first->mDefinition->mTracks.count>0 &&
            first->mDefinition->mTracks.count<=kReanimActiveMaskCapacityBits,"Invalid two-holder numeric fixture");
        // No attacher traversal or nonzero shake during Update: leave effect routing and RNG alone.
        for (int i=0;i<first->mDefinition->mTracks.count;++i)
            Require(!ReanimTrackRanges::attacher__.Contains(first->GetTrackId(i)),
                "Two-holder fixture must not create globally owned attachments");
        const ReanimInstanceState firstBeforeAllocation(*first);
        auto* second=secondHolder.AllocReanimation(30,40,5,type);
        Require(second && second->mDefinition==first->mDefinition && second->mTrackInstances &&
            first->mReanimationHolder==&firstHolder && second->mReanimationHolder==&secondHolder &&
            firstHolder.mReanimations.mBlock!=secondHolder.mReanimations.mBlock,
            "Two-holder fixture did not retain separate pools and owners");
        firstBeforeAllocation.RequireUnchanged(*first,"Second holder allocation changed the first animation");
        const unsigned firstID=firstHolder.mReanimations.DataArrayGetID(first);
        const unsigned secondID=secondHolder.mReanimations.DataArrayGetID(second);
        Require(firstID==secondID && (firstID>>DATA_ARRAY_KEY_SHIFT)!=0 &&
            firstHolder.mReanimations.DataArrayIndexOf(first)==secondHolder.mReanimations.DataArrayIndexOf(second) &&
            firstHolder.mReanimations.DataArrayTryToGet(secondID)==first &&
            secondHolder.mReanimations.DataArrayTryToGet(firstID)==second,"Two-holder fixture did not collide numeric IDs/generations");
        const auto bufferBytes=first->mDefinition->mTracks.count*sizeof(ReanimatorTrackInstance);
        const auto firstBuffer=reinterpret_cast<std::uintptr_t>(first->mTrackInstances);
        const auto secondBuffer=reinterpret_cast<std::uintptr_t>(second->mTrackInstances);
        Require(firstBuffer+bufferBytes<=secondBuffer || secondBuffer+bufferBytes<=firstBuffer,
            "Equal-ID reanimations share track-instance storage");
        const auto requireFresh=[](const Reanimation& r) {
            Require(r.mGroupOccMask==1u && std::all_of(std::begin(r.mActiveMask),std::end(r.mActiveMask),
                [](auto word){return word==0;}),"Fresh holder animation inherited masks");
            for (int i=0;i<r.mDefinition->mTracks.count;++i) {
                const auto& track=r.mTrackInstances[i];
                Require(track.mBlendCounter==0 && track.mBlendTime==0 && track.mShakeOverride==0 &&
                    track.mAttachmentID==ATTACHMENTID_NULL && track.mRenderGroup==RENDER_GROUP_NORMAL &&
                    track.mBlendTransform.mText==nullptr && track.mBlendTransform.mFont==nullptr &&
                    track.mBlendTransform.mImage==nullptr,"Fresh holder animation inherited mutable track state");
            }
        };
        requireFresh(*first);requireFresh(*second);
        const auto mutate=[](Reanimation& changing, Reanimation& peer, int blendTime, int group) {
            const ReanimInstanceState peerBefore(peer);
            changing.PlayReanim(ReanimTrackId::anim_idle,REANIM_LOOP,0,12);
            changing.mAnimTime=0.37f;changing.StartBlend(blendTime);
            unsigned blending=0;
            for (int i=0;i<changing.mDefinition->mTracks.count;++i) {
                const auto& track=changing.mTrackInstances[i];
                if (track.mBlendCounter>0) {
                    ++blending;
                    Require(track.mBlendCounter==blendTime && track.mBlendTime==blendTime &&
                        (changing.mActiveMask[i>>6] & (1ull<<(i&63)))!=0 &&
                        track.mBlendTransform.mText==nullptr && track.mBlendTransform.mFont==nullptr &&
                        track.mBlendTransform.mImage==nullptr,"Holder-local StartBlend did not set strict-null blend state/activity");
                }
            }
            Require(blending>0,"Two-holder fixture did not blend a visible numeric track");
            auto* idle=changing.GetTrackInstanceByName(ReanimTrackId::anim_idle);
            const int idleIndex=changing.FindTrackIndex(ReanimTrackId::anim_idle);
            changing.AssignRenderGroupToTrack(ReanimTrackId::anim_idle,group);
            changing.SetShakeOverride(ReanimTrackId::anim_idle,2.0f);
            Require(idle->mRenderGroup==group && (changing.mGroupOccMask & (1u<<group))!=0 &&
                idle->mShakeOverride==2.0f && (changing.mActiveMask[idleIndex>>6] & (1ull<<(idleIndex&63)))!=0,
                "Holder-local render group/shake did not set instance masks");
            idle->mTrackColor=Sexy::Color(91,173,227,149);idle->mIgnoreClipRect=true;
            changing.SetTruncateDisappearingFramesAll(false);
            peerBefore.RequireUnchanged(peer,"Mutating equal-ID tracks/blends/masks changed the other holder");
            changing.SetShakeOverride(ReanimTrackId::anim_idle,0.0f);
            changing.RebuildTrackActivityMasks();
            std::array<std::uint64_t,kReanimActiveMaskWords> expectedActive{};
            for (int i=0;i<changing.mDefinition->mTracks.count;++i) {
                const auto& track=changing.mTrackInstances[i];
                Require(track.mShakeOverride==0 && track.mAttachmentID==ATTACHMENTID_NULL,
                    "Private-holder Update would touch global RNG or attachment routing");
                if (track.mBlendCounter>0) expectedActive[i>>6]|=1ull<<(i&63);
            }
            Require(changing.mGroupOccMask==(1u|(1u<<group)) &&
                std::equal(expectedActive.begin(),expectedActive.end(),std::begin(changing.mActiveMask)),
                "Private-holder rebuild did not produce its exact activity/group masks");
            const ReanimInstanceState beforeUpdate(changing);
            changing.Update();
            Require(changing.mAnimTime!=beforeUpdate.phase,"Private-holder animation did not advance");
            for (int i=0;i<changing.mDefinition->mTracks.count;++i)
                Require(changing.mTrackInstances[i].mBlendCounter==
                    std::max(0,beforeUpdate.tracks[i].mBlendCounter-1),"Private-holder Update did not decrement its blends");
            peerBefore.RequireUnchanged(peer,"Updating/rebuilding equal-ID animation changed the other holder");
        };
        mutate(*first,*second,7,17);mutate(*second,*first,11,3);
        const ReanimInstanceState secondBeforeCleanup(*second);
        for (int i=0;i<first->mDefinition->mTracks.count;++i) {
            first->mTrackInstances[i].mBlendCounter=0;
            first->mTrackInstances[i].mRenderGroup=RENDER_GROUP_HIDDEN;
        }
        first->Update();
        Require(std::all_of(std::begin(first->mActiveMask),std::end(first->mActiveMask),[](auto word){return word==0;}),
            "Private-holder Update did not clear its stale activity bits");
        first->AssignRenderGroupToTrack(ReanimTrackId::anim_idle,17);first->RebuildTrackActivityMasks();
        Require(first->mGroupOccMask==(1u<<17) &&
            std::all_of(std::begin(first->mActiveMask),std::end(first->mActiveMask),[](auto word){return word==0;}),
            "Private-holder mask rebuild did not clear only its own activity/groups");
        secondBeforeCleanup.RequireUnchanged(*second,"Clearing first-holder masks changed the second holder");
        firstHolder.mReanimations.DataArrayFree(first);
        Require(!firstHolder.mReanimations.DataArrayTryToGet(firstID) &&
            secondHolder.mReanimations.DataArrayTryToGet(firstID)==second,"Freeing a colliding ID invalidated the other holder");
        secondBeforeCleanup.RequireUnchanged(*second,"Freeing first-holder animation changed the second holder");
        auto* replacement=firstHolder.AllocReanimation(50,60,7,type);
        const unsigned replacementID=firstHolder.mReanimations.DataArrayGetID(replacement);
        Require(replacementID!=firstID && (replacementID>>DATA_ARRAY_KEY_SHIFT)!=(firstID>>DATA_ARRAY_KEY_SHIFT) &&
            firstHolder.mReanimations.DataArrayIndexOf(replacement)==secondHolder.mReanimations.DataArrayIndexOf(second) &&
            replacement->mTrackInstances!=second->mTrackInstances,"Private slot reuse did not preserve buffer/generation independence");
        requireFresh(*replacement);
        secondBeforeCleanup.RequireUnchanged(*second,"Reusing first-holder slot changed the second holder");
        mutate(*replacement,*second,5,17);
        firstHolder.DisposeHolder();
        secondBeforeCleanup.RequireUnchanged(*second,"Disposing the first holder changed the live second holder");
        Require(secondHolder.mReanimations.DataArrayTryToGet(secondID)==second,"Holder disposal invalidated another holder's ID");
        secondHolder.DisposeHolder();
        Require(!firstHolder.mReanimations.mBlock && !secondHolder.mReanimations.mBlock &&
            !firstHolder.mReanimations.mSize && !secondHolder.mReanimations.mSize,"Private holders retained allocations");
        requireLiveUnchanged();
        log<<"two-holder type="<<int(type)<<" equal-id="<<firstID<<" generation="<<(firstID>>DATA_ARRAY_KEY_SHIFT)
            <<" replacement-id="<<replacementID<<" tracks="<<bufferBytes/sizeof(ReanimatorTrackInstance)
            <<" separate-buffers=1 bidirectional-blend-mask-update=1 reuse-dispose-independent=1 board-preserved=1\n";
    }
    requireLiveUnchanged();
    ModernSmoke::Report("portable-reanim-two-private-holders-equal-ids-independent-tracks-blends-masks",app);
}

void BlendCase(Reanimation& r, std::ostream& log, unsigned& tracks, unsigned& started, unsigned& skipped) {
    for (int i=0;i<r.mDefinition->mTracks.count;++i) {
        const auto& blend=r.mTrackInstances[i].mBlendTransform;
        Require(blend.mText==nullptr && blend.mFont==nullptr && blend.mImage==nullptr,
            "Default blend transform must have null text, font and image");
    }
    // The second call captures an already blending numeric animation.
    for (int blendTime : {10,6}) {
        r.mAnimTime=blendTime==10?0.0f:0.37f;
        std::vector<ReanimatorTransform> before(r.mDefinition->mTracks.count);
        std::vector<std::string> captions(before.size());
        for (int i=0;i<r.mDefinition->mTracks.count;++i) {
            r.GetCurrentTransform(i,&before[i]);
            const char* text=before[i].mText;
            Require(text==nullptr || text[0]!='\0',"Numeric reanim text must be null or a nonempty UI caption");
            if (text!=nullptr) captions[i]=text;
        }
        r.StartBlend(blendTime);
        unsigned visible=0,hidden=0;
        for (int i=0;i<r.mDefinition->mTracks.count;++i) {
            const auto& track=r.mTrackInstances[i];
            Require(track.mBlendTransform.mText==nullptr && track.mBlendTransform.mFont==nullptr &&
                track.mBlendTransform.mImage==nullptr,"StartBlend retained non-null text, font or image");
            ++tracks;
            if (before[i].mFrame>=0) {
                Require(track.mBlendCounter==blendTime && track.mBlendTime==blendTime,
                    "StartBlend did not start a visible numeric track");
                auto expected=before[i];expected.mText=nullptr;expected.mFont=nullptr;expected.mImage=nullptr;
                Require(Same(expected,track.mBlendTransform),"StartBlend altered the captured numeric transform");
                ++visible;++started;
            } else {++hidden;++skipped;}
            ReanimatorTransform after;r.GetCurrentTransform(i,&after);
            Require(after.mText==before[i].mText && (after.mText==nullptr || captions[i]==after.mText),
                "StartBlend changed UI caption pointer or plain bytes");
        }
        log<<"blend type="<<int(r.mReanimationType)<<" phase="<<r.mAnimTime<<" time="<<blendTime
            <<" tracks="<<before.size()<<" visible="<<visible<<" hidden="<<hidden
            <<" text-font-image-null=1 caption-bytes-unchanged=1\n";
    }
}

// The pre-optimization/1073 group traversal: each DrawTrack obtains time itself.
void OriginalGroup(Reanimation& r, Sexy::Graphics& g, int group) {
    if (r.mDead) return;
    for (int i=0;i<r.mDefinition->mTracks.count;++i) {
        auto& track=r.mTrackInstances[i];
        if (track.mRenderGroup!=group) continue;
        const bool drawn=r.DrawTrack(&g,i,group);
        if (track.mAttachmentID!=ATTACHMENTID_NULL) {
            AttachmentDraw(track.mAttachmentID,&g,!drawn);
        }
    }
}
auto Pixels(LawnApp& app, Reanimation& r, bool original) {
    auto& render=*app.mDDInterface->mRenderInterface;
    auto* screen=app.mDDInterface->mScreenImage;
    screen->FillRect(Sexy::Rect(0,0,800,600),Sexy::Color(13,29,47),0);
    Sexy::Graphics g(screen);g.SetClipRect(20,20,740,540);g.mLinearBlend = true;
    for (int group=0;group<=17;++group) {
        if (original) OriginalGroup(r,g,group);else r.DrawRenderGroup(&g,group);
    }
    render.Flush();return render.mRenderer->ReadScenePixels();
}
void PixelCase(LawnApp& app, Reanimation& r, std::ostream& log, unsigned& cases, unsigned& nonblank) {
    const auto a=Pixels(app,r,true), b=Pixels(app,r,false);
    Require(a.size()==480000 && b.size()==a.size(),"Frame-time GPU image has wrong dimensions");
    unsigned delta=0;for (size_t i=0;i<a.size();++i) delta+=a[i]!=b[i];
    nonblank+=std::any_of(a.begin()+1,a.end(),[&](auto p){return p!=a[0];});
    ++cases;log<<"gpu type="<<int(r.mReanimationType)<<" phase="<<r.mAnimTime<<" wrong-pixels="<<delta<<'\n';
    Require(delta==0,"Shared frame time changed the rendered pixels");
}

struct Timing { LONGLONG ticks;std::uint64_t digest; };
Timing Measure(Reanimation& r, bool shared) {
    LARGE_INTEGER start,end;QueryPerformanceCounter(&start);
    std::uint64_t digest=0;
    for (int iteration=0;iteration<1024;++iteration) {
        r.mAnimTime=float(iteration%97)/97.0f;
        ReanimatorFrameTime time;
        if (shared) r.GetFrameTime(&time);
        for (int track=0;track<r.mDefinition->mTracks.count;++track) {
            ReanimatorTransform transform;
            r.GetCurrentTransform(track,&transform,shared?&time:nullptr);
            digest+=std::bit_cast<std::uint32_t>(transform.mTransX);
            digest+=std::bit_cast<std::uint32_t>(transform.mTransY);
            digest+=std::bit_cast<std::uint32_t>(transform.mSkewX);
            digest+=std::bit_cast<std::uint32_t>(transform.mSkewY);
            digest+=std::bit_cast<std::uint32_t>(transform.mScaleX);
            digest+=std::bit_cast<std::uint32_t>(transform.mScaleY);
            digest+=std::bit_cast<std::uint32_t>(transform.mFrame);
            digest+=std::bit_cast<std::uint32_t>(transform.mAlpha);
            digest+=reinterpret_cast<std::uintptr_t>(transform.mImage);
            digest+=reinterpret_cast<std::uintptr_t>(transform.mFont);
            digest+=reinterpret_cast<std::uintptr_t>(transform.mText);
        }
    }
    QueryPerformanceCounter(&end);return {end.QuadPart-start.QuadPart,digest};
}
}

void PortableFrameTimeSmoke(LawnApp& app) {
    Require(getenv("PVZ_MODERN_HIDDEN") && getenv("PVZ_APPDATA_DIR") && app.mBoard,
        "Frame-time test requires isolated hidden gameplay");
    std::ofstream log(ModernSmoke::ProbePath("reanim-frame-time.txt"));
    Require(bool(log),"Cannot write frame-time evidence");
    unsigned transforms=0,gpuCases=0,nonblank=0,truncated=0;
    unsigned blendTracks=0,blendStarted=0,blendSkipped=0;
    const ReanimatorTransform defaults;
    Require(defaults.mText==nullptr && defaults.mFont==nullptr && defaults.mImage==nullptr,
        "Default reanim transform must have null text, font and image");
    TwoHolderCase(app,log);
    LARGE_INTEGER frequency;QueryPerformanceFrequency(&frequency);
    for (auto type : {REANIM_PEASHOOTER,REANIM_SUNFLOWER,REANIM_ZOMBIE,REANIM_TALLNUT,REANIM_POTATOMINE,REANIM_ZOMBATAR_HEAD}) {
        Reanimation r;r.ReanimationInitializeType(250,150,type);
        const int frames=r.mDefinition->mTracks.tracks[0].mTransforms.count;
        Require(frames>0,"Frame-time fixture has no animation frames");
        const std::vector<ReanimatorTrackInstance> saved(r.mTrackInstances,r.mTrackInstances+r.mDefinition->mTracks.count);
        BlendCase(r,log,blendTracks,blendStarted,blendSkipped);
        std::copy(saved.begin(),saved.end(),r.mTrackInstances);r.RebuildTrackActivityMasks();
        for (const auto& range : std::array<std::array<int,2>,3>{{{0,frames},{frames/3,std::min(11,frames-frames/3)},{frames-1,1}}}) {
            r.mFrameStart=range[0];r.mFrameCount=range[1];
            for (auto loop : {REANIM_LOOP,REANIM_PLAY_ONCE,REANIM_PLAY_ONCE_AND_HOLD,
                 REANIM_LOOP_FULL_LAST_FRAME,REANIM_PLAY_ONCE_FULL_LAST_FRAME,REANIM_PLAY_ONCE_FULL_LAST_FRAME_AND_HOLD}) {
                r.mLoopType=loop;
                std::vector<float> phases{0.0f,0.0001f,0.1f,0.25f,0.5f,0.9f,0.9999999f,1.0f};
                // Add a real transition to a hidden frame, if this range has one.
                const int span=loop==REANIM_LOOP_FULL_LAST_FRAME || loop==REANIM_PLAY_ONCE_FULL_LAST_FRAME ||
                    loop==REANIM_PLAY_ONCE_FULL_LAST_FRAME_AND_HOLD ? r.mFrameCount : r.mFrameCount-1;
                bool found=false;
                if (span>0) for (int i=0;i<r.mDefinition->mTracks.count && !found;++i)
                    for (int f=r.mFrameStart;f<r.mFrameStart+r.mFrameCount-1;++f) {
                        auto* keys=r.mDefinition->mTracks.tracks[i].mTransforms.mTransforms;
                        if (keys[f].mFrame>=0 && keys[f+1].mFrame==-1) {
                            phases.push_back((float(f-r.mFrameStart)+0.5f)/float(span));found=true;break;
                        }
                    }
                for (float phase : phases) {
                    r.mAnimTime=phase;
                    ReanimatorFrameTime time;r.GetFrameTime(&time);
                    for (int blend : {0,1,5,10}) for (int i=0;i<r.mDefinition->mTracks.count;++i) {
                        auto& track=r.mTrackInstances[i];track.mBlendCounter=0;
                        r.GetTransformAtTime(i,&track.mBlendTransform,&time);
                        track.mBlendTransform.mTransX+=7;track.mBlendTransform.mTransY-=3;
                        track.mBlendTransform.mScaleX*=-0.7f;track.mBlendTransform.mSkewX+=15;
                        track.mBlendTime=10;track.mBlendCounter=blend;
                        track.mTruncateDisappearingFrames=true;
                        ReanimatorTransform before,after;
                        r.GetCurrentTransform(i,&before);r.GetCurrentTransform(i,&after,&time);
                        Require(Same(before,after),"Shared time altered a transform field or resource pointer");
                        ++transforms;
                        auto* keys=r.mDefinition->mTracks.tracks[i].mTransforms.mTransforms;
                        truncated+=keys[time.mAnimFrameBeforeInt].mFrame>=0 && keys[time.mAnimFrameAfterInt].mFrame==-1 &&
                            time.mFraction>0 && after.mFrame==-1;
                    }
                }
            }
        }
        std::copy(saved.begin(),saved.end(),r.mTrackInstances);
        r.mFrameStart=0;r.mFrameCount=frames;r.mLoopType=REANIM_LOOP;
        for (int mode=0;mode<2;++mode) for (float phase : {0.0f,0.37f,0.999f}) {
            r.mAnimTime=phase;
            for (int i=0;i<r.mDefinition->mTracks.count;++i) {
                auto& track=r.mTrackInstances[i];track=saved[i];
                if (mode) {
                    track.mRenderGroup=i%5==0?RENDER_GROUP_HIDDEN:i%5==1?17:i%3;
                    track.mTrackColor=Sexy::Color(191,223,127,180);
                    r.GetCurrentTransform(i,&track.mBlendTransform);
                    track.mBlendTransform.mTransX+=9;track.mBlendCounter=4;track.mBlendTime=10;
                }
            }
            PixelCase(app,r,log,gpuCases,nonblank);
        }
        std::copy(saved.begin(),saved.end(),r.mTrackInstances);
        // No matching group must remain a no-op, even with no usable frame range.
        const int count=r.mFrameCount;r.mFrameCount=0;
        Sexy::Graphics g(app.mDDInterface->mScreenImage);r.DrawRenderGroup(&g,123456);
        r.mFrameCount=count;
        for (int sample=0;sample<6;++sample) {
            const auto first=Measure(r,sample%2!=0),second=Measure(r,sample%2==0);
            Require(first.digest==second.digest,"Frame-time benchmark did not execute equivalent transforms");
            const auto old=sample%2?second:first,now=sample%2?first:second;
            log<<"timing type="<<int(type)<<" sample="<<sample<<" tracks="<<r.mDefinition->mTracks.count
                <<" per-track-ms="<<double(old.ticks)*1000/frequency.QuadPart
                <<" shared-ms="<<double(now.ticks)*1000/frequency.QuadPart<<" digest="<<old.digest<<'\n';
        }
    }
    // Nested animations must not inherit the parent's precomputed time.
    const auto reanims=app.mEffectSystem->mReanimationHolder->mReanimations.mSize;
    const auto attachments=app.mEffectSystem->mAttachmentHolder->mAttachments.mSize;
    {
        Reanimation parent;parent.ReanimationInitializeType(150,100,REANIM_ZOMBIE);
        parent.PlayReanim(ReanimTrackId::anim_idle,REANIM_LOOP,0,12);
        auto* child=app.AddReanimation(0,0,0,REANIM_PEASHOOTER);
        child->PlayReanim(ReanimTrackId::anim_idle,REANIM_LOOP,0,19);
        AttachReanim(parent.GetTrackInstanceByName(ReanimTrackId::Zombie_body)->mAttachmentID,child,15,20);
        parent.Update();parent.mAnimTime=0.13f;child->mAnimTime=0.81f;
        PixelCase(app,parent,log,gpuCases,nonblank);
        parent.mAnimTime=0.72f;child->mAnimTime=0.22f;
        PixelCase(app,parent,log,gpuCases,nonblank);
    }
    app.mEffectSystem->ProcessDeleteQueue();
    Require(app.mEffectSystem->mReanimationHolder->mReanimations.mSize==reanims &&
        app.mEffectSystem->mAttachmentHolder->mAttachments.mSize==attachments,"Frame-time nested fixture retained effects");
    ReanimatorDefinition emptyDef;Reanimation empty;empty.mDefinition=&emptyDef;
    Sexy::Graphics g(app.mDDInterface->mScreenImage);empty.DrawRenderGroup(&g,0);
    Reanimation dead;dead.mDead=true;dead.DrawRenderGroup(&g,0);
    Require(nonblank>0 && truncated>0,"Frame-time fixture missed visible or disappearing-frame cases");
    Require(blendStarted>0 && blendSkipped>0,"StartBlend fixture missed visible or hidden numeric tracks");
    log<<"blend-tracks="<<blendTracks<<" blend-started="<<blendStarted<<" blend-skipped="<<blendSkipped
        <<" strict-null-text-font-image=1\n";
    log<<"transforms="<<transforms<<" truncated="<<truncated<<" gpu="<<gpuCases<<" nonblank="<<nonblank
        <<" exact=1 empty-dead-nonmatching=1 nested-independent=1\n";
    ModernSmoke::Report("portable-reanim-startblend-strict-null-text-font-image",app);
    ModernSmoke::Report("portable-frame-time-exact-transforms-38-gpu-nested-and-empty",app);
}
