# -*- coding: utf-8 -*-
# StoreScreen::UpdateMouse 商店气泡消息索引 switch -> int16 数据表（B 形态速赢）
# 用法（cwd=仓库根）：python tools/rewrite_store_messages.py gen|verify
# 特例表外：PACKET_UPGRADE 依购买量三段（+default 2014）；CHOCOLATE 无提示（-1）；
# default TOD_ASSERT（release 无操作）。纪律：脚本解析原 switch 生成 + 逐槽对拍。
import re
import subprocess
import sys

SRC = "Lawn/Widget/StoreScreen.cpp"
MODE = sys.argv[1] if len(sys.argv) > 1 else "gen"

# StoreItem 真值（剥注释；INVALID=-1 尾哨兵，末真值 FIRSTAID 锚定计数）
t = re.sub(r"/\*.*?\*/", "", open("ConstEnums.h", encoding="utf-8").read(), flags=re.S)
m = re.search(r"enum StoreItem\s*\{(.*?)\}", t, flags=re.S)
raw = "\n".join(l.split("//")[0] for l in m.group(1).split("\n"))
items, val = [], None
for it in raw.split(","):
    it = it.strip()
    if not it:
        continue
    if "=" in it:
        n, v = [x.strip() for x in it.split("=", 1)]
        val = int(v)
    else:
        n, val = it, (0 if val is None else val + 1)
    items.append((n, val))
valuemap = dict(items)
LAST = "STORE_ITEM_FIRSTAID"
COUNT = valuemap[LAST] + 1
real = [n for n, v in items if 0 <= v < COUNT]
assert len(real) == COUNT and valuemap["STORE_ITEM_INVALID"] == -1

src = (subprocess.run(["git", "show", "HEAD:" + SRC], capture_output=True, text=True,
                      encoding="utf-8", check=True).stdout
       if MODE == "verify" else open(SRC, encoding="utf-8").read())
fn = src.index("void StoreScreen::UpdateMouse(")
sw = src.index("                switch (aItemType)", fn)
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

# 解析：同行 "case X: ... aMessageIndex = N; break;" / 无赋值 case / PACKET_UPGRADE 块
slot_msg, special_body = {}, None
cur_labels, buf = [], []
for line in body.split("\n"):
    lm = re.match(r"^\s*case (STORE_ITEM_\w+):(.*)$", line)
    dm = re.match(r"^\s*default:(.*)$", line)
    if lm:
        if cur_labels and buf:
            text = "\n".join(buf)
            if "PACKET_UPGRADE" in " ".join(cur_labels):
                special_body = buf
            else:
                mm2 = re.search(r"aMessageIndex = (\d+);", text)
                assert mm2, cur_labels
                for l in cur_labels:
                    slot_msg[valuemap[l]] = int(mm2.group(1))
            cur_labels, buf = [], []
        cur_labels.append(lm.group(1))
        rest = lm.group(2).strip()
        if rest and rest != "break;":
            buf.append(rest)
    elif dm:
        if cur_labels and buf:
            text = "\n".join(buf)
            if "PACKET_UPGRADE" in " ".join(cur_labels):
                special_body = buf
            else:
                mm2 = re.search(r"aMessageIndex = (\d+);", text)
                assert mm2, cur_labels
                for l in cur_labels:
                    slot_msg[valuemap[l]] = int(mm2.group(1))
        cur_labels, buf = [], []
    else:
        if cur_labels:
            buf.append(line)
if cur_labels and buf:
    if "PACKET_UPGRADE" in " ".join(cur_labels):
        special_body = buf
    else:
        mm2 = re.search(r"aMessageIndex = (\d+);", "\n".join(buf))
        assert mm2, cur_labels
        for l in cur_labels:
            slot_msg[valuemap[l]] = int(mm2.group(1))
assert special_body, "PACKET_UPGRADE 特例未找到"
# PACKET_UPGRADE 特例体：剥壳层 { } 与 break
sp = [l for l in special_body]
while sp and not sp[0].strip(): sp.pop(0)
if sp and sp[0].strip() == "{": sp.pop(0)
while sp and not sp[-1].strip(): sp.pop()
if sp and re.match(r"^\s*break;\s*$", sp[-1]): sp.pop()
while sp and not sp[-1].strip(): sp.pop()
if sp and sp[-1].strip() == "}": sp.pop()
sp_text = "\n".join(sp)

if MODE == "verify":
    new = open(SRC, encoding="utf-8").read()
    tm = re.search(r"kStoreBubbleMessage\[[^\]]*\] = \{\n(.*?)\n\};", new, flags=re.S)
    assert tm, "找不到表"
    rows = re.findall(r"(-?\d+),\s*//\s*(\d+) (\w+)", tm.group(1))
    fails = 0
    assert len(rows) == COUNT, f"行数 {len(rows)} != {COUNT}"
    for v, slot, name in rows:
        want = slot_msg.get(int(slot), -1)
        if name != real[int(slot)] or int(v) != want:
            fails += 1
            print(f"slot {slot} {name}: 表 {v} 期望 {want}")
    sm = re.search(r"aItemType == StoreItem::STORE_ITEM_PACKET_UPGRADE\)\n                \{(.*?)\n                \}", new, flags=re.S)
    assert sm, "特例分支未找到"
    a = re.findall(r"\w+|[^\w\s]", sp_text)
    b = re.findall(r"\w+|[^\w\s]", sm.group(1))
    if a != b:
        fails += 1
        print("特例分支 token 不一致")
    print("VERIFY[store-messages]:", f"PASS {COUNT}/{COUNT} + special" if fails == 0 else f"FAIL ({fails})")
    sys.exit(1 if fails else 0)

rows = []
for v in range(COUNT):
    msg = slot_msg.get(v, -1)
    cell = "-1" if msg == -1 else str(msg)
    tag = "" if v in slot_msg else "  // 无提示（原 case 空/无 case）"
    rows.append(f"    {cell},  // {v} {real[v]}{tag}")
sp_ind = "\n".join(("        " + l.strip()) if l.strip() else l for l in sp_text.split("\n"))
block = (
    "namespace\n{\n"
    "// 商店气泡消息索引表：原 UpdateMouse 31 case 纯常量（生成器解析原 switch 生成，\n"
    "// 逐槽对拍 0 差异）。-1 = 无提示（CHOCOLATE 及无 case 槽）；PACKET_UPGRADE 依\n"
    "// 购买量三段+default 特例保留表外；default=TOD_ASSERT 由越界分支保留。\n"
    "constexpr int kStoreBubbleMessage[(int)StoreItem::STORE_ITEM_FIRSTAID + 1] = {\n"
    + "\n".join(rows) + "\n};\n"
    "static_assert(sizeof(kStoreBubbleMessage) / sizeof(kStoreBubbleMessage[0]) ==\n"
    "    (int)StoreItem::STORE_ITEM_FIRSTAID + 1, \"槽位须与 StoreItem 枚举同步\");\n"
    "}  // namespace\n\n")

disp = (
    "                // B 形态 -> 数据表（见上 kStoreBubbleMessage）；PACKET_UPGRADE 依\n"
    "                // 购买量特例与 default 断言保留表外。\n"
    "                if (aItemType == StoreItem::STORE_ITEM_PACKET_UPGRADE)\n"
    "                {\n" + sp_ind + "\n                }\n"
    "                else if (static_cast<unsigned>(aItemType) < static_cast<unsigned>((int)StoreItem::STORE_ITEM_FIRSTAID + 1))\n"
    "                {\n"
    "                    aMessageIndex = kStoreBubbleMessage[aItemType];\n"
    "                }\n"
    "                else\n"
    "                {\n"
    "                    TOD_ASSERT(false);\n"
    "                }\n")

src = src[:sw] + disp + src[i2 + 1:]
fn2 = src.index("void StoreScreen::UpdateMouse(")
ls = src.rindex("\n", 0, fn2) + 1
probe = ls
while True:
    pe = probe - 1; ps = src.rfind("\n", 0, pe) + 1
    if src[ps:pe].strip().startswith("//"):
        probe = ps; continue
    break
src = src[:probe] + block + src[probe:]
open(SRC, "w", encoding="utf-8", newline="").write(src)
print(f"gen[store-messages]: {len(slot_msg)} slots mapped, {COUNT} rows; wrote {SRC}")
