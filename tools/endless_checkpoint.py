"""Create a disposable endless checkpoint from the pinned retail 1073 DAT."""
import argparse
import hashlib
import json
import subprocess
import struct
import tempfile
from pathlib import Path


def completed_profile():
    # PlayerInfo::SyncDetails v13 field order; unused mode/purchase slots stay zero.
    records = [0] * 100
    for mode in range(1, 71):
        if mode != 35:
            records[mode] = 1
    # Survival records store completed flags, unlike ordinary win-count records.
    for mode in range(61, 66):
        records[mode] = 10
    for mode in range(66, 71):
        records[mode] = 5
    records[71] = 1000
    purchases = [0] * 80
    for item in list(range(9)) + [13, 16, 17, 18, 19, 20, 22, 23, 25, 27, 29]:
        purchases[item] = 1
    # STORE_ITEM_FIRSTAID (29): all completed profiles include Wall-nut First Aid.
    purchases[9] = 2
    purchases[21] = 4
    for item in (14, 15):
        purchases[item] = 1020
    for item in (26, 28):
        purchases[item] = 1010
    purchases[24] = 3
    scalars = [0] * 18
    for index in (6, 7, 12, 15, 16):
        scalars[index] = 1
    # Two adventure completions, all trophies/achievements, ten seed slots.
    values = [13, 1, 99999, 2] + records + purchases + [0, 0] + scalars + [0]
    return (b"PVZUSR64" + struct.pack(f"<{len(values)}i", *values)
            + bytes([1, 1]) * 20 + b"\0" + struct.pack("<i", 0)
            + bytes([1]) * 20 + b"\1")


def original():
    tests = Path(__file__).resolve().parents[1] / "Tests"
    record = json.loads((tests / "manifest.json").read_bytes())["original"]
    path = tests / record["file"]
    if hashlib.sha256(path.read_bytes()).hexdigest() != record["sha256"]:
        raise ValueError(f"Retail endless checkpoint checksum mismatch: {path}")
    return path


def convert(converter, output, target="dat64-v5"):
    output = Path(output)
    output.parent.mkdir(parents=True, exist_ok=True)
    with tempfile.TemporaryDirectory(dir=output.parent) as directory:
        generated = Path(directory) / "game1_58.dat64"
        subprocess.run([str(converter), "--target", target, str(original()), str(generated)], check=True)
        data = generated.read_bytes()
        if target == "dat64-v5" and (data[:8] != b"PVZDAT64" or
                struct.unpack_from("<I", data, 8)[0] != 5 or
                struct.unpack_from("<II", data, 36) != (0x10747, 1)):
            raise ValueError("Endless checkpoint is not DAT64 v5.1")
        generated.replace(output)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("converter", type=Path)
    parser.add_argument("output", type=Path)
    args = parser.parse_args()
    convert(args.converter.resolve(), args.output)
