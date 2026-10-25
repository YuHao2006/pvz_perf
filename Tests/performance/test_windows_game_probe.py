"""Check external counter decoding without opening or modifying a game process."""
import os
import struct
import unittest

if os.name == "nt":
    from windows_game_probe import Game


@unittest.skipUnless(os.name == "nt", "Windows process reader")
class CounterWidths(unittest.TestCase):
    def snapshot(self, width, value):
        fields = ("mDrawCount", "mUpdateCount", "mGameScene", "mGameMode",
                  "mHWnd", "mBoard", "mCreditScreen", "mGameSelector",
                  "mTitleScreen", "mPlayerInfo", "mAwardScreen")
        layout = {name: index * 8 for index, name in enumerate(fields)}
        layout["board"] = {"paused": 0, "counter": 8, "wave": 16}
        if width:
            layout["boardCounterBytes"] = width
        reads = []

        class Memory:
            pid = 123
            app_address = 0x100

            def pointer(self, address):
                if address == self.app_address:
                    return 0x1000
                return 0x2000 if address == 0x1000 + layout["mBoard"] else 0

            def read(self, address, code):
                reads.append((address, code))
                if address == 0x2008:
                    raw = struct.pack("<Q", value)
                    return struct.unpack(code, raw[:struct.calcsize(code)])[0]
                if address == 0x1000 + layout["mGameScene"]:
                    return 3
                if address == 0x1000 + layout["mGameMode"]:
                    return 58
                return 0

        memory = Memory()
        memory.layout = layout
        return Game.snapshot(memory), reads

    def test_nanosecond_clock_above_32_bits(self):
        value = (1 << 50) + 123_456
        result, reads = self.snapshot(8, value)
        self.assertEqual(result["board"]["counter"], value)
        self.assertIn((0x2008, "<Q"), reads)

    def test_retail_and_old_layouts_keep_32_bit_counters(self):
        for width in (None, 4):
            result, reads = self.snapshot(width, 0xFEDCBA98)
            self.assertEqual(result["board"]["counter"], 0xFEDCBA98)
            self.assertIn((0x2008, "<I"), reads)


if __name__ == "__main__":
    unittest.main()
