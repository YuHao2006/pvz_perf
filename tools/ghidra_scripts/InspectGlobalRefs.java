import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.Address;
import ghidra.program.model.listing.Instruction;
import ghidra.program.model.listing.Listing;
import ghidra.program.model.symbol.Reference;
import ghidra.program.model.symbol.RefType;

import java.io.File;
import java.nio.file.Files;
import java.io.PrintWriter;

public class InspectGlobalRefs extends GhidraScript {
    @Override
    public void run() throws Exception {
        long[] values = {0x00726ec4L, 0x00726e98L, 0x00726760L, 0x00727150L, 0x00726778L};
        String[] args = getScriptArgs();
        File scriptDir = new File(getSourceFile().getAbsolutePath()).getParentFile();
        File outputRoot = args.length == 0
            ? new File(scriptDir, "../../out/ghidra").getCanonicalFile()
            : new File(args[0]);
        Files.createDirectories(outputRoot.toPath());
        File out = new File(outputRoot, "global-refs.txt");
        try (PrintWriter writer = new PrintWriter(out, "UTF-8")) {
            Listing listing = currentProgram.getListing();
            for (long value : values) {
                Address target = toAddr(value);
                writer.println(String.format("TARGET 0x%08x", value));
                for (Instruction instruction : listing.getInstructions(true)) {
                    for (Reference reference : instruction.getReferencesFrom()) {
                        if (reference.getToAddress().equals(target)) {
                            RefType type = reference.getReferenceType();
                            writer.println("  " + instruction.getAddress() + " " + type + " " + instruction);
                        }
                    }
                }
            }
        }
        println("WROTE " + out.getAbsolutePath());
    }
}
