"""Extract the original IDI_MAIN_ICON without changing its image payloads."""

import argparse
import hashlib
import io
from pathlib import Path
import struct

import pefile
from PIL import Image


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("exe", type=Path)
    parser.add_argument("output", type=Path)
    args = parser.parse_args()
    original = args.exe.read_bytes()
    pe = pefile.PE(data=original)
    resources = pe.DIRECTORY_ENTRY_RESOURCE.entries
    groups = next(entry for entry in resources if entry.id == 14)
    group = next(entry for entry in groups.directory.entries
                 if str(entry.name) == "IDI_MAIN_ICON")
    descriptor = group.directory.entries[0].data.struct
    data = pe.get_data(descriptor.OffsetToData, descriptor.Size)
    count = struct.unpack_from("<H", data, 4)[0]
    icons = next(entry for entry in resources if entry.id == 3)
    entries = []
    payloads = []
    offset = 6 + count * 16
    for index in range(count):
        fields = struct.unpack_from("<BBBBHHIH", data, 6 + index * 14)
        icon = next(entry for entry in icons.directory.entries if entry.id == fields[-1])
        resource = icon.directory.entries[0].data.struct
        payload = pe.get_data(resource.OffsetToData, resource.Size)
        if len(payload) != fields[-2]:
            raise ValueError("Icon resource size mismatch")
        entries.append(struct.pack("<BBBBHHII", *fields[:7], offset))
        payloads.append(payload)
        offset += len(payload)
    ico = struct.pack("<HHH", 0, 1, count) + b"".join(entries + payloads)
    args.output.mkdir(parents=True, exist_ok=True)
    (args.output / "pvz_perf.ico").write_bytes(ico)
    image = Image.open(io.BytesIO(ico))
    image.load()
    image.convert("RGBA").save(args.output / "pvz_perf.png")
    print(f"Source SHA256: {hashlib.sha256(original).hexdigest()}")
    print(f"ICO: {count} original layers; PNG: {image.size}")


if __name__ == "__main__":
    main()
