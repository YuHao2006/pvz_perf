// Export references to an address.
// Usage from analyzeHeadless:
//   -postScript ExportReferences.java 007a2010 output.txt

import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.Address;
import ghidra.program.model.listing.Function;
import ghidra.program.model.symbol.Reference;
import ghidra.program.model.symbol.ReferenceIterator;

import java.io.File;
import java.io.PrintWriter;

public class ExportReferences extends GhidraScript {
    @Override
    protected void run() throws Exception {
        String[] args = getScriptArgs();
        if (args.length != 2) {
            throw new IllegalArgumentException("Expected: <address> <output-file>");
        }

        Address target = toAddr(args[0]);
        File output = new File(args[1]);
        ReferenceIterator references = currentProgram
            .getReferenceManager()
            .getReferencesTo(target);

        int exported = 0;
        try (PrintWriter writer = new PrintWriter(output, "UTF-8")) {
            while (references.hasNext()) {
                Reference reference = references.next();
                Function function = getFunctionContaining(reference.getFromAddress());
                writer.printf(
                    "%s  %-16s  %s%n",
                    reference.getFromAddress(),
                    reference.getReferenceType(),
                    function == null ? "" : function.getName());
                exported++;
            }
        }

        println("Exported " + exported + " references to " + output.getAbsolutePath());
    }
}
