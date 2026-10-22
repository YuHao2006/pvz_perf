#include "ResidentImage.h"
#include "RenderInterface.h"
#include "imagelib/ImageLib.h"
#include <stdexcept>

namespace Sexy
{
ResidentImage::ResidentImage()
{
    mImageType=ImageType::ResidentImage;
}

ResidentImage::~ResidentImage()
{
    for (auto& image:mFilterImages) image.reset();
    if (mRenderOwner) mRenderOwner->RemoveResidentImage(this);
    mTextureData.reset();
    mImageType=ImageType::Image;
}

std::unique_ptr<ResidentImage> ResidentImage::DecodePng(const std::string& path)
{
    if (!path.ends_with(".png"))
        throw std::invalid_argument("Resident atlas requires a PNG path");
    std::unique_ptr<ImageLib::Image> decoded(ImageLib::GetImage(path,false));
    if (!decoded || !decoded->mBits || decoded->HasComposition() ||
        decoded->mWidth<=0 || decoded->mHeight<=0)
        throw std::runtime_error("Unable to decode resident atlas PNG: "+path);
    auto result=std::make_unique<ResidentImage>();
    result->mFilePath=path;
    result->mWidth=decoded->mWidth;
    result->mHeight=decoded->mHeight;
    result->mPendingDecoded=std::move(decoded);
    return result;
}
}
