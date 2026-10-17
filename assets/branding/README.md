# pvz_perf application branding

`pvz_perf.ico` is the original `IDI_MAIN_ICON` resource extracted from the
Plants vs. Zombies GOTY 1.2.0.1073 Windows executable. Its twelve image
payloads are preserved verbatim, including the 16, 32, 48 and 256 pixel
variants. `pvz_perf.png` is the original 256 pixel image decoded to RGBA.
No artwork was generated.

Source executable SHA-256:
`5f650f52d12751e08b63e590edb0d9b9f09d087cea900baa0eb39e4af8eda251`

To reproduce with an existing local copy of the original executable:

```powershell
python tools/extract-app-icon.py "path/to/PlantsVsZombies.exe" assets/branding
```

The extraction utility requires Pillow and pefile; neither is a build or
runtime dependency. The committed icon files are sufficient for builds.

Windows embeds the ICO under `IDI_MAIN_ICON`, the resource name already
loaded by Win32App. VersionInfo identifies the product, internal name and
original filename as pvz_perf. The initial resource version is 1.0.0.0.

Linux builds stage the desktop file and PNG beside the binary. The CMake
`branding` install component installs them under
`${CMAKE_INSTALL_DATADIR}/applications` and
`${CMAKE_INSTALL_DATADIR}/icons/hicolor/256x256/apps`.
The desktop entry expects the packaged executable or launcher `pvz_perf`
on PATH; this component installs only desktop metadata and the icon.
The Wayland app_id, desktop filename and both X11 WM_CLASS strings all
use `pvz_perf` so desktop environments can associate the installed icon.
Win32 uses `pvz_perf` for the main window class and `pvz_perf_hidden` for
the hidden helper window. Its single-instance mutex is
`pvz_perf.SingleInstance` and notification message is `pvz_perf.Notify`.

Application branding does not rename the existing save/settings roots,
including `PlantsVsZombiesModern` and `PopCap\PlantsVsZombies`.
The internal CMake build target remains `LawnProject`.

After the coordinated build, check the new `pvz_perf.exe` independently of
the frozen old executable, including Explorer's icon and version details,
the window title and taskbar icon. On Linux, check the desktop entry with
the packaged PATH, X11 WM_CLASS and Wayland application grouping.
