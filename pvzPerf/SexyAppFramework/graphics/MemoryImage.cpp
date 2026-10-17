#include "MemoryImage.h"

#include "RenderInterface.h"
#include "DDInterface.h"
#include "DDImage.h"
#include "SexyAppBase.h"
#include "Graphics.h"
#include "NativeDisplay.h"
#include "misc/Debug.h"
#include "Quantize.h"
#include "misc/PerfTimer.h"
#include "SWTri.h"
#include "imagelib/ImageLib.h"
#include <utility>

#include <math.h>
#include <memory>
#include "misc/FastMath.h"  // P5-⑥ FastSin/FastCos（2026-10-07 下放共享层）

using namespace Sexy;

#ifdef OPTIMIZE_SOFTWARE_DRAWING
static bool gOptimizeSoftwareDrawing = false;
#endif


// Disable macro redefinition warning
#pragma warning(disable:4005)

MemoryImage::MemoryImage()
{	
	mApp = gSexyAppBase;
	
	Init();
}

MemoryImage::MemoryImage(SexyAppBase* theApp) 
{
	mApp = theApp;
	Init();
}

template <typename T>
static std::unique_ptr<T[]> CloneMemoryImageBuffer(const T* theSource, size_t theCount)
{
	if (theSource == nullptr)
		return {};
	std::unique_ptr<T[]> aCopy(new T[theCount]);
	memcpy(aCopy.get(), theSource, theCount * sizeof(T));
	return aCopy;
}

MemoryImage::MemoryImage(const MemoryImage& theMemoryImage) :
	Image(theMemoryImage),
	mBitsChangedCount(theMemoryImage.mBitsChangedCount),
	mD3DData(NULL),
	mGpuSamplingFlags(theMemoryImage.mGpuSamplingFlags),
	mForcedMode(theMemoryImage.mForcedMode),
	mHasTrans(theMemoryImage.mHasTrans),
	mHasAlpha(theMemoryImage.mHasAlpha),
	mIsVolatile(theMemoryImage.mIsVolatile),
	mPurgeBits(theMemoryImage.mPurgeBits),
	mWantPal(theMemoryImage.mWantPal),
	mBitsChanged(theMemoryImage.mBitsChanged),
	mApp(theMemoryImage.mApp)
{
	mImageType = ImageType::MemoryImage;
	const int aPixelCount = mWidth * mHeight;
	if (theMemoryImage.mPendingDecoded) {
		if (CurrentNativeThreadIdentity()!=mApp->mPrimaryThreadId) throw GpuImageCpuAccess{};
		mApp->mDDInterface->mRenderInterface->CreateImageTexture(const_cast<MemoryImage*>(&theMemoryImage));
	}
	if (theMemoryImage.mD3DData != nullptr && theMemoryImage.mBits == nullptr &&
		theMemoryImage.mColorTable == nullptr)
	{
		if (CurrentNativeThreadIdentity()!=mApp->mPrimaryThreadId) throw GpuImageCpuAccess{};
		mBits=nullptr;mColorTable=nullptr;mColorIndices=nullptr;
		mNativeAlphaData=nullptr;mRLAlphaData=nullptr;mRLAdditiveData=nullptr;
		mWantPal=false;mPurgeBits=true;mBitsChanged=false;mForcedMode=true;
		auto& render=*mApp->mDDInterface->mRenderInterface;
		const auto& sourceData=*static_cast<const TextureData*>(theMemoryImage.mD3DData);
		if (!sourceData.mRenderTarget) {
			mApp->AddMemoryImage(this);
			try { render.CloneUploadedImage(this,theMemoryImage); }
			catch (...) { mApp->RemoveMemoryImage(this);throw; }
			return;
		}
		std::unique_ptr<DDImage> clone(render.CreateRenderImage(mWidth,mHeight));
		{
			GpuImageDrawScope drawing(render,clone.get());
			Graphics graphics(clone.get());
			graphics.mDrawMode = Graphics::DRAWMODE_OPAQUE;
			graphics.DrawImage(const_cast<MemoryImage*>(&theMemoryImage),0,0);
		}
		mApp->AddMemoryImage(this);
		try { render.mImageSet.insert(this); }
		catch (...) { mApp->RemoveMemoryImage(this);throw; }
		render.mImageSet.erase(clone.get());
		mD3DData=clone->mD3DData;clone->mD3DData=nullptr;
		static_cast<TextureData*>(mD3DData)->mBitsChangedCount=mBitsChangedCount;
		return;
	}
	const unsigned int* aSourceBits = theMemoryImage.mBits;
	std::unique_ptr<unsigned int[]> aTemporarySourceBits;
	if (aSourceBits == nullptr && theMemoryImage.mColorTable == nullptr)
	{
		auto* aSource = const_cast<MemoryImage*>(&theMemoryImage);
		aSource->GetBits();
		// GetBits materialized pixels only for this copy. Detach them so both
		// success and allocation failure restore the source's original state.
		aTemporarySourceBits.reset(aSource->mBits);
		aSource->mBits = nullptr;
		aSourceBits = aTemporarySourceBits.get();
	}

	auto aBits = CloneMemoryImageBuffer(aSourceBits, aPixelCount + 1);
	aTemporarySourceBits.reset();
	auto aColorTable = CloneMemoryImageBuffer(theMemoryImage.mColorTable, 256);
	auto aColorIndices = CloneMemoryImageBuffer(theMemoryImage.mColorIndices, aPixelCount);
	auto aNativeAlphaData = CloneMemoryImageBuffer(theMemoryImage.mNativeAlphaData,
		theMemoryImage.mColorTable != nullptr ? 256 : aPixelCount);
	auto aRLAlphaData = CloneMemoryImageBuffer(theMemoryImage.mRLAlphaData, aPixelCount);
	auto aRLAdditiveData = CloneMemoryImageBuffer(theMemoryImage.mRLAdditiveData, aPixelCount);

	mBits = aBits.get();
	mColorTable = aColorTable.get();
	mColorIndices = aColorIndices.get();
	mNativeAlphaData = aNativeAlphaData.get();
	mRLAlphaData = aRLAlphaData.get();
	mRLAdditiveData = aRLAdditiveData.get();
	// Registration can allocate its own set node. Keep all buffers locally
	// owned until it succeeds; a failed constructor has no derived destructor.
	mApp->AddMemoryImage(this);
	aBits.release();
	aColorTable.release();
	aColorIndices.release();
	aNativeAlphaData.release();
	aRLAlphaData.release();
	aRLAdditiveData.release();
}

MemoryImage::~MemoryImage()
{	
	mImageType = ImageType::MemoryImage;
	mCustomDestroy = nullptr;
	mMaintenanceHook = nullptr;
	mApp->RemoveMemoryImage(this);
	
	delete [] mBits;
	delete [] mNativeAlphaData;	
	delete [] mRLAlphaData;
	delete [] mRLAdditiveData;
	delete [] mColorIndices;
	delete [] mColorTable;
}

void MemoryImage::Init()
{
	mImageType = ImageType::MemoryImage;
	mBits = NULL;
	mColorTable = NULL;
	mColorIndices = NULL;

	mNativeAlphaData = NULL;
	mRLAlphaData = NULL;
	mRLAdditiveData = NULL;
	mHasTrans = false;
	mHasAlpha = false;	
	mBitsChanged = false;
	mForcedMode = false;
	mIsVolatile = false;

	mD3DData = NULL;
	mBitsChangedCount = 0;

	mPurgeBits = false;
	mWantPal = false;

	mApp->AddMemoryImage(this);
}

void MemoryImage::BitsChanged()
{
	mBitsChanged = true;
	mBitsChangedCount++;

	delete [] mNativeAlphaData;
	mNativeAlphaData = NULL;

	delete [] mRLAlphaData;
	mRLAlphaData = NULL;

	delete [] mRLAdditiveData;
	mRLAdditiveData = NULL;

	// Verify secret value at end to protect against overwrite
	if (mBits != NULL)
	{
		DBG_ASSERTE(mBits[mWidth*mHeight] == MEMORYCHECK_ID);
	}
}

void MemoryImage::NormalDrawLine(double theStartX, double theStartY, double theEndX, double theEndY, const Color& theColor)
{
	double aMinX = std::min(theStartX, theEndX);
	double aMinY = std::min(theStartY, theEndY);
	double aMaxX = std::max(theStartX, theEndX);
	double aMaxY = std::max(theStartY, theEndY);

	unsigned int aRMask = 0xFF0000;
	unsigned int aGMask = 0x00FF00;
	unsigned int aBMask = 0x0000FF;
	unsigned int aRRoundAdd = aRMask >> 1;
	unsigned int aGRoundAdd = aGMask >> 1;
	unsigned int aBRoundAdd = aBMask >> 1;
	
	unsigned int *aSurface = GetBits();

	if (true)//(mLockedSurfaceDesc.ddpfPixelFormat.dwRGBBitCount == 32)
	{
		if (theColor.mAlpha == 255)
		{
			unsigned int aColor = 0xFF000000 |
				((((theColor.mRed * aRMask) + aRRoundAdd) >> 8) & aRMask) |
				((((theColor.mGreen * aGMask) + aGRoundAdd) >> 8) & aGMask) |
				((((theColor.mBlue * aBMask) + aBRoundAdd) >> 8) & aBMask);

			double dv = theEndY - theStartY;
			double dh = theEndX - theStartX;
			// int minG, maxG; // unused
			int G, DeltaG1, DeltaG2;
			double swap;
			int inc = 1;
			int aCurX;
			int aCurY;
			int aRowWidth = mWidth;
			int aRowAdd = aRowWidth;;

			if (abs(dv) < abs(dh))
			{
				// Mostly horizontal
				if (dh < 0)
				{
					dh = -dh;
					dv = -dv;
					swap = theEndY;
					theEndY = theStartY;
					theStartY = swap;
					swap = theEndX;
					theEndX = theStartX;
					theStartX = swap;
				}
				if (dv < 0)
				{
					dv = -dv;
					inc = -1;
					aRowAdd = -aRowAdd;
				}

				unsigned int* aDestPixels = ((unsigned int*) aSurface) + ((int) theStartY * aRowWidth) + (int) theStartX;
				*aDestPixels = aColor;
				aDestPixels++;

				aCurY = theStartY;
				aCurX = theStartX + 1;

				G = 2 * dv - dh;
				DeltaG1 = 2 * (dv - dh);
				DeltaG2 = 2 * dv;

				G += DeltaG2 * (theStartY - (int) theStartY);

				while (aCurX <= theEndX)
				{
					if (G > 0)
					{
						G += DeltaG1;
						aCurY += inc;
						aDestPixels += aRowAdd;

						if (aCurX<aMinX || aCurY<aMinY || aCurX>aMaxX || aCurY>aMaxY)
							break;
					}
					else
						G += DeltaG2;
					
					*aDestPixels = aColor;

					aCurX++;
					aDestPixels++;
				}
			}
			else
			{
				// Mostly vertical
				if ( dv < 0 )
				{
					dh = -dh;
					dv = -dv;
					swap = theEndY;
					theEndY = theStartY;
					theStartY = swap;
					swap = theEndX;
					theEndX = theStartX;
					theStartX = swap;
				}

				if (dh < 0)
				{
					dh = -dh;
					inc = -1;
				}

				unsigned int* aDestPixels = ((unsigned int*) aSurface) + ((int) theStartY * aRowWidth) + (int) theStartX;
				*aDestPixels = aColor;
				aDestPixels += aRowAdd;

				aCurX = theStartX;
				aCurY = theStartY + 1;

				G = 2 * dh - dv;
				// minG = maxG = G; // unused
				DeltaG1 = 2 * ( dh - dv );
				DeltaG2 = 2 * dh;

				G += DeltaG2 * (theStartX - (int) theStartX);

				while (aCurY <= theEndY)
				{
					if ( G > 0 )
					{
						G += DeltaG1;
						aCurX += inc;
						aDestPixels += inc;

						if (aCurX<aMinX || aCurY<aMinY || aCurX>aMaxX || aCurY>aMaxY)
							break;
					}
					else
						G += DeltaG2;
					
					*aDestPixels = aColor;

					aCurY++;
					aDestPixels += aRowAdd;
				}
			}
		}
		else
		{
			unsigned int src = 0xFF000000 |
				((((((theColor.mRed * theColor.mAlpha + 0x80) >> 8) * aRMask) + aRRoundAdd) >> 8) & aRMask) |
				((((((theColor.mGreen * theColor.mAlpha + 0x80) >> 8) * aGMask) + aGRoundAdd) >> 8) & aGMask) |
				((((((theColor.mBlue * theColor.mAlpha + 0x80) >> 8) * aBMask) + aBRoundAdd) >> 8) & aBMask);
			int oma = 256 - theColor.mAlpha;

			double dv = theEndY - theStartY;
			double dh = theEndX - theStartX;
			// int minG, maxG; // unused
			int G, DeltaG1, DeltaG2;
			double swap;
			int inc = 1;
			int aCurX;
			int aCurY;
			int aRowWidth = mWidth;
			int aRowAdd = aRowWidth;

			if (abs(dv) < abs(dh))
			{
				// Mostly horizontal
				if (dh < 0)
				{
					dh = -dh;
					dv = -dv;
					swap = theEndY;
					theEndY = theStartY;
					theStartY = swap;
					swap = theEndX;
					theEndX = theStartX;
					theStartX = swap;
				}
				if (dv < 0)
				{
					dv = -dv;
					inc = -1;
					aRowAdd = -aRowAdd;
				}

				unsigned int* aDestPixels = ((unsigned int*) aSurface) + ((int) theStartY * aRowWidth) + (int) theStartX;
				unsigned int dest = *aDestPixels;
				*(aDestPixels++) = src + 
					(((((dest & aRMask) * oma) + aRRoundAdd) >> 8) & aRMask) +
					(((((dest & aGMask) * oma) + aGRoundAdd) >> 8) & aGMask) +
					(((((dest & aBMask) * oma) + aBRoundAdd) >> 8) & aBMask);				

				aCurY = theStartY;
				aCurX = theStartX + 1;

				G = 2 * dv - dh;
				DeltaG1 = 2 * (dv - dh);
				DeltaG2 = 2 * dv;

				G += DeltaG2 * (theStartX - (int) theStartX);

				while (aCurX <= theEndX)
				{
					if (G > 0)
					{
						G += DeltaG1;
						aCurY += inc;
						aDestPixels += aRowAdd;

						if (aCurX<aMinX || aCurY<aMinY || aCurX>aMaxX || aCurY>aMaxY)
							break;
					}
					else
						G += DeltaG2;
					
					dest = *aDestPixels;
					*(aDestPixels++) = src + 
						(((((dest & aRMask) * oma) + aRRoundAdd) >> 8) & aRMask) +
						(((((dest & aGMask) * oma) + aGRoundAdd) >> 8) & aGMask) +
						(((((dest & aBMask) * oma) + aBRoundAdd) >> 8) & aBMask);					

					aCurX++;					
				}
			}
			else
			{
				// Mostly vertical
				if ( dv < 0 )
				{
					dh = -dh;
					dv = -dv;
					swap = theEndY;
					theEndY = theStartY;
					theStartY = swap;
					swap = theEndX;
					theEndX = theStartX;
					theStartX = swap;
				}

				if (dh < 0)
				{
					dh = -dh;
					inc = -1;
				}

				unsigned int* aDestPixels = ((unsigned int*) aSurface) + ((int) theStartY * aRowWidth) + (int) theStartX;
				unsigned int dest = *aDestPixels;
				*aDestPixels = src + 
					(((((dest & aRMask) * oma) + aRRoundAdd) >> 8) & aRMask) +
					(((((dest & aGMask) * oma) + aGRoundAdd) >> 8) & aGMask) +
					(((((dest & aBMask) * oma) + aBRoundAdd) >> 8) & aBMask);
				aDestPixels += aRowAdd;

				aCurX = theStartX;
				aCurY = theStartY + 1;

				G = 2 * dh - dv;
				// minG = maxG = G; // unused
				DeltaG1 = 2 * ( dh - dv );
				DeltaG2 = 2 * dh;

				G += DeltaG2 * (theStartX - (int) theStartX);

				while (aCurY <= theEndY)
				{
					if ( G > 0 )
					{
						G += DeltaG1;
						aCurX += inc;
						aDestPixels += inc;

						if (aCurX<aMinX || aCurY<aMinY || aCurX>aMaxX || aCurY>aMaxY)
							break;
					}
					else
						G += DeltaG2;
					
					dest = *aDestPixels;
					*aDestPixels = src + 
						(((((dest & aRMask) * oma) + aRRoundAdd) >> 8) & aRMask) +
						(((((dest & aGMask) * oma) + aGRoundAdd) >> 8) & aGMask) +
						(((((dest & aBMask) * oma) + aBRoundAdd) >> 8) & aBMask);

					aCurY++;
					aDestPixels += aRowAdd;
				}
			}
		}
	}
}

void MemoryImage::AdditiveDrawLine(double theStartX, double theStartY, double theEndX, double theEndY, const Color& theColor)
{
	double aMinX = std::min(theStartX, theEndX);
	double aMinY = std::min(theStartY, theEndY);
	double aMaxX = std::max(theStartX, theEndX);
	double aMaxY = std::max(theStartY, theEndY);

	unsigned int aRMask = 0xFF0000;
	unsigned int aGMask = 0x00FF00;
	unsigned int aBMask = 0x0000FF;
	int aRedShift = 16;
	int aGreenShift = 8;
	int aBlueShift = 0;

	// unused
	//unsigned int aRRoundAdd = aRMask >> 1;
	//unsigned int aGRoundAdd = aGMask >> 1;
	//unsigned int aBRoundAdd = aBMask >> 1;

	uchar* aMaxTable = mApp->mAdd8BitMaxTable;
	unsigned int *aSurface = GetBits();
	
	if (true)//(mLockedSurfaceDesc.ddpfPixelFormat.dwRGBBitCount == 32)
	{
		unsigned int rc = ((theColor.mRed * theColor.mAlpha) / 255);
		unsigned int gc = ((theColor.mGreen * theColor.mAlpha) / 255);
		unsigned int bc = ((theColor.mBlue * theColor.mAlpha) / 255);

		double dv = theEndY - theStartY;
		double dh = theEndX - theStartX;
		// int minG, maxG; // unused
		int G, DeltaG1, DeltaG2;
		double swap;
		int inc = 1;
		int aCurX;
		int aCurY;
		int aRowWidth = mWidth;
		int aRowAdd = aRowWidth;

		if (abs(dv) < abs(dh))
		{
			// Mostly horizontal
			if (dh < 0)
			{
				dh = -dh;
				dv = -dv;
				swap = theEndY;
				theEndY = theStartY;
				theStartY = swap;
				swap = theEndX;
				theEndX = theStartX;
				theStartX = swap;
			}

			if (dv < 0)
			{
				dv = -dv;
				inc = -1;
				aRowAdd = -aRowAdd;
			}

			unsigned int* aDestPixels = ((unsigned int*) aSurface) + ((int) theStartY * aRowWidth) + (int) theStartX;
			unsigned int dest = *aDestPixels;

			int r = aMaxTable[((dest & aRMask) >> aRedShift) + rc];
			int g = aMaxTable[((dest & aGMask) >> aGreenShift) + gc];
			int b = aMaxTable[((dest & aBMask) >> aBlueShift) + bc];

			*(aDestPixels++) = 
				0xFF000000 | 
				(r << aRedShift) |
				(g << aGreenShift) |
				(b << aBlueShift);

			aCurY = theStartY;
			aCurX = theStartX + 1;

			G = 2 * dv - dh;
			DeltaG1 = 2 * (dv - dh);
			DeltaG2 = 2 * dv;			

			while (aCurX <= theEndX)
			{
				if (G > 0)
				{
					G += DeltaG1;
					aCurY += inc;
					aDestPixels += aRowAdd;

					if (aCurX<aMinX || aCurY<aMinY || aCurX>aMaxX || aCurY>aMaxY)
						break;
				}
				else
					G += DeltaG2;
				
				dest = *aDestPixels;

				r = aMaxTable[((dest & aRMask) >> aRedShift) + rc];
				g = aMaxTable[((dest & aGMask) >> aGreenShift) + gc];
				b = aMaxTable[((dest & aBMask) >> aBlueShift) + bc];

				*(aDestPixels++) = 
					0xFF000000 | 
					(r << aRedShift) |
					(g << aGreenShift) |
					(b << aBlueShift);

				aCurX++;				
			}
		}
		else
		{
			// Mostly vertical
			if ( dv < 0 )
			{
				dh = -dh;
				dv = -dv;
				swap = theEndY;
				theEndY = theStartY;
				theStartY = swap;
				swap = theEndX;
				theEndX = theStartX;
				theStartX = swap;
			}

			if (dh < 0)
			{
				dh = -dh;
				inc = -1;
			}

			unsigned int* aDestPixels = ((unsigned int*) aSurface) + ((int) theStartY * mWidth) + (int) theStartX;
			
			unsigned int dest = *aDestPixels;

			int r = aMaxTable[((dest & aRMask) >> aRedShift) + rc];
			int g = aMaxTable[((dest & aGMask) >> aGreenShift) + gc];
			int b = aMaxTable[((dest & aBMask) >> aBlueShift) + bc];

			*aDestPixels = 
				0xFF000000 | 
				(r << aRedShift) |
				(g << aGreenShift) |
				(b << aBlueShift);

			aDestPixels += aRowAdd;

			aCurX = theStartX;
			aCurY = theStartY + 1;

			G = 2 * dh - dv;
			// minG = maxG = G; // unused
			DeltaG1 = 2 * ( dh - dv );
			DeltaG2 = 2 * dh;
			while (aCurY <= theEndY)
			{
				if ( G > 0 )
				{
					G += DeltaG1;
					aCurX += inc;
					aDestPixels += inc;

					if (aCurX<aMinX || aCurY<aMinY || aCurX>aMaxX || aCurY>aMaxY)
						break;
				}
				else
					G += DeltaG2;
				
				dest = *aDestPixels;

				r = aMaxTable[((dest & aRMask) >> aRedShift) + rc];
				g = aMaxTable[((dest & aGMask) >> aGreenShift) + gc];
				b = aMaxTable[((dest & aBMask) >> aBlueShift) + bc];

				*aDestPixels = 
					0xFF000000 | 
					(r << aRedShift) |
					(g << aGreenShift) |
					(b << aBlueShift);

				aCurY++;
				aDestPixels += aRowAdd;
			}
		}
	}
}


void MemoryImage::DrawLine(double theStartX, double theStartY, double theEndX, double theEndY, const Color& theColor, int theDrawMode)
{	
	if (theStartY == theEndY)
	{
		int aStartX = std::min(theStartX, theEndX);
		int aEndX = std::max(theStartX, theEndX);

		FillRect(Rect(aStartX, theStartY, aEndX-aStartX+1, theEndY-theStartY+1), theColor, theDrawMode);
		return;
	}
	else if (theStartX == theEndX)
	{
		int aStartY = std::min(theStartY, theEndY);
		int aEndY = std::max(theStartY, theEndY);

		FillRect(Rect(theStartX, aStartY, theEndX-theStartX+1, aEndY-aStartY+1), theColor, theDrawMode);
		return;
	}

	switch (theDrawMode)
	{
	case Graphics::DRAWMODE_NORMAL:
		NormalDrawLine(theStartX, theStartY, theEndX, theEndY, theColor);
		break;
	case Graphics::DRAWMODE_ADDITIVE:
		AdditiveDrawLine(theStartX, theStartY, theEndX, theEndY, theColor);
		break;
	}

	BitsChanged();
}

void MemoryImage::NormalDrawLineAA(double theStartX, double theStartY, double theEndX, double theEndY, const Color& theColor)
{
	unsigned int* aBits = GetBits();
	unsigned int color = theColor.ToInt();

	int aX0 = (int)theStartX, aX1 = (int)theEndX;
	int aY0 = (int)theStartY, aY1 = (int)theEndY;
	int aXinc = 1;
	if (aY0 > aY1)
	{
		int aTempX = aX0, aTempY = aY0;
		aX0 = aX1; aY0 = aY1;
		aX1 = aTempX; aY1 = aTempY;
		double aTempXd = theStartX, aTempYd = theStartY;
		theStartX = theEndX; theStartY = theEndY;
		theEndX = aTempXd; theEndY = aTempYd;
	}

	int dx = aX1 - aX0;
	int dy = aY1 - aY0;
	double dxd = theEndX - theStartX;
	double dyd = theEndY - theStartY;
	if (dx < 0)
	{
		dx = -dx;
		aXinc = -1;
		dxd = -dxd;
	}

	if (theColor.mAlpha != 255)
	{
		#define PIXEL_TYPE				unsigned int
		#define CALC_WEIGHT_A(w)		(((w) * (theColor.mAlpha+1)) >> 8)
		#define BLEND_PIXEL(p) \
		{\
			int aDestAlpha = dest >> 24;\
			int aNewDestAlpha = aDestAlpha + ((255 - aDestAlpha) * a) / 255;\
			a = (aNewDestAlpha == 0) ? 0 : 255 * a / aNewDestAlpha;\
			oma = 256 - a;\
			*(p) = (aNewDestAlpha << 24) |\
					((((color & 0xFF0000) * a + (dest & 0xFF0000) * oma) >> 8) & 0xFF0000) |\
					((((color & 0x00FF00) * a + (dest & 0x00FF00) * oma) >> 8) & 0x00FF00) |\
					((((color & 0x0000FF) * a + (dest & 0x0000FF) * oma) >> 8) & 0x0000FF);\
		}
		const int STRIDE = mWidth;

		#include "inc_routines/GENERIC_DrawLineAA.inc"

		#undef PIXEL_TYPE
		#undef CALC_WEIGHT_A
		#undef BLEND_PIXEL
	}
	else
	{
		#define PIXEL_TYPE				unsigned int
		#define CALC_WEIGHT_A(w)		(w)
		#define BLEND_PIXEL(p) \
		{\
			int aDestAlpha = dest >> 24;\
			int aNewDestAlpha = aDestAlpha + ((255 - aDestAlpha) * a) / 255;\
			a = (aNewDestAlpha == 0) ? 0 : 255 * a / aNewDestAlpha;\
			oma = 256 - a;\
			*(p) = (aNewDestAlpha << 24) |\
					((((color & 0xFF0000) * a + (dest & 0xFF0000) * oma) >> 8) & 0xFF0000) |\
					((((color & 0x00FF00) * a + (dest & 0x00FF00) * oma) >> 8) & 0x00FF00) |\
					((((color & 0x0000FF) * a + (dest & 0x0000FF) * oma) >> 8) & 0x0000FF);\
		}
		const int STRIDE = mWidth;

		#include "inc_routines/GENERIC_DrawLineAA.inc"

		#undef PIXEL_TYPE
		#undef CALC_WEIGHT_A
		#undef BLEND_PIXEL
	}


	BitsChanged();
}

/*
void MemoryImage::AdditiveDrawLineAA(double theStartX, double theStartY, double theEndX, double theEndY, const Color& theColor)
{
}
*/

void MemoryImage::DrawLineAA(double theStartX, double theStartY, double theEndX, double theEndY, const Color& theColor, int theDrawMode)
{
	if (theStartY == theEndY)
	{
		int aStartX = std::min(theStartX, theEndX);
		int aEndX = std::max(theStartX, theEndX);

		FillRect(Rect(aStartX, theStartY, aEndX-aStartX+1, theEndY-theStartY+1), theColor, theDrawMode);
		return;
	}
	else if (theStartX == theEndX)
	{
		int aStartY = std::min(theStartY, theEndY);
		int aEndY = std::max(theStartY, theEndY);

		FillRect(Rect(theStartX, aStartY, theEndX-theStartX+1, aEndY-aStartY+1), theColor, theDrawMode);
		return;
	}

	NormalDrawLineAA(theStartX, theStartY, theEndX, theEndY, theColor);

	BitsChanged();
}


void MemoryImage::CommitBits()
{
	//if (gDebug)
	//	mApp->CopyToClipboard("+MemoryImage::CommitBits");
	
	if ((mBitsChanged) && (!mForcedMode))
	{			
		// Analyze 
		if (mBits != NULL)
		{
			mHasTrans = false;
			mHasAlpha = false;
			
			int aSize = mWidth*mHeight;
			unsigned int* ptr = mBits;
			
			for (int i = 0; i < aSize; i++)
			{
				uchar anAlpha = (uchar) (*ptr++ >> 24);

				if (anAlpha == 0)
					mHasTrans = true;
				else if (anAlpha != 255)
					mHasAlpha = true;
			}
		}
		else if (mColorTable != NULL)
		{
			mHasTrans = false;
			mHasAlpha = false;
			
			int aSize = 256;
			unsigned int* ptr = mColorTable;
			
			for (int i = 0; i < aSize; i++)
			{
				uchar anAlpha = (uchar) (*ptr++ >> 24);

				if (anAlpha == 0)
					mHasTrans = true;
				else if (anAlpha != 255)
					mHasAlpha = true;
			}
		}
		else
		{
			mHasTrans = true;
			mHasAlpha = false;
		}

		mBitsChanged = false;
	}

	//if (gDebug)
	//	mApp->CopyToClipboard("-MemoryImage::CommitBits");
}

void* MemoryImage::GetNativeAlphaData(NativeDisplay *theDisplay)
{
	if (mNativeAlphaData != NULL)
		return mNativeAlphaData;

	CommitBits();

	const int rRightShift = 16 + (8-theDisplay->mRedBits);
	const int gRightShift = 8 + (8-theDisplay->mGreenBits);
	const int bRightShift = 0 + (8-theDisplay->mBlueBits);

	const int rLeftShift = theDisplay->mRedShift;
	const int gLeftShift = theDisplay->mGreenShift;
	const int bLeftShift = theDisplay->mBlueShift;

	const int rMask = theDisplay->mRedMask;
	const int gMask = theDisplay->mGreenMask;
	const int bMask = theDisplay->mBlueMask;

	if (mColorTable == NULL)
	{
		unsigned int* aSrcPtr = GetBits();

		unsigned int* anAlphaData = new unsigned int[mWidth*mHeight];

		unsigned int* aDestPtr = anAlphaData;
		int aSize = mWidth*mHeight;
		for (int i = 0; i < aSize; i++)
		{
			unsigned int val = *(aSrcPtr++);

			int anAlpha = val >> 24;			

			unsigned int r = ((val & 0xFF0000) * (anAlpha+1)) >> 8;
			unsigned int g = ((val & 0x00FF00) * (anAlpha+1)) >> 8;
			unsigned int b = ((val & 0x0000FF) * (anAlpha+1)) >> 8;

			*(aDestPtr++) =
				(((r >> rRightShift) << rLeftShift) & rMask) |
				(((g >> gRightShift) << gLeftShift) & gMask) |
				(((b >> bRightShift) << bLeftShift) & bMask) |
				(anAlpha << 24);
		}
		
		mNativeAlphaData = anAlphaData;	
	}
	else
	{
		unsigned int* aSrcPtr = mColorTable;

		unsigned int* anAlphaData = new unsigned int[256];
		
		for (int i = 0; i < 256; i++)
		{
			unsigned int val = *(aSrcPtr++);

			int anAlpha = val >> 24;

			unsigned int r = ((val & 0xFF0000) * (anAlpha+1)) >> 8;
			unsigned int g = ((val & 0x00FF00) * (anAlpha+1)) >> 8;
			unsigned int b = ((val & 0x0000FF) * (anAlpha+1)) >> 8;

			anAlphaData[i] =
				(((r >> rRightShift) << rLeftShift) & rMask) |
				(((g >> gRightShift) << gLeftShift) & gMask) |
				(((b >> bRightShift) << bLeftShift) & bMask) |
				(anAlpha << 24);
		}
		
		
		mNativeAlphaData = anAlphaData;	
	}

	return mNativeAlphaData;
}


uchar* MemoryImage::GetRLAlphaData()
{
	CommitBits();

	if (mRLAlphaData == NULL)
	{		
		if (mColorTable == NULL)
		{
			unsigned int* aSrcPtr;
			if (mNativeAlphaData != NULL)
				aSrcPtr = (unsigned int*) mNativeAlphaData;
			else
				aSrcPtr = GetBits();
			mRLAlphaData = new uchar[mWidth*mHeight];

			#define NEXT_SRC_COLOR (*(aSrcPtr++))

			#include "inc_routines/MI_GetRLAlphaData.inc"

			#undef NEXT_SRC_COLOR
		}
		else
		{
			uchar* aSrcPtr = mColorIndices;
			unsigned int* aColorTable = mColorTable;
			mRLAlphaData = new uchar[mWidth*mHeight];

			#define NEXT_SRC_COLOR (aColorTable[*(aSrcPtr++)])

			#include "inc_routines/MI_GetRLAlphaData.inc"

			#undef NEXT_SRC_COLOR
		}
	}

	return mRLAlphaData;
}

uchar* MemoryImage::GetRLAdditiveData(NativeDisplay *theNative)
{
	if (mRLAdditiveData == NULL)
	{
		if (mColorTable == NULL)
		{
			unsigned int* aBits = (unsigned int*) GetNativeAlphaData(theNative);

			mRLAdditiveData = new uchar[mWidth*mHeight];

			uchar* aWPtr = mRLAdditiveData;
			unsigned int* aRPtr = aBits;

			if (mWidth==1)
			{
				memset(aWPtr,1,mHeight);
			}
			else
			{
				for (int aRow = 0; aRow < mHeight; aRow++)			
				{
					int aRCount = 1;
					int aRLCount = 1;
					
					int aLastAClass = (((*aRPtr++) & 0xFFFFFF) != 0) ? 1 : 0;

					while (aRCount < mWidth)
					{
						aRCount++;				

						int aThisAClass = (((*aRPtr++) & 0xFFFFFF) != 0) ? 1 : 0;				

						if ((aThisAClass != aLastAClass) || (aRCount == mWidth))
						{
							if (aThisAClass == aLastAClass)
								aRLCount++;

							for (int i = aRLCount; i > 0; i--)
							{
								if (i >= 255)
									*aWPtr++ = 255;
								else
									*aWPtr++ = i;
							}					

							if ((aRCount == mWidth) && (aThisAClass != aLastAClass))
								*aWPtr++ = 1;

							aLastAClass = aThisAClass;
							aRLCount = 1;
						}
						else
						{
							aRLCount++;
						}
					}
				}
			}
		}
		else
		{
			unsigned int* aNativeColorTable = (unsigned int*) GetNativeAlphaData(theNative);

			mRLAdditiveData = new uchar[mWidth*mHeight];

			uchar* aWPtr = mRLAdditiveData;
			uchar* aRPtr = mColorIndices;

			if (mWidth==1)
			{
				memset(aWPtr,1,mHeight);
			}
			else
			{
				for (int aRow = 0; aRow < mHeight; aRow++)			
				{
					int aRCount = 1;
					int aRLCount = 1;
					
					int aLastAClass = (((aNativeColorTable[*aRPtr++]) & 0xFFFFFF) != 0) ? 1 : 0;

					while (aRCount < mWidth)
					{
						aRCount++;				

						int aThisAClass = (((aNativeColorTable[*aRPtr++]) & 0xFFFFFF) != 0) ? 1 : 0;				

						if ((aThisAClass != aLastAClass) || (aRCount == mWidth))
						{
							if (aThisAClass == aLastAClass)
								aRLCount++;

							for (int i = aRLCount; i > 0; i--)
							{
								if (i >= 255)
									*aWPtr++ = 255;
								else
									*aWPtr++ = i;
							}					

							if ((aRCount == mWidth) && (aThisAClass != aLastAClass))
								*aWPtr++ = 1;

							aLastAClass = aThisAClass;
							aRLCount = 1;
						}
						else
						{
							aRLCount++;
						}
					}
				}
			}
		}
	}

	return mRLAdditiveData;
}

void MemoryImage::PurgeBits()
{
	mPurgeBits = true;
	// The decoder owns pixels until the GPU upload has taken its snapshot.
	if (mD3DData == NULL)
	{
		NotifyMaintenance(ImageMaintenanceOperation::PurgeBits);
		return;
	}
	
	delete [] mBits;
	mBits = NULL;
	
	if (mD3DData != NULL)
	{
		DeleteSWBuffers();
		delete [] mColorIndices;
		mColorIndices = NULL;

		delete [] mColorTable;
		mColorTable = NULL;
	}	
	NotifyMaintenance(ImageMaintenanceOperation::PurgeBits);
}

void MemoryImage::DeleteSWBuffers()
{
	delete [] mNativeAlphaData;
	mNativeAlphaData = NULL;

	delete [] mRLAdditiveData;
	mRLAdditiveData = NULL;

	delete [] mRLAlphaData;
	mRLAlphaData = NULL;
	NotifyMaintenance(ImageMaintenanceOperation::DeleteSWBuffers);
}

void MemoryImage::Delete3DBuffers()
{
	mApp->Remove3DData(this);
	NotifyMaintenance(ImageMaintenanceOperation::Delete3DBuffers);
}

void MemoryImage::DeleteExtraBuffers()
{
	DeleteSWBuffers();
	Delete3DBuffers();
	NotifyMaintenance(ImageMaintenanceOperation::DeleteExtraBuffers);
}

void MemoryImage::ReInit()
{
	// Fix any un-palletizing
	if (mWantPal)
		Palletize();
			
	if (mPurgeBits)
		PurgeBits();
	NotifyMaintenance(ImageMaintenanceOperation::ReInit);
}

void MemoryImage::DeleteNativeData()
{
	delete [] mNativeAlphaData;
	mNativeAlphaData = NULL;

	delete [] mRLAdditiveData;
	mRLAdditiveData = NULL;	
	NotifyMaintenance(ImageMaintenanceOperation::DeleteNativeData);
}

void MemoryImage::AdoptDecodedImage(std::unique_ptr<ImageLib::Image> image,bool commitBits)
{
	const size_t count=size_t(image->mWidth)*image->mHeight;
	if (mBits || mD3DData || !image->mBits || image->mPixelCapacity<count+1)
		throw GpuImageCpuAccess{};
	mWidth=image->mWidth;mHeight=image->mHeight;
	mBits=std::exchange(image->mBits,nullptr);
	mBits[count]=MEMORYCHECK_ID;
	mPurgeBits=true;
	BitsChanged();
	if (image->HasComposition()) {
		mPendingDecoded=std::move(image);
		mForcedMode = true;
		mHasTrans = true;
		mHasAlpha = true;
	}
	if (commitBits) CommitBits();
}

void MemoryImage::AppendAlphaImage(std::unique_ptr<ImageLib::Image> image,int columns,int rows)
{
	if (mD3DData || !mBits) throw GpuImageCpuAccess{};
	if(columns<=0 || rows<=0 || mWidth/columns!=image->mWidth || mHeight/rows!=image->mHeight)
		throw ImageLib::ImageAlphaSizeMismatch{};
	if (!mPendingDecoded) {
		mPendingDecoded=std::make_unique<ImageLib::Image>();
		mPendingDecoded->mWidth=mWidth;mPendingDecoded->mHeight=mHeight;
	}
	mPendingDecoded->mAlphaLayers.push_back({std::move(image),columns,rows});
	mForcedMode = true;
	mHasTrans = true;
	mHasAlpha = true;
}

void MemoryImage::SetBits(unsigned int* theBits, int theWidth, int theHeight, bool commitBits)
{	
	if (theBits != mBits)
	{
		delete [] mColorIndices;
		mColorIndices = NULL;

		delete [] mColorTable;
		mColorTable = NULL;

		if (mBits == nullptr || theWidth != mWidth || theHeight != mHeight)
		{
			delete [] mBits;
			mBits = new unsigned int[theWidth*theHeight + 1];
			mWidth = theWidth;
			mHeight = theHeight;
		}
		memcpy(mBits, theBits, mWidth*mHeight*sizeof(unsigned int));
		mBits[mWidth*mHeight] = MEMORYCHECK_ID;

		BitsChanged();
		if (commitBits)
			CommitBits();
	}
}

void MemoryImage::Create(int theWidth, int theHeight)
{
	delete [] mBits;
	mBits = NULL;

	mWidth = theWidth;
	mHeight = theHeight;	

	// All zeros --> trans + alpha
	mHasTrans = true;
	mHasAlpha = true;

	BitsChanged();	
}

unsigned int* MemoryImage::GetBits()
{
	if (mPendingDecoded) throw GpuImageCpuAccess{};
	if (mBits == NULL)
	{
		const auto* data=static_cast<const TextureData*>(mD3DData);
		if (data && (data->mGPUOwned || data->mTexture))
			throw GpuImageCpuAccess{};
		int aSize = mWidth*mHeight;

		mBits = new unsigned int[aSize+1];
		mBits[aSize] = MEMORYCHECK_ID;		

		if (mColorTable != NULL)
		{
			for (int i = 0; i < aSize; i++)
				mBits[i] = mColorTable[mColorIndices[i]];

			delete [] mColorIndices;
			mColorIndices = NULL;

			delete [] mColorTable;
			mColorTable = NULL;

			delete [] mNativeAlphaData;
			mNativeAlphaData = NULL;
		}
		else if (mNativeAlphaData != NULL)
		{
			NativeDisplay* aDisplay = gSexyAppBase->mDDInterface;

			const int rMask = aDisplay->mRedMask;
			const int gMask = aDisplay->mGreenMask;
			const int bMask = aDisplay->mBlueMask;

			const int rLeftShift = aDisplay->mRedShift + (aDisplay->mRedBits);
			const int gLeftShift = aDisplay->mGreenShift + (aDisplay->mGreenBits);
			const int bLeftShift = aDisplay->mBlueShift + (aDisplay->mBlueBits);			

			unsigned int* aDestPtr = mBits;
			unsigned int* aSrcPtr = mNativeAlphaData;

			int aSize = mWidth*mHeight;
			for (int i = 0; i < aSize; i++)
			{
				unsigned int val = *(aSrcPtr++);

				int anAlpha = val >> 24;			

				unsigned int r = (((((val & rMask) << 8) / (anAlpha+1)) & rMask) << 8) >> rLeftShift;
				unsigned int g = (((((val & gMask) << 8) / (anAlpha+1)) & gMask) << 8) >> gLeftShift;
				unsigned int b = (((((val & bMask) << 8) / (anAlpha+1)) & bMask) << 8) >> bLeftShift;

				*(aDestPtr++) = (r << 16) | (g << 8) | (b) | (anAlpha << 24);
			}
		}
		else
		{
			std::memset(mBits, 0, aSize*sizeof(unsigned int));
		}
	}	

	return mBits;
}

void MemoryImage::FillRect(const Rect& theRect, const Color& theColor, int theDrawMode)
{
	(void)theDrawMode;
	unsigned int src = theColor.ToInt();

	unsigned int* aBits = GetBits();

	int oldAlpha = src >> 24;

	if (oldAlpha == 0xFF)
	{
		for (int aRow = theRect.mY; aRow < theRect.mY+theRect.mHeight; aRow++)
		{
			unsigned int* aDestPixels = &aBits[aRow*mWidth+theRect.mX];

			for (int i = 0; i < theRect.mWidth; i++)
				*aDestPixels++ = src;
		}
	}
	else
	{
		for (int aRow = theRect.mY; aRow < theRect.mY+theRect.mHeight; aRow++)
		{
			unsigned int* aDestPixels = &aBits[aRow*mWidth+theRect.mX];

			for (int i = 0; i < theRect.mWidth; i++)
			{				
				unsigned int dest = *aDestPixels;
								
				int aDestAlpha = dest >> 24;
				int aNewDestAlpha = aDestAlpha + ((255 - aDestAlpha) * oldAlpha) / 255;
									
				int newAlpha = (aNewDestAlpha == 0) ? 0 : 255 * oldAlpha / aNewDestAlpha;

				int oma = 256 - newAlpha;

#ifdef OPTIMIZE_SOFTWARE_DRAWING
				*(aDestPixels++) = (aNewDestAlpha << 24) |
					((((dest & 0xFF00FF) * oma + (src & 0xFF00FF) * newAlpha) >> 8) & 0xFF00FF) |
					((((dest & 0x00FF00) * oma + (src & 0x00FF00) * newAlpha) >> 8) & 0x00FF00);
#else
				*(aDestPixels++) = (aNewDestAlpha << 24) |
					((((dest & 0x0000FF) * oma) >> 8) + (((src & 0x0000FF) * newAlpha) >> 8) & 0x0000FF) |
					((((dest & 0x00FF00) * oma) >> 8) + (((src & 0x00FF00) * newAlpha) >> 8) & 0x00FF00) |
					((((dest & 0xFF0000) * oma) >> 8) + (((src & 0xFF0000) * newAlpha) >> 8) & 0xFF0000);
#endif
			}
		}
	}

	BitsChanged();
}

void MemoryImage::ClearRect(const Rect& theRect)
{
	unsigned int* aBits = GetBits();
	
	for (int aRow = theRect.mY; aRow < theRect.mY+theRect.mHeight; aRow++)
	{
		unsigned int* aDestPixels = &aBits[aRow*mWidth+theRect.mX];

		for (int i = 0; i < theRect.mWidth; i++)
			*aDestPixels++ = 0;
	}	
	
	BitsChanged();
}

void MemoryImage::Clear()
{
	unsigned int* ptr = GetBits();
	if (ptr != NULL)
	{
		for (int i = 0; i < mWidth*mHeight; i++)
			*ptr++ = 0;

		BitsChanged();
	}
}

void MemoryImage::AdditiveBlt(MemoryImage* theImage, int theX, int theY, const Rect& theSrcRect, const Color& theColor)
{
	theImage->mDrawn = true;

	MemoryImage* aSrcMemoryImage = theImage;

	uchar* aMaxTable = mApp->mAdd8BitMaxTable;

	if (aSrcMemoryImage != NULL)
	{
		if (aSrcMemoryImage->mColorTable == NULL)
		{			
			unsigned int* aSrcBits = aSrcMemoryImage->GetBits();

			#define NEXT_SRC_COLOR		(*(aSrcPtr++))
			#define SRC_TYPE			unsigned int

			#include "inc_routines/MI_AdditiveBlt.inc"

			#undef NEXT_SRC_COLOR
			#undef SRC_TYPE		
		}
		else
		{			
			unsigned int* aColorTable = aSrcMemoryImage->mColorTable;
			uchar* aSrcBits = aSrcMemoryImage->mColorIndices;

			#define NEXT_SRC_COLOR		(aColorTable[*(aSrcPtr++)])
			#define SRC_TYPE uchar

			#include "inc_routines/MI_AdditiveBlt.inc"

			#undef NEXT_SRC_COLOR
			#undef SRC_TYPE		
		}

		BitsChanged();
	}	
}

void MemoryImage::NormalBlt(MemoryImage* theImage, int theX, int theY, const Rect& theSrcRect, const Color& theColor)
{
	theImage->mDrawn = true;

	MemoryImage* aSrcMemoryImage = theImage;

	if (aSrcMemoryImage != NULL)
	{
		if (aSrcMemoryImage->mColorTable == NULL)
		{			
			unsigned int* aSrcPixelsRow = ((unsigned int*) aSrcMemoryImage->GetBits()) + (theSrcRect.mY * theImage->mWidth) + theSrcRect.mX;

			#define NEXT_SRC_COLOR		(*(aSrcPtr++))
			#define READ_SRC_COLOR		(*(aSrcPtr))
			#undef EACH_ROW
			#define EACH_ROW			unsigned int* aSrcPtr = aSrcPixelsRow

			#include "inc_routines/MI_NormalBlt.inc"

			#undef NEXT_SRC_COLOR	
			#undef READ_SRC_COLOR	
			#undef EACH_ROW			
		}
		else
		{			
			unsigned int* aColorTable = aSrcMemoryImage->mColorTable;
			uchar* aSrcPixelsRow = aSrcMemoryImage->mColorIndices + (theSrcRect.mY * theImage->mWidth) + theSrcRect.mX;

			#define NEXT_SRC_COLOR		(aColorTable[*(aSrcPtr++)])
			#define READ_SRC_COLOR		(aColorTable[*(aSrcPtr)])
			#define EACH_ROW			uchar* aSrcPtr = aSrcPixelsRow

			#include "inc_routines/MI_NormalBlt.inc"

			#undef NEXT_SRC_COLOR	
			#undef READ_SRC_COLOR	
			#undef EACH_ROW			
		}

		BitsChanged();
	}
}

void MemoryImage::Blt(MemoryImage* theImage, int theX, int theY, const Rect& theSrcRect, const Color& theColor, int theDrawMode)
{
	theImage->mDrawn = true;

	DBG_ASSERTE((theColor.mRed >= 0) && (theColor.mRed <= 255));
	DBG_ASSERTE((theColor.mGreen >= 0) && (theColor.mGreen <= 255));
	DBG_ASSERTE((theColor.mBlue >= 0) && (theColor.mBlue <= 255));
	DBG_ASSERTE((theColor.mAlpha >= 0) && (theColor.mAlpha <= 255));

	switch (theDrawMode)
	{
	case Graphics::DRAWMODE_NORMAL:
		NormalBlt(theImage, theX, theY, theSrcRect, theColor);
		break;
	case Graphics::DRAWMODE_ADDITIVE:
		AdditiveBlt(theImage, theX, theY, theSrcRect, theColor);
		break;
	}
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
void MemoryImage::BltF(MemoryImage* theImage, float theX, float theY, const Rect& theSrcRect, const Rect &theClipRect, const Color& theColor, int theDrawMode)
{
	theImage->mDrawn = true;

	BltRotated(theImage,theX,theY,theSrcRect,theClipRect,theColor,theDrawMode,0,0,0);
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
bool MemoryImage::BltRotatedClipHelper(float &theX, float &theY, const Rect &theSrcRect, const Rect &theClipRect, double theRot, FRect &theDestRect, float theRotCenterX, float theRotCenterY)
{
	// Clipping Code (this used to be in Graphics::DrawImageRotated)
	float aCos = FastCos(static_cast<float>(theRot));  // P5-⑥：折叠在 FastSin 内
	float aSin = FastSin(static_cast<float>(theRot));

	// Map the four corners and find the bounding rectangle
	float px[4] = { 0, (float)theSrcRect.mWidth, (float)theSrcRect.mWidth, 0 };
	float py[4] = { 0, 0, (float)theSrcRect.mHeight, (float)theSrcRect.mHeight };
	float aMinX = 10000000;
	float aMaxX = -10000000;
	float aMinY = 10000000;
	float aMaxY = -10000000;

	for (int i=0; i<4; i++)
	{
		float ox = px[i] - theRotCenterX;
		float oy = py[i] - theRotCenterY;

		px[i] = (theRotCenterX + ox*aCos + oy*aSin) + theX;
		py[i] = (theRotCenterY + oy*aCos - ox*aSin) + theY;

		if (px[i] < aMinX)
			aMinX = px[i];
		if (px[i] > aMaxX)
			aMaxX = px[i];
		if (py[i] < aMinY)
			aMinY = py[i];
		if (py[i] > aMaxY)
			aMaxY = py[i];
	}



	FRect aClipRect(theClipRect.mX,theClipRect.mY,theClipRect.mWidth,theClipRect.mHeight);

	FRect aDestRect = FRect(aMinX, aMinY, aMaxX-aMinX, aMaxY-aMinY).Intersection(aClipRect);	
	if ((aDestRect.mWidth <= 0) || (aDestRect.mHeight <= 0)) // nothing to draw
		return false;

	theDestRect = aDestRect;
	return true;
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
bool MemoryImage::StretchBltClipHelper(const Rect &theSrcRect, const Rect &theClipRect, const Rect &theDestRect, FRect &theSrcRectOut, Rect &theDestRectOut)
{
	theDestRectOut = Rect(theDestRect.mX , theDestRect.mY, theDestRect.mWidth, theDestRect.mHeight).Intersection(theClipRect);	

	double aXFactor = theSrcRect.mWidth / (double) theDestRect.mWidth;
	double aYFactor = theSrcRect.mHeight / (double) theDestRect.mHeight;

	theSrcRectOut = FRect(theSrcRect.mX + (theDestRectOut.mX - theDestRect.mX)*aXFactor, 
				   theSrcRect.mY + (theDestRectOut.mY - theDestRect.mY)*aYFactor, 
				   theSrcRect.mWidth + (theDestRectOut.mWidth - theDestRect.mWidth)*aXFactor, 
				   theSrcRect.mHeight + (theDestRectOut.mHeight - theDestRect.mHeight)*aYFactor);

	return theSrcRectOut.mWidth>0 && theSrcRectOut.mHeight>0;
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
bool MemoryImage::StretchBltMirrorClipHelper(const Rect &theSrcRect, const Rect &theClipRect, const Rect &theDestRect, FRect &theSrcRectOut, Rect &theDestRectOut)
{
	theDestRectOut = Rect(theDestRect.mX, theDestRect.mY, theDestRect.mWidth, theDestRect.mHeight).Intersection(theClipRect);	

	double aXFactor = theSrcRect.mWidth / (double) theDestRect.mWidth;
	double aYFactor = theSrcRect.mHeight / (double) theDestRect.mHeight;

	int aTotalClip = theDestRect.mWidth - theDestRectOut.mWidth;
	int aLeftClip = theDestRectOut.mX - theDestRect.mX;
	int aRightClip = aTotalClip-aLeftClip;

	theSrcRectOut = FRect(theSrcRect.mX + (aRightClip)*aXFactor, 
				   theSrcRect.mY + (theDestRectOut.mY - theDestRect.mY)*aYFactor, 
				   theSrcRect.mWidth + (theDestRectOut.mWidth - theDestRect.mWidth)*aXFactor, 
				   theSrcRect.mHeight + (theDestRectOut.mHeight - theDestRect.mHeight)*aYFactor);

	return theSrcRectOut.mWidth>0 && theSrcRectOut.mHeight>0;
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
void MemoryImage::BltRotated(MemoryImage* theImage, float theX, float theY, const Rect &theSrcRect, const Rect& theClipRect, const Color& theColor, int theDrawMode, double theRot, float theRotCenterX, float theRotCenterY)
{
	theImage->mDrawn = true;

	// This BltRotatedClipHelper clipping used to happen in Graphics::DrawImageRotated
	FRect aDestRect;
	if (!BltRotatedClipHelper(theX, theY, theSrcRect, theClipRect, theRot, aDestRect,theRotCenterX,theRotCenterY))
		return;

	MemoryImage* aMemoryImage = theImage;
	uchar* aMaxTable = mApp->mAdd8BitMaxTable;

	if (aMemoryImage != NULL)
	{	
		if (aMemoryImage->mColorTable == NULL)
		{			
			unsigned int* aSrcBits = aMemoryImage->GetBits() + theSrcRect.mX + theSrcRect.mY*aMemoryImage->mWidth;

			#define SRC_TYPE unsigned int
			#define READ_COLOR(ptr) (*(ptr))

			if (theDrawMode == Graphics::DRAWMODE_NORMAL)
			{
				#include "inc_routines/MI_BltRotated.inc"
			}
			else
			{
				#include "inc_routines/MI_BltRotated_Additive.inc"
			}

			#undef SRC_TYPE
			#undef READ_COLOR
		}
		else
		{			
			unsigned int* aColorTable = aMemoryImage->mColorTable;
			uchar* aSrcBits = aMemoryImage->mColorIndices + theSrcRect.mX + theSrcRect.mY*aMemoryImage->mWidth;

			#define SRC_TYPE uchar
			#define READ_COLOR(ptr) (aColorTable[*(ptr)])

			if (theDrawMode == Graphics::DRAWMODE_NORMAL)
			{
				#include "inc_routines/MI_BltRotated.inc"
			}
			else
			{
				#include "inc_routines/MI_BltRotated_Additive.inc"
			}

			#undef SRC_TYPE
			#undef READ_COLOR
		}

		BitsChanged();
	}
}

void MemoryImage::SlowStretchBlt(MemoryImage* theImage, const Rect& theDestRect, const FRect& theSrcRect, const Color& theColor, int theDrawMode)
{
	(void)theColor;(void)theDrawMode;
	theImage->mDrawn = true;

	// This thing was a pain to write.  I bet i could have gotten something just as good
	// from some Graphics Gems book.	
	
	unsigned int* aDestEnd = GetBits() + (mWidth * mHeight);
	(void)aDestEnd; // Unused in Release mode

	MemoryImage* aSrcMemoryImage = theImage;

	if (aSrcMemoryImage != NULL)
	{
		if (aSrcMemoryImage->mColorTable == NULL)
		{			
			unsigned int* aSrcBits = aSrcMemoryImage->GetBits();

			#define SRC_TYPE unsigned int
			#define READ_COLOR(ptr) (*(ptr))

			#include "inc_routines/MI_SlowStretchBlt.inc"

			#undef SRC_TYPE
			#undef READ_COLOR
		}
		else
		{
			unsigned int* aColorTable = aSrcMemoryImage->mColorTable;
			uchar* aSrcBits = aSrcMemoryImage->mColorIndices;

			#define SRC_TYPE uchar
			#define READ_COLOR(ptr) (aColorTable[*(ptr)])

			#include "inc_routines/MI_SlowStretchBlt.inc"

			#undef SRC_TYPE
			#undef READ_COLOR
		}

		BitsChanged();
	}	
}

//TODO: Make the special version
void MemoryImage::FastStretchBlt(MemoryImage* theImage, const Rect& theDestRect, const FRect& theSrcRect, const Color& theColor, int theDrawMode)
{
	(void)theDrawMode;
	theImage->mDrawn = true;

	MemoryImage* aSrcMemoryImage = theImage;

	if (aSrcMemoryImage != NULL)
	{
		unsigned int* aDestPixelsRow = ((unsigned int*) GetBits()) + (theDestRect.mY * mWidth) + theDestRect.mX;
		unsigned int* aSrcPixelsRow = (unsigned int*) aSrcMemoryImage->GetBits();;
		
		double aSrcY = theSrcRect.mY;

		double anAddX = theSrcRect.mWidth / theDestRect.mWidth;
		double anAddY = theSrcRect.mHeight / theDestRect.mHeight;

		if (theColor == Color::White)
		{
			for (int y = 0; y < theDestRect.mHeight; y++)
			{
				double aSrcX = theSrcRect.mX;

				unsigned int* aDestPixels = aDestPixelsRow;

				for (int x = 0; x < theDestRect.mWidth; x++)
				{
					aSrcX += anAddX;

					unsigned int* aSrcPixels = aSrcPixelsRow + ((int) aSrcX) + (aSrcMemoryImage->mWidth * ((int) aSrcY));
					unsigned int src = *aSrcPixels;

					unsigned int dest = *aDestPixels;
					
					int a = src >> 24;	
					
					if (a != 0)
					{
						int aDestAlpha = dest >> 24;
						int aNewDestAlpha = aDestAlpha + ((255 - aDestAlpha) * a) / 255;
											
						a = 255 * a / aNewDestAlpha;

						int oma = 256 - a;
						
						*(aDestPixels++) = (aNewDestAlpha << 24) |
							((((dest & 0x0000FF) * oma) >> 8) + (((src & 0x0000FF) * a) >> 8) & 0x0000FF) |
							((((dest & 0x00FF00) * oma) >> 8) + (((src & 0x00FF00) * a) >> 8) & 0x00FF00) |
							((((dest & 0xFF0000) * oma) >> 8) + (((src & 0xFF0000) * a) >> 8) & 0xFF0000);
					}
					else
						aDestPixels++;
				}

				aDestPixelsRow += mWidth;				
				aSrcY += anAddY;
			}
		}
		else
		{
		}
	}

	BitsChanged();
}

void MemoryImage::StretchBlt(MemoryImage* theImage, const Rect& theDestRect, const Rect& theSrcRect, const Rect& theClipRect, const Color& theColor, int theDrawMode, bool fastStretch)
{
	theImage->mDrawn = true;

	Rect aDestRect;
	FRect aSrcRect;

	if (!StretchBltClipHelper(theSrcRect, theClipRect, theDestRect, aSrcRect, aDestRect))
		return;

	if (fastStretch)
		FastStretchBlt(theImage, aDestRect, aSrcRect, theColor, theDrawMode);
	else
		SlowStretchBlt(theImage, aDestRect, aSrcRect, theColor, theDrawMode);
}

void MemoryImage::BltMatrixHelper(MemoryImage* theImage, float x, float y, const SexyMatrix3 &theMatrix, const Rect& theClipRect, const Color& theColor, int theDrawMode, const Rect &theSrcRect, void *theSurface, int theBytePitch, int thePixelFormat, bool blend)
{
	MemoryImage *anImage = theImage;
	if (anImage==NULL)
		return;
 
	float w2 = theSrcRect.mWidth/2.0f;
	float h2 = theSrcRect.mHeight/2.0f;

	float u0 = (float)theSrcRect.mX/theImage->mWidth;
	float u1 = (float)(theSrcRect.mX + theSrcRect.mWidth)/theImage->mWidth;
	float v0 = (float)theSrcRect.mY/theImage->mHeight;
	float v1 = (float)(theSrcRect.mY + theSrcRect.mHeight)/theImage->mHeight;

	SWHelper::XYZStruct aVerts[4] =
	{
		{ -w2,	-h2,	u0, v0, static_cast<long int>(0xFFFFFFFF) },
		{ w2,	-h2,	u1,	v0,	static_cast<long int>(0xFFFFFFFF) },
		{ -w2,	h2,		u0,	v1,	static_cast<long int>(0xFFFFFFFF) },
		{ w2,	h2,		u1,	v1,	static_cast<long int>(0xFFFFFFFF) }
	};

	for (int i=0; i<4; i++)
	{
		SexyVector3 v(aVerts[i].mX, aVerts[i].mY, 1);
		v = theMatrix*v;
		aVerts[i].mX = v.x + x - 0.5f;
		aVerts[i].mY = v.y + y - 0.5f;
	}

	SWHelper::SWDrawShape(aVerts, 4, anImage, theColor, theDrawMode, theClipRect, theSurface, theBytePitch, thePixelFormat, blend,false);
}

void MemoryImage::BltMatrix(MemoryImage* theImage, float x, float y, const SexyMatrix3 &theMatrix, const Rect& theClipRect, const Color& theColor, int theDrawMode, const Rect &theSrcRect, bool blend)
{
	theImage->mDrawn = true;

	unsigned int *aSurface = GetBits();
	int aPitch = mWidth*4;
	int aFormat = 0x8888;
	if (mForcedMode && !mHasAlpha && !mHasTrans)
		aFormat = 0x888;

	BltMatrixHelper(theImage,x,y,theMatrix,theClipRect,theColor,theDrawMode,theSrcRect,aSurface,aPitch,aFormat,blend);
	BitsChanged();
}

void MemoryImage::BltTrianglesTexHelper(MemoryImage* theTexture, const TriVertex theVertices[][3], int theNumTriangles, const Rect &theClipRect, const Color &theColor, int theDrawMode, void *theSurface, int theBytePitch, int thePixelFormat, float tx, float ty, bool blend)
{
	MemoryImage *anImage = theTexture;
//	if (anImage==NULL)
//		return;

	// int aColor = theColor.ToInt(); // unused
	for (int i=0; i<theNumTriangles; i++)
	{
		bool vertexColor = false;

		SWHelper::XYZStruct aVerts[3];
		for (int j=0; j<3; j++)
		{
			aVerts[j].mX = theVertices[i][j].x + tx;
			aVerts[j].mY = theVertices[i][j].y + ty;
			aVerts[j].mU = theVertices[i][j].u;
			aVerts[j].mV = theVertices[i][j].v;
			aVerts[j].mDiffuse = theVertices[i][j].color;

			if (aVerts[j].mDiffuse!=0) 
				vertexColor = true;
		}

		SWHelper::SWDrawShape(aVerts, 3, anImage, theColor, theDrawMode, theClipRect, theSurface, theBytePitch, thePixelFormat, blend, vertexColor);
	}

}

void MemoryImage::FillScanLinesWithCoverage(Span* theSpans, int theSpanCount, const Color& theColor, int theDrawMode, const BYTE* theCoverage, int theCoverX, int theCoverY, int theCoverWidth, int theCoverHeight)
{
	(void)theDrawMode;(void)theCoverHeight;
	unsigned int* theBits = GetBits();
	unsigned int src = theColor.ToInt();
	for (int i = 0; i < theSpanCount; ++i)
	{
		Span* aSpan = &theSpans[i];
		int x = aSpan->mX - theCoverX;
		int y = aSpan->mY - theCoverY;

		unsigned int* aDestPixels = &theBits[aSpan->mY*mWidth + aSpan->mX];
		const BYTE* aCoverBits = &theCoverage[y*theCoverWidth+x];
		for (int w = 0; w < aSpan->mWidth; ++w)
		{
			int cover = *aCoverBits++ + 1;
			int a = (cover * theColor.mAlpha) >> 8;
			int oma;
			unsigned int dest = *aDestPixels;
							
			if (a > 0)
			{
				int aDestAlpha = dest >> 24;
				int aNewDestAlpha = aDestAlpha + ((255 - aDestAlpha) * a) / 255;
				
				a = 255 * a / aNewDestAlpha;
				oma = 256 - a;
				*(aDestPixels++) = (aNewDestAlpha << 24) |
					((((dest & 0x0000FF) * oma + (src & 0x0000FF) * a) >> 8) & 0x0000FF) |
					((((dest & 0x00FF00) * oma + (src & 0x00FF00) * a) >> 8) & 0x00FF00) |
					((((dest & 0xFF0000) * oma + (src & 0xFF0000) * a) >> 8) & 0xFF0000);
			}
		}
	}
	BitsChanged();
}

void MemoryImage::BltTrianglesTex(MemoryImage* theTexture, const TriVertex theVertices[][3], int theNumTriangles, const Rect& theClipRect, const Color &theColor, int theDrawMode, float tx, float ty, bool blend)
{
	theTexture->mDrawn = true;

	unsigned int *aSurface = GetBits();

	int aPitch = mWidth*4;
	int aFormat = 0x8888;
	if (mForcedMode && !mHasAlpha && !mHasTrans)
		aFormat = 0x888;

	BltTrianglesTexHelper(theTexture,theVertices,theNumTriangles,theClipRect,theColor,theDrawMode,aSurface,aPitch,aFormat,tx,ty,blend);
	BitsChanged();
}

bool MemoryImage::Palletize()
{
	CommitBits();
	
	if (mColorTable != NULL)
		return true;

	GetBits();

	if (mBits == NULL)
		return false;

	mColorIndices = new uchar[mWidth*mHeight];
	mColorTable = new unsigned int[256];

	if (!Quantize8Bit(mBits, mWidth, mHeight, mColorIndices, mColorTable))
	{
		delete [] mColorIndices;
		mColorIndices = NULL;

		delete [] mColorTable;
		mColorTable = NULL;

		mWantPal = false;

		return false;
	}
	
	delete [] mBits;
	mBits = NULL;

	delete [] mNativeAlphaData;
	mNativeAlphaData = NULL;

	mWantPal = true;

	return true;
}
