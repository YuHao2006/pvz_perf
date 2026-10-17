#pragma once
#include <cstdint>

#include "ConstEnums.h"

constexpr const int CAUSTIC_IMAGE_WIDTH = 128;
constexpr const int CAUSTIC_IMAGE_HEIGHT = 64;

namespace Sexy
{
	class MemoryImage;
	class Graphics;
};

class LawnApp;
class PoolEffect
{
public:
	// Legacy smoke-test inspection field; GPU-only production keeps it null.
	Sexy::MemoryImage*	mCausticImage = nullptr;
	LawnApp*			mApp = nullptr;
	uint32_t			mPoolCounter = 0;
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
	void				PoolEffectUpdate();
};
