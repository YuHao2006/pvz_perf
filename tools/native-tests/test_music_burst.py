"""Compile the real music controller against deterministic playback/board doubles."""
from pathlib import Path
import ctypes
import os
import shutil
import subprocess
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[2]


class MusicBurstTests(unittest.TestCase):
    def test_shipped_night_module(self):
        if os.name != "nt":
            self.skipTest("This decoder probe uses the shipped Windows BASS library")
        candidates = list((ROOT / "out").glob("*/Release/bass.dll"))
        if not candidates:
            self.skipTest("Build the game to obtain the shipped BASS decoder")
        bass = ctypes.WinDLL(str(candidates[0]))
        bass.BASS_Init.argtypes = [ctypes.c_int, ctypes.c_uint, ctypes.c_uint,
                                  ctypes.c_void_p, ctypes.c_void_p]
        bass.BASS_MusicLoad.argtypes = [ctypes.c_int, ctypes.c_void_p, ctypes.c_ulonglong,
                                       ctypes.c_uint, ctypes.c_uint, ctypes.c_uint]
        bass.BASS_ChannelSetPosition.argtypes = [ctypes.c_uint, ctypes.c_ulonglong, ctypes.c_uint]
        bass.BASS_ChannelGetPosition.argtypes = [ctypes.c_uint, ctypes.c_uint]
        bass.BASS_ChannelGetPosition.restype = ctypes.c_ulonglong
        bass.BASS_ChannelSetAttribute.argtypes = [ctypes.c_uint, ctypes.c_uint, ctypes.c_float]
        bass.BASS_ChannelGetData.argtypes = [ctypes.c_uint, ctypes.c_void_p, ctypes.c_uint]
        bass.BASS_ChannelGetData.restype = ctypes.c_uint
        # Device 0 is BASS's silent device; decode channels never produce output.
        self.assertTrue(bass.BASS_Init(0, 44100, 0, None, None))
        try:
            module = str(ROOT / "assets/runtime/sounds/mainmusic.mo3").encode()
            # DECODE | RAMP | LOOP, matching the production module plus decode.
            handle = bass.BASS_MusicLoad(0, module, 0, 0, 0x200204, 44100)
            self.assertNotEqual(handle, 0)
            try:
                self.assertTrue(bass.BASS_ChannelSetAttribute(handle, 0x102, 4))
                pcm = (ctypes.c_int16 * (44100 * 2))()

                def decode_second():
                    self.assertEqual(bass.BASS_ChannelGetData(handle, pcm, ctypes.sizeof(pcm)),
                                     ctypes.sizeof(pcm))
                    return max(abs(sample) for sample in pcm)

                self.assertTrue(bass.BASS_ChannelSetPosition(handle, 92, 1))
                for _ in range(20):
                    self.assertEqual(decode_second(), 0, "Night holding pattern became audible")
                self.assertEqual(bass.BASS_ChannelGetPosition(handle, 1) & 0xffff, 92)
                for order in (76, 77):
                    self.assertTrue(bass.BASS_ChannelSetPosition(handle, order, 1))
                    self.assertGreater(decode_second(), 1000, "Night climax contains no audible samples")
                    position = bass.BASS_ChannelGetPosition(handle, 1)
                    self.assertEqual(position & 0xffff, order)
                    self.assertGreater(position >> 16, 0, "Night module clock did not advance")
                print("PASS shipped night module: silent holding loop and both audible climax entry orders")
            finally:
                bass.BASS_MusicFree(handle)
        finally:
            bass.BASS_Free()

    def test_production_controller(self):
        compiler = shutil.which("c++") or shutil.which("g++") or shutil.which("clang++")
        vcvars = Path("C:/UserProgram/Visual Studuio/2026/Community/VC/Auxiliary/Build/vcvars64.bat")
        if not compiler and not vcvars.exists():
            self.skipTest("A C++20 compiler is required")
        production = (ROOT / "pvzPerf/Lawn/System/Music.cpp").read_text(encoding="utf-8")

        def definition(name):
            start = production.index(f"void Music::{name}(")
            opening = production.index("{", start)
            depth = 1
            end = opening + 1
            while depth:
                depth += (production[end] == "{") - (production[end] == "}")
                end += 1
            return production[start:end]

        source = (ROOT / "Tests/native/MusicBurstTests.cpp").read_text(encoding="utf-8")
        source += "\nusing namespace Sexy;\n"
        source += definition("StartBurst") + "\n" + definition("UpdateMusicBurst") + "\n"
        source += r'''
void Require(bool value, const char* message)
{
    if (!value) throw std::runtime_error(message);
}
int main()
{
    for (unsigned fps : {30u, 60u, 100u, 144u, 240u, 250u, 1000u})
    {
        Sexy::gUpdateIntervalNs = 1'000'000'000ULL / fps;
        Board board;
        LawnApp app;
        app.mBoard = &board;
        Sexy::BassMusicInterface playback;
        Music music;
        music.mApp = &app;
        music.mMusicInterface = &playback;
        currentOrder = MAKELONG(48, 80);
        music.UpdateMusicBurst();
        Require(music.mMusicBurstState == MUSIC_BURST_STARTING, "Crowd did not trigger night burst");
        music.UpdateMusicBurst();
        Require(music.mMusicDrumsState == MUSIC_DRUMS_ON_QUEUED, "Night layer was not queued");
        for (unsigned i = 0; i < fps * 2; ++i) music.UpdateMusicBurst();
        Require(music.mBurstStateCounter == 400, "Queue wait consumed night crossfade");
        Require(playback.mMusicSlots[2]->mPlayback.seeks == 0, "Night layer jumped before bar boundary");
        currentOrder = MAKELONG(49, 0);
        music.UpdateMusicBurst();
        Require(music.mMusicDrumsState == MUSIC_DRUMS_ON, "Night layer did not start at boundary");
        Require(playback.mMusicSlots[2]->mPlayback.order == 77, "Odd night bar selected wrong climax");
        Require(playback.volume[2] == 1.0, "Night climax remained muted");
        for (unsigned i = 0; i < fps * 5; ++i) music.UpdateMusicBurst();
        Require(music.mMusicBurstState == MUSIC_BURST_ON, "Night crossfade never finished");
        Require(playback.volume[1] == 0.0 && playback.volume[2] == 1.0,
            "Night climax gains are incorrect");
        board.zombies = 0;
        for (unsigned i = 0; i < fps * 22; ++i) music.UpdateMusicBurst();
        Require(music.mMusicBurstState == MUSIC_BURST_OFF &&
            music.mMusicDrumsState == MUSIC_DRUMS_OFF, "Night climax never returned to calm");
        Require(playback.volume[1] == 1.0 && playback.volume[2] == 0.0,
            "Night calm gains are incorrect");
        music.StartBurst();
        music.UpdateMusicBurst();
        currentOrder = MAKELONG(50, 0);
        music.UpdateMusicBurst();
        Require(playback.mMusicSlots[2]->mPlayback.order == 76, "Even night bar selected wrong climax");
        Require(playback.mMusicSlots[2]->mPlayback.seeks == 2, "Climax did not retrigger exactly once");
        std::cout << "PASS night music burst/crossfade/release/retrigger at " << fps << " FPS\n";
    }
}
'''
        with tempfile.TemporaryDirectory(prefix="pvz-music-burst-") as temp:
            source_path = Path(temp) / "music_burst.cpp"
            executable = Path(temp) / ("music_burst.exe" if os.name == "nt" else "music_burst")
            source_path.write_text(source, encoding="utf-8")
            includes = [ROOT / "pvzPerf", ROOT / "pvzPerf/SexyAppFramework"]
            if compiler:
                command = [compiler, "-std=c++20", *[f"-I{path}" for path in includes],
                           str(source_path), "-o", str(executable)]
            else:
                build = (f'call "{vcvars}" >nul && cl /nologo /EHsc /std:c++20 '
                         + " ".join(f'/I"{path}"' for path in includes)
                         + f' "{source_path}" /Fo"{temp}/music_burst.obj" /Fe"{executable}"')
                command = f'"{os.environ.get("COMSPEC", "cmd.exe")}" /d /s /c "{build}"'
            subprocess.run(command, cwd=temp, check=True)
            subprocess.run([str(executable)], cwd=temp, check=True)


if __name__ == "__main__":
    unittest.main()
