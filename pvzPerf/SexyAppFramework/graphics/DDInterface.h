#pragma once
#include "Common.h"
#include "misc/CritSect.h"
#include "NativeDisplay.h"
#include "SexyAppFramework/platform/NativeHandles.h"
#include "misc/Rect.h"
#include "misc/Ratio.h"
#include <cstdint>
#include <exception>

namespace Sexy
{

enum class NativeDisplayOperation : std::uint8_t
{
	PrepareScreenMode,
	ResizePreparedPresent,
	PresentRetainedFrame
};

class NativeDisplayError final : public std::exception
{
public:
	const NativeDisplayOperation operation;
	const int result;

	NativeDisplayError(NativeDisplayOperation theOperation, int theResult) noexcept
		: operation(theOperation), result(theResult)
	{
	}
};

class SexyAppBase;
class DDImage;
class Image;
class MemoryImage;
class RenderInterface;

typedef std::set<DDImage*> DDImageSet;

// Native display: owns the screen image, presentation geometry,
// refresh rate and cursor state, and forwards all drawing to the Vulkan
// renderer through RenderInterface. No compatibility layer, no surfaces.
class DDInterface : public NativeDisplay
{
public:
	enum
	{
		RESULT_OK					= 0,
		RESULT_FAIL					= 1,
		RESULT_DD_CREATE_FAIL		= 2,
		RESULT_SURFACE_FAIL			= 3,
		RESULT_EXCLUSIVE_FAIL		= 4,
		RESULT_DISPCHANGE_FAIL		= 5,
		RESULT_INVALID_COLORDEPTH	= 6,
		RESULT_3D_FAIL				= 7,
        RESULT_DEFERRED              = 8 // No drawable WSI extent yet; retry later.
	};

	SexyAppBase*			mApp;
	RenderInterface*			mRenderInterface;
	bool					mIs3D;

	CritSect				mCritSect;
	bool					mInRedraw;
	int						mWidth;
	int						mHeight;
	Ratio					mAspect;
	int						mDesktopWidth;
	int						mDesktopHeight;
	Ratio					mDesktopAspect;
	bool					mIsWidescreen;
	int						mDisplayWidth;
	int						mDisplayHeight;
	Ratio					mDisplayAspect;

		Rect					mPresentationRect;
		// The rectangle that actually shows game pixels inside mPresentationRect.
		// Without custom scale this is the original 4:3 letterbox fit. With custom
		// scale it is the pipeline output placed 1:1 and centered (smaller than
		// the screen leaves black bars; larger than the screen has a negative
		// origin and only the overlapping region is visible).
		Rect					mVisibleGameRect;
	int						mFullscreenBits;
	DWORD					mRefreshRate;
	DWORD					mMillisecondsPerFrame;
	int						mScanLineFailCount;

	int*					mRedAddTable;
	int*					mGreenAddTable;
	int*					mBlueAddTable;

	unsigned int					mRedConvTable[256];
	unsigned int					mGreenConvTable[256];
	unsigned int					mBlueConvTable[256];

	bool					mInitialized;
	NativeWindowHandle		mHWnd;
	bool					mIsWindowed;
	DDImage*				mScreenImage;
	DDImageSet				mDDImageSet;
	bool					mVideoOnlyDraw;
	unsigned int					mInitCount;

	int						mCursorWidth;
	int						mCursorHeight;
	int						mNextCursorX;
	int						mNextCursorY;
	int						mCursorX;
	int						mCursorY;
	Image*					mCursorImage;
	bool					mHasOldCursorArea;

public:
	unsigned int					GetColorRef(unsigned int theRGB);
	void					AddDDImage(DDImage* theDDImage);
	void					RemoveDDImage(DDImage* theDDImage);
	void					Remove3DData(MemoryImage* theImage);

	void					Cleanup();

public:
	DDInterface(SexyAppBase* theApp);
	virtual ~DDInterface();

	bool					SetCursorImage(Image* theImage);
	bool					Redraw(Rect* theClipRect);
	void					RemapMouse(int& theX, int& theY);
		int						Init(NativeWindowHandle theWindow, bool IsWindowed);
            // Prepare window mode, then commit geometry only after native WSI
            // recreation succeeds. DEFERRED preserves the last usable geometry.
			int						PrepareScreenMode(NativeWindowHandle theWindow, bool wantWindowed);
			int						ResizePreparedPresent();
			void					UpdateVisibleGameRect();

};

}
