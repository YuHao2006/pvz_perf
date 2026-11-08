#include "WindowsSaveUpgrade.h"
#include "Common.h"
#define WIN32_LEAN_AND_MEAN
#define NOMINMAX
#include <windows.h>

#include <filesystem>
#include <stdexcept>
#include <array>

namespace Sexy {
bool WindowsUpgradeLevelSaveFile(const std::string& path)
{
    // Lazy load: current saves never load the converter or pay its memory cost.
    const auto filename = std::filesystem::path(GetExecutableDirectory()) / "data" / "pvz_dfu.dll";
    HMODULE library = LoadLibraryExW(filename.c_str(), nullptr, LOAD_WITH_ALTERED_SEARCH_PATH);
    if (!library) throw std::runtime_error("Save needs an upgrade: " + path + "\nCannot load " + filename.string() +
        " (Win32 error " + std::to_string(GetLastError()) + ")");
    struct CloseLibrary { HMODULE handle; ~CloseLibrary() { FreeLibrary(handle); } } close{library};
    using Convert = int (*)(const char*, const char*, char*, std::size_t) noexcept;
    auto convert = reinterpret_cast<Convert>(GetProcAddress(library, "pvz_dfu_process_v1"));
    if (!convert) throw std::runtime_error("Save needs an upgrade: " + path + "\nBundled converter ABI is missing");
    const std::filesystem::path staging = path + ".upgrade-v5.tmp";
    struct RemoveStaging {
        std::filesystem::path path;
        ~RemoveStaging() { std::error_code error; std::filesystem::remove(path, error); }
    } cleanup{staging};
    // This uniquely named staging file belongs to DFU; retry an interrupted upgrade.
    std::filesystem::remove(staging);
    std::array<char, 2048> error{};
    const auto result = convert(path.c_str(), staging.string().c_str(), error.data(), error.size());
    if (result == 0) return false;
    if (result != 1)
        throw std::runtime_error("Save upgrade failed: " + path + "\n" + error.data());
    // Converter fully validates its output before returning. Same-directory replacement
    // replaces the old file only after validation; failed conversion/rename
    // leaves the original save intact. Nothing runs in the simulation loop.
    if (!MoveFileExW(staging.c_str(), std::filesystem::path(path).c_str(),
        MOVEFILE_REPLACE_EXISTING | MOVEFILE_WRITE_THROUGH))
        throw std::runtime_error("Cannot commit upgraded save: " + path +
            " (Win32 error " + std::to_string(GetLastError()) + ")");
    return true;
}
}
