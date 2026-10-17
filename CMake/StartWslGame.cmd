@echo off
setlocal
wsl.exe -d Ubuntu-26.04 --cd "%~dp0." --exec env ^
  -u VK_ICD_FILENAMES -u VK_LAYER_PATH -u VK_INSTANCE_LAYERS -u VK_DRIVER_FILES -u DZN_DEBUG ^
  -u PVZ_NATIVE_GAME_SMOKE -u PVZ_NATIVE_GAME_SMOKE_MODE -u PVZ_NATIVE_GAME_AUDIO ^
  -u PVZ_MODERN_SMOKE -u PVZ_MODERN_GAMEPLAY -u PVZ_MODERN_HIDDEN -u PVZ_AUTOTOGGLE ^
  -u PVZ_WAVE_SPAWN_SMOKE -u PVZ_BASS_LIBRARY -u ALSA_CONFIG_PATH ^
  PVZ_APPDATA_DIR=./data PVZ_SETTINGS_FILE=./settings.json PVZ_LOG_DIR=./log ^
  ./pvz_perf %*
set "gameExitCode=%errorlevel%"
if not "%gameExitCode%"=="0" pause
exit /b %gameExitCode%
