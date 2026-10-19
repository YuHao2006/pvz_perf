#include "D3d9Api.h"
#include <array>
#include <bit>
#include <thread>

namespace Sexy {
using namespace DX9;
struct D3d9Context::Impl {
    HMODULE library = nullptr;
    HWND window = nullptr;
    DWORD thread = GetCurrentThreadId();
    Com<IDirect3D9Ex> api;
    Com<IDirect3DDevice9Ex> device;
    Com<IDirect3DSwapChain9> swapchain;
    Com<IDirect3DSurface9> backbuffer;
    bool intervalImmediate = true;
    ~Impl() {
        backbuffer.reset(); swapchain.reset(); device.reset(); api.reset();
        if (library) FreeLibrary(library);
    }
};
D3d9Context::D3d9Context(NativeWindowHandle window, bool validation, bool useHdr)
    : hdr(useHdr), impl_(std::make_unique<Impl>())
{
    (void)validation; // The installed D3D9 runtime controls debug validation.
    if (hdr) throw std::runtime_error("Direct3D9Ex supports SDR presentation only");
    if (!window) throw std::invalid_argument("Direct3D9Ex requires a window");
    impl_->window = reinterpret_cast<HWND>(window);
    std::array<wchar_t, MAX_PATH> path{};
    const auto length = GetSystemDirectoryW(path.data(), static_cast<UINT>(path.size()));
    if (!length || length + 11 >= path.size())
        throw std::runtime_error("Cannot locate system d3d9.dll");
    std::wstring library(path.data(), length);
    library += L"\\d3d9.dll";
    impl_->library = LoadLibraryW(library.c_str());
    if (!impl_->library) throw std::runtime_error("Cannot load system d3d9.dll");
    const auto create = std::bit_cast<HRESULT(WINAPI*)(UINT, IDirect3D9Ex**)>(
        GetProcAddress(impl_->library, "Direct3DCreate9Ex"));
    if (!create) throw std::runtime_error("System d3d9.dll has no Direct3DCreate9Ex");
    Check(create(D3D_SDK_VERSION, impl_->api.put()), "Create Direct3D9Ex");
    D3DCAPS9 nativeCaps{};
    Check(impl_->api->GetDeviceCaps(D3DADAPTER_DEFAULT, D3DDEVTYPE_HAL, &nativeCaps), "Read D3D9 caps");
    caps = {nativeCaps.MaxTextureWidth, nativeCaps.MaxTextureHeight,
        nativeCaps.MaxSimultaneousTextures, nativeCaps.MaxPixelShader30InstructionSlots,
        nativeCaps.MaxPShaderInstructionsExecuted, nativeCaps.PS20Caps.DynamicFlowControlDepth,
        nativeCaps.MaxPrimitiveCount};
    if (nativeCaps.VertexShaderVersion < D3DVS_VERSION(3, 0) ||
        nativeCaps.PixelShaderVersion < D3DPS_VERSION(3, 0) ||
        !(nativeCaps.PrimitiveMiscCaps & D3DPMISCCAPS_SEPARATEALPHABLEND) ||
        !(nativeCaps.SrcBlendCaps & D3DPBLENDCAPS_SRCALPHA) ||
        !(nativeCaps.SrcBlendCaps & D3DPBLENDCAPS_ONE) ||
        !(nativeCaps.DestBlendCaps & D3DPBLENDCAPS_INVSRCALPHA) ||
        !(nativeCaps.DestBlendCaps & D3DPBLENDCAPS_ONE))
        throw std::runtime_error("Direct3D9Ex requires SM3 and separate RGB/alpha hardware blending");
    D3DDISPLAYMODE mode{};
    Check(impl_->api->GetAdapterDisplayMode(D3DADAPTER_DEFAULT, &mode), "Read D3D9 display mode");
    for (const auto format : {D3DFMT_A8R8G8B8, D3DFMT_A32B32G32R32F})
        Check(impl_->api->CheckDeviceFormat(D3DADAPTER_DEFAULT, D3DDEVTYPE_HAL,
            mode.Format, D3DUSAGE_RENDERTARGET | D3DUSAGE_QUERY_POSTPIXELSHADER_BLENDING,
            D3DRTYPE_TEXTURE, format), "Required D3D9 render texture format/blending unsupported");
    // Hardware samplers always clamp without mipmaps; shaders implement repeat.
    if (((nativeCaps.TextureCaps & D3DPTEXTURECAPS_POW2) &&
         !(nativeCaps.TextureCaps & D3DPTEXTURECAPS_NONPOW2CONDITIONAL)) ||
        (nativeCaps.TextureCaps & D3DPTEXTURECAPS_SQUAREONLY))
        throw std::runtime_error("Direct3D9Ex requires non-power-of-two clamp textures");
    D3DADAPTER_IDENTIFIER9 adapter{};
    Check(impl_->api->GetAdapterIdentifier(D3DADAPTER_DEFAULT, 0, &adapter), "Read D3D9 adapter");
    adapterDescription = adapter.Description;
    // The implicit chain remains tiny; visible resizes replace an additional chain.
    D3DPRESENT_PARAMETERS parameters{};
    parameters.BackBufferWidth = parameters.BackBufferHeight = 1;
    parameters.BackBufferFormat = D3DFMT_X8R8G8B8;
    parameters.BackBufferCount = 1;
    parameters.SwapEffect = D3DSWAPEFFECT_DISCARD;
    parameters.hDeviceWindow = impl_->window;
    parameters.Windowed = TRUE;
    parameters.PresentationInterval = D3DPRESENT_INTERVAL_IMMEDIATE;
    Check(impl_->api->CreateDeviceEx(D3DADAPTER_DEFAULT, D3DDEVTYPE_HAL, impl_->window,
        D3DCREATE_HARDWARE_VERTEXPROCESSING | D3DCREATE_FPU_PRESERVE,
        &parameters, nullptr, impl_->device.put()), "Create hardware Direct3D9Ex device");
    device = impl_->device.value;
    Check(device->SetMaximumFrameLatency(1), "Set D3D9Ex frame latency");
    RecreateSwapchain();
}
D3d9Context::~D3d9Context() = default;
void D3d9Context::MakeCurrent()
{
    if (GetCurrentThreadId() != impl_->thread)
        throw std::logic_error("Direct3D9Ex used from a foreign render thread");
}
bool D3d9Context::RecreateSwapchain()
{
    MakeCurrent();
    RECT bounds{};
    if (!GetClientRect(impl_->window, &bounds))
        throw std::runtime_error("Cannot read Direct3D9 window extent");
    if (surfaceSuspended || IsIconic(impl_->window) || bounds.right <= 0 || bounds.bottom <= 0)
        return false;
    const unsigned int w = bounds.right, h = bounds.bottom;
    if (impl_->swapchain && width == w && height == h &&
        impl_->intervalImmediate == tearingEnabled) return true;
    D3DPRESENT_PARAMETERS parameters{};
    parameters.BackBufferWidth = w; parameters.BackBufferHeight = h;
    parameters.BackBufferFormat = D3DFMT_X8R8G8B8;
    parameters.BackBufferCount = 1;
    parameters.SwapEffect = D3DSWAPEFFECT_DISCARD;
    parameters.hDeviceWindow = impl_->window;
    parameters.Windowed = TRUE;
    parameters.PresentationInterval = tearingEnabled ?
        D3DPRESENT_INTERVAL_IMMEDIATE : D3DPRESENT_INTERVAL_ONE;
    Com<IDirect3DSwapChain9> next;
    Com<IDirect3DSurface9> surface;
    Check(device->CreateAdditionalSwapChain(&parameters, next.put()), "Create D3D9 additional swapchain");
    Check(next->GetBackBuffer(0, D3DBACKBUFFER_TYPE_MONO, surface.put()), "Get D3D9 backbuffer");
    // Release the device's reference to the previous additional chain's surface.
    Check(device->SetRenderTarget(0, surface.value), "Bind resized D3D9 backbuffer");
    impl_->backbuffer = std::move(surface);
    backBuffer = impl_->backbuffer.value;
    impl_->swapchain = std::move(next);
    width = w; height = h; impl_->intervalImmediate = tearingEnabled;
    ++swapchainGeneration;
    return true;
}
void D3d9Context::WaitIdle()
{
    MakeCurrent();
    Com<IDirect3DQuery9> event;
    Check(device->CreateQuery(D3DQUERYTYPE_EVENT, event.put()), "Create D3D9 completion query");
    Check(event->Issue(D3DISSUE_END), "Issue D3D9 completion query");
    HRESULT result;
    while ((result = event->GetData(nullptr, 0, D3DGETDATA_FLUSH)) == S_FALSE)
        std::this_thread::yield();
    Check(result, "Wait for D3D9 completion");
}
bool D3d9Context::BeginPresent()
{
    MakeCurrent();
    const HRESULT state = device->CheckDeviceState(impl_->window);
    if (state == S_PRESENT_OCCLUDED) return false;
    Check(state, "D3D9Ex device unavailable; resource-preserving recovery is impossible");
    return RecreateSwapchain();
}
void D3d9Context::Present()
{
    MakeCurrent();
    if (!impl_->swapchain) throw std::logic_error("D3D9 has no presentation surface");
    Check(impl_->swapchain->Present(nullptr, nullptr, nullptr, nullptr, 0), "Present D3D9 additional swapchain");
}
}
