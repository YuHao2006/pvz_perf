@echo off
rem 2026-10-07 dispatch-duel bench launcher: build then pin to LP14 (LPE island,
rem mask 0x4000) - fixed-clock exclusive core (0%% idle background), same
rem environment contract as run-on-lpe.cmd. Call-level micro bench: no fps or
rem cpu-usage collectors needed.
call "C:\UserProgram\Visual Studuio\2026\Community\VC\Auxiliary\Build\vcvars64.bat" >nul 2>&1
pushd "%~dp0..\.." || exit /b 1
if not exist Tests\performance\build mkdir Tests\performance\build
cl /nologo /O2 /EHsc /std:c++20 /I pvzPerf /FoTests/performance/build/ Tests\performance\bench_dispatch_duel.cpp /Fe:Tests\performance\build\bench_dispatch_duel.exe
if errorlevel 1 exit /b 1
start "" /b /wait /affinity 0x4000 /high Tests\performance\build\bench_dispatch_duel.exe
popd
