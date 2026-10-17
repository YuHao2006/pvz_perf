@echo off
call "C:\UserProgram\Visual Studuio\2026\Community\VC\Auxiliary\Build\vcvars64.bat" >nul 2>&1
pushd "%~dp0..\.." || exit /b 1
if not exist Tests\performance\build mkdir Tests\performance\build
cl /nologo /O2 /EHsc /std:c++20 /I pvzPerf /FoTests/performance/build/ Tests\performance\bench_particle_roster.cpp /Fe:Tests\performance\build\bench_particle_roster.exe
if errorlevel 1 exit /b 1
Tests\performance\build\bench_particle_roster.exe
Tests\performance\build\bench_particle_roster.exe
popd
