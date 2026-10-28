@echo off
call "C:\UserProgram\Visual Studuio\2026\Community\Common7\Tools\VsDevCmd.bat" -arch=x86 -no_logo
set "PATH=C:\UserProgram\Visual Studuio\2026\Community\VC\Tools\MSVC\14.51.36231\bin\Hostx64\x86;%PATH%"
set "INCLUDE=C:\UserProgram\Visual Studuio\2026\Community\VC\Tools\MSVC\14.51.36231\include;%INCLUDE%"
set "LIB=C:\UserProgram\Visual Studuio\2026\Community\VC\Tools\MSVC\14.51.36231\lib\x86;%LIB%"
cl /nologo /O2 /EHsc /std:c++20 /DPVZ_RETAIL_MACHINE_CODE /Fo"%TEMP%\pvz-production-leaf-20261029\retail.obj" /Fe"%TEMP%\pvz-production-leaf-20261029\retail.exe" "C:\Users\Administrator\CLionProjects\codex\PlantsVsZombiesModern\Tests\performance\production_leaf_benchmark.cpp" /link /BASE:0x10000000 /DYNAMICBASE:NO
if errorlevel 1 exit /b 1
exit /b %errorlevel%