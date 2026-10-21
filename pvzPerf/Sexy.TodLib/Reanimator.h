#pragma once
#include "misc/TimeCounter.h"
#include "DataArray.h"
#include "FilterEffect.h"
#include "misc/SexyMatrix.h"
#include <map>
#include "ReanimTrackId.h"
//using namespace std;
using namespace Sexy;

class Reanimation;
class AttachEffect;
class TodParticleSystem;
class ReanimatorTransform;
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

namespace ReanimFlags
{
    constexpr int FastDrawInSwModeBit = 1;
}

struct ReanimatorTransformArray {
    ReanimatorTransform* mTransforms;
    int count;
};

class ReanimatorTrack
{
public:
    ReanimTrackId                   mTrackId;                       // Numeric identity; no runtime track name storage.
    ReanimatorTransformArray        mTransforms;
    
public:
    ReanimatorTrack() : mTrackId(ReanimTrackId::None), mTransforms({nullptr, 0}) { }
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
    ReanimatorTrackArray            mTracks;
    float                           mFPS;

public:
    ReanimatorDefinition() : mTracks({nullptr, 0}), mFPS(12.0f) { }
};
extern ReanimatorDefinition* gReanimatorDefArray;   //[0x6A9EE8]

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
    int                             mReanimParamFlags;
};

inline void                         ReanimationFillInMissingData(float& thePrev, float& theValue);
inline void                         ReanimationFillInMissingData(void*& thePrev, void*& theValue);
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


class ReanimationHolder
{
public:
    DataArray<Reanimation>          mReanimations;

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

class ReanimatorTransform
{
public:
    float                           mTransX;
    float                           mTransY;
    float                           mSkewX;
    float                           mSkewY;
    float                           mScaleX;
    float                           mScaleY;
    float                           mFrame;
    float                           mAlpha;
    Image*                          mImage;
    _Font*                           mFont;
    const char*                     mText;                          // UI captions only; never track/resource/attacher identifiers. SaveGame ABI retained.

public:
    ReanimatorTransform();
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
    Image*                          mImageOverride;                 //+0x44
    int                             mRenderGroup;                   //+0x48
    Color                           mTrackColor;                    //+0x4C
    bool                            mIgnoreClipRect;                //+0x5C
    bool                            mTruncateDisappearingFrames;    //+0x5D
    bool                            mIgnoreColorOverride;           //+0x5E
    bool                            mIgnoreExtraAdditiveColor;      //+0x5F

public:
    ReanimatorTrackInstance();
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
    float                           mAnimTime;
    float                           mAnimRate;
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
    float                           mLastFrameTime;
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
    /*inline*/ void                 Draw(Graphics* g);
    void                            DrawRenderGroup(Graphics* g, int theRenderGroup);
    bool                            DrawTrack(Graphics* g, int theTrackIndex, int theRenderGroup, const ReanimatorFrameTime* theFrameTime = nullptr);
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
    float                           GetTrackVelocity(ReanimTrackId theTrackId);
    /*inline*/ void                 SetImageOverride(ReanimTrackId theTrackId, Image* theImage);
    /*inline*/ Image*               GetImageOverride(ReanimTrackId theTrackId);
    void                            ShowOnlyTrack(ReanimTrackId theTrackId);
    void                            GetTrackMatrix(int theTrackIndex, SexyTransform2D& theMatrix);
    void                            AssignRenderGroupToTrack(ReanimTrackId theTrackId, int theRenderGroup);
    // 前缀家族分组：编译期 id 区间（枚举按折叠字典序分配，前缀 = 连续段），
    // 运行期 Contains 两次整数比较，与原版 strnicmp 前缀精确等价。
    void                            AssignRenderGroupToRange(const ReanimTrackIdRange& theRange, int theRenderGroup);
    void                            PropogateColorToAttachments();
    bool                            ShouldTriggerTimedEvent(float theEventTime);
    Image*                          GetCurrentTrackImage(ReanimTrackId theTrackId);
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
    void                            ReanimBltMatrix(Graphics* g, Image* theImage, SexyMatrix3& theTransform, const Rect& theClipRect, const Color& theColor, int theDrawMode, const Rect& theSrcRect);
    Reanimation*                    FindSubReanim(ReanimationType theReanimType);
};

void                                ReanimationPreload(ReanimationType theReanimationType);

// 每定义的 ReanimTrackId -> 轨道索引 直查表（加载期构建，运行期 O(1)）。

// 轨道索引 -> 枚举（定义侧；实例侧用 Reanimation::GetTrackId）。
std::uint32_t                       ReanimatorTrackIdAt(ReanimationType theReanimType, int theTrackIndex);

#
