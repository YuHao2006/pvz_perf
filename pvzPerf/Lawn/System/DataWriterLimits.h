#pragma once
#include <cstddef>
#include <limits>
#include <stdexcept>

namespace DataWriterLimits {
// GetDataLen and its buffer consumers use int. Do not create a buffer that
// cannot be passed to those APIs, even on a host with wider size_t.
inline constexpr std::size_t MaximumMemoryBytes=(std::numeric_limits<int>::max)();
constexpr std::size_t AppendSize(std::size_t current,std::size_t count) {
    if(current>MaximumMemoryBytes || count>MaximumMemoryBytes-current)
        throw std::length_error("DataWriter memory buffer exceeds its representable length");
    return current+count;
}
constexpr std::size_t CapacityFor(std::size_t capacity,std::size_t required) {
    if(required>MaximumMemoryBytes || capacity>MaximumMemoryBytes)
        throw std::length_error("DataWriter memory capacity exceeds its representable length");
    if(capacity>=required) return capacity;
    if(capacity<32) capacity=32;
    // Retain the original doubling policy, but never wrap through zero.
    while(capacity<required)
        capacity=capacity>MaximumMemoryBytes/2?MaximumMemoryBytes:capacity*2;
    return capacity;
}
}
