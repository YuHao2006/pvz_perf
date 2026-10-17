// Export consecutive 32-bit values from program memory.
// Usage from analyzeHeadless:
//   -postScript ExportDwords.java 00530878 5 output.txt

import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.Address;
import ghidra.program.model.mem.Memory;

import java.io.File;
import java.io.PrintWriter;

public class ExportDwords extends GhidraScript {
    @Override
    protected void run() throws Exception {
        String[] args = getScriptArgs();
        if (args.length != 3) {
            throw new IllegalArgumentException(
                "Expected: <start-address> <count> <output-file>");
        }

        Address address = toAddr(args[0]);
        int count = Integer.parseInt(args[1]);
        File output = new File(args[2]);
        Memory memory = currentProgram.getMemory();

        try (PrintWriter writer = new PrintWriter(output, "UTF-8")) {
            for (int index = 0; index < count; index++) {
                int value = memory.getInt(address);
                writer.printf("%s  %08X%n", address, value);
                address = address.add(4);
            }
        }

        println("Exported " + count + " dwords to " + output.getAbsolutePath());
    }
}
