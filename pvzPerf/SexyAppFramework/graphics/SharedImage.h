#pragma once
#include "Common.h"
#include <atomic>
#include <future>
#include <thread>

namespace Sexy
{

class Image;
class DDImage;
class MemoryImage;

class SharedImage
{
public:
	DDImage*				mImage;
	std::atomic<int>		mRefCount;
	// Protected by the cache map lock. A valid future denotes loading or a
	// recorded failure; successful entries drop this allocation after publish.
	std::shared_future<void> mLoadReady;
	std::thread::id mLoaderThread;

	SharedImage();
};

	typedef std::map<std::pair<std::string, unsigned>, SharedImage> SharedImageMap;

class SharedImageRef
{
    // Shared cache entries are counted. Copies of a raw image remain borrowed
    // views; they never copy its ownership bit. Rebinding to the current image
    // is a no-op so it cannot discard the lifetime that keeps that image alive.
public:
	SharedImage*			mSharedImage;
	MemoryImage*			mUnsharedImage;
	bool					mOwnsUnshared;

public:
	SharedImageRef();
	SharedImageRef(const SharedImageRef& theSharedImageRef);
	SharedImageRef(SharedImage* theSharedImage);
	~SharedImageRef();

	void					Release();

	SharedImageRef&			operator=(const SharedImageRef& theSharedImageRef);
	SharedImageRef&			operator=(SharedImage* theSharedImage);
	SharedImageRef&			operator=(MemoryImage* theUnsharedImage);
	MemoryImage*			operator->();
	operator Image*();
	operator MemoryImage*();
	operator DDImage*();
};

}

