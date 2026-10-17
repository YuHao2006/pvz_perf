#include "SharedImage.h"
#include "graphics/DDImage.h"
#include "SexyAppBase.h"
#include <utility>

using namespace Sexy;

namespace
{
void SwapReferenceState(SharedImageRef& a, SharedImageRef& b) noexcept
{
	std::swap(a.mSharedImage, b.mSharedImage);
	std::swap(a.mUnsharedImage, b.mUnsharedImage);
	std::swap(a.mOwnsUnshared, b.mOwnsUnshared);
}
}

SharedImage::SharedImage()
{
	mImage = NULL;
	mRefCount = 0;
}

SharedImageRef::SharedImageRef(const SharedImageRef& theSharedImageRef)
{
	mSharedImage = theSharedImageRef.mSharedImage;
	if (mSharedImage != NULL)
		mSharedImage->mRefCount++;
	mUnsharedImage = theSharedImageRef.mUnsharedImage;	
	mOwnsUnshared = false;
}

SharedImageRef::SharedImageRef()
{
	mSharedImage = NULL;
	mUnsharedImage = NULL;
	mOwnsUnshared = false;
}

SharedImageRef::SharedImageRef(SharedImage* theSharedImage)
{
	mSharedImage = theSharedImage;
	if (theSharedImage != NULL)
		mSharedImage->mRefCount++;

	mUnsharedImage = NULL;
	mOwnsUnshared = false;
}

SharedImageRef::~SharedImageRef()
{
	Release();
}

void SharedImageRef::Release()
{
	// Detach before invoking a destructor: an image destructor may itself
	// release or rebind this reference. Do not delete it twice or erase that
	// new binding after the callback returns.
	SharedImage* aSharedImage = std::exchange(mSharedImage, nullptr);
	MemoryImage* anUnsharedImage = std::exchange(mUnsharedImage, nullptr);
	const bool ownsUnshared = std::exchange(mOwnsUnshared, false);
	if (ownsUnshared)
		Image::Destroy(anUnsharedImage);
	if (aSharedImage != nullptr)
	{
		if (--aSharedImage->mRefCount == 0)
			gSexyAppBase->mCleanupSharedImages = true;
	}
}

SharedImageRef& SharedImageRef::operator=(const SharedImageRef& theSharedImageRef)
{
	if (this == &theSharedImageRef)
		return *this;
	if (theSharedImageRef.mSharedImage == nullptr &&
		theSharedImageRef.mUnsharedImage != nullptr &&
		theSharedImageRef.mUnsharedImage == static_cast<MemoryImage*>(*this))
		return *this;
	// Acquire/snapshot the incoming view BEFORE releasing the old image;
	// the source reference can even be a member of that image.
	SharedImageRef aReplacement(theSharedImageRef);
	SwapReferenceState(*this, aReplacement);
	return *this;
}

SharedImageRef&	SharedImageRef::operator=(SharedImage* theSharedImage)
{
	if (theSharedImage != nullptr && theSharedImage == mSharedImage && mUnsharedImage == nullptr)
		return *this;
	SharedImageRef aReplacement(theSharedImage);
	SwapReferenceState(*this, aReplacement);
	return *this;
}

SharedImageRef& SharedImageRef::operator=(MemoryImage* theUnsharedImage)
{
	if (theUnsharedImage != nullptr && theUnsharedImage == static_cast<MemoryImage*>(*this))
		return *this;
	SharedImageRef aReplacement;
	aReplacement.mUnsharedImage = theUnsharedImage;
	SwapReferenceState(*this, aReplacement);
	return *this;
}

MemoryImage* SharedImageRef::operator->()
{
	return (MemoryImage*) *this;
}


SharedImageRef::operator Image*()
{	
	return (MemoryImage*) *this;
}

SharedImageRef::operator MemoryImage*()
{
	if (mUnsharedImage != NULL)
		return mUnsharedImage;
	else
		return (DDImage*) *this;
}

SharedImageRef::operator DDImage*()
{
	if (mSharedImage != NULL)
		return mSharedImage->mImage;
	else
		return NULL;
}
