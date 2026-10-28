#include "OpenGLContext.h"
#include "OpenGLApi.h"
#include <stdexcept>
#include <thread>

namespace Sexy {
namespace {
using CreateContextAttribs = HGLRC (WINAPI*)(HDC, HGLRC, const int*);
using SwapInterval = BOOL (WINAPI*)(int);
constexpr int WglContextMajorVersion = 0x2091;
constexpr int WglContextMinorVersion = 0x2092;

[[noreturn]] void Fail(const char* operation)
{
    throw std::runtime_error(std::string(operation) + " failed: " + std::to_string(GetLastError()));
}

void SetWindowPixelFormat(HDC dc)
{
    PIXELFORMATDESCRIPTOR wanted{};
    wanted.nSize = sizeof(wanted);
    wanted.nVersion = 1;
    wanted.dwFlags = PFD_DRAW_TO_WINDOW | PFD_SUPPORT_OPENGL | PFD_DOUBLEBUFFER;
    wanted.iPixelType = PFD_TYPE_RGBA;
    wanted.cColorBits = 32;
    wanted.cAlphaBits = 8;
    wanted.iLayerType = PFD_MAIN_PLANE;
    int format = GetPixelFormat(dc);
    if (!format) {
        format = ChoosePixelFormat(dc, &wanted);
        if (!format) Fail("ChoosePixelFormat");
        if (!SetPixelFormat(dc, format, &wanted)) Fail("SetPixelFormat");
    }
    PIXELFORMATDESCRIPTOR actual{};
    if (!DescribePixelFormat(dc, format, sizeof(actual), &actual)) Fail("DescribePixelFormat");
    const DWORD required = PFD_DRAW_TO_WINDOW | PFD_SUPPORT_OPENGL | PFD_DOUBLEBUFFER;
    if ((actual.dwFlags & required) != required || actual.iPixelType != PFD_TYPE_RGBA ||
        actual.cColorBits < 24)
        throw std::runtime_error("OpenGL requires a double-buffered RGBA desktop pixel format");
}
}

struct OpenGLContext::Impl {
    HWND window{};
    HDC dc{};
    HGLRC context{};
    bool ownsWindow = false;
    bool validation = false;
    SwapInterval swapInterval{};
    int appliedInterval = -1;
    std::thread::id owner = std::this_thread::get_id();

    ~Impl()
    {
        if (context) {
            if (wglGetCurrentContext() == context) wglMakeCurrent(nullptr, nullptr);
            wglDeleteContext(context);
        }
        if (dc) ReleaseDC(window, dc);
        if (ownsWindow && window) DestroyWindow(window);
    }
};

OpenGLContext::OpenGLContext(NativeWindowHandle hwnd, bool validation, bool requestedHdr)
    : impl_(std::make_unique<Impl>())
{
    (void)requestedHdr; // This backend always presents SDR, including on Win10.
    if (!hwnd || !IsWindow(hwnd)) throw std::invalid_argument("OpenGLContext requires a live HWND");
    const HDC previousDc = wglGetCurrentDC();
    const HGLRC previousContext = wglGetCurrentContext();
    try {
        Impl dummy;
        CreateContextAttribs createContext = nullptr;
        {
            static const char className[] = "pvz_opengl_bootstrap";
            WNDCLASSA windowClass{};
            windowClass.style = CS_OWNDC;
            windowClass.lpfnWndProc = DefWindowProcA;
            windowClass.hInstance = GetModuleHandleW(nullptr);
            windowClass.lpszClassName = className;
            if (!RegisterClassA(&windowClass) && GetLastError() != ERROR_CLASS_ALREADY_EXISTS)
                Fail("RegisterClass(OpenGL bootstrap)");
            dummy.ownsWindow = true;
            dummy.window = CreateWindowExA(0, className, "", WS_POPUP, 0, 0, 1, 1,
                nullptr, nullptr, windowClass.hInstance, nullptr);
            if (!dummy.window) Fail("CreateWindow(OpenGL bootstrap)");
            dummy.dc = GetDC(dummy.window);
            if (!dummy.dc) Fail("GetDC(OpenGL bootstrap)");
            SetWindowPixelFormat(dummy.dc);
            dummy.context = wglCreateContext(dummy.dc);
            if (!dummy.context) Fail("wglCreateContext(OpenGL bootstrap)");
            if (!wglMakeCurrent(dummy.dc, dummy.context)) Fail("wglMakeCurrent(OpenGL bootstrap)");
            createContext = reinterpret_cast<CreateContextAttribs>(
                GL3::GetProcAddress("wglCreateContextAttribsARB"));
        }
        impl_->window = hwnd;
        impl_->validation = validation;
        impl_->dc = GetDC(hwnd);
        if (!impl_->dc) Fail("GetDC(OpenGL)");
        SetWindowPixelFormat(impl_->dc);
        if (createContext) {
            // GL 3.0 has no core/compatibility profile mask. Do not request 3.1+ flags.
            static constexpr int attributes[] = {WglContextMajorVersion, 3, WglContextMinorVersion, 0, 0};
            impl_->context = createContext(impl_->dc, nullptr, attributes);
            if (!impl_->context) Fail("wglCreateContextAttribsARB(OpenGL 3.0)");
        }
        else impl_->context = wglCreateContext(impl_->dc);
        if (!impl_->context) Fail("Create OpenGL context");
        MakeCurrent();
        const auto versionText = reinterpret_cast<const char*>(glGetString(GL_VERSION));
        if (!versionText) throw std::runtime_error("OpenGL driver returned no GL_VERSION");
        // GL 1.x/2.x produces INVALID_ENUM here; accepting a parsed string alone is unsafe.
        while (glGetError() != GL_NO_ERROR) {}
        glGetIntegerv(GL_MAJOR_VERSION, &majorVersion);
        glGetIntegerv(GL_MINOR_VERSION, &minorVersion);
        if (glGetError() != GL_NO_ERROR || majorVersion < 3)
            throw std::runtime_error(std::string("Desktop OpenGL >= 3.0 required; driver reports ") + versionText);
        GL3::Load();
        const auto renderer = reinterpret_cast<const char*>(glGetString(GL_RENDERER));
        adapterDescription = std::string(renderer ? renderer : "OpenGL") + " / " + versionText;
        impl_->swapInterval = reinterpret_cast<SwapInterval>(GL3::GetProcAddress("wglSwapIntervalEXT"));
        tearingSupported = impl_->swapInterval != nullptr;
        RecreateSwapchain();
    } catch (...) {
        impl_.reset();
        wglMakeCurrent(previousDc, previousContext);
        throw;
    }
}

OpenGLContext::~OpenGLContext() = default;

void OpenGLContext::MakeCurrent()
{
    if (std::this_thread::get_id() != impl_->owner)
        throw std::logic_error("OpenGLContext must be used on its render thread");
    if (wglGetCurrentContext() != impl_->context || wglGetCurrentDC() != impl_->dc)
        if (!wglMakeCurrent(impl_->dc, impl_->context)) Fail("wglMakeCurrent");
}

bool OpenGLContext::RecreateSwapchain()
{
    MakeCurrent();
    RECT client{};
    if (!GetClientRect(impl_->window, &client)) Fail("GetClientRect(OpenGL)");
    if (surfaceSuspended || IsIconic(impl_->window) ||
        client.right <= client.left || client.bottom <= client.top) return false;
    const auto newWidth = static_cast<unsigned int>(client.right - client.left);
    const auto newHeight = static_cast<unsigned int>(client.bottom - client.top);
    if (newWidth == width && newHeight == height) return false;
    width = newWidth;
    height = newHeight;
    ++swapchainGeneration;
    return true;
}

void OpenGLContext::WaitIdle()
{
    MakeCurrent();
    glFinish();
}

bool OpenGLContext::BeginPresent()
{
    RecreateSwapchain();
    RECT client{};
    if (!GetClientRect(impl_->window, &client)) Fail("GetClientRect(OpenGL present)");
    if (surfaceSuspended || IsIconic(impl_->window) ||
        client.right <= client.left || client.bottom <= client.top) return false;
    if (impl_->swapInterval) {
        const int interval = tearingEnabled ? 0 : 1;
        if (interval != impl_->appliedInterval) {
            if (impl_->swapInterval(interval)) {
                impl_->appliedInterval = interval;
            } else {
                // Swap control is optional; retain the driver's default interval.
                impl_->swapInterval = nullptr;
                tearingSupported = false;
            }
        }
    }
    GL3::glBindFramebuffer(GL_FRAMEBUFFER, 0);
    glDrawBuffer(GL_BACK);
    return width > 0 && height > 0;
}

void OpenGLContext::Present()
{
    MakeCurrent();
    if (surfaceSuspended || IsIconic(impl_->window)) return;
    if (impl_->validation) GL3::CheckError("Present");
    if (!SwapBuffers(impl_->dc)) Fail("SwapBuffers");
}
}
