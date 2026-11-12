from pathlib import Path
import sys,json,re,struct,hashlib
sys.path.insert(0,str(Path('out/verification/spawn403/python-deps').resolve()))
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32
from unicorn.x86_const import *
import pefile
exe=Path(r'C:/UserProgram/Plants_Vs_Zombies_V1.2.0.1073_EN/PlantsVsZombies.exe');pe=pefile.PE(str(exe));base=pe.OPTIONAL_HEADER.ImageBase;image=pe.get_memory_mapped_image()
source=Path('pvzPerf/Lawn/Challenge.cpp').read_text(encoding='utf-8');block=source[source.index('constexpr uint64_t kModeZombieMask'):source.index('static_assert(sizeof(kModeZombieMask)')]
legacy={int(a):(name,int(old),expr.strip()) for a,name,old,expr in re.findall(r'\[\s*(\d+)\]\s+(\w+)\s+\(v1 (\d+)\)\s*\*/([^\n]+)',block)}
boardSource=Path('pvzPerf/Lawn/Board.cpp').read_text(encoding='utf-8');wc=boardSource[boardSource.index('constexpr int kNumWavesPerMode'):];wc=wc[:wc.index('};')];currentWaveCounts={int(a):int(v) for a,v in re.findall(r'\[\s*(\d+)\].*?\*/\s*(\d+)',wc)}
enumSource=Path('pvzPerf/Lawn/Zombie.cpp').read_text(encoding='utf-8').split('static ZombieType gBossZombieList')[0];names=re.findall(r'\{\s*(ZOMBIE_\w+),\s*REANIM_',enumSource);ids={n:i for i,n in enumerate(names)};out=[]
for current,(name,old,expr) in legacy.items():
 if old==0:continue
 u=Uc(UC_ARCH_X86,UC_MODE_32);u.mem_map(base,(len(image)+4095)&~4095);u.mem_write(base,image);u.mem_map(0x10000000,0x50000);u.mem_map(0x20000000,0x10000);u.mem_map(0x30000000,0x1000)
 app=0x10000000;board=0x10010000;challenge=0x10030000;profile=0x10040000
 def put(addr,value):u.mem_write(addr,struct.pack('<I',value))
 put(app+0x918,old);put(app+0x868,board);put(app+0x94c,profile);put(profile+0x4c,1);put(board+0xa4,app);put(board+0x5568,1);put(challenge,app);put(challenge+4,board);put(challenge+0x6c,0)
 sp=0x2000ff00;put(sp,0x30000000)
 for reg,val in [(UC_X86_REG_ESP,sp),(UC_X86_REG_ESI,challenge),(UC_X86_REG_EDI,board),(UC_X86_REG_ECX,app)]:u.reg_write(reg,val)
 try:u.emu_start(0x428370,0x30000000,count=100000)
 except Exception as e:raise RuntimeError(f'mode={old} {name} ip={u.reg_read(UC_X86_REG_EIP):x}: {e}')
 assert u.reg_read(UC_X86_REG_EIP)==0x30000000,(old,hex(u.reg_read(UC_X86_REG_EIP)))
 actual=[i for i,b in enumerate(u.mem_read(board+0x54ec,34)) if b]
 if 1<=old<=15:expected=[0,2] if old<=5 else [0,2,4]
 elif 'kZombieMaskDefault' in expr:expected=[0,2,4]
 else:expected=sorted(ids[n] for n in re.findall(r'1ULL << (ZOMBIE_\w+)',expr))
 for reg,val in [(UC_X86_REG_ESP,sp),(UC_X86_REG_ESI,challenge),(UC_X86_REG_EDI,board),(UC_X86_REG_ECX,app),(UC_X86_REG_EBP,0)]:u.reg_write(reg,val)
 u.emu_start(0x40bc20,0x40bdf9,count=100000)
 assert u.reg_read(UC_X86_REG_EIP)==0x40bdf9
 count=struct.unpack('<I',u.mem_read(board+0x557c,4))[0]
 projectCount=10 if 'SURVIVAL_NORMAL' in name or old==31 else 20 if 'SURVIVAL_' in name else currentWaveCounts[current]
 out.append({'mode':name,'retailMode':old,'retailMachineCodeSelectedTypes':actual,'projectSelectedTypes':expected,'equal':actual==expected,'retailWaveCount':count,'projectWaveCount':projectCount,'waveCountEqual':count==projectCount})
Path('out/verification/spawn403/retail-mode-rosters-emulated.json').write_text(json.dumps({'method':'Execute untouched 1073 x86 selector and leaf predicates in Unicorn; isolated synthetic Board/App/Profile memory; survival stage zero; stop only after RET','entry':'0x428370','exeSha256':hashlib.sha256(exe.read_bytes()).hexdigest(),'rows':out},indent=2));print('Executed',len(out),'retail fixed/start-stage rosters. Mismatches:',[r for r in out if not r['equal'] or not r['waveCountEqual']])
