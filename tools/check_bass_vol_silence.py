import ctypes
import math
import sys
from ctypes import wintypes

BASS_MUSIC_LOOP = 4
BASS_MUSIC_RAMP = 0x200
BASS_MUSIC_POSRESET = 0x8000
BASS_ATTRIB_VOL = 2
BASS_DATA_FLOAT = 0x40000000
BASS_ACTIVE_PLAYING = 1


def rms_of_decode(bass, handle, volume):
    bass.BASS_ChannelSetAttribute.restype = wintypes.BOOL
    bass.BASS_ChannelSetAttribute.argtypes = [wintypes.DWORD, wintypes.DWORD, ctypes.c_float]
    bass.BASS_ChannelSetAttribute(handle, BASS_ATTRIB_VOL, volume)

    bass.BASS_ChannelPlay.restype = wintypes.BOOL
    bass.BASS_ChannelPlay.argtypes = [wintypes.DWORD, wintypes.BOOL]
    bass.BASS_ChannelPlay(handle, True)

    bass.BASS_ChannelGetData.restype = wintypes.DWORD
    bass.BASS_ChannelGetData.argtypes = [wintypes.DWORD, ctypes.c_void_p, wintypes.DWORD]

    sample_count = 44100 * 2
    FloatArray = ctypes.c_float * sample_count
    buf = FloatArray()
    total = 0
    sumsq = 0.0
    while total < sample_count:
        got = bass.BASS_ChannelGetData(handle, ctypes.byref(buf, total * 4), (sample_count - total) * 4)
        if got == 0xFFFFFFFF:
            break
        got_floats = got // 4
        if got_floats == 0:
            break
        for i in range(got_floats):
            v = buf[total + i]
            sumsq += v * v
        total += got_floats
    bass.BASS_ChannelStop.restype = wintypes.BOOL
    bass.BASS_ChannelStop.argtypes = [wintypes.DWORD]
    bass.BASS_ChannelStop(handle)
    if total == 0:
        return 0.0
    return math.sqrt(sumsq / total)


def main():
    dll_path = sys.argv[1]
    mo3_path = sys.argv[2]
    bass = ctypes.WinDLL(dll_path)

    bass.BASS_Init.restype = wintypes.BOOL
    bass.BASS_Init.argtypes = [ctypes.c_int, wintypes.DWORD, wintypes.DWORD, ctypes.c_void_p, ctypes.c_void_p]
    bass.BASS_Init(-1, 44100, 0, None, None)

    bass.BASS_MusicLoad.restype = wintypes.DWORD
    bass.BASS_MusicLoad.argtypes = [wintypes.BOOL, ctypes.c_void_p, ctypes.c_uint64, wintypes.DWORD, wintypes.DWORD, wintypes.DWORD]
    handle = bass.BASS_MusicLoad(False, mo3_path.encode("utf-8"), 0, 0, BASS_MUSIC_LOOP | BASS_MUSIC_RAMP | BASS_MUSIC_POSRESET, 0)
    print("handle", handle)

    rms_zero = rms_of_decode(bass, handle, 0.0)
    rms_one = rms_of_decode(bass, handle, 1.0)
    print(f"rms_vol_0={rms_zero:.8f} rms_vol_1={rms_one:.8f} ratio={rms_zero / max(rms_one, 1e-12):.8f}")

    bass.BASS_MusicFree.restype = wintypes.BOOL
    bass.BASS_MusicFree.argtypes = [wintypes.DWORD]
    bass.BASS_MusicFree(handle)
    bass.BASS_Free.restype = wintypes.BOOL
    bass.BASS_Free.argtypes = []
    bass.BASS_Free()


if __name__ == "__main__":
    main()
