#include "SexyAppFramework/platform/UserDirectories.h"
#include <array>
#include <cstdio>
#include <filesystem>
#include <memory>
#if defined(SEXY_WINDOW_LINUX)
#include <cerrno>
#include <pwd.h>
#include <stdexcept>
#include <unistd.h>
#include <vector>
#endif

namespace Sexy {
#if defined(SEXY_WINDOW_LINUX)
std::string LinuxInstanceLockPath() {
    // Portable packages can each supply a different PVZ_APPDATA_DIR.
    // Use the login account's state directory for the shared instance lock.
    std::vector<char> buffer(1024);
    passwd entry{};
    passwd* account = nullptr;
    int status = getpwuid_r(geteuid(), &entry, buffer.data(), buffer.size(), &account);
    while (status == ERANGE) {
        buffer.resize(buffer.size() * 2);
        status = getpwuid_r(geteuid(), &entry, buffer.data(), buffer.size(), &account);
    }
    if (status != 0 || !account || !account->pw_dir ||
        !std::filesystem::path(account->pw_dir).is_absolute()) {
        throw std::runtime_error("Cannot resolve the Linux user's home directory for the instance lock");
    }
    const auto directory = std::filesystem::path(account->pw_dir) / ".local/state/pvz_perf";
    std::filesystem::create_directories(directory);
    return (directory / ".instance.lock").string();
}
#endif

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
