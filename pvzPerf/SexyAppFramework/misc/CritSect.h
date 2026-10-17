#pragma once
#include "Common.h"
#ifndef _WIN32
#include <mutex>
#endif

class CritSync;

namespace Sexy
{

class CritSect 
{
private:
#ifdef _WIN32
	CRITICAL_SECTION mCriticalSection;
#else
	mutable std::recursive_mutex mCriticalSection;
#endif
	friend class AutoCrit;

public:
	CritSect(void);
	~CritSect(void);
};

}

