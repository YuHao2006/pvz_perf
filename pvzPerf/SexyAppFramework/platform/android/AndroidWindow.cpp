#include "../NativeWindow.h"
#include "AndroidWindow.h"
#include "SexyAppFramework/Common.h"
#include <android/input.h>
#include <android/log.h>
#include <android_native_app_glue.h>

namespace Sexy {
namespace {
android_app* gApp = nullptr;
ANativeWindow* gWindow = nullptr;
NativeWindowEventCallback gEventCallback = nullptr;
void* gEventContext = nullptr;
// 触摸即指针：MOVE 只更新采样值，DOWN/UP 走事件 FIFO（坐标随事件携带）。
NativePointerState gPointer{};
bool gTouching = false;

void EmitEvent(const NativeWindowEvent& event)
{
    if (gEventCallback)
        gEventCallback(gEventContext, event);
}
}

void BindAndroidApp(android_app* state) { gApp = state; }

void AttachAndroidNativeWindow(ANativeWindow* window) { gWindow = window; }
ANativeWindow* AttachedAndroidNativeWindow() { return gWindow; }

void ShowAndroidSoftInput(bool show)
{
    if (!gApp || !gApp->activity) return;
    if (show)
        // FORCED：IMPLICIT 需窗口声明 softInputMode，NativeActivity 默认没有
        ANativeActivity_showSoftInput(gApp->activity,
            ANATIVEACTIVITY_SHOW_SOFT_INPUT_FORCED);
    else
        ANativeActivity_hideSoftInput(gApp->activity, 0);
}

void AndroidAppCommand(android_app* state, int32_t command)
{
    switch (command) {
    case APP_CMD_INIT_WINDOW:
        gWindow = state->window;

        // Resize(未最小化) 驱动 NotifySurfaceSuspended(false) + 几何重建；
        // 挂起期间 BeginCommands 拒绝取图，恢复后交换链按脏标记重建。
        if (gWindow) {
            NativeWindowEvent event{};
            event.kind = NativeWindowEventKind::Resize;
            EmitEvent(event);
        }
        break;
    case APP_CMD_TERM_WINDOW:
        // 必须先于 glue 释放 ANativeWindow 停止呈现；Resize(最小化) 在
        // 本帧排水点把 surface 标记挂起，之后无人再触碰该窗口指针。
        gWindow = nullptr;
        {
            NativeWindowEvent event{};
            event.kind = NativeWindowEventKind::Resize;
            event.minimized = true;
            EmitEvent(event);
        }
        break;
    case APP_CMD_GAINED_FOCUS: {
        NativeWindowEvent event{};
        event.kind = NativeWindowEventKind::Focus;
        event.focused = true;
        EmitEvent(event);
        break;
    }
    case APP_CMD_LOST_FOCUS: {
        NativeWindowEvent event{};
        event.kind = NativeWindowEventKind::Focus;
        event.focused = false;
        EmitEvent(event);
        break;
    }
    case APP_CMD_DESTROY: {
        NativeWindowEvent event{};
        event.kind = NativeWindowEventKind::Close;
        EmitEvent(event);
        break;
    }
    default:
        break;
    }
}

int32_t AndroidAppInput(android_app*, AInputEvent* event)
{
    const int32_t type = AInputEvent_getType(event);
    if (type == AINPUT_EVENT_TYPE_KEY)
    {
        const int32_t action = AKeyEvent_getAction(event);
        if (action != AKEY_EVENT_ACTION_DOWN && action != AKEY_EVENT_ACTION_UP)
            return 0;
        const bool pressed = action == AKEY_EVENT_ACTION_DOWN;
        const int32_t keycode = AKeyEvent_getKeyCode(event);
        const int32_t meta = AKeyEvent_getMetaState(event);
        // Key 事件携带原生 AKEYCODE，由消费端的 constexpr
        // NativeInput::EngineKeyFromNative 单跳映射；此处只补 Text 字符。
        unsigned text = 0;
        if (keycode >= AKEYCODE_A && keycode <= AKEYCODE_Z) {
            const int letter = keycode - AKEYCODE_A;
            text = static_cast<unsigned>(((meta & AMETA_SHIFT_ON) ? 'A' : 'a') + letter);
        } else if (keycode >= AKEYCODE_0 && keycode <= AKEYCODE_9) {
            text = static_cast<unsigned>('0' + (keycode - AKEYCODE_0));
        } else switch (keycode) {
            case AKEYCODE_SPACE: text = 0x20; break;
            case AKEYCODE_MINUS: text = '-'; break;
            case AKEYCODE_PERIOD: text = '.'; break;
            case AKEYCODE_COMMA: text = ','; break;
            case AKEYCODE_SLASH: text = '/'; break;
            case AKEYCODE_PLUS: text = '+'; break;
            case AKEYCODE_EQUALS: text = '='; break;
            default: return 0;  // 未映射键（含音量键）交还系统处理
        }
        const unsigned long long timeMs = static_cast<unsigned long long>(
            AKeyEvent_getEventTime(event) / 1000000);
        NativeWindowEvent key{};
        key.kind = NativeWindowEventKind::Key;
        key.key = static_cast<unsigned>(keycode);
        key.pressed = pressed;
        key.timeMs = timeMs;
        EmitEvent(key);
        if (pressed && text) {
            NativeWindowEvent out{};
            out.kind = NativeWindowEventKind::Text;
            out.text = text;
            out.timeMs = timeMs;
            EmitEvent(out);
        }
        return 1;
    }
    if (type != AINPUT_EVENT_TYPE_MOTION)
        return 0;
    const float x = AMotionEvent_getX(event, 0);
    const float y = AMotionEvent_getY(event, 0);
    const int32_t action = AMotionEvent_getAction(event);
    const int32_t masked = action & AMOTION_EVENT_ACTION_MASK;
    const int32_t pointerIndex = action >> AMOTION_EVENT_ACTION_POINTER_INDEX_SHIFT;
    bool button = false, pressed = false;
    switch (masked) {
    case AMOTION_EVENT_ACTION_DOWN:
        button = pressed = true;
        break;
    case AMOTION_EVENT_ACTION_POINTER_DOWN:
        if (pointerIndex == 0) button = pressed = true;
        break;
    case AMOTION_EVENT_ACTION_UP:
    case AMOTION_EVENT_ACTION_CANCEL:
        button = true;
        pressed = false;
        break;
    case AMOTION_EVENT_ACTION_POINTER_UP:
        if (pointerIndex == 0) { button = true; pressed = false; }
        break;
    case AMOTION_EVENT_ACTION_MOVE:
    case AMOTION_EVENT_ACTION_HOVER_MOVE:
        break;
    default:
        return 1;
    }
    gPointer.x = x;
    gPointer.y = y;
    if (button) gTouching = pressed;
    gPointer.inside = gTouching;
    if (button) {
        NativeWindowEvent out{};
        out.kind = NativeWindowEventKind::MouseButton;
        out.button = 0;
        out.pressed = pressed;
        out.x = x;
        out.y = y;
        out.timeMs = static_cast<unsigned long long>(AMotionEvent_getEventTime(event) / 1000000);
        EmitEvent(out);
    }
    return 1;
}

struct NativeWindow::Impl {};
NativeWindow::NativeWindow(const NativeWindowConfig& config) : impl_(new Impl) {
    if (!gWindow) throw std::runtime_error("Android NativeWindow requires an attached ANativeWindow");
    Width = ANativeWindow_getWidth(gWindow);
    Height = ANativeWindow_getHeight(gWindow);
    if (Width <= 0) Width = config.width;
    if (Height <= 0) Height = config.height;
    // 启动即前台；焦点由 GAINED/LOST_FOCUS 校正。
    Focused = true;
    Visible = config.visible;
    gEventCallback = config.callback;
    gEventContext = config.callbackContext;
}
NativeWindow::~NativeWindow()
{
    gEventCallback = nullptr;
    gEventContext = nullptr;
}
void NativeWindow::PumpEvents()
{
    if (!gApp) return;
    // 非阻塞排空：命令/输入在本线程分发，分发即入队，渲染在同一帧稍后消费。
    int events = 0;
    android_poll_source* source = nullptr;
    while (ALooper_pollOnce(0, nullptr, &events,
            reinterpret_cast<void**>(&source)) >= 0) {
        if (source) source->process(gApp, source);
        if (gApp->destroyRequested) return;
    }
}
NativePointerState NativeWindow::SamplePointer() { return gPointer; }
void NativeWindow::Show() { Visible = true; }
void NativeWindow::ApplyCursor(NativeCursor) {}
void NativeWindow::SetTitle(const std::string&) {}
void NativeWindow::SetFullscreen(bool) {}
void NativeWindow::Resize(int, int)
{
    // 窗口尺寸归系统所有；几何以 QueryNativeClientExtent 直读为准。
}
bool NativeWindow::Minimized() const { return gWindow == nullptr; }
NativeWindowBackend NativeWindow::Backend() const { return NativeWindowBackend::Android; }
NativeSurfaceHandles NativeWindow::SurfaceHandles() const { return {nullptr, gWindow, 0}; }
}
