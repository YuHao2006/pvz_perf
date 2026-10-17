// Export the 40-byte item descriptors used by the GOTY Zombatar editor.
// Usage from analyzeHeadless:
//   -postScript ExportZombatarItems.java output.csv

import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.Address;
import ghidra.program.model.mem.Memory;

import java.io.File;
import java.io.PrintWriter;

public class ExportZombatarItems extends GhidraScript {
    private static final String[] NAMES = {
        "hair", "facialHair", "tidbits", "eyewear",
        "clothes", "accessories", "hats", "backdrops"
    };

    private static final long[] STARTS = {
        0x0071bf78L, 0x0071c1f8L, 0x0071c5b8L, 0x0071c7e8L,
        0x0071ca68L, 0x0071cc48L, 0x0071cea0L, 0x0071d0d0L
    };

    private static final int[] COUNTS = {
        16, 24, 14, 16, 12, 15, 14, 5
    };

    private String readAscii(Memory memory, int pointer) throws Exception {
        if (pointer == 0) {
            return "";
        }

        Address address = toAddr(Integer.toUnsignedString(pointer, 16));
        StringBuilder value = new StringBuilder();
        for (int index = 0; index < 1024; index++) {
            byte next = memory.getByte(address.add(index));
            if (next == 0) {
                break;
            }
            value.append((char)(next & 0xff));
        }
        return value.toString().replace("\"", "\"\"");
    }

    @Override
    protected void run() throws Exception {
        String[] args = getScriptArgs();
        if (args.length != 1) {
            throw new IllegalArgumentException("Expected: <output-file>");
        }

        Memory memory = currentProgram.getMemory();
        File output = new File(args[0]);
        try (PrintWriter writer = new PrintWriter(output, "UTF-8")) {
            writer.println(
                "category,index,imageGlobal,maskGlobal,x,y,maskX,maskY,colorMode,alignment,track,renderOrder");
            for (int category = 0; category < NAMES.length; category++) {
                Address entry = toAddr(Long.toHexString(STARTS[category]));
                for (int index = 0; index < COUNTS[category]; index++) {
                    int imageGlobal = memory.getInt(entry);
                    int maskGlobal = memory.getInt(entry.add(4));
                    int x = memory.getInt(entry.add(8));
                    int y = memory.getInt(entry.add(12));
                    int maskX = memory.getInt(entry.add(16));
                    int maskY = memory.getInt(entry.add(20));
                    int colorMode = memory.getInt(entry.add(24));
                    int alignment = memory.getInt(entry.add(28));
                    int trackPointer = memory.getInt(entry.add(32));
                    int renderOrder = memory.getInt(entry.add(36));

                    writer.printf(
                        "%s,%d,%08X,%08X,%d,%d,%d,%d,%d,%d,\"%s\",%d%n",
                        NAMES[category], index, imageGlobal, maskGlobal,
                        x, y, maskX, maskY, colorMode, alignment,
                        readAscii(memory, trackPointer), renderOrder);
                    entry = entry.add(40);
                }
            }
        }

        println("Exported Zombatar item descriptors to " + output.getAbsolutePath());
    }
}
