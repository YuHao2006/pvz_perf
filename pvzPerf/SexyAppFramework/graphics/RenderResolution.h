#pragma once
#include <algorithm>
#include <cmath>
#include <utility>
namespace Sexy {
struct RenderResolution {
    int minWidth=800, minHeight=600, maxWidth=2800, maxHeight=1200;
    std::pair<int,int> Fit(int width,int height) const {
        const double upper=std::min(double(maxWidth)/width,double(maxHeight)/height);
        const double lower=std::max(double(minWidth)/width,double(minHeight)/height);
        const double scale=std::min(upper,std::max(1.0,lower));
        return {std::max(1,int(std::lround(width*scale))),std::max(1,int(std::lround(height*scale)))};
    }
};
}
