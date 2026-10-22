#pragma once
#include "Common.h"
#include "Color.h"
#include "misc/Rect.h"
#include "misc/Point.h"

namespace Sexy
{

struct Span
{
	int						mY;
	int						mX;
	int						mWidth;
};

enum AnimType
{
	AnimType_None,
	AnimType_Once,
	AnimType_PingPong,
	AnimType_Loop
};

struct AnimInfo
{
	AnimType				mAnimType;
	int						mFrameDelay; // 1/100s
	int						mNumCels;
	std::vector<int>		mPerFrameDelay;
	std::vector<int>		mFrameMap;
	int						mTotalAnimTime;

	AnimInfo();
	void SetPerFrameDelay(int theFrame, int theTime);
	void Compute(int theNumCels, int theBeginFrameTime = 0, int theEndFrameTime = 0);

	int GetPerFrameCel(int theTime);
	int GetCel(int theTime);
};

class Graphics;
class SexyMatrix3;
class TriVertex;
class MemoryImage;
class DDImage;
class ResidentImage;

enum class ImageType : unsigned char
{
	Image,
	MemoryImage,
	DDImage,
	ResidentImage
};

class Image
{
protected:
	// Constructors and destructors advance this tag with the active class.
	ImageType mImageType = ImageType::Image;
public:
	bool					mDrawn;
	std::string				mFilePath;
	int						mWidth;
	int						mHeight;

	// for image strips
	int						mNumRows; 
	int						mNumCols;

	// for animations
	AnimInfo				*mAnimInfo;

public:
	Image();
	Image(const Image& theImage);
	Image& operator=(const Image& theImage) = delete;
	// Base pointers must be released with Destroy or ImageDeleter.
	~Image();
	static void Destroy(Image* theImage) noexcept;
	MemoryImage* AsMemoryImage() noexcept;
	const MemoryImage* AsMemoryImage() const noexcept;
	DDImage* AsDDImage() noexcept;
	const DDImage* AsDDImage() const noexcept;
	ResidentImage* AsResidentImage() noexcept;
	const ResidentImage* AsResidentImage() const noexcept;

	inline int				GetCelWidth() { return mWidth / mNumCols; }
	inline int				GetCelHeight() { return mHeight / mNumRows; }
	int						GetAnimCel(int theTime); // use animinfo to return appropriate cel to draw at the time
	Rect					GetAnimCelRect(int theTime);
	Rect					GetCelRect(int theCel);				// Gets the rectangle for the given cel at the specified row/col 
	Rect					GetCelRect(int theCol, int theRow);	// Same as above, but for an image with both multiple rows and cols
	void					CopyAttributes(Image *from);
};

inline MemoryImage* AsMemoryImage(Image* image) noexcept
{
	return image ? image->AsMemoryImage() : nullptr;
}
inline const MemoryImage* AsMemoryImage(const Image* image) noexcept
{
	return image ? image->AsMemoryImage() : nullptr;
}
inline DDImage* AsDDImage(Image* image) noexcept
{
	return image ? image->AsDDImage() : nullptr;
}
inline const DDImage* AsDDImage(const Image* image) noexcept
{
	return image ? image->AsDDImage() : nullptr;
}
inline ResidentImage* AsResidentImage(Image* image) noexcept
{
	return image ? image->AsResidentImage() : nullptr;
}
inline const ResidentImage* AsResidentImage(const Image* image) noexcept
{
	return image ? image->AsResidentImage() : nullptr;
}

struct ImageDeleter
{
	void operator()(Image* image) const noexcept { Image::Destroy(image); }
};

}
