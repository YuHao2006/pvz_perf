// Controlled current-code A/B: production GetRenderParams vs the same frozen
// implementation with its two normalized-age reads replaced by birth/lifetime
// evaluation. This measures complete render-parameter queries, not simulation,
// drawing, GPU work or a whole-game speedup. A second scope includes one refresh
// per emitter and particle per batch, then 1/2/4 consuming queries.
// No historical EXE claim is made.
#define WIN32_LEAN_AND_MEAN
#define NOMINMAX
#include <windows.h>
#include "LawnApp.h"
#include "Sexy.TodLib/TodParticle.h"
#include "Sexy.TodLib/Definition.h"
#include "Sexy.TodLib/TodCommon.h"
#include "Sexy.TodLib/ReanimClock.h"
#include <algorithm>
#include <bit>
#include <cmath>
#include <cstdio>
#include <stdexcept>
#include <array>
bool (*gAppCloseRequest)();
namespace {
float CrossFadeLerp(float theFrom, float theTo, bool theFromIsSet, bool theToIsSet, float theFraction)
{
    if (!theFromIsSet)
        return theTo;
    if (!theToIsSet)
        return theFrom;
    return theFrom + (theTo - theFrom) * theFraction;
}
static bool UncachedRender(TodParticle* theParticle, ParticleRenderParams* theParams, int theDepth)
{
	TodParticleEmitter* aEmitter = theParticle->mParticleEmitter;
	TodEmitterDefinition* aDef = aEmitter->mEmitterDef;

	// 快路：def 无任何已设渲染轨且覆写全默认——直给标准渲染参数，
	// 跳过下方 20 次轨道求值（无色无缩放的粒子 def 大多命中）
	if (aDef->mRenderTrackMask == 0 &&
		aEmitter->mColorOverride.mRed == 255 && aEmitter->mColorOverride.mGreen == 255 &&
		aEmitter->mColorOverride.mBlue == 255 && aEmitter->mColorOverride.mAlpha == 255 &&
		aEmitter->mScaleOverride == 1.0f)
	{
		theParams->mRedIsSet = theParams->mGreenIsSet = theParams->mBlueIsSet =
			theParams->mAlphaIsSet = theParams->mParticleScaleIsSet =
			theParams->mParticleStretchIsSet = theParams->mSpinPositionIsSet = false;
		theParams->mPositionIsSet = aDef->mParticleFields.count > 0 ||
			FloatTrackIsSet(aDef->mEmitterRadius) || FloatTrackIsSet(aDef->mEmitterOffsetX) ||
			FloatTrackIsSet(aDef->mEmitterOffsetY) || FloatTrackIsSet(aDef->mEmitterBoxX) ||
			FloatTrackIsSet(aDef->mEmitterBoxY);
		theParams->mRed = theParams->mGreen = theParams->mBlue = theParams->mAlpha = 255.0f;
		theParams->mParticleScale = 1.0f;
		// An omitted stretch track evaluates to one. Zero collapses the entire
		// vertical transform (for example the unadorned PowieWord emitter).
		theParams->mParticleStretch = 1.0f;
		theParams->mSpinPosition = theParticle->mSpinPosition;
		theParams->mPosX = theParticle->mPosition.x;
		theParams->mPosY = theParticle->mPosition.y;
		return true;
	}

	// 颜色。系统轨道、粒子轨道和覆写任一有定义即认为该通道已设定。
	theParams->mRedIsSet = FloatTrackIsSet(aDef->mSystemRed) || FloatTrackIsSet(aDef->mParticleRed) ||
		aEmitter->mColorOverride.mRed != 255.0f;
	theParams->mGreenIsSet = FloatTrackIsSet(aDef->mSystemGreen) || FloatTrackIsSet(aDef->mParticleGreen) ||
		aEmitter->mColorOverride.mGreen != 255.0f;
	theParams->mBlueIsSet = FloatTrackIsSet(aDef->mSystemBlue) || FloatTrackIsSet(aDef->mParticleBlue) ||
		aEmitter->mColorOverride.mBlue != 255.0f;
	theParams->mAlphaIsSet = FloatTrackIsSet(aDef->mSystemAlpha) || FloatTrackIsSet(aDef->mParticleAlpha) ||
		aEmitter->mColorOverride.mAlpha != 255.0f;
	// 缩放/拉伸
	theParams->mParticleScaleIsSet = FloatTrackIsSet(aDef->mParticleScale) || aEmitter->mScaleOverride != 1.0f;
	theParams->mParticleStretchIsSet = FloatTrackIsSet(aDef->mParticleStretch);
	// 旋转角度（随机初始角/对齐发射角也算已设定）
	theParams->mSpinPositionIsSet = FloatTrackIsSet(aDef->mParticleSpinSpeed) ||
		FloatTrackIsSet(aDef->mParticleSpinAngle) ||
		TestBit(aDef->mParticleFlags, (int)ParticleFlags::PARTICLE_RANDOM_LAUNCH_SPIN) ||
		TestBit(aDef->mParticleFlags, (int)ParticleFlags::PARTICLE_ALIGN_LAUNCH_SPIN);
	// 位置
	theParams->mPositionIsSet = aDef->mParticleFields.count > 0 ||
		FloatTrackIsSet(aDef->mEmitterRadius) || FloatTrackIsSet(aDef->mEmitterOffsetX) ||
		FloatTrackIsSet(aDef->mEmitterOffsetY) || FloatTrackIsSet(aDef->mEmitterBoxX) ||
		FloatTrackIsSet(aDef->mEmitterBoxY);

	const auto& aHolder = *aEmitter->mParticleSystem->mParticleHolder;
	const auto& aData = *aHolder.mData;
	const float aSystemTime = (aEmitter->mSystemDurationNs > 0 ? static_cast<float>(double(ParticleLifeAgeAt(aEmitter->mParticleSystem->mLastUpdateTimeNs,aEmitter->mBirthTimeNs,aEmitter->mSystemDurationNs))/double(aEmitter->mSystemDurationNs)) : 0.0f);
	const float aParticleTime = (theParticle->mParticleDurationNs > 0 ? static_cast<float>(double(ParticleLifeAgeAt(aEmitter->mParticleSystem->mLastUpdateTimeNs,theParticle->mBirthTimeNs,theParticle->mParticleDurationNs))/double(theParticle->mParticleDurationNs)) : 0.0f);
	const auto systemEvaluate = [aEmitter, aSystemTime](const FloatParameterTrack& track,
		ParticleSystemTracks index) {
		return FloatTrackEvaluate(track, aSystemTime, aEmitter->mTrackInterp[int(index)]);
	};
	const auto particleEvaluate = [theParticle, aParticleTime](const FloatParameterTrack& track,
		ParticleTracks index) {
		return FloatTrackEvaluate(track, aParticleTime, theParticle->mParticleInterp[int(index)]);
	};

	// 实际颜色 = 粒子颜色 * 系统颜色 * 覆写颜色 * 亮度
	const float aBrightness = particleEvaluate(aDef->mParticleBrightness, ParticleTracks::TRACK_PARTICLE_BRIGHTNESS) *
		systemEvaluate(aDef->mSystemBrightness, ParticleSystemTracks::TRACK_SYSTEM_BRIGHTNESS);
	theParams->mRed = particleEvaluate(aDef->mParticleRed, ParticleTracks::TRACK_PARTICLE_RED) *
		systemEvaluate(aDef->mSystemRed, ParticleSystemTracks::TRACK_SYSTEM_RED) *
		aEmitter->mColorOverride.mRed * aBrightness;
	theParams->mGreen = particleEvaluate(aDef->mParticleGreen, ParticleTracks::TRACK_PARTICLE_GREEN) *
		systemEvaluate(aDef->mSystemGreen, ParticleSystemTracks::TRACK_SYSTEM_GREEN) *
		aEmitter->mColorOverride.mGreen * aBrightness;
	theParams->mBlue = particleEvaluate(aDef->mParticleBlue, ParticleTracks::TRACK_PARTICLE_BLUE) *
		systemEvaluate(aDef->mSystemBlue, ParticleSystemTracks::TRACK_SYSTEM_BLUE) *
		aEmitter->mColorOverride.mBlue * aBrightness;
	theParams->mAlpha = particleEvaluate(aDef->mParticleAlpha, ParticleTracks::TRACK_PARTICLE_ALPHA) *
		systemEvaluate(aDef->mSystemAlpha, ParticleSystemTracks::TRACK_SYSTEM_ALPHA) *
		aEmitter->mColorOverride.mAlpha * aBrightness;
	theParams->mPosX = theParticle->mPosition.x;
	theParams->mPosY = theParticle->mPosition.y;
	theParams->mParticleScale = particleEvaluate(aDef->mParticleScale, ParticleTracks::TRACK_PARTICLE_SCALE) *
		aEmitter->mScaleOverride;
	theParams->mParticleStretch = particleEvaluate(aDef->mParticleStretch, ParticleTracks::TRACK_PARTICLE_STRETCH);
	theParams->mSpinPosition = theParticle->mSpinPosition;

	// 交叉混合：把源粒子的渲染参数按比例混入（源→本粒子方向）
	TodParticle* aCrossFadeParticle = aEmitter->mParticleSystem->mParticleHolder->mParticles.DataArrayTryToGet(
		(unsigned int)theParticle->mCrossFadeParticleID);
	if (theDepth < 32 && aCrossFadeParticle != nullptr &&
		aCrossFadeParticle->mCrossFadeDurationNs > 0)
	{
		ParticleRenderParams aCrossFadeParams;
		if (UncachedRender(aCrossFadeParticle, &aCrossFadeParams, theDepth + 1))
		{
			float aFraction = aCrossFadeParticle->mCrossFadeDurationNs > 1
				? static_cast<float>(double(ParticleLifeAgeAt(aEmitter->mParticleSystem->mLastUpdateTimeNs, theParticle->mBirthTimeNs, theParticle->mParticleDurationNs)) / double(aCrossFadeParticle->mCrossFadeDurationNs - 1))
				: 1.0f;
			theParams->mRed = CrossFadeLerp(aCrossFadeParams.mRed, theParams->mRed, aCrossFadeParams.mRedIsSet, theParams->mRedIsSet, aFraction);
			theParams->mGreen = CrossFadeLerp(aCrossFadeParams.mGreen, theParams->mGreen, aCrossFadeParams.mGreenIsSet, theParams->mGreenIsSet, aFraction);
			theParams->mBlue = CrossFadeLerp(aCrossFadeParams.mBlue, theParams->mBlue, aCrossFadeParams.mBlueIsSet, theParams->mBlueIsSet, aFraction);
			theParams->mAlpha = CrossFadeLerp(aCrossFadeParams.mAlpha, theParams->mAlpha, aCrossFadeParams.mAlphaIsSet, theParams->mAlphaIsSet, aFraction);
			theParams->mParticleScale = CrossFadeLerp(
				aCrossFadeParams.mParticleScale, theParams->mParticleScale, aCrossFadeParams.mParticleScaleIsSet, theParams->mParticleScaleIsSet, aFraction);
			theParams->mParticleStretch = CrossFadeLerp(
				aCrossFadeParams.mParticleStretch, theParams->mParticleStretch, aCrossFadeParams.mParticleStretchIsSet, theParams->mParticleStretchIsSet, aFraction);
			theParams->mSpinPosition = CrossFadeLerp(
				aCrossFadeParams.mSpinPosition, theParams->mSpinPosition, aCrossFadeParams.mSpinPositionIsSet, theParams->mSpinPositionIsSet, aFraction);
			theParams->mPosX = CrossFadeLerp(aCrossFadeParams.mPosX, theParams->mPosX, aCrossFadeParams.mPositionIsSet, theParams->mPositionIsSet, aFraction);
			theParams->mPosY = CrossFadeLerp(aCrossFadeParams.mPosY, theParams->mPosY, aCrossFadeParams.mPositionIsSet, theParams->mPositionIsSet, aFraction);
			// 源已设定的通道视为本粒子也已设定
			theParams->mRedIsSet |= aCrossFadeParams.mRedIsSet;
			theParams->mGreenIsSet |= aCrossFadeParams.mGreenIsSet;
			theParams->mBlueIsSet |= aCrossFadeParams.mBlueIsSet;
			theParams->mAlphaIsSet |= aCrossFadeParams.mAlphaIsSet;
			theParams->mParticleScaleIsSet |= aCrossFadeParams.mParticleScaleIsSet;
			theParams->mParticleStretchIsSet |= aCrossFadeParams.mParticleStretchIsSet;
			theParams->mSpinPositionIsSet |= aCrossFadeParams.mSpinPositionIsSet;
			theParams->mPositionIsSet |= aCrossFadeParams.mPositionIsSet;
		}
	}
	return true;
}
unsigned long long Hash(const ParticleRenderParams& p) {
    unsigned long long h=0;
    for(float value:{p.mRed,p.mGreen,p.mBlue,p.mAlpha,p.mParticleScale,p.mParticleStretch,p.mSpinPosition,p.mPosX,p.mPosY})
        h=h*1099511628211ULL+std::bit_cast<unsigned int>(value);
    return h;
}
__declspec(noinline) unsigned long long Cached(TodParticle& p) {
    ParticleRenderParams result{};
    return p.mParticleEmitter->GetRenderParams(&p,&result)?Hash(result):0;
}
__declspec(noinline) unsigned long long Uncached(TodParticle& p) {
    ParticleRenderParams result{};
    return UncachedRender(&p,&result,0)?Hash(result):0;
}
volatile unsigned long long sink;
}
int main() {
    try {
        SetErrorMode(SEM_FAILCRITICALERRORS|SEM_NOGPFAULTERRORBOX);
        if(!SetProcessAffinityMask(GetCurrentProcess(),0x4000))throw std::runtime_error("LP14 affinity failed");
        LawnApp app; gLawnApp=&app; app.mReadFromRegistry=false;
        TodParticleData data;data.Initialize();TodParticleHolder holder(&data);
        auto* system=holder.mParticleSystems.DataArrayAlloc();system->mParticleHolder=&holder;
        system->mLastUpdateTimeNs=370'000'003;
        TodParticleDefinition definition{};system->mParticleDef=&definition;
        TodEmitterDefinition emitterDefinition{};
        FloatParameterTrackNode nodes[]{{0,1,1,1,1},{1,.25f,.25f,1,1}};
        const FloatParameterTrack animated{nodes,2};
        constexpr unsigned Count=512, Rounds=5, Repeats=256;
        std::array<TodParticle*,Count> particles;
        auto* emitter=holder.mEmitters.DataArrayAlloc();
        emitter->mParticleSystem=system;emitter->mEmitterDef=&emitterDefinition;
        emitter->mSystemDurationNs=1'000'000'000;emitter->mBirthTimeNs=0;
        emitter->mScaleOverride=1;emitter->mColorOverride=Color::White;
        RefreshParticleLifeFraction(*emitter,system->mLastUpdateTimeNs);
        for(unsigned i=0;i<Count;++i) {
            auto* p=holder.mParticles.DataArrayAlloc();particles[i]=p;p->mParticleEmitter=emitter;
            p->mParticleDurationNs=900'000'000+i*10'003;p->mBirthTimeNs=-static_cast<long long>(i*3'017);
            p->mPosition={float(i%29),float(i%17)};p->mSpinPosition=float(i%11)*.01f;
            RefreshParticleLifeFraction(*p,system->mLastUpdateTimeNs);
        }
        LARGE_INTEGER frequency;QueryPerformanceFrequency(&frequency);
        std::puts("case,scope,consumers,kernel,round,queries,ns_per_query,checksum");
        for(int ordinary=0;ordinary<2;++ordinary) {
            emitterDefinition.mRenderTrackMask=ordinary?1:0;
            emitterDefinition.mParticleAlpha=animated;emitterDefinition.mParticleScale=animated;
            emitterDefinition.mSystemBrightness=animated;
            for(auto* p:particles)if(Cached(*p)!=Uncached(*p))throw std::runtime_error("render A/B mismatch");
            for(int scope=0;scope<2;++scope)for(unsigned consumers:{1u,2u,4u})
            for(int kernel=0;kernel<2;++kernel)for(unsigned round=0;round<=Rounds;++round) {
                auto volatile query=kernel?Cached:Uncached;unsigned long long sum=0;
                LARGE_INTEGER begin,end;QueryPerformanceCounter(&begin);
                for(unsigned r=0;r<Repeats;++r) {
                    if(scope && kernel) {
                        RefreshParticleLifeFraction(*emitter,system->mLastUpdateTimeNs);
                        for(auto* p:particles)RefreshParticleLifeFraction(*p,system->mLastUpdateTimeNs);
                    }
                    for(unsigned use=0;use<consumers;++use)for(auto* p:particles)sum+=query(*p);
                }
                QueryPerformanceCounter(&end);sink=sum;
                const auto queries=Count*Repeats*consumers;
                if(round)std::printf("%s,%s,%u,%s,%u,%u,%.6f,%llu\n",ordinary?"authored_tracks":"default_fast",
                    scope?"refresh_and_query":"query_only",consumers,
                    kernel?"production_side_cache":"frozen_current_uncached",round,queries,
                    double(end.QuadPart-begin.QuadPart)*1e9/frequency.QuadPart/queries,sum);
            }
        }
        holder.mEmitters.DataArrayFree(emitter);
        for(auto* p:particles)holder.mParticles.DataArrayFree(p);
        holder.mParticleSystems.DataArrayFree(system);
        return 0;
    }catch(const std::exception& error){std::fprintf(stderr,"FAIL: %s\n",error.what());return 1;}
}
