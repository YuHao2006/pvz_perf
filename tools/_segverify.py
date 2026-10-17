import struct

LEGACY = r'C:/Users/Administrator/CLionProjects/codex/PlantsVsZombiesModern/out/modern-game/Release/log/endless/backup-current/game3_13.dat.programdata-1639-latest'
DAT64  = r'C:/Users/Administrator/AppData/Local/Temp/fwd_game3_58.dat64'

# (legacySize, dat64Size, legacySlot, dat64Slot, segments)
POOLS = [
 ('Zombie',356,368,360,376,[(8,16,28),(36,48,320)]),
 ('Plant',328,344,332,352,[(8,16,28),(36,48,292)]),
 ('Projectile',144,160,148,168,[(8,16,28),(36,48,108)]),
 ('Coin',208,216,216,224,[(8,16,28),(36,48,72),(112,120,96)]),
 ('LawnMower',68,80,72,88,[(8,16,60)]),
 ('GridItem',232,240,236,248,[(8,16,224)]),
 ('ParticleSystem',40,72,44,80,[(0,0,4),(28,56,12)]),
 ('ParticleEmitter',172,208,176,216,[(24,48,60),(88,120,84)]),
 ('Particle',156,160,160,168,[(4,8,152)]),
 ('Reanimation',156,176,160,184,[(0,0,12),(16,24,72),(92,104,4),(100,120,56)]),
 ('Attachment',776,776,780,780,[(0,0,776)]),
]

def walk(d, pools_with_slot, legacy):
    """返回值: {name:(mu,lc,base)}；legacy=12B头+u32棋盘长+棋盘，dat64=48B头+u32棋盘长+棋盘"""
    if legacy:
        blen = struct.unpack_from('<I', d, 16)[0]   # [u32 12][12B头][u32 棋盘长][棋盘]
        pos = 20 + blen
    else:
        blen = struct.unpack_from('<I', d, 48)[0]
        pos = 52 + blen
    out = {}
    for name, slot in pools_with_slot:
        fh, mu, lc = struct.unpack_from('<III', d, pos)
        base = pos + 16
        out[name] = (mu, lc, base)
        pos = base + struct.unpack_from('<I', d, pos + 12)[0]
    return out

L = open(LEGACY, 'rb').read()
D = open(DAT64, 'rb').read()
lw = walk(L, [(n, ls) for n, _, _, ls, _, _ in POOLS], legacy=True)
dw = walk(D, [(n, ds) for n, _, _, _, ds, _ in POOLS], legacy=False)

total_ok = total_bad = 0
for name, lrec, drec, lslot, dslot, segs in POOLS:
    lmu, llc, lbase = lw[name]
    dmu, dlc, dbase = dw[name]
    bad = ok = 0
    first_bad = []
    for i in range(max(lmu, dmu)):
        lo = lbase + i * lslot
        do = dbase + i * dslot
        lid = struct.unpack_from('<I', L, lo + lrec)[0] if i < lmu else 0
        did = struct.unpack_from('<I', D, do + drec)[0] if i < dmu else 0
        lkey = bool(lid & 0xFFFF0000)
        dkey = bool(did & 0xFFFF0000)
        if not lkey and not dkey:
            continue
        if lid != did:
            bad += 1
            first_bad.append(f'槽{i} ID 不一致 legacy={lid:#x} dat64={did:#x}')
            continue
        diff = []
        for los, dos, sz in segs:
            a = L[lo+los:lo+los+sz]
            b = D[do+dos:do+dos+sz]
            if a != b:
                # 定位到字段粒度
                for k in range(sz):
                    if a[k] != b[k]:
                        diff.append(f'legacy@{los+k}={a[k]:#x} vs dat64@{dos+k}={b[k]:#x}')
                        if len(diff) > 6:
                            break
                break
        if diff:
            bad += 1
            if len(first_bad) < 5:
                first_bad.append(f'槽{i}: ' + '; '.join(diff[:6]))
        else:
            ok += 1
    total_ok += ok; total_bad += bad
    print(f'{name:15} legacy(mu={lmu},lc={llc}) dat64(mu={dmu},lc={dlc})  一致槽={ok} 不一致={bad}')
    for line in first_bad[:4]:
        print('    ', line)
print(f'\n总计: 一致={total_ok} 不一致={total_bad}')
