#include "RenderInterface.h"
#include "ResidentImage.h"
#include "DDInterface.h"
#include "DDImage.h"
#include "Graphics.h"
#include "misc/AutoCrit.h"
#include "misc/SexyMatrix.h"
#include "SexyAppBase.h"
#include "TriVertex.h"
#include "imagelib/ImageLib.h"
#include <assert.h>
#include <algorithm>
#include <array>
#include <cmath>
#include <stdexcept>
#include <vector>

#pragma warning(disable:4244)

using namespace Sexy;
namespace {
TextureData* NativeImageData(Image* image)
{
	if (auto* resident=AsResidentImage(image)) return resident->mTextureData.get();
	if (auto* memory=AsMemoryImage(image)) return static_cast<TextureData*>(memory->mD3DData);
	return nullptr;
}
}
static uint32_t gGpuSourceSamplingFlags = 0;
namespace {
class TextureSamplingScope {
	uint32_t mPrevious;
public:
	explicit TextureSamplingScope(uint32_t flags) : mPrevious(gGpuSourceSamplingFlags) { gGpuSourceSamplingFlags=flags; }
	~TextureSamplingScope() { gGpuSourceSamplingFlags=mPrevious; }
};
uint32_t CombinedImageSamplingFlags()
{
	const auto overrideFlags=RenderInterface::sImageSamplingFlags;
	const auto sourceFlags=gGpuSourceSamplingFlags;
	// Color filter bits encode one enum, not independent feature flags.
	return (sourceFlags & ((overrideFlags & 0x30000000u) ? ~0x30000000u : ~0u)) |
		overrideFlags;
}
}

static bool gLinearFilter = false;
static GpuRenderer* gGpuRenderer = NULL;
static int gGpuCurrentDrawMode = 0;
static int gGpuSceneWidth = 800;
static int gGpuSceneHeight = 600;

// Framework-local primitive topology, expanded to native Vulkan triangle lists.
enum PrimitiveType
{
	PRIMITIVE_TRIANGLELIST = 0,
	PRIMITIVE_TRIANGLESTRIP = 1,
	PRIMITIVE_TRIANGLEFAN = 2
};

namespace
{
struct ScreenVertex
{
	float sx, sy, sz, rhw;
	DWORD color;
	float tu, tv;
};

#define RGBA_MAKE(r, g, b, a) (((DWORD)(a) << 24) | ((DWORD)(r) << 16) | ((DWORD)(g) << 8) | (DWORD)(b))

struct VertexList
{
	enum { MAX_STACK_VERTS = 100 };
	ScreenVertex mStackVerts[MAX_STACK_VERTS];
	ScreenVertex *mVerts;
	int mSize;
	int mCapacity;

	typedef int size_type;

	VertexList() : mVerts(mStackVerts), mSize(0), mCapacity(MAX_STACK_VERTS) { }
	VertexList(const VertexList &theList) : mVerts(mStackVerts), mSize(0), mCapacity(MAX_STACK_VERTS)
	{
		reserve(theList.mSize);
		mSize = theList.mSize;
		memcpy(mVerts, theList.mVerts, mSize*sizeof(mVerts[0]));
	}

	~VertexList()
	{
		if (mVerts != mStackVerts)
			delete[] mVerts;
	}

	void reserve(int theCapacity)
	{
		if (mCapacity < theCapacity)
		{
			mCapacity = theCapacity;
			ScreenVertex *aNewList = new ScreenVertex[theCapacity];
			memcpy(aNewList, mVerts, mSize*sizeof(mVerts[0]));
			if (mVerts != mStackVerts)
				delete[] mVerts;
			mVerts = aNewList;
		}
	}

	void push_back(const ScreenVertex &theVert)
	{
		if (mSize == mCapacity)
			reserve(mCapacity*2);
		mVerts[mSize++] = theVert;
	}

	void operator=(const VertexList &theList)
	{
		reserve(theList.mSize);
		mSize = theList.mSize;
		memcpy(mVerts, theList.mVerts, mSize*sizeof(mVerts[0]));
	}

	ScreenVertex& operator[](int thePos)
	{
		return mVerts[thePos];
	}

};
}  // namespace

static void RequireImageDimensions(const GpuRenderer* renderer, int width, int height)
{
	if (!renderer)
		throw std::logic_error("Image creation requires a native Vulkan renderer");
	const uint32_t limit = renderer->MaxImageDimension2D();
	if (width <= 0 || height <= 0 || uint32_t(width) > limit || uint32_t(height) > limit)
		throw std::invalid_argument("Image dimensions exceed the Vulkan device limit");
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
RenderInterface::RenderInterface()
{
	mHWnd = NULL;
	mWidth = 640;
	mHeight = 480;
	mRenderer = NULL;
	mPresentWidth = 0;
	mPresentHeight = 0;
	mSceneBegun = false;
	mIsWindowed = true;
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
RenderInterface::~RenderInterface()
{
	Cleanup();
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
bool RenderInterface::InitGPU()
{
	mPresentWidth = mPresentWidth > 0 ? mPresentWidth : mWidth;
	mPresentHeight = mPresentHeight > 0 ? mPresentHeight : mHeight;

	gLinearFilter = false;
	RenderInterface::sSamplerAddressWrap = false;

	const std::string shaderDir = AddTrailingSlash(GetExecutableDirectory(), true) + "shaders/";
	const GpuHdrParams hdr{gSexyAppBase->mScaleHDRPaperWhite,gSexyAppBase->mScaleHDRMaxNits,
        gSexyAppBase->mScaleHDRReinhardPaperNits,gSexyAppBase->mScaleHDRStrength};
    mRenderer = GpuBackendDetail::CreateRenderer<BuildConfig::Graphics, GpuRenderer>(
        *gSexyAppBase->mGpuContext, mWidth, mHeight,
        shaderDir, gSexyAppBase->mScaleHDREnabled ? &hdr : nullptr);
	mRenderer->PrepareLoadingPipelines();

	gGpuRenderer = mRenderer;
	gGpuSceneWidth = mWidth;
	gGpuSceneHeight = mHeight;
	return true;
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
bool RenderInterface::InitFromDDInterface(DDInterface *theInterface)
{
	mHWnd = theInterface->mHWnd;
	mWidth = theInterface->mWidth;
	mHeight = theInterface->mHeight;
	mPresentWidth = theInterface->mDisplayWidth;
	mPresentHeight = theInterface->mDisplayHeight;
	mIsWindowed = theInterface->mIsWindowed;

	return InitGPU();
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
bool RenderInterface::ResizePresent(int thePresentWidth, int thePresentHeight)
{
    if (mRenderer == nullptr) throw std::logic_error("Resize without a native Vulkan renderer");
    if (mSceneBegun) Flush();
    if (!mRenderer->ResizePresent()) return false;
    mPresentWidth = thePresentWidth;
    mPresentHeight = thePresentHeight;
    return true;
}

void RenderInterface::ResizeScene(int width, int height)
{
    if (mSceneBegun) Flush();
    mRenderer->ResizeScene(width, height);
    mWidth = gGpuSceneWidth = width;
    mHeight = gGpuSceneHeight = height;
}

bool RenderInterface::PresentRetainedFrame()
{
    if (!mRenderer || mSceneBegun)
        throw NativeDisplayError(NativeDisplayOperation::PresentRetainedFrame,DDInterface::RESULT_FAIL);
    if (gSexyAppBase->mPhysMinimized) return false;
    // No first scene yet, iconified surface, and an out-of-date acquire are
    // temporary deferrals. Never latch them as permanent renderer failures.
    return mRenderer->PresentRetainedScene();
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
bool RenderInterface::PreDraw()
{
	if (gSexyAppBase->mPhysMinimized && mDrawSurface == nullptr)
		return false;

	if (mRenderer == NULL)
		throw std::logic_error("Drawing without a native Vulkan renderer");

	if (!mSceneBegun)
	{
		if (!mRenderer->BeginScene()) return false;
		mSceneBegun = true;
	}
	return true;
}

DDImage* RenderInterface::CreateRenderImage(int width, int height)
{
	RequireImageDimensions(mRenderer, width, height);
	auto image = std::make_unique<DDImage>(gSexyAppBase->mDDInterface);
	image->mWidth = width;
	image->mHeight = height;
	image->mHasTrans = true;
	image->mHasAlpha = true;
	image->mForcedMode = true;
	image->mPurgeBits = true;
	auto data = std::make_unique<TextureData>();
	data->mWidth = width;
	data->mHeight = height;
	data->mPixelFormat = PixelFormat_A8R8G8B8;
	data->mBitsChangedCount = image->mBitsChangedCount;
	data->mGPUOwned = true;
	data->mRenderTarget = true;
	data->mTexture = mRenderer->CreateRenderImage(width,height);
	mImageSet.insert(image.get());
	image->mD3DData = data.release();
	return image.release();
}

ResidentImage* RenderInterface::CreateResidentRenderImage(int width,int height)
{
	if (CurrentNativeThreadIdentity()!=gSexyAppBase->mPrimaryThreadId) throw GpuImageCpuAccess{};
	RequireImageDimensions(mRenderer,width,height);
	auto image=std::make_unique<ResidentImage>();
	image->mWidth=width;image->mHeight=height;
	auto data=std::make_unique<TextureData>();
	data->mWidth=width;data->mHeight=height;
	data->mPixelFormat=PixelFormat_A8R8G8B8;
	data->mGPUOwned=true;data->mRenderTarget=true;
	data->mTexture=mRenderer->CreateRenderImage(width,height);
	mResidentImageSet.insert(image.get());
	image->mRenderOwner=this;
	image->mTextureData=std::move(data);
	return image.release();
}

ResidentImage* RenderInterface::CreateResidentFilterImage(ResidentImage* source,GpuImageColorFilter filter)
{
	if (!source || !CreateImageTexture(source))
		throw std::invalid_argument("Resident filter requires a source texture");
	const auto& original=*source->mTextureData;
	auto image=std::make_unique<ResidentImage>();
	image->mWidth=source->mWidth;image->mHeight=source->mHeight;
	image->mNumRows=source->mNumRows;image->mNumCols=source->mNumCols;
	image->mFilePath=source->mFilePath;
	auto data=std::make_unique<TextureData>();
	data->mTexture=original.mTexture;
	data->mWidth=original.mWidth;data->mHeight=original.mHeight;
	data->mPixelFormat=original.mPixelFormat;
	data->mGPUOwned=true;data->mOwnsTexture=false;
	data->mSamplingFlags=(original.mSamplingFlags & ~0x30000000u) |
		static_cast<uint32_t>(filter);
	image->mGpuSamplingFlags=data->mSamplingFlags;
	image->mFilterOwner=source;
	mResidentImageSet.insert(image.get());
	image->mRenderOwner=this;
	image->mTextureData=std::move(data);
	return image.release();
}

DDImage* RenderInterface::ProcessImage(MemoryImage* source,const GpuImageProcessing& processing)
{
	if(CurrentNativeThreadIdentity()!=gSexyAppBase->mPrimaryThreadId || !source)
		throw GpuImageCpuAccess{};
	RequireImageDimensions(mRenderer, processing.width, processing.height);
	if (processing.x<0 || processing.y<0 || processing.width>source->mWidth ||
		processing.height>source->mHeight || processing.x>source->mWidth-processing.width ||
		processing.y>source->mHeight-processing.height)
		throw std::invalid_argument("Image processing rectangle exceeds logical image");
	source->mPurgeBits=true;
	if(!CreateImageTexture(source)) throw GpuImageCpuAccess{};
	const auto& original=*static_cast<const TextureData*>(source->mD3DData);
	auto image=std::make_unique<DDImage>(gSexyAppBase->mDDInterface);
	image->mWidth=processing.width;image->mHeight=processing.height;
	image->mHasTrans=true;image->mHasAlpha=true;image->mForcedMode=true;image->mPurgeBits=true;
	auto data=std::make_unique<TextureData>();
	data->mWidth=processing.width;
	data->mHeight=processing.height;
	data->mPixelFormat=PixelFormat_A8R8G8B8;
	data->mBitsChangedCount=image->mBitsChangedCount;
	data->mGPUOwned=true;data->mRenderTarget=false;
	data->mTexture=mRenderer->ProcessImage(original.mTexture,processing);
	mImageSet.insert(image.get());
	image->mD3DData=data.release();
	return image.release();
}

void RenderInterface::RenderFontAtlas(DDImage* target,MemoryImage* source,
	std::span<const GpuFontGlyph> glyphs,bool forceWhite)
{
	if(!CreateImageTexture(source)) throw GpuImageCpuAccess{};
	auto& sourceData=*static_cast<TextureData*>(source->mD3DData);
	auto& targetData=*static_cast<TextureData*>(target->mD3DData);
	GpuImageDrawScope drawing(*this,target);
	if (!PreDraw()) throw std::exception{};
	mRenderer->RenderFontAtlas(targetData.mTexture,sourceData.mTexture,
		glyphs,source->mGpuSamplingFlags,forceWhite);
}

void RenderInterface::SelectDrawSurface(Image* image)
{
	GpuTexture* target = nullptr;
	if (image != nullptr && image != gSexyAppBase->mDDInterface->mScreenImage)
	{
		auto* data = NativeImageData(image);
		if (data == nullptr || !data->mRenderTarget || !data->mTexture)
			throw std::logic_error("Drawing requires a native GPU image target");
		target = data->mTexture;
	}
	else image = nullptr;
	mRenderer->SetRenderImage(target);
	mDrawSurface = image;
	mSceneBegun = mRenderer->sceneOpen;
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
TextureData::TextureData()
{
	mTexture = nullptr;
	mRenderTarget = false;
	mWidth = 0;
	mHeight = 0;
	mBitsChangedCount = 0;
	mStaticSlot = 0xFFFFFFFFu;
	mPixelFormat = PixelFormat_Unknown;
	mGPUOwned = false;
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
TextureData::~TextureData()
{
	ReleaseTextures();
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
void TextureData::ReleaseTextures()
{
	if (mTexture && mOwnsTexture)
		gGpuRenderer->DestroyTexture(mTexture);
	mTexture = nullptr;
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
ImagePixels TextureData::ReadPixels() const
{
	if(mWidth<=0 || mHeight<=0 || !mTexture)
		throw std::logic_error("Missing or invalid diagnostic texture");
	if(!gGpuRenderer)throw std::logic_error("No renderer for texture readback");
	auto result=gGpuRenderer->ReadTexturePixels(mTexture);
	if(result.width!=mWidth || result.height!=mHeight)
		throw std::logic_error("GPU readback dimensions disagree with source image");
	return result;
}

ImagePixels RenderInterface::ReadImagePixels(const MemoryImage& image)
{
	if(CurrentNativeThreadIdentity()!=image.mApp->mPrimaryThreadId) throw GpuImageCpuAccess{};
	if(mSceneBegun)throw std::logic_error("Image readback requires Flush before snapshot");
	if(image.mPendingDecoded) CreateImageTexture(const_cast<MemoryImage*>(&image));
	const auto* screen=AsDDImage(&image);
	if(screen && screen->mDDInterface && screen->mDDInterface->mScreenImage==screen)
	{
		if(screen->mDDInterface->mRenderInterface!=this)
			throw std::invalid_argument("Screen does not belong to this renderer");
		ImagePixels result(image.mWidth,image.mHeight);result.pixels=mRenderer->ReadScenePixels();return result;
	}
	if(image.mBits || image.mColorTable)
	{
		ImagePixels result(image.mWidth,image.mHeight);
		if(image.mBits)
			std::copy_n(image.mBits,result.pixels.size(),result.pixels.begin());
		else
		{
			if(!image.mColorIndices)throw std::logic_error("Indexed image has no indices");
			for(size_t i=0;i<result.pixels.size();++i)result.pixels[i]=image.mColorTable[image.mColorIndices[i]];
		}
		if(image.mForcedMode && !image.mHasAlpha && !image.mHasTrans)
			for(auto& pixel:result.pixels)pixel|=0xff000000u;
		return result;
	}
	if(image.mD3DData)
	{
		const auto& data=*static_cast<const TextureData*>(image.mD3DData);
		if(data.mWidth!=image.mWidth || data.mHeight!=image.mHeight ||
			data.mBitsChangedCount!=image.mBitsChangedCount)
			throw std::logic_error("GPU image is stale and CPU pixels are unavailable: "+image.mFilePath);
		return data.ReadPixels();
	}
	throw std::logic_error("Image has no exportable CPU pixels or resident GPU texture: "+image.mFilePath);
}

ImagePixels RenderInterface::ReadImagePixels(const Image& image)
{
	if (const auto* memory=AsMemoryImage(&image)) return ReadImagePixels(*memory);
	const auto* resident=AsResidentImage(&image);
	if (!resident) throw std::invalid_argument("Image has no native texture to read");
	if (CurrentNativeThreadIdentity()!=gSexyAppBase->mPrimaryThreadId) throw GpuImageCpuAccess{};
	if (mSceneBegun) throw std::logic_error("Image readback requires Flush before snapshot");
	auto* source=const_cast<ResidentImage*>(resident);
	if (!CreateImageTexture(source)) throw std::logic_error("Resident image has no texture");
	if (source->mTextureData->mSamplingFlags & 0x30000000u)
	{
		// Filter aliases own no pixel copy. Materialize only for this explicit
		// diagnostic request; gameplay uses the same source texture directly.
		struct DiagnosticState
		{
			RenderInterface& render;
			TransformStack transforms;
			uint32_t flags;
			bool wrap,linear;
			explicit DiagnosticState(RenderInterface& value) :
				render(value),transforms(std::move(value.mTransformStack)),
				flags(sImageSamplingFlags),wrap(sSamplerAddressWrap),linear(gLinearFilter)
			{
				render.mTransformStack.clear();
				sImageSamplingFlags=0;
				sSamplerAddressWrap=false;
			}
			~DiagnosticState()
			{
				render.mTransformStack=std::move(transforms);
				sImageSamplingFlags=flags;
				sSamplerAddressWrap=wrap;
				gLinearFilter=linear;
			}
		} diagnosticState(*this);
		std::unique_ptr<ResidentImage> target(CreateResidentRenderImage(source->mWidth,source->mHeight));
		{
			GpuImageDrawScope drawing(*this,target.get());
			Blt(source,0,0,Rect(0,0,source->mWidth,source->mHeight),Color(255,255,255,255),2,false);
		}
		Flush();
		return target->mTextureData->ReadPixels();
	}
	return source->mTextureData->ReadPixels();
}

namespace {
// 裸图展平：把该图自身的颜色合成与嵌套层全部应用，返回合成结果裸图
// （与批量化前 UploadDecodedImage 递归语义逐位一致，只是不再全局登记）。
GpuTexture* UploadDecodedRaw(GpuRenderer& renderer,const ImageLib::Image& image)
{
	RequireImageDimensions(&renderer,image.mWidth,image.mHeight);
	GpuTexture* base=renderer.CreateRawTexture(image.mWidth,image.mHeight,
		image.mBits,image.mWidth*4);
	if(image.mColorFromAlpha)
		base=renderer.ComposeAlphaRaw(base,base,1,1,*image.mColorFromAlpha,true);
	for(const auto& layer:image.mAlphaLayers) {
		GpuTexture* alphaMask=UploadDecodedRaw(renderer,*layer.image);
		base=renderer.ComposeAlphaRaw(base,alphaMask,layer.columns,layer.rows,0,false);
	}
	return base;
}

GpuTexture* UploadDecodedImage(GpuRenderer& renderer,const ImageLib::Image& image,
	const unsigned int* primary=nullptr)
{
	RequireImageDimensions(&renderer,image.mWidth,image.mHeight);
	// 2026-10-11 用户裁决：只有最终可绘制结果进全局纹理表。合成链的底图/
	// 掩码/中间结果一律裸图，调用链内传句柄，批次完成后由渲染器统一销毁。
	const void* bits=primary?static_cast<const void*>(primary):image.mBits;
	if(!image.mColorFromAlpha && image.mAlphaLayers.empty())
		return renderer.CreateTexture(image.mWidth,image.mHeight,bits,image.mWidth*4,false);
	GpuTexture* base=renderer.CreateRawTexture(image.mWidth,image.mHeight,bits,image.mWidth*4);
	if(image.mColorFromAlpha)
		base=renderer.ComposeAlphaRaw(base,base,1,1,*image.mColorFromAlpha,true);
	for(const auto& layer:image.mAlphaLayers) {
		GpuTexture* alphaMask=UploadDecodedRaw(renderer,*layer.image);
		base=renderer.ComposeAlphaRaw(base,alphaMask,layer.columns,layer.rows,0,false);
	}
	return renderer.AdoptComposedTexture(base);
}
}

void TextureData::CreateTextures(MemoryImage *theImage)
{
	RequireImageDimensions(gGpuRenderer,theImage->mWidth,theImage->mHeight);
	if(theImage->mPendingDecoded) {
		const auto retire=[](GpuTexture* texture){gGpuRenderer->DestroyTexture(texture);};
		std::unique_ptr<GpuTexture,decltype(retire)> texture(
			UploadDecodedImage(*gGpuRenderer,*theImage->mPendingDecoded,theImage->mBits),retire);
		ReleaseTextures();
		if(mStaticSlot!=UINT32_MAX)
			gGpuRenderer->BindStaticTexture(texture.get(),mStaticSlot);
		mTexture=texture.release();
		mWidth=theImage->mWidth;mHeight=theImage->mHeight;
		mPixelFormat=PixelFormat_A8R8G8B8;
		mBitsChangedCount=theImage->mBitsChangedCount;
		mGPUOwned=false;mRenderTarget=false;
		theImage->mPendingDecoded.reset();
		return;
	}
	unsigned int* aSourceBits = theImage->mColorTable == NULL ? theImage->GetBits() : NULL;
	theImage->DeleteSWBuffers();
	theImage->CommitBits();

	const int& aWidth = theImage->mWidth;
	const int& aHeight = theImage->mHeight;
	std::vector<uint32_t> aExpanded;
	if(theImage->mColorTable)
	{
		if(!theImage->mColorIndices)
			throw std::logic_error("Indexed image has no indices");
		aExpanded.resize(size_t(aWidth)*aHeight);
		for(size_t i=0;i<aExpanded.size();++i)
			aExpanded[i]=theImage->mColorTable[theImage->mColorIndices[i]];
	}
	// BGRA bytes remain unchanged; opaque input is a renderer view policy.
	const void* pixels=theImage->mColorTable ? static_cast<const void*>(aExpanded.data()) : aSourceBits;
	const bool aOpaque=!theImage->mHasAlpha && !theImage->mHasTrans;
	mTexture=mStaticSlot!=UINT32_MAX && !mTexture
		? gGpuRenderer->CreateTextureStatic(aWidth,aHeight,pixels,aWidth*4,aOpaque,mStaticSlot)
		: gGpuRenderer->ReplaceTexture(mTexture,aWidth,aHeight,pixels,aWidth*4,aOpaque);
	mWidth = theImage->mWidth;
	mHeight = theImage->mHeight;
	mBitsChangedCount = theImage->mBitsChangedCount;
	mPixelFormat = PixelFormat_A8R8G8B8;
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
void TextureData::CheckCreateTextures(MemoryImage *theImage)
{
	// GPU-owned（池水焦散）：compute 直写纹理，位图变化不再触发任何重传
	if (mGPUOwned)
		return;
	const bool aFmt = mPixelFormat == PixelFormat_Unknown;
	const bool aSize = !aFmt && (theImage->mWidth != mWidth || theImage->mHeight != mHeight);
	const bool aBits = !aFmt && !aSize && theImage->mBitsChangedCount != mBitsChangedCount;
	if (aFmt || aSize || aBits)
	{
		CreateTextures(theImage);
	}
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
static void SubmitNativeTriangles(std::span<const GpuVertex> vertices,
	GpuTexture* texture,bool linearFilter,int drawMode,const Rect* clipRect)
{
	const int mode=drawMode<0?gGpuCurrentDrawMode:drawMode;
	GpuClip clip{};
	if(clipRect) clip={clipRect->mX,clipRect->mY,clipRect->mWidth,clipRect->mHeight};
	const auto blend=mode==1?GpuBlend::Additive:mode==2?GpuBlend::Opaque:GpuBlend::Normal;
	gGpuRenderer->SubmitTriangles(vertices,texture,linearFilter,RenderInterface::sSamplerAddressWrap,
		blend,clipRect?&clip:nullptr);
}

template<class VertexAt>
static void SubmitTextureTriangleBatch(size_t triangleCount,VertexAt vertexAt,
	const TextureData& data,DWORD color,float tx,float ty)
{
	if(!triangleCount) return;
	GpuTexture* texture=data.mTexture;
	TextureSamplingScope sampling(data.mSamplingFlags);
	const size_t count=triangleCount*3;
	GpuVertex local[192];
	auto* vertices=local;
	if(count>std::size(local)) {
		// SubmitTriangles copies this span into its owned mapped stream before returning.
		static thread_local std::vector<GpuVertex> scratch;
		scratch.resize(count);
		vertices=scratch.data();
	}
	const uint32_t slot=GpuRenderer::SlotOf(texture)|CombinedImageSamplingFlags();
	const uint32_t sampler=(gLinearFilter?1u:0u)|(RenderInterface::sSamplerAddressWrap?2u:0u);
	for(size_t i=0;i<count;++i) {
		const auto& source=vertexAt(i);
		const DWORD tint=source.color?source.color:color;
		vertices[i]={source.x+tx,source.y+ty,
			((tint>>16)&0xff)/255.0f,((tint>>8)&0xff)/255.0f,
			(tint&0xff)/255.0f,((tint>>24)&0xff)/255.0f,
			source.u,source.v,slot,sampler};
	}
	SubmitNativeTriangles(std::span<const GpuVertex>(vertices,count),texture,gLinearFilter,-1,nullptr);
}

static void SubmitGpuTriangles(
	const ScreenVertex* theVertices,
	int theNumVertices,
	PrimitiveType theType,
	GpuTexture* theSRV,
	bool theLinearFilter,
	int theDrawMode,
	const Rect* theClipRect)
{
	if (gGpuRenderer == NULL || theNumVertices <= 0)
		return;
	int aDrawMode = theDrawMode < 0 ? gGpuCurrentDrawMode : theDrawMode;

	// P5（2026-10-05 真凶）：原 4096 顶点栈缓冲=128KB/次调用，Windows x64 栈探
	// 测逐页摸 32 页 ≈5µs×每帧~175 提交=0.9ms/帧。降为 192 顶点（6KB 两页）
	// + 超限回落堆；实测提交计数 99.9% 走栈路
	GpuVertex aLocal[192];
	const size_t aRequired = theType == PRIMITIVE_TRIANGLELIST ? size_t(theNumVertices) :
		size_t(std::max(0, theNumVertices - 2)) * 3;
	std::vector<GpuVertex> aLarge;
	if (aRequired > std::size(aLocal)) aLarge.resize(aRequired);
	GpuVertex* aConverted = aLarge.empty() ? aLocal : aLarge.data();
	int aCount = 0;
	const uint32_t aSlot = GpuRenderer::SlotOf(theSRV) | CombinedImageSamplingFlags();
	// 采样器索引同法逐顶点携带（bit0=线性 bit1=重复），消除描述符重绑
	const uint32_t aSampler = (gLinearFilter ? 1u : 0u) | (RenderInterface::sSamplerAddressWrap ? 2u : 0u);

	auto ConvertVertex = [&](const ScreenVertex& theVertex)
	{
		GpuVertex& aOut = aConverted[aCount++];
		aOut.x = theVertex.sx;
		aOut.y = theVertex.sy;
		aOut.r = ((theVertex.color >> 16) & 0xFF) / 255.0f;
		aOut.g = ((theVertex.color >> 8) & 0xFF) / 255.0f;
		aOut.b = (theVertex.color & 0xFF) / 255.0f;
		aOut.a = ((theVertex.color >> 24) & 0xFF) / 255.0f;
		aOut.u = theVertex.tu;
		aOut.v = theVertex.tv;
		aOut.slot = aSlot;
		aOut.sampler = aSampler;
	};

	if (theType == PRIMITIVE_TRIANGLESTRIP)
	{
		for (int i = 0; i + 2 < theNumVertices; i++)
		{
			ConvertVertex(theVertices[i]);
			ConvertVertex(theVertices[i + 1]);
			ConvertVertex(theVertices[i + 2]);
		}
	}
	else if (theType == PRIMITIVE_TRIANGLEFAN)
	{
		for (int i = 1; i + 1 < theNumVertices; i++)
		{
			ConvertVertex(theVertices[0]);
			ConvertVertex(theVertices[i]);
			ConvertVertex(theVertices[i + 1]);
		}
	}
	else
	{
		for (int i = 0; i < theNumVertices; i++)
			ConvertVertex(theVertices[i]);
	}

    GpuClip aClip{};
    if (theClipRect)
        aClip = {theClipRect->mX, theClipRect->mY, theClipRect->mWidth, theClipRect->mHeight};
    const auto aBlend = aDrawMode == 1 ? GpuBlend::Additive :
        aDrawMode == 2 ? GpuBlend::Opaque : GpuBlend::Normal;
    gGpuRenderer->SubmitTriangles(
        std::span<const GpuVertex>(aConverted, aCount), theSRV,
        theLinearFilter, RenderInterface::sSamplerAddressWrap, aBlend, theClipRect ? &aClip : nullptr);
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
namespace
{
template<class Pred>
struct PointClipper
{
	Pred mPred;

	float GetCoord(const ScreenVertex &theVertex, int n)
	{
		if (n == 0)
			return theVertex.sx;
		if (n == 1)
			return theVertex.sy;
		if (n == 3)
			return theVertex.tu;
		return theVertex.tv;
	}

	void SetCoord(ScreenVertex &theVertex, int n, float theValue)
	{
		if (n == 0)
			theVertex.sx = theValue;
		else if (n == 1)
			theVertex.sy = theValue;
		else if (n == 3)
			theVertex.tu = theValue;
		else
			theVertex.tv = theValue;
	}

	ScreenVertex Interpolate(const ScreenVertex &v1, const ScreenVertex &v2, float t)
	{
		ScreenVertex result;
		result.sx = v1.sx + (v2.sx-v1.sx)*t;
		result.sy = v1.sy + (v2.sy-v1.sy)*t;
		result.sz = v1.sz + (v2.sz-v1.sz)*t;
		result.rhw = v1.rhw + (v2.rhw-v1.rhw)*t;
		result.color = v1.color;
		result.tu = v1.tu + (v2.tu-v1.tu)*t;
		result.tv = v1.tv + (v2.tv-v1.tv)*t;
		return result;
	}

	void ClipPoint(int n, float clipVal, ScreenVertex &v1, ScreenVertex &v2, VertexList &out)
	{
		float aV1 = GetCoord(v1,n);
		float aV2 = GetCoord(v2,n);
		// Inside means the coordinate survives this clip. The original
		// clip keeps NOT-mPred: less() keeps coord >= left, greater_equal()
		// keeps coord < right, so the polygon stays inside the rect.
		bool aV1Inside = !mPred(aV1, clipVal);
		bool aV2Inside = !mPred(aV2, clipVal);

		if (aV1Inside && aV2Inside)
		{
			out.push_back(v2);
		}
		else if (aV1Inside && !aV2Inside)
		{
			float t = (clipVal - aV1) / (aV2 - aV1);
			out.push_back(Interpolate(v1, v2, t));
		}
		else if (!aV1Inside && aV2Inside)
		{
			float t = (clipVal - aV1) / (aV2 - aV1);
			out.push_back(Interpolate(v1, v2, t));
			out.push_back(v2);
		}
	}

	void ClipPoints(int n, float clipVal, VertexList &in, VertexList &out)
	{
		if (in.mSize < 2)
			return;
		ClipPoint(n, clipVal, in[in.mSize-1], in[0], out);
		for (VertexList::size_type i=0; i<in.mSize-1; i++)
			ClipPoint(n, clipVal, in[i], in[i+1], out);
	}
};
}  // namespace

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
static void DrawPolyClipped(const Rect *theClipRect, const VertexList &theList, GpuTexture* theSRV)
{
	VertexList l1, l2;
	l1 = theList;

	int left = theClipRect->mX;
	int right = left + theClipRect->mWidth;
	int top = theClipRect->mY;
	int bottom = top + theClipRect->mHeight;

	VertexList *in = &l1, *out = &l2;
	PointClipper<std::less<float> > aLessClipper;
	PointClipper<std::greater_equal<float> > aGreaterClipper;

	aLessClipper.ClipPoints(0, left, *in, *out); std::swap(in, out); out->mSize = 0;
	aLessClipper.ClipPoints(1, top, *in, *out); std::swap(in, out); out->mSize = 0;
	aGreaterClipper.ClipPoints(0, right, *in, *out); std::swap(in, out); out->mSize = 0;
	aGreaterClipper.ClipPoints(1, bottom, *in, *out);

	VertexList &aList = *out;
	if (aList.mSize >= 3)
	{
		SubmitGpuTriangles(&aList[0], (int)aList.mSize, PRIMITIVE_TRIANGLEFAN, theSRV, gLinearFilter, -1, NULL);
	}
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
void TextureData::Blt(float theX, float theY, const Rect& theSrcRect, const Color& theColor)
{
	TextureSamplingScope sampling(mSamplingFlags);
	if(theSrcRect.mWidth<=0 || theSrcRect.mHeight<=0)
		return;
	const float u1=float(theSrcRect.mX)/mWidth;
	const float v1=float(theSrcRect.mY)/mHeight;
	const float u2=(float(theSrcRect.mX)+theSrcRect.mWidth)/mWidth;
	const float v2=(float(theSrcRect.mY)+theSrcRect.mHeight)/mHeight;
	const float right=theX+theSrcRect.mWidth;
	const float bottom=theY+theSrcRect.mHeight;
	DWORD aColor = RGBA_MAKE(theColor.mRed, theColor.mGreen, theColor.mBlue, theColor.mAlpha);
	ScreenVertex aVertex[4] =
	{
		{ theX, theY, 0, 1, aColor, u1, v1 },
		{ theX, bottom, 0, 1, aColor, u1, v2 },
		{ right, theY, 0, 1, aColor, u2, v1 },
		{ right, bottom, 0, 1, aColor, u2, v2 }
	};
	SubmitGpuTriangles(aVertex, 4, PRIMITIVE_TRIANGLESTRIP, mTexture, gLinearFilter, -1, NULL);
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
void TextureData::BltTransformed(const SexyMatrix3 &theTrans, const Rect& theSrcRect, const Color& theColor, const Rect *theClipRect, float theX, float theY, bool center)
{
	TextureSamplingScope sampling(mSamplingFlags);
	if(theSrcRect.mWidth<=0 || theSrcRect.mHeight<=0)
		return;
	const float x=center ? -theSrcRect.mWidth/2.0f : 0.0f;
	const float y=center ? -theSrcRect.mHeight/2.0f : 0.0f;
	const float u1=float(theSrcRect.mX)/mWidth;
	const float v1=float(theSrcRect.mY)/mHeight;
	const float u2=(float(theSrcRect.mX)+theSrcRect.mWidth)/mWidth;
	const float v2=(float(theSrcRect.mY)+theSrcRect.mHeight)/mHeight;
	SexyVector2 p[4] = {
		SexyVector2(x,y), SexyVector2(x,y+theSrcRect.mHeight),
		SexyVector2(x+theSrcRect.mWidth,y), SexyVector2(x+theSrcRect.mWidth,y+theSrcRect.mHeight)
	};
	for(auto& point:p)
	{
		point=theTrans*point;
		point.x+=theX;
		point.y+=theY;
	}
	DWORD aColor = RGBA_MAKE(theColor.mRed, theColor.mGreen, theColor.mBlue, theColor.mAlpha);
	ScreenVertex aVertex[4] =
	{
		{ p[0].x, p[0].y, 0, 1, aColor, u1, v1 },
		{ p[1].x, p[1].y, 0, 1, aColor, u1, v2 },
		{ p[2].x, p[2].y, 0, 1, aColor, u2, v1 },
		{ p[3].x, p[3].y, 0, 1, aColor, u2, v2 }
	};
	// Preserve the original CPU polygon clip and its boundary interpolation.
	if(theClipRect)
	{
		VertexList aList;
		aList.push_back(aVertex[0]);
		aList.push_back(aVertex[1]);
		aList.push_back(aVertex[3]);
		aList.push_back(aVertex[2]);
		DrawPolyClipped(theClipRect,aList,mTexture);
	}
	else
	{
		SubmitGpuTriangles(aVertex, 4, PRIMITIVE_TRIANGLESTRIP, mTexture, gLinearFilter, -1, NULL);
	}
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
void TextureData::BltTriangles(const TriVertex theVertices[][3], int theNumTriangles, DWORD theColor, float tx, float ty)
{
	if(theNumTriangles<=0) return;
	SubmitTextureTriangleBatch(size_t(theNumTriangles),
		[&](size_t i)->const TriVertex& {return theVertices[i/3][i%3];},
		*this,theColor,tx,ty);
}

void TextureData::BltTriangles(std::span<const std::array<TriVertex,3>> theTriangles, DWORD theColor, float tx, float ty)
{
	SubmitTextureTriangleBatch(theTriangles.size(),
		[&](size_t i)->const TriVertex& {return theTriangles[i/3][i%3];},
		*this,theColor,tx,ty);
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
TextureData* RenderInterface::CreateImageTexture(Image *image)
{
	if(CurrentNativeThreadIdentity()!=gSexyAppBase->mPrimaryThreadId) throw GpuImageCpuAccess{};
	if (auto* resident=AsResidentImage(image))
	{
		if (resident->mRenderOwner && resident->mRenderOwner!=this)
			throw std::logic_error("Resident image belongs to another renderer");
		if (resident->mTextureData) return resident->mTextureData.get();
		RequireImageDimensions(mRenderer,resident->mWidth,resident->mHeight);
		if (!resident->mPendingDecoded || !resident->mPendingDecoded->mBits)
			throw std::logic_error("Resident image has no pending decode or GPU texture");
		const auto& decoded=*resident->mPendingDecoded;
		auto data=std::make_unique<TextureData>();
		data->mWidth=resident->mWidth;data->mHeight=resident->mHeight;
		data->mPixelFormat=PixelFormat_A8R8G8B8;
		data->mGPUOwned=true;data->mRenderTarget=false;
		data->mSamplingFlags=resident->mGpuSamplingFlags;
		data->mTexture=mRenderer->CreateTexture(
			decoded.mWidth,decoded.mHeight,decoded.mBits,decoded.mWidth*4,false);
		mResidentImageSet.insert(resident);
		resident->mRenderOwner=this;
		resident->mTextureData=std::move(data);
		resident->mPendingDecoded.reset();
		return resident->mTextureData.get();
	}
	auto* theImage=AsMemoryImage(image);
	if (image && !theImage) throw std::invalid_argument("Unsupported native image type");
	// Empty images have no texture; oversized images throw without tiling.
	if (theImage == nullptr || theImage->mWidth <= 0 || theImage->mHeight <= 0)
	{
		return nullptr;
	}
	RequireImageDimensions(mRenderer,theImage->mWidth,theImage->mHeight);
	if (theImage->mD3DData == NULL)
	{
		theImage->mD3DData = new TextureData();

		AutoCrit aCrit(gSexyAppBase->mDDInterface->mCritSect);
		mImageSet.insert(theImage);
	}

	TextureData *aData = (TextureData*)theImage->mD3DData;
	aData->mSamplingFlags=theImage->mGpuSamplingFlags;
	aData->CheckCreateTextures(theImage);

	// The upload snapshot owns the transfer bytes; images retain no CPU bitmap.
	theImage->PurgeBits();
	return aData;
}

void RenderInterface::CloneUploadedImage(MemoryImage* target,const MemoryImage& source)
{
	if(!CreateImageTexture(const_cast<MemoryImage*>(&source))) throw GpuImageCpuAccess{};
	const auto& original=*static_cast<const TextureData*>(source.mD3DData);
	if(original.mRenderTarget || target->mD3DData)
		throw GpuImageCpuAccess{};
	auto copy=std::make_unique<TextureData>();
	copy->mWidth=original.mWidth;copy->mHeight=original.mHeight;
	copy->mPixelFormat=original.mPixelFormat;
	copy->mSamplingFlags=original.mSamplingFlags;copy->mBitsChangedCount=target->mBitsChangedCount;
	copy->mGPUOwned=original.mGPUOwned;
	RequireImageDimensions(mRenderer,original.mWidth,original.mHeight);
	copy->mTexture=mRenderer->CopyTextureRegion(original.mTexture,0,0,original.mWidth,original.mHeight);
	mImageSet.insert(target);
	target->mD3DData=copy.release();
}

bool RenderInterface::CreateImageTextureStatic(MemoryImage *theImage, uint32_t staticSlot)
{
	if(CurrentNativeThreadIdentity()!=gSexyAppBase->mPrimaryThreadId) throw GpuImageCpuAccess{};
	// 0 尺寸防线同 CreateImageTexture（闪退案原语级拒绝）
	if (theImage == nullptr || theImage->mWidth <= 0 || theImage->mHeight <= 0)
		return false;
	RequireImageDimensions(mRenderer,theImage->mWidth,theImage->mHeight);
	if (theImage->mD3DData == NULL)
	{
		theImage->mD3DData = new TextureData();

		AutoCrit aCrit(gSexyAppBase->mDDInterface->mCritSect);
		mImageSet.insert(theImage);
	}

	TextureData *aData = (TextureData*)theImage->mD3DData;
	aData->mSamplingFlags=theImage->mGpuSamplingFlags;
	if(aData->mStaticSlot!=UINT32_MAX && aData->mStaticSlot!=staticSlot)
		throw std::logic_error("Image already owns a different static texture slot");
	if(aData->mTexture && aData->mStaticSlot==UINT32_MAX)
		mRenderer->BindStaticTexture(aData->mTexture,staticSlot);
	aData->mStaticSlot = staticSlot;
	aData->CheckCreateTextures(theImage);
	theImage->PurgeBits();
	return true;
}

void RenderInterface::ReserveStaticTextureSlots(uint32_t count)
{
	if (mRenderer != NULL)
		mRenderer->ReserveStaticTextureSlots(count);
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
bool RenderInterface::HasCausticsCompute() const
{
	return mRenderer != NULL && mRenderer->HasCausticsCompute();
}

bool RenderInterface::InstallCausticsCompute(MemoryImage* theImage, MemoryImage* source)
{
	if (mRenderer == NULL || !mRenderer->HasCausticsCompute())
		throw std::logic_error("Pool requires native GPU caustics");
	if (theImage == NULL || theImage->mD3DData != NULL || source==nullptr)
		throw std::logic_error("Invalid pool GPU image ownership");
	if(!CreateImageTexture(source)) throw GpuImageCpuAccess{};
	auto* sourceData=static_cast<TextureData*>(source->mD3DData);
	if(!sourceData->mTexture)
		throw std::logic_error("Pool lookup requires one resident GPU texture");

	const int& aWidth = theImage->mWidth;
	const int& aHeight = theImage->mHeight;
	RequireImageDimensions(mRenderer,aWidth,aHeight);
	GpuTexture* aTexture = mRenderer->CreateCausticsTexture(aWidth, aHeight,sourceData->mTexture);

	// GPU-owned caustics freeze the host upload revision.
	auto* aData = new TextureData();
	theImage->mD3DData = aData;
	AutoCrit aCrit(gSexyAppBase->mDDInterface->mCritSect);
	mImageSet.insert(theImage);
	aData->mGPUOwned = true;
	aData->mPixelFormat = PixelFormat_A8R8G8B8;
	aData->mWidth = aWidth;
	aData->mHeight = aHeight;
	aData->mBitsChangedCount = theImage->mBitsChangedCount;
	aData->mTexture = aTexture;
	theImage->PurgeBits();
	return true;
}

void RenderInterface::SetCausticsFrame(unsigned int theCounter)
{
	if (mRenderer != NULL)
		mRenderer->SetCausticsFrame(theCounter);
}

void RenderInterface::UseCausticsImages(MemoryImage* output,MemoryImage* source)
{
	auto* data=static_cast<TextureData*>(output->mD3DData);
	auto* sourceData=static_cast<TextureData*>(source->mD3DData);
	mRenderer->UseCausticsTexture(data->mTexture,sourceData->mTexture);
}

GpuTexture* RenderInterface::GetCausticsTexture() const
{
	return mRenderer != NULL ?
		GpuBackendDetail::CausticsTexture<BuildConfig::Graphics>(*mRenderer) : NULL;
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
void RenderInterface::RemoveMemoryImage(MemoryImage *theImage)
{
	if (theImage->mD3DData != NULL)
	{
		delete (TextureData*)theImage->mD3DData;
		theImage->mD3DData = NULL;

		AutoCrit aCrit(gSexyAppBase->mDDInterface->mCritSect);
		mImageSet.erase(theImage);
	}
}

void RenderInterface::RemoveResidentImage(ResidentImage* image)
{
	if (mDrawSurface==image) SelectDrawSurface(nullptr);
	mResidentImageSet.erase(image);
	image->mTextureData.reset();
	image->mRenderOwner=nullptr;
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
void RenderInterface::Cleanup()
{
	Flush();
	if(mRenderer!=nullptr) SelectDrawSurface(nullptr);

	ImageSet::iterator anItr;
	for (anItr = mImageSet.begin(); anItr != mImageSet.end(); ++anItr)
	{
		MemoryImage *anImage = *anItr;
		delete (TextureData*)anImage->mD3DData;
		anImage->mD3DData = NULL;
	}
	mImageSet.clear();
	for (auto* image:mResidentImageSet)
	{
		image->mTextureData.reset();
		image->mRenderOwner=nullptr;
	}
	mResidentImageSet.clear();

	if (mRenderer != NULL)
	{
		delete mRenderer;
		mRenderer = NULL;
		gGpuRenderer = NULL;
	}
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
void RenderInterface::SetCurTexture(MemoryImage *theImage)
{
	CreateImageTexture(theImage);
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
void RenderInterface::PushTransform(const SexyMatrix3 &theTransform, bool concatenate)
{
	if (concatenate && !mTransformStack.empty())
		mTransformStack.push_back(mTransformStack.back() * theTransform);
	else
		mTransformStack.push_back(theTransform);
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
void RenderInterface::PopTransform()
{
	if (!mTransformStack.empty())
		mTransformStack.pop_back();
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
void RenderInterface::Blt(Image* theImage, float theX, float theY, const Rect& theSrcRect, const Color& theColor, int theDrawMode, bool linearFilter)
{
	if (!mTransformStack.empty())
	{
		BltClipF(theImage, theX, theY, theSrcRect, NULL, theColor, theDrawMode);
		return;
	}

	if (!PreDraw())
		return;

	auto* aData = CreateImageTexture(theImage);
	if (!aData)
		return;

	gGpuCurrentDrawMode = theDrawMode;

	gLinearFilter = linearFilter;
	aData->Blt(theX, theY, theSrcRect, theColor);
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
void RenderInterface::BltMirror(Image* theImage, float theX, float theY, const Rect& theSrcRect, const Color& theColor, int theDrawMode, bool linearFilter)
{
	SexyTransform2D aTransform;
	aTransform.Translate(-theSrcRect.mWidth, 0);
	aTransform.Scale(-1, 1);
	aTransform.Translate(theX, theY);
	BltTransformed(theImage, NULL, theColor, theDrawMode, theSrcRect, aTransform, linearFilter);
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
void RenderInterface::BltClipF(Image* theImage, float theX, float theY, const Rect& theSrcRect, const Rect *theClipRect, const Color& theColor, int theDrawMode)
{
	SexyTransform2D aTransform;
	aTransform.Translate(theX, theY);
	BltTransformed(theImage, theClipRect, theColor, theDrawMode, theSrcRect, aTransform, true);
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
void RenderInterface::StretchBlt(Image* theImage, const Rect& theDestRect, const Rect& theSrcRect, const Rect* theClipRect, const Color &theColor, int theDrawMode, bool fastStretch, bool mirror)
{
	float xScale = (float)theDestRect.mWidth / theSrcRect.mWidth;
	float yScale = (float)theDestRect.mHeight / theSrcRect.mHeight;

	SexyTransform2D aTransform;
	if (mirror)
	{
		aTransform.Translate(-theSrcRect.mWidth, 0);
		aTransform.Scale(-xScale, yScale);
	}
	else
		aTransform.Scale(xScale, yScale);

	aTransform.Translate(theDestRect.mX, theDestRect.mY);
	BltTransformed(theImage, theClipRect, theColor, theDrawMode, theSrcRect, aTransform, !fastStretch);
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
void RenderInterface::BltRotated(Image* theImage, float theX, float theY, const Rect* theClipRect, const Color& theColor, int theDrawMode, double theRot, float theRotCenterX, float theRotCenterY, const Rect &theSrcRect)
{
	SexyTransform2D aTransform;
	aTransform.Translate(-theRotCenterX, -theRotCenterY);
	aTransform.RotateRad(theRot);
	aTransform.Translate(theX + theRotCenterX, theY + theRotCenterY);
	BltTransformed(theImage, theClipRect, theColor, theDrawMode, theSrcRect, aTransform, true);
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
void RenderInterface::BltTransformed(Image* theImage, const Rect* theClipRect, const Color& theColor, int theDrawMode, const Rect &theSrcRect, const SexyMatrix3 &theTransform, bool linearFilter, float theX, float theY, bool center)
{
	if (!PreDraw())
		return;

	auto* aData = CreateImageTexture(theImage);
	if (!aData)
		return;

	gGpuCurrentDrawMode = theDrawMode;

	if (!mTransformStack.empty())
	{
		gLinearFilter = true;
		if (theX != 0 || theY != 0)
		{
			SexyTransform2D aTransform;
			if (center)
				aTransform.Translate(-theSrcRect.mWidth/2.0f, -theSrcRect.mHeight/2.0f);
			aTransform = theTransform * aTransform;
			aTransform.Translate(theX, theY);
			aTransform = mTransformStack.back() * aTransform;
			aData->BltTransformed(aTransform, theSrcRect, theColor, theClipRect);
		}
		else
		{
			SexyTransform2D aTransform = mTransformStack.back() * theTransform;
			aData->BltTransformed(aTransform, theSrcRect, theColor, theClipRect, theX, theY, center);
		}
	}
	else
	{
		gLinearFilter = linearFilter;
		aData->BltTransformed(theTransform, theSrcRect, theColor, theClipRect, theX, theY, center);
	}
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
void RenderInterface::DrawLine(double theStartX, double theStartY, double theEndX, double theEndY, const Color& theColor, int theDrawMode)
{
	if (!PreDraw())
		return;

	gGpuCurrentDrawMode = theDrawMode;

	float x1, y1, x2, y2;
	DWORD aColor = RGBA_MAKE(theColor.mRed, theColor.mGreen, theColor.mBlue, theColor.mAlpha);

	if (!mTransformStack.empty())
	{
		SexyVector2 p1(theStartX, theStartY);
		SexyVector2 p2(theEndX, theEndY);
		p1 = mTransformStack.back()*p1;
		p2 = mTransformStack.back()*p2;
		x1 = p1.x;
		y1 = p1.y;
		x2 = p2.x;
		y2 = p2.y;
	}
	else
	{
		x1 = theStartX;
		y1 = theStartY;
		x2 = theEndX;
		y2 = theEndY;
	}

	// Rasterize the one-pixel line as a native triangle-list quad.
	float aDx = x2 - x1;
	float aDy = y2 - y1;
	float aLen = sqrtf(aDx*aDx + aDy*aDy);
	if (aLen < 1.0f)
		aLen = 1.0f;
	float aPx = -aDy / aLen * 0.5f;
	float aPy = aDx / aLen * 0.5f;

	ScreenVertex aVertex[6] =
	{
		{ x1 + aPx, y1 + aPy, 0, 1, aColor, 0, 0 },
		{ x2 + aPx, y2 + aPy, 0, 1, aColor, 0, 0 },
		{ x2 - aPx, y2 - aPy, 0, 1, aColor, 0, 0 },
		{ x1 + aPx, y1 + aPy, 0, 1, aColor, 0, 0 },
		{ x2 - aPx, y2 - aPy, 0, 1, aColor, 0, 0 },
		{ x1 - aPx, y1 - aPy, 0, 1, aColor, 0, 0 }
	};
	SubmitGpuTriangles(aVertex, 6, PRIMITIVE_TRIANGLELIST,
		gGpuRenderer->whiteTexture, false, theDrawMode, NULL);
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
void RenderInterface::FillRect(const Rect& theRect, const Color& theColor, int theDrawMode)
{
	if (!PreDraw())
		return;

	gGpuCurrentDrawMode = theDrawMode;

	DWORD aColor = RGBA_MAKE(theColor.mRed, theColor.mGreen, theColor.mBlue, theColor.mAlpha);
	float x = theRect.mX;
	float y = theRect.mY;
	float aWidth = theRect.mWidth;
	float aHeight = theRect.mHeight;

	ScreenVertex aVertex[4] =
	{
		{ x, y, 0, 1, aColor, 0, 0 },
		{ x, y + aHeight, 0, 1, aColor, 0, 0 },
		{ x + aWidth, y, 0, 1, aColor, 0, 0 },
		{ x + aWidth, y + aHeight, 0, 1, aColor, 0, 0 }
	};

	if (!mTransformStack.empty())
	{
		SexyVector2 p[4] = { SexyVector2(x, y), SexyVector2(x, y+aHeight), SexyVector2(x+aWidth, y), SexyVector2(x+aWidth, y+aHeight) };
		for (int i=0; i<4; i++)
		{
			p[i] = mTransformStack.back()*p[i];
			aVertex[i].sx = p[i].x;
			aVertex[i].sy = p[i].y;
		}
	}

	SubmitGpuTriangles(aVertex, 4, PRIMITIVE_TRIANGLESTRIP,
		gGpuRenderer->whiteTexture, false, theDrawMode, NULL);
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
void RenderInterface::FillScanLinesWithCoverage(const Span* spans,int spanCount,const Color& color,int drawMode,
    const BYTE* coverage,int coverX,int coverY,int coverWidth,int coverHeight)
{
    if(spanCount<0 || (spanCount && (!spans || !coverage || coverWidth<=0 || coverHeight<=0)))
        throw std::invalid_argument("Invalid screen coverage input");
    if(!spanCount) return;
    // Validate before recording anything; do not turn an invalid span into a
    // clipped success or read beyond the caller's coverage rectangle.
    bool hasPixels=false;
    for(int i=0;i<spanCount;++i) {
        const auto& span=spans[i];
        if(span.mWidth<0) throw std::invalid_argument("Negative screen coverage span width");
        if(!span.mWidth) continue;
        const int64_t x=int64_t(span.mX)-coverX,y=int64_t(span.mY)-coverY;
        if(x<0 || y<0 || y>=coverHeight || x+span.mWidth>coverWidth)
            throw std::invalid_argument("Screen coverage span exceeds mask bounds");
        hasPixels=true;
    }
    if(!hasPixels || !PreDraw()) return;
    RequireImageDimensions(mRenderer,coverWidth,coverHeight);
    gGpuCurrentDrawMode = drawMode;
    auto* mask=mRenderer->CreateCoverageMask(coverWidth,coverHeight,
        std::span<const uint8_t>(coverage,size_t(coverWidth)*coverHeight),coverWidth);
    // bindless 槽位逐顶点携带：蒙版槽必须写进顶点（零初始化的 slot=0 是
    // 场景纹理——覆盖度会采到场景自身，cdd454d4 bindless 迁移漏改此路径
    // 的回归，Scenes 冒烟 ProbeCoverage 定罪）。采样器恒 0=nearest/clamp。
    const uint32_t maskSlot=GpuRenderer::SlotOf(mask);
    // Retire the mask on both success and propagated draw failure. This does
    // not wait or read pixels back; the renderer retains submitted references.
    const auto retire=[this](GpuTexture* texture){mRenderer->DestroyTexture(texture);};
    std::unique_ptr<GpuTexture,decltype(retire)> owner(mask,retire);
    std::vector<GpuVertex> vertices;
    vertices.reserve(size_t(spanCount)*6);
    const auto blend=drawMode==1?GpuBlend::Additive:drawMode==2?GpuBlend::Opaque:GpuBlend::Normal;
    const float r=color.mRed/255.0f,g=color.mGreen/255.0f,b=color.mBlue/255.0f,a=color.mAlpha/255.0f;
    for(int i=0;i<spanCount;++i) {
        const auto& span=spans[i];
        if(!span.mWidth) continue;
        const float x=float(span.mX),y=float(span.mY),right=float(int64_t(span.mX)+span.mWidth);
        SexyVector2 points[]={{x,y},{right,y},{right,y+1},{x,y+1}};
        if(!mTransformStack.empty()) for(auto& point:points) point=mTransformStack.back()*point;
        const float u1=float(int64_t(span.mX)-coverX)/coverWidth;
        const float u2=float(int64_t(span.mX)-coverX+span.mWidth)/coverWidth;
        const float v1=float(int64_t(span.mY)-coverY)/coverHeight,v2=v1+1.0f/coverHeight;
        const float u[]={u1,u2,u2,u1},v[]={v1,v1,v2,v2};
        for(const int n:{0,1,2,0,2,3}) vertices.push_back({points[n].x,points[n].y,r,g,b,a,u[n],v[n],maskSlot,0});
    }
    mRenderer->SubmitCoverageTriangles(vertices,mask,blend);
}

void RenderInterface::DrawTriangle(const TriVertex &p1, const TriVertex &p2, const TriVertex &p3, const Color &theColor, int theDrawMode)
{
	if (!PreDraw())
		return;

	gGpuCurrentDrawMode = theDrawMode;
	DWORD aColor = RGBA_MAKE(theColor.mRed, theColor.mGreen, theColor.mBlue, theColor.mAlpha);

	ScreenVertex aVertex[3] =
	{
		{ p1.x, p1.y, 0, 1, aColor, 0, 0 },
		{ p2.x, p2.y, 0, 1, aColor, 0, 0 },
		{ p3.x, p3.y, 0, 1, aColor, 0, 0 }
	};
	SubmitGpuTriangles(aVertex, 3, PRIMITIVE_TRIANGLESTRIP,
		gGpuRenderer->whiteTexture, false, theDrawMode, NULL);
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
void RenderInterface::FillPoly(const Point theVertices[], int theNumVertices, const Rect *theClipRect, const Color &theColor, int theDrawMode, int tx, int ty)
{
	if (theNumVertices < 3)
		return;

	if (!PreDraw())
		return;

	gGpuCurrentDrawMode = theDrawMode;
	DWORD aColor = RGBA_MAKE(theColor.mRed, theColor.mGreen, theColor.mBlue, theColor.mAlpha);

	VertexList aList;
	for (int i=0; i<theNumVertices; i++)
	{
		ScreenVertex vert = { theVertices[i].mX + (float)tx, theVertices[i].mY + (float)ty, 0, 1, aColor, 0, 0 };
		if (!mTransformStack.empty())
		{
			SexyVector2 v(vert.sx, vert.sy);
			v = mTransformStack.back()*v;
			vert.sx = v.x;
			vert.sy = v.y;
		}
		aList.push_back(vert);
	}

	if (theClipRect != NULL)
		DrawPolyClipped(theClipRect, aList, gGpuRenderer->whiteTexture);
	else
	{
		SubmitGpuTriangles(&aList[0], (int)aList.mSize, PRIMITIVE_TRIANGLEFAN,
			gGpuRenderer->whiteTexture, false, theDrawMode, NULL);
	}
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
void RenderInterface::DrawTriangleTex(const TriVertex &p1, const TriVertex &p2, const TriVertex &p3, const Color &theColor, int theDrawMode, Image *theTexture, bool blend)
{
	TriVertex aVertices[1][3] = {{p1, p2, p3}};
	DrawTrianglesTex(aVertices, 1, theColor, theDrawMode, theTexture, 0.0f, 0.0f, blend);
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
void RenderInterface::DrawTrianglesTex(const TriVertex theVertices[][3], int theNumTriangles, const Color &theColor, int theDrawMode, Image *theTexture, float tx, float ty, bool blend)
{
	if (!PreDraw())
		return;

	auto* aData = CreateImageTexture(theTexture);
	if (!aData)
		return;

	gGpuCurrentDrawMode = theDrawMode;
	DWORD aColor = RGBA_MAKE(theColor.mRed, theColor.mGreen, theColor.mBlue, theColor.mAlpha);

	gLinearFilter = blend;
	aData->BltTriangles(theVertices, theNumTriangles, aColor, tx, ty);
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
void RenderInterface::DrawTrianglesTexStrip(const TriVertex theVertices[], int theNumTriangles, const Color &theColor, int theDrawMode, Image *theTexture, float tx, float ty, bool blend)
{
	if(theNumTriangles<=0 || !PreDraw()) return;
	auto* data=CreateImageTexture(theTexture);
	if(!data) return;
	gGpuCurrentDrawMode = theDrawMode;
	gLinearFilter = blend;
	const DWORD color=RGBA_MAKE(theColor.mRed,theColor.mGreen,theColor.mBlue,theColor.mAlpha);
	SubmitTextureTriangleBatch(size_t(theNumTriangles),
		[&](size_t i)->const TriVertex& {return theVertices[i/3+i%3];},
		*data,color,tx,ty);
}

void RenderInterface::DrawTrianglesTex(std::span<const std::array<TriVertex,3>> theTriangles,
	const Color& theColor,int theDrawMode,Image* theTexture,float tx,float ty,bool blend)
{
	if(theTriangles.empty() || !PreDraw()) return;
	auto* data=CreateImageTexture(theTexture);
	if(!data) return;
	gGpuCurrentDrawMode = theDrawMode;
	gLinearFilter = blend;
	data->BltTriangles(theTriangles,
		RGBA_MAKE(theColor.mRed,theColor.mGreen,theColor.mBlue,theColor.mAlpha),tx,ty);
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
void RenderInterface::Flush()
{
	if (mRenderer != NULL)
	{
		if (mSceneBegun)
		{
			// EndSceneAndPresent may synchronously dispatch window messages through
			// Present. Clear ownership before entering it so a re-entrant redraw
			// cannot submit the same scene a second time.
			mSceneBegun = false;
			mRenderer->EndSceneAndPresent();
		}
		return;
	}
}
