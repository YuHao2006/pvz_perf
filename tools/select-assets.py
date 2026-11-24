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


def trimmed_almanac_images(sources, cache):
    """Tighten projected 600p artwork while preserving its original anchor."""
    import hashlib
    from PIL import Image

    output = cache / 'almanac-crops'
    output.mkdir(exist_ok=True)
    assets = {f'{page}_border_{i}': side for page in ('index', 'plant', 'zombie')
              for i, side in ((1, 'top'), (3, 'left'), (4, 'right'), (6, 'bottom'))}
    assets.update(plantdecor='watermark', zombiedecor='watermark')
    for name, side in assets.items():
        key = f'runtime/images/almanac/{name}.png'
        if key not in sources:
            continue
        source = sources[key]
        digest = hashlib.sha256(source.read_bytes()).hexdigest()
        dest = output / f'v1-{name}-{digest}.png'
        if not dest.exists():
            with Image.open(source) as original:
                image = original.convert('RGBA')
            box = image.getchannel('A').getbbox()
            if not box:
                yield key, source
                continue
            x, y, r, b = box
            bounds = [0, 0, image.width, image.height]
            # Edges skip one texel at draw time; keep another for filtering.
            if side == 'top':
                bounds[3] = min(image.height, b + 2)
            elif side == 'left':
                bounds[2] = min(image.width, r + 2)
            elif side == 'right':
                bounds[0] = max(0, x - 2)
            elif side == 'bottom':
                bounds[1] = max(0, y - 2)
            else:
                # Watermarks have a common bottom-left anchor in the 600p canvas.
                bounds[1] = max(0, y - 1)
                bounds[2] = min(image.width, r + 1)
            staging = dest.with_suffix('.tmp')
            image.crop(bounds).save(staging, format='PNG')
            staging.replace(dest)
        yield key, dest


def reviewed_animation_inputs(sources, cache):
    """Restore authored coordinates for compilers that expect full sprite canvases."""
    manifest = sources.get('definitions/reviewed-source-crops.json')
    if manifest is None:
        return
    import hashlib
    from PIL import Image

    output = cache / 'animation-canvases'
    output.mkdir(exist_ok=True)
    for key, record in json.loads(manifest.read_bytes())['images'].items():
        source = sources[record.get('master', key)]
        canvas = tuple(record['canvas'])
        left, top, right, bottom = record['bounds']
        st = source.stat()
        identity = (key, canvas, left, top, right, bottom, st.st_size, st.st_mtime_ns, st.st_ino)
        dest = output / (hashlib.sha256(repr(identity).encode()).hexdigest() + '.png')
        if not dest.exists():
            with Image.open(source) as part:
                if part.size != (right-left, bottom-top):
                    raise ValueError(f'Crop bounds disagree with {source}')
                image = Image.new('RGBA', canvas)
                image.paste(part.convert('RGBA'), (left, top))
            staging = dest.with_suffix('.tmp')
            image.save(staging, format='PNG')
            staging.replace(dest)
        yield key, dest


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
        if edition == 'pvz_perf':
            for key, src in reviewed_animation_inputs(sources, cache):
                st = src.stat()
                sources[key] = src
                current[key] = ['animation-canvases', st.st_size, st.st_mtime_ns, st.st_dev, st.st_ino]
            for key, src in trimmed_almanac_images(sources, cache):
                st = src.stat()
                sources[key] = src
                current[key] = ['almanac-crops', st.st_size, st.st_mtime_ns, st.st_dev, st.st_ino]
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
