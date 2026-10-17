# -*- coding: utf-8 -*-
# ZombieInitialize C 形态 switch -> 34 槽匿名 lambda 函数指针表（回调/续体形态）
# 用法（cwd=仓库根）：
#   先把 ZombieInitialize 连同其 namespace 块恢复为原版（git show 73d93be5^）
#   python tools/rewrite_zombie_init_table.py gen|verify|dump
# 形态（2026-10-02 用户裁决，取代 mEarlyExit 标志）：尾部公共逻辑具名化
# （ZombieInitializeTail）；尾部固定，各槽位结尾直呼具名函数，无需回调传参；
# case 内 return 原样保留（不调即跳过尾部=原语义）。
# 共体槽位具名；哨兵落表外守卫=原 default 无操作，但尾部仍须执行（else 直调）。
# 纪律：槽位体/尾部体均由生成器逐句迁移，逆变换 token 级对拍 0 差异才许提交。
import re
import subprocess
import sys

SRC = "Lawn/Zombie.cpp"
ORIG_REF = "73d93be5^"   # 原版 switch + 原版尾部的基线
MODE = sys.argv[1] if len(sys.argv) > 1 else "gen"

# ---------- 1. ZombieType 枚举真值（剥块注释+行注释） ----------
enum_txt = open("ConstEnums.h", encoding="utf-8").read()
enum_txt = re.sub(r"/\*.*?\*/", "", enum_txt, flags=re.S)
m = re.search(r"enum ZombieType\s*\{(.*?)\}", enum_txt, flags=re.S)
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
assert valuemap["ZOMBIE_NORMAL"] == 0 and valuemap["NUM_ZOMBIE_TYPES"] == 34
real = []
for n, v in types:
    if n == "NUM_ZOMBIE_TYPES":
        break
    if v >= 0:
        real.append(n)
assert len(real) == 34

# ---------- 2. 原文（verify 取基线；gen 取工作区，须为原版 switch） ----------
src = (subprocess.run(["git", "show", ORIG_REF + ":" + SRC], capture_output=True,
                      text=True, encoding="utf-8", check=True).stdout
       if MODE == "verify" else open(SRC, encoding="utf-8").read())
fn_start = src.index("void Zombie::ZombieInitialize(")
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
sw_start = src.index("    switch (theType)", fn_start)
assert sw_start < fn_end, "switch 锚点不在函数体内"
sw_brace = src.index("{", sw_start)
d, i = 0, sw_brace
while True:
    if src[i] == "{":
        d += 1
    elif src[i] == "}":
        d -= 1
        if d == 0:
            break
    i += 1
sw_end = i
body = src[sw_brace + 1 : sw_end]
tail_src = src[sw_end + 1 : fn_end]          # 原版尾部公共逻辑（switch 后至函数尾）

FREE_CALLS = {"AttachReanim", "M", "Rand", "RandRangeFloat", "RandRangeInt", "Rect",
              "TOD_ASSERT", "TodScaleRotateTransformMatrix"}
KEYWORDS = {"if", "switch", "while", "for", "return", "sizeof"}
member_calls = {n for n in re.findall(r"(?<![.\w>:])\b([A-Za-z_]\w*)\s*\(", body + tail_src)
                } - FREE_CALLS - KEYWORDS

# ---------- 3. 分组 ----------
groups, cur_labels, cur_lines = [], [], []
for line in body.split("\n"):
    lm = re.match(r"^    case ZombieType::(\w+):", line)
    if lm:
        if cur_labels and any(l.strip() for l in cur_lines):
            groups.append((cur_labels, cur_lines))
            cur_labels, cur_lines = [], []
        cur_labels.append(lm.group(1))
    else:
        if cur_labels:
            cur_lines.append(line)
if cur_labels and any(l.strip() for l in cur_lines):
    groups.append((cur_labels, cur_lines))

def strip_break(lines):
    # 移植 rewrite_dense_switch.py 最终版：先跳尾部空行/注释找真末语句，
    # 仅当首尾代码行恰是孤立 { } 对（case 级作用域）才成对剥——if/else 块的
    # 右括号绝不可误伤（POLEVAULTER 事故：先剥行尾 break 再判作用域会误吞 else-}）
    lines = [l for l in lines]
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
        del lines[k]
        k2 = last_code()
        if k2 >= 0:
            lines[k2] = re.sub(r"\s*break;\s*(//.*)?$", "", lines[k2])
        del lines[j]
    else:
        lines[k] = re.sub(r"\s*break;\s*(//.*)?$", "", lines[k])
    while lines and not lines[-1].strip():
        lines.pop()
    while lines and not lines[0].strip():
        lines.pop(0)
    return lines

def real_labels(ls):
    return [l for l in ls if l in valuemap and 0 <= valuemap[l] < 34]
groups = [(ls, strip_break(b)) for ls, b in groups if real_labels(ls)]
slot_to_group = {}
for gi, (ls, b) in enumerate(groups):
    for l in real_labels(ls):
        slot_to_group[valuemap[l]] = gi
assert sorted(slot_to_group) == list(range(34)), "34 槽缺口"

if MODE == "dump":
    for gi, (ls, b) in enumerate(groups):
        print(gi, ls, "->", len(b), "lines")
    print("tail:", len(tail_src.split("\n")), "lines; member calls:", sorted(member_calls))
    sys.exit(0)

# ---------- 4. 变换 ----------
REPLACES = [("aZombieDef.mReanimationType", "lc.mBodyReanimType"),
            ("aRenderLayer", "lc.mRenderLayer"),
            ("aRenderOffset", "lc.mRenderOffset"),
            ("theParentZombie", "lc.mParentZombie"),
            ("theFromWave", "lc.mFromWave")]

def to_free(text):
    t = text
    for old, new in REPLACES:
        t = t.replace(old, new)
    t = re.sub(r"(?<![.\w>])m([A-Z]\w*)", r"z.m\1", t)
    for meth in sorted(member_calls, key=len, reverse=True):
        t = re.sub(r"(?<![.\w>:])\b" + re.escape(meth) + r"\s*\(", "z." + meth + "(", t)
    t = re.sub(r"(?<![\w.])this\b", "&z", t)
    return t   # case 内 return 原样保留（回调形态：不调 tail 即跳过尾部）

def to_member(free_text):
    t = free_text
    # 顺序敏感：先剥 z.mXxx/z.Method，再做 &z→this——否则 "&z.mApp"（取地址）
    # 会被误当 this 逆变换（ZOMBATAR ApplyZombatarHead 首差实证）
    t = re.sub(r"z\.m([A-Z]\w*)", r"m\1", t)
    for meth in sorted(member_calls, key=len, reverse=True):
        t = t.replace("z." + meth + "(", meth + "(")
    t = t.replace("&z", "this")
    for old, new in REPLACES:
        t = t.replace(new, old)
    return t

def tokens(t):
    return re.findall(r"\w+|[^\w\s]", t)

def group_name(gi):
    return "ZombieInit" + real_labels(groups[gi][0])[0][len("ZOMBIE_"):].title().replace("_", "")

def strip_tail_call(text):
    return re.sub(r"\n\s*ZombieInitializeTail\(z, lc\);\s*$", "", text)

# ---------- 5a. verify ----------
if MODE == "verify":
    new_src = open(SRC, encoding="utf-8").read()
    tbl_m = re.search(
        r"kZombieInitCases\[\(int\)ZombieType::NUM_ZOMBIE_TYPES\] = \{\n(.*?)\n\};",
        new_src, flags=re.S)
    assert tbl_m, "找不到分发表"
    tbl = tbl_m.group(1)
    LAM = r"\[\]\(Zombie& z, ZombieInitLocals& lc\)"
    rows, pos = [], 0
    while True:
        m_ref = re.compile(r"&(\w+),\s*//\s*(\d+) (\w+)").search(tbl, pos)
        m_lam = re.compile(LAM + r"\n    \{").search(tbl, pos)
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
            tail_m = re.match(r",?\s*//\s*(\d+) (\w+)", tbl[j + 1 :])
            assert tail_m, "lambda 行尾注释缺失"
            rows.append((int(tail_m.group(1)), tail_m.group(2), "lambda", rowbody))
            pos = j + 1 + tail_m.end()
        else:
            rows.append((int(m_ref.group(2)), m_ref.group(3), m_ref.group(1), None))
            pos = m_ref.end()
    assert len(rows) == 34, f"表行数 {len(rows)}"
    fails = 0
    for slot, name, kind, rowbody in rows:
        if slot >= 34 or name != real[slot]:
            fails += 1
            print(f"row {slot}: 名 {name} 期望 {real[slot] if slot < 34 else 'OOB'}")
            continue
        fn_body = rowbody
        if kind != "lambda":
            fm = re.search(re.escape(kind) + r"\(Zombie& z, ZombieInitLocals& lc\)\n\{(.*?)\n\}",
                           new_src, flags=re.S)
            assert fm, f"共体函数 {kind} 缺失"
            fn_body = fm.group(1)
        a = tokens("\n".join(groups[slot_to_group[slot]][1]))
        b = tokens(to_member(strip_tail_call(fn_body)))
        if a != b:
            fails += 1
            print(f"row {slot} {name} ({kind}): TOKEN MISMATCH")
    # 尾部函数对拍：原版 switch 后代码 vs ZombieInitializeTail 体
    tf = re.search(r"void ZombieInitializeTail\(Zombie& z, ZombieInitLocals& lc\)\n\{(.*?)\n\}",
                   new_src, flags=re.S)
    assert tf, "找不到 ZombieInitializeTail"
    a = tokens(tail_src)
    b = tokens(to_member(tf.group(1)))
    if a != b:
        fails += 1
        print("TAIL TOKEN MISMATCH")
        for k in range(min(len(a), len(b))):
            if a[k] != b[k]:
                print("  first diff at", k, a[k:k+8], "vs", b[k:k+8])
                break
        else:
            print("  length", len(a), "vs", len(b))
    print("VERIFY:", "PASS 34/34 rows + tail" if fails == 0 else f"FAIL ({fails})")
    sys.exit(1 if fails else 0)

# ---------- 5b. gen ----------
shared = {gi for gi in range(len(groups)) if len(real_labels(groups[gi][0])) > 1}
TAIL_CALL = "            ZombieInitializeTail(z, lc);"
funcs = []
tail_free = to_free(tail_src)
tail_ind = "\n".join(("    " + l) if l.strip() else l for l in tail_free.split("\n"))
funcs.append(
    "// 尾部公共逻辑（原 switch 后至函数尾逐句迁移）：各槽位结尾直呼——尾部固定，\n"
    "// 无需回调传参；case 内 return 原样保留——不调即跳过尾部（=原 return 跳过\n"
    "// 的同一段）；哨兵/越界由分发点 else 直调。置于共体函数与表之前（引用者\n"
    "// 须后置）。\n"
    f"void ZombieInitializeTail(Zombie& z, ZombieInitLocals& lc)\n{{\n{tail_ind}\n}}")
for gi in sorted(shared):
    free = to_free("\n".join(groups[gi][1]))
    ind = "\n".join(("    " + l) if l.strip() else l for l in free.split("\n"))
    funcs.append(
        f"// 标签共体（匿名 lambda 无法跨槽复用，复用即具名）\n"
        f"// 原 case {', '.join(real_labels(groups[gi][0]))}\n"
        f"void {group_name(gi)}(Zombie& z, ZombieInitLocals& lc)\n"
        f"{{\n{ind}\n{TAIL_CALL}\n}}")

table_rows = []
for slot in range(34):
    gi = slot_to_group[slot]
    if gi in shared:
        table_rows.append(f"    &{group_name(gi)},  // {slot} {real[slot]}（共体）")
        continue
    free = to_free("\n".join(groups[gi][1]))
    ind = "\n".join(("    " + l) if l.strip() else l for l in free.split("\n"))
    table_rows.append(
        f"    // 原 case {real_labels(groups[gi][0])[0]}\n"
        f"    [](Zombie& z, ZombieInitLocals& lc)\n    {{\n{ind}\n{TAIL_CALL}\n    }},  // {slot} {real[slot]}")

anchor = (
    "static_assert(sizeof(kZombieInitCases) / sizeof(kZombieInitCases[0]) ==\n"
    "    (int)ZombieType::NUM_ZOMBIE_TYPES, \"ZombieInitialize 分发表槽位数须与 ZombieType 枚举同步\");\n"
    "static_assert(kZombieInitCases[(int)ZombieType::ZOMBIE_NORMAL] == &ZombieInitNormal &&\n"
    "    kZombieInitCases[(int)ZombieType::ZOMBIE_DUCKY_TUBE] == &ZombieInitNormal &&\n"
    "    kZombieInitCases[(int)ZombieType::ZOMBIE_GARGANTUAR] == &ZombieInitGargantuar &&\n"
    "    kZombieInitCases[(int)ZombieType::ZOMBIE_REDEYE_GARGANTUAR] == &ZombieInitGargantuar,\n"
    "    \"共体槽位锚点错位（匿名槽由生成器 token 对拍覆盖）\");")

block = (
    "namespace\n{\n"
    "// ZombieInitialize 槽位上下文：switch 外提局部（aRenderLayer/aRenderOffset）\n"
    "// 与跨段参数（定义动画型、父僵尸、来波号）经此传递。表内匿名 lambda = 原\n"
    "// case 体逐句迁移（生成器 + 逆变换 token 对拍 0 差异），1073 地址注释随体\n"
    "// 保留。尾部公共逻辑具名化（ZombieInitializeTail），各槽位结尾直呼（尾部固定\n"
    "// 无需回调传参）——return 原样即跳过直呼，BUNGEE 选靶自毙语义零改写。\n"
    "struct ZombieInitLocals\n{\n"
    "    RenderLayer mRenderLayer;\n"
    "    int mRenderOffset;\n"
    "    ReanimationType mBodyReanimType;\n"
    "    Zombie* mParentZombie;\n"
    "    int mFromWave;\n"
    "};\n"
    "using ZombieInitCaseFn = void (*)(Zombie&, ZombieInitLocals&);\n\n"
    + "\n\n".join(funcs) + "\n\n"
    "// 匿名 lambda 函数指针表，行序 = ZombieType 枚举值序（0..33）；\n"
    "// 哨兵（CACHED/NUM/INVALID）在表外，由分发守卫拦下 = 原 default 无操作，\n"
    "// 尾部仍由 else 分支直调。\n"
    "constexpr ZombieInitCaseFn kZombieInitCases[(int)ZombieType::NUM_ZOMBIE_TYPES] = {\n"
    + "\n".join(table_rows) + "\n};\n" + anchor + "\n}  // namespace\n\n")

disp = (
    "    // C 形态 -> 匿名 lambda 表（固定尾部直呼形态）：尾部公共逻辑具名化，\n"
    "    // 各槽位结尾直呼 ZombieInitializeTail；case 内 return 原样即跳过尾部；\n"
    "    // 越界哨兵走 else 直调（原 default 无操作后尾部照跑）。\n"
    "    ZombieInitLocals aInitLocals{RenderLayer::RENDER_LAYER_ZOMBIE, 4,\n"
    "        aZombieDef.mReanimationType, theParentZombie, theFromWave};\n"
    "    const unsigned aTypeIndex = static_cast<unsigned>(theType);\n"
    "    if (aTypeIndex < static_cast<unsigned>(ZombieType::NUM_ZOMBIE_TYPES))\n"
    "    {\n"
        "        kZombieInitCases[aTypeIndex](*this, aInitLocals);\n"
    "    }\n"
    "    else\n"
    "    {\n"
    "        ZombieInitializeTail(*this, aInitLocals);\n"
    "    }\n"
    "}\n"
)

# 替换 1：switch+原尾部 -> 分发（尾部已迁入 ZombieInitializeTail）
src = src[:sw_start] + disp + src[fn_end + 1 :]
# 替换 2：去掉两个外提局部声明（已入 aInitLocals）
src = src.replace(
    "    const ZombieDefinition& aZombieDef = GetZombieDefinition(mZombieType);\n"
    "    RenderLayer aRenderLayer = RenderLayer::RENDER_LAYER_ZOMBIE;\n"
    "    int aRenderOffset = 4;\n",
    "    const ZombieDefinition& aZombieDef = GetZombieDefinition(mZombieType);\n",
    1,
)
# 替换 3：namespace 块插入（跳过紧邻 1073 地址注释行）
fn_start2 = src.index("void Zombie::ZombieInitialize(")
line_start = src.rindex("\n", 0, fn_start2) + 1
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
print(f"generated: {len(groups)} case bodies + tail callback, 34 slots; wrote {SRC}")
