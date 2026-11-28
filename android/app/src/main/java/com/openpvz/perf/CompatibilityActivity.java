package com.openpvz.perf;

public final class CompatibilityActivity extends PerfActivity {
    @Override
    protected String nativeLibrary() {
        return "pvz_perf_vk10";
    }
}
