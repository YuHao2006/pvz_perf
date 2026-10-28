#pragma once
#include "misc/TimeCounter.h"
#include "DataArray.h"
#include "FilterEffect.h"
#include "misc/SexyMatrix.h"
#include <map>
#include <array>
#include <cstdint>
#include "ReanimTrackId.h"
#include "DefinitionImageRegion.h"
#include "graphics/TextureRegion.h"
#include "ReanimClock.h"
//using namespace std;
using namespace Sexy;

class Reanimation;
class AttachEffect;
class TodParticleSystem;
class ReanimatorTransform;
class ReanimatorSourceTransform;
class ReanimatorDefinition;
namespace Sexy
{
    class _Font;
    class Image;
    class Graphics;
    class MemoryImage;
};

// ######################################################################################################################################################
// ############################################################### 以下为动画定义相关内容 ###############################################################
// ######################################################################################################################################################

constexpr const float DEFAULT_FIELD_PLACEHOLDER = -10000.0f;
constexpr const double SECONDS_PER_UPDATE = 0.01f;

struct ReanimatorTransformArray {
    ReanimatorSourceTransform* mTransforms;
    int count;
};

class ReanimatorTrack
{
public:
    ReanimTrackId                   mTrackId = ReanimTrackId::None;
    ReanimatorTransformArray        mTransforms{nullptr, 0};
};

struct ReanimatorTrackArray {
    ReanimatorTrack* tracks;
    int count;
};

// ====================================================================================================
// ★ 【动画器定义】
// ----------------------------------------------------------------------------------------------------
// 用于描述一种动画类型与该动画的数据文件的文件名及标志之间的对应关系。
// ====================================================================================================
class ReanimatorDefinition
{
public:
    ReanimatorTrackArray            mTracks{nullptr, 0};
    float                           mFPS = 12.0f;
    Sexy::GpuTexture**              mTextures = nullptr;
    std::uint32_t                   mVariantCount = 0;
    std::uint32_t                   mImageSlotCount = 0;
    std::uint32_t                   mVariantActionCount = 0;
    // Static definition data [variant][image slot]. Row zero supplies geometry.
    const Sexy::TextureRegion*      mImageRects = nullptr;
    std::uint32_t*                  mVariantTransitions = nullptr;
    // Generated data indexed by the existing MPHF track index.
    std::uint32_t*                  mVariantActionStarts = nullptr;
    std::uint32_t*                  mVariantActionCounts = nullptr;
    std::uint32_t*                  mVariantOptions = nullptr;

};
extern ReanimatorDefinition* gReanimatorDefArray;   //[0x6A9EE8]

struct AttacherSegmentRT final
{
    std::uint32_t trackIndex;
    std::uint32_t startFrame;
    std::uint32_t endFrame;
    std::uint32_t targetType;
    std::uint32_t actionTrackId;
    float rate;
    std::uint32_t loop;
    std::uint32_t textRunStart;
    std::uint32_t textRunEnd;
    int mActionFrameStart = -1;
    int mActionFrameCount = -1;
};

// ====================================================================================================
// ★ 【动画参数】
// ----------------------------------------------------------------------------------------------------
// 用于描述一种动画类型与该动画的数据文件的文件名及标志之间的对应关系。
// ====================================================================================================
class ReanimationParams
{
public:
    ReanimationType                 mReanimationType;
    const char*                     mReanimFileName;
};

void                                ReanimatorEnsureDefinitionLoaded(ReanimationType theReanimType, bool theIsPreloading);
void                                ReanimatorLoadDefinitions(ReanimationParams* theReanimationParamArray, int theReanimationParamArraySize);
// 全量动画定义装载（数据+图像）【装载线程专用】（2026-10-09
// 锁核黑屏案拆分：原在主线程 Init 同步跑，1GHz 单核黑屏 7-9 秒）。幂等。
void                                ReanimatorLoadAllDefinitionData();
void                                ReanimatorFreeDefinitions();
// 全量预载：定义装载将源图交主线程预热队列上传。
void                                ReanimatorPreloadAll();
// 全量源图上传【仅主线程】，上传成功后释放 CPU 位图。
int                                 ReanimatorUploadAllTexturesToGPU();
// Main-thread loading only. Upload binary keyframes/UV once; keep CPU Both data.
// Startup definitions can be uploaded while the native window is still hidden.

// Compile-time fixed-track indices; -1 means the definition has no ground track.
extern const std::array<int, (int)ReanimationType::NUM_REANIMS> gReanimGroundTrackIndices;
extern ReanimationParams gLawnReanimationArray[(int)ReanimationType::NUM_REANIMS];  //0x6A1340

// ######################################################################################################################################################
// ############################################################## 以下正式开始动画相关声明 ##############################################################
// ######################################################################################################################################################

enum
{
    RENDER_GROUP_HIDDEN = -1,
    RENDER_GROUP_NORMAL = 0
};

constexpr const int NO_BASE_POSE = -2;

enum class ReanimTimeDomain : std::uint32_t
{
    Visual = 0,
    Battle = 1
};

class ReanimationHolder
{
public:
    DataArray<Reanimation>          mReanimations;
    std::int64_t                    mVisualTimeNs = 0;
    std::int64_t                    mBattleTimeNs = 0;
    ReanimTimeDomain                mDefaultTimeDomain = ReanimTimeDomain::Visual;

public:
    ReanimationHolder() { ; }
    ~ReanimationHolder();

    void                            InitializeHolder();
    void                            DisposeHolder();
    Reanimation*                    AllocReanimation(float theX, float theY, int theRenderOrder, ReanimationType theReanimationType);
};

// ====================================================================================================
// ★ 【动画器时间】
// ----------------------------------------------------------------------------------------------------
// 用于描述动画当前正在播放的时间位置。
// ====================================================================================================
class ReanimatorFrameTime
{
public:
    float                           mFraction;                      //+0x0：两帧之间已经过的比例
    int                             mAnimFrameBeforeInt;            //+0x4：前一个整数帧
    int                             mAnimFrameAfterInt;             //+0x8：后一个整数帧
};

class ReanimatorSourceTransform
{
public:
    float mTransX = 0;
    float mTransY = 0;
    float mSkewX = 0;
    float mSkewY = 0;
    float mScaleX = 1;
    float mScaleY = 1;
    std::int32_t mFrame = -1;
    float mAlpha = 1;
    std::uint32_t mImageSlot = 0;
    _Font* mFont = nullptr;
    const char* mText = nullptr;
};

class ReanimatorTransform
{
public:
    float                           mTransX = DEFAULT_FIELD_PLACEHOLDER;
    float                           mTransY = DEFAULT_FIELD_PLACEHOLDER;
    float                           mSkewX = DEFAULT_FIELD_PLACEHOLDER;
    float                           mSkewY = DEFAULT_FIELD_PLACEHOLDER;
    float                           mScaleX = DEFAULT_FIELD_PLACEHOLDER;
    float                           mScaleY = DEFAULT_FIELD_PLACEHOLDER;
    float                           mFrame = DEFAULT_FIELD_PLACEHOLDER;
    float                           mAlpha = DEFAULT_FIELD_PLACEHOLDER;
    std::uint32_t                   mImageSlot = 0;
    _Font*                          mFont = nullptr;
    const char*                     mText = nullptr;
};

class ReanimatorTrackInstance
{
public:
    Sexy::TimeCounter                             mBlendCounter;                  //+0x0
    Sexy::TimeCounter                             mBlendTime;                     //+0x4
    ReanimatorTransform             mBlendTransform;                //+0x8
    float                           mShakeOverride;                 //+0x34
    float                           mShakeX;                        //+0x38
    float                           mShakeY;                        //+0x3C
    AttachmentID                    mAttachmentID;                  //+0x40
    int                             mRenderGroup;                   //+0x48
    Color                           mTrackColor;                    //+0x4C
    bool                            mIgnoreClipRect;                //+0x5C
    bool                            mTruncateDisappearingFrames;    //+0x5D
    bool                            mIgnoreColorOverride;           //+0x5E
    bool                            mIgnoreExtraAdditiveColor;      //+0x5F

public:
    ReanimatorTrackInstance();
};

struct ReanimFramePosition
{
    std::int64_t cycles;
    int frame;
    std::int64_t ageNs;
};

struct ReanimPlaybackPosition
{
    std::int64_t cycles;
    std::int64_t phaseNs;
};

// P4 掩码联动（Attachment.cpp 漏斗调用）：按 AttachmentID 引用地址反查归属
// reanim 轨道并置活动位——直挂写点散布（Zombie.cpp 头盔/旗帜/盾牌等 17 处经
// AttachReanim/AttachParticle 传轨道字段引用），无法逐点挂钩，池=真值反查
//（挂接是离散事件，O(活轨) 无所谓）；局部变量引用（smoke 夹具）无归属空过。
void ReanimMarkAttachmentIdRefOwner(AttachmentID& theAttachmentID);

// P4 活动掩码存储容量（位/字）：刻意为固定常量而非生成值——本头被全库
// 包含，若宽度挂到生成头，改版重生成会级联重编半个树（obj 老问题）；
// 生成侧在 Reanimator.cpp 内 static_assert(kMaxReanimTracks <= 容量)，
// 改版超限=编译错，抬升此常量一行即可（存储变化本就该全量重编）。
static constexpr int kReanimActiveMaskCapacityBits = 256;
static constexpr int kReanimActiveMaskWords = kReanimActiveMaskCapacityBits / 64;

class Reanimation
{
public:
    ReanimationType                 mReanimationType;
    std::uint32_t                   mVariant;
    ReanimTimeDomain                mTimeDomain;
    std::int64_t                    mStartTimeNs;
    int                             mCurrentFrame;
    std::int64_t                    mFramePeriodNs;
    double                          mRootFrameScale;
    std::int64_t                    mPeriodNs;
    std::int64_t                    mOriginCycleCount;
    float                           mAnimRate;
    std::uint32_t                   mPlaybackGeneration;
    ReanimatorDefinition*           mDefinition;
    ReanimLoopType                  mLoopType;
    bool                            mDead;
    int                             mFrameStart;
    int                             mFrameCount;
    int                             mFrameBasePose;
    SexyTransform2D                 mOverlayMatrix;
    Color                           mColorOverride;
    ReanimatorTrackInstance*        mTrackInstances;
    int                             mLoopCount;
    ReanimationHolder*              mReanimationHolder;
    bool                            mIsAttachment;
    int                             mRenderOrder;
    Color                           mExtraAdditiveColor;
    bool                            mEnableExtraAdditiveDraw;
    Color                           mExtraOverlayColor;
    bool                            mEnableExtraOverlayDraw;
    std::int64_t                    mLastFrameNs;
    std::int64_t                    mLastCycleCount;
    std::int64_t                    mLastUpdateTimeNs;
    bool                            mHasLastFrame;
    bool                            mPendingTiming;
    FilterEffect                    mFilterEffect;
    // ── P4 派生活动/分组掩码（2026-10-02，bench_reanim_trackwalk 裁决：
    // 掩码跳过 11~22% vs 布局拆段 94~97%，故 112B 轨道结构体原样不拆）──
    // mActiveMask 位=轨道下标（4 字=256 位，实测最大 def 171 轨；超 256
    // 轨的 def 初始化为全 1 高估，Update 自愈首帧即收敛为精确位——超大
    // mod reanim 不破，只是退回全扫性能），置位=该轨 blend>0/shake≠0/
    // attach≠null 之一。写点只置位（StartBlend/SetShakeOverride/挂附件）；
    // 清位由 Update 访问自愈（三值全零即清），陈旧置位仅浪费一次空访
    //（安全方向）；存档读回/夹具直写后调 RebuildTrackActivityMasks 全量
    // 重建。mGroupOccMask 位=分组号（0..17），只置位不清——空分组多跑
    // 一遍无害，漏位才会丢绘制。均不入盘（派生态）。
    uint64_t                        mActiveMask[kReanimActiveMaskWords];
    uint32_t                        mGroupOccMask;
public:
    Reanimation();
    ~Reanimation();

    // 掩码重建：按轨道字段现值精确重算两掩码（存档读回后 / 夹具直写字段后）
    void                            RebuildTrackActivityMasks();

    void                            ReanimationInitialize(float theX, float theY, ReanimatorDefinition* theDefinition);
    /*inline*/ void                 ReanimationInitializeType(float theX, float theY, ReanimationType theReanimType);
    void                            ReanimationDie();
    void                            Update();
    void                            UpdateAt(std::int64_t nowNs);
    void                            Advance(std::int64_t deltaNs);
    ReanimFramePosition             SampleFrameAt(std::int64_t nowNs, std::int64_t offsetNs = 0) const;
    ReanimPlaybackPosition          SamplePlayback(std::int64_t offsetNs = 0) const;
    ReanimPlaybackPosition          SamplePlaybackAt(std::int64_t nowNs, std::int64_t offsetNs = 0) const;
    void                            BindTimeDomain(ReanimTimeDomain domain);
    void                            RebaseTime(std::int64_t nowNs);
    void                            ApplyRate(float rate);
    void                            ChangeLoopType(ReanimLoopType loop);
    void                            Seek(std::int64_t numerator, std::int64_t denominator = 1000);
    void                            SeekRatio(float phase);
    void                            SynchronizePhase(const Reanimation& source);
    double                          RootMotion(ReanimTrackId trackId, float scale = 1.0f, std::int64_t offsetNs = 0) const;
    double                          RootMotionClamped(ReanimTrackId trackId, float scale, float minimumVelocityPixelsPerSecond, std::int64_t offsetNs = 0) const;
    std::int64_t                    TimedEventCount(std::int64_t numerator, std::int64_t denominator = 1000) const;
    /*inline*/ void                 Draw(Graphics* g);
    void                            DrawRenderGroup(Graphics* g, int theRenderGroup);
    bool                            DrawTrack(Graphics* g, int theTrackIndex, int theRenderGroup,
        const ReanimatorFrameTime* theFrameTime = nullptr);
    void                            GetCurrentTransform(int theTrackIndex, ReanimatorTransform* theTransformCurrent, const ReanimatorFrameTime* theFrameTime = nullptr);
    void                            GetTransformAtTime(int theTrackIndex, ReanimatorTransform* theTransform, const ReanimatorFrameTime* theFrameTime);
    void                            GetFrameTime(ReanimatorFrameTime* theFrameTime);
    int                             FindTrackIndex(ReanimTrackId theTrackId);
    void                            AttachToAnotherReanimation(Reanimation* theAttachReanim, ReanimTrackId theTrackId);
    void                            GetAttachmentOverlayMatrix(int theTrackIndex, SexyTransform2D& theOverlayMatrix);
    /*inline*/ void                 SetFramesForLayer(ReanimTrackId theTrackId);
    // index 直达版：theTrackIndex 由 FindTrackIndex 预解，id 版
    // SetFramesForLayer 内部共用。
    void                            SetFramesForLayerIndex(int theTrackIndex);
    static void                     MatrixFromTransform(const ReanimatorTransform& theTransform, SexyMatrix3& theMatrix);
    bool                            TrackExists(ReanimTrackId theTrackId);
    void                            StartBlend(int theBlendTime);
    /*inline*/ void                 SetShakeOverride(ReanimTrackId theTrackId, float theShakeAmount);
    void                            SelectVariant(std::uint32_t theVariant);
    void                            SetVariantOption(ReanimTrackId theTrackId, std::uint32_t theOption);
    std::uint32_t                   VariantOption(ReanimTrackId theTrackId);
    void                            ShowOnlyTrack(ReanimTrackId theTrackId);
    void                            GetTrackMatrix(int theTrackIndex, SexyTransform2D& theMatrix);
    void                            AssignRenderGroupToTrack(ReanimTrackId theTrackId, int theRenderGroup);
    // 前缀家族分组：编译期 id 区间（枚举按折叠字典序分配，前缀 = 连续段），
    // 运行期 Contains 两次整数比较，与原版 strnicmp 前缀精确等价。
    void                            AssignRenderGroupToRange(const ReanimTrackIdRange& theRange, int theRenderGroup);
    void                            PropogateColorToAttachments();
    bool                            ShouldTriggerTimedEvent(float theEventTime);
    AttachEffect*                   AttachParticleToTrack(ReanimTrackId theTrackId, TodParticleSystem* theParticleSystem, float thePosX, float thePosY);
    void                            GetTrackBasePoseMatrix(int theTrackIndex, SexyTransform2D& theBasePosMatrix);
    bool                            IsTrackShowing(ReanimTrackId theTrackId);
    void                            SetTruncateDisappearingFrames(ReanimTrackId theTrackId, bool theTruncateDisappearingFrames);
    void                            SetTruncateDisappearingFramesAll(bool theTruncateDisappearingFrames);  // 全轨道（原 nullptr 重载）
    /*inline*/ void                 PlayReanim(ReanimTrackId theTrackId, ReanimLoopType theLoopType, int theBlendTime, float theAnimRate);
    void                            ReanimationDelete();
    ReanimatorTrackInstance*        GetTrackInstanceByName(ReanimTrackId theTrackId);
    void                            GetFramesForLayer(ReanimTrackId theTrackId, int& theFrameStart, int& theFrameCount);
    void                            GetFramesForTrackIndex(int theTrackIndex, int& theFrameStart, int& theFrameCount);
    ReanimTrackId                   GetTrackId(int theTrackIndex) const;  // 轨道索引 -> 枚举（诊断/专用判断）
    void                            UpdateAttacherTrack(int theTrackIndex);
    // Compiler-linked routing text-run bounds are exclusive at the end.
    void                            AttacherSynchWalkSpeed(int theTrackIndex, Reanimation* theAttachReanim, int theTextRunStart, int theTextRunEnd);
    /*inline*/ bool                 IsAnimPlaying(ReanimTrackId theTrackId);
    void                            SetBasePoseFromAnim(ReanimTrackId theTrackId);
    Reanimation*                    FindSubReanim(ReanimationType theReanimType);
private:
    void                            ConsumeTimeAt(std::int64_t nowNs);
};

void                                ReanimationPreload(ReanimationType theReanimationType);

// 每定义的 ReanimTrackId -> 轨道索引 直查表（加载期构建，运行期 O(1)）。

// 轨道索引 -> 枚举（定义侧；实例侧用 Reanimation::GetTrackId）。
std::uint32_t                       ReanimatorTrackIdAt(ReanimationType theReanimType, int theTrackIndex);

#
