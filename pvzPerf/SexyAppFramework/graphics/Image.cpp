#include "Image.h"
#include "Graphics.h"
#include "DDImage.h"
#include "ResidentImage.h"
#include <memory>

using namespace Sexy;

Image::Image()
{
	mWidth = 0;
	mHeight = 0;

	mNumRows = 1;
	mNumCols = 1;

	mAnimInfo = NULL;
	mDrawn = false;
}

Image::Image(const Image& theImage) :
	mWidth(theImage.mWidth),
	mHeight(theImage.mHeight),
	mNumRows(theImage.mNumRows),
	mNumCols(theImage.mNumCols)
{
	mDrawn = false;
	if (theImage.mAnimInfo != NULL)
		mAnimInfo = new AnimInfo(*theImage.mAnimInfo);
	else
		mAnimInfo = NULL;
}

Image::~Image()
{
	mImageType = ImageType::Image;
	delete mAnimInfo;
}

MemoryImage* Image::AsMemoryImage() noexcept
{
	return mImageType == ImageType::MemoryImage || mImageType == ImageType::DDImage
		? static_cast<MemoryImage*>(this) : nullptr;
}

const MemoryImage* Image::AsMemoryImage() const noexcept
{
	return mImageType == ImageType::MemoryImage || mImageType == ImageType::DDImage
		? static_cast<const MemoryImage*>(this) : nullptr;
}

DDImage* Image::AsDDImage() noexcept
{
	return mImageType == ImageType::DDImage ? static_cast<DDImage*>(this) : nullptr;
}

const DDImage* Image::AsDDImage() const noexcept
{
	return mImageType == ImageType::DDImage ? static_cast<const DDImage*>(this) : nullptr;
}

ResidentImage* Image::AsResidentImage() noexcept
{
	return mImageType == ImageType::ResidentImage ? static_cast<ResidentImage*>(this) : nullptr;
}

const ResidentImage* Image::AsResidentImage() const noexcept
{
	return mImageType == ImageType::ResidentImage ? static_cast<const ResidentImage*>(this) : nullptr;
}

void Image::Destroy(Image* image) noexcept
{
	if (image == nullptr)
		return;
	switch (image->mImageType)
	{
	case ImageType::DDImage: delete static_cast<DDImage*>(image); return;
	case ImageType::MemoryImage: delete static_cast<MemoryImage*>(image); return;
	case ImageType::ResidentImage: delete static_cast<ResidentImage*>(image); return;
	case ImageType::Image: delete image; return;
	}
	std::terminate();
}

Rect Image::GetCelRect(int theCel)
{
	int h = GetCelHeight();
	int w = GetCelWidth();
	int x = (theCel % mNumCols) * w;
	int y = (theCel / mNumCols) * h;

	return Rect(x, y, w, h);
}

Rect Image::GetCelRect(int theCol, int theRow)
{
	int h = GetCelHeight();
	int w = GetCelWidth();
	int x = theCol * w;
	int y = theRow * h;

	return Rect(x, y, w, h);
}

AnimInfo::AnimInfo()
{
	mAnimType = AnimType_None;
	mFrameDelay = 1;
	mNumCels = 1;
}

void AnimInfo::SetPerFrameDelay(int theFrame, int theTime)
{
	if ((int)mPerFrameDelay.size()<=theFrame)
		mPerFrameDelay.resize(theFrame+1);

	mPerFrameDelay[theFrame] = theTime;
}

void AnimInfo::Compute(int theNumCels, int theBeginFrameTime, int theEndFrameTime)
{
	int i;

	mNumCels = theNumCels;
	if (mNumCels<=0)
		mNumCels = 1;

	if (mFrameDelay<=0)
		mFrameDelay = 1;

	if (mAnimType==AnimType_PingPong && mNumCels>1)
	{
		mFrameMap.resize(theNumCels*2-2);
		int index = 0;
		for (i=0; i<theNumCels; i++)
			mFrameMap[index++] = i;
		for (i=theNumCels-2; i>=1; i--)
			mFrameMap[index++] = i;
	}

	if (!mFrameMap.empty())
		mNumCels = (int)mFrameMap.size();

	if (theBeginFrameTime>0) 
		SetPerFrameDelay(0,theBeginFrameTime);

	if (theEndFrameTime>0)
		SetPerFrameDelay(mNumCels-1,theEndFrameTime);

	if (!mPerFrameDelay.empty())
	{
		mTotalAnimTime = 0;
		mPerFrameDelay.resize(mNumCels);

		for (i=0; i<mNumCels; i++)
		{
			if (mPerFrameDelay[i]<=0)
				mPerFrameDelay[i] = mFrameDelay;
				
			mTotalAnimTime += mPerFrameDelay[i];
		}
	}
	else
		mTotalAnimTime = mFrameDelay*mNumCels;

	if (!mFrameMap.empty())
		mFrameMap.resize(mNumCels);
}
	
int AnimInfo::GetPerFrameCel(int theTime)
{
	for (int i=0; i<mNumCels; i++)
	{
		theTime -= mPerFrameDelay[i];
		if (theTime<0)
			return i;
	}

	return mNumCels-1;
}



int AnimInfo::GetCel(int theTime)
{
	if (mAnimType==AnimType_Once && theTime>=mTotalAnimTime)
	{
		if (!mFrameMap.empty())
			return mFrameMap[mFrameMap.size()-1];
		else
			return mNumCels-1;
	}

	theTime = theTime%mTotalAnimTime;

	int aFrame;
	if (!mPerFrameDelay.empty())
		aFrame = GetPerFrameCel(theTime);
	else
		aFrame = (theTime/mFrameDelay)%mNumCels;

	if (mFrameMap.empty())
		return aFrame;
	else
		return mFrameMap[aFrame];	
}

int	Image::GetAnimCel(int theTime)
{
	if (mAnimInfo==NULL)
		return 0;
	else
		return mAnimInfo->GetCel(theTime);
}

Rect Image::GetAnimCelRect(int theTime)
{
	Rect aRect;
	int aCel = GetAnimCel(theTime);
	int aCelWidth = GetCelWidth();
	int aCelHeight = GetCelHeight();
	if (mNumCols>1)
		return Rect(aCel*aCelWidth,0,aCelWidth,mHeight);
	else
		return Rect(0,aCel*aCelHeight,mWidth,aCelHeight);
}

void Image::CopyAttributes(Image *from)
{
	if (from == this)
		return;
	std::unique_ptr<AnimInfo> aAnimInfo;
	if (from->mAnimInfo != nullptr)
		aAnimInfo = std::make_unique<AnimInfo>(*from->mAnimInfo);

	mNumCols = from->mNumCols;
	mNumRows = from->mNumRows;
	delete mAnimInfo;
	mAnimInfo = aAnimInfo.release();
}

