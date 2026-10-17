// Find aligned arrays of function pointers in non-executable memory.  This is
// the primary evidence for classes compiled without MSVC RTTI.
// Usage: -postScript ExportPointerTableCandidates.java <output-directory>

import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.Address;
import ghidra.program.model.listing.Function;
import ghidra.program.model.mem.Memory;
import ghidra.program.model.mem.MemoryBlock;
import ghidra.program.model.symbol.Reference;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

public class ExportPointerTableCandidates extends GhidraScript {
    private static String csv(Object value) {
        String text = value == null ? "" : value.toString();
        return "\"" + text.replace("\"", "\"\"") + "\"";
    }

    private Address readFunctionPointer(Memory memory, Address slot) {
        try {
            long value = Integer.toUnsignedLong(memory.getInt(slot));
            Address target = toAddr(value);
            MemoryBlock targetBlock = memory.getBlock(target);
            if (targetBlock == null || !targetBlock.isExecute()) {
                return null;
            }
            Function function = getFunctionAt(target);
            return function == null ? null : target;
        }
        catch (Exception exception) {
            return null;
        }
    }

    @Override
    protected void run() throws Exception {
        String[] args = getScriptArgs();
        if (args.length != 1) {
            throw new IllegalArgumentException("Expected: <output-directory>");
        }

        File root = new File(args[0]).getCanonicalFile();
        if (!root.isDirectory() && !root.mkdirs()) {
            throw new IllegalStateException("Cannot create " + root);
        }

        File tableFile = new File(root, "function_pointer_tables.csv");
        File entryFile = new File(root, "function_pointer_table_entries.csv");
        Memory memory = currentProgram.getMemory();
        int tableCount = 0;
        int entryCount = 0;

        try (BufferedWriter tables = new BufferedWriter(new OutputStreamWriter(
                    new FileOutputStream(tableFile), StandardCharsets.UTF_8));
             BufferedWriter entries = new BufferedWriter(new OutputStreamWriter(
                    new FileOutputStream(entryFile), StandardCharsets.UTF_8))) {
            tables.write("table_address,block,entry_count,code_reference_count,referencing_functions\n");
            entries.write("table_address,index,slot_address,target_address,target_function\n");

            for (MemoryBlock block : memory.getBlocks()) {
                if (block.isExecute() || !block.isInitialized()) {
                    continue;
                }

                Address cursor = block.getStart();
                long alignment = cursor.getOffset() & 3L;
                if (alignment != 0) {
                    cursor = cursor.add(4 - alignment);
                }

                while (cursor.compareTo(block.getEnd()) <= 0 && !monitor.isCancelled()) {
                    List<Address> targets = new ArrayList<>();
                    Address slot = cursor;
                    while (slot.compareTo(block.getEnd()) <= 0 && targets.size() < 512) {
                        Address target = readFunctionPointer(memory, slot);
                        if (target == null) {
                            break;
                        }
                        targets.add(target);
                        slot = slot.add(4);
                    }

                    if (targets.size() < 3) {
                        cursor = cursor.add(4);
                        continue;
                    }

                    int referenceCount = 0;
                    StringBuilder referencingFunctions = new StringBuilder();
                    for (Reference reference : getReferencesTo(cursor)) {
                        if (!reference.getFromAddress().isMemoryAddress()) {
                            continue;
                        }
                        MemoryBlock fromBlock = memory.getBlock(reference.getFromAddress());
                        if (fromBlock == null || !fromBlock.isExecute()) {
                            continue;
                        }
                        referenceCount++;
                        Function owner = getFunctionContaining(reference.getFromAddress());
                        if (owner != null) {
                            if (referencingFunctions.length() != 0) {
                                referencingFunctions.append(';');
                            }
                            referencingFunctions.append(owner.getEntryPoint());
                            referencingFunctions.append(':');
                            referencingFunctions.append(owner.getName(true));
                        }
                    }

                    tables.write(csv(cursor));
                    tables.write("," + csv(block.getName()));
                    tables.write("," + targets.size());
                    tables.write("," + referenceCount);
                    tables.write("," + csv(referencingFunctions));
                    tables.write("\n");

                    for (int index = 0; index < targets.size(); index++) {
                        Address target = targets.get(index);
                        Function function = getFunctionAt(target);
                        entries.write(csv(cursor));
                        entries.write("," + index);
                        entries.write("," + csv(cursor.add(index * 4L)));
                        entries.write("," + csv(target));
                        entries.write("," + csv(function == null ? "" : function.getName(true)));
                        entries.write("\n");
                        entryCount++;
                    }
                    tableCount++;
                    cursor = cursor.add(targets.size() * 4L);
                }
            }
        }

        println("Exported " + tableCount + " function-pointer table candidates (" +
            entryCount + " entries) to " + root);
    }
}
