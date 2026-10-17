@echo off
rem Endless comparison - ORIGINAL 1073 pinned LP14 (0x4000).
pushd "C:\UserProgram\Plants_Vs_Zombies_V1.2.0.1073_EN" || exit /b 1
start "orig-endless" /affinity 0x4000 PlantsVsZombies.exe
popd
