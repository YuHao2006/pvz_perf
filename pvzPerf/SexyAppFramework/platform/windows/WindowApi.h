#pragma once
#include "pvz/BuildConfig.h"
#include <windows.h>

namespace Sexy {
template<BuildConfig::WindowsApi Version>
struct WindowsWindowApi;
}

#include "pvz/WindowsWindowApi.h"

namespace Sexy {
using NativeWindowsWindowApi = WindowsWindowApi<BuildConfig::Windows>;
}
