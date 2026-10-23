#pragma once
#include "Image.h"

namespace Sexy
{
inline constexpr unsigned int MEMORYCHECK_ID = 0x4BEEFADE;

// CPU bitmap utility only. It cannot be passed to Graphics/RenderInterface,
// has no renderer registration and owns no GPU texture or runtime image view.
class MemoryImage final : public ImageMetadata
{
public:
    unsigned int* mBits = nullptr;
    unsigned int* mColorTable = nullptr;
    uchar* mColorIndices = nullptr;
    bool mBitsChanged = false;
    bool mForcedMode = false;
    bool mHasTrans = false;
    bool mHasAlpha = false;

    MemoryImage() = default;
    explicit MemoryImage(SexyAppBase*);
    MemoryImage(const MemoryImage& source);
    MemoryImage& operator=(const MemoryImage&) = delete;
    ~MemoryImage();

    void Create(int width, int height);
    void SetBits(unsigned int* bits, int width, int height, bool commitBits = true);
    unsigned int* GetBits();
    void BitsChanged();
    void CommitBits();
    void PurgeBits();
    bool Palletize();
    void Clear();
    void ClearRect(const Rect& rect);
};
}
