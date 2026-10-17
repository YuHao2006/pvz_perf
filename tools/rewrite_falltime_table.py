# -*- coding: utf-8 -*-
# UpdateDeath 落体时刻稠密 switch -> float 数据表（-1=无落体物理，0=依播放动画
# 三选一组表外，其余=常量）。用法（cwd=仓库根）：
#   python tools/rewrite_falltime_table.py gen|verify
# 纪律：表由脚本从原 switch 解析生成；程序化对拍（表值逐型 + 动画组块 token）0 差异。
import re
import subprocess
import sys

SRC = "Lawn/Zombie.cpp"
ORIG_REF = "2cc9756a"
MODE = sys.argv[1] if len(sys.argv) > 1 else "gen"

# ---- ZombieType 真值（剥块注释+行注释） ----
t = open("ConstEnums.h", encoding="utf-8").read()
t = re.sub(r"/\*.*?\*/", "", t, flags=re.S)
m = re.search(r"enum ZombieType\s*\{(.*?)\}", t, flags=re.S)
raw = "\n".join(line.split("//")[0] for line in m.group(1).split("\n"))
types, value = [], -1
for item in raw.split(","):
    item = item.strip()
    if not item:
        continue
    if "=" in item:
        n, v = [x.strip() for x in item.split("=", 1)]
        value = int(v)
    else:
        n = item
        value += 1
    types.append((n, value))
valuemap = dict(types)
COUNT = valuemap["NUM_ZOMBIE_TYPES"]
real = []
for n, v in types:
    if n == "NUM_ZOMBIE_TYPES":
        break
    if v >= 0:
        real.append(n)
assert len(real) == COUNT

src = (subprocess.run(["git", "show", ORIG_REF + ":" + SRC], capture_output=True,
                      text=True, encoding="utf-8", check=True).stdout
       if MODE == "verify" else open(SRC, encoding="utf-8").read())
fn = src.index("void Zombie::UpdateDeath()")
sw = src.index("        switch (mZombieType)", fn)
fn_brace = src.index("{", fn)
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
assert sw < fn_end, "switch 锚点不在函数体内——检查目标函数是否已被转换/锚文本是否唯一"
b0 = src.index("{", sw)
d, i = 0, b0
while True:
    if src[i] == "{":
        d += 1
    elif src[i] == "}":
        d -= 1
        if d == 0:
            break
    i += 1
sw_end = i
body = src[b0 + 1 : sw_end]

# ---- 分组（8 空格缩进的 case 标签） ----
groups, cur_labels, cur_lines = [], [], []
for line in body.split("\n"):
    lm = re.match(r"^        case ZombieType::(\w+):", line)
    dm = re.match(r"^        default:", line)
    if lm or dm:
        if cur_labels and any(l.strip() for l in cur_lines):
            groups.append((cur_labels, cur_lines))
            cur_labels, cur_lines = [], []
        if lm:
            cur_labels.append(lm.group(1))
    else:
        if cur_labels:
            cur_lines.append(line)
if cur_labels and any(l.strip() for l in cur_lines):
    groups.append((cur_labels, cur_lines))

def strip_break(lines):
    lines = list(lines)
    while lines and not lines[-1].strip():
        lines.pop()
    if lines:
        lines[-1] = re.sub(r"\s*break;\s*(//.*)?$", "", lines[-1])
    while lines and not lines[-1].strip():
        lines.pop()
    return lines

groups = [(ls, strip_break(b)) for ls, b in groups if ls]
slot_value, anim_body = {}, None
for ls, b in groups:
    text = "\n".join(b)
    is_anim = "IsAnimPlaying" in text
    const = None if is_anim else re.search(r"aFallTime = (-?[\d.]+)f?;", text)
    for l in ls:
        if l == "default":
            continue
        if is_anim:
            slot_value[valuemap[l]] = "ANIM"
            anim_body = b
        else:
            assert const, (l, text[:80])
            slot_value[valuemap[l]] = const.group(1)
assert anim_body is not None, "未找到依动画组"
default_group = [b for ls, b in groups if "default" in ls]
default_value = (re.search(r"aFallTime = (-?[\d.]+)f?;", "\n".join(default_group[0])).group(1)
                 if default_group else "-1.0")
for v in range(COUNT):
    if v not in slot_value:
        slot_value[v] = default_value

# ---- 动画组体（供表外逐句迁移） ----
anim_text = "\n".join(anim_body)

# ---- verify：表值逐型 + 动画组 token ----
if MODE == "verify":
    new = open(SRC, encoding="utf-8").read()
    tm = re.search(r"kZombieFallTime\[[^\]]*\] = \{\n(.*?)\n\};", new, flags=re.S)
    assert tm, "找不到表"
    fails = 0
    rows = re.findall(r"(kFallTimeNone|kFallTimeByAnim|-?[\d.]+f),\s*//\s*(\d+ )?(\w+)", tm.group(1))
    got = {}
    for val, _, name in rows:
        got[name] = {"kFallTimeNone": "-1.0", "kFallTimeByAnim": "ANIM"}.get(val, val.rstrip("f"))
    for v, name in enumerate(real):
        want = slot_value[v].rstrip("f") if slot_value[v] != "ANIM" else "ANIM"
        if got.get(name) != want:
            fails += 1
            print(f"slot {v} {name}: 表值 {got.get(name)} 期望 {want}")
    # 动画组块 token 对拍（表外块 = 原组体逐句）
    bm = re.search(r"if \(aFallTime == kFallTimeByAnim\)\n        \{(.*?)\n        \}", new, flags=re.S)
    assert bm, "找不到表外动画组块"
    a = re.findall(r"\w+|[^\w\s]", anim_text)
    b = re.findall(r"\w+|[^\w\s]", bm.group(1))
    if a != b:
        fails += 1
        print("动画组块 token 不一致")
    print("VERIFY[falltime]:",
          f"PASS {COUNT}/{COUNT} values + anim block" if fails == 0 else f"FAIL ({fails})")
    sys.exit(1 if fails else 0)

# ---- gen ----
rows = []
for v, name in enumerate(real):
    val = slot_value[v]
    cell = {"-1.0": "kFallTimeNone", "ANIM": "kFallTimeByAnim"}.get(val, val if val.endswith("f") else val + "f")
    rows.append(f"    {cell},  // {v} {name}")

anim_indented = "\n".join(anim_body)  # 原 12 空格基线恰好落位于表外 if（8）之内，逐字嵌入
block = (
    "namespace\n{\n"
    "// UpdateDeath 落体时刻表：-1=无落体物理（原首组/default），0=依播放动画\n"
    "// 三选一（原普通头组，逻辑在表外），其余=每型常量。生成器解析原 switch 生成，\n"
    "// 表值逐型 + 动画组块 token 对拍 0 差异（tools/rewrite_falltime_table.py）。\n"
    "constexpr float kFallTimeNone = -1.0f;\n"
    "constexpr float kFallTimeByAnim = 0.0f;\n"
    "constexpr float kZombieFallTime[(int)ZombieType::NUM_ZOMBIE_TYPES] = {\n"
    + "\n".join(rows) + "\n};\n}  // namespace\n\n")

disp = (
    "        // C 形态内嵌稠密 switch -> float 数据表（见上方 kZombieFallTime）：\n"
    "        // 哨兵 kFallTimeNone/kFallTimeByAnim 之外即每型常量；依动画三选一\n"
    "        // 组（表外）逐句保留。\n"
    "        float aFallTime = kFallTimeNone;\n"
    "        const unsigned aTypeIndex = static_cast<unsigned>(mZombieType);\n"
    "        if (aTypeIndex < static_cast<unsigned>(ZombieType::NUM_ZOMBIE_TYPES))\n"
    "        {\n"
    "            aFallTime = kZombieFallTime[aTypeIndex];\n"
    "        }\n"
    "        if (aFallTime == kFallTimeByAnim)\n"
    "        {\n" + anim_indented + "\n        }\n")

# 原 "float aFallTime;" 声明行随 switch 一并替换（分发内改为哨兵初始化）
decl = src.rfind("float aFallTime;", 0, sw)
assert decl != -1 and sw - decl < 40, "找不到紧邻的 aFallTime 声明行"
src = src[:decl] + disp + src[sw_end + 1:]
fn2 = src.index("void Zombie::UpdateDeath()")
line_start = src.rindex("\n", 0, fn2) + 1
probe = line_start
while True:
    prev_end = probe - 1
    prev_start = src.rfind("\n", 0, prev_end) + 1
    if src[prev_start:prev_end].strip().startswith("//"):
        probe = prev_start
        continue
    break
src = src[:probe] + block + src[probe:]
open(SRC, "w", encoding="utf-8", newline="").write(src)
print(f"gen[falltime]: {len(groups)} groups -> table + anim block; wrote {SRC}")
