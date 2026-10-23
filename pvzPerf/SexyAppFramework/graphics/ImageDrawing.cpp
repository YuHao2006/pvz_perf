#include "Image.h"
#include "SexyAppBase.h"
#include "DDInterface.h"
#include "RenderInterface.h"
#include "Graphics.h"
#include "TriVertex.h"

using namespace Sexy;

namespace
{
[[noreturn]] void FailNonScreen(DrawOperation theOperation)
{
	throw NonScreenDrawError(theOperation);
}
}

bool Image::IsGpuDrawTarget() const noexcept
{
	if (!mApp || !mApp->mDDInterface || !mRenderOwner)
		return false;
	if (this == mApp->mDDInterface->mScreenImage)
		return true;
	return mTexture && mRenderTarget;
}

void Image::FillRect(const Rect& theRect, const Color& theColor, int theDrawMode)
{
	if (IsGpuDrawTarget())
	{
		mRenderOwner->SelectDrawSurface(this);
		mRenderOwner->FillRect(theRect, theColor, theDrawMode);
		return;
	}
	FailNonScreen(DrawOperation::FillRect);
}

void Image::DrawRect(const Rect& theRect, const Color& theColor, int theDrawMode)
{
	FillRect(Rect(theRect.mX, theRect.mY, theRect.mWidth + 1, 1), theColor, theDrawMode);
	FillRect(Rect(theRect.mX, theRect.mY + theRect.mHeight, theRect.mWidth + 1, 1), theColor, theDrawMode);
	FillRect(Rect(theRect.mX, theRect.mY + 1, 1, theRect.mHeight - 1), theColor, theDrawMode);
	FillRect(Rect(theRect.mX + theRect.mWidth, theRect.mY + 1, 1, theRect.mHeight - 1), theColor, theDrawMode);
}

void Image::FillScanLines(Span* theSpans, int theSpanCount, const Color& theColor, int theDrawMode)
{
	for (int i = 0; i < theSpanCount; ++i)
	{
		const Span& span = theSpans[i];
		FillRect(Rect(span.mX, span.mY, span.mWidth, 1), theColor, theDrawMode);
	}
}

void Image::DrawLine(double theStartX, double theStartY, double theEndX, double theEndY, const Color& theColor, int theDrawMode)
{
	if (IsGpuDrawTarget())
	{
		mRenderOwner->SelectDrawSurface(this);
		mRenderOwner->DrawLine(theStartX, theStartY, theEndX, theEndY, theColor, theDrawMode);
		return;
	}
	FailNonScreen(DrawOperation::DrawLine);
}

void Image::DrawLineAA(double theStartX, double theStartY, double theEndX, double theEndY, const Color& theColor, int theDrawMode)
{
	if (IsGpuDrawTarget())
	{
		mRenderOwner->SelectDrawSurface(this);
		mRenderOwner->DrawLine(theStartX, theStartY, theEndX, theEndY, theColor, theDrawMode);
		return;
	}
	FailNonScreen(DrawOperation::DrawLineAA);
}

bool Image::PolyFill3D(const Point theVertices[], int theNumVertices, const Rect *theClipRect, const Color &theColor, int theDrawMode, int tx, int ty)
{
	if (IsGpuDrawTarget())
	{
		mRenderOwner->SelectDrawSurface(this);
		mRenderOwner->FillPoly(theVertices, theNumVertices, theClipRect, theColor, theDrawMode, tx, ty);
		return true;
	}
	FailNonScreen(DrawOperation::PolyFill3D);
}

void Image::Blt(Image* theImage, int theX, int theY, const Rect& theSrcRect, const Color& theColor, int theDrawMode)
{
	if (IsGpuDrawTarget())
	{
		mRenderOwner->SelectDrawSurface(this);
		mRenderOwner->Blt(theImage, (float)theX, (float)theY, theSrcRect, theColor, theDrawMode);
		return;
	}
	FailNonScreen(DrawOperation::Blt);
}

void Image::BltF(Image* theImage, float theX, float theY, const Rect& theSrcRect, const Rect &theClipRect, const Color& theColor, int theDrawMode)
{
	if (IsGpuDrawTarget())
	{
		mRenderOwner->SelectDrawSurface(this);
		FRect aClipRect(theClipRect.mX, theClipRect.mY, theClipRect.mWidth, theClipRect.mHeight);
		FRect aDestRect(theX, theY, (float)theSrcRect.mWidth, (float)theSrcRect.mHeight);
		FRect anIntersect = aDestRect.Intersection(aClipRect);
		if (anIntersect.mWidth != aDestRect.mWidth || anIntersect.mHeight != aDestRect.mHeight)
		{
			if (anIntersect.mWidth != 0 && anIntersect.mHeight != 0)
				mRenderOwner->BltClipF(theImage, theX, theY, theSrcRect, &theClipRect, theColor, theDrawMode);
		}
		else
			mRenderOwner->Blt(theImage, theX, theY, theSrcRect, theColor, theDrawMode, true);
		return;
	}
	FailNonScreen(DrawOperation::BltF);
}

void Image::BltRotated(Image* theImage, float theX, float theY, const Rect &theSrcRect, const Rect& theClipRect, const Color& theColor, int theDrawMode, double theRot, float theRotCenterX, float theRotCenterY)
{
	if (IsGpuDrawTarget())
	{
		mRenderOwner->SelectDrawSurface(this);
		mRenderOwner->BltRotated(theImage, theX, theY, &theClipRect, theColor, theDrawMode, theRot, theRotCenterX, theRotCenterY, theSrcRect);
		return;
	}
	FailNonScreen(DrawOperation::BltRotated);
}

void Image::StretchBlt(Image* theImage, const Rect& theDestRect, const Rect& theSrcRect, const Rect& theClipRect, const Color& theColor, int theDrawMode, bool fastStretch)
{
	if (IsGpuDrawTarget())
	{
		mRenderOwner->SelectDrawSurface(this);
		mRenderOwner->StretchBlt(theImage, theDestRect, theSrcRect, &theClipRect, theColor, theDrawMode, fastStretch);
		return;
	}
	FailNonScreen(DrawOperation::StretchBlt);
}

void Image::BltMatrix(Image* theImage, float x, float y, const SexyMatrix3 &theMatrix, const Rect& theClipRect, const Color& theColor, int theDrawMode, const Rect &theSrcRect, bool blend)
{
	if (IsGpuDrawTarget())
	{
		mRenderOwner->SelectDrawSurface(this);
		mRenderOwner->BltTransformed(theImage, &theClipRect, theColor, theDrawMode, theSrcRect, theMatrix, blend, x, y, true);
		return;
	}
	FailNonScreen(DrawOperation::BltMatrix);
}

void Image::BltTrianglesTex(Image *theTexture, const TriVertex theVertices[][3], int theNumTriangles, const Rect& theClipRect, const Color &theColor, int theDrawMode, float tx, float ty, bool blend)
{
	if (IsGpuDrawTarget())
	{
		mRenderOwner->SelectDrawSurface(this);
		mRenderOwner->DrawTrianglesTex(theVertices, theNumTriangles, theColor, theDrawMode, theTexture, tx, ty, blend);
		return;
	}
	FailNonScreen(DrawOperation::BltTrianglesTex);
}

void Image::BltMirror(Image* theImage, int theX, int theY, const Rect& theSrcRect, const Color& theColor, int theDrawMode)
{
	if (IsGpuDrawTarget())
	{
		mRenderOwner->SelectDrawSurface(this);
		mRenderOwner->BltMirror(theImage, (float)theX, (float)theY, theSrcRect, theColor, theDrawMode);
		return;
	}
	FailNonScreen(DrawOperation::BltMirror);
}

void Image::StretchBltMirror(Image* theImage, const Rect& theDestRectOrig, const Rect& theSrcRect, const Rect& theClipRect, const Color& theColor, int theDrawMode, bool fastStretch)
{
	if (IsGpuDrawTarget())
	{
		mRenderOwner->SelectDrawSurface(this);
		mRenderOwner->StretchBlt(theImage, theDestRectOrig, theSrcRect, &theClipRect, theColor, theDrawMode, fastStretch, true);
		return;
	}
	FailNonScreen(DrawOperation::StretchBltMirror);
}

void Image::FillScanLinesWithCoverage(Span* theSpans, int theSpanCount, const Color& theColor, int theDrawMode, const BYTE* theCoverage, int theCoverX, int theCoverY, int theCoverWidth, int theCoverHeight)
{
	if (IsGpuDrawTarget())
	{
		mRenderOwner->SelectDrawSurface(this);
		mRenderOwner->FillScanLinesWithCoverage(theSpans, theSpanCount, theColor, theDrawMode, theCoverage, theCoverX, theCoverY, theCoverWidth, theCoverHeight);
		return;
	}
	FailNonScreen(DrawOperation::FillScanLinesWithCoverage);
}
