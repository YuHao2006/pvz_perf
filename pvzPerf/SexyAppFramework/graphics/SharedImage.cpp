#include "SharedImage.h"
#include "graphics/Image.h"
#include "SexyAppBase.h"
#include <utility>

using namespace Sexy;

namespace
{
void SwapReferenceState(SharedImageRef& a, SharedImageRef& b) noexcept
{
	std::swap(a.mSharedImage, b.mSharedImage);
	std::swap(a.mImage, b.mImage);
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
	mImage = theSharedImageRef.mImage;
	mOwnsUnshared = false;
}

SharedImageRef::SharedImageRef()
{
	mSharedImage = NULL;
	mImage = NULL;
	mOwnsUnshared = false;
}

SharedImageRef::SharedImageRef(SharedImage* theSharedImage)
{
	mSharedImage = theSharedImage;
	if (theSharedImage != NULL)
		mSharedImage->mRefCount++;

	mImage = theSharedImage != nullptr ? theSharedImage->mImage : nullptr;
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
	Image* anImage = std::exchange(mImage, nullptr);
	const bool ownsUnshared = std::exchange(mOwnsUnshared, false);
	if (ownsUnshared)
		delete anImage;
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
	Image* incoming = theSharedImageRef.mImage;
	if (theSharedImageRef.mSharedImage == nullptr && incoming != nullptr &&
		incoming == mImage)
		return *this;
	// Acquire/snapshot the incoming view BEFORE releasing the old image;
	// the source reference can even be a member of that image.
	SharedImageRef aReplacement(theSharedImageRef);
	SwapReferenceState(*this, aReplacement);
	return *this;
}

SharedImageRef&	SharedImageRef::operator=(SharedImage* theSharedImage)
{
	if (theSharedImage != nullptr && theSharedImage == mSharedImage)
		return *this;
	SharedImageRef aReplacement(theSharedImage);
	SwapReferenceState(*this, aReplacement);
	return *this;
}

SharedImageRef& SharedImageRef::operator=(Image* theImage)
{
	if (theImage != nullptr && theImage == mImage)
		return *this;
	SharedImageRef aReplacement;
	aReplacement.mImage = theImage;
	SwapReferenceState(*this, aReplacement);
	return *this;
}

Image* SharedImageRef::operator->()
{
	return mImage;
}


SharedImageRef::operator Image*()
{	
	return mImage;
}
