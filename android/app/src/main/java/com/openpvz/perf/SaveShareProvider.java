package com.openpvz.perf;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
import android.provider.OpenableColumns;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.TimeUnit;
import java.util.regex.Pattern;

/** Read-only access to the exact cached files granted by a share intent. */
public final class SaveShareProvider extends ContentProvider {
    private static final Pattern NAME = Pattern.compile("users\\.dat|user[1-9][0-9]{0,9}\\.dat64|"
            + "game[1-9][0-9]{0,9}_[0-9]{1,3}(\\.repaired)?\\.dat64|pvz-lineups?\\.json");
    private static final Pattern ID = Pattern.compile("[0-9a-f]{8}(?:-[0-9a-f]{4}){3}-[0-9a-f]{12}");
    private static final long RETENTION = TimeUnit.DAYS.toMillis(1);

    private static File root(Context context) {
        return new File(context.getCacheDir(), "pvz-save-share");
    }

    static File prepare(Context context, String name) throws IOException {
        if (!NAME.matcher(name).matches()) throw new IOException("分享文件名无效。");
        File root = root(context);
        if (!root.isDirectory() && !root.mkdir()) throw new IOException("无法准备分享目录。");
        File[] folders = root.listFiles();
        long cutoff = System.currentTimeMillis() - RETENTION;
        if (folders != null) {
            for (File folder : folders) {
                if (!ID.matcher(folder.getName()).matches() || folder.lastModified() >= cutoff) continue;
                File[] files = folder.listFiles();
                if (files != null) for (File file : files) file.delete();
                folder.delete();
            }
        }
        File folder = new File(root, UUID.randomUUID().toString());
        if (!folder.mkdir()) throw new IOException("无法准备分享文件。");
        return new File(folder, name);
    }

    static Uri uri(Context context, File file) {
        return new Uri.Builder().scheme("content").authority(context.getPackageName() + ".save-share")
                .appendPath(file.getParentFile().getName()).appendPath(file.getName()).build();
    }

    static String type(String name) {
        return name.endsWith(".json") ? "application/json" : "application/octet-stream";
    }

    private File resolve(Uri uri) throws FileNotFoundException {
        List<String> path = uri.getPathSegments();
        if (path.size() != 2 || !ID.matcher(path.get(0)).matches() || !NAME.matcher(path.get(1)).matches()) {
            throw new FileNotFoundException("Invalid save share URI");
        }
        try {
            File shareRoot = root(getContext()).getCanonicalFile();
            File file = new File(new File(shareRoot, path.get(0)), path.get(1));
            if (!file.isFile() || !file.getCanonicalFile().equals(file)) {
                throw new FileNotFoundException("Save share file is unavailable");
            }
            return file;
        } catch (IOException e) {
            throw new FileNotFoundException("Save share file is unavailable");
        }
    }

    @Override public boolean onCreate() { return true; }

    @Override
    public String getType(Uri uri) {
        try { return type(resolve(uri).getName()); } catch (FileNotFoundException e) { return null; }
    }

    @Override
    public ParcelFileDescriptor openFile(Uri uri, String mode) throws FileNotFoundException {
        if (!"r".equals(mode)) throw new FileNotFoundException("Save shares are read-only");
        return ParcelFileDescriptor.open(resolve(uri), ParcelFileDescriptor.MODE_READ_ONLY);
    }

    @Override
    public Cursor query(Uri uri, String[] projection, String selection, String[] selectionArgs, String sortOrder) {
        String[] columns = projection == null
                ? new String[]{OpenableColumns.DISPLAY_NAME, OpenableColumns.SIZE} : projection;
        MatrixCursor cursor = new MatrixCursor(columns, 1);
        try {
            File file = resolve(uri);
            Object[] row = new Object[columns.length];
            for (int i = 0; i < columns.length; i++) {
                if (OpenableColumns.DISPLAY_NAME.equals(columns[i])) row[i] = file.getName();
                if (OpenableColumns.SIZE.equals(columns[i])) row[i] = file.length();
            }
            cursor.addRow(row);
        } catch (FileNotFoundException ignored) {}
        return cursor;
    }

    @Override public Uri insert(Uri uri, ContentValues values) { throw new UnsupportedOperationException(); }
    @Override public int update(Uri uri, ContentValues values, String where, String[] args) { throw new UnsupportedOperationException(); }
    @Override public int delete(Uri uri, String where, String[] args) { throw new UnsupportedOperationException(); }
}

