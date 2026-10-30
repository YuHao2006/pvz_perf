#pragma once
#include <cstdint>

#include "ConstEnums.h"

constexpr const int CAUSTIC_IMAGE_WIDTH = 128;
constexpr const int CAUSTIC_IMAGE_HEIGHT = 64;

namespace Sexy
{
	class Image;
	class Graphics;
};

class LawnApp;
class PoolEffect
{
public:
	Sexy::Image*	mCausticImage = nullptr;
	LawnApp*			mApp = nullptr;
	long long mBirthTimeNs = 0;
    // Timestamp of the published visual sample. Draws reuse it while frozen;
    // gaps between owners/updates shift birth instead of advancing the phase.
    long long mSampleTimeNs = 0;
	// Installation state only; unavailable GPU compute is an error.
	bool				mCausticGPU = false;

public:
	PoolEffect() = default;
	~PoolEffect();
	PoolEffect(const PoolEffect&) = delete;
	PoolEffect& operator=(const PoolEffect&) = delete;
	void				PoolEffectInitialize();
	void				PoolEffectDispose();
	void				PoolEffectDraw(Sexy::Graphics* g, bool theIsNight);
	void				PoolEffectUpdate(long long nowNs, unsigned long long activeElapsedNs);
};
