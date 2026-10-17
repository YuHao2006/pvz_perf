#pragma once

#include <cstdint>
#include <string>
#include <string_view>

// Stable wire IDs shared with the source-only UI text compiler. Records are
// two nonzero bytes: marker + ID. Visible text (including UTF-8) stays intact.
enum class StringFormatId : std::uint8_t
{
    Normal = 1,
    Flavor = 2,
    Keyword = 3,
    Nocturnal = 4,
    Aquatic = 5,
    Stat = 6,
    Metal = 7,
    KeyMetal = 8,
    ShortLine = 9,
    ExtraShortLine = 10,
    Credits1 = 11,
    Credits2 = 12,
    None = 0x7F
};

enum class UiTextPlaceholder : std::uint8_t
{
    PlayerName = 1,
    Money = 2,
    UpgradeCost = 3,
    Count = 4,
    Flags = 5,
    Score = 6,
    Height = 7,
    Streak = 8,
    Seed = 9,
    Player = 10,
    Slots = 11,
    SellPrice = 12,
    PlantType = 13,
    Page = 14,
    Cost = 15,
    WaitTimeLength = 16,
    WaitTime = 17,
    NumPages = 18,
    UpgradeTo = 19,
    UpgradeFrom = 20
};

inline constexpr char kUiTextFormatMarker = '\x1B';
inline constexpr char kUiTextPlaceholderMarker = '\x1C';
inline constexpr std::size_t kUiTextControlSize = 2;

inline std::string UiTextFormatToken(StringFormatId theFormat)
{
    const char aRecord[] = {kUiTextFormatMarker, static_cast<char>(theFormat)};
    return std::string(aRecord, sizeof(aRecord));
}

inline std::string UiTextPlaceholderToken(UiTextPlaceholder thePlaceholder)
{
    const char aRecord[] = {kUiTextPlaceholderMarker, static_cast<char>(thePlaceholder)};
    return std::string(aRecord, sizeof(aRecord));
}

inline bool TryReadUiTextFormat(std::string_view theText, std::size_t theOffset, StringFormatId& theFormat)
{
    if (theOffset >= theText.size() || theText.size() - theOffset < kUiTextControlSize ||
        theText[theOffset] != kUiTextFormatMarker)
        return false;
    theFormat = static_cast<StringFormatId>(static_cast<unsigned char>(theText[theOffset + 1]));
    return true;
}

// Unsubstituted placeholders act like the original complete brace tags in a
// rich-text drawing path: a zero-width run boundary with no style change.
inline bool TryReadUiTextControl(std::string_view theText, std::size_t theOffset, StringFormatId& theFormat)
{
    if (TryReadUiTextFormat(theText, theOffset, theFormat))
        return true;
    if (theOffset < theText.size() && theText.size() - theOffset >= kUiTextControlSize &&
        theText[theOffset] == kUiTextPlaceholderMarker)
    {
        theFormat = StringFormatId::None;
        return true;
    }
    return false;
}

inline std::size_t UiTextVisibleLength(std::string_view theText)
{
    std::size_t aLength = 0;
    bool aControlWord = false;
    for (std::size_t i = 0; i < theText.size();)
    {
        StringFormatId aFormat;
        if (TryReadUiTextControl(theText, i, aFormat))
        {
            i += kUiTextControlSize;
            continue;
        }
        // Keep the original Dave brace-state rule for dynamic player text:
        // unmatched opening braces hide the suffix and closing braces never
        // count. There is no runtime resolution of textual control names.
        const char aChar = theText[i++];
        if (aChar == '{')
            aControlWord = true;
        else if (aChar == '}')
            aControlWord = false;
        else if (!aControlWord)
            ++aLength;
    }
    return aLength;
}
