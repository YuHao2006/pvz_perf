#pragma once
#include "Common.h"

namespace Sexy
{

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
class NativeDisplay
{
public:
	int						mRGBBits;
	unsigned int					mRedMask;
	unsigned int					mGreenMask;
	unsigned int					mBlueMask;
	int						mRedBits;
	int						mGreenBits;
	int						mBlueBits;
	int						mRedShift;
	int						mGreenShift;
	int						mBlueShift;

public:
	NativeDisplay();
	virtual ~NativeDisplay();
};

};

