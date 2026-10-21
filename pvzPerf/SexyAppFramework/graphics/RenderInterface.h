#pragma once
#include "ImageReadback.h"

#include "GpuBackend.h"

#include "Common.h"
#include "MemoryImage.h"
#include "TriVertex.h"
#include "misc/SexyMatrix.h"
#include <array>
#include <span>


namespace Sexy
{

class DDInterface;
class DDImage;
class SexyMatrix3;
class TriVertex;

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
enum PixelFormat
{
	PixelFormat_Unknown				=			0x0000,
	PixelFormat_A8R8G8B8			=			0x0001
};

enum class GpuImageColorFilter : uint32_t
{
	None = 0,
	White = 0x10000000u,
	WashedOut = 0x20000000u,
	LessWashedOut = 0x30000000u
};

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
struct TextureData
{
public:
	GpuTexture* mTexture;
	int mWidth,mHeight;
	int mBitsChangedCount;
	PixelFormat mPixelFormat;
	// GPU-owned（池水焦散）：纹理由渲染器 compute 直写，宿主位图只是初始
	// 快照；CheckCreateTextures 冻结，任何 bits 变化都不再触发重传。
	bool mGPUOwned;
	bool mRenderTarget;
	uint32_t mSamplingFlags = 0;
	// Static descriptor identity survives replacement uploads.
	uint32_t mStaticSlot;

	TextureData();
	~TextureData();

	void ReleaseTextures();

	void CreateTextures(MemoryImage *theImage);
	void CheckCreateTextures(MemoryImage *theImage);
	ImagePixels ReadPixels() const;

	void Blt(float theX, float theY, const Rect& theSrcRect, const Color& theColor);
	void BltTransformed(const SexyMatrix3 &theTrans, const Rect& theSrcRect, const Color& theColor, const Rect *theClipRect = NULL, float theX = 0, float theY = 0, bool center = false);	
	void BltTriangles(const TriVertex theVertices[][3], int theNumTriangles, DWORD theColor, float tx = 0, float ty = 0);
	void BltTriangles(std::span<const std::array<TriVertex,3>> theTriangles, DWORD theColor, float tx = 0, float ty = 0);
};

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

class RenderInterface
{
public:
	NativeWindowHandle		mHWnd;
	int						mWidth;
	int						mHeight;

	int						mPresentWidth;				// output (scaled) width
	int						mPresentHeight;				// output (scaled) height

	bool					mSceneBegun;
	bool					mIsWindowed;

	typedef std::set<MemoryImage*> ImageSet;
	ImageSet mImageSet;

	typedef std::list<SexyMatrix3> TransformStack;
	TransformStack mTransformStack;

	GpuRenderer*			mRenderer;
	DDImage*                mDrawSurface = nullptr;

public:
	// 池水焦散 GPU 直写（2026-10-05 立项：每帧 CPU 生成 8192px + 纹理重传
	// 是性能缺陷）。Install 一次性接管 theImage 的纹理并上传 LUT；此后每帧
	// SetCausticsFrame(counter)，BeginScene 前渲染器 compute 直写目标纹理。
	bool HasCausticsCompute() const;
	bool InstallCausticsCompute(MemoryImage* theImage, MemoryImage* source);
	void UseCausticsImages(MemoryImage* output, MemoryImage* source);
	void SetCausticsFrame(unsigned int theCounter);
	GpuTexture* GetCausticsTexture() const;

protected:
	bool					InitGPU();	

public:
	RenderInterface();
	~RenderInterface();

	void					Cleanup();
	void					PushTransform(const SexyMatrix3 &theTransform, bool concatenate = true);
	void					PopTransform();
	
	bool					PreDraw();
    void ResizeScene(int width, int height);
	DDImage*                CreateRenderImage(int width, int height);
	DDImage* ProcessImage(MemoryImage* source,const GpuImageProcessing& processing);
	void RenderFontAtlas(DDImage* target,MemoryImage* source,
		std::span<const GpuFontGlyph> glyphs,bool forceWhite);
	void                    SelectDrawSurface(DDImage* image);
	inline static uint32_t  sImageSamplingFlags = 0;
	inline static bool      sSamplerAddressWrap = false;
	void					Flush();
	// Diagnostic/export only, on the owning thread with a flushed scene.
	// Never calls GetBits or changes the source's CPU/GPU representation.
	ImagePixels ReadImagePixels(const MemoryImage& image);
	void					RemoveMemoryImage(MemoryImage *theImage);
	// Window/fullscreen or custom-scale changes: resize the swapchain only.
	// The device, scene target and uploaded image textures all survive, so
	// toggling modes never triggers a full re-upload or GPU stall.
	bool					ResizePresent(int thePresentWidth, int thePresentHeight);
    // false means deferred, not failed. Invalid ownership / Vulkan errors throw.
	bool					PresentRetainedFrame();

	bool					CreateImageTexture(MemoryImage *theImage);
	void CloneUploadedImage(MemoryImage* target,const MemoryImage& source);
	void FinishLoadingTextures();
	// reanim-v4 静态槽位：纹理落在槽位区恒等位 staticBase+staticSlot
	//（编译记录烘焙的最终下标）
	bool					CreateImageTextureStatic(MemoryImage *theImage, uint32_t staticSlot);
	// 预约槽位区顶部 count 个为静态（恒等映射符号号）。须在首次静态放置
	// 前调用；动态区 [0,staticBase) 行为不变，预约时序与动态创建解耦
	void					ReserveStaticTextureSlots(uint32_t count);
	void					SetCurTexture(MemoryImage *theImage);
	void					Blt(Image* theImage, float theX, float theY, const Rect& theSrcRect, const Color& theColor, int theDrawMode, bool linearFilter = false);
	void					BltClipF(Image* theImage, float theX, float theY, const Rect& theSrcRect, const Rect *theClipRect, const Color& theColor, int theDrawMode);
	void					BltMirror(Image* theImage, float theX, float theY, const Rect& theSrcRect, const Color& theColor, int theDrawMode, bool linearFilter = false);
	void					StretchBlt(Image* theImage,  const Rect& theDestRect, const Rect& theSrcRect, const Rect* theClipRect, const Color &theColor, int theDrawMode, bool fastStretch, bool mirror = false);
	void					BltRotated(Image* theImage, float theX, float theY, const Rect* theClipRect, const Color& theColor, int theDrawMode, double theRot, float theRotCenterX, float theRotCenterY, const Rect& theSrcRect);
	void					BltTransformed(Image* theImage, const Rect* theClipRect, const Color& theColor, int theDrawMode, const Rect &theSrcRect, const SexyMatrix3 &theTransform, bool linearFilter, float theX = 0, float theY = 0, bool center = false);
	void					DrawLine(double theStartX, double theStartY, double theEndX, double theEndY, const Color& theColor, int theDrawMode);
	void					FillRect(const Rect& theRect, const Color& theColor, int theDrawMode);
    void FillScanLinesWithCoverage(const Span* spans,int spanCount,const Color& color,int drawMode,
        const BYTE* coverage,int coverX,int coverY,int coverWidth,int coverHeight);
	void					DrawTriangle(const TriVertex &p1, const TriVertex &p2, const TriVertex &p3, const Color &theColor, int theDrawMode);
	void					DrawTriangleTex(const TriVertex &p1, const TriVertex &p2, const TriVertex &p3, const Color &theColor, int theDrawMode, Image *theTexture, bool blend = true);
	void					DrawTrianglesTex(const TriVertex theVertices[][3], int theNumTriangles, const Color &theColor, int theDrawMode, Image *theTexture, float tx = 0, float ty = 0, bool blend = true);
	void DrawTrianglesTex(std::span<const std::array<TriVertex,3>> theTriangles, const Color& theColor, int theDrawMode, Image* theTexture, float tx = 0, float ty = 0, bool blend = true);
	void					DrawTrianglesTexStrip(const TriVertex theVertices[], int theNumTriangles, const Color &theColor, int theDrawMode, Image *theTexture, float tx = 0, float ty = 0, bool blend = true);
	void					FillPoly(const Point theVertices[], int theNumVertices, const Rect *theClipRect, const Color &theColor, int theDrawMode, int tx, int ty);

	// Sampler wrap toggle used by the pool caustic effect.

	bool					InitFromDDInterface(DDInterface *theInterface);


};

class GpuImageDrawScope
{
	RenderInterface& mRender;
	DDImage* mPrevious;
public:
	GpuImageDrawScope(RenderInterface& render, DDImage* image) :
		mRender(render), mPrevious(render.mDrawSurface) { render.SelectDrawSurface(image); }
	~GpuImageDrawScope() noexcept(false) { mRender.SelectDrawSurface(mPrevious); }
	GpuImageDrawScope(const GpuImageDrawScope&) = delete;
	GpuImageDrawScope& operator=(const GpuImageDrawScope&) = delete;
};

class GpuImageSamplingScope
{
	RenderInterface& mRender;
	uint32_t mPrevious;
public:
	GpuImageSamplingScope(RenderInterface& render, uint32_t flags) :
		mRender(render), mPrevious(render.sImageSamplingFlags) { render.sImageSamplingFlags = flags; }
	~GpuImageSamplingScope() { mRender.sImageSamplingFlags = mPrevious; }
	GpuImageSamplingScope(const GpuImageSamplingScope&) = delete;
	GpuImageSamplingScope& operator=(const GpuImageSamplingScope&) = delete;
};

}
