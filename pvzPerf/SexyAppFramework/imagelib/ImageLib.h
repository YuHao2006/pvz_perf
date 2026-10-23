#pragma once
#include <string>
#include <span>
#include <cstdint>
#include <optional>
#include <vector>
#include <exception>

namespace ImageLib
{

class Image;
class ImageAlphaSizeMismatch final : public std::exception {};

class Image
{
public:
	int						mWidth;
	int						mHeight;
	unsigned int*			mBits;
	size_t mPixelCapacity=0;
	std::optional<uint32_t> mColorFromAlpha;
	std::vector<Image*> mAlphaLayers;
	bool HasComposition() const noexcept { return mColorFromAlpha || !mAlphaLayers.empty(); }

public:
	Image();
	Image(const Image&) = delete;
	Image& operator=(const Image&) = delete;
	Image(Image&&) = delete;
	Image& operator=(Image&&) = delete;
	~Image();

};

bool WritePNGImage(const std::string& theFileName, Image* theImage);
// Non-owning, read-only pixels: useful for GPU snapshots without another copy
// or temporarily transferring vector storage to Image's owning raw pointer.
bool WritePNGImage(const std::string& theFileName, int width, int height, std::span<const uint32_t> pixels);
extern thread_local int gAlphaComposeColor;
class ScopedAlphaComposeColor
{
	int mPrevious;
public:
	explicit ScopedAlphaComposeColor(int color) noexcept : mPrevious(gAlphaComposeColor) { gAlphaComposeColor = color; }
	~ScopedAlphaComposeColor() { gAlphaComposeColor = mPrevious; }
	ScopedAlphaComposeColor(const ScopedAlphaComposeColor&) = delete;
	ScopedAlphaComposeColor& operator=(const ScopedAlphaComposeColor&) = delete;
};


[[nodiscard("delete the returned decoded image or transfer it to an upload")]]
Image* GetImage(const std::string& theFileName, bool lookForAlphaImage = true);

//void InitJPEG2000();
//void CloseJPEG2000();
//void SetJ2KCodecKey(const std::string& theKey);

}
