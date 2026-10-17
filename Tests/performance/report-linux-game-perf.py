#!/usr/bin/env python3
"""Archive native Linux observations and plot the game-only endless timeline."""
import argparse
from collections import Counter
import csv
import hashlib
import json
import math
from pathlib import Path
import shutil

import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib.font_manager import FontProperties


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def analyze(source, destination, scene):
    metadata = json.loads((source / 'measurement.json').read_text())
    rows = list(csv.DictReader((source / 'samples.csv').open(newline='')))
    selected = [r for r in rows if r['segment'] == 'game']
    if metadata['status'] != 'complete' or not selected:
        raise ValueError(f'Incomplete run or no valid samples: {source}')
    expected_scene = '6' if scene == 'credits' else '3'
    if any(r['valid'] != '1' or r['scene'] != expected_scene or r['focused'] != '1'
           or (scene == 'endless' and r['mode'] != '58') for r in selected):
        raise ValueError(f'Inconsistent game sample flags: {source}')
    if metadata['game_affinity'] != [14] or metadata['observer_affinity'] != [15]:
        raise ValueError(f'Unexpected CPU affinity: {source}')
    seconds = sum(float(r['interval_s']) for r in selected)
    frames = sum(float(r['draw_fps']) * float(r['interval_s']) for r in selected)
    cpu_seconds = sum(float(r['cpu_percent']) * float(r['interval_s']) / 100 for r in selected)
    for key, value in [('valid_seconds', seconds), ('cpu_seconds', cpu_seconds),
                       ('fps_mean', frames / seconds)]:
        if not math.isclose(value, metadata[key], rel_tol=1e-9, abs_tol=1e-6):
            raise ValueError(f'Raw samples disagree with metadata {key}: {source}')
    fps = sorted(float(r['draw_fps']) for r in selected)
    frequency = [int(r['reported_cpu_khz']) for r in selected if r['reported_cpu_khz']]
    result = dict(scene=scene, source_directory=str(source.resolve()),
                  valid_samples=len(selected), seconds=seconds, draw_frames=round(frames),
                  cpu_seconds=cpu_seconds, fps_mean=frames / seconds,
                  cpu_percent=cpu_seconds / seconds * 100,
                  cpu_ms_per_draw_frame=cpu_seconds * 1000 / frames,
                  fps_min_1s=min(fps), fps_p10_1s=fps[int((len(fps)-1)*.1)],
                  cpu_peak_1s=max(float(r['cpu_percent']) for r in selected),
                  segment_counts=dict(Counter(r['segment'] for r in rows)),
                  reported_frequency_khz_range=[min(frequency), max(frequency)],
                  executable_sha256=metadata['executable_sha256'],
                  scale_config_sha256=metadata['scale_config_sha256'],
                  profile_sha256=metadata['profile_sha256'],
                  game_cpu=14, observer_cpu=15, constant_frequency_verified=False)
    if scene == 'endless':
        result['wave_range'] = [min(int(r['wave']) for r in selected),
                                max(int(r['wave']) for r in selected)]
        result['fixture_sha256'] = metadata['fixture_sha256']
    shutil.copy2(source / 'samples.csv', destination / f'{scene}-raw.csv')
    shutil.copy2(source / 'measurement.json', destination / f'{scene}-measurement.json')
    if (source / 'startup.log').exists():
        shutil.copy2(source / 'startup.log', destination / f'{scene}-startup.log')
    fields = list(rows[0])
    if 'cpu_ms_per_draw_frame' not in fields:
        fields.append('cpu_ms_per_draw_frame')
    with (destination / f'{scene}-analysis.csv').open('w', newline='') as stream:
        writer = csv.DictWriter(stream, fieldnames=fields)
        writer.writeheader()
        for row in rows:
            row = dict(row)
            row['cpu_ms_per_draw_frame'] = (
                float(row['cpu_percent']) * 10 / float(row['draw_fps'])
                if row['segment'] == 'game' and float(row['draw_fps']) > 0 else '')
            writer.writerow(row)
    return result, rows


def plot(rows, result, destination, font, max_ratio):
    times = [float(r['elapsed_s']) for r in rows]
    series = {}
    for field in ('draw_fps', 'cpu_percent', 'cpu_ms_per_draw_frame'):
        values = []
        for row in rows:
            value = float('nan')
            if row['segment'] == 'game':
                fps = float(row['draw_fps'])
                value = (float(row['cpu_percent']) * 10 / fps if fps > 0 else float('nan')) \
                    if field == 'cpu_ms_per_draw_frame' else float(row[field])
            values.append(value)
        series[field] = values
    fig, axes = plt.subplots(2, 1, figsize=(12, 6.8), sharex=True,
                             gridspec_kw={'height_ratios': [2, 1]})
    for field, color, label in [('draw_fps', '#157b49', '绘制帧率（FPS）'),
                                 ('cpu_percent', '#c44c28', 'CPU（单核 %）')]:
        axes[0].plot(times, series[field], color=color, linewidth=1.2, label=label)
    axes[0].set_ylim(0, 100)
    axes[0].set_ylabel('FPS / CPU %', fontproperties=font)
    axes[0].legend(prop=font, loc='lower left')
    frequency_label = f'锁 {max_ratio} 上限（用户确认）' if max_ratio else '最高倍频上限未人工确认'
    axes[0].set_title('pvz_perf / 原生 Ubuntu / Wayland / Vulkan · 统一无尽\n'
                      f'游戏 CPU14（低功耗 E 核）· 采集 CPU15 · {frequency_label}', fontproperties=font)
    axes[1].plot(times, series['cpu_ms_per_draw_frame'], color='#6551a0', linewidth=1.2)
    axes[1].axhline(result['cpu_ms_per_draw_frame'], color='#6551a0', linewidth=.8,
                    linestyle='--', label=f"整体 {result['cpu_ms_per_draw_frame']:.3f} ms/绘制帧")
    axes[1].set_ylabel('CPU ms / 绘制帧', fontproperties=font)
    axes[1].set_xlabel('按 Enter 开始观测后的时间（秒）', fontproperties=font)
    axes[1].set_ylim(bottom=0)
    axes[1].legend(prop=font, loc='upper left')
    for ax in axes:
        ax.set_xlim(0, max(times))
        ax.grid(alpha=.22)
    fig.text(.065, .014, '仅绘制 segment=game；剔除区间留缺口，不压缩时间、不平滑。'
             '上图范围 0–100，原始数据不裁剪。\n'
             '约 1 秒区间采样，非逐帧计时；FPS 为 mDrawCount 增量，不等同显示器呈现次数。',
             fontproperties=font, fontsize=9)
    fig.tight_layout(rect=(0, .065, 1, 1))
    for suffix in ('png', 'svg'):
        fig.savefig(destination / f'endless-timeline.{suffix}', dpi=160)
    plt.close(fig)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--credits', required=True, type=Path)
    parser.add_argument('--endless', required=True, type=Path)
    parser.add_argument('--destination', required=True, type=Path)
    parser.add_argument('--max-ratio', help='User-confirmed maximum ratio limit, e.g. 25x; not a constant operating frequency')
    parser.add_argument('--font', type=Path,
                        default=Path('/usr/share/fonts/opentype/noto/NotoSansCJK-Regular.ttc'))
    args = parser.parse_args()
    args.destination.mkdir(parents=True, exist_ok=False)
    reports = []
    for scene, source in [('credits', args.credits), ('endless', args.endless)]:
        result, rows = analyze(source, args.destination, scene)
        result['maximum_ratio_limit'] = args.max_ratio
        result['maximum_ratio_user_confirmed'] = bool(args.max_ratio)
        reports.append(result)
        if scene == 'endless':
            plot(rows, result, args.destination, FontProperties(fname=str(args.font)), args.max_ratio)
    payload = dict(
        selection='segment == game; validate valid == 1, expected scene/mode and focus',
        aggregation='CPU ms/draw frame = total valid process CPU time / total valid draw count; '
                    'FPS and CPU percentage weighted by real sample interval',
        limitations=[
            'One observation per scene, no repeated ABBA.',
            'CPU14 is Linux Core ID32; Windows LP14 physical identity not verified.',
            f'Maximum ratio limit {args.max_ratio or "not confirmed"}; user confirmation is separate from unchanged raw collector metadata. '
            'A maximum ratio limit allows downclocking and does not establish a constant operating frequency.',
            'Vulkan/GCC on Linux and DX12/MSVC on Windows are different configurations.',
            'No contemporaneous audio settings or customScale toggle snapshots were captured.',
            'One-second /proc CPU ticks and state endpoints cannot resolve individual frames or all transitions.',
        ], results=reports)
    (args.destination / 'summary.json').write_text(json.dumps(payload, ensure_ascii=False, indent=2)+'\n')
    (args.destination / 'manifest.json').write_text(json.dumps({
        p.name: dict(bytes=p.stat().st_size, sha256=sha(p))
        for p in sorted(args.destination.iterdir()) if p.is_file()
    }, indent=2)+'\n')
    print(json.dumps(payload, ensure_ascii=False, indent=2))


if __name__ == '__main__':
    main()
