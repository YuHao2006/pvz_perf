// Create missing functions at explicit addresses and decompile them.
// Usage from analyzeHeadless:
//   -postScript DecompileAddresses.java output.txt 0052d320 0052ee10

import ghidra.app.decompiler.DecompInterface;
import ghidra.app.decompiler.DecompileResults;
import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.Address;
import ghidra.program.model.listing.Function;

import java.io.File;
import java.io.PrintWriter;

public class DecompileAddresses extends GhidraScript {
    @Override
    protected void run() throws Exception {
        String[] args = getScriptArgs();
        if (args.length < 2) {
            throw new IllegalArgumentException(
                "Expected: <output-file> <address> [address ...]");
        }

        File output = new File(args[0]);
        DecompInterface decompiler = new DecompInterface();
        decompiler.toggleCCode(true);
        decompiler.toggleSyntaxTree(true);
        if (!decompiler.openProgram(currentProgram)) {
            throw new IllegalStateException(decompiler.getLastMessage());
        }

        try (PrintWriter writer = new PrintWriter(output, "UTF-8")) {
            for (int index = 1; index < args.length; index++) {
                Address address = toAddr(args[index]);
                Function function = getFunctionAt(address);
                if (function == null) {
                    function = createFunction(address, null);
                }
                if (function == null) {
                    writer.printf("/* Could not create function at %s */%n%n", address);
                    continue;
                }

                writer.printf("/* %s %s */%n", address, function.getName());
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
            }
        }
        finally {
            decompiler.dispose();
        }

        println("Decompiled " + (args.length - 1) + " explicit addresses to " + output.getAbsolutePath());
    }
}
