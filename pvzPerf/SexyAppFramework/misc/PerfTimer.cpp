#include "PerfTimer.h"
#include <stdexcept>
#include <chrono>

using namespace Sexy;

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
namespace
{
inline int QueryCounters(long long *lpPerformanceCount)
{
	if (lpPerformanceCount == nullptr)
		return 0;
#ifdef _WIN32
	LARGE_INTEGER aCounter;
	if (!QueryPerformanceCounter(&aCounter))
	{
		*lpPerformanceCount = 0;
		return 0;
	}
	*lpPerformanceCount = aCounter.QuadPart;
#else
	*lpPerformanceCount = std::chrono::duration_cast<std::chrono::nanoseconds>(
		std::chrono::steady_clock::now().time_since_epoch()).count();
#endif
	return 1;
	// The old implementation used a 32-bit TSC stub here.
	// returns TSC only
	/*
	asm (
		"mov ebx, dword ptr [lpPerformanceCount]"
		"rdtsc"
		"	mov dword ptr [ebx], eax"
		"	mov dword ptr [ebx+4], edx"
	);
	return 1;
	*/
}
}  // namespace

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
// Timer samples use QPC, not RDTSC. Its frequency is supplied by Windows;
// estimating it by spinning for 10 ms introduces delay and scheduler error.
long long PerfTimer::GetCounterFrequency()
{
#ifdef _WIN32
	static const long long aFrequency = [] {
		LARGE_INTEGER aValue{};
		if (!QueryPerformanceFrequency(&aValue) || aValue.QuadPart <= 0)
			throw std::runtime_error("QueryPerformanceFrequency failed for performance diagnostics");
		return aValue.QuadPart;
	}();
	return aFrequency;
#else
	return 1000000000;
#endif
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
PerfTimer::PerfTimer()
{
	mDuration = 0;
	mStart = 0;
	mRunning = false;
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
void PerfTimer::CalcDuration()
{
	long long end;
	QueryCounters(&end);
	mDuration = (end - mStart) * 1000.0 / GetCounterFrequency();
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
void PerfTimer::Start()
{
	mRunning = true;
	QueryCounters(&mStart);
}

// 1073 0043ACD0: move the QPC origin back by the elapsed milliseconds.
void PerfTimer::SetStartTime(int theTimeMillisecondsAgo)
{
	QueryCounters(&mStart);
	mStart -= theTimeMillisecondsAgo * GetCounterFrequency() / 1000;
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
void PerfTimer::Stop()
{
	if(mRunning)
	{
		CalcDuration();
		mRunning = false;
	}
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
double PerfTimer::GetDuration()
{
	if(mRunning)
		CalcDuration();

	return mDuration;
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
long long PerfTimer::GetCPUSpeed()
{
	return GetCounterFrequency();
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
int PerfTimer::GetCPUSpeedMHz()
{
	return (int)(GetCounterFrequency()/1000000);
}
