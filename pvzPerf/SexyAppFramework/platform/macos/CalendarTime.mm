#include "SexyAppFramework/platform/CalendarTime.h"
#include <stdexcept>

namespace Sexy {
std::tm LocalCalendarTime(long long unixSeconds)
{
    static_assert(sizeof(std::time_t) == 8);
    const auto timestamp = static_cast<std::time_t>(unixSeconds);
    std::tm result{};
    if (!localtime_r(&timestamp, &result))
        throw std::runtime_error("Cannot convert saved timestamp to local calendar time");
    return result;
}
}
