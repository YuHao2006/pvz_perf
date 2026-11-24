#pragma once
#include <filesystem>
#include <string>
#include <string_view>

namespace PendingSaves {
// Only filenames produced by the native save writer are considered.
std::string TargetName(std::string_view filename);
void RecoverDirectory(const std::filesystem::path& directory);
bool Unavailable(const std::filesystem::path& target);
}
