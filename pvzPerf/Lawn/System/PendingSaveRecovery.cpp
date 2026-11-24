#include "PendingSaveRecovery.h"
#include "LevelSaveFormat.h"
#include "PlayerInfo.h"
#include "SexyAppFramework/misc/ByteCrc.h"
#include <algorithm>
#include <array>
#include <charconv>
#include <cstdio>
#include <fstream>
#include <limits>
#include <map>
#include <set>
#include <stdexcept>
#include <vector>

namespace fs = std::filesystem;
namespace PendingSaves {
namespace {
using Bytes = std::vector<unsigned char>;
struct Stage {
    fs::path path;
    fs::file_time_type time;
    // PID, monotonic clock, sequence, then (new builds) expected size and CRC.
    std::array<std::uint64_t, 5> fields{};
    bool checked = false;
};

bool Digits(std::string_view s) {
    return !s.empty() && s.find_first_not_of("0123456789") == s.npos;
}

bool SaveName(std::string_view s) {
    if (s == "users.dat") return true;
    if (!s.ends_with(".dat64")) return false;
    s.remove_suffix(6);
    if (s.starts_with("user")) return Digits(s.substr(4));
    if (!s.starts_with("game")) return false;
    s.remove_prefix(4);
    const auto sep = s.find('_');
    return sep != s.npos && Digits(s.substr(0, sep)) && Digits(s.substr(sep+1));
}

std::string Parse(std::string_view name, Stage& stage) {
    const auto sep = name.find(".tmp-");
    if (sep == name.npos || !SaveName(name.substr(0, sep))) return {};
    auto suffix = name.substr(sep+5);
    for (unsigned i = 0; i < stage.fields.size(); ++i) {
        const auto dash = suffix.find('-');
        const auto part = suffix.substr(0, dash);
        const auto end = part.data() + part.size();
        auto result = std::from_chars(part.data(), end, stage.fields[i]);
        if (result.ec != std::errc{} || result.ptr != end) return {};
        if (dash == suffix.npos) {
            if (i != 2 && i != 4) return {};
            stage.checked = i == 4;
            return std::string(name.substr(0, sep));
        }
        suffix.remove_prefix(dash+1);
    }
    return {};
}

bool IndexValid(std::span<const unsigned char> bytes) {
    if (bytes.size()<6) return false;
    auto u16=[&](size_t i) {return static_cast<unsigned>(bytes[i]) | (static_cast<unsigned>(bytes[i+1])<<8);};
    auto u32=[&](size_t i) {return u16(i) | (u16(i+2)<<16);};
    if (u32(0)!=14) return false;
    size_t at=6;
    std::set<unsigned> ids;
    std::set<SexyString, Sexy::StringLessNoCase> names;
    for (unsigned i=0;i<u16(4);++i) {
        if (bytes.size()-at<2) return false;
        const auto length=u16(at); at+=2;
        if (!length || bytes.size()-at<length+8) return false;
        SexyString name(reinterpret_cast<const char*>(bytes.data()+at),length);
        at+=length;
        const auto id=u32(at+4); at+=8;
        if (!id || !ids.insert(id).second || !names.insert(name).second) return false;
    }
    return at==bytes.size();
}

bool Valid(std::string_view target, std::span<const unsigned char> bytes) {
    if (target=="users.dat") return IndexValid(bytes);
    if (target.starts_with("user")) return PlayerInfo::IsReadableDetails(bytes);
    if (!LevelSaveFormat::IsCurrentDat64Header(bytes) ||
        bytes.size() < LevelSaveFormat::DAT64_HEADER_SIZE + 12) return false;
    auto tail = bytes.last(12);
    if (tail[0]!=8 || tail[1] || tail[2] || tail[3]) return false;
    for (unsigned i=0;i<8;++i)
        if (tail[4+i]!=static_cast<unsigned char>(LevelSaveFormat::DAT64_END_MARKER>>(8*i))) return false;
    return true;
}

bool ValidFile(const fs::path& file, const std::string& target, const Stage* stage) {
    const auto size=fs::file_size(file);
    if (!size || size>static_cast<unsigned>(std::numeric_limits<int>::max())/8 ||
        (stage && stage->checked && size!=stage->fields[3])) return false;
    Bytes bytes(static_cast<size_t>(size));
    std::ifstream input(file,std::ios::binary);
    if (!input.read(reinterpret_cast<char*>(bytes.data()),static_cast<std::streamsize>(size)))
        throw std::runtime_error("Cannot read save during recovery: " + file.string());
    if (stage && stage->checked && Sexy::UpdateCRC(0,bytes.data(),bytes.size())!=stage->fields[4])
        return false;
    // A historical Board can still be upgraded through the usual loading path.
    if (!stage && target.starts_with("game") && LevelSaveFormat::IsSupportedDat64Header(bytes) &&
        !LevelSaveFormat::IsCurrentDat64Header(bytes)) return true;
    return Valid(target,bytes);
}
std::set<fs::path> unavailable;
}

std::string TargetName(std::string_view filename) {
    Stage stage;
    return Parse(filename,stage);
}

bool Unavailable(const fs::path& target) {
    return !unavailable.empty() && unavailable.contains(fs::absolute(target).lexically_normal());
}

void RecoverDirectory(const fs::path& directory) {
    unavailable.clear();
#ifdef __EMSCRIPTEN__
    return; // Web commits snapshots to IndexedDB and has no native staging files.
#endif
    if (!fs::exists(directory)) return;
    std::map<std::string,std::vector<Stage>> groups;
    for (const auto& entry : fs::directory_iterator(directory)) {
        Stage s;
        const auto name=Parse(entry.path().filename().string(),s);
        if (name.empty() || !fs::is_regular_file(entry.symlink_status())) continue;
        s.path=entry.path();
        s.time=entry.last_write_time();
        groups[name].push_back(std::move(s));
    }
    // std::map orders individual records before users.dat, the published index.
    for (auto& [name,stages] : groups) {
        const auto target=directory/name;
        const auto status=fs::symlink_status(target);
        if (fs::exists(status) && !fs::is_regular_file(status))
            throw std::runtime_error("Cannot recover over a non-file: "+target.string());
        const bool exists=fs::exists(status);
        const bool valid=exists && ValidFile(target,name,nullptr);
        const auto officialTime=valid?fs::last_write_time(target):fs::file_time_type::min();
        std::sort(stages.begin(),stages.end(),[](const Stage& a,const Stage& b) {
            if (a.time!=b.time) return a.time>b.time;
            if (a.fields[1]!=b.fields[1]) return a.fields[1]>b.fields[1];
            if (a.fields[2]!=b.fields[2]) return a.fields[2]>b.fields[2];
            return a.path>b.path;
        });
        bool recovered=false;
        for (const auto& s : stages) {
            try {
                if (!ValidFile(s.path,name,&s)) continue; // Keep damaged bytes available for diagnosis.
            } catch (const std::runtime_error& error) {
                std::fprintf(stderr, "Skipping unreadable pending save %s: %s\n", s.path.string().c_str(), error.what());
                continue;
            }
            if (recovered || (valid && s.time<=officialTime)) {
                fs::remove(s.path); // Fail before gameplay if a stale complete file cannot be retired.
                continue;
            }
            // Preserve previous bytes when recovering legacy staging without a checksum,
            // or when replacing a damaged official file. Never overwrite an earlier backup.
            if (exists && (!s.checked || !valid)) {
                auto backup=s.path;
                backup+=".previous";
                if (!fs::exists(backup))
                    fs::copy_file(target,backup);
            }
            std::error_code renameError;
            fs::rename(s.path,target,renameError);
            if (renameError) {
                std::fprintf(stderr, "Cannot publish pending save %s: %s\n",
                    s.path.string().c_str(), renameError.message().c_str());
                break; // Keep the complete staging file for another launch.
            }
            recovered=true;
        }
        if (!valid && !recovered) {
            unavailable.insert(fs::absolute(target).lexically_normal());
            if (name=="users.dat")
                throw std::runtime_error("Player list and pending saves could not be recovered: "+target.string());
        }
    }
}
}
