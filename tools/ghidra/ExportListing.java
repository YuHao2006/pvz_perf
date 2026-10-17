// Export the decoded instruction listing for an inclusive address range.
// Usage from analyzeHeadless:
//   -postScript ExportListing.java 00530540 00530890 output.txt

import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.Address;
import ghidra.program.model.listing.Instruction;
import ghidra.program.model.listing.InstructionIterator;

import java.io.File;
import java.io.PrintWriter;

public class ExportListing extends GhidraScript {
    @Override
    protected void run() throws Exception {
        String[] args = getScriptArgs();
        if (args.length != 3) {
            throw new IllegalArgumentException(
                "Expected: <start-address> <end-address> <output-file>");
        }

        Address start = toAddr(args[0]);
        Address end = toAddr(args[1]);
        File output = new File(args[2]);
        InstructionIterator instructions = currentProgram
            .getListing()
            .getInstructions(start, true);

        int exported = 0;
        try (PrintWriter writer = new PrintWriter(output, "UTF-8")) {
            while (instructions.hasNext()) {
                Instruction instruction = instructions.next();
                if (instruction.getAddress().compareTo(end) > 0) {
                    break;
                }

                byte[] bytes = instruction.getBytes();
                StringBuilder encoded = new StringBuilder();
                for (byte value : bytes) {
                    encoded.append(String.format("%02X ", value & 0xff));
                }

                writer.printf(
                    "%s  %-24s  %s%n",
                    instruction.getAddress(),
                    encoded.toString(),
                    instruction.toString());
                exported++;
            }
        }

        println("Exported " + exported + " instructions to " + output.getAbsolutePath());
    }
}
