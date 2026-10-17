"""Read-only x64 PE unwind-range disassembly using a captured module-relative PC.

Usage: python tools/disassemble-pe-function.py module.dll 0xRETURN_RVA [...]
Uses .pdata unwind ranges so instruction decoding begins at a real boundary.
Optimized functions may span multiple chained ranges; this is not a complete
function reconstruction. Leaf routines may have no .pdata entry and are rejected.
"""
import argparse
import capstone
import pefile

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument("module")
parser.add_argument("rva", type=lambda value: int(value, 0), nargs="+")
args = parser.parse_args()
pe = pefile.PE(args.module)
if pe.FILE_HEADER.Machine != 0x8664:
    parser.error("Expected an AMD64 PE")
decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
for rva in args.rva:
    ranges = [entry.struct for entry in pe.DIRECTORY_ENTRY_EXCEPTION
              if entry.struct.BeginAddress <= rva < entry.struct.EndAddress]
    if len(ranges) != 1:
        parser.error(f"Expected one unwind range at {rva:#x}, found {len(ranges)}")
    info = ranges[0]
    print(f"\n{args.module}: PC={rva:#x}; unwind range {info.BeginAddress:#x}..{info.EndAddress:#x}")
    data = pe.get_data(info.BeginAddress, info.EndAddress - info.BeginAddress)
    for insn in decoder.disasm(data, info.BeginAddress):
        print(f"{'PC' if insn.address == rva else '  '} {insn.address:08x}: {insn.mnemonic:8} {insn.op_str}")
