#include "SexyAppBase.h"
#include "TodAllocator.h"
#include <stdexcept>
#include <cstdarg>
#include <cstdio>
#include <atomic>
#include <deque>
#include <mutex>
#include <utility>
#include "TodDebug.h"
#include "TodCommon.h"
#include "Definition.h"  // DefinitionLoadImage（③d 号直取的回落路径）
#include "generated/ImageSymbolId.h"
#include "generated/NumericResourceBindings.h"  // v4 图像符号注册表（泵静态槽位放置）
#include "generated/ImageSymbolTable.h"  // v4 符号绑定表（id→Image*/w/h）
#include "generated/EntityStrings.h"  // 动态键实体表（阶段 3）
#include "EffectSystem.h"
#include "Resources.h"
#include "TodStringFile.h"
#include "GameConstants.h"
#include "graphics/Font.h"
#include "misc/Debug.h"
#include "graphics/DDImage.h"
#include "graphics/Graphics.h"
#include "graphics/ImageFont.h"
#include "misc/PerfTimer.h"
#include "misc/StableTime.h"
#include "misc/SexyMatrix.h"
#include "graphics/DDInterface.h"
#include "graphics/RenderInterface.h"

//0x510BC0
void Tod_SWTri_AddAllDrawTriFuncs()
{
	SWTri_AddDrawTriFunc(true, false, false, false, 0x8888, false, TodDrawTriangle_8888_TEX1_TALPHA0_MOD0_GLOB0_BLEND0);	//0x4A59B0
	SWTri_AddDrawTriFunc(true, false, false, false, 0x8888, true, TodDrawTriangle_8888_TEX1_TALPHA0_MOD0_GLOB0_BLEND1);		//0x48E6F0
	SWTri_AddDrawTriFunc(true, false, false, true, 0x8888, false, TodDrawTriangle_8888_TEX1_TALPHA0_MOD0_GLOB1_BLEND0);		//0x48F9C0
	SWTri_AddDrawTriFunc(true, false, false, true, 0x8888, true, TodDrawTriangle_8888_TEX1_TALPHA0_MOD0_GLOB1_BLEND1);		//0x490920
	SWTri_AddDrawTriFunc(true, false, true, false, 0x8888, false, TodDrawTriangle_8888_TEX1_TALPHA0_MOD1_GLOB0_BLEND0);		//0x4921A0
	SWTri_AddDrawTriFunc(true, false, true, false, 0x8888, true, TodDrawTriangle_8888_TEX1_TALPHA0_MOD1_GLOB0_BLEND1);		//0x493970
	SWTri_AddDrawTriFunc(true, false, true, true, 0x8888, false, TodDrawTriangle_8888_TEX1_TALPHA0_MOD1_GLOB1_BLEND0);		//0x495BB0
	SWTri_AddDrawTriFunc(true, false, true, true, 0x8888, true, TodDrawTriangle_8888_TEX1_TALPHA0_MOD1_GLOB1_BLEND1);		//0x497480

	SWTri_AddDrawTriFunc(true, true, false, false, 0x8888, false, TodDrawTriangle_8888_TEX1_TALPHA1_MOD0_GLOB0_BLEND0);		//0x4997D0
	SWTri_AddDrawTriFunc(true, true, false, false, 0x8888, true, TodDrawTriangle_8888_TEX1_TALPHA1_MOD0_GLOB0_BLEND1);		//0x49A610
	SWTri_AddDrawTriFunc(true, true, false, true, 0x8888, false, TodDrawTriangle_8888_TEX1_TALPHA1_MOD0_GLOB1_BLEND0);		//0x49BC90
	SWTri_AddDrawTriFunc(true, true, false, true, 0x8888, true, TodDrawTriangle_8888_TEX1_TALPHA1_MOD0_GLOB1_BLEND1);		//0x49CBB0
	SWTri_AddDrawTriFunc(true, true, true, false, 0x8888, false, TodDrawTriangle_8888_TEX1_TALPHA1_MOD1_GLOB0_BLEND0);		//0x49E400
	SWTri_AddDrawTriFunc(true, true, true, false, 0x8888, true, TodDrawTriangle_8888_TEX1_TALPHA1_MOD1_GLOB0_BLEND1);		//0x49FC10
	SWTri_AddDrawTriFunc(true, true, true, true, 0x8888, false, TodDrawTriangle_8888_TEX1_TALPHA1_MOD1_GLOB1_BLEND0);		//0x4A1DF0
	SWTri_AddDrawTriFunc(true, true, true, true, 0x8888, true, TodDrawTriangle_8888_TEX1_TALPHA1_MOD1_GLOB1_BLEND1);		//0x4A3710

	SWTri_AddDrawTriFunc(true, false, false, false, 0x0888, false, TodDrawTriangle_0888_TEX1_TALPHA0_MOD0_GLOB0_BLEND0);	//0x4A59B0
	SWTri_AddDrawTriFunc(true, false, false, false, 0x0888, true, TodDrawTriangle_0888_TEX1_TALPHA0_MOD0_GLOB0_BLEND1);		//0x48E6F0
	SWTri_AddDrawTriFunc(true, false, false, true, 0x0888, false, TodDrawTriangle_0888_TEX1_TALPHA0_MOD0_GLOB1_BLEND0);		//0x4A63C0
	SWTri_AddDrawTriFunc(true, false, false, true, 0x0888, true, TodDrawTriangle_0888_TEX1_TALPHA0_MOD0_GLOB1_BLEND1);		//0x4A7D70
	SWTri_AddDrawTriFunc(true, false, true, false, 0x0888, false, TodDrawTriangle_0888_TEX1_TALPHA0_MOD1_GLOB0_BLEND0);		//0x4AAAA0
	SWTri_AddDrawTriFunc(true, false, true, false, 0x0888, true, TodDrawTriangle_0888_TEX1_TALPHA0_MOD1_GLOB0_BLEND1);		//0x4AD590
	SWTri_AddDrawTriFunc(true, false, true, true, 0x0888, false, TodDrawTriangle_0888_TEX1_TALPHA0_MOD1_GLOB1_BLEND0);		//0x4B1580
	SWTri_AddDrawTriFunc(true, false, true, true, 0x0888, true, TodDrawTriangle_0888_TEX1_TALPHA0_MOD1_GLOB1_BLEND1);		//0x4B42D0

	SWTri_AddDrawTriFunc(true, true, false, false, 0x0888, false, TodDrawTriangle_0888_TEX1_TALPHA1_MOD0_GLOB0_BLEND0);		//0x4B84F0
	SWTri_AddDrawTriFunc(true, true, false, false, 0x0888, true, TodDrawTriangle_0888_TEX1_TALPHA1_MOD0_GLOB0_BLEND1);		//0x4B9D30
	SWTri_AddDrawTriFunc(true, true, false, true, 0x0888, false, TodDrawTriangle_0888_TEX1_TALPHA1_MOD0_GLOB1_BLEND0);		//0x4BC670
	SWTri_AddDrawTriFunc(true, true, false, true, 0x0888, true, TodDrawTriangle_0888_TEX1_TALPHA1_MOD0_GLOB1_BLEND1);		//0x4BE040
	SWTri_AddDrawTriFunc(true, true, true, false, 0x0888, false, TodDrawTriangle_0888_TEX1_TALPHA1_MOD1_GLOB0_BLEND0);		//0x4C0D60
	SWTri_AddDrawTriFunc(true, true, true, false, 0x0888, true, TodDrawTriangle_0888_TEX1_TALPHA1_MOD1_GLOB0_BLEND1);		//0x4C38C0
	SWTri_AddDrawTriFunc(true, true, true, true, 0x0888, false, TodDrawTriangle_0888_TEX1_TALPHA1_MOD1_GLOB1_BLEND0);		//0x4C77C0
	SWTri_AddDrawTriFunc(true, true, true, true, 0x0888, true, TodDrawTriangle_0888_TEX1_TALPHA1_MOD1_GLOB1_BLEND1);		//0x4CA580

	SWTri_AddDrawTriFunc(true, false, false, false, 0x0565, false, TodDrawTriangle_0565_TEX1_TALPHA0_MOD0_GLOB0_BLEND0);	//0x4CE700
	SWTri_AddDrawTriFunc(true, false, false, false, 0x0565, true, TodDrawTriangle_0565_TEX1_TALPHA0_MOD0_GLOB0_BLEND1);		//0x4CF170
	SWTri_AddDrawTriFunc(true, false, false, true, 0x0565, false, TodDrawTriangle_0565_TEX1_TALPHA0_MOD0_GLOB1_BLEND0);		//0x4D0500
	SWTri_AddDrawTriFunc(true, false, false, true, 0x0565, true, TodDrawTriangle_0565_TEX1_TALPHA0_MOD0_GLOB1_BLEND1);		//0x4D20B0
	SWTri_AddDrawTriFunc(true, false, true, false, 0x0565, false, TodDrawTriangle_0565_TEX1_TALPHA0_MOD1_GLOB0_BLEND0);		//0x4D4F40
	SWTri_AddDrawTriFunc(true, false, true, false, 0x0565, true, TodDrawTriangle_0565_TEX1_TALPHA0_MOD1_GLOB0_BLEND1);		//0x4D7C20
	SWTri_AddDrawTriFunc(true, false, true, true, 0x0565, false, TodDrawTriangle_0565_TEX1_TALPHA0_MOD1_GLOB1_BLEND0);		//0x4DBDF0
	SWTri_AddDrawTriFunc(true, false, true, true, 0x0565, true, TodDrawTriangle_0565_TEX1_TALPHA0_MOD1_GLOB1_BLEND1);		//0x4DED40

	SWTri_AddDrawTriFunc(true, true, false, false, 0x0565, false, TodDrawTriangle_0565_TEX1_TALPHA1_MOD0_GLOB0_BLEND0);		//0x4E3150
	SWTri_AddDrawTriFunc(true, true, false, false, 0x0565, true, TodDrawTriangle_0565_TEX1_TALPHA1_MOD0_GLOB0_BLEND1);		//0x4E4B90
	SWTri_AddDrawTriFunc(true, true, false, true, 0x0565, false, TodDrawTriangle_0565_TEX1_TALPHA1_MOD0_GLOB1_BLEND0);		//0x4E76C0
	SWTri_AddDrawTriFunc(true, true, false, true, 0x0565, true, TodDrawTriangle_0565_TEX1_TALPHA1_MOD0_GLOB1_BLEND1);		//0x4E92B0
	SWTri_AddDrawTriFunc(true, true, true, false, 0x0565, false, TodDrawTriangle_0565_TEX1_TALPHA1_MOD1_GLOB0_BLEND0);		//0x4EC170
	SWTri_AddDrawTriFunc(true, true, true, false, 0x0565, true, TodDrawTriangle_0565_TEX1_TALPHA1_MOD1_GLOB0_BLEND1);		//0x4EEE70
	SWTri_AddDrawTriFunc(true, true, true, true, 0x0565, false, TodDrawTriangle_0565_TEX1_TALPHA1_MOD1_GLOB1_BLEND0);		//0x4F2FB0
	SWTri_AddDrawTriFunc(true, true, true, true, 0x0565, true, TodDrawTriangle_0565_TEX1_TALPHA1_MOD1_GLOB1_BLEND1);		//0x4F5F90

	SWTri_AddDrawTriFunc(true, false, false, false, 0x0555, false, TodDrawTriangle_0555_TEX1_TALPHA0_MOD0_GLOB0_BLEND0);	//0x4FA280
	SWTri_AddDrawTriFunc(true, false, false, false, 0x0555, true, TodDrawTriangle_0555_TEX1_TALPHA0_MOD0_GLOB0_BLEND1);		//0x4FACF0
	SWTri_AddDrawTriFunc(true, false, false, true, 0x0555, false, TodDrawTriangle_0555_TEX1_TALPHA0_MOD0_GLOB1_BLEND0);		//0x4FC080
	SWTri_AddDrawTriFunc(true, false, false, true, 0x0555, true, TodDrawTriangle_0555_TEX1_TALPHA0_MOD0_GLOB1_BLEND1);		//0x4FCE50
	SWTri_AddDrawTriFunc(true, false, true, false, 0x0555, false, TodDrawTriangle_0555_TEX1_TALPHA0_MOD1_GLOB0_BLEND0);		//0x4FE560
	SWTri_AddDrawTriFunc(true, false, true, false, 0x0555, true, TodDrawTriangle_0555_TEX1_TALPHA0_MOD1_GLOB0_BLEND1);		//0x4FFB80
	SWTri_AddDrawTriFunc(true, false, true, true, 0x0555, false, TodDrawTriangle_0555_TEX1_TALPHA0_MOD1_GLOB1_BLEND0);		//0x501C80
	SWTri_AddDrawTriFunc(true, false, true, true, 0x0555, true, TodDrawTriangle_0555_TEX1_TALPHA0_MOD1_GLOB1_BLEND1);		//0x503390

	SWTri_AddDrawTriFunc(true, true, false, false, 0x0555, false, TodDrawTriangle_0555_TEX1_TALPHA1_MOD0_GLOB0_BLEND0);		//0x5054D0
	SWTri_AddDrawTriFunc(true, true, false, false, 0x0555, true, TodDrawTriangle_0555_TEX1_TALPHA1_MOD0_GLOB0_BLEND1);		//0x5061E0
	SWTri_AddDrawTriFunc(true, true, false, true, 0x0555, false, TodDrawTriangle_0555_TEX1_TALPHA1_MOD0_GLOB1_BLEND0);		//0x507710
	SWTri_AddDrawTriFunc(true, true, false, true, 0x0555, true, TodDrawTriangle_0555_TEX1_TALPHA1_MOD0_GLOB1_BLEND1);		//0x5084B0
	SWTri_AddDrawTriFunc(true, true, true, false, 0x0555, false, TodDrawTriangle_0555_TEX1_TALPHA1_MOD1_GLOB0_BLEND0);		//0x509BD0
	SWTri_AddDrawTriFunc(true, true, true, false, 0x0555, true, TodDrawTriangle_0555_TEX1_TALPHA1_MOD1_GLOB0_BLEND1);		//0x50B230
	SWTri_AddDrawTriFunc(true, true, true, true, 0x0555, false, TodDrawTriangle_0555_TEX1_TALPHA1_MOD1_GLOB1_BLEND0);		//0x50D2F0
	SWTri_AddDrawTriFunc(true, true, true, true, 0x0555, true, TodDrawTriangle_0555_TEX1_TALPHA1_MOD1_GLOB1_BLEND1);		//0x50EA10
}

//0x5114E0
static SexyString TodGetCurrentLevelName()
{
	return ("Unknown level");
}

//0x511510
static bool TodHasUsedCheatKeys()
{
	return false;
}

static bool TodAppCloseRequest()
{
	return false;
}

intptr_t TodPickFromWeightedArray(const TodWeightedArray* theArray, int theCount)
{
	return TodPickArrayItemFromWeightedArray(theArray, theCount)->mItem;
}

//0x511520
TodWeightedArray* TodPickArrayItemFromWeightedArray(const TodWeightedArray* theArray, int theCount)
{
	// 全体调用方（TodPickFromWeightedArray 及 Challenge 两处）直接解引用返回值，
	// nullptr 即崩溃——2026-10-02 无尽模式实发：曲线外推负权重 → 总和负 →
	// (int)转(unsigned long) 后 Rand 取模返回大正数 → 循环永不过零 → 落 nullptr
	// → TodPickFromWeightedArray+0x168 空指针读。三种非法上游状态一律硬错并
	// 落权重现场，不带病返回。
	if (theCount <= 0)
	{
		TodTraceAndLog("TodPickArrayItemFromWeightedArray: count=%d", theCount);
		TodErrorMessageBox(StrFormat(
			"weighted pick: count %d is invalid", theCount).c_str(), "Error");
		exit(0);
	}

	int aTotalWeight = 0;
	for (int i = 0; i < theCount; i++)
	{
		aTotalWeight += theArray[i].mWeight;
	}
	if (aTotalWeight <= 0)
	{
		std::string aDump = StrFormat(
			"weighted pick: count %d total %d weights:", theCount, aTotalWeight);
		for (int i = 0; i < theCount; i++)
		{
			aDump += StrFormat(" [%lld w %d]",
				(long long)theArray[i].mItem, theArray[i].mWeight);
		}
		TodTraceAndLog(aDump.c_str());
		TodErrorMessageBox(aDump.c_str(), "Error");
		exit(0);
	}

	aTotalWeight = Sexy::Rand(aTotalWeight);

	for (int i = 0; i < theCount; i++)
	{
		aTotalWeight -= theArray[i].mWeight;
		if (aTotalWeight < 0)
		{
			return (TodWeightedArray*)&theArray[i];
		}
	}

	// Rand(total) 开区间（< total），累减必过零——到不了这里。
	TodTraceAndLog("TodPickArrayItemFromWeightedArray: loop missed count=%d", theCount);
	TodErrorMessageBox("weighted pick: cumulative loop missed (mathematically impossible)", "Error");
	exit(0);
}

//0x511570
TodWeightedGridArray* TodPickFromWeightedGridArray(const TodWeightedGridArray* theArray, int theCount)
{
	if (theCount <= 0)
		return nullptr;

	int aTotalWeight = 0;
	for (int i = 0; i < theCount; i++)
	{
		aTotalWeight += theArray[i].mWeight;
	}
	TOD_ASSERT(aTotalWeight > 0);

	aTotalWeight = Sexy::Rand(aTotalWeight);

	for (int i = 0; i < theCount; i++)
	{
		aTotalWeight -= theArray[i].mWeight;
		if (aTotalWeight < 0)
		{
			return (TodWeightedGridArray*)&theArray[i];
		}
	}

	TOD_ASSERT(false);
	return nullptr;
}

//0x5115C0
static float TodCalcSmoothWeight(float aWeight, float aLastPicked, float aSecondLastPicked)
{
	if (aWeight < 1E-6f)
	{
		return 0.0f;
	}

	float aExpectedLength1 = 1.0f / aWeight;								// theLastPicked 的期望值
	float aExpectedLength2 = aExpectedLength1 * 2.0f;						// theSecondLastPicked 的期望值
	float aAdvancedLength1 = aLastPicked + 1.0f - aExpectedLength1;			// 相较于 theLastPicked 的期望值，提前的轮数
	float aAdvancedLength2 = aSecondLastPicked + 1.0f - aExpectedLength2;	// 相较于 theSecondLastPicked 的期望值，提前的轮数
	float aFactor1 = 1.0f + aAdvancedLength1 / aExpectedLength1 * 2.0f;		// = aWeight * aLastPicked * 2 + aWeight * 2 - 1
	float aFactor2 = 1.0f + aAdvancedLength2 / aExpectedLength2 * 2.0f;		// = aSecondLastPicked * aWeight + aWeight - 1
	float aFactorFinal = ClampFloat(aFactor1 * 0.75f + aFactor2 * 0.25f, 0.01f, 100.0f);
	return aWeight * aFactorFinal;
}

int TodPickFromSmoothArray(TodSmoothArray* theArray, int theCount)
{
	float aTotalWeight = 0.0f;
	for (int i = 0; i < theCount; i++)
	{
		aTotalWeight += theArray[i].mWeight;
	}
	TOD_ASSERT(aTotalWeight > 0.0f);

	float aNormalizeFactor = 1.0f / aTotalWeight;
	float aTotalAdjustedWeight = 0.0f;
	for (int j = 0; j < theCount; j++)
	{
		aTotalAdjustedWeight += TodCalcSmoothWeight(theArray[j].mWeight * aNormalizeFactor, theArray[j].mLastPicked, theArray[j].mSecondLastPicked);
	}
	TOD_ASSERT(aTotalAdjustedWeight > 0.0f);

	float aRandWeight = Rand(aTotalAdjustedWeight);
	float aAccumulatedWeight = 0.0f;
	int k;
	for (k = 0; k < theCount - 1; k++)
	{
		aAccumulatedWeight += TodCalcSmoothWeight(theArray[k].mWeight * aNormalizeFactor, theArray[k].mLastPicked, theArray[k].mSecondLastPicked);
		if (aRandWeight <= aAccumulatedWeight)
		{
			break;
		}
	}

	TodUpdateSmoothArrayPick(theArray, theCount, k);
	return theArray[k].mItem;
}

//0x5117F0
void TodUpdateSmoothArrayPick(TodSmoothArray* theArray, int theCount, int thePickIndex)
{
	for (int i = 0; i < theCount; i++)
	{
		if (theArray[i].mWeight > 0.0f)
		{
			theArray[i].mLastPicked += 1.0f;
			theArray[i].mSecondLastPicked += 1.0f;
		}
	}

	theArray[thePickIndex].mSecondLastPicked = theArray[thePickIndex].mLastPicked;
	theArray[thePickIndex].mLastPicked = 0.0f;
}

// ==== 曲线系统唯一定义（原 1073 地址 0x5118C0/0x5118F0/0x511970/0x5119B0）====
// 扭曲原语 + 全域求值 + 13 命名曲线全部定义于此：单一符号单一地址，
// kCurveEvals 别名与任何指针比较不依赖链接器对 inline 实体的跨 TU 去重。
// ── P5-⑥ 快速 sin/cos（2026-10-05，bench_sincos 实测 CRT 2.17ns→1.05ns -52%）──
// Chebyshev 经济化多项式（numpy Chebyshev.fit 全周期 [-π,π] 拟合，1M 点）：
// sin deg-11 误差 3.1e-7、cos deg-12 误差 3.6e-8——像素坐标 0.001px 级，视觉零差。
// 无分支无域缩减：调用方保证入参 [-π,π]（角度类天然满足）；越界域请先 FoldPi。
// 不得用于：需要逐位对拍 CRT 的场景（对拍/存档哈希类调用点保持 sinf/cosf）。
namespace Curves
{
	float Identity(float theTime) { return theTime; }
	float Quad(float theTime) { return theTime * theTime; }
	static float InvQuad(float theTime) { return 2 * theTime - theTime * theTime; }
	//0x5118C0
	float S(float theTime) { return 3 * theTime * theTime - 2 * theTime * theTime * theTime; }
	//0x5118F0
	static float InvQuadS(float theTime)
	{
		if (theTime <= 0.5f)
		{
			return InvQuad(theTime * 2.0f) * 0.5f;
		}
		return Quad((theTime - 0.5f) * 2.0f) * 0.5f + 0.5f;
	}
	//0x511970
	static float BounceW(float theTime) { return 1 - fabs(2 * theTime - 1); }
	static float DoubleS(float theTime) { return S(S(theTime)); }
	static float DoubleInvQuadS(float theTime) { return InvQuadS(InvQuadS(theTime)); }
	static float QuadBounce(float theTime) { return Quad(BounceW(theTime)); }
	static float InvQuadBounce(float theTime) { return InvQuad(BounceW(theTime)); }
	static float SinW(float theTime) { return FastSin(2 * 3.14159265f * theTime); }
	static float EaseSinW(float theTime) { return FastSin(2 * 3.14159265f * S(theTime)); }

	static float EvalFull(float theTime, float thePositionStart, float thePositionEnd, float (*theWarp)(float), bool theReturnToStart)
	{
		if (theTime <= 0.0f)
			return thePositionStart;
		if (theTime >= 1.0f)
			return theReturnToStart ? thePositionStart : thePositionEnd;
		return (thePositionEnd - thePositionStart) * theWarp(theTime) + thePositionStart;
	}

	// 命名曲线（t, 起点, 终点）→ 值；调用点形态 Curves::EaseInOut(a, b, t)
	float Constant(float, float a, float) { return a; }
	float Linear(float t, float a, float b) { return EvalFull(t, a, b, Identity, false); }
	float EaseIn(float t, float a, float b) { return EvalFull(t, a, b, Quad, false); }
	float EaseOut(float t, float a, float b) { return EvalFull(t, a, b, InvQuad, false); }
	float EaseInOut(float t, float a, float b) { return EvalFull(t, a, b, DoubleS, false); }
	float EaseInOutWeak(float t, float a, float b) { return EvalFull(t, a, b, S, false); }
	float FastInOut(float t, float a, float b) { return EvalFull(t, a, b, DoubleInvQuadS, false); }
	float FastInOutWeak(float t, float a, float b) { return EvalFull(t, a, b, InvQuadS, false); }
	float Bounce(float t, float a, float b) { return EvalFull(t, a, b, BounceW, true); }
	float BounceFastMiddle(float t, float a, float b) { return EvalFull(t, a, b, QuadBounce, true); }
	float BounceSlowMiddle(float t, float a, float b) { return EvalFull(t, a, b, InvQuadBounce, true); }
	float SinWave(float t, float a, float b) { return EvalFull(t, a, b, SinW, true); }
	float EaseSinWave(float t, float a, float b) { return EvalFull(t, a, b, EaseSinW, true); }
}

// 曲线 = 时间扭曲函数，按装载记录 int（0..13 连续）直下标取函数指针。
// 求值逻辑（端点钳制 + 回摆族）唯一定义于上方 namespace Curves；
// 此表仅按原版 int 序别名到指针——记录键与求值实现永不分离。
// 索引 8：枚举与曲线函数均不存在。部署记录中的 int 8 是原版工具链的内存残渣
// （Field 未写 <X> 时未清零分配，XML 源确证），全部 12 处携带节点的 low=high=0
// → 输出恒 0。别名到 CONSTANT（同数学结果），装载期不再硬错——残渣键消解为常量。
inline constexpr TodCurveEvalFn kCurveEvals[] = {
	/* [0]  CONSTANT           */ Curves::Constant,
	/* [1]  LINEAR             */ Curves::Linear,
	/* [2]  EASE_IN            */ Curves::EaseIn,
	/* [3]  EASE_OUT           */ Curves::EaseOut,
	/* [4]  EASE_IN_OUT        */ Curves::EaseInOut,
	/* [5]  EASE_IN_OUT_WEAK   */ Curves::EaseInOutWeak,
	/* [6]  FAST_IN_OUT        */ Curves::FastInOut,
	/* [7]  FAST_IN_OUT_WEAK   */ Curves::FastInOutWeak,
	/* [8]  工具链残渣→CONSTANT */ Curves::Constant,
	/* [9]  BOUNCE             */ Curves::Bounce,
	/* [10] BOUNCE_FAST        */ Curves::BounceFastMiddle,
	/* [11] BOUNCE_SLOW        */ Curves::BounceSlowMiddle,
	/* [12] SIN_WAVE           */ Curves::SinWave,
	/* [13] EASE_SIN           */ Curves::EaseSinWave,
};
static_assert(sizeof(kCurveEvals) / sizeof(kCurveEvals[0]) == 14, "曲线增删须同步求值表");


TodCurveEvalFn TodCurveResolveEval(int theCurveIndex)
{
	if (theCurveIndex < 0 || theCurveIndex >= (int)(sizeof(kCurveEvals) / sizeof(kCurveEvals[0])) ||
		kCurveEvals[theCurveIndex] == nullptr)
	{
		TodErrorMessageBox(StrFormat(
			"particle track curve index %d is invalid",
			theCurveIndex).c_str(), "Error");
		exit(0);
	}
	return kCurveEvals[theCurveIndex];
}

int TodCurveIndexFromEval(TodCurveEvalFn theEval)
{
	for (int i = 0; i < (int)(sizeof(kCurveEvals) / sizeof(kCurveEvals[0])); i++)
	{
		if (kCurveEvals[i] == theEval)
		{
			// 槽 0 与 8 同指 Constant：首个命中即 0，残渣键就此规范化为 0。
			return i;
		}
	}
	TodErrorMessageBox(StrFormat(
		"particle track curve pointer %p is not in the table",
		(void*)theEval).c_str(), "Error");
	exit(0);
}

static float TodCurveEvaluate(float theTime, float thePositionStart, float thePositionEnd, float (*theCurve)(float, float, float))
{
	return theCurve(theTime, thePositionStart, thePositionEnd);
}

//0x511B30
float TodCurveEvaluateClamped(float theTime, float thePositionStart, float thePositionEnd, float (*theCurve)(float, float, float))
{
	return theCurve(theTime, thePositionStart, thePositionEnd);
}

//0x511BA0
float TodAnimateCurveFloatTime(float theTimeStart, float theTimeEnd, float theTimeAge, float thePositionStart, float thePositionEnd, float (*theCurve)(float, float, float))
{
	float aWarpedAge = (theTimeAge - theTimeStart) / (theTimeEnd - theTimeStart);
	return TodCurveEvaluateClamped(aWarpedAge, thePositionStart, thePositionEnd, theCurve);
}

//0x511BF0
float TodAnimateCurveFloat(int theTimeStart, int theTimeEnd, int theTimeAge, float thePositionStart, float thePositionEnd, float (*theCurve)(float, float, float))
{
	//return TodAnimateCurveFloatTime(theTimeStart, theTimeEnd, theTimeAge, thePositionStart, thePositionEnd, theCurve);

	float aWarpedAge = (theTimeAge - theTimeStart) / (float)(theTimeEnd - theTimeStart);
	return TodCurveEvaluateClamped(aWarpedAge, thePositionStart, thePositionEnd, theCurve);
}

//0x511C40
// GOTY @Patoke: 0x51BEA0
int TodAnimateCurve(int theTimeStart, int theTimeEnd, int theTimeAge, int thePositionStart, int thePositionEnd, float (*theCurve)(float, float, float))
{
	return FloatRoundToInt(TodAnimateCurveFloat(theTimeStart, theTimeEnd, theTimeAge, thePositionStart, thePositionEnd, theCurve));
}

int RandRangeInt(int theMin, int theMax)
{
	TOD_ASSERT(theMin <= theMax);
	return Rand(theMax - theMin + 1) + theMin;
}

//0x511CB0
float RandRangeFloat(float theMin, float theMax)
{
	TOD_ASSERT(theMin <= theMax);
	return Rand(theMax - theMin) + theMin;
}

//0x511CE0
void TodDrawString(Graphics* g, const SexyString& theText, int thePosX, int thePosY, _Font* theFont, const Color& theColor, DrawStringJustification theJustification)
{
	SexyString aFinalString = theText;

	int aPosX = thePosX;
	if (theJustification == DrawStringJustification::DS_ALIGN_RIGHT || theJustification == DrawStringJustification::DS_ALIGN_RIGHT_VERTICAL_MIDDLE)
	{
		aPosX -= theFont->StringWidth(aFinalString);
	}
	else if (theJustification == DrawStringJustification::DS_ALIGN_CENTER || theJustification == DrawStringJustification::DS_ALIGN_CENTER_VERTICAL_MIDDLE)
	{
		aPosX -= theFont->StringWidth(aFinalString) / 2;
	}

	theFont->DrawString(g, aPosX, thePosY, aFinalString, theColor, g->mClipRect);
}

//0x511D90
void TodDrawImageCelScaled(Graphics* g, Image* theImageStrip, int thePosX, int thePosY, int theCelCol, int theCelRow, float theScaleX, float theScaleY)
{
	TOD_ASSERT(theCelCol >= 0 && theCelCol < theImageStrip->mNumCols);
	TOD_ASSERT(theCelRow >= 0 && theCelRow < theImageStrip->mNumRows);

	int aCelWidth = theImageStrip->GetCelWidth();
	int aCelHeight = theImageStrip->GetCelHeight();
	Rect aSrcRect(aCelWidth * theCelCol, aCelHeight * theCelRow, aCelWidth, aCelHeight);
	Rect aDestRect(thePosX, thePosY, FloatRoundToInt(aCelWidth * theScaleX), FloatRoundToInt(aCelHeight * theScaleY));
	g->DrawImage(theImageStrip, aDestRect, aSrcRect);
}

static const int POOL_SIZE = 4096;
static RenderCommand gRenderCommandPool[POOL_SIZE];
static RenderCommand* gRenderTail[256];
static RenderCommand* gRenderHead[256];

//0x511E50
void TodDrawStringMatrix(Graphics* g, const _Font* theFont, const SexyMatrix3& theMatrix, const SexyString& theString, const Color& theColor)
{
	SexyString aFinalString = theString;

	memset(gRenderTail, 0, sizeof(gRenderTail));
	memset(gRenderHead, 0, sizeof(gRenderHead));
	ImageFont* aFont = (ImageFont*)theFont;
	if (!aFont->mFontData->mInitialized)
		return;

	aFont->Prepare();
	int aCurXPos = 0;
	int aCurPoolIdx = 0;
	for (int aCharNum = 0; aCharNum < (int)aFinalString.size(); aCharNum++)
	{
		SexyChar aChar = aFont->GetMappedChar(aFinalString[aCharNum]);
		SexyChar aNextChar = '\0';
		if (aCharNum < (int)aFinalString.size() - 1)
		{
			aNextChar = aFont->GetMappedChar(aFinalString[aCharNum + 1]);
		}

		int aMaxXPos = aCurXPos;
		for (auto aKernItr = aFont->mActiveLayerList.begin(); aKernItr != aFont->mActiveLayerList.end(); aKernItr++)
		{
			FontLayer* aLayer = aKernItr->mBaseFontLayer;
			CharData* aCharData = aLayer->GetCharData(aChar);
			double aScale = aFont->mScale;
			int aLayerPointSize = aLayer->mPointSize;
			if (aLayerPointSize)
			{
				aScale *= (float)aFont->mPointSize / (float)aLayerPointSize;
			}

			int anImageX, anImageY, aCharWidth, aSpacing;
			if (aScale == 1.0f)
			{
				anImageX = aCharData->mOffset.mX + aLayer->mOffset.mX + aCurXPos;
				anImageY = aCharData->mOffset.mY + aLayer->mOffset.mY - aLayer->mAscent;
				aCharWidth = aCharData->mWidth;

				if (aNextChar == '\0')
				{
					aSpacing = 0;
				}
				else
				{
					aSpacing = aLayer->mSpacing;

					// map 版已删（ASCII 直取阵列改造）；GetKerning miss 返 0，
					// 与 find 未命中不加的语义一致。
					aSpacing += aCharData->GetKerning(aNextChar);
				}
			}
			else
			{
				anImageX = aCurXPos + floor((aCharData->mOffset.mX + aLayer->mOffset.mX) * aScale);
				anImageY = -floor((aLayer->mAscent - aLayer->mOffset.mY - aCharData->mOffset.mY) * aScale);
				aCharWidth = aCharData->mWidth * aScale;

				if (aNextChar == '\0')
				{
					aSpacing = 0;
				}
				else
				{
					aSpacing = aLayer->mSpacing;

					aSpacing += aCharData->GetKerning(aNextChar) * aScale;
				}
			}

			Color aColor;
			aColor.mRed = std::min(aLayer->mColorAdd.mRed + theColor.mRed * aLayer->mColorMult.mRed / 255, 255);
			aColor.mGreen = std::min(aLayer->mColorAdd.mGreen + theColor.mGreen * aLayer->mColorMult.mGreen / 255, 255);
			aColor.mBlue = std::min(aLayer->mColorAdd.mBlue + theColor.mBlue * aLayer->mColorMult.mBlue / 255, 255);
			aColor.mAlpha = std::min(aLayer->mColorAdd.mAlpha + theColor.mAlpha * aLayer->mColorMult.mAlpha / 255, 255);
			int anOrder = aCharData->mOrder + aLayer->mBaseOrder;

			if (aCurPoolIdx >= POOL_SIZE)
				break;

			RenderCommand* aRenderCommand = &gRenderCommandPool[aCurPoolIdx++];
			aRenderCommand->mImage = aKernItr->mScaledImage;
			aRenderCommand->mColor = aColor;
			aRenderCommand->mDest[0] = anImageX;
			aRenderCommand->mDest[1] = anImageY;
			// 1073 0051DC50 caches an empty Rect for a missing glyph, without
			// skipping its metrics/spacing. Reuse one lookup for all four fields.
			const Rect& aGlyphRect = aKernItr->mScaledCharImageRects[aChar];
			aRenderCommand->mSrc[0] = aGlyphRect.mX;
			aRenderCommand->mSrc[1] = aGlyphRect.mY;
			aRenderCommand->mSrc[2] = aGlyphRect.mWidth;
			aRenderCommand->mSrc[3] = aGlyphRect.mHeight;
			aRenderCommand->mMode = aLayer->mDrawMode;
			aRenderCommand->mUseAlphaCorrection = aLayer->mUseAlphaCorrection;
			aRenderCommand->mNext = nullptr;

			int anOrderIdx = std::min(std::max(anOrder + 128, 0), 255);
			if (gRenderTail[anOrderIdx])
			{
				gRenderTail[anOrderIdx]->mNext = aRenderCommand;
				gRenderTail[anOrderIdx] = aRenderCommand;
			}
			else
			{
				gRenderHead[anOrderIdx] = aRenderCommand;
				gRenderTail[anOrderIdx] = aRenderCommand;
			}

			//aCurXPos += aSpacing + aCharWidth;
			//if (aCurXPos > aMaxXPos)
			//{
			//	aMaxXPos = aCurXPos;
			//}
			if (aMaxXPos < aCurXPos + aSpacing + aCharWidth)
			{
				aMaxXPos = aCurXPos + aSpacing + aCharWidth;
			}
		}

		aCurXPos = aMaxXPos;
	}

	for (int aPoolIdx = 0; aPoolIdx < 256; aPoolIdx++)
	{
		RenderCommand* aRenderCommand = gRenderHead[aPoolIdx];

		while (aRenderCommand)
		{
			int aDrawMode = g->mDrawMode;
			if (aRenderCommand->mMode != -1)
			{
				aDrawMode = aRenderCommand->mMode;
			}

			if (aRenderCommand->mImage)
			{
				Rect aSrcRect(aRenderCommand->mSrc[0], aRenderCommand->mSrc[1], aRenderCommand->mSrc[2], aRenderCommand->mSrc[3]);
				SexyTransform2D aTransform;
				float aPosX = aSrcRect.mWidth * 0.5f + aRenderCommand->mDest[0];
				float aPosY = aSrcRect.mHeight * 0.5f + aRenderCommand->mDest[1];
				SexyMatrix3Translation(aTransform, aPosX, aPosY);
				SexyMatrix3Multiply(aTransform, theMatrix, aTransform);
				TodBltMatrix(g, aRenderCommand->mImage, aTransform, g->mClipRect, aRenderCommand->mColor, aDrawMode, aSrcRect);
			}
			
			aRenderCommand = aRenderCommand->mNext;
		}
	}
}

//0x512570
// GOTY @Patoke: 0x51C863
void TodDrawImageCelF(Graphics* g, Image* theImageStrip, float thePosX, float thePosY, int theCelCol, int theCelRow)
{
	TOD_ASSERT(theCelCol >= 0 && theCelCol < theImageStrip->mNumCols);
	TOD_ASSERT(theCelRow >= 0 && theCelRow < theImageStrip->mNumRows);

	int aCelWidth = theImageStrip->GetCelWidth();
	int aCelHeight = theImageStrip->GetCelHeight();
	Rect theSrcRect(aCelWidth * theCelCol, aCelHeight * theCelRow, aCelWidth, aCelHeight);
	g->DrawImageF(theImageStrip, thePosX, thePosY, theSrcRect);
}

void SexyMatrix3Translation(SexyMatrix3& m, float x, float y)
{
	m.m02 += x;
	m.m12 += y;
}

void TodScaleTransformMatrix(SexyMatrix3& m, float x, float y, float theScaleX, float theScaleY)
{
	m.m00 = theScaleX;
	m.m10 = 0.0f;
	m.m20 = 0.0f;
	m.m01 = 0.0f;
	m.m11 = theScaleY;
	m.m21 = 0.0f;
	m.m02 = x;
	m.m12 = y;
	m.m22 = 1.0f;
}

//0x5125D0
void TodScaleRotateTransformMatrix(SexyMatrix3& m, float x, float y, float rad, float theScaleX, float theScaleY)
{
	m.m00 = cos(rad) * theScaleX;
	m.m10 = -sin(rad) * theScaleX;
	m.m20 = 0.0f;
	m.m01 = sin(rad) * theScaleY;
	m.m11 = cos(rad) * theScaleY;
	m.m21 = 0.0f;
	m.m02 = x;
	m.m12 = y;
	m.m22 = 1.0f;
}

static void SexyMatrix3ExtractScale(const SexyMatrix3& m, float& theScaleX, float& theScaleY)
{
	float kx = atan2(m.m00, m.m10);
	if (abs(kx) < PI / 4 || abs(kx) > 4 * PI / 3)
	{
		theScaleX = m.m10 / cos(kx);
	}
	else
	{
		theScaleX = m.m00 / sin(kx);
	}

	float ky = atan2(m.m11, m.m01);
	if (abs(ky) < PI / 4 || abs(ky) > 4 * PI / 3)
	{
		theScaleY = m.m01 / cos(ky);
	}
	else
	{
		theScaleY = m.m11 / sin(ky);
	}
}

void TodMarkImageForSanding(Image* theImage)
{
	FixPixelsOnAlphaEdgeForBlending(theImage);
}

//0x512650
void TodBltMatrix(Graphics* g, Image* theImage, const SexyMatrix3& theTransform, const Rect& theClipRect, const Color& theColor, int theDrawMode, const Rect& theSrcRect)
{
	float aOffsetX = 0.0f;
	float aOffsetY = 0.0f;
	// The original subtracts 0.5 here because DX7 puts integer coordinates
	// at pixel centers. D3D11 puts them at pixel corners, so the offset must
	// stay zero; keeping it shifts every reanim image half a pixel and makes
	// the whole selector (signs, daisy) look soft compared to the original.
	if (theDrawMode == Graphics::DRAWMODE_ADDITIVE)
	{
		gTodTriangleDrawAdditive = true;
	}

	if (!g->mDDDestImage) throw NonScreenDrawError(DrawOperation::BltMatrix);

	if (theClipRect.mX != 0 || theClipRect.mY != 0 || theClipRect.mWidth != BOARD_WIDTH || theClipRect.mHeight != BOARD_HEIGHT)
	{
		g->mDDDestImage->BltMatrix(theImage, aOffsetX, aOffsetY, theTransform, theClipRect, theColor, theDrawMode, theSrcRect, g->mLinearBlend);
	}
	else if (DDImage::Check3D(g->mDDDestImage))
	{
		theImage->mDrawn = true;
		RenderInterface* aInterface = g->mDDDestImage->mDDInterface->mRenderInterface;
		aInterface->SelectDrawSurface(g->mDDDestImage);
		aInterface->BltTransformed(theImage, nullptr, theColor, theDrawMode, theSrcRect, theTransform, g->mLinearBlend, aOffsetX, aOffsetY, true);
	}
	else
	{
		Rect aBufFixClipRect(0, 0, BOARD_WIDTH + 1, BOARD_HEIGHT + 1);
		g->mDDDestImage->BltMatrix(theImage, aOffsetX, aOffsetY, theTransform, aBufFixClipRect, theColor, theDrawMode, theSrcRect, g->mLinearBlend);
	}

	gTodTriangleDrawAdditive = false;
}

//0x5127C0
void TodDrawImageCelCenterScaledF(Graphics* g, Image* theImageStrip, float thePosX, float thePosY, int theCelCol, float theScaleX, float theScaleY)
{
	TOD_ASSERT(theCelCol >= 0 && theCelCol < theImageStrip->mNumCols);

	int aCelWidth = theImageStrip->GetCelWidth();
	int aCelHeight = theImageStrip->GetCelHeight();
	Rect aSrcRect(aCelWidth * theCelCol, 0, aCelWidth, aCelHeight);
	if (theScaleX == 1.0f && theScaleY == 1.0f)
	{
		g->DrawImageF(theImageStrip, thePosX, thePosY, aSrcRect);
		return;
	}

	float aTransX = aCelWidth * 0.5f + thePosX + g->mTransX;
	float aTransY = aCelHeight * 0.5f + thePosY + g->mTransY;

	SexyMatrix3 aTransform;
	aTransform.m00 = theScaleX;
	aTransform.m10 = 0.0f;
	aTransform.m20 = 0.0f;
	aTransform.m01 = 0.0f;
	aTransform.m11 = theScaleY;
	aTransform.m21 = 0.0f;
	aTransform.m02 = aTransX;
	aTransform.m12 = aTransY;
	aTransform.m22 = 1.0f;

	const Color& aColor = g->mColorizeImages ? g->mColor : Color::White;
	TodBltMatrix(g, theImageStrip, aTransform, g->mClipRect, aColor, g->mDrawMode, aSrcRect);
}

//0x512880
void TodDrawImageCelScaledF(Graphics* g, Image* theImageStrip, float thePosX, float thePosY, int theCelCol, int theCelRow, float theScaleX, float theScaleY)
{
	TOD_ASSERT(theCelCol >= 0 && theCelCol < theImageStrip->mNumCols);

	int aCelWidth = theImageStrip->GetCelWidth();
	int aCelHeight = theImageStrip->GetCelHeight();
	Rect aSrcRect(aCelWidth * theCelCol, aCelHeight * theCelRow, aCelWidth, aCelHeight);
	if (theScaleX == 1.0f && theScaleY == 1.0f)
	{
		g->DrawImageF(theImageStrip, thePosX, thePosY, aSrcRect);
		return;
	}

	float aTransX = aCelWidth * 0.5f * theScaleX + thePosX + g->mTransX;
	float aTransY = aCelHeight * 0.5f * theScaleY + thePosY + g->mTransY;

	SexyMatrix3 aTransform;
	aTransform.m00 = theScaleX;
	aTransform.m10 = 0.0f;
	aTransform.m20 = 0.0f;
	aTransform.m01 = 0.0f;
	aTransform.m11 = theScaleY;
	aTransform.m21 = 0.0f;
	aTransform.m02 = aTransX;
	aTransform.m12 = aTransY;
	aTransform.m22 = 1.0f;

	const Color& aColor = g->mColorizeImages ? g->mColor : Color::White;
	TodBltMatrix(g, theImageStrip, aTransform, g->mClipRect, aColor, g->mDrawMode, aSrcRect);
}

//0x512950
// GOTY @Patoke: 0x51CC90
void TodDrawImageScaledF(Graphics* g, Image* theImage, float thePosX, float thePosY, float theScaleX, float theScaleY)
{
	if (theScaleX == 1.0f && theScaleY == 1.0f)
	{
		g->DrawImageF(theImage, thePosX, thePosY);
		return;
	}

	Rect aSrcRect(0, 0, theImage->mWidth, theImage->mHeight);
	float aTransX = theImage->mWidth * 0.5f * theScaleX + thePosX + g->mTransX;
	float aTransY = theImage->mHeight * 0.5f * theScaleY + thePosY + g->mTransY;

	SexyMatrix3 aTransform;
	aTransform.m00 = theScaleX;
	aTransform.m10 = 0.0f;
	aTransform.m20 = 0.0f;
	aTransform.m01 = 0.0f;
	aTransform.m11 = theScaleY;
	aTransform.m21 = 0.0f;
	aTransform.m02 = aTransX;
	aTransform.m12 = aTransY;
	aTransform.m22 = 1.0f;

	const Color& aColor = g->mColorizeImages ? g->mColor : Color::White;
	TodBltMatrix(g, theImage, aTransform, g->mClipRect, aColor, g->mDrawMode, aSrcRect);
}

//0x512A10
void TodDrawImageCenterScaledF(Graphics* g, Image* theImage, float thePosX, float thePosY, float theScaleX, float theScaleY)
{
	if (theScaleX == 1.0f && theScaleY == 1.0f)
	{
		g->DrawImageF(theImage, thePosX, thePosY);
		return;
	}

	Rect aSrcRect(0, 0, theImage->mWidth, theImage->mHeight);
	float aTransX = theImage->mWidth * 0.5f + thePosX + g->mTransX;
	float aTransY = theImage->mHeight * 0.5f + thePosY + g->mTransY;

	SexyMatrix3 aTransform;
	aTransform.m00 = theScaleX;
	aTransform.m10 = 0.0f;
	aTransform.m20 = 0.0f;
	aTransform.m01 = 0.0f;
	aTransform.m11 = theScaleY;
	aTransform.m21 = 0.0f;
	aTransform.m02 = aTransX;
	aTransform.m12 = aTransY;
	aTransform.m22 = 1.0f;

	const Color& aColor = g->mColorizeImages ? g->mColor : Color::White;
	TodBltMatrix(g, theImage, aTransform, g->mClipRect, aColor, g->mDrawMode, aSrcRect);
}

//0x512C60
void FixPixelsOnAlphaEdgeForBlending(Image* theImage)
{
	static_cast<MemoryImage*>(theImage)->mGpuSamplingFlags |= GpuVertex::kAlphaEdgeFilter;
}

static void SexyMatrix3Transpose(const SexyMatrix3& m, SexyMatrix3 &r)
{
	SexyMatrix3 temp;
	temp.m00 = m.m00;
	temp.m01 = m.m10;
	temp.m02 = m.m20;
	temp.m10 = m.m01;
	temp.m11 = m.m11;
	temp.m12 = m.m21;
	temp.m20 = m.m02;
	temp.m21 = m.m12;
	temp.m22 = m.m22;
	
	for (int i = 0; i < 3; i++)
	{
		for (int j = 0; j < 3; j++)
		{
			r.m[i][j] = temp.m[i][j];
		}
	}
}

//0x512D00
void SexyMatrix3Inverse(const SexyMatrix3& m, SexyMatrix3 &r)
{
	float aDet = (m.m22 * m.m11 - m.m21 * m.m12) * m.m00- (m.m22 * m.m10 - m.m20 * m.m12) * m.m01 + (m.m21 * m.m10 - m.m20 * m.m11) * m.m02;
	float aInvDet = 1.0f / aDet;

	SexyMatrix3 temp;
	temp.m00 = (m.m22 * m.m11 - m.m21 * m.m12) * aInvDet;
	temp.m01 = (m.m02 * m.m21 - m.m22 * m.m01) * aInvDet;
	temp.m02 = (m.m12 * m.m01 - m.m02 * m.m11) * aInvDet;
	temp.m10 = (m.m20 * m.m12 - m.m22 * m.m10) * aInvDet;
	temp.m11 = (m.m00 * m.m22 - m.m02 * m.m20) * aInvDet;
	temp.m12 = (m.m02 * m.m10 - m.m12 * m.m00) * aInvDet;
	temp.m20 = (m.m21 * m.m10 - m.m20 * m.m11) * aInvDet;
	temp.m21 = (m.m20 * m.m01 - m.m21 * m.m00) * aInvDet;
	temp.m22 = (m.m00 * m.m11 - m.m10 * m.m01) * aInvDet;

	for (int i = 0; i < 3; i++)
	{
		for (int j = 0; j < 3; j++)
		{
			r.m[i][j] = temp.m[i][j];
		}
	}
}

//0x512E20
void SexyMatrix3Multiply(SexyMatrix3& m, const SexyMatrix3& l, const SexyMatrix3& r)
{
	//SexyMatrix3 temp = l * r;
	SexyMatrix3 temp;
	temp.m00 = l.m00 * r.m00 + l.m01 * r.m10 + l.m02 * r.m20;
	temp.m01 = l.m00 * r.m01 + l.m01 * r.m11 + l.m02 * r.m21;
	temp.m02 = l.m00 * r.m02 + l.m01 * r.m12 + l.m02 * r.m22;
	temp.m10 = l.m10 * r.m00 + l.m11 * r.m10 + l.m12 * r.m20;
	temp.m11 = l.m10 * r.m01 + l.m11 * r.m11 + l.m12 * r.m21;
	temp.m12 = l.m10 * r.m02 + l.m11 * r.m12 + l.m12 * r.m22;
	temp.m20 = l.m20 * r.m00 + l.m21 * r.m10 + l.m22 * r.m20;
	temp.m21 = l.m20 * r.m01 + l.m21 * r.m11 + l.m22 * r.m21;
	temp.m22 = l.m20 * r.m02 + l.m21 * r.m12 + l.m22 * r.m22;

	for (int i = 0; i < 3; i++)
	{
		for (int j = 0; j < 3; j++)
		{
			m.m[i][j] = temp.m[i][j];
		}
	}
}

//0x512F20
// GOTY @Patoke: 0x51D2C0
Color GetFlashingColor(uint32_t theCounter, int theFlashTime)
{
	int aTimeAge = static_cast<int>(theCounter % static_cast<uint32_t>(theFlashTime));
	int aTimeInf = theFlashTime / 2;
	//int aTimeDel = abs(aTimeInf - aTimeAge) / aTimeInf;
	// @Patoke: order wasn't like in binaries
	int aGrayness = ClampInt(200 * abs(aTimeInf - aTimeAge) / aTimeInf + 55, 0, 255);
	//int aGrayness = ClampInt(55 + 200 * abs(aTimeInf - aTimeAge)/ aTimeInf, 0, 255);
	return Color(aGrayness, aGrayness, aGrayness, 255);
}

//0x512F80
Color ColorAdd(const Color& theColor1, const Color& theColor2)
{
	int r = theColor1.mRed + theColor2.mRed;
	int g = theColor1.mGreen + theColor2.mGreen;
	int b = theColor1.mBlue + theColor2.mBlue;
	int a = theColor1.mAlpha + theColor2.mAlpha;

	return Color(ClampInt(r, 0, 255), ClampInt(g, 0, 255), ClampInt(b, 0, 255), ClampInt(a, 0, 255));  // 线性减淡
}

//0x513020
// GOTY @Patoke: 0x51D3C0
int ColorComponentMultiply(int theColor1, int theColor2)
{
	return ClampInt(theColor1 * theColor2 / 255, 0, 255);  // 正片叠底
}

//0x513050
Color ColorsMultiply(const Color& theColor1, const Color& theColor2)
{
	return Color(
		ColorComponentMultiply(theColor1.mRed, theColor2.mRed), 
		ColorComponentMultiply(theColor1.mGreen, theColor2.mGreen),
		ColorComponentMultiply(theColor1.mBlue, theColor2.mBlue),
		ColorComponentMultiply(theColor1.mAlpha, theColor2.mAlpha)
	);  // 正片叠底
}

//0x513120
// GOTY @Patoke: inlined 0x51D4C0
bool TodLoadResources(ResourceGroupId theGroup)
{
	return gSexyAppBase->mResourceManager->TodLoadResources(theGroup);
}

//0x513140
// GOTY @Patoke: 0x51D4C0
// ── GPU 纹理预热队列（2026-10-07 用户架构"全部启动时装载+流式上传+CPU
// 不留位图"）。零线程：装载线程/主线程把已解码图压入（持 SharedImageRef
// 拷贝=引用计数保命），主线程每拍泵出预算内逐张 CreateImageTexture——
// staging 竞技场自动攒批，mPurgeBits 位图上传即弃（RenderInterface 侧）。
// v4 符号绑定表：id → {Image*, w, h}（装载完成期顺序单趟绑定，零二分）
Sexy::ImageSymbolBind gImageSymbolBinds[IMAGE_SYMBOL_ID_COUNT] = {};

namespace
{
	std::mutex gWarmMutex;
	struct TodWarmEntry { SharedImageRef mRef; std::uint32_t mSymbol = 0; };
	std::deque<TodWarmEntry> gWarmQueue;


	// 排水协议（装载线程等待用）：队列空 && 主线程清扫净（双条件硬保证——
	// "装载条完成=全部已解码资源都在 GPU"）。清扫净=主线程清扫返回 0 时置位。
	// 任何新入队清旗（2026-10-09）：否则"清扫净"可能停留在旧批次，装载线程
	// 在最后一批入队与全量上传之间的窗口里看到 stale-clean 提前放行。
	std::atomic<bool> gWarmSweepClean{false};
}

void TodQueueTextureWarm(SharedImageRef theRef, std::uint32_t theSymbol)
{
	if (Sexy::MemoryImage* aImage = theRef)
		// 像素来源判定（2026-10-09 首绘案修正）：Palletize 图（海量声明资源
		// 与字体层图）像素存 mColorIndices/mColorTable 而 mBits==nullptr——
		// 旧守卫只认 mBits 把整类图挡在队列外，成品只能首绘重建。GetBits()
		// 支持调色板重建，故此处放行。
		if ((aImage->mBits != nullptr || aImage->mColorIndices != nullptr)
			&& aImage->mWidth > 0 && aImage->mHeight > 0
			&& aImage->mD3DData == nullptr)
		{
			std::unique_lock aLock(gWarmMutex);
			gWarmQueue.push_back({std::move(theRef), theSymbol});
			gWarmSweepClean.store(false, std::memory_order_release);
		}
}

bool TodWarmQueueEmpty()
{
	std::unique_lock aLock(gWarmMutex);
	return gWarmQueue.empty();
}

void TodWarmDispose()
{
	std::unique_lock aLock(gWarmMutex);
	gWarmQueue.clear();
	gWarmSweepClean.store(false, std::memory_order_release);
	memset(gImageSymbolBinds, 0, sizeof(gImageSymbolBinds));
}

// 排水协议（装载线程等待用）：队列空 && 主线程清扫净（双条件硬保证——
// "装载条完成=全部已解码资源都在 GPU"）。清扫净=主线程清扫返回 0 时置位。

bool TodWarmDrained()
{
	return TodWarmQueueEmpty() && gWarmSweepClean.load(std::memory_order_acquire);
}

void TodWarmMarkSweepClean()
{
	gWarmSweepClean.store(true, std::memory_order_release);
}

void TodBindSymbolTable()
{
    if (gSexyAppBase == nullptr || gSexyAppBase->mResourceManager == nullptr)
        return;
    auto* manager = gSexyAppBase->mResourceManager;
    memset(gImageSymbolBinds, 0, sizeof(gImageSymbolBinds));
    for (std::uint32_t id = 1; id <= IMAGE_SYMBOL_ID_MAX; ++id)
    {
        auto* resource = manager->GetImageResBySlot(id);
        if (resource == nullptr)
            continue;
        if (MemoryImage* image = resource->mImage)
        {
            gImageSymbolBinds[id].mImage = image;
            gImageSymbolBinds[id].mWidth = static_cast<std::uint16_t>(image->mWidth);
            gImageSymbolBinds[id].mHeight = static_cast<std::uint16_t>(image->mHeight);
        }
    }
}

int TodWarmPump(int theBudgetMs)
{
	if (gSexyAppBase == nullptr || gSexyAppBase->mDDInterface == nullptr
		|| gSexyAppBase->mDDInterface->mRenderInterface == nullptr)
		return 0;
	PerfTimer aTimer;
	aTimer.Start();
	int aMade = 0;
	for (;;)
	{
		TodWarmEntry aEntry;
		{
			std::unique_lock aLock(gWarmMutex);
			if (gWarmQueue.empty())
				return aMade;
			aEntry = std::move(gWarmQueue.front());
			gWarmQueue.pop_front();
		}
		Sexy::MemoryImage* aImage = aEntry.mRef;
		// 像素来源判定同 TodQueueTextureWarm（Palletize 图 mBits==nullptr 但
		// 调色板可重建像素，不得跳过）
		if (aImage == nullptr || (aImage->mBits == nullptr && aImage->mColorIndices == nullptr)
			|| aImage->mD3DData != nullptr)
		{
			continue;  // 排队期间被 purge/重建/抢先上传——跳过
		}
		// v4 静态槽位：注册表命中的图落在恒等位 staticBase+符号号（编译
		// 记录烘焙的最终下标）；未命中（首绘合成图等）走动态区慢路
		const uint32_t aSymbol = aEntry.mSymbol;
		if (aSymbol != 0)
			gSexyAppBase->mDDInterface->mRenderInterface->CreateImageTextureStatic(aImage, aSymbol);
		else
			gSexyAppBase->mDDInterface->mRenderInterface->CreateImageTexture(aImage);
		aMade++;
		if (aTimer.GetDuration() >= theBudgetMs)
			return aMade;
	}
}

// 装载期兜底清扫（用户裁决"任何一个资源在加载阶段不被跳过"）：队列
// 排空只保证"已入队条目被消费"（可被消费为跳过），未入队的已解码图对
// 队列不可见——典型=装载线程绑定 reanim 定义时懒解码的图像资源。本清扫
// 对资源槽全表核验：每张"已解码（有位图）但不在 GPU（无 D3DData）"
// 的图就地补传。【仅主线程调用】——内走 Vulkan 上传，装载线程调用=与主
// 线程泵并发的跨线程竞态（2026-10-07 焦散案同型，校验层 THREADING
// ERROR 定罪过一次）。屏幕画布/离屏合成目标/字体图集不在资源槽
//（各自路径，按设计）。
int TodWarmFinalSweep()
{
	if (gSexyAppBase == nullptr || gSexyAppBase->mResourceManager == nullptr
		|| gSexyAppBase->mDDInterface == nullptr || gSexyAppBase->mDDInterface->mRenderInterface == nullptr)
		return 0;
	RenderInterface* aRI = gSexyAppBase->mDDInterface->mRenderInterface;
	int aSwept = 0;
	for (auto* aResource : gSexyAppBase->mResourceManager->mResourceSlots)
	{
		if (aResource == nullptr || aResource->mType != ResourceManager::ResType_Image)
			continue;
		auto* aRes = static_cast<ResourceManager::ImageRes*>(aResource);
		Sexy::MemoryImage* aImage = aRes->mImage;
		if (aImage && aImage->mD3DData)
		{
			aImage->PurgeBits();
			continue;
		}
		// 像素来源判定同 TodQueueTextureWarm（Palletize 图 mBits==nullptr
		// 但调色板可重建像素，清扫不得跳过）；0 尺寸空图跳过。
		if (aImage == nullptr || (aImage->mBits == nullptr && aImage->mColorIndices == nullptr)
			|| aImage->mWidth <= 0 || aImage->mHeight <= 0)
			continue;
		aImage->mPurgeBits = true;
		const uint32_t aSymbol = aRes->mImageSymbol;
		if (aSymbol != 0)
			aRI->CreateImageTextureStatic(aImage, aSymbol);
		else
			aRI->CreateImageTexture(aImage);
		++aSwept;
	}
	return aSwept;
}

// 主线程阻塞排干+全表清扫（2026-10-09 用户规格"装载=全量物化，首绘路径不得
// 存在；加载界面可以卡住不放行"）：循环"不限预算泵 + 全表清扫"直到队列空且
// 清扫 0 补传才返回。调用点=关卡放行门（LawnApp::StartPlaying）。
// 【仅主线程】——内部走 Vulkan 上传，装载线程调用=与主线程泵并发的跨线程
// 竞态（2026-10-07 焦散案同型）。非主线程调用直接空转返回（安全）。
int TodWarmDrainAll()
{
	if (gSexyAppBase == nullptr || gSexyAppBase->mDDInterface == nullptr
		|| gSexyAppBase->mDDInterface->mRenderInterface == nullptr)
		return 0;
#ifdef _WIN32
	const NativeThreadId aCurrentThread = GetCurrentThreadId();
#else
	const NativeThreadId aCurrentThread = std::this_thread::get_id();
#endif
	if (gSexyAppBase->mPrimaryThreadId != NativeThreadId{} && aCurrentThread != gSexyAppBase->mPrimaryThreadId)
		return 0;
	int aTotal = 0;
	for (;;)
	{
		aTotal += TodWarmPump(0x7fffffff);
		if (!TodWarmQueueEmpty())
			continue;  // 泵期间新入队（防御；同线程下不可达）
		const int aSwept = TodWarmFinalSweep();
		aTotal += aSwept;
		if (aSwept == 0 && TodWarmQueueEmpty())
			break;
	}
	return aTotal;
}

bool ResourceManager::TodLoadResources(ResourceGroupId theGroup)
{
	if (IsGroupLoaded(theGroup))
		return true;

	StartLoadResources(theGroup);
	while (!gSexyAppBase->mShutdown && TodLoadNextResource());
	if (gSexyAppBase->mShutdown)
		return false;

	if (HadError())
	{
		gSexyAppBase->ShowResourceError(true);
		return false;
	}

	if (gExtractResourcesByGroup && !gExtractResourcesByGroup(this, theGroup))
	{
		gSexyAppBase->ShowResourceError(true);
		return false;
	}

	SetGroupLoaded(theGroup);
	// 声明图入预热队列（装载线程/主线程皆经此；动态图走 AddImageToMap 钩子）
	if (const ResList* aGroup = GetResGroupList(theGroup))
		for (BaseRes* aRes : *aGroup)
			if (aRes->mType == ResType_Image)
				if (Sexy::MemoryImage* aImage = static_cast<ImageRes*>(aRes)->mImage)
					// 预热队列直接携带图像符号；物理路径不参与槽号识别。
					TodQueueTextureWarm(static_cast<ImageRes*>(aRes)->mImage, aRes->mImageSymbol);


	return true;
}

void TodAttachImageSlots()
{
    if (gSexyAppBase != nullptr && gSexyAppBase->mResourceManager != nullptr)
        gSexyAppBase->mResourceManager->AttachImageSlots(IMAGE_SYMBOL_ID_MAX);
}

Image* TodDefinitionLoadImageById(std::uint32_t theSymbolId)
{
    if (theSymbolId == 0 || theSymbolId > IMAGE_SYMBOL_ID_MAX ||
        gSexyAppBase == nullptr || gSexyAppBase->mResourceManager == nullptr)
        return nullptr;
    auto* manager = gSexyAppBase->mResourceManager;
    SharedImageRef image = manager->LoadImageBySlot(theSymbolId);
    if (static_cast<Image*>(image) != nullptr)
    {
        TodQueueTextureWarm(image, theSymbolId);
    }
    return static_cast<Image*>(image);
}

_Font* TodDefinitionLoadFontById(std::uint32_t theSymbolId)
{
    if (theSymbolId != 1 || gSexyAppBase == nullptr || gSexyAppBase->mResourceManager == nullptr)
        return nullptr;
    return gSexyAppBase->mResourceManager->LoadFontByResourceSlot(
        static_cast<unsigned>(ResourceId::FONT_BRIANNETOD32_ID));
}

std::uint32_t TodImageSymbolRegistryHash()
{
    return IMAGE_SYMBOL_REGISTRY_CRC;
}

std::uint32_t TodFontSymbolRegistryHash()
{
    // Fingerprint of the compiler's existing one-entry font symbol sidecar.
    return 0xA4345491u;
}

bool TodLoadNextResource()
{
	return gSexyAppBase->mResourceManager->TodLoadNextResource();
}

//0x513330
bool ResourceManager::TodLoadNextResource()
{
	if (HadError() || mCurResGroupList == nullptr)
		return false;
	SexyGetTickCount();
	TodHesitationTrace("preres");

	while (mCurResGroupListItr != mCurResGroupList->end())
	{
		BaseRes* aRes = *mCurResGroupListItr;
		if (aRes->mFromProgram)
		{
			mCurResGroupListItr++;
			continue;
		}

		switch (aRes->mType)
		{
		case ResType_Image:
		{
			ImageRes* anImageRes = (ImageRes*)aRes;
			if ((DDImage*)anImageRes->mImage != nullptr)
			{
				mCurResGroupListItr++;
				continue;
			}

			break;
		}

		case ResType_Sound:
		{
			SoundRes* aSoundRes = (SoundRes*)aRes;
			if (aSoundRes->mSoundId != -1)
			{
				mCurResGroupListItr++;
				continue;
			}

			break;
		}

		case ResType_Font:
		{
			FontRes* aFontRes = (FontRes*)aRes;
			if (aFontRes->mFont != nullptr)
			{
				mCurResGroupListItr++;
				continue;
			}

			break;
		}
		}

		if (!LoadNextResource())
			break;

		SexyGetTickCount();
		TodHesitationTrace("Loading: '%s'", aRes->mPath.c_str());
		TodHesitationTrace("resource '%s'", aRes->mPath.c_str());
		return true;
	}

	return false;
}

bool TodFindImagePath(Image* theImage, std::string* thePath)
{
	return gSexyAppBase->mResourceManager->FindImagePath(theImage, thePath);
}

// @Patoke implemented
bool TodFindFontPath(_Font* theFont, std::string* thePath) {
	return gSexyAppBase->mResourceManager->FindFontPath(theFont, thePath);
}

bool ResourceManager::FindFontPath(_Font* theFont, std::string* thePath)
{
	const auto matches = [&](BaseRes* resource) {
		if (resource == nullptr || resource->mType != ResType_Font ||
			static_cast<FontRes*>(resource)->mFont != theFont)
			return false;
		*thePath = resource->mPath;
		return true;
	};
	for (auto* resource : mResourceSlots)
		if (matches(resource)) return true;
	return false;
}

bool ResourceManager::FindImagePath(Image* theImage, std::string* thePath)
{
	const auto matches = [&](BaseRes* resource) {
		if (resource == nullptr || resource->mType != ResType_Image ||
			static_cast<Image*>(static_cast<ImageRes*>(resource)->mImage) != theImage)
			return false;
		*thePath = resource->mPath;
		return true;
	};
	for (auto* resource : mResourceSlots)
		if (matches(resource)) return true;
	return false;
}

TodAllocator gGlobalAllocators[MAX_GLOBAL_ALLOCATORS];  //0x6A7B68
int gNumGlobalAllocators = 0;  //[0x6A9EFC]

//0x513570
TodAllocator* FindGlobalAllocator(int theSize)
{
	if (gNumGlobalAllocators < 0 || gNumGlobalAllocators > MAX_GLOBAL_ALLOCATORS)
		throw std::logic_error("TodAllocator: invalid global registry count");
	for (int i = 0; i < gNumGlobalAllocators; i++)
	{
		if (gGlobalAllocators[i].mItemSize == theSize)
		{
			return &gGlobalAllocators[i];
		}
	}

	if (gNumGlobalAllocators == MAX_GLOBAL_ALLOCATORS)
		throw std::length_error("TodAllocator: global allocator registry is full");
	TodAllocator aCandidate;
	aCandidate.Initialize(16, theSize);
	aCandidate.Grow(); // 1073 prepares the first block before returning a new pool.
	TodAllocator* pAllocator = &gGlobalAllocators[gNumGlobalAllocators];
	*pAllocator = aCandidate;
	++gNumGlobalAllocators;
	return pAllocator;
}

//0x513600
void FreeGlobalAllocators()
{
	for (int i = 0; i < gNumGlobalAllocators; i++)
	{
		gGlobalAllocators[i].FreeAll();
	}

	gNumGlobalAllocators = 0;
}

//0x513660
SexyString TodReplaceString(const SexyString& theText, UiTextPlaceholder thePlaceholder, const SexyString& theStringToSubstitute)
{
	SexyString aFinalString = theText;
	const auto aControl = UiTextPlaceholderToken(thePlaceholder);
	size_t aPos = aFinalString.find(aControl);
	if (aPos != SexyString::npos)
	{
		SexyString aFinalStringToSubstitute = EntityTranslate(theStringToSubstitute);
		aFinalString.replace(aPos, aControl.size(), aFinalStringToSubstitute);
	}

	return aFinalString;
}

//0x513720
SexyString TodReplaceNumberString(const SexyString& theText, UiTextPlaceholder thePlaceholder, int theNumber)
{
	SexyString aFinalString = theText;
	const auto aControl = UiTextPlaceholderToken(thePlaceholder);
	size_t aPos = aFinalString.find(aControl);
	if (aPos != SexyString::npos)
	{
		SexyString aNumberString = StrFormat(("%d"), theNumber);
		aFinalString.replace(aPos, aControl.size(), aNumberString);
	}

	return aFinalString;
}

//0x5137F0
// GOTY @Patoke: 0x51DB00
bool TodIsPointInPolygon(const SexyVector2* thePolygonPoint, int theNumberPolygonPoints, const SexyVector2& theCheckPoint)
{
	TOD_ASSERT(theNumberPolygonPoints >= 3);

	for (int i = 0; i < theNumberPolygonPoints; i++)
	{
		const SexyVector2& cur = thePolygonPoint[i];
		const SexyVector2& nex = thePolygonPoint[i == theNumberPolygonPoints - 1 ? 0 : i + 1];

		SexyVector2 u = (nex - cur).Perp();
		SexyVector2 v = theCheckPoint - cur;
		if (u.Dot(v) < 0)
			return false;
	}
	return true;
}

int TodVsnprintf(char* theBuffer, int theSize, const char* theFormat, va_list theArgList)
{
	if (!theBuffer || theSize <= 0)
		throw std::invalid_argument("TodVsnprintf: destination must have positive capacity");
	va_list copy;
	va_copy(copy, theArgList);
	const int aCount = std::vsnprintf(theBuffer, static_cast<size_t>(theSize), theFormat, copy);
	va_end(copy);
	if (aCount < 0)
		throw std::runtime_error("TodVsnprintf: printf encoding or format error");
	// Return characters actually stored, excluding NUL, as callers expect.
	// _vsnprintf returned the full capacity without a terminator on exact fits.
	return std::min(aCount, theSize - 1);
}

int TodSnprintf(char* theBuffer, int theSize, const char* theFormat, ...)
{
	va_list argList;
	va_start(argList, theFormat);
	try
	{
		const int aCount = TodVsnprintf(theBuffer, theSize, theFormat, argList);
		va_end(argList);
		return aCount;
	}
	catch (...)
	{
		va_end(argList);
		throw;
	}
}
