#pragma once

#ifdef _WIN32
#include <windows.h>

// Monotonic tick, 32-bit, ms-since-boot *magnitude* (so it can be mixed with
// GetTickCount / timeGetTime in unsigned-difference timing). Unlike
// timeGetTime it does not touch winmm's one-time initialization (which can
// deadlock the main loop on modern Windows -- confirmed on this Win11 box) and
// unlike GetTickCount it is high resolution. On this system GetTickCount only
// ticks at ~15.6 ms granularity even with timeBeginPeriod(1), which quantized
// the game's 100 Hz frame pacing down to ~64 FPS. This implementation reads
// QueryPerformanceCounter directly: sub-millisecond resolution, monotonic, no
// winmm run-once, still wrap-friendly and boot-aligned for mixed deltas.
inline DWORD SexyGetTickCount()
{
	static const LARGE_INTEGER sFreq = []
	{
		LARGE_INTEGER f;
		QueryPerformanceFrequency(&f);
		return f;
	}();
	static const LARGE_INTEGER sOrigin = []
	{
		LARGE_INTEGER c;
		QueryPerformanceCounter(&c);
		return c;
	}();
	static const DWORD sTickBase = ::GetTickCount();

	LARGE_INTEGER now;
	QueryPerformanceCounter(&now);
	const __int64 aDeltaUs =
		(now.QuadPart - sOrigin.QuadPart) * 1000000LL / sFreq.QuadPart;
	return (DWORD)(sTickBase + aDeltaUs / 1000LL);
}
#else
#include <time.h>
inline unsigned int SexyGetTickCount()
{
	timespec now{};
	clock_gettime(CLOCK_MONOTONIC, &now);
	return static_cast<unsigned int>(
		static_cast<unsigned long long>(now.tv_sec) * 1000 + now.tv_nsec / 1000000);
}
static_assert(sizeof(unsigned int) == 4);
static_assert(sizeof(unsigned long long) == 8);
#endif
