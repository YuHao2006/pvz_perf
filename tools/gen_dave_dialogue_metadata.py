#!/usr/bin/env python3
"""Compile original1073 Dave control commands into numeric runtime metadata.

Only this offline tool recognizes Dave commands. UI generators should call
strip_dave_string_entries before encoding their ordinary UI placeholders/styles.
The input must be the extracted original1073 properties/LawnStrings.txt; --check
verifies checked-in metadata without building or running the game.
"""
from __future__ import annotations

import argparse
from dataclasses import dataclass
from pathlib import Path
import re


# Values mirror the generated numeric enums below. Branch order is intentional.
HANDING, SHAKE, HAS_DELAY, HAS_TIME = 1, 2, 4, 8
AUTOMATIC, TALK_HANDING, TALK_SHAKE, TALK_SCREAM, TALK_SCREAM2, TALK_SHOW_ITEM = range(6)
SOUND_AUTOMATIC, SOUND_NONE, SOUND_SHORT, SOUND_LONG, SOUND_SCREAM, SOUND_SCREAM2, SOUND_CRAZY = range(7)
SHOW_ITEMS = ("SHOW_WALLNUT", "SHOW_HAMMER", "SHOW_FERTILIZER", "SHOW_TREE_FOOD", "SHOW_MONEYBAG")
MOUTHS = ("MOUTH_BIG_SMILE", "MOUTH_SMALL_SMILE", "MOUTH_BIG_OH", "MOUTH_SMALL_OH")
COMMANDS = frozenset(("HANDING", "NO_SOUND", "SHORT_SOUND", "SCREAM", "SCREAM2", "SHAKE", "NO_CLICK", *SHOW_ITEMS, *MOUTHS))
UI_PLACEHOLDERS = frozenset(("PLAYER_NAME", "MONEY", "UPGRADE_COST", "SELL_PRICE", "PLANT_TYPE"))


@dataclass(frozen=True)
class DaveMetadata:
    flags: int = 0
    talk_action: int = AUTOMATIC
    sound_choice: int = SOUND_AUTOMATIC
    show_item: int = 0
    mouth: int = 0
    delay: int = 100
    time: int = 100
    no_click: bool = False


def parse_dave_dialogue(text: str) -> tuple[str, DaveMetadata]:
    """Return exact UI bytes minus hidden commands, and compiled branch choices.

    Whitelisted formatting placeholders remain untouched for the UI compiler.
    Unknown or malformed brace tokens fail offline instead of silently becoming
    hidden commands or losing text. Repeated timers use their first occurrence,
    matching the original find/atoi calls.
    """
    tags: set[str] = set()
    timers: dict[str, int] = {}
    fragments: list[str] = []
    end = 0
    for match in re.finditer(r"\{([^{}]*)\}", text):
        prefix = text[end:match.start()]
        if "{" in prefix or "}" in prefix:
            raise ValueError(f"Malformed Dave token in {text!r}")
        fragments.append(prefix)
        token = match[1]
        timer = re.fullmatch(r"(DELAY|TIME)_([+-]?\d+)", token)
        if token in COMMANDS:
            tags.add(token)
        elif timer:
            value = int(timer[2])
            if not -(1 << 31) <= value < (1 << 31):
                raise ValueError(f"Dave timer outside int32 range: {token}")
            timers.setdefault(timer[1], value)
        elif token in UI_PLACEHOLDERS:
            fragments.append(match[0])
        else:
            raise ValueError(f"Unknown Dave token: {match[0]}")
        end = match.end()
    suffix = text[end:]
    if "{" in suffix or "}" in suffix:
        raise ValueError(f"Malformed Dave token in {text!r}")
    fragments.append(suffix)

    flags = ((HANDING if "HANDING" in tags else 0) |
             (SHAKE if "SHAKE" in tags else 0) |
             (HAS_DELAY if "DELAY" in timers else 0) |
             (HAS_TIME if "TIME" in timers else 0))
    show_item = 0
    if "HANDING" in tags:
        action = TALK_HANDING
        sound = SOUND_SHORT if "SHORT_SOUND" in tags else SOUND_SCREAM if "SCREAM" in tags else SOUND_LONG
    elif "SHAKE" in tags:
        action, sound = TALK_SHAKE, SOUND_CRAZY
    elif "SCREAM" in tags:
        action, sound = TALK_SCREAM, SOUND_SCREAM
    elif "SCREAM2" in tags:
        action, sound = TALK_SCREAM2, SOUND_SCREAM2
    else:
        show_item = next((i for i, tag in enumerate(SHOW_ITEMS, 1) if tag in tags), 0)
        action = TALK_SHOW_ITEM if show_item else AUTOMATIC
        sound = SOUND_SCREAM2 if show_item == 1 else SOUND_LONG if show_item else SOUND_AUTOMATIC
    if "NO_SOUND" in tags:
        sound = SOUND_NONE
    mouth = next((i for i, tag in enumerate(MOUTHS, 1) if tag in tags), 0)
    return "".join(fragments), DaveMetadata(flags, action, sound, show_item, mouth,
                                           timers.get("DELAY", 100), timers.get("TIME", 100),
                                           "NO_CLICK" in tags)


def strip_dave_commands(text: str) -> str:
    """Strip known hidden commands while preserving formatting placeholders."""
    return parse_dave_dialogue(text)[0]


def strip_dave_string_entries(strings: dict[str, str]) -> dict[str, str]:
    """Transform ONLY numeric Dave entries; return a new dictionary."""
    return {key: strip_dave_commands(value) if re.fullmatch(r"CRAZY_DAVE_\d+", key) else value
            for key, value in strings.items()}


def render(strings: dict[str, str]) -> tuple[str, str]:
    messages = {int(key.removeprefix("CRAZY_DAVE_")): parse_dave_dialogue(value)[1]
                for key, value in strings.items() if re.fullmatch(r"CRAZY_DAVE_\d+", key)}
    if len(messages) != 180 or min(messages) != 201 or max(messages) != 4004:
        raise ValueError("Expected the 180 original1073 sparse Dave IDs (201..4004)")
    header = """// Generated by tools/gen_dave_dialogue_metadata.py from original1073.
#pragma once
#include <cstdint>

enum class DaveTalkAction : std::uint8_t { Automatic, Handing, Shake, Scream, Scream2, ShowItem };
enum class DaveSoundChoice : std::uint8_t { Automatic, None, Short, Long, Scream, Scream2, Crazy };
enum class DaveShowItem : std::uint8_t { None, Wallnut, Hammer, Fertilizer, TreeFood, Moneybag };
enum class DaveMouth : std::uint8_t { None, BigSmile, SmallSmile, BigOh, SmallOh };
enum DaveDialogueFlag : std::uint8_t
{
    DaveDialogueHanding = 1,
    DaveDialogueShake = 2,
    DaveDialogueHasDelay = 4,
    DaveDialogueHasTime = 8,
};

// All commands are baked offline. Runtime message text contains UI only.
struct DaveDialogueMetadata
{
    std::uint8_t flags = 0;
    DaveTalkAction talkAction = DaveTalkAction::Automatic;
    DaveSoundChoice soundChoice = DaveSoundChoice::Automatic;
    DaveShowItem showItem = DaveShowItem::None;
    DaveMouth mouth = DaveMouth::None;
    int delay = 100;
    int time = 100;
    bool noClick = false;
};

inline constexpr int gDaveDialogueMessageLimit = 4005;
inline constexpr int gDaveDialogueMessageCount = 180;
// Missing/negative IDs return command-free defaults.
const DaveDialogueMetadata& GetDaveDialogueMetadata(int theMessageIndex);
"""
    actions = ("Automatic", "Handing", "Shake", "Scream", "Scream2", "ShowItem")
    sounds = ("Automatic", "None", "Short", "Long", "Scream", "Scream2", "Crazy")
    items = ("None", "Wallnut", "Hammer", "Fertilizer", "TreeFood", "Moneybag")
    mouths = ("None", "BigSmile", "SmallSmile", "BigOh", "SmallOh")
    rows = {message_id: i for i, message_id in enumerate(sorted(messages), 1)}
    source = [header.splitlines()[0], '#include "DaveDialogueMetadata.h"', "", "namespace", "{",
              "constexpr DaveDialogueMetadata kMessages[gDaveDialogueMessageCount + 1] =", "{", "    {},"]
    for message_id in sorted(messages):
        m = messages[message_id]
        source.append(f"    {{{m.flags}, DaveTalkAction::{actions[m.talk_action]}, DaveSoundChoice::{sounds[m.sound_choice]}, "
                      f"DaveShowItem::{items[m.show_item]}, DaveMouth::{mouths[m.mouth]}, {m.delay}, {m.time}, "
                      f"{'true' if m.no_click else 'false'}}}, // {message_id}")
    source += ["};", "", "constexpr std::uint8_t kMessageRows[gDaveDialogueMessageLimit] =", "{"]
    indices = [str(rows.get(i, 0)) for i in range(4005)]
    source += ["    " + ", ".join(indices[i:i + 32]) + "," for i in range(0, len(indices), 32)]
    source += ["};", "} // namespace", "", "const DaveDialogueMetadata& GetDaveDialogueMetadata(int theMessageIndex)",
               "{", "    if (static_cast<unsigned>(theMessageIndex) >= gDaveDialogueMessageLimit)",
               "        return kMessages[0];", "    return kMessages[kMessageRows[theMessageIndex]];", "}", ""]
    return header, "\n".join(source)


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--input", type=Path, required=True)
    parser.add_argument("--output-dir", type=Path, default=Path(__file__).resolve().parent.parent / "Sexy.TodLib/generated")
    parser.add_argument("--check", action="store_true")
    opts = parser.parse_args()
    # Keep this import local: the entity generator can import our strip helper.
    from gen_entity_strings import parse_strings
    header, source = render(parse_strings(opts.input))
    for name, contents in (("DaveDialogueMetadata.h", header), ("DaveDialogueMetadata.cpp", source)):
        target = opts.output_dir / name
        if opts.check:
            if target.read_text("utf-8") != contents:
                raise ValueError(f"Stale generated output: {target}")
        else:
            target.write_text(contents, encoding="utf-8", newline="\n")
    print("Verified 180 original1073 Dave metadata records, sparse IDs 201..4004, numeric runtime tables only.")


if __name__ == "__main__":
    main()
