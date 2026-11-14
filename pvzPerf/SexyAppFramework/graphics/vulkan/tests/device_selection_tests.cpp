#include "VulkanDeviceSelection.h"
#include <array>
#include <iostream>
#include <stdexcept>

namespace {
VulkanDeviceCandidate Candidate(VkPhysicalDeviceType type, uint32_t textureLimit) {
    VulkanDeviceCandidate candidate;
    candidate.properties.deviceType = type;
    candidate.properties.limits.maxImageDimension2D = textureLimit;
    return candidate;
}
void Require(bool value, const char* message) {
    if (!value) throw std::runtime_error(message);
}
void Run() {
    Require(!SelectPreferredVulkanDevice({}), "Empty compatible list selected a device");
    const std::array lowPower{
        Candidate(VK_PHYSICAL_DEVICE_TYPE_INTEGRATED_GPU, 4096),
        Candidate(VK_PHYSICAL_DEVICE_TYPE_DISCRETE_GPU, 32768)};
    Require(SelectPreferredVulkanDevice(lowPower) == &lowPower[0],
        "A later discrete GPU overrode the OS-preferred integrated GPU");
    const std::array highPerformance{
        Candidate(VK_PHYSICAL_DEVICE_TYPE_DISCRETE_GPU, 8192),
        Candidate(VK_PHYSICAL_DEVICE_TYPE_INTEGRATED_GPU, 32768)};
    Require(SelectPreferredVulkanDevice(highPerformance) == &highPerformance[0],
        "Texture limits overrode loader preference");
    const std::array multipleDiscrete{
        Candidate(VK_PHYSICAL_DEVICE_TYPE_DISCRETE_GPU, 8192),
        Candidate(VK_PHYSICAL_DEVICE_TYPE_DISCRETE_GPU, 32768)};
    Require(SelectPreferredVulkanDevice(multipleDiscrete) == &multipleDiscrete[0],
        "The second discrete GPU displaced the preferred one");
    const std::array softwareFirst{
        Candidate(VK_PHYSICAL_DEVICE_TYPE_CPU, 65536),
        Candidate(VK_PHYSICAL_DEVICE_TYPE_INTEGRATED_GPU, 4096),
        Candidate(VK_PHYSICAL_DEVICE_TYPE_DISCRETE_GPU, 32768)};
    Require(SelectPreferredVulkanDevice(softwareFirst) == &softwareFirst[1],
        "Software implementation displaced compatible hardware");
    const std::array softwareOnly{
        Candidate(VK_PHYSICAL_DEVICE_TYPE_CPU, 8192),
        Candidate(VK_PHYSICAL_DEVICE_TYPE_CPU, 32768)};
    Require(SelectPreferredVulkanDevice(softwareOnly) == &softwareOnly[0],
        "Software-only fallback did not retain enumeration order");
    const std::array virtualFirst{
        Candidate(VK_PHYSICAL_DEVICE_TYPE_VIRTUAL_GPU, 4096),
        Candidate(VK_PHYSICAL_DEVICE_TYPE_DISCRETE_GPU, 32768)};
    Require(SelectPreferredVulkanDevice(virtualFirst) == &virtualFirst[0],
        "A virtual hardware preference was overwritten");
}
}
int main() {
    try {
        Run();
        std::cout << "PASS Vulkan device selection: loader preference, texture-limit independence, CPU fallback\n";
        return 0;
    } catch (const std::exception& error) {
        std::cerr << "FAIL: " << error.what() << '\n';
        return 1;
    }
}
