#!/usr/bin/env python3
"""Linux-only, CPU-only regression checks; never launches the actual game."""

import hashlib
import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest


TOOL = Path(__file__).with_name("package-linux-runtime.py")


@unittest.skipUnless(sys.platform == "linux", "Linux loader integration tests")
class RuntimePackageTests(unittest.TestCase):
    def test_closure_relocation_and_rejections(self):
        with tempfile.TemporaryDirectory(prefix="pvz-runtime-test-") as temporary:
            root = Path(temporary)
            release = root / "Release"
            release.mkdir()
            (root / "dependency.c").write_text("int dependency(void) { return 42; }\n")
            (root / "bass.c").write_text(
                "extern int dependency(void); int bass(void) { return dependency(); }\n")
            (root / "probe.c").write_text(
                '#include <dlfcn.h>\n#include <stdio.h>\n#include <string.h>\n'
                '#include <unistd.h>\n#include <sys/auxv.h>\n'
                'int main(int argc, char **argv) {\n'
                'char exe[4096], directory[4096], resource[8192];\n'
                'ssize_t n = readlink("/proc/self/exe", exe, sizeof(exe)-1);\n'
                'if (n < 0) return 9; exe[n] = 0;\n'
                'printf("proc:%s\\nexecfn:%s\\n", exe, (char *)getauxval(AT_EXECFN));\n'
                'strcpy(directory, exe); *strrchr(directory, \'/\') = 0;\n'
                'snprintf(resource, sizeof(resource), "%s/shaders/probe.spv", directory);\n'
                'FILE *shader = fopen(resource, "rb"); if (!shader) return 10; fclose(shader);\n'
                'snprintf(resource, sizeof(resource), "%s/../main.pak64", directory);\n'
                'FILE *pak = fopen(resource, "rb"); if (!pak) return 11; fclose(pak);\n'
                'snprintf(resource, sizeof(resource), "%s/libbass.so", directory);\n'
                'void *absolute_bass = dlopen(resource, RTLD_NOW);\n'
                'if (!absolute_bass) { fputs(dlerror(), stderr); return 12; }\n'
                'void *h = dlopen("./libbass.so", RTLD_NOW);\n'
                'if (!h) { fputs(dlerror(), stderr); return 7; }\n'
                'int (*f)(void) = (int (*)(void))dlsym(h, "bass");\n'
                'if (!f || f() != 42 || argc != 2) return 8;\n'
                'printf("runtime-probe:%s\\n", argv[1]); return 0;\n}\n')
            for args in (
                ["gcc", "-shared", "-fPIC", str(root / "dependency.c"),
                 "-Wl,-soname,libclosure.so.1", "-o", str(release / "libclosure.so.1")],
                ["gcc", "-shared", "-fPIC", str(root / "bass.c"), "-L" + str(release),
                 "-l:libclosure.so.1", "-Wl,-rpath,$ORIGIN", "-o", str(release / "libbass.so")],
                ["gcc", str(root / "probe.c"), "-ldl",
                 "-o", str(release / "pvz_perf")],
            ):
                subprocess.run(args, check=True, capture_output=True)
            (release / "data").mkdir()
            (release / "data/resource.txt").write_text("resource\n")
            (release / "shaders").mkdir()
            (release / "shaders/probe.spv").write_bytes(b"shader-path-probe")
            (release / "main.pak64").write_bytes(b"resource-root-probe")
            (release / "scale.json").write_text('{"user_config": true}\n')
            (release / "Windows.exe").write_bytes(b"MZ-preserve-me")
            (release / "start.cmd").write_text("@echo WSL launcher\n")
            output = root / "package"

            def pack(destination=output, *extra):
                return subprocess.run(
                    [sys.executable, str(TOOL), str(release), str(destination)]
                    + list(extra),
                    text=True, capture_output=True)

            self.assertNotEqual(pack(release / "nested").returncode, 0)
            self.assertFalse((release / "nested").exists())
            result = pack()
            self.assertEqual(result.returncode, 0, result.stderr)
            manifest = json.loads((output / "runtime-manifest.json").read_text())
            self.assertFalse(manifest["complete_runtime"])
            self.assertFalse((output / "start.cmd").exists())
            self.assertTrue((release / "start.cmd").exists())
            self.assertIn("libclosure.so.1", manifest["libraries"])
            self.assertIn("libbass.so", manifest["libraries"])
            for entry in manifest["files"]:
                self.assertEqual(hashlib.sha256((output / entry["path"]).read_bytes()).hexdigest(),
                                 entry["sha256"])
            self.assertEqual((output / "Windows.exe").read_bytes(), b"MZ-preserve-me")
            self.assertEqual((output / "scale.json").read_bytes(),
                             (release / "scale.json").read_bytes())
            moved = root / "moved package's directory"
            output.rename(moved)
            link = root / "launcher"
            link.symlink_to(moved / "start")
            launched = subprocess.run([str(link), "argument with spaces"], cwd="/",
                                      text=True, capture_output=True)
            self.assertEqual(launched.returncode, 0, launched.stdout + launched.stderr)
            self.assertEqual(launched.stdout.splitlines(), [
                f"proc:{moved / manifest['loader']}",
                f"execfn:{moved / 'pvz_perf'}",
                "runtime-probe:argument with spaces",
            ])
            self.assertNotEqual(pack(moved).returncode, 0)
            (release / "bad-link").symlink_to("/etc/passwd")
            self.assertNotEqual(pack().returncode, 0)
            self.assertFalse(output.exists())
            (release / "bad-link").unlink()
            (release / "libvulkan_fake.so").write_bytes(b"host driver")
            self.assertNotEqual(pack().returncode, 0)
            self.assertFalse(output.exists())
            (release / "libvulkan_fake.so").unlink()
            (release / "libclosure.so.1").rename(root / "hidden-library")
            self.assertNotEqual(pack().returncode, 0)
            self.assertFalse(output.exists())


if __name__ == "__main__":
    unittest.main()
