// Find raw little-endian 32-bit values, including references in undefined data.
// Usage from analyzeHeadless:
//   -postScript FindDwordValues.java output.txt 00725660 [value ...]

import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.Address;
import ghidra.program.model.mem.Memory;
import ghidra.program.model.mem.MemoryBlock;

import java.io.File;
import java.io.PrintWriter;

public class FindDwordValues extends GhidraScript {
    @Override
    protected void run() throws Exception {
        String[] args = getScriptArgs();
        if (args.length < 2) {
            throw new IllegalArgumentException("Expected: <output-file> <value> [value ...]");
        }

        File output = new File(args[0]);
        int[] values = new int[args.length - 1];
        for (int i = 1; i < args.length; ++i) {
            values[i - 1] = (int)Long.parseUnsignedLong(args[i], 16);
        }

        Memory memory = currentProgram.getMemory();
        try (PrintWriter writer = new PrintWriter(output, "UTF-8")) {
            for (MemoryBlock block : memory.getBlocks()) {
                if (!block.isInitialized()) {
                    continue;
                }
                long size = block.getSize();
                if (size < 4 || size > Integer.MAX_VALUE) {
                    continue;
                }

                byte[] bytes = new byte[(int)size];
                int read = memory.getBytes(block.getStart(), bytes);
                for (int offset = 0; offset + 4 <= read; ++offset) {
                    int candidate =
                        (bytes[offset] & 0xff) |
                        ((bytes[offset + 1] & 0xff) << 8) |
                        ((bytes[offset + 2] & 0xff) << 16) |
                        ((bytes[offset + 3] & 0xff) << 24);
                    for (int value : values) {
                        if (candidate == value) {
                            Address address = block.getStart().add(offset);
                            writer.printf("%s  %08X  block=%s%n", address, value, block.getName());
                        }
                    }
                }
            }
        }

        println("Wrote raw dword matches to " + output.getAbsolutePath());
    }
}
