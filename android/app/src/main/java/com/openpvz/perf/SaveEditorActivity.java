package com.openpvz.perf;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ActivityNotFoundException;
import android.content.ClipData;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.webkit.JavascriptInterface;
import android.webkit.ValueCallback;
import android.webkit.WebChromeClient;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Toast;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import org.json.JSONObject;

public final class SaveEditorActivity extends Activity {
    private static final String ORIGIN = "https://pvz-save.invalid";
    private static final String CSP = "default-src 'none'; script-src 'self' 'unsafe-inline' 'wasm-unsafe-eval'; "
            + "style-src 'unsafe-inline'; img-src data:; connect-src 'self'; worker-src 'self'; "
            + "object-src 'none'; frame-src 'none'; base-uri 'none'";
    private static final int IMPORT = 1;
    private WebView web;
    private Bridge bridge;
    private AndroidSaveFiles saves;
    private ValueCallback<Uri[]> importCallback;

    @Override
    protected void onCreate(Bundle state) {
        super.onCreate(state);
        try {
            saves = AndroidSaveFiles.open(this);
            if (saves.hasPendingGameSaves()) {
                throw new IOException("发现待恢复的游戏存档，请先启动并退出游戏。");
            }
            File legacy = getExternalFilesDir(null);
            if (!new File(saves.directory, ".user-data-migrated").exists()
                    && (hasLegacySaves(legacy) || hasLegacySaves(getFilesDir()))) {
                throw new IOException("请先启动并退出游戏，完成旧存档迁移后再编辑。");
            }
        } catch (IOException e) {
            new AlertDialog.Builder(this).setTitle("存档工具").setMessage(e.getMessage())
                    .setPositiveButton(android.R.string.ok, (dialog, which) -> finish())
                    .setOnCancelListener(dialog -> finish()).show();
            return;
        }
        web = new WebView(this);
        web.setFitsSystemWindows(true);
        web.getSettings().setJavaScriptEnabled(true);
        web.getSettings().setDomStorageEnabled(true);
        web.getSettings().setAllowFileAccess(false);
        bridge = new Bridge();
        web.addJavascriptInterface(bridge, "PvzAndroid");
        web.setWebViewClient(new WebViewClient() {
            @Override
            public boolean shouldOverrideUrlLoading(WebView view, WebResourceRequest request) {
                return true;
            }

            @Override
            public WebResourceResponse shouldInterceptRequest(WebView view, WebResourceRequest request) {
                String url = request.getUrl().toString();
                if ("GET".equals(request.getMethod()) && url.startsWith(ORIGIN + "/")) {
                    String file = url.substring(ORIGIN.length() + 1);
                    if (file.matches("save-[a-z-]+\\.(?:js|html)|lineup-library\\.js|android-save-host\\.js")) {
                        boolean html = file.endsWith(".html");
                        try {
                            InputStream input = getAssets().open("save-editor/" + file);
                            return new WebResourceResponse(html ? "text/html" : "text/javascript", "UTF-8",
                                    200, "OK", Collections.singletonMap("Content-Security-Policy", CSP), input);
                        } catch (IOException ignored) {
                            // Only packaged editor resources can be loaded.
                        }
                    }
                }
                return new WebResourceResponse("text/plain", "UTF-8", 404, "Not Found",
                        Collections.emptyMap(), new ByteArrayInputStream(new byte[0]));
            }
        });
        web.setWebChromeClient(new WebChromeClient() {
            @Override
            public boolean onShowFileChooser(WebView view, ValueCallback<Uri[]> callback, FileChooserParams params) {
                if (importCallback != null) importCallback.onReceiveValue(null);
                importCallback = callback;
                Intent picker = new Intent(Intent.ACTION_OPEN_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE)
                        .setType("*/*");
                try {
                    startActivityForResult(picker, IMPORT);
                } catch (ActivityNotFoundException e) {
                    importCallback = null;
                    callback.onReceiveValue(null);
                    message("系统文件选择器不可用。");
                }
                return true;
            }
        });
        setContentView(web);
        web.loadUrl(ORIGIN + "/save-editor.html");
    }

    private boolean hasLegacySaves(File directory) {
        return directory != null && !directory.equals(saves.directory)
                && new File(directory, "users.dat").isFile();
    }

    private final class Bridge {
        private File draft;
        private final List<File> staged = new ArrayList<>();

        @JavascriptInterface
        public synchronized String command(String op, String name, String data, int offset, boolean first) {
            JSONObject reply = new JSONObject();
            try {
                if (saves == null) throw new IOException("存档工具已关闭。");
                Object value = "";
                switch (op) {
                    case "list": value = saves.list(); break;
                    case "read": value = saves.read(name, offset); break;
                    case "begin": saves.begin(); break;
                    case "write": saves.write(name, data, first); break;
                    case "drop": saves.drop(name); break;
                    case "finish": saves.finish(); break;
                    case "abort": saves.abort(); break;
                    case "exportChunk": stageExport(name, data, first); break;
                    case "export":
                        if (draft == null || !draft.getName().equals(name)) throw new IOException("分享文件未准备好。");
                        staged.add(draft);
                        draft = null;
                        break;
                    case "share":
                        if (staged.isEmpty()) throw new IOException("没有可分享的文件。");
                        List<File> files = new ArrayList<>(staged);
                        staged.clear();
                        runOnUiThread(() -> share(files));
                        break;
                    case "close": runOnUiThread(SaveEditorActivity.this::finish); break;
                    default: throw new IOException("未知存档操作。");
                }
                reply.put("value", value);
            } catch (Exception error) {
                try {
                    reply.put("error", error.getMessage() == null ? "存档操作失败。" : error.getMessage());
                } catch (org.json.JSONException ignored) {}
            }
            return reply.toString();
        }

        private void stageExport(String name, String data, boolean first) throws IOException {
            if (first) {
                if (draft != null) discard(draft);
                draft = SaveShareProvider.prepare(SaveEditorActivity.this, name);
            }
            if (draft == null || !draft.getName().equals(name)) throw new IOException("分享文件未准备好。");
            AndroidSaveFiles.append(draft, data, first);
        }
    }

    private void share(List<File> files) {
        if (isDestroyed() || isFinishing()) {
            for (File file : files) discard(file);
            return;
        }
        ArrayList<Uri> uris = new ArrayList<>(files.size());
        for (File file : files) uris.add(SaveShareProvider.uri(this, file));
        Uri first = uris.get(0);
        ClipData clips = ClipData.newUri(getContentResolver(), files.get(0).getName(), first);
        for (int i = 1; i < uris.size(); i++) clips.addItem(new ClipData.Item(uris.get(i)));
        Intent send = new Intent(uris.size() == 1 ? Intent.ACTION_SEND : Intent.ACTION_SEND_MULTIPLE)
                .setType(uris.size() == 1 ? SaveShareProvider.type(files.get(0).getName()) : "application/octet-stream")
                .addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
        send.setClipData(clips);
        if (uris.size() == 1) send.putExtra(Intent.EXTRA_STREAM, first);
        else send.putParcelableArrayListExtra(Intent.EXTRA_STREAM, uris);
        try {
            startActivity(Intent.createChooser(send, "分享存档"));
        } catch (ActivityNotFoundException e) {
            for (File file : files) discard(file);
            message("系统分享不可用。");
        }
    }

    @Override
    protected void onActivityResult(int request, int result, Intent data) {
        super.onActivityResult(request, result, data);
        if (request != IMPORT || importCallback == null) return;
        Uri uri = result == RESULT_OK && data != null ? data.getData() : null;
        importCallback.onReceiveValue(uri == null ? null : new Uri[]{uri});
        importCallback = null;
    }

    private static void discard(File file) {
        file.delete();
        file.getParentFile().delete();
    }

    private void message(String text) {
        Toast.makeText(this, text, Toast.LENGTH_SHORT).show();
    }

    private void closeSaves() {
        if (saves == null) return;
        try { saves.close(); } catch (IOException ignored) {}
        saves = null;
    }

    @Override
    protected void onDestroy() {
        if (importCallback != null) importCallback.onReceiveValue(null);
        if (web != null) {
            web.removeJavascriptInterface("PvzAndroid");
            web.destroy();
        }
        if (bridge != null) {
            synchronized (bridge) {
                if (bridge.draft != null) discard(bridge.draft);
                for (File file : bridge.staged) discard(file);
                closeSaves();
            }
        } else {
            closeSaves();
        }
        super.onDestroy();
    }
}

