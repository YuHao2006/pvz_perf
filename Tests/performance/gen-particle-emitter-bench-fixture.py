"""Generate a benchmark-only fixture from gold v2 records; never rewrite game data."""
import argparse
import hashlib
import importlib.util
import json
import re
import struct
import sys
import zlib
from collections import Counter
from pathlib import Path

sys.dont_write_bytecode = True


def cpp_string(value):
    return json.dumps(value, ensure_ascii=True)


def generate(project, gold, out, manifest_path):
    parser_path = project / "tools/verify-particle-emitter-corpus.py"
    spec = importlib.util.spec_from_file_location("particle_gold_parser", parser_path)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    files = sorted(gold.glob("*.xml.v2.compiled"))
    if not files:
        raise ValueError("No golden *.xml.v2.compiled records")
    records = []
    digest = hashlib.sha256()
    for path in files:
        before = path.read_bytes()
        emitters, links = module.old_record(path)
        if before != path.read_bytes():
            raise ValueError(f"Golden input changed during read: {path}")
        if not 1 <= len(emitters) <= 63:
            raise ValueError(f"Unsupported mask size: {path}")
        digest.update(path.name.encode("ascii") + b"\0" + before)
        records.append((path.name, emitters, links))

    names = sorted({e[1].lower() for _, emitters, _ in records for e in emitters if e[1]})
    identifiers = {name: index + 1 for index, name in enumerate(names)}
    if len(names) != 112:
        raise ValueError(f"Expected stable 112-name contract, got {len(names)}")
    stream = b"".join(struct.pack("<I", ident) + name.encode("ascii") + b"\0"
                      for name, ident in identifiers.items())
    table_crc = zlib.crc32(stream)
    header_path = project / "pvzPerf/Sexy.TodLib/generated/ParticleEmitterName.h"
    header_bytes = header_path.read_bytes()  # One read: an independent benchmark snapshot.
    header = header_bytes.decode("utf-8")
    enum_body = re.search(r"enum class ParticleEmitterName[^\{]*\{(.*?)\};", header, re.S).group(1)
    enum_items = [(name, int(value)) for name, value in
                  re.findall(r"\b([a-zA-Z_][a-zA-Z_0-9]*)\s*=\s*(\d+)", enum_body)]
    enum_ids = dict(enum_items)
    expected_enum = {"unnamed": 0, **{re.sub(r"[^a-zA-Z_0-9]", "_", n): i
                                     for n, i in identifiers.items()}, "top": 113}
    if enum_ids != expected_enum:
        raise ValueError("Generated enum and folded golden names disagree")
    if int(re.search(r"kParticleEmitterNameTableHash\s*=\s*(\d+)", header).group(1)) != table_crc:
        raise ValueError("Generated emitter-name table hash disagrees with golden corpus")
    if not re.search(r"return\s+id\s*>=\s*mBegin\s*&&\s*id\s*<\s*mEnd", header):
        raise ValueError("Expected half-open mBegin/mEnd Contains contract")
    ranges = []
    all_range = None
    for name, lo, hi in re.findall(
            r"ParticleEmitterNameRange\s+(\w+)\s*\{ParticleEmitterName::(\w+),\s*ParticleEmitterName::(\w+)\}",
            header):
        if name == "All":
            all_range = (enum_ids[lo], enum_ids[hi])
        else:
            ranges.append((name, enum_ids[lo], enum_ids[hi]))
    if all_range != (0, 113) or not ranges:
        raise ValueError("Expected All=[0,113) and generated prefix families")

    # Oracle masks use raw name semantics, independently of ID predicates in C++.
    exact_masks, family_masks = [], []
    for filename, emitters, links in records:
        folded = [e[1].lower() for e in emitters]
        exact_masks.extend(sum(1 << j for j, n in enumerate(folded) if n == query)
                           for query in [""] + names)
        for prefix, lo, hi in ranges:
            mask = sum(1 << j for j, name in enumerate(folded) if name.startswith(prefix))
            numeric_mask = sum(1 << j for j, name in enumerate(folded)
                               if lo <= identifiers.get(name, 0) < hi)
            if mask != numeric_mask:
                raise ValueError(f"Prefix/ID range mismatch: {filename}, {prefix}")
            family_masks.append(mask)
        for emitter, link in zip(emitters, links):
            wanted = emitter[2].lower()
            expected = folded.index(wanted) if wanted else 0xFFFFFFFF
            if link != expected:
                raise ValueError(f"First-definition link mismatch: {filename}")

    lines = ["// Benchmark-only generated fixture. Does not include a game header.",
             "#pragma once", "#include <array>", "#include <cstdint>",
             "namespace fixture {", "enum class Name : std::uint32_t {"]
    lines += [f"    {name} = {value}," for name, value in enum_items]
    lines += ["};", "struct Range {", "    Name mBegin;", "    Name mEnd;",
              "    constexpr bool Contains(Name id) const noexcept { return id >= mBegin && id < mEnd; }",
              "};", "inline constexpr Range All{Name::unnamed, Name::top};",
              "struct Emitter { const char* name; Name id; };",
              "struct System { const char* file; std::uint32_t begin; std::uint32_t count; };",
              "struct Named { const char* text; Name id; };",
              "struct Family { const char* prefix; Range range; };",
              f"inline constexpr char CorpusSha256[] = {cpp_string(digest.hexdigest())};",
              f"inline constexpr std::uint32_t NameTableCrc32 = {table_crc}u;",
              f"inline constexpr std::array<Emitter, {sum(len(es) for _, es, _ in records)}> Emitters{{{{"]
    for _, emitters, _ in records:
        for e in emitters:
            lines.append(f"    {{{cpp_string(e[1])}, static_cast<Name>({identifiers.get(e[1].lower(), 0)}u)}},")
    lines += ["}};", f"inline constexpr std::array<System, {len(records)}> Systems{{{{"]
    begin = 0
    for filename, emitters, _ in records:
        lines.append(f"    {{{cpp_string(filename)}, {begin}u, {len(emitters)}u}},")
        begin += len(emitters)
    lines += ["}};", "inline constexpr std::array<Named, 113> Names{{"]
    lines.append('    {"", Name::unnamed},')
    for name, ident in identifiers.items():
        lines.append(f"    {{{cpp_string(name)}, static_cast<Name>({ident}u)}},")
    lines += ["}};", f"inline constexpr std::array<Family, {len(ranges)}> Families{{{{"]
    for prefix, lo, hi in ranges:
        lines.append(f"    {{{cpp_string(prefix)}, {{static_cast<Name>({lo}u), static_cast<Name>({hi}u)}}}},")
    lines += ["}};"]
    for variable, masks in [("ExactMasks", exact_masks), ("FamilyMasks", family_masks)]:
        lines.append(f"inline constexpr std::array<std::uint64_t, {len(masks)}> {variable}{{{{")
        for at in range(0, len(masks), 16):
            lines.append("    " + ", ".join(f"{v}ull" for v in masks[at:at + 16]) + ",")
        lines.append("}};")
    lines += ["} // namespace fixture", ""]
    out.parent.mkdir(parents=True, exist_ok=True)
    out.write_text("\n".join(lines), encoding="utf-8")
    hist = Counter(len(emitters) for _, emitters, _ in records)
    manifest = dict(
        golden_directory=str(gold.resolve()), golden_record_count=len(records),
        golden_emitter_count=sum(len(es) for _, es, _ in records),
        unnamed_emitters=sum(not e[1] for _, es, _ in records for e in es),
        named_emitters=sum(bool(e[1]) for _, es, _ in records for e in es),
        distinct_named_ids=len(names), name_table_crc32=f"{table_crc:08x}",
        corpus_sha256=digest.hexdigest(), header_snapshot_path=str(header_path),
        header_snapshot_sha256=hashlib.sha256(header_bytes).hexdigest(),
        parser_path=str(parser_path), parser_sha256=hashlib.sha256(parser_path.read_bytes()).hexdigest(),
        definition_count_histogram=dict(sorted(hist.items())),
        tiny_system_count=sum(v for k, v in hist.items() if 1 <= k <= 10),
        tiny_emitter_count=sum(k * v for k, v in hist.items() if 1 <= k <= 10),
        native_on_duration_target_count=sum(bool(e[2]) for _, es, _ in records for e in es),
        fixture_path=str(out.resolve()), fixture_sha256=hashlib.sha256(out.read_bytes()).hexdigest(),
        families=[dict(prefix=p, begin=lo, end=hi) for p, lo, hi in ranges],
        record_order=[dict(file=f, definition_count=len(es),
                           names=[e[1] for e in es], ids=[identifiers.get(e[1].lower(), 0) for e in es])
                      for f, es, _ in records],
        oracle="ASCII folded raw names: equality / startswith; original declaration order first match",
        status="passed")
    manifest_path.parent.mkdir(parents=True, exist_ok=True)
    manifest_path.write_text(json.dumps(manifest, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({k: manifest[k] for k in
                      ["status", "golden_record_count", "golden_emitter_count", "tiny_system_count",
                       "tiny_emitter_count", "name_table_crc32", "fixture_path"]}))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--project", type=Path, required=True)
    parser.add_argument("--gold-v2", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--manifest", type=Path, required=True)
    args = parser.parse_args()
    generate(args.project, args.gold_v2, args.output, args.manifest)


if __name__ == "__main__":
    main()
