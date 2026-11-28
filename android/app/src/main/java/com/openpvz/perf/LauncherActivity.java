package com.openpvz.perf;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.FeatureInfo;
import android.content.pm.PackageManager;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.Typeface;
import android.os.Build;
import android.os.Bundle;
import android.view.Gravity;
import android.view.View;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.ScrollView;
import android.widget.TextView;
import android.content.ActivityNotFoundException;
import android.net.Uri;
import android.system.ErrnoException;
import android.system.Os;
import android.widget.Toast;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

public final class LauncherActivity extends Activity {
    private static final int VK_1_3 = (1 << 22) | (3 << 12);
    private static final int MODERN_MIN_SDK = 29;
    private static final int MODERN = View.generateViewId();
    private static final int COMPATIBILITY = View.generateViewId();
    private static final int SURFACE = 0xff101923;
    private static final int FOREGROUND = 0xffe6edf5;
    private static final int MUTED = 0xff9dafc3;
    private static final int ACCENT = 0xffa6debb;
    private SharedPreferences preferences;
    private RadioGroup renderers;
    private static final int PICK_PAK = 71;
    private Button start;
    private Button importPak;
    private boolean importing;

    @Override
    protected void onCreate(Bundle state) {
        super.onCreate(state);
        preferences = getSharedPreferences("launcher", MODE_PRIVATE);

        ScrollView scroll = new ScrollView(this);
        scroll.setFillViewport(true);
        scroll.setBackgroundColor(SURFACE);
        scroll.setOnApplyWindowInsetsListener((view, insets) -> {
            view.setPadding(insets.getSystemWindowInsetLeft(), insets.getSystemWindowInsetTop(),
                    insets.getSystemWindowInsetRight(), insets.getSystemWindowInsetBottom());
            return insets;
        });
        FrameLayout frame = new FrameLayout(this);
        frame.addView(createContent());
        frame.addOnLayoutChangeListener((view, left, top, right, bottom, oldLeft, oldTop, oldRight, oldBottom) -> {
            View content = frame.getChildAt(0);
            int width = Math.min(dp(456), right - left);
            if (width > 0 && content.getLayoutParams().width != width) {
                content.getLayoutParams().width = width;
                content.requestLayout();
            }
        });
        scroll.addView(frame);
        setContentView(scroll);
        updateButtons();
    }

    private LinearLayout createContent() {
        LinearLayout content = new LinearLayout(this);
        content.setOrientation(LinearLayout.VERTICAL);
        content.setPadding(dp(22), dp(20), dp(22), dp(20));
        FrameLayout.LayoutParams size = new FrameLayout.LayoutParams(
                Math.min(dp(456), getResources().getDisplayMetrics().widthPixels),
                FrameLayout.LayoutParams.WRAP_CONTENT, Gravity.CENTER);
        content.setLayoutParams(size);

        LinearLayout header = new LinearLayout(this);
        header.setGravity(Gravity.CENTER_VERTICAL);
        ImageView icon = new ImageView(this);
        icon.setImageResource(R.mipmap.ic_launcher);
        header.addView(icon, new LinearLayout.LayoutParams(dp(42), dp(42)));
        TextView title = label("pvz_perf", 24, FOREGROUND);
        title.setTypeface(null, Typeface.BOLD);
        LinearLayout.LayoutParams titleSize = new LinearLayout.LayoutParams(0, -2, 1);
        titleSize.setMarginStart(dp(12));
        header.addView(title, titleSize);
        content.addView(header);

        if (BuildConfig.VULKAN_COMPATIBILITY) {
            spaced(content, label("图形后端", 14, MUTED), 18);
            renderers = new RadioGroup(this);
            renderers.setOrientation(RadioGroup.VERTICAL);
            RadioButton modern = choice("Vulkan 1.3", MODERN);
            modern.setEnabled(Build.VERSION.SDK_INT >= MODERN_MIN_SDK);
            renderers.addView(modern);
            renderers.addView(choice("Vulkan 1.0 · 兼容模式", COMPATIBILITY));
            boolean defaultLegacy = !modern.isEnabled() || advertisedVulkanVersion() < VK_1_3;
            renderers.check(!modern.isEnabled() || preferences.getBoolean("compatibility", defaultLegacy)
                    ? COMPATIBILITY : MODERN);
            content.addView(renderers);
        } else {
            spaced(content, label("Vulkan 1.3", 14, MUTED), 16);
        }

        start = new Button(this);
        start.setText("开始游戏");
        start.setAllCaps(false);
        start.setTextColor(SURFACE);
        start.setBackgroundTintList(ColorStateList.valueOf(ACCENT));
        start.setMinimumHeight(dp(48));
        start.setOnClickListener(view -> launchGame());
        spaced(content, start, 14);

        if (!BuildConfig.BUNDLED_PAK) {
            importPak = new Button(this);
            importPak.setText("导入 main.pak64");
            importPak.setAllCaps(false);
            importPak.setOnClickListener(view -> choosePak());
            spaced(content, importPak, 8);
        }

        Button saveTools = new Button(this);
        saveTools.setText("存档工具");
        saveTools.setAllCaps(false);
        saveTools.setTextColor(FOREGROUND);
        saveTools.setBackgroundTintList(ColorStateList.valueOf(0xff29394a));
        saveTools.setMinimumHeight(dp(48));
        saveTools.setOnClickListener(view -> startActivity(new Intent(this, SaveEditorActivity.class)));
        spaced(content, saveTools, 8);
        return content;
    }

    private void launchGame() {
        final boolean legacy = BuildConfig.VULKAN_COMPATIBILITY && renderers.getCheckedRadioButtonId() == COMPATIBILITY;
        if (BuildConfig.VULKAN_COMPATIBILITY) preferences.edit().putBoolean("compatibility", legacy).apply();
        Intent game = new Intent(this, legacy ? CompatibilityActivity.class : PerfActivity.class);
        for (String key : new String[]{"targetFps", "resetEndless"}) {
            if (getIntent().hasExtra(key)) game.putExtra(key, getIntent().getIntExtra(key, 0));
        }
        start.setEnabled(false);
        startActivity(game);
    }

    @Override
    protected void onResume() {
        super.onResume();
        updateButtons();
    }

    private File archiveFile() {
        return new File(getFilesDir(), "main.pak64");
    }

    private void validateArchive(File file) throws IOException {
        try (ZipFile archive = new ZipFile(file)) {
            if (archive.getEntry("compiled/atlases/almanac_ui.atlas.png") == null)
                throw new IOException("资源包缺少配套图集。");
            ZipEntry marker = archive.getEntry("compiled/render-height.txt");
            String height = "600";
            if (marker != null) {
                if (marker.getSize() < 1 || marker.getSize() > 16)
                    throw new IOException("资源包分辨率标记无效。");
                byte[] bytes = new byte[(int) marker.getSize()];
                try (DataInputStream input = new DataInputStream(archive.getInputStream(marker))) {
                    input.readFully(bytes);
                }
                height = new String(bytes, StandardCharsets.US_ASCII).trim();
            }
            if (BuildConfig.VULKAN_COMPATIBILITY ? !height.equals("600")
                    : !(height.equals("1200") || height.equals("2400")))
                throw new IOException("请选择与当前版本配套的 main.pak64。");
        }
    }

    private void updateButtons() {
        if (start == null) return;
        boolean ready = BuildConfig.BUNDLED_PAK;
        if (!ready && !importing) {
            try {
                validateArchive(archiveFile());
                ready = true;
            } catch (IOException ignored) {}
        }
        start.setEnabled(ready);
        if (importPak != null) importPak.setEnabled(!importing);
    }

    private void choosePak() {
        Intent open = new Intent(Intent.ACTION_OPEN_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE)
                .setType("*/*");
        try {
            startActivityForResult(open, PICK_PAK);
        } catch (ActivityNotFoundException e) {
            Toast.makeText(this, "系统文件选择器不可用。", Toast.LENGTH_LONG).show();
        }
    }

    @Override
    protected void onActivityResult(int request, int result, Intent data) {
        super.onActivityResult(request, result, data);
        if (request != PICK_PAK || result != RESULT_OK || data == null || data.getData() == null)
            return;
        Uri selected = data.getData();
        importing = true;
        updateButtons();
        importPak.setText("正在导入 main.pak64…");
        new Thread(() -> {
            String message = "资源包已导入";
            File temporary = null;
            try (AndroidSaveFiles lock = AndroidSaveFiles.open(this)) {
                temporary = File.createTempFile("pak-import-", ".tmp", getFilesDir());
                try (InputStream input = getContentResolver().openInputStream(selected);
                     FileOutputStream output = new FileOutputStream(temporary)) {
                    if (input == null) throw new IOException("无法读取选中的文件。");
                    byte[] buffer = new byte[256 * 1024];
                    long total = 0;
                    for (int count; (count = input.read(buffer)) != -1;) {
                        total += count;
                        if (total > 1024L * 1024 * 1024) throw new IOException("资源包超过 1 GiB。");
                        output.write(buffer, 0, count);
                    }
                    output.getFD().sync();
                }
                validateArchive(temporary);
                Os.rename(temporary.getPath(), archiveFile().getPath());
            } catch (IOException | ErrnoException | SecurityException error) {
                message = error.getMessage() == null ? "资源包导入失败。" : error.getMessage();
            } finally {
                if (temporary != null) temporary.delete();
            }
            String resultMessage = message;
            runOnUiThread(() -> {
                importing = false;
                if (isDestroyed()) return;
                importPak.setText("导入 main.pak64");
                updateButtons();
                Toast.makeText(this, resultMessage, Toast.LENGTH_LONG).show();
            });
        }, "pvz-pak-import").start();
    }

    private int advertisedVulkanVersion() {
        for (FeatureInfo feature : getPackageManager().getSystemAvailableFeatures()) {
            if (PackageManager.FEATURE_VULKAN_HARDWARE_VERSION.equals(feature.name)) return feature.version;
        }
        return 0;
    }

    private RadioButton choice(String text, int id) {
        RadioButton button = new RadioButton(this);
        button.setId(id);
        button.setText(text);
        button.setTextColor(new ColorStateList(new int[][]{{-android.R.attr.state_enabled}, {}},
                new int[]{MUTED, FOREGROUND}));
        button.setButtonTintList(ColorStateList.valueOf(ACCENT));
        button.setMinHeight(dp(46));
        return button;
    }

    private TextView label(String text, int size, int color) {
        TextView view = new TextView(this);
        view.setText(text);
        view.setTextSize(size);
        view.setTextColor(color);
        return view;
    }

    private void spaced(LinearLayout content, View view, int top) {
        LinearLayout.LayoutParams size = new LinearLayout.LayoutParams(-1, -2);
        size.topMargin = dp(top);
        content.addView(view, size);
    }

    private int dp(int value) {
        return Math.round(getResources().getDisplayMetrics().density * value);
    }
}
