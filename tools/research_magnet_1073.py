"""Read-only retail 1073 magnet-coordinate evidence. Print disassembly to stdout."""
import argparse
import hashlib
import struct
from pathlib import Path

import capstone
import pefile

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument(
    "exe", nargs="?",
    default=r"C:\UserProgram\Plants_Vs_Zombies_V1.2.0.1073_EN\PlantsVsZombies.exe",
)
args = parser.parse_args()
exe = Path(args.exe)
digest = hashlib.sha256(exe.read_bytes()).hexdigest()
expected = "5f650f52d12751e08b63e590edb0d9b9f09d087cea900baa0eb39e4af8eda251"
if digest != expected:
    parser.error(f"These addresses require retail 1073 SHA256 {expected}; got {digest}")
pe = pefile.PE(str(exe))
base = pe.OPTIONAL_HEADER.ImageBase
image = pe.get_memory_mapped_image()
decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_32)
print(f"EXE {exe}\nSHA256 {digest}")
for label, start, end in (
    ("Plant::MagnetShroomAttactItem", 0x464FC0, 0x4656A4),
    ("Zombie::GetTrackPosition", 0x545050, 0x5450E5),
    ("Reanimation::GetTrackMatrix", 0x477240, 0x4773C0),
    ("Plant::DrawMagnetItems", 0x468EB0, 0x4690C0),
):
    print(f"\n{label}")
    for ins in decoder.disasm(image[start - base:end - base], start):
        print(f"{ins.address:08x}: {ins.mnemonic:8} {ins.op_str}")

print("\nOriginal double constants:")
for address in (0x6FE0B0, 0x6FDEE8, 0x6FE118, 0x6FDB40, 0x6FDCB0, 0x6FE110):
    print(f"{address:08x}: {struct.unpack_from('<d', image, address - base)[0]}")
print(f"006fde7c: scale float {struct.unpack_from('<f', image, 0x6FDE7C - base)[0]}")

print("\nImage assignments: ASCII resource names preceding global-pointer stores")
for target, store in ((0x726F78, 0x48573E), (0x726B94, 0x4852D0), (0x726D7C, 0x4876C9)):
    print(f"global {target:08x}, store {store:08x}")
    for offset in range(store - base - 110, store - base):
        address = struct.unpack_from("<I", image, offset)[0]
        if 0x6E0000 < address < 0x710000:
            text = image[address - base:address - base + 100].split(b"\0")[0]
            if text.startswith(b"IMAGE_"):
                print(f"  reference {base + offset:08x}: {text.decode('ascii')}")
