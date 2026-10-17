import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.Address;
import ghidra.program.model.listing.Instruction;
import ghidra.program.model.listing.Listing;
import ghidra.program.model.symbol.Reference;
import ghidra.program.model.symbol.RefType;

import java.io.File;
import java.io.PrintWriter;

public class InspectGlobalRefs extends GhidraScript {
    @Override
    public void run() throws Exception {
        long[] values = {0x00726ec4L, 0x00726e98L, 0x00726760L, 0x00727150L, 0x00726778L};
        try (PrintWriter writer = new PrintWriter(new File("C:/tmp/global-refs.txt"), "UTF-8")) {
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
        println("WROTE C:/tmp/global-refs.txt");
    }
}
