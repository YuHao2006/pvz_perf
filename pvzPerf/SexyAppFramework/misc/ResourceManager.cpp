#include <memory>
#include "ResourceManager.h"
#include "Buffer.h"
#include <zlib.h>
#include <cstring>
#include <cmath>
#include "sound/SoundManager.h"
#include "graphics/DDImage.h"
#include "graphics/DDInterface.h"
#include "graphics/RenderInterface.h"
#include "graphics/ImageFont.h"
#include "imagelib/ImageLib.h"

//#define SEXY_PERF_ENABLED
#include "PerfTimer.h"

using namespace Sexy;

// Game image preparation hook; dynamic descriptors are known numerically.
void TodMarkImageForSanding(Sexy::Image* theImage);

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
void ResourceManager::ImageRes::DeleteResource()
{	
	mImage.Release();
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
void ResourceManager::SoundRes::DeleteResource()
{
	if (mSoundId >= 0)
		gSexyAppBase->mSoundManager->ReleaseSound(mSoundId);

	mSoundId = -1;
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
void ResourceManager::FontRes::DeleteResource()
{
	delete mFont;
	mFont = NULL;

	Image::Destroy(mImage);
	mImage = NULL;
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
ResourceManager::ResourceManager(SexyAppBase *theApp) 
{
	mApp = theApp;
	mAllowAlreadyDefinedResources = false;
	mCurResGroupList = NULL;
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
ResourceManager::~ResourceManager()
{
	DeleteResourceDescriptors();
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
bool ResourceManager::IsGroupLoaded(ResourceGroupId theGroup)
{
	if (IsCanonicalResourceGroupId(theGroup))
		return mLoadedGroups.test(static_cast<unsigned>(theGroup));
	return false;
}

ResourceManager::ResList* ResourceManager::GetResGroupList(ResourceGroupId theGroup, bool theCreate)
{
	if (IsCanonicalResourceGroupId(theGroup))
	{
		const auto anId = static_cast<unsigned>(theGroup);
		if (theCreate)
			mResGroupPresent.set(anId);
		return mResGroupPresent.test(anId) ? &mResGroupMap[anId] : nullptr;
	}
	return nullptr;
}

void ResourceManager::SetGroupLoaded(ResourceGroupId theGroup, bool theLoaded)
{
	if (IsCanonicalResourceGroupId(theGroup))
		mLoadedGroups.set(static_cast<unsigned>(theGroup), theLoaded);
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
void ResourceManager::DeleteResourceDescriptors()
{
	// Keep the original image/sound/font release order, each in slot order.
	for (ResType aType : { ResType_Image, ResType_Sound, ResType_Font })
	{
		for (BaseRes*& aRes : mResourceSlots)
			if (aRes != nullptr && aRes->mType == aType)
			{
				aRes->DeleteResource();
				delete aRes;
				aRes = nullptr;
			}
	}
	mImageSlots.fill(nullptr);
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
void ResourceManager::DeleteResources(ResType theType, ResourceGroupId theGroup)
{
	for (BaseRes* aRes : mResourceSlots)
		if (aRes != nullptr && aRes->mType == theType && aRes->mResGroup == theGroup)
			aRes->DeleteResource();
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
void ResourceManager::DeleteResources()
{
	for (ResType aType : { ResType_Image, ResType_Sound, ResType_Font })
	{
		for (BaseRes* aRes : mResourceSlots)
			if (aRes != nullptr && aRes->mType == aType)
				aRes->DeleteResource();
	}
	mLoadedGroups.reset();
}

void ResourceManager::DeleteResources(ResourceGroupId theGroup)
{
	DeleteResources(ResType_Image,theGroup);
	DeleteResources(ResType_Sound,theGroup);
	DeleteResources(ResType_Font,theGroup);
	SetGroupLoaded(theGroup, false);
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
void ResourceManager::DeleteExtraImageBuffers()
{
	for (BaseRes* aBase : mResourceSlots)
	{
		if (aBase == nullptr || aBase->mType != ResType_Image)
			continue;
		ImageRes* aRes = static_cast<ImageRes*>(aBase);
		if (MemoryImage* anImage = aRes->mImage)
			anImage->DeleteExtraBuffers();
	}
}

void ResourceManager::DeleteExtraImageBuffers(ResourceGroupId theGroup)
{
	for (BaseRes* aBase : mResourceSlots)
	{
		if (aBase != nullptr && aBase->mType == ResType_Image && aBase->mResGroup == theGroup)
		{
			ImageRes *aRes = static_cast<ImageRes*>(aBase);
			MemoryImage *anImage = (MemoryImage*)aRes->mImage;
			if (anImage != NULL)
				anImage->DeleteExtraBuffers();
		}
	}
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
bool ResourceManager::HadError() const noexcept
{
	return mError.reason != ResourceFailure::None;
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
bool ResourceManager::Fail(ResourceError theError)
{
	if (!HadError())
		mError = theError;
	return false;
}

bool ResourceManager::Fail(ResourceFailure theReason, unsigned theSlot, unsigned theValue, size_t theOffset)
{
	return Fail(ResourceError{theReason,theSlot,theValue,theOffset});
}

// Numeric resource record reader. Included by ResourceManager.cpp.
namespace
{
class NumericResourceReader
{
public:
    const unsigned char* data;
    size_t size, pos = 0;
    bool valid = true;
    NumericResourceReader(const unsigned char* bytes, size_t length) : data(bytes), size(length) {}
    const unsigned char* Take(size_t length)
    {
        if (!valid || length > size - pos) { valid = false; return nullptr; }
        const auto* result = data + pos;
        pos += length;
        return result;
    }
    unsigned U32()
    {
        const auto* p = Take(4);
        return p ? unsigned(p[0]) | (unsigned(p[1]) << 8) | (unsigned(p[2]) << 16) | (unsigned(p[3]) << 24) : 0;
    }
    int I32() { return static_cast<int>(U32()); }
    double F64()
    {
        double value = 0;
        if (const auto* p = Take(8)) std::memcpy(&value, p, 8);
        return value;
    }
    std::string Path()
    {
        const unsigned length = U32();
        if (length > 4096) { valid = false; return {}; }
        const auto* p = Take(length);
        if (!p) return {};
        if (std::memchr(p, 0, length) != nullptr) { valid = false; return {}; }
        return std::string(reinterpret_cast<const char*>(p), length);
    }
    std::vector<int> IntVector()
    {
        const unsigned count = U32();
        if (count > 16384 || count > (size - pos) / 4) { valid = false; return {}; }
        std::vector<int> result;
        result.reserve(count);
        for (unsigned i = 0; i < count; ++i) result.push_back(I32());
        return result;
    }
    bool Complete() const { return valid && pos == size; }
};
}

bool ResourceManager::ParseNumericResourcesFile(const std::string& theFilename)
{
    mError = {};
    Buffer buffer;
    if (!mApp->ReadBufferFromFile(theFilename, &buffer, true))
        return Fail(ResourceFailure::ManifestMissing);
    NumericResourceReader input(buffer.GetDataPtr(), static_cast<size_t>(buffer.GetDataLen()));
    const unsigned magic = input.U32(), version = input.U32();
    const unsigned baseCount = input.U32(), symbolCount = input.U32();
    const unsigned slotCount = input.U32(), recordCount = input.U32();
    const unsigned registryCrc = input.U32(), payloadCrc = input.U32(), payloadBytes = input.U32();
    if (!input.valid || magic != 0x4353524Eu || version != 1 || baseCount != unsigned(ResourceId::RESOURCE_ID_MAX) ||
        symbolCount != std::size(gImageSymbolResourceSlots) ||
        slotCount != NUMERIC_RESOURCE_SLOT_COUNT || recordCount != slotCount ||
        registryCrc != IMAGE_SYMBOL_REGISTRY_CRC || payloadBytes != input.size - input.pos)
        return Fail(ResourceFailure::ManifestHeader,RESOURCE_SLOT_NONE,magic,input.pos);
    const unsigned actualCrc=crc32(0, input.data + input.pos, payloadBytes);
    if (actualCrc != payloadCrc)
        return Fail(ResourceFailure::ManifestChecksum,RESOURCE_SLOT_NONE,actualCrc,input.pos);

    std::vector<std::unique_ptr<BaseRes>> owned;
    owned.reserve(recordCount);
    ResourceSlots slots{};
    ImageSlots imageSlots{};
    ResGroupMap groups;
    ResGroupBits groupPresent;
    for (unsigned record = 0; record < recordCount; ++record)
    {
        const unsigned length = input.U32();
        const auto* bytes = input.Take(length);
        if (!bytes) return Fail(ResourceFailure::DescriptorTruncated,RESOURCE_SLOT_NONE,record,input.pos);
        NumericResourceReader r(bytes, length);
        const unsigned slot = r.U32(), symbol = r.U32(), group = r.U32(), type = r.U32();
        const unsigned flags = r.U32(), reference = r.U32(), variant = r.U32();
        if (!r.valid || slot >= slotCount || slots[slot] != nullptr || type > ResType_Font || flags > 16383 ||
            type != ResourceKindForSlot(slot) ||
            (group != 0 && !IsCanonicalResourceGroupId(static_cast<ResourceGroupId>(group))) ||
            (slot < baseCount && group == 0) || (slot >= baseCount && (group != 0 || type != ResType_Image)) ||
            (type == ResType_Image &&
                ((symbol == 0 && slot != static_cast<unsigned>(ResourceId::IMAGE_PARTNER_LOGO_ID)) ||
                 (symbol != 0 && (symbol >= symbolCount || imageSlots[symbol] != nullptr ||
                    ResourceSlotForImageSymbol(symbol) != slot)))) || (type != ResType_Image && symbol != 0) ||
            (reference != RESOURCE_SLOT_NONE && (type != ResType_Font || reference >= slotCount)))
            return Fail(ResourceFailure::DescriptorIdentity,slot,symbol,input.pos-length+r.pos);
        std::unique_ptr<BaseRes> descriptor;
        if (type == ResType_Image) descriptor = std::make_unique<ImageRes>();
        else if (type == ResType_Sound) descriptor = std::make_unique<SoundRes>();
        else descriptor = std::make_unique<FontRes>();
        BaseRes* res = descriptor.get();
        res->mId = slot;
        res->mImageSymbol = symbol;
        res->mResGroup = static_cast<ResourceGroupId>(group);
        res->mFromProgram = (flags & 1) != 0;
        res->mUnavailable = (flags & 8192) != 0;
        res->mPath = r.Path();
        const std::string alpha = r.Path(), alphaGrid = r.Path(), fontImage = r.Path();
        if (!res->mFromProgram && !res->mUnavailable && res->mPath.empty() && reference == RESOURCE_SLOT_NONE)
            return Fail(ResourceFailure::DescriptorPath,slot,0,input.pos-length+r.pos);
        if (type == ResType_Image)
        {
            ImageRes* image = static_cast<ImageRes*>(res);
            image->mAlphaImage = alpha;
            image->mAlphaGridImage = alphaGrid;
            image->mVariant = variant;
            image->mPalletize = (flags & 16) != 0;
            image->mA4R4G4B4 = (flags & 32) != 0;
            image->mA8R8G8B8 = (flags & 64) != 0;
            image->mDDSurface = (flags & 128) != 0;
            image->mPurgeBits = (flags & 256) != 0 || (mApp->mDDInterface->mIs3D ? (flags & 2048) != 0 : (flags & 4096) != 0);
            image->mMinimizeSubdivisions = (flags & 512) != 0;
            image->mAutoFindAlpha = (flags & 1024) != 0;
            image->mRows = r.I32();
            image->mCols = r.I32();
            image->mAlphaColor = r.U32();
            const unsigned animType = r.U32();
            image->mAnimInfo.mFrameDelay = r.I32();
            const int beginDelay = r.I32(), endDelay = r.I32();
            image->mAnimInfo.mPerFrameDelay = r.IntVector();
            image->mAnimInfo.mFrameMap = r.IntVector();
            if (image->mRows <= 0 || image->mCols <= 0 || animType > 3 ||
                (animType != 0 && std::max(image->mRows, image->mCols) > 16384))
                return Fail(ResourceFailure::ImageGrid,slot,animType,input.pos-length+r.pos);
            image->mAnimInfo.mAnimType = static_cast<AnimType>(animType);
            if (animType != 0) image->mAnimInfo.Compute(std::max(image->mRows, image->mCols), beginDelay, endDelay);
            if (symbol != 0) imageSlots[symbol] = image;
        }
        else if (type == ResType_Sound)
        {
            SoundRes* sound = static_cast<SoundRes*>(res);
            sound->mVolume = r.F64();
            sound->mPanning = r.I32();
            if (!std::isfinite(sound->mVolume))
                return Fail(ResourceFailure::SoundVolume,slot,0,input.pos-length+r.pos);
        }
        else
        {
            FontRes* font = static_cast<FontRes*>(res);
            font->mImagePath = fontImage;
            font->mReferenceId = reference;
            if ((flags & 2) != 0)
                return Fail(ResourceFailure::SystemFont,slot,flags,input.pos-length+r.pos);
            font->mSize = r.I32();
            const unsigned style = r.U32();
            font->mBold = (style & 1) != 0;
            font->mItalic = (style & 2) != 0;
            font->mUnderline = (style & 4) != 0;
            font->mShadow = (style & 8) != 0;
            for (int tag : r.IntVector())
            {
                if (tag <= 0)
                    return Fail(ResourceFailure::FontTag,slot,static_cast<unsigned>(tag),input.pos-length+r.pos);
                font->mTagIds.push_back(static_cast<unsigned>(tag));
            }
            if (style > 15)
                return Fail(ResourceFailure::FontStyle,slot,style,input.pos-length+r.pos);
        }
        if (!r.Complete())
            return Fail(ResourceFailure::DescriptorLength,slot,length,input.pos-length+r.pos);
        slots[slot] = res;
        if (group != 0)
        {
            groups[group].push_back(res);
            groupPresent.set(group);
        }
        owned.push_back(std::move(descriptor));
    }
    if (!input.Complete())
        return Fail(ResourceFailure::ManifestTrailing,RESOURCE_SLOT_NONE,0,input.pos);
    for (unsigned slot=0;slot<slots.size();++slot)
        if (slots[slot] == nullptr) return Fail(ResourceFailure::MissingSlot,slot,0,input.pos);
    for (unsigned symbol = 1; symbol < symbolCount; ++symbol)
        if (imageSlots[symbol] == nullptr)
            return Fail(ResourceFailure::MissingSymbol,RESOURCE_SLOT_NONE,symbol,input.pos);
    for (BaseRes* res : slots)
    {
        if (res->mType != ResType_Font) continue;
        FontRes* font = static_cast<FontRes*>(res);
        if (font->mReferenceId != RESOURCE_SLOT_NONE &&
            slots[font->mReferenceId]->mType != ResType_Font)
            return Fail(ResourceFailure::FontReferenceType,res->mId,font->mReferenceId,input.pos);
    }
    // Publish all indexes together after every bounded descriptor has validated.
    DeleteResourceDescriptors();
    mResourceSlots.swap(slots);
    mImageSlots.swap(imageSlots);
    mResGroupMap.swap(groups);
    mResGroupPresent = groupPresent;
    mLoadedGroups.reset();
    mCurResGroupList = nullptr;
    mCurResGroup = ResourceGroupId::Invalid;
    for (auto& res : owned) res.release();
    return true;
}

bool ResourceManager::ParseResourcesFile(const std::string& theFilename)
{
	return ParseNumericResourcesFile(theFilename);
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
bool ResourceManager::ReparseResourcesFile(const std::string& theFilename)
{
	struct RestoreDefinedPolicy
	{
		bool& target;
		bool previous;
		~RestoreDefinedPolicy() { target = previous; }
	} aRestorePolicy{mAllowAlreadyDefinedResources, mAllowAlreadyDefinedResources};
	mAllowAlreadyDefinedResources = true;
	return ParseResourcesFile(theFilename);
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
bool ResourceManager::LoadAlphaGridImage(ImageRes *theRes, DDImage *theImage)
{	
	ImageLib::Image* anAlphaImage = ImageLib::GetImage(theRes->mAlphaGridImage,true);	
	if (anAlphaImage==NULL)
		return Fail(ResourceFailure::AlphaGridMissing,theRes->mId);

	std::unique_ptr<ImageLib::Image> aDelAlphaImage(anAlphaImage);

	int aNumRows = theRes->mRows;
	int aNumCols = theRes->mCols;
	if (aNumRows<=0 || aNumCols<=0)
		throw ResourceManagerException({ResourceFailure::ImageGrid,theRes->mId});

	int aCelWidth = theImage->mWidth/aNumCols;
	int aCelHeight = theImage->mHeight/aNumRows;


	if (anAlphaImage->mWidth!=aCelWidth || anAlphaImage->mHeight!=aCelHeight)
		return Fail(ResourceFailure::AlphaGridSize,theRes->mId);

	theImage->AppendAlphaImage(std::move(aDelAlphaImage),aNumCols,aNumRows);
	return true;
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
bool ResourceManager::LoadAlphaImage(ImageRes *theRes, DDImage *theImage)
{
	SEXY_PERF_BEGIN(PerfKind::ResourceManagerAlphaGetImage);
	ImageLib::Image* anAlphaImage = ImageLib::GetImage(theRes->mAlphaImage,true);
	SEXY_PERF_END(PerfKind::ResourceManagerAlphaGetImage);

	if (anAlphaImage==NULL)
		return Fail(ResourceFailure::AlphaMissing,theRes->mId);

	std::unique_ptr<ImageLib::Image> aDelAlphaImage(anAlphaImage);

	if (anAlphaImage->mWidth!=theImage->mWidth || anAlphaImage->mHeight!=theImage->mHeight)
		return Fail(ResourceFailure::AlphaSize,theRes->mId);

	theImage->AppendAlphaImage(std::move(aDelAlphaImage),1,1);
	return true;
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
bool ResourceManager::DoLoadImage(ImageRes *theRes)
{
	const bool lookForAlpha = theRes->mAlphaImage.empty() &&
		theRes->mAlphaGridImage.empty() && theRes->mAutoFindAlpha;

	SEXY_PERF_BEGIN(PerfKind::ResourceManagerGetImage);

	const auto prepare = [&](DDImage* aDDImage) -> bool
	{
		if (!theRes->mAlphaImage.empty())
		{
			if (!LoadAlphaImage(theRes, aDDImage))
				return false;
		}

		if (!theRes->mAlphaGridImage.empty())
		{
			if (!LoadAlphaGridImage(theRes, aDDImage))
				return false;
		}

		aDDImage->CommitBits();
		// Upload snapshots own their bytes; no renderer consumes retained CPU pixels.
		aDDImage->mPurgeBits = true;

		if (theRes->mDDSurface)
		{
			SEXY_PERF_BEGIN(PerfKind::ResourceManagerDDSurface);

			aDDImage->CommitBits();

			if (!aDDImage->mHasAlpha)
				aDDImage->mPurgeBits = true;

			SEXY_PERF_END(PerfKind::ResourceManagerDDSurface);
		}

		if (theRes->mAnimInfo.mAnimType != AnimType_None)
			aDDImage->mAnimInfo = new AnimInfo(theRes->mAnimInfo);

		aDDImage->mNumRows = theRes->mRows;
		aDDImage->mNumCols = theRes->mCols;

		TodMarkImageForSanding(aDDImage);
		return true;
	};
	SharedImageRef aSharedImageRef;
	try
	{
		ImageLib::ScopedAlphaComposeColor color(theRes->mAlphaColor);
		aSharedImageRef = mApp->GetPreparedSharedImage(theRes->mPath, theRes->mVariant, nullptr,
			[&](DDImage* image)
			{
				// Original explicit alpha-image processing uses the default
				// compose color, not the automatic-alpha tint used by GetImage.
				ImageLib::ScopedAlphaComposeColor explicitAlpha(0xFFFFFF);
				if (!prepare(image))
					throw ResourceManagerException(mError);
			}, lookForAlpha);
	}
	catch (const ResourceManagerException& error)
	{
		return Fail(error.error);
	}
	DDImage* aDDImage = static_cast<DDImage*>(aSharedImageRef);
	if (aDDImage == nullptr)
		return Fail(ResourceFailure::ImageMissing,theRes->mId);
	theRes->mImage = aSharedImageRef;

	ResourceLoadedHook(theRes);
	return true;
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
void ResourceManager::DeleteImage(unsigned theName)
{
	ReplaceImage(theName,NULL);
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
SharedImageRef ResourceManager::LoadImage(unsigned theId)
{
	BaseRes* base = GetResourceBySlot(theId);
	if (base == nullptr || base->mType != ResType_Image) return nullptr;
	ImageRes* res = static_cast<ImageRes*>(base);
	if ((DDImage*)res->mImage != nullptr) return res->mImage;
	if (res->mFromProgram || res->mUnavailable || !DoLoadImage(res)) return nullptr;
	return res->mImage;
}

bool ResourceManager::DoLoadSound(SoundRes* theRes)
{
	SoundRes *aRes = theRes;

	SEXY_PERF_BEGIN(PerfKind::ResourceManagerLoadSound);
	int aSoundId = mApp->mSoundManager->GetFreeSoundId();
	if (aSoundId<0)
		return Fail(ResourceFailure::SoundSlotsExhausted,theRes->mId);

	if(!mApp->mSoundManager->LoadSound(aSoundId, aRes->mPath))
		return Fail(ResourceFailure::SoundMissing,aRes->mId);
	SEXY_PERF_END(PerfKind::ResourceManagerLoadSound);

	if (aRes->mVolume >= 0)
		mApp->mSoundManager->SetBaseVolume(aSoundId, aRes->mVolume);

	if (aRes->mPanning != 0)
		mApp->mSoundManager->SetBasePan(aSoundId, aRes->mPanning);

	aRes->mSoundId = aSoundId;

	ResourceLoadedHook(theRes);
	return true;
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
bool ResourceManager::DoLoadFont(FontRes* theRes)
{
	std::unique_ptr<_Font> aFont;

	SEXY_PERF_BEGIN(PerfKind::ResourceManagerDoLoadFont);

	if (theRes->mImagePath.empty())
	{
		if (theRes->mReferenceId != RESOURCE_SLOT_NONE)
		{
			_Font* aRefFont = LoadFontByResourceSlot(theRes->mReferenceId);
			if (aRefFont == nullptr)
				return Fail(ResourceFailure::FontReferenceMissing,theRes->mId,theRes->mReferenceId);
			aFont.reset(aRefFont->Duplicate());
		}
		else
			aFont = std::make_unique<ImageFont>(mApp, theRes->mPath);
	}
	else
	{
#if defined(SEXY_FONT_TEXT_COMPAT_TEST_ONLY)
		Image *anImage = mApp->GetImage(theRes->mImagePath);
		if (anImage==NULL)
			return Fail(ResourceFailure::ImageMissing,theRes->mId);

		theRes->mImage = anImage;
		aFont = std::make_unique<ImageFont>(anImage, theRes->mPath);
#else
		return Fail(ResourceFailure::FontDescriptorRequired,theRes->mId);
#endif
	}

	ImageFont *anImageFont = dynamic_cast<ImageFont*>(aFont.get());
	if (anImageFont!=NULL)
	{
		if (anImageFont->mFontData==NULL || !anImageFont->mFontData->mInitialized)
		{
			aFont.reset();
			return Fail(ResourceFailure::FontMissing,theRes->mId);
		}

		if (!theRes->mTagIds.empty())
		{
			for (unsigned aTag : theRes->mTagIds)
				if (!anImageFont->AddTagNumeric(aTag))
					return Fail(ResourceFailure::FontTagDuplicate,theRes->mId,aTag);
			anImageFont->Prepare();
		}
	}

	theRes->mFont = aFont.release();

	SEXY_PERF_END(PerfKind::ResourceManagerDoLoadFont);

	ResourceLoadedHook(theRes);
	return true;
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
_Font* ResourceManager::LoadFont(unsigned theId)
{
	BaseRes* base = GetResourceBySlot(theId);
	if (base == nullptr || base->mType != ResType_Font) return nullptr;
	FontRes* res = static_cast<FontRes*>(base);
	if (res->mFont != nullptr) return res->mFont;
	if (res->mFromProgram || res->mUnavailable) return nullptr;
	if (res->mLoading)
	{
		Fail(ResourceFailure::FontReferenceCycle,theId);
		return nullptr;
	}
	struct LoadingGuard { bool& value; ~LoadingGuard() { value = false; } } guard{res->mLoading};
	res->mLoading = true;
	return DoLoadFont(res) ? res->mFont : nullptr;
}

void ResourceManager::DeleteFont(unsigned theName)
{
	ReplaceFont(theName,NULL);
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
bool ResourceManager::LoadNextResource()
{
	if (HadError())
		return false;

	if (mCurResGroupList==NULL)
		return false;

	while (mCurResGroupListItr!=mCurResGroupList->end())
	{
		BaseRes *aRes = *mCurResGroupListItr++;
		if (aRes->mFromProgram)
			continue;

		switch (aRes->mType)
		{
			case ResType_Image: 
			{
				ImageRes *anImageRes = (ImageRes*)aRes;
				if ((DDImage*)anImageRes->mImage!=NULL)
					continue;

				return DoLoadImage(anImageRes); 
			}
			
			case ResType_Sound: 
			{
				SoundRes *aSoundRes = (SoundRes*)aRes;
				if (aSoundRes->mSoundId!=-1)
					continue;

				return DoLoadSound(aSoundRes); 
			}
			
			case ResType_Font: 
			{
				FontRes *aFontRes = (FontRes*)aRes;
				if (aFontRes->mFont!=NULL)
					continue;

				return DoLoadFont(aFontRes);
			}
		}
	}

	return false;
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

void ResourceManager::ResourceLoadedHook(BaseRes*){}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
void ResourceManager::StartLoadResources(ResourceGroupId theGroup)
{
	mError = {};

	mCurResGroup = theGroup;
	if (theGroup == ResourceGroupId::Invalid)
	{
		mCurResGroupList = nullptr;
		Fail(ResourceFailure::InvalidGroup,RESOURCE_SLOT_NONE,0);
		return;
	}
	mCurResGroupList = GetResGroupList(theGroup, true);
	if (mCurResGroupList == nullptr)
	{
		Fail(ResourceFailure::InvalidGroup,RESOURCE_SLOT_NONE,static_cast<unsigned>(theGroup));
		return;
	}
	mCurResGroupListItr = mCurResGroupList->begin();
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
bool ResourceManager::LoadResources(ResourceGroupId theGroup)
{
	StartLoadResources(theGroup);
	while (LoadNextResource())
	{
	}

	if (!HadError())
	{
		SetGroupLoaded(theGroup);
		return true;
	}
	else
		return false;
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
int ResourceManager::GetNumResources(ResType theType)
{
	int aCount = 0;
	for (BaseRes* aRes : mResourceSlots)
		if (aRes != nullptr && aRes->mType == theType)
			++aCount;
	return aCount;
}

int ResourceManager::GetNumImages() { return GetNumResources(ResType_Image); }
int ResourceManager::GetNumSounds() { return GetNumResources(ResType_Sound); }
int ResourceManager::GetNumFonts() { return GetNumResources(ResType_Font); }
int ResourceManager::GetNumResources()
{
	int aCount = 0;
	for (BaseRes* aRes : mResourceSlots)
		if (aRes != nullptr)
			++aCount;
	return aCount;
}

int ResourceManager::GetNumResources(ResourceGroupId theGroup, ResType theType)
{
	int aCount = 0;
	for (BaseRes* aRes : mResourceSlots)
		if (aRes != nullptr && aRes->mType == theType && aRes->mResGroup == theGroup && !aRes->mFromProgram)
			++aCount;
	return aCount;
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
int	ResourceManager::GetNumImages(ResourceGroupId theGroup)
{
	return GetNumResources(theGroup, ResType_Image);
}
	
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
int	ResourceManager::GetNumSounds(ResourceGroupId theGroup)
{
	return GetNumResources(theGroup, ResType_Sound);
}
	
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
int ResourceManager::GetNumFonts(ResourceGroupId theGroup)
{
	return GetNumResources(theGroup, ResType_Font);
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
int	ResourceManager::GetNumResources(ResourceGroupId theGroup)
{
	return GetNumImages(theGroup) + GetNumSounds(theGroup) + GetNumFonts(theGroup);
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
void ResourceManager::NoteImageSlot(ImageRes* theRes)
{
	if (theRes->mImageSymbol == 0)
		return;
	if (theRes->mImageSymbol >= mImageSlots.size() ||
		ResourceSlotForImageSymbol(theRes->mImageSymbol) != theRes->mId ||
		(mImageSlots[theRes->mImageSymbol] != nullptr && mImageSlots[theRes->mImageSymbol] != theRes))
		throw ResourceManagerException({ResourceFailure::ImageSymbolBinding,theRes->mId,theRes->mImageSymbol});
	mImageSlots[theRes->mImageSymbol] = theRes;
}

void ResourceManager::AttachImageSlots(unsigned theCount)
{
	if (static_cast<size_t>(theCount) + 1 != mImageSlots.size())
		throw ResourceManagerException({ResourceFailure::ImageSymbolCount,RESOURCE_SLOT_NONE,theCount});
	mImageSlots.fill(nullptr);
	for (BaseRes* aRes : mResourceSlots)
		if (aRes != nullptr && aRes->mType == ResType_Image)
			NoteImageSlot(static_cast<ImageRes*>(aRes));
}

ResourceManager::BaseRes* ResourceManager::GetResourceBySlot(unsigned theSlot) const
{
	if (theSlot < mResourceSlots.size())
		return mResourceSlots[theSlot];
	return nullptr;
}

ResourceManager::ImageRes* ResourceManager::GetImageResBySlot(unsigned theSymbol) const
{
	return theSymbol != 0 && theSymbol < mImageSlots.size() ? mImageSlots[theSymbol] : nullptr;
}

SharedImageRef ResourceManager::LoadImageBySlot(unsigned theSymbol)
{
	ImageRes* res = GetImageResBySlot(theSymbol);
	return res == nullptr ? SharedImageRef() : LoadImage(res->mId);
}

_Font* ResourceManager::LoadFontByResourceSlot(unsigned theSlot)
{
	return LoadFont(theSlot);
}

int ResourceManager::LoadSound(unsigned theId)
{
	BaseRes* base = GetResourceBySlot(theId);
	if (base == nullptr || base->mType != ResType_Sound) return -1;
	SoundRes* res = static_cast<SoundRes*>(base);
	if (res->mSoundId != -1) return res->mSoundId;
	if (res->mFromProgram || res->mUnavailable || !DoLoadSound(res)) return -1;
	return res->mSoundId;
}

SharedImageRef ResourceManager::GetImage(unsigned theId)
{
	BaseRes* res = GetResourceBySlot(theId);
	return res != nullptr && res->mType == ResType_Image ? static_cast<ImageRes*>(res)->mImage : SharedImageRef();
}

int ResourceManager::GetSound(unsigned theId)
{
	BaseRes* res = GetResourceBySlot(theId);
	return res != nullptr && res->mType == ResType_Sound ? static_cast<SoundRes*>(res)->mSoundId : -1;
}

_Font* ResourceManager::GetFont(unsigned theId)
{
	BaseRes* res = GetResourceBySlot(theId);
	return res != nullptr && res->mType == ResType_Font ? static_cast<FontRes*>(res)->mFont : nullptr;
}

SharedImageRef ResourceManager::GetImageThrow(unsigned theId)
{
	BaseRes* aBase = GetResourceBySlot(theId);
	if (aBase != nullptr && aBase->mType == ResType_Image)
	{
		ImageRes *aRes = static_cast<ImageRes*>(aBase);
		if ((MemoryImage*) aRes->mImage != NULL)
			return aRes->mImage;

	}


	Fail(ResourceFailure::ImageNotLoaded,theId);
	throw ResourceManagerException(mError);
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
int	ResourceManager::GetSoundThrow(unsigned theId)
{
	BaseRes* aBase = GetResourceBySlot(theId);
	if (aBase != nullptr && aBase->mType == ResType_Sound)
	{
		SoundRes *aRes = static_cast<SoundRes*>(aBase);
		if (aRes->mSoundId!=-1)
			return aRes->mSoundId;

	}


	Fail(ResourceFailure::SoundNotLoaded,theId);
	throw ResourceManagerException(mError);
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
_Font* ResourceManager::GetFontThrow(unsigned theId)
{
	BaseRes* aBase = GetResourceBySlot(theId);
	if (aBase != nullptr && aBase->mType == ResType_Font)
	{
		FontRes *aRes = static_cast<FontRes*>(aBase);
		if (aRes->mFont!=NULL)
			return aRes->mFont;

	}

	Fail(ResourceFailure::FontNotLoaded,theId);
	throw ResourceManagerException(mError);
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
bool ResourceManager::ReplaceImage(unsigned theId, Image *theImage)
{
	BaseRes* aBase = GetResourceBySlot(theId);
	if (aBase != nullptr && aBase->mType == ResType_Image)
	{
		ImageRes* anImageRes = static_cast<ImageRes*>(aBase);
		if (theImage != nullptr && static_cast<Image*>(anImageRes->mImage) == theImage)
		{
			// ReplaceImage adopts raw replacements. Keep that contract even
			// for an existing borrowed view, but never create a second owner
			// for an image already held through the shared cache.
			if (anImageRes->mImage.mSharedImage == nullptr)
				anImageRes->mImage.mOwnsUnshared = true;
			return true;
		}
		anImageRes->DeleteResource();
		anImageRes->mImage = static_cast<MemoryImage*>(theImage);
		anImageRes->mImage.mOwnsUnshared = theImage != nullptr;
		return true;
	}
	else
		return false;
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
bool ResourceManager::ReplaceSound(unsigned theId, int theSound)
{
	BaseRes* aBase = GetResourceBySlot(theId);
	if (aBase != nullptr && aBase->mType == ResType_Sound)
	{
		aBase->DeleteResource();
		static_cast<SoundRes*>(aBase)->mSoundId = theSound;
		return true;
	}
	else
		return false;
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
bool ResourceManager::ReplaceFont(unsigned theId, _Font *theFont)
{
	BaseRes* aBase = GetResourceBySlot(theId);
	if (aBase != nullptr && aBase->mType == ResType_Font)
	{
		aBase->DeleteResource();
		static_cast<FontRes*>(aBase)->mFont = theFont;
		return true;
	}
	else
		return false;
}
