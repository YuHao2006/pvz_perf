#pragma once
#include <android/native_window.h>
#include <android/keycodes.h>
#include <cstdint>
#include "misc/KeyCodes.h"
struct android_app;
struct AInputEvent;
namespace Sexy {
// android_main 在首帧轮询前调用：NativeWindow::PumpEvents 由此驱动 glue 事件源。
void BindAndroidApp(android_app* state);
void AttachAndroidNativeWindow(ANativeWindow* window);
ANativeWindow* AttachedAndroidNativeWindow();
// 文本输入框获得/失去焦点时弹出/收起系统输入法。
void ShowAndroidSoftInput(bool show);
// native_app_glue 回调：命令与输入事件换算成 NativeWindowEvent 走统一 FIFO。
void AndroidAppCommand(android_app* state, int32_t command);
int32_t AndroidAppInput(android_app* state, AInputEvent* event);

namespace NativeInput {
// AKEYCODE_* → 引擎 KeyCode：每平台单跳 constexpr 映射（编译期展开为
// 算术/查表，运行时无转译链）。键码枚举以 ASCII 段为自身契约。
constexpr unsigned EngineKeyFromNative(unsigned theNativeKey)
{
    if (theNativeKey >= AKEYCODE_A && theNativeKey <= AKEYCODE_Z)
        return unsigned('A') + (theNativeKey - AKEYCODE_A);
    if (theNativeKey >= AKEYCODE_0 && theNativeKey <= AKEYCODE_9)
        return unsigned('0') + (theNativeKey - AKEYCODE_0);
    switch (theNativeKey) {
    case AKEYCODE_SPACE: return KEYCODE_SPACE;
    case AKEYCODE_ENTER:
    case AKEYCODE_NUMPAD_ENTER: return KEYCODE_RETURN;
    case AKEYCODE_DEL: return KEYCODE_BACK;          // 退格 = 引擎 KEYCODE_BACK(0x08)
    case AKEYCODE_ESCAPE:
    case AKEYCODE_BACK: return KEYCODE_ESCAPE;
    case AKEYCODE_TAB: return KEYCODE_TAB;
    case AKEYCODE_DPAD_UP: return KEYCODE_UP;
    case AKEYCODE_DPAD_DOWN: return KEYCODE_DOWN;
    case AKEYCODE_DPAD_LEFT: return KEYCODE_LEFT;
    case AKEYCODE_DPAD_RIGHT: return KEYCODE_RIGHT;
    case AKEYCODE_PAGE_UP: return KEYCODE_PRIOR;
    case AKEYCODE_PAGE_DOWN: return KEYCODE_NEXT;
    case AKEYCODE_SHIFT_LEFT:
    case AKEYCODE_SHIFT_RIGHT: return KEYCODE_SHIFT;
    case AKEYCODE_CTRL_LEFT:
    case AKEYCODE_CTRL_RIGHT: return KEYCODE_CONTROL;
    case AKEYCODE_ALT_LEFT:
    case AKEYCODE_ALT_RIGHT: return KEYCODE_MENU;    // 引擎以 MENU 充当 Alt
    case AKEYCODE_MINUS: return unsigned('-');
    case AKEYCODE_PERIOD: return unsigned('.');
    case AKEYCODE_COMMA: return unsigned(',');
    case AKEYCODE_SLASH: return unsigned('/');
    case AKEYCODE_PLUS: return unsigned('+');
    case AKEYCODE_EQUALS: return unsigned('=');
    default: return KEYCODE_UNKNOWN;
    }
}
} // namespace NativeInput
} // namespace Sexy
