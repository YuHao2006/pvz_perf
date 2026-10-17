#pragma once
#include <cstdint>
#include <bit>

namespace Sexy::FrameCounterMath {
// Original x86 counters use low-32-bit INC/SUB, then signed consumers (notably
// rain's IDIV). Keep those bits and signed meaning without C++ signed overflow.
constexpr std::int32_t IncrementSigned32(std::int32_t value) {
    return std::bit_cast<std::int32_t>(std::bit_cast<std::uint32_t>(value) + 1u);
}
constexpr std::int32_t SignedDelta32(std::uint32_t value, std::uint32_t previous) {
    return std::bit_cast<std::int32_t>(value - previous);
}
// Demo files retain their original 32-bit tick positions. A request before
// the beginning is position zero, not a wrapped far-future target.
constexpr std::uint32_t BeforeEnd(std::uint32_t length, std::uint64_t frames) {
    return frames < length ? length - static_cast<std::uint32_t>(frames) : 0;
}
constexpr std::uint64_t RemainingSeconds(std::uint32_t length, std::uint32_t position, std::uint32_t frameTime) {
    return static_cast<std::uint64_t>(BeforeEnd(length, position)) * frameTime / 1000;
}
constexpr std::uint64_t AverageFps(std::uint32_t draws, std::uint64_t drawTime, std::uint32_t presentTime) {
    const auto elapsed = drawTime + presentTime;
    return elapsed == 0 ? 0 : static_cast<std::uint64_t>(draws) * 1000 / elapsed;
}
}
