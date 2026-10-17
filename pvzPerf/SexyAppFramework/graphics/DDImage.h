#pragma once
#include "MemoryImage.h"
#include <cstdint>
#include <exception>

namespace Sexy
{

class DDInterface;

enum class DrawOperation : uint8_t
{
	FillRect,
	DrawLine,
	DrawLineAA,
	PolyFill3D,
	Blt,
	BltF,
	BltRotated,
	StretchBlt,
	BltMatrix,
	BltTrianglesTex,
	BltMirror,
	StretchBltMirror,
	FillScanLinesWithCoverage
};

class NonScreenDrawError final : public std::exception
{
public:
	const DrawOperation operation;

	explicit NonScreenDrawError(DrawOperation theOperation) noexcept
		: operation(theOperation)
	{
	}
};

// DDImage wraps the screen and GPU render targets. There is no DirectDraw
// surface: primitives route to the Vulkan renderer via DDInterface.
// Drawing to a DDImage without either GPU target is unsupported and
// fails loudly instead of falling back to a software path.
class DDImage : public MemoryImage
{
private:
	bool IsGpuDrawTarget() const noexcept;

public:
	DDInterface* mDDInterface;

	DDImage();
	DDImage(DDInterface* theDDInterface);
	DDImage(const DDImage& theImage);
	~DDImage();

	static bool				Check3D(DDImage *theImage);
	static bool				Check3D(Image *theImage);

	bool			LockSurface();
	bool			UnlockSurface();
	unsigned int*			GetBits();

	void			FillRect(const Rect& theRect, const Color& theColor, int theDrawMode);
	void			DrawRect(const Rect& theRect, const Color& theColor, int theDrawMode);
	void			FillScanLines(Span* theSpans, int theSpanCount, const Color& theColor, int theDrawMode);
	void			DrawLine(double theStartX, double theStartY, double theEndX, double theEndY, const Color& theColor, int theDrawMode);
	void			DrawLineAA(double theStartX, double theStartY, double theEndX, double theEndY, const Color& theColor, int theDrawMode);
	bool			PolyFill3D(const Point theVertices[], int theNumVertices, const Rect *theClipRect, const Color &theColor, int theDrawMode, int tx, int ty);
	void			Blt(Image* theImage, int theX, int theY, const Rect& theSrcRect, const Color& theColor, int theDrawMode);
	void			BltF(Image* theImage, float theX, float theY, const Rect& theSrcRect, const Rect &theClipRect, const Color& theColor, int theDrawMode);
	void			BltRotated(Image* theImage, float theX, float theY, const Rect &theSrcRect, const Rect& theClipRect, const Color& theColor, int theDrawMode, double theRot, float theRotCenterX, float theRotCenterY);
	void			StretchBlt(Image* theImage, const Rect& theDestRect, const Rect& theSrcRect, const Rect& theClipRect, const Color& theColor, int theDrawMode, bool fastStretch);
	void			BltMatrix(Image* theImage, float x, float y, const SexyMatrix3 &theMatrix, const Rect& theClipRect, const Color& theColor, int theDrawMode, const Rect &theSrcRect, bool blend);
	void			BltTrianglesTex(Image *theTexture, const TriVertex theVertices[][3], int theNumTriangles, const Rect& theClipRect, const Color &theColor, int theDrawMode, float tx, float ty, bool blend);
	void			BltMirror(Image* theImage, int theX, int theY, const Rect& theSrcRect, const Color& theColor, int theDrawMode);
	void			StretchBltMirror(Image* theImage, const Rect& theDestRectOrig, const Rect& theSrcRect, const Rect& theClipRect, const Color& theColor, int theDrawMode, bool fastStretch);
	void			FillScanLinesWithCoverage(Span* theSpans, int theSpanCount, const Color& theColor, int theDrawMode, const BYTE* theCoverage, int theCoverX, int theCoverY, int theCoverWidth, int theCoverHeight);
};

}
