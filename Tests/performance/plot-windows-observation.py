"""Plot the existing external Windows observation and optionally a prior run."""
import argparse
import csv
import os
from pathlib import Path
from runpy import run_path


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('directory', type=Path)
    parser.add_argument('--label', default='pvz_perf / Vulkan')
    parser.add_argument('--baseline', type=Path)
    parser.add_argument('--no-open', action='store_true')
    args = parser.parse_args()
    image = run_path(str(Path(__file__).with_name('observe-windows-game.py')))['plot_samples'](args.directory, args.label)
    if image is None:
        raise SystemExit('No active gameplay samples to plot.')
    if args.baseline:
        import matplotlib
        matplotlib.use('Agg')
        import matplotlib.pyplot as plt
        fig, axis = plt.subplots(figsize=(14, 6))
        cpu = axis.twinx()
        for directory, label, color in [(args.baseline, 'Before', '#3259aa'), (args.directory, 'Candidate', '#13834b')]:
            with (directory / 'samples.csv').open(encoding='utf-8-sig', newline='') as stream:
                rows = list(csv.DictReader(stream))
            active = [r for r in rows if r['segment'] == 'game']
            if not active:
                raise SystemExit(f'No gameplay samples: {directory}')
            origin = float(active[0]['elapsed_s'])
            times = [float(r['elapsed_s']) - origin for r in rows]
            values = lambda field: [float(r[field]) if r['segment'] == 'game' and r[field] else float('nan') for r in rows]
            axis.plot(times, values('draw_fps'), color=color, label=f'{label} FPS')
            cpu.plot(times, values('cpu_percent'), color=color, linestyle='--', alpha=.65, label=f'{label} CPU %')
        axis.set(xlabel='Seconds from first active sample', ylabel='FPS', ylim=(0, 255), title='Same checkpoint comparison | chronological time; battle trajectories may differ')
        cpu.set(ylabel='Process CPU % (one core = 100%)', ylim=(0, 110))
        axis.grid(alpha=.2)
        lines = axis.get_lines() + cpu.get_lines()
        axis.legend(lines, [line.get_label() for line in lines], loc='lower right')
        fig.tight_layout()
        image = args.directory / 'comparison.png'
        fig.savefig(image, dpi=150)
        plt.close(fig)
    print(image.resolve())
    if not args.no_open:
        os.startfile(image.resolve())


if __name__ == '__main__':
    main()
