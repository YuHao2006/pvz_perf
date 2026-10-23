#pragma once
#include "Common.h"
#include "Color.h"
#include "misc/Rect.h"
#include "misc/Point.h"
#include "GpuBackend.h"
#include <array>
#include <cstdint>
#include <exception>

namespace ImageLib { class Image; }

namespace Sexy
{

struct Span
{
	int						mY;
	int						mX;
	int						mWidth;
};

class Graphics;
class SexyMatrix3;
class TriVertex;
class MemoryImage;
class RenderInterface;
class SexyAppBase;
class GraphicsState;
class GpuImageCpuAccess final : public std::exception {};
enum class DrawOperation : uint8_t
{
	FillRect, DrawLine, DrawLineAA, PolyFill3D, Blt, BltF, BltRotated,
	StretchBlt, BltMatrix, BltTrianglesTex, BltMirror, StretchBltMirror,
	FillScanLinesWithCoverage
};
class NonScreenDrawError final : public std::exception
{
public:
	const DrawOperation operation;
	explicit NonScreenDrawError(DrawOperation value) noexcept : operation(value) {}
};

// Shared dimensions contain no pixels or GPU state.
class ImageMetadata
{
public:
	int						mWidth;
	int						mHeight;

	ImageMetadata();
	ImageMetadata(const ImageMetadata& image);
	ImageMetadata& operator=(const ImageMetadata&) = delete;
protected:
	~ImageMetadata();
};

// Ordinary program-image drawing receives this GPU interface. Atlas sources
// live as direct GPU pointers in definitions and use temporary TextureSource.
// Images directly own GPU textures. No nested GPU image/data wrapper.
class Image : public ImageMetadata
{
public:
	explicit Image(SexyAppBase* app = nullptr);
	// Copies metadata and asks the renderer to clone any live texture.
	// Copying an uploaded/pending image requires the main renderer thread.
	Image(const Image& image);
	~Image();
	GpuTexture* mTexture = nullptr;
	ImageLib::Image* mPendingDecoded = nullptr;
	RenderInterface* mRenderOwner = nullptr;
	SexyAppBase* mApp = nullptr;
	std::uint32_t mGpuSamplingFlags = 0;
	bool mRenderTarget = false;
	bool mBitsChanged = false;
	bool mForcedMode = false;
	bool mHasTrans = false;
	bool mHasAlpha = false;

	Image& operator=(const Image&) = delete;
	void AdoptDecodedImage(ImageLib::Image* image, bool commitBits = true);
	void AppendAlphaImage(ImageLib::Image* image);
	void SetBits(unsigned int* bits, int width, int height, bool commitBits = true);
	void Create(int width, int height);
	void BitsChanged();
	void CommitBits();
	void PurgeBits();
	bool Palletize();
	bool IsGpuDrawTarget() const noexcept;
	void FillRect(const Rect& rect, const Color& color, int drawMode);
	void DrawRect(const Rect& rect, const Color& color, int drawMode);
	void FillScanLines(Span* spans, int count, const Color& color, int drawMode);
	void DrawLine(double x1, double y1, double x2, double y2, const Color& color, int drawMode);
	void DrawLineAA(double x1, double y1, double x2, double y2, const Color& color, int drawMode);
	bool PolyFill3D(const Point vertices[], int count, const Rect* clip, const Color& color,
		int drawMode, int tx, int ty);
	void Blt(Image* image, int x, int y, const Rect& source, const Color& color, int drawMode);
	void BltF(Image* image, float x, float y, const Rect& source, const Rect& clip, const Color& color, int drawMode);
	void BltRotated(Image* image, float x, float y, const Rect& source, const Rect& clip,
		const Color& color, int drawMode, double angle, float centerX, float centerY);
	void StretchBlt(Image* image, const Rect& target, const Rect& source, const Rect& clip,
		const Color& color, int drawMode, bool fastStretch);
	void BltMatrix(Image* image, float x, float y, const SexyMatrix3& matrix, const Rect& clip,
		const Color& color, int drawMode, const Rect& source, bool blend);
	void BltTrianglesTex(Image* image, const TriVertex vertices[][3], int count, const Rect& clip,
		const Color& color, int drawMode, float tx, float ty, bool blend);
	void BltMirror(Image* image, int x, int y, const Rect& source, const Color& color, int drawMode);
	void StretchBltMirror(Image* image, const Rect& target, const Rect& source, const Rect& clip,
		const Color& color, int drawMode, bool fastStretch);
	void FillScanLinesWithCoverage(Span* spans, int count, const Color& color, int drawMode,
		const BYTE* coverage, int x, int y, int width, int height);
};

}
