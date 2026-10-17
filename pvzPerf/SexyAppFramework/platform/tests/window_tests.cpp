#include "NativeWindow.h"
#include <chrono>
#include <iostream>
#include <stdexcept>
#include <string_view>
#include <thread>
#include <vector>

#ifdef PVZ_WINDOW_TEST_WAYLAND
#include <wayland-client.h>
#include <algorithm>
#include <linux/memfd.h>
#include <sys/mman.h>
#include <sys/syscall.h>
#include <unistd.h>

namespace {
// A software buffer is needed to map a real Wayland surface; visible=true
// alone deliberately does not attach a buffer in the production adapter.
struct WaylandTestBuffer {
    wl_registry* registry = nullptr;
    wl_shm* shm = nullptr;
    wl_buffer* buffer = nullptr;

    static void Global(void* data, wl_registry* registry, uint32_t name,
                       const char* interface, uint32_t)
    {
        auto& self = *static_cast<WaylandTestBuffer*>(data);
        if (std::string_view(interface) == "wl_shm") {
            self.shm = static_cast<wl_shm*>(
                wl_registry_bind(registry, name, &wl_shm_interface, 1));
            static const wl_shm_listener listener{
                [](void*, wl_shm*, uint32_t) {}
            };
            wl_shm_add_listener(self.shm, &listener, nullptr);
        }
    }

    void Map(Sexy::NativeWindow& window)
    {
        const auto handles = window.SurfaceHandles();
        auto* display = static_cast<wl_display*>(handles.connection);
        registry = wl_display_get_registry(display);
        static const wl_registry_listener listener{
            Global, [](void*, wl_registry*, uint32_t) {}
        };
        if (wl_registry_add_listener(registry, &listener, this) < 0 ||
            wl_display_roundtrip(display) < 0 || !shm)
            throw std::runtime_error("Cannot bind Wayland test SHM");
        const int stride = window.Width * 4;
        const int bytes = stride * window.Height;
        const int descriptor = static_cast<int>(syscall(
            SYS_memfd_create, "pvz-window-input-test", MFD_CLOEXEC));
        if (descriptor < 0)
            throw std::runtime_error("Cannot create Wayland test buffer file");
        if (ftruncate(descriptor, bytes) < 0) {
            close(descriptor);
            throw std::runtime_error("Cannot size Wayland test buffer");
        }
        void* pixels = mmap(nullptr, bytes, PROT_READ | PROT_WRITE,
                            MAP_SHARED, descriptor, 0);
        if (pixels == MAP_FAILED) {
            close(descriptor);
            throw std::runtime_error("Cannot map Wayland test pixels");
        }
        std::fill_n(static_cast<uint32_t*>(pixels), bytes / 4, 0xff406060u);
        wl_shm_pool* pool = wl_shm_create_pool(shm, descriptor, bytes);
        buffer = wl_shm_pool_create_buffer(pool, 0, window.Width, window.Height,
                                           stride, WL_SHM_FORMAT_XRGB8888);
        wl_shm_pool_destroy(pool);
        munmap(pixels, bytes);
        close(descriptor);
        auto* surface = static_cast<wl_surface*>(handles.surface);
        wl_surface_attach(surface, buffer, 0, 0);
        wl_surface_damage(surface, 0, 0, window.Width, window.Height);
        wl_surface_commit(surface);
    }

    ~WaylandTestBuffer()
    {
        if (buffer) wl_buffer_destroy(buffer);
        if (shm) wl_shm_destroy(shm);
        if (registry) wl_registry_destroy(registry);
    }
};
}
#endif

#ifdef PVZ_WINDOW_TEST_X11
#include <X11/Xlib.h>
#include <X11/Xutil.h>
#include <X11/keysym.h>

namespace {
void CheckFixedSize(Sexy::NativeWindow& window, int width, int height)
{
    const auto handles = window.SurfaceHandles();
    XSizeHints hints{};
    long supplied = 0;
    if (!XGetWMNormalHints(static_cast<Display*>(handles.connection),
            static_cast<Window>(handles.windowId), &hints, &supplied) ||
        (hints.flags & (PMinSize | PMaxSize)) != (PMinSize | PMaxSize) ||
        hints.min_width != width || hints.max_width != width ||
        hints.min_height != height || hints.max_height != height)
        throw std::runtime_error("X11 fixed content bounds disagree with requested size");
}

struct X11Capture {
    Display* display = nullptr;
    Window window = None;
    std::vector<Sexy::NativeWindowEvent> events;
    bool injectClose = false;

    static void Receive(void* context, const Sexy::NativeWindowEvent& event)
    {
        auto& self = *static_cast<X11Capture*>(context);
        self.events.push_back(event);
        if (!self.injectClose || event.kind != Sexy::NativeWindowEventKind::MouseButton)
            return;
        self.injectClose = false;
        XEvent close{};
        close.xclient.type = ClientMessage;
        close.xclient.display = self.display;
        close.xclient.window = self.window;
        close.xclient.message_type = XInternAtom(self.display, "WM_PROTOCOLS", False);
        close.xclient.format = 32;
        close.xclient.data.l[0] = XInternAtom(self.display, "WM_DELETE_WINDOW", False);
        for (int i = 0; i < 16; ++i)
            if (!XSendEvent(self.display, self.window, False, NoEventMask, &close))
                throw std::runtime_error("Cannot inject X11 callback work");
        XSync(self.display, False);
    }
};

void CheckX11Input()
{
    using Kind = Sexy::NativeWindowEventKind;
    X11Capture capture;
    Sexy::NativeWindowConfig config;
    config.visible = false;
    config.callback = X11Capture::Receive;
    config.callbackContext = &capture;
    Sexy::NativeWindow window(config);
    const auto handles = window.SurfaceHandles();
    capture.display = static_cast<Display*>(handles.connection);
    capture.window = static_cast<Window>(handles.windowId);
    window.PumpEvents();
    capture.events.clear();
    XWindowAttributes attributes{};
    if (!XGetWindowAttributes(capture.display, capture.window, &attributes) ||
        (attributes.your_event_mask & PointerMotionMask))
        throw std::runtime_error("X11 still subscribes to pointer motion");

    std::vector<XEvent> input(1000);
    for (auto& event : input) {
        event.xmotion.type = MotionNotify;
        event.xmotion.display = capture.display;
        event.xmotion.window = capture.window;
        event.xmotion.x = 700;
        event.xmotion.y = 500;
    }
    XEvent button{};
    button.xbutton.type = ButtonPress;
    button.xbutton.display = capture.display;
    button.xbutton.window = capture.window;
    button.xbutton.button = Button1;
    button.xbutton.time = 1234;
    button.xbutton.x = 12;
    button.xbutton.y = 34;
    input.push_back(button);
    XEvent key{};
    key.xkey.type = KeyPress;
    key.xkey.display = capture.display;
    key.xkey.window = capture.window;
    key.xkey.keycode = XKeysymToKeycode(capture.display, XK_a);
    input.push_back(key);
    button.xbutton.type = ButtonRelease;
    button.xbutton.time = 1400;
    button.xbutton.x = 56;
    button.xbutton.y = 78;
    input.push_back(button);
    key.xkey.type = KeyRelease;
    input.push_back(key);
    for (auto it = input.rbegin(); it != input.rend(); ++it)
        XPutBackEvent(capture.display, &*it);
    capture.injectClose = true;
    window.PumpEvents();

    std::vector<Sexy::NativeWindowEvent> discrete;
    for (const auto& event : capture.events) {
        if (event.kind == Kind::MouseMove || event.kind == Kind::Close)
            throw std::runtime_error("Motion emitted or pump extended its initial batch");
        if (event.kind == Kind::MouseButton || event.kind == Kind::Key)
            discrete.push_back(event);
    }
    if (discrete.size() != 4 || discrete[0].kind != Kind::MouseButton ||
        !discrete[0].pressed || discrete[0].x != 12 || discrete[0].y != 34 ||
        discrete[0].timeMs != 1234 ||
        discrete[1].kind != Kind::Key || !discrete[1].pressed ||
        discrete[2].kind != Kind::MouseButton || discrete[2].pressed ||
        discrete[2].x != 56 || discrete[2].y != 78 ||
        discrete[2].timeMs != 1400 ||
        discrete[3].kind != Kind::Key || discrete[3].pressed)
        throw std::runtime_error("X11 changed event coordinates or keyboard/button FIFO");
    capture.events.clear();
    window.PumpEvents();
    size_t closeCount = 0;
    for (const auto& event : capture.events)
        if (event.kind == Kind::Close)
            ++closeCount;
    if (closeCount != 16)
        throw std::runtime_error("X11 lost callback-arrival work on the next pump");
    std::cout << "x11-no-motion-subscription=PASS sent-motion-ui-suppressed=PASS "
                 "button-key-fifo=PASS button-coordinates=PASS snapshot-batch=PASS\n";
}
}
#endif

int main(int argc, char** argv) {
    try {
        const bool interactive = argc == 2 && std::string_view(argv[1]) == "--interactive";
        const bool visible = interactive ||
            (argc == 2 && std::string_view(argv[1]) == "--visible");
        if (argc > 2 || (argc > 1 && !visible))
            throw std::runtime_error("Expected no arguments, --visible or --interactive");
#ifdef PVZ_WINDOW_TEST_X11
        CheckX11Input();
#endif
        for (int cycle = 0; cycle < (interactive ? 1 : 4); ++cycle) {
            Sexy::NativeWindowConfig config;
            config.width = interactive ? 800 : 86;
            config.height = interactive ? 600 : 36;
            config.visible = false;
            config.title = "PVZ native window gate";
            std::vector<Sexy::NativeWindowEvent> received;
            config.callbackContext = &received;
            config.callback = [](void* data, const Sexy::NativeWindowEvent& event) {
                if (event.kind == Sexy::NativeWindowEventKind::MouseMove)
                    throw std::runtime_error("Protocol motion still drives UI callbacks");
                static_cast<std::vector<Sexy::NativeWindowEvent>*>(data)->push_back(event);
                if (event.kind == Sexy::NativeWindowEventKind::MouseButton)
                    std::cout << "button=" << event.button << " down=" << event.pressed
                              << " x=" << event.x << " y=" << event.y << '\n';
            };
            Sexy::NativeWindow window(config);
#ifdef PVZ_WINDOW_TEST_X11
            CheckFixedSize(window, config.width, config.height);
#endif
            if (!visible) {
                window.Resize(config.width * 2, config.height * 2);
#ifdef PVZ_WINDOW_TEST_X11
                CheckFixedSize(window, config.width * 2, config.height * 2);
#endif
                for (int i = 0; i < 10; ++i) window.PumpEvents();
                if (window.Width != config.width * 2 || window.Height != config.height * 2)
                    throw std::runtime_error("Application-driven scale size was not applied");
                window.Resize(config.width, config.height);
#ifdef PVZ_WINDOW_TEST_X11
                CheckFixedSize(window, config.width, config.height);
#endif
            }
            if (visible) {
                window.Show();
                if (!window.Visible)
                    throw std::runtime_error("Native Show did not publish mapping intent");
            }
            for (int shape = 0; shape < static_cast<int>(Sexy::NativeCursor::Count); ++shape)
                window.ApplyCursor(static_cast<Sexy::NativeCursor>(shape));
            window.ApplyCursor(Sexy::NativeCursor::Arrow);
#ifdef PVZ_WINDOW_TEST_WAYLAND
            WaylandTestBuffer buffer;
            if (visible)
                buffer.Map(window);
#endif
            const auto native = window.SurfaceHandles();
            if (!native.connection ||
                (window.Backend() == Sexy::NativeWindowBackend::X11 && !native.windowId) ||
                (window.Backend() == Sexy::NativeWindowBackend::Wayland && !native.surface))
                throw std::runtime_error("Missing native surface handle");
            window.SetTitle("PVZ native window gate updated");
            const auto start = std::chrono::steady_clock::now();
            for (int i = 0; i < 100; ++i) window.PumpEvents();
            const auto pointer = window.SamplePointer();
            if (!visible && pointer.inside)
                throw std::runtime_error("Unmapped fixture reports pointer focus");
            const auto elapsed = std::chrono::steady_clock::now() - start;
            if (elapsed > std::chrono::seconds(1))
                throw std::runtime_error("Empty event pumping blocked");
            if (window.Width <= 0 || window.Height <= 0)
                throw std::runtime_error("Invalid configured dimensions");
            if (!visible && (window.Width != config.width || window.Height != config.height))
                throw std::runtime_error("Window did not restore its unscaled content size");
            if (interactive) {
                const auto end = std::chrono::steady_clock::now() + std::chrono::seconds(15);
                size_t samples = 0, insideSamples = 0;
                while (std::chrono::steady_clock::now() < end) {
                    const auto tick = std::chrono::steady_clock::now();
                    window.PumpEvents();
                    insideSamples += window.SamplePointer().inside;
                    ++samples;
                    if (!received.empty() &&
                        received.back().kind == Sexy::NativeWindowEventKind::Close)
                        break;
                    std::this_thread::sleep_until(tick + std::chrono::milliseconds(10));
                }
                std::cout << "samples=" << samples << " inside=" << insideSamples
                          << " discrete-callbacks=" << received.size() << '\n';
            }
        }
        std::cout << "native-handles=PASS nonblocking-pump=PASS "
                     "pointer-sample=PASS window-lifetime-4-cycles=PASS "
                     "application-resize-restore=PASS\n";
        return 0;
    } catch (const std::exception& error) {
        std::cerr << "Native window gate failed: " << error.what() << '\n';
        return 1;
    }
}
