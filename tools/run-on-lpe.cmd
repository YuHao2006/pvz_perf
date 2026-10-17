@echo off
rem 2026-10-06 single-LPE pinning launcher (no game-code change; start /affinity is OS built-in).
rem This machine (Arrow Lake-H, verify with Tests\performance\build\cpu_topology.exe):
rem   LP0,9-13 = 6 P-cores | LP1-8 = 8 E-cores (1800MHz main cluster) | LP14/15 = 2 LPE island cores
rem Single core LP14 mask = 0x4000. Idle measurement 2026-10-06: LP14 carries 0.0%
rem background load (LP15 has a ~1% system resident), so the game owns LP14 alone.
rem Two-core variant: replace 0x4000 with 0xC000. LPE runs at a fixed 1.0GHz cap
rem under load (no turbo), so single-core = stable low-performance environment.
pushd "%~dp0..\out\x64-win32-dx12\Release" || exit /b 1
start "" /affinity 0x4000 pvz_perf.exe %*
popd
