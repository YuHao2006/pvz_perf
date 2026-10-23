#include "Image.h"
#include "DDInterface.h"
#include "Graphics.h"
#include "RenderInterface.h"
#include "SexyAppBase.h"
#include "imagelib/ImageLib.h"
#include "Quantize.h"
#include <algorithm>
#include <cstring>
#include <limits>
#include <stdexcept>
#include <utility>

using namespace Sexy;

ImageMetadata::ImageMetadata()
{
	mWidth = 0;
	mHeight = 0;
}

ImageMetadata::ImageMetadata(const ImageMetadata& theImage) :
	mWidth(theImage.mWidth),
	mHeight(theImage.mHeight)
{
}

ImageMetadata::~ImageMetadata()
{
}

Image::Image(SexyAppBase* app) : mApp(app ? app : gSexyAppBase)
{
	if (mApp) mApp->AddGpuImage(this);
}

Image::Image(const Image& source) :
	ImageMetadata(source),
	mApp(source.mApp),
	mGpuSamplingFlags(source.mGpuSamplingFlags),
	mForcedMode(source.mForcedMode),
	mHasTrans(source.mHasTrans),
	mHasAlpha(source.mHasAlpha)
{
	try
	{
		if (source.mTexture || source.mPendingDecoded)
		{
			if (!mApp || !mApp->mDDInterface || !mApp->mDDInterface->mRenderInterface)
				throw GpuImageCpuAccess{};
			auto* render = mApp->mDDInterface->mRenderInterface;
			render->CloneUploadedImage(this, source);
			mHasTrans=source.mHasTrans;
			mHasAlpha=source.mHasAlpha;
		}
		if (mApp) mApp->AddGpuImage(this);
	}
	catch (...)
	{
		if (mRenderOwner) mRenderOwner->RemoveImage(this);
		throw;
	}
}

Image::~Image()
{
	if (mRenderOwner) mRenderOwner->RemoveImage(this);
	delete std::exchange(mPendingDecoded, nullptr);
	if (mApp) mApp->RemoveGpuImage(this);
}

namespace
{
size_t PixelCount(int width, int height)
{
	if (width <= 0 || height <= 0 ||
		size_t(width) > (std::numeric_limits<size_t>::max() / sizeof(unsigned int) - 1) / size_t(height))
		throw std::invalid_argument("Invalid image dimensions");
	return size_t(width) * size_t(height);
}
}

void Image::AdoptDecodedImage(ImageLib::Image* decoded, bool commitBits)
{
	if (decoded && decoded == mPendingDecoded)
	{
		if (commitBits) CommitBits();
		return;
	}
	// Ownership transfers on entry, including rejected inputs.
	try
	{
		if (!decoded || !decoded->mBits || mTexture || mPendingDecoded)
			throw GpuImageCpuAccess{};
		const auto count = PixelCount(decoded->mWidth, decoded->mHeight);
		if (decoded->mPixelCapacity && decoded->mPixelCapacity < count)
			throw std::invalid_argument("Decoded image allocation is smaller than its dimensions");
	}
	catch (...)
	{
		delete decoded;
		throw;
	}
	mWidth = decoded->mWidth;
	mHeight = decoded->mHeight;
	mPendingDecoded = decoded;
	BitsChanged();
	if (decoded->HasComposition())
	{
		mForcedMode = true;
		mHasTrans = true;
		mHasAlpha = true;
	}
	if (commitBits) CommitBits();
}

void Image::AppendAlphaImage(ImageLib::Image* decoded)
{
	if (decoded && decoded == mPendingDecoded)
		throw std::invalid_argument("Alpha payload aliases its destination");
	try
	{
		if (!decoded || !decoded->mBits || !mPendingDecoded || mTexture)
			throw GpuImageCpuAccess{};
		if (mWidth != decoded->mWidth || mHeight != decoded->mHeight)
			throw ImageLib::ImageAlphaSizeMismatch{};
		// Composition inputs are CPU decode objects, never runtime GPU owners.
		mPendingDecoded->mAlphaLayers.push_back(decoded);
	}
	catch (...)
	{
		delete decoded;
		throw;
	}
	mForcedMode = true;
	mHasTrans = true;
	mHasAlpha = true;
}

void Image::SetBits(unsigned int* bits, int width, int height, bool commitBits)
{
	if (mTexture) throw GpuImageCpuAccess{};
	const auto count = PixelCount(width, height);
	if (!bits) throw std::invalid_argument("Missing source image pixels");
	auto* decoded = new ImageLib::Image;
	try
	{
		decoded->mWidth = width;
		decoded->mHeight = height;
		decoded->mBits = new unsigned int[count + 1];
		decoded->mPixelCapacity = count + 1;
		std::copy_n(bits, count, decoded->mBits);
	}
	catch (...) { delete decoded; throw; }
	delete std::exchange(mPendingDecoded, nullptr);
	AdoptDecodedImage(decoded, commitBits);
}

void Image::Create(int width, int height)
{
	if (mTexture) throw GpuImageCpuAccess{};
	const auto count = PixelCount(width, height);
	auto* decoded = new ImageLib::Image;
	try
	{
		decoded->mWidth = width;
		decoded->mHeight = height;
		decoded->mBits = new unsigned int[count + 1]{};
		decoded->mPixelCapacity = count + 1;
	}
	catch (...) { delete decoded; throw; }
	delete std::exchange(mPendingDecoded, nullptr);
	AdoptDecodedImage(decoded, true);
}

void Image::BitsChanged()
{
	if (mTexture || !mPendingDecoded) throw GpuImageCpuAccess{};
	mBitsChanged = true;
}

void Image::CommitBits()
{
	if (!mBitsChanged) return;
	if (!mForcedMode)
	{
		if (!mPendingDecoded || !mPendingDecoded->mBits) throw GpuImageCpuAccess{};
		mHasAlpha = false;
		mHasTrans = false;
		const auto count = PixelCount(mWidth, mHeight);
		for (size_t i = 0; i < count; ++i)
		{
			const auto alpha = mPendingDecoded->mBits[i] >> 24;
			mHasTrans |= alpha == 0;
			mHasAlpha |= alpha != 0 && alpha != 255;
		}
	}
	mBitsChanged = false;
}

void Image::PurgeBits()
{
	delete std::exchange(mPendingDecoded, nullptr);
}

bool Image::Palletize()
{
	if (!mPendingDecoded || mTexture || mPendingDecoded->HasComposition())
		return false;
	CommitBits();
	const auto count = PixelCount(mWidth, mHeight);
	unsigned char* indices = nullptr;
	unsigned int* palette = nullptr;
	try
	{
		indices = new unsigned char[count];
		palette = new unsigned int[256];
		if (!Quantize8Bit(mPendingDecoded->mBits, mWidth, mHeight, indices, palette))
		{
			delete[] indices;
			delete[] palette;
			return false;
		}
		// Preserve the old load-time quantization, without retaining a palette.
		for (size_t i = 0; i < count; ++i)
			mPendingDecoded->mBits[i] = palette[indices[i]];
	}
	catch (...) { delete[] indices; delete[] palette; throw; }
	delete[] indices;
	delete[] palette;
	return true;
}

