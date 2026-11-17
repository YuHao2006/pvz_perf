# Effects Unicode-path verification (2026-11-17)

Fix: use an ASCII virtual filename for DXC's generated in-memory source while
preserving the real Unicode include directory. Open authored UTF-8 paths via
std::filesystem::path(std::u8string), and use the same conversion for .vfx output.
Both SPIR-V and DXIL compilation use this rule. No scratch shader files are used.

Tested with the project's DXC DLL and MSVC on Windows 11:

- Default UTF-8 process: 3 effects / 14 passes per backend passed.
- Fusion manifest activeCodePage=zh-CN: GetACP() returned 936.
- CP936 with the original compiler: failed opening the Unicode Anime4K path.
- CP936 with the fixed compiler: 3 effects / 14 passes per backend passed.
- ASCII and Unicode directories produced byte-identical SPIR-V and DXIL.
- A synthetic effect used a Unicode filename, a Unicode include filename, and
  nested relative includes. A header-only #error marker checked that the raw
  on-disk effect was not substituted for generated memory source.
- Unicode-path .vfx writing and loading passed.

The original compiler passed in the UTF-8 process on this machine. The reporter's
specific DXC raw-file fallback was not independently reproduced here. CP936
reproduced an additional real failure at the original narrow ifstream boundary.
Linux/macOS builds were not executed; production changes add no Windows-only API.

The CTest target runs the self-contained synthetic fixture. To additionally
check a local effect catalog, pass its ASCII directory as the first argument.
The optional second argument asserts the expected process code page (e.g. 936).
The zh-CN manifest selection is supported on Windows 11; it does not alter the
system-wide code page or require a reboot.
