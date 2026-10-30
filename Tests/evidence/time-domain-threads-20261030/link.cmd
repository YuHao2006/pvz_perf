@echo off
call "C:/UserProgram/Visual Studuio/2026/Community/Common7/Tools/VsDevCmd.bat" -arch=x64 -no_logo
cd /d "C:\Users\Administrator\CLionProjects\codex\PlantsVsZombiesModern\out\x64-win32-vulkan"
"C:\UserProgram\Visual Studuio\2026\Community\VC\Tools\MSVC\14.51.36231\bin\Hostx64\x64\link.exe" @"C:\Users\ADMINI~1\AppData\Local\Temp\pvz-domain-thread-v32\link.rsp"
if errorlevel 1 exit /b 1
