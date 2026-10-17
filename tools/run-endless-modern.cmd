@echo off
rem Endless comparison - MODERN B pinned LP14 (0x4000), same core as orig side.
pushd "%~dp0..\out\x64-win32-dx12\Release" || exit /b 1
start "modern-endless" /affinity 0x4000 pvz_perf.exe
popd
