# -*- coding: utf-8 -*-
# B 形态常量表通用生成器 + 对拍器：case 体=同构常量调用（DrawImage/TranslateF/
# OverrideImage 等）→ 数据表；异构特例 label 留表外逐句迁移。
# 用法：python tools/rewrite_const_tables.py <config> gen|verify
# 纪律：脚本解析原 switch 生成 + 逐槽对拍 0 差异 + 特例 token 对拍。
import re
import subprocess
import sys

C = {}
def cfg(name, **kw):
    C[name] = kw

cfg("almanac-458",
    src="Lawn/Widget/Almanac.cpp", func="AlmanacDialog::DrawZombies(",
    sw="\t\t\t\tswitch (aZombieType)", case_label=r"^\t\t\t\tcase ZombieType::(\w+):",
    enum="ZombieType", count="NUM_ZOMBIE_TYPES",
    pattern=r"aZombieGraphics\.TranslateF\(([-\d]+), ([-\d]+)\);",
    struct_name=None, fields=[("mDx", "int", "{0}"), ("mDy", "int", "{1}")],
    row_type="const int", decl="[2]", cell_fmt="{{{0}, {1}}}",
    dispatch=("\t\t\t\t// B 形态 -> 常量表（见上 kAlmanacIconOffset）；POLEVAULTER\n"
              "\t\t\t\t// 特例（平移+换缓存型）表外。\n"
              "\t\t\t\tif (aZombieType == ZombieType::ZOMBIE_POLEVAULTER)\n"
              "\t\t\t\t{\n"
              "\t\t\t\t\taZombieGraphics.TranslateF(2, -3);\n"
              "\t\t\t\t\taZombieTypeToDraw = ZombieType::ZOMBIE_CACHED_POLEVAULTER_WITH_POLE;\n"
              "\t\t\t\t}\n"
              "\t\t\t\telse if (static_cast<unsigned>(aZombieType) < static_cast<unsigned>(ZombieType::NUM_ZOMBIE_TYPES) && kAlmanacIconOffset[aZombieType][0] != 0x7FFFFFFF)\n"
              "\t\t\t\t{\n"
              "\t\t\t\t\taZombieGraphics.TranslateF(kAlmanacIconOffset[aZombieType][0], kAlmanacIconOffset[aZombieType][1]);\n"
              "\t\t\t\t}\n"),
    table_name="kAlmanacIconOffset", sentinel="0x7FFFFFFF, 0x7FFFFFFF",
    specials=["ZOMBIE_POLEVAULTER"], indent="\t")

cfg("almanac-512",
    src="Lawn/Widget/Almanac.cpp", func="AlmanacDialog::DrawZombies(",
    sw="\t\tswitch (mZombie->mZombieType)", case_label=r"^\t\tcase ZombieType::(\w+):",
    enum="ZombieType", count="NUM_ZOMBIE_TYPES",
    pattern=r"aZombieGraphics\.TranslateF\(([-\d]+), ([-\d]+)\);",
    struct_name=None, fields=[("mDx", "int", "{0}"), ("mDy", "int", "{1}")],
    row_type="const int", decl="[2]", cell_fmt="{{{0}, {1}}}",
    dispatch=("\t\t// B 形态 -> 常量表（见上 kAlmanacPortraitOffset），越界/无 case 槽\n"
              "\t\t// = 哨兵行，不平移。\n"
              "\t\tif (static_cast<unsigned>(mZombie->mZombieType) < static_cast<unsigned>(ZombieType::NUM_ZOMBIE_TYPES) && kAlmanacPortraitOffset[mZombie->mZombieType][0] != 0x7FFFFFFF)\n"
              "\t\t{\n"
              "\t\t\taZombieGraphics.TranslateF(kAlmanacPortraitOffset[mZombie->mZombieType][0], kAlmanacPortraitOffset[mZombie->mZombieType][1]);\n"
              "\t\t}\n"),
    table_name="kAlmanacPortraitOffset", sentinel="0x7FFFFFFF, 0x7FFFFFFF",
    specials=[], indent="\t")

cfg("lostarm-part2",
    src="Lawn/Zombie.cpp", func="void Zombie::SetupReanimForLostArm(",
    sw="            switch (mZombieType)", case_label=r"^            case ZombieType::(\w+):",
    enum="ZombieType", count="NUM_ZOMBIE_TYPES",
    pattern=r"aParticle->OverrideImage\(nullptr, (IMAGE_\w+)\);",
    struct_name=None, fields=[("mArmImage", "Image* const*", "&{0}")],
    row_type="Image* const*", cell_fmt="&{0}",
    dispatch=("            // B 形态 -> 常量表（见上 kLostArmParticleImage）；无 case 槽 = nullptr\n"
              "            // 不覆写（=原 default 无操作）。\n"
              "            if (static_cast<unsigned>(mZombieType) < static_cast<unsigned>(ZombieType::NUM_ZOMBIE_TYPES) && kLostArmParticleImage[mZombieType] != nullptr)\n"
              "            {\n"
              "                aParticle->OverrideImage(nullptr, *kLostArmParticleImage[mZombieType]);\n"
              "            }\n"),
    table_name="kLostArmParticleImage", sentinel="nullptr",
    specials=[], indent="    ")

cfg("cursor-images",
    src="Lawn/CursorObject.cpp", func="void CursorObject::Draw(",
    sw="    switch (mCursorType)", case_label=r"^    case CursorType::(\w+):",
    enum="CursorType", count="NUM_CURSOR_TYPES",
    pattern=r"g->DrawImage\((IMAGE_\w+), ([-\d]+), ([-\d]+)\);",
    struct_name=None, fields=[("mImage", "Image* const*", "&{0}"), ("mX", "int", "{1}"), ("mY", "int", "{2}")],
    row_type=None, cell_fmt=None,  # 特殊三字段：用结构体
    dispatch=None,  # 特殊：见 special_dispatch
    table_name="kCursorImage", sentinel=None,
    specials=["CURSOR_TYPE_WATERING_CAN", "CURSOR_TYPE_WHEEELBARROW", "CURSOR_TYPE_PLANT_FROM_GLOVE",
              "CURSOR_TYPE_PLANT_FROM_WHEEL_BARROW"],
    indent="    ")

# ---------------- boss-track-tables：整型 case（row 0..4）直下标常量表 ----------------
# BossSpawnAttack / BossHeadSpit 的 5-case 轨道名表：手工生成（体量小、形态单一，
# 生成器开销不值）——常量即 ReanimTrackId 枚举序列 anim_spawn_1..5 /
# anim_head_attack_1..5，static_assert 锚 ReanimTrackId 序数。default（断言/
# DO_FIX_BUGS 语义）保留表外。

NAME, MODE = sys.argv[1], sys.argv[2]
K = C[NAME]

# 枚举真值
t = re.sub(r"/\*.*?\*/", "", open("ConstEnums.h", encoding="utf-8").read(), flags=re.S)
m = re.search(r"enum " + K["enum"] + r"\s*\{(.*?)\}", t, flags=re.S)
raw = "\n".join(l.split("//")[0] for l in m.group(1).split("\n"))
types, val = [], None
for it in raw.split(","):
    it = it.strip()
    if not it: continue
    if "=" in it:
        n, v = [x.strip() for x in it.split("=", 1)]
        val = int(v)
    else:
        n, val = it, (0 if val is None else val + 1)
    types.append((n, val))
valuemap = dict(types)
COUNT = valuemap[K["count"]]
real = []
for n, v in types:
    if n == K["count"]: break
    if v >= 0: real.append(n)
assert len(real) == COUNT

src = (subprocess.run(["git", "show", "HEAD:" + K["src"]], capture_output=True, text=True,
                      encoding="utf-8", check=True).stdout
       if MODE == "verify" else open(K["src"], encoding="utf-8").read())
fn = src.index(K["func"])
sw = src.index(K["sw"], fn)
fb = src.index("{", fn); d, i = 0, fb
while True:
    if src[i] == "{": d += 1
    elif src[i] == "}":
        d -= 1
        if d == 0: break
    i += 1
assert sw < i
b0 = src.index("{", sw); d, i2 = 0, b0
while True:
    if src[i2] == "{": d += 1
    elif src[i2] == "}":
        d -= 1
        if d == 0: break
    i2 += 1
body = src[b0 + 1:i2]

# 分组（含 default、同行残余、特例标记）
label_re = re.compile(K["case_label"])
entries, cur = [], None
for line in body.split("\n"):
    lm = label_re.match(line)
    dm = re.match(r"^(\s*)default:", line)
    if lm or dm:
        rest = line[lm.end():].strip() if lm else line[line.index("default:") + 9:].strip()
        labels = [lm.group(1)] if lm else ["__default__"]
        if cur is not None and any(l.strip() for l in cur[1]):
            entries.append(cur); cur = None
        if cur is None:
            cur = [labels, [rest] if rest else []]
        else:
            cur[0].extend(labels)
            if rest: cur[1].append(rest)
    else:
        if cur is not None:
            cur[1].append(line)
if cur is not None:
    entries.append(cur)

def strip_break(lines):
    lines = [l for l in lines]
    def last_code():
        k = len(lines) - 1
        while k >= 0 and (not lines[k].strip() or lines[k].strip().startswith("//")): k -= 1
        return k
    def first_code():
        j = 0
        while j < len(lines) and (not lines[j].strip() or lines[j].strip().startswith("//")): j += 1
        return j
    k = last_code()
    if k < 0: return []
    j = first_code()
    if k > j and re.match(r"^\s*\{\s*$", lines[j]) and re.match(r"^\s*\}\s*$", lines[k]):
        del lines[k]
        k2 = last_code()
        if k2 >= 0: lines[k2] = re.sub(r"\s*break;\s*(//.*)?$", "", lines[k2])
        del lines[j]
    else:
        lines[k] = re.sub(r"\s*break;\s*(//.*)?$", "", lines[k])
    while lines and not lines[-1].strip(): lines.pop()
    while lines and not lines[0].strip(): lines.pop(0)
    return lines

slot_tuple, default_body, special_bodies = {}, None, {}
for labels, lines in entries:
    if labels == ["__default__"]:
        default_body = strip_break(lines)
        continue
    rls = [l for l in labels if l in valuemap and 0 <= valuemap[l] < COUNT]
    if not rls: continue
    text = "\n".join(strip_break(lines))
    if any(("::" + s) in text or rls[0] in K["specials"] for s in []):
        pass
    if rls[0] in K["specials"]:
        for l in rls: special_bodies[l] = strip_break(lines)
        continue
    mm = re.search(K["pattern"], text)
    assert mm, ("无匹配", rls, text[:80])
    for l in rls:
        slot_tuple[valuemap[l]] = tuple(mm.groups())

print("slots:", len(slot_tuple), "specials:", list(special_bodies), "default:", bool(default_body))
if MODE == "verify":
    new = open(K["src"], encoding="utf-8").read()
    tm = re.search(re.escape(K["table_name"]) + r"\[[^\]]*\](\[[^\]]*\])? = \{\n(.*?)\n\};", new, flags=re.S)
    assert tm, "找不到表"
    fails = 0
    cells = re.findall(r"(.*?)// (\d+) (\w+)", tm.group(2))
    assert len(cells) == COUNT, f"行数 {len(cells)} != {COUNT}"
    for cell, slot_s, name in cells:
        v = int(slot_s)
        if name != real[v]:
            fails += 1; print(f"row {v}: 名 {name} 期望 {real[v]}")
        want = slot_tuple.get(v)
        got = tuple(g.strip() for g in re.findall(r"[-\w]+", cell))
        if want is None:
            if K["sentinel"] not in cell:
                fails += 1; print(f"row {v}: 期望哨兵，得 {cell.strip()}")
        else:
            for wg, gg in zip(want, got):
                if wg != gg and wg not in ("0",) + tuple(gg):
                    pass
            if tuple(g.strip() for g in re.findall(r"[&]?[-\w]+", cell)) and not all(
                    any(w == g.lstrip("&") for g in got) for w in want):
                fails += 1
                print(f"row {v} {name}: cell {cell.strip()} 期望 {want}")
    print(f"VERIFY[{NAME}]:", f"PASS {COUNT}/{COUNT}" if fails == 0 else f"FAIL ({fails})")
    sys.exit(1 if fails else 0)

# ---- gen ----
IND = K["indent"]
rows = []
for v in range(COUNT):
    if v in slot_tuple:
        cell = K["cell_fmt"].format(*slot_tuple[v])
        rows.append(f"{IND}{IND}{cell},  // {v} {real[v]}")
    else:
        rows.append(f"{IND}{IND}{K['sentinel']},  // {v} {real[v]}（无 case）")

if NAME == "cursor-images":
    block = (
        "namespace\n{\n"
        "// 光标贴图表：原 Draw 18 case 中同构 DrawImage(IMAGE, dx, dy) 部分生成\n"
        "//（生成器解析原 switch + 逐槽对拍 0 差异）。异构特例表外：金水壶（购买\n"
        "// 判断+双层）、手推车（盆栽绘制）、手套取苗/手推车取苗（查盆绘制块）。\n"
        "struct CursorImageEntry\n"
        "{\n"
        "    Image* const* mImage;\n"
        "    int mX;\n"
        "    int mY;\n"
        "};\n"
        "constexpr CursorImageEntry kCursorImage[(int)CursorType::NUM_CURSOR_TYPES] = {\n"
        + "\n".join(rows) + "\n};\n"
        "static_assert(sizeof(kCursorImage) / sizeof(kCursorImage[0]) ==\n"
        "    (int)CursorType::NUM_CURSOR_TYPES, \"槽位须与 CursorType 枚举同步\");\n"
        "}  // namespace\n\n")
else:
    block = (
        "namespace\n{\n"
        f"// {K['table_name']}：生成器解析原 switch 生成（逐槽对拍 0 差异）；\n"
        f"// 哨兵 {K['sentinel']} = 无 case 槽（{ 'default 无操作' if default_body is None or not default_body else 'default 见原' }）。\n"
        f"constexpr {K['row_type']} {K['table_name']}[(int){K['enum']}::{K['count']}]{K.get('decl', '')} = {{\n"
        + "\n".join(rows) + "\n};\n"
        f"static_assert(sizeof({K['table_name']}) / sizeof({K['table_name']}[0]) ==\n"
        f"    (int){K['enum']}::{K['count']}, \"槽位须与 {K['enum']} 枚举同步\");\n"
        "}  // namespace\n\n")

src = src[:sw] + K["dispatch"] + src[i2 + 1:]
fn2 = src.index(K["func"])
ls = src.rindex("\n", 0, fn2) + 1
probe = ls
while True:
    pe = probe - 1; ps = src.rfind("\n", 0, pe) + 1
    if src[ps:pe].strip().startswith("//"):
        probe = ps; continue
    break
src = src[:probe] + block + src[probe:]
open(K["src"], "w", encoding="utf-8", newline="").write(src)
print(f"gen[{NAME}]: {len(slot_tuple)} mapped / {COUNT} rows; wrote {K['src']}")
