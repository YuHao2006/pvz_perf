import struct, sys
sys.setrecursionlimit(100000)

def i32(d, o): return struct.unpack_from('<i', d, o)[0]

def solve_region(d, start, end, track_size, n_reanims, tag):
    """在 [start,end) 上解 1粒子系统补充 + n_reanims 个重动画补充 的精确分区。
    尝试两种 ID 粒度（4B/8B）以及重动画带长度字段模型。返回解码结果。"""
    memo = {}
    def solve(ps_done, idx, pos, ps_variant):
        key = (ps_done, idx, pos, ps_variant)
        if key in memo: return memo[key]
        if ps_done and idx == n_reanims:
            memo[key] = (pos == end, [])
            return memo[key]
        if pos >= end:
            memo[key] = (False, [])
            return memo[key]
        # 粒子系统补充（先于重动画）
        if not ps_done:
            for variant in (4, 8):
                defid = i32(d, pos)
                if not (0 <= defid < 200): continue
                p = pos + 4
                n = i32(d, p)
                if not (0 <= n <= 64): continue
                p += 4 + n * variant
                ok = True
                for _ in range(n):
                    if variant == 8:
                        df = i32(d, p); img = i32(d, p + 4)
                        p += 8
                    else:
                        df = i32(d, p); img = i32(d, p + 4)
                        p += 8
                    if not (0 <= df < 4096 and -1 <= img <= 700): ok = False; break
                    n2 = i32(d, p); p += 4
                    if not (0 <= n2 <= 1024): ok = False; break
                    p += n2 * variant
                if ok and p <= end:
                    ok2, rest = solve(True, idx, p, variant)
                    if ok2:
                        memo[key] = (True, [('PS', defid, n, variant)] + rest)
                        return memo[key]
            memo[key] = (False, [])
            return memo[key]
        # 重动画补充
        defid = i32(d, pos)
        if 0 <= defid < 144:
            ln = i32(d, pos + 4)
            if ln >= 0 and ln % track_size == 0 and pos + 8 + ln <= end:
                tc = ln // track_size
                imgs_ok = True
                for k in range(tc):
                    im = i32(d, pos + 8 + ln + k * 4)
                    if not (-1 <= im <= 700):
                        imgs_ok = False; break
                if imgs_ok:
                    nxt = pos + 8 + ln + tc * 4
                    ok2, rest = solve(True, idx + 1, nxt, ps_variant)
                    if ok2:
                        memo[key] = (True, [(defid, tc)] + rest)
                        return memo[key]
            # 无长度模型（长度字段其实是首轨数据）：[defID] 后直接轨道块+图像表，数量未知——跳过
        memo[key] = (False, [])
        return memo[key]
    ok, dec = solve(False, 0, start, 0)
    print(f'== {tag}: {"成功" if ok else "失败"}')
    if ok:
        ps = [x for x in dec if x[0] == 'PS']
        rs = [x for x in dec if x[0] != 'PS']
        print('  粒子: ', ps)
        print('  重动画条目数:', len(rs))
        from collections import Counter
        c = Counter(tc for _, tc in rs)
        print('  轨道数分布:', dict(sorted(c.items())))
        print('  defID 序列:', [x[0] for x in rs][:40], '...')
        print('  defID 集合:', sorted(set(x[0] for x in rs)))
    return ok, dec

L = open(r'C:/Users/Administrator/CLionProjects/codex/PlantsVsZombiesModern/out/modern-game/Release/log/endless/backup-current/game3_13.dat.programdata-1639-latest','rb').read()
D = open(r'C:/Users/Administrator/AppData/Local/Temp/fwd_game3_58.dat64','rb').read()
okL, decL = solve_region(L, 422864, 519392, 96, 100, 'legacy 1073')
okD, decD = solve_region(D, 452736, 564464, 112, 100, 'dat64 转换档')
if okL and okD:
    rl = [x for x in decL if x[0] != 'PS']; rd = [x for x in decD if x[0] != 'PS']
    diff = [(i, rl[i], rd[i]) for i in range(min(len(rl), len(rd))) if rl[i] != rd[i]]
    print('两文件解码差异条目数:', len(diff))
    for x in diff[:10]: print('  ', x)
