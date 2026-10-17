// Export references and nearby data/instructions for one or more addresses.
// Usage:
//   -postScript ExportAddressReferences.java output.txt 00725278 [address...]

import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.Address;
import ghidra.program.model.listing.Data;
import ghidra.program.model.listing.Function;
import ghidra.program.model.listing.Instruction;
import ghidra.program.model.listing.Listing;
import ghidra.program.model.mem.Memory;
import ghidra.program.model.symbol.Reference;

import java.io.File;
import java.io.PrintWriter;

public class ExportAddressReferences extends GhidraScript {
    @Override
    protected void run() throws Exception {
        String[] args = getScriptArgs();
        if (args.length < 2) {
            throw new IllegalArgumentException("Expected: <output-file> <address> [address...]");
        }

        File output = new File(args[0]);
        Listing listing = currentProgram.getListing();
        Memory memory = currentProgram.getMemory();

        try (PrintWriter writer = new PrintWriter(output, "UTF-8")) {
            for (int index = 1; index < args.length; index++) {
                Address target = toAddr(args[index]);
                writer.printf("ADDRESS %s%n", target);

                byte[] bytes = new byte[32];
                int read = memory.getBytes(target, bytes);
                writer.print("  BYTES");
                for (int i = 0; i < read; i++) {
                    writer.printf(" %02x", bytes[i] & 0xff);
                }
                writer.println();

                Data data = listing.getDataAt(target);
                if (data != null) {
                    writer.printf("  DATA %s%n", data);
                }

                for (Reference reference : getReferencesTo(target)) {
                    Address from = reference.getFromAddress();
                    Function function = getFunctionContaining(from);
                    writer.printf(
                        "  REF %s type=%s function=%s%n",
                        from,
                        reference.getReferenceType(),
                        function == null
                            ? "<data>"
                            : function.getName() + "@" + function.getEntryPoint());

                    Instruction instruction = listing.getInstructionAt(from);
                    if (instruction != null) {
                        Instruction cursor = instruction;
                        for (int before = 0; before < 4 && cursor.getPrevious() != null; before++) {
                            cursor = cursor.getPrevious();
                        }
                        for (int line = 0; line < 9 && cursor != null; line++) {
                            writer.printf("    %s  %s%n", cursor.getAddress(), cursor);
                            cursor = cursor.getNext();
                        }
                    }
                }
                writer.println();
            }
        }

        println("Exported address references to " + output.getAbsolutePath());
    }
}
