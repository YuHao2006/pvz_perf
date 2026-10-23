#include "MemoryImage.h"
#include "Quantize.h"
#include <algorithm>
#include <limits>
#include <stdexcept>
#include <utility>

using namespace Sexy;

namespace
{
size_t PixelCount(int width, int height)
{
    if (width <= 0 || height <= 0 ||
        size_t(width) > (std::numeric_limits<size_t>::max() / sizeof(unsigned int) - 1) / size_t(height))
        throw std::invalid_argument("Invalid CPU bitmap dimensions");
    return size_t(width) * size_t(height);
}
}

MemoryImage::MemoryImage(SexyAppBase*) {}

MemoryImage::MemoryImage(const MemoryImage& source) :
    ImageMetadata(source),
    mBitsChanged(source.mBitsChanged),
    mForcedMode(source.mForcedMode),
    mHasTrans(source.mHasTrans),
    mHasAlpha(source.mHasAlpha)
{
    if (mWidth == 0 && mHeight == 0) return;
    const auto count = PixelCount(mWidth, mHeight);
    try
    {
        if (source.mBits)
        {
            mBits = new unsigned int[count + 1];
            std::copy_n(source.mBits, count, mBits);
            mBits[count] = MEMORYCHECK_ID;
        }
        if (source.mColorTable)
        {
            if (!source.mColorIndices)
                throw std::logic_error("CPU palette has no indices");
            mColorTable = new unsigned int[256];
            std::copy_n(source.mColorTable, 256, mColorTable);
            mColorIndices = new uchar[count];
            std::copy_n(source.mColorIndices, count, mColorIndices);
        }
    }
    catch (...)
    {
        delete[] mBits;
        delete[] mColorTable;
        delete[] mColorIndices;
        throw;
    }
}

MemoryImage::~MemoryImage()
{
    delete[] mBits;
    delete[] mColorTable;
    delete[] mColorIndices;
}

void MemoryImage::SetBits(unsigned int* bits, int width, int height, bool commitBits)
{
    const auto count = PixelCount(width, height);
    if (!bits) throw std::invalid_argument("Missing CPU bitmap pixels");
    auto* copy = new unsigned int[count + 1];
    std::copy_n(bits, count, copy);
    copy[count] = MEMORYCHECK_ID;
    delete[] mBits;
    delete[] std::exchange(mColorTable, nullptr);
    delete[] std::exchange(mColorIndices, nullptr);
    mBits = copy;
    mWidth = width;
    mHeight = height;
    BitsChanged();
    if (commitBits) CommitBits();
}

void MemoryImage::Create(int width, int height)
{
    const auto count = PixelCount(width, height);
    auto* pixels = new unsigned int[count + 1]{};
    pixels[count] = MEMORYCHECK_ID;
    delete[] mBits;
    delete[] std::exchange(mColorTable, nullptr);
    delete[] std::exchange(mColorIndices, nullptr);
    mBits = pixels;
    mWidth = width;
    mHeight = height;
    BitsChanged();
}

unsigned int* MemoryImage::GetBits()
{
    if (mBits) return mBits;
    const auto count = PixelCount(mWidth, mHeight);
    if (mColorTable && !mColorIndices)
        throw std::logic_error("CPU palette has no indices");
    auto* pixels = new unsigned int[count + 1]{};
    if (mColorTable)
        for (size_t i = 0; i < count; ++i)
            pixels[i] = mColorTable[mColorIndices[i]];
    pixels[count] = MEMORYCHECK_ID;
    mBits = pixels;
    delete[] std::exchange(mColorTable, nullptr);
    delete[] std::exchange(mColorIndices, nullptr);
    return mBits;
}

void MemoryImage::BitsChanged()
{
    if (mBits && mBits[PixelCount(mWidth, mHeight)] != MEMORYCHECK_ID)
        throw std::logic_error("CPU bitmap guard corrupted");
    mBitsChanged = true;
}

void MemoryImage::CommitBits()
{
    if (!mBitsChanged) return;
    if (!mForcedMode)
    {
        mHasTrans = false;
        mHasAlpha = false;
        const auto count = PixelCount(mWidth, mHeight);
        if (mColorTable && !mColorIndices)
            throw std::logic_error("CPU palette has no indices");
        for (size_t i = 0; i < count; ++i)
        {
            const auto pixel = mBits ? mBits[i] : mColorTable ? mColorTable[mColorIndices[i]] : 0;
            const auto alpha = pixel >> 24;
            mHasTrans |= alpha == 0;
            mHasAlpha |= alpha != 0 && alpha != 255;
        }
    }
    mBitsChanged = false;
}

void MemoryImage::PurgeBits()
{
    delete[] std::exchange(mBits, nullptr);
    delete[] std::exchange(mColorTable, nullptr);
    delete[] std::exchange(mColorIndices, nullptr);
}

bool MemoryImage::Palletize()
{
    CommitBits();
    if (mColorTable) return true;
    const auto count = PixelCount(mWidth, mHeight);
    auto* bits = GetBits();
    uchar* indices = nullptr;
    unsigned int* palette = nullptr;
    try
    {
        indices = new uchar[count];
        palette = new unsigned int[256];
        if (!Quantize8Bit(bits, mWidth, mHeight, indices, palette))
        {
            delete[] indices;
            delete[] palette;
            return false;
        }
    }
    catch (...) { delete[] indices; delete[] palette; throw; }
    delete[] std::exchange(mBits, nullptr);
    mColorIndices = indices;
    mColorTable = palette;
    return true;
}

void MemoryImage::Clear()
{
    std::fill_n(GetBits(), PixelCount(mWidth, mHeight), 0u);
    BitsChanged();
}

void MemoryImage::ClearRect(const Rect& rect)
{
    const int left = std::clamp(rect.mX, 0, mWidth);
    const int top = std::clamp(rect.mY, 0, mHeight);
    const int right = static_cast<int>(std::clamp(
        static_cast<long long>(rect.mX) + rect.mWidth, 0LL, static_cast<long long>(mWidth)));
    const int bottom = static_cast<int>(std::clamp(
        static_cast<long long>(rect.mY) + rect.mHeight, 0LL, static_cast<long long>(mHeight)));
    if (left >= right || top >= bottom) return;
    auto* pixels = GetBits();
    for (int y = top; y < bottom; ++y)
        std::fill_n(pixels + size_t(y) * mWidth + left, right - left, 0u);
    BitsChanged();
}
