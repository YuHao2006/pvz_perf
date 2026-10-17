import ctypes
import sys
from ctypes import wintypes

BASS_MUSIC_LOOP = 4
BASS_MUSIC_RAMP = 0x200
BASS_MUSIC_POSRESET = 0x8000
BASS_ATTRIB_VOL = 2
BASS_ATTRIB_MUSIC_VOL_CHAN = 0x200


def main():
    dll_path = sys.argv[1]
    mo3_path = sys.argv[2]
    bass = ctypes.WinDLL(dll_path)

    bass.BASS_Init.restype = wintypes.BOOL
    bass.BASS_Init.argtypes = [ctypes.c_int, wintypes.DWORD, wintypes.DWORD, ctypes.c_void_p, ctypes.c_void_p]
    bass.BASS_Init(-1, 44100, 0, None, None)

    bass.BASS_MusicLoad.restype = wintypes.DWORD
    bass.BASS_MusicLoad.argtypes = [
        wintypes.BOOL,
        ctypes.c_void_p,
        ctypes.c_uint64,
        wintypes.DWORD,
        wintypes.DWORD,
        wintypes.DWORD,
    ]
    handle = bass.BASS_MusicLoad(False, mo3_path.encode("utf-8"), 0, 0, BASS_MUSIC_LOOP | BASS_MUSIC_RAMP | BASS_MUSIC_POSRESET, 0)
    print("handle", handle)

    bass.BASS_ChannelSetAttribute.restype = wintypes.BOOL
    bass.BASS_ChannelSetAttribute.argtypes = [wintypes.DWORD, wintypes.DWORD, ctypes.c_float]
    bass.BASS_ChannelGetAttribute.restype = wintypes.BOOL
    bass.BASS_ChannelGetAttribute.argtypes = [wintypes.DWORD, wintypes.DWORD, ctypes.POINTER(ctypes.c_float)]

    # Emulate SetupMusicFileForTune(POOL_WATERYGRAVES, MUSIC_FILE_MAIN_MUSIC):
    # channels 0..17 audible, 18..28 silent.
    for track in range(0, 41):
        before = ctypes.c_float(-999.0)
        bass.BASS_ChannelGetAttribute(handle, BASS_ATTRIB_MUSIC_VOL_CHAN + track, ctypes.byref(before))
        value = 1.0 if 0 <= track <= 17 else 0.0
        ok = bass.BASS_ChannelSetAttribute(handle, BASS_ATTRIB_MUSIC_VOL_CHAN + track, value)
        got = ctypes.c_float(-999.0)
        bass.BASS_ChannelGetAttribute(handle, BASS_ATTRIB_MUSIC_VOL_CHAN + track, ctypes.byref(got))
        print(f"track {track:2d}: default={before.value:.3f} set={value:.1f} ok={ok} read={got.value:.3f}")

    # Set overall channel volume to 1 and read back.
    bass.BASS_ChannelSetAttribute(handle, BASS_ATTRIB_VOL, 1.0)
    overall = ctypes.c_float(-999.0)
    bass.BASS_ChannelGetAttribute(handle, BASS_ATTRIB_VOL, ctypes.byref(overall))
    print("overall", overall.value)

    bass.BASS_MusicFree.restype = wintypes.BOOL
    bass.BASS_MusicFree.argtypes = [wintypes.DWORD]
    bass.BASS_MusicFree(handle)
    bass.BASS_Free.restype = wintypes.BOOL
    bass.BASS_Free.argtypes = []
    bass.BASS_Free()


if __name__ == "__main__":
    main()
