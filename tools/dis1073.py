import capstone
import pefile

EXE = r"C:\UserProgram\Plants_Vs_Zombies_V1.2.0.1073_EN\PlantsVsZombies.exe"
pe = pefile.PE(EXE)
base = pe.OPTIONAL_HEADER.ImageBase
img = pe.get_memory_mapped_image()
md = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_32)

text = pe.sections[0]
start_rva = text.VirtualAddress
size = text.Misc_VirtualSize

# 扫 PlayBossEnter 调用模式：push 0 (fromWave) ; push 0x19 (ZOMBIE_BOSS) ; call rel32
pat = b"\x6a\x00\x6a\x19\xe8"
hits = []
off = 0
while True:
    i = img.find(pat, off, start_rva + size)
    if i < 0:
        break
    va = base + i
    # call 目标
    rel = int.from_bytes(img[i+5:i+9], "little", signed=True)
    target = va + 5 + 4 + rel
    hits.append((va, target))
    off = i + 1

print("push 0; push 0x19; call 命中:")
for va, tgt in hits:
    print(f"  call-site {va:#x} -> AddZombie? {tgt:#x}")

def dis(name, va, nbytes):
    print(f"\n===== {name} @ {va:#x} =====")
    code = img[va - base: va - base + nbytes]
    for insn in md.disasm(code, va):
        print(f"  {insn.address:08x}: {insn.mnemonic:8} {insn.op_str}")

addzombie = hits[0][1] if hits else 0x40DE70
dis("AddZombie(候选)", addzombie, 0x50)
