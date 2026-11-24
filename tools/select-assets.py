"""Materialize a build view from the selected external asset library."""
from pathlib import Path
from contextlib import contextmanager
import argparse
import errno
import json
import os
import shutil
import subprocess
import sys
import time
import uuid

ROOT = Path(__file__).resolve().parents[1]
CONFIG = ROOT / 'config/workspace-paths.json'


def selected(explicit):
    config = json.loads(CONFIG.read_text(encoding='utf-8-sig'))
    raw = explicit or os.environ.get('PVZ_ASSET_LIBRARY') or config['assetLibrary']
    library = (ROOT / raw).resolve()
    edition = config['assetEdition']
    return library, edition


def safe_relative(name):
    p = Path(name)
    if p.is_absolute() or p.drive or '..' in p.parts:
        raise ValueError(f'Invalid path in library manifest: {name}')
    return p


def publish(source, dest):
    staging = dest.with_name('.pvz-link-' + uuid.uuid4().hex)
    try:
        try:
            os.link(source, staging)
        except OSError as error:
            if error.errno not in (errno.EXDEV, errno.EACCES, errno.EPERM, errno.ENOTSUP):
                raise
            shutil.copy2(source, staging)
        os.replace(staging, dest)
    finally:
        staging.unlink(missing_ok=True)


@contextmanager
def view_lock(path):
    with path.open('a+b') as handle:
        handle.seek(0)
        if os.name == 'nt':
            import msvcrt
            if path.stat().st_size == 0:
                handle.write(b'0')
                handle.flush()
            deadline = time.monotonic() + 120
            while True:
                handle.seek(0)
                try:
                    msvcrt.locking(handle.fileno(), msvcrt.LK_NBLCK, 1)
                    break
                except OSError:
                    if time.monotonic() > deadline:
                        raise RuntimeError(f'Asset view is being prepared by another process: {path}')
                    time.sleep(.25)
        else:
            import fcntl
            fcntl.flock(handle.fileno(), fcntl.LOCK_EX)
        yield


def sync(library, edition):
    manifest = json.loads((library/'library.json').read_text(encoding='utf-8-sig'))
    if manifest['format'] != 1:
        raise ValueError(f'Unsupported asset library: {library}')
    settings = manifest['editions'][edition]
    cache = ROOT/'out'/'selected-assets'
    cache.mkdir(parents=True, exist_ok=True)
    view = cache/'files'
    state = cache/'state.json'
    alias = ROOT/'assets'
    with view_lock(cache/'view.lock'):
        if os.path.lexists(alias) and alias.resolve() != view.resolve():
            raise ValueError(f'Existing assets directory is not this checkout’s generated view: {alias}')
        view.mkdir(exist_ok=True)
        old = json.loads(state.read_text(encoding='utf8')) if state.exists() else {}
        current = {}
        sources = {}
        for layer in settings['layers']:
            directory = library/safe_relative(layer)
            if not directory.is_dir():
                raise FileNotFoundError(directory)
            for here, dirs, files in os.walk(directory):
                for filename in files:
                    src=Path(here)/filename
                    key=src.relative_to(directory).as_posix()
                    st=src.stat()
                    sources[key]=src
                    current[key]=[layer,st.st_size,st.st_mtime_ns,st.st_dev,st.st_ino]
        if edition == 'pvz_perf-hd' and 'definitions/ui/Achievements.atlas.dsl' in sources:
            from hd_ui_bakes import derived_inputs, original_canvas_inputs
            overrides = original_canvas_inputs(sources, cache)
            sources.update(overrides)
            overrides.update(derived_inputs(sources, cache))
            for key,src in overrides.items():
                st=src.stat()
                sources[key]=src
                current[key]=['ui-bakes',st.st_size,st.st_mtime_ns,st.st_dev,st.st_ino]
        for key in old.keys()-current.keys():
            target=view/safe_relative(key)
            target.unlink(missing_ok=True)
        for key,src in sources.items():
            target=view/key
            if target.is_file():
                st=target.stat()
                stamp=current[key]
                if (st.st_dev,st.st_ino)==(stamp[3],stamp[4]) and st.st_ino:
                    continue
                previous=old.get(key)
                if previous and (st.st_size,st.st_mtime_ns)!=(previous[1],previous[2]):
                    raise ValueError(f'Locally edited asset view: {target}. Preserve the edit in {src} before refreshing.')
                if previous==stamp and (st.st_size,st.st_mtime_ns)==(stamp[1],stamp[2]):
                    continue
            target.parent.mkdir(parents=True,exist_ok=True)
            publish(src,target)
        for name in settings.get('emptyDirectories',[]):
            (view/safe_relative(name)).mkdir(parents=True,exist_ok=True)
        if current!=old:
            tmp=state.with_suffix('.new')
            tmp.write_text(json.dumps(current,ensure_ascii=False,separators=(',',':')),encoding='utf8')
            tmp.replace(state)
        if not os.path.lexists(alias):
            if os.name=='nt':
                # NTFS directory junctions do not require developer mode.
                cmd = "New-Item -ItemType Junction -Path $env:PVZ_VIEW_ALIAS -Target $env:PVZ_VIEW_TARGET -ErrorAction Stop | Out-Null"
                subprocess.run(['powershell.exe','-NoProfile','-NonInteractive','-Command',cmd],env=dict(os.environ,PVZ_VIEW_ALIAS=str(alias),PVZ_VIEW_TARGET=str(view)),check=True)
            else:
                alias.symlink_to(view.relative_to(ROOT),target_is_directory=True)
        if alias.resolve() != view.resolve():
            raise RuntimeError(f'Asset view is not bound: {alias}')


def main():
    cli=argparse.ArgumentParser(description=__doc__)
    cli.add_argument('--library', help='External library path, relative to the checkout or absolute')
    cli.add_argument('--print-layers',action='store_true')
    args=cli.parse_args()
    library,edition=selected(args.library)
    if args.print_layers:
        manifest=json.loads((library/'library.json').read_text(encoding='utf-8-sig'))
        for layer in manifest['editions'][edition]['layers']:
            print((library/safe_relative(layer)).as_posix())
        return
    sync(library,edition)

if __name__=='__main__':
    try:
        main()
    except (KeyError, ValueError, OSError, RuntimeError) as exc:
        sys.exit(f'Cannot select external assets: {exc}')
