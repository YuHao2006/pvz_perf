#include "graphics/FontWeights.h"

#include <cstdint>
#include <cstdlib>
#include <iostream>

namespace {

// Scalar transcription of game_font_cs.comp, kept separate from table building.
struct Axis {
    int first, last;
    unsigned int firstWeight, lastWeight;
    bool shrinking;
    double factor;
    int outputIndex;
    unsigned int unit;
};

Axis axis(int inputExtent, int outputExtent, int outputIndex, int start,
    int physicalExtent, unsigned int unit)
{
    Axis result{};
    result.shrinking = inputExtent >= outputExtent;
    result.outputIndex = outputIndex + 1;
    result.unit = unit;
    if (result.shrinking) {
        double factor = double(outputExtent) / double(inputExtent);
        result.factor = factor;
        result.first = std::max(0, int(std::floor(double(outputIndex) / factor)) - 1);
        result.last = std::min(inputExtent - 1, int(std::ceil(double(outputIndex + 1) / factor)) + 1);
        result.firstWeight = result.lastWeight = 0u;
    } else {
        double factor = double(inputExtent - 1) / double(outputExtent - 1);
        double coordinate = double(outputIndex) * factor;
        if (unit == 257u) coordinate += double(start);
        const int base = int(coordinate);
        double fraction = coordinate - double(base);
        result.first = base - (unit == 257u ? start : 0);
        result.last = unit == 257u ? std::min(result.first + 1, physicalExtent - 1 - start) :
            std::min(result.first + 1, inputExtent - 1);
        result.firstWeight = static_cast<unsigned int>(double(unit) * (1.0 - fraction));
        result.lastWeight = unit - result.firstWeight;
        result.factor = 0.0;
    }
    return result;
}

unsigned int weight(Axis value, int index)
{
    if (!value.shrinking)
        return (index == value.first ? value.firstWeight : 0u) +
            (index == value.last ? value.lastWeight : 0u);
    double begin = double(index) * value.factor + 1.0;
    double end = begin + value.factor;
    const int a = int(begin), b = int(end);
    if (a == b)
        return a == value.outputIndex ?
            static_cast<unsigned int>(double(value.unit) * value.factor) : 0u;
    return (a == value.outputIndex ?
        static_cast<unsigned int>(double(value.unit) * (double(b) - begin)) : 0u) +
        (b == value.outputIndex ?
        static_cast<unsigned int>(double(value.unit) * (end - double(b))) : 0u);
}

void require(bool condition)
{
    if (!condition) {
        std::cerr << "OpenGLFontWeightsTests failed\n";
        std::exit(1);
    }
}

int decode(unsigned int bits)
{
    return bits <= 0x7fffffffu ? int(bits) : -1 - int(~bits);
}

void compare(int input, int output, int start, int physical, unsigned int unit)
{
    const auto table = Sexy::BuildFontAxisWeights(input, output, start, physical, unit);
    require(table.offsets.size() == static_cast<std::size_t>(output) + 1);
    require(table.offsets.front() == 0u && table.offsets.back() == table.taps.size());
    for (int p = 0; p < output; ++p) {
        const Axis reference = axis(input, output, p, start, physical, unit);
        unsigned int cursor = table.offsets[p];
        for (int index = reference.first; index <= reference.last; ++index) {
            const unsigned int expected = weight(reference, index);
            if (expected == 0u) continue;
            require(cursor < table.offsets[p + 1]);
            const auto tap = table.taps[cursor++];
            require(tap.index == static_cast<unsigned int>(index));
            require(decode(tap.index) == index && tap.weight == expected);
        }
        require(cursor == table.offsets[p + 1]);
    }
}

}

int main()
{
    require(decode(static_cast<unsigned int>(-1)) == -1);
    require(decode(0x80000000u) == (-2147483647 - 1));
    require(decode(0x7fffffffu) == 2147483647);
    for (int input = 1; input <= 48; ++input)
        for (int output = 1; output <= 64; ++output)
            for (int start : {0, 1, 7, 1000000})
                for (int padding : {0, 3})
                    for (unsigned int unit : {256u, 257u})
                        compare(input, output, start, start + input + padding, unit);
    for (int input : {127, 255, 256, 257, 511})
        for (int output : {1, 3, 127, 256, 513})
            for (unsigned int unit : {256u, 257u})
                compare(input, output, 13, 13 + input, unit);

    const auto singleton = Sexy::BuildFontAxisWeights(1, 3, 4, 5, 257u);
    require(singleton.taps.size() == 3);
    for (const auto tap : singleton.taps)
        require(tap.index == 0u && tap.weight == 257u);
    const auto identity = Sexy::BuildFontAxisWeights(3, 3, 0, 3, 257u);
    require(identity.taps.size() == 3);
    for (unsigned int i = 0; i < 3u; ++i)
        require(identity.taps[i].index == i && identity.taps[i].weight == 257u);
    const auto invalid = Sexy::BuildFontAxisWeights(0, 3, 0, 0, 257u);
    require(invalid.offsets == std::vector<unsigned int>({0u, 0u, 0u, 0u}));
    require(invalid.taps.empty());
    const auto empty = Sexy::BuildFontAxisWeights(3, 0, 0, 3, 257u);
    require(empty.offsets == std::vector<unsigned int>({0u}) && empty.taps.empty());
    std::cout << "OpenGLFontWeightsTests passed (double reference, endpoints, tap order, signed indices)\n";
}
