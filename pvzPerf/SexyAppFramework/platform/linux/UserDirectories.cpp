#include "SexyAppFramework/platform/UserDirectories.h"
#include <array>
#include <cstdio>
#include <filesystem>
#include <memory>

namespace Sexy {
std::optional<std::string> ResolveDesktopDirectory() {
    // The XDG utility interprets user-dirs.dirs; no home/Desktop assumption.
    std::unique_ptr<FILE, decltype(&pclose)> process(
        popen("xdg-user-dir DESKTOP", "r"), &pclose);
    if (!process) return std::nullopt;
    std::string path;
    std::array<char, 256> buffer{};
    while (fgets(buffer.data(), static_cast<int>(buffer.size()), process.get()))
        path += buffer.data();
    const bool readFailed = ferror(process.get()) != 0;
    const int status = pclose(process.release());
    if (!path.empty() && path.back() == '\n') path.pop_back();
    if (readFailed || status != 0 || !std::filesystem::path(path).is_absolute())
        return std::nullopt;
    return path;
}
}
