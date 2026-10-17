#pragma once
#include <cstddef>
#include <stdexcept>

namespace Sexy { int Rand(int range); }

// Preserve element type and array extent. In x64, an enum array must not be
// reinterpreted as intptr_t: that doubles the stride from 4 to 8 bytes.
// Exactly one original bounded RNG call, no rejection/reselection.
template<class T, std::size_t N>
T TodPickFromArray(const T (&theArray)[N], int theCount)
{
    if (theCount <= 0 || static_cast<std::size_t>(theCount) > N)
        throw std::invalid_argument("TodPickFromArray count is outside the array");
    return theArray[Sexy::Rand(theCount)];
}

// 指针+长度形态：表驱动调用点（表列存列表指针）。语义与数组引用版一致
// （恰好一次有界 RNG）。纯函数、不取址，模板居头无多副本风险。
template<class T>
T TodPickFromList(const T* theList, int theCount)
{
    if (theCount <= 0)
        throw std::invalid_argument("TodPickFromList count is outside the list");
    return theList[Sexy::Rand(theCount)];
}
