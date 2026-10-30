"""Read-only instruction evidence from the exact 1073 executable."""
import hashlib
from pathlib import Path

import capstone
import pefile

exe = Path(r"C:/UserProgram/Plants_Vs_Zombies_V1.2.0.1073_EN/PlantsVsZombies.exe")
digest = hashlib.sha256(exe.read_bytes()).hexdigest()
assert digest == "5f650f52d12751e08b63e590edb0d9b9f09d087cea900baa0eb39e4af8eda251"
pe = pefile.PE(str(exe))
base = pe.OPTIONAL_HEADER.ImageBase
image = pe.get_memory_mapped_image()
decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_32)
print(f"SHA256 {digest}")
for label, start, end in (
    ("SetLabel: style 14 sets duration 250", 0x45CA21, 0x45CA32),
    ("MessageWidget::Update: paused guard and countdown", 0x45CD9A, 0x45CDE4),
    ("Board::Update: paused guard", 0x4186B4, 0x4186F4),
    ("Board::Update: advice before later game-state checks", 0x41874A, 0x418766),
):
    print(f"\n{label}")
    for instruction in decoder.disasm(image[start-base:end-base], start):
        print(f"{instruction.address:08x}: {instruction.mnemonic:8} {instruction.op_str}")
