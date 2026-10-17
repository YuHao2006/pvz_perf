#pragma once
#include "NativeHandles.h"

namespace Sexy {
struct NativeClientExtent {
    int width, height;
};

NativeClientExtent QueryNativeClientExtent(NativeWindowHandle window);
}
