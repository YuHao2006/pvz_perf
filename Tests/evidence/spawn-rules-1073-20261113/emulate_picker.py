from pathlib import Path
import sys,json,struct,hashlib,math,itertools
sys.path.insert(0,str(Path('out/verification/spawn403/python-deps').resolve()))
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32
from unicorn.x86_const import *
import pefile
exe=Path('C:/UserProgram/Plants_Vs_Zombies_V1.2.0.1073_EN/PlantsVsZombies.exe');pe=pefile.PE(str(exe));image=pe.get_memory_mapped_image();u=Uc(UC_ARCH_X86,UC_MODE_32);u.mem_map(0x400000,(len(image)+4095)&~4095);u.mem_write(0x400000,image);u.mem_map(0x10000000,0x50000);u.mem_map(0x20000000,0x10000)
app=0x10000000;board=0x10010000;picker=0x10020000;challenge=0x10030000;profile=0x10040000;sp=0x2000ff00
def put(a,v):u.mem_write(a,struct.pack('<I',v))
for a,v in [(app+0x868,board),(app+0x94c,profile),(profile+0x4c,50),(profile+0x54,1),(board+0xa4,app),(board+0x178,challenge),(board+0x557c,20),(board+0x5568,50)]:put(a,v)
u.mem_write(board+0x54ec,b'\x01'*34)
defs=[struct.unpack_from('<6i',image,0x71bb90-0x400000+i*28) for i in range(34)]
def f32(x):return struct.unpack('<f',struct.pack('<f',x))[0]
def curve(lo,hi,value,a,b):
 v=f32(a+(b-a)*max(0.,min(1.,(value-lo)/(hi-lo))));return int(f32(v+.5))
def expected(mode,flags,points,wave,n,alln):
 out=[]
 for t,_,cost,_,first,weight in defs:
  if t==20 and 11<=mode<=15:
   if wave%10!=9:continue
  elif mode not in [34,28,41]:
   if 11<=mode<=15:first=max(1,first-curve(18,50,flags,0,15))
   if wave+1<first or points<cost:continue
  if 1<=mode<=15:
   if t in [23,12]:
    if n>=curve(10,50,flags,2,50):continue
   elif t==32:
    if wave%10==9:
     if n>=curve(14,100,flags,1,50):continue
    else:
     if alln>=curve(10,110,flags,1,50):continue
     weight=1000
   elif t==0:weight=curve(10,50,flags,weight,weight//10)
   elif t==2:weight=curve(10,50,flags,weight,weight//4)
  out.append([t,weight])
 return out
modes=sorted(set(r['retailMode'] for r in json.load(open('out/verification/spawn403/retail-mode-rosters-emulated.json'))['rows']));cases=set((mode,0,points,wave,0,0) for mode in modes for points,wave in [(7,0),(50,19)])
flagsValues=[0,2,4,10,14,18,20,24,50,100,110,128]
for mode,flags,points,wave,counts in itertools.product([1,6,13],flagsValues,[1,7,10,50],[0,8,9,13,19],[(0,0),(1,1),(2,2),(50,50)]):cases.add((mode,flags,points,wave,*counts))
digest=hashlib.sha256();failures=[];samples=[]
for mode,flags,points,wave,n,alln in sorted(cases):
 put(app+0x918,mode);put(challenge+0x6c,flags if 1<=mode<=5 else flags//2);put(board+0x5594,0);u.mem_write(picker,b'\x00'*0x130)
 for t in range(34):put(picker+8+4*t,n);put(picker+0x90+4*t,alln)
 u.mem_write(sp,struct.pack('<5I',0,board,points,wave,picker));u.reg_write(UC_X86_REG_ESP,sp);u.reg_write(UC_X86_REG_EFLAGS,2)
 try:u.emu_start(0x410250,0x41044f,count=100000)
 except Exception as e:raise RuntimeError(f'{mode,flags,points,wave,n,alln}: ip={u.reg_read(UC_X86_REG_EIP):x}: {e}')
 assert u.reg_read(UC_X86_REG_EIP)==0x41044f
 esp=u.reg_read(UC_X86_REG_ESP);count=struct.unpack('<I',u.mem_read(esp+0x14,4))[0];assert count<=34;raw=u.mem_read(esp+0x1c,count*8);actual=[list(struct.unpack_from('<2i',raw,i*8)) for i in range(count)] # pointer was pushed at 0x41044e
 exp=expected(mode,flags,points,wave,n,alln);case={'mode':mode,'flags':flags,'points':points,'waveIndex':wave,'perWaveCount':n,'totalCount':alln}
 digest.update(json.dumps([case,actual],sort_keys=True).encode())
 if actual!=exp:failures.append({**case,'retail':actual,'sourceFormulaModel':exp})
 if mode==13 and flags in [0,4,10,50,128] and points==50 and wave in [0,9,19] and n==0 and alln==0:samples.append({**case,'weights':actual})
report={'method':'Execute untouched 1073 Board::PickZombieType from 0x410250 to immediately before weighted random selection at 0x41044f, including native flag-wave, completed-flags and x87 curve helpers. Compare the actual candidate/weight array against the formulas currently present in Board.cpp. This is a configuration-model comparison, not execution of the modern C++ picker.','exeSha256':hashlib.sha256(exe.read_bytes()).hexdigest(),'caseCount':len(cases),'retailModes':modes,'boundarySurvivalModes':[1,6,13],'flags':flagsValues,'points':[1,7,10,50],'waveIndices':[0,8,9,13,19],'countPairs':[[0,0],[1,1],[2,2],[50,50]],'resultSha256':digest.hexdigest(),'failures':failures,'samples':samples};Path('out/verification/spawn403/picker-weight-comparison.json').write_text(json.dumps(report,indent=2));print('Cases',len(cases),'mismatches',len(failures));print(json.dumps(failures[:1],indent=2));assert not failures
