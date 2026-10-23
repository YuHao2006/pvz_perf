#include "Graphics.h"
#include "Image.h"
#include "Font.h"
#include "misc/Rect.h"
#include "misc/Debug.h"
#include "misc/SexyMatrix.h"
#include <math.h>
#include <cstdint>
#include <limits>
#include <memory>
#include <stdexcept>

using namespace Sexy;

const Point* Graphics::mPFPoints;
namespace {
inline Image* RequireDrawDestination(Image* image, DrawOperation operation)
{
	if (image == nullptr)
        throw NonScreenDrawError(operation);
    return image;
}

class GraphicsPolygonScratch
{
    Graphics& mGraphics;
    Edge* mPreviousEdges;
    int mPreviousEdgeCount;
    const Point* mPreviousPoints;
    int mPreviousVertexCount;
public:
    int* mIndices = nullptr;
    Edge* mEdges = nullptr;
    GraphicsPolygonScratch(Graphics& g, const Point* points, int count)
        : mGraphics(g), mPreviousEdges(g.mPFActiveEdgeList),
          mPreviousEdgeCount(g.mPFNumActiveEdges), mPreviousPoints(g.mPFPoints),
          mPreviousVertexCount(g.mPFNumVertices)
    {
        try {
            mIndices = new int[count];
            mEdges = new Edge[count];
        } catch (...) {
            delete[] mIndices;
            delete[] mEdges;
            throw;
        }
        g.mPFActiveEdgeList = mEdges;
        g.mPFNumActiveEdges = 0;
        g.mPFPoints = points;
        g.mPFNumVertices = count;
    }
    ~GraphicsPolygonScratch()
    {
        mGraphics.mPFActiveEdgeList = mPreviousEdges;
        mGraphics.mPFNumActiveEdges = mPreviousEdgeCount;
        mGraphics.mPFPoints = mPreviousPoints;
        mGraphics.mPFNumVertices = mPreviousVertexCount;
        delete[] mIndices;
        delete[] mEdges;
    }
    GraphicsPolygonScratch(const GraphicsPolygonScratch&) = delete;
    GraphicsPolygonScratch& operator=(const GraphicsPolygonScratch&) = delete;
};
} // Own temporary arrays and restore borrowed fields even if drawing throws.

//////////////////////////////////////////////////////////////////////////

Graphics::Graphics(const Graphics& theGraphics) : GraphicsState(theGraphics)
{
}

Graphics::Graphics(Image* theDestImage)
{
	mTransX = 0;
	mTransY = 0;
	mScaleX = 1;
	mScaleY = 1;
	mScaleOrigX = 0;
	mScaleOrigY = 0;
	mFont = NULL;
	mDestImage = theDestImage;
	mDrawMode = DRAWMODE_NORMAL;
	mColorizeImages = false;
	mFastStretch = false;
	mWriteColoredString = true;
	mLinearBlend = false;

	mClipRect = mDestImage ? Rect(0,0,mDestImage->mWidth,mDestImage->mHeight) : Rect();
}

Graphics::~Graphics()
{
}

void Graphics::PushState()
{
	mStateStack.push_back(static_cast<const GraphicsState&>(*this));
}

void Graphics::PopState()
{
	if (mStateStack.empty())
		throw std::logic_error("Graphics::PopState: empty state stack");
	GraphicsState::operator=(mStateStack.back());
	mStateStack.pop_back();
}

Graphics* Graphics::Create()
{	
	return new Graphics(*this);
}

void Graphics::ClearRect(int, int, int, int)
{
	// ClearRect requires writable CPU pixels, which GPU destinations do not expose.
	throw GpuImageCpuAccess{};
}

void Graphics::ClearRect(const Rect& theRect)
{
	ClearRect(theRect.mX, theRect.mY, theRect.mWidth, theRect.mHeight);
}

void Graphics::FillRect(int theX, int theY, int theWidth, int theHeight)
{
	if (mColor.mAlpha == 0)
		return;

	Rect aDestRect = Rect(theX + mTransX, theY + mTransY, theWidth, theHeight).Intersection(mClipRect);
	RequireDrawDestination(mDestImage, DrawOperation::FillRect)->FillRect(aDestRect, mColor, mDrawMode);
}

void Graphics::FillRect(const Rect& theRect)
{
	FillRect(theRect.mX, theRect.mY, theRect.mWidth, theRect.mHeight);
}

void Graphics::DrawRect(int theX, int theY, int theWidth, int theHeight)
{
	if (mColor.mAlpha == 0)
		return;

	Rect aDestRect = Rect(theX + mTransX, theY + mTransY, theWidth, theHeight);	
	Rect aFullDestRect = Rect(theX + mTransX, theY + mTransY, theWidth + 1, theHeight + 1);	
	Rect aFullClippedRect = aFullDestRect.Intersection(mClipRect);

	if (aFullDestRect == aFullClippedRect)
	{		
		auto* image = RequireDrawDestination(mDestImage, DrawOperation::FillRect);
		image->FillRect(Rect(aDestRect.mX, aDestRect.mY, aDestRect.mWidth + 1, 1), mColor, mDrawMode);
		image->FillRect(Rect(aDestRect.mX, aDestRect.mY + aDestRect.mHeight, aDestRect.mWidth + 1, 1), mColor, mDrawMode);
		image->FillRect(Rect(aDestRect.mX, aDestRect.mY + 1, 1, aDestRect.mHeight - 1), mColor, mDrawMode);
		image->FillRect(Rect(aDestRect.mX + aDestRect.mWidth, aDestRect.mY + 1, 1, aDestRect.mHeight - 1), mColor, mDrawMode);
	}
	else
	{
		FillRect(theX, theY, theWidth + 1, 1);
		FillRect(theX, theY + theHeight, theWidth + 1, 1);
		FillRect(theX, theY + 1, 1, theHeight - 1);
		FillRect(theX + theWidth, theY + 1, 1, theHeight - 1);

		/*if (aClippedRect.mX == aDestRect.mX)
			mDestImage->FillRect(Rect(aClippedRect.mX, aClippedRect.mY, 1, aClippedRect.mHeight), mColor, mDrawMode);
		if (aClippedRect.mY == aDestRect.mY)
			mDestImage->FillRect(Rect(aClippedRect.mX, aClippedRect.mY, aClippedRect.mWidth, 1), mColor, mDrawMode);
		if (aClippedRect.mX + aClippedRect.mWidth == aDestRect.mX + aDestRect.mWidth)
			mDestImage->FillRect(Rect(aClippedRect.mX + aClippedRect.mWidth, aClippedRect.mY, 1, aClippedRect.mHeight), mColor, mDrawMode);
		if (aClippedRect.mY + aClippedRect.mHeight == aDestRect.mY + aDestRect.mHeight)
			mDestImage->FillRect(Rect(aClippedRect.mX, aClippedRect.mY + aClippedRect.mHeight, aClippedRect.mWidth, 1), mColor, mDrawMode);*/
	}
}

void Graphics::DrawRect(const Rect& theRect)
{
	DrawRect(theRect.mX, theRect.mY, theRect.mWidth, theRect.mHeight);
}

int Graphics::PFCompareInd(const void* u, const void* v) 
{
	const int a = mPFPoints[*static_cast<const int*>(u)].mY;
	const int b = mPFPoints[*static_cast<const int*>(v)].mY;
	return (a > b) - (a < b);
}

int Graphics::PFCompareActive(const void* u, const void* v)
{
	const double a = static_cast<const Edge*>(u)->mX;
	const double b = static_cast<const Edge*>(v)->mX;
	return (a > b) - (a < b);
}

void Graphics::PFDelete(int i) // remove edge i from active list
{
    int j;

    for (j=0; j<mPFNumActiveEdges && mPFActiveEdgeList[j].i!=i; j++);    
	if (j>=mPFNumActiveEdges) return;	/* edge not in active list; happens at aMinY*/
    
	mPFNumActiveEdges--;
    memmove(&mPFActiveEdgeList[j], &mPFActiveEdgeList[j+1], (mPFNumActiveEdges-j)*sizeof mPFActiveEdgeList[0]);
}

void Graphics::PFInsert(int i, int y) // append edge i to end of active list
{
    int j;
    double dx;
    const Point *p, *q;

    j = i<mPFNumVertices-1 ? i+1 : 0;
    if (mPFPoints[i].mY < mPFPoints[j].mY) 
	{
		p = &mPFPoints[i]; 
		q = &mPFPoints[j];
	}
    else		   
	{
		p = &mPFPoints[j]; 
		q = &mPFPoints[i];
	}
    /* initialize x position at intersection of edge with scanline y */
    mPFActiveEdgeList[mPFNumActiveEdges].mDX = dx = (q->mX - p->mX)/(double) (q->mY - p->mY);
    mPFActiveEdgeList[mPFNumActiveEdges].mX = dx*(y+0.5 - p->mY - mTransY) + p->mX + mTransX;
    mPFActiveEdgeList[mPFNumActiveEdges].i = i;
	// AA edge equations use screen coordinates, like mX above. The intercept
	// is only consumed for steep (|dx| > 1) edges.
	mPFActiveEdgeList[mPFNumActiveEdges].b = fabs(dx)>1.0 ?
		p->mY + mTransY - 1.0/dx * (p->mX + mTransX) : 0.0;
    mPFNumActiveEdges++;
}

void Graphics::PolyFill(const Point *theVertexList, int theNumVertices, bool convex)
{
	if (theNumVertices <= 0) return;
	if (!theVertexList) throw std::invalid_argument("Graphics polygon: null vertex list");
	if (mClipRect.mWidth <= 0 || mClipRect.mHeight <= 0) return;
	if (convex && mDestImage != nullptr && mDestImage->PolyFill3D(theVertexList,theNumVertices,&mClipRect,mColor,mDrawMode,mTransX,mTransY))
		return;

	Span aSpans[MAX_TEMP_SPANS];
	int aSpanPos = 0;

    int k, y0, y1, y, i, j, xl, xr;


	int aMinX = mClipRect.mX;
	int aMaxX = mClipRect.mX + mClipRect.mWidth - 1;
	int aMinY = mClipRect.mY;
	int aMaxY = mClipRect.mY + mClipRect.mHeight - 1;

	GraphicsPolygonScratch aScratch(*this, theVertexList, theNumVertices);
	int* ind = aScratch.mIndices;

    /* create y-sorted array of indices ind[k] into vertex list */
    for (k=0; k<mPFNumVertices; k++)
		ind[k] = k;
    qsort(ind, mPFNumVertices, sizeof ind[0], PFCompareInd);	/* sort ind by mPFPoints[ind[k]].y */

    mPFNumActiveEdges = 0;				/* start with empty active list */
    k = 0;				/* ind[k] is next vertex to process */
    y0 = std::max(aMinY, (int)ceil(mPFPoints[ind[0]].mY-0.5 + mTransY));		/* ymin of polygon */
    y1 = std::min(aMaxY, (int)floor(mPFPoints[ind[mPFNumVertices-1]].mY-0.5 + mTransY));	/* ymax of polygon */

    for (y=y0; y<=y1; y++) 
	{
		// step through scanlines 
		// scanline y is at y+.5 in continuous coordinates 

		// check vertices between previous scanline and current one, if any 
		for (; (k < mPFNumVertices) && (mPFPoints[ind[k]].mY + mTransY <= y + 0.5); k++) 
		{
			// to simplify, if mPFPoints.mY=y+.5, pretend it's above 
			// invariant: y-.5 < mPFPoints[i].mY <= y+.5 
			i = ind[k];				
			// insert or delete edges before and after vertex i (i-1 to i,
			// and i to i+1) from active list if they cross scanline y			 

			j = i>0 ? i-1 : mPFNumVertices-1;	// vertex previous to i 
			if (mPFPoints[j].mY + mTransY <= y-0.5)	// old edge, remove from active list 
				PFDelete(j);
			else if (mPFPoints[j].mY + mTransY > y+0.5)	// new edge, add to active list 
				PFInsert(j, y);

			j = i<mPFNumVertices-1 ? i+1 : 0;	// vertex next after i 
			if (mPFPoints[j].mY + mTransY <= y-0.5)	// old edge, remove from active list 
				PFDelete(i);
			else if (mPFPoints[j].mY + mTransY > y+0.5)	// new edge, add to active list 
				PFInsert(i, y);
		}

		// sort active edge list by active[j].mX 
		qsort(mPFActiveEdgeList, mPFNumActiveEdges, sizeof mPFActiveEdgeList[0], PFCompareActive);

		// draw horizontal segments for scanline y 
		for (j = 0; j < mPFNumActiveEdges; j += 2) 
		{	// draw horizontal segments 
			// span 'tween j & j+1 is inside, span tween j+1 & j+2 is outside 
			xl = (int) ceil(mPFActiveEdgeList[j].mX-0.5);		// left end of span 
			if (xl<aMinX) 
				xl = aMinX;
			xr = (int) floor(mPFActiveEdgeList[j+1].mX-0.5);	// right end of span 
			if (xr>aMaxX) 
				xr = aMaxX;
			
			if ((xl <= xr) && (aSpanPos < MAX_TEMP_SPANS))
			{
				Span* aSpan = &aSpans[aSpanPos++];
				aSpan->mY = y;
				aSpan->mX = xl;
				aSpan->mWidth = xr - xl + 1;
			}			
			
			mPFActiveEdgeList[j].mX += mPFActiveEdgeList[j].mDX;	// increment edge coords 
			mPFActiveEdgeList[j+1].mX += mPFActiveEdgeList[j+1].mDX;
		}
	}

	if (aSpanPos > 0)
	{
		auto* image = RequireDrawDestination(mDestImage, DrawOperation::FillRect);
		for (int i = 0; i < aSpanPos; ++i)
		{
			const auto& span = aSpans[i];
			image->FillRect(Rect(span.mX, span.mY, span.mWidth, 1), mColor, mDrawMode);
		}
	}


}

void Graphics::PolyFillAA(const Point *theVertexList, int theNumVertices, bool convex)
{
	if (theNumVertices <= 0) return;
	if (!theVertexList) throw std::invalid_argument("Graphics polygon: null vertex list");
	if (mClipRect.mWidth <= 0 || mClipRect.mHeight <= 0) return;
	if (convex && mDestImage != nullptr && mDestImage->PolyFill3D(theVertexList,theNumVertices,&mClipRect,mColor,mDrawMode,mTransX,mTransY))
		return;

	int i;

	Span aSpans[MAX_TEMP_SPANS];
	int aSpanPos = 0;

	static BYTE aCoverageBuffer[256*256];
	int aCoverWidth = 256, aCoverHeight = 256; 
	int aCoverLeft, aCoverRight, aCoverTop, aCoverBottom;

	for (i = 0; i < theNumVertices; ++i)
	{
		const Point* aPt = &theVertexList[i];
		const int left=(int)floor(aPt->mX+mTransX),right=(int)ceil(aPt->mX+mTransX);
		const int top=(int)floor(aPt->mY+mTransY),bottom=(int)ceil(aPt->mY+mTransY);
		if (i == 0)
		{
			aCoverLeft=left;aCoverRight=right;
			aCoverTop=top;aCoverBottom=bottom;
		}
		else
		{
			aCoverLeft = std::min(aCoverLeft,left);
			aCoverRight = std::max(aCoverRight,right);
			aCoverTop = std::min(aCoverTop,top);
			aCoverBottom = std::max(aCoverBottom,bottom);
		}
	}
	const int64_t aWidth = int64_t(aCoverRight) - aCoverLeft + 1;
	const int64_t aHeight = int64_t(aCoverBottom) - aCoverTop + 1;
	if (aWidth <= 0 || aHeight <= 0 || aWidth > std::numeric_limits<int>::max() ||
		aHeight > std::numeric_limits<int>::max() || aWidth * aHeight > std::numeric_limits<int>::max())
		throw std::length_error("Graphics::PolyFillAA: coverage exceeds signed image dimensions");
	std::unique_ptr<BYTE[]> aCoverage;
	BYTE* coverPtr = aCoverageBuffer;
	if (aWidth > aCoverWidth || aHeight > aCoverHeight)
	{
		aCoverWidth = static_cast<int>(aWidth);
		aCoverHeight = static_cast<int>(aHeight);
		aCoverage.reset(new BYTE[size_t(aCoverWidth) * aCoverHeight]);
		coverPtr = aCoverage.get();
	}
	memset(coverPtr, 0, size_t(aCoverWidth) * aCoverHeight);

    int k, y0, y1, y, j, xl, xr;


	int aMinX = mClipRect.mX;
	int aMaxX = mClipRect.mX + mClipRect.mWidth - 1;
	int aMinY = mClipRect.mY;
	int aMaxY = mClipRect.mY + mClipRect.mHeight - 1;

	GraphicsPolygonScratch aScratch(*this, theVertexList, theNumVertices);
	int* ind = aScratch.mIndices;

    /* create y-sorted array of indices ind[k] into vertex list */
    for (k=0; k<mPFNumVertices; k++)
		ind[k] = k;
    qsort(ind, mPFNumVertices, sizeof ind[0], PFCompareInd);	/* sort ind by mPFPoints[ind[k]].y */

    mPFNumActiveEdges = 0;				/* start with empty active list */
    k = 0;				/* ind[k] is next vertex to process */
    y0 =  std::max(aMinY, (int)ceil(mPFPoints[ind[0]].mY-0.5 + mTransY));		/* ymin of polygon */
    y1 =  std::min(aMaxY, (int)floor(mPFPoints[ind[mPFNumVertices-1]].mY-0.5 + mTransY));	/* ymax of polygon */

    for (y=y0; y<=y1; y++) 
	{
		// step through scanlines 
		// scanline y is at y+.5 in continuous coordinates 

		// check vertices between previous scanline and current one, if any 
		for (; (k < mPFNumVertices) && (mPFPoints[ind[k]].mY + mTransY <= y + 0.5); k++) 
		{
			// to simplify, if mPFPoints.mY=y+.5, pretend it's above 
			// invariant: y-.5 < mPFPoints[i].mY <= y+.5 
			i = ind[k];				
			// insert or delete edges before and after vertex i (i-1 to i,
			// and i to i+1) from active list if they cross scanline y			 

			j = i>0 ? i-1 : mPFNumVertices-1;	// vertex previous to i 
			if (mPFPoints[j].mY + mTransY <= y-0.5)	// old edge, remove from active list 
				PFDelete(j);
			else if (mPFPoints[j].mY + mTransY > y+0.5)	// new edge, add to active list 
				PFInsert(j, y);

			j = i<mPFNumVertices-1 ? i+1 : 0;	// vertex next after i 
			if (mPFPoints[j].mY + mTransY <= y-0.5)	// old edge, remove from active list 
				PFDelete(i);
			else if (mPFPoints[j].mY + mTransY > y+0.5)	// new edge, add to active list 
				PFInsert(i, y);
		}

		// sort active edge list by active[j].mX 
		qsort(mPFActiveEdgeList, mPFNumActiveEdges, sizeof mPFActiveEdgeList[0], PFCompareActive);

		// draw horizontal segments for scanline y 
		for (j = 0; j < mPFNumActiveEdges; j += 2) 
		{	// draw horizontal segments 
			// span 'tween j & j+1 is inside, span tween j+1 & j+2 is outside 
			xl = (int) ceil(mPFActiveEdgeList[j].mX-0.5);		// left end of span 
			int lErr = int((fabs((mPFActiveEdgeList[j].mX-0.5) - xl)) * 255);
			if (xl<aMinX)
			{
				xl = aMinX;
				lErr = 255;
			}
			xr = (int) floor(mPFActiveEdgeList[j+1].mX-0.5);	// right end of span 
			int rErr = int((fabs((mPFActiveEdgeList[j+1].mX-0.5) - xr)) * 255);
			if (xr>aMaxX) 
			{
				xr = aMaxX;
				rErr = 255;
			}
			
			if ((xl <= xr) && (aSpanPos < MAX_TEMP_SPANS))
			{
				Span* aSpan = &aSpans[aSpanPos++];
				aSpan->mY = y;
				aSpan->mX = xl;
				aSpan->mWidth = xr - xl + 1;

				BYTE* coverRow = coverPtr + (y - aCoverTop) * aCoverWidth;
				if (xr == xl)
				{
					coverRow[xl-aCoverLeft] = std::min(255, coverRow[xl-aCoverLeft] + ((lErr*rErr)>>8));
				}
				else
				{
					if (fabs(mPFActiveEdgeList[j].mDX) > 1.0f) // mostly horizontal on the left edge
					{
						double m = 1.0 / mPFActiveEdgeList[j].mDX, 
								b = mPFActiveEdgeList[j].b, 
								c = fabs(mPFActiveEdgeList[j].mDX);
						do
						{
							double _y =	m * xl + b;
							lErr = std::min(255, int(fabs((_y) - y - .5) * 255));
							coverRow[xl-aCoverLeft] = std::min(255, coverRow[xl-aCoverLeft] + lErr);
							xl++;
							c -= 1.0;
						} while (xl <= xr && c > 0);
					}
					else
					{
						coverRow[xl-aCoverLeft] = std::min(255, coverRow[xl-aCoverLeft] + lErr);
						xl++;
					}

					if (fabs(mPFActiveEdgeList[j+1].mDX) > 1.0f) // mostly horizontal on the right edge
					{
						double m = 1.0 / mPFActiveEdgeList[j+1].mDX, 
								b = mPFActiveEdgeList[j+1].b, 
								c = fabs(mPFActiveEdgeList[j+1].mDX);
						do
						{
							double _y =	m * xr + b;
							rErr = std::min(255, int(fabs((_y) - y - .5) * 255));
							coverRow[xr-aCoverLeft] = std::min(255, coverRow[xr-aCoverLeft] + rErr);
							xr--;
							c -= 1.0;
						} while (xr >= xl && c > 0);
					}
					else
					{
						coverRow[xr-aCoverLeft] = std::min(255, coverRow[xr-aCoverLeft] + rErr);
						xr--;
					}

					if (xl <= xr)
						memset(&coverRow[xl-aCoverLeft], 255, xr-xl+1);
				}
			}			
			
			mPFActiveEdgeList[j].mX += mPFActiveEdgeList[j].mDX;	// increment edge coords 
			mPFActiveEdgeList[j+1].mX += mPFActiveEdgeList[j+1].mDX;
		}
	}

	RequireDrawDestination(mDestImage, DrawOperation::FillScanLinesWithCoverage)->FillScanLinesWithCoverage(aSpans, aSpanPos, mColor, mDrawMode, coverPtr, aCoverLeft, aCoverTop, aCoverWidth, aCoverHeight);
	


}


bool Graphics::DrawLineClipHelper(double* theStartX, double* theStartY, double* theEndX, double* theEndY)
{
	double aStartX = *theStartX;
	double aStartY = *theStartY;
	double aEndX = *theEndX;
	double aEndY = *theEndY;

	// Clip X
	if (aStartX > aEndX)
	{
		std::swap(aStartX,aEndX);
		std::swap(aStartY,aEndY);
	}

	if (aStartX < mClipRect.mX)
	{
		if (aEndX < mClipRect.mX)
			return false;
					
		double aSlope = (aEndY - aStartY) / (aEndX - aStartX);
		aStartY += (mClipRect.mX - aStartX ) * aSlope;
		aStartX = mClipRect.mX;
	}

	if (aEndX >= mClipRect.mX + mClipRect.mWidth)
	{
		if (aStartX >= mClipRect.mX + mClipRect.mWidth)
			return false;

		double aSlope = (aEndY - aStartY) / (aEndX - aStartX);
		aEndY += (mClipRect.mX + mClipRect.mWidth - 1 - aEndX) * aSlope;
		aEndX = mClipRect.mX + mClipRect.mWidth - 1;
	}

	// Clip Y
	if (aStartY > aEndY)
	{
		std::swap(aStartX,aEndX);
		std::swap(aStartY,aEndY);
	}


	if (aStartY < mClipRect.mY)
	{
		if (aEndY < mClipRect.mY)
			return false;
					
		double aSlope = (aEndX - aStartX) / (aEndY - aStartY);
		aStartX += (mClipRect.mY - aStartY ) * aSlope;			

		aStartY = mClipRect.mY;
	}

	if (aEndY >= mClipRect.mY + mClipRect.mHeight)
	{
		if (aStartY >= mClipRect.mY + mClipRect.mHeight)
			return false;

		double aSlope = (aEndX - aStartX) / (aEndY - aStartY);
		aEndX += (mClipRect.mY + mClipRect.mHeight - 1 - aEndY) * aSlope;			
		aEndY = mClipRect.mY + mClipRect.mHeight - 1;
	}

	*theStartX = aStartX;
	*theStartY = aStartY;
	*theEndX = aEndX;
	*theEndY = aEndY;

	return true;
}

void Graphics::DrawLine(int theStartX, int theStartY, int theEndX, int theEndY)
{
	double aStartX = theStartX + mTransX;
	double aStartY = theStartY + mTransY;
	double aEndX = theEndX + mTransX;
	double aEndY = theEndY + mTransY;

	if (!DrawLineClipHelper(&aStartX, &aStartY, &aEndX, &aEndY))
		return;

	RequireDrawDestination(mDestImage, DrawOperation::DrawLine)->DrawLine(aStartX, aStartY, aEndX, aEndY, mColor, mDrawMode);
}

void Graphics::DrawLineAA(int theStartX, int theStartY, int theEndX, int theEndY)
{
	double aStartX = theStartX + mTransX;
	double aStartY = theStartY + mTransY;
	double aEndX = theEndX + mTransX;
	double aEndY = theEndY + mTransY;

	if (!DrawLineClipHelper(&aStartX, &aStartY, &aEndX, &aEndY))
		return;

	RequireDrawDestination(mDestImage, DrawOperation::DrawLineAA)->DrawLineAA(aStartX, aStartY, aEndX, aEndY, mColor, mDrawMode);
}

void Graphics::DrawString(const SexyString& theString, int theX, int theY)
{
	if (mFont != NULL)
		mFont->DrawString(this, theX, theY, theString, mColor, mClipRect);
}

void Graphics::DrawImage(Sexy::Image* theImage, int theX, int theY)
{
	if (mScaleX!=1 || mScaleY!=1)
	{
		DrawImage(theImage,theX,theY,Rect(0,0,theImage->mWidth,theImage->mHeight));
		return;
	}

	theX += mTransX;
	theY += mTransY;	

	Rect aDestRect = Rect(theX, theY, theImage->mWidth, theImage->mHeight).Intersection(mClipRect);
	Rect aSrcRect(aDestRect.mX - theX, aDestRect.mY - theY, aDestRect.mWidth, aDestRect.mHeight);

	if ((aSrcRect.mWidth > 0) && (aSrcRect.mHeight > 0))
		RequireDrawDestination(mDestImage, DrawOperation::Blt)->Blt(theImage, aDestRect.mX, aDestRect.mY, aSrcRect, mColorizeImages ? mColor : Color::White, mDrawMode);
}

void Graphics::DrawImage(Image* theImage, int theX, int theY, const Rect& theSrcRect)
{
	DBG_ASSERTE(theSrcRect.mX + theSrcRect.mWidth <= theImage->mWidth);	
	DBG_ASSERTE(theSrcRect.mY + theSrcRect.mHeight <= theImage->mHeight);	

	if ((theSrcRect.mX + theSrcRect.mWidth > theImage->mWidth) ||
		(theSrcRect.mY + theSrcRect.mHeight > theImage->mHeight))
		return;	

	theX += mTransX;
	theY += mTransY;

	if (mScaleX!=1 || mScaleY!=1)
	{
		Rect aDestRect(mScaleOrigX+floor((theX-mScaleOrigX)*mScaleX),mScaleOrigY+floor((theY-mScaleOrigY)*mScaleY),ceil(theSrcRect.mWidth*mScaleX),ceil(theSrcRect.mHeight*mScaleY));
		RequireDrawDestination(mDestImage, DrawOperation::StretchBlt)->StretchBlt(theImage, aDestRect, theSrcRect, mClipRect, mColorizeImages ? mColor : Color::White, mDrawMode, mFastStretch);
		return;
	}

	Rect aDestRect = Rect(theX, theY, theSrcRect.mWidth, theSrcRect.mHeight).Intersection(mClipRect);
	Rect aSrcRect(theSrcRect.mX + aDestRect.mX - theX, theSrcRect.mY + aDestRect.mY - theY, aDestRect.mWidth, aDestRect.mHeight);

	if ((aSrcRect.mWidth > 0) && (aSrcRect.mHeight > 0))
		RequireDrawDestination(mDestImage, DrawOperation::Blt)->Blt(theImage, aDestRect.mX, aDestRect.mY, aSrcRect, mColorizeImages ? mColor : Color::White, mDrawMode);
}

void Graphics::DrawImageMirror(Image* theImage, int theX, int theY, bool mirror)
{
	DrawImageMirror(theImage,theX,theY,Rect(0,0,theImage->mWidth,theImage->mHeight),mirror);
}

void Graphics::DrawImageMirror(Image* theImage, int theX, int theY, const Rect& theSrcRect, bool mirror)
{
	if (!mirror)
	{
		DrawImage(theImage, theX, theY, theSrcRect);
		return;
	}

	theX += mTransX;
	theY += mTransY;

	DBG_ASSERTE(theSrcRect.mX + theSrcRect.mWidth <= theImage->mWidth);	
	DBG_ASSERTE(theSrcRect.mY + theSrcRect.mHeight <= theImage->mHeight);	

	if ((theSrcRect.mX + theSrcRect.mWidth > theImage->mWidth) ||
		(theSrcRect.mY + theSrcRect.mHeight > theImage->mHeight))
		return;	

	Rect aDestRect = Rect(theX, theY, theSrcRect.mWidth, theSrcRect.mHeight).Intersection(mClipRect);

	int aTotalClip = theSrcRect.mWidth - aDestRect.mWidth;
	int aLeftClip = aDestRect.mX - theX;
	int aRightClip = aTotalClip-aLeftClip;

	Rect aSrcRect(theSrcRect.mX + aRightClip, theSrcRect.mY + aDestRect.mY - theY, aDestRect.mWidth, aDestRect.mHeight);

	if ((aSrcRect.mWidth > 0) && (aSrcRect.mHeight > 0))
		RequireDrawDestination(mDestImage, DrawOperation::BltMirror)->BltMirror(theImage, aDestRect.mX, aDestRect.mY, aSrcRect, mColorizeImages ? mColor : Color::White, mDrawMode);
}

void Graphics::DrawImageMirror(Image* theImage, const Rect& theDestRect, const Rect& theSrcRect, bool mirror)
{
	if (!mirror)
	{
		DrawImage(theImage,theDestRect,theSrcRect);
		return;
	}

	Rect aDestRect = Rect(theDestRect.mX + mTransX, theDestRect.mY + mTransY, theDestRect.mWidth, theDestRect.mHeight);

	RequireDrawDestination(mDestImage, DrawOperation::StretchBltMirror)->StretchBltMirror(theImage, aDestRect, theSrcRect, mClipRect, mColorizeImages ? mColor : Color::White, mDrawMode, mFastStretch);
}


void Graphics::DrawImage(Image* theImage, int theX, int theY, int theStretchedWidth, int theStretchedHeight)
{
	Rect aDestRect = Rect(theX + mTransX, theY + mTransY, theStretchedWidth, theStretchedHeight);
	Rect aSrcRect = Rect(0, 0, theImage->mWidth, theImage->mHeight);

	RequireDrawDestination(mDestImage, DrawOperation::StretchBlt)->StretchBlt(theImage, aDestRect, aSrcRect, mClipRect, mColorizeImages ? mColor : Color::White, mDrawMode, mFastStretch);
}

void Graphics::DrawImage(Image* theImage, const Rect& theDestRect, const Rect& theSrcRect)
{	
	Rect aDestRect = Rect(theDestRect.mX + mTransX, theDestRect.mY + mTransY, theDestRect.mWidth, theDestRect.mHeight);

	RequireDrawDestination(mDestImage, DrawOperation::StretchBlt)->StretchBlt(theImage, aDestRect, theSrcRect, mClipRect, mColorizeImages ? mColor : Color::White, mDrawMode, mFastStretch);
}

void Graphics::DrawImageF(Image* theImage, float theX, float theY)
{
	theX += mTransX;
	theY += mTransY;	

	Rect aSrcRect(0, 0, theImage->mWidth, theImage->mHeight);
	RequireDrawDestination(mDestImage, DrawOperation::BltF)->BltF(theImage, theX, theY, aSrcRect, mClipRect, mColorizeImages ? mColor : Color::White, mDrawMode);
}

void Graphics::DrawImageF(Image* theImage, float theX, float theY, const Rect& theSrcRect)
{
	DBG_ASSERTE(theSrcRect.mX + theSrcRect.mWidth <= theImage->mWidth);	
	DBG_ASSERTE(theSrcRect.mY + theSrcRect.mHeight <= theImage->mHeight);

	theX += mTransX;
	theY += mTransY;
	
	RequireDrawDestination(mDestImage, DrawOperation::BltF)->BltF(theImage, theX, theY, theSrcRect, mClipRect, mColorizeImages ? mColor : Color::White, mDrawMode);
}

void Graphics::DrawImageRotated(Image* theImage, int theX, int theY, double theRot, const Rect *theSrcRect)
{	
	if (theSrcRect == NULL)
	{
		int aRotCenterX = theImage->mWidth / 2;
		int aRotCenterY = theImage->mHeight / 2;

		DrawImageRotatedF(theImage, theX, theY, theRot, aRotCenterX, aRotCenterY, theSrcRect);
	}
	else
	{
		int aRotCenterX = theSrcRect->mWidth / 2;
		int aRotCenterY = theSrcRect->mHeight / 2;

		DrawImageRotatedF(theImage, theX, theY, theRot, aRotCenterX, aRotCenterY, theSrcRect);
	}
}

void Graphics::DrawImageRotatedF(Image* theImage, float theX, float theY, double theRot, const Rect *theSrcRect)
{	
	if (theSrcRect == NULL)
	{
		float aRotCenterX = theImage->mWidth / 2.0f;
		float aRotCenterY = theImage->mHeight / 2.0f;

		DrawImageRotatedF(theImage, theX, theY, theRot, aRotCenterX, aRotCenterY, theSrcRect);
	}
	else
	{
		float aRotCenterX = theSrcRect->mWidth / 2.0f;
		float aRotCenterY = theSrcRect->mHeight / 2.0f;

		DrawImageRotatedF(theImage, theX, theY, theRot, aRotCenterX, aRotCenterY, theSrcRect);
	}
}

void Graphics::DrawImageRotated(Image* theImage, int theX, int theY, double theRot, int theRotCenterX, int theRotCenterY, const Rect *theSrcRect)
{
	DrawImageRotatedF(theImage,theX,theY,theRot,theRotCenterX,theRotCenterY,theSrcRect);
}

void Graphics::DrawImageRotatedF(Image* theImage, float theX, float theY, double theRot, float theRotCenterX, float theRotCenterY, const Rect *theSrcRect)
{
	theX += mTransX;
	theY += mTransY;	

	if (theSrcRect==NULL)
	{
		Rect aSrcRect(0,0,theImage->mWidth,theImage->mHeight);
		RequireDrawDestination(mDestImage, DrawOperation::BltRotated)->BltRotated(theImage, theX, theY, aSrcRect, mClipRect, mColorizeImages ? mColor : Color::White, mDrawMode, theRot, theRotCenterX, theRotCenterY);
	}
	else
		RequireDrawDestination(mDestImage, DrawOperation::BltRotated)->BltRotated(theImage, theX, theY, *theSrcRect, mClipRect, mColorizeImages ? mColor : Color::White, mDrawMode, theRot, theRotCenterX, theRotCenterY);
}

void Graphics::DrawImageMatrix(Image* theImage, const SexyMatrix3 &theMatrix, float x, float y)
{	
	Rect aSrcRect(0,0,theImage->mWidth,theImage->mHeight);
	RequireDrawDestination(mDestImage, DrawOperation::BltMatrix)->BltMatrix(theImage,x+mTransX,y+mTransY,theMatrix,mClipRect,mColorizeImages?mColor:Color::White,mDrawMode,aSrcRect,mLinearBlend);
}

void Graphics::DrawImageMatrix(Image* theImage, const SexyMatrix3 &theMatrix, const Rect &theSrcRect, float x, float y)
{
	RequireDrawDestination(mDestImage, DrawOperation::BltMatrix)->BltMatrix(theImage,x+mTransX,y+mTransY,theMatrix,mClipRect,mColorizeImages?mColor:Color::White,mDrawMode,theSrcRect,mLinearBlend);
}

void Graphics::DrawImageTransformHelper(Image* theImage, const Transform &theTransform, const Rect &theSrcRect, float x, float y, bool useFloat)
{
	if (theTransform.mComplex || useFloat)
	{
		DrawImageMatrix(theImage,theTransform.GetMatrix(),theSrcRect,x,y);
		return;
	}

	// Translate into appropriate graphics call
	float w2 = theSrcRect.mWidth/2.0f;
	float h2 = theSrcRect.mHeight/2.0f;

	if (theTransform.mHaveRot)
	{
		float rx = w2-theTransform.mTransX1;
		float ry = h2-theTransform.mTransY1;
		
		x = x + theTransform.mTransX2 - rx + 0.5f;
		y = y + theTransform.mTransY2 - ry + 0.5f;

		DrawImageRotated(theImage,x,y,theTransform.mRot,rx,ry,&theSrcRect);
	}
	else if (theTransform.mHaveScale)
	{
		bool mirror = false;
		if (theTransform.mScaleX==-1)
		{
			if (theTransform.mScaleY==1)
			{
				x = x + theTransform.mTransX1 + theTransform.mTransX2 - w2 + 0.5f;
				y = y + theTransform.mTransY1 + theTransform.mTransY2 - h2 + 0.5f;
				DrawImageMirror(theImage,x,y,theSrcRect);
				return;
			}
			mirror = true;
		}

		float sw = w2*theTransform.mScaleX;
		float sh = h2*theTransform.mScaleY;

		x = x + theTransform.mTransX2 - sw;
		y = y + theTransform.mTransY2 - sh;
	
		Rect aDestRect(x,y,sw*2,sh*2);
		DrawImageMirror(theImage,aDestRect,theSrcRect,mirror);
	}
	else
	{
		x = x + theTransform.mTransX1 + theTransform.mTransX2 - w2 + 0.5f;
		y = y + theTransform.mTransY1 + theTransform.mTransY2 - h2 + 0.5f;

		DrawImage(theImage,x,y,theSrcRect);
	}
}

void Graphics::DrawImageTransform(Image* theImage, const Transform &theTransform, float x, float y)
{
	DrawImageTransformHelper(theImage,theTransform,Rect(0,0,theImage->mWidth,theImage->mHeight),x,y,false);
}

void Graphics::DrawImageTransformF(Image* theImage, const Transform &theTransform, float x, float y)
{
	DrawImageTransformHelper(theImage,theTransform,Rect(0,0,theImage->mWidth,theImage->mHeight),x,y,true);
}

void Graphics::DrawImageTransform(Image* theImage, const Transform &theTransform, const Rect &theSrcRect, float x, float y)
{
	DrawImageTransformHelper(theImage,theTransform,theSrcRect,x,y,false);
}

void Graphics::DrawImageTransformF(Image* theImage, const Transform &theTransform, const Rect &theSrcRect, float x, float y)
{
	DrawImageTransformHelper(theImage,theTransform,theSrcRect,x,y,true);
}

void Graphics::DrawTriangleTex(Image *theTexture, const TriVertex &v1, const TriVertex &v2, const TriVertex &v3)
{
	TriVertex v[1][3] = {{v1,v2,v3}};
	RequireDrawDestination(mDestImage, DrawOperation::BltTrianglesTex)->BltTrianglesTex(theTexture,v,1,mClipRect,mColorizeImages?mColor:Color::White,mDrawMode,mTransX,mTransY,mLinearBlend);
}

void Graphics::DrawTrianglesTex(Image *theTexture, const TriVertex theVertices[][3], int theNumTriangles)
{
	RequireDrawDestination(mDestImage, DrawOperation::BltTrianglesTex)->BltTrianglesTex(theTexture,theVertices,theNumTriangles,mClipRect,mColorizeImages?mColor:Color::White,mDrawMode,mTransX,mTransY,mLinearBlend);
}

void Graphics::ClearClipRect()
{
	mClipRect = mDestImage ? Rect(0,0,mDestImage->mWidth,mDestImage->mHeight) : Rect();
}

void Graphics::SetClipRect(int theX, int theY, int theWidth, int theHeight)
{
	mClipRect = 
		(mDestImage ? Rect(0,0,mDestImage->mWidth,mDestImage->mHeight) : Rect()).Intersection(
			Rect(theX + mTransX, theY + mTransY, theWidth, theHeight));
}

void Graphics::SetClipRect(const Rect& theRect)
{
	SetClipRect(theRect.mX, theRect.mY, theRect.mWidth, theRect.mHeight);
}

void Graphics::ClipRect(int theX, int theY, int theWidth, int theHeight)
{
	mClipRect = mClipRect.Intersection(Rect(theX + mTransX, theY + mTransY, theWidth, theHeight));
}

void Graphics::ClipRect(const Rect& theRect)
{
	ClipRect(theRect.mX, theRect.mY, theRect.mWidth, theRect.mHeight);
}

void Graphics::Translate(int theTransX, int theTransY)
{
	mTransX += theTransX;
	mTransY += theTransY;
}

void Graphics::TranslateF(float theTransX, float theTransY)
{
	mTransX += theTransX;
	mTransY += theTransY;
}

void Graphics::SetScale(float theScaleX, float theScaleY, float theOrigX, float theOrigY)
{
	mScaleX = theScaleX;
	mScaleY = theScaleY;
	mScaleOrigX = theOrigX + mTransX;
	mScaleOrigY = theOrigY + mTransY;
}

int Graphics::StringWidth(const SexyString& theString)
{
	return mFont->StringWidth(theString);
}

void Graphics::DrawImageBox(const Rect& theDest, Image* theComponentImage)
{
	DrawImageBox(Rect(0,0,theComponentImage->mWidth,theComponentImage->mHeight),theDest,theComponentImage);
}

void Graphics::DrawImageBox(const Rect& theSrc, const Rect &theDest, Image* theComponentImage)
{	
	if (theSrc.mWidth<=0 || theSrc.mHeight<=0)
		return;

	int cw = theSrc.mWidth/3;
	int ch = theSrc.mHeight/3;
	int cx = theSrc.mX;
	int cy = theSrc.mY;
	int cmw = theSrc.mWidth - cw*2;
	int cmh = theSrc.mHeight - ch*2;
		
	// Draw 4 corners
	DrawImage(theComponentImage, theDest.mX, theDest.mY, Rect(cx,cy, cw, ch));
	DrawImage(theComponentImage, theDest.mX + theDest.mWidth-cw, theDest.mY, Rect(cx + cw + cmw, cy, cw, ch));
	DrawImage(theComponentImage, theDest.mX, theDest.mY + theDest.mHeight-ch, Rect(cx, cy + ch + cmh, cw, ch));
	DrawImage(theComponentImage, theDest.mX + theDest.mWidth-cw, theDest.mY + theDest.mHeight-ch, Rect(cx + cw + cmw, cy + ch + cmh, cw, ch));

	// Draw top and bottom
	Graphics aVertClip(*this);
	aVertClip.ClipRect(theDest.mX + cw, theDest.mY, theDest.mWidth-cw*2, theDest.mHeight);
	int aCol, aRow;
	for (aCol = 0; aCol < (theDest.mWidth-cw*2+cmw-1)/cmw; aCol++)
	{
		aVertClip.DrawImage(theComponentImage, theDest.mX + cw + aCol*cmw, theDest.mY, Rect(cx + cw, cy, cmw, ch));
		aVertClip.DrawImage(theComponentImage, theDest.mX + cw + aCol*cmw, theDest.mY + theDest.mHeight-ch, Rect(cx + cw, cy + ch + cmh, cmw, ch));
	}

	// Draw sides
	Graphics aHorzClip(*this);
	aHorzClip.ClipRect(theDest.mX, theDest.mY + ch, theDest.mWidth, theDest.mHeight-ch*2);
	for (aRow = 0; aRow < (theDest.mHeight-ch*2+cmh-1)/cmh; aRow++)
	{
		aHorzClip.DrawImage(theComponentImage, theDest.mX, theDest.mY + ch + aRow*cmh, Rect(cx, cy + ch, cw, cmh));
		aHorzClip.DrawImage(theComponentImage, theDest.mX + theDest.mWidth-cw, theDest.mY + ch + aRow*cmh, Rect(cx + cw + cmw, cy + ch, cw, cmh));
	}

	// Draw middle
	Graphics aMidClip(*this);
	aMidClip.ClipRect(theDest.mX + cw, theDest.mY + ch, theDest.mWidth-cw*2, theDest.mHeight-ch*2);
	for (aCol = 0; aCol < (theDest.mWidth-cw*2+cmw-1)/cmw; aCol++)
		for (aRow = 0; aRow < (theDest.mHeight-ch*2+cmh-1)/cmh; aRow++)
			aMidClip.DrawImage(theComponentImage, theDest.mX + cw + aCol*cmw, theDest.mY + ch + aRow*cmh, Rect(cx + cw, cy + ch, cmw, cmh));
}

int Graphics::WriteString(const SexyString& theString, int theX, int theY, int theWidth, int theJustification, bool drawString, int theOffset, int theLength, int theOldColor)
{
	// _Font* aFont = mFont; // unused
	if (theOldColor==-1)
		theOldColor = mColor.ToInt();
	
	if (drawString)
	{
		switch (theJustification)
		{	
		case 0:
			theX += (theWidth - WriteString(theString, theX, theY, theWidth, -1, false, theOffset, theLength, theOldColor))/2;
			break;
		case 1:
			theX += theWidth - WriteString(theString, theX, theY, theWidth, -1, false, theOffset, theLength, theOldColor);
			break;
		}
	}

	if(theLength<0 || theOffset+theLength>(int)theString.length())
		theLength = (int)theString.length();
	else
		theLength = theOffset + theLength;


	SexyString aString;
	int aXOffset = 0;

	for (int i = theOffset; i < theLength; i++)
	{
		if ((theString[i] == '^') && mWriteColoredString)
		{
			if (i+1<theLength && theString[i+1] == '^') // literal '^'
			{
				aString += ('^');
				i++;
			}
			else if (i>theLength-8) // badly formatted color specification
				break;
			else // change color instruction
			{
				DWORD aColor = 0;
				if (theString[i+1]==('o'))
				{
					if (sexystrncmp(theString.c_str()+i+1, ("oldclr"), 6) == 0)
						aColor = theOldColor;
				}
				else
				{
					for (int aDigitNum = 0; aDigitNum < 6; aDigitNum++)
					{
						SexyChar aChar = theString[i+aDigitNum+1];
						int aVal = 0;

						if ((aChar >= ('0')) && (aChar <= ('9')))
							aVal = aChar - ('0');
						else if ((aChar >= ('A')) && (aChar <= ('F')))
							aVal = (aChar - ('A')) + 10;
						else if ((aChar >= ('a')) && (aChar <= ('f')))
							aVal = (aChar - ('a')) + 10;

						aColor += (aVal << ((5 - aDigitNum) * 4));
					}				
				}

				if (drawString)
				{
					DrawString(aString, theX + aXOffset, theY);
					mColor = Color((aColor >> 16) & 0xFF, (aColor >> 8) & 0xFF, (aColor) & 0xFF, mColor.mAlpha);					
				}

				i += 7;

				aXOffset += mFont->StringWidth(aString);

				aString = ("");
			}
		}
		else
			aString += theString[i];
	}

	if (drawString)
	{
		DrawString(aString, theX + aXOffset, theY);
	}

	aXOffset += mFont->StringWidth(aString);

	return aXOffset;
}

static int WriteWordWrappedHelper(Graphics *g, const SexyString& theString, int theX, int theY, int theWidth, int theJustification, bool drawString, int theOffset, int theLength, int theOldColor, int theMaxChars)
{
	if (theOffset+theLength>theMaxChars)
	{
		theLength = theMaxChars-theOffset;
		if (theLength<=0)
			return -1;
	}

	return g->WriteString(theString,theX,theY,theWidth,theJustification,drawString,theOffset,theLength,theOldColor);
}

int	Graphics::WriteWordWrapped(const Rect& theRect, const SexyString& theLine, int theLineSpacing, int theJustification, int *theMaxWidth, int theMaxChars, int *theLastWidth)
{
	/*
	正式版中，删去了 *theLastWidth、theMaxChars 和 *theMaxWidth 参数，此函数形式可以简化为：
	Graphics::自动换行的文字绘制(const Rect& 绘制区域矩形, const SexyString& 文字内容, int 行距 = -1, int 对齐方式 = -1)
	当行距 = -1 时，默认使用 Graphics 字体的行距；对齐方式：左对齐 = -1；居中对齐 = 0；右对齐 = 1。
	*/
	Color anOrigColor = mColor;
	int anOrigColorInt = anOrigColor.ToInt();  //颜色数组转化为 ARGB 颜色
	if ((anOrigColorInt&0xFF000000)==0xFF000000)
		anOrigColorInt &= ~0xFF000000;
	
	if (theMaxChars<0)
		theMaxChars = (int)theLine.length();

	_Font* aFont = mFont;						

	//纵向偏移值 = 字体主要部分高度 - 字体内边距
	int aYOffset = aFont->mAscent - aFont->mAscentPadding;

	if (theLineSpacing == -1)
		theLineSpacing = aFont->GetLineSpacing();

	SexyString aCurString;
	unsigned int aCurPos = 0;
	int aLineStartPos = 0;
	int aCurWidth = 0;
	SexyChar aCurChar = 0;
	SexyChar aPrevChar = 0;
	int aSpacePos = -1;
	int aMaxWidth = 0;
	int anIndentX = 0;

	if (theLastWidth != NULL)
	{
		anIndentX = *theLastWidth;
		aCurWidth = anIndentX;
	}

	while (aCurPos < theLine.length())
	{	
		aCurChar = theLine[aCurPos];
		if(aCurChar==('^') && mWriteColoredString) // Handle special color modifier
		{
			if(aCurPos+1<theLine.length())
			{
				if(theLine[aCurPos+1]==('^'))
					aCurPos++; // literal '^' -> just skip the extra '^'
				else 
				{
					aCurPos+=8;
					continue; // skip the color specifier when calculating the width
				}
			}
		}
		else if(aCurChar==(' '))
			aSpacePos = aCurPos;
		else if(aCurChar==('\n'))
		{
			aCurWidth = theRect.mWidth+1; // force word wrap
			aSpacePos = aCurPos;
			aCurPos++; // skip enter on next go round
		}

		aCurWidth += aFont->CharWidthKern(aCurChar, aPrevChar);
		aPrevChar = aCurChar;

		if(aCurWidth > theRect.mWidth) // need to wrap
		{
			int aWrittenWidth;
			if(aSpacePos!=-1)
			{
				//aWrittenWidth = WriteWordWrappedHelper(this, theLine, theRect.mX, theRect.mY + aYOffset, theRect.mWidth, 
				//	theJustification, true, aLineStartPos, aSpacePos-aLineStartPos, anOrigColorInt, theMaxChars);

				int aPhysPos = theRect.mY + aYOffset + mTransY;
				if ((aPhysPos >= mClipRect.mY) && (aPhysPos < mClipRect.mY + mClipRect.mHeight + theLineSpacing))
				{
					WriteWordWrappedHelper(this, theLine, theRect.mX + anIndentX, theRect.mY + aYOffset, theRect.mWidth, 
						theJustification, true, aLineStartPos, aSpacePos-aLineStartPos, anOrigColorInt, theMaxChars);

					/*WriteString(theLine, theRect.mX + anIndentX, theRect.mY + aYOffset, theRect.mWidth, 
					theJustification, true, aLineStartPos, aSpacePos-aLineStartPos);*/
				}

				aWrittenWidth = aCurWidth + anIndentX;

				if (aWrittenWidth<0)
					break;

				aCurPos = aSpacePos+1;
				if (aCurChar != ('\n'))
				{
					while (aCurPos<theLine.length() && theLine[aCurPos]==(' '))
						aCurPos++;
				}
				aLineStartPos = aCurPos;
			}
			else
			{
				if((int)aCurPos<aLineStartPos+1)
					aCurPos++; // ensure at least one character gets written

				aWrittenWidth = WriteWordWrappedHelper(this, theLine, theRect.mX + anIndentX, theRect.mY + aYOffset, theRect.mWidth, 
					theJustification, true, aLineStartPos, aCurPos-aLineStartPos, anOrigColorInt, theMaxChars);

				if (aWrittenWidth<0)
					break;

				if (theMaxWidth!=NULL && aWrittenWidth>*theMaxWidth)
					*theMaxWidth = aWrittenWidth;
				if (theLastWidth!=NULL)
					*theLastWidth = aWrittenWidth;
			}

			if (aWrittenWidth > aMaxWidth)
				aMaxWidth = aWrittenWidth;

			aLineStartPos = aCurPos;
			aSpacePos = -1;
			aCurWidth = 0;
			aPrevChar = 0;
			anIndentX = 0;
			aYOffset += theLineSpacing;
		}
		else
			aCurPos++;
	}

	if(aLineStartPos<(int)theLine.length()) // write the last piece
	{
		int aWrittenWidth = WriteWordWrappedHelper(this, theLine, theRect.mX + anIndentX, theRect.mY + aYOffset, theRect.mWidth, 
			theJustification, true, aLineStartPos, theLine.length()-aLineStartPos, anOrigColorInt, theMaxChars);

		if (aWrittenWidth>=0)
		{
			if (aWrittenWidth > aMaxWidth)
				aMaxWidth = aWrittenWidth;

			if (theMaxWidth!=NULL && aWrittenWidth>*theMaxWidth)
				*theMaxWidth = aWrittenWidth;
			if (theLastWidth!=NULL)
				*theLastWidth = aWrittenWidth;

			aYOffset += theLineSpacing;
		}
	}
	else if (aCurChar == '\n')
	{
		aYOffset += theLineSpacing;
		if (theLastWidth != NULL)
			*theLastWidth = 0;
	}

	mColor = anOrigColor;

	if (theMaxWidth!=NULL)
		*theMaxWidth = aMaxWidth;

	//返回时，aYOffset 增量为 (行数 + 1) * 行距。以 aYOffset 减去末行多算的一次行距，再加上字体下沉部分的高度，得到文本底部的纵向偏移值，即文本区域高度。
	return aYOffset + aFont->GetDescent() - theLineSpacing;
}

int	Graphics::DrawStringColor(const SexyString& theLine, int theX, int theY, int theOldColor)
{
	return WriteString(theLine, theX, theY, -1, -1,true,0,-1,theOldColor);
}

int	Graphics::DrawStringWordWrapped(const SexyString& theLine, int theX, int theY, int theWrapWidth, int theLineSpacing, int theJustification, int *theMaxWidth)
{
	/*这个函数在正式版中被删得只剩前三个参数了……*/
	int aYOffset = mFont->mAscent - mFont->mAscentPadding;

	Rect aRect(theX,theY-aYOffset,theWrapWidth,0);
	return WriteWordWrapped(aRect, theLine, theLineSpacing, theJustification, theMaxWidth);
}

int	Graphics::GetWordWrappedHeight(int theWidth, const SexyString& theLine, int theLineSpacing, int *theMaxWidth)
{
	Graphics aTestG;
	aTestG.mFont = mFont;
	int aHeight = aTestG.WriteWordWrapped(Rect(0, 0, theWidth, 0), theLine, theLineSpacing, -1, theMaxWidth);	

	return aHeight;	
}
