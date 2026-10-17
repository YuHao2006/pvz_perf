// Export stable program metadata needed for source-level reconstruction.
// Usage: -postScript ExportProgramMetadata.java <output-directory>

import ghidra.app.script.GhidraScript;
import ghidra.program.model.data.DataType;
import ghidra.program.model.listing.Data;
import ghidra.program.model.mem.MemoryBlock;
import ghidra.program.model.symbol.Symbol;
import ghidra.program.model.symbol.SymbolIterator;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.nio.charset.StandardCharsets;
import java.util.Iterator;

public class ExportProgramMetadata extends GhidraScript {
    private static String csv(Object value) {
        String text = value == null ? "" : value.toString();
        return "\"" + text.replace("\"", "\"\"") + "\"";
    }

    private static BufferedWriter writer(File root, String name) throws Exception {
        return new BufferedWriter(new OutputStreamWriter(
            new FileOutputStream(new File(root, name)), StandardCharsets.UTF_8));
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

        int blockCount = 0;
        try (BufferedWriter out = writer(root, "memory_blocks.csv")) {
            out.write("name,start,end,size,read,write,execute,initialized,volatile\n");
            for (MemoryBlock block : currentProgram.getMemory().getBlocks()) {
                out.write(csv(block.getName()));
                out.write("," + csv(block.getStart()));
                out.write("," + csv(block.getEnd()));
                out.write("," + block.getSize());
                out.write("," + block.isRead());
                out.write("," + block.isWrite());
                out.write("," + block.isExecute());
                out.write("," + block.isInitialized());
                out.write("," + block.isVolatile());
                out.write("\n");
                blockCount++;
            }
        }

        int symbolCount = 0;
        int externalCount = 0;
        int vtableCount = 0;
        try (BufferedWriter symbols = writer(root, "symbols.csv");
             BufferedWriter externals = writer(root, "external_symbols.csv");
             BufferedWriter vtables = writer(root, "vtable_candidates.csv")) {
            String header = "address,name,namespace,type,source,primary,external\n";
            symbols.write(header);
            externals.write(header);
            vtables.write(header);

            SymbolIterator iterator = currentProgram.getSymbolTable().getAllSymbols(true);
            while (iterator.hasNext() && !monitor.isCancelled()) {
                Symbol symbol = iterator.next();
                String namespace = symbol.getParentNamespace() == null
                    ? ""
                    : symbol.getParentNamespace().getName(true);
                String row = csv(symbol.getAddress()) + "," +
                    csv(symbol.getName(true)) + "," +
                    csv(namespace) + "," +
                    csv(symbol.getSymbolType()) + "," +
                    csv(symbol.getSource()) + "," +
                    symbol.isPrimary() + "," +
                    symbol.isExternal() + "\n";
                symbols.write(row);
                symbolCount++;

                if (symbol.isExternal()) {
                    externals.write(row);
                    externalCount++;
                }

                String lower = symbol.getName(true).toLowerCase();
                if (lower.contains("vftable") || lower.contains("vtable") ||
                    lower.contains("??_7")) {
                    vtables.write(row);
                    vtableCount++;
                }
            }
        }

        int stringCount = 0;
        int rttiCount = 0;
        try (BufferedWriter strings = writer(root, "strings.csv");
             BufferedWriter rtti = writer(root, "rtti_names.csv")) {
            strings.write("address,length,value\n");
            rtti.write("address,length,mangled_name\n");
            for (Data data : currentProgram.getListing().getDefinedData(true)) {
                Object value = data.getValue();
                if (!(value instanceof String)) {
                    continue;
                }
                String text = (String)value;
                String row = csv(data.getAddress()) + "," + data.getLength() + "," + csv(text) + "\n";
                strings.write(row);
                stringCount++;
                if (text.startsWith(".?A")) {
                    rtti.write(row);
                    rttiCount++;
                }
            }
        }

        int dataTypeCount = 0;
        try (BufferedWriter out = writer(root, "recovered_data_types.csv")) {
            out.write("path,name,length,implementation\n");
            Iterator<DataType> iterator = currentProgram.getDataTypeManager().getAllDataTypes();
            while (iterator.hasNext() && !monitor.isCancelled()) {
                DataType type = iterator.next();
                out.write(csv(type.getPathName()));
                out.write("," + csv(type.getName()));
                out.write("," + type.getLength());
                out.write("," + csv(type.getClass().getName()));
                out.write("\n");
                dataTypeCount++;
            }
        }

        println("Metadata export complete: " + blockCount + " blocks, " +
            symbolCount + " symbols (" + externalCount + " external, " +
            vtableCount + " vtable candidates), " + stringCount +
            " strings (" + rttiCount + " RTTI names), " + dataTypeCount +
            " recovered data types -> " + root);
    }
}
