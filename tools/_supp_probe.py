import struct
LEGACY = r'C:/Users/Administrator/CLionProjects/codex/PlantsVsZombiesModern/out/modern-game/Release/log/endless/backup-current/game3_13.dat.programdata-1639-latest'
DAT64  = r'C:/Users/Administrator/AppData/Local/Temp/fwd_game3_58.dat64'

# 各池 live 槽 ID 列表（按槽序）
def live_ids(d, base, rec, slot, mu):
    out = []
    for i in range(mu):
        v = struct.unpack_from('<I', d, base + i*slot + rec)[0]
        if v & 0xFFFF0000:
            out.append((i, v))
    return out

def supplement_start_legacy(d):
    pos = 20 + struct.unpack_from('<I', d, 16)[0]
    for slot in [360,332,148,216,72,236,44,176,160,160]:
        fh, mu, lc, X = struct.unpack_from('<IIII', d, pos)
        base = pos+16
        if slot == 160:  # reanim 池(第10个)位置，暂存
            pass
        pos = base + X
    trail = pos
    th = struct.unpack_from('<IIII', d, trail)
    att = trail+16+th[3]
    ah = struct.unpack_from('<IIII', d, att)
    return att+16+ah[3], (ah[1], ah[2])

def supplement_start_dat64(d):
    pos = 52 + struct.unpack_from('<I', d, 48)[0]
    for slot in [376,352,168,224,88,248,80,216,168,184,780]:
        fh, mu, lc, X = struct.unpack_from('<IIII', d, pos)
        base = pos+16
        pos = base + X
    return pos

L = open(LEGACY,'rb').read()
D = open(DAT64,'rb').read()

# legacy: 走粒子系统补流（1 个系统）
lpos, catt = supplement_start_legacy(L)
print('legacy 附件池(mu=%d,lc=%d)结束 @%d, 尾48字节:' % (catt[0], catt[1], lpos), L[lpos:lpos+48].hex(' '))
# 粒子系统补流: [i32 defID][i32 n][ids...]
ps_def, ps_n = struct.unpack_from('<ii', L, lpos)
print('粒子系统补流: defID=%d emitter数=%d' % (ps_def, ps_n))
p = lpos + 8 + ps_n*4
for k in range(ps_n):
    edef, eimg, pn = struct.unpack_from('<iii', L, p)
    print('  emitter%d: def=%d img=%d particles=%d' % (k, edef, eimg, pn))
    p += 12 + pn*4
print('粒子补流结束 @%d, 之后48字节:' % p, L[p:p+48].hex(' '))
