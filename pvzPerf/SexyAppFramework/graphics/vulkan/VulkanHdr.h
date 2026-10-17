#pragma once
#include "SexyAppFramework/platform/NativeHandles.h"
#include <cmath>
#include <cstdint>
#include <memory>
#include <stdexcept>
namespace Sexy {
// Matches the fragment push-constant float4 at byte offset 16.
struct VulkanHdrParams {
    float paperWhiteNits, peakNits, reinhardPaperNits, strength;
    bool operator==(const VulkanHdrParams&) const = default;
    void Validate() const {
        if (!std::isfinite(paperWhiteNits) || !std::isfinite(peakNits) ||
            !std::isfinite(reinhardPaperNits) || !std::isfinite(strength) ||
            paperWhiteNits <= 0 || peakNits < paperWhiteNits || peakNits > 10000 ||
            reinhardPaperNits < 150 || reinhardPaperNits > 500 || strength < 0 || strength > 1)
            throw std::invalid_argument("Invalid native HDR luminance/strength parameters");
    }
};
static_assert(sizeof(VulkanHdrParams) == 16);
struct VulkanHdrDisplayInfo {
    bool hdr;
    float paperWhiteNits, peakNits, minimumNits, fullFrameNits;
    bool operator==(const VulkanHdrDisplayInfo&) const = default;
    VulkanHdrParams Params(float strength) const {
        if (!hdr) throw std::runtime_error("HDR requested but the target desktop monitor is in SDR mode");
        // Legacy SDR_WHITE_LEVEL mapping: 1000 = 80 nits.
        const float reinhard = std::fmin(500.0f, std::fmax(150.0f,
            150.0f + (paperWhiteNits / 80.0f - 1.0f) * 70.0f));
        VulkanHdrParams result{paperWhiteNits, peakNits, reinhard, strength};
        result.Validate();
        return result;
    }
};
// Only Windows has a native HDR metadata implementation. Linux callers must
// reject HDR explicitly and keep the SDR path independent of these APIs.
#ifdef _WIN32
// Native metadata boundary; never changes desktop HDR/mode.
VulkanHdrDisplayInfo QueryVulkanHdrDisplay(NativeMonitorHandle monitor);

struct VulkanHdrDisplaySnapshot {
    VulkanHdrDisplayInfo display{};
    uint64_t revision=0;
};
// Platform metadata only. Owns its notification queue; never calls Vulkan or
// game code on that thread. Construct/Rebind/Close on the application thread.
class VulkanHdrDisplayObserver final {
public:
    explicit VulkanHdrDisplayObserver(NativeMonitorHandle monitor);
    ~VulkanHdrDisplayObserver();
    VulkanHdrDisplayObserver(const VulkanHdrDisplayObserver&)=delete;
    VulkanHdrDisplayObserver& operator=(const VulkanHdrDisplayObserver&)=delete;
    void Rebind(NativeMonitorHandle monitor,bool force=false);
    void Refresh(); // Explicit resample on the observer queue; not a frame poll.
    uint64_t Revision() const;
    VulkanHdrDisplaySnapshot Snapshot() const;
    void Close(); // Waits for actual queue/thread shutdown; reports errors.
private:
    struct Impl;
    std::unique_ptr<Impl> impl_;
};
#endif
}
