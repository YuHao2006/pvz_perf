"""Install the generated completed profile as a new user, preserving existing users."""
from __future__ import annotations

import argparse
from datetime import datetime
from pathlib import Path
import shutil
import struct
import zipfile


def summaries(data: bytes):
    version, count = struct.unpack_from("<IH", data)
    if version != 14 or count > 8:
        raise ValueError("Unsupported users.dat")
    result, offset = [], 6
    for _ in range(count):
        length = struct.unpack_from("<H", data, offset)[0]
        offset += 2
        name = data[offset:offset + length]
        offset += length
        use, identity = struct.unpack_from("<II", data, offset)
        offset += 8
        result.append((name, use, identity))
    if offset != len(data) or len({row[2] for row in result}) != count:
        raise ValueError("Malformed users.dat")
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--archive", required=True, type=Path)
    parser.add_argument("--data", required=True, type=Path, action="append")
    parser.add_argument("--backup-root", required=True, type=Path)
    parser.add_argument("--name", default="PerfectV33")
    args = parser.parse_args()
    name = args.name.encode("utf-8")
    if not name or len(name) > 255:
        raise ValueError("Invalid profile name")
    with zipfile.ZipFile(args.archive) as archive:
        profile = archive.read("data/user1.dat64")
        checkpoint = archive.read("data/game1_58.dat64")
    if (profile[:8] != b"PVZUSR64" or checkpoint[:8] != b"PVZDAT64"
            or struct.unpack_from("<I", checkpoint, 8)[0] != 3
            or struct.unpack_from("<II", checkpoint, 36) != (0x10740, 3)):
        raise ValueError("Expected a completed profile and a v3.3 checkpoint")
    plans = []
    for directory in args.data:
        directory = directory.resolve(strict=True)
        users = directory / "users.dat"
        original = users.read_bytes() if users.exists() else struct.pack("<IH", 14, 0)
        rows = summaries(original)
        if any(row[0].lower() == name.lower() for row in rows):
            raise ValueError(f"Profile already exists: {directory}/{args.name}")
        if len(rows) >= 8:
            raise ValueError(f"All profile slots are occupied: {directory}")
        identity = max((row[2] for row in rows), default=0) + 1
        use = max((row[1] for row in rows), default=0) + 1
        targets = [directory / f"user{identity}.dat64",
                   directory / f"game{identity}_58.dat64"]
        if any(path.exists() for path in targets):
            raise ValueError(f"New profile ID has existing files: {directory}/{identity}")
        encoded = struct.pack("<IH", 14, len(rows) + 1) + original[6:]
        encoded += struct.pack("<H", len(name)) + name + struct.pack("<II", use, identity)
        summaries(encoded)
        plans.append((directory, users, original, targets, encoded, identity))
    stamp = datetime.now().strftime("%Y%m%d-%H%M%S")
    backup = args.backup_root.resolve() / stamp
    backup.mkdir(parents=True, exist_ok=False)
    for directory, users, original, targets, encoded, identity in plans:
        destination = backup / directory.parent.parent.name
        destination.mkdir()
        for file in directory.iterdir():
            if file.is_file() and file.suffix.lower() in (".dat", ".dat64"):
                shutil.copy2(file, destination / file.name)
        targets[0].write_bytes(profile)
        targets[1].write_bytes(checkpoint)
        if users.exists() and users.read_bytes() != original:
            raise RuntimeError("users.dat changed during installation; new files left unregistered")
        temporary = directory / "users.dat.installing"
        with temporary.open("xb") as stream:
            stream.write(encoded)
        temporary.replace(users)
        print(f"Installed {args.name}: ID={identity}, directory={directory}")
    print(f"Existing profile backups: {backup}")


if __name__ == "__main__":
    main()
