import ghidra.app.decompiler.DecompInterface;
import ghidra.app.decompiler.DecompileResults;
import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.Address;
import ghidra.program.model.listing.Data;
import ghidra.program.model.listing.DataIterator;
import ghidra.program.model.listing.Function;
import ghidra.program.model.listing.Listing;
import ghidra.program.model.symbol.Reference;
import ghidra.program.model.symbol.ReferenceIterator;

import java.io.File;
import java.io.PrintWriter;
import java.util.LinkedHashMap;
import java.util.Map;

public class DecompileZombatar extends GhidraScript {
	@Override
	public void run() throws Exception {
		String[] markers = {
			"IMAGE_ZOMBATAR_MAIN_BG",
			"IMAGE_ZOMBATAR_WIDGET_BG",
			"IMAGE_ZOMBATAR_ZOMBIE_BLANK",
			"DelayLoad_Zombatar",
			"Zombatar"
		};

		File outDir = new File("/tmp/zombatar_decompile");
		outDir.mkdirs();
		PrintWriter refLog = new PrintWriter(new File(outDir, "refs.txt"));
		Map<Long, Function> functions = new LinkedHashMap<>();

		long[] knownAddrs = {
			0x00479640L, // Zombatar screen/items (references ZOMBIE_BLANK/WIDGET_BG/MAIN_BG)
			0x005313f0L, // Zombatar data
			0x00531820L,
			0x00531ee0L
		};
		for (long addr : knownAddrs) {
			Function f = getFunctionAt(toAddr(addr));
			if (f != null) {
				functions.put(addr, f);
			}
		}

		Listing listing = currentProgram.getListing();
		DataIterator it = listing.getDefinedData(true);
		while (it.hasNext() && !monitor.isCancelled()) {
			Data d = it.next();
			Object v = d.getValue();
			if (!(v instanceof String)) {
				continue;
			}
			String s = (String) v;
			for (String m : markers) {
				if (s.contains(m)) {
					Address a = d.getAddress();
					refLog.println("STRING '" + m + "' @" + a);
					Reference[] refs = getReferencesTo(a);
					for (Reference r : refs) {
						Function f = getFunctionContaining(r.getFromAddress());
						String fname = f != null ? f.getName() + " @" + f.getEntryPoint() : "?";
						refLog.println("  REF from " + r.getFromAddress() + " -> " + fname);
						if (f != null) {
							functions.put(f.getEntryPoint().getOffset(), f);
						}
					}
				}
			}
		}
		refLog.close();

		DecompInterface decomp = new DecompInterface();
		decomp.openProgram(currentProgram);
		int idx = 0;
		for (Map.Entry<Long, Function> e : functions.entrySet()) {
			if (monitor.isCancelled()) {
				break;
			}
			File out = new File(outDir, String.format("func_%02d_0x%08x.c", idx++, e.getKey()));
			try {
				DecompileResults res = decomp.decompileFunction(e.getValue(), 180, monitor);
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
