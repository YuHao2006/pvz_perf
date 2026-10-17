// Canonical resource group IDs. Values are stable manifest identifiers.
#pragma once
#include <cstdint>

enum class ResourceGroupId : std::uint32_t
{
    Invalid = 0,
    DelayLoad_Almanac = 1,
    DelayLoad_AwardScreen = 2,
    DelayLoad_Background1 = 3,
    DelayLoad_Background2 = 4,
    DelayLoad_Background3 = 5,
    DelayLoad_Background4 = 6,
    DelayLoad_Background5 = 7,
    DelayLoad_Background6 = 8,
    DelayLoad_BackgroundUnsodded = 9,
    DelayLoad_ChallengeScreen = 10,
    DelayLoad_Credits = 11,
    DelayLoad_GreenHouseGarden = 12,
    DelayLoad_GreenHouseOverlay = 13,
    DelayLoad_MushroomGarden = 14,
    DelayLoad_Store = 15,
    DelayLoad_Zombatar = 16,
    DelayLoad_ZombieFinalNote = 17,
    DelayLoad_ZombieNote = 18,
    DelayLoad_ZombieNote1 = 19,
    DelayLoad_ZombieNote2 = 20,
    DelayLoad_ZombieNote3 = 21,
    DelayLoad_ZombieNote4 = 22,
    DelayLoad_ZombieNoteHelp = 23,
    DelayLoad_Zombiquarium = 24,
    Init = 25,
    LoaderBar = 26,
    LoadingFonts = 27,
    LoadingImages = 28,
    LoadingSounds = 29,
};

inline constexpr std::uint32_t RESOURCE_GROUP_COUNT = 29;

constexpr bool IsCanonicalResourceGroupId(ResourceGroupId theGroup) noexcept
{
    const auto anId = static_cast<std::uint32_t>(theGroup);
    return anId != 0 && anId <= RESOURCE_GROUP_COUNT;
}
