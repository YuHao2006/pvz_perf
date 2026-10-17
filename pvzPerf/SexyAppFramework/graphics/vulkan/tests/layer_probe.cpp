// Manual diagnostic, not a passing CTest gate. Never opens a visible window or
// modifies another process, RTSS/OBS settings, desktop mode, or game saves.
#ifdef _WIN32
#define NOMINMAX
#include <Windows.h>
#endif
#include "TestWin32Window.h"
#include <atomic>
#include <cstring>
#include <iostream>
#include <string>

namespace {
std::atomic<unsigned> errors = 0;
bool tracedCreate = false, tracedPresent = false;
std::vector<uintptr_t> rtssSlots;
void PrintStack() {
#ifdef _WIN32
    void* frames[28]{};
    const auto count = CaptureStackBackTrace(0, 28, frames, nullptr);
    for (unsigned i = 0; i < count; ++i) {
        HMODULE module = nullptr;
        char filename[1024]{};
        if (GetModuleHandleExA(GET_MODULE_HANDLE_EX_FLAG_FROM_ADDRESS | GET_MODULE_HANDLE_EX_FLAG_UNCHANGED_REFCOUNT,
            reinterpret_cast<LPCSTR>(frames[i]), &module)) {
            GetModuleFileNameA(module, filename, sizeof(filename));
            const char* name = std::strrchr(filename, '\\');
            std::cerr << "  STACK " << i << ' ' << (name ? name + 1 : filename) << "+0x" << std::hex
                << (reinterpret_cast<uintptr_t>(frames[i]) - reinterpret_cast<uintptr_t>(module)) << std::dec << '\n';
        }
    }
    // Optional read-only slots obtained from this particular DLL's disassembly,
    // not a hardcoded dependency on an RTSS version or an attempt to patch it.
    const auto rtss = GetModuleHandleA("RTSSHooks64.dll");
    if (rtss) for (auto slot : rtssSlots) {
        uintptr_t target = 0;
        if (ReadProcessMemory(GetCurrentProcess(), reinterpret_cast<const void*>(reinterpret_cast<uintptr_t>(rtss) + slot),
            &target, sizeof(target), nullptr)) {
            HMODULE owner = nullptr;
            char name[1024]{};
            if (target && GetModuleHandleExA(GET_MODULE_HANDLE_EX_FLAG_FROM_ADDRESS | GET_MODULE_HANDLE_EX_FLAG_UNCHANGED_REFCOUNT,
                reinterpret_cast<LPCSTR>(target), &owner)) {
                GetModuleFileNameA(owner, name, sizeof(name));
                std::cerr << "  RTSS SLOT +0x" << std::hex << slot << " -> " << name << "+0x"
                    << (target - reinterpret_cast<uintptr_t>(owner)) << std::dec << '\n';
            }
        }
    }
#else
    std::cerr << "  Stack probe is currently implemented for Windows only.\n";
#endif
}
VkBool32 VKAPI_CALL Validate(VkDebugUtilsMessageSeverityFlagBitsEXT severity,
    VkDebugUtilsMessageTypeFlagsEXT types, const VkDebugUtilsMessengerCallbackDataEXT* data, void* user) {
    if (severity >= VK_DEBUG_UTILS_MESSAGE_SEVERITY_ERROR_BIT_EXT) ++errors;
    VulkanInitConfig::DefaultDebugCallback(severity, types, data, user);
    if (!tracedCreate && std::strstr(data->pMessage, "vkCreateSwapchainKHR")) {
        tracedCreate = true; PrintStack();
    }
    if (!tracedPresent && std::strstr(data->pMessage, "PRESENT_AFTER_WRITE")) {
        tracedPresent = true; PrintStack();
    }
    return VK_FALSE;
}
}
int main(int argc, char** argv) {
    try {
        VulkanInitConfig init;
        init.enableValidation = true; init.debugCallback = Validate;
        auto config = VulkanTest::SwapchainConfig();
        for (int arg = 1; arg < argc; ++arg) {
            const std::string option = argv[arg];
            if (option == "--srgb") config.imageFormat = VK_FORMAT_B8G8R8A8_SRGB;
            else if (option.starts_with("--rtss-slot=")) rtssSlots.push_back(std::stoull(option.substr(12), nullptr, 0));
            else throw std::invalid_argument("Unknown layer probe option: " + option);
        }
        std::cout << "APP swapchain imageUsage=" << config.imageUsage
            << " format=" << config.imageFormat << '\n';
        {
            VulkanTest::Window native(320,240);
            VulkanContext window(init, native.hwnd, config);
            for (int frame = 0; frame < 4; ++frame) {
                const auto context = window.BeginCommands();
                if (!context.valid) throw std::runtime_error("Layer probe did not acquire a drawable frame");
                window.BeginPresentPass({{0,0,0,1}});
                window.EndFrame();
            }
        }
        std::cout << "OBSERVED validation errors=" << errors << '\n';
        return errors ? 2 : 0;
    } catch (const std::exception& error) {
        std::cerr << "FAIL probe initialization: " << error.what() << '\n';
        return 1;
    }
}
