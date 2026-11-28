"""Stage a DevEco project from the main CMake HarmonyOS build outputs."""
from argparse import ArgumentParser, ArgumentTypeError
from pathlib import Path
import shutil
import zipfile

ROOT = Path(__file__).resolve().parents[1]
ABIS = {"arm64-v8a": "aarch64-linux-ohos", "x86_64": "x86_64-linux-ohos"}
SAVE_TOOL_FILES = (
    "lineup-library.js", "save-codec.js", "save-generate.js", "save-lineups.js",
    "save-model.js", "save-prefab.js", "save-tool-core.js",
)


def abi_build(value):
    abi, sep, path = value.partition("=")
    if not sep or abi not in ABIS or not path:
        raise ArgumentTypeError("Use arm64-v8a=<build directory> or x86_64=<build directory>")
    return abi, Path(path).resolve()


def build_map(parser, pairs):
    builds = dict(pairs)
    if len(builds) != len(pairs):
        parser.error("Specify each ABI only once")
    return builds


def copy_runtime(builds, filename, target, shaders, compiler):
    shader_source = None
    for abi, build in builds.items():
        directory = target / "entry/libs" / abi
        directory.mkdir(parents=True, exist_ok=True)
        shutil.copy2(build / "Release" / filename, directory)
        shared = compiler / "llvm/lib" / ABIS[abi] / "libc++_shared.so"
        shutil.copy2(shared, directory)
        compiled = build / "Release/shaders"
        if shader_source is None:
            shader_source = compiled
        else:
            expected = {p.name: p.read_bytes() for p in shader_source.glob("*.spv")}
            actual = {p.name: p.read_bytes() for p in compiled.glob("*.spv")}
            if expected != actual:
                raise ValueError("GPU shader files differ between the requested ABIs")
    if shader_source is None or not (shader_source / "game_alpha_cs.spv").is_file():
        raise FileNotFoundError("Vulkan shaders were not staged by the CMake target")
    shutil.copytree(shader_source, shaders)


def main():
    parser = ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, required=True, help="new DevEco project directory")
    parser.add_argument("--ndk", type=Path, required=True, help="HarmonyOS SDK openharmony/native directory")
    parser.add_argument("--runtime", action="append", type=abi_build, required=True)
    parser.add_argument("--legacy-runtime", action="append", type=abi_build, default=[])
    parser.add_argument("--icons", type=Path, required=True, help="directory with foreground.png, background.png and startIcon.png")
    parser.add_argument("--pak", type=Path, help="matching main.pak64; omit for a resource-free HAP")
    options = parser.parse_args()
    modern = build_map(parser, options.runtime)
    legacy = build_map(parser, options.legacy_runtime)
    if legacy and legacy.keys() != modern.keys():
        parser.error("The modern and Vulkan 1.0 builds must include the same ABIs")
    if options.output.exists():
        parser.error("The staging output must not exist")
    if options.pak:
        with zipfile.ZipFile(options.pak) as pack:
            marker = "compiled/render-height.txt"
            height = int(pack.read(marker)) if marker in pack.namelist() else 600
        if height not in (600, 1200, 2400):
            parser.error("Unsupported resource height")
        if legacy and height != 600:
            parser.error("Only 600p packages include the Vulkan 1.0 backend")

    shutil.copytree(
        ROOT / "harmonyos", options.output,
        ignore=shutil.ignore_patterns(
            ".hvigor", ".idea", "build", "oh_modules", "libs", "shaders",
            "shaders-legacy", "*.pak64", "*.p12", "*.p7b", "*.cer",
            "vulkan-1.0-standard-600p.flag",
        ),
    )
    raw = options.output / "entry/src/main/resources/rawfile"
    copy_runtime(modern, "libpvz.so", options.output, raw / "shaders", options.ndk)
    if legacy:
        copy_runtime(legacy, "libpvz_legacy.so", options.output, raw / "shaders-legacy", options.ndk)
        (raw / "vulkan-1.0-standard-600p.flag").write_text("1\n", encoding="utf-8")
    if options.pak:
        shutil.copy2(options.pak, raw / "main.pak64")
    for filename in SAVE_TOOL_FILES:
        shutil.copy2(ROOT / "tools/bin/web" / filename, raw / "save-editor")
    for directory in ("AppScope/resources/base/media", "entry/src/main/resources/base/media"):
        for filename in ("foreground.png", "background.png"):
            shutil.copy2(options.icons / filename, options.output / directory)
    shutil.copy2(options.icons / "startIcon.png", options.output / "entry/src/main/resources/base/media")
    print(options.output.resolve())


if __name__ == "__main__":
    main()
