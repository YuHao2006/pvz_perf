import struct

def i32(d, o): return struct.unpack_from('<i', d, o)[0]

def try_parse(d, start, end, track_size, n, verbose=False):
    pos = start
    got = []
    for i in range(n):
        if pos + 8 > end: return None
        defid = i32(d, pos)
        if not (0 <= defid < 160): return None
        ln = i32(d, pos + 4)
        if ln < 0 or ln % track_size != 0: return None
        tc = ln // track_size
        if tc > 200: return None
        nxt = pos + 8 + ln + tc * 4
        if nxt > end: return None
        for k in range(tc):
            im = i32(d, pos + 8 + ln + k * 4)
            if not (-2 <= im <= 2000): return None
        got.append((defid, tc))
        pos = nxt
    return (pos, got) if pos == end else None

D = open(r'C:/Users/Administrator/AppData/Local/Temp/fwd_game3_58.dat64','rb').read()
L = open(r'C:/Users/Administrator/CLionProjects/codex/PlantsVsZombiesModern/out/modern-game/Release/log/endless/backup-current/game3_13.dat.programdata-1639-latest','rb').read()

for tag, d, start, end, ts in (('dat64', D, 452736, 564464, 112), ('legacy', L, 422864, 519392, 96)):
    hits = []
    for p in range(start, start + 4000):
        r = try_parse(d, p, end, ts, 100)
        if r:
            hits.append(p)
    print(f'== {tag}: 候选起点 {hits}')
    if hits:
        p = hits[-1]
        pos, got = try_parse(d, p, end, ts, 100)
        print(f'   起点 {p}: 前12条 {got[:12]}')
        print(f'   defID集合 {sorted(set(x[0] for x in got))}')
        from collections import Counter
        print(f'   轨道数分布 {dict(sorted(Counter(tc for _, tc in got).items()))}')
        print(f'   粒子区长度 = {p - start}')
