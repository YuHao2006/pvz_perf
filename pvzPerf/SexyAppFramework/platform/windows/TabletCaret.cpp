#include "SexyAppFramework/platform/TabletCaret.h"
#include <windows.h>

namespace Sexy {
void NativeTabletCaret::Begin(NativeWindowHandle window) {
    CreateCaret(window, nullptr, 0, 0);
}
void NativeTabletCaret::Position(int x, int y) {
    SetCaretPos(x, y);
}
void NativeTabletCaret::Show(NativeWindowHandle window) {
    ShowCaret(window);
}
void NativeTabletCaret::End(NativeWindowHandle window) {
    HideCaret(window);
    DestroyCaret();
}
}
