import struct, math, sys

def f32(d, o):
    return struct.unpack_from('<f', d, o)[0]

def sane(x, lo, hi):
    return not (math.isnan(x) or math.isinf(x)) and lo <= x <= hi

def check(path):
    d = open(path, 'rb').read()
    blen = struct.unpack_from('<I', d, 48)[0]
    pos = 52 + blen
    pools = [('Zombie',368,376),('Plant',344,352),('Projectile',160,168),('Coin',216,224),
             ('LawnMower',80,88),('GridItem',240,248),('ParticleSystem',72,80),
             ('ParticleEmitter',208,216),('Particle',160,168),('Reanimation',176,184),
             ('Attachment',776,780)]
    info = {}
    for name, rec, slot in pools:
        fh, mu, lc = struct.unpack_from('<III', d, pos)
        base = pos+16
        info[name] = (mu, lc, base, rec, slot)
        pos = base + struct.unpack_from('<I', d, pos+12)[0]
    print(f'== {path}')
    # 植物池体检（现代布局：mSeedType@48, mRow@36, mX@16, mY@20）
    mu, lc, base, rec, slot = info['Plant']
    bad = 0
    for i in range(mu):
        pid = struct.unpack_from('<I', d, base+i*slot+rec)[0]
        if not (pid & 0xFFFF0000):
            continue
        o = base+i*slot
        seed = struct.unpack_from('<i', d, o+48)[0]
        row  = struct.unpack_from('<i', d, o+36)[0]
        x, y = f32(d, o+16), f32(d, o+20)
        if not (0 <= seed < 100 and 0 <= row < 7 and sane(x, -500, 2000) and sane(y, -500, 2000)):
            bad += 1
            if bad <= 6:
                print(f'  植物槽{i}: seed={seed} row={row} x={x:.1f} y={y:.1f}  <<< 异常')
    print(f'  植物: live={lc} 异常={bad}')
    # 重动画池体检（现代布局：mAnimTime@4, mFrameStart@32, mFrameCount@36, mOverlayMatrix@44(9f), mColorOverride@80(4f)）
    mu, lc, base, rec, slot = info['Reanimation']
    bad = 0
    for i in range(mu):
        pid = struct.unpack_from('<I', d, base+i*slot+rec)[0]
        if not (pid & 0xFFFF0000):
            continue
        o = base+i*slot
        t = f32(d, o+4); fs = struct.unpack_from('<i', d, o+32)[0]; fc = struct.unpack_from('<i', d, o+36)[0]
        m = [f32(d, o+44+4*k) for k in range(9)]
        rtype = struct.unpack_from('<i', d, o+0)[0]
        # 3x3 仿射矩阵行主序：m00..m22。旋转/缩放 m[0,1,3,4] 小、平移 m[2,5] 像素级、
        # 齐次行 m[6,7]≈0 且 m[8]≈1
        ok = (sane(t, -100, 100000) and 0 <= fs < 10000 and 0 <= fc < 10000
              and all(sane(m[k], -8, 8) for k in (0,1,3,4))
              and all(sane(m[k], -4000, 4000) for k in (2,5))
              and all(sane(m[k], -1.5, 1.5) for k in (6,7,8)) and 0 <= rtype < 153)
        if not ok:
            bad += 1
            if bad <= 6:
                print(f'  重动画槽{i}: type={rtype} t={t} fs={fs} fc={fc} m=[{",".join(f"{v:.2f}" for v in m)}]  <<< 异常')
        elif i < 3:
            print(f'  重动画槽{i}: type={rtype} m=[{",".join(f"{v:.3f}" for v in m)}]')
    print(f'  重动画: live={lc} 异常={bad}')
    # 附件池体检（简单：type 字段合理）
    mu, lc, base, rec, slot = info['Attachment']
    bad = 0
    for i in range(mu):
        pid = struct.unpack_from('<I', d, base+i*slot+rec)[0]
        if not (pid & 0xFFFF0000):
            continue
        o = base+i*slot
        ne = struct.unpack_from('<i', d, o+768)[0]
        if not (0 <= ne <= 16):
            bad += 1
            if bad <= 5:
                print(f'  附件槽{i}: numEffects={ne}  <<< 异常')
    print(f'  附件: live={lc} 异常={bad}')

check(r'C:/Users/Administrator/AppData/Local/Temp/fwd_game3_58.dat64')      # 转换器产（原版16:39转）
check(r'C:/Users/Administrator/CLionProjects/codex/PlantsVsZombiesModern/out/modern-game/Release/log/endless/backup-current/game3_58.dat64.weird-1716')  # 现代自产
