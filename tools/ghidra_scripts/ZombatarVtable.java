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

public class ZombatarVtable extends GhidraScript {
	@Override
	public void run() throws Exception {
		long[] vtables = {
			0x006f2b00L, // ZombatarScreen vtable (from FUN_00531820)
			0x006f2c38L, // secondary vtable
			0x006f2c80L, // TOS dialog vtable (from FUN_00531ee0)
			0x006f2db8L,
			0x006f2dd4L,
			0x006f2dd8L
		};

		File outDir = new File("/tmp/zombatar_vtable");
		outDir.mkdirs();
		DecompInterface decomp = new DecompInterface();
		decomp.openProgram(currentProgram);
		Listing listing = currentProgram.getListing();
		Map<Long, Function> funcs = new LinkedHashMap<>();
		PrintWriter log = new PrintWriter(new File(outDir, "vtable_refs.txt"));

		for (long vt : vtables) {
			Address base = toAddr(vt);
			Data d = listing.getDataAt(base);
			if (d == null) {
				log.println("vtable @" + Long.toHexString(vt) + " : no data");
				continue;
			}
			log.println("vtable @" + Long.toHexString(vt));
			for (int i = 0; i < 48; i++) {
				Address ea = base.add(i * 4L);
				Data ptr = listing.getDataAt(ea);
				if (ptr == null || !(ptr.getValue() instanceof Address)) {
					break;
				}
				Address target = (Address) ptr.getValue();
				Function f = getFunctionAt(target);
				if (f != null) {
					log.println(String.format("  [%02d] %s -> %s @%s", i, ptr.getAddress(), f.getName(), target));
					funcs.put(target.getOffset(), f);
				} else {
					log.println(String.format("  [%02d] %s -> %s (no func)", i, ptr.getAddress(), target));
				}
			}
		}
		log.close();

		int idx = 0;
		for (Map.Entry<Long, Function> e : funcs.entrySet()) {
			if (monitor.isCancelled()) {
				break;
			}
			File out = new File(outDir, String.format("func_%02d_0x%08x.c", idx++, e.getKey()));
			try {
				DecompileResults res = decomp.decompileFunction(e.getValue(), 300, monitor);
				PrintWriter pw = new PrintWriter(out);
				pw.print(res.getDecompiledFunction() != null ? res.getDecompiledFunction().getC() : "// decompile failed");
				pw.close();
				println("decompiled " + e.getValue().getName() + " -> " + out.getPath());
			} catch (Exception ex) {
				PrintWriter pw = new PrintWriter(out);
				pw.println("// exception: " + ex);
				pw.close();
				println("FAILED " + e.getValue().getName() + " : " + ex);
			}
		}
		decomp.dispose();
		println("DONE");
	}
}
