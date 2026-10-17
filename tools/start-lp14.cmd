@echo off
rem Launch the game on logical processor 14 only (hex affinity mask 4000).
start "" /d "%~dp0" /affinity 4000 "%~dp0pvz_perf.exe" %*
