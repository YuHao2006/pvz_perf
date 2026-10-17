#pragma once
#include "FrameCounterMath.h"
#include <limits>
#include <optional>
#include <string_view>

namespace Sexy::DemoTools {
constexpr bool TimeSpace(char c) {
    return c==' ' || c=='\t' || c=='\r' || c=='\n' || c=='\v' || c=='\f';
}
// Retain the original base-60 components and extra second, without atoi,
// shared strtok state, signed overflow, or a wrapped far-future seek.
constexpr std::optional<std::uint32_t> ParseJumpTarget(
    std::string_view text,std::uint32_t length,int frameTime) {
    if(frameTime<=0) return std::nullopt;
    constexpr auto maximum=(std::numeric_limits<std::uint64_t>::max)();
    std::uint64_t seconds=0;
    for(;;) {
        const auto colon=text.find(':');
        auto part=text.substr(0,colon);
        while(!part.empty() && TimeSpace(part.front())) part.remove_prefix(1);
        while(!part.empty() && TimeSpace(part.back())) part.remove_suffix(1);
        if(!part.empty() && part.front()=='+') part.remove_prefix(1);
        if(part.empty()) return std::nullopt;
        std::uint64_t component=0;
        for(char c:part) {
            if(c<'0' || c>'9') return std::nullopt;
            const unsigned digit=static_cast<unsigned>(c-'0');
            if(component>(maximum-digit)/10) return std::nullopt;
            component=component*10+digit;
        }
        if(seconds>(maximum-component)/60) return std::nullopt;
        seconds=seconds*60+component;
        if(colon==std::string_view::npos) break;
        text.remove_prefix(colon+1);
    }
    const auto totalMilliseconds=static_cast<std::uint64_t>(length)*static_cast<unsigned>(frameTime);
    // Check against the bounded demo duration BEFORE adding 1 and multiplying.
    // Even UINT64_MAX seconds is a valid, out-of-range seek to position zero.
    if(seconds>=totalMilliseconds/1000) return 0;
    const auto frames=(seconds+1)*1000/static_cast<unsigned>(frameTime);
    return FrameCounterMath::BeforeEnd(length,frames);
}
}
