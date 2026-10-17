import struct

def i32(d, o): return struct.unpack_from('<i', d, o)[0]

def parse_supp(d, start, ts, n, expect_end):
    pos = start
    out = []
    for i in range(n):
        defid = i32(d, pos)
        ln = i32(d, pos + 4)
        tc = ln // ts
        tracks = d[pos+8 : pos+8+ln]
        imgs = [i32(d, pos+8+ln+4*k) for k in range(tc)]
        out.append((defid, tc, tracks, imgs))
        pos = pos + 8 + ln + tc*4
    assert pos == expect_end, (pos, expect_end)
    return out

# legacy 96B 段表 → dat64 112B: {0→0:40, 52→64:16, 72→88:24}
def transform(lt):
    e = bytearray(112)
    e[0:40]   = lt[0:40]
    e[64:80]  = lt[52:68]
    e[88:112] = lt[72:96]
    return bytes(e)

L = open(r'out/modern-game/Release/log/endless/backup-current/game3_13.dat.programdata-1639-latest','rb').read()
D = open(r'C:/Users/Administrator/AppData/Local/Temp/fwd_game3_58.dat64','rb').read()

lsupp = parse_supp(L, 423592, 96, 100, 519392)
dsupp = parse_supp(D, 453464, 112, 100, 564464)

# 粒子区全字节比对
lp = L[422864:423592]
dp = D[452736:453464]
print('粒子区: legacy %dB vs dat64 %dB, 全字节相同=%s' % (len(lp), len(dp), lp == dp))
if lp != dp:
    diffs = [k for k in range(728) if lp[k] != dp[k]]
    print('  粒子区差异字节数:', len(diffs), '首个@', diffs[0] if diffs else '-')

# 重动画补流内容对拍
track_diff = img_diff = pad_nonzero = 0
first_cases = []
limg_all, dimg_all = set(), set()
for i, ((ld, lt, ltr, li), (dd, dt, dtr, di)) in enumerate(zip(lsupp, dsupp)):
    assert ld == dd and lt == dt
    limg_all |= set(li); dimg_all |= set(di)
    exp = transform(ltr)
    if exp != dtr:
        track_diff += 1
        bad = [k for k in range(112) if exp[k] != dtr[k]]
        if len(first_cases) < 8:
            first_cases.append((i, ld, bad[:12], 'exp', exp[bad[0]:bad[0]+8].hex(), 'act', dtr[bad[0]:bad[0]+8].hex()))
    if li != di:
        img_diff += 1
        if len(first_cases) < 8:
            wb = [(k, li[k], di[k]) for k in range(lt) if li[k] != di[k]][:6]
            first_cases.append((i, ld, 'IMG', wb))
print()
print('重动画补流 100 条: 轨道块(段变换后)不一致=%d, 图像表不一致=%d' % (track_diff, img_diff))
for c in first_cases:
    print('  ', c)
print()
print('legacy 图像值集合(%d 个):' % len(limg_all), sorted(limg_all))
print('dat64  图像值集合(%d 个):' % len(dimg_all), sorted(dimg_all))
print('集合相同=%s' % (limg_all == dimg_all))
