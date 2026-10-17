"""引擎回声档 vs 源转换档：同槽逐字段对拍（2026-10-09 贴图错乱案黄金实验）。

用法: python tools/savediff_sameslot.py <源档.dat64> <引擎回声档.dat64>

对拍内容:
  1. 僵尸池同槽身份字段 (type/phase/row/posX/posY/helm/shield/dead/health)
  2. reanim 补充流骨架 (defID/trackCount 序) 与每轨图像号流
字段偏移 = 本机 MSVC 真实 x64 布局（layout probe 实测）。

判定: 身份字段 (type/row/helm/shield) 出现差异 = 引擎读档时把源档字段读错；
      号流差异 = 引擎读档时把图像号读错；位置/计数器小差异 = 正常运行活动。
"""
import struct, sys

ZOMBIE_SLOT = 376          # dat64 僵尸槽步长
Z_OFF_TYPE    = 48
Z_OFF_PHASE   = 52
Z_OFF_POSX    = 56
Z_OFF_POSY    = 60
Z_OFF_ROW     = 36
Z_OFF_BODYHP  = 212
Z_OFF_HELM    = 208
Z_OFF_SHIELD  = 228
Z_OFF_DEAD    = 248

def walk(path):
    d = open(path, 'rb').read()
    blen = struct.unpack_from('<I', d, 48)[0]
    pos = 52 + blen
    pools = [('Zombie',368,376),('Plant',344,352),('Projectile',160,168),('Coin',216,224),
             ('LawnMower',80,88),('GridItem',240,248),('ParticleSystem',72,80),
             ('ParticleEmitter',208,216),('Particle',160,168),('Reanimation',176,184),
             ('Attachment',776,780)]
    info = {}
    for name,rec,slot in pools:
        fh,mu,lc = struct.unpack_from('<III', d, pos)
        ln = struct.unpack_from('<I', d, pos+12)[0]
        assert ln == mu*slot, (name, ln, mu*slot)
        base = pos+16
        slots = []
        for i in range(mu):
            pid = struct.unpack_from('<I', d, base+i*slot+rec)[0]
            slots.append((i, pid, base+i*slot))
        info[name] = slots
        pos = base + ln
    # 粒子补充
    n_ps = sum(1 for _,pid,_ in info['ParticleSystem'] if pid & 0xFFFF0000)
    for _ in range(n_ps):
        pos += 4
        cnt = struct.unpack_from('<i', d, pos)[0]; pos += 4 + cnt*8
        for _ in range(cnt):
            pos += 8
            c2 = struct.unpack_from('<i', d, pos)[0]; pos += 4 + c2*8
    # reanim 补充：defID + [len][tracks] + tc×4 images
    n_r = sum(1 for _,pid,_ in info['Reanimation'] if pid & 0xFFFF0000)
    reanims = []
    for _ in range(n_r):
        defid = struct.unpack_from('<i', d, pos)[0]; pos += 4
        ln = struct.unpack_from('<i', d, pos)[0]; pos += 4
        if ln == 0:
            reanims.append((defid, []))
            continue
        tc = ln // 112
        pos += ln
        imgs = list(struct.unpack_from('<%di' % tc, d, pos)); pos += tc*4
        reanims.append((defid, imgs))
    return d, info, reanims

def zombie_fields(d, off):
    g = lambda o, f='<i': struct.unpack_from(f, d, off+o)[0]
    return (g(Z_OFF_TYPE), g(Z_OFF_PHASE), g(Z_OFF_ROW),
            g(Z_OFF_POSX,'<f'), g(Z_OFF_POSY,'<f'),
            g(Z_OFF_BODYHP), g(Z_OFF_HELM), g(Z_OFF_SHIELD), d[off+Z_OFF_DEAD] != 0)

def main():
    src, dst = sys.argv[1], sys.argv[2]
    ds, ins, rs = walk(src)
    dd, ind, rd = walk(dst)
    print(f'源档 {src}: size={len(ds)}')
    print(f'回声 {dst}: size={len(dd)}')
    # 僵尸同槽对拍
    ss = {i: off for i, pid, off in ins['Zombie'] if pid & 0xFFFF0000}
    sd = {i: off for i, pid, off in ind['Zombie'] if pid & 0xFFFF0000}
    both = sorted(set(ss) & set(sd))
    only_s = sorted(set(ss) - set(sd))
    only_d = sorted(set(sd) - set(ss))
    print(f'\n僵尸活跃槽: 源={len(ss)} 回声={len(sd)} 共有={len(both)} 源独={only_s[:8]} 回声独={only_d[:8]}')
    diffs = {'type':0,'phase':0,'row':0,'helm':0,'shield':0,'dead':0,'pos_far':0,'hp':0}
    for i in both:
        a = zombie_fields(ds, ss[i]); b = zombie_fields(dd, sd[i])
        if a[0]!=b[0]: diffs['type']+=1; print(f'  槽{i}: type {a[0]}->{b[0]}')
        if a[1]!=b[1]: diffs['phase']+=1
        if a[2]!=b[2]: diffs['row']+=1; print(f'  槽{i}: row {a[2]}->{b[2]}')
        if a[3]!=b[3] or a[4]!=b[4]:
            if abs(a[3]-b[3])>50 or abs(a[4]-b[4])>50: diffs['pos_far']+=1
        if a[5]!=b[5]: diffs['hp']+=1
        if a[6]!=b[6]: diffs['helm']+=1; print(f'  槽{i}: helm {a[6]}->{b[6]}')
        if a[7]!=b[7]: diffs['shield']+=1; print(f'  槽{i}: shield {a[7]}->{b[7]}')
        if a[8]!=b[8]: diffs['dead']+=1; print(f'  槽{i}: dead {a[8]}->{b[8]}')
    print('身份字段差异统计:', diffs)
    # reanim 补充骨架 + 号流
    print(f'\nreanim 条数: 源={len(rs)} 回声={len(rd)}')
    n = min(len(rs), len(rd))
    skel = sum(1 for i in range(n) if rs[i][0]!=rd[i][0] or len(rs[i][1])!=len(rd[i][1]))
    print(f'前 {n} 条骨架差异: {skel}')
    idstream = 0
    for i in range(n):
        if rs[i][0]==rd[i][0] and len(rs[i][1])==len(rd[i][1]):
            if rs[i][1] != rd[i][1]:
                idstream += 1
                if idstream <= 5:
                    m = sum(1 for x,y in zip(rs[i][1], rd[i][1]) if x!=y)
                    print(f'  条{i} defID={rs[i][0]}: 号流 {len(rs[i][1])} 项中 {m} 项不同; 例 {[(x,y) for x,y in zip(rs[i][1],rd[i][1]) if x!=y][:4]}')
    print(f'号流不同条数: {idstream}/{n}')

if __name__ == '__main__':
    main()
