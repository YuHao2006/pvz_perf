#!/usr/bin/env python3
"""Launch on CPU14 and read existing game counters from an observer on CPU15."""
import argparse
import ctypes as c
from datetime import datetime
import csv
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import shutil
import struct
import subprocess
import sys
import time

ROOT = Path(__file__).resolve().parents[2]
spec = importlib.util.spec_from_file_location('linux_cpu', Path(__file__).with_name('measure-linux-process.py'))
cpu = importlib.util.module_from_spec(spec)
spec.loader.exec_module(cpu)


def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def prepare(build):
    game = build / 'Release/pvz_perf'
    tool = build / 'Tests/performance/build/pvz_game_perf_layout'
    layout = json.loads(subprocess.check_output([str(tool)], text=True))
    if layout['pointerBytes'] != 8:
        raise RuntimeError('This runner currently supports x64 builds only')
    data = dict(layout=layout, executable_sha256=sha(game), layout_tool_sha256=sha(tool))
    target = build / 'Tests/performance/build/linux-perf-layout.json'
    target.write_text(json.dumps(data, indent=2) + '\n')
    launcher = game.parent / 'measure-endless.sh'
    launcher.write_text(
        '#!/bin/sh\nset -eu\n'
        'GAME_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)\n'
        'PROJECT_ROOT=$(CDPATH= cd -- "$GAME_DIR/../../.." && pwd)\n'
        'exec python3 "$PROJECT_ROOT/Tests/performance/run-linux-game-perf.py" '
        '--build-dir "$GAME_DIR/.." --scene endless "$@"\n')
    launcher.chmod(0o755)
    print(f'Prepared matching game/layout: {target}')


class Iovec(c.Structure):
    _fields_ = [('base', c.c_void_p), ('length', c.c_size_t)]


class Reader:
    def __init__(self, pid, executable, layout):
        self.pid, self.layout = pid, layout
        self.libc = c.CDLL(None, use_errno=True)
        self.libc.process_vm_readv.argtypes = [c.c_int, c.POINTER(Iovec), c.c_ulong,
                                              c.POINTER(Iovec), c.c_ulong, c.c_ulong]
        self.libc.process_vm_readv.restype = c.c_ssize_t
        # ELF PIE addresses are relative to the mapping's file offset.
        mappings = []
        for line in Path(f'/proc/{pid}/maps').read_text().splitlines():
            fields = line.split(maxsplit=5)
            if len(fields) == 6 and fields[5] == str(executable):
                mappings.append(int(fields[0].split('-')[0], 16) - int(fields[2], 16))
        if not mappings:
            raise RuntimeError('Cannot find the game ELF mapping')
        symbols = subprocess.check_output(['nm', '--defined-only', str(executable)], text=True)
        symbol = next((int(s.split()[0], 16) for s in symbols.splitlines()
                       if len(s.split()) == 3 and s.split()[2] == 'gLawnApp'), None)
        if symbol is None:
            raise RuntimeError('The executable must retain its gLawnApp symbol')
        self.app_pointer = min(mappings) + symbol

    def read(self, address, fmt):
        size = struct.calcsize(fmt)
        buffer = c.create_string_buffer(size)
        local, remote = Iovec(c.addressof(buffer), size), Iovec(address, size)
        count = self.libc.process_vm_readv(self.pid, c.byref(local), 1, c.byref(remote), 1, 0)
        if count != size:
            raise RuntimeError(f'Cannot read game memory at {address:#x}: '
                               f'{os.strerror(c.get_errno())}; run the game through this parent runner')
        return struct.unpack(fmt, buffer.raw)[0]

    def snapshot(self):
        app = self.read(self.app_pointer, '<Q')
        if not app:
            raise RuntimeError('Game application is not initialized')
        result = {name: self.read(app + self.layout[name], '<I')
                  for name in ('mDrawCount', 'mUpdateCount', 'mGameScene', 'mGameMode')}
        result['focused'] = self.read(app + self.layout['mHasFocus'], '<?')
        result['board'] = self.read(app + self.layout['mBoard'], '<Q')
        if result['mGameScene'] > 7 or result['mGameMode'] > 72:
            raise RuntimeError('Game state contradicts the prepared memory layout')
        result['paused'], result['counter'], result['wave'] = True, None, None
        if result['board']:
            for field in ('paused', 'counter', 'wave'):
                result[field] = self.read(result['board'] + self.layout['board'][field],
                                          '<?' if field == 'paused' else '<I')
        return result


def segment(previous, current, scene):
    if not previous['focused'] or not current['focused']:
        return 'background'
    expected = 3 if scene == 'endless' else 6
    if previous['mGameScene'] != expected or current['mGameScene'] != expected:
        return 'other-scene'
    if scene == 'endless':
        if previous['mGameMode'] != 58 or current['mGameMode'] != 58:
            return 'other-mode'
        if not current['board'] or previous['board'] != current['board']:
            return 'board-transition'
        if previous['paused'] or current['paused']:
            return 'paused'
        if current['counter'] <= previous['counter']:
            return 'not-advancing'
    return 'game'


def pin_initialized_threads(pid):
    corrected = []
    # Audio/driver libraries may explicitly broaden new workers' inherited mask.
    # Fix initialized workers before sampling, then reject any later drift.
    for _ in range(3):
        for thread in Path(f'/proc/{pid}/task').iterdir():
            tid = int(thread.name)
            try:
                allowed = os.sched_getaffinity(tid)
                if allowed != {14}:
                    name = (thread / 'comm').read_text().strip()
                    os.sched_setaffinity(tid, {14})
                    corrected.append(dict(tid=tid, name=name, previous=sorted(allowed)))
            except (FileNotFoundError, ProcessLookupError):
                continue
        try:
            cpu.check_affinity(pid, 14)
            return corrected
        except RuntimeError:
            continue
    raise RuntimeError('Game worker affinities did not stabilize on CPU14')


def run(args, build):
    if sys.platform != 'linux' or 'microsoft' in os.uname().release.lower():
        raise RuntimeError('Native Linux is required')
    allowed = os.sched_getaffinity(0)
    if not {14, 15} <= allowed:
        raise RuntimeError(f'CPU14 and CPU15 must both be available; allowed={sorted(allowed)}')
    if (args.seconds is not None and args.seconds < 5) or args.warmup < 0:
        raise RuntimeError('Use at least 5 seconds and a nonnegative warmup')
    if not args.non_interactive and not sys.stdin.isatty():
        raise RuntimeError('Interactive mode needs a terminal; use --non-interactive for a smoke check')
    game = (build / 'Release/pvz_perf').resolve()
    tool_dir = build / 'Tests/performance/build'
    manifest = json.loads((tool_dir / 'linux-perf-layout.json').read_text())
    if sha(game) != manifest['executable_sha256'] or sha(tool_dir / 'pvz_game_perf_layout') != manifest['layout_tool_sha256']:
        raise RuntimeError('Game/layout changed; rebuild target pvz_linux_perf_tools before measuring')
    # Do not replace a live game's checkpoint.
    for directory in Path('/proc').iterdir():
        if not directory.name.isdigit():
            continue
        try:
            if (directory / 'exe').resolve().name == 'pvz_perf':
                raise RuntimeError('Close the running game before starting another measurement')
        except (FileNotFoundError, PermissionError):
            pass
    data_dir = Path(os.environ.get('PVZ_APPDATA_DIR', str(Path.home() / '.local/share/PlantsVsZombiesModern'))).resolve()
    if data_dir.is_relative_to(ROOT / 'Tests'):
        raise RuntimeError('Never use the canonical Tests directory as writable game data')
    fixture = ROOT / 'Tests/game3_58.dat64'
    expected_hash = json.loads((ROOT / 'Tests/manifest.json').read_text())['project']['sha256']
    if sha(fixture) != expected_hash:
        raise RuntimeError('The canonical endless fixture checksum changed')
    if args.scene == 'endless':
        # The prepared completed profile is ID1; keep its original benchmark state each run.
        profile = (data_dir / 'user1.dat64').read_bytes()
        if profile[:8] != b'PVZUSR64':
            raise RuntimeError('Expected the prepared DAT64 profile ID1')
        shutil.copyfile(fixture, data_dir / 'game1_58.dat64')
    output = args.output or build / 'measurements' / f'{args.scene}-{datetime.now():%Y%m%d-%H%M%S-%f}'
    output = output.resolve()
    output.mkdir(parents=True, exist_ok=False)
    os.sched_setaffinity(0, {15})
    (output / 'game-log').mkdir()
    env = dict(os.environ, PVZ_APPDATA_DIR=str(data_dir), PVZ_LOG_DIR=str(output / 'game-log'),
               PVZ_SCALE_CONFIG_FILE=str(game.parent / 'scale.json'))
    metadata = dict(schema=1, status='starting', scene=args.scene,
                    executable=str(game), executable_sha256=sha(game),
                    layout=manifest, game_affinity=[14], observer_affinity=sorted(os.sched_getaffinity(0)),
                    cpu_before=cpu.cpu_information(14), observer_cpu=cpu.cpu_information(15),
                    frame_metric='existing mDrawCount delta per real monotonic interval; produced draw frames, not display presents',
                    cpu_basis='process user+system ticks; one logical CPU = 100%',
                    frequency_policy='Affinity only; no fixed clock ratio configured or claimed',
                    fixture_sha256=expected_hash if args.scene == 'endless' else None,
                    scale_config_sha256=sha(game.parent / 'scale.json'),
                    profile_sha256=sha(data_dir / 'user1.dat64'), sample_interval_s=1,
                    warmup_seconds=args.warmup, formal_measurement=False,
                    duration_limit_seconds=args.seconds,
                    limitation='Menu/paused/background/transition samples are excluded. '
                    'No independent verification of XWayland/Wayland visible presents or hardware clock ratio.')
    rows, process = [], None
    try:
        with (output / 'startup.log').open('w') as log:
            process = subprocess.Popen(['taskset', '-c', '14', str(game)],
                                       cwd=game.parent, env=env, stdout=log, stderr=subprocess.STDOUT)
        metadata['pid'] = process.pid
        print(f'游戏 PID={process.pid} → LP14；采集器 → LP15\n输出：{output}', flush=True)
        time.sleep(args.warmup)
        if process.poll() is not None:
            raise RuntimeError(f'Game exited during startup; see {output}/startup.log')
        metadata['initialized_worker_affinity_corrections'] = pin_initialized_threads(process.pid)
        if not args.non_interactive:
            input(f'准备好 {args.scene} 场景后按 Enter 开始采集，随后切回游戏。退出游戏结束采集。')
        reader = Reader(process.pid, game, manifest['layout'])
        metadata['initialized_worker_affinity_corrections'].extend(pin_initialized_threads(process.pid))
        cpu.check_affinity(process.pid, 14)
        previous = reader.snapshot()
        previous_ticks, identity = cpu.process_ticks(process.pid)
        begin = last = time.monotonic()
        tick_hz = os.sysconf('SC_CLK_TCK')
        metadata['clock_ticks_per_second'] = tick_hz
        stop_reason = 'duration'
        fields = ['elapsed_s', 'interval_s', 'draw_fps', 'update_hz', 'cpu_percent',
                  'draw_count', 'update_count', 'scene', 'mode', 'wave', 'board_counter',
                  'focused', 'valid', 'segment', 'cpu_ms_per_draw_frame', 'reported_cpu_khz']
        with (output / 'samples.csv').open('w', newline='') as stream:
            writer = csv.DictWriter(stream, fieldnames=fields)
            writer.writeheader()
            while args.seconds is None or last - begin < args.seconds:
                target = begin + len(rows) + 1
                if args.seconds is not None:
                    target = min(target, begin + args.seconds)
                time.sleep(max(0, target - time.monotonic()))
                if process.poll() is not None:
                    stop_reason = 'game-exit'
                    break
                try:
                    cpu.check_affinity(process.pid, 14)
                    if os.sched_getaffinity(0) != {15}:
                        raise RuntimeError('Observer affinity changed')
                    current = reader.snapshot()
                    ticks, current_identity = cpu.process_ticks(process.pid)
                except (OSError, RuntimeError) as error:
                    try:
                        process.wait(timeout=0.2)
                    except subprocess.TimeoutExpired:
                        raise error
                    stop_reason = 'game-exit'
                    break
                now = time.monotonic()
                if identity != current_identity:
                    raise RuntimeError('Game process identity changed')
                interval = now - last
                frames = (current['mDrawCount'] - previous['mDrawCount']) & 0xffffffff
                label = segment(previous, current, args.scene)
                if not args.non_interactive and now - begin <= 3:
                    label = 'preroll'
                row = dict(elapsed_s=now-begin, interval_s=interval,
                           draw_fps=frames/interval,
                           update_hz=((current['mUpdateCount']-previous['mUpdateCount']) & 0xffffffff)/interval,
                           cpu_percent=(ticks-previous_ticks)/tick_hz/interval*100,
                           draw_count=current['mDrawCount'], update_count=current['mUpdateCount'],
                           scene=current['mGameScene'], mode=current['mGameMode'], wave=current['wave'],
                           board_counter=current['counter'], focused=int(current['focused']),
                           valid=int(label=='game'), segment=label,
                           cpu_ms_per_draw_frame=((ticks-previous_ticks)/tick_hz*1000/frames
                                                  if frames and label=='game' else ''),
                           reported_cpu_khz=cpu.cpu_information(14)['cpufreq/scaling_cur_freq'])
                writer.writerow(row)
                stream.flush()
                rows.append(row)
                print(f"{now-begin:6.1f}s | FPS {row['draw_fps']:7.1f} | CPU {row['cpu_percent']:6.1f}% | {label}", flush=True)
                previous, previous_ticks, last = current, ticks, now
        valid = [row for row in rows if row['valid']]
        duration = sum(row['interval_s'] for row in valid)
        frames = sum(row['draw_fps']*row['interval_s'] for row in valid)
        cpu_seconds = sum(row['cpu_percent']*row['interval_s']/100 for row in valid)
        metadata.update(status='complete' if valid else 'no-valid-game-samples',
                        stop_reason=stop_reason, samples=len(rows), valid_samples=len(valid),
                        valid_seconds=duration, draw_frames=round(frames), cpu_seconds=cpu_seconds,
                        fps_mean=frames/duration if duration else None,
                        cpu_percent=cpu_seconds/duration*100 if duration else None,
                        cpu_ms_per_draw_frame=cpu_seconds*1000/frames if frames else None,
                        final_state=previous, cpu_after=cpu.cpu_information(14))
    except BaseException as error:
        metadata.update(status='failed', error=str(error))
        raise
    finally:
        # Short smoke checks can terminate their child. Normal interactive use leaves
        # it open so the user can exit through the game and save normally.
        if process and args.close_on_finish and process.poll() is None:
            process.terminate()
            try:
                process.wait(timeout=10)
            except subprocess.TimeoutExpired:
                process.kill()
                process.wait()
        (output / 'measurement.json').write_text(json.dumps(metadata, indent=2) + '\n')
    print(f"采集结束：{metadata['status']}；有效游戏样本 {metadata['valid_samples']}。", flush=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--backend', choices=['x11', 'wayland'], default='x11')
    parser.add_argument('--scene', choices=['endless', 'credits'], default='endless')
    parser.add_argument('--seconds', type=float, default=None,
                        help='Optional time limit; by default collect until the game exits')
    parser.add_argument('--warmup', type=float, default=8)
    parser.add_argument('--output', type=Path)
    parser.add_argument('--build-dir', type=Path)
    parser.add_argument('--prepare', action='store_true')
    parser.add_argument('--non-interactive', action='store_true')
    parser.add_argument('--close-on-finish', action='store_true')
    args = parser.parse_args()
    build = (args.build_dir or ROOT / f'out/x64-{args.backend}-vulkan').resolve()
    try:
        prepare(build) if args.prepare else run(args, build)
    except (OSError, RuntimeError, ValueError, KeyError, subprocess.CalledProcessError) as error:
        parser.exit(1, f'Linux performance runner: {error}\n')


if __name__ == '__main__':
    main()
