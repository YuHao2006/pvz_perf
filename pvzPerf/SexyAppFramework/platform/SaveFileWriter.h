#pragma once

#include "../misc/ByteCrc.h"
#include <atomic>
#include <chrono>
#include <cstdio>
#include <filesystem>
#include <string>
#ifdef _WIN32
#include <io.h>
#include <process.h>
#elif !defined(__EMSCRIPTEN__)
#include <unistd.h>
#endif

namespace Sexy {
inline bool WriteSaveFile(const std::string& path, const void* bytes, size_t size)
{
#ifdef __EMSCRIPTEN__
    // LocalSaveStorage snapshots MEMFS on close and commits through IndexedDB.
    FILE* file = std::fopen(path.c_str(), "wb");
    if (!file) return false;
    const bool written = !size || std::fwrite(bytes, 1, size, file) == size;
    return std::fclose(file) == 0 && written;
#else
    static std::atomic<unsigned long> sequence{};
#ifdef _WIN32
    const auto pid = _getpid();
#else
    const auto pid = getpid();
#endif
    const auto tick = std::chrono::steady_clock::now().time_since_epoch().count();
    const std::string staging = path + ".tmp-" + std::to_string(pid) + "-" +
        std::to_string(tick) + "-" + std::to_string(sequence.fetch_add(1, std::memory_order_relaxed)) +
        "-" + std::to_string(size) + "-" + std::to_string(UpdateCRC(0, static_cast<const unsigned char*>(bytes), size));
    FILE* file = std::fopen(staging.c_str(), "wbx");
    if (!file) return false;
    bool written = (!size || std::fwrite(bytes, 1, size, file) == size) && std::fflush(file) == 0;
#ifdef _WIN32
    written = written && _commit(_fileno(file)) == 0;
#else
    written = written && fsync(fileno(file)) == 0;
#endif
    written = std::fclose(file) == 0 && written;
    if (written) {
        std::error_code error;
        std::filesystem::rename(staging, path, error);
        if (!error) return true;
    }
    std::remove(staging.c_str());
    return false;
#endif
}
}
