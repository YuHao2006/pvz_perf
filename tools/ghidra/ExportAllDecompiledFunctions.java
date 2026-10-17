// Export every internal function in the current Ghidra program as one C file.
//
// Usage from analyzeHeadless:
//   -postScript ExportAllDecompiledFunctions.java <output-directory>
//       [start-address] [end-address] [maximum-function-bytes]
//
// The address is the stable identity.  Ghidra's recovered function name and
// prototype are useful evidence, but they are not treated as authoritative
// source-level names or types.

import ghidra.app.decompiler.DecompInterface;
import ghidra.app.decompiler.DecompileResults;
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
import java.nio.file.Files;

public class ExportAllDecompiledFunctions extends GhidraScript {
    private static String csv(String value) {
        return "\"" + value.replace("\"", "\"\"") + "\"";
    }

    private static String safeComment(String value) {
        return value.replace("*/", "* /");
    }

    private static String addressText(Address address) {
        return address.toString().toUpperCase();
    }

    @Override
    protected void run() throws Exception {
        String[] args = getScriptArgs();
        if (args.length < 1 || args.length > 4) {
            throw new IllegalArgumentException(
                "Expected: <output-directory> [start-address] [end-address] [maximum-function-bytes]");
        }

        File root = new File(args[0]).getCanonicalFile();
        Address start = args.length >= 2 ? toAddr(args[1]) : currentProgram.getMinAddress();
        Address end = args.length >= 3 ? toAddr(args[2]) : currentProgram.getMaxAddress();
        long maximumBytes = args.length >= 4 ? Long.parseLong(args[3]) : Long.MAX_VALUE;
        File functionRoot = new File(root, "functions");
        if (!functionRoot.isDirectory() && !functionRoot.mkdirs()) {
            throw new IllegalStateException("Cannot create " + functionRoot);
        }

        String rangeName = addressText(start) + "_" + addressText(end);
        File manifestRoot = new File(root, "status");
        if (!manifestRoot.isDirectory() && !manifestRoot.mkdirs()) {
            throw new IllegalStateException("Cannot create " + manifestRoot);
        }
        File manifestFile = new File(manifestRoot, rangeName + ".csv");
        Memory memory = currentProgram.getMemory();
        DecompInterface decompiler = new DecompInterface();
        decompiler.toggleCCode(true);
        decompiler.toggleSyntaxTree(true);
        if (!decompiler.openProgram(currentProgram)) {
            throw new IllegalStateException(decompiler.getLastMessage());
        }

        int exported = 0;
        int failed = 0;
        try (BufferedWriter manifest = new BufferedWriter(new OutputStreamWriter(
                new FileOutputStream(manifestFile), StandardCharsets.UTF_8))) {
            manifest.write("address,name,prototype,calling_convention,body_min,body_max,file,status,error\n");

            FunctionIterator functions = currentProgram.getFunctionManager().getFunctions(start, true);
            while (functions.hasNext() && !monitor.isCancelled()) {
                Function function = functions.next();
                Address entry = function.getEntryPoint();
                if (entry.compareTo(end) > 0) {
                    break;
                }
                if (!entry.isMemoryAddress() || !memory.contains(entry) || function.isExternal()) {
                    continue;
                }

                String address = addressText(entry);
                String shard = address.length() >= 4 ? address.substring(0, 4) : "OTHER";
                File shardDir = new File(functionRoot, shard);
                if (!shardDir.isDirectory() && !shardDir.mkdirs()) {
                    throw new IllegalStateException("Cannot create " + shardDir);
                }
                File output = new File(shardDir, address + ".c");
                String relative = "functions/" + shard + "/" + address + ".c";

                String status;
                String error = "";
                String body = "";
                if (output.isFile() && output.length() > 0) {
                    status = "existing";
                    exported++;
                }
                else if (function.getBody().getNumAddresses() > maximumBytes) {
                    status = "skipped_large";
                    error = "function body exceeds configured maximum of " + maximumBytes + " bytes";
                    failed++;
                }
                else {
                    println("Decompiling " + address + " " + function.getName(true) +
                        " (" + function.getBody().getNumAddresses() + " bytes)");
                    try {
                        DecompileResults result = decompiler.decompileFunction(function, 30, monitor);
                        if (result.decompileCompleted() && result.getDecompiledFunction() != null) {
                            status = "ok";
                            body = result.getDecompiledFunction().getC();
                            exported++;
                        }
                        else {
                            status = "failed";
                            error = result.getErrorMessage() == null ? "unknown" : result.getErrorMessage();
                            failed++;
                        }
                    }
                    catch (Exception exception) {
                        status = "exception";
                        error = exception.toString();
                        failed++;
                    }
                }

                if (!status.equals("existing")) {
                    File failureOutput = new File(output.getPath() + ".failed.txt");
                    File actualOutput = status.equals("ok") ? output : failureOutput;
                    try (BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(
                            new FileOutputStream(actualOutput), StandardCharsets.UTF_8))) {
                        writer.write("/*\n");
                        writer.write(" * Authority: PopCap Plants vs. Zombies GOTY 1.2.0.1073\n");
                        writer.write(" * Entry: " + address + "\n");
                        writer.write(" * Ghidra name: " + safeComment(function.getName(true)) + "\n");
                        writer.write(" * Recovered prototype: " + safeComment(function.getPrototypeString(true, true)) + "\n");
                        writer.write(" * This is machine-generated evidence, not cleaned compile-ready source.\n");
                        writer.write(" */\n\n");
                        if (status.equals("ok")) {
                            writer.write(body);
                            if (!body.endsWith("\n")) {
                                writer.write("\n");
                            }
                        }
                        else {
                            writer.write("/* Decompilation status: " + status + ": " + safeComment(error) + " */\n");
                        }
                    }
                    if (status.equals("ok")) {
                        Files.deleteIfExists(failureOutput.toPath());
                    }
                }

                String callingConvention = function.getCallingConventionName();
                if (callingConvention == null) {
                    callingConvention = "";
                }
                manifest.write(csv(address));
                manifest.write("," + csv(function.getName(true)));
                manifest.write("," + csv(function.getPrototypeString(true, true)));
                manifest.write("," + csv(callingConvention));
                manifest.write("," + csv(addressText(function.getBody().getMinAddress())));
                manifest.write("," + csv(addressText(function.getBody().getMaxAddress())));
                manifest.write("," + csv(relative));
                manifest.write("," + csv(status));
                manifest.write("," + csv(error));
                manifest.write("\n");
                manifest.flush();

                if ((exported + failed) % 250 == 0) {
                    println("Processed " + (exported + failed) + " internal functions...");
                }
            }
        }
        finally {
            decompiler.dispose();
        }

        println("Export complete: " + exported + " ok, " + failed + " failed -> " + root);
    }
}
