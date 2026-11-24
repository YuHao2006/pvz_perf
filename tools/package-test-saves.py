"""Create a completed test profile and include the canonical endless checkpoint."""

from endless_checkpoint import completed_profile, convert, original

import argparse
import json
from pathlib import Path
import struct
import subprocess
import tempfile
import zipfile


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--version", default="current")
    parser.add_argument("--format", choices=("dat64-v4", "dat64-v5"), default="dat64-v5")
    parser.add_argument("--converter", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--perfect-output", type=Path, help="Optional completed-profile-only ZIP")
    parser.add_argument("--benchmark-output", type=Path, help="Optional independently named full benchmark ZIP")
    args = parser.parse_args()
    retail = original()
    profile = completed_profile()
    name = b"PerfTest"
    summary = struct.pack("<IHH", 14, 1, len(name)) + name + struct.pack("<II", 1, 1)
    converter = args.converter.resolve()
    with tempfile.TemporaryDirectory(prefix="pvz-completed-profile-") as temporary:
        directory = Path(temporary)
        dat64 = directory / "user1.dat64"
        dat = directory / "user1.dat"
        roundtrip = directory / "roundtrip.dat64"
        dat64.write_bytes(profile)
        for source, target in ((dat64, dat), (dat, roundtrip)):
            subprocess.run([str(converter), str(source), str(target)], check=True)
        if roundtrip.read_bytes() != profile:
            raise ValueError("Completed profile DAT64/DAT roundtrip differs")
        checkpoint = directory / "game1_58.dat64"
        convert(converter, checkpoint, args.format)
        checkpoint_bytes = checkpoint.read_bytes()
        if (checkpoint_bytes[:8] != b"PVZDAT64"
                or struct.unpack_from("<I", checkpoint_bytes, 8)[0] != (5 if args.format == "dat64-v5" else 4)
                or struct.unpack_from("<II", checkpoint_bytes, 36) != ((0x10747 if args.format == "dat64-v5" else 0x10745), (1 if args.format == "dat64-v5" else 0))):
            raise ValueError("Modern checkpoint has the wrong target format")
        args.output.parent.mkdir(parents=True, exist_ok=True)
        with zipfile.ZipFile(args.output, "x", zipfile.ZIP_DEFLATED) as archive:
            archive.writestr("data/users.dat", summary)
            archive.writestr("data/user1.dat64", profile)
            archive.write(checkpoint, "data/game1_58.dat64")
            archive.writestr("retail/users.dat", summary)
            archive.write(dat, "retail/user1.dat")
            archive.write(retail, "retail/game1_13.dat")
            archive.writestr("README.txt",
                f"pvz_perf {args.version} test saves\n\n"
                "Exit the game. Extract data/ beside pvz_perf.exe in a fresh test directory.\n"
                "Profile: PerfTest / ID1. This replaces the destination's profile summary.\n"
                "Completed profile: two adventure completions, all challenge trophies,\n"
                "all five normal survivals at five flags and five hard survivals at ten flags,\n"
                "20 achievements, ten seed slots, permanent store upgrades and coins.\n"
                "Wisdom tree: 1000. Zen garden and custom Zombatars are empty.\n"
                "No personal user profile is included; this profile is generated for testing.\n\n"
                f"data/game1_58.dat64 is the Tests endless benchmark converted to {args.format}.\n"
                "The converter verifies that all saved semantics are preserved.\n"
                "Do not advance it and reuse the progressed checkpoint as a new baseline.\n"
                "Re-extract the benchmark before each comparison.\n"
                "retail/ contains equivalent profile/checkpoint files for original 1073.\n"
                "Project mode 58 and retail mode 13 refer to the same endless mode.\n")
        with zipfile.ZipFile(args.output) as archive:
            if archive.testzip():
                raise ValueError("Save archive CRC validation failed")
    if args.perfect_output:
        args.perfect_output.parent.mkdir(parents=True, exist_ok=True)
        with zipfile.ZipFile(args.output) as source, zipfile.ZipFile(
                args.perfect_output, "x", zipfile.ZIP_DEFLATED) as archive:
            for name in ("data/users.dat", "data/user1.dat64"):
                archive.writestr(name, source.read(name))
            archive.writestr("readme.txt", (
                "桌面版存档目录在程序目录的data子文件夹下,"
                "安卓存档目录在Android/media/com.openpvz.perf\n").encode("utf-8-sig"))
    if args.benchmark_output:
        import shutil
        args.benchmark_output.parent.mkdir(parents=True, exist_ok=True)
        with args.output.open("rb") as source, args.benchmark_output.open("xb") as target:
            shutil.copyfileobj(source, target)
    print(json.dumps({"archive": str(args.output.resolve()),
                      "completed_profile": True, "endless_benchmark": True,
                      "profile_roundtrip": "identical"}, indent=2))


if __name__ == "__main__":
    main()
