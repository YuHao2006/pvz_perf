#include "DDImage.h"
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

DDImage::DDImage()
	: mDDInterface(nullptr)
{
	mImageType = ImageType::DDImage;
}

DDImage::DDImage(DDInterface* theDDInterface)
	: mDDInterface(theDDInterface)
{
	mImageType = ImageType::DDImage;
}

DDImage::DDImage(const DDImage& theImage)
	: MemoryImage(theImage), mDDInterface(theImage.mDDInterface)
{
	mImageType = ImageType::DDImage;
}

DDImage::~DDImage()
{
	mImageType = ImageType::MemoryImage;
}

bool DDImage::Check3D(Image *theImage)
{
	DDImage *anImage = Sexy::AsDDImage(theImage);
	return anImage != nullptr && anImage->IsGpuDrawTarget();
}

bool DDImage::Check3D(DDImage *theImage)
{
	return theImage != nullptr && theImage->IsGpuDrawTarget();
}

bool DDImage::IsGpuDrawTarget() const noexcept
{
	if (mDDInterface == nullptr || !mDDInterface->mIs3D)
		return false;
	if (this == mDDInterface->mScreenImage)
		return true;
	const auto* data = static_cast<const TextureData*>(mD3DData);
	return data != nullptr && data->mRenderTarget;
}

bool DDImage::LockSurface()
{
	// No DirectDraw surface; the 3D screen image never needs locking.
	return false;
}

bool DDImage::UnlockSurface()
{
	return true;
}

unsigned int* DDImage::GetBits()
{
	return MemoryImage::GetBits();
}

void DDImage::FillRect(const Rect& theRect, const Color& theColor, int theDrawMode)
{
	if (IsGpuDrawTarget())
	{
		mDDInterface->mRenderInterface->SelectDrawSurface(this);
		mDDInterface->mRenderInterface->FillRect(theRect, theColor, theDrawMode);
		return;
	}
	FailNonScreen(DrawOperation::FillRect);
}

void DDImage::DrawRect(const Rect& theRect, const Color& theColor, int theDrawMode)
{
	FillRect(Rect(theRect.mX, theRect.mY, theRect.mWidth + 1, 1), theColor, theDrawMode);
	FillRect(Rect(theRect.mX, theRect.mY + theRect.mHeight, theRect.mWidth + 1, 1), theColor, theDrawMode);
	FillRect(Rect(theRect.mX, theRect.mY + 1, 1, theRect.mHeight - 1), theColor, theDrawMode);
	FillRect(Rect(theRect.mX + theRect.mWidth, theRect.mY + 1, 1, theRect.mHeight - 1), theColor, theDrawMode);
}

void DDImage::FillScanLines(Span* theSpans, int theSpanCount, const Color& theColor, int theDrawMode)
{
	for (int i = 0; i < theSpanCount; ++i)
	{
		const Span& span = theSpans[i];
		FillRect(Rect(span.mX, span.mY, span.mWidth, 1), theColor, theDrawMode);
	}
}

void DDImage::DrawLine(double theStartX, double theStartY, double theEndX, double theEndY, const Color& theColor, int theDrawMode)
{
	if (IsGpuDrawTarget())
	{
		mDDInterface->mRenderInterface->SelectDrawSurface(this);
		mDDInterface->mRenderInterface->DrawLine(theStartX, theStartY, theEndX, theEndY, theColor, theDrawMode);
		return;
	}
	FailNonScreen(DrawOperation::DrawLine);
}

void DDImage::DrawLineAA(double theStartX, double theStartY, double theEndX, double theEndY, const Color& theColor, int theDrawMode)
{
	if (IsGpuDrawTarget())
	{
		mDDInterface->mRenderInterface->SelectDrawSurface(this);
		mDDInterface->mRenderInterface->DrawLine(theStartX, theStartY, theEndX, theEndY, theColor, theDrawMode);
		return;
	}
	FailNonScreen(DrawOperation::DrawLineAA);
}

bool DDImage::PolyFill3D(const Point theVertices[], int theNumVertices, const Rect *theClipRect, const Color &theColor, int theDrawMode, int tx, int ty)
{
	if (IsGpuDrawTarget())
	{
		mDDInterface->mRenderInterface->SelectDrawSurface(this);
		mDDInterface->mRenderInterface->FillPoly(theVertices, theNumVertices, theClipRect, theColor, theDrawMode, tx, ty);
		return true;
	}
	FailNonScreen(DrawOperation::PolyFill3D);
}

void DDImage::Blt(Image* theImage, int theX, int theY, const Rect& theSrcRect, const Color& theColor, int theDrawMode)
{
	theImage->mDrawn = true;
	if (IsGpuDrawTarget())
	{
		mDDInterface->mRenderInterface->SelectDrawSurface(this);
		mDDInterface->mRenderInterface->Blt(theImage, (float)theX, (float)theY, theSrcRect, theColor, theDrawMode);
		return;
	}
	FailNonScreen(DrawOperation::Blt);
}

void DDImage::BltF(Image* theImage, float theX, float theY, const Rect& theSrcRect, const Rect &theClipRect, const Color& theColor, int theDrawMode)
{
	theImage->mDrawn = true;
	if (IsGpuDrawTarget())
	{
		mDDInterface->mRenderInterface->SelectDrawSurface(this);
		FRect aClipRect(theClipRect.mX, theClipRect.mY, theClipRect.mWidth, theClipRect.mHeight);
		FRect aDestRect(theX, theY, (float)theSrcRect.mWidth, (float)theSrcRect.mHeight);
		FRect anIntersect = aDestRect.Intersection(aClipRect);
		if (anIntersect.mWidth != aDestRect.mWidth || anIntersect.mHeight != aDestRect.mHeight)
		{
			if (anIntersect.mWidth != 0 && anIntersect.mHeight != 0)
				mDDInterface->mRenderInterface->BltClipF(theImage, theX, theY, theSrcRect, &theClipRect, theColor, theDrawMode);
		}
		else
			mDDInterface->mRenderInterface->Blt(theImage, theX, theY, theSrcRect, theColor, theDrawMode, true);
		return;
	}
	FailNonScreen(DrawOperation::BltF);
}

void DDImage::BltRotated(Image* theImage, float theX, float theY, const Rect &theSrcRect, const Rect& theClipRect, const Color& theColor, int theDrawMode, double theRot, float theRotCenterX, float theRotCenterY)
{
	theImage->mDrawn = true;
	if (IsGpuDrawTarget())
	{
		mDDInterface->mRenderInterface->SelectDrawSurface(this);
		mDDInterface->mRenderInterface->BltRotated(theImage, theX, theY, &theClipRect, theColor, theDrawMode, theRot, theRotCenterX, theRotCenterY, theSrcRect);
		return;
	}
	FailNonScreen(DrawOperation::BltRotated);
}

void DDImage::StretchBlt(Image* theImage, const Rect& theDestRect, const Rect& theSrcRect, const Rect& theClipRect, const Color& theColor, int theDrawMode, bool fastStretch)
{
	theImage->mDrawn = true;
	if (IsGpuDrawTarget())
	{
		mDDInterface->mRenderInterface->SelectDrawSurface(this);
		mDDInterface->mRenderInterface->StretchBlt(theImage, theDestRect, theSrcRect, &theClipRect, theColor, theDrawMode, fastStretch);
		return;
	}
	FailNonScreen(DrawOperation::StretchBlt);
}

void DDImage::BltMatrix(Image* theImage, float x, float y, const SexyMatrix3 &theMatrix, const Rect& theClipRect, const Color& theColor, int theDrawMode, const Rect &theSrcRect, bool blend)
{
	theImage->mDrawn = true;
	if (IsGpuDrawTarget())
	{
		mDDInterface->mRenderInterface->SelectDrawSurface(this);
		mDDInterface->mRenderInterface->BltTransformed(theImage, &theClipRect, theColor, theDrawMode, theSrcRect, theMatrix, blend, x, y, true);
		return;
	}
	FailNonScreen(DrawOperation::BltMatrix);
}

void DDImage::BltTrianglesTex(Image *theTexture, const TriVertex theVertices[][3], int theNumTriangles, const Rect& theClipRect, const Color &theColor, int theDrawMode, float tx, float ty, bool blend)
{
	theTexture->mDrawn = true;
	if (IsGpuDrawTarget())
	{
		mDDInterface->mRenderInterface->SelectDrawSurface(this);
		mDDInterface->mRenderInterface->DrawTrianglesTex(theVertices, theNumTriangles, theColor, theDrawMode, theTexture, tx, ty, blend);
		return;
	}
	FailNonScreen(DrawOperation::BltTrianglesTex);
}

void DDImage::BltMirror(Image* theImage, int theX, int theY, const Rect& theSrcRect, const Color& theColor, int theDrawMode)
{
	theImage->mDrawn = true;
	if (IsGpuDrawTarget())
	{
		mDDInterface->mRenderInterface->SelectDrawSurface(this);
		mDDInterface->mRenderInterface->BltMirror(theImage, (float)theX, (float)theY, theSrcRect, theColor, theDrawMode);
		return;
	}
	FailNonScreen(DrawOperation::BltMirror);
}

void DDImage::StretchBltMirror(Image* theImage, const Rect& theDestRectOrig, const Rect& theSrcRect, const Rect& theClipRect, const Color& theColor, int theDrawMode, bool fastStretch)
{
	theImage->mDrawn = true;
	if (IsGpuDrawTarget())
	{
		mDDInterface->mRenderInterface->SelectDrawSurface(this);
		mDDInterface->mRenderInterface->StretchBlt(theImage, theDestRectOrig, theSrcRect, &theClipRect, theColor, theDrawMode, fastStretch, true);
		return;
	}
	FailNonScreen(DrawOperation::StretchBltMirror);
}

void DDImage::FillScanLinesWithCoverage(Span* theSpans, int theSpanCount, const Color& theColor, int theDrawMode, const BYTE* theCoverage, int theCoverX, int theCoverY, int theCoverWidth, int theCoverHeight)
{
	if (IsGpuDrawTarget())
	{
		mDDInterface->mRenderInterface->SelectDrawSurface(this);
		mDDInterface->mRenderInterface->FillScanLinesWithCoverage(theSpans, theSpanCount, theColor, theDrawMode, theCoverage, theCoverX, theCoverY, theCoverWidth, theCoverHeight);
		return;
	}
	FailNonScreen(DrawOperation::FillScanLinesWithCoverage);
}
