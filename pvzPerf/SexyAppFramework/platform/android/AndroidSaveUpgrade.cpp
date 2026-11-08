#include "AndroidSaveUpgrade.h"
#include <dlfcn.h>
#include <filesystem>
#include <stdexcept>
#include <array>

namespace Sexy {
bool AndroidUpgradeLevelSaveFile(const std::string& path)
{
    // Lazy load: current saves never load the converter or pay its memory cost.
    void* library = dlopen("libpvz_dfu.so", RTLD_NOW | RTLD_LOCAL);
    if (!library) throw std::runtime_error("Save needs an upgrade: " + path + "\nCannot load bundled save converter: " + dlerror());
    struct CloseLibrary { void* handle; ~CloseLibrary() { dlclose(handle); } } close{library};
    using Convert = int (*)(const char*, const char*, char*, std::size_t) noexcept;
    auto convert = reinterpret_cast<Convert>(dlsym(library, "pvz_dfu_process_v1"));
    if (!convert) throw std::runtime_error("Save needs an upgrade: " + path + "\nBundled converter ABI is missing");
    const std::filesystem::path staging = path + ".upgrade-v5.tmp";
    struct RemoveStaging {
        std::filesystem::path path;
        ~RemoveStaging() { std::error_code error; std::filesystem::remove(path, error); }
    } cleanup{staging};
    // This uniquely named staging file belongs to DFU; retry an interrupted upgrade.
    std::filesystem::remove(staging);
    std::array<char, 2048> error{};
    const auto result = convert(path.c_str(), staging.c_str(), error.data(), error.size());
    if (result == 0) return false;
    if (result != 1)
        throw std::runtime_error("Save upgrade failed: " + path + "\n" + error.data());
    // Converter fully validates its output before returning. Same-directory
    // POSIX rename atomically replaces the old file; failed conversion/rename
    // leaves the original save intact. Nothing runs in the simulation loop.
    std::filesystem::rename(staging, path);
    return true;
}
}
