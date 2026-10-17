#pragma once

// SDK-free declarations; only platform implementation files include windows.h.
struct HWND__;
struct HMONITOR__;
using NativeWindowHandle = HWND__*;
using NativeMonitorHandle = HMONITOR__*;
