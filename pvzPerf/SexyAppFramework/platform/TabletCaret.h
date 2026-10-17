#pragma once
#include "NativeHandles.h"

namespace Sexy {
template<class WindowHandle>
struct TabletCaretPlatform;

template<>
struct TabletCaretPlatform<NativeWindowHandle> {
    static void Begin(NativeWindowHandle window);
    static void Position(int x, int y);
    static void Show(NativeWindowHandle window);
    static void End(NativeWindowHandle window);
};
using NativeTabletCaret = TabletCaretPlatform<NativeWindowHandle>;
}
