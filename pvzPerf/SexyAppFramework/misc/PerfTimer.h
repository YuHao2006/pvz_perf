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

} // namespace Sexy
