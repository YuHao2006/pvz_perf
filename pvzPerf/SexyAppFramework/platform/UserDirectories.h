#pragma once
#include <optional>
#include <string>

namespace Sexy {
std::optional<std::string> ResolveDesktopDirectory();
#if defined(SEXY_WINDOW_LINUX)
std::string LinuxInstanceLockPath();
#endif
}
