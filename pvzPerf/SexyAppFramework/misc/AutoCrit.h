#pragma once
#include "Common.h"
#include "CritSect.h"

namespace Sexy
{

class AutoCrit
{
#ifdef _WIN32
	LPCRITICAL_SECTION		mCritSec;
public:
	AutoCrit(LPCRITICAL_SECTION theCritSec) : 
		mCritSec(theCritSec)
	{ 
		EnterCriticalSection(mCritSec); 
	}

	AutoCrit(const CritSect& theCritSect) : 
		mCritSec((LPCRITICAL_SECTION) &theCritSect.mCriticalSection)
	{ 
		EnterCriticalSection(mCritSec); 
	}

	~AutoCrit()
	{ 
		LeaveCriticalSection(mCritSec); 
	}
#else
	std::lock_guard<std::recursive_mutex> mLock;
public:
	explicit AutoCrit(const CritSect& section) : mLock(section.mCriticalSection) {}
#endif
	AutoCrit(const AutoCrit&) = delete;
	AutoCrit& operator=(const AutoCrit&) = delete;
};

}
