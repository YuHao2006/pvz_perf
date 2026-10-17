import ghidra.app.decompiler.DecompInterface;
import ghidra.app.decompiler.DecompileResults;
import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.Address;
import ghidra.program.model.listing.Function;
import ghidra.program.model.listing.Instruction;
import ghidra.program.model.listing.Listing;
import ghidra.program.model.symbol.Reference;

import java.io.File;
import java.io.PrintWriter;
import java.util.LinkedHashMap;
import java.util.Map;

public class ZombatarDeep extends GhidraScript {
	@Override
	public void run() throws Exception {
		File outDir = new File("/tmp/zombatar_deep");
		outDir.mkdirs();
		DecompInterface decomp = new DecompInterface();
		decomp.openProgram(currentProgram);
		Listing listing = currentProgram.getListing();
		Map<Long, Function> todo = new LinkedHashMap<>();

		long[] roots = {
			0x00479640L, // ZombatarItems? (references WIDGET_BG/ZOMBIE_BLANK)
			0x00531820L, // ZombatarScreen ctor
			0x00531b50L, // called from AddedToManager (preview setup?)
			0x0052d550L, // items constructor (size 0xf80)
			0x00532930L, // zombie preview constructor
			0x005329a0L, // zombie preview init (ZombieInitialize)
			0x00531250L, // apply zombatar to preview
			0x00530970L, // draw portrait
			0x0053ec70L, // draw preview zombie (called from Draw)
			0x00531a90L, // vtable[0]
			0x00531be0L, // vtable[22]
			0x00531c50L, // ZombatarScreen::Draw
			0x00531e00L,
			0x00531e40L,
			0x00532300L,
			0x00532460L,
			0x005324a0L,
			0x00532700L,
			0x005324e0L
		};
		for (long a : roots) {
			Function f = getFunctionAt(toAddr(a));
			if (f != null) {
				todo.put(a, f);
			}
		}

		// Add callers of FUN_00479640.
		Function items = getFunctionAt(toAddr(0x00479640L));
		if (items != null) {
			Reference[] refs = getReferencesTo(items.getEntryPoint());
			for (Reference r : refs) {
				Function f = getFunctionContaining(r.getFromAddress());
				if (f != null) {
					todo.put(f.getEntryPoint().getOffset(), f);
				}
			}
		}

		PrintWriter log = new PrintWriter(new File(outDir, "todo.txt"));
		for (Map.Entry<Long, Function> e : todo.entrySet()) {
			log.println(String.format("0x%08x %s", e.getKey(), e.getValue().getName()));
		}
		log.close();

		int idx = 0;
		for (Map.Entry<Long, Function> e : todo.entrySet()) {
			if (monitor.isCancelled()) {
				break;
			}
			File out = new File(outDir, String.format("func_%02d_0x%08x.c", idx++, e.getKey()));
			boolean ok = false;
			try {
				DecompileResults res = decomp.decompileFunction(e.getValue(), 1200, monitor);
				if (res.getDecompiledFunction() != null) {
					PrintWriter pw = new PrintWriter(out);
					pw.print(res.getDecompiledFunction().getC());
					pw.close();
					ok = true;
					println("OK " + e.getValue().getName() + " -> " + out.getPath());
				}
			} catch (Exception ex) {
				// fall through to disassembly
			}
			if (!ok) {
				PrintWriter pw = new PrintWriter(out);
				pw.println("// decompile failed; disassembly:");
				Address a = e.getValue().getEntryPoint();
				Address end = e.getValue().getBody().getMaxAddress();
				int n = 0;
				while (a != null && a.compareTo(end) <= 0 && n < 4000) {
					Instruction ins = listing.getInstructionAt(a);
					if (ins == null) {
						a = a.add(1);
						continue;
					}
					pw.println(ins.getAddress() + "  " + ins.toString());
					a = ins.getMaxAddress().add(1);
					n++;
				}
				pw.close();
				println("ASM " + e.getValue().getName() + " -> " + out.getPath());
			}
		}
		decomp.dispose();
		println("DONE");
	}
}
