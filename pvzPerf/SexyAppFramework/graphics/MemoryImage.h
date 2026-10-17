#pragma once
#include "Image.h"
#include <array>
#include <exception>
#include <memory>
namespace ImageLib { class Image; }

#define OPTIMIZE_SOFTWARE_DRAWING
#ifdef OPTIMIZE_SOFTWARE_DRAWING
#endif

namespace Sexy
{

const unsigned int MEMORYCHECK_ID = 0x4BEEFADE;

class NativeDisplay;
class SexyAppBase;
class GpuImageCpuAccess final : public std::exception {};

enum class ImageMaintenanceOperation : unsigned char
{
	PurgeBits,
	DeleteSWBuffers,
	Delete3DBuffers,
	DeleteExtraBuffers,
	ReInit,
	DeleteNativeData
};

class MemoryImage : public Image
{
protected:
	// Registered only by extensions. Copies retain the default null callback.
	void (*mMaintenanceHook)(MemoryImage&, ImageMaintenanceOperation) = nullptr;

	template<class T>
	void SetMaintenanceType() noexcept
	{
		mMaintenanceHook = [](MemoryImage& image, ImageMaintenanceOperation operation)
		{
			static_cast<T&>(image).OnImageMaintenance(operation);
		};
	}

public:
	unsigned int*					mBits;
	int						mBitsChangedCount;
	void*					mD3DData;
	uint32_t mGpuSamplingFlags = 0;

	unsigned int*					mColorTable;
	uchar*					mColorIndices;
	
	bool					mForcedMode;
	bool					mHasTrans;
	bool					mHasAlpha;
	bool					mIsVolatile;
	bool					mPurgeBits;
	bool					mWantPal;
	
	unsigned int*					mNativeAlphaData;
	uchar*					mRLAlphaData;
	uchar*					mRLAdditiveData;	

	bool					mBitsChanged;
	SexyAppBase*			mApp;
	std::array<std::unique_ptr<MemoryImage, ImageDeleter>,3> mFilterImages{};
	MemoryImage* mFilterOwner = nullptr;
	std::unique_ptr<ImageLib::Image> mPendingDecoded;
	
private:
	void					Init();
	void NotifyMaintenance(ImageMaintenanceOperation operation)
	{
		if (mMaintenanceHook != nullptr)
			mMaintenanceHook(*this, operation);
	}

public:
	void*			GetNativeAlphaData(NativeDisplay *theNative);
	uchar*			GetRLAlphaData();
	uchar*			GetRLAdditiveData(NativeDisplay *theNative);
	void			PurgeBits();
	void			DeleteSWBuffers();
	void			Delete3DBuffers();
	void			DeleteExtraBuffers();
	void			ReInit();

	void			BitsChanged();
	void			CommitBits();
	
	void			DeleteNativeData();

	void					NormalBlt(MemoryImage* theImage, int theX, int theY, const Rect& theSrcRect, const Color& theColor);
	void					AdditiveBlt(MemoryImage* theImage, int theX, int theY, const Rect& theSrcRect, const Color& theColor);

	void					NormalDrawLine(double theStartX, double theStartY, double theEndX, double theEndY, const Color& theColor);
	void					AdditiveDrawLine(double theStartX, double theStartY, double theEndX, double theEndY, const Color& theColor);

	void					NormalDrawLineAA(double theStartX, double theStartY, double theEndX, double theEndY, const Color& theColor);
	/*void					AdditiveDrawLineAA(double theStartX, double theStartY, double theEndX, double theEndY, const Color& theColor);*/

	void					SlowStretchBlt(MemoryImage* theImage, const Rect& theDestRect, const FRect& theSrcRect, const Color& theColor, int theDrawMode);
	void					FastStretchBlt(MemoryImage* theImage, const Rect& theDestRect, const FRect& theSrcRect, const Color& theColor, int theDrawMode);
	bool					BltRotatedClipHelper(float &theX, float &theY, const Rect &theSrcRect, const Rect &theClipRect, double theRot, FRect &theDestRect, float theRotCenterX, float theRotCenterY);
	bool					StretchBltClipHelper(const Rect &theSrcRect, const Rect &theClipRect, const Rect &theDestRect, FRect &theSrcRectOut, Rect &theDestRectOut);
	bool					StretchBltMirrorClipHelper(const Rect &theSrcRect, const Rect &theClipRect, const Rect &theDestRect, FRect &theSrcRectOut, Rect &theDestRectOut);
	void					BltMatrixHelper(MemoryImage* theImage, float x, float y, const SexyMatrix3 &theMatrix, const Rect& theClipRect, const Color& theColor, int theDrawMode, const Rect &theSrcRect, void *theSurface, int theBytePitch, int thePixelFormat, bool blend);
	void					BltTrianglesTexHelper(MemoryImage* theTexture, const TriVertex theVertices[][3], int theNumTriangles, const Rect &theClipRect, const Color &theColor, int theDrawMode, void *theSurface, int theBytePitch, int thePixelFormat, float tx, float ty, bool blend);

	void					FillScanLinesWithCoverage(Span* theSpans, int theSpanCount, const Color& theColor, int theDrawMode, const BYTE* theCoverage, int theCoverX, int theCoverY, int theCoverWidth, int theCoverHeight);


public:
	MemoryImage();
	MemoryImage(SexyAppBase* theApp);
	MemoryImage(const MemoryImage& theMemoryImage);
	MemoryImage& operator=(const MemoryImage& theMemoryImage) = delete;
	~MemoryImage();

	void			Clear();
	void			SetBits(unsigned int* theBits, int theWidth, int theHeight, bool commitBits = true);
	void AdoptDecodedImage(std::unique_ptr<ImageLib::Image> image,bool commitBits);
	void AppendAlphaImage(std::unique_ptr<ImageLib::Image> image,int columns,int rows);
	void			Create(int theWidth, int theHeight);
	unsigned int*			GetBits();
	
	void			FillRect(const Rect& theRect, const Color& theColor, int theDrawMode);
	void			ClearRect(const Rect& theRect);
	void			DrawLine(double theStartX, double theStartY, double theEndX, double theEndY, const Color& theColor, int theDrawMode);
	void			DrawLineAA(double theStartX, double theStartY, double theEndX, double theEndY, const Color& theColor, int theDrawMode);

	void			Blt(MemoryImage* theImage, int theX, int theY, const Rect& theSrcRect, const Color& theColor, int theDrawMode);
	void			BltF(MemoryImage* theImage, float theX, float theY, const Rect& theSrcRect, const Rect &theClipRect, const Color& theColor, int theDrawMode);
	void			BltRotated(MemoryImage* theImage, float theX, float theY, const Rect &theSrcRect, const Rect& theClipRect, const Color& theColor, int theDrawMode, double theRot, float theRotCenterX, float theRotCenterY);
	void			StretchBlt(MemoryImage* theImage, const Rect& theDestRect, const Rect& theSrcRect, const Rect& theClipRect, const Color& theColor, int theDrawMode, bool fastStretch);
	void			BltMatrix(MemoryImage* theImage, float x, float y, const SexyMatrix3 &theMatrix, const Rect& theClipRect, const Color& theColor, int theDrawMode, const Rect &theSrcRect, bool blend);
	void			BltTrianglesTex(MemoryImage* theTexture, const TriVertex theVertices[][3], int theNumTriangles, const Rect& theClipRect, const Color &theColor, int theDrawMode, float tx, float ty, bool blend);


	bool			Palletize();
};

}
