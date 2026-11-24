"""Resolve machine-specific locations from the workspace configuration."""
import argparse
from functools import lru_cache
import json
import os
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


@lru_cache(maxsize=1)
def config():
    project = json.loads((ROOT/'config/workspace-paths.json').read_text(encoding='utf-8-sig'))
    path = (ROOT/os.environ.get('PVZ_PATHS_CONFIG', project['machineConfig'])).resolve()
    return path, json.loads(path.read_text(encoding='utf-8-sig')) if path.is_file() else {}


def workspace_path(key, relative=''):
    path, values = config()
    raw = values.get(key)
    if not raw:
        raise KeyError(f'Set {key} in {path} (or select a config with PVZ_PATHS_CONFIG)')
    if os.name != 'nt' and len(raw)>2 and raw[1:3] == ':/':
        if os.environ.get('WSL_DISTRO_NAME'):
            return (Path('/mnt')/raw[0].lower()/raw[3:]/relative).resolve()
        raise KeyError(f'Configure a native location for {key} in {path}')
    return (path.parent / raw / relative).resolve()


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('key')
    parser.add_argument('relative', nargs='?', default='')
    parser.add_argument('--optional', action='store_true')
    args = parser.parse_args()
    try:
        print(workspace_path(args.key, args.relative).as_posix())
    except KeyError as e:
        if not args.optional:
            parser.exit(1, str(e)+'\n')
