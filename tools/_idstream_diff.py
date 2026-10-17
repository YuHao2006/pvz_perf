import struct

def walk(path, is64):
    d = open(path, 'rb').read()
    if is64:
        blen = struct.unpack_from('<I', d, 48)[0]; pos = 52 + blen
        pools = [('Zombie',368,376),('Plant',344,352),('Projectile',160,168),('Coin',216,224),
                 ('LawnMower',80,88),('GridItem',240,248),('ParticleSystem',72,80),
                 ('ParticleEmitter',208,216),('Particle',160,168),('Reanimation',176,184),
                 ('Attachment',776,780)]
        tsz = 112
    else:
        pos = 20 + 22108
        pools = [('Zombie',356,360),('Plant',328,332),('Projectile',144,148),('Coin',208,216),
                 ('LawnMower',68,72),('GridItem',232,236),('ParticleSystem',40,44),
                 ('ParticleEmitter',172,176),('Particle',156,160),('Reanimation',156,160),
                 ('Trail',232,236),('Attachment',776,780)]
        tsz = 96
    live = {}
    for name, rec, slot in pools:
        fh, mu, lc = struct.unpack_from('<III', d, pos)
        live[name] = lc
        pos += 16 + struct.unpack_from('<I', d, pos+12)[0]
    for _ in range(live['ParticleSystem']):
        pos += 4
        cnt = struct.unpack_from('<i', d, pos)[0]; pos += 4 + cnt*8
        for _ in range(cnt):
            pos += 8
            c2 = struct.unpack_from('<i', d, pos)[0]; pos += 4 + c2*8
    out = []
    for _ in range(live['Reanimation']):
        defid = struct.unpack_from('<i', d, pos)[0]; pos += 4
        ln = struct.unpack_from('<i', d, pos)[0]; pos += 4
        if ln == 0:
            out.append((defid, []))
            continue
        tc = ln // tsz
        pos += ln
        imgs = list(struct.unpack_from('<%di' % tc, d, pos)); pos += tc*4
        out.append((defid, imgs))
    return out

src = walk(r'C:/Users/Administrator/CLionProjects/codex/PlantsVsZombiesModern/out/modern-game/Release/log/endless/backup-current/game3_13.dat.programdata-1639-latest', False)
conv = walk(r'C:/Users/Administrator/AppData/Local/Temp/fwd_game3_58.dat64', True)
print(f'原版源档: {len(src)} 条; 转换器产: {len(conv)} 条')
n = min(len(src), len(conv))
skel = [(i, src[i][0], conv[i][0]) for i in range(n) if src[i][0] != conv[i][0]]
print(f'骨架(defID)差异: {len(skel)} {skel[:5]}')
tot = 0; diffs = []
for i in range(n):
    if src[i][0] != conv[i][0]:
        continue
    a, b = src[i][1], conv[i][1]
    if len(a) != len(b):
        diffs.append((i, src[i][0], f'len {len(a)}->{len(b)}'))
        continue
    for j, (x, y) in enumerate(zip(a, b)):
        if x != y:
            tot += 1
            if len(diffs) < 12:
                diffs.append((i, src[i][0], f'track{j}: {x} -> {y}'))
print(f'号值差异总数: {tot}')
for x in diffs[:12]:
    print('  ', x)
