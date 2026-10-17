#!/usr/bin/env python3
# frame_time.log 每行 = "Board::Draw_us update_to_draw_gap_us"
# 按连续 512 帧分桶输出 p50/p95，识别场景段（选卡/游戏中/过场）
import sys

path = sys.argv[1] if len(sys.argv) > 1 else "out/modern-game/Release/log/frame_time.log"
rows = []
with open(path) as f:
    for line in f:
        parts = line.split()
        if len(parts) == 2:
            try:
                rows.append((float(parts[0]), float(parts[1])))
            except ValueError:
                pass

def pct(v, p):
    s = sorted(v)
    return s[min(len(s) - 1, int(len(s) * p / 100))]

BUCKET = 512
print(f"frames={len(rows)}")
print(f"{'seg':>4} {'n':>4} {'draw_p50':>9} {'draw_p95':>9} {'gap_p50':>8} {'gap_p95':>8}")
for i in range(0, len(rows), BUCKET):
    seg = rows[i:i + BUCKET]
    d = [r[0] for r in seg]
    g = [r[1] for r in seg]
    print(f"{i//BUCKET:>4} {len(seg):>4} {pct(d,50):>9.1f} {pct(d,95):>9.1f} {pct(g,50):>8.1f} {pct(g,95):>8.1f}")
