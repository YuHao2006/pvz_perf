#pragma once

#include "Common.h"

namespace Sexy
{

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
class PerfTimer 
{
protected:
	long long mStart;
	double mDuration;
	bool mRunning;

	void CalcDuration();

public:
	PerfTimer();
	void Start();
	void Stop();
	// Rebase elapsed time without changing the running/stopped state.
	void SetStartTime(int theTimeMillisecondsAgo);

	double GetDuration();

	static long long GetCounterFrequency(); // Counter ticks per second, not CPU cycles.
	// Retain the diagnostic API names; both now refer to the same QPC clock.
	static long long GetCPUSpeed();
	static int GetCPUSpeedMHz(); 
};

enum class PerfKind : unsigned int
{
	Unknown = 0,
	SexyAppBaseDoUpdateFrames = 1,
	SexyAppBaseRedraw = 2,
	SexyAppBaseDrawDirtyStuff = 3,
	WidgetManagerDrawScreen = 4,
	WidgetManagerUpdateFrame = 5,
	ResourceManagerAlphaGetImage = 6,
	ResourceManagerGetImage = 7,
	ResourceManagerDDSurface = 8,
	ResourceManagerPalletize = 9,
	ResourceManagerLoadSound = 10,
	ResourceManagerDoLoadFont = 11
};

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
class SexyPerf
{
public:
	static void BeginPerf(bool measurePerfOverhead = false);
	static void EndPerf();
	inline static bool sPerfOn = false;

	static void StartTiming(PerfKind theKind);
	static void StopTiming(PerfKind theKind);

	static std::string GetResults();
};

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
class SexyAutoPerf
{
public:
	PerfKind mKind;
	bool mIsStarted;

	SexyAutoPerf(PerfKind theKind) : mKind(theKind), mIsStarted(true) { SexyPerf::StartTiming(theKind); }
	SexyAutoPerf(PerfKind theKind, bool doStart) : mKind(theKind), mIsStarted(doStart)
	{ 
		if(doStart) 
			SexyPerf::StartTiming(theKind);
	}

	~SexyAutoPerf() { Stop(); }

	void Start()
	{
		if(!mIsStarted)
		{
			mIsStarted = true;
			SexyPerf::StartTiming(mKind);
		}
	}

	void Stop() 
	{ 
		if(mIsStarted) 
		{ 
			SexyPerf::StopTiming(mKind);
			mIsStarted = false;
		}
	}
};

} // namespace Sexy

#pragma warning(push)
#pragma warning(disable:4005)

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
//#define SEXY_PERF_ENABLED
#if defined(SEXY_PERF_ENABLED) && !defined(RELEASEFINAL)

#define SEXY_PERF_BEGIN(theKind) SexyPerf::StartTiming(theKind)
#define SEXY_PERF_END(theKind) SexyPerf::StopTiming(theKind)
#define SEXY_AUTO_PERF_MULTI(theKind,theSuffix) SexyAutoPerf anAutoPerf##theSuffix(theKind)
#define SEXY_AUTO_PERF_2(theKind,theSuffix) SEXY_AUTO_PERF_MULTI(theKind,theSuffix)
#define SEXY_AUTO_PERFL(theKind) SEXY_AUTO_PERF_2(theKind,__LINE__) // __LINE__ doesn't work correctly if Edit-and-Continue (/ZI) is enabled
#define SEXY_AUTO_PERF(theKind) SEXY_AUTO_PERF_2(theKind,UNIQUE)

#define SEXY_PERF_BEGIN_COND(theKind,theCond) if(theCond) SexyPerf::StartTiming(theKind)
#define SEXY_PERF_END_COND(theKind,theCond) if(theCond) SexyPerf::StopTiming(theKind)
#define SEXY_AUTO_PERF_MULTI_COND(theKind,theSuffix,theCond) SexyAutoPerf anAutoPerf##theSuffix(theKind,theCond);
#define SEXY_AUTO_PERF_COND_2(theKind,theSuffix,theCond) SEXY_AUTO_PERF_MULTI_COND(theKind,theSuffix,theCond);
#define SEXY_AUTO_PERF_CONDL(theKind) SEXY_AUTO_PERF_COND_2(theKind,__LINE__,theCond)
#define SEXY_AUTO_PERF_COND(theKind) SEXY_AUTO_PERF_COND_2(theKind,UNIQUE,theCond)

#else

#define SEXY_PERF_BEGIN(theKind)
#define SEXY_PERF_END(theKind)
#define SEXY_AUTO_PERF_MULTI(theKind,theSuffix)
#define SEXY_AUTO_PERF(theKind)

#define SEXY_PERF_BEGIN_COND(theKind,theCond)
#define SEXY_PERF_END_COND(theKind,theCond)
#define SEXY_AUTO_PERF_MULTI_COND(theKind,theSuffix,theCond)
#define SEXY_AUTO_PERF_COND(theKind)

#endif

#pragma warning(pop)
