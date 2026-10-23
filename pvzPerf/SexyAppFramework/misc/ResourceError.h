#pragma once
#include <cstddef>
#include <cstdint>
#include <exception>

namespace Sexy {
enum class ResourceFailure : std::uint8_t
{
    None,
    ManifestMissing,
    ManifestHeader,
    ManifestChecksum,
    DescriptorTruncated,
    DescriptorIdentity,
    DescriptorPath,
    SoundVolume,
    SystemFont,
    FontTag,
    FontStyle,
    DescriptorLength,
    ManifestTrailing,
    AlphaGridMissing,
    AlphaGridSize,
    AlphaMissing,
    AlphaSize,
    ImageMissing,
    SoundSlotsExhausted,
    SoundMissing,
    FontReferenceMissing,
    FontDescriptorRequired,
    FontMissing,
    FontTagDuplicate,
    InvalidGroup
};

struct ResourceError
{
    ResourceFailure reason = ResourceFailure::None;
    unsigned record = ~0u;
    unsigned value = 0;
    std::size_t offset = 0;

    bool operator==(const ResourceError&) const = default;
};

class ResourceManagerException final : public std::exception
{
public:
    const ResourceError error;

    explicit ResourceManagerException(ResourceError error) noexcept : error(error) {}
};
}
