package com.openpvz.perf;

import android.content.Context;
import android.system.ErrnoException;
import android.system.Os;
import android.util.Base64;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.nio.channels.FileLock;
import java.util.Arrays;
import java.util.Comparator;
import java.util.regex.Pattern;
import org.json.JSONArray;

final class AndroidSaveFiles implements AutoCloseable {
    static final int CHUNK = 128 * 1024;
    static final int LIMIT = 32 * 1024 * 1024;
    private static final Pattern SAVE = Pattern.compile("users\\.dat|user[1-9][0-9]{0,9}\\.dat64|game[1-9][0-9]{0,9}_[0-9]{1,3}\\.dat64");
    private static final String COMMIT = ".commit";
    private static final String DELETE = ".delete";
    final File directory;
    private final File transaction;
    private final RandomAccessFile guard;
    private final FileLock lock;
    private boolean writing;
    private static boolean inUse;

    static synchronized AndroidSaveFiles open(Context context) throws IOException {
        if (inUse) throw new IOException("请先关闭正在使用的存档工具。");
        RandomAccessFile guard = new RandomAccessFile(new File(context.getFilesDir(), ".save-access.lock"), "rw");
        try {
            FileLock lock = guard.getChannel().tryLock();
            if (lock == null) throw new IOException("请先退出游戏或关闭正在使用的存档工具。");
            AndroidSaveFiles saves = new AndroidSaveFiles(directory(context), guard, lock);
            inUse = true;
            return saves;
        } catch (IOException | RuntimeException e) {
            guard.close();
            throw e;
        }
    }

    private AndroidSaveFiles(File directory, RandomAccessFile guard, FileLock lock) throws IOException {
        this.directory = directory;
        this.guard = guard;
        this.lock = lock;
        transaction = new File(directory, ".pvz-save-edit");
        recover();
    }

    private static File directory(Context context) {
        for (File candidate : context.getExternalMediaDirs()) {
            if (writable(candidate)) return candidate;
        }
        File legacy = context.getExternalFilesDir(null);
        return writable(legacy) ? legacy : context.getFilesDir();
    }

    private static boolean writable(File directory) {
        if (directory == null) return false;
        try {
            File probe = File.createTempFile("pvz-write-", ".tmp", directory);
            return probe.delete();
        } catch (IOException e) {
            return false;
        }
    }

    private static String saveName(String name) throws IOException {
        if (!SAVE.matcher(name).matches()) throw new IOException("无效的存档文件名。");
        return name;
    }

    private static File[] entries(File dir) throws IOException {
        File[] files = dir.listFiles();
        if (files == null) throw new IOException("无法读取存档目录。");
        return files;
    }

    JSONArray list() throws IOException {
        JSONArray names = new JSONArray();
        File[] files = entries(directory);
        Arrays.sort(files, Comparator.comparing(File::getName));
        for (File file : files) {
            if (file.isFile() && SAVE.matcher(file.getName()).matches()) names.put(file.getName());
        }
        return names;
    }

    boolean hasPendingGameSaves() throws IOException {
        for (File file : entries(directory)) {
            String name = file.getName();
            int marker = name.indexOf(".tmp-");
            if (marker > 0 && SAVE.matcher(name.substring(0, marker)).matches()
                    && name.substring(marker).matches("\\.tmp-\\d+-\\d+-\\d+(?:-\\d+-\\d+)?")) return true;
        }
        return false;
    }

    String read(String name, int offset) throws IOException {
        if (offset < 0 || offset > LIMIT) throw new IOException("读取位置无效。");
        try (RandomAccessFile file = new RandomAccessFile(new File(directory, saveName(name)), "r")) {
            long size = file.length();
            if (size <= 0 || size > LIMIT) throw new IOException("存档为空或超过 32 MiB。");
            if (offset >= size) return "";
            byte[] bytes = new byte[(int) Math.min(CHUNK, size - offset)];
            file.seek(offset);
            file.readFully(bytes);
            return Base64.encodeToString(bytes, Base64.NO_WRAP);
        }
    }

    void begin() throws IOException {
        if (writing) throw new IOException("已有存档写入任务。");
        recover();
        if (!transaction.mkdir()) throw new IOException("无法准备存档写入。");
        writing = true;
    }

    static void append(File path, String data, boolean first) throws IOException {
        if (data.length() > (CHUNK + 2) / 3 * 4) throw new IOException("数据块过大。");
        byte[] bytes = Base64.decode(data, Base64.NO_WRAP);
        if (bytes.length == 0 || bytes.length > CHUNK || (!first && !path.isFile())
                || (first ? 0 : path.length()) + bytes.length > LIMIT) {
            throw new IOException("存档大小无效。");
        }
        try (FileOutputStream stream = new FileOutputStream(path, !first)) {
            stream.write(bytes);
            stream.getFD().sync();
        }
    }

    void write(String name, String data, boolean first) throws IOException {
        requireWrite();
        append(new File(transaction, saveName(name)), data, first);
    }

    void drop(String name) throws IOException {
        requireWrite();
        if (!new File(transaction, saveName(name) + DELETE).createNewFile()) {
            throw new IOException("无法登记删除存档。");
        }
    }

    private void requireWrite() throws IOException {
        if (!writing) throw new IOException("尚未开始存档写入。");
    }

    void finish() throws IOException {
        requireWrite();
        try (FileOutputStream marker = new FileOutputStream(new File(transaction, COMMIT))) {
            marker.getFD().sync();
        }
        writing = false;
        recover();
    }

    void abort() throws IOException {
        writing = false;
        recover();
    }

    // The marker publishes the complete plan. Both the launcher and editor replay
    // it under the private cross-process lock before opening the save directory.
    private void recover() throws IOException {
        if (!transaction.exists()) return;
        File marker = new File(transaction, COMMIT);
        File[] files = entries(transaction);
        if (marker.isFile()) {
            Arrays.sort(files, Comparator.comparing(file -> file.getName().equals("users.dat") ? 1 : 0));
            for (File file : files) {
                String name = file.getName();
                if (name.equals(COMMIT)) continue;
                boolean delete = name.endsWith(DELETE);
                String targetName = saveName(delete ? name.substring(0, name.length() - DELETE.length()) : name);
                File target = new File(directory, targetName);
                for (File pending : entries(directory)) {
                    if (pending.getName().matches(Pattern.quote(targetName) + "\\.tmp-\\d+-\\d+-\\d+(?:-\\d+-\\d+)?")) {
                        remove(pending);
                    }
                }
                if (delete) {
                    remove(target);
                    remove(file);
                } else {
                    try {
                        Os.rename(file.getPath(), target.getPath());
                    } catch (ErrnoException e) {
                        throw new IOException("无法替换存档 " + targetName, e);
                    }
                }
            }
            remove(marker);
        } else {
            for (File file : files) remove(file);
        }
        remove(transaction);
    }

    private static void remove(File file) throws IOException {
        if (file.exists() && !file.delete()) throw new IOException("无法清理 " + file.getName());
    }

    @Override
    public void close() throws IOException {
        synchronized (AndroidSaveFiles.class) {
            try {
                try { lock.release(); } finally { guard.close(); }
            } finally {
                inUse = false;
            }
        }
    }
}

