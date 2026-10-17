// Export raw bytes and a printable ASCII interpretation from program memory.
// Usage from analyzeHeadless:
//   -postScript ExportMemory.java output.txt 006e346c 256

import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.Address;
import ghidra.program.model.mem.Memory;

import java.io.File;
import java.io.PrintWriter;

public class ExportMemory extends GhidraScript {
    @Override
    protected void run() throws Exception {
        String[] args = getScriptArgs();
        if (args.length != 3) {
            throw new IllegalArgumentException("Expected: <output-file> <address> <length>");
        }

        File output = new File(args[0]);
        Address start = toAddr(args[1]);
        int length = Integer.parseInt(args[2]);
        if (length <= 0) {
            throw new IllegalArgumentException("Length must be positive");
        }

        byte[] bytes = new byte[length];
        Memory memory = currentProgram.getMemory();
        int read = memory.getBytes(start, bytes);

        try (PrintWriter writer = new PrintWriter(output, "UTF-8")) {
            for (int offset = 0; offset < read; offset += 16) {
                writer.printf("%s  ", start.add(offset));
                StringBuilder ascii = new StringBuilder();
                for (int column = 0; column < 16; column++) {
                    int index = offset + column;
                    if (index < read) {
                        int value = bytes[index] & 0xff;
                        writer.printf("%02X ", value);
                        ascii.append(value >= 32 && value < 127 ? (char)value : '.');
                    }
                    else {
                        writer.print("   ");
                        ascii.append(' ');
                    }
                }
                writer.printf(" |%s|%n", ascii);
            }
        }

        println("Exported " + read + " bytes to " + output.getAbsolutePath());
    }
}
