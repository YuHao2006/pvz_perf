// Export a fast, decompiler-independent inventory of every internal function.
// Usage: -postScript ExportFunctionInventory.java <output-csv>

import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.Address;
import ghidra.program.model.listing.Function;
import ghidra.program.model.listing.FunctionIterator;
import ghidra.program.model.mem.Memory;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.nio.charset.StandardCharsets;

public class ExportFunctionInventory extends GhidraScript {
    private static String csv(String value) {
        return "\"" + value.replace("\"", "\"\"") + "\"";
    }

    @Override
    protected void run() throws Exception {
        String[] args = getScriptArgs();
        if (args.length != 1) {
            throw new IllegalArgumentException("Expected: <output-csv>");
        }

        File output = new File(args[0]).getCanonicalFile();
        File parent = output.getParentFile();
        if (parent != null && !parent.isDirectory() && !parent.mkdirs()) {
            throw new IllegalStateException("Cannot create " + parent);
        }

        Memory memory = currentProgram.getMemory();
        int count = 0;
        try (BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(
                new FileOutputStream(output), StandardCharsets.UTF_8))) {
            writer.write("address,name,prototype,calling_convention,body_min,body_max,size,thunk\n");
            FunctionIterator functions = currentProgram.getFunctionManager().getFunctions(true);
            while (functions.hasNext() && !monitor.isCancelled()) {
                Function function = functions.next();
                Address entry = function.getEntryPoint();
                if (!entry.isMemoryAddress() || !memory.contains(entry) || function.isExternal()) {
                    continue;
                }
                String convention = function.getCallingConventionName();
                if (convention == null) {
                    convention = "";
                }
                writer.write(csv(entry.toString().toUpperCase()));
                writer.write("," + csv(function.getName(true)));
                writer.write("," + csv(function.getPrototypeString(true, true)));
                writer.write("," + csv(convention));
                writer.write("," + csv(function.getBody().getMinAddress().toString().toUpperCase()));
                writer.write("," + csv(function.getBody().getMaxAddress().toString().toUpperCase()));
                writer.write("," + function.getBody().getNumAddresses());
                writer.write("," + function.isThunk());
                writer.write("\n");
                count++;
            }
        }
        println("Exported " + count + " internal functions to " + output);
    }
}
