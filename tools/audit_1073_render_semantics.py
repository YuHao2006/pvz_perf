#!/usr/bin/env python3
"""Audit the Legacy Reanimation draw contract against local GOTY 1073 evidence.

This is deliberately a source/evidence audit, not a screenshot test.  It locks
the non-obvious render-group ordering that was recovered from the authoritative
1.2.0.1073 executable so later rendering optimizations cannot silently change
game-object ownership or layer order.
"""

from __future__ import annotations

import csv
import hashlib
import re
import struct
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
REFERENCE_EXE = Path(r"C:\UserProgram\Plants_Vs_Zombies_V1.2.0.1073_EN\PlantsVsZombies.exe")
REFERENCE_EXE_SHA256 = "5F650F52D12751E08B63E590EDB0D9B9F09D087CEA900BAA0EB39E4AF8EDA251"
BASELINE_ARCHIVE = ROOT / "Tests/reference/render-groups/source-baseline.tar.gz"
BASELINE_ARCHIVE_SHA256 = "54CAEFBDCEBDB18678B1DDB722FE4268893F800DCE8A314F12C90FE9565B4DBA"


class Audit:
    def __init__(self) -> None:
        self.errors: list[str] = []
        self.checks = 0

    def require(self, condition: bool, message: str) -> None:
        self.checks += 1
        if not condition:
            self.errors.append(message)


def read_path(path: Path) -> str:
    data = path.read_bytes()
    try:
        return data.decode("utf-8-sig")
    except UnicodeDecodeError:
        # A few inherited Patoke translation units still contain legacy GBK
        # comments.  The audited C++ tokens are ASCII in either encoding.
        return data.decode("gb18030")


def read(relative: str) -> str:
    base = ROOT if relative.startswith("tools/") else ROOT / "pvzPerf"
    return read_path(base / relative)


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest().upper()


def function_body(text: str, qualified_name: str) -> str:
    """Return a C++ function body while ignoring braces in comments/strings."""
    # A mere call can have the same spelling as a definition.  In particular,
    # ``if (!Zombie::ZombieTypeCanGoInPool(...)) {`` used to be mistaken for
    # the function body.  Definition prefixes may contain return-type tokens,
    # comments, pointers and references, but not an earlier expression
    # parenthesis/operator/member-access token on the same line.
    signature = re.search(
        rf"(?:^|\n)[^\n;()=!?.]*\b{re.escape(qualified_name)}\s*\([^;{{}}]*?\)\s*(?:const\s*)?\{{",
        text,
        re.DOTALL,
    )
    if signature is None:
        raise ValueError(f"function not found: {qualified_name}")

    opening = text.find("{", signature.start())
    depth = 0
    index = opening
    state = "code"
    while index < len(text):
        char = text[index]
        nxt = text[index + 1] if index + 1 < len(text) else ""
        if state == "code":
            if char == "/" and nxt == "/":
                state = "line-comment"
                index += 2
                continue
            if char == "/" and nxt == "*":
                state = "block-comment"
                index += 2
                continue
            if char == '"':
                state = "string"
            elif char == "'":
                state = "char"
            elif char == "{":
                depth += 1
            elif char == "}":
                depth -= 1
                if depth == 0:
                    return text[opening + 1 : index]
        elif state == "line-comment":
            if char == "\n":
                state = "code"
        elif state == "block-comment":
            if char == "*" and nxt == "/":
                state = "code"
                index += 2
                continue
        elif state in ("string", "char"):
            if char == "\\":
                index += 2
                continue
            if (state == "string" and char == '"') or (state == "char" and char == "'"):
                state = "code"
        index += 1
    raise ValueError(f"unterminated function: {qualified_name}")


def normalize_argument(argument: str) -> str:
    return re.sub(r"\s+", "", argument)


def draw_group_arguments(body: str) -> list[str]:
    return [
        normalize_argument(match.group(1))
        for match in re.finditer(r"DrawRenderGroup\s*\(\s*[^,]+,\s*([^\)]+)\)", body)
    ]


def audit_group_calls(audit: Audit) -> None:
    sources = {
        "reanim": read("Sexy.TodLib/Reanimator.cpp"),
        "attachment": read("Sexy.TodLib/Attachment.cpp"),
        "board": read("Lawn/Board.cpp"),
        "plant": read("Lawn/Plant.cpp"),
        "zombie": read("Lawn/Zombie.cpp"),
        "challenge": read("Lawn/Challenge.cpp"),
        "credits": read("Lawn/Widget/CreditScreen.cpp"),
        "selector": read("Lawn/Widget/GameSelector.cpp"),
    }

    izombie_place = function_body(sources["challenge"], "Challenge::IZombiePlaceZombie")
    audit.require(
        "aZombie->SetRow(theGridY)" in izombie_place,
        "I, Zombie bungee placement no longer assigns the requested grid row",
    )
    audit.require(
        "aZombie->SetRow(theGridX)" not in izombie_place,
        "I, Zombie bungee placement regressed to using the column as its logical row",
    )

    izombie_update = function_body(sources["challenge"], "Challenge::IZombieUpdate")
    audit.require(
        "while (mBoard->IterateCoins(aSunCoin))" in izombie_update
        and "if (aSunCoin->IsSun())" in izombie_update
        and "aSunMoney += aSunCoin->GetSunValue()" in izombie_update,
        "I, Zombie loss detection no longer counts every live lawn sun at its exact value",
    )
    audit.require(
        "mBoard->CountSunBeingCollected()" not in izombie_update,
        "I, Zombie loss detection regressed to counting only sun already being collected",
    )

    reanim_draw = function_body(sources["reanim"], "Reanimation::Draw")
    audit.require(
        "mGroupOccMask&((1u<<18)-1u)" in normalize_argument(reanim_draw)
        and "std::countr_zero(aGroups)" in reanim_draw and "aGroups &= aGroups - 1" in reanim_draw,
        "Reanimation::Draw no longer visits occupied GOTY groups 0..17 in ascending order",
    )
    audit.require(
        "DrawRenderGroup(g, (int)aRenderGroup)" in reanim_draw,
        "Reanimation::Draw no longer forwards each group to DrawRenderGroup",
    )

    draw_group = function_body(sources["reanim"], "Reanimation::DrawRenderGroup")
    audit.require("if (mDead)" in draw_group, "DrawRenderGroup lost the dead-Reanimation early return")
    audit.require(
        "aTrackInstance->mRenderGroup == theRenderGroup" in draw_group,
        "DrawRenderGroup no longer filters tracks by exact group",
    )
    audit.require(
        "AttachmentDraw(aTrackInstance->mAttachmentID, g, !aTrackDrawn)" in draw_group,
        "DrawRenderGroup attachment visibility no longer matches 1073",
    )
    audit.require(
        draw_group.count("aTriangleGroup.DrawGroup(g)") == 2,
        "DrawRenderGroup must flush once before attachments and once at the end",
    )

    expected = {
        ("challenge", "Challenge::IZombieDrawPlant"): ["0", "0", "0", "0"],
        ("challenge", "Challenge::TreeOfWisdomDraw"): ["1", "2", "3", "4"],
        ("plant", "Plant::Draw"): ["1", "RENDER_GROUP_NORMAL"],
        ("zombie", "Zombie::DrawBungeeReanim"): ["RENDER_GROUP_NORMAL", "RENDER_GROUP_ARMS"],
        ("zombie", "Zombie::DrawDancerReanim"): ["RENDER_GROUP_NORMAL"],
        ("zombie", "Zombie::DrawReanim"): [
            "theBaseRenderGroup",
            "theBaseRenderGroup",
            "RENDER_GROUP_SHIELD",
            "RENDER_GROUP_OVER_SHIELD",
            "RENDER_GROUP_OVER_SHIELD",
            "4",
        ],
        ("zombie", "Zombie::DrawBossFireBall"): [
            "RENDER_GROUP_NORMAL",
            "RENDER_GROUP_BOSS_FIREBALL_ADDITIVE",
            "RENDER_GROUP_BOSS_FIREBALL_TOP",
        ],
        ("credits", "CreditScreen::Draw"): ["1", "0", "2", "3", "3"],
        ("selector", "GameSelector::Draw"): ["1", "RENDER_GROUP_NORMAL"],
    }

    audited_manual_calls = 0
    bodies: dict[str, str] = {}
    for (source_key, name), expected_arguments in expected.items():
        body = function_body(sources[source_key], name)
        bodies[name] = body
        actual_arguments = draw_group_arguments(body)
        audited_manual_calls += len(actual_arguments)
        audit.require(
            actual_arguments == expected_arguments,
            f"{name} group order differs: expected {expected_arguments}, got {actual_arguments}",
        )

    all_lawn_cpp = "\n".join(read_path(path) for path in (ROOT / "pvzPerf/Lawn").rglob("*.cpp")
                             if not path.name.endswith("Smoke.cpp"))
    source_manual_calls = len(re.findall(r"->DrawRenderGroup\s*\(", all_lawn_cpp))
    audit.require(audited_manual_calls == 29, f"audited manual group-call total is {audited_manual_calls}, expected 29")
    audit.require(source_manual_calls == 29, f"source has {source_manual_calls} manual group calls, expected exactly 29")

    tree = bodies["Challenge::TreeOfWisdomDraw"]
    audit.require(
        tree.find("DrawRenderGroup(g, 1)")
        < tree.find("mReanimClouds[i])->Draw(g)")
        < tree.find("DrawRenderGroup(g, 2)"),
        "Tree of Wisdom clouds are no longer between background group 1 and tree group 2",
    )
    selector = bodies["GameSelector::Draw"]
    audit.require(
        selector.find("DrawRenderGroup(g, 1)")
        < selector.find("mCloudReanimID[i])->Draw(g)")
        < selector.find("DrawRenderGroup(g, RENDER_GROUP_NORMAL)"),
        "Selector clouds are no longer between background group 1 and body group 0",
    )
    bungee = bodies["Zombie::DrawBungeeReanim"]
    captured = min(
        position
        for position in (bungee.find("aDroppedZombie->DrawReanim"), bungee.find("aPlant->Draw"))
        if position >= 0
    )
    audit.require(
        bungee.find("DrawRenderGroup(g, RENDER_GROUP_NORMAL)")
        < captured
        < bungee.find("DrawRenderGroup(g, RENDER_GROUP_ARMS)"),
        "Bungee captured object is no longer drawn between body group 0 and arm group 2",
    )

    plant = bodies["Plant::Draw"]
    audit.require(
        "aBodyReanim->Draw(g)" not in plant,
        "Plant::Draw must draw body group 0 only; generic all-group Draw duplicates Pumpkin_back",
    )
    attachment = function_body(sources["attachment"], "Attachment::Draw")
    audit.require(
        "aReanimation->Draw(g)" in attachment,
        "attached Reanimations must use the official all-groups Draw path",
    )
    board = function_body(sources["board"], "Board::DrawGameObjects")
    audit.require(
        "aPlant->mOnBungeeState == PlantOnBungeeState::NOT_ON_BUNGEE" in board,
        "Board must suppress plants currently owned by a bungee draw",
    )
    zombie_draw = function_body(sources["zombie"], "Zombie::Draw")
    first_logic = zombie_draw.find("ZombieDrawPosition")
    bungee_return = zombie_draw.find("HEIGHT_GETTING_BUNGEE_DROPPED")
    audit.require(
        0 <= bungee_return < first_logic,
        "a zombie being dropped by a bungee must leave Zombie::Draw before normal drawing",
    )

    all_gameplay_source = all_lawn_cpp + "\n" + sources["reanim"] + "\n" + sources["attachment"]
    for forbidden in ("mRenderParent", "BungeeZombieRenderPlan", "FindFrontBungeeForPlant"):
        audit.require(forbidden not in all_gameplay_source, f"abandoned render-ownership experiment remains: {forbidden}")


def audit_official_evidence(audit: Audit) -> None:
    exact = read("tools/ghidra_output/reanim_draw_1073_exact.c")
    official_groups = [
        int(value, 0)
        for value in re.findall(r"FUN_00477550\s*\(\s*unaff_ESI\s*,\s*(0x[0-9a-fA-F]+|\d+)\s*\)", exact)
    ]
    audit.require(
        official_groups == list(range(18)),
        f"1073 evidence no longer records the exact 0..17 generic draw sequence: {official_groups}",
    )

    refs = [
        line
        for line in read("tools/ghidra_output/refs_reanim_draw_group_1073.txt").splitlines()
        if line.strip()
    ]
    audit.require(len(refs) == 47, f"1073 DrawRenderGroup xref evidence has {len(refs)} entries, expected 47")
    generic_refs = [line for line in refs if line.rstrip().endswith("FUN_00477490")]
    audit.require(len(generic_refs) == 18, f"1073 generic Draw has {len(generic_refs)} group calls, expected 18")
    audit.require(len(refs) - len(generic_refs) == 29, "1073 must have exactly 29 manual DrawRenderGroup call sites")

    if REFERENCE_EXE.exists():
        audit.require(
            sha256(REFERENCE_EXE) == REFERENCE_EXE_SHA256,
            "the local 1073 authority executable hash changed",
        )
        binary = REFERENCE_EXE.read_bytes()
        pe_offset = struct.unpack_from("<I", binary, 0x3C)[0]
        section_count = struct.unpack_from("<H", binary, pe_offset + 6)[0]
        optional_size = struct.unpack_from("<H", binary, pe_offset + 20)[0]
        optional = pe_offset + 24
        audit.require(
            binary[pe_offset:pe_offset + 4] == b"PE\0\0"
            and struct.unpack_from("<H", binary, optional)[0] == 0x10B,
            "the 1073 authority is not the expected PE32 executable",
        )
        image_base = struct.unpack_from("<I", binary, optional + 28)[0]
        section_offset = optional + optional_size
        for line in refs:
            address = int(line.split()[0], 16)
            rva = address - image_base
            call = b""
            for section in range(section_count):
                entry = section_offset + section * 40
                virtual, raw_size, raw_offset = struct.unpack_from("<III", binary, entry + 12)
                if virtual <= rva and rva + 5 <= virtual + raw_size:
                    start = raw_offset + rva - virtual
                    call = binary[start:start + 5]
                    break
            audit.require(
                len(call) == 5 and call[0] == 0xE8
                and address + 5 + struct.unpack_from("<i", call, 1)[0] == 0x00477550,
                f"stored DrawRenderGroup xref differs from the 1073 binary at {address:08X}",
            )
    if BASELINE_ARCHIVE.exists():
        audit.require(
            sha256(BASELINE_ARCHIVE) == BASELINE_ARCHIVE_SHA256,
            "the protected pre-render-refactor source archive hash changed",
        )
    else:
        audit.require(False, f"protected source archive is missing: {BASELINE_ARCHIVE}")


def parse_zombatar_source_rows(text: str, array_name: str) -> list[dict[str, object]]:
    block_match = re.search(
        rf"const\s+ZombatarItem\s+{re.escape(array_name)}\[\]\s*=\s*\{{(.*?)\n\}};",
        text,
        re.DOTALL,
    )
    if block_match is None:
        raise ValueError(f"Zombatar array not found: {array_name}")

    color_modes = {
        "ZOMBATAR_COLOR_HAIR": 1,
        "ZOMBATAR_COLOR_BRIGHT": 2,
        "ZOMBATAR_COLOR_NOT_APPLICABLE": 4,
    }
    rows: list[dict[str, object]] = []
    for match in re.finditer(r"\{([^{}]+)\}\s*,?", block_match.group(1)):
        fields = [field.strip() for field in match.group(1).split(",")]
        if len(fields) != 11 or not re.fullmatch(r"ReanimTrackId::\w+", fields[8]) \
                or not re.fullmatch(r"ReanimTrackId::\w+", fields[9]):
            raise ValueError(f"unexpected {array_name} initializer: {match.group(0).strip()}")
        rows.append(
            {
                "x": int(fields[2], 0),
                "y": int(fields[3], 0),
                "maskX": int(fields[4], 0),
                "maskY": int(fields[5], 0),
                "colorMode": color_modes[fields[6]],
                "alignment": int(fields[7], 0),
                "track": "" if fields[8] == "ReanimTrackId::None" else fields[8].removeprefix("ReanimTrackId::"),
                "renderOrder": int(fields[10], 0),
            }
        )
    return rows


def audit_zombatar_groups(audit: Audit) -> None:
    source = read("Lawn/Widget/ZombatarItems.cpp")
    arrays = {
        "hair": "gHairItems",
        "facialHair": "gFacialHairItems",
        "tidbits": "gTidbitsItems",
        "eyewear": "gEyewearItems",
        "clothes": "gClothesItems",
        "accessories": "gAccessoriesItems",
        "hats": "gHatsItems",
        "backdrops": "gBackdropItems",
    }
    with (ROOT / "tools/ghidra_output/zombatar_1073_items.csv").open(
        "r", encoding="utf-8-sig", newline=""
    ) as stream:
        official = list(csv.DictReader(stream))

    official_by_category: dict[str, list[dict[str, str]]] = {name: [] for name in arrays}
    for row in official:
        official_by_category[row["category"]].append(row)

    compared = 0
    nonempty_tracks = 0
    track_ids = set(re.findall(r"^\s+(\w+)\s*=\s*\d+", read("Sexy.TodLib/ReanimTrackId.h"), re.M))
    unbound_tracks = {"hair_02", "hats_12"}
    audit.require(
        not unbound_tracks & track_ids and all(name + "_line" in track_ids for name in unbound_tracks),
        "the two originally unbound Zombatar component track contracts changed",
    )
    for category, array_name in arrays.items():
        current_rows = parse_zombatar_source_rows(source, array_name)
        official_rows = official_by_category[category]
        audit.require(
            len(current_rows) == len(official_rows),
            f"Zombatar {category} count differs: source {len(current_rows)}, 1073 {len(official_rows)}",
        )
        for index, (current, reference) in enumerate(zip(current_rows, official_rows)):
            expected = {
                key: reference[key] if key == "track" else int(reference[key], 0)
                for key in ("x", "y", "maskX", "maskY", "colorMode", "alignment", "track", "renderOrder")
            }
            # These two original lookups have no target in the authored track
            # corpus. Its compiled absence is explicit, not a runtime name fallback.
            if expected["track"] in unbound_tracks:
                expected["track"] = ""
            audit.require(
                current == expected,
                f"Zombatar {category}[{index}] differs: source {current}, 1073 {expected}",
            )
            compared += 1
            if reference["track"]:
                nonempty_tracks += 1

    audit.require(compared == 116, f"compared {compared} Zombatar rows, expected 116")
    audit.require(nonempty_tracks == 99, f"found {nonempty_tracks} Zombatar component tracks, expected 99")

    apply_body = function_body(source, "ApplyZombatarReanimation")
    audit.require(
        "AssignRenderGroupToTrack(anItem->mTrack, anItem->mRenderGroup)" in apply_body,
        "Zombatar component track no longer uses its official per-item render group",
    )
    audit.require(
        "AssignRenderGroupToTrack(anItem->mLineTrack, anItem->mRenderGroup + 1)" in apply_body,
        "Zombatar line track no longer follows its component in the adjacent group",
    )


def audit_portable_fix_parity(audit: Audit) -> None:
    """Lock Portable-derived fixes that were independently proven in GOTY 1073."""

    gargantuar_count = function_body(
        read("Lawn/Board.cpp"), "Board::GetLiveGargantuarCount"
    )
    audit.require(
        "!aZombie->mDead && aZombie->mHasHead" in gargantuar_count,
        "live Gargantuar counting no longer applies GOTY 1073's !mDead test",
    )
    audit.require(
        "if (aZombie->mDead &&" not in gargantuar_count,
        "live Gargantuar counting regressed to Patoke's inverted mDead test",
    )
    gargantuar_evidence = read(
        "tools/ghidra_output/live_gargantuar_count_1073.txt"
    )
    audit.require(
        "Board::GetLiveGargantuarCount @ 0x0040B3B0" in gargantuar_evidence
        and "mHasHead (+0xBA) != 0" in gargantuar_evidence
        and "mDead    (+0xEC) == 0" in gargantuar_evidence,
        "stored 1073 live-Gargantuar evidence is incomplete",
    )

    board = read("Lawn/Board.cpp")
    zen_rect = function_body(board, "Board::GetZenButtonRect")
    audit.require(
        "if (theObjectType == GameObjectType::OBJECT_TYPE_NEXT_GARDEN)" in zen_rect
        and "theRect.mX = 30" in zen_rect
        and "return;" in zen_rect,
        "Tree of Wisdom next-garden button placement differs from GOTY 1073",
    )
    audit.require(
        "theRect.mX = 30;\n\tbool usable = true" in zen_rect
        and "anObject != GameObjectType::OBJECT_TYPE_TREE_FOOD" in zen_rect
        and "anObject <= GameObjectType::OBJECT_TYPE_NEXT_GARDEN" in zen_rect
        and "theRect.mX += 70" in zen_rect,
        "Zen Garden tool layout differs from GOTY 1073",
    )

    freeze = function_body(board, "Board::FreezeEffectsForCutscene")
    audit.require(
        "aParticle->mEffectType == ParticleEffect::PARTICLE_GRAVE_BUSTER" in freeze
        and "else if (aParticle->mEffectType == ParticleEffect::PARTICLE_POOL_SPARKLY && mIceTrapCounter == 0)" in freeze,
        "cutscene particle freezing no longer handles Grave Buster and pool sparkly separately",
    )
    impossible_nested = freeze.find(
        "if (aParticle->mEffectType == ParticleEffect::PARTICLE_GRAVE_BUSTER)"
    )
    audit.require(
        impossible_nested >= 0
        and "PARTICLE_POOL_SPARKLY" not in freeze[impossible_nested : impossible_nested + 180],
        "cutscene particle freezing regressed to Patoke's impossible nested effect test",
    )

    zen_freeze_evidence = read(
        "tools/ghidra_output/board_zen_freeze_1073_range.c.txt"
    )
    audit.require(
        "/* 0040d7b0 FUN_0040d7b0 */" in zen_freeze_evidence
        and "param_2 == 0xe" in zen_freeze_evidence
        and "iVar3 != 0xe" in zen_freeze_evidence
        and "*unaff_EDI = *unaff_EDI + 0x46" in zen_freeze_evidence,
        "stored 1073 Zen Garden layout evidence is incomplete",
    )
    audit.require(
        "/* 0040d560 FUN_0040d560 */" in zen_freeze_evidence
        and "iRam00000000 == 0x18" in zen_freeze_evidence
        and "iRam00000000 == 0x22" in zen_freeze_evidence
        and "*(int *)(unaff_EDI + 0x5630) == 0" in zen_freeze_evidence,
        "stored 1073 cutscene particle-freeze evidence is incomplete",
    )

    pool = read("Lawn/System/PoolEffect.cpp")
    pool_header = read("Lawn/System/PoolEffect.h")
    pool_init = function_body(pool, "PoolEffect::PoolEffectInitialize")
    pool_draw = function_body(pool, "PoolEffect::PoolEffectDraw")
    audit.require(
        "mPoolTimeNs = 0" in pool_init
        and "unsigned long long" in pool_header
        and "mPoolTimeNs" in pool_header,
        "pool animation clock is not an initialized integer nanosecond age",
    )
    audit.require(
        "mPoolTimeNs % 1'584'000'000'000ull" in pool_draw
        and "*2*PI" in pool_draw
        and "phase/8'000'000'000.0" in pool_draw,
        "pool phase no longer preserves GOTY 1073's speed and exact period",
    )
    pool_mesh = read("SexyAppFramework/graphics/PoolMesh.cpp")
    audit.require(
        "out.u += u; out.v += vv;" in pool_mesh,
        "pool caustic UV repetition differs from GOTY 1073",
    )
    pool_evidence = read("tools/ghidra_output/pool_effect_1073_range.c.txt")
    pool_semantics = read("tools/ghidra_output/pool_effect_semantics_1073.txt")
    audit.require(
        "/* 0046de10 FUN_0046de10 */" in pool_evidence
        and "unaff_ESI[3] = 0" in pool_evidence
        and "/* 0046e180 FUN_0046e180 */" in pool_evidence
        and "least common multiple is 158400 ticks" in pool_semantics,
        "stored 1073 pool-effect evidence is incomplete",
    )

    store_draw = function_body(
        read("Lawn/Widget/StoreScreen.cpp"), "StoreScreen::Draw"
    )
    audit.require(
        "STORESCREEN_COINBANK_X + 116" in store_draw,
        "store coin-bank label right edge differs from GOTY 1073",
    )
    audit.require(
        '"{PAGE}"), mPage + 1)' in store_draw
        and "STORESCREEN_PAGESTRING_X, STORESCREEN_PAGESTRING_Y" in store_draw,
        "store page number or vertical position differs from GOTY 1073",
    )
    store_evidence = read("tools/ghidra_output/store_draw_1073.c.txt")
    audit.require(
        "/* 004960b0 FUN_004960b0 */" in store_evidence
        and "FUN_00598a10(auStack_e4,0x2fe - iVar4,0x247)" in store_evidence
        and 'FUN_0051da20(&uStack_120,"{PAGE}",*(int *)(param_1 + 0x1ac) + 1)' in store_evidence
        and "(param_2,0x1d6 - iVar4 / 2,500" in store_evidence,
        "stored 1073 store-label evidence is incomplete",
    )
    store_mouse = function_body(
        read("Lawn/Widget/StoreScreen.cpp"), "StoreScreen::UpdateMouse"
    )
    audit.require(
        "ClampInt(mApp->mPlayerInfo->mPurchases[STORE_ITEM_PACKET_UPGRADE] + 2011, 2011, 2014)"
        in store_mouse,
        "store packet-upgrade description can escape the GOTY 2011..2014 range",
    )
    store_methods_evidence = read(
        "tools/ghidra_output/store_methods_1073_range.c.txt"
    )
    audit.require(
        "/* 004966d0 FUN_004966d0 */" in store_methods_evidence
        and "iVar8 = 0x7db" in store_methods_evidence
        and "iVar8 = 0x7dc" in store_methods_evidence
        and "iVar8 = (iVar8 != 2) + 0x7dd" in store_methods_evidence,
        "stored 1073 packet-upgrade description evidence is incomplete",
    )

    dialog_ctor = function_body(
        read("SexyAppFramework/widget/Dialog.cpp"), "Dialog::Dialog"
    )
    dialog_wait = function_body(
        read("SexyAppFramework/widget/Dialog.cpp"), "Dialog::WaitForResult"
    )
    kill_dialog = function_body(
        read("SexyAppFramework/SexyAppBase.cpp"), "SexyAppBase::KillDialog"
    )
    audit.require(
        "mResult = 0x7FFFFFFF" in dialog_ctor
        and "mResult == 0x7FFFFFFF" in dialog_wait
        and "aDialog->mResult == 0x7FFFFFFF" in kill_dialog,
        "dialog construction, waiting, and forced close no longer share one sentinel",
    )
    audit.require(
        "aDialog->mResult == -1" not in kill_dialog,
        "KillDialog regressed to the ineffective sentinel retained by GOTY 1073",
    )

    plant_height = function_body(read("Lawn/Plant.cpp"), "PlantDrawHeightOffset")
    audit.require(
        "thePlant != nullptr" in plant_height
        and "theBoard->mBackground == BackgroundType::BACKGROUND_ZOMBIQUARIUM" in plant_height
        and "theCol < 5" in plant_height,
        "Zombiquarium floating no longer matches GOTY 1073's placed-plant first-five-column test",
    )
    plant_height_evidence = read(
        "tools/ghidra_output/plant_height_offset_1073.c.txt"
    )
    audit.require(
        "/* 00468a90 FUN_00468a90 */" in plant_height_evidence
        and "in_EAX != 0" in plant_height_evidence
        and "*(int *)(unaff_EDI + 0x5564) == 8" in plant_height_evidence
        and "param_1 < 5" in plant_height_evidence,
        "stored 1073 Zombiquarium floating evidence is incomplete",
    )

    cutscene = read("Lawn/CutScene.cpp")
    intro_update = function_body(cutscene, "CutScene::UpdateIntro")
    intro_draw = function_body(cutscene, "CutScene::DrawIntro")
    audit.require(
        "mBoard->Move(-TodAnimateCurve(" in intro_update,
        "intro camera pan direction differs from GOTY 1073",
    )
    audit.require(
        '"[INTRO_PRESENTS]"' in intro_draw
        and "FONT_BRIANNETOD32" in intro_draw
        and "FONT_BRIANNETOD16" not in intro_draw,
        "intro presentation font differs from GOTY 1073",
    )
    intro_evidence = read(
        "tools/ghidra_output/intro_update_draw_1073_range.c.txt"
    )
    font_evidence = read("tools/ghidra_output/font_load_globals_1073.c.txt")
    audit.require(
        "/* 004445a0 FUN_004445a0 */" in intro_evidence
        and "(iVar1 + 0xa4))(-iVar2)" in intro_evidence
        and "/* 004446b0 FUN_004446b0 */" in intro_evidence
        and "piVar4 = DAT_00727254" in intro_evidence
        and 'FUN_004020c0("FONT_BRIANNETOD32",0x11)' in font_evidence
        and "DAT_00727254 =" in font_evidence,
        "stored 1073 intro pan/font evidence is incomplete",
    )

    dave_advance = function_body(
        cutscene, "CutScene::AdvanceCrazyDaveDialog"
    )
    audit.require(
        '"{SLOTS}"), aNumPackets + 7)' in dave_advance
        and "GetMoneyString(aCost)" in dave_advance,
        "Crazy Dave packet-upgrade dialog amount or slot count differs from GOTY 1073",
    )
    audit.require(
        "else if (aMessageIndex == 1553)" in dave_advance
        and "aMessageIndex == 1533" not in dave_advance,
        "Crazy Dave second packet-upgrade acceptance branch uses the wrong message ID",
    )
    upgrade_evidence = read("tools/ghidra_output/upgrade_dialog_1073.c.txt")
    audit.require(
        'FUN_0051da20(local_28,"{SLOTS}",iVar1 + 7)' in upgrade_evidence
        and "== 0x611" in upgrade_evidence
        and "uVar6 = 0x618" in upgrade_evidence,
        "stored 1073 packet-upgrade dialog evidence is incomplete",
    )

    dave_pick = function_body(
        read("Lawn/Widget/SeedChooserScreen.cpp"),
        "SeedChooserScreen::CrazyDavePickSeeds",
    )
    audit.require(
        "SeedNotRecommendedToPick(aSeedType)" in dave_pick,
        "Crazy Dave can again choose seeds that GOTY 1073 marks unsuitable for the level",
    )
    dave_pick_evidence = read(
        "tools/ghidra_output/seedchooser_1073_guess_range.c.txt"
    )
    pick_start = dave_pick_evidence.find("/* 0048ebf0 FUN_0048ebf0 */")
    pick_end = dave_pick_evidence.find("/* 0048eea0 FUN_0048eea0 */", pick_start)
    audit.require(
        pick_start >= 0
        and pick_end > pick_start
        and "uVar3 = FUN_0041fa20()" in dave_pick_evidence[pick_start:pick_end]
        and "uVar3 != 0" in dave_pick_evidence[pick_start:pick_end],
        "stored 1073 Crazy-Dave seed recommendation evidence is incomplete",
    )

    selector_tooltip = function_body(
        read("Lawn/Widget/GameSelector.cpp"), "GameSelector::UpdateTooltip"
    )
    audit.require(
        "aMouseX >= 50 && aMouseX < 135 && aMouseY >= 250 && aMouseY < 475"
        in selector_tooltip,
        "gold sunflower tooltip hit bounds differ from GOTY 1073",
    )
    selector_tooltip_evidence = read(
        "tools/ghidra_output/selector_trophy_tooltip_bounds_1073.txt"
    )
    audit.require(
        "0044DEDB  CMP EAX,0x32" in selector_tooltip_evidence
        and "0044DEE4  CMP EAX,0x87" in selector_tooltip_evidence
        and "0044DEEF  CMP ECX,0xFA" in selector_tooltip_evidence
        and "0044DEFB  CMP ECX,0x1DB" in selector_tooltip_evidence,
        "stored 1073 trophy-tooltip hit-bound evidence is incomplete",
    )

    audit.require(
        not (ROOT / "pvzPerf/SexyAppFramework/misc/XMLParser.cpp").exists()
        and not (ROOT / "pvzPerf/SexyAppFramework/misc/XMLParser.h").exists(),
        "Retired runtime XML parser was reintroduced",
    )
    xml_evidence = read("tools/ghidra_output/xml_encoding_detection_1073.txt")
    audit.require(
        "0060D797  CMP dword ptr [EDX + 0x20],0x60D000" in xml_evidence
        and "0060D79E  JNZ 0060D842" in xml_evidence,
        "stored 1073 XML encoding-detection evidence is incomplete",
    )
    chooser = function_body(read("Lawn/Widget/SeedChooserScreen.cpp"), "SeedChooserScreen::SeedChooserScreen")
    audit.require(
        "mStartButton->mColors[GameButton::COLOR_LABEL_HILITE] = Color::White" in chooser,
        "Let's Rock hover label color no longer matches GOTY 1073 white",
    )

    achievements = function_body(
        read("Lawn/Widget/AchievementsWidget.cpp"),
        "ReportAchievement::AchievementInitForPlayer",
    )
    audit.require(
        "aSeedType = SEED_GATLINGPEA" in achievements
        and "aSeedType <= SEED_IMITATER" in achievements
        and "!theSelector->mApp->SeedTypeAvailable(SeedType(aSeedType))" in achievements,
        "Morticulturalist initialization no longer checks the nine GOTY shop plants",
    )
    audit.require(
        "STORE_ITEM_PLANT_GATLINGPEA; i <= STORE_ITEM_PLANT_IMITATER" not in achievements,
        "Morticulturalist regressed to casting StoreItem indices 0..8 to SeedType",
    )

    purchase = function_body(read("Lawn/Widget/StoreScreen.cpp"), "StoreScreen::PurchaseItem")
    audit.require(
        "theStoreItem >= STORE_ITEM_PLANT_GATLINGPEA" in purchase
        and "theStoreItem <= STORE_ITEM_PLANT_IMITATER" in purchase,
        "store Morticulturalist check is no longer restricted to a shop-plant purchase",
    )
    audit.require(
        "aSeedType = SEED_GATLINGPEA" in purchase
        and "aSeedType <= SEED_IMITATER" in purchase
        and "!mApp->SeedTypeAvailable(SeedType(aSeedType))" in purchase,
        "store Morticulturalist check no longer verifies ownership of all nine shop plants",
    )

    continue_pressed = function_body(
        read("Lawn/Widget/AwardScreen.cpp"),
        "AwardScreen::AchievementsContinuePressed",
    )
    audit.require(
        "mApp->IsAdventureMode() && level == 1 && mApp->HasFinishedAdventure()" in continue_pressed,
        "achievement exit can show the adventure credits note from a non-adventure mode",
    )

    squash = function_body(read("Lawn/Plant.cpp"), "Plant::UpdateSquash")
    prelaunch = squash.find("mState = PlantState::STATE_SQUASH_PRE_LAUNCH")
    audit.require(
        prelaunch >= 0 and "mStateCountdown = 45" in squash[prelaunch : prelaunch + 160],
        "Squash pre-launch delay differs from GOTY 1073's 45 ticks",
    )

    jalapeno = function_body(read("Lawn/Zombie.cpp"), "Zombie::UpdateZombieJalapenoHead")
    audit.require(
        "DieNoLoot();" in jalapeno,
        "Jalapeno-headed zombie no longer dies after its GOTY row-burn action",
    )

    apply_burn = function_body(read("Lawn/Zombie.cpp"), "Zombie::ApplyBurn")
    dancer_scale = apply_burn.find(
        "mZombieType == ZombieType::ZOMBIE_DANCER || mZombieType == ZombieType::ZOMBIE_BACKUP_DANCER"
    )
    audit.require(
        dancer_scale >= 0
        and "mScaleZombie = 1.0f" in apply_burn[dancer_scale : dancer_scale + 240],
        "dancer burn silhouette regressed to inheriting the live dancer scale",
    )

    speed = function_body(read("Lawn/Zombie.cpp"), "Zombie::PickRandomSpeed")
    audit.require(
        "if (mZombiePhase == ZombiePhase::PHASE_SNORKEL_WALKING_IN_POOL)" in speed
        and "mVelX = 0.3f" in speed,
        "snorkel zombie in-pool walking speed differs from GOTY 1073's fixed 0.3",
    )
    audit.require(
        "if (mZombiePhase == ZombiePhase::PHASE_DOLPHIN_WALKING_IN_POOL)" not in speed,
        "Dolphin rider in-pool walking regressed to a non-1073 fixed speed",
    )
    audit.require(
        "mVelX = RandRangeFloat(0.23f, 0.37f)" in speed,
        "ordinary zombie random speed range differs from GOTY 1073's 0.23..0.37",
    )

    squash_evidence = read("tools/ghidra_output/squash_exact_1073.c.txt")
    zombie_evidence = read("tools/ghidra_output/portable_zombie_candidates_1073.c.txt")
    audit.require(
        "param_1[0x15] = 0x2d" in squash_evidence,
        "stored 1073 Squash evidence no longer records the 45-tick delay",
    )
    jalapeno_start = zombie_evidence.find("/* 00537c50 FUN_00537c50 */")
    jalapeno_end = zombie_evidence.find("/* 00537de0 FUN_00537de0 */", jalapeno_start)
    audit.require(
        jalapeno_start >= 0
        and jalapeno_end > jalapeno_start
        and "FUN_00540e90();" in zombie_evidence[jalapeno_start:jalapeno_end],
        "stored 1073 Jalapeno-head evidence no longer ends in DieNoLoot",
    )
    apply_burn_evidence = read("tools/ghidra_output/apply_burn_dancer_scale_1073.txt")
    audit.require(
        "00543862  CMP EAX,0x8" in apply_burn_evidence
        and "00543867  CMP EAX,0x9" in apply_burn_evidence
        and "0054386C  FST dword ptr [EDI + 0x11c]" in apply_burn_evidence,
        "stored 1073 dancer burn-scale evidence is incomplete",
    )
    speed_constants = read("tools/ghidra_output/zombie_speed_constants_1073.txt")
    audit.require(
        "006fdc14  3E99999A" in speed_constants
        and "006fde78  3EBD70A4" in speed_constants
        and "006fde88  3E6B851F" in speed_constants,
        "stored 1073 speed evidence no longer records 0.3, 0.37, and 0.23",
    )

    draw_seed = function_body(read("Lawn/Plant.cpp"), "Plant::DrawSeedType")
    audit.require(
        "aZombieType == ZombieType::ZOMBIE_DANCER" in draw_seed
        and "aSeedG.mScaleX *= 0.8f" in draw_seed
        and "aSeedG.mScaleY *= 0.8f" in draw_seed
        and "aOffsetX = 20.0f" in draw_seed
        and "aOffsetY = 40.0f" in draw_seed,
        "Dancer zombie seed preview transform differs from GOTY 1073",
    )
    seed_packet = function_body(read("Lawn/SeedPacket.cpp"), "DrawSeedPacket")
    dancer_case = seed_packet.find("case SeedType::SEED_ZOMBIE_DANCER:")
    audit.require(
        dancer_case >= 0
        and "aScale = 0.37f" in seed_packet[dancer_case : dancer_case + 180]
        and "aOffsetX = -18.0f" in seed_packet[dancer_case : dancer_case + 180]
        and "aOffsetY = -38.0f" in seed_packet[dancer_case : dancer_case + 180],
        "Dancer seed-packet transform differs from GOTY 1073",
    )
    dancer_evidence = read("tools/ghidra_output/dancer_seed_constants_refs_1073.txt")
    audit.require(
        "00492957  CMP EDI,0x48" in dancer_evidence
        and "00469c02  CMP ECX,0x48" in dancer_evidence,
        "stored 1073 dancer seed-transform evidence is incomplete",
    )

    challenge = read("Lawn/Challenge.cpp")
    puzzle_award = function_body(challenge, "Challenge::PuzzlePhaseComplete")
    audit.require(
        "CanDropChocolate() ? COIN_AWARD_CHOCOLATE : COIN_AWARD_MONEY_BAG"
        in puzzle_award,
        "puzzle award-stage chocolate differs from GOTY 1073's award coin type",
    )
    puzzle_award_evidence = read(
        "tools/ghidra_output/puzzle_award_chocolate_1073.txt"
    )
    audit.require(
        "0042C5C1  AND EBP,0x6" in puzzle_award_evidence
        and "0042C5C4  ADD EBP,0x12" in puzzle_award_evidence,
        "stored 1073 puzzle chocolate-award evidence is incomplete",
    )
    whack_graves = function_body(challenge, "Challenge::WhackAZombiePlaceGraves")
    audit.require(
        "GetTopPlantAt(aCol, aRow, TOPPLANT_ANY) ? 1 : 100000" in whack_graves,
        "Whack-A-Zombie grave weights no longer prefer empty tiles as in GOTY 1073",
    )
    grave_danger = function_body(challenge, "Challenge::GraveDangerSpawnRandomGrave")
    audit.require(
        "GetTopPlantAt(aCol, aRow, TOPPLANT_ANY) ? 1 : 100000" in grave_danger,
        "Grave Danger grave weights no longer prefer empty tiles as in GOTY 1073",
    )
    grave_evidence = read("tools/ghidra_output/grave_spawn_weights_1073.c.txt")
    whack_start = grave_evidence.find("/* 004288d0 FUN_004288d0 */")
    grave_danger_start = grave_evidence.find("/* 004291c0 FUN_004291c0 */")
    audit.require(
        whack_start >= 0
        and grave_danger_start > whack_start
        and "*local_2ac = 1" in grave_evidence[whack_start:grave_danger_start]
        and "*local_2ac = 100000" in grave_evidence[whack_start:grave_danger_start],
        "stored 1073 Whack-A-Zombie grave-weight evidence is incomplete",
    )
    audit.require(
        grave_danger_start >= 0
        and "*local_2a4 = 1" in grave_evidence[grave_danger_start:]
        and "*local_2a4 = 100000" in grave_evidence[grave_danger_start:],
        "stored 1073 Grave Danger grave-weight evidence is incomplete",
    )

    scary_pot = function_body(challenge, "Challenge::ScaryPotterOpenPot")
    audit.require(
        "AddTodParticle(aXPos + 20, aYPos, RENDER_LAYER_GROUND, anEffect)" in scary_pot,
        "Scary Potter vase fragments no longer use GOTY 1073's ground render layer",
    )
    scary_pot_evidence = read("tools/ghidra_output/scary_pot_open_1073.c.txt")
    audit.require(
        "/* 0042c660 FUN_0042c660 */" in scary_pot_evidence
        and "FUN_00523110(fVar5,(float)local_30,200000,uVar2);" in scary_pot_evidence,
        "stored 1073 Scary Potter fragment-layer evidence is incomplete",
    )

    particle = function_body(
        read("Sexy.TodLib/TodParticle.cpp"),
        "TodParticleEmitter::TodEmitterInitialize",
    )
    audit.require(
        "mParticleList.SetAllocator(&theSystem->mParticleHolder->mParticleListNodeAllocator)"
        in particle,
        "particle IDs regressed to the emitter-list allocator instead of the 1073 particle-list allocator",
    )
    particle_evidence = read("tools/ghidra_output/particle_init_1073_range.c.txt")
    audit.require(
        "/* 00520620 FUN_00520620 */" in particle_evidence
        and "param_1[5] = *(int *)(param_4 + 8) + 0x54" in particle_evidence,
        "stored 1073 particle-list allocator evidence is incomplete",
    )

    rgb_to_hsl = function_body(read("Sexy.TodLib/FilterEffect.cpp"), "RGB_to_HSL")
    first_early_return = rgb_to_hsl.find("if (l <= 0.0f)")
    second_early_return = rgb_to_hsl.find("if (s <= 0.0f)")
    audit.require(
        first_early_return >= 0
        and second_early_return > first_early_return
        and "h = 0.0f" in rgb_to_hsl[first_early_return:second_early_return]
        and "s = 0.0f" in rgb_to_hsl[first_early_return:second_early_return]
        and "h = 0.0f" in rgb_to_hsl[second_early_return:second_early_return + 100],
        "RGB_to_HSL early returns again expose the uninitialized outputs present in 1073",
    )
    hsl_evidence = read("tools/ghidra_output/filter_hsl_search_1073.c.txt")
    hsl_start = hsl_evidence.find("/* 00449850 FUN_00449850 */")
    hsl_end = hsl_evidence.find("/* 00449a50 FUN_00449a50 */", hsl_start)
    audit.require(
        hsl_start >= 0
        and hsl_end > hsl_start
        and "if (fVar3 <= 0.0)" in hsl_evidence[hsl_start:hsl_end]
        and "if (fVar2 <= 0.0)" in hsl_evidence[hsl_start:hsl_end],
        "stored evidence for 1073's RGB_to_HSL early-return UB is incomplete",
    )

    cursor_ctor = function_body(read("Lawn/CursorObject.cpp"), "CursorObject::CursorObject")
    audit.require(
        "mHammerDownCounter = 0" in cursor_ctor,
        "CursorObject hammer state regressed to the indeterminate value left by 1073",
    )
    cursor_evidence = read("tools/ghidra_output/portable_candidates_1073.c.txt")
    cursor_start = cursor_evidence.find("/* 0043b860 FUN_0043b860 */")
    cursor_end = cursor_evidence.find("/* 00452640 FUN_00452640 */", cursor_start)
    audit.require(
        cursor_start >= 0
        and cursor_end > cursor_start
        and "unaff_ESI[0x12]" in cursor_evidence[cursor_start:cursor_end]
        and "unaff_ESI[0x11]" not in cursor_evidence[cursor_start:cursor_end],
        "stored evidence for 1073's uninitialized hammer counter is incomplete",
    )

    font_loader = function_body(
        read("SexyAppFramework/misc/ResourceManager.cpp"),
        "ResourceManager::DoLoadFont",
    )
    audit.require(
        "char aBuf[1024]" not in font_loader
        and "find_first_not_of" in font_loader
        and "find_first_of" in font_loader,
        "font-tag parsing regressed to 1073's fixed-size stack buffer",
    )
    font_evidence = read("tools/ghidra_output/resource_do_load_font_1073.c.txt")
    audit.require(
        "/* 006088c0 FUN_006088c0 */" in font_evidence
        and "char local_450 [1028]" in font_evidence
        and "FUN_0069f700(local_450,uVar3);" in font_evidence,
        "stored evidence for 1073's fixed font-tag buffer is incomplete",
    )

    definition = read("Sexy.TodLib/Definition.cpp")
    image_cache = function_body(definition, "DefReadFromCacheImage")
    font_cache = function_body(definition, "DefReadFromCacheFont")
    audit.require(
        "_alloca" not in image_cache
        and "std::string aImageName" in image_cache
        and "aLen < 0 || aLen > 100000" in image_cache,
        "compiled image-name loading regressed to an unbounded stack allocation",
    )
    audit.require(
        "_alloca" not in font_cache
        and "std::string aFontName" in font_cache
        and "aLen < 0 || aLen > 100000" in font_cache,
        "compiled font-name loading regressed to an unbounded stack allocation",
    )
    definition_evidence = read("tools/ghidra_output/definition_cache_names_1073.c.txt")
    audit.require(
        "/* 00446cb0 FUN_00446cb0 */" in definition_evidence
        and "/* 00446d50 FUN_00446d50 */" in definition_evidence
        and definition_evidence.count("__alloca_probe_16") >= 2,
        "stored evidence for 1073's compiled-name stack allocations is incomplete",
    )

    zombie = read("Lawn/Zombie.cpp")
    dancer_update = function_body(zombie, "Zombie::UpdateZombieDancer")
    audit.require(
        "mSummonCounter == 0" in dancer_update
        and "mSummonCounter == 1" not in dancer_update,
        "Dancer summon retry no longer triggers at GOTY 1073's zero countdown",
    )
    dancer_phase = function_body(zombie, "Zombie::GetDancerPhase")
    audit.require(
        "aFrame <= 18 ? ZombiePhase::PHASE_DANCER_RAISE_LEFT_1" in dancer_phase
        and "ZombiePhase::PHASE_DANCER_RAISE_LEFT_2" in dancer_phase
        and "PHASE_DANCER_RAISE_RIGHT_1" not in dancer_phase
        and "PHASE_DANCER_RAISE_RIGHT_2" not in dancer_phase,
        "Dancer phase mapping differs from GOTY 1073's left/left raise cycle",
    )
    dancer_behavior_evidence = read("tools/ghidra_output/dancer_behavior_1073.c.txt")
    dancer_update_start = dancer_behavior_evidence.find("/* 00539360 FUN_00539360 */")
    dancer_update_end = dancer_behavior_evidence.find("/* 0053e900 FUN_0053e900 */")
    audit.require(
        dancer_update_start >= 0
        and dancer_update_end > dancer_update_start
        and "iVar2 = in_EAX[0x45] + -1" in dancer_behavior_evidence[dancer_update_start:dancer_update_end]
        and "iVar2 == 0" in dancer_behavior_evidence[dancer_update_start:dancer_update_end]
        and "in_EAX[0x45] = 1" in dancer_behavior_evidence[dancer_update_start:dancer_update_end],
        "stored 1073 Dancer summon-retry evidence is incomplete",
    )
    dancer_phase_evidence = read("tools/ghidra_output/dancer_phase_1073.c.txt")
    audit.require(
        "if (iVar1 < 0x10)" in dancer_phase_evidence
        and "return 0x2e" in dancer_phase_evidence
        and "if (0x12 < iVar1)" in dancer_phase_evidence
        and "uVar2 = 0x30" in dancer_phase_evidence,
        "stored 1073 Dancer phase-map evidence is incomplete",
    )

    imitater_tooltip = function_body(
        read("Lawn/Widget/ImitaterDialog.cpp"),
        "ImitaterDialog::ShowToolTip",
    )
    audit.require(
        '"[NOT_RECOMMENDED_FOR_LEVEL]"' in imitater_tooltip
        and '"[NOT_RECOMMEND_FOR_LEVEL]"' not in imitater_tooltip,
        "Imitater warning key differs from GOTY 1073",
    )
    warning_key_evidence = read("tools/ghidra_output/not_recommended_key_1073.txt")
    audit.require(
        "STRING 006f0e08 [NOT_RECOMMENDED_FOR_LEVEL]" in warning_key_evidence
        and "REF 0048dde7" in warning_key_evidence,
        "stored 1073 Imitater warning-key evidence is incomplete",
    )

    can_interact = function_body(read("Lawn/Board.cpp"), "Board::CanInteractWithBoardButtons")
    audit.require(
        "mBoardFadeOutCounter >= 0" in can_interact,
        "board buttons can be activated during the GOTY reward fade-out",
    )
    update_spawning = function_body(read("Lawn/Board.cpp"), "Board::UpdateZombieSpawning")
    audit.require(
        "IsFlagWave(mCurrentWave) && !(mApp->IsWallnutBowlingLevel() || "
        "mApp->mGameMode == GameMode::GAMEMODE_CHALLENGE_LAST_STAND)"
        in update_spawning,
        "flag-wave countdown exclusions differ from GOTY 1073",
    )
    board_button_evidence = read("tools/ghidra_output/board_buttons_search_1073.c.txt")
    audit.require(
        "/* 00414e40 FUN_00414e40 */" in board_button_evidence
        and "*(int *)(unaff_ESI + 0x5618) < 0" in board_button_evidence,
        "stored 1073 reward-fade button evidence is incomplete",
    )
    wave_evidence = read("tools/ghidra_output/wave_spawn_search_1073.c.txt")
    audit.require(
        "/* 00416660 FUN_00416660 */" in wave_evidence
        and "cVar3 = FUN_00456d10();" in wave_evidence
        and "*(int *)(extraout_ECX_00 + 0x918) != 0x1f" in wave_evidence,
        "stored 1073 flag-wave exclusion evidence is incomplete",
    )

    pool_types = function_body(read("Lawn/Zombie.cpp"), "Zombie::ZombieTypeCanGoInPool")
    audit.require(
        "theZombieType == ZombieType::ZOMBIE_BALLOON" in pool_types,
        "Balloon zombie regressed out of GOTY 1073's pool-capable type list",
    )
    pool_type_evidence = read("tools/ghidra_output/zombie_542_546_1073.c.txt")
    pool_type_start = pool_type_evidence.find("/* 00542a10 FUN_00542a10 */")
    pool_type_end = pool_type_evidence.find("/* 00542a60 FUN_00542a60 */", pool_type_start)
    audit.require(
        pool_type_start >= 0
        and pool_type_end > pool_type_start
        and "in_EAX != 0x10" in pool_type_evidence[pool_type_start:pool_type_end],
        "stored 1073 Balloon pool-capability evidence is incomplete",
    )

    splash = function_body(read("Lawn/Projectile.cpp"), "Projectile::IsSplashDamage")
    audit.require(
        "mProjectileType == ProjectileType::PROJECTILE_FIREBALL" in splash
        and "mProjectileType && theZombie" not in splash,
        "fire-resistant targets incorrectly suppress non-fireball splash damage",
    )
    splash_damage = function_body(read("Lawn/Projectile.cpp"), "Projectile::DoSplashDamage")
    audit.require(
        "int aMaxSplashDamageAmount = aOriginalDamage * 7" in splash_damage,
        "melon splash total cap differs from GOTY 1073's original-damage-times-seven rule",
    )
    splash_evidence = read("tools/ghidra_output/splash_search_1073.c.txt")
    splash_start = splash_evidence.find("/* 004718a0 FUN_004718a0 */")
    splash_end = splash_evidence.find("/* 004718e0 FUN_004718e0 */", splash_start)
    audit.require(
        splash_start >= 0
        and splash_end > splash_start
        and "iVar1 != 6" in splash_evidence[splash_start:splash_end]
        and "iVar1 == 3 || (iVar1 == 5)" in splash_evidence[splash_start:splash_end],
        "stored 1073 splash-damage evidence is incomplete",
    )
    audit.require(
        "iVar3 = iVar1 * 7" in splash_evidence
        and "iVar5 = (iVar1 / 3) * iVar5" in splash_evidence,
        "stored 1073 melon splash-cap evidence is incomplete",
    )


def main() -> int:
    audit = Audit()
    try:
        audit_official_evidence(audit)
        audit_group_calls(audit)
        audit_zombatar_groups(audit)
        audit_portable_fix_parity(audit)
    except (OSError, ValueError, KeyError) as error:
        audit.errors.append(str(error))

    if audit.errors:
        print("1073 render semantics audit: FAILED", file=sys.stderr)
        for error in audit.errors:
            print(f"  - {error}", file=sys.stderr)
        return 1

    print(
        "1073 render semantics audit: PASS "
        f"({audit.checks} checks; 18 generic groups; 29 manual calls; "
        "116 Zombatar rows / 99 component tracks)"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
