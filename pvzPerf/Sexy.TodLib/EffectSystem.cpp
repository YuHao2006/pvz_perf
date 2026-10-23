#include "graphics/Graphics.h"
#include "TodDebug.h"
#include "Attachment.h"
#include "Reanimator.h"
#include "TodParticle.h"
#include "EffectSystem.h"
#include "GameConstants.h"
#include "graphics/Image.h"
#include "graphics/DDInterface.h"
#include "graphics/RenderInterface.h"
#include <memory>
#include <stdexcept>

EffectSystem* gEffectSystem = nullptr;  //[0x6A9EB8]

EffectSystem::~EffectSystem()
{
	EffectSystemDispose();
}

//0x445330
void EffectSystem::EffectSystemInitialize()
{
	if (gEffectSystem || mParticleHolder || mReanimationHolder || mAttachmentHolder)
		throw std::logic_error("EffectSystem: initialization requires an empty system and no active global system");
	auto aParticleData = std::make_unique<TodParticleData>();
	aParticleData->Initialize();
	auto aParticles = std::make_unique<TodParticleHolder>(aParticleData.get());
	auto aReanimations = std::make_unique<ReanimationHolder>();
	auto aAttachments = std::make_unique<AttachmentHolder>();
	aReanimations->InitializeHolder();
	aAttachments->InitializeHolder();

	mParticleData = std::move(aParticleData);
	mParticleHolder = std::move(aParticles);
	mReanimationHolder = std::move(aReanimations);
	mAttachmentHolder = std::move(aAttachments);
	gEffectSystem = this; // Publish only after every pool is ready.
}

//0x445490
void EffectSystem::EffectSystemDispose()
{
	// Particle destructors resolve through their still-live borrowed holder.
	mParticleData.reset();
	mParticleHolder.reset();
	mReanimationHolder.reset();
	mAttachmentHolder.reset();

	if (gEffectSystem == this)
		gEffectSystem = nullptr;
}

//0x4455E0
void EffectSystem::EffectSystemFreeAll()
{
	mParticleHolder->mParticleSystems.DataArrayFreeAll();
	mParticleHolder->mEmitters.DataArrayFreeAll();
	mParticleHolder->mParticles.DataArrayFreeAll();

	mReanimationHolder->mReanimations.DataArrayFreeAll();
	mAttachmentHolder->mAttachments.DataArrayFreeAll();
}

//0x445680
void EffectSystem::ProcessDeleteQueue()
{
	TodParticleSystem* aParticle = nullptr;
	while (mParticleHolder->mParticleSystems.IterateNext(aParticle))
		if (aParticle->mDead)
		{
			// 2026-10-05 泄漏修复（B 树无尽实机定罪：发射器池爬满 1024 拒生）：
			// 自然死亡原先只释系统槽、发射器滞留池内（长局必满）。补完整 Die
			// 序列（逐发射器 DeleteAll+释槽→清册），与显式 ParticleSystemDie 同构
			aParticle->ParticleSystemDie();
			mParticleHolder->mParticleSystems.DataArrayFree(aParticle);
		}

	Reanimation* aReanim = nullptr;
	while (mReanimationHolder->mReanimations.IterateNext(aReanim))
		if (aReanim->mDead)
			mReanimationHolder->mReanimations.DataArrayFree(aReanim);

	Attachment* aAttachment = nullptr;
	while (mAttachmentHolder->mAttachments.IterateNext(aAttachment))
		if (aAttachment->mDead)
			mAttachmentHolder->mAttachments.DataArrayFree(aAttachment);
}

//0x445890
void EffectSystem::Update()
{
	UpdateAt(mReanimationHolder->mVisualTimeNs, mReanimationHolder->mBattleTimeNs);
}

void EffectSystem::UpdateAt(std::int64_t visualNowNs, std::int64_t battleNowNs)
{
	mReanimationHolder->mVisualTimeNs = visualNowNs;
	mReanimationHolder->mBattleTimeNs = battleNowNs;
	TodParticleSystem* aParticle = nullptr;
	while (mParticleHolder->mParticleSystems.IterateNext(aParticle))
		if (!aParticle->mIsAttachment)
			aParticle->Update();

	Reanimation* aReanim = nullptr;
	while (mReanimationHolder->mReanimations.IterateNext(aReanim))
		if (!aReanim->mIsAttachment)
			aReanim->UpdateAt(aReanim->mTimeDomain == ReanimTimeDomain::Battle ? battleNowNs : visualNowNs);
}

// #################################################################################################### //
// #################################################################################################### //
// #################################################################################################### //

static TriVertex		gTodVertexReservoir[64];
static unsigned int		gTodVertexReservoirUsed = 0;

static int FixedFloor(int x)
{
	if (x > 0)
		return x & 0xFFFF0000;
	else
		return (x & 0xFFFF0000) - 0x10000;
}

//0x4459B0
static inline void Tod_Tod_lClip(TriVertex& dst, const TriVertex& on, const TriVertex& off, const float edge)
{
	float delta = (edge - off.x) / (on.x - off.x);
	dst.x = off.x + (on.x - off.x) * delta;
	dst.y = off.y + (on.y - off.y) * delta;
	dst.u = off.u + (on.u - off.u) * delta;
	dst.v = off.v + (on.v - off.v) * delta;
	dst.color =
		((int)((off.color >> 24 & 0xff) + ((on.color >> 24 & 0xff) - (off.color >> 24 & 0xff)) * delta) << 24) |
		((int)((off.color >> 16 & 0xff) + ((on.color >> 16 & 0xff) - (off.color >> 16 & 0xff)) * delta) << 16) |
		((int)((off.color >>  8 & 0xff) + ((on.color >>  8 & 0xff) - (off.color >>  8 & 0xff)) * delta) << 8) |
		((int)((off.color       & 0xff) + ((on.color       & 0xff) - (off.color       & 0xff)) * delta));
}
static inline void rClip(TriVertex& dst, const TriVertex& on, const TriVertex& off, const float edge)
{
	float delta = (edge - off.x) / (on.x - off.x);
	dst.x = off.x + (on.x - off.x) * delta;
	dst.y = off.y + (on.y - off.y) * delta;
	dst.u = off.u + (on.u - off.u) * delta;
	dst.v = off.v + (on.v - off.v) * delta;
	dst.color =
		((int)((off.color >> 24 & 0xff) + ((on.color >> 24 & 0xff) - (off.color >> 24 & 0xff)) * delta) << 24) |
		((int)((off.color >> 16 & 0xff) + ((on.color >> 16 & 0xff) - (off.color >> 16 & 0xff)) * delta) << 16) |
		((int)((off.color >>  8 & 0xff) + ((on.color >>  8 & 0xff) - (off.color >>  8 & 0xff)) * delta) << 8) |
		((int)((off.color       & 0xff) + ((on.color       & 0xff) - (off.color       & 0xff)) * delta));
}

//0x445B50
static inline void Tod_tClip(TriVertex& dst, const TriVertex& on, const TriVertex& off, const float edge)
{
	float delta = (edge - off.y) / (on.y - off.y);
	dst.x = off.x + (on.x - off.x) * delta;
	dst.y = off.y + (on.y - off.y) * delta;
	dst.u = off.u + (on.u - off.u) * delta;
	dst.v = off.v + (on.v - off.v) * delta;
	dst.color = 
		((int)((off.color >> 24 & 0xff) + ((on.color >> 24 & 0xff) - (off.color >> 24  & 0xff)) * delta) << 24) |
		((int)((off.color >> 16 & 0xff) + ((on.color >> 16 & 0xff) - (off.color >> 16  & 0xff)) * delta) << 16) |
		((int)((off.color >>  8 & 0xff) + ((on.color >>  8 & 0xff) - (off.color >>  8  & 0xff)) * delta) <<  8) |
		((int)((off.color       & 0xff) + ((on.color       & 0xff) - (off.color        & 0xff)) * delta));
}
static inline void Tod_bClip(TriVertex& dst, const TriVertex& on, const TriVertex& off, const float edge)
{
	float delta = (edge - off.y) / (on.y - off.y);
	dst.x = off.x + (on.x - off.x) * delta;
	dst.y = off.y + (on.y - off.y) * delta;
	dst.u = off.u + (on.u - off.u) * delta;
	dst.v = off.v + (on.v - off.v) * delta;
	dst.color = 
		((int)((off.color >> 24 & 0xff) + ((on.color >> 24 & 0xff) - (off.color >> 24  & 0xff)) * delta) << 24) |
		((int)((off.color >> 16 & 0xff) + ((on.color >> 16 & 0xff) - (off.color >> 16  & 0xff)) * delta) << 16) |
		((int)((off.color >>  8 & 0xff) + ((on.color >>  8 & 0xff) - (off.color >>  8  & 0xff)) * delta) <<  8) |
		((int)((off.color       & 0xff) + ((on.color       & 0xff) - (off.color        & 0xff)) * delta));
}

//0x445D00
static inline unsigned int Tod_leClip(TriVertex** src, TriVertex** dst, const float edge)
{
	TriVertex** _dst = dst;

	for (TriVertex** v = src; *v; ++v)
	{
		TriVertex* cur = *v;
		TriVertex* nex = *(v + 1) ? *(v + 1) : *src;

		switch ((cur->x < edge ? 1 : 0) | (nex->x < edge ? 2 : 0))
		{
		case 0:
			*dst = *v;
			++dst;
			break;
		case 1:
		{
			TriVertex& tmp = gTodVertexReservoir[gTodVertexReservoirUsed++];
			Tod_Tod_lClip(tmp, *nex, *cur, edge);
			*dst = &tmp;
			++dst;
			break;
		}
		case 2:
		{
			*dst = *v;
			++dst;
			TriVertex& tmp = gTodVertexReservoir[gTodVertexReservoirUsed++];
			Tod_Tod_lClip(tmp, *cur, *nex, edge);
			*dst = &tmp;
			++dst;
			break;
		}
		}
	}
	*dst = 0;
	return static_cast<int>(dst - _dst);
}

//0x445E00
static inline unsigned int Tod_reClip(TriVertex** src, TriVertex** dst, const float edge)
{
	TriVertex** _dst = dst;

	for (TriVertex** v = src; *v; ++v)
	{
		TriVertex* cur = *v;
		TriVertex* nex = *(v + 1) ? *(v + 1) : *src;

		switch ((cur->x > edge ? 1 : 0) | (nex->x > edge ? 2 : 0))
		{
		case 0:
			*dst = *v;
			++dst;
			break;
		case 1:
		{
			TriVertex& tmp = gTodVertexReservoir[gTodVertexReservoirUsed++];
			rClip(tmp, *nex, *cur, edge);
			*dst = &tmp;
			++dst;
			break;
		}
		case 2:
		{
			*dst = *v;
			++dst;
			TriVertex& tmp = gTodVertexReservoir[gTodVertexReservoirUsed++];
			rClip(tmp, *cur, *nex, edge);
			*dst = &tmp;
			++dst;
			break;
		}
		}
	}
	*dst = 0;
	return static_cast<int>(dst - _dst);
}

//0x445F00
static inline unsigned int Tod_teClip(TriVertex** src, TriVertex** dst, const float edge)
{
	TriVertex** _dst = dst;

	for (TriVertex** v = src; *v; ++v)
	{
		TriVertex* cur = *v;
		TriVertex* nex = *(v + 1) ? *(v + 1) : *src;

		switch ((cur->y < edge ? 1 : 0) | (nex->y < edge ? 2 : 0))
		{
		case 0:
			*dst = *v;
			++dst;
			break;
		case 1:
		{
			TriVertex& tmp = gTodVertexReservoir[gTodVertexReservoirUsed++];
			Tod_tClip(tmp, *nex, *cur, edge);
			*dst = &tmp;
			++dst;
			break;
		}
		case 2:
		{
			*dst = *v;
			++dst;
			TriVertex& tmp = gTodVertexReservoir[gTodVertexReservoirUsed++];
			Tod_tClip(tmp, *cur, *nex, edge);
			*dst = &tmp;
			++dst;
			break;
		}
		}
	}
	*dst = 0;
	return static_cast<int>(dst - _dst);
}

//0x446000
static inline unsigned int Tod_beClip(TriVertex** src, TriVertex** dst, const float edge)
{
	TriVertex** _dst = dst;

	for (TriVertex** v = src; *v; ++v)
	{
		TriVertex* cur = *v;
		TriVertex* nex = *(v + 1) ? *(v + 1) : *src;

		switch ((cur->y > edge ? 1 : 0) | (nex->y > edge ? 2 : 0))
		{
		case 0:
			*dst = *v;
			++dst;
			break;
		case 1:
		{
			TriVertex& tmp = gTodVertexReservoir[gTodVertexReservoirUsed++];
			Tod_bClip(tmp, *nex, *cur, edge);
			*dst = &tmp;
			++dst;
			break;
		}
		case 2:
		{
			*dst = *v;
			++dst;
			TriVertex& tmp = gTodVertexReservoir[gTodVertexReservoirUsed++];
			Tod_bClip(tmp, *cur, *nex, edge);
			*dst = &tmp;
			++dst;
			break;
		}
		}
	}
	*dst = 0;
	return static_cast<int>(dst - _dst);
}

//0x446100
static inline int Tod_clipShape(TriVertex** dst, TriVertex* src, const float left, const float right, const float top, const float bottom)
{
	gTodVertexReservoirUsed = 0;

	TriVertex* buf[64];
	TriVertex* ptr[4];
	ptr[0] = src;
	ptr[1] = src + 1;
	ptr[2] = src + 2;
	ptr[3] = 0;

	if (Tod_leClip(ptr, buf, left) < 3)
		return 0;
	if (Tod_reClip(buf, dst, right) < 3)
		return 0;
	if (Tod_teClip(dst, buf, top) < 3)
		return 0;
	return Tod_beClip(buf, dst, bottom);
}

bool gTodTriangleDrawAdditive = false;

#include "TodDrawTriangleInc.cpp"

//0x4461B0
TodTriangleGroup::TodTriangleGroup()
{
	mDrawMode = Graphics::DRAWMODE_NORMAL;
}

//0x4461F0
void TodTriangleGroup::DrawGroup(Graphics* g)
{
	if (mTexture.mTexture && !mVertArray.empty())
	{
		if (!g->mDestImage || !g->mDestImage->IsGpuDrawTarget())
			throw NonScreenDrawError(DrawOperation::BltTrianglesTex);
		auto* image=g->mDestImage;
		auto& render=*image->mRenderOwner;
		render.SelectDrawSurface(image);
		render.DrawTrianglesTex(mVertArray,Color::White,mDrawMode,mTexture,0.0f,0.0f,g->mLinearBlend);
		mVertArray.clear();
		gTodTriangleDrawAdditive = false;
	}
}

//0x446300
void TodTriangleGroup::AddTriangle(Graphics* g, Image* theImage, const SexyMatrix3& theMatrix, const Rect& theClipRect, const Color& theColor, int theDrawMode, const Rect& theSrcRect)
{
	TOD_ASSERT(theImage != nullptr);
	if (!g->mDestImage || !g->mDestImage->IsGpuDrawTarget())
		throw NonScreenDrawError(DrawOperation::BltTrianglesTex);
	auto& render=*g->mDestImage->mRenderOwner;
	auto* gpuTexture=render.CreateImageTexture(theImage);
	if (!gpuTexture) return;
	const TextureSource texture{gpuTexture, theImage->mWidth, theImage->mHeight, theImage->mGpuSamplingFlags};
	AddTriangle(g, texture, theMatrix, theClipRect, theColor, theDrawMode, theSrcRect);
}

void TodTriangleGroup::AddTriangle(Graphics* g, const TextureSource& texture, const SexyMatrix3& theMatrix, const Rect& theClipRect, const Color& theColor, int theDrawMode, const Rect& theSrcRect)
{
	TOD_ASSERT(texture.mTexture != nullptr);

	if (!mVertArray.empty() && (mDrawMode != theDrawMode ||
		mTexture.mTexture != texture.mTexture || mTexture.mSamplingFlags != texture.mSamplingFlags ||
		mTexture.mWidth != texture.mWidth || mTexture.mHeight != texture.mHeight))
		DrawGroup(g);
	mTexture = texture;
	mDrawMode = theDrawMode;

	SexyVector2 p[4];
	float x = -theSrcRect.mWidth * 0.5f;
	float y = -theSrcRect.mHeight * 0.5f;
	p[0].x = x;
	p[0].y = y;
	p[1].x = x;
	p[1].y = y + theSrcRect.mHeight;
	p[2].x = x + theSrcRect.mWidth;
	p[2].y = y;
	p[3].x = x + theSrcRect.mWidth;
	p[3].y = y + theSrcRect.mHeight;
	SexyVector2 tp[4];
	// Native GPU coordinates use pixel corners, matching TextureSource::BltTransformed.
	for (int i = 0; i < 4; i++)
	{
		tp[i] = theMatrix * p[i];
	}

	TOD_ASSERT(theSrcRect.mX >= 0 && theSrcRect.mWidth >= 0 && theSrcRect.mX + theSrcRect.mWidth <= mTexture.mWidth);
	TOD_ASSERT(theSrcRect.mY >= 0 && theSrcRect.mHeight >= 0 && theSrcRect.mY + theSrcRect.mHeight <= mTexture.mHeight);

	float aOneOverWidth = 1.0f / mTexture.mWidth;
	float aOneOverHeight = 1.0f / mTexture.mHeight;
	float aTexX1 = aOneOverWidth * theSrcRect.mX;
	float aTexY1 = aOneOverHeight * theSrcRect.mY;
	float aTexX2 = aOneOverWidth * (theSrcRect.mX + theSrcRect.mWidth);
	float aTexY2 = aOneOverHeight * (theSrcRect.mY + theSrcRect.mHeight);
	unsigned int aTexColor = theColor.ToInt();

	bool aNoClipping = false;
	std::array<std::array<TriVertex,3>,2> aVertBuffer;
	auto* aTriRef=aVertBuffer.data();
		if ((
				theClipRect.mX == 0 && theClipRect.mY == 0 && theClipRect.mWidth == BOARD_WIDTH && theClipRect.mHeight == BOARD_HEIGHT
			) || (
				theClipRect.mX <= tp[0].x && theClipRect.mX + theClipRect.mWidth >= tp[0].x && 
				theClipRect.mX <= tp[1].x && theClipRect.mX + theClipRect.mWidth >= tp[1].x &&
				theClipRect.mX <= tp[2].x && theClipRect.mX + theClipRect.mWidth >= tp[2].x && 
				theClipRect.mX <= tp[3].x && theClipRect.mX + theClipRect.mWidth >= tp[3].x &&
				theClipRect.mY <= tp[0].y && theClipRect.mY + theClipRect.mHeight >= tp[0].y && 
				theClipRect.mY <= tp[1].y && theClipRect.mY + theClipRect.mHeight >= tp[1].y &&
				theClipRect.mY <= tp[2].y && theClipRect.mY + theClipRect.mHeight >= tp[2].y && 
				theClipRect.mY <= tp[3].y && theClipRect.mY + theClipRect.mHeight >= tp[3].y
			))
		{
			aNoClipping = true;
			const auto start=mVertArray.size();
			mVertArray.resize(start+2);
			aTriRef=mVertArray.data()+start;
		}

	aTriRef[0][0].x = tp[0].x;
	aTriRef[0][0].y = tp[0].y;
	aTriRef[0][0].u = aTexX1;
	aTriRef[0][0].v = aTexY1;
	aTriRef[0][0].color = aTexColor;
	aTriRef[0][1].x = tp[1].x;
	aTriRef[0][1].y = tp[1].y;
	aTriRef[0][1].u = aTexX1;
	aTriRef[0][1].v = aTexY2;
	aTriRef[0][1].color = aTexColor;
	aTriRef[0][2].x = tp[2].x;
	aTriRef[0][2].y = tp[2].y;
	aTriRef[0][2].u = aTexX2;
	aTriRef[0][2].v = aTexY1;
	aTriRef[0][2].color = aTexColor;
	aTriRef[1][0].x = tp[2].x;
	aTriRef[1][0].y = tp[2].y;
	aTriRef[1][0].u = aTexX2;
	aTriRef[1][0].v = aTexY1;
	aTriRef[1][0].color = aTexColor;
	aTriRef[1][1].x = tp[1].x;
	aTriRef[1][1].y = tp[1].y;
	aTriRef[1][1].u = aTexX1;
	aTriRef[1][1].v = aTexY2;
	aTriRef[1][1].color = aTexColor;
	aTriRef[1][2].x = tp[3].x;
	aTriRef[1][2].y = tp[3].y;
	aTriRef[1][2].u = aTexX2;
	aTriRef[1][2].v = aTexY2;
	aTriRef[1][2].color = aTexColor;

	if (!aNoClipping)
	{
		TriVertex* clipped[64];
		float clipX0 = theClipRect.mX;
		float clipY0 = theClipRect.mY;
		float clipX1 = theClipRect.mX + theClipRect.mWidth;
		float clipY1 = theClipRect.mY + theClipRect.mHeight;
		
		for (int i = 0; i < 2; i++)
		{
			int vCount = Tod_clipShape(clipped, aTriRef[i].data(), clipX0, clipX1, clipY0, clipY1);
			for (int j = 0; j < vCount - 2; j++)
			{
				mVertArray.push_back({*clipped[0],*clipped[j+1],*clipped[j+2]});
			}
		}
	}
}
