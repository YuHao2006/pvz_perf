from pathlib import Path
import os,json,re,subprocess,datetime,shutil
repo=Path.cwd();build=repo/'out/x64-win32-vulkan';tmp=Path(os.environ['TEMP'])
out=tmp/('pvz-phase-progression-'+datetime.datetime.now().strftime('%Y%m%d-%H%M%S'));out.mkdir()
(tmp/'pvz-phase-progression-current.txt').write_text(str(out),encoding='utf-8')
entries=json.loads((build/'compile_commands.json').read_text())
def entry(file):return next(x for x in entries if Path(x['file']).resolve()==file.resolve())['command']
mainCommand=entry(repo/'pvzPerf/main.cpp');animCommand=entry(repo/'pvzPerf/Sexy.TodLib/Reanimator.cpp')
ninja='C:/Users/Administrator/AppData/Local/Programs/CLion/bin/ninja/win/x64/ninja.exe'
expanded=json.loads(subprocess.check_output([ninja,'-C',str(build),'-t','compdb','-x'],text=True))
link=next(x['command']for x in expanded if 'vs_link_exe' in x['command'] and 'pvz_perf.exe' in x['command'])
link=link[link.index(' -- ')+4:].split(' && ',1)[0]
linkexe=re.match(r'^(?:"[^"]*link.exe"|\S*link.exe)',link)[0]
args=link[len(linkexe):]
mainObj=r'SexyAppFramework\CMakeFiles\LawnProject.dir\__\main.cpp.obj'
animObj=r'SexyAppFramework\CMakeFiles\LawnProject.dir\__\Sexy.TodLib\Reanimator.cpp.obj'
source=(repo/'pvzPerf/Sexy.TodLib/Reanimator.cpp').read_text(encoding='utf-8-sig')
(out/'production-Reanimator.cpp').write_text(source,encoding='utf-8')
(out/'benchmark-source.cpp').write_text((repo/'Tests/performance/reanim_frame_cache_benchmark.cpp').read_text(encoding='utf-8-sig'),encoding='utf-8')
# Candidate clock: cycle-local epoch, division at every update, actual game query
# consumers retained. Only forward REANIM_LOOP fixtures are supported here.
sample='''    if (mFrameCount > 0 && mAnimRate > 0 &&
        (mLoopType == REANIM_LOOP || mLoopType == REANIM_LOOP_FULL_LAST_FRAME)) {
        const auto requested = ReanimClock::Add(nowNs, offsetNs);
        const auto elapsed = ReanimClock::Subtract(requested, mStartTimeNs);
        if (elapsed < 0) throw std::logic_error("benchmark clock moved backwards");
        CACHE_SNAPSHOT
        const auto q=mFramePeriodNs;
        const auto totalFrames=elapsed/q;
        const auto remainder=elapsed%q;
        const auto intervals=FrameIntervals(*this);
        if(totalFrames<intervals) return {0,int(totalFrames),remainder};
        return {totalFrames/intervals,int(totalFrames%intervals),remainder};
    }
'''
consume='''    if (mFrameCount > 0 && !mDead && mAnimRate > 0 &&
        (mLoopType == REANIM_LOOP || mLoopType == REANIM_LOOP_FULL_LAST_FRAME)) {
        mLastFrameNs=ReanimClock::Subtract(mLastUpdateTimeNs,mStartTimeNs);
        mHasLastFrame=true;
        const auto elapsed=ReanimClock::Subtract(nowNs,mStartTimeNs);
        if(elapsed<0) throw std::logic_error("benchmark update moved backwards");
        const auto q=mFramePeriodNs;
        auto frame=elapsed/q;
        const auto remainder=elapsed%q;
        const auto intervals=FrameIntervals(*this);
        std::int64_t cycles=0;
        if(frame>=intervals) {cycles=frame/intervals;frame%=intervals;}
        mCycleCrossings=cycles;
        if(cycles) mRootDisplacement+=double(cycles)*GroundCycleDisplacement(*this);
        STORE_FRAME
        if(cycles) mStartTimeNs=ReanimClock::Subtract(nowNs,frame*q+remainder);
        mLastUpdateTimeNs=nowNs;
        if(cycles) {
            if(cycles>INT_MAX) throw std::overflow_error("animation loop counter overflow");
            const auto loops=ReanimClock::Add(mLoopCount,cycles);
            if(loops>INT_MAX) throw std::overflow_error("animation loop counter overflow");
            mLoopCount=int(loops);
        }
        return;
    }
'''
variants={'current':None}
for name,cached in [('divide_update_cached_queries',True),('divide_every_query',False)]:
 text=source
 code=sample.replace('CACHE_SNAPSHOT','if(requested==mLastUpdateTimeNs)\n            return {0,mCurrentFrame,elapsed-std::int64_t(mCurrentFrame)*mFramePeriodNs};' if cached else '')
 anchor='ReanimFramePosition Reanimation::SampleFrameAt(std::int64_t nowNs, std::int64_t offsetNs) const\n{'
 assert anchor in text;text=text.replace(anchor,anchor+'\n'+code)
 anchor='void Reanimation::ConsumeTimeAt(std::int64_t nowNs)\n{';assert anchor in text
 text=text.replace(anchor,anchor+'\n'+consume.replace('STORE_FRAME','mCurrentFrame=int(frame);'if cached else ''))
 if not cached:
  a=text.index('void Reanimation::ConsumeTimeAt(std::int64_t nowNs)\n{')+len('void Reanimation::ConsumeTimeAt(std::int64_t nowNs)\n{')
  b=text.index('    if (mFrameCount <= 0 || mDead) return;',a)
  text=text[:a]+'\n    if (mFrameCount > 0 && !mDead && mAnimRate > 0 &&\n        (mLoopType == REANIM_LOOP || mLoopType == REANIM_LOOP_FULL_LAST_FRAME)) {\n        mLastFrameNs=ReanimClock::Subtract(mLastUpdateTimeNs,mStartTimeNs);\n        mHasLastFrame=true;\n        const auto elapsed=ReanimClock::Subtract(nowNs,mStartTimeNs);\n        if(elapsed<0) throw std::logic_error("benchmark update moved backwards");\n        std::int64_t cycles=0;\n        if(elapsed>=mPeriodNs) {\n            cycles=elapsed/mPeriodNs;\n            mStartTimeNs=ReanimClock::Subtract(nowNs,elapsed%mPeriodNs);\n        }\n        mCycleCrossings=cycles;\n        if(cycles) mRootDisplacement+=double(cycles)*GroundCycleDisplacement(*this);\n        mLastUpdateTimeNs=nowNs;\n        if(cycles) {\n            if(cycles>INT_MAX) throw std::overflow_error("animation loop counter overflow");\n            const auto loops=ReanimClock::Add(mLoopCount,cycles);\n            if(loops>INT_MAX) throw std::overflow_error("animation loop counter overflow");\n            mLoopCount=int(loops);\n        }\n        return;\n    }\n'+text[b:]
 path=out/(name+'.cpp');path.write_text(text,encoding='utf-8');variants[name]=path

def compile_command(base,old,new,obj):
 c=base.replace(str(old),str(new));assert c!=base
 c=re.sub(r'/Fo\S+',lambda m:'/Fo"'+str(obj)+'"',c)
 c=re.sub(r'/Fd\S+',lambda m:'/Fd"'+str(out/'compile.pdb')+'"',c)
 return c+' /I"'+str(repo/'pvzPerf/Sexy.TodLib')+'"'

def invoke(label,commands):
 script=out/(label+'.cmd');log=out/(label+'.log')
 script.write_text('@echo off\ncall "C:/UserProgram/Visual Studuio/2026/Community/Common7/Tools/VsDevCmd.bat" -arch=x64 -no_logo\ncd /d "'+str(build)+'"\n'+'\n'.join(c+'\nif errorlevel 1 exit /b 1'for c in commands)+'\n',encoding='utf-8')
 with log.open('w')as f:subprocess.run(['cmd','/d','/c',str(script)],stdout=f,stderr=subprocess.STDOUT,check=True)
benchObj=out/'bench.obj';invoke('compile-benchmark',[compile_command(mainCommand,repo/'pvzPerf/main.cpp',repo/'Tests/performance/reanim_frame_cache_benchmark.cpp',benchObj)])
for dll in (build/'Release').glob('*.dll'):shutil.copy2(dll,out/dll.name)
for name,cpp in variants.items():
 print('Building',name,flush=True)
 variantArgs=args.replace(mainObj,'"'+str(benchObj)+'"');assert variantArgs!=args
 if cpp:
  obj=out/(name+'.obj');invoke('compile-'+name,[compile_command(animCommand,repo/'pvzPerf/Sexy.TodLib/Reanimator.cpp',cpp,obj)])
  replaced=variantArgs.replace(animObj,'"'+str(obj)+'"');assert replaced!=variantArgs;variantArgs=replaced
 exe=out/(name+'.exe')
 for flag,file in [('out',exe),('pdb',out/(name+'.pdb')),('implib',out/(name+'.lib'))]:
  variantArgs=re.sub('/'+flag+r':\S+',lambda m:'/'+flag+':"'+str(file)+'"',variantArgs,flags=re.I)
 variantArgs=re.sub('/subsystem:windows','/subsystem:console',variantArgs,flags=re.I)
 rsp=out/(name+'.rsp');rsp.write_text(variantArgs,encoding='utf-8')
 invoke('link-'+name,[linkexe+' @"'+str(rsp)+'"'])
print('All binaries built; starting measurements.',flush=True)
# Run a forward and reversed order to expose order/frequency sensitivity.
for repetition,names in enumerate([list(variants),list(reversed(variants))]):
 for name in names:
  results=out/(name+'-'+str(repetition));results.mkdir()
  print('Measuring',name,repetition,flush=True)
  with(results/'samples.csv').open('w')as stdout,(results/'stderr.txt').open('w')as stderr:
   subprocess.run([str(out/(name+'.exe')),str(results),'compare_progression'],cwd=out,stdout=stdout,stderr=stderr,check=True)
print('RESULTS',out,flush=True)
