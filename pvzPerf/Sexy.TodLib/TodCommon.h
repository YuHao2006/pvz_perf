#pragma once
// ConstEnums.h=全项目共享枚举层（Shared，2026-10-07 定性：Framework/TodLib/Lawn
// 三层并用，物理居根目录；本头原经 LawnCommon.h 传递取得，传递链拆除后直取）
#include "ConstEnums.h"
#include "NumericTextControls.h"
#include <stdlib.h>
#include <cmath>
#include <cfloat>
#include <cstdint>
#include "TodArray.h"
#include "SexyAppFramework/Common.h"
#include "misc/ResourceManager.h"

struct TodAllocator;
namespace Sexy
{
	class Graphics;
	class SexyMatrix;
	class SexyMatrix3;
	class SexyVector2;
	struct TextureSource;
	struct TextureRegion;
};
//using namespace std;
using namespace Sexy;

#define DEG_TO_RAD(deg) ((deg) * 0.017453292f)
#define RAD_TO_DEG(rad) ((rad) * 57.29578f)

// #################################################################################################### //

struct TodWeightedArray
{
    intptr_t mItem;
	int mWeight;
};

struct TodWeightedGridArray
{
	int mX;
	int mY;
	int mWeight;
};

class TodSmoothArray
{
public:
	int			mItem;
	float		mWeight;
	float		mLastPicked;
	float		mSecondLastPicked;
};

intptr_t				TodPickFromWeightedArray(const TodWeightedArray* theArray, int theCount);
TodWeightedArray*		TodPickArrayItemFromWeightedArray(const TodWeightedArray* theArray, int theCount);
TodWeightedGridArray*	TodPickFromWeightedGridArray(const TodWeightedGridArray* theArray, int theCount);
void					TodUpdateSmoothArrayPick(TodSmoothArray* theArray, int theCount, int thePickIndex);
int						TodPickFromSmoothArray(TodSmoothArray* theArray, int theCount);

// #################################################################################################### //

/*inline*/ bool			TodLoadResources(ResourceGroupId theGroup);
/*inline*/ bool			TodLoadNextResource();
// GPU 纹理预热队列（2026-10-07 用户架构"启动全量装载+流式上传+CPU 不留
// 位图"）：已解码图入队（持 SharedImageRef 保命；装载/主线程皆可调），
// 主线程 TodWarmPump 预算内逐张 CreateImageTexture（staging 自动攒批，
// 位图上传即弃）。返回本拍上传张数。
void					TodQueueTextureWarm(SharedImageRef theRef);
int						TodWarmPump(int theBudgetMs);
// 预热队列是否已清空（装载屏期主线程泵持续排干）
bool					TodWarmQueueEmpty();
// Call after joining the loader, before destroying shared-image cache entries.
void					TodWarmDispose();
// 排水硬保证（装载线程等待用）：队列空 && 主线程清扫净（双条件——
// "装载条完成=全部已解码资源都在 GPU"）
bool					TodWarmDrained();
// 主线程清扫返回 0 时置位（与 TodWarmDrained 配对）
void					TodWarmMarkSweepClean();
// Main-thread sweep of finalized shared-cache images. Returns uploads, or -1
// while a shared initializer is active; only 0 establishes cache residency.
int						TodWarmFinalSweep();
// 主线程阻塞排干+全表清扫【仅主线程】（2026-10-09 用户规格"装载=全量
// 物化，首绘路径不得存在"）：循环不限预算泵+清扫直到队列空且清扫 0 补传
// 才返回。调用点=关卡放行门（LawnApp::StartPlaying）；非主线程调用空转。
int						TodWarmDrainAll();
_Font*					TodLoadCreditsFont();

// #################################################################################################### //

// Curve dispatch is validated offline; runtime reads the public constant table.
using TodCurveEvalFn = float (*)(double theProgress, float thePositionStart, float thePositionEnd);
extern const TodCurveEvalFn kCurveEvals[14];

// P5-⑥ 快速三角（见 TodCommon.cpp 实现注释）；域 [-π,π]
#include "SexyAppFramework/misc/FastMath.h"
// Host shutdown callback, injected by main.cpp without a LawnApp dependency.
extern bool (*gAppCloseRequest)();       // 同批下放（原 LawnApp.h，0x69E6A0）

namespace Curves  // 曲线扭曲原语：限定名访问（Curves::Quad），不污染命名池。
{                 // 定义唯一定义于 TodCommon.cpp（原 1073 地址 0x5118C0/0x5118F0/0x511970/0x5119B0）
double Identity(double theTime);
double Quad(double theTime);
//0x5118C0
double S(double theTime);
//0x5118F0
//0x511970

// 全域求值（含钳制）：t≤0 → 起点；t≥1 → 回摆族回起点/其余到终点；中段 warp 插值。
// 钳制不可省略：命名曲线本身统一处理端点。2026-10-02
// 命名曲线曾退化为裸插值 (b-a)*warp(t)+a，t>1 线性外推——无尽深处旗帜数使
// PickZombieType 的 t=(flags-10)/40 超过 1，普僵权重外推成负值，加权挑选负总和
// → TodPickArrayItemFromWeightedArray 返回 nullptr → 解引用崩溃。端点行为在
// TodCommon.cpp 唯一定义，命名曲线与 kCurveEvals 共用。
}  // namespace Curves
// 曲线命名函数（t, 起点, 终点）→ 值：替代枚举的调用点形态（Curves::EaseInOut(a, b, t)
// 直接调用；入表/传参时函数名自动退化为指针）。声明在此，定义唯一定义于 TodCommon.cpp
// ——单一符号单一地址：2026-10-02 曾用 inline constexpr 指针变量承载 lambda 闭包，
// 跨 TU 地址不一致致 FloatTrackIsSet 误判默认轨"已设置"→出土类零粒子（旗标兜底
// 已撤除，判定恢复指针直比——实现若回迁头文件会立刻复发、问题直接暴露）。改版加
// 曲线：.cpp 的 namespace Curves 写 warp 原语与命名函数 + kCurveEvals 加别名。
// 复核实验（同日）：干净增量构建下 inline-lambda 地址本应跨 TU 一致（链接器去重
// 正常）——原事故成因实为混合代际 obj（陈旧缓存 ODR）；.cpp 单一定义把该类失败
// 从"依赖构建卫生"变为"结构上不可能"。
namespace Curves
{
	// 恒定（任何时间返回起点，含 t≥1——装载记录恒 0 区间与端点无差异）
	float Constant(double theTime, float thePositionStart, float thePositionEnd);
	// 线性（非回摆）
	float Linear(double theTime, float thePositionStart, float thePositionEnd);
	// 二次缓入（非回摆）
	float EaseIn(double theTime, float thePositionStart, float thePositionEnd);
	// 二次缓出（非回摆）
	float EaseOut(double theTime, float thePositionStart, float thePositionEnd);
	// 三次缓入缓出（双重 smoothstep，非回摆）
	float EaseInOut(double theTime, float thePositionStart, float thePositionEnd);
	// 三次缓入缓出（弱，非回摆）
	float EaseInOutWeak(double theTime, float thePositionStart, float thePositionEnd);
	// 快入快出（双重逆二次 S，非回摆）
	float FastInOut(double theTime, float thePositionStart, float thePositionEnd);
	// 快入快出（弱，非回摆）
	float FastInOutWeak(double theTime, float thePositionStart, float thePositionEnd);
	// 弹跳（三角波，t=1 回到 0 → 回摆族）
	float Bounce(double theTime, float thePositionStart, float thePositionEnd);
	// 弹跳（尖形中段，回摆族）
	float BounceFastMiddle(double theTime, float thePositionStart, float thePositionEnd);
	// 弹跳（罩形中段，回摆族）
	float BounceSlowMiddle(double theTime, float thePositionStart, float thePositionEnd);
	// 正弦波（t=1 回到 0 → 回摆族）
	float SinWave(double theTime, float thePositionStart, float thePositionEnd);
	// 缓入缓出正弦波（t=1 回到 0 → 回摆族）
	float EaseSinWave(double theTime, float thePositionStart, float thePositionEnd);
}

// Generic numeric ranges: distance, position, counts or normalized progress.
float					TodAnimateCurveFloat(double theRangeStart, double theRangeEnd, double theValue, float thePositionStart, float thePositionEnd, TodCurveEvalFn theCurve);
int						TodAnimateCurve(double theRangeStart, double theRangeEnd, double theValue, int thePositionStart, int thePositionEnd, TodCurveEvalFn theCurve);
// Time ranges use integer nanoseconds. Subtraction precedes conversion to a
// local double ratio; absolute clock epochs never pass through floating point.
float					TodAnimateCurveNs(std::int64_t theStartNs, std::int64_t theEndNs, std::int64_t theTimeNs, float thePositionStart, float thePositionEnd, TodCurveEvalFn theCurve);
int						TodAnimateCurveNs(std::int64_t theStartNs, std::int64_t theEndNs, std::int64_t theTimeNs, int thePositionStart, int thePositionEnd, TodCurveEvalFn theCurve);

/*inline*/ void			TodScaleTransformMatrix(SexyMatrix3& m, float x, float y, float theScaleX, float theScaleY);
void					TodScaleRotateTransformMatrix(SexyMatrix3& m, float x, float y, float rad, float theScaleX, float theScaleY);
/*inline*/ void			SexyMatrix3Translation(SexyMatrix3& m, float x, float y);
void					SexyMatrix3Inverse(const SexyMatrix3& m, SexyMatrix3& r);  // r = m ^ -1
void					SexyMatrix3Multiply(SexyMatrix3& m, const SexyMatrix3& l, const SexyMatrix3& r);  // m = l × r
bool					TodIsPointInPolygon(const SexyVector2* thePolygonPoint, int theNumberPolygonPoints, const SexyVector2& theCheckPoint);

void					TodDrawString(Graphics* g, const SexyString& theText, int thePosX, int thePosY, _Font* theFont, const Color& theColor, DrawStringJustification theJustification);
void					TodDrawStringMatrix(Graphics* g, const _Font* theFont, const SexyMatrix3& theMatrix, const SexyString& theString, const Color& theColor);
void					TodDrawImageScaledF(Graphics* g, Image* theImage, float thePosX, float thePosY, float theScaleX, float theScaleY);
void					TodDrawImageCenterScaledF(Graphics* g, Image* theImage, float thePosX, float thePosY, float theScaleX, float theScaleY);
void					TodDrawImageRectF(Graphics* g, Image* theImage, float thePosX, float thePosY, const Rect& theSrcRect);
void					TodDrawImageRectScaled(Graphics* g, Image* theImage, int thePosX, int thePosY, const Rect& theSrcRect, float theScaleX, float theScaleY);
void					TodDrawImageRectScaledF(Graphics* g, Image* theImage, float thePosX, float thePosY, const Rect& theSrcRect, float theScaleX, float theScaleY);
void					TodDrawImageRectCenterScaledF(Graphics* g, Image* theImage, float thePosX, float thePosY, const Rect& theSrcRect, float theScaleX, float theScaleY);
void					TodBltMatrix(Graphics* g, Image* theImage, const SexyMatrix3& theTransform, const Rect& theClipRect, const Color& theColor, int theDrawMode, const Rect& theSrcRect);
void					TodBltMatrix(Graphics* g, const TextureSource& texture, const SexyMatrix3& transform, const Rect& clip, const Color& color, int drawMode, const TextureRegion& source);
void					TodMarkImageForSanding(Image* theImage);
void					FixPixelsOnAlphaEdgeForBlending(Image* theImage);
void					Tod_SWTri_AddAllDrawTriFuncs();

SexyString				TodReplaceString(const SexyString& theText, UiTextPlaceholder thePlaceholder, const SexyString& theStringToSubstitute);
SexyString				TodReplaceNumberString(const SexyString& theText, UiTextPlaceholder thePlaceholder, int theNumber);
int						TodSnprintf(char* theBuffer, int theSize, const char* theFormat, ...);
int						TodVsnprintf(char* theBuffer, int theSize, const char* theFormat, va_list theArgList);

TodAllocator*			FindGlobalAllocator(int theSize);
void                    FreeGlobalAllocators();


//====================================================================================================//
/*inline*/ int			RandRangeInt(int theMin, int theMax);
/*inline*/ float		RandRangeFloat(float theMin, float theMax);
inline char				ClampByte(char theNum, char theMin, char theMax)			{ return theNum <= theMin ? theMin : theNum >= theMax ? theMax : theNum; }
inline int				ClampInt(int theNum, int theMin, int theMax)				{ return theNum <= theMin ? theMin : theNum >= theMax ? theMax : theNum; }
inline float			ClampFloat(float theNum, float theMin, float theMax)		{ return theNum <= theMin ? theMin : theNum >= theMax ? theMax : theNum; }
inline float			Distance2D(float x1, float y1, float x2, float y2)			{ return sqrt((x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1)); }
inline float			FloatLerp(float theStart, float theEnd, float theFactor)	{ return theStart + theFactor * (theEnd - theStart); }
inline int				FloatRoundToInt(float theFloatValue)						{ return theFloatValue > 0 ? theFloatValue + 0.5f : theFloatValue - 0.5f; }
inline bool				FloatApproxEqual(float theFloatVal1, float theFloatVal2)	{ return fabs(theFloatVal1 - theFloatVal2) < FLT_EPSILON; }

Color					GetFlashingColor(uint32_t theCounter, int theFlashTime);
Color					GetFlashingColorNs(std::uint64_t theTimeNs, std::uint64_t thePeriodNs);
/*inline*/ int			ColorComponentMultiply(int theColor1, int theColor2);
Color					ColorsMultiply(const Color& theColor1, const Color& theColor2);
Color					ColorAdd(const Color& theColor1, const Color& theColor2);

inline void				SetBit(uint& theNum, int theIdx, bool theValue = true)		{ if (theValue) theNum |= 1 << theIdx; else theNum &= ~(1 << theIdx); }
inline bool				TestBit(uint theNum, int theIdx)							{ return theNum & (1 << theIdx); }
//#define SetBit(num, idx, val) { if (val) (num) |= 1 << (idx); else (num) &= ~(1 << (idx)); }
//#define TestBit(num, idx) ((num) & (1 - (idx)))
