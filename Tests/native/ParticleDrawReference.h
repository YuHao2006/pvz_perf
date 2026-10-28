#include "ReanimClock.h"
#pragma once
// Frozen CPU drawing oracle for native regression comparisons only.
// Production particles evaluate their authored tracks on the CPU.
#include "Sexy.TodLib/TodCommon.h"
#include "Sexy.TodLib/TodParticle.h"
#include "Sexy.TodLib/Definition.h"
#include "Sexy.TodLib/EffectSystem.h"
#include "Sexy.TodLib/ReanimClock.h"
#include "Sexy.TodLib/TodDebug.h"
#include "SexyAppFramework/graphics/Graphics.h"
#include "SexyAppFramework/graphics/DDInterface.h"
#include "SexyAppFramework/graphics/RenderInterface.h"
#include "SexyAppFramework/misc/SexyMatrix.h"
#include "SexyAppFramework/paklib/PakInterface.h"
#include "Sexy.TodLib/generated/GeneratedDefinitions.h"
#include <array>
#include <memory>
#include <unordered_map>
#include <stdexcept>

namespace ParticleDrawReference
{
// A test-owned copy keeps input mutations separate from the runtime definition.
struct EmitterRenderData
{
    FloatParameterTrack mSystemRed{}, mSystemGreen{}, mSystemBlue{}, mSystemAlpha{}, mSystemBrightness{};
    FloatParameterTrack mParticleRed{}, mParticleGreen{}, mParticleBlue{}, mParticleAlpha{}, mParticleBrightness{};
    FloatParameterTrack mParticleScale{}, mParticleStretch{};
    FloatParameterTrack mClipTop{}, mClipBottom{}, mClipLeft{}, mClipRight{};
    unsigned mRenderTrackMask = 0;
    std::shared_ptr<std::array<std::vector<FloatParameterTrackNode>, 16>> nodes;
};
inline constexpr FloatParameterTrack EmitterRenderData::* RenderTracks[] = {
    &EmitterRenderData::mSystemRed, &EmitterRenderData::mSystemGreen, &EmitterRenderData::mSystemBlue,
    &EmitterRenderData::mSystemAlpha, &EmitterRenderData::mSystemBrightness,
    &EmitterRenderData::mParticleRed, &EmitterRenderData::mParticleGreen, &EmitterRenderData::mParticleBlue,
    &EmitterRenderData::mParticleAlpha, &EmitterRenderData::mParticleBrightness,
    &EmitterRenderData::mParticleScale, &EmitterRenderData::mParticleStretch,
    &EmitterRenderData::mClipTop, &EmitterRenderData::mClipBottom,
    &EmitterRenderData::mClipLeft, &EmitterRenderData::mClipRight};
inline std::unordered_map<const TodEmitterDefinition*, EmitterRenderData> RenderDefinitions;
inline void ClearRenderDefinitions() { RenderDefinitions.clear(); }
inline EmitterRenderData& RenderData(const TodEmitterDefinition& emitter)
{
    return RenderDefinitions.at(&emitter);
}
inline void BindRenderData(TodEmitterDefinition& emitter, const EmitterRenderData& data)
{
    RenderDefinitions.insert_or_assign(&emitter, data);
}
inline void LoadRenderDefinitions()
{
    decltype(RenderDefinitions) loaded;
    for (int type = 0; type < gParticleDefCount; ++type)
        for (int index = 0; index < gParticleDefArray[type].mEmitterDefCount; ++index)
        {
            const auto& emitter = gParticleDefArray[type].mEmitterDefs[index];
            EmitterRenderData render;
            render.mRenderTrackMask = emitter.mRenderTrackMask;
            render.mSystemRed = emitter.mSystemRed;
            render.mSystemGreen = emitter.mSystemGreen;
            render.mSystemBlue = emitter.mSystemBlue;
            render.mSystemAlpha = emitter.mSystemAlpha;
            render.mSystemBrightness = emitter.mSystemBrightness;
            render.mParticleRed = emitter.mParticleRed;
            render.mParticleGreen = emitter.mParticleGreen;
            render.mParticleBlue = emitter.mParticleBlue;
            render.mParticleAlpha = emitter.mParticleAlpha;
            render.mParticleBrightness = emitter.mParticleBrightness;
            render.mParticleScale = emitter.mParticleScale;
            render.mParticleStretch = emitter.mParticleStretch;
            render.mClipTop = emitter.mClipTop;
            render.mClipBottom = emitter.mClipBottom;
            render.mClipLeft = emitter.mClipLeft;
            render.mClipRight = emitter.mClipRight;
            loaded.emplace(&emitter, std::move(render));
        }
    RenderDefinitions.swap(loaded);
}

inline double LifeFraction(std::int64_t age, std::int64_t duration)
{
    return age < 0 ? -1.0 : static_cast<double>(age) / std::max<std::int64_t>(1, duration);
}
inline double ParticleTime(const TodParticle* particle)
{
    return LifeFraction(ParticleLifeAgeAt(particle->mParticleEmitter->mParticleSystem->mLastUpdateTimeNs, particle->mBirthTimeNs, particle->mParticleDurationNs), particle->mParticleDurationNs);
}
inline double SystemTime(const TodParticleEmitter& emitter)
{
    return LifeFraction(ParticleLifeAgeAt(emitter.mParticleSystem->mLastUpdateTimeNs, emitter.mBirthTimeNs, emitter.mSystemDurationNs), emitter.mSystemDurationNs);
}
class ParticleRenderParams
{
public:
	bool							mRedIsSet;
	bool							mGreenIsSet;
	bool							mBlueIsSet;
	bool							mAlphaIsSet;
	bool							mParticleScaleIsSet;
	bool							mParticleStretchIsSet;
	bool							mSpinPositionIsSet;
	bool							mPositionIsSet;
	float							mRed;
	float							mGreen;
	float							mBlue;
	float							mAlpha;
	float							mParticleScale;
	float							mParticleStretch;
	float							mSpinPosition;
	float							mPosX;
	float							mPosY;
};

inline float CrossFadeLerp(float theFrom, float theTo, bool theFromIsSet, bool theToIsSet, float theFraction)
{
	if (!theFromIsSet)
		return theTo;
	if (!theToIsSet)
		return theFrom;
	return theFrom + (theTo - theFrom) * theFraction;
}

//0x5176A0
inline bool GetRenderParams(TodParticle* theParticle, ParticleRenderParams* theParams)
{
	TodParticleEmitter* aEmitter = theParticle->mParticleEmitter;
	TodEmitterDefinition* aDef = aEmitter->mEmitterDef;
	const auto& render = RenderData(*aDef);

	// P5-④ 快路：def 无任何已设渲染轨且覆写全默认——直给标准渲染参数，
	// 跳过下方 20 次轨道求值与 IsSet 判定（无色无缩放的粒子 def 大多命中）
	if (render.mRenderTrackMask == 0 &&
		aEmitter->mColorOverride == Color::White &&
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
		// Omitted stretch tracks evaluate to one; RenderParticle multiplies
		// this by scale for its vertical basis (zero collapses PowieWord).
		theParams->mParticleStretch = 1.0f;
		theParams->mSpinPosition = theParticle->mSpinPosition;
		theParams->mPosX = theParticle->mPosition.x;
		theParams->mPosY = theParticle->mPosition.y;
		return true;
	}

	// 颜色。对于每一色彩通道，当系统对应轨道、粒子对应轨道和对应覆写中任一有定义时，认为该通道已设定。
	theParams->mRedIsSet = false;
	theParams->mRedIsSet |= FloatTrackIsSet(render.mSystemRed);
	theParams->mRedIsSet |= FloatTrackIsSet(render.mParticleRed);
	theParams->mRedIsSet |= aEmitter->mColorOverride.mRed != 1.0f;
	theParams->mGreenIsSet = false;
	theParams->mGreenIsSet |= FloatTrackIsSet(render.mSystemGreen);
	theParams->mGreenIsSet |= FloatTrackIsSet(render.mParticleGreen);
	theParams->mGreenIsSet |= aEmitter->mColorOverride.mGreen != 1.0f;
	theParams->mBlueIsSet = false;
	theParams->mBlueIsSet |= FloatTrackIsSet(render.mSystemBlue);
	theParams->mBlueIsSet |= FloatTrackIsSet(render.mParticleBlue);
	theParams->mBlueIsSet |= aEmitter->mColorOverride.mBlue != 1.0f;
	theParams->mAlphaIsSet = false;
	theParams->mAlphaIsSet |= FloatTrackIsSet(render.mSystemAlpha);
	theParams->mAlphaIsSet |= FloatTrackIsSet(render.mParticleAlpha);
	theParams->mAlphaIsSet |= aEmitter->mColorOverride.mAlpha != 1.0f;
	// 缩放
	theParams->mParticleScaleIsSet = false;
	theParams->mParticleScaleIsSet |= FloatTrackIsSet(render.mParticleScale);
	theParams->mParticleScaleIsSet |= (aEmitter->mScaleOverride != 1.0f);
	// 拉伸
	theParams->mParticleStretchIsSet = FloatTrackIsSet(render.mParticleStretch);
	// 旋转角度。当粒子使用随机初始旋转角度或对齐发射方向角度时，也可认为旋转角度已设定。
	theParams->mSpinPositionIsSet = false;
	theParams->mSpinPositionIsSet |= FloatTrackIsSet(aDef->mParticleSpinSpeed);
	theParams->mSpinPositionIsSet |= FloatTrackIsSet(aDef->mParticleSpinAngle);
	theParams->mSpinPositionIsSet |= TestBit(aDef->mParticleFlags, (int)ParticleFlags::PARTICLE_RANDOM_LAUNCH_SPIN);
	theParams->mSpinPositionIsSet |= TestBit(aDef->mParticleFlags, (int)ParticleFlags::PARTICLE_ALIGN_LAUNCH_SPIN);
	// 位置
	theParams->mPositionIsSet = false;
	theParams->mPositionIsSet |= (aDef->mParticleFields.count > 0.0f);
	theParams->mPositionIsSet |= FloatTrackIsSet(aDef->mEmitterRadius);
	theParams->mPositionIsSet |= FloatTrackIsSet(aDef->mEmitterOffsetX);
	theParams->mPositionIsSet |= FloatTrackIsSet(aDef->mEmitterOffsetY);
	theParams->mPositionIsSet |= FloatTrackIsSet(aDef->mEmitterBoxX);
	theParams->mPositionIsSet |= FloatTrackIsSet(aDef->mEmitterBoxY);

	const auto aSystemTime = SystemTime(*aEmitter);
	const auto aParticleTime = ParticleTime(theParticle);
	const auto evaluateSystem = [&](const FloatParameterTrack& track, ParticleSystemTracks slot) {
		return FloatTrackEvaluate(track, aSystemTime, aEmitter->mTrackInterp[static_cast<int>(slot)]);
	};
	const auto evaluateParticle = [&](const FloatParameterTrack& track, ParticleTracks slot) {
		return FloatTrackEvaluate(track, aParticleTime, theParticle->mParticleInterp[static_cast<int>(slot)]);
	};
	float aSystemRed = evaluateSystem(render.mSystemRed, ParticleSystemTracks::TRACK_SYSTEM_RED);
	float aSystemGreen = evaluateSystem(render.mSystemGreen, ParticleSystemTracks::TRACK_SYSTEM_GREEN);
	float aSystemBlue = evaluateSystem(render.mSystemBlue, ParticleSystemTracks::TRACK_SYSTEM_BLUE);
	float aSystemAlpha = evaluateSystem(render.mSystemAlpha, ParticleSystemTracks::TRACK_SYSTEM_ALPHA);
	float aSystemBrightness = evaluateSystem(render.mSystemBrightness, ParticleSystemTracks::TRACK_SYSTEM_BRIGHTNESS);
	float aParticleRed = evaluateParticle(render.mParticleRed, ParticleTracks::TRACK_PARTICLE_RED);
	float aParticleGreen = evaluateParticle(render.mParticleGreen, ParticleTracks::TRACK_PARTICLE_GREEN);
	float aParticleBlue = evaluateParticle(render.mParticleBlue, ParticleTracks::TRACK_PARTICLE_BLUE);
	float aParticleAlpha = evaluateParticle(render.mParticleAlpha, ParticleTracks::TRACK_PARTICLE_ALPHA);
	float aParticleBrightness = evaluateParticle(render.mParticleBrightness, ParticleTracks::TRACK_PARTICLE_BRIGHTNESS);
	float aBrightness = aParticleBrightness * aSystemBrightness;
	// 实际颜色 = 粒子颜色 * 系统颜色 * 覆写颜色 * 亮度
	theParams->mRed = aParticleRed * aSystemRed * aEmitter->mColorOverride.mRed * aBrightness;
	theParams->mGreen = aParticleGreen * aSystemGreen * aEmitter->mColorOverride.mGreen * aBrightness;
	theParams->mBlue = aParticleBlue * aSystemBlue * aEmitter->mColorOverride.mBlue * aBrightness;
	theParams->mAlpha = aParticleAlpha * aSystemAlpha * aEmitter->mColorOverride.mAlpha * aBrightness;
	theParams->mPosX = theParticle->mPosition.x;
	theParams->mPosY = theParticle->mPosition.y;
	float aParticleScale = evaluateParticle(render.mParticleScale, ParticleTracks::TRACK_PARTICLE_SCALE);
	theParams->mParticleStretch = evaluateParticle(render.mParticleStretch, ParticleTracks::TRACK_PARTICLE_STRETCH);
	theParams->mParticleScale = aParticleScale * aEmitter->mScaleOverride;
	theParams->mSpinPosition = theParticle->mSpinPosition;

	TodParticle* aCrossFadeParticle = aEmitter->mParticleSystem->mParticleHolder->mParticles.DataArrayTryToGet((unsigned int)theParticle->mCrossFadeParticleID);
	if (aCrossFadeParticle != nullptr)  // 当存在交叉混合的粒子时，将二者的渲染参数进行混合（从 aCrossFadeParticle 至 theParticle 的交叉混合）
	{
		ParticleRenderParams aCrossFadeParams;
		if (GetRenderParams(aCrossFadeParticle, &aCrossFadeParams))
		{
			const float aFraction = static_cast<float>(LifeFraction(
				ParticleLifeAgeAt(theParticle->mParticleEmitter->mParticleSystem->mLastUpdateTimeNs, theParticle->mBirthTimeNs, theParticle->mParticleDurationNs), aCrossFadeParticle->mCrossFadeDurationNs));
			// 各项数值按照 aFraction 比例混合
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
			// 当交叉混合来源的某项已设定时，可以认为该粒子的对应项也已设定
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

//0x517E20
inline void RenderParticle(Graphics* g, TodParticle* theParticle, const Color& theColor, ParticleRenderParams* theParams, TodTriangleGroup* theTriangleGroup)
{
	TodParticleEmitter* aEmitter = theParticle->mParticleEmitter;
	TodEmitterDefinition* aEmitterDef = aEmitter->mEmitterDef;
	const auto& render = RenderData(*aEmitterDef);
	if (!aEmitterDef->mImageRectCount)
		return;
	const auto& system = *aEmitter->mParticleSystem;
	const auto& definition = *system.mParticleDef;
	const auto variant = system.mVariant;
	int aFrame = aEmitter->mFrameOverride;
	if (aFrame == -1)  // 如果未定义覆写帧
	{
		if (FloatTrackIsSet(aEmitterDef->mAnimationRate))  // 如果定义了动画速率
			aFrame = ClampInt(static_cast<int>(ReanimClock::MulDiv(
				TodParticleAnimationPhase(*theParticle, aEmitterDef->mAnimationRate),
				std::max(0, aEmitterDef->mImageFrames), ParticleClock::Cycle)),
				0, aEmitterDef->mImageFrames - 1);
		else if (aEmitterDef->mAnimated)
			aFrame = ClampInt(ParticleTime(theParticle) * aEmitterDef->mImageFrames, 0, aEmitterDef->mImageFrames - 1);  // 粒子时间值 * 总帧数得到当前帧
		else
			aFrame = theParticle->mImageFrame;  // 帧固定的粒子，直接取其贴图帧
	}
	const auto& aRegion = definition.mImageRects[std::size_t(variant)*definition.mImageRectCount+
		aEmitterDef->mImageRectOffset+std::clamp(aFrame, 0, aEmitterDef->mImageRectCount - 1)];
	if (aRegion.mWidth==0 || aRegion.mHeight==0)
		return;
	if (!definition.mTextures[variant])
		throw std::logic_error("particle appearance atlas is not uploaded");
	TextureSource source{definition.mTextures[variant],0};
	const int aCelWidth = aRegion.mWidth, aCelHeight = aRegion.mHeight;
	Rect aSrcRect(0, 0, aCelWidth, aCelHeight);
	const auto aParticleTime = ParticleTime(theParticle);
	float aClipTop = FloatTrackEvaluate(render.mClipTop, aParticleTime,
		theParticle->mParticleInterp[ParticleTracks::TRACK_PARTICLE_CLIP_TOP]);
	float aClipBottom = FloatTrackEvaluate(render.mClipBottom, aParticleTime,
		theParticle->mParticleInterp[ParticleTracks::TRACK_PARTICLE_CLIP_BOTTOM]);
	float aClipLeft = FloatTrackEvaluate(render.mClipLeft, aParticleTime,
		theParticle->mParticleInterp[ParticleTracks::TRACK_PARTICLE_CLIP_LEFT]);
	float aClipRight = FloatTrackEvaluate(render.mClipRight, aParticleTime,
		theParticle->mParticleInterp[ParticleTracks::TRACK_PARTICLE_CLIP_RIGHT]);
	TOD_ASSERT(aClipTop >= 0.0f && aClipTop <= 1.0f);
	TOD_ASSERT(aClipBottom >= 0.0f && aClipBottom <= 1.0f);
	TOD_ASSERT(aClipLeft >= 0.0f && aClipLeft <= 1.0f);
	TOD_ASSERT(aClipRight >= 0.0f && aClipRight <= 1.0f);
	theParams->mPosX += aClipLeft * aCelWidth;
	theParams->mPosY += aClipTop * aCelHeight;
	aSrcRect.mX += FloatRoundToInt(aClipLeft * aCelWidth);
	aSrcRect.mY += FloatRoundToInt(aClipTop * aCelHeight);
	aSrcRect.mWidth -= FloatRoundToInt(aCelWidth * (aClipLeft + aClipRight));
	aSrcRect.mHeight -= FloatRoundToInt(aCelHeight * (aClipBottom + aClipTop));  // 以上根据裁剪各方向的比例调整源矩形
	TOD_ASSERT(aSrcRect.mX == FloatRoundToInt(aClipLeft * aCelWidth));
	TOD_ASSERT(aSrcRect.mY == FloatRoundToInt(aClipTop * aCelHeight));
	TOD_ASSERT(aSrcRect.mX >= 0 && aSrcRect.mX < 10000);
	TOD_ASSERT(aSrcRect.mY >= 0 && aSrcRect.mY < 10000);
	const float aUSpan = aRegion.mU1 - aRegion.mU0;
	const float aVSpan = aRegion.mV1 - aRegion.mV0;
	const TextureRegion aSourceRegion{
		aRegion.mU0 + aUSpan * (float(aSrcRect.mX) / aCelWidth),
		aRegion.mV0 + aVSpan * (float(aSrcRect.mY) / aCelHeight),
		aRegion.mU0 + aUSpan * (float(aSrcRect.mX + aSrcRect.mWidth) / aCelWidth),
		aRegion.mV0 + aVSpan * (float(aSrcRect.mY + aSrcRect.mHeight) / aCelHeight),
		aSrcRect.mWidth, aSrcRect.mHeight};

	if (TestBit(aEmitterDef->mParticleFlags, (int)ParticleFlags::PARTICLE_ALIGN_TO_PIXELS))  // 坐标对齐至整数像素点
	{
		theParams->mPosX = FloatRoundToInt(theParams->mPosX);
		theParams->mPosY = FloatRoundToInt(theParams->mPosY);
	}
	int aDrawMode = g->mDrawMode;
	if (TestBit(aEmitterDef->mParticleFlags, (int)ParticleFlags::PARTICLE_ADDITIVE))  // 使用叠加模式
		aDrawMode = Graphics::DRAWMODE_ADDITIVE;
	if (TestBit(aEmitterDef->mParticleFlags, (int)ParticleFlags::PARTICLE_FULLSCREEN))  // 全屏模式
	{
		theTriangleGroup->DrawGroup(g);
		Color anOldColor = g->mColor;
		int anOldDrawMode = g->mDrawMode;
		g->mColor = theColor;
		// Fullscreen particles cover the render destination, independent of world width.
		g->FillRect(-g->mTransX, -g->mTransY, g->mDestImage->mWidth, g->mDestImage->mHeight);
		g->mColor = anOldColor;
		g->mDrawMode = anOldDrawMode;
	}
	else
	{
		SexyMatrix3 aTransform;
		TodScaleRotateTransformMatrix(
			aTransform, 
			theParams->mPosX, 
			theParams->mPosY, 
			theParams->mSpinPosition, 
			theParams->mParticleScale, 
			theParams->mParticleStretch * theParams->mParticleScale
		);
		theTriangleGroup->AddTriangle(g, source, aTransform, g->mClipRect, theColor, aDrawMode, aSourceRegion);
		if (aEmitter->mExtraAdditiveDrawOverride)
			theTriangleGroup->AddTriangle(g, source, aTransform, g->mClipRect, theColor, Graphics::DRAWMODE_ADDITIVE, aSourceRegion);
	}
}
} // namespace ParticleDrawReference
