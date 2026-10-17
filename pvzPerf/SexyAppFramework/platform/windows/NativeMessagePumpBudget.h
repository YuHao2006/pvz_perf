#pragma once

#include <chrono>

namespace Sexy {
struct NativeMessagePumpBudget {
    using Clock=std::chrono::steady_clock;
    // A soft limit between retrievals; one native call can exceed the budget.
    static constexpr auto Duration=std::chrono::microseconds(1000);
    Clock::time_point mDeadline=Clock::now()+Duration;
    bool mPolled=false;
    bool mYielded=false;

    bool NextAllowed() noexcept {
        if(!mPolled) {
            mPolled=true;
            return true;
        }
        if(Clock::now()<mDeadline) return true;
        mYielded=true;
        return false;
    }
};
}
