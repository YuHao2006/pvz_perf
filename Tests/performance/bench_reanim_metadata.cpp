// Standalone IDT4/IDT5 metadata loading model. No game headers or linkage.
// Build/run only through run-reanim-metadata-bench.ps1 after measurement resumes.
// Hot samples consume resident bytes, build owning mirrors, then clean up outside
// decode timing. Overwritten OLD routing copies are retained solely for cleanup.
#define WIN32_LEAN_AND_MEAN
#define NOMINMAX
#include <windows.h>
#include <intrin.h>
#include <algorithm>
#include <array>
#include <bit>
#include <cmath>
#include <cstdint>
#include <cstring>
#include <filesystem>
#include <fstream>
#include <iomanip>
#include <iostream>
#include <memory>
#include <new>
#include <stdexcept>
#include <string>
#include <string_view>
#include <utility>
#include <vector>
#include "reanim_metadata_bench_fixture.h"

void Need(bool ok, const char* message) { if (!ok) throw std::runtime_error(message); }
std::int64_t Qpc() {
    LARGE_INTEGER value{};
    Need(QueryPerformanceCounter(&value) != 0, "QPC failed"); return value.QuadPart;
}
struct Clock {
    std::int64_t frequency{}, start{};
    Clock() {
        LARGE_INTEGER value{};
        Need(QueryPerformanceFrequency(&value) != 0, "QPC frequency unavailable");
        frequency = value.QuadPart; start = Qpc();
    }
    double Ms(std::int64_t ticks) const { return double(ticks) * 1000.0 / double(frequency); }
    void Budget() const { Need(Ms(Qpc() - start) < 28'000.0, "30 second budget: abort without publishing partial medians"); }
};
enum class Kind : std::size_t { Object, Temporary, Caption, NonUi, CaptionString, NonUiString, Hash, Count };
struct Allocation { std::uint64_t calls{}, bytes{}; };
struct Counts {
    std::array<Allocation, static_cast<std::size_t>(Kind::Count)> values{};
    Allocation& At(Kind kind) { return values[static_cast<std::size_t>(kind)]; }
    const Allocation& At(Kind kind) const { return values[static_cast<std::size_t>(kind)]; }
};
// Explicit noinline allocation sites plus /GL- retain malloc/copy work under /O2.
__declspec(noinline) void* Allocate(std::size_t bytes, Counts* counts, Kind kind) {
    void* p = ::operator new(bytes);
    if (counts) { auto& c = counts->At(kind); ++c.calls; c.bytes += bytes; }
    return p;
}
__declspec(noinline) void Release(void* p) noexcept { ::operator delete(p); }
template<class T> struct Allocator {
    using value_type = T;
    Counts* counts{}; Kind kind{Kind::Object};
    Allocator() = default;
    Allocator(Counts* c, Kind k) : counts(c), kind(k) {}
    template<class U> Allocator(const Allocator<U>& a) : counts(a.counts), kind(a.kind) {}
    T* allocate(std::size_t n) { return static_cast<T*>(Allocate(n * sizeof(T), counts, kind)); }
    void deallocate(T* p, std::size_t) noexcept { Release(p); }
    template<class U> bool operator==(const Allocator<U>& a) const noexcept { return counts == a.counts && kind == a.kind; }
};
template<class T> using Vector = std::vector<T, Allocator<T>>;
using OldString = std::basic_string<char, std::char_traits<char>, Allocator<char>>;

struct Reader {
    const std::uint8_t* data{}; std::size_t size{}, at{};
    const std::uint8_t* Take(std::size_t n) {
        Need(n <= size - at, "Truncated record"); const auto* p = data + at; at += n; return p;
    }
    std::uint32_t U32() { std::uint32_t v{}; std::memcpy(&v, Take(4), 4); return v; }
    std::string_view Text() {
        const auto n = U32(); const auto* p = Take(n);
        Need(!std::memchr(p, 0, n), "Embedded text NUL"); return {reinterpret_cast<const char*>(p), n};
    }
    void End() const { Need(at == size, "Trailing payload bytes"); }
};
struct Crc {
    std::array<std::uint32_t, 256> table{};
    Crc() {
        for (std::uint32_t i = 0; i < 256; ++i) {
            auto v = i; for (int bit = 0; bit < 8; ++bit) v = (v & 1) ? 0xedb88320u ^ (v >> 1) : v >> 1;
            table[i] = v;
        }
    }
    __declspec(noinline) std::uint32_t Compute(const std::uint8_t* p, std::size_t n) const {
        std::uint32_t crc = 0xffffffffu;
        for (std::size_t i = 0; i < n; ++i) crc = table[(crc ^ p[i]) & 255] ^ (crc >> 8);
        return crc ^ 0xffffffffu;
    }
};
struct CachedOldHash {
    bool ready{}; std::uint32_t value{};
    __declspec(noinline) std::uint32_t Get(const Crc& crc, Counts& counts) {
        if (!ready) {
            Vector<std::uint8_t> bytes{Allocator<std::uint8_t>(&counts, Kind::Hash)};
            const auto put32 = [&](std::uint32_t v) {
                for (unsigned i = 0; i < 4; ++i) bytes.push_back(static_cast<std::uint8_t>(v >> (8 * i)));
            };
            const auto putText = [&](const char* p) {
                const auto n = static_cast<std::uint32_t>(std::strlen(p)); put32(n);
                for (std::uint32_t i = 0; i < n; ++i) bytes.push_back(static_cast<std::uint8_t>(p[i]));
            };
            // Benchmark-only reconstruction of the removed gReanimTrackIdNames.
            // No reserve: mirrors OLD first-cache vector growth, measured once.
            for (const auto& n : fixture::Names) { put32(n.id); putText(n.folded); putText(n.display); }
            Need(bytes.size() == fixture::MappingBytes, "Old mapping byte count differs");
            value = crc.Compute(bytes.data(), bytes.size()); ready = true;
        }
        return value;
    }
};
__declspec(noinline) std::uint32_t NumericHash() { return fixture::TrackHash; }
struct Resource { std::uint32_t id{}; };
struct Registry {
    std::vector<Resource> images, fonts;
    Registry() : images(fixture::ImageMax + 1), fonts(fixture::FontMax + 1) {
        for (std::uint32_t i = 0; i < images.size(); ++i) images[i].id = i;
        for (std::uint32_t i = 0; i < fonts.size(); ++i) fonts[i].id = i;
    }
};
struct Frame {
    std::array<float, 8> values{};
    const Resource* image{}; const Resource* font{}; const char* text{};
};
static_assert(sizeof(Frame) == 56, "Requires x64 mirror (8 floats plus three references)");
struct Track {
    std::uint32_t id{};
    Vector<Frame> frames;
    explicit Track(Counts* c) : frames(Allocator<Frame>(c, Kind::Object)) {}
};
struct Segment {
    std::uint32_t track{}, start{}, end{}, target{}, action{}, rateBits{}, loop{}, runStart{}, runEnd{};
    std::int32_t cachedActionStart{-1}, cachedActionCount{-1};
};
struct Definition {
    float fps{};
    Vector<Track> tracks;
    Vector<Segment> segments;
    // Harness-only ownership ledger, reserved BEFORE timing. Does not replace
    // any modeled allocation; captures leaked OLD copies before pointer overwrite.
    std::vector<char*> ownedTexts;
    explicit Definition(Counts* c) : tracks(Allocator<Track>(c, Kind::Object)), segments(Allocator<Segment>(c, Kind::Object)) {}
    Definition(Definition&&) = default;
    Definition(const Definition&) = delete;
    ~Definition() { for (char* p : ownedTexts) Release(p); }
};
struct Input {
    const fixture::Record* record{};
    std::vector<std::uint8_t> oldBytes, newBytes;
};
struct Loaded { std::vector<Input> files; std::array<double, 2> readMs{}; std::array<std::uint64_t, 2> byteCounts{}; };
std::vector<std::uint8_t> ReadFile(const std::filesystem::path& path) {
    std::ifstream in(path, std::ios::binary | std::ios::ate); Need(bool(in), "Cannot open corpus file");
    const auto end = in.tellg(); Need(end >= std::streampos(12), "Invalid corpus file size");
    std::vector<std::uint8_t> bytes(static_cast<std::size_t>(end)); in.seekg(0);
    in.read(reinterpret_cast<char*>(bytes.data()), static_cast<std::streamsize>(bytes.size()));
    Need(bool(in), "Corpus read failed"); return bytes;
}
Loaded Load(const std::filesystem::path& oldRoot, const std::filesystem::path& newRoot, const Clock& clock, const Crc& crc) {
    Loaded loaded; loaded.files.resize(fixture::Records.size());
    // Only two file-read passes, OUTSIDE all repeated kernels. Fixed A then B
    // order and OS cache state are reported; this is not a paired IO benchmark.
    for (int side = 0; side < 2; ++side) {
        clock.Budget(); const auto start = Qpc();
        for (std::size_t i = 0; i < fixture::Records.size(); ++i) {
            auto& input = loaded.files[i]; const auto& record = fixture::Records[i]; input.record = &record;
            auto& bytes = side == 0 ? input.oldBytes : input.newBytes;
            bytes = ReadFile((side == 0 ? oldRoot : newRoot) / (side == 0 ? record.oldPath : record.newPath));
            loaded.byteCounts[side] += bytes.size();
        }
        loaded.readMs[side] = clock.Ms(Qpc() - start);
    }
    for (const auto& input : loaded.files) {
        for (int side = 0; side < 2; ++side) {
            const auto& bytes = side == 0 ? input.oldBytes : input.newBytes;
            const auto& rec = *input.record;
            Need(bytes.size() == (side == 0 ? rec.oldBytes : rec.newBytes), "Fixture file size differs");
            Reader r{bytes.data(), bytes.size()}; Need(r.U32() == 0xdeadfed7u, "Invalid v4 cookie");
            Need(r.U32() == bytes.size() - 12, "Invalid declared size"); const auto stored = r.U32();
            Need(stored == (side == 0 ? rec.oldCrc : rec.newCrc) && crc.Compute(bytes.data() + 12, bytes.size() - 12) == stored, "Fixture CRC differs");
        }
    }
    return loaded;
}
void Inherit(Track& track, bool old) {
    std::array<float, 8> previous{0, 0, 0, 0, 1, 1, 0, 1};
    const Resource* image = nullptr; const Resource* font = nullptr;
    const char* text = old ? "" : nullptr;
    for (auto& f : track.frames) {
        for (std::size_t i = 0; i < 8; ++i) {
            if (f.values[i] == -10000.0f) f.values[i] = previous[i]; else previous[i] = f.values[i];
        }
        if (!f.image) f.image = image; else image = f.image;
        if (!f.font) f.font = font; else font = f.font;
        if (old ? f.text[0] == '\0' : f.text == nullptr) f.text = text; else text = f.text;
    }
}
char* CopyText(std::string_view text, Definition& def, Counts& counts, bool caption) {
    char* copy = static_cast<char*>(Allocate(text.size() + 1, &counts, caption ? Kind::Caption : Kind::NonUi));
    std::memcpy(copy, text.data(), text.size()); copy[text.size()] = 0; def.ownedTexts.push_back(copy); return copy;
}
template<bool Old> __declspec(noinline) void Decode(const Input& input, Definition& def, Counts& counts,
                                                  const Registry& registry, const Crc& crc, bool includeCrc) {
    const auto& bytes = Old ? input.oldBytes : input.newBytes;
    const auto* data = bytes.data() + 12; const auto size = bytes.size() - 12;
    if (includeCrc) Need(crc.Compute(data, size) == (Old ? input.record->oldCrc : input.record->newCrc), "Timed payload CRC differs");
    Reader r{data, size}; Need(r.U32() == (Old ? 0x34544449u : 0x35544449u), "Wrong IDT version");
    Need(r.U32() == fixture::TrackHash && r.U32() == fixture::ImageHash && r.U32() == fixture::FontHash, "Registry hash differs");
    def.fps = std::bit_cast<float>(r.U32()); const auto count = r.U32();
    Need(count == input.record->tracks && count <= 256, "Track count differs");
    if constexpr (!Old) Need(std::isfinite(def.fps) && def.fps > 0, "Invalid fps");
    // OLD separate numeric ID side table; NEW temporary per-track text modes.
    Vector<std::uint32_t> sideTable{Allocator<std::uint32_t>(&counts, Kind::Temporary)}; sideTable.resize(count);
    def.tracks.reserve(count);
    for (std::uint32_t t = 0; t < count; ++t) {
        def.tracks.emplace_back(&counts); auto& track = def.tracks.back();
        track.id = r.U32(); const auto frames = r.U32(); Need(r.U32() == 32, "Wrong transform size");
        Need(track.id <= fixture::TrackIdCount && frames > 0 && frames <= (r.size - r.at) / 32, "Invalid track fields");
        if constexpr (Old) sideTable[t] = track.id;
        else {
            sideTable[t] = r.U32(); Need(sideTable[t] <= 1, "Wrong text mode");
            Need(!fixture::IsAttacher(track.id) || sideTable[t] == 0, "Routing caption mode");
        }
        track.frames.resize(frames);
        for (auto& frame : track.frames) {
            frame.text = Old ? "" : nullptr;
            for (auto& value : frame.values) {
                value = std::bit_cast<float>(r.U32());
                if constexpr (!Old) Need(std::isfinite(value), "Nonfinite numeric transform");
            }
        }
    }
    for (std::uint32_t t = 0; t < count; ++t) {
        auto& track = def.tracks[t];
        // Fixture classification is used only for allocation labels in OLD;
        // OLD still reads a length and constructs a string for EVERY frame.
        const bool caption = fixture::TextModes[input.record->modeBegin + t] != 0;
        for (auto& frame : track.frames) {
            const auto im = r.U32(), fo = r.U32();
            Need(im <= fixture::ImageMax && fo <= fixture::FontMax, "Resource ID out of range");
            frame.image = im ? &registry.images[im] : nullptr; frame.font = fo ? &registry.fonts[fo] : nullptr;
            if constexpr (Old) {
                const auto raw = r.Text();
                OldString temporary(raw.data(), raw.size(), Allocator<char>(&counts, caption ? Kind::CaptionString : Kind::NonUiString));
                if (!temporary.empty()) frame.text = CopyText({temporary.data(), temporary.size()}, def, counts, caption);
            } else if (sideTable[t] == 1) {
                const auto raw = r.Text(); if (!raw.empty()) frame.text = CopyText(raw, def, counts, true);
            }
        }
        if constexpr (Old) if (fixture::IsAttacher(sideTable[t])) for (auto& frame : track.frames) frame.text = "";
    }
    const auto segmentTracks = r.U32(); Need(segmentTracks <= count, "Too many segment tracks");
    std::uint32_t previousTrack = 0;
    for (std::uint32_t i = 0; i < segmentTracks; ++i) {
        const auto track = r.U32(), n = r.U32();
        Need(track < count && (!i || track > previousTrack) && fixture::IsAttacher(def.tracks[track].id), "Invalid segment track");
        previousTrack = track; std::uint32_t previousEnd = 0;
        for (std::uint32_t j = 0; j < n; ++j) {
            Segment s; s.track = track; s.start = r.U32(); s.end = r.U32(); s.target = r.U32();
            s.action = r.U32(); s.rateBits = r.U32(); s.loop = r.U32();
            if constexpr (!Old) { s.runStart = r.U32(); s.runEnd = r.U32(); }
            Need(previousEnd <= s.start && s.start < s.end && s.end <= def.tracks[track].frames.size(), "Invalid segment extent");
            if constexpr (!Old) {
                Need(s.runStart <= s.start && s.end <= s.runEnd && s.runEnd <= def.tracks[track].frames.size(), "Invalid routing run");
                Need((s.target == 0xffffffffu || s.target < fixture::TypeCount) && s.action <= fixture::TrackIdCount && s.loop <= 2 && std::isfinite(std::bit_cast<float>(s.rateBits)), "Invalid segment metadata");
            }
            previousEnd = s.end; def.segments.push_back(s);
        }
    }
    r.End(); for (auto& track : def.tracks) Inherit(track, Old);
}
std::vector<Definition> Prepare(const Loaded& loaded, Counts& counts) {
    std::vector<Definition> out; out.reserve(loaded.files.size());
    for (const auto& f : loaded.files) {
        out.emplace_back(&counts); out.back().ownedTexts.reserve(f.record->captions + f.record->nonUi);
    }
    return out;
}
std::uint64_t Checksum(const std::vector<Definition>& defs) {
    std::uint64_t hash = 14695981039346656037ull;
    const auto add = [&](std::uint32_t v) { hash ^= v; hash *= 1099511628211ull; };
    std::size_t mode = 0;
    for (const auto& d : defs) {
        add(std::bit_cast<std::uint32_t>(d.fps));
        for (const auto& t : d.tracks) {
            add(t.id); const bool caption = fixture::TextModes[mode++] != 0;
            for (const auto& f : t.frames) {
                for (auto v : f.values) add(std::bit_cast<std::uint32_t>(v));
                add(f.image ? f.image->id : 0); add(f.font ? f.font->id : 0);
                if (caption && f.text) for (const unsigned char* p = reinterpret_cast<const unsigned char*>(f.text); *p; ++p) add(*p);
                add(0xff00ff00u);
            }
        }
        // Common six-word segment payload; OLD has no text-run bounds.
        for (const auto& s : d.segments) { add(s.track); add(s.start); add(s.end); add(s.target); add(s.action); add(s.rateBits); add(s.loop); }
    }
    return hash;
}
void CheckCounts(const Counts& c, bool old) {
    Need(c.At(Kind::Caption).calls == fixture::CaptionAllocations && c.At(Kind::Caption).bytes == fixture::CaptionBytes + fixture::CaptionAllocations, "Caption allocation count/bytes differs");
    Need(c.At(Kind::NonUi).calls == (old ? fixture::NonUiAllocations : 0) && c.At(Kind::NonUi).bytes == (old ? fixture::NonUiBytes + fixture::NonUiAllocations : 0), "NonUI allocation count/bytes differs");
    if (!old) Need(c.At(Kind::CaptionString).calls == 0 && c.At(Kind::NonUiString).calls == 0, "Numeric decoder allocated temporary text");
}
void Validate(const Loaded& loaded, const Registry& registry, const Crc& crc) {
    Counts ca, cb; auto a = Prepare(loaded, ca), b = Prepare(loaded, cb);
    for (std::size_t i = 0; i < loaded.files.size(); ++i) {
        Decode<true>(loaded.files[i], a[i], ca, registry, crc, false);
        Decode<false>(loaded.files[i], b[i], cb, registry, crc, false);
        Need(a[i].tracks.size() == b[i].tracks.size(), "Mirror tracks differ");
        for (std::size_t t = 0; t < a[i].tracks.size(); ++t) {
            const auto& x = a[i].tracks[t]; const auto& y = b[i].tracks[t];
            Need(x.id == y.id && x.frames.size() == y.frames.size(), "Mirror track ID/frames differ");
            const bool caption = fixture::TextModes[loaded.files[i].record->modeBegin + t] != 0;
            const char* px = nullptr; const char* py = nullptr;
            for (std::size_t f = 0; f < x.frames.size(); ++f) {
                const auto& u = x.frames[f]; const auto& v = y.frames[f];
                Need(std::memcmp(u.values.data(), v.values.data(), 32) == 0 && u.image == v.image && u.font == v.font, "Mirror numeric/resource values differ");
                if (caption) {
                    Need(std::strcmp(u.text ? u.text : "", v.text ? v.text : "") == 0, "Mirror caption bytes differ");
                    if (f) Need((u.text == px) == (v.text == py), "Caption pointer inheritance runs differ");
                    px = u.text; py = v.text;
                } else Need(v.text == nullptr, "Numeric nonUI text retained");
            }
        }
        Need(a[i].segments.size() == b[i].segments.size(), "Segment splitting changed: regenerate benchmark semantic normalization before measurement");
        for (std::size_t s = 0; s < a[i].segments.size(); ++s) {
            const auto& x = a[i].segments[s]; const auto& y = b[i].segments[s];
            Need(x.track == y.track && x.start == y.start && x.end == y.end && x.target == y.target && x.action == y.action && x.rateBits == y.rateBits && x.loop == y.loop, "Mirror segment tuple differs");
        }
    }
    CheckCounts(ca, true); CheckCounts(cb, false); Need(Checksum(a) == Checksum(b), "Mirror checksum differs");
    // Exact routing source identity is proved by generator (every explicit old
    // field starts a distinct run, including repeated equal strings). IDT4 has
    // no array of run bounds; it is deliberately not compared as an array.
}
struct Sample { double decodeMs{}, cleanupMs{}; std::int64_t ticks{}; std::uint64_t checksum{}; Counts counts; };
Sample Measure(const Loaded& loaded, bool old, bool withCrc, const Registry& registry, const Crc& crc,
               const Clock& clock, std::uint32_t sweeps, std::uint64_t& sink) {
    Sample result;
    for (std::uint32_t pass = 0; pass < sweeps; ++pass) {
        clock.Budget(); Counts count; auto defs = Prepare(loaded, count); // Harness storage outside timing.
        _ReadWriteBarrier(); const auto start = Qpc();
        if (old) for (std::size_t i = 0; i < loaded.files.size(); ++i) Decode<true>(loaded.files[i], defs[i], count, registry, crc, withCrc);
        else for (std::size_t i = 0; i < loaded.files.size(); ++i) Decode<false>(loaded.files[i], defs[i], count, registry, crc, withCrc);
        _ReadWriteBarrier(); const auto end = Qpc(); result.ticks += end - start;
        const auto checksum = Checksum(defs); // Consume all decoded floats/refs/text, OUTSIDE timing.
        CheckCounts(count, old); if (pass) Need(result.checksum == checksum, "Within-sample checksum changed");
        result.checksum = checksum; result.counts = count; sink ^= checksum + pass;
        const auto cleanupStart = Qpc(); defs.clear(); result.cleanupMs += clock.Ms(Qpc() - cleanupStart);
    }
    result.decodeMs = clock.Ms(result.ticks) / sweeps; result.cleanupMs /= sweeps;
    return result;
}
double Median(std::vector<double> values) { std::sort(values.begin(), values.end()); return values[values.size() / 2]; }
std::string Quote(std::string_view text) {
    std::string out = "\""; for (unsigned char c : text) {
        if (c == '"' || c == '\\') { out += '\\'; out += static_cast<char>(c); }
        else if (c == '\n') out += "\\n";
        else { Need(c >= 32 && c < 127, "NonASCII JSON path unsupported"); out += static_cast<char>(c); }
    } return out + '"';
}
struct Case { const char* name; bool crc; std::uint32_t sweeps{1}; std::array<Sample, 9> a{}, b{}; };
void WriteCounts(std::ostream& out, const Counts& counts) {
    constexpr std::array<const char*, 7> labels{"object", "temporary_numeric_table", "caption_copy", "non_ui_copy", "old_caption_string", "old_non_ui_string", "startup_hash_vector"};
    out << '{'; for (std::size_t i = 0; i < labels.size(); ++i) {
        if (i) out << ','; out << Quote(labels[i]) << ":{\"calls\":" << counts.values[i].calls << ",\"requested_bytes\":" << counts.values[i].bytes << '}';
    } out << '}';
}
int main(int argc, char** argv) try {
    std::filesystem::path oldRoot(fixture::DefaultOldDirectory), newRoot(fixture::DefaultNewDirectory), output;
    bool serialized = false, pin = false;
    for (int i = 1; i < argc; ++i) {
        const std::string_view arg(argv[i]);
        if (arg == "--serialized-measurement") serialized = true;
        else if (arg == "--pin-lp14") pin = true;
        else if (arg == "--old-dir" || arg == "--new-dir" || arg == "--output") {
            Need(i + 1 < argc, "Missing argument value"); const std::filesystem::path value(argv[++i]);
            if (arg == "--old-dir") oldRoot = value; else if (arg == "--new-dir") newRoot = value; else output = value;
        } else throw std::runtime_error("Unknown argument");
    }
    Need(serialized && pin && std::filesystem::is_directory(output), "Requires --serialized-measurement --pin-lp14 --output <existing-dir> [--old-dir ... --new-dir ...]");
    HANDLE mutex = CreateMutexW(nullptr, FALSE, L"Local\\PVZ_ReanimMetadataBench_LP14");
    Need(mutex != nullptr, "Cannot create serialization mutex"); const auto wait = WaitForSingleObject(mutex, 0);
    Need(wait == WAIT_OBJECT_0 || wait == WAIT_ABANDONED, "Another reanim benchmark is already running on LP14");
    struct MutexOwner { HANDLE handle; ~MutexOwner() { ReleaseMutex(handle); CloseHandle(handle); } } owner{mutex};
    Need(SetProcessAffinityMask(GetCurrentProcess(), 0x4000) != 0 && SetThreadAffinityMask(GetCurrentThread(), 0x4000) != 0, "Cannot pin LP14");
    DWORD_PTR processMask{}, systemMask{};
    Need(GetProcessAffinityMask(GetCurrentProcess(), &processMask, &systemMask) && processMask == 0x4000 && GetCurrentProcessorNumber() == 14, "LP14 affinity differs");
    Clock clock; Crc crc; Registry registry; std::uint64_t sink = 0;
    // Once per process, before OLD decode: do not multiply first-cache cost by
    // files, rounds, sweeps, or a fictional 234000 calls. No optional hash loop.
    Counts hashCounts; CachedOldHash oldHash;
    const auto h0 = Qpc(); const auto h = oldHash.Get(crc, hashCounts); const auto h1 = Qpc();
    Need(h == fixture::TrackHash, "Reconstructed old track hash differs");
    const auto n0 = Qpc(); const auto numeric = NumericHash(); const auto n1 = Qpc();
    Need(numeric == h, "Numeric track hash differs"); sink ^= numeric;
    const auto loaded = Load(oldRoot, newRoot, clock, crc);
    Validate(loaded, registry, crc); clock.Budget();
    std::array<Case, 2> cases{{{"resident_decode", false}, {"resident_crc_plus_decode", true}}};
    std::uint64_t expectedChecksum = 0;
    for (auto& c : cases) {
        const auto a = Measure(loaded, true, c.crc, registry, crc, clock, 1, sink);
        const auto b = Measure(loaded, false, c.crc, registry, crc, clock, 1, sink);
        Need(a.checksum == b.checksum, "Warmup semantic checksum differs"); expectedChecksum = a.checksum;
        // Calibration uses complete corpus passes, bounded automatically by
        // remaining wall budget. A ~20ms decode needs just one corpus per sample.
        const double slow = std::max(a.decodeMs + a.cleanupMs, b.decodeMs + b.cleanupMs);
        const double remaining = 26'000.0 - clock.Ms(Qpc() - clock.start);
        Need(remaining > 0 && slow > 0, "No remaining timing budget");
        const auto wanted = static_cast<std::uint32_t>(std::max(1.0, std::min(8.0, 40.0 / slow)));
        const auto cap = static_cast<std::uint32_t>(std::max(1.0, std::min(8.0, remaining / (slow * 36.0 * 3.0))));
        c.sweeps = std::min(wanted, cap);
    }
    for (int round = 0; round < 9; ++round) for (auto& c : cases) {
        for (int order = 0; order < 2; ++order) {
            const bool old = (order == 0) == (round % 2 == 0);
            auto sample = Measure(loaded, old, c.crc, registry, crc, clock, c.sweeps, sink);
            Need(sample.checksum == expectedChecksum, "Timed sample differs from validated output");
            (old ? c.a : c.b)[round] = sample;
        }
        Need(GetCurrentProcessorNumber() == 14, "Timed processor differs");
    }
    clock.Budget();
    std::ofstream json(output / "results.json"), csv(output / "samples.csv"); Need(json && csv, "Cannot open reports");
    json << std::fixed << std::setprecision(6) << "{\n\"status\":\"passed\",\"scope\":\"standalone_reanim_metadata_only\","
         << "\"compiler_msvc\":" << _MSC_FULL_VER << ",\"language\":\"C++23\",\"build_flags\":\"/O2 /Ob2 /GL- /fp:precise /std:c++23preview /OPT:NOICF\","
         << "\"affinity_effective\":" << processMask << ",\"logical_processor_observed\":14,\"rounds\":9,\"qpc_frequency\":" << clock.frequency
         << ",\"wall_ms\":" << clock.Ms(Qpc() - clock.start) << ",\"old_directory\":" << Quote(oldRoot.generic_string()) << ",\"new_directory\":" << Quote(newRoot.generic_string())
         << ",\"records\":" << loaded.files.size() << ",\"tracks\":" << fixture::Tracks << ",\"frames\":" << fixture::Frames
         << ",\"track_id_count\":" << fixture::TrackIdCount << ",\"caption_bytes\":" << fixture::CaptionBytes
         << ",\"old_corpus_sha256\":" << Quote(fixture::OldCorpusSha256) << ",\"new_corpus_sha256\":" << Quote(fixture::NewCorpusSha256)
         << ",\"file_read_once\":{\"order\":\"A_then_B\",\"old_bytes\":" << loaded.byteCounts[0] << ",\"new_bytes\":" << loaded.byteCounts[1]
         << ",\"old_ms\":" << loaded.readMs[0] << ",\"new_ms\":" << loaded.readMs[1] << "},\"startup_hash_once\":{\"old_calls\":1,\"new_calls\":1,\"mapping_bytes\":" << fixture::MappingBytes
         << ",\"old_qpc_ticks\":" << h1 - h0 << ",\"new_qpc_ticks\":" << n1 - n0 << ",\"old_ms\":" << clock.Ms(h1 - h0) << ",\"new_ms\":" << clock.Ms(n1 - n0) << ",\"allocations\":";
    WriteCounts(json, hashCounts);
    json << "},\"limitations\":[\"Resident-byte owning data-object model, not total game loading or FPS; file IO, resource resolution, atlas/render/GPU work are excluded from repeated decode.\","
         << "\"Dummy numeric pointer binding is common to A/B; actual image/font startup, shared allocations and removed resource-name registry hashes need separate game A/B.\","
         << "\"Object container layout is a standalone mirror; 56-byte transforms, numeric side tables and segment-vector growth are modeled, not game binary ABI.\","
         << "\"Counts cover requested object/string/hash allocations, not allocator overhead, harness ledgers, input storage or resource initialization. Old std::string uses counted MSVC basic_string with its actual SSO.\","
         << "\"OLD routing allocated then overwritten; copies are owned in a pre-reserved harness ledger and freed outside decode timing. Cleanup is reported separately and does not reproduce a growing leak.\","
         << "\"One initial hash observation only; numeric constant timing is near QPC overhead and is not a reliable standalone speedup. IO observations are fixed A/B order with uncontrolled OS cache.\","
         << "\"Python fixture proves exact routing source runs and raw numeric bits; runtime mirror validates inherited floats/references/captions and common segment tuples.\"],\"cases\":[";
    csv << "case,round,order,side,sweeps,corpus_decode_ms,ns_per_frame,cleanup_ms,total_qpc_ticks,checksum,caption_allocations,non_ui_allocations,temporary_text_allocations\n" << std::fixed << std::setprecision(6);
    for (std::size_t k = 0; k < cases.size(); ++k) {
        const auto& c = cases[k]; std::vector<double> a, b, paired;
        for (int r = 0; r < 9; ++r) { a.push_back(c.a[r].decodeMs); b.push_back(c.b[r].decodeMs); paired.push_back(100.0 * (b.back() / a.back() - 1)); }
        const auto am = Median(a), bm = Median(b);
        if (k) json << ',';
        json << "{\"name\":" << Quote(c.name) << ",\"sweeps_per_sample\":" << c.sweeps << ",\"old_median_ms\":" << am << ",\"new_median_ms\":" << bm
             << ",\"new_change_percent\":" << 100 * (bm / am - 1) << ",\"paired_median_change_percent\":" << Median(paired) << ",\"old_allocations_per_corpus\":";
        WriteCounts(json, c.a[0].counts); json << ",\"new_allocations_per_corpus\":"; WriteCounts(json, c.b[0].counts); json << '}';
        for (int r = 0; r < 9; ++r) for (bool old : {true, false}) {
            const auto& s = old ? c.a[r] : c.b[r];
            csv << c.name << ',' << r + 1 << ',' << (r % 2 ? "BA" : "AB") << ',' << (old ? "A_IDT4" : "B_IDT5") << ',' << c.sweeps << ',' << s.decodeMs
                << ',' << s.decodeMs * 1e6 / fixture::Frames << ',' << s.cleanupMs << ',' << s.ticks << ',' << s.checksum << ',' << s.counts.At(Kind::Caption).calls
                << ',' << s.counts.At(Kind::NonUi).calls << ',' << s.counts.At(Kind::CaptionString).calls + s.counts.At(Kind::NonUiString).calls << '\n';
        }
        std::cout << c.name << " A " << am << " ms B " << bm << " ms\n";
    }
    json << "],\"sink\":" << sink << "}\n"; json.flush(); csv.flush(); Need(bool(json) && bool(csv), "Report write failed");
    return 0;
} catch (const std::exception& e) { std::cerr << "Reanim metadata benchmark stopped: " << e.what() << '\n'; return 1; }
