import struct
from collections import Counter

def u32(d,o): return struct.unpack_from('<I',d,o)[0]

# 每池: (legacy slot, legacy rec, 被段表跳过的 legacy 区间)
POOLS = [
 ('Zombie', 360, 356, [(0,8)]),
 ('Plant', 332, 328, [(0,8)]),
 ('Projectile',148,144,[(0,8)]),
 ('Coin', 216, 208, [(0,8),(108,112)]),
 ('LawnMower',72,68,[(0,8)]),
 ('GridItem',236,232,[(0,8)]),
 ('ParticleSystem',44,40,[(4,28),(40,44)]),
 ('ParticleEmitter',176,172,[(0,24),(84,88)]),
 ('Particle',160,156,[(0,4)]),
 ('Reanimation',160,156,[(12,16),(88,92),(96,100)]),
]

def analyze(path, tag):
    d = open(path,'rb').read()
    pos = 20 + struct.unpack_from('<I', d, 16)[0]
    print(f'==== {tag} ({len(d)}B)')
    for name, slot, rec, skips in POOLS:
        fh, mu, lc, X = struct.unpack_from('<IIII', d, pos)
        base = pos + 16
        pos = base + X
        for (a,b) in skips:
            vals = Counter()
            nptr = nz = 0
            for i in range(mu):
                idv = u32(d, base+i*slot+rec)
                if not (idv & 0xFFFF0000):
                    continue
                v = d[base+i*slot+a : base+i*slot+b]
                if any(v):
                    nz += 1
                    # 指针样: 非零字节集中在低 3-4 字节, 高字节为 0, 值域 ~0x00100000-0x7fffffff
                    words = [u32(v, k) for k in range(0, len(v)-3)]
                    looks_ptr = all(0x00100000 <= w <= 0x7fffffff for w in words if w != 0)
                    if looks_ptr: nptr += 1
                    vals[v.hex()] += 1
            live = lc
            if nz == 0:
                print(f'  {name:15} [{a}:{b}] 全零 (live={live})')
            else:
                top = vals.most_common(3)
                print(f'  {name:15} [{a}:{b}] 非零={nz}/{live} 指针样={nptr} 样本={top}')

analyze(r'C:/Users/Administrator/CLionProjects/codex/PlantsVsZombiesModern/out/modern-game/Release/log/endless/backup-current/game3_13.dat.programdata-1639-latest', '原版自产 1639')
analyze(r'C:/ProgramData/PopCap Games/PlantsVsZombies/userdata/game3_13.dat', '原版重存 1732')
