#include "SexyAppFramework/platform/NativeWindow.h"
#include "LinuxInput.h"

#include <X11/XKBlib.h>
#include <X11/Xatom.h>
#include <X11/Xlib.h>
#include <X11/Xutil.h>
#include <X11/cursorfont.h>

#include <array>
#include <climits>
#include <clocale>
#include <cstdint>
#include <cstdlib>
#include <cstring>
#include <stdexcept>
#include <string>
#include <vector>
#include <sys/syscall.h>
#include <unistd.h>

namespace Sexy {
namespace {

void RequireMainThread()
{
    if (syscall(SYS_gettid) != getpid())
        throw std::logic_error("X11 NativeWindow must be used on the main thread");
}

void RequireSize(int width, int height)
{
    if (width <= 0 || height <= 0 || width > 65535 || height > 65535)
        throw std::invalid_argument("X11 window dimensions must be in [1, 65535]");
}

// Xlib errors are asynchronous and its handler is process-global. All adapter
// calls are confined to the main thread; restore the host's handler afterward.
class XErrors {
public:
    explicit XErrors(Display* display) : display_(display)
    {
        if (active_)
            throw std::logic_error("Nested X11 error scope");
        active_ = this;
        previous_ = XSetErrorHandler(Handle);
    }

    ~XErrors()
    {
        XSync(display_, False);
        XSetErrorHandler(previous_);
        active_ = nullptr;
    }

    void Finish(const char* operation)
    {
        XSync(display_, False);
        if (error_.error_code) {
            char description[256]{};
            XGetErrorText(display_, error_.error_code, description, sizeof(description));
            throw std::runtime_error(std::string(operation) + ": " + description +
                " (request " + std::to_string(error_.request_code) +
                ", resource " + std::to_string(error_.resourceid) + ")");
        }
    }

private:
    static int Handle(Display* display, XErrorEvent* error)
    {
        if (active_ && display == active_->display_) {
            if (!active_->error_.error_code)
                active_->error_ = *error;
            return 0;
        }
        if (active_ && active_->previous_)
            return active_->previous_(display, error);
        // Never suppress an error on an unrelated X connection.
        std::abort();
    }

    Display* display_;
    XErrorEvent error_{};
    XErrorHandler previous_ = nullptr;
    static XErrors* active_;
};

XErrors* XErrors::active_ = nullptr;

struct XFreeDeleter {
    void operator()(void* pointer) const { if (pointer) XFree(pointer); }
};

std::vector<uint32_t> DecodeUtf8(const char* bytes, size_t length)
{
    std::vector<uint32_t> result;
    for (size_t i = 0; i < length;) {
        const auto first = static_cast<unsigned char>(bytes[i++]);
        uint32_t value = first;
        unsigned remaining = 0;
        uint32_t minimum = 0;
        if (first >= 0xc2 && first <= 0xdf) {
            remaining = 1; value = first & 0x1f; minimum = 0x80;
        } else if (first >= 0xe0 && first <= 0xef) {
            remaining = 2; value = first & 0x0f; minimum = 0x800;
        } else if (first >= 0xf0 && first <= 0xf4) {
            remaining = 3; value = first & 0x07; minimum = 0x10000;
        } else if (first >= 0x80) {
            throw std::runtime_error("Invalid UTF-8 supplied to X11 NativeWindow");
        }
        if (remaining > length - i)
            throw std::runtime_error("Truncated UTF-8 supplied to X11 NativeWindow");
        for (unsigned j = 0; j < remaining; ++j) {
            const auto next = static_cast<unsigned char>(bytes[i++]);
            if ((next & 0xc0) != 0x80)
                throw std::runtime_error("Invalid UTF-8 continuation from X11");
            value = (value << 6) | (next & 0x3f);
        }
        if (value < minimum || value > 0x10ffff ||
            (value >= 0xd800 && value <= 0xdfff))
            throw std::runtime_error("Invalid Unicode scalar from X11");
        result.push_back(value);
    }
    return result;
}

} // namespace

struct NativeWindow::Impl {
    NativeWindow& owner;
    Display* display = nullptr;
    Window window = None;
    XIM inputMethod = nullptr;
    XIC inputContext = nullptr;
    Atom protocols = None, deleteWindow = None, utf8 = None, name = None;
    Atom netState = None, fullscreenAtom = None, hiddenAtom = None, wmState = None;
    bool minimized = false, visible = false;
    bool detectableRepeat = false;
    bool pumping = false, pointerInside = false;
    std::array<bool, 256> keys{};
    std::array<KeySym, 256> keySymbols{};
    std::array<Cursor, static_cast<size_t>(NativeCursor::Count)> cursors{};
    NativeCursor appliedCursor = NativeCursor::Count;
    NativeInput::InputClock inputClock;
    NativeWindowEventCallback callback = nullptr;
    void* callbackContext = nullptr;

    explicit Impl(NativeWindow& window) : owner(window) {}

    ~Impl() { Destroy(); }

    void Destroy()
    {
        if (!display)
            return;
        RequireMainThread();
        {
            XErrors errors(display);
            for (auto cursor : cursors)
                if (cursor) XFreeCursor(display, cursor);
            if (inputContext) XDestroyIC(inputContext);
            if (inputMethod && !XCloseIM(inputMethod))
                throw std::runtime_error("Cannot close X11 input method");
            if (window) XDestroyWindow(display, window);
            errors.Finish("Destroy X11 window");
        }
        if (XCloseDisplay(display) != 0)
            std::terminate();
    }

    void RequireWindow() const
    {
        RequireMainThread();
        if (!display || !window)
            throw std::logic_error("X11 NativeWindow no longer has a native window");
    }

    void ConstrainSize(int width, int height)
    {
        XSizeHints hints{};
        hints.flags = PMinSize | PMaxSize;
        hints.min_width = hints.max_width = width;
        hints.min_height = hints.max_height = height;
        XSetWMNormalHints(display, window, &hints);
    }

    void Title(const std::string& title)
    {
        if (title.size() > INT_MAX || title.find('\0') != std::string::npos)
            throw std::invalid_argument("Invalid X11 window title length or embedded NUL");
        DecodeUtf8(title.data(), title.size());
        XChangeProperty(display, window, name, utf8, 8, PropModeReplace,
            reinterpret_cast<const unsigned char*>(title.data()),
            static_cast<int>(title.size()));
        char* text = const_cast<char*>(title.c_str());
        XTextProperty property{};
        const int status = Xutf8TextListToTextProperty(
            display, &text, 1, XUTF8StringStyle, &property);
        std::unique_ptr<unsigned char, XFreeDeleter> storage(property.value);
        if (status != Success)
            throw std::runtime_error("Cannot encode X11 WM_NAME");
        XSetWMName(display, window, &property);
        XSetWMIconName(display, window, &property);
    }

    template<class Decode>
    auto Property(Atom property, Atom expected, Decode decode)
    {
        Atom actual = None;
        int format = 0;
        // These output pointers are unsigned long* in the Xlib ABI.
        unsigned long count = 0, remaining = 0;
        unsigned char* raw = nullptr;
        const int status = XGetWindowProperty(display, window, property, 0,
            65536, False, expected, &actual, &format, &count, &remaining, &raw);
        std::unique_ptr<unsigned char, XFreeDeleter> storage(raw);
        if (status != Success)
            throw std::runtime_error("Cannot read X11 window state");
        if (actual == None)
            return decode(nullptr, 0);
        if (actual != expected || format != 32 || remaining != 0 || (count && !raw))
            throw std::runtime_error("Malformed X11 window state property");
        return decode(raw, count);
    }

    std::vector<Atom> AtomProperty(Atom property)
    {
        return Property(property, XA_ATOM, [](const unsigned char* raw, auto count) {
            if (!count) return std::vector<Atom>{};
            const auto* atoms = reinterpret_cast<const Atom*>(raw);
            return std::vector<Atom>(atoms, atoms + count);
        });
    }

    NativeWindowEvent SizeEvent() const
    {
        NativeWindowEvent event{};
        event.kind = NativeWindowEventKind::Resize;
        event.width = owner.Width;
        event.height = owner.Height;
        event.minimized = minimized;
        return event;
    }

    void UpdateMinimized(std::vector<NativeWindowEvent>& events)
    {
        bool value = Property(wmState, wmState, [](const unsigned char* raw, auto count) {
            if (!count) return false;
            // WM_STATE starts with a state number, not an Atom. Format 32
            // occupies native long slots in Xlib, including on LP64.
            long state = 0;
            std::memcpy(&state, raw, sizeof(state));
            return state == IconicState;
        });
        const auto ewmh = AtomProperty(netState);
        for (auto atom : ewmh)
            value = value || atom == hiddenAtom;
        if (value != minimized) {
            minimized = value;
            events.push_back(SizeEvent());
        }
    }

    void Text(XKeyEvent& key, std::vector<NativeWindowEvent>& events)
    {
        std::vector<char> buffer(64);
        KeySym ignored = NoSymbol;
        Status status = XLookupNone;
        int length = Xutf8LookupString(inputContext, &key, buffer.data(),
            static_cast<int>(buffer.size()), &ignored, &status);
        if (status == XBufferOverflow) {
            if (length <= 0 || length == INT_MAX)
                throw std::runtime_error("Invalid XIM text buffer requirement");
            buffer.resize(static_cast<size_t>(length) + 1);
            length = Xutf8LookupString(inputContext, &key, buffer.data(),
                static_cast<int>(buffer.size()), &ignored, &status);
        }
        if (status == XBufferOverflow || length < 0 ||
            static_cast<size_t>(length) > buffer.size())
            throw std::runtime_error("XIM text lookup failed");
        if (status != XLookupChars && status != XLookupBoth)
            return;
        for (const auto scalar : DecodeUtf8(buffer.data(), static_cast<size_t>(length))) {
            NativeWindowEvent event{};
            event.kind = NativeWindowEventKind::Text;
            event.text = scalar;
            events.push_back(event);
        }
    }

    void Process(XEvent& native, std::vector<NativeWindowEvent>& events)
    {
        const bool filtered = XFilterEvent(&native, window) != False;
        NativeWindowEvent event{};
        switch (native.type) {
        case ClientMessage:
            if (native.xclient.message_type == protocols &&
                native.xclient.format == 32 &&
                static_cast<Atom>(native.xclient.data.l[0]) == deleteWindow) {
                event.kind = NativeWindowEventKind::Close;
                events.push_back(event);
            }
            break;
        case ConfigureNotify:
            if (native.xconfigure.width <= 0 || native.xconfigure.height <= 0)
                throw std::runtime_error("X11 reported an invalid client size");
            if (owner.Width != native.xconfigure.width || owner.Height != native.xconfigure.height) {
                owner.Width = native.xconfigure.width;
                owner.Height = native.xconfigure.height;
                events.push_back(SizeEvent());
            }
            break;
        case MapNotify:
            UpdateMinimized(events);
            break;
        case UnmapNotify:
            UpdateMinimized(events);
            break;
        case PropertyNotify:
            if (native.xproperty.atom == wmState || native.xproperty.atom == netState)
                UpdateMinimized(events);
            break;
        case FocusIn:
        case FocusOut:
            if (native.xfocus.mode == NotifyGrab || native.xfocus.mode == NotifyUngrab ||
                native.xfocus.detail == NotifyInferior)
                break;
            if (owner.Focused != (native.type == FocusIn)) {
                owner.Focused = native.type == FocusIn;
                if (owner.Focused) {
                    XSetICFocus(inputContext);
                } else {
                    XUnsetICFocus(inputContext);
                    keys.fill(false);
                    keySymbols.fill(NoSymbol);
                }
                event.kind = NativeWindowEventKind::Focus;
                event.focused = owner.Focused;
                event.minimized = minimized;
                events.push_back(event);
            }
            break;
        case MotionNotify:
            // Not subscribed. Explicitly sent motion must not drive UI either.
            break;
        case EnterNotify:
        case LeaveNotify:
            if (filtered || native.xcrossing.mode == NotifyGrab ||
                native.xcrossing.mode == NotifyUngrab ||
                native.xcrossing.detail == NotifyInferior)
                break;
            pointerInside = native.type == EnterNotify;
            event.kind = pointerInside ? NativeWindowEventKind::MouseEnter :
                                         NativeWindowEventKind::MouseLeave;
            event.x = native.xcrossing.x;
            event.y = native.xcrossing.y;
            events.push_back(event);
            break;
        case ButtonPress:
        case ButtonRelease: {
            if (filtered) break;
            event.timeMs = inputClock.Advance(static_cast<unsigned int>(native.xbutton.time));
            const auto button = native.xbutton.button;
            if (button >= Button4 && button <= 7) {
                if (native.type != ButtonPress) break;
                event.kind = NativeWindowEventKind::MouseWheel;
                // Wheel x/y are horizontal/vertical steps; positive is right/up.
                if (button == Button4) event.y = 1;
                if (button == Button5) event.y = -1;
                if (button == 6) event.x = -1;
                if (button == 7) event.x = 1;
            } else {
                if (button != Button1 && button != Button2 && button != Button3)
                    break;
                event.kind = NativeWindowEventKind::MouseButton;
                event.button = button == Button1 ? 0 : button == Button3 ? 1 : 2;
                event.pressed = native.type == ButtonPress;
                event.x = native.xbutton.x;
                event.y = native.xbutton.y;
            }
            events.push_back(event);
            break;
        }
        case KeyPress:
        case KeyRelease: {
            const auto code = native.xkey.keycode;
            if (code >= keys.size())
                throw std::runtime_error("X11 keycode exceeds the core protocol range");
            KeySym symbol = NoSymbol;
            unsigned consumed = 0;
            XkbLookupKeySym(display, static_cast<KeyCode>(code),
                native.xkey.state, &consumed, &symbol);
            event.kind = NativeWindowEventKind::Key;
            event.key = static_cast<unsigned int>(symbol);
            event.scanCode = code;
            event.pressed = native.type == KeyPress;
            event.repeat = event.pressed && keys[code];
            if (event.pressed && !event.repeat)
                keySymbols[code] = symbol;
            if (keys[code])
                event.key = static_cast<unsigned int>(keySymbols[code]);
            keys[code] = event.pressed;
            events.push_back(event);
            if (event.pressed && !filtered)
                Text(native.xkey, events);
            break;
        }
        case DestroyNotify:
            window = None;
            throw std::runtime_error("X11 native window was destroyed externally");
        default:
            break;
        }
    }
};

NativeWindow::NativeWindow(const NativeWindowConfig& config)
    : Width(config.width), Height(config.height), Focused(false), Visible(config.visible),
      impl_(std::make_unique<Impl>(*this))
{
    RequireMainThread();
    RequireSize(config.width, config.height);
    auto& state = *impl_;
    state.callback = config.callback;
    state.callbackContext = config.callbackContext;
    state.visible = config.visible;
    state.display = XOpenDisplay(nullptr);
    if (!state.display)
        throw std::runtime_error("Cannot open X11 display (check DISPLAY)");
    XErrors errors(state.display);
    int opcode = 0, eventBase = 0, errorBase = 0;
    int major = XkbMajorVersion, minor = XkbMinorVersion;
    if (!XkbQueryExtension(state.display, &opcode, &eventBase, &errorBase, &major, &minor))
        throw std::runtime_error("X11 server does not support XKB");
    Bool repeatSupported = False;
    state.detectableRepeat =
        XkbSetDetectableAutoRepeat(state.display, True, &repeatSupported) &&
        repeatSupported != False;

    const int screen = DefaultScreen(state.display);
    state.window = XCreateSimpleWindow(state.display, RootWindow(state.display, screen),
        0, 0, static_cast<unsigned>(config.width), static_cast<unsigned>(config.height),
        0, BlackPixel(state.display, screen), BlackPixel(state.display, screen));
    if (!state.window)
        throw std::runtime_error("Cannot create X11 window");
    char appId[] = "pvz_perf";
    XClassHint classHint{appId, appId};
    XSetClassHint(state.display, state.window, &classHint);
    state.protocols = XInternAtom(state.display, "WM_PROTOCOLS", False);
    state.deleteWindow = XInternAtom(state.display, "WM_DELETE_WINDOW", False);
    state.utf8 = XInternAtom(state.display, "UTF8_STRING", False);
    state.name = XInternAtom(state.display, "_NET_WM_NAME", False);
    state.netState = XInternAtom(state.display, "_NET_WM_STATE", False);
    state.fullscreenAtom = XInternAtom(state.display, "_NET_WM_STATE_FULLSCREEN", False);
    state.hiddenAtom = XInternAtom(state.display, "_NET_WM_STATE_HIDDEN", False);
    state.wmState = XInternAtom(state.display, "WM_STATE", False);
    if (!XSetWMProtocols(state.display, state.window, &state.deleteWindow, 1))
        throw std::runtime_error("Cannot register X11 close protocol");
    XWMHints hints{};
    hints.flags = InputHint | StateHint;
    hints.input = True;
    hints.initial_state = NormalState;
    XSetWMHints(state.display, state.window, &hints);
    state.ConstrainSize(config.width, config.height);
    if (!std::setlocale(LC_CTYPE, "") || !XSupportsLocale() || !XSetLocaleModifiers(""))
        throw std::runtime_error("Cannot initialize X11 input locale");
    state.Title(config.title);
    state.inputMethod = XOpenIM(state.display, nullptr, nullptr, nullptr);
    if (!state.inputMethod)
        throw std::runtime_error("Cannot open X11 input method");
    state.inputContext = XCreateIC(state.inputMethod,
        XNInputStyle, XIMPreeditNothing | XIMStatusNothing,
        XNClientWindow, state.window, XNFocusWindow, state.window, nullptr);
    if (!state.inputContext)
        throw std::runtime_error("Cannot create X11 input context");
    long inputEvents = 0;
    if (XGetICValues(state.inputContext, XNFilterEvents, &inputEvents, nullptr))
        throw std::runtime_error("Cannot query XIM event mask");
    XSelectInput(state.display, state.window, inputEvents | StructureNotifyMask |
        PropertyChangeMask | FocusChangeMask | EnterWindowMask | LeaveWindowMask |
        ButtonPressMask | ButtonReleaseMask | KeyPressMask | KeyReleaseMask);
    // Prime native cursors during window creation, not on the first hover.
    for (int shape = 0; shape < static_cast<int>(NativeCursor::Count); ++shape)
        ApplyCursor(static_cast<NativeCursor>(shape));
    ApplyCursor(NativeCursor::Arrow);
    // An invisible fixture is never mapped, raised, or explicitly focused.
    if (config.visible) XMapWindow(state.display, state.window);
    errors.Finish("Create X11 window");
}

NativeWindow::~NativeWindow() = default;

void NativeWindow::PumpEvents()
{
    auto& state = *impl_;
    state.RequireWindow();
    if (state.pumping)
        throw std::logic_error("X11 PumpEvents cannot be called recursively");
    struct PumpScope {
        bool& pumping;
        explicit PumpScope(bool& value) : pumping(value) { pumping = true; }
        ~PumpScope() { pumping = false; }
    } pumpScope(state.pumping);
    std::vector<NativeWindowEvent> events;
    XFlush(state.display);
    // Fix this batch before callbacks: newly arriving input belongs to the next
    // pump, rather than extending a drain loop indefinitely.
    const int pending = XEventsQueued(state.display, QueuedAfterReading);
    for (int index = 0; index < pending; ++index) {
        XEvent native{};
        XNextEvent(state.display, &native);
        // Legacy repeat is an adjacent release/press pair with identical time.
        if (!state.detectableRepeat && native.type == KeyRelease &&
            XEventsQueued(state.display, QueuedAlready)) {
            XEvent next{};
            XPeekEvent(state.display, &next);
            if (next.type == KeyPress && next.xkey.window == native.xkey.window &&
                next.xkey.keycode == native.xkey.keycode &&
                next.xkey.time == native.xkey.time)
                continue;
        }
        events.clear();
        // Input processing must not introduce a server round trip per message.
        // Xlib's installed handler remains responsible for protocol failures.
        if (native.type == MappingNotify)
            XRefreshKeyboardMapping(&native.xmapping);
        else if (native.xany.window == state.window)
            state.Process(native, events);
        else
            XFilterEvent(&native, None);
        for (const auto& event : events)
            if (state.callback) state.callback(state.callbackContext, event);
    }
}

NativePointerState NativeWindow::SamplePointer()
{
    auto& state = *impl_;
    state.RequireWindow();
    Window root = None, child = None;
    int rootX = 0, rootY = 0, x = 0, y = 0;
    unsigned mask = 0;
    const bool sameScreen = XQueryPointer(state.display, state.window,
        &root, &child, &rootX, &rootY, &x, &y, &mask) != False;
    return {static_cast<double>(x), static_cast<double>(y),
        sameScreen && state.pointerInside && x >= 0 && y >= 0 &&
        x < Width && y < Height};
}

void NativeWindow::Show()
{
    impl_->RequireWindow();
    if (Visible) return;
    XErrors errors(impl_->display);
    XMapWindow(impl_->display, impl_->window);
    errors.Finish("Map X11 game window");
    impl_->visible = Visible = true;
}

void NativeWindow::ApplyCursor(NativeCursor cursor)
{
    auto& state = *impl_;
    state.RequireWindow();
    if (cursor == state.appliedCursor) return;
    const auto index = static_cast<size_t>(cursor);
    if (index >= state.cursors.size())
        throw std::invalid_argument("Invalid X11 cursor");
    if (!state.cursors[index]) {
        if (cursor == NativeCursor::Hidden) {
            const char transparent = 0;
            Pixmap bitmap = XCreateBitmapFromData(state.display, state.window, &transparent, 1, 1);
            if (!bitmap) throw std::runtime_error("Cannot create X11 transparent cursor bitmap");
            XColor black{};
            state.cursors[index] = XCreatePixmapCursor(state.display, bitmap, bitmap,
                                                       &black, &black, 0, 0);
            XFreePixmap(state.display, bitmap);
        } else {
            static constexpr std::array<unsigned, 10> shapes{
                XC_left_ptr, XC_hand2, XC_xterm, XC_fleur, XC_X_cursor,
                XC_sb_h_double_arrow, XC_sb_v_double_arrow, XC_bottom_left_corner,
                XC_bottom_right_corner, XC_watch
            };
            state.cursors[index] = XCreateFontCursor(state.display, shapes[index]);
        }
        if (!state.cursors[index])
            throw std::runtime_error("Cannot create X11 system cursor");
    }
    XDefineCursor(state.display, state.window, state.cursors[index]);
    XFlush(state.display);
    state.appliedCursor = cursor;
}

void NativeWindow::SetTitle(const std::string& title)
{
    impl_->RequireWindow();
    XErrors errors(impl_->display);
    impl_->Title(title);
    errors.Finish("Set X11 title");
}

void NativeWindow::SetFullscreen(bool fullscreen)
{
    auto& state = *impl_;
    state.RequireWindow();
    XErrors errors(state.display);
    XWindowAttributes attributes{};
    if (!XGetWindowAttributes(state.display, state.window, &attributes))
        throw std::runtime_error("Cannot query X11 window attributes");
    if (attributes.map_state == IsUnmapped && !state.visible) {
        auto atoms = state.AtomProperty(state.netState);
        std::vector<Atom> desired;
        for (auto atom : atoms)
            if (atom != state.fullscreenAtom) desired.push_back(atom);
        if (fullscreen) desired.push_back(state.fullscreenAtom);
        XChangeProperty(state.display, state.window, state.netState, XA_ATOM,
            32, PropModeReplace,
            reinterpret_cast<const unsigned char*>(desired.data()),
            static_cast<int>(desired.size()));
    } else {
        XEvent message{};
        message.xclient.type = ClientMessage;
        message.xclient.window = state.window;
        message.xclient.message_type = state.netState;
        message.xclient.format = 32;
        message.xclient.data.l[0] = fullscreen ? 1 : 0;
        message.xclient.data.l[1] = static_cast<long>(state.fullscreenAtom);
        message.xclient.data.l[3] = 1; // EWMH source: application.
        if (!XSendEvent(state.display, DefaultRootWindow(state.display), False,
                SubstructureRedirectMask | SubstructureNotifyMask, &message))
            throw std::runtime_error("Cannot send X11 fullscreen request");
    }
    errors.Finish("Set X11 fullscreen");
}

void NativeWindow::Resize(int width, int height)
{
    impl_->RequireWindow();
    RequireSize(width, height);
    XErrors errors(impl_->display);
    impl_->ConstrainSize(width, height);
    XResizeWindow(impl_->display, impl_->window,
        static_cast<unsigned>(width), static_cast<unsigned>(height));
    errors.Finish("Resize X11 window");
    // ConfigureNotify reports the actual size accepted by the window manager.
}

bool NativeWindow::Minimized() const { impl_->RequireWindow(); return impl_->minimized; }
NativeWindowBackend NativeWindow::Backend() const
{
    impl_->RequireWindow();
    return NativeWindowBackend::X11;
}
NativeSurfaceHandles NativeWindow::SurfaceHandles() const
{
    impl_->RequireWindow();
    return {impl_->display, nullptr, static_cast<unsigned long long>(impl_->window)};
}

} // namespace Sexy
