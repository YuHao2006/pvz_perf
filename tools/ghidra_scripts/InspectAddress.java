import ghidra.app.decompiler.DecompInterface;
import ghidra.app.decompiler.DecompileResults;
import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.Address;
import ghidra.program.model.listing.Function;
import ghidra.program.model.listing.Listing;
import ghidra.program.model.symbol.Reference;

import java.io.File;
import java.nio.file.Files;
import java.io.PrintWriter;

public class InspectAddress extends GhidraScript {
    @Override
    public void run() throws Exception {
        long[] addresses = {0x00726ec4L, 0x00726e98L, 0x00726760L};
        String[] args = getScriptArgs();
        File scriptDir = new File(getSourceFile().getAbsolutePath()).getParentFile();
        File outputRoot = args.length == 0
            ? new File(scriptDir, "../../out/ghidra").getCanonicalFile()
            : new File(args[0]);
        Files.createDirectories(outputRoot.toPath());
        File out = new File(outputRoot, "inspect-address.txt");
        try (PrintWriter writer = new PrintWriter(out, "UTF-8")) {
            Listing listing = currentProgram.getListing();
            DecompInterface decomp = new DecompInterface();
            decomp.openProgram(currentProgram);
            for (long value : addresses) {
                Address address = toAddr(value);
                writer.println(String.format("ADDRESS 0x%08x", value));
                Reference[] refs = getReferencesTo(address);
                for (Reference ref : refs) {
                    Function function = getFunctionContaining(ref.getFromAddress());
                    writer.println("REF " + ref.getFromAddress() + " -> " +
                        (function == null ? "?" : function.getName() + " @" + function.getEntryPoint()));
                    if (function != null) {
                        DecompileResults result = decomp.decompileFunction(function, 1200, monitor);
                        if (result.getDecompiledFunction() != null)
                            writer.println(result.getDecompiledFunction().getC());
                    }
                }
                writer.println();
            }
            decomp.dispose();
        }
        println("WROTE " + out);
    }
}
