@echo off
rem Endless comparison - ORIGINAL 1073 pinned LP14 (0x4000).
set "PVZ_RESOLVED_PATH="
for /f "usebackq delims=" %%I in (`python "%~dp0workspace_paths.py" retail1073`) do set "PVZ_RESOLVED_PATH=%%I"
if not defined PVZ_RESOLVED_PATH exit /b 1
pushd "%PVZ_RESOLVED_PATH%" || exit /b 1
start "orig-endless" /affinity 0x4000 PlantsVsZombies.exe
popd
