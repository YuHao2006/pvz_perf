#pragma once
#include <cstddef>
#include <cstdint>
#include <type_traits>
class Plant;
class Zombie;
class Coin;
class LawnMower;
class GridItem;
class SeedPacket;
class SeedBank;
class MessageWidget;
class Music;
namespace SaveClockProjection
{
template<class T> inline constexpr bool Supported = std::is_same_v<T, Plant> || std::is_same_v<T, Zombie> || std::is_same_v<T, Coin> || std::is_same_v<T, LawnMower> || std::is_same_v<T, GridItem> || std::is_same_v<T, SeedPacket> || std::is_same_v<T, SeedBank> || std::is_same_v<T, MessageWidget> || std::is_same_v<T, Music>;
bool IsRawTime(const Plant& value, std::size_t nativeOffset);
std::int64_t Encode(const Plant& value, std::size_t nativeOffset, std::int64_t raw);
std::int64_t Decode(const Plant& value, std::size_t nativeOffset, std::int64_t wire);
void Bind(Plant& value);
bool IsRawTime(const Zombie& value, std::size_t nativeOffset);
std::int64_t Encode(const Zombie& value, std::size_t nativeOffset, std::int64_t raw);
std::int64_t Decode(const Zombie& value, std::size_t nativeOffset, std::int64_t wire);
void Bind(Zombie& value);
bool IsRawTime(const Coin& value, std::size_t nativeOffset);
std::int64_t Encode(const Coin& value, std::size_t nativeOffset, std::int64_t raw);
std::int64_t Decode(const Coin& value, std::size_t nativeOffset, std::int64_t wire);
void Bind(Coin& value);
bool IsRawTime(const LawnMower& value, std::size_t nativeOffset);
std::int64_t Encode(const LawnMower& value, std::size_t nativeOffset, std::int64_t raw);
std::int64_t Decode(const LawnMower& value, std::size_t nativeOffset, std::int64_t wire);
void Bind(LawnMower& value);
bool IsRawTime(const GridItem& value, std::size_t nativeOffset);
std::int64_t Encode(const GridItem& value, std::size_t nativeOffset, std::int64_t raw);
std::int64_t Decode(const GridItem& value, std::size_t nativeOffset, std::int64_t wire);
void Bind(GridItem& value);
bool IsRawTime(const SeedPacket& value, std::size_t nativeOffset);
std::int64_t Encode(const SeedPacket& value, std::size_t nativeOffset, std::int64_t raw);
std::int64_t Decode(const SeedPacket& value, std::size_t nativeOffset, std::int64_t wire);
void Bind(SeedPacket& value);
bool IsRawTime(const SeedBank& value, std::size_t nativeOffset);
std::int64_t Encode(const SeedBank& value, std::size_t nativeOffset, std::int64_t raw);
std::int64_t Decode(const SeedBank& value, std::size_t nativeOffset, std::int64_t wire);
void Bind(SeedBank& value);
bool IsRawTime(const MessageWidget& value, std::size_t nativeOffset);
std::int64_t Encode(const MessageWidget& value, std::size_t nativeOffset, std::int64_t raw);
std::int64_t Decode(const MessageWidget& value, std::size_t nativeOffset, std::int64_t wire);
void Bind(MessageWidget& value);
bool IsRawTime(const Music& value, std::size_t nativeOffset);
std::int64_t Encode(const Music& value, std::size_t nativeOffset, std::int64_t raw);
std::int64_t Decode(const Music& value, std::size_t nativeOffset, std::int64_t wire);
void Bind(Music& value);
}
