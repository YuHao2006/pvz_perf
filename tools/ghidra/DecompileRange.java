// Decompile every discovered function whose entry point is in [start, end].
// Usage from analyzeHeadless:
//   -postScript DecompileRange.java 00531820 00533000 output.txt

import ghidra.app.decompiler.DecompInterface;
import ghidra.app.decompiler.DecompileResults;
import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.Address;
import ghidra.program.model.listing.Function;
import ghidra.program.model.listing.FunctionIterator;

import java.io.File;
import java.io.PrintWriter;

public class DecompileRange extends GhidraScript {
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

        DecompInterface decompiler = new DecompInterface();
        decompiler.toggleCCode(true);
        decompiler.toggleSyntaxTree(true);
        if (!decompiler.openProgram(currentProgram)) {
            throw new IllegalStateException(decompiler.getLastMessage());
        }

        int exported = 0;
        try (PrintWriter writer = new PrintWriter(output, "UTF-8")) {
            FunctionIterator functions = currentProgram
                .getFunctionManager()
                .getFunctions(start, true);
            while (functions.hasNext()) {
                Function function = functions.next();
                Address entry = function.getEntryPoint();
                if (entry.compareTo(end) > 0) {
                    break;
                }

                writer.printf(
                    "/* %s %s */%n",
                    entry,
                    function.getName());
                DecompileResults result = decompiler.decompileFunction(
                    function,
                    120,
                    monitor);
                if (result.decompileCompleted()) {
                    writer.println(result.getDecompiledFunction().getC());
                }
                else {
                    writer.printf("/* decompile failed: %s */%n", result.getErrorMessage());
                }
                writer.println();
                exported++;
            }
        }
        finally {
            decompiler.dispose();
        }

        println("Decompiled " + exported + " functions to " + output.getAbsolutePath());
    }
}
