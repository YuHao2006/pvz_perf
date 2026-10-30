"""Compile actual BeginCommands against deterministic Vulkan admission doubles."""
from pathlib import Path
import os
import shutil
import subprocess
import tempfile
import unittest
ROOT = Path(__file__).resolve().parents[2]
class VulkanFrameAdmissionTests(unittest.TestCase):
    def test_production_frame_admission(self):
        production=(ROOT/'pvzPerf/SexyAppFramework/graphics/vulkan/VulkanContext.cpp').read_text(encoding='utf-8')
        start=production.index('VulkanContext::FrameContext VulkanContext::BeginCommands()')
        opening=production.index('{',start)
        end=opening+1
        depth=1
        while depth:
            depth += (production[end]=='{')-(production[end]=='}')
            end+=1
        fixture=(ROOT/'Tests/native/VulkanFrameAdmissionTests.cpp').read_text(encoding='utf-8')
        source=fixture.replace('/*PRODUCTION*/',production[start:end])
        compiler=shutil.which('c++') or shutil.which('g++') or shutil.which('clang++')
        vcvars=Path('C:/UserProgram/Visual Studuio/2026/Community/VC/Auxiliary/Build/vcvars64.bat')
        with tempfile.TemporaryDirectory(prefix='pvz-frame-admission-') as temp:
            cpp=Path(temp)/'frame_admission.cpp'
            exe=Path(temp)/('frame_admission.exe' if os.name=='nt' else 'frame_admission')
            cpp.write_text(source,encoding='utf-8')
            if compiler:
                command=[compiler,'-std=c++20',str(cpp),'-o',str(exe)]
            elif vcvars.exists():
                toolset=Path('C:/UserProgram/Visual Studuio/2026/Community/VC/Tools/MSVC/14.51.36231')
                build=(f'call "{vcvars}" >nul && set "INCLUDE={toolset}/include;!INCLUDE!" && '
                       f'set "LIB={toolset}/lib/x64;!LIB!" && "{toolset}/bin/Hostx64/x64/cl.exe" '
                       f'/nologo /EHsc /std:c++20 "{cpp}" /Fo"{temp}/frame_admission.obj" /Fe"{exe}"')
                command=f'"{os.environ.get("COMSPEC","cmd.exe")}" /d /v:on /s /c "{build}"'
            else:
                self.skipTest('A C++20 compiler is required')
            subprocess.run(command,cwd=temp,check=True)
            subprocess.run([str(exe)],cwd=temp,check=True)
if __name__=='__main__':
    unittest.main()
