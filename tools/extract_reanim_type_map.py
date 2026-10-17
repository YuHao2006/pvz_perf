#!/usr/bin/env python3
"""Extract the folded-module -> ReanimationType numeric map from game source.

- ConstEnums.h: ReanimationType block (brace-counted; REANIM_NONE = (unsigned int)-1)
- Reanimator.cpp: gLawnReanimationArray entries { ReanimationType::X, "reanim\\N.reanim", flags }
Output: tools/reanim_type_map.txt, "folded numeric" per line + reanim_none sentinel."""
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parent.parent
ce = (ROOT / "pvzPerf/ConstEnums.h").read_text(encoding="utf-8", errors="replace")

start = ce.index("ReanimationType")
start = ce.index("{", start)
depth = 0
end = start
for i in range(start, len(ce)):
    if ce[i] == "{":
        depth += 1
    elif ce[i] == "}":
        depth -= 1
        if depth == 0:
            end = i
            break
block = ce[start + 1:end]
# 块注释必须先剥掉再 split(",")：注释掉的枚举段（如 Zombotany 头部类型）
# 不占编号，否则 (a) 后续类型数值全体偏移，(b) 段尾 "*/" 与下一个真实条目
# 粘连成同一 item，导致该条目（曾为 REANIM_FLAG）从 values 漏键、从 map 漏行。
block = re.sub(r"/\*.*?\*/", "", block, flags=re.S)

values = {}
numeric = 0
for item in block.split(","):
    item = re.sub(r"//[^\n]*", "", item).strip()
    if not item:
        continue
    name = item.split("=")[0].strip()
    rhs = item.split("=", 1)[1].strip() if "=" in item else None
    if rhs is None:
        values[name] = numeric
        numeric += 1
    elif "unsigned int" in rhs:
        numeric = 0xFFFFFFFF
        values[name] = numeric
        numeric += 1
    else:
        numeric = int(rhs, 0)
        values[name] = numeric
        numeric += 1

la = (ROOT / "Sexy.TodLib" / "Reanimator.cpp").read_text(encoding="utf-8", errors="replace")
pairs = []
for m2 in re.finditer(r'\{\s*ReanimationType::(REANIM_\w+)\s*,\s*"reanim\\\\([^"\\]+)\.reanim"', la):
    if m2.group(1) not in values:
        continue  # 非类型条目（占位等）
    pairs.append((m2.group(2).lower(), values[m2.group(1)]))

lines = ["# folded-module numeric  （由 tools/extract_reanim_type_map.py 生成；numeric = ReanimationType 数值）",
         f"reanim_none REANIM_NONE {values['REANIM_NONE']}"]
seen = set()
for stem, val in sorted(pairs):
    if stem in seen:
        continue
    seen.add(stem)
    lines.append(f"{stem} {val}")

out = ROOT / "tools" / "reanim_type_map.txt"
out.write_text("\n".join(lines) + "\n", encoding="utf-8", newline="")
print(f"enum entries: {len(values)}, registry entries: {len(pairs)}, "
      f"REANIM_NONE = {values['REANIM_NONE']:#x}")
