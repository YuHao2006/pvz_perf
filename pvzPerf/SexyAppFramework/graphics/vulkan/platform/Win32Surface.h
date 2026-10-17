#pragma once
#ifndef NOMINMAX
#define NOMINMAX
#endif
#include <windows.h>
#include <vulkan/vulkan.h>
#include <vulkan/vulkan_win32.h>

// Private WSI boundary: borrows an existing HWND and creates only its VkSurface.
VkSurfaceKHR CreateWin32VulkanSurface(VkInstance instance, HWND hwnd);
