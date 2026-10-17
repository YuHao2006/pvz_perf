import ghidra.app.decompiler.DecompInterface;
import ghidra.app.decompiler.DecompileResults;
import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.Address;
import ghidra.program.model.listing.Data;
import ghidra.program.model.listing.Function;
import ghidra.program.model.listing.Listing;

import java.io.File;
import java.io.PrintWriter;
import java.util.LinkedHashMap;
import java.util.Map;

public class ZombatarItemsVtable extends GhidraScript {
    @Override
    public void run() throws Exception {
        long[] vtables = { 0x006f29d8L, 0x006f2a00L, 0x006f2a48L };
        File outDir = new File("/tmp/zombatar_items_vtable");
        outDir.mkdirs();
        DecompInterface decomp = new DecompInterface();
        decomp.openProgram(currentProgram);
        Listing listing = currentProgram.getListing();
        Map<Long, Function> funcs = new LinkedHashMap<>();
        try (PrintWriter log = new PrintWriter(new File(outDir, "vtable_refs.txt"))) {
            for (long vt : vtables) {
                Address base = toAddr(vt);
                Data d = listing.getDataAt(base);
                if (d == null) {
                    log.println("vtable @" + Long.toHexString(vt) + " : no data");
                    continue;
                }
                log.println("vtable @" + Long.toHexString(vt));
                for (int i = 0; i < 48; i++) {
                    Data ptr = listing.getDataAt(base.add(i * 4L));
                    if (ptr == null || !(ptr.getValue() instanceof Address)) break;
                    Address target = (Address) ptr.getValue();
                    Function f = getFunctionAt(target);
                    log.println(String.format("  [%02d] %s -> %s", i, ptr.getAddress(),
                        f == null ? target : f.getName() + " @" + target));
                    if (f != null) funcs.put(target.getOffset(), f);
                }
            }
        }
        int index = 0;
        for (Function f : funcs.values()) {
            if (monitor.isCancelled()) break;
            File output = new File(outDir, String.format("func_%02d_0x%08x.c", index++, f.getEntryPoint().getOffset()));
            DecompileResults result = decomp.decompileFunction(f, 1200, monitor);
            try (PrintWriter writer = new PrintWriter(output, "UTF-8")) {
                writer.print(result.getDecompiledFunction() != null
                    ? result.getDecompiledFunction().getC()
                    : "// decompile failed: " + result.getErrorMessage());
            }
        }
        decomp.dispose();
        println("DONE");
    }
}
