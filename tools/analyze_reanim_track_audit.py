# -*- coding: utf-8 -*-
"""reanim 轨道审计分析（2026-10-02 用户普查指令）。

输入：tools/reanim_track_audit.tsv（PVZ_REANIM_TRACK_DUMP=1 装载期转储）
联查：
  代码引用集 = 全库 grep "ReanimTrackId::X" 的名字集合
  区间并集   = ReanimTrackId.h 全部 ReanimTrackRanges 常量的 [lo,hi) 并集
    （区间命中的 id 视作被引用——fullscreen/attacher/Boss 等逻辑轨）
输出：
  A) 没用候选：全帧不可见（无图像帧、无字体/文本）且 id 无代码引用且不落
     任何区间——数据死重（112B/轨 + 分组扫一次比较；P4 掩码后更新侧~0）
  B) 合并候选：同 type 内全帧内容哈希相同的轨道组（区分 同 id 重复 /
     异 id 同内容）
"""
import io
import os
import re
import subprocess
import sys
from collections import defaultdict

ROOT = os.path.normpath(os.path.join(os.path.dirname(os.path.abspath(__file__)), '..'))
TSV = os.path.join(ROOT, 'tools', 'reanim_track_audit.tsv')


def code_referenced_ids():
    out = subprocess.run(
        ['git', 'grep', '-hoE', r'ReanimTrackId::[A-Za-z_][A-Za-z_0-9]*', '--', 'Lawn', 'Sexy.TodLib',
         ':(exclude)Sexy.TodLib/ReanimTrackId.h'],
        cwd=ROOT, capture_output=True, text=True).stdout
    names = set(out.replace('ReanimTrackId::', '').split())
    return names


def range_union_ids():
    text = io.open(os.path.join(ROOT, 'pvzPerf', 'Sexy.TodLib', 'ReanimTrackId.h'), encoding='utf-8').read()
    text = re.sub(r'//[^\n]*', '', text)
    enum_m = re.search(r'enum(?:\s+class)?\s+ReanimTrackId\b[^{]*\{(.*?)\n\}', text, re.S)
    values, cur = {}, -1
    for item in enum_m.group(1).split(','):
        item = item.strip()
        if not item:
            continue
        mm = re.match(r'([A-Za-z_]\w*)\s*(?:=\s*([0-9]+)\s*)?$', item)
        if not mm:
            continue
        cur = int(mm.group(2)) if mm.group(2) is not None else cur + 1
        values[mm.group(1)] = cur
    ids = set()
    for lo, hi in re.findall(r'ReanimTrackIdRange\s+\w+\{ReanimTrackId::(\w+),\s*ReanimTrackId::(\w+)\}', text):
        lo_v, hi_v = values[lo], values[hi]
        ids.update(range(lo_v, hi_v))
    return ids, values


def main():
    rows = []
    with io.open(TSV, encoding='utf-8') as f:
        header = f.readline()
        for line in f:
            parts = line.rstrip('\n').split('\t')
            if len(parts) != 9:
                continue
            rows.append(dict(
                type=int(parts[0]), typeName=parts[1], idx=int(parts[2]),
                tid=int(parts[3]), idName=parts[4], frames=int(parts[5]),
                visible=int(parts[6]), fontText=int(parts[7]), h=parts[8]))

    ref_names = code_referenced_ids()
    range_ids, enum_values = range_union_ids()
    # 名字→id：引用名解析（未在枚举中的名字忽略）
    ref_ids = {enum_values[n] for n in ref_names if n in enum_values}

    print('轨道总数 %d（%d 类型），代码引用 id %d 个，区间并集 %d 个 id' % (
        len(rows), len({r["type"] for r in rows}), len(ref_ids), len(range_ids)))

    # A) 没用候选
    dead = [r for r in rows
            if r['frames'] > 0 and r['visible'] == 0 and r['fontText'] == 0
            and r['tid'] not in ref_ids and r['tid'] not in range_ids]
    by_type = defaultdict(list)
    for r in dead:
        by_type[r['typeName']].append(r)
    print('\n== A) 没用候选（全帧不可见 + 无引用 + 不落区间）：%d 轨 / %d 类型 ==' % (len(dead), len(by_type)))
    for name in sorted(by_type, key=lambda n: -len(by_type[n]))[:15]:
        rs = by_type[name]
        print('  %-46s %2d 轨: %s' % (name, len(rs), ', '.join(r['idName'] for r in rs[:6]) + ('...' if len(rs) > 6 else '')))
    if len(by_type) > 15:
        print('  ... 其余 %d 类型' % (len(by_type) - 15))

    # B) 合并候选：同 type 同 streamHash（≥2 轨组）
    groups = defaultdict(list)
    for r in rows:
        groups[(r['type'], r['h'])].append(r)
    dup_groups = {k: v for k, v in groups.items() if len(v) >= 2}
    same_id_groups = {k: v for k, v in dup_groups.items() if len({r['tid'] for r in v}) == 1}
    diff_id_groups = {k: v for k, v in dup_groups.items() if len({r['tid'] for r in v}) > 1}
    n_same = sum(len(v) for v in same_id_groups.values())
    n_diff = sum(len(v) for v in diff_id_groups.values())
    print('\n== B) 合并候选（同 type 内全帧内容逐字节相同）：')
    print('   同 id 重复轨：%d 组 %d 轨（查 MPHF 首见折叠——后位仅参与绘制，内容相同=纯复制）' % (len(same_id_groups), n_same))
    for k, v in list(same_id_groups.items())[:8]:
        print('     %-46s id=%s(%s) x%d' % (v[0]['typeName'], v[0]['tid'], v[0]['idName'], len(v)))
    print('   异 id 同内容：%d 组 %d 轨（合并=少一份 112B+分组扫；但代码可能分别覆写，需逐组核）' % (len(diff_id_groups), n_diff))
    for k, v in list(diff_id_groups.items())[:10]:
        names = ', '.join('%s(%s)' % (r['idName'], '引用' if r['tid'] in ref_ids or r['tid'] in range_ids else '未引') for r in v[:4])
        print('     %-42s x%d: %s' % (v[0]['typeName'], len(v), names))

    # 汇总
    dead_bytes = len(dead) * 112
    dup_same_bytes = (n_same - len(same_id_groups)) * 112
    print('\n== 汇总：死重 %d 轨 ≈ %dKB；同 id 复制可除 %d 轨 ≈ %dKB；异 id 同内容 %d 轨待核 ==' % (
        len(dead), dead_bytes // 1024, n_same - len(same_id_groups), dup_same_bytes // 1024, n_diff))


if __name__ == '__main__':
    sys.exit(main())
