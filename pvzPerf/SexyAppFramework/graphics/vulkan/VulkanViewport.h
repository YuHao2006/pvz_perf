#pragma once
#include "SexyAppFramework/graphics/GpuTypes.h"
#include <algorithm>
#include <cmath>
#include <cstdint>
#include <stdexcept>

namespace Sexy {
using VulkanClip = GpuClip;
using VulkanPoint = GpuPoint;

// Pixel-aligned aspect fit. Both the presentation quad and input use this
// exact rectangle, including odd-sized surfaces and letterbox offsets.
inline VulkanClip FitSceneToSurface(int sceneWidth,int sceneHeight,int width,int height) {
    if(sceneWidth<=0 || sceneHeight<=0 || width<=0 || height<=0)
        throw std::invalid_argument("Invalid scene/surface dimensions");
    int w=width,h=height;
    if(std::int64_t(width)*sceneHeight<=std::int64_t(height)*sceneWidth)
        h=std::max(1,int(std::int64_t(width)*sceneHeight/sceneWidth));
    else w=std::max(1,int(std::int64_t(height)*sceneWidth/sceneHeight));
    return {(width-w)/2,(height-h)/2,w,h};
}
inline VulkanPoint WindowPointToScene(double x,double y,int windowWidth,int windowHeight,
    int framebufferWidth,int framebufferHeight,const VulkanClip& rect,int sceneWidth,int sceneHeight) {
    if(windowWidth<=0 || windowHeight<=0 || rect.width<=0 || rect.height<=0)
        throw std::invalid_argument("Cannot map input on an empty window");
    // Do not clamp: a click in a letterbox must remain outside the game.
    return {int(std::floor((x*framebufferWidth/windowWidth-rect.x)*sceneWidth/rect.width)),
            int(std::floor((y*framebufferHeight/windowHeight-rect.y)*sceneHeight/rect.height))};
}
}
