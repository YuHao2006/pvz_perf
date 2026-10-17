#pragma once
#include "Common.h"

namespace Sexy
{

bool Quantize8Bit(const unsigned int* theSrcBits, int theWidth, int theHeight, uchar* theDestColorIndices, unsigned int* theDestColorTable);

}
