"""Archive an exact Git revision with the external effects and generated test saves."""

import argparse
from pathlib import Path
import runpy
import subprocess
import zipfile

packager = runpy.run_path(str(Path(__file__).with_name("package-windows-release.py")))
effect_files = packager["effect_files"]
read_test_saves = packager["read_test_saves"]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--revision", default="HEAD")
    parser.add_argument("--version", default="v1.1")
    parser.add_argument("--effects-directory", type=Path, required=True)
    parser.add_argument("--test-saves", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    root = Path(__file__).resolve().parents[1]
    prefix = "pvz_perf-" + args.version + "/"
    if args.output.exists():
        raise FileExistsError(args.output)
    args.output.parent.mkdir(parents=True, exist_ok=True)
    subprocess.run(["git", "archive", "--format=zip", "--prefix=" + prefix,
                    "--output=" + str(args.output.resolve()), args.revision],
                   cwd=root, check=True)
    with zipfile.ZipFile(args.output, "a", zipfile.ZIP_DEFLATED) as archive:
        present = set(archive.namelist())
        for relative, source in effect_files(args.effects_directory):
            name = prefix + relative
            contents = source.read_bytes()
            if name in present:
                if archive.read(name).replace(b"\r\n", b"\n") != contents.replace(b"\r\n", b"\n"):
                    raise ValueError("Tracked and staged effect contents differ: " + name)
            else:
                archive.writestr(name, contents)
        for relative, contents in read_test_saves(args.test_saves).items():
            archive.writestr(prefix + "test-saves/" + relative, contents)
    with zipfile.ZipFile(args.output) as archive:
        if archive.testzip():
            raise ValueError("Source archive CRC verification failed")
    print(args.output.resolve())


if __name__ == "__main__":
    main()
