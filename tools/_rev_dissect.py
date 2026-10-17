import struct, re, os
def i32(d,o): return struct.unpack_from('<i',d,o)[0]
def u32(d,o): return struct.unpack_from('<I',d,o)[0]

def walk_pools(d, legacy):
    if legacy:
        pos = 20 + struct.unpack_from('<I', d, 16)[0]
        slots = [360,332,148,216,72,236,44,176,160,160]  # 10 池到 trail
    else:
        pos = 52 + struct.unpack_from('<I', d, 48)[0]
        slots = [376,352,168,224,88,248,80,216,168,184,780]
    names = ['Zombie','Plant','Proj','Coin','Mower','Grid','PSys','PEmit','Part','Reanim','Attach']
    lc = {}
    for k in range(len(slots)):
        fh,mu,l,c,X = struct.unpack_from('<IIIII', d, pos)[:4] + (struct.unpack_from('<I', d, pos+12)[0],)
        nm = names[k] if k < 11 else 'extra'
        lc[nm] = (mu, l, pos+16)
        pos = pos + 16 + X
    return lc, pos

def try_parse(d, start, end, ts, n):
    p = start; got=[]
    for _ in range(n):
        if p+8>end: return None
        defid=i32(d,p)
        if not (0<=defid<160): return None
        ln=i32(d,p+4)
        if ln<0 or ln%ts: return None
        tc=ln//ts
        if tc>250: return None
        nxt=p+8+ln+tc*4
        if nxt>end: return None
        for k in range(tc):
            im=i32(d,p+8+ln+k*4)
            if not (-2<=im<=2000): return None
        got.append((defid,tc,p+8,d[p+8:p+8+ln],[i32(d,p+8+ln+4*k) for k in range(tc)]))
        p=nxt
    return (p,got) if p==end else None

D = open('C:/Users/Administrator/AppData/Local/Temp/revtest/game3_58.dat64','rb').read()
L = open('C:/Users/Administrator/AppData/Local/Temp/revtest/game3_13.dat','rb').read()

lcd, dpos = walk_pools(D, legacy=False)
lcl, lpos = walk_pools(L, legacy=True)
print('dat64 池尾@', dpos, ' legacy trail 前@', lpos)
# legacy: trail 块 + 附件块
fh,mu,lc_,X = struct.unpack_from('<IIII', L, lpos); print('trail: mu=%d lc=%d len=%d' % (mu,lc_,X))
lpos2 = lpos+16+X
fh,mu,lc_,X = struct.unpack_from('<IIII', L, lpos2); print('附件: mu=%d lc=%d len=%d' % (mu,lc_,X))
supp_l_start = lpos2+16+X
supp_l_end = len(L) - 2056 - lc_*0  # trail defs = trail lc? 原版重存档 trail defs 数 = trail 池 live 数
supp_l_end = len(L) - 2056 - (0 if mu==0 else 0)
# trail defs 数量 = trail 池 lc（每 live trail 一个 def id）
trail_defs = struct.unpack_from('<III', L, lpos)[1]
supp_l_end = len(L) - 2056 - trail_defs*4
print('legacy 补流区 [%d, %d)' % (supp_l_start, supp_l_end))

n = lcd['Reanim'][1]
print('重动画 live =', n)
rd = try_parse(D, dpos, len(D)-2292, 112, n)      # dat64: 粒子补流在前! 起点要锚
# dat64 侧锚定粒子区后再解 reanim
hit=None
for p in range(dpos, dpos+12000):
    r = try_parse(D, p, len(D)-2292, 112, n)
    if r: hit=(p, r[1]); break
print('dat64 补流锚定@', hit[0] if hit else 'FAIL')
drecs = hit[1]
hit2=None
for p in range(supp_l_start, supp_l_start+12000):
    r = try_parse(L, p, supp_l_end, 96, n)
    if r: hit2=(p, r[1]); break
print('legacy 补流锚定@', hit2[0] if hit2 else 'FAIL')
lrecs = hit2[1]

# 对拍: 段变换 dat64 112 -> legacy 96
def to_legacy(dt):
    e = bytearray(96)
    e[0:40] = dt[0:40]
    e[52:68] = dt[64:80]
    e[72:96] = dt[88:112]
    return bytes(e)

bad_track = bad_img = 0
cases = []
allimgs = set()
for i, ((dd,dt,_,dtr,di),(ld,lt,_,ltr,li)) in enumerate(zip(drecs, lrecs)):
    assert dd==ld and dt==lt, (i, dd, ld, dt, lt)
    exp = to_legacy(dtr)
    allimgs |= set(di)
    if exp != ltr:
        bad_track += 1
        if len(cases)<6:
            bad=[k for k in range(96) if exp[k]!=ltr[k]][:10]
            cases.append((i, dd, bad, exp[bad[0]:bad[0]+8].hex(), ltr[bad[0]:bad[0]+8].hex()))
    if di != li:
        bad_img += 1
        if len(cases)<6:
            wb=[(k,di[k],li[k]) for k in range(dt) if di[k]!=li[k]][:6]
            cases.append((i, dd, 'IMG', wb))
print('轨道块(段变换后)不一致 =', bad_track, ' 图像表不一致 =', bad_img)
for c in cases: print('  ', c)
print('dat64 图像值集合:', sorted(allimgs))
# 1073 语义验证: defID 范围 / 图像 id 合法性
print('defID 集合:', sorted(set(x[0] for x in drecs)))
