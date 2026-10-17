#pragma once
#include "Sexy.TodLib/generated/ResourceId.h"
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
    ImageGrid,
    SoundVolume,
    SystemFont,
    FontTag,
    FontStyle,
    DescriptorLength,
    ManifestTrailing,
    MissingSlot,
    MissingSymbol,
    FontReferenceType,
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
    FontReferenceCycle,
    InvalidGroup,
    ImageSymbolBinding,
    ImageSymbolCount,
    ImageNotLoaded,
    SoundNotLoaded,
    FontNotLoaded
};

struct ResourceError
{
    ResourceFailure reason = ResourceFailure::None;
    unsigned slot = RESOURCE_SLOT_NONE;
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
