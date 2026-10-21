#pragma once
#include "NativeSaveFields.h"
#include "Dat64TimeSchema.h"
#include <span>
#include <cstring>

namespace SaveRecordMapping
{
using LegacyByte = unsigned char;
template<class T> LegacyByte* ObjectBytes(T& value)
{
    return reinterpret_cast<LegacyByte*>(&value);
}
template<class T> const LegacyByte* ObjectBytes(const T& value)
{
    return reinterpret_cast<const LegacyByte*>(&value);
}
template<class T> void ClearNativeObject(T& value)
{
    std::memset(ObjectBytes(value), 0, sizeof(T));
}

// These mappings pin the wire ABI to v1, while native timer members are 64 bit.
// Every field is addressed by name; padding and native pointers are never copied.
template<class T> struct SaveRecordKind;
#define SAVE_KIND(Type, Kind) template<> struct SaveRecordKind<Type> { \
    static constexpr auto value = LevelSaveFormat::RecordKind::Kind; };
SAVE_KIND(Zombie, Zombie)
SAVE_KIND(Plant, Plant)
SAVE_KIND(Projectile, Projectile)
SAVE_KIND(Coin, Coin)
SAVE_KIND(LawnMower, LawnMower)
SAVE_KIND(GridItem, GridItem)
SAVE_KIND(TodParticleSystem, ParticleSystem)
SAVE_KIND(TodParticleEmitter, ParticleEmitter)
SAVE_KIND(TodParticle, Particle)
SAVE_KIND(Reanimation, Reanimation)
SAVE_KIND(Attachment, Attachment)
SAVE_KIND(CursorObject, CursorObject)
SAVE_KIND(CursorPreview, CursorPreview)
SAVE_KIND(MessageWidget, MessageWidget)
SAVE_KIND(SeedPacket, SeedPacket)
SAVE_KIND(Challenge, Challenge)
SAVE_KIND(Music, Music)
SAVE_KIND(ReanimatorTrackInstance, ReanimatorTrackInstance)
#undef SAVE_KIND

template<class T> Dat64TimeSchema::Fields SaveTimeFields()
{
    if constexpr (std::is_same_v<T, Board>) return Dat64TimeSchema::BoardFields();
    else if constexpr (std::is_same_v<T, SeedBank>) return Dat64TimeSchema::SeedBankFields();
    else return Dat64TimeSchema::GetFields(SaveRecordKind<T>::value);
}
template<class T, class Fn> void VisitSaveMembers(Fn&& visit)
{
    constexpr size_t base = std::is_same_v<T, Board> ? 528 : 0;
    VisitNativeSaveFields<T>([&](size_t native, size_t wire, size_t oldSize, size_t newSize) {
        if (wire < base) return;
        if constexpr (std::is_same_v<T, SeedBank>)
            if (wire == 56) return; // Packet array is mapped recursively below.
        visit(native, wire - base, oldSize, newSize);
    });
    if constexpr (std::is_base_of_v<GameObject, T>)
        visit(offsetof(T, mX), 16, 28, 28);
    if constexpr (std::is_same_v<T, SeedBank>)
        for (size_t i = 0; i < 10; ++i)
            VisitSaveMembers<SeedPacket>([&](size_t native, size_t wire, size_t oldSize, size_t newSize) {
                visit(offsetof(SeedBank, mSeedPackets) + i * sizeof(SeedPacket) + native,
                    56 + i * 96 + wire, oldSize, newSize);
            });
}
template<class T, class Fn> void VisitSaveSegments(Fn&& visit)
{
    if constexpr (std::is_same_v<T, Board>)
    {
        visit(size_t(0), size_t(0), size_t(22076));
        visit(size_t(22080), size_t(22076), size_t(8));
        visit(size_t(22088), size_t(22080), size_t(28));
    }
    else if constexpr (std::is_same_v<T, SeedBank>)
    {
        visit(size_t(16), size_t(8), size_t(28));
        visit(size_t(48), size_t(36), size_t(4));
        for (size_t i = 0; i < 10; ++i)
            VisitSaveSegments<SeedPacket>([&](size_t wire, size_t legacy, size_t size) {
                visit(56 + i * 96 + wire, 40 + i * 80 + legacy, size);
            });
        visit(size_t(1016), size_t(840), size_t(8));
    }
    else
    {
        const auto& layout = LevelSaveFormat::GetRecordLayout(SaveRecordKind<T>::value);
        for (size_t i = 0; i < layout.mSegmentCount; ++i)
            visit(layout.mSegments[i].mDat64Offset, layout.mSegments[i].mLegacyOffset, layout.mSegments[i].mSize);
    }
}
template<class T> size_t SaveV1Size()
{
    if constexpr (std::is_same_v<T, Board>) return 22120;
    else if constexpr (std::is_same_v<T, SeedBank>) return 1024;
    else return LevelSaveFormat::GetRecordLayout(SaveRecordKind<T>::value).mDat64Size;
}
template<class T> size_t SaveV2Size()
{
    return Dat64TimeSchema::V2Size(SaveV1Size<T>(), SaveTimeFields<T>());
}

template<class T> size_t NativeTimeOffset(const Dat64TimeSchema::Field& field)
{
    size_t result = SIZE_MAX;
    VisitSaveMembers<T>([&](size_t native, size_t wire, size_t oldSize, size_t newSize) {
        if (field.mOffset >= wire && field.mOffset + 4 <= wire + oldSize)
        {
            if (newSize != oldSize * 4)
                throw std::runtime_error(std::string(field.mName) + ": native time member is not 64 bit");
            result = native + (field.mOffset - wire) * 4;
        }
    });
    if (result == SIZE_MAX) throw std::runtime_error("time field is missing its native mapping");
    return result;
}
template<class T> std::vector<LegacyByte> WriteSaveRecord(const T& value)
{
    std::vector<LegacyByte> bytes(SaveV1Size<T>(), 0);
    const auto fields = SaveTimeFields<T>();
    VisitSaveMembers<T>([&](size_t native, size_t wire, size_t oldSize, size_t newSize) {
        if (oldSize != newSize) return;
        VisitSaveSegments<T>([&](size_t start, size_t, size_t length) {
            const size_t first = std::max(wire, start);
            const size_t last = std::min(wire + oldSize, start + length);
            if (first < last) std::memcpy(bytes.data() + first,
                ObjectBytes(value) + native + first - wire, last - first);
        });
    });
    const auto ReadNs = [&](const Dat64TimeSchema::Field& field) {
        std::uint64_t result;
        std::memcpy(&result, ObjectBytes(value) + NativeTimeOffset<T>(field), 8);
        return result;
    };
    return Dat64TimeSchema::Expand(bytes, fields,
        [&](const auto& field, std::uint32_t) { return ReadNs(field); });
}
template<class T> void ReadSaveRecord(T& value, const LegacyByte* source)
{
    const auto fields = SaveTimeFields<T>();
    std::vector<std::pair<size_t, std::uint64_t>> times;
    const auto bytes = Dat64TimeSchema::Collapse(std::span(source, SaveV2Size<T>()), fields,
        [&](const auto& field, std::uint64_t ns) {
            times.emplace_back(NativeTimeOffset<T>(field), ns); return std::uint32_t(0);
        });
    if constexpr (std::is_same_v<T, Board>)
        std::memset(ObjectBytes(value) + offsetof(Board, mPaused), 0,
            sizeof(Board) - offsetof(Board, mPaused));
    else ClearNativeObject(value);
    VisitSaveMembers<T>([&](size_t native, size_t wire, size_t oldSize, size_t newSize) {
        if (oldSize != newSize) return;
        VisitSaveSegments<T>([&](size_t start, size_t, size_t length) {
            const size_t first = std::max(wire, start);
            const size_t last = std::min(wire + oldSize, start + length);
            if (first < last) std::memcpy(ObjectBytes(value) + native + first - wire,
                bytes.data() + first, last - first);
        });
    });
    for (const auto& [offset, ns] : times)
    {
        std::memcpy(ObjectBytes(value) + offset, &ns, 8);
        std::memcpy(ObjectBytes(value) + offset + 8, &ns, 8);
    }
    if constexpr (std::is_same_v<T, TodParticle>)
        value.mParticleDurationInv = value.mParticleDuration > 1
            ? 1.0f / (value.mParticleDuration - 1) : 0.0f;
}

template<class T> struct Dat64Layout
{
    static size_t Size() { return SaveV2Size<T>(); }
    static size_t SlotSize()
    {
        const auto& layout = LevelSaveFormat::GetRecordLayout(SaveRecordKind<T>::value);
        return layout.mDat64ArraySlotSize + 4 * SaveTimeFields<T>().size();
    }
    static void Read(T& value, const LegacyByte* bytes)
    {
        if constexpr (std::is_same_v<T, Music>)
        {
            const bool disabled = value.IsMusicDisabled();
            ReadSaveRecord(value, bytes); value.SetMusicDisabled(disabled);
        }
        else ReadSaveRecord(value, bytes);
    }
    static void Write(LegacyByte* bytes, const T& value)
    {
        const auto result = WriteSaveRecord(value);
        std::memcpy(bytes, result.data(), result.size());
    }
};
}
