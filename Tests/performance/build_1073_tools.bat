@echo off
rem 1073 采样注入器构建（x86：目标 32 位原版进程）
call "C:\UserProgram\Visual Studuio\2026\Community\VC\Auxiliary\Build\vcvarsall.bat" x86 || exit /b 1
cd /d "%~dp0" || exit /b 1
if not exist build mkdir build
pushd build || exit /b 1
cl /nologo /O2 /TP /LD ..\pvz1073_sampler.c /Fe:pvz1073_sampler.dll /link psapi.lib || exit /b 1
cl /nologo /O2 /TP ..\pvz1073_inject.c /Fe:pvz1073_inject.exe || exit /b 1
cl /nologo /O2 /TP ..\monitor_cpu_native.c /Fe:monitor_cpu_native.exe || exit /b 1
popd
echo BUILD-OK
