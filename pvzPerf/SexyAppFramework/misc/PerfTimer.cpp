#include "PerfTimer.h"
#include <set>
#include <format>
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
// Profiler samples use QPC, not RDTSC. Its frequency is supplied by Windows;
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

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
namespace
{
struct PerfInfo
{
	PerfKind mKind;
	mutable long long mStartTime;
	mutable long long mDuration;
	mutable double mMillisecondDuration;
	mutable double mLongestCall;
	mutable int mStartCount;
	mutable int mCallCount;

	PerfInfo(PerfKind theKind) : mKind(theKind), mStartTime(0), mDuration(0), mLongestCall(0), mStartCount(0), mCallCount(0) { }

	bool operator<(const PerfInfo &theInfo) const { return mKind < theInfo.mKind; }
};

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
typedef std::set<PerfInfo> PerfInfoSet;
static PerfInfoSet gPerfInfoSet;
static long long gStartTime;
static long long gCollateTime;
double gDuration = 0;
int gStartCount = 0;
int gPerfRecordTop = 0;

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
struct PerfRecord
{
	PerfKind mKind = PerfKind::Unknown;
	long long mTime;
	bool mStart;

	PerfRecord() { }
	PerfRecord(PerfKind theKind, bool start) : mKind(theKind), mStart(start) { QueryCounters(&mTime); }
};
typedef std::vector<PerfRecord> PerfRecordVector;
PerfRecordVector gPerfRecordVector;
}  // namespace

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
static inline void InsertPerfRecord(PerfRecord &theRecord)
{
	if(theRecord.mStart)
	{
		PerfInfoSet::iterator anItr = gPerfInfoSet.insert(PerfInfo(theRecord.mKind)).first;
		anItr->mCallCount++;

		if ( ++anItr->mStartCount == 1)
			anItr->mStartTime = theRecord.mTime;
	}
	else
	{
		PerfInfoSet::iterator anItr = gPerfInfoSet.find(theRecord.mKind);
		if(anItr != gPerfInfoSet.end())
		{
			if( --anItr->mStartCount == 0)
			{
				long long aDuration = theRecord.mTime - anItr->mStartTime;
				anItr->mDuration += aDuration;

				if (aDuration > anItr->mLongestCall)
					anItr->mLongestCall = (double)aDuration;
			}
		}
	}
}


///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
static inline void CollatePerfRecords()
{
	long long aTime1,aTime2;
	QueryCounters(&aTime1);

	for(int i=0; i<gPerfRecordTop; i++)
		InsertPerfRecord(gPerfRecordVector[i]);

	gPerfRecordTop = 0;
	QueryCounters(&aTime2);

	gCollateTime += aTime2-aTime1;
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
static inline void PushPerfRecord(PerfRecord theRecord)
{
	if(gPerfRecordTop >= (int)gPerfRecordVector.size())
		gPerfRecordVector.push_back(theRecord);
	else
		gPerfRecordVector[gPerfRecordTop] = theRecord;

	++gPerfRecordTop;
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
void SexyPerf::BeginPerf(bool measurePerfOverhead)
{
	gPerfInfoSet.clear();
	gPerfRecordTop = 0;
	gStartCount = 0;
	gCollateTime = 0;

	SexyPerf::sPerfOn = !measurePerfOverhead;
	
	QueryCounters(&gStartTime);
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
void SexyPerf::EndPerf()
{
	long long anEndTime;
	QueryCounters(&anEndTime);
	const long long aCollateTimeWithinMeasurement = gCollateTime;

	CollatePerfRecords();

	SexyPerf::sPerfOn = false;

	const long long aFreq = PerfTimer::GetCounterFrequency();

	// The final collation happens AFTER anEndTime. Do not subtract its cost
	// from a measurement interval that never included that work.
	gDuration = ((double)(anEndTime - gStartTime - aCollateTimeWithinMeasurement))*1000/aFreq;

	for (PerfInfoSet::iterator anItr = gPerfInfoSet.begin(); anItr != gPerfInfoSet.end(); ++anItr)
	{
		const PerfInfo &anInfo = *anItr;
		anInfo.mMillisecondDuration = (double)anInfo.mDuration*1000/aFreq;
		anInfo.mLongestCall = anInfo.mLongestCall*1000/aFreq;
	}
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
void SexyPerf::StartTiming(PerfKind theKind)
{
	if(SexyPerf::sPerfOn)
	{
		++gStartCount;
		PushPerfRecord(PerfRecord(theKind,true));
	}
}

	
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
void SexyPerf::StopTiming(PerfKind theKind)
{
	if(SexyPerf::sPerfOn)
	{
		PushPerfRecord(PerfRecord(theKind,false));
		if(--gStartCount==0)
			CollatePerfRecords();
	}
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
std::string SexyPerf::GetResults()
{
	std::string aResult = std::format("Total Time: {:.2f}\n", gDuration);
	for (PerfInfoSet::iterator anItr = gPerfInfoSet.begin(); anItr != gPerfInfoSet.end(); ++anItr)
	{
		const PerfInfo &anInfo = *anItr;
		const double aPercent = gDuration == 0.0 ? 0.0 : anInfo.mMillisecondDuration/gDuration*100;
		aResult += std::format("{} ({} calls, %{:.2f} time): {:.2f} ({:.2f} avg, {:.2f} longest)\n",
			static_cast<unsigned int>(anInfo.mKind), anInfo.mCallCount, aPercent, anInfo.mMillisecondDuration,
			anInfo.mMillisecondDuration/anInfo.mCallCount, anInfo.mLongestCall);
	}


	return aResult;
}

