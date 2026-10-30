from pathlib import Path
import os,subprocess
p=Path(os.environ['TEMP']);out=Path((p/'pvz-phase-progression-current.txt').read_text().strip())
s=(out/'production-Reanimator.cpp').read_text()
sample='''    if (mFrameCount > 0 && mAnimRate > 0 && offsetNs == 0 && nowNs == mLastUpdateTimeNs &&
        (mLoopType == REANIM_LOOP || mLoopType == REANIM_LOOP_FULL_LAST_FRAME))
        return {0,mCurrentFrame,ReanimClock::Subtract(nowNs,mStartTimeNs)};
'''
consume='''    if (mFrameCount > 0 && !mDead && mAnimRate > 0 &&
        (mLoopType == REANIM_LOOP || mLoopType == REANIM_LOOP_FULL_LAST_FRAME)) {
        const auto q=mFramePeriodNs;
        mLastFrameNs=std::int64_t(mCurrentFrame)*q+ReanimClock::Subtract(mLastUpdateTimeNs,mStartTimeNs);
        mHasLastFrame=true;
        auto age=ReanimClock::Subtract(nowNs,mStartTimeNs);
        if(age<0) throw std::logic_error("benchmark update moved backwards");
        auto frame=mCurrentFrame;
        const auto intervals=FrameIntervals(*this);
        std::int64_t cycles=0;
        // Genuine frame-by-frame comparison/subtraction; no integer division.
        while(age>=q) {
            age-=q;
            ++frame;
            if(frame==intervals) {frame=0;++cycles;}
        }
        mCycleCrossings=cycles;
        if(cycles) mRootDisplacement+=double(cycles)*GroundCycleDisplacement(*this);
        if(frame!=mCurrentFrame || cycles) {
            mCurrentFrame=frame;
            mStartTimeNs=ReanimClock::Subtract(nowNs,age);
        }
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
a='ReanimFramePosition Reanimation::SampleFrameAt(std::int64_t nowNs, std::int64_t offsetNs) const\n{';assert a in s;s=s.replace(a,a+'\n'+sample)
a='void Reanimation::ConsumeTimeAt(std::int64_t nowNs)\n{';assert a in s;s=s.replace(a,a+'\n'+consume)
(out/'while_cached.cpp').write_text(s,encoding='utf-8')
cmd=(out/'compile-divide_update_cached_queries.cmd').read_text().replace('divide_update_cached_queries','while_cached')
f=out/'compile-while_cached.cmd';f.write_text(cmd)
print('Compiling pure comparison/subtraction candidate.',flush=True)
with(out/'compile-while_cached.log').open('w')as f:subprocess.run(['cmd','/d','/c',str(out/'compile-while_cached.cmd')],stdout=f,stderr=subprocess.STDOUT,check=True)
args=(out/'divide_update_cached_queries-validate.rsp').read_text().replace('divide_update_cached_queries.obj','while_cached.obj').replace('divide_update_cached_queries-validate.','while_cached.')
rsp=out/'while_cached.rsp';rsp.write_text(args)
cmd=(out/'link-divide_update_cached_queries.cmd').read_text().replace(str(out/'divide_update_cached_queries.rsp'),str(rsp))
f=out/'link-while_cached.cmd';f.write_text(cmd)
with(out/'link-while_cached.log').open('w')as f:subprocess.run(['cmd','/d','/c',str(out/'link-while_cached.cmd')],stdout=f,stderr=subprocess.STDOUT,check=True)
variants={'while_cached':out/'while_cached.exe','divide_update_cached_queries':out/'divide_update_cached_queries-validate.exe','divide_every_query':out/'divide_every_query-validate.exe'}
root=out/'while-comparison';root.mkdir()
for order,names in enumerate([list(variants),list(reversed(variants))]):
 for name in names:
  print('Measuring',name,order,flush=True)
  d=root/(name+'-'+str(order));d.mkdir()
  with(d/'samples.csv').open('w')as so,(d/'stderr.txt').open('w')as se:
   subprocess.run([str(variants[name]),str(d),'compare_progression'],cwd=out,stdout=so,stderr=se,check=True)
print('RESULTS',root,flush=True)
