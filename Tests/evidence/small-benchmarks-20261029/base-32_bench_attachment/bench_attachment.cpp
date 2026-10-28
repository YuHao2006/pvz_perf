// bench_attachment.cpp — 目标3-11：Attachment 族 9 函数
// FormA = ac447d19^ 改造前（Update/SetPosition/SetMatrix/Draw = 显式栈 DFS + 5 case
//         switch；OverrideColor/PropogateColor/OverrideScale/Detach/AttachmentDie =
//         平 for + 5 case switch，EFFECT_ATTACHMENT 递归槽在场但不喂入）
// FormB = HEAD 终态（全部纯平 for + 4 case switch，EFFECT_ATTACHMENT 删除）
// 输入：2M 均匀分布 EffectType ∈ {0,1,2,4}（EFFECT_ATTACHMENT=3 不可达，不喂），
//       固定种子；每 call 写入附件槽 0 的 mEffectType（mNumEffects=1）。
// 游戏函数 → 同签名空桩（不写任何状态，编号入 checksum）；DataArray::TryToGet
// 保留真实形状。每函数独立计时（min-of-5，A/B 交错）。
#include <windows.h>
#include <cstdint>
#include <cstdio>
#include <random>
#include <cstring>

// ---------------- harness ----------------
static uint64_t g_cs = 0;
static inline void CsMix(uint64_t v) { g_cs = g_cs * 0x9E3779B97F4A7C15ull + v; }
static uint64_t QpcFreq() { static uint64_t f = 0; if (!f) { LARGE_INTEGER li; QueryPerformanceFrequency(&li); f = (uint64_t)li.QuadPart; } return f; }
static uint64_t QpcNow() { LARGE_INTEGER c; QueryPerformanceCounter(&c); return (uint64_t)c.QuadPart; }
static double QpcToNs(uint64_t ticks) { return (double)ticks * 1e9 / (double)QpcFreq(); }
#define TOD_ASSERT(...) ((void)0)
constexpr int kAttachmentMaxDepth = 64;

// ---------------- game type stubs ----------------
enum EffectType { EFFECT_PARTICLE = 0, EFFECT_TRAIL = 1, EFFECT_REANIM = 2, EFFECT_ATTACHMENT = 3, EFFECT_OTHER = 4 };
#define MAX_EFFECTS_PER_ATTACHMENT 16

class Graphics { public: int mPad; };

class Color
{
public:
    int mRed, mGreen, mBlue, mAlpha;
    Color() : mRed(0), mGreen(0), mBlue(0), mAlpha(255) {}
    Color(int theRed, int theGreen, int theBlue) : mRed(theRed), mGreen(theGreen), mBlue(theBlue), mAlpha(255) {}
};

struct SexyVector2
{
    float x = 0.0f, y = 0.0f;
    SexyVector2() {}
    SexyVector2(float theX, float theY) : x(theX), y(theY) {}
};

struct SexyTransform2D
{
    float m00 = 1, m01 = 0, m02 = 0, m10 = 0, m11 = 1, m12 = 0, m20 = 0, m21 = 0, m22 = 1;
    SexyTransform2D operator*(const SexyTransform2D& o) const
    {
        SexyTransform2D r;
        r.m00 = m00 * o.m00 + m01 * o.m10 + m02 * o.m20;
        r.m01 = m00 * o.m01 + m01 * o.m11 + m02 * o.m21;
        r.m02 = m00 * o.m02 + m01 * o.m12 + m02 * o.m22;
        r.m10 = m10 * o.m00 + m11 * o.m10 + m12 * o.m20;
        r.m11 = m10 * o.m01 + m11 * o.m11 + m12 * o.m21;
        r.m12 = m10 * o.m02 + m11 * o.m12 + m12 * o.m22;
        r.m20 = m20 * o.m00 + m21 * o.m10 + m22 * o.m20;
        r.m21 = m20 * o.m01 + m21 * o.m11 + m22 * o.m21;
        r.m22 = m20 * o.m02 + m21 * o.m12 + m22 * o.m22;
        return r;
    }
    SexyVector2 operator*(const SexyVector2& v) const
    {
        return SexyVector2(m00 * v.x + m01 * v.y + m02, m10 * v.x + m11 * v.y + m12);
    }
};

class TodParticleSystem
{
public:
    bool mDead = false, mIsAttachment = true;
    void Update() { CsMix(51); }
    void SystemMove(float theX, float theY) { CsMix(52); CsMix((uint64_t)(int)(theX * 16.0f) << 20 ^ (uint64_t)(int)(theY * 16.0f)); }
    void OverrideColor(const char* theName, const Color& theColor) { CsMix(53); CsMix((uint64_t)(unsigned char)theColor.mRed << 16 | (uint64_t)(unsigned char)theColor.mGreen << 8 | (uint64_t)(unsigned char)theColor.mBlue); }
    void OverrideExtraAdditiveDraw(const char* theName, bool theEnable) { CsMix(54); CsMix(theEnable ? 1 : 0); }
    void OverrideScale(const char* theName, float theScale) { CsMix(55); CsMix((uint64_t)(int)(theScale * 32.0f)); }
    void CrossFade(const char* theName) { CsMix(56); }
    void Draw(Graphics* g) { CsMix(57); }
    void ParticleSystemDie() { CsMix(58); }
};

class Reanimation
{
public:
    bool mDead = false, mIsAttachment = true;
    Color mColorOverride, mExtraAdditiveColor, mExtraOverlayColor;
    bool mEnableExtraAdditiveDraw = false, mEnableExtraOverlayDraw = false;
    SexyTransform2D mOverlayMatrix;
    void Update() { CsMix(61); }
    void SetPosition(float theX, float theY) { CsMix(62); CsMix((uint64_t)(int)(theX * 16.0f) << 20 ^ (uint64_t)(int)(theY * 16.0f)); }
    void OverrideScale(float theX, float theY) { CsMix(63); }
    void Draw(Graphics* g) { CsMix(64); }
    void ReanimationDie() { CsMix(65); }
    void PropogateColorToAttachments() { CsMix(66); }
};

#define DATA_ARRAY_INDEX_MASK 65535
template <class T>
class DataArray
{
public:
    T* mItems = nullptr;
    unsigned int mMaxSize = 0;
    T* DataArrayTryToGet(unsigned int theId)
    {
        if (!theId || (theId & DATA_ARRAY_INDEX_MASK) >= mMaxSize)
            return nullptr;
        return &mItems[theId & DATA_ARRAY_INDEX_MASK];
    }
};

class Attachment;

class ParticleHolder { public: DataArray<TodParticleSystem> mParticleSystems; };
class ReanimationHolder { public: DataArray<Reanimation> mReanimations; };
class AttachmentHolder { public: DataArray<Attachment> mAttachments; };

class EffectSystem
{
public:
    ParticleHolder* mParticleHolder = nullptr;
    ReanimationHolder* mReanimationHolder = nullptr;
    AttachmentHolder* mAttachmentHolder = nullptr;
};
static EffectSystem* gEffectSystem = nullptr;
static EffectSystem g_effectSystem;
static TodParticleSystem g_particlePool[256];
static Reanimation g_reanimPool[256];

class AttachEffect
{
public:
    unsigned int mEffectID = 0;
    EffectType mEffectType = EFFECT_PARTICLE;
    SexyTransform2D mOffset;
    bool mDontDrawIfParentHidden = false;
    bool mDontPropogateColor = false;
};

class Attachment
{
public:
    AttachEffect mEffectArray[MAX_EFFECTS_PER_ATTACHMENT];
    int mNumEffects = 0;
    bool mDead = false;

    // FormA 的 EFFECT_ATTACHMENT 槽对 Attachment* 直呼这些成员（永不喂入
    // type=3，仅为编译形状在场）；空桩编号入 checksum。
    void OverrideColor(const Color& theColor) { CsMix(71); }
    void PropogateColor(const Color& c1, bool b1, const Color& c2, bool b2, const Color& c3) { CsMix(72); }
    void OverrideScale(float theScale) { CsMix(73); }
    void Detach() { CsMix(74); }
    void AttachmentDie() { CsMix(75); }
};

static Attachment g_attachmentPool[256];

// ============================================================
// FormA：改造前（ac447d19^ 逐字）
// ============================================================
class AttachmentA : public Attachment
{
public:
    void Update();
    void SetPosition(const SexyVector2& thePosition);
    void OverrideColor(const Color& theColor);
    void PropogateColor(const Color& theColor, bool theEnableAdditiveColor, const Color& theAdditiveColor, bool theEnableOverlayColor, const Color& theOverlayColor);
    void OverrideScale(float theScale);
    void SetMatrix(const SexyTransform2D& theMatrix);
    void Draw(Graphics* g, bool theParentHidden);
    void Detach();
    void AttachmentDie();
};

//0x404490
void AttachmentA::Update()
{
	TOD_ASSERT(gEffectSystem);

	// 每帧递归遍历改迭代：显式栈先序 DFS，与原递归同序（子树完整处理完才回到
	// 父级下一效果）。EFFECT_ATTACHMENT 的 isEmpty 只取决于槽位可解析，与子树
	// 先后无关，父级记账先于下钻等价。死亡实例由 ProcessDeleteQueue 回收，
	// 遍历期间槽位稳定（见 docs/2026-09-10-attachment-lifetime.md）。
	// 压实语义不变：移除空效果后索引原地重访（等价原 --i 回退）。
	struct UpdateFrame { Attachment* mAttachment; int mIndex; };
	UpdateFrame aStack[kAttachmentMaxDepth];
	int aDepth = 0;
	aStack[aDepth++] = { this, 0 };

	while (aDepth > 0)
	{
		Attachment* aAttachment = aStack[aDepth - 1].mAttachment;
		int& aIndex = aStack[aDepth - 1].mIndex;
		if (aIndex >= aAttachment->mNumEffects)
		{
			if (aAttachment->mNumEffects == 0)
			{
				aAttachment->mDead = true;
			}
			aDepth--;
			continue;
		}

		AttachEffect* aAttachEffect = &aAttachment->mEffectArray[aIndex];
		bool isEmpty = true;
		Attachment* aChildAttachment = nullptr;
		switch (aAttachEffect->mEffectType)
		{
		case EffectType::EFFECT_PARTICLE:
		{
			TodParticleSystem* aParticleSystem = gEffectSystem->mParticleHolder->mParticleSystems.DataArrayTryToGet(aAttachEffect->mEffectID);
			if (aParticleSystem && !aParticleSystem->mDead)
			{
				aParticleSystem->Update();
				isEmpty = false;
			}
			break;
		}

		case EffectType::EFFECT_TRAIL:
			// Trail 系统已退役：池恒空，此类型不可能再出现。保持与空池一致的
			// 语义（效果视为已消亡，从附件中移除）。
			break;

		case EffectType::EFFECT_REANIM:
		{
			Reanimation* aReanimation = gEffectSystem->mReanimationHolder->mReanimations.DataArrayTryToGet(aAttachEffect->mEffectID);
			if (aReanimation && !aReanimation->mDead)
			{
				aReanimation->Update();
				isEmpty = false;
			}
			break;
		}

		case EffectType::EFFECT_ATTACHMENT:
		{
			aChildAttachment = gEffectSystem->mAttachmentHolder->mAttachments.DataArrayTryToGet(aAttachEffect->mEffectID);
			if (aChildAttachment)
			{
				isEmpty = false;
			}
			break;
		}

		default:
			TOD_ASSERT(false);
			break;
		}

		if (isEmpty)
		{
			int aNumEffectsRemaining = aAttachment->mNumEffects - aIndex - 1;
			if (aNumEffectsRemaining > 0)
			{
				memmove(aAttachEffect, aAttachEffect + 1, aNumEffectsRemaining * sizeof(AttachEffect));
			}
			aAttachment->mNumEffects--;
		}
		else
		{
			aIndex++;
		}

		if (aChildAttachment)
		{
			TOD_ASSERT(aDepth < kAttachmentMaxDepth);
			if (aDepth < kAttachmentMaxDepth)
			{
				aStack[aDepth++] = { aChildAttachment, 0 };
			}
		}
	}
}

//0x404610
void AttachmentA::SetPosition(const SexyVector2& thePosition)
{
	TOD_ASSERT(gEffectSystem);

	// 每帧递归遍历改迭代：位置逐层复合（offset * 位置）随帧下传，各效果目标
	// 互不别名，栈式先序与原递归等价。
	struct MoveFrame { Attachment* mAttachment; SexyVector2 mPosition; int mIndex; };
	MoveFrame aStack[kAttachmentMaxDepth];
	int aDepth = 0;
	aStack[aDepth++] = { this, thePosition, 0 };

	while (aDepth > 0)
	{
		Attachment* aAttachment = aStack[aDepth - 1].mAttachment;
		SexyVector2& aPosition = aStack[aDepth - 1].mPosition;
		int& aIndex = aStack[aDepth - 1].mIndex;
		if (aIndex >= aAttachment->mNumEffects)
		{
			aDepth--;
			continue;
		}

		AttachEffect* aAttachEffect = &aAttachment->mEffectArray[aIndex];
		aIndex++;
		SexyVector2 aNewPos = aAttachEffect->mOffset * aPosition;

		switch (aAttachEffect->mEffectType)
		{
		case EffectType::EFFECT_PARTICLE:
		{
			TodParticleSystem* aParticleSystem = gEffectSystem->mParticleHolder->mParticleSystems.DataArrayTryToGet(aAttachEffect->mEffectID);
			if (aParticleSystem)
			{
				aParticleSystem->SystemMove(aNewPos.x, aNewPos.y);
			}
			break;
		}

		case EffectType::EFFECT_TRAIL:
			// Trail 系统已退役；枚举值保留（Attachment 存档按 int 序列化 mEffectType）。
			break;

		case EffectType::EFFECT_REANIM:
		{
			Reanimation* aReanimation = gEffectSystem->mReanimationHolder->mReanimations.DataArrayTryToGet(aAttachEffect->mEffectID);
			if (aReanimation)
			{
				aReanimation->SetPosition(aNewPos.x, aNewPos.y);
			}
			break;
		}

		case EffectType::EFFECT_ATTACHMENT:
		{
			Attachment* aChildAttachment = gEffectSystem->mAttachmentHolder->mAttachments.DataArrayTryToGet(aAttachEffect->mEffectID);
			if (aChildAttachment)
			{
				TOD_ASSERT(aDepth < kAttachmentMaxDepth);
				if (aDepth < kAttachmentMaxDepth)
				{
					aStack[aDepth++] = { aChildAttachment, aNewPos, 0 };
				}
			}
			break;
		}

		case EffectType::EFFECT_OTHER:
			break;
		}
	}
}

//0x404780
void AttachmentA::OverrideColor(const Color& theColor)
{
	TOD_ASSERT(gEffectSystem);

	for (int i = 0; i < mNumEffects; i++)
	{
		AttachEffect* aAttachEffect = &mEffectArray[i];
		switch (aAttachEffect->mEffectType)
		{
		case EffectType::EFFECT_PARTICLE:
		{
			TodParticleSystem* aParticleSystem = gEffectSystem->mParticleHolder->mParticleSystems.DataArrayTryToGet(aAttachEffect->mEffectID);
			if (aParticleSystem)
			{
				aParticleSystem->OverrideColor("", theColor);
			}
			break;
		}

		case EffectType::EFFECT_REANIM:
		{
			Reanimation* aReanimation = gEffectSystem->mReanimationHolder->mReanimations.DataArrayTryToGet(aAttachEffect->mEffectID);
			if (aReanimation)
			{
				aReanimation->mColorOverride = theColor;
			}
			break;
		}

		case EffectType::EFFECT_ATTACHMENT:
		{
			Attachment* aAttachment = gEffectSystem->mAttachmentHolder->mAttachments.DataArrayTryToGet(aAttachEffect->mEffectID);
			if (aAttachment)
			{
				aAttachment->OverrideColor(theColor);
			}
			break;
		}
		case EffectType::EFFECT_TRAIL:
		case EffectType::EFFECT_OTHER:
			break;
		}
	}
}

//0x404890
void AttachmentA::PropogateColor(const Color& theColor, bool theEnableAdditiveColor, const Color& theAdditiveColor, bool theEnableOverlayColor, const Color& theOverlayColor)
{
	TOD_ASSERT(gEffectSystem);

	for (int i = 0; i < mNumEffects; i++)
	{
		AttachEffect* aAttachEffect = &mEffectArray[i];
		if (aAttachEffect->mDontPropogateColor)
		{
			continue;
		}

		switch (aAttachEffect->mEffectType)
		{
		case EffectType::EFFECT_PARTICLE:
		{
			TodParticleSystem* aParticleSystem = gEffectSystem->mParticleHolder->mParticleSystems.DataArrayTryToGet(aAttachEffect->mEffectID);
			if (aParticleSystem)
			{
				aParticleSystem->OverrideColor(nullptr, theColor);
				aParticleSystem->OverrideExtraAdditiveDraw(nullptr, theEnableAdditiveColor);
			}
			break;
		}

		case EffectType::EFFECT_REANIM:
		{
			Reanimation* aReanimation = gEffectSystem->mReanimationHolder->mReanimations.DataArrayTryToGet(aAttachEffect->mEffectID);
			if (aReanimation)
			{
				aReanimation->mColorOverride = theColor;
				aReanimation->mExtraAdditiveColor = theAdditiveColor;
				aReanimation->mEnableExtraAdditiveDraw = theEnableAdditiveColor;
				aReanimation->mExtraOverlayColor = theOverlayColor;
				aReanimation->mEnableExtraOverlayDraw = theEnableOverlayColor;
				aReanimation->PropogateColorToAttachments();
			}
			break;
		}

		case EffectType::EFFECT_ATTACHMENT:
		{
			Attachment* aAttachment = gEffectSystem->mAttachmentHolder->mAttachments.DataArrayTryToGet(aAttachEffect->mEffectID);
			if (aAttachment)
			{
				aAttachment->PropogateColor(theColor, theEnableAdditiveColor, theAdditiveColor, theEnableOverlayColor, theOverlayColor);
			}
			break;
		}
		case EffectType::EFFECT_TRAIL:
		case EffectType::EFFECT_OTHER:
			break;
		}
	}
}

//0x404A40
void AttachmentA::OverrideScale(float theScale)
{
	TOD_ASSERT(gEffectSystem);

	for (int i = 0; i < mNumEffects; i++)
	{
		AttachEffect* aAttachEffect = &mEffectArray[i];
		switch (aAttachEffect->mEffectType)
		{
		case EffectType::EFFECT_PARTICLE:
		{
			TodParticleSystem* aParticleSystem = gEffectSystem->mParticleHolder->mParticleSystems.DataArrayTryToGet(aAttachEffect->mEffectID);
			if (aParticleSystem)
			{
				aParticleSystem->OverrideScale(nullptr, theScale);
			}
			break;
		}

		case EffectType::EFFECT_REANIM:
		{
			Reanimation* aReanimation = gEffectSystem->mReanimationHolder->mReanimations.DataArrayTryToGet(aAttachEffect->mEffectID);
			if (aReanimation)
			{
				aReanimation->OverrideScale(theScale, theScale);
			}
			break;
		}

		case EffectType::EFFECT_ATTACHMENT:
		{
			Attachment* aAttachment = gEffectSystem->mAttachmentHolder->mAttachments.DataArrayTryToGet(aAttachEffect->mEffectID);
			if (aAttachment)
			{
				aAttachment->OverrideScale(theScale);
			}
			break;
		}
		case EffectType::EFFECT_TRAIL:
		case EffectType::EFFECT_OTHER:
			break;
		}
	}
}

//0x404B80
void AttachmentA::SetMatrix(const SexyTransform2D& theMatrix)
{
	TOD_ASSERT(gEffectSystem);

	// 每帧递归遍历改迭代：矩阵逐层复合（矩阵 * offset）随帧下传。
	struct MatrixFrame { Attachment* mAttachment; SexyTransform2D mMatrix; int mIndex; };
	MatrixFrame aStack[kAttachmentMaxDepth];
	int aDepth = 0;
	aStack[aDepth++] = { this, theMatrix, 0 };

	while (aDepth > 0)
	{
		Attachment* aAttachment = aStack[aDepth - 1].mAttachment;
		SexyTransform2D& aMatrix = aStack[aDepth - 1].mMatrix;
		int& aIndex = aStack[aDepth - 1].mIndex;
		if (aIndex >= aAttachment->mNumEffects)
		{
			aDepth--;
			continue;
		}

		AttachEffect* aAttachEffect = &aAttachment->mEffectArray[aIndex];
		aIndex++;
		SexyTransform2D aPosition = aMatrix * aAttachEffect->mOffset;

		switch (aAttachEffect->mEffectType)
		{
		case EffectType::EFFECT_PARTICLE:
		{
			TodParticleSystem* aParticleSystem = gEffectSystem->mParticleHolder->mParticleSystems.DataArrayTryToGet(aAttachEffect->mEffectID);
			if (aParticleSystem)
			{
				aParticleSystem->SystemMove(aPosition.m02, aPosition.m12);
			}
			break;
		}

		case EffectType::EFFECT_TRAIL:
		{
			// Trail 系统已退役；此类型不再有可设置的矩阵目标。
			break;
		}

		case EffectType::EFFECT_REANIM:
		{
			Reanimation* aReanimation = gEffectSystem->mReanimationHolder->mReanimations.DataArrayTryToGet(aAttachEffect->mEffectID);
			if (aReanimation)
			{
				aReanimation->mOverlayMatrix = aPosition;
			}
			break;
		}

		case EffectType::EFFECT_ATTACHMENT:
		{
			Attachment* aChildAttachment = gEffectSystem->mAttachmentHolder->mAttachments.DataArrayTryToGet(aAttachEffect->mEffectID);
			if (aChildAttachment)
			{
				TOD_ASSERT(aDepth < kAttachmentMaxDepth);
				if (aDepth < kAttachmentMaxDepth)
				{
					aStack[aDepth++] = { aChildAttachment, aPosition, 0 };
				}
			}
			break;
		}
		case EffectType::EFFECT_OTHER:
			break;
		}
	}
}

//0x404D10
void AttachmentA::Draw(Graphics* g, bool theParentHidden)
{
	TOD_ASSERT(gEffectSystem);

	DataArray<TodParticleSystem>& aParticleSystems = gEffectSystem->mParticleHolder->mParticleSystems;
	DataArray<Reanimation>& aReanimations = gEffectSystem->mReanimationHolder->mReanimations;
	DataArray<Attachment>& aAttachments = gEffectSystem->mAttachmentHolder->mAttachments;

	// 每帧递归遍历改迭代：theParentHidden 全树不变，帧只需 {附件, 索引}；
	// 隐藏跳过按效果前置，与原逐效果判定一致。
	struct DrawFrame { Attachment* mAttachment; int mIndex; };
	DrawFrame aStack[kAttachmentMaxDepth];
	int aDepth = 0;
	aStack[aDepth++] = { this, 0 };

	while (aDepth > 0)
	{
		Attachment* aAttachment = aStack[aDepth - 1].mAttachment;
		int& aIndex = aStack[aDepth - 1].mIndex;
		if (aIndex >= aAttachment->mNumEffects)
		{
			aDepth--;
			continue;
		}

		AttachEffect* aAttachEffect = &aAttachment->mEffectArray[aIndex];
		aIndex++;
		if (theParentHidden && aAttachEffect->mDontDrawIfParentHidden)
		{
			continue;
		}

		switch (aAttachEffect->mEffectType)
		{
		case EffectType::EFFECT_PARTICLE:
		{
			TodParticleSystem* aParticleSystem = aParticleSystems.DataArrayTryToGet(aAttachEffect->mEffectID);
			if (aParticleSystem)
			{
				aParticleSystem->Draw(g);
			}
			break;
		}

		case EffectType::EFFECT_TRAIL:
			// Trail 系统已退役：无可绘制目标。
			break;

		case EffectType::EFFECT_REANIM:
		{
			Reanimation* aReanimation = aReanimations.DataArrayTryToGet(aAttachEffect->mEffectID);
			if (aReanimation)
			{
				aReanimation->Draw(g);
			}
			break;
		}

		case EffectType::EFFECT_ATTACHMENT:
		{
			Attachment* aChildAttachment = aAttachments.DataArrayTryToGet(aAttachEffect->mEffectID);
			if (aChildAttachment)
			{
				TOD_ASSERT(aDepth < kAttachmentMaxDepth);
				if (aDepth < kAttachmentMaxDepth)
				{
					aStack[aDepth++] = { aChildAttachment, 0 };
				}
			}
			break;
		}

		case EffectType::EFFECT_OTHER:
			break;
		}
	}
}

//0x404E80
void AttachmentA::Detach()
{
	TOD_ASSERT(gEffectSystem);

	DataArray<TodParticleSystem>& aParticleSystems = gEffectSystem->mParticleHolder->mParticleSystems;
	DataArray<Reanimation>& aReanimations = gEffectSystem->mReanimationHolder->mReanimations;
	DataArray<Attachment>& aAttachments = gEffectSystem->mAttachmentHolder->mAttachments;

	for (int i = 0; i < mNumEffects; i++)
	{
		AttachEffect* aAttachEffect = &mEffectArray[i];
		switch (aAttachEffect->mEffectType)
		{
		case EffectType::EFFECT_PARTICLE:
		{
			TodParticleSystem* aParticleSystem = aParticleSystems.DataArrayTryToGet(aAttachEffect->mEffectID);
			if (aParticleSystem)
			{
				TOD_ASSERT(aParticleSystem->mIsAttachment);
				aParticleSystem->mIsAttachment = false;
			}
			break;
		}

		case EffectType::EFFECT_TRAIL:
			// Trail 系统已退役：无需解除附件归属标记。
			break;

		case EffectType::EFFECT_REANIM:
		{
			Reanimation* aReanimation = aReanimations.DataArrayTryToGet(aAttachEffect->mEffectID);
			if (aReanimation)
			{
				TOD_ASSERT(aReanimation->mIsAttachment);
				aReanimation->mIsAttachment = false;
			}
			break;
		}

		case EffectType::EFFECT_ATTACHMENT:
		{
			Attachment* aAttachment = aAttachments.DataArrayTryToGet(aAttachEffect->mEffectID);
			if (aAttachment)
			{
				aAttachment->Detach();
			}
			break;
		}

		case EffectType::EFFECT_OTHER:
			break;
		}

		aAttachEffect->mEffectID = 0U;
	}

	mNumEffects = 0;
	mDead = true;
}

//0x404FC0
void AttachmentA::AttachmentDie()
{
	TOD_ASSERT(gEffectSystem);

	// @Minerscale Fix null pointer derefrence due to some sort of circular dependency...
	// The problems when freeing the data were probably actually bad so this fix is frankly irresponsible
	// TODO: put todo here so I know I'll come here when I break everything. !FIXME! !ACHTUNG!
	DataArray<TodParticleSystem> *aParticleSystems = nullptr;
	DataArray<Reanimation> *aReanimations = nullptr;
	DataArray<Attachment> *aAttachments = nullptr;
	if (gEffectSystem->mParticleHolder) aParticleSystems = &gEffectSystem->mParticleHolder->mParticleSystems;
	if (gEffectSystem->mReanimationHolder) aReanimations = &gEffectSystem->mReanimationHolder->mReanimations;
	if (gEffectSystem->mAttachmentHolder) aAttachments = &gEffectSystem->mAttachmentHolder->mAttachments;

	for (int i = 0; i < mNumEffects; i++)
	{
		AttachEffect* aAttachEffect = &mEffectArray[i];
		switch (aAttachEffect->mEffectType)
		{
		case EffectType::EFFECT_PARTICLE:
		{
			TodParticleSystem* aParticleSystem = aParticleSystems?aParticleSystems->DataArrayTryToGet(aAttachEffect->mEffectID):nullptr;
			if (aParticleSystem)
			{
				aParticleSystem->ParticleSystemDie();
			}
			break;
		}

		case EffectType::EFFECT_TRAIL:
			// Trail 系统已退役：无池可标记死亡。
			break;

		case EffectType::EFFECT_REANIM:
		{
			Reanimation* aReanimation = aReanimations?aReanimations->DataArrayTryToGet(aAttachEffect->mEffectID):nullptr;
			if (aReanimation)
			{
				aReanimation->ReanimationDie();
			}
			break;
		}

		case EffectType::EFFECT_ATTACHMENT:
		{
			Attachment* aAttachment = aAttachments?aAttachments->DataArrayTryToGet(aAttachEffect->mEffectID):nullptr;
			if (aAttachment)
			{
				aAttachment->AttachmentDie();
			}
			break;
		}

		case EffectType::EFFECT_OTHER:
			break;
		}

		aAttachEffect->mEffectID = 0U;
	}

	mNumEffects = 0;
	mDead = true;
}

// ============================================================
// FormB：当前终态（HEAD 逐字）
// ============================================================
class AttachmentB : public Attachment
{
public:
    void Update();
    void SetPosition(const SexyVector2& thePosition);
    void OverrideColor(const Color& theColor);
    void PropogateColor(const Color& theColor, bool theEnableAdditiveColor, const Color& theAdditiveColor, bool theEnableOverlayColor, const Color& theOverlayColor);
    void OverrideScale(float theScale);
    void SetMatrix(const SexyTransform2D& theMatrix);
    void Draw(Graphics* g, bool theParentHidden);
    void Detach();
    void AttachmentDie();
};

//0x404490
void AttachmentB::Update()
{
	TOD_ASSERT(gEffectSystem);

	for (int i = 0; i < mNumEffects; i++)
	{
		AttachEffect* aAttachEffect = &mEffectArray[i];
		bool isEmpty = true;
		switch (aAttachEffect->mEffectType)
		{
		case EffectType::EFFECT_PARTICLE:
		{
			TodParticleSystem* aParticleSystem = gEffectSystem->mParticleHolder->mParticleSystems.DataArrayTryToGet(aAttachEffect->mEffectID);
			if (aParticleSystem && !aParticleSystem->mDead)
			{
				aParticleSystem->Update();
				isEmpty = false;
			}
			break;
		}

		case EffectType::EFFECT_TRAIL:
			// Trail 系统已退役：池恒空，此类型不可能再出现。保持与空池一致的
			// 语义（效果视为已消亡，从附件中移除）。
			break;

		case EffectType::EFFECT_REANIM:
		{
			Reanimation* aReanimation = gEffectSystem->mReanimationHolder->mReanimations.DataArrayTryToGet(aAttachEffect->mEffectID);
			if (aReanimation && !aReanimation->mDead)
			{
				aReanimation->Update();
				isEmpty = false;
			}
			break;
		}


		default:
			TOD_ASSERT(false);
			break;
		}

		if (isEmpty)
		{
			int aNumEffectsRemaining = mNumEffects - i - 1;
			if (aNumEffectsRemaining > 0)
			{
				memmove(aAttachEffect, aAttachEffect + 1, aNumEffectsRemaining * sizeof(AttachEffect));
				--i;
			}
			mNumEffects--;
		}
	}

	if (mNumEffects == 0)
	{
		mDead = true;
	}
}

//0x404610
void AttachmentB::SetPosition(const SexyVector2& thePosition)
{
	TOD_ASSERT(gEffectSystem);

	for (int i = 0; i < mNumEffects; i++)
	{
		AttachEffect* aAttachEffect = &mEffectArray[i];
		SexyVector2 aNewPos = aAttachEffect->mOffset * thePosition;

		switch (aAttachEffect->mEffectType)
		{
		case EffectType::EFFECT_PARTICLE:
		{
			TodParticleSystem* aParticleSystem = gEffectSystem->mParticleHolder->mParticleSystems.DataArrayTryToGet(aAttachEffect->mEffectID);
			if (aParticleSystem)
			{
				aParticleSystem->SystemMove(aNewPos.x, aNewPos.y);
			}
			break;
		}

		case EffectType::EFFECT_TRAIL:
			// Trail 系统已退役；枚举值保留（Attachment 存档按 int 序列化 mEffectType）。
			break;

		case EffectType::EFFECT_REANIM:
		{
			Reanimation* aReanimation = gEffectSystem->mReanimationHolder->mReanimations.DataArrayTryToGet(aAttachEffect->mEffectID);
			if (aReanimation)
			{
				aReanimation->SetPosition(aNewPos.x, aNewPos.y);
			}
			break;
		}


		case EffectType::EFFECT_OTHER:
			break;
		}
	}
}

//0x404780
void AttachmentB::OverrideColor(const Color& theColor)
{
	TOD_ASSERT(gEffectSystem);

	for (int i = 0; i < mNumEffects; i++)
	{
		AttachEffect* aAttachEffect = &mEffectArray[i];
		switch (aAttachEffect->mEffectType)
		{
		case EffectType::EFFECT_PARTICLE:
		{
			TodParticleSystem* aParticleSystem = gEffectSystem->mParticleHolder->mParticleSystems.DataArrayTryToGet(aAttachEffect->mEffectID);
			if (aParticleSystem)
			{
				aParticleSystem->OverrideColor("", theColor);
			}
			break;
		}

		case EffectType::EFFECT_REANIM:
		{
			Reanimation* aReanimation = gEffectSystem->mReanimationHolder->mReanimations.DataArrayTryToGet(aAttachEffect->mEffectID);
			if (aReanimation)
			{
				aReanimation->mColorOverride = theColor;
			}
			break;
		}

		case EffectType::EFFECT_TRAIL:
		case EffectType::EFFECT_OTHER:
			break;
		}
	}
}

//0x404890
void AttachmentB::PropogateColor(const Color& theColor, bool theEnableAdditiveColor, const Color& theAdditiveColor, bool theEnableOverlayColor, const Color& theOverlayColor)
{
	TOD_ASSERT(gEffectSystem);

	for (int i = 0; i < mNumEffects; i++)
	{
		AttachEffect* aAttachEffect = &mEffectArray[i];
		if (aAttachEffect->mDontPropogateColor)
		{
			continue;
		}

		switch (aAttachEffect->mEffectType)
		{
		case EffectType::EFFECT_PARTICLE:
		{
			TodParticleSystem* aParticleSystem = gEffectSystem->mParticleHolder->mParticleSystems.DataArrayTryToGet(aAttachEffect->mEffectID);
			if (aParticleSystem)
			{
				aParticleSystem->OverrideColor(nullptr, theColor);
				aParticleSystem->OverrideExtraAdditiveDraw(nullptr, theEnableAdditiveColor);
			}
			break;
		}

		case EffectType::EFFECT_REANIM:
		{
			Reanimation* aReanimation = gEffectSystem->mReanimationHolder->mReanimations.DataArrayTryToGet(aAttachEffect->mEffectID);
			if (aReanimation)
			{
				aReanimation->mColorOverride = theColor;
				aReanimation->mExtraAdditiveColor = theAdditiveColor;
				aReanimation->mEnableExtraAdditiveDraw = theEnableAdditiveColor;
				aReanimation->mExtraOverlayColor = theOverlayColor;
				aReanimation->mEnableExtraOverlayDraw = theEnableOverlayColor;
				aReanimation->PropogateColorToAttachments();
			}
			break;
		}

		case EffectType::EFFECT_TRAIL:
		case EffectType::EFFECT_OTHER:
			break;
		}
	}
}

//0x404A40
void AttachmentB::OverrideScale(float theScale)
{
	TOD_ASSERT(gEffectSystem);

	for (int i = 0; i < mNumEffects; i++)
	{
		AttachEffect* aAttachEffect = &mEffectArray[i];
		switch (aAttachEffect->mEffectType)
		{
		case EffectType::EFFECT_PARTICLE:
		{
			TodParticleSystem* aParticleSystem = gEffectSystem->mParticleHolder->mParticleSystems.DataArrayTryToGet(aAttachEffect->mEffectID);
			if (aParticleSystem)
			{
				aParticleSystem->OverrideScale(nullptr, theScale);
			}
			break;
		}

		case EffectType::EFFECT_REANIM:
		{
			Reanimation* aReanimation = gEffectSystem->mReanimationHolder->mReanimations.DataArrayTryToGet(aAttachEffect->mEffectID);
			if (aReanimation)
			{
				aReanimation->OverrideScale(theScale, theScale);
			}
			break;
		}

		case EffectType::EFFECT_TRAIL:
		case EffectType::EFFECT_OTHER:
			break;
		}
	}
}

//0x404B80
void AttachmentB::SetMatrix(const SexyTransform2D& theMatrix)
{
	TOD_ASSERT(gEffectSystem);

	for (int i = 0; i < mNumEffects; i++)
	{
		AttachEffect* aAttachEffect = &mEffectArray[i];
		SexyTransform2D aPosition = theMatrix * aAttachEffect->mOffset;

		switch (aAttachEffect->mEffectType)
		{
		case EffectType::EFFECT_PARTICLE:
		{
			TodParticleSystem* aParticleSystem = gEffectSystem->mParticleHolder->mParticleSystems.DataArrayTryToGet(aAttachEffect->mEffectID);
			if (aParticleSystem)
			{
				aParticleSystem->SystemMove(aPosition.m02, aPosition.m12);
			}
			break;
		}

		case EffectType::EFFECT_TRAIL:
		{
			// Trail 系统已退役；此类型不再有可设置的矩阵目标。
			break;
		}

		case EffectType::EFFECT_REANIM:
		{
			Reanimation* aReanimation = gEffectSystem->mReanimationHolder->mReanimations.DataArrayTryToGet(aAttachEffect->mEffectID);
			if (aReanimation)
			{
				aReanimation->mOverlayMatrix = aPosition;
			}
			break;
		}

		case EffectType::EFFECT_OTHER:
			break;
		}
	}
}

//0x404D10
void AttachmentB::Draw(Graphics* g, bool theParentHidden)
{
	TOD_ASSERT(gEffectSystem);

	DataArray<TodParticleSystem>& aParticleSystems = gEffectSystem->mParticleHolder->mParticleSystems;
	DataArray<Reanimation>& aReanimations = gEffectSystem->mReanimationHolder->mReanimations;
	DataArray<Attachment>& aAttachments = gEffectSystem->mAttachmentHolder->mAttachments;

	for (int i = 0; i < mNumEffects; i++)
	{
		AttachEffect* aAttachEffect = &mEffectArray[i];
		if (theParentHidden && aAttachEffect->mDontDrawIfParentHidden)
		{
			continue;
		}

		switch (aAttachEffect->mEffectType)
		{
		case EffectType::EFFECT_PARTICLE:
		{
			TodParticleSystem* aParticleSystem = aParticleSystems.DataArrayTryToGet(aAttachEffect->mEffectID);
			if (aParticleSystem)
			{
				aParticleSystem->Draw(g);
			}
			break;
		}

		case EffectType::EFFECT_TRAIL:
			// Trail 系统已退役：无可绘制目标。
			break;

		case EffectType::EFFECT_REANIM:
		{
			Reanimation* aReanimation = aReanimations.DataArrayTryToGet(aAttachEffect->mEffectID);
			if (aReanimation)
			{
				aReanimation->Draw(g);
			}
			break;
		}


		case EffectType::EFFECT_OTHER:
			break;
		}
	}
}

//0x404E80
void AttachmentB::Detach()
{
	TOD_ASSERT(gEffectSystem);

	DataArray<TodParticleSystem>& aParticleSystems = gEffectSystem->mParticleHolder->mParticleSystems;
	DataArray<Reanimation>& aReanimations = gEffectSystem->mReanimationHolder->mReanimations;
	DataArray<Attachment>& aAttachments = gEffectSystem->mAttachmentHolder->mAttachments;

	for (int i = 0; i < mNumEffects; i++)
	{
		AttachEffect* aAttachEffect = &mEffectArray[i];
		switch (aAttachEffect->mEffectType)
		{
		case EffectType::EFFECT_PARTICLE:
		{
			TodParticleSystem* aParticleSystem = aParticleSystems.DataArrayTryToGet(aAttachEffect->mEffectID);
			if (aParticleSystem)
			{
				TOD_ASSERT(aParticleSystem->mIsAttachment);
				aParticleSystem->mIsAttachment = false;
			}
			break;
		}

		case EffectType::EFFECT_TRAIL:
			// Trail 系统已退役：无需解除附件归属标记。
			break;

		case EffectType::EFFECT_REANIM:
		{
			Reanimation* aReanimation = aReanimations.DataArrayTryToGet(aAttachEffect->mEffectID);
			if (aReanimation)
			{
				TOD_ASSERT(aReanimation->mIsAttachment);
				aReanimation->mIsAttachment = false;
			}
			break;
		}


		case EffectType::EFFECT_OTHER:
			break;
		}

		aAttachEffect->mEffectID = 0U;
	}

	mNumEffects = 0;
	mDead = true;
}

//0x404FC0
void AttachmentB::AttachmentDie()
{
	TOD_ASSERT(gEffectSystem);

	// @Minerscale Fix null pointer derefrence due to some sort of circular dependency...
	// The problems when freeing the data were probably actually bad so this fix is frankly irresponsible
	// TODO: put todo here so I know I'll come here when I break everything. !FIXME! !ACHTUNG!
	DataArray<TodParticleSystem> *aParticleSystems = nullptr;
	DataArray<Reanimation> *aReanimations = nullptr;
	DataArray<Attachment> *aAttachments = nullptr;
	if (gEffectSystem->mParticleHolder) aParticleSystems = &gEffectSystem->mParticleHolder->mParticleSystems;
	if (gEffectSystem->mReanimationHolder) aReanimations = &gEffectSystem->mReanimationHolder->mReanimations;
	if (gEffectSystem->mAttachmentHolder) aAttachments = &gEffectSystem->mAttachmentHolder->mAttachments;

	for (int i = 0; i < mNumEffects; i++)
	{
		AttachEffect* aAttachEffect = &mEffectArray[i];
		switch (aAttachEffect->mEffectType)
		{
		case EffectType::EFFECT_PARTICLE:
		{
			TodParticleSystem* aParticleSystem = aParticleSystems?aParticleSystems->DataArrayTryToGet(aAttachEffect->mEffectID):nullptr;
			if (aParticleSystem)
			{
				aParticleSystem->ParticleSystemDie();
			}
			break;
		}

		case EffectType::EFFECT_TRAIL:
			// Trail 系统已退役：无池可标记死亡。
			break;

		case EffectType::EFFECT_REANIM:
		{
			Reanimation* aReanimation = aReanimations?aReanimations->DataArrayTryToGet(aAttachEffect->mEffectID):nullptr;
			if (aReanimation)
			{
				aReanimation->ReanimationDie();
			}
			break;
		}


		case EffectType::EFFECT_OTHER:
			break;
		}

		aAttachEffect->mEffectID = 0U;
	}

	mNumEffects = 0;
	mDead = true;
}

// ---------------- bench driver ----------------
static const int N = 2000000;
static int g_input[N];  // EffectType ∈ {0,1,2,4}

static AttachmentA g_attA;
static AttachmentB g_attB;
static Graphics g_graphics;
static const Color g_color(200, 100, 50);
static SexyTransform2D g_matrix;
static ParticleHolder g_pHolder;
static ReanimationHolder g_rHolder;
static AttachmentHolder g_aHolder;

static inline void ArmAttachment(Attachment& a, int t)
{
    a.mEffectArray[0].mEffectType = (EffectType)t;
    a.mEffectArray[0].mEffectID = 5U;
    a.mEffectArray[0].mOffset.m02 = 0.25f;
    a.mEffectArray[0].mOffset.m12 = 0.5f;
    a.mEffectArray[0].mDontDrawIfParentHidden = (t == EFFECT_OTHER);
    a.mEffectArray[0].mDontPropogateColor = (t == EFFECT_TRAIL);
    a.mNumEffects = 1;
    a.mDead = false;
}

static inline void MixAttachment(const Attachment& a)
{
    CsMix((uint64_t)(unsigned)a.mNumEffects << 40 ^ (uint64_t)a.mDead << 39 ^ (uint64_t)a.mEffectArray[0].mEffectID << 20 ^ (uint64_t)a.mEffectArray[0].mEffectType);
}

typedef void (*CallFnA)();
typedef void (*CallFnB)();

struct FnPair
{
    const char* name;
    CallFnA fa;
    CallFnB fb;
    bool rearmAlways;   // Detach/Die 每调用必消耗
};

template <int WHICH>
static void RunOne(const FnPair& fp, int n, bool mix)
{
    Attachment& att = WHICH == 0 ? (Attachment&)g_attA : (Attachment&)g_attB;
    for (int k = 0; k < n; k++)
    {
        int t = g_input[k];
        ArmAttachment(att, t);
        if (WHICH == 0) fp.fa(); else fp.fb();
        if (mix) MixAttachment(att);
        // re-arm：Update 对 TRAIL/OTHER 压实；Detach/Die 必消耗。ArmAttachment 已覆盖。
        (void)fp.rearmAlways;
    }
}

static double g_nsA, g_nsB;
static bool g_csOK;

static void BenchOne(const FnPair& fp)
{
    // checksum
    g_cs = 0; RunOne<0>(fp, N, true); uint64_t csA = g_cs;
    g_cs = 0; RunOne<1>(fp, N, true); uint64_t csB = g_cs;
    bool ok = csA == csB;

    // warmup
    RunOne<0>(fp, 10000, false); RunOne<1>(fp, 10000, false);

    // timing min-of-5 interleaved
    uint64_t aMin = UINT64_MAX, bMin = UINT64_MAX;
    for (int rep = 0; rep < 5; rep++)
    {
        uint64_t t0 = QpcNow(); RunOne<0>(fp, N, false); uint64_t t1 = QpcNow();
        uint64_t t2 = QpcNow(); RunOne<1>(fp, N, false); uint64_t t3 = QpcNow();
        if (t1 - t0 < aMin) aMin = t1 - t0;
        if (t3 - t2 < bMin) bMin = t3 - t2;
    }
    double nsA = QpcToNs(aMin) / N, nsB = QpcToNs(bMin) / N;
    printf("%-16s | before %7.2f ns | after %7.2f ns | diff %+7.2f%% | checksum=%s (A=%016llx B=%016llx)\n",
        fp.name, nsA, nsB, (nsB - nsA) / nsA * 100.0, ok ? "OK" : "FAIL", (unsigned long long)csA, (unsigned long long)csB);
    if (!ok) g_csOK = false;
}

int main()
{
    std::mt19937 rng(20261002);
    std::uniform_int_distribution<int> pick(0, 3);
    static const int kReachable[4] = { EFFECT_PARTICLE, EFFECT_TRAIL, EFFECT_REANIM, EFFECT_OTHER };
    for (int k = 0; k < N; k++) g_input[k] = kReachable[pick(rng)];

    g_effectSystem.mParticleHolder = &g_pHolder;
    g_effectSystem.mReanimationHolder = &g_rHolder;
    g_effectSystem.mAttachmentHolder = &g_aHolder;
    g_pHolder.mParticleSystems.mItems = g_particlePool; g_pHolder.mParticleSystems.mMaxSize = 256;
    g_rHolder.mReanimations.mItems = g_reanimPool; g_rHolder.mReanimations.mMaxSize = 256;
    g_aHolder.mAttachments.mItems = g_attachmentPool; g_aHolder.mAttachments.mMaxSize = 256;
    gEffectSystem = &g_effectSystem;
    g_matrix.m02 = 3.0f; g_matrix.m12 = 4.0f;
    g_csOK = true;

    static const Color cAdd(10, 20, 30), cOver(30, 40, 60);
    static const SexyVector2 pos(5.0f, 7.0f);

    FnPair pairs[9] = {
        { "Update",         [] { g_attA.Update(); },         [] { g_attB.Update(); },         false },
        { "SetPosition",    [] { g_attA.SetPosition(pos); }, [] { g_attB.SetPosition(pos); }, false },
        { "OverrideColor",  [] { g_attA.OverrideColor(g_color); }, [] { g_attB.OverrideColor(g_color); }, false },
        { "PropogateColor", [] { g_attA.PropogateColor(g_color, true, cAdd, true, cOver); }, [] { g_attB.PropogateColor(g_color, true, cAdd, true, cOver); }, false },
        { "OverrideScale",  [] { g_attA.OverrideScale(1.5f); }, [] { g_attB.OverrideScale(1.5f); }, false },
        { "SetMatrix",      [] { g_attA.SetMatrix(g_matrix); }, [] { g_attB.SetMatrix(g_matrix); }, false },
        { "Draw",           [] { g_attA.Draw(&g_graphics, true); }, [] { g_attB.Draw(&g_graphics, true); }, false },
        { "Detach",         [] { g_attA.Detach(); },         [] { g_attB.Detach(); },         true },
        { "AttachmentDie",  [] { g_attA.AttachmentDie(); },  [] { g_attB.AttachmentDie(); },  true },
    };

    for (auto& fp : pairs) BenchOne(fp);
    return g_csOK ? 0 : 1;
}
