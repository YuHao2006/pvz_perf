# -*- coding: utf-8 -*-
# C 形态稠密 switch -> 匿名 lambda 函数指针表 通用生成器 + 对拍器（配置驱动）。
# 用法（cwd=仓库根）：python tools/rewrite_dense_switch.py <config> gen|verify
# 纪律：表由脚本从原 switch 解析生成；逆变换 token 级对拍 0 差异才许提交。
# 形态方针（2026-10-02 用户裁决）：匿名 lambda 表内直写；标签共体/跨槽复用/default
# 行为具名函数；哨兵与表外值由守卫（default 非空时 else 显式调 default）拦下
# = 原 switch 语义。orig_ref 固定为转换前基线提交，提交后重验依然有效。
import re
import subprocess
import sys

CONFIGS = {}

def cfg(name, **kw):
    CONFIGS[name] = kw

# ---------------- plant-init ----------------
cfg(
    "plant-init",
    src="Lawn/Plant.cpp",
    func="void Plant::PlantInitialize(",
    sw="    switch (theSeedType)",
    case_label=r"^    case SeedType::(\w+):",
    enum_name="SeedType",
    enum_count="NUM_SEED_TYPES",
    orig_ref="e73d5664",
    locals_struct=(
        "struct PlantInitLocals\n"
        "{\n"
        "    Reanimation* mBodyReanim;\n"
        "    ReanimationType mReanimationType;\n"
        "};"),
    fn_sig="void (*)(Plant&, PlantInitLocals&)",
    alias="PlantInitCaseFn",
    lam_params="Plant& p, PlantInitLocals& lc",
    obj_name="p",
    named_ret="void",
    shared_prefix="PlantInit",
    default_fn="PlantInitDefault",  # 原 default 空（无 case 的 15 型/哨兵，无操作）
    default_nonempty_else=False,
    early_exit=False,
    replaces=[("aPlantDef.mReanimationType", "lc.mReanimationType"),
              ("aBodyReanim", "lc.mBodyReanim")],
    free_calls={"Rand", "RandRangeFloat", "RandRangeInt", "TOD_ASSERT", "Color"},
    table_name="kPlantInitCases",
    dispatch=(
        "    // C 形态 -> 匿名 lambda 函数指针表：行序 = SeedType 枚举序（0..52），\n"
        "    // 越界（BEGHOULED 按钮等哨兵）落表外守卫 = 原 default 无操作。\n"
        "    PlantInitLocals aInitLocals{aBodyReanim, aPlantDef.mReanimationType};\n"
        "    const unsigned aSeedIndex = static_cast<unsigned>(theSeedType);\n"
        "    if (aSeedIndex < static_cast<unsigned>(SeedType::NUM_SEED_TYPES))\n"
        "    {\n"
        "        kPlantInitCases[aSeedIndex](*this, aInitLocals);\n"
        "    }\n"),
    block_comment=(
        "// PlantInitialize 槽位上下文：switch 外提引用（主体 reanim 指针、定义动画\n"
        "// 型）经此传递。表内匿名 lambda = 原 case 体逐句迁移（生成器 + 逆变换\n"
        "// token 对拍 0 差异），标签共体组与 default 具名（lambda 无法跨槽复用）。\n"),
    tail_replaces=[],
)

# ---------------- lostarm ----------------
cfg(
    "lostarm",
    src="Lawn/Zombie.cpp",
    func="void Zombie::SetupReanimForLostArm(",
    sw="    switch (mZombieType)",
    case_label=r"^    case ZombieType::(\w+):",
    enum_name="ZombieType",
    enum_count="NUM_ZOMBIE_TYPES",
    orig_ref="e73d5664",
    locals_struct=None,
    fn_sig="void (*)(Zombie&)",
    alias="LostArmHideCaseFn",
    lam_params="Zombie& z",
    obj_name="z",
    named_ret="void",
    shared_prefix="LostArmHide",
    default_fn="LostArmHideDefault",  # 原 default 非空：藏外臂两轨道
    default_nonempty_else=True,
    early_exit=False,
    replaces=[],
    free_calls={"TOD_ASSERT"},
    table_name="kLostArmHideCases",
    dispatch=(
        "    // C 形态 -> 匿名 lambda 函数指针表：行序 = ZombieType 枚举序（0..33）。\n"
        "    // 原 default 非空（藏外臂两轨道）——无 case 的型与哨兵均走它，故越界\n"
        "    // 分支显式调 default 具名函数，逐字保持 switch 语义。\n"
        "    const unsigned aTypeIndex = static_cast<unsigned>(mZombieType);\n"
        "    if (aTypeIndex < static_cast<unsigned>(ZombieType::NUM_ZOMBIE_TYPES))\n"
        "    {\n"
        "        kLostArmHideCases[aTypeIndex](*this);\n"
        "    }\n"
        "    else\n"
        "    {\n"
        "        LostArmHideDefault(*this);\n"
        "    }\n"),
    block_comment=(
        "// SetupReanimForLostArm 第一段（藏臂轨道）分发表：表内匿名 lambda = 原\n"
        "// case 体逐句迁移（生成器 + 逆变换 token 对拍 0 差异）；ShowRange/ShowTrack\n"
        "// 混合调用保持各槽原样；default 非空故具名并被越界分支复用。\n"),
    tail_replaces=[],
)

# ---------------- attackrect ----------------
cfg(
    "attackrect",
    src="Lawn/Plant.cpp",
    func="Rect Plant::GetPlantAttackRect(",
    sw="    else switch (mSeedType)",
    case_label=r"^    case SeedType::(\w+):",
    enum_name="SeedType",
    enum_count="NUM_SEED_TYPES",
    orig_ref="e73d5664",
    locals_struct=None,
    fn_sig="Rect (*)(const Plant&)",
    alias="AttackRectCaseFn",
    lam_params="const Plant& p",
    obj_name="p",
    named_ret="Rect",
    shared_prefix="AttackRect",
    default_fn="AttackRectDefault",  # 原 default：Rect(mX+60, mY, BOARD_WIDTH, mHeight)
    default_nonempty_else=True,
    early_exit=False,
    replaces=[],
    free_calls={"Rect"},
    body_rewrite=("assign2return", "aRect"),
    table_name="kAttackRectCases",
    dispatch=(
        "    else\n"
        "    {\n"
        "        // C 形态 -> 匿名 lambda 函数指针表：行序 = SeedType 枚举序（0..52）。\n"
        "        // 原 default 非空——无 case 的型（含 BEGHOULED 按钮等哨兵）均走它。\n"
        "        const unsigned aSeedIndex = static_cast<unsigned>(mSeedType);\n"
        "        if (aSeedIndex < static_cast<unsigned>(SeedType::NUM_SEED_TYPES))\n"
        "        {\n"
        "            return kAttackRectCases[aSeedIndex](*this);\n"
        "        }\n"
        "        return AttackRectDefault(*this);\n"
        "    }\n"),
    block_comment=(
        "// GetPlantAttackRect 槽位表：每槽 = 原 case 的 Rect 表达式（生成器迁移 +\n"
        "// 逆变换 token 对拍 0 差异）；default 表达式具名并被越界分支复用。\n"),
    tail_replaces=[],
)

# ---------------- pickup-tool ----------------
cfg(
    "pickup-tool",
    src="Lawn/Board.cpp",
    func="void Board::PickUpTool(",
    sw="\tswitch (theObjectType)",
    case_label=r"^\tcase GameObjectType::(\w+):",
    default_re=r"^\tdefault:",
    enum_name="GameObjectType",
    count_last="OBJECT_TYPE_TREE_OF_WISDOM",
    orig_ref="2cc9756a",
    locals_struct=None,
    fn_sig="void (*)(Board&)",
    alias="PickUpToolCaseFn",
    lam_params="Board& b",
    obj_name="b",
    named_ret="void",
    shared_prefix="PickUpTool",
    default_fn="PickUpToolDefault",
    default_nonempty_else=True,
    early_exit=False,
    replaces=[],
    free_calls={"TOD_ASSERT"},
    table_name="kPickUpToolCases",
    dispatch=(
        "\t// C 形态 -> 匿名 lambda 函数指针表：行序 = GameObjectType 枚举序（0..21）。\n"
        "\t// default（TOD_ASSERT）具名并被缺槽与越界分支复用。\n"
        "\tconst unsigned anObjectTypeIndex = static_cast<unsigned>(theObjectType);\n"
        "\tif (anObjectTypeIndex <= static_cast<unsigned>(GameObjectType::OBJECT_TYPE_TREE_OF_WISDOM))\n"
        "\t{\n"
        "\t\tkPickUpToolCases[anObjectTypeIndex](*this);\n"
        "\t}\n"
        "\telse\n"
        "\t{\n"
        "\t\tPickUpToolDefault(*this);\n"
        "\t}\n"),
    block_comment=(
        "// Board::PickUpTool 分发表：表内匿名 lambda = 原 case 体逐句迁移（生成器 +\n"
        "// 逆变换 token 对拍 0 差异）；default 具名并被缺槽/越界复用。\n"),
    tail_replaces=[],
)

# ---------------- tutorial-state ----------------
cfg(
    "tutorial-state",
    src="Lawn/Board.cpp",
    func="void Board::SetTutorialState(",
    sw="\tswitch (theTutorialState)",
    case_label=r"^\tcase TutorialState::(\w+):",
    default_re=r"^\tdefault:",
    enum_name="TutorialState",
    count_last="TUTORIAL_WHACK_A_ZOMBIE_COMPLETED",
    orig_ref="2cc9756a",
    locals_struct=None,
    fn_sig="void (*)(Board&)",
    alias="TutorialStateCaseFn",
    lam_params="Board& b",
    obj_name="b",
    named_ret="void",
    shared_prefix="TutorialCase",
    default_fn="TutorialCaseDefault",
    default_nonempty_else=False,
    early_exit=False,
    replaces=[],
    free_calls={"TOD_ASSERT"},
    table_name="kTutorialStateCases",
    dispatch=(
        "\t// C 形态 -> 匿名 lambda 函数指针表：行序 = TutorialState 枚举序（0..30）。\n"
        "\t// 原 default 空操作——缺槽/越界均无操作。\n"
        "\tconst unsigned aStateIndex = static_cast<unsigned>(theTutorialState);\n"
        "\tif (aStateIndex <= static_cast<unsigned>(TutorialState::TUTORIAL_WHACK_A_ZOMBIE_COMPLETED))\n"
        "\t{\n"
        "\t\tkTutorialStateCases[aStateIndex](*this);\n"
        "\t}\n"),
    block_comment=(
        "// Board::SetTutorialState 分发表：表内匿名 lambda = 原 case 体逐句迁移\n"
        "//（生成器 + 逆变换 token 对拍 0 差异）；default 空操作具名补缺槽。\n"),
    tail_replaces=[],
)

# ---------------- music-setup ----------------
cfg(
    "music-setup",
    src="Lawn/System/Music.cpp",
    func="void Music::SetupMusicFileForTune(",
    sw="\tswitch (theMusicTune)",
    case_label=r"^\tcase MusicTune::(\w+):",
    default_re=r"^\tdefault:",
    enum_name="MusicTune",
    enum_file="Lawn/System/Music.h",
    enum_count="NUM_MUSIC_TUNES",
    value_lo=1,
    orig_ref="2cc9756a",
    locals_struct=(
        "struct MusicSetupLocals\n{\n"
        "    int mTrackCount;\n"
        "    int mTrackStart1;\n"
        "    int mTrackEnd1;\n"
        "    int mTrackStart2;\n"
        "    int mTrackEnd2;\n"
        "};"),
    fn_sig="void (*)(Music&, MusicFile, MusicSetupLocals&)",
    alias="MusicSetupCaseFn",
    lam_params="Music& m, MusicFile theMusicFile, MusicSetupLocals& lc",
    obj_name="m",
    named_ret="void",
    shared_prefix="MusicSetup",
    default_fn="MusicSetupDefault",
    default_nonempty_else=True,
    early_exit=False,
    replaces=[("aTrackCount", "lc.mTrackCount"),
              ("aTrackStart1", "lc.mTrackStart1"),
              ("aTrackEnd1", "lc.mTrackEnd1"),
              ("aTrackStart2", "lc.mTrackStart2"),
              ("aTrackEnd2", "lc.mTrackEnd2")],
    free_calls={"TOD_ASSERT"},
    table_name="kMusicSetupCases",
    bound_expr="(int)MusicTune::NUM_MUSIC_TUNES - (int)MusicTune::MUSIC_TUNE_DAY_GRASSWALK",
    dispatch=(
        "\t// C 形态 -> 匿名 lambda 函数指针表：行序 = MusicTune 枚举值序（1..13，\n"
        "\t// 下标平移）。内层 MusicFile switch 随体迁移保持原样；五常量经\n"
        "\t// MusicSetupLocals 传递（dispatch 前载入、后写回）；default 非空\n"
        "\t//（MAIN/DRUMS 全曲段）具名并被缺槽与越界（NONE/0）分支复用。\n"
        "\tMusicSetupLocals aSetupLocals{aTrackCount, aTrackStart1, aTrackEnd1, aTrackStart2, aTrackEnd2};\n"
        "\tconst int aTuneIndex = static_cast<int>(theMusicTune) - (int)MusicTune::MUSIC_TUNE_DAY_GRASSWALK;\n"
        "\tif (static_cast<unsigned>(aTuneIndex) < static_cast<unsigned>((int)MusicTune::NUM_MUSIC_TUNES - (int)MusicTune::MUSIC_TUNE_DAY_GRASSWALK))\n"
        "\t{\n"
        "\t\tkMusicSetupCases[aTuneIndex](*this, theMusicFile, aSetupLocals);\n"
        "\t}\n"
        "\telse\n"
        "\t{\n"
        "\t\tMusicSetupDefault(*this, theMusicFile, aSetupLocals);\n"
        "\t}\n"
        "\taTrackCount = aSetupLocals.mTrackCount;\n"
        "\taTrackStart1 = aSetupLocals.mTrackStart1;\n"
        "\taTrackEnd1 = aSetupLocals.mTrackEnd1;\n"
        "\taTrackStart2 = aSetupLocals.mTrackStart2;\n"
        "\taTrackEnd2 = aSetupLocals.mTrackEnd2;\n"),
    block_comment=(
        "// Music::SetupMusicFileForTune 分发表：每槽内层 MusicFile switch 随体迁移\n"
        "//（生成器 + 逆变换 token 对拍 0 差异）；default 具名并被缺槽/越界复用。\n"),
    tail_replaces=[],
)

# ---------------- playmusic ----------------
cfg(
    "playmusic",
    src="Lawn/System/Music.cpp",
    func="void Music::PlayMusic(",
    sw="\tswitch (theMusicTune)",
    case_label=r"^\tcase MusicTune::(\w+):",
    default_re=r"^\tdefault:",
    enum_name="MusicTune",
    enum_file="Lawn/System/Music.h",
    enum_count="NUM_MUSIC_TUNES",
    value_lo=1,
    orig_ref="2cc9756a",
    locals_struct=(
        "struct MusicPlayLocals\n{\n"
        "    int mOffset;\n"
        "    int mDrumsOffset;\n"
        "};"),
    fn_sig="void (*)(Music&, MusicPlayLocals&)",
    alias="MusicPlayCaseFn",
    lam_params="Music& m, MusicPlayLocals& lc",
    obj_name="m",
    named_ret="void",
    shared_prefix="MusicPlay",
    default_fn="MusicPlayDefault",
    default_nonempty_else=True,
    early_exit=False,
    replaces=[("theOffset", "lc.mOffset"),
              ("theDrumsOffset", "lc.mDrumsOffset")],
    free_calls={"TOD_ASSERT"},
    table_name="kMusicPlayCases",
    bound_expr="(int)MusicTune::NUM_MUSIC_TUNES - (int)MusicTune::MUSIC_TUNE_DAY_GRASSWALK",
    dispatch=(
        "\t// C 形态 -> 匿名 lambda 函数指针表：行序 = MusicTune 枚举值序（1..13，\n"
        "\t// 下标平移）。theOffset/theDrumsOffset 仅被 case 读写，经 MusicPlayLocals\n"
        "\t// 传递；default（TOD_ASSERT）具名并被越界分支复用（1..13 全覆盖无缺槽）。\n"
        "\tMusicPlayLocals aPlayLocals{theOffset, theDrumsOffset};\n"
        "\tconst int aTuneIndex = static_cast<int>(theMusicTune) - (int)MusicTune::MUSIC_TUNE_DAY_GRASSWALK;\n"
        "\tif (static_cast<unsigned>(aTuneIndex) < static_cast<unsigned>((int)MusicTune::NUM_MUSIC_TUNES - (int)MusicTune::MUSIC_TUNE_DAY_GRASSWALK))\n"
        "\t{\n"
        "\t\tkMusicPlayCases[aTuneIndex](*this, aPlayLocals);\n"
        "\t}\n"
        "\telse\n"
        "\t{\n"
        "\t\tMusicPlayDefault(*this, aPlayLocals);\n"
        "\t}\n"),
    block_comment=(
        "// Music::PlayMusic 分发表：表内匿名 lambda = 原 case 体逐句迁移（生成器\n"
        "// + 逆变换 token 对拍 0 差异）；default 具名并被越界分支复用。\n"),
    tail_replaces=[],
)

# ---------------- cursor-draw ----------------
cfg(
    "cursor-draw",
    src="Lawn/CursorObject.cpp",
    func="void CursorObject::Draw(",
    sw="    switch (mCursorType)",
    case_label=r"^    case CursorType::(\w+):",
    enum_name="CursorType",
    count_last="CURSOR_TYPE_TREE_FOOD",
    orig_ref="HEAD",
    locals_struct=None,
    fn_sig="void (*)(CursorObject&, Graphics* g)",
    alias="CursorDrawCaseFn",
    lam_params="CursorObject& c, Graphics* g",
    obj_name="c",
    named_ret="void",
    shared_prefix="CursorDraw",
    default_fn=None,   # 18 case 全覆盖，无 default
    default_nonempty_else=False,
    early_exit=False,
    replaces=[],
    free_calls={"PlantDrawHeightOffset", "TOD_ASSERT"},
    table_name="kCursorDrawCases",
    dispatch=(
        "    // C 形态 -> 匿名 lambda 函数指针表：行序 = CursorType 枚举序（0..17，\n"
        "    // 全覆盖无 default）；Graphics* 经参传入。\n"
        "    const unsigned aCursorIndex = static_cast<unsigned>(mCursorType);\n"
        "    if (aCursorIndex <= static_cast<unsigned>(CursorType::CURSOR_TYPE_TREE_FOOD))\n"
        "    {\n"
        "        kCursorDrawCases[aCursorIndex](*this, g);\n"
        "    }\n"),
    block_comment=(
        "// CursorObject::Draw 分发表：表内匿名 lambda = 原 case 体逐句迁移（生成器\n"
        "// + 逆变换 token 对拍 0 差异）；PLANT_FROM_BANK 三标签共体具名。\n"),
    tail_replaces=[],
)

# ---------------- message-durations ----------------
cfg(
    "message-durations",
    src="Lawn/MessageWidget.cpp",
    func="void MessageWidget::SetLabel(",
    sw="\t\tswitch (theMessageStyle)",
    case_label=r"^\t\tcase MessageStyle::(\w+):",
    default_re=r"^\t\tdefault:",
    enum_name="MessageStyle",
    count_last="MESSAGE_STYLE_ACHIEVEMENT",
    orig_ref="HEAD",
    locals_struct=None,
    fn_sig="void (*)(MessageWidget&, int)",
    alias="MessageDurationCaseFn",
    lam_params="MessageWidget& w, int theMessageStyle",
    obj_name="w",
    named_ret="void",
    shared_prefix="MsgDuration",
    default_fn="MsgDurationDefault",
    default_nonempty_else=True,
    early_exit=False,
    replaces=[],
    free_calls={"TOD_ASSERT"},
    table_name="kMessageDurations",
    dispatch=(
        "\t\t// C 形态 -> 匿名 lambda 函数指针表：行序 = MessageStyle 枚举序（0..18，\n"
        "\t\t// 无 NUM 哨兵=末值 ACHIEVEMENT 锚定）；default（TOD_ASSERT）具名并被\n"
        "\t\t// 缺槽/越界复用。\n"
        "\t\tconst unsigned aStyleIndex = static_cast<unsigned>(theMessageStyle);\n"
        "\t\tif (aStyleIndex <= static_cast<unsigned>(MessageStyle::MESSAGE_STYLE_ACHIEVEMENT))\n"
        "\t\t{\n"
        "\t\t\tkMessageDurations[aStyleIndex](*this, (int)theMessageStyle);\n"
        "\t\t}\n"
        "\t\telse\n"
        "\t\t{\n"
        "\t\t\tMsgDurationDefault(*this, (int)theMessageStyle);\n"
        "\t\t}\n"),
    block_comment=(
        "// MessageWidget::SetLabel 时长表：表内匿名 lambda = 原 case 体逐句迁移\n"
        "//（生成器 + 逆变换 token 对拍 0 差异）；HUGE_WAVE 双效（时长+文字淡出\n"
        "// reanim）随体迁移；default 具名并被缺槽/越界复用。\n"),
    tail_replaces=[],
)

# ---------------- icetrap-offsets ----------------
cfg(
    "icetrap-offsets",
    src="Lawn/Zombie.cpp",
    func="void Zombie::DrawIceTrap(",
    sw="    float aScale = 1.0f;\n    switch (mZombieType)",
    sw_keep_prefix="    float aScale = 1.0f;\n",
    case_label=r"^    case ZombieType::(\w+):",
    enum_name="ZombieType",
    enum_count="NUM_ZOMBIE_TYPES",
    orig_ref="HEAD",
    locals_struct=(
        "struct IceTrapAdjust\n"
        "{\n"
        "    float mDx;\n"
        "    float mDy;\n"
        "    float mScale;\n"
        "    bool mAdjust;   // false = 哨兵：不调整\n"
        "};"),
    fn_sig="void (*)(Zombie&, IceTrapAdjust&)",
    alias="IceTrapAdjustFn",
    lam_params="Zombie& z, IceTrapAdjust& lc",
    obj_name="z",
    named_ret="void",
    shared_prefix="IceTrapAdjustCase",
    default_fn="IceTrapNoAdjust",
    default_nonempty_else=False,
    early_exit=False,
    replaces=[("aOffsetX", "lc.mDx"), ("aOffsetY", "lc.mDy"), ("aScale", "lc.mScale")],
    free_calls={"TOD_ASSERT"},
    table_name="kIceTrapAdjusts",
    dispatch=(
        "    // C 形态 -> 匿名 lambda 表：行序 = ZombieType 枚举序（0..33）；无 case\n"
        "    // 槽=IceTrapNoAdjust 具名空操作（=原 default 无操作）。三浮点经\n"
        "    // IceTrapAdjust 传递（读写回写）。\n"
        "    IceTrapAdjust aAdjust{aOffsetX, aOffsetY, aScale, false};\n"
        "    const unsigned aTypeIndex = static_cast<unsigned>(mZombieType);\n"
        "    if (aTypeIndex < static_cast<unsigned>(ZombieType::NUM_ZOMBIE_TYPES))\n"
        "    {\n"
        "        kIceTrapAdjusts[aTypeIndex](*this, aAdjust);\n"
        "    }\n"
        "    aOffsetX = aAdjust.mDx;\n"
        "    aOffsetY = aAdjust.mDy;\n"
        "    aScale = aAdjust.mScale;\n"),
    block_comment=(
        "// Zombie::DrawIceTrap 偏移调整表：表内匿名 lambda = 原 case 体逐句迁移\n"
        "//（生成器 + 逆变换 token 对拍 0 差异）；无 case 槽不调整（哨兵布尔表）。\n"),
    tail_replaces=[],
)

# ---------------- coin-init ----------------
cfg(
    "coin-init",
    src="Lawn/Coin.cpp",
    func="void Coin::CoinInitialize(",
    sw="    switch (mCoinMotion)",
    case_label=r"^    case CoinMotion::(\w+):",
    default_re=r"^    default:",
    enum_name="CoinMotion",
    count_last="COIN_MOTION_FROM_BOSS",
    orig_ref="HEAD",
    locals_struct=None,
    fn_sig="void (*)(Coin&)",
    alias="CoinInitCaseFn",
    lam_params="Coin& c",
    obj_name="c",
    named_ret="void",
    shared_prefix="CoinInit",
    default_fn="CoinInitDefault",
    default_nonempty_else=True,
    early_exit=False,
    replaces=[],
    free_calls={"TOD_ASSERT", "Rand", "RandRangeFloat"},
    table_name="kCoinInitCases",
    dispatch=(
        "    // C 形态 -> 匿名 lambda 表：行序 = CoinMotion 枚举序（0..6，无 NUM\n"
        "    // 哨兵=末值 FROM_BOSS 锚定）；default（TOD_ASSERT）具名并被缺槽/越界复用。\n"
        "    const unsigned aMotionIndex = static_cast<unsigned>(mCoinMotion);\n"
        "    if (aMotionIndex <= static_cast<unsigned>(CoinMotion::COIN_MOTION_FROM_BOSS))\n"
        "    {\n"
        "        kCoinInitCases[aMotionIndex](*this);\n"
        "    }\n"
        "    else\n"
        "    {\n"
        "        CoinInitDefault(*this);\n"
        "    }\n"),
    block_comment=(
        "// Coin::CoinInitialize 分发表：表内匿名 lambda = 原 case 体逐句迁移（生成器\n"
        "// + 逆变换 token 对拍 0 差异）；default 具名并被缺槽/越界复用。\n"),
    tail_replaces=[],
)

# ---------------- debug-text ----------------
cfg(
    "debug-text",
    src="Lawn/Board.cpp",
    func="void Board::DrawDebugText(",
    sw="\tswitch (mDebugTextMode)",
    case_label=r"^\tcase DebugTextMode::(\w+):",
    default_re=r"^\tdefault:",
    enum_name="DebugTextMode",
    count_last="DEBUG_TEXT_COLLISION",
    orig_ref="HEAD",
    locals_struct=None,
    fn_sig="void (*)(Board&, SexyString&)",
    alias="DebugTextCaseFn",
    lam_params="Board& aBoard, SexyString& aText",
    obj_name="aBoard",  # 勿用单字母 b：to_member 的 &b 替换会吞 &bpm1（MUSIC 槽实证）
    named_ret="void",
    shared_prefix="DebugText",
    default_fn="DebugTextDefault",  # 原 default 非空：TOD_ASSERT(false)
    default_nonempty_else=True,
    early_exit=False,
    replaces=[],
    free_calls={"TOD_ASSERT", "StrFormat", "abs", "LOWORD", "HIWORD"},
    table_name="kDebugTextCases",
    dispatch=(
        "\t// C 形态 -> 匿名 lambda 函数指针表：行序 = DebugTextMode 枚举序（0..4，\n"
        "\t// 全 case 覆盖，NONE 槽空操作）。aText（switch 外提局部，尾部统一\n"
        "\t// 描绘）经引用传入各槽追加；default（TOD_ASSERT）具名并被越界分支复用。\n"
        "\tconst unsigned aDebugIndex = static_cast<unsigned>(mDebugTextMode);\n"
        "\tif (aDebugIndex <= static_cast<unsigned>(DebugTextMode::DEBUG_TEXT_COLLISION))\n"
        "\t{\n"
        "\t\tkDebugTextCases[aDebugIndex](*this, aText);\n"
        "\t}\n"
        "\telse\n"
        "\t{\n"
        "\t\tDebugTextDefault(*this, aText);\n"
        "\t}\n"),
    block_comment=(
        "// Board::DrawDebugText 分发表：表内匿名 lambda = 原 case 体逐句迁移（生成器\n"
        "+ 逆变换 token 对拍 0 差异）；NONE 槽空操作；default 具名并被越界复用。\n"),
    tail_replaces=[],
)

# ---------------- plant-special ----------------
cfg(
    "plant-special",
    src="Lawn/Plant.cpp",
    func="void Plant::DoSpecial(",
    sw="    switch (mSeedType)",
    case_label=r"^    case SeedType::(\w+):",
    enum_name="SeedType",
    enum_count="NUM_SEED_TYPES",
    orig_ref="HEAD",
    locals_struct=(
        "struct PlantSpecialLocals\n"
        "{\n"
        "    int mPosX;\n"
        "    int mPosY;\n"
        "    int mDamageRangeFlags;\n"
        "};"),
    fn_sig="void (*)(Plant&, PlantSpecialLocals&)",
    alias="PlantSpecialCaseFn",
    lam_params="Plant& p, PlantSpecialLocals& lc",
    obj_name="p",
    named_ret="void",
    shared_prefix="PlantSpecial",
    default_fn="PlantSpecialDefault",  # 原 default 空（非即时植物，无操作）
    default_nonempty_else=False,
    early_exit=False,
    replaces=[("aPosX", "lc.mPosX"),
              ("aPosY", "lc.mPosY"),
              ("aDamageRangeFlags", "lc.mDamageRangeFlags")],
    free_calls={"TOD_ASSERT"},
    table_name="kPlantSpecialCases",
    dispatch=(
        "    // C 形态 -> 匿名 lambda 函数指针表：行序 = SeedType 枚举序（0..52）。\n"
        "    // 原 default 空操作——缺槽（非即时植物）与表外哨兵均无操作。三 switch\n"
        "    // 外提局部经 PlantSpecialLocals 传值（switch 后不再读；POTATOMINE 槽\n"
        "    // 内改写仅槽内可见 = 原 case 局部作用域）。\n"
        "    PlantSpecialLocals aSpecialLocals{aPosX, aPosY, aDamageRangeFlags};\n"
        "    const unsigned aSeedIndex = static_cast<unsigned>(mSeedType);\n"
        "    if (aSeedIndex < static_cast<unsigned>(SeedType::NUM_SEED_TYPES))\n"
        "    {\n"
        "        kPlantSpecialCases[aSeedIndex](*this, aSpecialLocals);\n"
        "    }\n"),
    block_comment=(
        "// Plant::DoSpecial 分发表：表内匿名 lambda = 原 case 体逐句迁移（生成器 +\n"
        "// 逆变换 token 对拍 0 差异）；default 空操作具名补缺槽。\n"),
    tail_replaces=[],
)

# ---------------- dancer-phase ----------------
# UpdateZombieBackupDancer 与 UpdateZombieDancer 内是同一状态机分支（六 case 体逐句
# 相同）——共用一张表：本配置 gen BackupDancer 处（生成表+具名函数+分发），Dancer
# 处的分发手工同文替换，对拍用 dancer-phase-2（verify-only，勿 gen：会重复插表）。
cfg(
    "dancer-phase",
    src="Lawn/Zombie.cpp",
    func="void Zombie::UpdateZombieBackupDancer(",
    sw="        switch (aDancerPhase)",
    case_label=r"^        case ZombiePhase::(\w+):",
    default_re=r"^        default:",
    enum_name="ZombiePhase",
    count_last="PHASE_SQUASH_DONE_FALLING",
    orig_ref="HEAD",
    locals_struct=None,
    fn_sig="void (*)(Zombie&, ZombiePhase)",
    alias="DancerPhaseCaseFn",
    lam_params="Zombie& z, ZombiePhase aDancerPhase",
    obj_name="z",
    named_ret="void",
    shared_prefix="Dancer",
    default_fn="DancerDefault",  # 原 default 空（非舞步相位，无操作）
    default_nonempty_else=False,
    early_exit=False,
    replaces=[],
    free_calls={"TOD_ASSERT"},
    table_name="kDancerPhaseCases",
    dispatch=(
        "        // C 形态 -> 匿名 lambda 函数指针表（上方 kDancerPhaseCases，与本文件\n"
        "        // UpdateZombieDancer 同表共用——两处同一状态机分支）：行序 =\n"
        "        // ZombiePhase 枚举序；缺槽/越界 = 原 default 无操作；RAISE 四标签\n"
        "        // 共体具名（lambda 无法跨槽复用）。\n"
        "        const unsigned aPhaseIndex = static_cast<unsigned>(aDancerPhase);\n"
        "        if (aPhaseIndex <= static_cast<unsigned>(ZombiePhase::PHASE_SQUASH_DONE_FALLING))\n"
        "        {\n"
        "            kDancerPhaseCases[aPhaseIndex](*this, aDancerPhase);\n"
        "        }\n"),
    block_comment=(
        "// 舞者相位分发表（BackupDancer/Dancer 两 Update 共用）：表内匿名 lambda =\n"
        "// 原 case 体逐句迁移（生成器 + 逆变换 token 对拍 0 差异）；default 空操作\n"
        "// 具名补缺槽；aDancerPhase 经参传入（槽内 mZombiePhase = aDancerPhase）。\n"),
    tail_replaces=[],
)

# ---------------- dancer-phase-2（verify-only：表由 dancer-phase 生成，Dancer 处分发手工替换） ----------------
cfg(
    "dancer-phase-2",
    src="Lawn/Zombie.cpp",
    func="void Zombie::UpdateZombieDancer(",
    sw="            switch (aDancerPhase)",
    case_label=r"^            case ZombiePhase::(\w+):",
    default_re=r"^            default:",
    enum_name="ZombiePhase",
    count_last="PHASE_SQUASH_DONE_FALLING",
    orig_ref="HEAD",
    locals_struct=None,
    fn_sig="void (*)(Zombie&, ZombiePhase)",
    alias="DancerPhaseCaseFn",
    lam_params="Zombie& z, ZombiePhase aDancerPhase",
    obj_name="z",
    named_ret="void",
    shared_prefix="Dancer",
    default_fn="DancerDefault",
    default_nonempty_else=False,
    early_exit=False,
    replaces=[],
    free_calls={"TOD_ASSERT"},
    table_name="kDancerPhaseCases",
    dispatch=(
        "            // C 形态 -> 匿名 lambda 函数指针表（上方 kDancerPhaseCases，与本文件\n"
        "            // UpdateZombieBackupDancer 同表共用——两处同一状态机分支）：行序 =\n"
        "            // ZombiePhase 枚举序；缺槽/越界 = 原 default 无操作；RAISE 四标签\n"
        "            // 共体具名（lambda 无法跨槽复用）。\n"
        "            const unsigned aPhaseIndex = static_cast<unsigned>(aDancerPhase);\n"
        "            if (aPhaseIndex <= static_cast<unsigned>(ZombiePhase::PHASE_SQUASH_DONE_FALLING))\n"
        "            {\n"
        "                kDancerPhaseCases[aPhaseIndex](*this, aDancerPhase);\n"
        "            }\n"),
    block_comment=(
        "// 舞者相位分发表（BackupDancer/Dancer 两 Update 共用）：表内匿名 lambda =\n"
        "// 原 case 体逐句迁移（生成器 + 逆变换 token 对拍 0 差异）；default 空操作\n"
        "// 具名补缺槽；aDancerPhase 经参传入（槽内 mZombiePhase = aDancerPhase）。\n"),
    tail_replaces=[],
)

# ---------------- zombatar-button ----------------
cfg(
    "zombatar-button",
    src="Lawn/Widget/ZombatarItems.cpp",
    func="void ZombatarItems::ButtonDepress(",
    sw="\tswitch (theId)",
    case_label=r"^\tcase (\w+):",
    default_re=r"^\tdefault:",
    enum_name="ButtonId",
    enum_file="Lawn/Widget/ZombatarItems.h",
    count_last="BUTTON_BACKDROPS",
    value_lo=1000,
    orig_ref="HEAD",
    locals_struct=None,
    fn_sig="void (*)(ZombatarItems&)",
    alias="ZombatarButtonCaseFn",
    lam_params="ZombatarItems& w",
    obj_name="w",
    named_ret="void",
    shared_prefix="ZombatarButton",
    default_fn=None,   # 18 case 全覆盖；default 空操作——表外 id 无操作
    default_nonempty_else=False,
    early_exit=False,
    replaces=[],
    free_calls={"MoveButton"},   # 本文件自由函数（GameButton 布局）
    table_name="kZombatarButtonCases",
    bound_expr="(int)ZombatarItems::ButtonId::BUTTON_BACKDROPS - (int)ZombatarItems::ButtonId::BUTTON_NEXT_PAGE + 1",
    dispatch=(
        "\t// C 形态 -> 匿名 lambda 函数指针表：行序 = ButtonId 枚举序（1000..1017，\n"
        "\t// 下标平移）。18 case 全覆盖、default 空操作——表外 id（其他控件）无操作。\n"
        "\tconst int aButtonIndex = theId - (int)ZombatarItems::ButtonId::BUTTON_NEXT_PAGE;\n"
        "\tif (static_cast<unsigned>(aButtonIndex) < static_cast<unsigned>((int)ZombatarItems::ButtonId::BUTTON_BACKDROPS - (int)ZombatarItems::ButtonId::BUTTON_NEXT_PAGE + 1))\n"
        "\t{\n"
        "\t\tkZombatarButtonCases[aButtonIndex](*this);\n"
        "\t}\n"),
    block_comment=(
        "// ZombatarItems::ButtonDepress 分发表：表内匿名 lambda = 原 case 体逐句迁移\n"
        "//（生成器 + 逆变换 token 对拍 0 差异）。MoveButton 为本文件自由函数。\n"),
    tail_replaces=[],
)

# ---------------- zombatar-draw ----------------
cfg(
    "zombatar-draw",
    src="Lawn/Widget/ZombatarItems.cpp",
    func="void ZombatarItems::Draw(",
    sw="\tswitch (mState)",
    case_label=r"^\tcase ZombatarEditorState::(\w+):",
    enum_name="class ZombatarEditorState",   # enum class：借 enum_name 携带 class 关键字定位声明
    enum_file="Lawn/Widget/ZombatarItems.h",
    count_last="BROWSING",
    orig_ref="HEAD",
    locals_struct=None,
    fn_sig="void (*)(ZombatarItems&, Graphics*)",
    alias="ZombatarDrawCaseFn",
    lam_params="ZombatarItems& w, Graphics* g",
    obj_name="w",
    named_ret="void",
    shared_prefix="ZombatarDraw",
    default_fn=None,   # 5 case 全覆盖，无 default
    default_nonempty_else=False,
    early_exit=False,
    replaces=[],
    free_calls={"TodAnimateCurve", "Color"},
    table_name="kZombatarDrawCases",
    bound_expr="(int)ZombatarEditorState::BROWSING + 1",
    dispatch=(
        "\t// C 形态 -> 匿名 lambda 函数指针表：行序 = ZombatarEditorState 枚举序\n"
        "\t//（0..4，全覆盖无 default）；ENTERING/LEAVING_CONFIRMATION 标签共体具名\n"
        "\t//（共享编辑器绘制 + 渐隐遮罩）。\n"
        "\tconst unsigned aStateIndex = static_cast<unsigned>(mState);\n"
        "\tif (aStateIndex <= static_cast<unsigned>(ZombatarEditorState::BROWSING))\n"
        "\t{\n"
        "\t\tkZombatarDrawCases[aStateIndex](*this, g);\n"
        "\t}\n"),
    block_comment=(
        "// ZombatarItems::Draw 状态分发表：表内匿名 lambda = 原 case 体逐句迁移\n"
        "//（生成器 + 逆变换 token 对拍 0 差异）；双确认过渡态共体具名。\n"),
    tail_replaces=[],
)

# ---------------- selector-button ----------------
cfg(
    "selector-button",
    src="Lawn/Widget/GameSelector.cpp",
    func="void GameSelector::ButtonDepress(",
    sw="\tswitch (theId)",
    case_label=r"^\tcase GameSelector::(\w+):",
    enum_name="GameSelectorButtonId",
    enum_file="Lawn/Widget/GameSelector.h",
    count_last="GameSelector_QuickPlay",
    value_lo=100,
    orig_ref="HEAD",
    locals_struct=(
        "struct SelectorButtonLocals\n"
        "{\n"
        "    bool mEarlyExit;   // 原 case 内 return：会话失效提前退出（跳过尾部计时日志）\n"
        "};"),
    fn_sig="void (*)(GameSelector&, SelectorModalSession&, SelectorButtonLocals&)",
    alias="SelectorButtonCaseFn",
    lam_params="GameSelector& s, SelectorModalSession& aSession, SelectorButtonLocals& lc",
    obj_name="s",
    named_ret="void",
    shared_prefix="SelectorButton",
    default_fn=None,   # 15 case 全覆盖，无 default；表外 id 无操作
    default_nonempty_else=False,
    early_exit=True,
    replaces=[],
    free_calls={"aStoreLifetime"},   # Store 槽局部 WidgetLifetimeHold 声明（防误判成员调用）
    table_name="kSelectorButtonCases",
    bound_expr="15",   # 枚举为类内 private，表长字面锚定；逐槽行注释对拍覆盖
    dispatch=(
        "\t// C 形态 -> 匿名 lambda 函数指针表：行序 = GameSelectorButtonId 枚举序\n"
        "\t//（100..114，下标平移）。Store/Almanac 槽内会话失效 return 经 mEarlyExit\n"
        "\t// 回传——与原 return 一样跳过尾部按钮计时日志。\n"
        "\tSelectorButtonLocals aButtonLocals{false};\n"
        "\tconst int aButtonIndex = theId - (int)GameSelector::GameSelector_Adventure;\n"
        "\tif (static_cast<unsigned>(aButtonIndex) < static_cast<unsigned>(15))\n"
        "\t{\n"
        "\t\tkSelectorButtonCases[aButtonIndex](*this, aSession, aButtonLocals);\n"
        "\t}\n"
        "\tif (aButtonLocals.mEarlyExit)\n"
        "\t\treturn;\n"),
    block_comment=(
        "// GameSelector::ButtonDepress 分发表：表内匿名 lambda = 原 case 体逐句迁移\n"
        "//（生成器 + 逆变换 token 对拍 0 差异）。会话（aSession）与早退标志经参传递。\n"),
    tail_replaces=[],
)

# ---------------- selector-state ----------------
cfg(
    "selector-state",
    src="Lawn/Widget/GameSelector.cpp",
    func="void GameSelector::Update(",
    sw="\tswitch (mSelectorState)",
    case_label=r"^\tcase SelectorAnimState::(\w+):",
    enum_name="SelectorAnimState",
    enum_file="Lawn/Widget/GameSelector.h",
    count_last="SELECTOR_IDLE",
    orig_ref="HEAD",
    locals_struct=(
        "struct SelectorUpdateLocals\n"
        "{\n"
        "    bool mEarlyExit;   // 原 case 内 return：消息框会话失效提前退出 Update\n"
        "};"),
    fn_sig="void (*)(GameSelector&, Reanimation*, SelectorUpdateLocals&)",
    alias="SelectorStateCaseFn",
    lam_params="GameSelector& s, Reanimation* aSelectorReanim, SelectorUpdateLocals& lc",
    obj_name="s",
    named_ret="void",
    shared_prefix="SelectorState",
    default_fn=None,   # 4 case 全覆盖，无 default
    default_nonempty_else=False,
    early_exit=True,
    replaces=[],
    free_calls={"aSession"},   # SELECTOR_OPEN 槽内局部会话声明（防误判成员调用）
    table_name="kSelectorStateCases",
    dispatch=(
        "\t// C 形态 -> 匿名 lambda 函数指针表：行序 = SelectorAnimState 枚举序\n"
        "\t//（0..3，全覆盖无 default）。SELECTOR_OPEN 槽内消息框会话失效 return 经\n"
        "\t// mEarlyExit 回传（跳过云/叶动画与按钮贴轨尾部）；aSelectorReanim 为\n"
        "\t// switch 前局部，经参传入。\n"
        "\tSelectorUpdateLocals anUpdateLocals{false};\n"
        "\tconst unsigned aStateIndex = static_cast<unsigned>(mSelectorState);\n"
        "\tif (aStateIndex <= static_cast<unsigned>(SelectorAnimState::SELECTOR_IDLE))\n"
        "\t{\n"
        "\t\tkSelectorStateCases[aStateIndex](*this, aSelectorReanim, anUpdateLocals);\n"
        "\t}\n"
        "\tif (anUpdateLocals.mEarlyExit)\n"
        "\t\treturn;\n"),
    block_comment=(
        "// GameSelector::Update 状态分发表：表内匿名 lambda = 原 case 体逐句迁移\n"
        "//（生成器 + 逆变换 token 对拍 0 差异）；SELECTOR_OPEN 首帧批量显形按钮。\n"),
    tail_replaces=[],
)

# ---------------- reanim-variation ----------------
cfg(
    "reanim-variation",
    src="Lawn/System/ReanimationLawn.cpp",
    func="void ReanimatorCache::UpdateReanimationForVariation(",
    sw="\t\tswitch (theDrawVariation)",
    case_label=r"^\t\tcase DrawVariation::(\w+):",
    default_re=r"^\t\tdefault:",
    enum_name="DrawVariation",
    count_last="VARIATION_AQUARIUM",
    orig_ref="HEAD",
    locals_struct=None,
    fn_sig="void (*)(Reanimation*)",
    alias="VariationApplyCaseFn",
    lam_params="Reanimation* theReanim",
    obj_name="rc",
    named_ret="void",
    shared_prefix="VariationApply",
    default_fn="VariationApplyDefault",   # 原 default：TOD_ASSERT(false)
    default_nonempty_else=True,
    early_exit=False,
    replaces=[],
    free_calls={"TOD_ASSERT"},
    table_name="kVariationApplyCases",
    dispatch=(
        "\t\t// C 形态 -> 匿名 lambda 函数指针表：行序 = DrawVariation 枚举序（0..17）。\n"
        "\t\t// MARIGOLD 段已由上方 if 拦截；缺槽（NORMAL、11 个 MARIGOLD 型）与越界\n"
        "\t\t// = 原 default（TOD_ASSERT(false)）具名复用。\n"
        "\t\tconst unsigned aVariationIndex = static_cast<unsigned>(theDrawVariation);\n"
        "\t\tif (aVariationIndex <= static_cast<unsigned>(DrawVariation::VARIATION_AQUARIUM))\n"
        "\t\t{\n"
        "\t\t\tkVariationApplyCases[aVariationIndex](theReanim);\n"
        "\t\t}\n"
        "\t\telse\n"
        "\t\t{\n"
        "\t\t\tVariationApplyDefault(theReanim);\n"
        "\t\t}\n"),
    block_comment=(
        "// ReanimatorCache::UpdateReanimationForVariation 变体分发表：表内匿名\n"
        "// lambda = 原 case 体逐句迁移（生成器 + 逆变换 token 对拍 0 差异）；\n"
        "// 滤镜两槽与换层四槽同表；default 具名并被缺槽/越界复用。\n"),
    tail_replaces=[],
)

# ---------------- mower-frame ----------------
cfg(
    "mower-frame",
    src="Lawn/System/ReanimationLawn.cpp",
    func="MemoryImage* ReanimatorCache::MakeCachedMowerFrame(",
    sw="\tswitch (theMowerType)",
    case_label=r"^\tcase LawnMowerType::(\w+):",
    default_re=r"^\tdefault:",
    enum_name="LawnMowerType",
    enum_count="NUM_MOWER_TYPES",
    orig_ref="HEAD",
    locals_struct=None,
    fn_sig="void (*)(ReanimatorCache&, std::unique_ptr<MemoryImage>&)",
    alias="MowerFrameCaseFn",
    lam_params="ReanimatorCache& rc, std::unique_ptr<MemoryImage>& aImage",
    obj_name="rc",
    named_ret="void",
    shared_prefix="MowerFrame",
    default_fn="MowerFrameDefault",   # 原 default：TOD_ASSERT(false)
    default_nonempty_else=True,
    early_exit=False,
    replaces=[],
    free_calls={"TOD_ASSERT", "aMemoryGraphics"},   # 槽内局部 Graphics 声明（防误判成员调用）
    table_name="kMowerFrameCases",
    dispatch=(
        "\t// C 形态 -> 匿名 lambda 函数指针表：行序 = LawnMowerType 枚举序（0..3，\n"
        "\t// 全覆盖）。aImage（函数级 unique_ptr）经引用传递：槽内 reset、函数尾\n"
        "\t// release 保持原位；越界 = 原 default（TOD_ASSERT）具名复用。\n"
        "\tconst unsigned aMowerIndex = static_cast<unsigned>(theMowerType);\n"
        "\tif (aMowerIndex < static_cast<unsigned>(LawnMowerType::NUM_MOWER_TYPES))\n"
        "\t{\n"
        "\t\tkMowerFrameCases[aMowerIndex](*this, aImage);\n"
        "\t}\n"
        "\telse\n"
        "\t{\n"
        "\t\tMowerFrameDefault(*this, aImage);\n"
        "\t}\n"),
    block_comment=(
        "// ReanimatorCache::MakeCachedMowerFrame 割草机帧分发表：表内匿名 lambda =\n"
        "// 原 case 体逐句迁移（生成器 + 逆变换 token 对拍 0 差异）；四型仅\n"
        "// 缩放/偏移/轨道/动画型参数差。\n"),
    tail_replaces=[],
)

# ---------------- att-update ----------------
# Attachment 族 9 函数共用判别式 aAttachEffect->mEffectType（EffectType 5 值，
# TRAIL 已退役仅存注释体），但各函数签名不同——每函数独立表+配置。
cfg(
    "att-update",
    src="Sexy.TodLib/Attachment.cpp",
    func="void Attachment::Update()",
    sw="\t\tswitch (aAttachEffect->mEffectType)",
    case_label=r"^\t\tcase EffectType::(\w+):",
    default_re=r"^\t\tdefault:",
    enum_name="EffectType",
    count_last="EFFECT_OTHER",
    orig_ref="HEAD",
    locals_struct=None,
    fn_sig="void (*)(AttachEffect*, bool&, Attachment*&)",
    alias="AttachmentUpdateCaseFn",
    lam_params="AttachEffect* aAttachEffect, bool& isEmpty, Attachment*& aChildAttachment",
    obj_name="unusedAttachment",
    named_ret="void",
    shared_prefix="AttachUpdate",
    default_fn="AttachmentUpdateDefault",  # 原 default 非空：TOD_ASSERT(false)
    default_nonempty_else=True,
    early_exit=False,
    replaces=[],
    free_calls={"TOD_ASSERT"},
    table_name="kAttachmentUpdateCases",
    dispatch=(
        "\t\t// C 形态 -> 匿名 lambda 函数指针表：行序 = EffectType 枚举序（0..4）。\n"
        "\t\t// isEmpty/aChildAttachment 经引用直写；TRAIL 已退役（注释体）。\n"
        "\t\t// default（TOD_ASSERT）具名并被缺槽 EFFECT_OTHER 与越界分支复用。\n"
        "\t\tconst unsigned aEffectKindIndex = static_cast<unsigned>(aAttachEffect->mEffectType);\n"
        "\t\tif (aEffectKindIndex <= static_cast<unsigned>(EffectType::EFFECT_OTHER))\n"
        "\t\t{\n"
        "\t\t\tkAttachmentUpdateCases[aEffectKindIndex](aAttachEffect, isEmpty, aChildAttachment);\n"
        "\t\t}\n"
        "\t\telse\n"
        "\t\t{\n"
        "\t\t\tAttachmentUpdateDefault(aAttachEffect, isEmpty, aChildAttachment);\n"
        "\t\t}\n"),
    block_comment=(
        "// Attachment::Update 分发表：表内匿名 lambda = 原 case 体逐句迁移（生成器 +\n"
        "// 逆变换 token 对拍 0 差异）；default 具名并被缺槽/越界复用。\n"),
    tail_replaces=[],
)

# ---------------- att-setposition ----------------
cfg(
    "att-setposition",
    src="Sexy.TodLib/Attachment.cpp",
    func="void Attachment::SetPosition(const SexyVector2& thePosition)",
    sw="\t\tswitch (aAttachEffect->mEffectType)",
    case_label=r"^\t\tcase EffectType::(\w+):",
    enum_name="EffectType",
    count_last="EFFECT_OTHER",
    orig_ref="HEAD",
    locals_struct=(
        "struct AttachmentMoveFrame\n"
        "{\n"
        "    Attachment* mAttachment;\n"
        "    SexyVector2 mPosition;\n"
        "    int mIndex;\n"
        "};"),
    fn_sig="void (*)(AttachEffect*, AttachmentMoveFrame*, int&, const SexyVector2&)",
    alias="AttachmentSetPosCaseFn",
    lam_params="AttachEffect* aAttachEffect, AttachmentMoveFrame* aStack, int& aDepth, const SexyVector2& aNewPos",
    obj_name="unusedAttachment",
    named_ret="void",
    shared_prefix="AttachSetPos",
    default_fn=None,   # 5 case 全覆盖，无 default
    default_nonempty_else=False,
    early_exit=False,
    replaces=[],
    free_calls={"TOD_ASSERT"},
    table_name="kAttachmentSetPosCases",
    dispatch=(
        "\t\t// C 形态 -> 匿名 lambda 函数指针表：行序 = EffectType 枚举序（0..4\n"
        "\t\t// 全覆盖无 default）；EFFECT_ATTACHMENT 的下钻压栈随体迁移，\n"
        "\t\t// 栈/深度经参数直写。\n"
        "\t\tconst unsigned aEffectKindIndex = static_cast<unsigned>(aAttachEffect->mEffectType);\n"
        "\t\tif (aEffectKindIndex <= static_cast<unsigned>(EffectType::EFFECT_OTHER))\n"
        "\t\t{\n"
        "\t\t\tkAttachmentSetPosCases[aEffectKindIndex](aAttachEffect, aStack, aDepth, aNewPos);\n"
        "\t\t}\n"),
    block_comment=(
        "// Attachment::SetPosition 分发表：表内匿名 lambda = 原 case 体逐句迁移\n"
        "//（生成器 + 逆变换 token 对拍 0 差异）；遍历帧结构体自函数内提至匿名\n"
        "// 命名空间（表签名需要完整类型），函数内以 using 别名沿用。\n"),
    tail_replaces=[("\tstruct MoveFrame { Attachment* mAttachment; SexyVector2 mPosition; int mIndex; };",
                    "\tusing MoveFrame = AttachmentMoveFrame;")],
)

# ---------------- att-overridecolor ----------------
cfg(
    "att-overridecolor",
    src="Sexy.TodLib/Attachment.cpp",
    func="void Attachment::OverrideColor(const Color& theColor)",
    sw="\t\tswitch (aAttachEffect->mEffectType)",
    case_label=r"^\t\tcase EffectType::(\w+):",
    enum_name="EffectType",
    count_last="EFFECT_OTHER",
    orig_ref="HEAD",
    locals_struct=None,
    fn_sig="void (*)(AttachEffect*, const Color&)",
    alias="AttachmentOverrideColorCaseFn",
    lam_params="AttachEffect* aAttachEffect, const Color& theColor",
    obj_name="unusedAttachment",
    named_ret="void",
    shared_prefix="AttachOverrideColor",
    default_fn=None,   # 5 case 全覆盖（TRAIL+OTHER 共体空操作），无 default
    default_nonempty_else=False,
    early_exit=False,
    replaces=[],
    free_calls={"TOD_ASSERT"},
    table_name="kAttachmentOverrideColorCases",
    dispatch=(
        "\t\t// C 形态 -> 匿名 lambda 函数指针表：行序 = EffectType 枚举序（0..4\n"
        "\t\t// 全覆盖）；TRAIL+OTHER 标签共体（空操作）具名。\n"
        "\t\tconst unsigned aEffectKindIndex = static_cast<unsigned>(aAttachEffect->mEffectType);\n"
        "\t\tif (aEffectKindIndex <= static_cast<unsigned>(EffectType::EFFECT_OTHER))\n"
        "\t\t{\n"
        "\t\t\tkAttachmentOverrideColorCases[aEffectKindIndex](aAttachEffect, theColor);\n"
        "\t\t}\n"),
    block_comment=(
        "// Attachment::OverrideColor 分发表：表内匿名 lambda = 原 case 体逐句迁移\n"
        "//（生成器 + 逆变换 token 对拍 0 差异）；TRAIL+OTHER 共体空操作具名。\n"),
    tail_replaces=[],
)

# ---------------- att-propogatecolor ----------------
cfg(
    "att-propogatecolor",
    src="Sexy.TodLib/Attachment.cpp",
    func="void Attachment::PropogateColor(const Color& theColor, bool theEnableAdditiveColor, const Color& theAdditiveColor, bool theEnableOverlayColor, const Color& theOverlayColor)",
    sw="\t\tswitch (aAttachEffect->mEffectType)",
    case_label=r"^\t\tcase EffectType::(\w+):",
    enum_name="EffectType",
    count_last="EFFECT_OTHER",
    orig_ref="HEAD",
    locals_struct=None,
    fn_sig="void (*)(AttachEffect*, const Color&, bool, const Color&, bool, const Color&)",
    alias="AttachmentPropogateColorCaseFn",
    lam_params=("AttachEffect* aAttachEffect, const Color& theColor, bool theEnableAdditiveColor, "
                "const Color& theAdditiveColor, bool theEnableOverlayColor, const Color& theOverlayColor"),
    obj_name="unusedAttachment",
    named_ret="void",
    shared_prefix="AttachPropogateColor",
    default_fn=None,   # 5 case 全覆盖（TRAIL+OTHER 共体空操作），无 default
    default_nonempty_else=False,
    early_exit=False,
    replaces=[],
    free_calls={"TOD_ASSERT"},
    table_name="kAttachmentPropogateColorCases",
    dispatch=(
        "\t\t// C 形态 -> 匿名 lambda 函数指针表：行序 = EffectType 枚举序（0..4\n"
        "\t\t// 全覆盖）；五参颜色组直传，TRAIL+OTHER 共体（空操作）具名。\n"
        "\t\tconst unsigned aEffectKindIndex = static_cast<unsigned>(aAttachEffect->mEffectType);\n"
        "\t\tif (aEffectKindIndex <= static_cast<unsigned>(EffectType::EFFECT_OTHER))\n"
        "\t\t{\n"
        "\t\t\tkAttachmentPropogateColorCases[aEffectKindIndex](aAttachEffect, theColor, "
        "theEnableAdditiveColor, theAdditiveColor, theEnableOverlayColor, theOverlayColor);\n"
        "\t\t}\n"),
    block_comment=(
        "// Attachment::PropogateColor 分发表：表内匿名 lambda = 原 case 体逐句迁移\n"
        "//（生成器 + 逆变换 token 对拍 0 差异）；TRAIL+OTHER 共体空操作具名。\n"),
    tail_replaces=[],
)

# ---------------- att-overridescale ----------------
cfg(
    "att-overridescale",
    src="Sexy.TodLib/Attachment.cpp",
    func="void Attachment::OverrideScale(float theScale)",
    sw="\t\tswitch (aAttachEffect->mEffectType)",
    case_label=r"^\t\tcase EffectType::(\w+):",
    enum_name="EffectType",
    count_last="EFFECT_OTHER",
    orig_ref="HEAD",
    locals_struct=None,
    fn_sig="void (*)(AttachEffect*, float)",
    alias="AttachmentOverrideScaleCaseFn",
    lam_params="AttachEffect* aAttachEffect, float theScale",
    obj_name="unusedAttachment",
    named_ret="void",
    shared_prefix="AttachOverrideScale",
    default_fn=None,   # 5 case 全覆盖（TRAIL+OTHER 共体空操作），无 default
    default_nonempty_else=False,
    early_exit=False,
    replaces=[],
    free_calls={"TOD_ASSERT"},
    table_name="kAttachmentOverrideScaleCases",
    dispatch=(
        "\t\t// C 形态 -> 匿名 lambda 函数指针表：行序 = EffectType 枚举序（0..4\n"
        "\t\t// 全覆盖）；TRAIL+OTHER 共体（空操作）具名。\n"
        "\t\tconst unsigned aEffectKindIndex = static_cast<unsigned>(aAttachEffect->mEffectType);\n"
        "\t\tif (aEffectKindIndex <= static_cast<unsigned>(EffectType::EFFECT_OTHER))\n"
        "\t\t{\n"
        "\t\t\tkAttachmentOverrideScaleCases[aEffectKindIndex](aAttachEffect, theScale);\n"
        "\t\t}\n"),
    block_comment=(
        "// Attachment::OverrideScale 分发表：表内匿名 lambda = 原 case 体逐句迁移\n"
        "//（生成器 + 逆变换 token 对拍 0 差异）；TRAIL+OTHER 共体空操作具名。\n"),
    tail_replaces=[],
)

# ---------------- att-setmatrix ----------------
cfg(
    "att-setmatrix",
    src="Sexy.TodLib/Attachment.cpp",
    func="void Attachment::SetMatrix(const SexyTransform2D& theMatrix)",
    sw="\t\tswitch (aAttachEffect->mEffectType)",
    case_label=r"^\t\tcase EffectType::(\w+):",
    enum_name="EffectType",
    count_last="EFFECT_OTHER",
    orig_ref="HEAD",
    locals_struct=(
        "struct AttachmentMatrixFrame\n"
        "{\n"
        "    Attachment* mAttachment;\n"
        "    SexyTransform2D mMatrix;\n"
        "    int mIndex;\n"
        "};"),
    fn_sig="void (*)(AttachEffect*, AttachmentMatrixFrame*, int&, const SexyTransform2D&)",
    alias="AttachmentSetMatrixCaseFn",
    lam_params="AttachEffect* aAttachEffect, AttachmentMatrixFrame* aStack, int& aDepth, const SexyTransform2D& aPosition",
    obj_name="unusedAttachment",
    named_ret="void",
    shared_prefix="AttachSetMatrix",
    default_fn=None,   # 5 case 全覆盖，无 default
    default_nonempty_else=False,
    early_exit=False,
    replaces=[],
    free_calls={"TOD_ASSERT"},
    table_name="kAttachmentSetMatrixCases",
    dispatch=(
        "\t\t// C 形态 -> 匿名 lambda 函数指针表：行序 = EffectType 枚举序（0..4\n"
        "\t\t// 全覆盖无 default）；矩阵逐层复合值 aPosition 直传，下钻压栈\n"
        "\t\t// 随体迁移。\n"
        "\t\tconst unsigned aEffectKindIndex = static_cast<unsigned>(aAttachEffect->mEffectType);\n"
        "\t\tif (aEffectKindIndex <= static_cast<unsigned>(EffectType::EFFECT_OTHER))\n"
        "\t\t{\n"
        "\t\t\tkAttachmentSetMatrixCases[aEffectKindIndex](aAttachEffect, aStack, aDepth, aPosition);\n"
        "\t\t}\n"),
    block_comment=(
        "// Attachment::SetMatrix 分发表：表内匿名 lambda = 原 case 体逐句迁移\n"
        "//（生成器 + 逆变换 token 对拍 0 差异）；矩阵帧结构体提至匿名命名空间，\n"
        "// 函数内以 using 别名沿用。\n"),
    tail_replaces=[("\tstruct MatrixFrame { Attachment* mAttachment; SexyTransform2D mMatrix; int mIndex; };",
                    "\tusing MatrixFrame = AttachmentMatrixFrame;")],
)

# ---------------- att-draw ----------------
cfg(
    "att-draw",
    src="Sexy.TodLib/Attachment.cpp",
    func="void Attachment::Draw(Graphics* g, bool theParentHidden)",
    sw="\t\tswitch (aAttachEffect->mEffectType)",
    case_label=r"^\t\tcase EffectType::(\w+):",
    enum_name="EffectType",
    count_last="EFFECT_OTHER",
    orig_ref="HEAD",
    locals_struct=(
        "struct AttachmentDrawFrame\n"
        "{\n"
        "    Attachment* mAttachment;\n"
        "    int mIndex;\n"
        "};"),
    fn_sig=("void (*)(AttachEffect*, Graphics*, DataArray<TodParticleSystem>&, DataArray<Reanimation>&, "
            "DataArray<Attachment>&, AttachmentDrawFrame*, int&)"),
    alias="AttachmentDrawCaseFn",
    lam_params=("AttachEffect* aAttachEffect, Graphics* g, DataArray<TodParticleSystem>& aParticleSystems, "
                "DataArray<Reanimation>& aReanimations, DataArray<Attachment>& aAttachments, "
                "AttachmentDrawFrame* aStack, int& aDepth"),
    obj_name="unusedAttachment",
    named_ret="void",
    shared_prefix="AttachDraw",
    default_fn=None,   # 5 case 全覆盖，无 default
    default_nonempty_else=False,
    early_exit=False,
    replaces=[],
    free_calls={"TOD_ASSERT"},
    table_name="kAttachmentDrawCases",
    dispatch=(
        "\t\t// C 形态 -> 匿名 lambda 函数指针表：行序 = EffectType 枚举序（0..4\n"
        "\t\t// 全覆盖无 default）；switch 外提的三个 DataArray 引用经参直传，\n"
        "\t\t// 下钻压栈随体迁移。\n"
        "\t\tconst unsigned aEffectKindIndex = static_cast<unsigned>(aAttachEffect->mEffectType);\n"
        "\t\tif (aEffectKindIndex <= static_cast<unsigned>(EffectType::EFFECT_OTHER))\n"
        "\t\t{\n"
        "\t\t\tkAttachmentDrawCases[aEffectKindIndex](aAttachEffect, g, aParticleSystems, "
        "aReanimations, aAttachments, aStack, aDepth);\n"
        "\t\t}\n"),
    block_comment=(
        "// Attachment::Draw 分发表：表内匿名 lambda = 原 case 体逐句迁移（生成器 +\n"
        "// 逆变换 token 对拍 0 差异）；绘制帧结构体提至匿名命名空间，函数内\n"
        "// 以 using 别名沿用。\n"),
    tail_replaces=[("\tstruct DrawFrame { Attachment* mAttachment; int mIndex; };",
                    "\tusing DrawFrame = AttachmentDrawFrame;")],
)

# ---------------- att-detach ----------------
cfg(
    "att-detach",
    src="Sexy.TodLib/Attachment.cpp",
    func="void Attachment::Detach()",
    sw="\t\tswitch (aAttachEffect->mEffectType)",
    case_label=r"^\t\tcase EffectType::(\w+):",
    enum_name="EffectType",
    count_last="EFFECT_OTHER",
    orig_ref="HEAD",
    locals_struct=None,
    fn_sig=("void (*)(AttachEffect*, DataArray<TodParticleSystem>&, DataArray<Reanimation>&, "
         "DataArray<Attachment>&)"),
    alias="AttachmentDetachCaseFn",
    lam_params=("AttachEffect* aAttachEffect, DataArray<TodParticleSystem>& aParticleSystems, "
                "DataArray<Reanimation>& aReanimations, DataArray<Attachment>& aAttachments"),
    obj_name="unusedAttachment",
    named_ret="void",
    shared_prefix="AttachDetach",
    default_fn=None,   # 5 case 全覆盖，无 default
    default_nonempty_else=False,
    early_exit=False,
    replaces=[],
    free_calls={"TOD_ASSERT"},
    table_name="kAttachmentDetachCases",
    dispatch=(
        "\t\t// C 形态 -> 匽名 lambda 函数指针表：行序 = EffectType 枚举序（0..4\n"
        "\t\t// 全覆盖无 default）；switch 外提的三个 DataArray 引用经参直传；\n"
        "\t\t// 尾部 mEffectID 清零留在分发点之后（原样）。\n"
        "\t\tconst unsigned aEffectKindIndex = static_cast<unsigned>(aAttachEffect->mEffectType);\n"
        "\t\tif (aEffectKindIndex <= static_cast<unsigned>(EffectType::EFFECT_OTHER))\n"
        "\t\t{\n"
        "\t\t\tkAttachmentDetachCases[aEffectKindIndex](aAttachEffect, aParticleSystems, "
        "aReanimations, aAttachments);\n"
        "\t\t}\n"),
    block_comment=(
        "// Attachment::Detach 分发表：表内匿名 lambda = 原 case 体逐句迁移（生成器 +\n"
        "// 逆变换 token 对拍 0 差异）；TRAIL 注释体与 OTHER 空体随槽保留。\n"),
    tail_replaces=[],
)

# ---------------- att-die ----------------
cfg(
    "att-die",
    src="Sexy.TodLib/Attachment.cpp",
    func="void Attachment::AttachmentDie()",
    sw="\t\tswitch (aAttachEffect->mEffectType)",
    case_label=r"^\t\tcase EffectType::(\w+):",
    enum_name="EffectType",
    count_last="EFFECT_OTHER",
    orig_ref="HEAD",
    locals_struct=None,
    fn_sig=("void (*)(AttachEffect*, DataArray<TodParticleSystem>*, DataArray<Reanimation>*, "
         "DataArray<Attachment>*)"),
    alias="AttachmentDieCaseFn",
    lam_params=("AttachEffect* aAttachEffect, DataArray<TodParticleSystem>* aParticleSystems, "
                "DataArray<Reanimation>* aReanimations, DataArray<Attachment>* aAttachments"),
    obj_name="unusedAttachment",
    named_ret="void",
    shared_prefix="AttachDie",
    default_fn=None,   # 5 case 全覆盖，无 default
    default_nonempty_else=False,
    early_exit=False,
    replaces=[],
    free_calls={"TOD_ASSERT"},
    table_name="kAttachmentDieCases",
    dispatch=(
        "\t\t// C 形态 -> 匿名 lambda 函数指针表：行序 = EffectType 枚举序（0..4\n"
        "\t\t// 全覆盖无 default）；三池指针可为空（循环依赖防护，原样三元判空），\n"
        "\t\t// 经参直传；尾部 mEffectID 清零留在分发点之后（原样）。\n"
        "\t\tconst unsigned aEffectKindIndex = static_cast<unsigned>(aAttachEffect->mEffectType);\n"
        "\t\tif (aEffectKindIndex <= static_cast<unsigned>(EffectType::EFFECT_OTHER))\n"
        "\t\t{\n"
        "\t\t\tkAttachmentDieCases[aEffectKindIndex](aAttachEffect, aParticleSystems, "
        "aReanimations, aAttachments);\n"
        "\t\t}\n"),
    block_comment=(
        "// Attachment::AttachmentDie 分发表：表内匿名 lambda = 原 case 体逐句迁移\n"
        "//（生成器 + 逆变换 token 对拍 0 差异）；判空三元随体保留。\n"),
    tail_replaces=[],
)

# ---------------- particle-field ----------------
cfg(
    "particle-field",
    src="Sexy.TodLib/TodParticle.cpp",
    func="void TodParticleEmitter::UpdateParticleField(TodParticle* theParticle, ParticleField* theParticleField, float theParticleTimeValue, int theFieldIndex)",
    sw="\tswitch (theParticleField->mFieldType)",
    case_label=r"^\tcase ParticleFieldType::(\w+):",
    default_re=r"^\tdefault:",
    enum_name="ParticleFieldType",
    enum_file="Sexy.TodLib/TodParticle.h",
    enum_count="PARTICLE_FIELD_COUNT",
    orig_ref="HEAD",
    locals_struct=None,
    fn_sig="void (*)(TodParticleEmitter&, TodParticle*, ParticleField*, float, float, float, float, float)",
    alias="ParticleFieldCaseFn",
    lam_params=("TodParticleEmitter& e, TodParticle* theParticle, ParticleField* theParticleField, "
                "float theParticleTimeValue, float x, float y, float aInterpX, float aInterpY"),
    obj_name="e",  # 体中无 &e 子串（已核）；mSystemCenter/mEmitterDef 经 e 直写
    named_ret="void",
    shared_prefix="ParticleField",
    default_fn="ParticleFieldDefault",  # 原 default 非空：TOD_ASSERT(0)
    default_nonempty_else=True,
    early_exit=False,
    replaces=[],
    free_calls={"TOD_ASSERT", "FloatTrackEvaluate", "FloatTrackEvaluateFromLastTime", "ClampFloat", "srand", "rand"},
    table_name="kParticleFieldCases",
    dispatch=(
        "\t// C 形态 -> 匿名 lambda 函数指针表：行序 = ParticleFieldType 枚举序\n"
        "\t// （0..11；SYSTEM_POSITION 为 UpdateSystemField 专属 → 缺槽走 default）。\n"
        "\t// 场值 x/y 与双插值经值参传入（体只读）；发射器成员经 e 直写。\n"
        "\t// default（TOD_ASSERT）具名并被缺槽与越界分支复用。\n"
        "\tconst unsigned aFieldTypeIndex = static_cast<unsigned>(theParticleField->mFieldType);\n"
        "\tif (aFieldTypeIndex < static_cast<unsigned>(ParticleFieldType::PARTICLE_FIELD_COUNT))\n"
        "\t{\n"
        "\t\tkParticleFieldCases[aFieldTypeIndex](*this, theParticle, theParticleField, "
        "theParticleTimeValue, x, y, aInterpX, aInterpY);\n"
        "\t}\n"
        "\telse\n"
        "\t{\n"
        "\t\tParticleFieldDefault(*this, theParticle, theParticleField, "
        "theParticleTimeValue, x, y, aInterpX, aInterpY);\n"
        "\t}\n"),
    block_comment=(
        "// TodParticleEmitter::UpdateParticleField 物理场分发表：表内匿名 lambda =\n"
        "// 原 case 体逐句迁移（生成器 + 逆变换 token 对拍 0 差异）；INVALID 槽空\n"
        "// 操作；default 具名并被缺槽/越界复用。\n"),
    tail_replaces=[],
)

# ---------------- particle-spawn ----------------
cfg(
    "particle-spawn",
    src="Sexy.TodLib/TodParticle.cpp",
    func="TodParticle* TodParticleEmitter::SpawnParticle(int theIndex, int theSpawnCount)",
    sw="\tswitch (mEmitterDef->mEmitterType)",
    case_label=r"^\tcase EmitterType::(\w+):",
    default_re=r"^\tdefault:",
    enum_name="EmitterType",
    count_last="EMITTER_CIRCLE_EVEN_SPACING",
    orig_ref="HEAD",
    locals_struct=None,
    fn_sig="void (*)(TodParticleEmitter&, float, float&, float&)",
    alias="ParticleSpawnPosCaseFn",
    lam_params="TodParticleEmitter& e, float aLaunchAngle, float& aPosX, float& aPosY",
    obj_name="e",  # 体中无 &e 子串（已核）；mEmitterDef/mSystemTimeValue/mTrackInterp 经 e 直写
    named_ret="void",
    shared_prefix="ParticleSpawnPos",
    default_fn="ParticleSpawnPosDefault",  # 原 default 非空：TOD_ASSERT(false)
    default_nonempty_else=True,
    early_exit=False,
    replaces=[],
    free_calls={"TOD_ASSERT", "FloatTrackEvaluate", "sin", "cos", "DEG_TO_RAD"},
    table_name="kParticleSpawnPosCases",
    dispatch=(
        "\t// C 形态 -> 匿名 lambda 函数指针表：行序 = EmitterType 枚举序（0..4）。\n"
        "\t// 三种圆形发射器标签共体 → 具名（匿名 lambda 无法跨槽复用）；\n"
        "\t// aPosX/aPosY 经引用直写（分发点之后消费）；发射角经值参直传。\n"
        "\t// default（TOD_ASSERT）具名并被越界分支复用。\n"
        "\tconst unsigned aEmitterKindIndex = static_cast<unsigned>(mEmitterDef->mEmitterType);\n"
        "\tif (aEmitterKindIndex <= static_cast<unsigned>(EmitterType::EMITTER_CIRCLE_EVEN_SPACING))\n"
        "\t{\n"
        "\t\tkParticleSpawnPosCases[aEmitterKindIndex](*this, aLaunchAngle, aPosX, aPosY);\n"
        "\t}\n"
        "\telse\n"
        "\t{\n"
        "\t\tParticleSpawnPosDefault(*this, aLaunchAngle, aPosX, aPosY);\n"
        "\t}\n"),
    block_comment=(
        "// TodParticleEmitter::SpawnParticle 发射几何分发表：表内匿名 lambda =\n"
        "// 原 case 体逐句迁移（生成器 + 逆变换 token 对拍 0 差异）；圆形三标签\n"
        "// 共体具名；default 具名并被越界复用。\n"),
    tail_replaces=[],
)

# ---------------- filter-create ----------------
cfg(
    "filter-create",
    src="Sexy.TodLib/FilterEffect.cpp",
    func="MemoryImage* FilterEffectCreateImage(Image* theImage, FilterEffect theFilterEffect)",
    sw="\tswitch (theFilterEffect)",
    case_label=r"^\tcase FilterEffect::(\w+):",
    enum_name="FilterEffect",
    enum_file="Sexy.TodLib/FilterEffect.h",
    enum_count="NUM_FILTER_EFFECTS",
    orig_ref="HEAD",
    locals_struct=None,
    fn_sig="void (*)(std::unique_ptr<MemoryImage>&)",
    alias="FilterCreateCaseFn",
    lam_params="std::unique_ptr<MemoryImage>& aImage",
    obj_name="unusedFilter",
    named_ret="void",
    shared_prefix="FilterCreate",
    default_fn=None,   # 0..2 全覆盖；NONE=-1/NUM 哨兵原共体空 case（表外无操作）
    default_nonempty_else=False,
    early_exit=False,
    replaces=[],
    free_calls={"FilterEffectDoWashedOut", "FilterEffectDoLessWashedOut", "FilterEffectDoWhite", "TOD_ASSERT"},
    table_name="kFilterCreateCases",
    dispatch=(
        "\t// C 形态 -> 匿名 lambda 函数指针表：行序 = FilterEffect 有效值序（0..2）。\n"
        "\t// NONE=-1 与 NUM 哨兵原为共体空 case——越界分支无操作 = 原 switch 语义。\n"
        "\t// 变体图像经引用直传（.get() 调用随体保留）。\n"
        "\tconst unsigned aFilterKindIndex = static_cast<unsigned>(theFilterEffect);\n"
        "\tif (aFilterKindIndex < static_cast<unsigned>(FilterEffect::NUM_FILTER_EFFECTS))\n"
        "\t{\n"
        "\t\tkFilterCreateCases[aFilterKindIndex](aImage);\n"
        "\t}\n"),
    block_comment=(
        "// FilterEffectCreateImage 逐像素滤镜分发表：表内匿名 lambda = 原 case 体\n"
        "// 逐句迁移（生成器 + 逆变换 token 对拍 0 差异）。\n"),
    tail_replaces=[],
)

# ---------------- res-load ----------------
cfg(
    "res-load",
    src="Sexy.TodLib/TodCommon.cpp",
    func="bool ResourceManager::TodLoadNextResource()",
    sw="\t\tswitch (aRes->mType)",
    case_label=r"^\t\tcase (ResType_\w+):",
    enum_name="ResType",
    enum_file="SexyAppFramework/misc/ResourceManager.h",
    count_last="ResType_Font",
    bound_expr="(int)ResourceManager::ResType::ResType_Font + 1",  # 嵌套枚举须类名限定
    orig_ref="HEAD",
    locals_struct=(
        "struct ResourcePreloadLocals\n"
        "{\n"
        "    bool mEarlyExit;   // true = 原 case continue（资源已就绪，跳过装载）\n"
        "};"),
    fn_sig="void (*)(ResourceManager&, ResourceManager::BaseRes*, ResourcePreloadLocals&)",
    alias="ResourcePreloadCaseFn",
    lam_params="ResourceManager& rm, ResourceManager::BaseRes* aRes, ResourcePreloadLocals& lc",
    obj_name="rm",  # 体中无 &rm 子串（已核）；mCurResGroupListItr 经 rm 直写
    named_ret="void",
    shared_prefix="ResourcePreload",
    default_fn=None,   # 3 case 全覆盖，无 default
    default_nonempty_else=False,
    early_exit=True,   # case 内 continue → lc.mEarlyExit + return，分发点还原 continue
    replaces=[("continue;", "return;")],
    free_calls={"TOD_ASSERT"},
    table_name="kResourcePreloadCases",
    dispatch=(
        "\t\t// C 形态 -> 匿名 lambda 函数指针表：行序 = ResourceManager::ResType 枚举\n"
        "\t\t// 序（0..2 全覆盖无 default）。case 内 continue（已装载资源跳过）经\n"
        "\t\t// early_exit 标志传出、分发点还原 continue；break（执行装载）=\n"
        "\t\t// 槽位函数自然返回，控制流与原 switch 逐句等价。\n"
        "\t\tResourcePreloadLocals aPreloadLocals{false};\n"
        "\t\tconst unsigned aResTypeIndex = static_cast<unsigned>(aRes->mType);\n"
        "\t\tif (aResTypeIndex <= static_cast<unsigned>(ResourceManager::ResType::ResType_Font))\n"
        "\t\t{\n"
        "\t\t\tkResourcePreloadCases[aResTypeIndex](*this, aRes, aPreloadLocals);\n"
        "\t\t}\n"
        "\t\tif (aPreloadLocals.mEarlyExit)\n"
        "\t\t{\n"
        "\t\t\tcontinue;\n"
        "\t\t}\n"),
    block_comment=(
        "// ResourceManager::TodLoadNextResource 预检分发表：表内匿名 lambda = 原\n"
        "// case 体逐句迁移（生成器 + 逆变换 token 对拍 0 差异）；continue 经\n"
        "// early_exit 标志还原。\n"),
    tail_replaces=[],
)

# ---------------- def-deepsize ----------------
# Definition 族 5 函数共用判别式 aField->mFieldType / field->mFieldType
# （DefFieldType enum class 11 值），XML 字段读取/写出/尺寸计算——每函数独立表。
cfg(
    "def-deepsize",
    src="Sexy.TodLib/Definition.cpp",
    func="unsigned int DefinitionGetDeepSize(DefMap* theDefMap, void* theDefinition)",
    sw="        switch (aField->mFieldType) {",
    case_label=r"^        case DefFieldType::(\w+):",
    default_re=r"^        default:",
    enum_name="DefFieldType",
    enum_file="Sexy.TodLib/Definition.h",
    count_last="DT_FONT",
    orig_ref="HEAD",
    locals_struct=(
        "struct DefDeepSizeLocals\n"
        "{\n"
        "    bool mEarlyExit;   // true = 原 default continue（本字段无深尺寸贡献）\n"
        "};"),
    fn_sig="void (*)(DefField*, void*, unsigned int&, DefDeepSizeLocals&)",
    alias="DefDeepSizeCaseFn",
    lam_params="DefField* aField, void* aDest, unsigned int& aResult, DefDeepSizeLocals& lc",
    obj_name="unusedDef",
    named_ret="void",
    shared_prefix="DefDeepSize",
    default_fn="DefDeepSizeDefault",  # 原 default 非空：continue（跳过非容器字段）
    default_nonempty_else=True,
    early_exit=True,   # default 内 continue → lc.mEarlyExit + return，分发点还原
    replaces=[("continue;", "return;")],
    free_calls={"DefGetSizeString", "DefinitionGetArraySize", "DefGetSizeFloatTrack",
                "DefGetSizeImage", "DefGetSizeFont", "TOD_ASSERT"},
    table_name="kDefDeepSizeCases",
    dispatch=(
        "        // C 形态 -> 匿名 lambda 函数指针表：行序 = DefFieldType 枚举序\n"
        "        // （0..10）。default（continue 跳过非容器字段）经 early_exit 标志\n"
        "        // 还原；缺槽（INVALID/INT/FLOAT/ENUM/VECTOR2/FLAGS）与越界共用。\n"
        "        // aResult 经引用直写（跨字段累加）。\n"
        "        DefDeepSizeLocals aDeepSizeLocals{false};\n"
        "        const unsigned aFieldTypeIndex = static_cast<unsigned>(aField->mFieldType);\n"
        "        if (aFieldTypeIndex <= static_cast<unsigned>(DefFieldType::DT_FONT))\n"
        "        {\n"
        "            kDefDeepSizeCases[aFieldTypeIndex](aField, aDest, aResult, aDeepSizeLocals);\n"
        "        }\n"
        "        else\n"
        "        {\n"
        "            DefDeepSizeDefault(aField, aDest, aResult, aDeepSizeLocals);\n"
        "        }\n"
        "        if (aDeepSizeLocals.mEarlyExit)\n"
        "        {\n"
        "            continue;\n"
        "        }\n"),
    block_comment=(
        "// DefinitionGetDeepSize 深尺寸表：表内匿名 lambda = 原 case 体逐句迁移\n"
        "//（生成器 + 逆变换 token 对拍 0 差异）；default（continue）具名并经\n"
        "// early_exit 标志被缺槽/越界复用。\n"),
    tail_replaces=[],
)

# ---------------- def-calchash ----------------
cfg(
    "def-calchash",
    src="Sexy.TodLib/Definition.cpp",
    func="uint DefinitionCalcHashDefMap(int aSchemaHash, DefMap* theDefMap, TodList<DefMap*>& theProgressMaps)",
    sw="        switch (aField->mFieldType)",
    case_label=r"^        case DefFieldType::(\w+):",
    default_re=r"^        default:",
    enum_name="DefFieldType",
    enum_file="Sexy.TodLib/Definition.h",
    count_last="DT_FONT",
    orig_ref="HEAD",
    locals_struct=None,
    fn_sig="void (*)(DefField*, uint&, TodList<DefMap*>&)",
    alias="DefCalcHashCaseFn",
    lam_params="DefField* aField, uint& aSchemaHash, TodList<DefMap*>& theProgressMaps",
    obj_name="unusedDef",
    named_ret="void",
    shared_prefix="DefCalcHash",
    default_fn="DefCalcHashDefault",  # 原 default 空（break 无操作）
    default_nonempty_else=False,
    early_exit=False,
    replaces=[],
    free_calls={"DefinitionCalcHashSymbolMap", "DefinitionCalcHashDefMap", "TOD_ASSERT"},
    table_name="kDefCalcHashCases",
    dispatch=(
        "        // C 形态 -> 匿名 lambda 函数指针表：行序 = DefFieldType 枚举序\n"
        "        // （0..10）。ENUM+FLAGS 标签共体 → 具名；default（空操作）具名\n"
        "        // 并被缺槽/越界复用；aSchemaHash 经引用直写。\n"
        "        const unsigned aFieldTypeIndex = static_cast<unsigned>(aField->mFieldType);\n"
        "        if (aFieldTypeIndex <= static_cast<unsigned>(DefFieldType::DT_FONT))\n"
        "        {\n"
        "            kDefCalcHashCases[aFieldTypeIndex](aField, aSchemaHash, theProgressMaps);\n"
        "        }\n"),
    block_comment=(
        "// DefinitionCalcHashDefMap schema 哈希表：表内匿名 lambda = 原 case 体\n"
        "// 逐句迁移（生成器 + 逆变换 token 对拍 0 差异）；ENUM/FLAGS 共体具名。\n"),
    tail_replaces=[],
)

# ---------------- def-readcache ----------------
cfg(
    "def-readcache",
    src="Sexy.TodLib/Definition.cpp",
    func="bool DefMapReadFromCache(DefinitionCacheReader& reader, DefMap* theDefMap, void* theDefinition)",
    sw="        switch (field->mFieldType)",
    case_label=r"^        case DefFieldType::(\w+):",
    default_re=r"^        default:",
    enum_name="DefFieldType",
    enum_file="Sexy.TodLib/Definition.h",
    count_last="DT_FONT",
    orig_ref="HEAD",
    locals_struct=None,
    fn_sig="void (*)(DefinitionCacheReader&, DefField*, char*, bool&)",
    alias="DefReadCacheCaseFn",
    lam_params="DefinitionCacheReader& reader, DefField* field, char* value, bool& success",
    obj_name="unusedDef",
    named_ret="void",
    shared_prefix="DefReadCache",
    default_fn="DefReadCacheDefault",  # 原 default 空（定长字段在记录头部直拷，无嵌套读取）
    default_nonempty_else=False,
    early_exit=False,
    replaces=[],
    free_calls={"DefReadFromCacheString", "DefReadFromCacheArray", "DefReadFromCacheFloatTrack",
                "DefReadFromCacheImage", "DefReadFromCacheFont", "TOD_ASSERT"},
    table_name="kDefReadCacheCases",
    dispatch=(
        "        // C 形态 -> 匿名 lambda 函数指针表：行序 = DefFieldType 枚举序\n"
        "        // （0..10）。定长字段（INVALID/INT/FLOAT/ENUM/VECTOR2/FLAGS）在\n"
        "        // 记录头部直拷 → 缺槽空操作 default 具名；success 经引用直写\n"
        "        //（分发点之后统一判败返回）。\n"
        "        const unsigned aFieldTypeIndex = static_cast<unsigned>(field->mFieldType);\n"
        "        if (aFieldTypeIndex <= static_cast<unsigned>(DefFieldType::DT_FONT))\n"
        "        {\n"
        "            kDefReadCacheCases[aFieldTypeIndex](reader, field, value, success);\n"
        "        }\n"),
    block_comment=(
        "// DefMapReadFromCache 定长读分发表：表内匿名 lambda = 原 case 体逐句迁移\n"
        "//（生成器 + 逆变换 token 对拍 0 差异）；缺槽（头部直拷字段）空操作。\n"),
    tail_replaces=[],
)

# ---------------- def-writecache ----------------
cfg(
    "def-writecache",
    src="Sexy.TodLib/Definition.cpp",
    func="void DefMapWriteToCache(void*& theWritePtr, DefMap* theDefMap, void* theDefinition)",
    sw="\t\tswitch (aField->mFieldType) {",
    case_label=r"^\t\tcase DefFieldType::(\w+):",
    default_re=r"^\t\tdefault:",
    enum_name="DefFieldType",
    enum_file="Sexy.TodLib/Definition.h",
    count_last="DT_FONT",
    orig_ref="HEAD",
    locals_struct=None,
    fn_sig="void (*)(void*&, DefField*, void*)",
    alias="DefWriteCacheCaseFn",
    lam_params="void*& theWritePtr, DefField* aField, void* aDest",
    obj_name="unusedDef",
    named_ret="void",
    shared_prefix="DefWriteCache",
    default_fn="DefWriteCacheDefault",  # 原 default 空（定长字段已随记录体整体写出）
    default_nonempty_else=False,
    early_exit=False,
    replaces=[],
    free_calls={"DefWriteToCacheString", "DefWriteToCacheArray", "DefWriteToCacheFloatTrack",
                "DefWriteToCacheImage", "DefWriteToCacheFont", "TOD_ASSERT"},
    table_name="kDefWriteCacheCases",
    dispatch=(
        "\t\t// C 形态 -> 匿名 lambda 函数指针表：行序 = DefFieldType 枚举序\n"
        "\t\t// （0..10）。定长字段随记录体整体写出 → 缺槽空操作 default 具名；\n"
        "\t\t// 写游标 theWritePtr 经引用直写。\n"
        "\t\tconst unsigned aFieldTypeIndex = static_cast<unsigned>(aField->mFieldType);\n"
        "\t\tif (aFieldTypeIndex <= static_cast<unsigned>(DefFieldType::DT_FONT))\n"
        "\t\t{\n"
        "\t\t\tkDefWriteCacheCases[aFieldTypeIndex](theWritePtr, aField, aDest);\n"
        "\t\t}\n"),
    block_comment=(
        "// DefMapWriteToCache 定长写分发表：表内匿名 lambda = 原 case 体逐句迁移\n"
        "//（生成器 + 逆变换 token 对拍 0 差异）；缺槽（记录体直写字段）空操作。\n"),
    tail_replaces=[],
)

# ============================================================
NAME = sys.argv[1]
MODE = sys.argv[2] if len(sys.argv) > 2 else "gen"
C = CONFIGS[NAME]

# ---------- 枚举真值（剥块注释） ----------
enum_txt = open(C.get("enum_file", "ConstEnums.h"), encoding="utf-8").read()
enum_txt = re.sub(r"/\*.*?\*/", "", enum_txt, flags=re.S)
# enum class X : int{ 与普通 enum X{ 双兼容（DefFieldType 为 enum class）；
# 仅追加可选段，对既有普通枚举配置零影响
m = re.search(r"enum (?:class )?" + C["enum_name"] + r"\b(?:\s*:\s*[\w:]+)?\s*\{(.*?)\}",
              enum_txt, flags=re.S)
# 先按行剥注释再按逗号分段（注释紧跟在逗号后，后剥会把下一项名字一起吞掉）
raw = "\n".join(line.split("//")[0] for line in m.group(1).split("\n"))
types, value = [], None
for item in raw.split(","):
    item = item.strip()
    if not item:
        continue
    if "=" in item:
        n, v = [x.strip() for x in item.split("=", 1)]
        value = int(v)
    else:
        n = item
        # 首个隐式值 = 0（C++ 语义）。曾误作 -1 起步致无显式值前缀的枚举
        # （CursorType/GameObjectType）整表左移一格——17 行冒充 18、assert 拦不住
        value = 0 if value is None else value + 1
    types.append((n, value))
valuemap = dict(types)
COUNT = valuemap[C["count_last"]] + 1 if "count_last" in C else valuemap[C["enum_count"]]
LO = C.get("value_lo", 0)
# 真值序：按声明序截止到计数哨兵——其后（IZombie 种子、SEED_NONE 等）为表外
# 哨兵/别名，可能有重复值（NUM_SEEDS_IN_CHOOSER=49），不得混入
stop_name = C["count_last"] if "count_last" in C else C["enum_count"]
real = []
for n, v in types:
    if n == stop_name:
        if "count_last" in C:
            real.append((n, v))
        break
    if v >= LO:
        real.append((n, v))
assert [v for _, v in real] == list(range(LO, COUNT)), "枚举声明序值域与 LO..COUNT-1 不符"
real = [n for n, _ in real]
BOUND = C.get("bound_expr") or f"(int){C['enum_name']}::{C.get('enum_count', '')}"
if "count_last" in C:
    BOUND = C.get("bound_expr") or f"(int){C['enum_name']}::{C['count_last']} + 1"

# ---------- 原文 ----------
if MODE == "verify":
    src = subprocess.run(["git", "show", C["orig_ref"] + ":" + C["src"]], capture_output=True,
                         text=True, encoding="utf-8", check=True).stdout
else:
    src = open(C["src"], encoding="utf-8").read()
fn_start = src.index(C["func"])
sw_start = src.index(C["sw"], fn_start)
fn_brace = src.index("{", fn_start)
d, i = 0, fn_brace
while True:
    if src[i] == "{":
        d += 1
    elif src[i] == "}":
        d -= 1
        if d == 0:
            break
    i += 1
fn_end = i
assert sw_start < fn_end, "switch 锚点不在函数体内——检查目标函数是否已被转换/锚文本是否唯一"
sw_brace = src.index("{", sw_start)
depth, i = 0, sw_brace
while True:
    if src[i] == "{":
        depth += 1
    elif src[i] == "}":
        depth -= 1
        if depth == 0:
            break
    i += 1
sw_end = i
body = src[sw_brace + 1 : sw_end]

member_calls = {n for n in re.findall(r"(?<![.\w>:])\b([A-Za-z_]\w*)\s*\(", body)
                } - C["free_calls"] - {"if", "switch", "while", "for", "return", "sizeof"}

# ---------- 分组（case/default 标签，含同行残余语句；连续无体标签并组=共体） ----------
label_re = re.compile(C["case_label"])
default_re = re.compile(C.get("default_re", r"^    default:"))
entries = []  # (labels, lines)；default 以 "__default__" 标签表示
cur = None
for line in body.split("\n"):
    lm = label_re.match(line)
    dm = default_re.match(line)
    if lm or dm:
        rest = line[lm.end():].strip() if lm else line[dm.end():].strip()
        labels = [lm.group(1)] if lm else ["__default__"]
        if cur is not None and any(l.strip() for l in cur[1]):
            entries.append(cur)
            cur = None
        if cur is None:
            cur = [labels, [rest] if rest else []]
        elif "__default__" not in cur[0] and "__default__" not in labels:
            cur[0].extend(labels)          # 无体标签并入当前组（标签共体）
            if rest:
                cur[1].append(rest)
        else:
            entries.append(cur)
            cur = [labels, [rest] if rest else []]
    else:
        if cur is not None:
            cur[1].append(line)
if cur is not None:
    entries.append(cur)

def strip_break(lines):
    lines = [l for l in lines]
    # 尾部/头部跳过空行与注释行找真正的语句边界（break 后常跟 // 注释行，注释随体保留）
    def last_code():
        k = len(lines) - 1
        while k >= 0 and (not lines[k].strip() or lines[k].strip().startswith("//")):
            k -= 1
        return k
    def first_code():
        j = 0
        while j < len(lines) and (not lines[j].strip() or lines[j].strip().startswith("//")):
            j += 1
        return j
    k = last_code()
    if k < 0:
        return [l for l in lines if l.strip()]
    j = first_code()
    if k > j and re.match(r"^\s*\{\s*$", lines[j]) and re.match(r"^\s*\}\s*$", lines[k]):
        # case 级作用域对：剥右括号 → 剥内层 break → 剥左括号
        del lines[k]
        k2 = last_code()
        if k2 >= 0:
            lines[k2] = re.sub(r"\s*break;\s*(//.*)?$", "", lines[k2])
        del lines[j]
    else:
        # 无作用域（或行尾内联 break）：只剥 break，if 块等内部括号不碰
        lines[k] = re.sub(r"\s*break;\s*(//.*)?$", "", lines[k])
    while lines and not lines[-1].strip():
        lines.pop()
    while lines and not lines[0].strip():
        lines.pop(0)
    return lines

groups, default_body = [], None
for labels, lines in entries:
    if labels == ["__default__"]:
        default_body = strip_break(lines)
    elif any(l in valuemap and 0 <= valuemap[l] < COUNT for l in labels):
        groups.append((labels, strip_break(lines)))

def real_labels(ls):
    return [l for l in ls if l in valuemap and LO <= valuemap[l] < COUNT]
slot_to_group = {}
for gi, (ls, b) in enumerate(groups):
    for l in real_labels(ls):
        slot_to_group[valuemap[l] - LO] = gi
missing = [v for v in range(COUNT - LO) if v not in slot_to_group]

# ---------- 变换 ----------
def enum_stem(label):
    for pre in ("SEED_", "ZOMBIE_"):
        if label.startswith(pre):
            return label[len(pre):]
    return label

def to_free(body_lines):
    t = "\n".join(body_lines)
    for old, new in C["replaces"]:
        t = t.replace(old, new)
    obj = C["obj_name"]
    t = re.sub(r"(?<![.\w>])m([A-Z]\w*)", obj + r".m\1", t)
    for meth in sorted(member_calls, key=len, reverse=True):
        t = re.sub(r"(?<![.\w>:])\b" + re.escape(meth) + r"\s*\(", obj + "." + meth + "(", t)
    t = re.sub(r"(?<![\w.])this\b", "&" + obj, t)
    if C["early_exit"]:
        # 单行复合语句：无括 if 单语句 return 展开成两行会把 return 变成无条件
        # 语句（selector-state/selector-button 首批 early_exit 用户实证；verify
        # 的逆变换逐行还原，对拍不出此错）。花括号同行保 if 归属，且可逆。
        t = re.sub(r"^(\s*)return;\s*$", r"\1{ lc.mEarlyExit = true; return; }", t, flags=re.M)
    if C.get("body_rewrite") and C["body_rewrite"][0] == "assign2return":
        var = C["body_rewrite"][1]
        t = re.sub(r"(?m)^\s*" + var + r"\s*=\s*(.*?);\s*$", r"return \1;", t)
    return t

def to_member(free_text):
    obj = C["obj_name"]
    t = free_text
    if C.get("body_rewrite") and C["body_rewrite"][0] == "assign2return":
        var = C["body_rewrite"][1]
        t = re.sub(r"(?m)^\s*return (.*?);\s*$", var + r" = \1;", t)
    if C["early_exit"]:
        t = re.sub(r"^(\s*)\{ lc\.mEarlyExit = true; return; \}\s*$", r"\1return;", t, flags=re.M)
    # 顺序敏感：先剥 obj.mXxx/obj.Method，再做 &obj→this——否则 "&p.mXxx"（取
    # 地址）会被误当 this 逆变换（ZOMBATAR 首差实证的同型潜伏）
    t = re.sub(re.escape(obj) + r"\.m([A-Z]\w*)", r"m\1", t)
    for meth in sorted(member_calls, key=len, reverse=True):
        t = t.replace(obj + "." + meth + "(", meth + "(")
    t = t.replace("&" + obj, "this")
    for old, new in C["replaces"]:
        t = t.replace(new, old)
    return t

def tokens(t):
    return re.findall(r"\w+|[^\w\s]", t)

def group_name(gi):
    return C["shared_prefix"] + enum_stem(real_labels(groups[gi][0])[0]).title().replace("_", "")

# ---------- verify ----------
if MODE == "verify":
    new_src = open(C["src"], encoding="utf-8").read()
    tbl_m = re.search(re.escape(C["table_name"]) + r"\[[^\]]*\] = \{\n(.*?)\n\};",
                      new_src, flags=re.S)
    assert tbl_m, "找不到分发表"
    tbl = tbl_m.group(1)
    lam_head = re.escape("[](" + C["lam_params"] + ")")
    rows, pos = [], 0
    while True:
        m_ref = re.compile(r"&(\w+),\s*//\s*(\d+) (\w+)").search(tbl, pos)
        m_lam = re.compile(lam_head + r"\n    \{").search(tbl, pos)
        if not m_ref and not m_lam:
            break
        if m_lam and (not m_ref or m_lam.start() < m_ref.start()):
            b0 = tbl.index("{", m_lam.end() - 6)
            d, j = 0, b0
            while j < len(tbl):
                if tbl[j] == "{":
                    d += 1
                elif tbl[j] == "}":
                    d -= 1
                    if d == 0:
                        break
                j += 1
            assert j < len(tbl), "lambda brace unmatched"
            rowbody = tbl[b0 + 1 : j]
            tail = re.match(r",?\s*//\s*(\d+) (\w+)", tbl[j + 1 :])
            assert tail, "lambda 行尾注释缺失"
            rows.append((int(tail.group(1)), tail.group(2), "lambda", rowbody))
            pos = j + 1 + tail.end()
        else:
            rows.append((int(m_ref.group(2)), m_ref.group(3), m_ref.group(1), None))
            pos = m_ref.end()
    assert len(rows) == COUNT - LO, f"表行数 {len(rows)} != {COUNT - LO}"
    fails = 0
    for slot, name, kind, rowbody in rows:
        if slot >= COUNT or name != real[slot]:
            fails += 1
            print(f"row {slot}: 名 {name} 期望 {real[slot] if slot < COUNT else 'OOB'}")
            continue
        if slot in slot_to_group:
            obody = groups[slot_to_group[slot]][1]
        else:
            assert default_body is not None, "缺槽但无 default 体"
            obody = default_body
        fn_body = rowbody
        if kind != "lambda":
            fm = re.search(re.escape(kind) + r"\(" + re.escape(C["lam_params"]) + r"\)\n\{(.*?)\n\}",
                           new_src, flags=re.S)
            assert fm, f"具名函数 {kind} 缺失"
            fn_body = fm.group(1)
        a, b = tokens("\n".join(obody)), tokens(to_member(fn_body))
        if a != b:
            fails += 1
            print(f"row {slot} {name} ({kind}): TOKEN MISMATCH")
            for k in range(min(len(a), len(b))):
                if a[k] != b[k]:
                    print("  first diff at", k, a[k:k+8], "vs", b[k:k+8])
                    break
            else:
                print("  length", len(a), "vs", len(b))
    print(f"VERIFY[{NAME}]:",
          f"PASS {COUNT - LO}/{COUNT - LO} rows ({len(groups)} bodies, {len(missing)} default slots)" if fails == 0
          else f"FAIL ({fails})")
    sys.exit(1 if fails else 0)

# ---------- gen ----------
# 硬闸：early_exit=False 时体里出现 return 会静默变语义（lambda 仅退出槽位
# 函数，分发点继续尾部）——对拍两侧共用提取器时对拍不出来，直接拒绝生成
if not C["early_exit"]:
    for ls, b in groups:
        assert not re.search(r"\breturn\b", "\n".join(b)), \
            f"case {ls} 含 return 但 early_exit=False——配置须开 early_exit 或先人工改造"
    if default_body:
        assert not re.search(r"\breturn\b", "\n".join(default_body)), \
            "default 体含 return 但 early_exit=False"

shared = {gi for gi in range(len(groups)) if len(real_labels(groups[gi][0])) > 1}
named = []
for gi in sorted(shared):
    free = to_free(groups[gi][1])
    ind = "\n".join(("    " + l) if l.strip() else l for l in free.split("\n"))
    named.append(
        f"// 标签共体（匿名 lambda 无法跨槽复用，复用即具名）\n"
        f"// 原 case {', '.join(real_labels(groups[gi][0]))}\n"
        f"{C['named_ret']} {group_name(gi)}({C['lam_params']})\n{{\n{ind}\n}}")
if C.get("default_fn"):
    free = to_free(default_body or [])
    ind = "\n".join(("    " + l) if l.strip() else l for l in free.split("\n"))
    named.append(
        f"// 原 default（无 case 的 {len(missing)} 型"
        f"{'与表外哨兵' if C['default_nonempty_else'] else '（空操作）'}共用）\n"
        f"{C['named_ret']} {C['default_fn']}({C['lam_params']})\n{{\n{ind}\n}}")

rows = []
for slot in range(COUNT - LO):
    if slot in slot_to_group:
        gi = slot_to_group[slot]
        if gi in shared:
            rows.append(f"    &{group_name(gi)},  // {slot} {real[slot]}（共体）")
            continue
        free = to_free(groups[gi][1])
        ind = "\n".join(("    " + l) if l.strip() else l for l in free.split("\n"))
        rows.append(
            f"    // 原 case {real_labels(groups[gi][0])[0]}\n"
            f"    []({C['lam_params']})\n    {{\n{ind}\n    }},  // {slot} {real[slot]}")
    else:
        rows.append(f"    &{C['default_fn']},  // {slot} {real[slot]}（原 default）")

# 槽位锚点：计数用 static_assert；逐槽映射由 verify 脚本全量对拍覆盖
# （MSVC 常量求值器对含匿名 lambda 初始化的数组做元素读取会报"未初始化符号"，
#  与僵尸表行为不一致，故元素级断言不生成）
anchors = [
    f"static_assert(sizeof({C['table_name']}) / sizeof({C['table_name']}[0]) ==\n"
    f"    {BOUND}, "
    f"\"{C['table_name']} 槽位数须与 {C['enum_name']} 枚举同步\");"]

block = (
    "namespace\n{\n"
    + C["block_comment"]
    + (C["locals_struct"] + "\n" if C["locals_struct"] else "")
    + f"using {C['alias']} = {C['fn_sig']};\n\n"
    + ("\n\n".join(named) + "\n\n" if named else "")
    + f"// 匿名 lambda 函数指针表，行序 = {C['enum_name']} 枚举值序（{LO}..{COUNT-1}）。\n"
    + f"constexpr {C['alias']} {C['table_name']}[{BOUND}] = {{\n"
    + "\n".join(rows) + "\n};\n"
    + "\n".join(anchors) + "\n}  // namespace\n\n")

src = src[:sw_start] + C.get("sw_keep_prefix", "") + C["dispatch"] + src[sw_end + 1 :]
for old, new in C["tail_replaces"]:
    assert old in src, f"tail_replaces 未命中: {old[:60]}"
    src = src.replace(old, new, 1)

fn_start2 = src.index(C["func"])
line_start = src.rindex("\n", 0, fn_start2) + 1
probe = line_start
while True:
    prev_end = probe - 1
    prev_start = src.rfind("\n", 0, prev_end) + 1
    prev_line = src[prev_start:prev_end]
    if prev_line.strip().startswith("//"):
        probe = prev_start
        continue
    break
src = src[:probe] + block + src[probe:]

open(C["src"], "w", encoding="utf-8", newline="").write(src)
print(f"gen[{NAME}]: {len(groups)} bodies, {len(shared)} shared, {len(missing)} default slots; wrote {C['src']}")
