"""Reproduce v4 reanimation/particle/direct-C++ texture intersections from Git blobs."""
from __future__ import annotations

import argparse
from collections import defaultdict
import json
from pathlib import Path, PurePosixPath
import re
import struct
import subprocess

ROOT = Path(__file__).resolve().parents[1]
TOKENS = re.compile(
    r'R"(?P<d>[^ ()\\\t\r\n]{0,16})\(.*?\)(?P=d)"'
    r'|"(?:\\.|[^"\\])*"|\'(?:\\.|[^\'\\])*\'|//[^\n]*|/\*.*?\*/', re.S)
IMAGE = re.compile(r'\b(?:IMAGE_|FONT_IMAGE_)\w+')
DSL_IMAGE = re.compile(r'\bimage\s*:\s*(?:"((?:IMAGE_|FONT_IMAGE_)\w+)"|((?:IMAGE_|FONT_IMAGE_)\w+))')
FIXTURES = {"artchallengeplant", "circleevenspacing", "kernelsplat",
            "perftest", "seedpacketpickup", "simpleparticle"}


def git(*args: str) -> bytes:
    return subprocess.check_output(["git", *args], cwd=ROOT)


def blank_tokens(text: str, strings: bool = False) -> str:
    return TOKENS.sub(lambda match: re.sub(r"[^\n]", " ", match[0])
                     if strings or match[0].startswith(("//", "/*")) else match[0], text)


def snapshot(ref: str) -> tuple[str, dict[str, bytes]]:
    commit = git("rev-parse", ref).decode().strip()
    selected = []
    for entry in git("ls-tree", "-r", "-z", commit, "--", "pvzPerf",
                     "assets/definitions", "tools/reanim_type_map.txt").split(b"\0"):
        if not entry:
            continue
        metadata, raw_path = entry.split(b"\t", 1)
        path = raw_path.decode()
        suffix = PurePosixPath(path).suffix
        if suffix in {".cpp", ".h", ".hpp", ".inl", ".dsl"} or path.endswith(
                ("image_symbol_ids.bin", "resources.json", "reanim_type_map.txt")):
            selected.append((path, metadata.split()[2]))
    batch = subprocess.run(["git", "cat-file", "--batch"], cwd=ROOT,
                           input=b"".join(sha + b"\n" for _, sha in selected),
                           stdout=subprocess.PIPE, check=True).stdout
    files, offset = {}, 0
    for path, _ in selected:
        end = batch.index(b"\n", offset)
        size = int(batch[offset:end].split()[2])
        files[path] = batch[end + 1:end + 1 + size]
        offset = end + size + 2
    assert offset == len(batch)
    return commit, files


def audit(ref: str) -> dict:
    commit, files = snapshot(ref)
    sidecar = files["pvzPerf/Sexy.TodLib/generated/image_symbol_ids.bin"]
    magic, count = struct.unpack_from("<II", sidecar)
    assert magic == 0x4953594D
    symbols, offset = {}, 8
    for expected in range(1, count + 1):
        symbol, length = struct.unpack_from("<II", sidecar, offset)
        offset += 8
        assert symbol == expected
        symbols[symbol] = sidecar[offset:offset + length].decode()
        offset += length
    assert offset == len(sidecar)
    ids = {name: symbol for symbol, name in symbols.items()}
    enum = files["pvzPerf/Sexy.TodLib/generated/ImageSymbolId.h"].decode("utf-8-sig")
    aliases = {name: symbols[int(number)] for name, number in re.findall(
        r"^\s*(\w+)\s*=\s*(\d+),", enum, re.M) if int(number) in symbols}
    records = defaultdict(lambda: {"reanim": [], "particles": [], "cpp": []})
    definitions = {}
    for kind, root in (("reanim", "assets/definitions/reanim/root.dsl"),
                       ("particles", "assets/definitions/particles/all.root.dsl")):
        visited = set()

        def visit(path: str) -> None:
            if path in visited:
                return
            visited.add(path)
            text = blank_tokens(files[path].decode("utf-8-sig"))
            for child in re.findall(r'\bforward\s+"([^"]+)"', text):
                visit((PurePosixPath(path).parent / child).as_posix())
            component = re.search(r"\bexport\s+component\s+(\w+)", text)
            if not component or (kind == "particles" and component[1].casefold() in FIXTURES):
                return
            name = component[1]
            used = set()
            for match in DSL_IMAGE.finditer(text):
                symbol_name = match[1] or match[2]
                if symbol_name not in ids:
                    raise ValueError(f"Unknown image symbol {symbol_name}: {path}")
                line = text.count("\n", 0, match.start()) + 1
                records[symbol_name][kind].append({"definition": name, "path": path, "line": line})
                used.add(symbol_name)
            definitions[kind, name] = sorted(used)

        visit(root)
    scanned = []
    for path, data in files.items():
        parts = PurePosixPath(path).parts
        if not path.startswith("pvzPerf/") or PurePosixPath(path).suffix not in {".cpp", ".h", ".hpp", ".inl"}:
            continue
        if any(part.casefold() in {"generated", "unused", "tests"} for part in parts):
            continue
        if PurePosixPath(path).name in {"Resources.cpp", "Resources.h"}:
            continue
        scanned.append(path)
        text = blank_tokens(data.decode("utf-8-sig"), strings=True)
        for match in IMAGE.finditer(text):
            token = match[0]
            candidate = token[:-3] if token.endswith("_ID") else token
            name = aliases.get(candidate, candidate)
            if name in ids:
                records[name]["cpp"].append({"path": path, "line": text.count("\n", 0, match.start()) + 1,
                                              "token": token})
    manifest = json.loads(files["assets/definitions/resources.json"].decode("utf-8-sig"))["manifest"]
    manifest_images, prefix = set(), ""
    for group in manifest["children"]:
        for element in group["children"]:
            attrs = element["attrs"]
            if element["tag"] == "SetDefaults":
                prefix = attrs.get("idprefix", prefix).rstrip("/")
            elif element["tag"] == "Image":
                manifest_images.add(prefix + attrs.get("id", PurePosixPath(attrs["path"]).stem))
    inventory = []
    for name in sorted(records, key=lambda value: ids[value]):
        record = records[name]
        for category in record:
            unique = {json.dumps(item, sort_keys=True): item for item in record[category]}
            record[category] = sorted(unique.values(), key=lambda item: (item["path"], item["line"]))
        inventory.append({"symbol_id": ids[name], "name": name,
                          "resource_manifest_declared": name in manifest_images, **record})
    triple = [row for row in inventory if all(row[key] for key in ("reanim", "particles", "cpp"))]
    plant_text = blank_tokens(files["pvzPerf/Lawn/Plant.cpp"].decode("utf-8-sig"))
    reanim_text = blank_tokens(files["pvzPerf/Sexy.TodLib/Reanimator.cpp"].decode("utf-8-sig"))
    paths = {kind: PurePosixPath(path.replace("\\", "/")).stem for kind, path in re.findall(
        r'\{\s*ReanimationType::(REANIM_\w+),\s*"([^"]+)"', reanim_text)}
    family = {"SEED_PEASHOOTER", "SEED_REPEATER", "SEED_LEFTPEATER", "SEED_SNOWPEA",
              "SEED_THREEPEATER", "SEED_SPLITPEA", "SEED_GATLINGPEA"}
    bindings = []
    for match in re.finditer(r"\{\s*SeedType::(SEED_\w+),\s*ReanimationType::(REANIM_\w+)", plant_text):
        if match[1] in family:
            bindings.append({"seed": match[1], "reanimation_type": match[2], "definition": paths[match[2]],
                             "path": "pvzPerf/Lawn/Plant.cpp", "line": plant_text.count("\n", 0, match.start()) + 1})
    family_defs = sorted({binding["definition"] for binding in bindings})
    shared = []
    for name in sorted(records, key=lambda value: ids[value]):
        uses = sorted({use["definition"] for use in records[name]["reanim"]} & set(family_defs))
        if len(uses) > 1:
            shared.append({"symbol_id": ids[name], "name": name, "definitions": uses})
    return {"format": "v4-texture-symbol-usage-v1", "commit": commit,
            "scope": {"cpp": "Identifier tokens in non-generated, non-unused, non-test pvzPerf source; "
                      "Resources.cpp/h declarations/bindings, comments and string literals excluded.",
                      "definitions": "Reachable baseline root.dsl inputs; six particle compiler fixtures excluded.",
                      "ui_and_fonts": "Manifest/font protection does not qualify as direct C++; manifest membership reported separately.",
                      "source_files": len(scanned), "symbols": len(symbols),
                      "reanim_definitions": sum(kind == "reanim" for kind, _ in definitions),
                      "particle_definitions": sum(kind == "particles" for kind, _ in definitions)},
            "counts": {key: sum(bool(row[key]) for row in inventory) for key in ("reanim", "particles", "cpp")},
            "triple_intersection": triple, "inventory": inventory,
            "pea_family": {"bindings": bindings, "unique_definitions": family_defs, "shared_symbols": shared,
                           "firepea_symbols": definitions.get(("reanim", "FirePea"), []),
                           "firepea_overlap": sorted(set(definitions.get(("reanim", "FirePea"), [])) &
                               {name for definition in family_defs
                                for name in definitions["reanim", definition]})}}


def markdown(report: dict) -> str:
    triple = report["triple_intersection"]
    lines = ["# v4 纹理符号三方使用审计", "", f"基线：`{report['commit']}`。数据直接读取 Git blobs，"
             "不依赖工作区 DSL 入口、当前 v5 包或当前生成资源表。", "",
             "复现：", "", "```powershell", "python -B tools/audit_texture_symbol_usage.py --ref 0c1c987 "
             '--output "$env:TEMP/v4-texture-symbol-usage.json" '
             '--markdown "$env:TEMP/v4-texture-symbol-usage.md"', "```", "",
             "R 为发布 reanim 作者定义引用；P 为发布 particle 作者定义引用；C 为真实 C++ 标识符引用。"
             "排除 Resources.cpp/h 自动绑定、generated/unused/tests、注释和字符串。"
             "资源 manifest 声明或字体页保护不构成 C，manifest 声明本身也不等于 UI 实际使用。"
             "此审计证明源码直接引用，不声称每条分支都会在某次运行执行。", "",
             f"语料：{report['scope']['reanim_definitions']} 个 reanim、"
             f"{report['scope']['particle_definitions']} 个发布粒子；扫描 {report['scope']['source_files']} 个 C++ 文件。"
             f"R/P/C 各含 {report['counts']['reanim']}/{report['counts']['particles']}/{report['counts']['cpp']} 个符号；"
             f"三方交集 **{len(triple)} 个**。完整引用及每个定义的具体行号见 JSON。", "",
             "| Symbol ID | 符号 | Reanim 定义 | Particle 定义 | C++ 直接引用 |", "| --- | --- | --- | --- | --- |"]
    for row in triple:
        uses = lambda key: ", ".join(sorted({item["definition"] for item in row[key]}))
        cpp = ", ".join(f"`{item['path']}:{item['line']}`" for item in row["cpp"])
        lines.append(f"| {row['symbol_id']} | `{row['name']}` | {uses('reanim')} | {uses('particles')} | {cpp} |")
    lines += ["", "## 豌豆族实际定义", "", "| 植物 | ReanimationType | 作者定义 | 基线 C++ 位置 |",
              "| --- | --- | --- | --- |"]
    for row in report["pea_family"]["bindings"]:
        lines.append(f"| `{row['seed']}` | `{row['reanimation_type']}` | `{row['definition']}` | "
                     f"`{row['path']}:{row['line']}` |")
    lines += ["", "七种植物对应六份定义：普通豌豆使用 `PeaShooterSingle`，双发和反向双发共用 `PeaShooter`。"
              "因此不能把 `REANIM_PEASHOOTER` 误认作全部豌豆植物共享的一份定义。"
              "建议主族 group 使用以下六份，不为反向双发重复创建成员：", "",
              ", ".join(f"`{name}`" for name in report["pea_family"]["unique_definitions"]), "",
              "共享纹理关系：", "", "| Symbol ID | 符号 | 共享定义 |", "| --- | --- | --- |"]
    for row in report["pea_family"]["shared_symbols"]:
        lines.append(f"| {row['symbol_id']} | `{row['name']}` | {', '.join(row['definitions'])} |")
    lines += ["", f"`FirePea` 是火焰豌豆效果定义，不是上述七种植物的主体定义。它使用 "
              f"{len(report['pea_family']['firepea_symbols'])} 个符号，与上述六份定义的符号交集为 "
              f"{len(report['pea_family']['firepea_overlap'])}。"
              "因此为减少共享源图片重复打包而建立的主族 group 建议不纳入它；若希望弹丸效果和植物一同驻留，"
              "应显式将其作为效果成员并衡量生命周期和额外像素。其全部符号已列在 JSON 的 "
              "`pea_family.firepea_symbols`，可据实际重叠决定。", ""]
    return "\n".join(lines)


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--ref", default="0c1c987")
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--markdown", type=Path)
    args = parser.parse_args()
    report = audit(args.ref)
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    if args.markdown:
        args.markdown.parent.mkdir(parents=True, exist_ok=True)
        args.markdown.write_text(markdown(report), encoding="utf-8")
    print(json.dumps({"commit": report["commit"], "counts": report["counts"],
                      "triple_intersection": len(report["triple_intersection"]),
                      "pea_definitions": report["pea_family"]["unique_definitions"]}, indent=2))


if __name__ == "__main__":
    main()
