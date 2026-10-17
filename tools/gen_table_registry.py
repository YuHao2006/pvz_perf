#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""段表总索引生成器。

扫描 Lawn/Sexy.TodLib/SexyAppFramework 的全部段表（k 前缀数组、函数指针表、
匿名 struct 表——含跨行声明与括号内名字两处历史盲区形态），生成
log/segment-table-registry.md。

门禁：函数内裸 constexpr/const 表（缺 static，MSVC 每调用栈物化——见账本
static 事故节）→ 生成失败，退出码 1。

用法：
  python tools/gen_table_registry.py            # 生成 log/segment-table-registry.md
  python tools/gen_table_registry.py --check    # 只校验门禁，不写文档
"""
import collections
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
DOC_PATH = os.path.join(ROOT, "log", "segment-table-registry.md")
DIRS = ["pvzPerf/Lawn", "pvzPerf/Sexy.TodLib", "pvzPerf/SexyAppFramework"]
SKIP_FILE = re.compile(r"Smoke\.cpp$|Tests?\.cpp$|[Bb]ench|reconstruction")

RE_DECL_START = re.compile(r"^[\t ]*(?:static\s+)?(?:constexpr|const)\b")
RE_NAMED_ARR = re.compile(r"\bk(?P<name>[A-Z][A-Za-z0-9_]*)\s*(?P<dims>(?:\[[^\]]*\]\s*)+)=\s*\{")
RE_FNPTR_ARR = re.compile(r"\(\*k(?P<name>[A-Z][A-Za-z0-9_]*)\s*(?P<dims>(?:\[[^\]]*\]\s*)+)\)")


def opener_context(line, prev_nonempty):
    """'{' 开启的块是什么：ns=命名空间体，fn=函数体/控制块。"""
    text = line.strip()
    ctx = line
    if text == "{":
        ctx = prev_nonempty
    s = ctx.strip()
    if re.search(r"\bnamespace\b", s):
        return "ns"
    return "fn"


def scan_file(path, rel):
    with open(path, "r", encoding="utf-8", errors="replace") as f:
        lines = f.readlines()
    tables = []
    bare = []
    stack = []
    prev_nonempty = ""
    n = len(lines)
    i = 0
    while i < n:
        line = lines[i]
        stripped = line.strip()

        # 先取作用域快照（本行自己的 '{' 不算），再更新块栈
        scope_snap = "fn" if "fn" in stack else "ns"

        for ch_i, ch in enumerate(line):
            if ch == "{":
                stack.append(opener_context(line[:ch_i] if ch_i else line, prev_nonempty))
            elif ch == "}":
                if stack:
                    stack.pop()

        if stripped and stripped not in ("{", "}", "};"):
            prev_nonempty = stripped

        if RE_DECL_START.match(line) and "using" not in line:
            buf_lines = [line]
            j = i
            # 缓冲到 '='+'{'（跨行声明）；未开块时遇行尾 ';' 先止（标量声明），
            # 已开 '{' 的匿名 struct 体字段行带 ';' 不算结束
            while j - i < 16 and not re.search(r"=\s*\{", "".join(buf_lines)):
                if j >= n:
                    break
                cur = lines[j] if j > i else line
                # 未开块：行尾 ';' = 标量声明结束；开块后行尾 '};' = 自闭合
                # lambda/struct 常量结束（勿吞后续真表声明）
                if re.search(r";\s*(//.*)?$", cur) and ("{" not in "".join(buf_lines) or re.search(r"\}\s*;\s*(//.*)?$", cur)):
                    break
                j += 1
                if j < n:
                    buf_lines.append(lines[j])
            buf = "".join(buf_lines)
            m = RE_FNPTR_ARR.search(buf) or RE_NAMED_ARR.search(buf)
            if m:
                name = m.group("name")
                dims = re.sub(r"\s+", " ", m.group("dims").strip())
                head = buf[: m.start()]
                if "(" in m.group(0) and "*" in m.group(0):
                    form = "C·函数指针表"
                elif re.search(r"\bstruct\b", head):
                    form = "B·匿名struct表"
                else:
                    form = "B·数据表"
                is_static = line.lstrip().startswith("static")
                if scope_snap == "ns":
                    storage = "命名空间级"
                elif is_static:
                    storage = "函数内static"
                else:
                    storage = "函数内裸"
                    bare.append((rel, i + 1, name))
                tables.append((rel, i + 1, name, form, dims, storage))
                i = j  # 消费掉整个声明，防止跨行内容被重复当新声明
        i += 1
    return tables, bare


def main():
    check_only = "--check" in sys.argv
    all_tables = []
    all_bare = []
    for d in DIRS:
        base = os.path.join(ROOT, d)
        for dirpath, dirnames, filenames in os.walk(base):
            dirnames[:] = [x for x in dirnames if x != "reconstruction"]
            for fn in sorted(filenames):
                if not fn.endswith(".cpp") or SKIP_FILE.search(fn):
                    continue
                full = os.path.join(dirpath, fn)
                rel = os.path.relpath(full, ROOT).replace("\\", "/")
                t, b = scan_file(full, rel)
                all_tables.extend(t)
                all_bare.extend(b)

    if all_bare:
        print("门禁失败：函数内裸表（缺 static，每调用栈物化）：")
        for rel, ln, name in all_bare:
            print(f"  {rel}:{ln}  k{name}")
        return 1

    if check_only:
        print(f"OK：{len(all_tables)} 张段表，零函数内裸表")
        return 0

    per_file = collections.defaultdict(list)
    for rel, ln, name, form, dims, storage in all_tables:
        per_file[rel].append((ln, name, form, dims, storage))

    out = []
    out.append("# 段表总索引\n")
    out.append("生成：`python tools/gen_table_registry.py`（改动段表后重跑刷新；`--check` 仅校验门禁，适合提交前跑）。")
    out.append("**门禁：函数内裸 constexpr/const 表 = 生成失败**（MSVC 每调用栈物化，见账本 static 事故节）。")
    out.append("命名空间级表已有内部链接无需 static。性能数据一律以 `docs/perf-fix-ledger.md` 统一登记表为准，本索引只记位置/形态/存储/维度。\n")
    ns_count = sum(1 for t in all_tables if t[5] == "命名空间级")
    fn_count = len(all_tables) - ns_count
    out.append(f"合计 {len(all_tables)} 张：命名空间级 {ns_count}，函数内 static {fn_count}。按文件：\n")
    for rel in sorted(per_file):
        rows = per_file[rel]
        out.append(f"## {rel}（{len(rows)}）\n")
        out.append("| 表名 | 行 | 形态 | 维度 | 存储 |")
        out.append("|---|---|---|---|---|")
        for ln, name, form, dims, storage in sorted(rows):
            out.append(f"| k{name} | {ln} | {form} | `{dims}` | {storage} |")
        out.append("")
    os.makedirs(os.path.dirname(DOC_PATH), exist_ok=True)
    with open(DOC_PATH, "w", encoding="utf-8", newline="\n") as f:
        f.write("\n".join(out))
    print(f"生成 {DOC_PATH}：{len(all_tables)} 张段表，零函数内裸表")
    return 0


if __name__ == "__main__":
    sys.exit(main())
