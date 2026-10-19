#pragma once

#include <algorithm>
#include <cmath>
#include <limits>
#include <vector>

namespace Sexy {

struct FontAxisTap {
    unsigned int index;
    unsigned int weight;
};

struct FontAxisWeights {
    std::vector<unsigned int> offsets;
    std::vector<FontAxisTap> taps;
};

// offsets has outputExtent + 1 entries. Upload each adjacent pair as
// (offset, nextOffset - offset) to the corresponding RG32UI ranges texel.
// Tap indices are relative to glyphSrc, encoded modulo 2^32, including
// negative indices. FontFragmentShader decodes them without an out-of-range
// unsigned-to-signed conversion. Keep double expressions in source order.
inline FontAxisWeights BuildFontAxisWeights(
    int inputExtent, int outputExtent, int start, int physicalExtent,
    unsigned int unit)
{
    static_assert(std::numeric_limits<unsigned int>::digits == 32);
    FontAxisWeights result;
    result.offsets.push_back(0u);
    if (outputExtent <= 0)
        return result;
    for (int outputIndex = 0; outputIndex < outputExtent; ++outputIndex) {
        if (inputExtent > 0 && physicalExtent > 0) {
            const bool shrinking = inputExtent >= outputExtent;
            int first, last;
            unsigned int firstWeight = 0u, lastWeight = 0u;
            double factor = 0.0;
            if (shrinking) {
                factor = double(outputExtent) / double(inputExtent);
                first = std::max(0, int(std::floor(double(outputIndex) / factor)) - 1);
                last = std::min(inputExtent - 1,
                    int(std::ceil(double(outputIndex + 1) / factor)) + 1);
            } else {
                factor = double(inputExtent - 1) / double(outputExtent - 1);
                double coordinate = double(outputIndex) * factor;
                if (unit == 257u)
                    coordinate += double(start);
                const int base = int(coordinate);
                const double fraction = coordinate - double(base);
                first = base - (unit == 257u ? start : 0);
                last = unit == 257u ? std::min(first + 1, physicalExtent - 1 - start) :
                    std::min(first + 1, inputExtent - 1);
                firstWeight = static_cast<unsigned int>(double(unit) * (1.0 - fraction));
                lastWeight = unit - firstWeight;
            }
            for (int index = first; index <= last; ++index) {
                unsigned int weight;
                if (!shrinking) {
                    weight = (index == first ? firstWeight : 0u) +
                        (index == last ? lastWeight : 0u);
                } else {
                    const double begin = double(index) * factor + 1.0;
                    const double end = begin + factor;
                    const int a = int(begin), b = int(end);
                    if (a == b) {
                        weight = a == outputIndex + 1 ?
                            static_cast<unsigned int>(double(unit) * factor) : 0u;
                    } else {
                        weight = (a == outputIndex + 1 ?
                            static_cast<unsigned int>(double(unit) * (double(b) - begin)) : 0u) +
                            (b == outputIndex + 1 ?
                            static_cast<unsigned int>(double(unit) * (end - double(b))) : 0u);
                    }
                }
                if (weight != 0u)
                    result.taps.push_back({static_cast<unsigned int>(index), weight});
            }
        }
        result.offsets.push_back(static_cast<unsigned int>(result.taps.size()));
    }
    return result;
}

}
