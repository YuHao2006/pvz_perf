// Export references to defined strings whose value starts with a prefix.
// Usage from analyzeHeadless:
//   -postScript ExportStringReferences.java output.txt IMAGE_ZOMBATAR_

import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.Address;
import ghidra.program.model.listing.Data;
import ghidra.program.model.listing.Function;
import ghidra.program.model.listing.Instruction;
import ghidra.program.model.listing.Listing;
import ghidra.program.model.symbol.Reference;

import java.io.File;
import java.io.PrintWriter;

public class ExportStringReferences extends GhidraScript {
    @Override
    protected void run() throws Exception {
        String[] args = getScriptArgs();
        if (args.length != 2) {
            throw new IllegalArgumentException("Expected: <output-file> <string-prefix>");
        }

        File output = new File(args[0]);
        String prefix = args[1];
        Listing listing = currentProgram.getListing();
        int count = 0;

        try (PrintWriter writer = new PrintWriter(output, "UTF-8")) {
            for (Data data : listing.getDefinedData(true)) {
                Object value = data.getValue();
                if (!(value instanceof String) || !((String)value).startsWith(prefix)) {
                    continue;
                }

                count++;
                writer.printf("STRING %s %s%n", data.getAddress(), value);
                for (Reference reference : getReferencesTo(data.getAddress())) {
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
                        for (int before = 0; before < 3 && cursor.getPrevious() != null; before++) {
                            cursor = cursor.getPrevious();
                        }
                        for (int line = 0; line < 7 && cursor != null; line++) {
                            writer.printf("    %s  %s%n", cursor.getAddress(), cursor);
                            cursor = cursor.getNext();
                        }
                    }
                }
                writer.println();
            }
        }

        println("Exported " + count + " matching strings to " + output.getAbsolutePath());
    }
}
