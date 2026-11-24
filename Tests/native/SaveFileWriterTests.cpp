#include "../../pvzPerf/SexyAppFramework/platform/SaveFileWriter.h"
#include <fstream>
#include <iostream>
#include <iterator>
#ifdef _WIN32
#include <windows.h>
#else
#include <csignal>
#include <sys/resource.h>
#endif

int main()
{
    namespace fs = std::filesystem;
    const auto unique = std::chrono::steady_clock::now().time_since_epoch().count();
    const auto directory = fs::temp_directory_path() / ("pvz-save-write-" + std::to_string(unique));
    if (!fs::create_directory(directory)) return 1;
    const auto file = directory / "user2.dat64";
    const auto path = file.string();
    const std::string original = "previous progress", next = "new progress";
    if (!Sexy::WriteSaveFile(path, original.data(), original.size())) return 1;
#ifdef _WIN32
    // A reader permits writes but denies replacement of the authoritative file.
    HANDLE reader = CreateFileW(file.c_str(), GENERIC_READ, FILE_SHARE_READ | FILE_SHARE_WRITE,
        nullptr, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, nullptr);
    if (reader == INVALID_HANDLE_VALUE) return 1;
#else
    // Force even the first buffered byte to fail at flush/close.
    struct rlimit limit{};
    if (getrlimit(RLIMIT_FSIZE, &limit)) return 1;
    auto zero = limit;
    zero.rlim_cur = 0;
    if (std::signal(SIGXFSZ, SIG_IGN) == SIG_ERR || setrlimit(RLIMIT_FSIZE, &zero)) return 1;
#endif
    const bool published = Sexy::WriteSaveFile(path, next.data(), next.size());
#ifdef _WIN32
    CloseHandle(reader);
#else
    if (setrlimit(RLIMIT_FSIZE, &limit)) return 1;
#endif
    auto read = [&]() {
        std::ifstream in(file, std::ios::binary);
        return std::string(std::istreambuf_iterator<char>(in), {});
    };
    const bool passed = !published && read() == original &&
        Sexy::WriteSaveFile(path, next.data(), next.size()) && read() == next;
    fs::remove(file);
    const bool empty = fs::remove(directory);
    if (!passed || !empty) return 1;
    std::cout << "Failed save preserved the old bytes; retry committed the new bytes.\n";
}
