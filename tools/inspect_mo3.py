import ctypes
import sys
from ctypes import wintypes

BASS_MUSIC_LOOP = 4
BASS_MUSIC_RAMP = 0x200
BASS_MUSIC_POSRESET = 0x8000
BASS_ATTRIB_MUSIC_VOL_CHAN = 0x200
BASS_TAG_MUSIC_CHAN = 0x10200
BASS_TAG_MUSIC_SAMPLE = 0x10300
BASS_CTYPE_MUSIC_MOD = 0x20000
BASS_CTYPE_MUSIC_MTM = 0x20001
BASS_CTYPE_MUSIC_S3M = 0x20002
BASS_CTYPE_MUSIC_XM = 0x20003
BASS_CTYPE_MUSIC_IT = 0x20004
BASS_CTYPE_MUSIC_MO3 = 0x00100


class BASS_CHANNELINFO(ctypes.Structure):
    _fields_ = [
        ("freq", wintypes.DWORD),
        ("chans", wintypes.DWORD),
        ("flags", wintypes.DWORD),
        ("ctype", wintypes.DWORD),
        ("origres", wintypes.DWORD),
        ("plugin", ctypes.c_void_p),
        ("sample", wintypes.DWORD),
        ("filename", ctypes.c_char_p),
    ]


def main():
    dll_path = sys.argv[1]
    mo3_path = sys.argv[2]
    bass = ctypes.WinDLL(dll_path)

    bass.BASS_Init.restype = wintypes.BOOL
    bass.BASS_Init.argtypes = [ctypes.c_int, wintypes.DWORD, wintypes.DWORD, ctypes.c_void_p, ctypes.c_void_p]
    if not bass.BASS_Init(-1, 44100, 0, None, None):
        print("BASS_Init failed")
        return

    bass.BASS_MusicLoad.restype = wintypes.DWORD
    bass.BASS_MusicLoad.argtypes = [
        wintypes.BOOL,
        ctypes.c_void_p,
        ctypes.c_uint64,
        wintypes.DWORD,
        wintypes.DWORD,
        wintypes.DWORD,
    ]
    handle = bass.BASS_MusicLoad(
        False,
        mo3_path.encode("utf-8"),
        0,
        0,
        BASS_MUSIC_LOOP | BASS_MUSIC_RAMP | BASS_MUSIC_POSRESET,
        0,
    )
    if not handle:
        print("BASS_MusicLoad failed", ctypes.get_last_error())
        return

    bass.BASS_ChannelGetInfo.restype = wintypes.BOOL
    bass.BASS_ChannelGetInfo.argtypes = [wintypes.DWORD, ctypes.POINTER(BASS_CHANNELINFO)]
    info = BASS_CHANNELINFO()
    if bass.BASS_ChannelGetInfo(handle, ctypes.byref(info)):
        print(f"freq={info.freq} chans={info.chans} flags={info.flags:#x} ctype={info.ctype:#x} origres={info.origres:#x}")

    bass.BASS_ChannelGetTags.restype = ctypes.c_char_p
    bass.BASS_ChannelGetTags.argtypes = [wintypes.DWORD, wintypes.DWORD]

    for channel in range(0, 48):
        tag = bass.BASS_ChannelGetTags(handle, BASS_TAG_MUSIC_CHAN + channel)
        if tag:
            print(f"chan {channel:2d}: {tag.decode('latin1', errors='replace')}")
        else:
            print(f"chan {channel:2d}: <none>")

    print("--- samples ---")
    for sample in range(0, 200):
        tag = bass.BASS_ChannelGetTags(handle, BASS_TAG_MUSIC_SAMPLE + sample)
        if tag:
            print(f"sample {sample:2d}: {tag.decode('latin1', errors='replace')}")

    bass.BASS_MusicFree.restype = wintypes.BOOL
    bass.BASS_MusicFree.argtypes = [wintypes.DWORD]
    bass.BASS_MusicFree(handle)
    bass.BASS_Free.restype = wintypes.BOOL
    bass.BASS_Free.argtypes = []
    bass.BASS_Free()


if __name__ == "__main__":
    main()
