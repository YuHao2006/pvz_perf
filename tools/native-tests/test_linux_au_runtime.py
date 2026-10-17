"""CPU-only AU/ASan and production loading-thread boundary checks; no game launch."""
from pathlib import Path
import os
import subprocess
import sys
import zipfile


ROOT = Path(__file__).resolve().parents[2]
OUTPUT = ROOT / "log/linux-au-cpu"


def run(arguments):
    print("+", " ".join(map(str, arguments)), flush=True)
    subprocess.run(list(map(str, arguments)), cwd=ROOT, check=True)


def loading_thread_fixture():
    source = (ROOT / "pvzPerf/SexyAppFramework/SexyAppBase.cpp").read_text(encoding="utf-8-sig")
    signatures = [
        "void SexyAppBase::WaitForLoadingThread()",
        "void SexyAppBase::LoadingThreadProcStub(void *theArg)",
        "void SexyAppBase::StartLoadingThread()",
        "void SexyAppBase::RethrowLoadingThreadError()",
    ]
    definitions = []
    for signature in signatures:
        start = source.index(signature)
        end = source.index("\n}", start) + 2
        definitions.append(source[start:end])
    # Compile the exact production function bodies against a CPU-only app fixture.
    # This exercises thread startup, publication, joining and exception transport
    # without constructing any window, renderer, or game object.
    prefix = r"""
#include <atomic>
#include <cstdio>
#include <exception>
#include <iostream>
#include <stdexcept>
#include <string>
#include <thread>
struct LoaderFailure final : std::runtime_error { using std::runtime_error::runtime_error; };
namespace Sexy {
class SexyAppBase {
public:
    std::thread mLoadingThread;
    std::atomic<bool> mLoadingThreadStarted{false}, mLoadingThreadCompleted{false}, mLoadingFailed{false};
    std::exception_ptr mLoadingThreadError;
    unsigned int mTimeLoaded = 0;
    bool fail = false;
    void LoadingThreadProc() { if (fail) throw LoaderFailure("original AU loader failure"); }
    static void LoadingThreadProcStub(void*);
    void StartLoadingThread();
    void WaitForLoadingThread();
    void RethrowLoadingThreadError();
};
}
using namespace Sexy;
unsigned int RuntimeTick() { return 0; }
void RuntimeDebugOutput(const char*) {}
"""
    suffix = r"""
int main() {
    for (int iteration = 0; iteration < 64; ++iteration) {
        SexyAppBase app;
        app.fail = iteration % 2 != 0;
        app.RethrowLoadingThreadError();
        app.StartLoadingThread();
        app.WaitForLoadingThread();
        if (!app.mLoadingThreadCompleted.load(std::memory_order_acquire) ||
            app.mLoadingFailed.load() != app.fail) return 1;
        for (int attempt = 0; attempt < 2; ++attempt) {
            bool caught = false;
            try { app.RethrowLoadingThreadError(); }
            catch (const LoaderFailure& error) {
                caught = std::string(error.what()) == "original AU loader failure";
            }
            if (caught != app.fail) return 2;
        }
    }
    SexyAppBase cancellation;
    cancellation.mLoadingFailed = true;
    cancellation.StartLoadingThread();
    cancellation.WaitForLoadingThread();
    cancellation.RethrowLoadingThreadError();
    std::cout << "Loading thread: 64 successful/failing runs preserve original exception type/message; "
        "repeated rethrow and cancellation checks passed\n";
}
"""
    fixture = OUTPUT / "loading_thread_boundary.cpp"
    fixture.write_text(prefix + "\n\n".join(definitions) + suffix, encoding="utf-8")
    return fixture


def main():
    OUTPUT.mkdir(parents=True, exist_ok=True)
    archive = Path(sys.argv[1]) if len(sys.argv) > 1 else ROOT / "out/x64-x11-vulkan/Release/main.pak64"
    library = ROOT / "out/x64-x11-vulkan/Release/libbass.so"
    assets = []
    with zipfile.ZipFile(archive) as package:
        for index, name in enumerate(package.namelist()):
            if name.casefold().endswith(".au"):
                path = OUTPUT / f"asset-{index}-{Path(name.replace(chr(92), '/')).name}"
                path.write_bytes(package.read(name))
                assets.append(path)
                print("Read AU fixture from package:", name, flush=True)
    if not assets:
        raise RuntimeError("No real AU assets in test package")
    flags = ["-std=c++23", "-O1", "-g", "-fsanitize=address,undefined", "-fno-omit-frame-pointer",
             "-Wall", "-Wextra", "-Werror"]
    parser = OUTPUT / "au_decode_tests"
    run(["c++", *flags, ROOT / "tools/native-tests/au_decode_tests.cpp", "-ldl", "-o", parser])
    os.environ["ASAN_OPTIONS"] = "detect_leaks=1:halt_on_error=1"
    os.environ["UBSAN_OPTIONS"] = "halt_on_error=1"
    run([parser, library, *assets])
    fixture = loading_thread_fixture()
    worker = OUTPUT / "loading_thread_boundary"
    run(["c++", *flags, "-pthread", fixture, "-o", worker])
    run([worker])


if __name__ == "__main__":
    main()
