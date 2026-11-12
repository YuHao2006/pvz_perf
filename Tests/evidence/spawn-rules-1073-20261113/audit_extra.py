from pathlib import Path
import sys,json,struct,re,hashlib
sys.path.insert(0,str(Path('out/verification/spawn403/python-deps').resolve()))
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32
from unicorn.x86_const import *
import pefile
exe=Path('C:/UserProgram/Plants_Vs_Zombies_V1.2.0.1073_EN/PlantsVsZombies.exe');pe=pefile.PE(str(exe));base=pe.OPTIONAL_HEADER.ImageBase;image=pe.get_memory_mapped_image();u=Uc(UC_ARCH_X86,UC_MODE_32)
u.mem_map(base,(len(image)+4095)&~4095);u.mem_write(base,image);u.mem_map(0x10000000,0x50000);u.mem_map(0x20000000,0x10000)
def put(a,v):u.mem_write(a,struct.pack('<I',v))
board=0x10010000;challenge=0x10030000;sp=0x2000ff00;put(challenge+4,board);put(board+0x5594,2);put(board+0x557c,12);put(board+0x55b4,1000);put(challenge+0x58,1);put(sp+4,challenge);u.reg_write(UC_X86_REG_ESP,sp)
# Stop before the first RNG call; all four local chance arrays are initialized.
u.emu_start(0x428b00,0x428c99,count=10000);assert u.reg_read(UC_X86_REG_EIP)==0x428c99
esp=u.reg_read(UC_X86_REG_ESP);source=Path('pvzPerf/Lawn/Challenge.cpp').read_text(encoding='utf-8');rows=[]
for name,offset in [('aTripleChance',0x28),('aConeChance',0x40),('aDoubleChance',0x58),('aPailChance',0x70)]:
 actual=list(struct.unpack('<6i',u.mem_read(esp+offset,24)));expected=[int(x) for x in re.search(name+r'\[6\]\s*=\s*\{([^}]+)',source).group(1).split(',')];rows.append({'name':name,'retailStackOffset':hex(offset),'retail':actual,'project':expected,'equal':actual==expected})
boss=list(struct.unpack_from('<12i',image,0x71bf48-base));zs=Path('pvzPerf/Lawn/Zombie.cpp').read_text(encoding='utf-8');defs=zs.split('static ZombieType gBossZombieList')[0];names=re.findall(r'\{\s*(ZOMBIE_\w+),\s*REANIM_',defs);block=zs.split('static ZombieType gBossZombieList')[1].split('};')[0];expected=[names.index(n) for n in re.findall(r'ZombieType::(ZOMBIE_\w+)',block)];rows.append({'name':'gBossZombieList','retailAddress':'0x71bf48','retail':boss,'project':expected,'equal':boss==expected})
out={'exeSha256':hashlib.sha256(exe.read_bytes()).hexdigest(),'method':'Untouched 1073 Whack-a-Zombie machine code from 0x428b00 to 0x428c99 initializes four probability arrays in an isolated Unicorn x86 stack; boss roster read from the PE-mapped table. No original process/save access.','rows':rows};Path('out/verification/spawn403/extra-config-comparison.json').write_text(json.dumps(out,indent=2));print('Matched',sum(r['equal'] for r in rows),'of',len(rows));assert all(r['equal'] for r in rows)
