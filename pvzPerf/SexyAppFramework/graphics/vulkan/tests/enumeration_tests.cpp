#include "VulkanEnumeration.h"
#include <algorithm>
#include <array>
#include <iostream>

namespace {
void Require(bool value, const char* message) {
    if (!value) throw std::runtime_error(message);
}

void TestSnapshots() {
    unsigned calls = 0;
    auto values = EnumerateVulkan<int>("stable", [&](uint32_t* count, int* data) {
        ++calls;
        if (!data) { *count = 3; return VK_SUCCESS; }
        Require(*count == 3, "Wrong supplied capacity");
        std::copy_n(std::array{8, 21, 34}.data(), 3, data);
        return VK_SUCCESS;
    });
    Require(values == std::vector{8, 21, 34} && calls == 2, "Stable snapshot changed");

    unsigned counts = 0, fills = 0;
    values = EnumerateVulkan<int>("growing", [&](uint32_t* count, int* data) {
        if (!data) { *count = ++counts; return VK_SUCCESS; }
        ++fills;
        Require(*count == counts, "Retry did not use the new count");
        if (fills < 3) { data[0] = -1; return VK_INCOMPLETE; }
        std::copy_n(std::array{55, 89, 144}.data(), 3, data);
        return VK_SUCCESS;
    });
    Require(values == std::vector{55, 89, 144} && fills == 3 && counts == 3,
        "Growth returned a truncated/stale list instead of a fresh snapshot");

    values = EnumerateVulkan<int>("shrinking", [](uint32_t* count, int* data) {
        if (!data) { *count = 5; return VK_SUCCESS; }
        Require(*count == 5, "Shrink capacity mismatch");
        data[0] = 233; *count = 1;
        return VK_SUCCESS;
    });
    Require(values == std::vector{233}, "Unused tail survived a shrinking snapshot");

    calls = 0;
    values = EnumerateVulkan<int>("empty", [&](uint32_t* count, int* data) {
        ++calls; Require(data == nullptr, "Empty enumeration did a second null-data count query");
        *count = 0; return VK_SUCCESS;
    });
    Require(values.empty() && calls == 1, "Empty snapshot did not terminate");
    values = EnumerateVulkan<int>("became-empty", [](uint32_t* count, int* data) {
        *count = data ? 0 : 4; return VK_SUCCESS;
    });
    Require(values.empty(), "Empty successful fill retained default elements");

    counts = 0;
    values = EnumerateVulkan<int>("incomplete-count", [&](uint32_t* count, int* data) {
        if (!data) { *count = 1; return ++counts == 1 ? VK_INCOMPLETE : VK_SUCCESS; }
        data[0] = 377; return VK_SUCCESS;
    });
    Require(values == std::vector{377} && counts == 2, "Incomplete count was not requeried");

    counts = 0;
    values = EnumerateVulkan<int>("disappeared", [&](uint32_t* count, int* data) {
        if (!data) { *count = ++counts == 1 ? 2 : 0; return VK_SUCCESS; }
        return VK_INCOMPLETE;
    });
    Require(values.empty() && counts == 2, "Disappearance returned a partial snapshot");

    const auto formats = EnumerateVulkan<VkSurfaceFormatKHR>("formats", [](uint32_t* count, VkSurfaceFormatKHR* data) {
        if (!data) { *count = 1; return VK_SUCCESS; }
        data[0] = {VK_FORMAT_A2B10G10R10_UNORM_PACK32, VK_COLOR_SPACE_HDR10_ST2084_EXT};
        return VK_SUCCESS;
    });
    Require(formats.size() == 1 && formats[0].format == VK_FORMAT_A2B10G10R10_UNORM_PACK32 &&
        formats[0].colorSpace == VK_COLOR_SPACE_HDR10_ST2084_EXT, "Typed surface-format snapshot was changed");
}

void TestErrors() {
    for (auto result : {VK_ERROR_OUT_OF_HOST_MEMORY, VK_ERROR_DEVICE_LOST, VK_ERROR_SURFACE_LOST_KHR,
                        VK_ERROR_INITIALIZATION_FAILED, VK_ERROR_LAYER_NOT_PRESENT}) {
        for (bool failCount : {false, true}) {
            unsigned calls = 0;
            bool caught = false;
            try {
                (void)EnumerateVulkan<int>("fatal-query", [&](uint32_t* count, int* data) {
                    ++calls;
                    if (!data && !failCount) { *count = 1; return VK_SUCCESS; }
                    return result;
                });
            } catch (const VulkanCallError& error) {
                caught = error.result == result && std::string(error.what()).find("fatal-query") != std::string::npos;
            }
            Require(caught && calls == (failCount ? 1u : 2u), "Real Vulkan error was hidden/retried or lost its code");
        }
    }

    unsigned fills = 0, counts = 0;
    bool caught = false;
    try {
        (void)EnumerateVulkan<int>("unstable", [&](uint32_t* count, int* data) {
            if (!data) { ++counts; *count = 1; return VK_SUCCESS; }
            ++fills; data[0] = 610; return VK_INCOMPLETE;
        });
    } catch (const VulkanCallError& error) {
        caught = error.result == VK_INCOMPLETE && std::string(error.what()).find("no complete snapshot") != std::string::npos;
    }
    Require(caught && counts == 8 && fills == 8, "Unstable provider did not fail explicitly within a bounded query");

    caught = false;
    try {
        (void)EnumerateVulkan<int>("invalid-count", [](uint32_t* count, int* data) {
            *count = data ? 2 : 1; return VK_SUCCESS; // Deliberately does not write outside the test array.
        });
    } catch (const std::runtime_error& error) {
        caught = std::string(error.what()).find("larger than the supplied capacity") != std::string::npos;
    }
    Require(caught, "Invalid returned capacity was silently accepted");
}
}

int main() {
    try {
        TestSnapshots(); TestErrors();
        std::cout << "PASS Vulkan enumeration: growth/shrink/empty, fresh typed snapshots, fatal errors, bounded instability\n";
        return 0;
    } catch (const std::exception& error) {
        std::cerr << "FAIL: " << error.what() << '\n';
        return 1;
    }
}
