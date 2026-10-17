#include "SexyAppFramework/platform/TabletCaret.h"
#include <stdexcept>

namespace Sexy {
void NativeTabletCaret::Begin(NativeWindowHandle) {
    throw std::logic_error("Windows TabletPC caret integration is not a Linux input capability");
}
void NativeTabletCaret::Position(int, int) {
    throw std::logic_error("Windows TabletPC caret integration is not a Linux input capability");
}
void NativeTabletCaret::Show(NativeWindowHandle) {
    throw std::logic_error("Windows TabletPC caret integration is not a Linux input capability");
}
void NativeTabletCaret::End(NativeWindowHandle) {
    throw std::logic_error("Windows TabletPC caret integration is not a Linux input capability");
}
}
