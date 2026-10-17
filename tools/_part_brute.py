import struct, itertools
def i32(d,o): return struct.unpack_from('<i',d,o)[0]
def u32(d,o): return struct.unpack_from('<I',d,o)[0]
D = open(r'C:/Users/Administrator/AppData/Local/Temp/fwd_game3_58.dat64','rb').read()
START, END = 452736, 453464

def solvers(d, start, end):
    results = []
    def try_model(idu, extra_after_def):
        pos = start + 4 + extra_after_def
        if pos+4 > end: return
        n = i32(d, pos); pos += 4
        if not (0 <= n <= 64): return
        pos += n * idu
        if pos > end: return
        for k in range(n):
            if pos + 8 > end: return
            df = i32(d, pos); img = i32(d, pos+4); pos += 8
            if not (0 <= df < 4096 and -2 <= img <= 2000): return
            if pos + 4 > end: return
            cnt = i32(d, pos); pos += 4
            if not (0 <= cnt <= 1024): return
            pos += cnt * idu
            if pos > end: return
        if pos == end:
            results.append(('idu=%d extra=%d n=%d' % (idu, extra_after_def, n)))
    for idu in (4, 8):
        for extra in (0, 4, 8):
            try_model(idu, extra)
    return results

r = solvers(D, START, END)
print('粒子区解:', r)
# 手动细分: 按 idu=8, extra=0 打印
if r:
    idu = 8
    pos = START + 4
    n = i32(D, pos); pos += 4
    print('n=', n, 'ids:', [hex(u32(D, pos+8*k)) + ':' + hex(u32(D, pos+8*k+4)) for k in range(n)])
    pos += n*8
    for k in range(n):
        df = i32(D,pos); img = i32(D,pos+4); pos += 8
        cnt = i32(D,pos); pos += 4
        print(f'  发射器{k}: def={df} img={img} 粒子数={cnt}')
        for j in range(min(cnt,3)):
            a = u32(D,pos+8*j); b = u32(D,pos+8*j+4)
            print(f'     粒子{j}: {a:#x} {b:#x}')
        pos += cnt*8
    print('结束@', pos)
