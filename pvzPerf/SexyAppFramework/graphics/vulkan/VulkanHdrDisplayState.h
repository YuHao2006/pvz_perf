#pragma once
#include "VulkanHdr.h"
#include <atomic>
#include <exception>
#include <mutex>

namespace Sexy {
// The observer thread publishes one indivisible metadata snapshot. The game
// does a cheap revision load per pump and takes this lock only after a change.
class VulkanHdrDisplayState final {
    mutable std::mutex mutex_;
    VulkanHdrDisplaySnapshot snapshot_{};
    std::exception_ptr failure_;
    std::atomic<uint64_t> revision_{0};
public:
    uint64_t Revision() const { return revision_.load(std::memory_order_acquire); }
    void Publish(const VulkanHdrDisplayInfo& display) {
        const std::lock_guard lock(mutex_);
        // A later successful event must not conceal an earlier failed query.
        if (failure_ || (snapshot_.revision && snapshot_.display==display)) return;
        snapshot_.display=display;
        ++snapshot_.revision;
        revision_.store(snapshot_.revision,std::memory_order_release);
    }
    void Fail(std::exception_ptr failure) {
        if (!failure) throw std::invalid_argument("Missing HDR observer failure");
        const std::lock_guard lock(mutex_);
        if (failure_) return;
        failure_=std::move(failure);
        ++snapshot_.revision;
        revision_.store(snapshot_.revision,std::memory_order_release);
    }
    VulkanHdrDisplaySnapshot Snapshot() const {
        const std::lock_guard lock(mutex_);
        if (failure_) std::rethrow_exception(failure_);
        if (!snapshot_.revision) throw std::logic_error("HDR observer has no initial snapshot");
        return snapshot_;
    }
};
}
