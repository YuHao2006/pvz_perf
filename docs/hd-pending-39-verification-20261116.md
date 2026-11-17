# 39项待处理资源核实

39项当前成品均为2×，哈希全部通过。38项来源记录存在且文件可读，带来源哈希者全部匹配；另1项小游戏hover通过共用石牌manifest与当前两态哈希补回来源链。全部保留pending，未替换图片、运行时或Release。

智慧树背景及大头贴空背景都仍有用途，不能直接从包中删去。旧石牌母图虽标4×，manifest明确记录来自2×放大，继续排除。

## reanim/selectorscreen_minigames_highlight

普通/hover共用底图的manifest及1923×817原始AI图都在；历史标为4×的该对底图明确来自2×放大，不可作为合格母图，须恢复原始AI的轮廓/颜色处理后再生成两态。

- `assets/source-art/archive/2026-11-16-pre-library/legacy-masters/selector-state-pairs/manifest.json`
- `assets/source-art/archive/2026-11-16-pre-library/legacy-masters/selector-state-pairs/SelectorScreen_Minigames_button-raw-ai.png` [1923, 817]

## reanim/tree_bg

原生背景已找到（2048×1080）。DelayLoad_TreeOfWisdom仍以IMAGE_BACKGROUND_TREEOFWISDOM绘制此资源，不是废弃轨道图；需恢复原生背景的裁切/比例处理，生成4×导出。

- `assets/source-art/archive/2026-11-16-pre-library/replanted/reanim-source-round6/tree_bg--b8c23073d56b.png` [2048, 1080]

## reanim/selectorscreen_minigames_button

普通/hover共用底图的manifest及1923×817原始AI图都在；历史标为4×的该对底图明确来自2×放大，不可作为合格母图，须恢复原始AI的轮廓/颜色处理后再生成两态。

- `assets/source-art/archive/2026-11-16-pre-library/ai/selector-stones/candidates/SelectorScreen_Minigames_button--outline-2x-v2.png` [626, 266]
- `assets/source-art/archive/2026-11-16-pre-library/legacy-masters/selector-state-pairs/manifest.json`
- `assets/source-art/archive/2026-11-16-pre-library/legacy-masters/selector-state-pairs/SelectorScreen_Minigames_button-raw-ai.png` [1923, 817]

## images/shovel

原生铲子来源及修正配准manifest都在；当前采用缩小可见区域的2×成品，需从高密度原生图复现配准，不能直接放大该成品。

- `assets/source-art/archive/2026-11-16-pre-library/corrections/shadow-shovel-registration-20261112/shovel-registered-2x.png` [160, 160]
- `assets/source-art/masters/native/images/Shovel_hi_res--47b68468abc622b9.png` [469, 505]

## images/acheesements_bejeweled

原生主要图层及composition-candidates.json存在，但仅重植版图层覆盖部分原版细节；当前2×合成仍混有原版裂纹/小石残余，须补残余细节后重建4×。

- `assets/source-art/archive/2026-11-16-pre-library/corrections/achievements97/bejeweled-candidate-2x.png` [2800, 450]
- `assets/source-art/archive/2026-11-16-pre-library/corrections/achievements97/composition-candidates.json`
- `assets/source-art/archive/2026-11-16-pre-library/replanted/sources-round4/SPR_Achievements_Background_Bejewled_Right_04.png` [95, 83]
- `assets/source-art/archive/2026-11-16-pre-library/replanted/sources-round4/SPR_Achievements_Background_Bejewled_Center.png` [1007, 771]
- `assets/source-art/archive/2026-11-16-pre-library/replanted/sources-round4/SPR_Achievements_Background_Bejewled_Right_02.png` [252, 335]
- `assets/source-art/archive/2026-11-16-pre-library/replanted/sources-round4/SPR_Achievements_Background_Bejewled_Left_02.png` [251, 341]
- `assets/source-art/archive/2026-11-16-pre-library/replanted/sources-round4/SPR_Achievements_Background_Bejewled_Right_01.png` [190, 213]
- `assets/source-art/archive/2026-11-16-pre-library/replanted/sources-round4/SPR_Achievements_Background_Bejewled_Left_03.png` [98, 109]
- `assets/source-art/archive/2026-11-16-pre-library/replanted/sources-round4/SPR_Achievements_Background_Bejewled_Left_01.png` [201, 322]
- `assets/source-art/archive/2026-11-16-pre-library/replanted/sources-round4/SPR_Achievements_Background_Bejewled_Left_04.png` [126, 82]
- `assets/source-art/archive/2026-11-16-pre-library/replanted/sources-round4/SPR_Achievements_Background_Bejewled_Right_03.png` [58, 56]

## images/acheesements_chuzzle

原生主要图层及composition-candidates.json存在，但仅重植版图层覆盖部分原版细节；当前2×合成仍混有原版裂纹/小石残余，须补残余细节后重建4×。

- `assets/source-art/archive/2026-11-16-pre-library/corrections/achievements97/chuzzle-candidate-2x.png` [2800, 450]
- `assets/source-art/archive/2026-11-16-pre-library/corrections/achievements97/composition-candidates.json`
- `assets/source-art/archive/2026-11-16-pre-library/replanted/sources-round4/SPR_Achievements_Background_Chuzzle_Center.png` [939, 741]
- `assets/source-art/archive/2026-11-16-pre-library/replanted/sources-round4/SPR_Achievements_Background_Chuzzle_Center_01.png` [163, 85]
- `assets/source-art/archive/2026-11-16-pre-library/replanted/sources-round4/SPR_Achievements_Background_Chuzzle_Center_03.png` [100, 107]
- `assets/source-art/archive/2026-11-16-pre-library/replanted/sources-round4/SPR_Achievements_Background_Chuzzle_Center_04.png` [197, 163]
- `assets/source-art/archive/2026-11-16-pre-library/replanted/sources-round4/SPR_Achievements_Background_Chuzzle_Center_02.png` [128, 88]

## images/acheesements_peggle

原生主要图层及composition-candidates.json存在，但仅重植版图层覆盖部分原版细节；当前2×合成仍混有原版裂纹/小石残余，须补残余细节后重建4×。

- `assets/source-art/archive/2026-11-16-pre-library/corrections/achievements97/peggle-candidate-2x.png` [2800, 450]
- `assets/source-art/archive/2026-11-16-pre-library/corrections/achievements97/composition-candidates.json`
- `assets/source-art/archive/2026-11-16-pre-library/replanted/sources-round4/SPR_Achievements_Background_Peggle_Center.png` [917, 695]
- `assets/source-art/archive/2026-11-16-pre-library/replanted/sources-round4/SPR_Achievements_Background_Peggle_Center_01.png` [324, 283]
- `assets/source-art/archive/2026-11-16-pre-library/replanted/sources-round4/SPR_Achievements_Background_Peggle_Center_02.png` [252, 370]

## images/acheesements_pipe

原生主要图层及composition-candidates.json存在，但仅重植版图层覆盖部分原版细节；当前2×合成仍混有原版裂纹/小石残余，须补残余细节后重建4×。

- `assets/source-art/archive/2026-11-16-pre-library/corrections/achievements97/pipe-candidate-2x.png` [2800, 450]
- `assets/source-art/archive/2026-11-16-pre-library/corrections/achievements97/composition-candidates.json`

## images/acheesements_zuma

原生主要图层及composition-candidates.json存在，但仅重植版图层覆盖部分原版细节；当前2×合成仍混有原版裂纹/小石残余，须补残余细节后重建4×。

- `assets/source-art/archive/2026-11-16-pre-library/corrections/achievements97/zuma-candidate-2x.png` [2800, 450]
- `assets/source-art/archive/2026-11-16-pre-library/corrections/achievements97/composition-candidates.json`
- `assets/source-art/archive/2026-11-16-pre-library/replanted/sources-round4/SPR_Achievements_Background_Zuma_Heads_0.png` [285, 303]
- `assets/source-art/archive/2026-11-16-pre-library/replanted/sources-round4/SPR_Achievements_Background_Zuma_Center.png` [821, 776]
- `assets/source-art/archive/2026-11-16-pre-library/replanted/sources-round4/SPR_Achievements_Background_Zuma_Heads_2.png` [358, 312]
- `assets/source-art/archive/2026-11-16-pre-library/replanted/sources-round4/SPR_Achievements_Background_Zuma_Heads_1.png` [321, 354]

## images/challenge_blank

历史覆盖场/几何/渐变处理和原始输入存在，但已登记的成品仅2×；需由原始形状或程序配方直接重建4×。不能把“覆盖场”自动视为纯色，也不能把2×PNG直接放大算完成。

- `assets/source-art/archive/2026-11-16-pre-library/corrections/ui83/challenge_blank-native2x.png` [208, 230]
- `assets/source-art/archive/2026-11-16-pre-library/corrections/ui83/manifest.json`

## images/credits_playbutton

已批准AI母图1275×1233、两遍Anime4K输入和integration.json均存在；缺的是将原配准复现到4×，并非缺AI母图。

- `assets/source-art/archive/2026-11-16-pre-library/ai/credits-play-button62/ai-master.png` [1275, 1233]

## images/flagmeter

历史覆盖场/几何/渐变处理和原始输入存在，但已登记的成品仅2×；需由原始形状或程序配方直接重建4×。不能把“覆盖场”自动视为纯色，也不能把2×PNG直接放大算完成。

- `assets/runtime/images/flagmeter.png` [158, 54]
- `assets/source-art/archive/2026-11-16-pre-library/corrections/ui102/manifest.json`

## images/flagmeterparts

ui102明确记录原生僵尸头、脑旗和各单元位置；杆仍源于旧覆盖场，需生成4×单元合成。

- `assets/source-art/archive/2026-11-16-pre-library/corrections/ui102/flagmeterparts-native2x.png` [150, 50]
- `assets/source-art/archive/2026-11-16-pre-library/corrections/ui102/manifest.json`
- `assets/source-art/archive/2026-11-16-pre-library/replanted/native74/SPR_MainHud_FlagMeter_ZombieHead.png` [88, 87]
- `assets/source-art/archive/2026-11-16-pre-library/replanted/native74/SPR_MainHud_FlagMeter_Flag.png` [77, 80]

## images/landscape_ui/play

历史覆盖场/几何/渐变处理和原始输入存在，但已登记的成品仅2×；需由原始形状或程序配方直接重建4×。不能把“覆盖场”自动视为纯色，也不能把2×PNG直接放大算完成。

- `assets/source-art/archive/2026-11-16-pre-library/corrections/landscape96/play-field2x.png` [202, 108]
- `assets/source-art/archive/2026-11-16-pre-library/corrections/landscape96/manifest.json`

## images/landscape_ui/play_disabled

历史覆盖场/几何/渐变处理和原始输入存在，但已登记的成品仅2×；需由原始形状或程序配方直接重建4×。不能把“覆盖场”自动视为纯色，也不能把2×PNG直接放大算完成。

- `assets/source-art/archive/2026-11-16-pre-library/corrections/landscape96/play_disabled-field2x.png` [202, 108]
- `assets/source-art/archive/2026-11-16-pre-library/corrections/landscape96/manifest.json`

## images/landscape_ui/play_down

历史覆盖场/几何/渐变处理和原始输入存在，但已登记的成品仅2×；需由原始形状或程序配方直接重建4×。不能把“覆盖场”自动视为纯色，也不能把2×PNG直接放大算完成。

- `assets/source-art/archive/2026-11-16-pre-library/corrections/landscape96/play_down-field2x.png` [202, 108]
- `assets/source-art/archive/2026-11-16-pre-library/corrections/landscape96/manifest.json`

## images/pool

现有pool75合成为2×。原生水面及高清地图仍在，可重建4×；此资源仍被Credits背景绘制，战斗PoolEffect也读取其逻辑尺寸，不能因pool_base存在而删除。

- `assets/source-art/archive/2026-11-16-pre-library/corrections/pool75/pool-2x.png` [1440, 318]
- `assets/source-art/archive/2026-11-16-pre-library/corrections/pool75/manifest.json`
- `assets/source-art/archive/2026-11-16-pre-library/replanted/native74/Area3_PoolWater.png` [2044, 496]

## reanim/credits_light_blue

历史覆盖场/几何/渐变处理和原始输入存在，但已登记的成品仅2×；需由原始形状或程序配方直接重建4×。不能把“覆盖场”自动视为纯色，也不能把2×PNG直接放大算完成。

- `assets/source-art/archive/2026-11-16-pre-library/corrections/masks77/credits_light_blue-2x.png` [134, 160]
- `assets/source-art/archive/2026-11-16-pre-library/replanted/reviews/2026-11-15/remaining-queue-except-legs/approval.json`

## reanim/credits_light_yellow

历史覆盖场/几何/渐变处理和原始输入存在，但已登记的成品仅2×；需由原始形状或程序配方直接重建4×。不能把“覆盖场”自动视为纯色，也不能把2×PNG直接放大算完成。

- `assets/source-art/archive/2026-11-16-pre-library/corrections/masks77/credits_light_yellow-2x.png` [200, 260]
- `assets/source-art/archive/2026-11-16-pre-library/replanted/reviews/2026-11-15/remaining-queue-except-legs/approval.json`

## reanim/credits_speaker_overlay

历史覆盖场/几何/渐变处理和原始输入存在，但已登记的成品仅2×；需由原始形状或程序配方直接重建4×。不能把“覆盖场”自动视为纯色，也不能把2×PNG直接放大算完成。

- `assets/source-art/archive/2026-11-16-pre-library/corrections/masks77/credits_speaker_overlay-2x.png` [110, 142]
- `assets/source-art/archive/2026-11-16-pre-library/replanted/reviews/2026-11-15/remaining-queue-except-legs/approval.json`

## reanim/credits_whiteline

历史覆盖场/几何/渐变处理和原始输入存在，但已登记的成品仅2×；需由原始形状或程序配方直接重建4×。不能把“覆盖场”自动视为纯色，也不能把2×PNG直接放大算完成。

- `assets/source-art/archive/2026-11-16-pre-library/corrections/masks77/credits_whiteline-2x.png` [56, 610]
- `assets/source-art/archive/2026-11-16-pre-library/replanted/reviews/2026-11-15/remaining-queue-except-legs/approval.json`

## reanim/splash_1

历史覆盖场/几何/渐变处理和原始输入存在，但已登记的成品仅2×；需由原始形状或程序配方直接重建4×。不能把“覆盖场”自动视为纯色，也不能把2×PNG直接放大算完成。

- `assets/source-art/archive/2026-11-16-pre-library/runtime-inputs/images/splash_1-field92.png` [166, 76]
- `assets/source-art/archive/2026-11-16-pre-library/replanted/reviews/2026-11-15/remaining-queue-except-legs/approval.json`

## images/landscape_ui/selected_packet

历史覆盖场/几何/渐变处理和原始输入存在，但已登记的成品仅2×；需由原始形状或程序配方直接重建4×。不能把“覆盖场”自动视为纯色，也不能把2×PNG直接放大算完成。

- `assets/source-art/archive/2026-11-16-pre-library/corrections/landscape96/selected_packet-field2x.png` [184, 120]
- `assets/source-art/archive/2026-11-16-pre-library/corrections/landscape96/manifest.json`

## images/selectorscreen_levelnumbers

当前是去黑轮廓后的白字2×，修正记录存在。需从字形来源重建4×并继续保留纯白、不加黑边。

- `assets/source-art/archive/2026-11-16-pre-library/corrections/ui-feedback-20261115/selector-levelnumbers-white.png` [240, 34]

## images/landscape_ui/shovel

已有高清Shovel_hi_res，横板铲子为离线旋转45度后配准；需重播合成至4×。

- `assets/source-art/archive/2026-11-16-pre-library/corrections/landscape96/shovel-native2x.png` [156, 60]
- `assets/source-art/archive/2026-11-16-pre-library/corrections/landscape96/manifest.json`
- `assets/source-art/masters/native/images/Shovel_hi_res--47b68468abc622b9.png` [469, 505]

## images/landscape_ui/shovelbank

历史覆盖场/几何/渐变处理和原始输入存在，但已登记的成品仅2×；需由原始形状或程序配方直接重建4×。不能把“覆盖场”自动视为纯色，也不能把2×PNG直接放大算完成。

- `assets/source-art/archive/2026-11-16-pre-library/corrections/landscape96/shovelbank-field2x.png` [168, 82]
- `assets/source-art/archive/2026-11-16-pre-library/corrections/landscape96/manifest.json`

## images/landscape_ui/silhouette

历史覆盖场/几何/渐变处理和原始输入存在，但已登记的成品仅2×；需由原始形状或程序配方直接重建4×。不能把“覆盖场”自动视为纯色，也不能把2×PNG直接放大算完成。

- `assets/source-art/archive/2026-11-16-pre-library/corrections/landscape96/silhouette-field2x.png` [166, 102]
- `assets/source-art/archive/2026-11-16-pre-library/corrections/landscape96/manifest.json`

## images/sod1row

批准的高清白天地图存在；当前2×草坪内部来自地图，毛边颜色/alpha仍取原版。须在4×重建边缘并保留毛草形状，不可直接放大当前2×成品。

- `assets/source-art/archive/2026-11-16-pre-library/corrections/ui115/sod1row-edge-2x.png` [1542, 254]
- `assets/source-art/archive/2026-11-16-pre-library/corrections/sod109/manifest.json`

## images/sod3row

批准的高清白天地图存在；当前2×草坪内部来自地图，毛边颜色/alpha仍取原版。须在4×重建边缘并保留毛草形状，不可直接放大当前2×成品。

- `assets/source-art/archive/2026-11-16-pre-library/corrections/ui115/sod3row-edge-2x.png` [1542, 710]
- `assets/source-art/archive/2026-11-16-pre-library/corrections/sod109/manifest.json`

## images/store_nextbutton

重植版车灯、Anton字体及文字样式/位置均有记录，三态文字烘焙成品仅2×；需直接从原生灯图和TTF重做4×烘焙，保持三态对齐。

- `assets/source-art/archive/2026-11-16-pre-library/corrections/user-audit-20261114/store-next-text-candidate.png` [276, 170]
- `assets/source-art/archive/2026-11-16-pre-library/replanted/store-native-audit/SPR_Store_ButtonNext_EN.png` [458, 283]
- `assets/source-art/archive/2026-11-16-pre-library/replanted/localization-study/fonts/FNT_Anton-Regular.ttf`
- `assets/source-art/archive/2026-11-16-pre-library/corrections/user-audit-20261114/store-button-text-candidates.json`

## images/store_nextbuttondisabled

重植版车灯、Anton字体及文字样式/位置均有记录，三态文字烘焙成品仅2×；需直接从原生灯图和TTF重做4×烘焙，保持三态对齐。

- `assets/source-art/archive/2026-11-16-pre-library/corrections/user-audit-20261114/store-nextdisabled-text-candidate.png` [276, 170]
- `assets/source-art/archive/2026-11-16-pre-library/replanted/store-native-audit/SPR_Store_ButtonNext_Disabled_EN.png` [458, 283]
- `assets/source-art/archive/2026-11-16-pre-library/replanted/localization-study/fonts/FNT_Anton-Regular.ttf`
- `assets/source-art/archive/2026-11-16-pre-library/corrections/user-audit-20261114/store-button-text-candidates.json`

## images/store_nextbuttonhighlight

重植版车灯、Anton字体及文字样式/位置均有记录，三态文字烘焙成品仅2×；需直接从原生灯图和TTF重做4×烘焙，保持三态对齐。

- `assets/source-art/archive/2026-11-16-pre-library/corrections/user-audit-20261114/store-nexthighlight-text-candidate.png` [276, 170]
- `assets/source-art/archive/2026-11-16-pre-library/replanted/store-native-audit/SPR_Store_ButtonNext_Over_EN.png` [458, 283]
- `assets/source-art/archive/2026-11-16-pre-library/replanted/localization-study/fonts/FNT_Anton-Regular.ttf`
- `assets/source-art/archive/2026-11-16-pre-library/corrections/user-audit-20261114/store-button-text-candidates.json`

## images/store_prevbutton

重植版车灯、Anton字体及文字样式/位置均有记录，三态文字烘焙成品仅2×；需直接从原生灯图和TTF重做4×烘焙，保持三态对齐。

- `assets/source-art/archive/2026-11-16-pre-library/corrections/user-audit-20261114/store-prev-text-candidate.png` [196, 154]
- `assets/source-art/archive/2026-11-16-pre-library/replanted/store-native-audit/SPR_Store_ButtonPrev_EN.png` [326, 256]
- `assets/source-art/archive/2026-11-16-pre-library/replanted/localization-study/fonts/FNT_Anton-Regular.ttf`
- `assets/source-art/archive/2026-11-16-pre-library/corrections/user-audit-20261114/store-button-text-candidates.json`

## images/store_prevbuttondisabled

重植版车灯、Anton字体及文字样式/位置均有记录，三态文字烘焙成品仅2×；需直接从原生灯图和TTF重做4×烘焙，保持三态对齐。

- `assets/source-art/archive/2026-11-16-pre-library/corrections/user-audit-20261114/store-prevdisabled-text-candidate.png` [196, 154]
- `assets/source-art/archive/2026-11-16-pre-library/replanted/store-native-audit/SPR_Store_ButtonPrev_Disabled_EN.png` [326, 256]
- `assets/source-art/archive/2026-11-16-pre-library/replanted/localization-study/fonts/FNT_Anton-Regular.ttf`
- `assets/source-art/archive/2026-11-16-pre-library/corrections/user-audit-20261114/store-button-text-candidates.json`

## images/store_prevbuttonhighlight

重植版车灯、Anton字体及文字样式/位置均有记录，三态文字烘焙成品仅2×；需直接从原生灯图和TTF重做4×烘焙，保持三态对齐。

- `assets/source-art/archive/2026-11-16-pre-library/corrections/user-audit-20261114/store-prevhighlight-text-candidate.png` [196, 154]
- `assets/source-art/archive/2026-11-16-pre-library/replanted/store-native-audit/SPR_Store_ButtonPrev_Over_EN.png` [326, 256]
- `assets/source-art/archive/2026-11-16-pre-library/replanted/localization-study/fonts/FNT_Anton-Regular.ttf`
- `assets/source-art/archive/2026-11-16-pre-library/corrections/user-audit-20261114/store-button-text-candidates.json`

## images/store_speechbubble

历史覆盖场/几何/渐变处理和原始输入存在，但已登记的成品仅2×；需由原始形状或程序配方直接重建4×。不能把“覆盖场”自动视为纯色，也不能把2×PNG直接放大算完成。

- `assets/runtime/images/store_speechbubble.png` [280, 183]
- `assets/source-art/archive/2026-11-16-pre-library/corrections/ui102/manifest.json`

## images/store_speechbubble2

历史覆盖场/几何/渐变处理和原始输入存在，但已登记的成品仅2×；需由原始形状或程序配方直接重建4×。不能把“覆盖场”自动视为纯色，也不能把2×PNG直接放大算完成。

- `assets/runtime/images/store_speechbubble2.png` [280, 183]
- `assets/source-art/archive/2026-11-16-pre-library/corrections/ui102/manifest.json`

## images/touch_selection_frame_blue

历史覆盖场/几何/渐变处理和原始输入存在，但已登记的成品仅2×；需由原始形状或程序配方直接重建4×。不能把“覆盖场”自动视为纯色，也不能把2×PNG直接放大算完成。

- `assets/source-art/archive/2026-11-16-pre-library/corrections/ui83/touch_selection_frame_blue-native2x.png` [208, 288]
- `assets/source-art/archive/2026-11-16-pre-library/corrections/ui83/manifest.json`

## images/zombatar_background_blank

大头贴BACKGROUNDS第一个可选背景及180×180画布依据，仍会进入肖像绘制，不等于已经烘焙的编辑器UI。现有仅2×，需重建填色/边缘。

- `assets/runtime/images/zombatar_background_blank.png` [180, 180]
- `assets/source-art/archive/2026-11-16-pre-library/corrections/zombatar89/manifest.json`
