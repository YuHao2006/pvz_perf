#pragma once
#include "Font.h"
#include <vector>
#if defined(SEXY_FONT_TEXT_COMPAT_TEST_ONLY)
#include "misc/DescParser.h"
#endif
#include "SexyAppBase.h"
#include "SharedImage.h"
#include "TextureRegion.h"
#include <atomic>

namespace Sexy
{

class SexyAppBase;
class Image;

// Global IDs are assigned offline in lexical order. The authoritative 1073
// corpus contains no tags; retain the numeric interface for compiled variants.
enum class FontTagId : unsigned { Count = 0 };
std::string ResolveCompiledFontPath(const std::string& theSourcePath);

class CharData
{
public:
	TextureRegion			mImageRect;
	Point					mOffset;
	// 字距对表（本字形 → 后继字符修正）。每字形通常 0~几对，线性扫；
	// map 版已删（ASCII 直取阵列改造，2026-10-01）。
	std::vector<std::pair<SexyChar, int>> mKerningPairs;
	int						mWidth;
	int						mOrder;

public:
	CharData();
	int						GetKerning(SexyChar theNextChar) const;
	void					SetKerning(SexyChar theNextChar, int theOffset);
};

class FontData;

class FontLayer
{
public:	
	FontData*				mFontData;
#if defined(SEXY_FONT_TEXT_COMPAT_TEST_ONLY)
	StringStringMap			mExtendedInfo;
	std::string				mLayerName;
#endif
	unsigned				mLayerId = 0;
	std::vector<unsigned>	mRequiredTags;
	std::vector<unsigned>	mExcludedTags;
	// ASCII characters index their own slots directly; other bytes are invalid.
	static constexpr int kCharSlots = 128;
	CharData				mCharData[kCharSlots];
	Color					mColorMult;
	Color					mColorAdd;
	SharedImageRef			mImage;	
	int						mDrawMode;
	Point					mOffset;
	int						mSpacing;
	int						mMinPointSize;
	int						mMaxPointSize;
	int						mPointSize;
	int						mAscent;
	int						mAscentPadding; // How much space is above the avg uppercase char
	int						mHeight;		// 	
	int						mDefaultHeight; // Max height of font character image rects	
	int						mLineSpacingOffset; // This plus height should get added between lines
	int						mBaseOrder;
	bool					mUseAlphaCorrection;

public:
	FontLayer(FontData* theFontData);
	FontLayer(const FontLayer& theFontLayer);

	CharData*				GetCharData(SexyChar theChar);
};

typedef std::map<SexyChar, SexyChar> CharMap;
typedef std::list<FontLayer> FontLayerList;
#if defined(SEXY_FONT_TEXT_COMPAT_TEST_ONLY)
typedef std::map<std::string, FontLayer*> FontLayerMap;
#endif
typedef std::list<Rect> RectList;

class FontData
#if defined(SEXY_FONT_TEXT_COMPAT_TEST_ONLY)
	: public DescParser
#endif
{
public:
	bool					mInitialized;
	std::atomic<int>		mRefCount;
	SexyAppBase*			mApp;		

	int						mDefaultPointSize;
	CharMap					mCharMap;
	FontLayerList			mFontLayerList;
#if defined(SEXY_FONT_TEXT_COMPAT_TEST_ONLY)
	FontLayerMap			mFontLayerMap;
#endif
	std::string				mSourceFile;
#if defined(SEXY_FONT_TEXT_COMPAT_TEST_ONLY)
	std::string				mFontErrorHeader;
	virtual bool			Error(const std::string& theError);
	bool					GetColorFromDataElement(DataElement *theElement, Color &theColor);
	bool					DataToLayer(DataElement* theSource, FontLayer** theFontLayer);
	virtual bool			HandleCommand(const ListDataElement& theParams);
	bool					LoadTextForTest(SexyAppBase* theSexyApp, const std::string& theFontDescFileName);
	bool					LoadLegacy(Image* theFontImage, const std::string& theFontDescFileName);
#endif

public:
	FontData();
	virtual ~FontData();

	void					Ref();
	void					DeRef();

	bool					Load(SexyAppBase* theSexyApp, const std::string& theFontDescFileName);
};


class ActiveFontLayer
{
public:
	FontLayer*				mBaseFontLayer;

	Image*					mScaledImage;
	bool					mOwnsImage;
	// Scaled UV regions use the same ASCII slot domain as FontLayer.
	TextureRegion			mScaledCharImageRects[128];

public:
	ActiveFontLayer();
	ActiveFontLayer(const ActiveFontLayer& theActiveFontLayer);
	ActiveFontLayer& operator=(const ActiveFontLayer& theActiveFontLayer) = delete;
	~ActiveFontLayer();
};

typedef std::list<ActiveFontLayer> ActiveFontLayerList;

class RenderCommand
{
public:
	Image*					mImage;
	int						mDest[2];
	TextureRegion			mSourceRegion;
	int						mMode;
	Color					mColor;
	bool					mUseAlphaCorrection;
	RenderCommand*			mNext;
};

typedef std::multimap<int, RenderCommand> RenderCommandMap;

class ImageFont : public _Font
{
public:	
	FontData*				mFontData;
	int						mPointSize;
	std::vector<unsigned>	mTagIds;

	bool					mActiveListValid;
	ActiveFontLayerList		mActiveLayerList;
	double					mScale;
	bool					mForceScaledImagesWhite;

public:
	void			GenerateActiveFontLayers();
	void			DrawStringEx(Graphics* g, int theX, int theY, const SexyString& theString, const Color& theColor, RectList* theDrawnAreas, int* theWidth);

public:
	ImageFont(SexyAppBase* theSexyApp, const std::string& theFontDescFileName);
	ImageFont(Image *theFontImage); // for constructing your own image font without a file descriptor
	ImageFont(const ImageFont& theImageFont);
	ImageFont& operator=(const ImageFont& theImageFont) = delete;
	virtual ~ImageFont();

#if defined(SEXY_FONT_TEXT_COMPAT_TEST_ONLY)
	ImageFont(Image* theFontImage, const std::string& theFontDescFileName);
#endif
	
	virtual int				CharWidth(SexyChar theChar);
	virtual int				CharWidthKern(SexyChar theChar, SexyChar thePrevChar);
	virtual int				StringWidth(const SexyString& theString);
	virtual void			DrawString(Graphics* g, int theX, int theY, const SexyString& theString, const Color& theColor, const Rect& theClipRect);

	virtual _Font*			Duplicate();

	void			SetPointSize(int thePointSize);
	void			SetScale(double theScale);
	bool			AddTagNumeric(unsigned theTagId);
	bool			RemoveTagNumeric(unsigned theTagId);
	bool			HasTagNumeric(unsigned theTagId) const;
#if defined(SEXY_FONT_TEXT_COMPAT_TEST_ONLY)
	std::string		GetDefine(const std::string& theName);
#endif

	void			Prepare();
	SexyChar				GetMappedChar(SexyChar theChar);
};

}
