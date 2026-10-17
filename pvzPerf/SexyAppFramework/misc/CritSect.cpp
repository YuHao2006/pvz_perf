#pragma warning( disable : 4786 )

#include "CritSect.h"

using namespace Sexy;

////////////////////////////////////////////////////////////////////////////////

CritSect::CritSect(void)
{
#ifdef _WIN32
	InitializeCriticalSection(&mCriticalSection);
#endif
}

////////////////////////////////////////////////////////////////////////////////

CritSect::~CritSect(void)
{
#ifdef _WIN32
	DeleteCriticalSection(&mCriticalSection);
#endif
}
