#include <algorithm>
#include <array>
#include <cassert>
#include <iostream>
#include <stdexcept>
#include <string>
#include <cstdint>
using VkResult = int;
using VkCommandBuffer = int;
constexpr int VK_SUCCESS=0, VK_NOT_READY=1, VK_TIMEOUT=2;
constexpr int VK_ERROR_OUT_OF_DATE_KHR=-100, VK_SUBOPTIMAL_KHR=100;
constexpr int VK_NULL_HANDLE=0, VK_STRUCTURE_TYPE_COMMAND_BUFFER_BEGIN_INFO=1;
constexpr int VK_COMMAND_BUFFER_USAGE_ONE_TIME_SUBMIT_BIT=1;
struct VkExtent2D { unsigned width=800,height=600; };
struct VkCommandBufferBeginInfo { int sType; int flags=0; };
struct Calls {
    VkResult fence=VK_SUCCESS, acquire=VK_SUCCESS;
    int polls=0, acquires=0, resets=0, begins=0;
    int polledFence=0; unsigned long long timeout=99;
} calls;
VkResult vkGetFenceStatus(int, int fence) { ++calls.polls; calls.polledFence=fence; return calls.fence; }
VkResult vkAcquireNextImageKHR(int,int,unsigned long long timeout,int,int,unsigned* image) {
    ++calls.acquires; calls.timeout=timeout; *image=2; return calls.acquire;
}
VkResult vkResetCommandBuffer(int,int) { ++calls.resets; return VK_SUCCESS; }
VkResult vkBeginCommandBuffer(int,const VkCommandBufferBeginInfo*) { ++calls.begins; return VK_SUCCESS; }
#define VK_CHECK(expr) do { if ((expr)!=VK_SUCCESS) throw std::runtime_error("Vulkan failure"); } while(0)
class VulkanContext {
public:
    struct FrameResources { int cmd=3, acquired=4, fence=5; unsigned long long serial=0; };
    struct FrameContext {
        int cmd=0; unsigned imageIndex=0; VkExtent2D extent{}; bool valid=false;
        unsigned long long serial=0; unsigned resourceIndex=0;
    };
    int device=1, swapchain=2;
    std::array<FrameResources,2> frameResources_{};
    unsigned frameResourceIndex_=0, currentImageIndex_=0;
    bool frameActive_=false, frameLoopFailed_=false, swapchainDirty_=false, recreate=true;
    unsigned long long completedSerial=0, submittedSerial=3, recordingSerial=0;
    VkExtent2D drawable{}, drawableExtentAtCreate{}, swapchainExtent{};
    VkExtent2D QueryDrawableExtent() const { return drawable; }
    bool RecreateSwapchain() { return recreate; }
    FrameContext BeginCommands();
};
// The runner inserts the production VulkanContext::BeginCommands definition here.
/*PRODUCTION*/
int main() {
    VulkanContext window;
    window.frameResources_[0].serial=1;
    window.frameResources_[1].serial=2;
    window.frameResources_[1].fence=9;
    calls.fence=VK_NOT_READY;
    auto frame=window.BeginCommands();
    assert(!frame.valid && calls.polls==1 && calls.acquires==0);
    assert(calls.resets==0 && calls.begins==0 && window.completedSerial==0);
    assert(window.frameResourceIndex_==0 && window.recordingSerial==0 && !window.frameActive_);
    calls={}; calls.acquire=VK_NOT_READY;
    frame=window.BeginCommands();
    assert(!frame.valid && window.completedSerial==1 && calls.acquires==1 && calls.timeout==0);
    assert(calls.resets==0 && calls.begins==0 && window.frameResourceIndex_==0);
    calls={}; calls.acquire=VK_TIMEOUT;
    assert(!window.BeginCommands().valid && calls.polls==0 && calls.resets==0);
    calls={}; calls.acquire=VK_ERROR_OUT_OF_DATE_KHR;
    assert(!window.BeginCommands().valid && window.swapchainDirty_ && calls.resets==0);
    window.swapchainDirty_=false;
    calls={}; calls.acquire=-200;
    bool error=false; try { (void)window.BeginCommands(); } catch (const std::runtime_error&) { error=true; }
    assert(error && calls.resets==0 && !window.frameActive_);
    calls={};
    frame=window.BeginCommands();
    assert(frame.valid && frame.resourceIndex==0 && frame.serial==4 && frame.imageIndex==2);
    assert(calls.resets==1 && calls.begins==1 && window.recordingSerial==4 && window.frameActive_);
    window.frameActive_=false; window.recordingSerial=0; window.frameResourceIndex_=1;
    calls={}; calls.fence=VK_NOT_READY;
    assert(!window.BeginCommands().valid && calls.polledFence==9 && calls.acquires==0);
    calls={}; calls.acquire=VK_SUBOPTIMAL_KHR;
    frame=window.BeginCommands();
    assert(frame.valid && frame.resourceIndex==1 && window.completedSerial==2 && !window.swapchainDirty_);
    std::cout << "PASS production frame admission: busy slot, image backpressure, errors, independent second slot\n";
}
