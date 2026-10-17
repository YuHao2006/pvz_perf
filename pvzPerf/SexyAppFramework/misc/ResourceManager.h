#pragma once
#include "ResourceGroupId.h"
#include "Sexy.TodLib/generated/ResourceId.h"
#include "Sexy.TodLib/generated/NumericResourceBindings.h"
#include "Common.h"
#include "graphics/Image.h"
#include "SexyAppBase.h"
#include "ResourceError.h"
#include <array>
#include <bitset>
#include <iterator>
#include <string>

namespace ImageLib
{
class Image;
};

namespace Sexy
{

class Image;
class SoundInstance;
class SexyAppBase;
class _Font;

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
class ResourceManager
{
public: // @Patoke todo: revert to protected
	enum ResType
	{
		ResType_Image,
		ResType_Sound,
		ResType_Font
	};


	struct BaseRes
	{
		ResType mType;
			unsigned mId = RESOURCE_SLOT_NONE;
			unsigned mImageSymbol = 0;
			ResourceGroupId mResGroup = ResourceGroupId::Invalid;
			std::string mPath;
			bool mFromProgram = false;
			bool mUnavailable = false;

		virtual ~BaseRes() {}
		virtual void DeleteResource() { }
	};

	struct ImageRes : public BaseRes
	{
		SharedImageRef mImage;
		std::string mAlphaImage;
		std::string mAlphaGridImage;
			unsigned mVariant = 0;
			bool mAutoFindAlpha = true;
			bool mPalletize = true;
			bool mA4R4G4B4 = false;
			bool mA8R8G8B8 = false;
			bool mDDSurface = false;
			bool mPurgeBits = false;
			bool mMinimizeSubdivisions = false;
			int mRows = 1;
			int mCols = 1;
			DWORD mAlphaColor = 0xFFFFFF;
		AnimInfo mAnimInfo;

		ImageRes() { mType = ResType_Image; }
		virtual void DeleteResource();
	};

	struct SoundRes : public BaseRes
	{
			int mSoundId = -1;
			double mVolume = -1;
			int mPanning = 0;

		SoundRes() { mType = ResType_Sound; }
		virtual void DeleteResource();
	};

	struct FontRes : public BaseRes
	{
			_Font *mFont = nullptr;
			Image *mImage = nullptr;
			std::string mImagePath;
			std::vector<unsigned> mTagIds;
			unsigned mReferenceId = RESOURCE_SLOT_NONE;
			bool mLoading = false;

			bool mBold = false;
			bool mItalic = false;
			bool mUnderline = false;
			bool mShadow = false;
			int mSize = 0;


		FontRes() { mType = ResType_Font; }
		virtual void DeleteResource();
	};

	typedef std::array<BaseRes*, NUMERIC_RESOURCE_SLOT_COUNT> ResourceSlots;
	typedef std::array<ImageRes*, std::size(gImageSymbolResourceSlots)> ImageSlots;
	typedef std::list<BaseRes*> ResList;
	typedef std::array<ResList, RESOURCE_GROUP_COUNT + 1> ResGroupMap;
	typedef std::bitset<RESOURCE_GROUP_COUNT + 1> ResGroupBits;

	ResGroupBits mLoadedGroups;

	ResourceError			mError;
	SexyAppBase*			mApp;
	ResourceGroupId			mCurResGroup = ResourceGroupId::Invalid;
	bool					mAllowAlreadyDefinedResources; // for reparsing file while running

	ResGroupMap				mResGroupMap;
	// Presence distinguishes a missing group from a declared/loaded empty group.
	ResGroupBits			mResGroupPresent;
	ResList*				GetResGroupList(ResourceGroupId theGroup, bool theCreate = false);
	void					SetGroupLoaded(ResourceGroupId theGroup, bool theLoaded = true);
	ResList*				mCurResGroupList;
	ResList::iterator		mCurResGroupListItr;

		// This table owns descriptors; unloading leaves them in their fixed slots.
		ResourceSlots mResourceSlots{};
		// Symbol bindings borrow descriptors from mResourceSlots.
		ImageSlots mImageSlots{};
		void NoteImageSlot(ImageRes* theRes);
		ImageRes* GetImageResBySlot(unsigned theSymbol) const;
		BaseRes* GetResourceBySlot(unsigned theSlot) const;
		bool ParseNumericResourcesFile(const std::string& theFilename);


	bool					Fail(ResourceError theError);
	bool					Fail(ResourceFailure theReason, unsigned theSlot = RESOURCE_SLOT_NONE,
		unsigned theValue = 0, size_t theOffset = 0);

	void					DeleteResourceDescriptors();
	virtual void			DeleteResources(ResType theType, ResourceGroupId theGroup);

	bool					LoadAlphaGridImage(ImageRes *theRes, DDImage *theImage);
	bool					LoadAlphaImage(ImageRes *theRes, DDImage *theImage);
	virtual bool			DoLoadImage(ImageRes *theRes);
	virtual bool			DoLoadFont(FontRes* theRes);
	virtual bool			DoLoadSound(SoundRes* theRes);

	int						GetNumResources(ResType theType);
	int						GetNumResources(ResourceGroupId theGroup, ResType theType);

public:
	ResourceManager(SexyAppBase *theApp);
	virtual ~ResourceManager();

	bool					ParseResourcesFile(const std::string& theFilename);
	bool					ReparseResourcesFile(const std::string& theFilename);

	bool					HadError() const noexcept;
	bool					IsGroupLoaded(ResourceGroupId theGroup);

	int						GetNumImages();
	int						GetNumSounds();
	int						GetNumFonts();
	int						GetNumResources();

	int						GetNumImages(ResourceGroupId theGroup);
	int						GetNumSounds(ResourceGroupId theGroup);
	int						GetNumFonts(ResourceGroupId theGroup);
	int						GetNumResources(ResourceGroupId theGroup);

	virtual bool			LoadNextResource();
	virtual void			ResourceLoadedHook(BaseRes *theRes);

	virtual void			StartLoadResources(ResourceGroupId theGroup);
	virtual bool			LoadResources(ResourceGroupId theGroup);

	bool ReplaceImage(unsigned theId, Image* theImage);
	bool ReplaceImage(ResourceId theId, Image* theImage) { return ReplaceImage(static_cast<unsigned>(theId), theImage); }
	bool ReplaceSound(unsigned theId, int theSound);
	bool ReplaceSound(ResourceId theId, int theSound) { return ReplaceSound(static_cast<unsigned>(theId), theSound); }
	bool ReplaceFont(unsigned theId, _Font* theFont);
	bool ReplaceFont(ResourceId theId, _Font* theFont) { return ReplaceFont(static_cast<unsigned>(theId), theFont); }
	void DeleteImage(unsigned theId);
	void DeleteImage(ResourceId theId) { return DeleteImage(static_cast<unsigned>(theId)); }
	SharedImageRef LoadImage(unsigned theId);
	SharedImageRef LoadImage(ResourceId theId) { return LoadImage(static_cast<unsigned>(theId)); }
	void DeleteFont(unsigned theId);
	void DeleteFont(ResourceId theId) { return DeleteFont(static_cast<unsigned>(theId)); }
	_Font* LoadFont(unsigned theId);
	_Font* LoadFont(ResourceId theId) { return LoadFont(static_cast<unsigned>(theId)); }
	int LoadSound(unsigned theId);
	int LoadSound(ResourceId theId) { return LoadSound(static_cast<unsigned>(theId)); }
	SharedImageRef GetImage(unsigned theId);
	SharedImageRef GetImage(ResourceId theId) { return GetImage(static_cast<unsigned>(theId)); }
	int GetSound(unsigned theId);
	int GetSound(ResourceId theId) { return GetSound(static_cast<unsigned>(theId)); }
	_Font* GetFont(unsigned theId);
	_Font* GetFont(ResourceId theId) { return GetFont(static_cast<unsigned>(theId)); }
	SharedImageRef GetImageThrow(unsigned theId);
	SharedImageRef GetImageThrow(ResourceId theId) { return GetImageThrow(static_cast<unsigned>(theId)); }
	int GetSoundThrow(unsigned theId);
	int GetSoundThrow(ResourceId theId) { return GetSoundThrow(static_cast<unsigned>(theId)); }
	_Font* GetFontThrow(unsigned theId);
	_Font* GetFontThrow(ResourceId theId) { return GetFontThrow(static_cast<unsigned>(theId)); }

	void AttachImageSlots(unsigned theCount);
	SharedImageRef LoadImageBySlot(unsigned theSymbol);
	_Font* LoadFontByResourceSlot(unsigned theSlot);

	virtual void			DeleteResources();
	virtual void			DeleteResources(ResourceGroupId theGroup);
	void					DeleteExtraImageBuffers();
	void					DeleteExtraImageBuffers(ResourceGroupId theGroup);

	// PvZ/Tod resource helpers operate on the same ResourceManager object in
	// the 1073 executable.  Keeping them here avoids manufacturing a derived
	// dynamic type and then down-casting the base object into it.
	bool					TodLoadResources(ResourceGroupId theGroup);
	bool					TodLoadNextResource();
	bool					FindImagePath(Image* theImage, std::string* thePath);
	bool					FindFontPath(_Font* theFont, std::string* thePath);

};

}
