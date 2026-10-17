import struct, re, os

def i32(d, o): return struct.unpack_from('<i', d, o)[0]

# 锚定补流（复用 _supp_anchor 逻辑）
def try_parse(d, start, end, ts, n):
    pos = start
    got = []
    for i in range(n):
        if pos + 8 > end: return None
        defid = i32(d, pos)
        if not (0 <= defid < 160): return None
        ln = i32(d, pos + 4)
        if ln < 0 or ln % ts != 0: return None
        tc = ln // ts
        if tc > 200: return None
        nxt = pos + 8 + ln + tc * 4
        if nxt > end: return None
        for k in range(tc):
            im = i32(d, pos + 8 + ln + k * 4)
            if not (-2 <= im <= 2000): return None
        got.append((defid, tc))
        pos = nxt
    return (pos, got) if pos == end else None

def anchor(path, start, fts, ts, n):
    d = open(path, 'rb').read()
    end = len(d) - fts
    for p in range(start, start + 5000):
        r = try_parse(d, p, end, ts, n)
        if r: return d, p, r[1]
    return d, None, None

# 现代编译件轨道数
mod = {}
for f in os.listdir('out/modern-game/Release/compiled/reanim'):
    if not f.endswith('.v4.compiled'): continue
    d = open('out/modern-game/Release/compiled/reanim/' + f, 'rb').read()
    tc = struct.unpack_from('<I', d, 32)[0]
    mod[f[:-len('.reanim.v4.compiled')].lower()] = tc

# 参数表 index -> 名字（简: 从 Reanimator.cpp 提取）
txt = open('Sexy.TodLib/Reanimator.cpp', encoding='utf-8', errors='replace').read()
i = txt.index('gLawnReanimationArray'); seg = txt[i:]; seg = seg[:seg.index('};')]
names = []
for line in seg.splitlines():
    m = re.search(r'(REANIM_[A-Z0-9_]+)\s*,\s*"([^"]+)"', line)
    if m: names.append(m.group(2).split(chr(92))[-1].replace('.reanim',''))
def modcount(defid): return mod.get(names[defid].lower()) if defid < len(names) else None

# 1073 XML 轨道数
xcount = {}
for f in os.listdir(r'C:/UserProgram/Plants_Vs_Zombies_Dir/pak64/reanim') if os.path.isdir(r'C:/UserProgram/Plants_Vs_Zombies_Dir/pak64/reanim') else []:
    pass
XMLDIR = r'C:/UserProgram/Plants_Vs_Zombies_V1.2.0.1073_EN/pak64/reanim'
for f in os.listdir(XMLDIR):
    if not f.endswith('.reanim'): continue
    c = open(os.path.join(XMLDIR, f), encoding='utf-8', errors='replace').read()
    xcount[f[:-len('.reanim')].lower()] = len(re.findall(r'<track>\s*<name>([A-Za-z0-9_]+)</name>', c))
def xmlcount(defid): return xcount.get(names[defid].lower()) if defid < len(names) else None

# 扫描三份文件
runs = [
    ('fwd=转换器产', r'C:/Users/Administrator/AppData/Local/Temp/fwd_game3_58.dat64', 452736, 2292, 112, 100),
    ('echo=引擎回声', 'out/modern-game/Release/data/game3_58.dat64', 0, 2292, 112, None),
    ('weird=玩后自产', 'out/modern-game/Release/log/endless/backup-current/game3_58.dat64.weird-1716', 0, 2292, 112, None),
]
for tag, path, start, fts, ts, n_hint in runs:
    d = open(path,'rb').read()
    # 找附件池结束 = 补流起点（池齐全时）或直接扫
    # 简化: 附件池结束 = 文件里 11 池走完的位置
    pos = 52 + struct.unpack_from('<I', d, 48)[0]
    for slot in [376,352,168,224,88,248,80,216,168,184,780]:
        fh, mu, lc, X = struct.unpack_from('<IIII', d, pos)
        pos = pos + 16 + X
    n = n_hint
    if n is None:
        fh, mu, lc = struct.unpack_from('<III', d, pos)
        # n = 重动画池 live 数, 从池头读
        p2 = 52 + struct.unpack_from('<I', d, 48)[0]
        for slot in [376,352,168,224,88,248,80,216,168]:
            fh2, mu2, lc2, X2 = struct.unpack_from('<IIII', d, p2)
            p2 = p2 + 16 + X2
        n = lc2
    r = None
    for p in range(pos, pos + 5000):
        r = try_parse(d, p, len(d)-fts, ts, n)
        if r: break
    if not r:
        print(f'== {tag}: 锚定失败'); continue
    pstart, got = r
    print(f'== {tag} ({len(d)}B, {n} 条, 补流起点 {pstart})')
    # 三方数表
    from collections import defaultdict
    by = defaultdict(set)
    for defid, tc in got: by[defid].add(tc)
    print('   defID 名字              文件内  现代v4  1073XML   判定')
    for defid in sorted(by):
        for tc in by[defid]:
            mc = modcount(defid); xc = xmlcount(defid)
            verdict = '一致' if (mc == tc == xc) else ('!! 现代 != 文件 !!' if mc != tc else 'XML异' )
            print(f'   {defid:4} {names[defid]:22} {tc:4} {str(mc):6} {str(xc):6}   {verdict}')
