#pragma once
#include "misc/TimeCounter.h"
#include "ParticleClock.h"

#include "generated/ParticleEmitterName.h"
#include <cstddef>
#include <array>
#include <atomic>
#include <memory>
#include <span>
#include "DataArray.h"
#include "DefinitionImageRegion.h"
#include "graphics/TextureRegion.h"
#include "misc/SexyVector.h"
namespace Sexy
{
	class Graphics;
};
//using namespace std;
using namespace Sexy;

#define MAX_PARTICLES_SIZE 900
#define MAX_PARTICLE_FIELDS 4

// ######################################################################################################################################################
// ############################################################# 以下为粒子系统定义相关内容 #############################################################
// ######################################################################################################################################################

enum ParticleFlags
{
    PARTICLE_RANDOM_LAUNCH_SPIN,        // 随机发射旋转，指定粒子在发射时使用 [0, 2π] 内随机的初始旋转角度
    PARTICLE_ALIGN_LAUNCH_SPIN,         // 对齐发射角度，指定粒子在发射时的初始旋转角度与发射方向一致（优先级低于随机发射旋转）
    PARTICLE_ALIGN_TO_PIXELS,           // 对齐至像素，指定粒子渲染时的坐标四舍五入地对齐至整数像素值
    PARTICLE_SYSTEM_LOOPS,              // 系统循环，指定发射器在生命周期结束后立即回到周期起始的时刻
    PARTICLE_PARTICLE_LOOPS,            // 粒子循环，指定粒子在生命周期结束后立即回到周期起始的时刻
    PARTICLE_PARTICLES_DONT_FOLLOW,     // 粒子不跟随，指定当粒子发射器的位置移动时，已发射的粒子不随之移动
    PARTICLE_RANDOM_START_TIME,         // 随机初始时刻，指定粒子初始时的存在时间为 0 至最大持续时间之间的随机值
    PARTICLE_DIE_IF_OVERLOADED,         // 过载限制，指定在粒子数量过多时，该发射器所属的粒子系统无法被创建
    PARTICLE_ADDITIVE,                  // 叠加模式，指定粒子渲染时固定使用叠加（Additive）模式
    PARTICLE_FULLSCREEN,                // 全屏模式，指定粒子在渲染时改为填充一个屏幕大小的矩形
    PARTICLE_SOFTWARE_ONLY,             // 仅软件渲染，指定粒子仅在未开启 3D 加速时可被渲染
    PARTICLE_HARDWARE_ONLY              // 仅硬件渲染，指定粒子仅在已开启 3D 加速时可被渲染
};

enum ParticleFieldType
{
    FIELD_INVALID,
    FIELD_FRICTION,                     // 摩擦力场：该场内粒子的速度按一定比例不断衰减
    FIELD_ACCELERATION,                 // 加速度场：该场内粒子以一定加速度做加速运动
    FIELD_ATTRACTOR,                    // 弹性力场：该场内粒子加速度的大小和方向均受到粒子与发射器之间距离大小的影响
    FIELD_MAX_VELOCITY,                 // 限速场：该场内粒子速度的大小不能超过一定的上限值
    FIELD_VELOCITY,                     // 匀速场：该场内粒子速度的大小总是为一给定值
    FIELD_POSITION,                     // 定位场：该场内粒子的位置总是为一给定值
    FIELD_SYSTEM_POSITION,              // 系统定位场：仅发射器可用，该场内发射器的位置总是为一给定值
    FIELD_GROUND_CONSTRAINT,            // 地面限制：粒子的纵向位置不能低于地面，且接触地面时会触发弹起效果
    FIELD_SHAKE,                        // 震动：粒子的坐标会有随机 -1.0 到 +1.0 的偏移，每帧独立计算
    FIELD_CIRCLE,                       // 引力场：该场内粒子围绕发射器中心做圆周运动（考虑误差，实为螺线运动）
    FIELD_AWAY,                         // 斥力场：该场内粒子沿径向不断远离发射器中心
    PARTICLE_FIELD_COUNT
};  // 粒子场见 UpdateParticleField；系统定位场由 SampleSystemPosition 按当前相位求值。

// ################################################################################
// ▲ 以下粒子系统定义相关的各类型的实例与 XML 中的格式的对应关系示例简图
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// <Emitter>                                                         —
//                       ↓←Node→↓                                ↑
//     <SpawnRate>[.5 2] [2.5 4.5],40 [5 10]</SpawnRate>    TodEmitterDefinition
//     ↑←      FloatParameterTrack::mNodes        →↑             ↓
// </Emitter>                                                        —
// ################################################################################
// 【!】XML 中没有给出的定义项，将会在读取结束后被赋予该项的默认值

// ====================================================================================================
// ★ 【浮点参数轨道节点】
// ----------------------------------------------------------------------------------------------------
// 每个节点描述属性数值随时间变化的一个阶段。
// ====================================================================================================
// Node times are evaluated from exact source fractions at compile time.
// Runtime keeps the same double values without repeating invariant division.
class FloatParameterTrackNode
{
public:
    double                      mTime;
    float                       mLow;
    float                       mHigh;
    std::int32_t                mCurveType;
    std::int32_t                mDistribution;
};
static_assert(sizeof(FloatParameterTrackNode) == 24);

// ====================================================================================================
// ★ 【浮点参数轨道】
// ----------------------------------------------------------------------------------------------------
// 每条轨道描述发射器的一种属性的数值随时间的变化规律和取值范围。
// ====================================================================================================
class FloatParameterTrack
{
public:
    FloatParameterTrackNode*    mNodes;
    int                         mCountNodes;
};

// ====================================================================================================
// ★ 【粒子场】
// ----------------------------------------------------------------------------------------------------
// 发射器中粒子运动的物理环境。多个粒子场可以叠加存在，最多叠加 4 个。
// ====================================================================================================
class ParticleField
{
public:
    ParticleFieldType           mFieldType;                     // 场的类型，决定了场对粒子运动的影响方式
    FloatParameterTrack         mX;                             // 场在水平方向（横向）上对粒子的影响
    FloatParameterTrack         mY;                             // 场在竖直方向（纵向）上对粒子的影响
};

struct EmitterFieldArray
{
public:
	ParticleField* Fields;
	int count;
};

// ====================================================================================================
// ★ 【发射器定义】
// ----------------------------------------------------------------------------------------------------
// 粒子发射器的定义数据描述了其各种行为的参数的变化规律和范围。
// ====================================================================================================
class TodEmitterDefinition
{
public:
    // Index into every appearance row; all variants share this emitter behavior.
    std::uint32_t               mImageRectOffset = 0;
    int                         mImageRectCount = 0;
    int                         mImageFrames;
    int                         mAnimated;
    int                         mParticleFlags;
    EmitterType                 mEmitterType;
    ParticleEmitterName         mNameId = ParticleEmitterName::unnamed;
    FloatParameterTrack         mSystemDuration;
    FloatParameterTrack         mCrossFadeDuration;
    FloatParameterTrack         mSpawnRate;
    FloatParameterTrack         mSpawnMinActive;
    FloatParameterTrack         mSpawnMaxActive;
    FloatParameterTrack         mSpawnMaxLaunched;
    FloatParameterTrack         mEmitterRadius;
    FloatParameterTrack         mEmitterOffsetX;
    FloatParameterTrack         mEmitterOffsetY;
    FloatParameterTrack         mEmitterBoxX;
    FloatParameterTrack         mEmitterBoxY;
    FloatParameterTrack         mEmitterSkewX;
    FloatParameterTrack         mEmitterSkewY;
    FloatParameterTrack         mEmitterPath;
    FloatParameterTrack         mParticleDuration;
    FloatParameterTrack         mLaunchSpeed;
    FloatParameterTrack         mLaunchAngle;
    FloatParameterTrack         mSystemRed;
    FloatParameterTrack         mSystemGreen;
    FloatParameterTrack         mSystemBlue;
    FloatParameterTrack         mSystemAlpha;
    FloatParameterTrack         mSystemBrightness;
    EmitterFieldArray           mParticleFields;
    EmitterFieldArray           mSystemFields;
    FloatParameterTrack         mParticleRed;
    FloatParameterTrack         mParticleGreen;
    FloatParameterTrack         mParticleBlue;
    FloatParameterTrack         mParticleAlpha;
    FloatParameterTrack         mParticleBrightness;
    FloatParameterTrack         mParticleSpinAngle;
    FloatParameterTrack         mParticleSpinSpeed;
    FloatParameterTrack         mParticleScale;
    FloatParameterTrack         mParticleStretch;
    FloatParameterTrack         mCollisionReflect;
    FloatParameterTrack         mCollisionSpin;
    FloatParameterTrack         mClipTop;
    FloatParameterTrack         mClipBottom;
    FloatParameterTrack         mClipLeft;
    FloatParameterTrack         mClipRight;
    FloatParameterTrack         mAnimationRate;
    // IDT3 stores the first matching definition index in declaration order.
    int                         mOnDurationEmitterIndex = -1;
    // Generated render-channel mask; unset channels use their default values.
    unsigned                    mRenderTrackMask = 0;
};

// ====================================================================================================
// ★ 【粒子系统定义】
// ----------------------------------------------------------------------------------------------------
// 粒子系统的定义数据，是粒子系统中各个粒子发射器的定义数据的集合。
// ====================================================================================================
// 发射器选择 = 语料级 ParticleEmitterName 枚举（generated/ParticleEmitterName.h，
// 字典序、unnamed=0、尾部 top 哨兵）。Override* 双重载：精确 id / IDT 段
// [lo,hi) 左闭右开（All = [unnamed, top)）。2026-10-09 用户设计，
// 镜像 reanim 轨道名模式，运行时零字符串。

class TodParticleDefinition
{
public:
    Sexy::GpuTexture**          mTextures = nullptr;
    std::uint32_t               mVariantCount = 0;
    std::uint32_t               mImageRectCount = 0;
    const Sexy::TextureRegion*  mImageRects = nullptr;
    TodEmitterDefinition*       mEmitterDefs = nullptr;
    int                         mEmitterDefCount = 0;
    std::array<int, static_cast<std::size_t>(ParticleEmitterName::top)> mEmitterIndexByName = [] {
        std::array<int, static_cast<std::size_t>(ParticleEmitterName::top)> indices{};
        indices.fill(-1);
        return indices;
    }();
};

extern int gParticleDefCount;                       // [0x6A9F08]
extern TodParticleDefinition* gParticleDefArray;    // [0x6A9F0C]。于 LawnApp::LoadingThreadProc() 函数中读取并赋值
extern std::atomic<bool> gParticleAllDefinitionDataLoaded;

// ====================================================================================================
// ★ 【粒子参数】
// ----------------------------------------------------------------------------------------------------
// 用于描述一种粒子系统类型与该粒子系统的数据文件的文件名之间的对应关系。
// ====================================================================================================
class ParticleParams
{
public:
    ParticleEffect              mParticleEffect;
    const char*                 mParticleFileName;
};

void                            TodParticleLoadDefinitions(ParticleParams* theParticleParamArray, int theParticleParamArraySize);
void                            TodParticleFreeDefinitions();

extern ParticleParams gLawnParticleArray[(int)ParticleEffect::NUM_PARTICLES];  // 0x6A0FF0

// ######################################################################################################################################################
// ############################################################ 以下正式开始粒子系统相关声明 ############################################################
// ######################################################################################################################################################

enum ParticleSystemTracks
{
	TRACK_SPAWN_RATE,
	TRACK_SPAWN_MIN_ACTIVE,
	TRACK_SPAWN_MAX_ACTIVE,
	TRACK_SPAWN_MAX_LAUNCHED,
	TRACK_EMITTER_PATH,
	TRACK_SYSTEM_RED,
	TRACK_SYSTEM_GREEN,
	TRACK_SYSTEM_BLUE,
	TRACK_SYSTEM_ALPHA,
	TRACK_SYSTEM_BRIGHTNESS,
	NUM_SYSTEM_TRACKS
};

enum ParticleTracks
{
	TRACK_PARTICLE_RED,
	TRACK_PARTICLE_GREEN,
	TRACK_PARTICLE_BLUE,
	TRACK_PARTICLE_ALPHA,
	TRACK_PARTICLE_BRIGHTNESS,
	TRACK_PARTICLE_SPIN_SPEED,
	TRACK_PARTICLE_SPIN_ANGLE,
	TRACK_PARTICLE_SCALE,
	TRACK_PARTICLE_STRETCH,
	TRACK_PARTICLE_COLLISION_REFLECT,
	TRACK_PARTICLE_COLLISION_SPIN,
	TRACK_PARTICLE_CLIP_TOP,
	TRACK_PARTICLE_CLIP_BOTTOM,
	TRACK_PARTICLE_CLIP_LEFT,
	TRACK_PARTICLE_CLIP_RIGHT,
	TRACK_PARTICLE_ANIMATION_RATE,
	NUM_PARTICLE_TRACKS
};

class TodParticleSystem;
class TodParticleEmitter;
class TodParticle;
struct TodParticleRosterStorage;
class TodParticleData
{
public:
	DataArray<TodParticleSystem>	mParticleSystems;
	DataArray<TodParticleEmitter>	mEmitters;
	DataArray<TodParticle>			mParticles;

private:
	friend struct TodParticleRosterStorage;
	std::unique_ptr<TodParticleRosterStorage> mRosterStorage;

public:
	TodParticleData();
	~TodParticleData();
	TodParticleData(const TodParticleData&) = delete;
	TodParticleData& operator=(const TodParticleData&) = delete;

	void							Initialize();
	void							Dispose();
};

// Borrowed pools: data owns allocation and must outlive its holders and objects.
class TodParticleHolder
{
public:
	DataArray<TodParticleSystem>&	mParticleSystems;
	DataArray<TodParticleEmitter>&	mEmitters;
	DataArray<TodParticle>&			mParticles;

private:
	friend struct TodParticleRosterStorage;
	TodParticleData* const			mData;

public:
	explicit TodParticleHolder(TodParticleData* theData);
	TodParticleHolder(const TodParticleHolder&) = delete;
	TodParticleHolder& operator=(const TodParticleHolder&) = delete;

    TodParticleSystem*				AllocParticleSystemFromDef(float theX, float theY, int theRenderOrder, TodParticleDefinition* theDefinition, ParticleEffect theParticleEffect, std::uint32_t theVariant = 0);
    TodParticleSystem*				AllocParticleSystem(float theX, float theY, int theRenderOrder, ParticleEffect theParticleEffect, std::uint32_t theVariant = 0);
    /*inline*/ bool					IsOverLoaded();
};

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

class TodParticle
{
public:
	TodParticleEmitter*				mParticleEmitter;
	Sexy::TimeCounter								mParticleDuration;
	Sexy::TimeCounter								mParticleAge;
	std::int64_t					mParticleLastSampleAgeNs;
	std::int64_t					mAnimationElapsedNs;
	std::int64_t					mAnimationSampleIntegral; // fixed initial phase for constant rate; sampled integral otherwise
	std::uint32_t					mRandomSeed;
	SexyVector2						mVelocity;
	SexyVector2						mPosition;
	int								mImageFrame;
	float							mSpinPosition;
	float							mSpinVelocity;
	ParticleID						mCrossFadeParticleID;
	Sexy::TimeCounter								mCrossFadeDuration;
	float							mParticleInterp[ParticleTracks::NUM_PARTICLE_TRACKS];
	float							mParticleFieldInterp[MAX_PARTICLE_FIELDS][2];
	// Field-free motion samples one linear segment, never the last rounded
	// position. -1 elapsed means unbound (including births and field handoffs).
	double                          mLinearOriginX;
	double                          mLinearOriginY;
	std::int64_t                    mLinearElapsedNs;
	SexyVector2                     mLinearVelocity; // Segment rate; public mVelocity may select a new rate next update.
	SexyVector2                     mLinearLastPosition; // Detect public position edits without recomputing the old sample.
	double                          mLinearSpinOrigin; // Radians, excluding the authored absolute angle curve.
	double                          mLinearSpinRate; // Radians per source tick; shares mLinearElapsedNs.
	float                           mLinearLastSpin;
	std::uint32_t                   mLinearSpinActive; // 0 for sampled-rate/field motion, 1 for an anchored spin segment.
};

inline bool TodParticleConstantAnimationRate(const FloatParameterTrack& track)
{
    return track.mCountNodes == 1 && track.mNodes[0].mLow == track.mNodes[0].mHigh;
}

// Shared by drawing and explicit legacy save projection. Units are 10^-12 cycles.
inline std::int64_t TodParticleAnimationPhase(const TodParticle& particle, const FloatParameterTrack& track)
{
    if (!TodParticleConstantAnimationRate(track)) return particle.mAnimationSampleIntegral;
    const auto phase = ParticleClock::ConstantRatePhase(particle.mAnimationElapsedNs, track.mNodes[0].mLow);
    const auto anchored = (phase + particle.mAnimationSampleIntegral % ParticleClock::Cycle) %
        ParticleClock::Cycle;
    return anchored < 0 ? anchored + ParticleClock::Cycle : anchored;
}

class TodTriangleGroup;
class TodParticleEmitter
{
public:
	TodEmitterDefinition*			mEmitterDef;													//+0x0
	TodParticleSystem*				mParticleSystem;												//+0x4
	// 已退役（2026-10-04 P3 两步名册化；2026-10-02 TodList 模板退役后占位
	// 改裸字节）——原 TodList<ParticleID> mParticleList 的 32B 槽位以字节数
	// 组钉住，保 sizeof(208) 与 dat64 分段偏移（SaveGame.cpp 断言）；全部
	// 读写走下方 ParticleRoster* 方法（紧凑 uint16 槽位侧表，按发射器池槽
	// 位键控）
	uint8_t							mParticleListPad[32];											//+0x8
	std::int64_t					mSpawnRemainder; // 10^12 units per particle
	Sexy::SexyVector2				mSystemCenter;													//+0x1C
	int								mParticlesSpawned;												//+0x24
	Sexy::TimeCounter								mSystemAge;														//+0x28
	Sexy::TimeCounter								mSystemDuration;												//+0x2C
	std::int64_t					mEmissionElapsedNs; // total active emission time, independent of lifetime loops
	Sexy::SexyVector2				mExternalTarget; // input held until the next SystemMove event
	Sexy::SexyVector2				mExternalAppliedCenter; // last main-step input sample
	double							mSystemPositionOriginX; // Offset from external input, excluding authored system-position curves.
	double							mSystemPositionOriginY;
	std::uint32_t					mSystemPositionBound; // Historical saves bind from their saved center before advancing.
	bool							mDead;															//+0x38
	Sexy::Color						mColorOverride;													//+0x3C
	bool							mExtraAdditiveDrawOverride;										//+0x4C
	float							mScaleOverride;													//+0x50
	ParticleEmitterID				mCrossFadeEmitterID;											//+0x58
	Sexy::TimeCounter								mEmitterCrossFadeCountDown;										//+0x5C
	int								mFrameOverride;													//+0x60
	float							mTrackInterp[ParticleSystemTracks::NUM_SYSTEM_TRACKS];			//+0x64
	float							mSystemFieldInterp[MAX_PARTICLE_FIELDS][2];						//+0x8C

public:
	// ── 粒子名册（紧凑侧表口，2026-10-04 P3 第二步）──存裸池槽位号
	//（uint16，名册与粒子生死锁步）；**尾存倒序遍历**：index 0=最旧、
	// count-1=最新，倒序 i=count-1→0 = 原链表 AddHead 头→尾序逐字保持
	//（AddHead 的 O(1) 由尾插达成，零 memmove）；倒序迭代中删 i 号条目
	// 只 memmove 已遍历过的新侧段；容量 256/发射器，溢界拒生（对齐池满
	// "宁可丢不崩"——SpawnParticle 回滚等价池满路径）
	int								ParticleRosterCount() const;
	TodParticle*					ParticleRosterParticleAt(int theIndex) const;
	ParticleID						ParticleRosterIDAt(int theIndex) const;
	bool							ParticleRosterAdd(TodParticle* theParticle);
	int								ParticleRosterFind(TodParticle* theParticle) const;
	void							ParticleRosterRemoveAt(int theIndex);
	void							ParticleRosterClear();

	void							TodEmitterInitialize(float theX, float theY, TodParticleSystem* theSystem, TodEmitterDefinition* theEmitterDef);
	void							Update(std::uint64_t deltaNs);
	void							Update(std::uint64_t deltaNs, std::span<const ParticleID> theParticles);
	float							RandomFloat(float theMaximum);
	int								RandomInt(int theMaximum);
	void							Draw(Graphics* g);
	void							SystemMove(float theX, float theY);
	static bool						GetRenderParams(TodParticle* theParticle, ParticleRenderParams* theParams);
	void							DrawParticle(Graphics* g, TodParticle* theParticle, TodTriangleGroup* theTriangleGroup);
	void							UpdateSpawning(std::uint64_t deltaNs);
	bool							UpdateParticle(TodParticle* theParticle, std::uint64_t deltaNs);
	TodParticle*					SpawnParticle(int theIndex, int theSpawnCount);
	bool							CrossFadeParticle(TodParticle* theParticle, TodParticleEmitter* theToEmitter);
	void							CrossFadeEmitter(TodParticleEmitter* theToEmitter);

	// OnDuration uses the compiled target definition index.
	bool							CrossFadeParticleOnDuration(TodParticle* theParticle);
	// 按发射器 def 直取交叉淡入（分配实例 + 入表 + CrossFadeParticle）。
	bool							CrossFadeParticleToDef(TodParticle* theParticle, TodEmitterDefinition* theToEmitterDef);
	void							DeleteAll();
	void							UpdateParticleField(TodParticle* theParticle, ParticleField* theParticleField, double theParticleTimeValue, int theFieldIndex, double theDeltaTicks);
	void							SampleSystemPosition(double theTimeValue);
    /*inline*/ float				SystemTrackEvaluate(const FloatParameterTrack& theTrack, ParticleSystemTracks theSystemTrack) const;
	void							DeleteParticle(TodParticle* theParticle);
	// 下标化删除：更新循环/DeleteNonCrossFading 已知名册下标直入，省掉
	// Find 的 uint16 槽位线性探测与一次寻址（Find 本是流式比对、量级很小；
	// 交叉源级联删除下标未知，仍走 DeleteParticle）。
	void							DeleteParticleAt(int theRosterIndex, TodParticle* theParticle);
	void							DeleteNonCrossFading();
};
/*inline*/ float                    CrossFadeLerp(float theFrom, float theTo, bool theFromIsSet, bool theToIsSet, float theFraction);
void								RenderParticle(Graphics* g, TodParticle* theParticle, const Color& theColor, ParticleRenderParams* theParams, TodTriangleGroup* theTriangleGroup);

class TodParticleSystem
{
public:
	ParticleEffect					mEffectType;					//+0x0
    std::uint32_t                   mVariant = 0;
    TodParticleDefinition*			mParticleDef;					//+0x4
    TodParticleHolder*				mParticleHolder;				//+0x8
    // 已退役（2026-10-04 P3 名册连续化；2026-10-02 TodList 模板退役后占位
    // 改裸字节）——原 TodList<ParticleEmitterID> mEmitterList 的 32B 槽位以
    // 字节数组钉住，保 sizeof(72)/dat64 分段偏移（SaveGame.cpp:544 断言），
    // 全部读写走下方 EmitterRoster* 方法（紧凑 uint16 槽位侧表，按系统池
    // 槽位键控）
    uint8_t                         mEmitterListPad[32];			//+0xC
    bool							mDead;							//+0x1C
    bool							mIsAttachment;					//+0x1D
    int								mRenderOrder;					//+0x20
    bool							mDontUpdate;					//+0x24
    std::uint32_t                   mRandomState;

public:
    TodParticleSystem();
    ~TodParticleSystem();

    // ── 发射器名册（紧凑侧表口，2026-10-04 P3）──存裸池槽位号（uint16，
    // 名册与发射器生死锁步：入册先于返回、清册先于池 free——无需世代键，
    // 世代句柄照旧伺服交叉混合跨帧引用）；AddTail 序=原链表序逐字保持；
    // 容量 64（定义数+交叉混合瞬态），溢界拒生（对齐池满"宁可丢不崩"）
    int								EmitterRosterCount() const;
    TodParticleEmitter*				EmitterRosterEmitterAt(int theIndex) const;
    ParticleEmitterID				EmitterRosterIDAt(int theIndex) const;
    bool							EmitterRosterAdd(TodParticleEmitter* theEmitter);
    void							EmitterRosterClear();

    void							TodParticleInitializeFromDef(float theX, float theY, int theRenderOrder, TodParticleDefinition* theDefinition, ParticleEffect theEffectType, std::uint32_t theVariant = 0);
    void							ParticleSystemDie();
    void							Update();
    void							Update(std::uint64_t theDeltaNs);
    void							Draw(Graphics* g);
    void							SystemMove(float theX, float theY);
    void							OverrideColor(ParticleEmitterName theName, const Color& theColor);
    void							OverrideColor(ParticleEmitterNameRange theRange, const Color& theColor);
    void							OverrideExtraAdditiveDraw(ParticleEmitterName theName, bool theEnableExtraAdditiveDraw);
    void							OverrideExtraAdditiveDraw(ParticleEmitterNameRange theRange, bool theEnableExtraAdditiveDraw);
    void							OverrideFrame(ParticleEmitterName theName, int theFrame);
    void							OverrideFrame(ParticleEmitterNameRange theRange, int theFrame);
    void							OverrideScale(ParticleEmitterName theName, float theScale);
    void							OverrideScale(ParticleEmitterNameRange theRange, float theScale);
    void							CrossFade(ParticleEmitterName theName);
    void							CrossFade(ParticleEmitterNameRange theRange);
};

