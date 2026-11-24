@echo off
set "PVZ_RESOLVED_PATH="
for /f "usebackq delims=" %%I in (`python "%~dp0..\..\tools\workspace_paths.py" vs "VC/Auxiliary/Build/vcvars64.bat"`) do set "PVZ_RESOLVED_PATH=%%I"
if not defined PVZ_RESOLVED_PATH exit /b 1
call "%PVZ_RESOLVED_PATH%" >nul 2>&1
pushd "%~dp0..\.." || exit /b 1
if not exist Tests\performance\build mkdir Tests\performance\build
cl /nologo /O2 /EHsc /std:c++20 /I pvzPerf /FoTests/performance/build/ Tests\performance\bench_zombie_rowscan.cpp /Fe:Tests\performance\build\bench_zombie_rowscan.exe
if errorlevel 1 exit /b 1
Tests\performance\build\bench_zombie_rowscan.exe
Tests\performance\build\bench_zombie_rowscan.exe
popd
