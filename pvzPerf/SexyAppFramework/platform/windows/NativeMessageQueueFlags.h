#pragma once

#include <windows.h>

namespace Sexy {
inline constexpr UINT NativeMessageNoMovePeekFlags =
    PM_REMOVE | ((QS_ALLINPUT & ~QS_MOUSEMOVE) << 16);
}
