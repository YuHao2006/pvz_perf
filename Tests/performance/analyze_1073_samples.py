#!/usr/bin/env python3
# 原版 1073 采样直方图 → 函数级热点（经 raw_decomp/functions.csv 地址表翻译）
import csv, sys
from pathlib import Path

def load_functions(path):
    funcs = []
    with open(path, newline='', encoding='utf-8', errors='replace') as f:
        for row in csv.DictReader(f):
            try:
                lo = int(row['address'], 16) - 0x400000  # VA → 镜像相对偏移
                hi = int(row['body_max'], 16) - 0x400000
                name = row['name']
                status = row.get('status', '')
            except (ValueError, KeyError, TypeError):
                continue
            if lo < 0 or hi <= lo:
                continue
            funcs.append((lo, hi, name, status))
    funcs.sort()
    return funcs

def classify(offset, funcs):
    # 二分找包含 offset 的函数；未覆盖区段返回最近已知函数（重建稀疏）
    import bisect
    i = bisect.bisect_right(funcs, (offset, 1 << 30, '\uffff', '')) - 1
    if i >= 0 and funcs[i][0] <= offset < funcs[i][1]:
        return funcs[i][2]
    if i >= 0 and offset - funcs[i][1] < 0x40:  # 函数尾部填充
        return funcs[i][2]
    if i >= 0:
        va = 0x400000 + offset
        near_lo, near_hi, near_name, _ = funcs[i]
        return f"~0x{va:x} (最近已知 {near_name} +0x{offset-near_lo:x})"
    return None

def main():
    sample_path = sys.argv[1] if len(sys.argv) > 1 else r"C:\temp\pvz1073_sample.csv"
    csv_path = sys.argv[2] if len(sys.argv) > 2 else \
        str(Path(__file__).resolve().parents[2] / "reconstruction/1073/raw_decomp/functions.csv")
    funcs = load_functions(csv_path)
    header = open(sample_path).readline().strip()
    hist = {}
    unknown = 0
    total_samples = 0
    for line in open(sample_path):
        parts = line.split()
        if len(parts) != 2:
            continue
        try:
            off, n = int(parts[0], 16), int(parts[1])
        except ValueError:
            continue
        total_samples += n
        name = classify(off, funcs)
        if name and name.startswith('FUN_'):
            unknown += n
            hist.setdefault(name, 0)
            hist[name] += n
        elif name:
            hist[name] = hist.get(name, 0) + n
        else:
            unknown += n
            hist.setdefault(name if name else '(无邻 0x%x)' % off, 0)
            hist[name if name else '(无邻 0x%x)' % off] += n
    print(header)
    print(f"exe-samples={total_samples}  Top 函数:")
    for name, n in sorted(hist.items(), key=lambda kv: -kv[1])[:24]:
        print(f"{n:5d}  {100.0*n/total_samples:5.1f}%  {name}")

if __name__ == '__main__':
    main()
