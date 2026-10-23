#include "ImageFont.h"
#include "Graphics.h"
#include "Image.h"
#include "SexyAppBase.h"
#include "graphics/DDInterface.h"
#include "graphics/RenderInterface.h"
#include "misc/AutoCrit.h"
#if defined(SEXY_FONT_TEXT_COMPAT_TEST_ONLY)
#include "misc/DescParserOwnership.h"
#endif
#include "paklib/PakInterface.h"
#include "Sexy.TodLib/TodCommon.h"
#include <cassert>
#include <memory>
#include <utility>

using namespace Sexy;

#if defined(SEXY_FONT_TEXT_COMPAT_TEST_ONLY)
namespace {
unsigned FontTagForTest(const std::string& name)
{
	static std::map<std::string, unsigned> ids;
	auto result = ids.emplace(StringToUpper(name), static_cast<unsigned>(ids.size()));
	return result.first->second;
}
// The list owns layers; the map only indexes them. Publish both or neither.
template <typename... Args>
bool RegisterFontLayer(FontData& font, const std::string& name, Args&&... args)
{
	auto& layer = font.mFontLayerList.emplace_back(std::forward<Args>(args)...);
	bool inserted;
	try
	{
		// 1073 0059D901/0059D927 (and CreateLayerFrom): the new layer has
		// its own name and creation-order priority, even when cloned.
		layer.mLayerName = name;
		layer.mBaseOrder = static_cast<int>(font.mFontLayerList.size() - 1);
		inserted = font.mFontLayerMap.emplace(name, &layer).second;
	}
	catch (...)
	{
		font.mFontLayerList.pop_back();
		throw;
	}
	if (!inserted)
		font.mFontLayerList.pop_back();
	return inserted;
}
}

////

DataElement::DataElement() :
	mIsList(false)
{
}

DataElement::~DataElement()
{
}

SingleDataElement::SingleDataElement()
{
	mIsList = false;
}

SingleDataElement::SingleDataElement(std::string theString) :
	mString(std::move(theString))
{
	mIsList = false;
}

SingleDataElement::~SingleDataElement()
{
}

DataElement* SingleDataElement::Duplicate()
{
	SingleDataElement* aSingleDataElement = new SingleDataElement(*this);
	return aSingleDataElement;
}

ListDataElement::ListDataElement()
{
	mIsList = true;
}

ListDataElement::~ListDataElement()
{
	for (unsigned int i = 0; i < mElementVector.size(); i++)
		delete mElementVector[i];
}

ListDataElement::ListDataElement(const ListDataElement& theListDataElement) : ListDataElement()
{
	mIsList = true;
	for (unsigned int i = 0; i < theListDataElement.mElementVector.size(); i++)
		AppendOwnedDataElement(mElementVector, std::unique_ptr<DataElement>(theListDataElement.mElementVector[i]->Duplicate()));
}

ListDataElement& ListDataElement::operator=(const ListDataElement& theListDataElement)
{
	if (this == &theListDataElement)
		return *this;

	unsigned int i;

	for (i = 0; i < mElementVector.size(); i++)
		delete mElementVector[i];
	mElementVector.clear();

	for (i = 0; i < theListDataElement.mElementVector.size(); i++)
		AppendOwnedDataElement(mElementVector, std::unique_ptr<DataElement>(theListDataElement.mElementVector[i]->Duplicate()));

	return *this;
}

DataElement* ListDataElement::Duplicate()
{
	ListDataElement* aListDataElement = new ListDataElement(*this);
	return aListDataElement;
}

#endif

///

CharData::CharData()
{
	mWidth = 0;
	mOrder = 0;

	//for (unsigned int i = 0; i < 256; i++)
	//	mKerningOffsets[i] = 0;
}

FontLayer::FontLayer(FontData* theFontData)
{
	mFontData = theFontData;
	mDrawMode = -1;
	mSpacing = 0;
	mPointSize = 0;
	mAscent = 0;
	mAscentPadding = 0;
	mMinPointSize = -1;
	mMaxPointSize = -1;
	mHeight = 0;
	mDefaultHeight = 0;
	mColorMult = Color::White;
	mColorAdd = Color(0, 0, 0, 0);
	mLineSpacingOffset = 0;
	mBaseOrder = 0;
	mUseAlphaCorrection = true; // 1073 FontLayer constructor 0059B420 initializes +0x10C to 1.
}

FontLayer::FontLayer(const FontLayer& theFontLayer) :
	mFontData(theFontLayer.mFontData),
#if defined(SEXY_FONT_TEXT_COMPAT_TEST_ONLY)
	mExtendedInfo(theFontLayer.mExtendedInfo),
	mLayerName(theFontLayer.mLayerName),
#endif
	mLayerId(theFontLayer.mLayerId),
	mRequiredTags(theFontLayer.mRequiredTags),
	mExcludedTags(theFontLayer.mExcludedTags),

	mColorMult(theFontLayer.mColorMult),
	mColorAdd(theFontLayer.mColorAdd),
	mImage(theFontLayer.mImage),
	mDrawMode(theFontLayer.mDrawMode),
	mOffset(theFontLayer.mOffset),
	mSpacing(theFontLayer.mSpacing),
	mMinPointSize(theFontLayer.mMinPointSize),
	mMaxPointSize(theFontLayer.mMaxPointSize),
	mPointSize(theFontLayer.mPointSize),
	mAscent(theFontLayer.mAscent),
	mAscentPadding(theFontLayer.mAscentPadding),
	mHeight(theFontLayer.mHeight),
	mDefaultHeight(theFontLayer.mDefaultHeight),
	mLineSpacingOffset(theFontLayer.mLineSpacingOffset),
	mBaseOrder(theFontLayer.mBaseOrder),
	// @Minerscale mUseAlphaCorrection wasn't initialised in the copy constructor causing UB
	mUseAlphaCorrection(theFontLayer.mUseAlphaCorrection)
{
	std::copy(std::begin(theFontLayer.mCharData), std::end(theFontLayer.mCharData), std::begin(mCharData));
}

CharData* FontLayer::GetCharData(SexyChar theChar)
{
	const unsigned aIndex = static_cast<unsigned char>(theChar);
	assert(aIndex < kCharSlots);
	return &mCharData[aIndex];
}

int CharData::GetKerning(SexyChar theNextChar) const
{
	for (const auto& aPair : mKerningPairs)
		if (aPair.first == theNextChar)
			return aPair.second;
	return 0;  // map 版 operator[] miss 插 0 的等价读语义
}

void CharData::SetKerning(SexyChar theNextChar, int theOffset)
{
	for (auto& aPair : mKerningPairs)
		if (aPair.first == theNextChar)
		{ aPair.second = theOffset; return; }
	mKerningPairs.emplace_back(theNextChar, theOffset);
}

FontData::FontData()
{
	mInitialized = false;

	mApp = NULL;
	mRefCount = 0;
	mDefaultPointSize = 0;

	//for (unsigned int i = 0; i < 256; i++)
	//	mCharMap[i] = (uchar) i;
}

FontData::~FontData()
{
#if defined(SEXY_FONT_TEXT_COMPAT_TEST_ONLY)
	DataElementMap::iterator anItr = mDefineMap.begin();
	while (anItr != mDefineMap.end())
	{
		DataElement* aDataElement = anItr->second;

		delete aDataElement;
		++anItr;
	}
#endif
}

void FontData::Ref()
{
	mRefCount++;
}

void FontData::DeRef()
{
	if (--mRefCount == 0)
	{
		delete this;
	}
}

#if defined(SEXY_FONT_TEXT_COMPAT_TEST_ONLY)
bool FontData::Error(const std::string& theError)
{
	if (mApp != NULL)
	{
		std::string anErrorString = mFontErrorHeader + theError;

		if (mCurrentLine.length() > 0)
		{
			anErrorString += " on Line " + StrFormat("%d:\r\n\r\n", mCurrentLineNum) + mCurrentLine;
		}

		mApp->Popup(anErrorString);
	}

	return false;
}

bool FontData::DataToLayer(DataElement* theSource, FontLayer** theFontLayer)
{
	*theFontLayer = NULL;

	if (theSource->mIsList)
		return false;

	std::string aLayerName = StringToUpper(((SingleDataElement*)theSource)->mString);

	FontLayerMap::iterator anItr = mFontLayerMap.find(aLayerName);
	if (anItr == mFontLayerMap.end())
	{
		Error("Undefined Layer");
		return false;
	}

	*theFontLayer = anItr->second;

	return true;
}

bool FontData::GetColorFromDataElement(DataElement* theElement, Color& theColor)
{
	if (theElement->mIsList)
	{
		DoubleVector aFactorVector;
		if (!DataToDoubleVector(theElement, &aFactorVector) || aFactorVector.size() != 4)
			return false;

		theColor = Color(
			(int)(aFactorVector[0] * 255),
			(int)(aFactorVector[1] * 255),
			(int)(aFactorVector[2] * 255),
			(int)(aFactorVector[3] * 255));

		return true;
	}

	int aColor = 0;
	if (!StringToInt(((SingleDataElement*)theElement)->mString, &aColor))
		return false;

	theColor = aColor;
	return true;
}


bool FontData::HandleCommand(const ListDataElement& theParams)
{
	std::string aCmd = ((SingleDataElement*)theParams.mElementVector[0])->mString;

	bool invalidNumParams = false;
	bool invalidParamFormat = false;
	bool literalError = false;
	bool sizeMismatch = false;

	if (stricmp(aCmd.c_str(), "Define") == 0)
	{
		if (theParams.mElementVector.size() == 3)
		{
			if (!theParams.mElementVector[1]->mIsList)
			{
				std::string aDefineName = StringToUpper(((SingleDataElement*)theParams.mElementVector[1])->mString);

				if (!IsImmediate(aDefineName))
				{
					DataElementMap::iterator anItr = mDefineMap.find(aDefineName);
					if (anItr != mDefineMap.end())
					{
						delete anItr->second;
						mDefineMap.erase(anItr);
					}

					if (theParams.mElementVector[2]->mIsList)
					{
						auto aValues = std::make_unique<ListDataElement>();
						if (!GetValues(((ListDataElement*)theParams.mElementVector[2]), aValues.get()))
							return false;

						InsertOwnedDefine(mDefineMap, aDefineName, std::move(aValues));
					}
					else
					{
						SingleDataElement* aDefParam = (SingleDataElement*)theParams.mElementVector[2];

						DataElement* aDerefVal = Dereference(aDefParam->mString);

						InsertOwnedDefine(mDefineMap, aDefineName,
							std::unique_ptr<DataElement>((aDerefVal ? aDerefVal : aDefParam)->Duplicate()));
					}
				}
				else
					invalidParamFormat = true;
			}
			else
				invalidParamFormat = true;
		}
		else
			invalidNumParams = true;
	}
	else if (stricmp(aCmd.c_str(), "CreateHorzSpanRectList") == 0)
	{
		if (theParams.mElementVector.size() == 4)
		{
			IntVector aRectIntVector;
			IntVector aWidthsVector;

			if ((!theParams.mElementVector[1]->mIsList) &&
				(DataToIntVector(theParams.mElementVector[2], &aRectIntVector)) &&
				(aRectIntVector.size() == 4) &&
				(DataToIntVector(theParams.mElementVector[3], &aWidthsVector)))
			{
				std::string aDefineName = StringToUpper(((SingleDataElement*)theParams.mElementVector[1])->mString);

				int aXPos = 0;

				auto aRectList = std::make_unique<ListDataElement>();

				for (unsigned int aWidthNum = 0; aWidthNum < aWidthsVector.size(); aWidthNum++)
				{
					auto aNewRect = std::make_unique<ListDataElement>();
					ListDataElement* aRectElement = aNewRect.get();
					AppendOwnedDataElement(aRectList->mElementVector, std::move(aNewRect));

					AppendOwnedDataElement(aRectElement->mElementVector, std::make_unique<SingleDataElement>(std::to_string(aRectIntVector[0] + aXPos)));
					AppendOwnedDataElement(aRectElement->mElementVector, std::make_unique<SingleDataElement>(std::to_string(aRectIntVector[1])));
					AppendOwnedDataElement(aRectElement->mElementVector, std::make_unique<SingleDataElement>(std::to_string(aWidthsVector[aWidthNum])));
					AppendOwnedDataElement(aRectElement->mElementVector, std::make_unique<SingleDataElement>(std::to_string(aRectIntVector[3])));

					aXPos += aWidthsVector[aWidthNum];
				}

				DataElementMap::iterator anItr = mDefineMap.find(aDefineName);
				if (anItr != mDefineMap.end())
				{
					delete anItr->second;
					mDefineMap.erase(anItr);
				}

				InsertOwnedDefine(mDefineMap, aDefineName, std::move(aRectList));
			}
			else
				invalidParamFormat = true;
		}
		else
			invalidNumParams = true;
	}
	else if (stricmp(aCmd.c_str(), "SetDefaultPointSize") == 0)
	{
		if (theParams.mElementVector.size() == 2)
		{
			int aPointSize;

			if ((!theParams.mElementVector[1]->mIsList) &&
				(StringToInt(((SingleDataElement*)theParams.mElementVector[1])->mString, &aPointSize)))
			{
				mDefaultPointSize = aPointSize;
			}
			else
				invalidParamFormat = true;
		}
		else
			invalidNumParams = true;
	}
	else if (stricmp(aCmd.c_str(), "SetCharMap") == 0)
	{
		if (theParams.mElementVector.size() == 3)
		{
			StringVector aFromVector;
			StringVector aToVector;

			if ((DataToStringVector(theParams.mElementVector[1], &aFromVector)) &&
				(DataToStringVector(theParams.mElementVector[2], &aToVector)))
			{
				if (aFromVector.size() == aToVector.size())
				{
					for (unsigned int aMapIdx = 0; aMapIdx < aFromVector.size(); aMapIdx++)
					{
						if ((aFromVector[aMapIdx].length() == 1) && (aToVector[aMapIdx].length() == 1))
						{
							//mCharMap[(uchar) aFromVector[aMapIdx][0]] = (uchar) aToVector[aMapIdx][0];
							mCharMap.insert(CharMap::value_type(aFromVector[aMapIdx][0], aToVector[aMapIdx][0]));
						}
						else
							invalidParamFormat = true;
					}
				}
				else
					sizeMismatch = true;
			}
			else
				invalidParamFormat = true;
		}
		else
			invalidNumParams = true;
	}
	else if (stricmp(aCmd.c_str(), "CreateLayer") == 0)
	{
		if (theParams.mElementVector.size() == 2)
		{
			if (!theParams.mElementVector[1]->mIsList)
			{
				std::string aLayerName = StringToUpper(((SingleDataElement*)theParams.mElementVector[1])->mString);

				if (!RegisterFontLayer(*this, aLayerName, this))
				{
					Error("Layer Already Exists");
					return false;
				}
			}
			else
				invalidParamFormat = true;
		}
		else
			invalidNumParams = true;
	}
	else if (stricmp(aCmd.c_str(), "CreateLayerFrom") == 0)
	{
		if (theParams.mElementVector.size() == 3)
		{
			FontLayer* aSourceLayer;

			if ((!theParams.mElementVector[1]->mIsList) && (DataToLayer(theParams.mElementVector[2], &aSourceLayer)))
			{
				std::string aLayerName = StringToUpper(((SingleDataElement*)theParams.mElementVector[1])->mString);

				if (!RegisterFontLayer(*this, aLayerName, *aSourceLayer))
				{
					Error("Layer Already Exists");
					return false;
				}
			}
			else
				invalidParamFormat = true;
		}
		else
			invalidNumParams = true;
	}
	else if (stricmp(aCmd.c_str(), "LayerRequireTags") == 0)
	{
		if (theParams.mElementVector.size() == 3)
		{
			FontLayer* aLayer;
			StringVector aStringVector;

			if ((DataToLayer(theParams.mElementVector[1], &aLayer)) &&
				(DataToStringVector(theParams.mElementVector[2], &aStringVector)))
			{
				for (unsigned int i = 0; i < aStringVector.size(); i++)
					aLayer->mRequiredTags.push_back(FontTagForTest(aStringVector[i]));
			}
			else
				invalidParamFormat = true;
		}
		else
			invalidNumParams = true;
	}
	else if (stricmp(aCmd.c_str(), "LayerExcludeTags") == 0)
	{
		if (theParams.mElementVector.size() == 3)
		{
			FontLayer* aLayer;
			StringVector aStringVector;

			if ((DataToLayer(theParams.mElementVector[1], &aLayer)) &&
				(DataToStringVector(theParams.mElementVector[2], &aStringVector)))
			{
				for (unsigned int i = 0; i < aStringVector.size(); i++)
					aLayer->mExcludedTags.push_back(FontTagForTest(aStringVector[i]));
			}
			else
				invalidParamFormat = true;
		}
		else
			invalidNumParams = true;
	}
	else if (stricmp(aCmd.c_str(), "LayerPointRange") == 0)
	{
		if (theParams.mElementVector.size() == 4)
		{
			FontLayer* aLayer;
			if ((DataToLayer(theParams.mElementVector[1], &aLayer)) &&
				(!theParams.mElementVector[2]->mIsList) &&
				(!theParams.mElementVector[3]->mIsList))
			{
				int aMinPointSize;
				int aMaxPointSize;

				if ((StringToInt(((SingleDataElement*)theParams.mElementVector[2])->mString, &aMinPointSize)) &&
					(StringToInt(((SingleDataElement*)theParams.mElementVector[3])->mString, &aMaxPointSize)))
				{
					aLayer->mMinPointSize = aMinPointSize;
					aLayer->mMaxPointSize = aMaxPointSize;
				}
				else
					invalidParamFormat = true;
			}
			else
				invalidParamFormat = true;
		}
		else
			invalidNumParams = true;
	}
	else if (stricmp(aCmd.c_str(), "LayerSetPointSize") == 0)
	{
		if (theParams.mElementVector.size() == 3)
		{
			FontLayer* aLayer;
			if ((DataToLayer(theParams.mElementVector[1], &aLayer)) &&
				(!theParams.mElementVector[2]->mIsList))
			{
				int aPointSize;
				if (StringToInt(((SingleDataElement*)theParams.mElementVector[2])->mString, &aPointSize))
				{
					aLayer->mPointSize = aPointSize;
				}
				else
					invalidParamFormat = true;
			}
			else
				invalidParamFormat = true;
		}
		else
			invalidNumParams = true;
	}
	else if (stricmp(aCmd.c_str(), "LayerSetHeight") == 0)
	{
		if (theParams.mElementVector.size() == 3)
		{
			FontLayer* aLayer;
			if ((DataToLayer(theParams.mElementVector[1], &aLayer)) &&
				(!theParams.mElementVector[2]->mIsList))
			{
				int aHeight;
				if (StringToInt(((SingleDataElement*)theParams.mElementVector[2])->mString, &aHeight))
				{
					aLayer->mHeight = aHeight;
				}
				else
					invalidParamFormat = true;
			}
			else
				invalidParamFormat = true;
		}
		else
			invalidNumParams = true;
	}
	else if (stricmp(aCmd.c_str(), "LayerSetImage") == 0)
	{
		if (theParams.mElementVector.size() == 3)
		{
			FontLayer* aLayer;
			std::string aFileNameString;

			if ((DataToLayer(theParams.mElementVector[1], &aLayer)) &&
				(DataToString(theParams.mElementVector[2], &aFileNameString)))
			{
				std::string aFileName = GetPathFrom(aFileNameString, GetFileDir(mSourceFile));

				SharedImageRef anImage = mApp->GetPreparedSharedImage(aFileName, 0, nullptr,
					[](Image* image) { image->Palletize(); });

				if ((Image*)anImage != NULL)
				{
					aLayer->mImage = anImage;
					// 首绘防线（2026-10-09 用户规格"首绘路径不得存在"）：字体
					// 层图不在资源槽——诞生即入 GPU 预热队列
					//（线程安全；装载期主线程泵排干，玩法期关卡放行门兜底）。
					TodQueueTextureWarm(anImage);
				}
				else
				{
					Error("Failed to Load Image");
					return false;
				}
			}
			else
				invalidParamFormat = true;
		}
		else
			invalidNumParams = true;
	}
	else if (stricmp(aCmd.c_str(), "LayerSetDrawMode") == 0)
	{
		if (theParams.mElementVector.size() == 3)
		{
			FontLayer* aLayer;
			if ((DataToLayer(theParams.mElementVector[1], &aLayer)) && (!theParams.mElementVector[2]->mIsList))
			{
				int anDrawMode;
				if ((StringToInt(((SingleDataElement*)theParams.mElementVector[2])->mString, &anDrawMode)) &&
					(anDrawMode >= 0) && (anDrawMode <= 1))
				{
					aLayer->mDrawMode = anDrawMode;
				}
				else
					invalidParamFormat = true;
			}
			else
				invalidParamFormat = true;
		}
		else
			invalidNumParams = true;
	}
	else if (stricmp(aCmd.c_str(), "LayerSetColorMult") == 0)
	{
		if (theParams.mElementVector.size() == 3)
		{
			FontLayer* aLayer;
			if (DataToLayer(theParams.mElementVector[1], &aLayer))
			{
				if (!GetColorFromDataElement(theParams.mElementVector[2], aLayer->mColorMult))
					invalidParamFormat = true;
			}
			else
				invalidParamFormat = true;
		}
		else
			invalidNumParams = true;
	}
	else if (stricmp(aCmd.c_str(), "LayerSetColorAdd") == 0)
	{
		if (theParams.mElementVector.size() == 3)
		{
			FontLayer* aLayer;
			if (DataToLayer(theParams.mElementVector[1], &aLayer))
			{
				if (!GetColorFromDataElement(theParams.mElementVector[2], aLayer->mColorAdd))
					invalidParamFormat = true;
			}
			else
				invalidParamFormat = true;
		}
		else
			invalidNumParams = true;
	}
	else if (stricmp(aCmd.c_str(), "LayerSetAscent") == 0)
	{
		if (theParams.mElementVector.size() == 3)
		{
			FontLayer* aLayer;
			if ((DataToLayer(theParams.mElementVector[1], &aLayer)) &&
				(!theParams.mElementVector[2]->mIsList))
			{
				int anAscent;
				if (StringToInt(((SingleDataElement*)theParams.mElementVector[2])->mString, &anAscent))
				{
					aLayer->mAscent = anAscent;
				}
				else
					invalidParamFormat = true;
			}
			else
				invalidParamFormat = true;
		}
		else
			invalidNumParams = true;
	}
	else if (stricmp(aCmd.c_str(), "LayerSetAscentPadding") == 0)
	{
		if (theParams.mElementVector.size() == 3)
		{
			FontLayer* aLayer;
			if ((DataToLayer(theParams.mElementVector[1], &aLayer)) &&
				(!theParams.mElementVector[2]->mIsList))
			{
				int anAscent;
				if (StringToInt(((SingleDataElement*)theParams.mElementVector[2])->mString, &anAscent))
				{
					aLayer->mAscentPadding = anAscent;
				}
				else
					invalidParamFormat = true;
			}
			else
				invalidParamFormat = true;
		}
		else
			invalidNumParams = true;
	}
	else if (stricmp(aCmd.c_str(), "LayerSetLineSpacingOffset") == 0)
	{
		if (theParams.mElementVector.size() == 3)
		{
			FontLayer* aLayer;
			if ((DataToLayer(theParams.mElementVector[1], &aLayer)) &&
				(!theParams.mElementVector[2]->mIsList))
			{
				int anAscent;
				if (StringToInt(((SingleDataElement*)theParams.mElementVector[2])->mString, &anAscent))
				{
					aLayer->mLineSpacingOffset = anAscent;
				}
				else
					invalidParamFormat = true;
			}
			else
				invalidParamFormat = true;
		}
		else
			invalidNumParams = true;
	}
	else if (stricmp(aCmd.c_str(), "LayerSetOffset") == 0)
	{
		if (theParams.mElementVector.size() == 3)
		{
			FontLayer* aLayer;
			IntVector anOffset;

			if ((DataToLayer(theParams.mElementVector[1], &aLayer)) && (DataToIntVector(theParams.mElementVector[2], &anOffset)) && (anOffset.size() == 2))
			{
				aLayer->mOffset.mX = anOffset[0];
				aLayer->mOffset.mY = anOffset[1];
			}
			else
				invalidParamFormat = true;
		}
		else
			invalidNumParams = true;
	}
	else if (stricmp(aCmd.c_str(), "LayerSetCharWidths") == 0)
	{
		if (theParams.mElementVector.size() == 4)
		{
			FontLayer* aLayer;
			StringVector aCharsVector;
			IntVector aCharWidthsVector;

			if ((DataToLayer(theParams.mElementVector[1], &aLayer)) &&
				(DataToStringVector(theParams.mElementVector[2], &aCharsVector)) &&
				(DataToIntVector(theParams.mElementVector[3], &aCharWidthsVector)))
			{
				if (aCharsVector.size() == aCharWidthsVector.size())
				{
					for (unsigned int i = 0; i < aCharsVector.size(); i++)
					{
						std::wstring aWString = UTF8StringToWString(aCharsVector[i]);
						if (aWString.length() == 1)
						{
							//aLayer->mCharData[(uchar) aCharsVector[i][0]].mWidth = aCharWidthsVector[i];
							aLayer->GetCharData(aWString[0])->mWidth = aCharWidthsVector[i];
						}
						else
							invalidParamFormat = true;
					}
				}
				else
					sizeMismatch = true;
			}
			else
				invalidParamFormat = true;
		}
		else
			invalidNumParams = true;
	}
	else if (stricmp(aCmd.c_str(), "LayerSetSpacing") == 0)
	{
		if (theParams.mElementVector.size() == 3)
		{
			FontLayer* aLayer;
			IntVector anOffset;

			if ((DataToLayer(theParams.mElementVector[1], &aLayer)) &&
				(!theParams.mElementVector[2]->mIsList))
			{
				int aSpacing;

				if (StringToInt(((SingleDataElement*)theParams.mElementVector[2])->mString, &aSpacing))
				{
					aLayer->mSpacing = aSpacing;
				}
				else
					invalidParamFormat = true;
			}
			else
				invalidParamFormat = true;
		}
		else
			invalidNumParams = true;
	}
	else if (stricmp(aCmd.c_str(), "LayerSetImageMap") == 0)
	{
		if (theParams.mElementVector.size() == 4)
		{
			FontLayer* aLayer;
			StringVector aCharsVector;
			ListDataElement aRectList;

			if ((DataToLayer(theParams.mElementVector[1], &aLayer)) &&
				(DataToStringVector(theParams.mElementVector[2], &aCharsVector)) &&
				(DataToList(theParams.mElementVector[3], &aRectList)))
			{
				if (aCharsVector.size() == aRectList.mElementVector.size())
				{
					if ((Image*)aLayer->mImage != NULL)
					{
						const int& anImageWidth = aLayer->mImage->mWidth;
						const int& anImageHeight = aLayer->mImage->mHeight;

						for (unsigned int i = 0; i < aCharsVector.size(); i++)
						{
							IntVector aRectElement;
							std::wstring aWString = UTF8StringToWString(aCharsVector[i]);

							if ((aWString.length() == 1) &&
								(DataToIntVector(aRectList.mElementVector[i], &aRectElement)) &&
								(aRectElement.size() == 4))

							{
								Rect aRect = Rect(aRectElement[0], aRectElement[1], aRectElement[2], aRectElement[3]);

								if ((aRect.mX < 0) || (aRect.mY < 0) ||
									(aRect.mX + aRect.mWidth > anImageWidth) || (aRect.mY + aRect.mHeight > anImageHeight))
								{
									Error("Image rectangle out of bounds");
									return false;
								}

								//aLayer->mCharData[(uchar) aCharsVector[i][0]].mImageRect = aRect;;									
								aLayer->GetCharData(aWString[0])->mImageRect = aRect;
							}
							else
								invalidParamFormat = true;
						}

						aLayer->mDefaultHeight = 0;
						//for (int aCharNum = 0; aCharNum < 256; aCharNum++)
						//	if (aLayer->mCharData[aCharNum].mImageRect.mHeight + aLayer->mCharData[aCharNum].mOffset.mY > aLayer->mDefaultHeight)
						//		aLayer->mDefaultHeight = aLayer->mCharData[aCharNum].mImageRect.mHeight + aLayer->mCharData[aCharNum].mOffset.mY;
						for (int aCharIdx = 0; aCharIdx < aLayer->kCharSlots; aCharIdx++)
						{
							CharData& aCharData = aLayer->mCharData[aCharIdx];
							if (aCharData.mImageRect.mHeight + aCharData.mOffset.mY > aLayer->mDefaultHeight)
							{
								aLayer->mDefaultHeight = aCharData.mImageRect.mHeight + aCharData.mOffset.mY;
							}
						}
					}
					else
					{
						Error("Layer image not set");
						return false;
					}
				}
				else
					sizeMismatch = true;
			}
			else
				invalidParamFormat = true;
		}
		else
			invalidNumParams = true;
	}
	else if (stricmp(aCmd.c_str(), "LayerSetCharOffsets") == 0)
	{
		if (theParams.mElementVector.size() == 4)
		{
			FontLayer* aLayer;
			StringVector aCharsVector = StringVector();
			ListDataElement aRectList = ListDataElement();

			if ((DataToLayer(theParams.mElementVector[1], &aLayer)) &&
				(DataToStringVector(theParams.mElementVector[2], &aCharsVector)) &&
				(DataToList(theParams.mElementVector[3], &aRectList)))
			{
				if (aCharsVector.size() == aRectList.mElementVector.size())
				{
					for (unsigned int i = 0; i < aCharsVector.size(); i++)
					{
						IntVector aRectElement = IntVector();
						std::wstring aWString = UTF8StringToWString(aCharsVector[i]);

						if ((aWString.length() == 1) &&
							(DataToIntVector(aRectList.mElementVector[i], &aRectElement)) &&
							(aRectElement.size() == 2))
						{
							//aLayer->mCharData[(uchar) aCharsVector[i][0]].mOffset = Point(aRectElement[0], aRectElement[1]);
							aLayer->GetCharData(aWString[0])->mOffset = Point(aRectElement[0], aRectElement[1]);
						}
						else {
							invalidParamFormat = true;
				 		}
					}
				}
				else
					sizeMismatch = true;
			}
			else
				invalidParamFormat = true;
		}
		else
			invalidNumParams = true;
	}
	else if (stricmp(aCmd.c_str(), "LayerSetKerningPairs") == 0)
	{
		if (theParams.mElementVector.size() == 4)
		{
			FontLayer* aLayer;
			StringVector aPairsVector;
			IntVector anOffsetsVector;

			if ((DataToLayer(theParams.mElementVector[1], &aLayer)) &&
				(DataToStringVector(theParams.mElementVector[2], &aPairsVector)) &&
				(DataToIntVector(theParams.mElementVector[3], &anOffsetsVector)))
			{
				if (aPairsVector.size() == anOffsetsVector.size())
				{
					for (unsigned int i = 0; i < aPairsVector.size(); i++)
					{
						std::wstring aWString = UTF8StringToWString(aPairsVector[i]);
						if (aWString.length() == 2)
						{
							//aLayer->mCharData[(uchar) aPairsVector[i][0]].mKerningOffsets[(uchar) aPairsVector[i][1]] = anOffsetsVector[i];
							aLayer->GetCharData(aWString[0])->SetKerning(aWString[1], anOffsetsVector[i]);
						}
						else
							invalidParamFormat = true;
					}
				}
				else
					sizeMismatch = true;
			}
			else
				invalidParamFormat = true;
		}
		else
			invalidNumParams = true;
	}
	else if (stricmp(aCmd.c_str(), "LayerSetBaseOrder") == 0)
	{
		if (theParams.mElementVector.size() == 3)
		{
			FontLayer* aLayer;
			if ((DataToLayer(theParams.mElementVector[1], &aLayer)) &&
				(!theParams.mElementVector[2]->mIsList))
			{
				int aBaseOrder;
				if (StringToInt(((SingleDataElement*)theParams.mElementVector[2])->mString, &aBaseOrder))
				{
					aLayer->mBaseOrder = aBaseOrder;
				}
				else
					invalidParamFormat = true;
			}
			else
				invalidParamFormat = true;
		}
		else
			invalidNumParams = true;
	}
	else if (stricmp(aCmd.c_str(), "LayerSetCharOrders") == 0)
	{
		if (theParams.mElementVector.size() == 4)
		{
			FontLayer* aLayer;
			StringVector aCharsVector;
			IntVector aCharOrdersVector;

			if ((DataToLayer(theParams.mElementVector[1], &aLayer)) &&
				(DataToStringVector(theParams.mElementVector[2], &aCharsVector)) &&
				(DataToIntVector(theParams.mElementVector[3], &aCharOrdersVector)))
			{
				if (aCharsVector.size() == aCharOrdersVector.size())
				{
					for (unsigned int i = 0; i < aCharsVector.size(); i++)
					{
						if (aCharsVector[i].length() == 1)
						{
							//aLayer->mCharData[(uchar) aCharsVector[i][0]].mOrder = aCharOrdersVector[i];
							aLayer->GetCharData(aCharsVector[i][0])->mOrder = aCharOrdersVector[i];
						}
						else
							invalidParamFormat = true;
					}
				}
				else
					sizeMismatch = true;
			}
			else
				invalidParamFormat = true;
		}
		else
			invalidNumParams = true;
	}
	else if (stricmp(aCmd.c_str(), "LayerSetExInfo") == 0) {}
	else
	{
		Error("Unknown Command");
		return false;
	}

	if (invalidNumParams)
	{
		Error("Invalid Number of Parameters");
		return false;
	}

	if (invalidParamFormat)
	{
		Error("Invalid Paramater Type");
		return false;
	}

	if (literalError)
	{
		Error("Undefined Value");
		return false;
	}

	if (sizeMismatch)
	{
		Error("List Size Mismatch");
		return false;
	}

	return true;
}

bool FontData::LoadTextForTest(SexyAppBase* theSexyApp, const std::string& theFontDescFileName)
{
	if (mInitialized)
		return false;

	mApp = theSexyApp;
	mCurrentLine = "";

	mFontErrorHeader = "Font Descriptor Error in " + theFontDescFileName + "\r\n";

	mSourceFile = theFontDescFileName;

	mInitialized = LoadDescriptor(theFontDescFileName);

	return mInitialized;
}

bool FontData::LoadLegacy(Image* theFontImage, const std::string& theFontDescFileName)
{
	if (mInitialized)
		return false;

	std::unique_ptr<FILE, decltype(&fclose)> aStream(fopen(theFontDescFileName.c_str(), "r"), &fclose);
	if (!aStream)
		return false;

	// Parse privately: a failed descriptor must not publish a half-built layer
	// or leave its name pointing at a stale layer when the caller retries.
	FontLayerList aLayers;
	aLayers.emplace_back(this);
	FontLayer* aFontLayer = &aLayers.back();
	FontLayerMap aLayerMap{{"", aFontLayer}};
	CharMap aCharMap;
	std::string aSourceFile = theFontDescFileName;
	aFontLayer->mImage = (Image*)theFontImage;
	aFontLayer->mDefaultHeight = aFontLayer->mImage->mHeight;
	aFontLayer->mAscent = aFontLayer->mImage->mHeight;

	int aCharPos = 0;
	if (fscanf(aStream.get(), "%d%d", &aFontLayer->GetCharData(' ')->mWidth, &aFontLayer->mAscent) != 2)
		return false;

	for (;;)
	{
		char aBuf[2] = { 0, 0 }; // needed because fscanf will null terminate the string it reads
		int aWidth = 0;
		const int aFields = fscanf(aStream.get(), "%1s%d", aBuf, &aWidth);
		if (aFields == EOF && feof(aStream.get()) && !ferror(aStream.get()))
			break;
		if (aFields != 2 || aBuf[0] == 0 || ferror(aStream.get()))
			return false;
		const char aChar = aBuf[0];

		//aFontLayer->mCharData[(uchar) aChar].mImageRect = Rect(aCharPos, 0, aWidth, aFontLayer->mImage->mHeight);
		//aFontLayer->mCharData[(uchar) aChar].mWidth = aWidth;
		aFontLayer->GetCharData(aChar)->mImageRect = Rect(aCharPos, 0, aWidth, aFontLayer->mImage->mHeight);
		aFontLayer->GetCharData(aChar)->mWidth = aWidth;

		aCharPos += aWidth;
	}

	char c;

	for (c = 'A'; c <= 'Z'; c++)
		if ((aFontLayer->mCharData[c].mWidth == 0) && (aFontLayer->mCharData[c - 'A' + 'a'].mWidth != 0))
			//mCharMap[c] = c - 'A' + 'a';
			aCharMap.insert(CharMap::value_type(c, c - 'A' + 'a'));

	for (c = 'a'; c <= 'z'; c++)
		if ((aFontLayer->mCharData[c].mWidth == 0) && (aFontLayer->mCharData[c - 'a' + 'A'].mWidth != 0))
			//mCharMap[c] = c - 'a' + 'A';
			aCharMap.insert(CharMap::value_type(c, c - 'a' + 'A'));

	if (fclose(aStream.release()) != 0)
		return false;
	mFontLayerList.swap(aLayers);
	mFontLayerMap.swap(aLayerMap);
	mCharMap.swap(aCharMap);
	mSourceFile.swap(aSourceFile);
	// The source and every scaled atlas belong to the same application.
	mApp = static_cast<Image*>(theFontImage)->mApp;
	mInitialized = true;

	return true;
}

#endif

namespace {
constexpr unsigned kCompiledFontMagic = 0x544E464Eu;
constexpr unsigned kCompiledFontVersion = 1;
constexpr unsigned kMaxCompiledFontBytes = 16u * 1024u * 1024u;

unsigned FontPayloadCrc(const unsigned char* data, size_t size)
{
	unsigned crc = 0xFFFFFFFFu;
	for (size_t i = 0; i < size; ++i)
	{
		crc ^= data[i];
		for (unsigned bit = 0; bit < 8; ++bit)
			crc = (crc >> 1) ^ (0xEDB88320u & (0u - (crc & 1u)));
	}
	return ~crc;
}

struct CompiledFontReader
{
	const std::vector<unsigned char>& bytes;
	size_t pos = 0;
	bool valid = true;
	unsigned UInt()
	{
		if (bytes.size() - pos < 4) { valid = false; return 0; }
		unsigned value = unsigned(bytes[pos]) | (unsigned(bytes[pos + 1]) << 8)
			| (unsigned(bytes[pos + 2]) << 16) | (unsigned(bytes[pos + 3]) << 24);
		pos += 4;
		return value;
	}
	int Int() { return static_cast<int>(UInt()); }
	std::string Path()
	{
		const unsigned length = UInt();
		if (!valid || length > 4096 || length > bytes.size() - pos)
		{ valid = false; return {}; }
		std::string path(reinterpret_cast<const char*>(bytes.data() + pos), length);
		pos += length;
		if (path.find('\0') != std::string::npos) valid = false;
		return path;
	}
	bool Tags(std::vector<unsigned>& values, unsigned count)
	{
		const unsigned size = UInt();
		if (!valid || size > 4096 || size > (bytes.size() - pos) / 4) return false;
		for (unsigned i = 0; i < size; ++i)
		{
			const unsigned id = UInt();
			if (id >= count) return false;
			values.push_back(id);
		}
		return valid;
	}
};
}

std::string Sexy::ResolveCompiledFontPath(const std::string& theSourcePath)
{
	std::string path = theSourcePath;
	std::replace(path.begin(), path.end(), '\\', '/');
	if (StringToLower(path).ends_with(".font.compiled"))
		return {};
	const std::string suffix = ".compiled";
	if (path.size() >= suffix.size()
		&& StringToLower(path.substr(path.size() - suffix.size())) == suffix)
		return path;
	const size_t separator = path.find_last_of('/');
	std::string stem = path.substr(separator == std::string::npos ? 0 : separator + 1);
	if (stem.size() >= 4 && StringToLower(stem.substr(stem.size() - 4)) == ".txt")
		stem.resize(stem.size() - 4);
	return "compiled/fonts/" + stem + suffix;
}

bool FontData::Load(SexyAppBase* theSexyApp, const std::string& theFontDescFileName)
{
	if (mInitialized || theSexyApp == nullptr) return false;
	std::string path = ResolveCompiledFontPath(theFontDescFileName);
	if (path.empty()) return false;
	std::unique_ptr<PFILE, decltype(&p_fclose)> file(p_fopen(path.c_str(), "rb"), &p_fclose);
	if (!file || p_fseek(file.get(), 0, SEEK_END) != 0) return false;
	const int size = p_ftell(file.get());
	if (size < 32 || unsigned(size) > kMaxCompiledFontBytes
		|| p_fseek(file.get(), 0, SEEK_SET) != 0) return false;
	std::vector<unsigned char> bytes(size);
	if (p_fread(bytes.data(), 1, size, file.get()) != size_t(size)) return false;
	if (p_fclose(file.release()) != 0) return false;
	CompiledFontReader reader{bytes};
	if (reader.UInt() != kCompiledFontMagic || reader.UInt() != kCompiledFontVersion) return false;
	const unsigned payloadSize = reader.UInt();
	const unsigned crc = reader.UInt();
	const int pointSize = reader.Int();
	const unsigned mapCount = reader.UInt();
	const unsigned layerCount = reader.UInt();
	const unsigned tagCount = reader.UInt();
	if (payloadSize != bytes.size() - 32 || mapCount > 256 || layerCount == 0
		|| layerCount > 1024 || tagCount > 4096
		|| FontPayloadCrc(bytes.data() + 32, payloadSize) != crc) return false;
	CharMap charMap;
	for (unsigned i = 0; i < mapCount; ++i)
	{
		const unsigned from = reader.UInt(), to = reader.UInt();
		if (!reader.valid || from > 255 || to > 255
			|| !charMap.emplace(static_cast<SexyChar>(from), static_cast<SexyChar>(to)).second) return false;
	}
	FontLayerList layers;
	std::vector<std::string> imagePaths;
	std::vector<unsigned> layerIds;
	for (unsigned i = 0; i < layerCount; ++i)
	{
		layers.emplace_back(this);
		auto& layer = layers.back();
		layer.mLayerId = reader.UInt();
		if (layer.mLayerId >= layerCount
			|| std::find(layerIds.begin(), layerIds.end(), layer.mLayerId) != layerIds.end()) return false;
		layerIds.push_back(layer.mLayerId);
		imagePaths.push_back(reader.Path());
		if (imagePaths.back().empty() || !reader.Tags(layer.mRequiredTags, tagCount)
			|| !reader.Tags(layer.mExcludedTags, tagCount)) return false;
		layer.mDrawMode = reader.Int();
		layer.mOffset.mX = reader.Int(); layer.mOffset.mY = reader.Int();
		layer.mSpacing = reader.Int();
		layer.mMinPointSize = reader.Int(); layer.mMaxPointSize = reader.Int();
		layer.mPointSize = reader.Int(); layer.mAscent = reader.Int();
		layer.mAscentPadding = reader.Int(); layer.mHeight = reader.Int();
		layer.mDefaultHeight = reader.Int(); layer.mLineSpacingOffset = reader.Int();
		layer.mBaseOrder = reader.Int();
		const unsigned alpha = reader.UInt();
		if (alpha > 1 || layer.mDrawMode < -1 || layer.mDrawMode > 1) return false;
		layer.mUseAlphaCorrection = alpha != 0;
		for (int c = 0; c < 4; ++c) layer.mColorMult[c] = reader.Int();
		for (int c = 0; c < 4; ++c) layer.mColorAdd[c] = reader.Int();
		const unsigned glyphCount = reader.UInt();
		if (!reader.valid || glyphCount > FontLayer::kCharSlots) return false;
		bool seen[FontLayer::kCharSlots]{};
		for (unsigned g = 0; g < glyphCount; ++g)
		{
			const unsigned ch = reader.UInt();
			if (ch >= FontLayer::kCharSlots || seen[ch]) return false;
			seen[ch] = true;
			auto& glyph = layer.mCharData[ch];
			glyph.mImageRect.mX = reader.Int(); glyph.mImageRect.mY = reader.Int();
			glyph.mImageRect.mWidth = reader.Int(); glyph.mImageRect.mHeight = reader.Int();
			glyph.mOffset.mX = reader.Int(); glyph.mOffset.mY = reader.Int();
			glyph.mWidth = reader.Int(); glyph.mOrder = reader.Int();
			const unsigned kernCount = reader.UInt();
			if (!reader.valid || kernCount > 256) return false;
			bool kernSeen[256]{};
			for (unsigned k = 0; k < kernCount; ++k)
			{
				const unsigned next = reader.UInt();
				const int offset = reader.Int();
				if (!reader.valid || next > 255 || kernSeen[next]) return false;
				kernSeen[next] = true;
				glyph.mKerningPairs.emplace_back(static_cast<SexyChar>(next), offset);
			}
		}
	}
	if (!reader.valid || reader.pos != bytes.size()) return false;
	// Parse and validate all records privately before opening image resources.
	size_t index = 0;
	for (auto& layer : layers)
	{
		const auto& imagePath = imagePaths[index++];
		layer.mImage = theSexyApp->GetPreparedSharedImage(imagePath, 0, nullptr, {});
		if (static_cast<Image*>(layer.mImage) == nullptr) return false;
		for (const auto& glyph : layer.mCharData)
		{
			const auto& rect = glyph.mImageRect;
			if (rect.mX < 0 || rect.mY < 0 || rect.mWidth < 0 || rect.mHeight < 0
				|| static_cast<long long>(rect.mX) + rect.mWidth > layer.mImage->mWidth
				|| static_cast<long long>(rect.mY) + rect.mHeight > layer.mImage->mHeight) return false;
		}
	}
	for (auto& layer : layers) TodQueueTextureWarm(layer.mImage);
	mFontLayerList.swap(layers);
	mCharMap.swap(charMap);
	mDefaultPointSize = pointSize;
	mApp = theSexyApp;
	mSourceFile.swap(path);
	mInitialized = true;
	return true;
}

////

ActiveFontLayer::ActiveFontLayer()
{
	mScaledImage = NULL;
	mOwnsImage = false;
}

ActiveFontLayer::ActiveFontLayer(const ActiveFontLayer& theActiveFontLayer) :
	mBaseFontLayer(theActiveFontLayer.mBaseFontLayer),
	mScaledImage(theActiveFontLayer.mScaledImage),
	mOwnsImage(theActiveFontLayer.mOwnsImage)
{
	std::copy(std::begin(theActiveFontLayer.mScaledCharImageRects),
		std::end(theActiveFontLayer.mScaledCharImageRects), std::begin(mScaledCharImageRects));
	// Owned GPU atlases retain the same rectangle map; duplication is GPU-only.
	if (mOwnsImage)
		mScaledImage = new Image(*static_cast<Image*>(theActiveFontLayer.mScaledImage));
}

ActiveFontLayer::~ActiveFontLayer()
{
	if (mOwnsImage)
		delete static_cast<Image*>(mScaledImage);
}

////

ImageFont::ImageFont(SexyAppBase* theSexyApp, const std::string& theFontDescFileName)
{
	mScale = 1.0;
	mForceScaledImagesWhite = false;
	auto aFontData = std::make_unique<FontData>();
	mFontData = aFontData.get();
	mFontData->Ref();
	mFontData->Load(theSexyApp, theFontDescFileName);
	mPointSize = mFontData->mDefaultPointSize;
	GenerateActiveFontLayers();
	mActiveListValid = true;
	aFontData.release();
}

ImageFont::ImageFont(Image* theFontImage)
{
	mScale = 1.0;
	auto aFontData = std::make_unique<FontData>();
	mFontData = aFontData.get();
	mFontData->mApp = static_cast<Image*>(theFontImage)->mApp;
	mFontData->Ref();
	mFontData->mInitialized = true;
	mPointSize = mFontData->mDefaultPointSize;
	mActiveListValid = false;
	mForceScaledImagesWhite = false;

	mFontData->mFontLayerList.emplace_back(mFontData);
	FontLayer* aFontLayer = &mFontData->mFontLayerList.back();

#if defined(SEXY_FONT_TEXT_COMPAT_TEST_ONLY)
	(void)mFontData->mFontLayerMap.insert(FontLayerMap::value_type("", aFontLayer)).first;
#endif

	aFontLayer->mImage = (Image*)theFontImage;
	aFontLayer->mDefaultHeight = aFontLayer->mImage->mHeight;
	aFontLayer->mAscent = aFontLayer->mImage->mHeight;
	aFontData.release();
}

ImageFont::ImageFont(const ImageFont& theImageFont) :
	_Font(theImageFont),
	mFontData(theImageFont.mFontData),
	mPointSize(theImageFont.mPointSize),
	mTagIds(theImageFont.mTagIds),
	mActiveListValid(theImageFont.mActiveListValid),
	mScale(theImageFont.mScale),
	mForceScaledImagesWhite(theImageFont.mForceScaledImagesWhite)
{
	if (mActiveListValid)
	{
		for (const ActiveFontLayer& aLayer : theImageFont.mActiveLayerList)
			mActiveLayerList.emplace_back(aLayer);
	}
	// The source retains FontData during construction. Acquire our reference
	// only after all layer copies succeed; a failed constructor has no destructor.
	mFontData->Ref();
}

#if defined(SEXY_FONT_TEXT_COMPAT_TEST_ONLY)
ImageFont::ImageFont(Image* theFontImage, const std::string& theFontDescFileName)
{

	mScale = 1.0;
	mForceScaledImagesWhite = false;
	auto aFontData = std::make_unique<FontData>();
	mFontData = aFontData.get();
	mFontData->Ref();
	mFontData->LoadLegacy(theFontImage, theFontDescFileName);
	mPointSize = mFontData->mDefaultPointSize;
	GenerateActiveFontLayers();
	mActiveListValid = true;
	aFontData.release();
}

#endif

ImageFont::~ImageFont()
{
	mFontData->DeRef();
}

/*ImageFont::ImageFont(const ImageFont& theImageFont, Image* theImage) :
	_Font(theImageFont),
	mImage(theImage)
{
	for (int i = 0; i < 256; i++)
	{
		mCharPos[i] = theImageFont.mCharPos[i];
		mCharWidth[i] = theImageFont.mCharWidth[i];
	}
}*/

void ImageFont::GenerateActiveFontLayers()
{
	if (!mFontData->mInitialized)
		return;

	mActiveLayerList.clear();

	unsigned int i;

	mAscent = 0;
	mAscentPadding = 0;
	mHeight = 0;
	mLineSpacingOffset = 0;

	FontLayerList::iterator anItr = mFontData->mFontLayerList.begin();

	bool firstLayer = true;

	while (anItr != mFontData->mFontLayerList.end())
	{
		FontLayer* aFontLayer = &*anItr;

		if ((mPointSize >= aFontLayer->mMinPointSize) &&
			((mPointSize <= aFontLayer->mMaxPointSize) || (aFontLayer->mMaxPointSize == -1)))
		{
			bool active = true;

			// Make sure all required tags are included
			for (i = 0; i < aFontLayer->mRequiredTags.size(); i++)
				if (std::find(mTagIds.begin(), mTagIds.end(), aFontLayer->mRequiredTags[i]) == mTagIds.end())
					active = false;

			// Make sure no excluded tags are included
			for (i = 0; i < mTagIds.size(); i++)
				if (std::find(aFontLayer->mExcludedTags.begin(), aFontLayer->mExcludedTags.end(),
					mTagIds[i]) != aFontLayer->mExcludedTags.end())
					active = false;

			if (active)
			{
				mActiveLayerList.emplace_back();

				ActiveFontLayer* anActiveFontLayer = &mActiveLayerList.back();

				anActiveFontLayer->mBaseFontLayer = aFontLayer;

				double aLayerPointSize = 1;
				double aPointSize = mScale;

				if ((mScale == 1.0) && ((aFontLayer->mPointSize == 0) || (mPointSize == aFontLayer->mPointSize)))
				{
					anActiveFontLayer->mScaledImage = aFontLayer->mImage;
					anActiveFontLayer->mOwnsImage = false;

					// Use the specified point size

					//for (int aCharNum = 0; aCharNum < 256; aCharNum++)
					//	anActiveFontLayer->mScaledCharImageRects[aCharNum] = aFontLayer->GetCharData(aCharNum)->mImageRect;aFontLayer->mCharData[aCharNum].mImageRect;
					for (int aCharNum = 0; aCharNum < aFontLayer->kCharSlots; aCharNum++)
					{
						if (aFontLayer->mCharData[aCharNum].mWidth == 0)
							continue;  // 未注册字符（与 map 版只含已注册键等价）
						anActiveFontLayer->mScaledCharImageRects[aCharNum] = aFontLayer->mCharData[aCharNum].mImageRect;
					}
				}
				else
				{
					if (aFontLayer->mPointSize != 0)
					{
						aLayerPointSize = aFontLayer->mPointSize;
						aPointSize = mPointSize * mScale;
					}

					// Resize font elements

					int aCurX = 0;
					int aMaxHeight = 0;

					//for (aCharNum = 0; aCharNum < 256; aCharNum++)
					//{
					//	Rect* anOrigRect = &aFontLayer->mCharData[aCharNum].mImageRect;
					//
					//	Rect aScaledRect(aCurX, 0,  
					//		(int) ((anOrigRect->mWidth * aPointSize) / aLayerPointSize),
					//		(int) ((anOrigRect->mHeight * aPointSize) / aLayerPointSize));
					//
					//	anActiveFontLayer->mScaledCharImageRects[aCharNum] = aScaledRect;
					//
					//	if (aScaledRect.mHeight > aMaxHeight)
					//		aMaxHeight = aScaledRect.mHeight;
					//
					//	aCurX += aScaledRect.mWidth;
					//}
					for (int aCharNum = 0; aCharNum < aFontLayer->kCharSlots; aCharNum++)
					{
						if (aFontLayer->mCharData[aCharNum].mWidth == 0)
							continue;
						Rect* anOrigRect = &aFontLayer->mCharData[aCharNum].mImageRect;

						Rect aScaledRect(aCurX, 0,
							(int)((anOrigRect->mWidth * aPointSize) / aLayerPointSize),
							(int)((anOrigRect->mHeight * aPointSize) / aLayerPointSize));

						anActiveFontLayer->mScaledCharImageRects[aCharNum] = aScaledRect;

						if (aScaledRect.mHeight > aMaxHeight)
							aMaxHeight = aScaledRect.mHeight;

						aCurX += aScaledRect.mWidth;
					}

					// Create the image now

					auto& render=*mFontData->mApp->mDDInterface->mRenderInterface;
					auto* aMemoryImage=render.CreateRenderImage(aCurX,aMaxHeight);
					anActiveFontLayer->mScaledImage=aMemoryImage;
					anActiveFontLayer->mOwnsImage=true;
					std::vector<GpuFontGlyph> glyphs;
					glyphs.reserve(aFontLayer->kCharSlots);
					for (int aCharNum = 0; aCharNum < aFontLayer->kCharSlots; aCharNum++)
					{
						if (aFontLayer->mCharData[aCharNum].mWidth == 0)
							continue;
						const auto& source=aFontLayer->mCharData[aCharNum].mImageRect;
						const auto& target=anActiveFontLayer->mScaledCharImageRects[aCharNum];
						if (source.mWidth==0 || source.mHeight==0 || target.mWidth==0 || target.mHeight==0)
							continue;
						glyphs.push_back({source.mX,source.mY,source.mWidth,source.mHeight,
							target.mX,target.mY,target.mWidth,target.mHeight});
					}
					render.RenderFontAtlas(aMemoryImage,static_cast<Image*>(aFontLayer->mImage),
						glyphs,mForceScaledImagesWhite);
				}

				int aLayerAscent = (aFontLayer->mAscent * aPointSize) / aLayerPointSize;
				if (aLayerAscent > mAscent)
					mAscent = aLayerAscent;

				if (aFontLayer->mHeight != 0)
				{
					int aLayerHeight = (aFontLayer->mHeight * aPointSize) / aLayerPointSize;
					if (aLayerHeight > mHeight)
						mHeight = aLayerHeight;
				}
				else
				{
					int aLayerHeight = (aFontLayer->mDefaultHeight * aPointSize) / aLayerPointSize;
					if (aLayerHeight > mHeight)
						mHeight = aLayerHeight;
				}

				int anAscentPadding = (aFontLayer->mAscentPadding * aPointSize) / aLayerPointSize;
				if ((firstLayer) || (anAscentPadding < mAscentPadding))
					mAscentPadding = anAscentPadding;

				int aLineSpacingOffset = (aFontLayer->mLineSpacingOffset * aPointSize) / aLayerPointSize;
				if ((firstLayer) || (aLineSpacingOffset > mLineSpacingOffset))
					mLineSpacingOffset = aLineSpacingOffset;

				firstLayer = false;
			}
		}

		++anItr;
	}
}

int ImageFont::StringWidth(const SexyString& theString)
{
	int aWidth = 0;
	SexyChar aPrevChar = 0;
	for (int i = 0; i < (int)theString.length(); i++)
	{
		SexyChar aChar = theString[i];
		aWidth += CharWidthKern(aChar, aPrevChar);
		aPrevChar = aChar;
	}

	return aWidth;
}

int ImageFont::CharWidthKern(SexyChar theChar, SexyChar thePrevChar)
{
	Prepare();

	int aMaxXPos = 0;
	double aPointSize = mPointSize * mScale;

	//theChar = mFontData->mCharMap[(uchar)theChar];
	//if (thePrevChar != 0)
	//	thePrevChar = mFontData->mCharMap[(uchar)thePrevChar];
	theChar = GetMappedChar(theChar);
	if (thePrevChar != 0)
		thePrevChar = GetMappedChar(thePrevChar);

	ActiveFontLayerList::iterator anItr = mActiveLayerList.begin();
	while (anItr != mActiveLayerList.end())
	{
		ActiveFontLayer* anActiveFontLayer = &*anItr;

		int aLayerXPos = 0;

		int aCharWidth;
		int aSpacing;

		int aLayerPointSize = anActiveFontLayer->mBaseFontLayer->mPointSize;

		if (aLayerPointSize == 0)
		{
			aCharWidth = anActiveFontLayer->mBaseFontLayer->GetCharData(theChar)/*mCharData[(uchar) theChar].*/->mWidth * mScale;

			if (thePrevChar != 0)
			{
				//aSpacing = (anActiveFontLayer->mBaseFontLayer->mSpacing + 
				//	anActiveFontLayer->mBaseFontLayer->mCharData[(uchar) thePrevChar].->mKerningOffsets[(uchar) theChar]) * mScale;
				aSpacing = (anActiveFontLayer->mBaseFontLayer->mSpacing +
					anActiveFontLayer->mBaseFontLayer->GetCharData(thePrevChar)->GetKerning(theChar)) * mScale;
			}
			else
				aSpacing = 0;
		}
		else
		{
			aCharWidth = (anActiveFontLayer->mBaseFontLayer->GetCharData(theChar)/*mCharData[(uchar) theChar].*/->mWidth * aPointSize / aLayerPointSize);

			if (thePrevChar != 0)
			{
				//aSpacing = (anActiveFontLayer->mBaseFontLayer->mSpacing + 
				//	anActiveFontLayer->mBaseFontLayer->mCharData[(uchar) thePrevChar].mKerningOffsets[(uchar) theChar]) * aPointSize / aLayerPointSize;
				aSpacing = (anActiveFontLayer->mBaseFontLayer->mSpacing +
					anActiveFontLayer->mBaseFontLayer->GetCharData(thePrevChar)->GetKerning(theChar)) * aPointSize / aLayerPointSize;
			}
			else
				aSpacing = 0;
		}

		aLayerXPos += aCharWidth + aSpacing;

		if (aLayerXPos > aMaxXPos)
			aMaxXPos = aLayerXPos;

		++anItr;
	}

	return aMaxXPos;
}

int ImageFont::CharWidth(SexyChar theChar)
{
	return CharWidthKern(theChar, 0);
}

CritSect gRenderCritSec;
static const int POOL_SIZE = 4096;
static RenderCommand gRenderCommandPool[POOL_SIZE];
static RenderCommand* gRenderTail[256];
static RenderCommand* gRenderHead[256];

void ImageFont::DrawStringEx(Graphics* g, int theX, int theY, const SexyString& theString, const Color& theColor, RectList* theDrawnAreas, int* theWidth)
{
	AutoCrit anAutoCrit(gRenderCritSec);

	int aPoolIdx;

	for (aPoolIdx = 0; aPoolIdx < 256; aPoolIdx++)
	{
		gRenderHead[aPoolIdx] = NULL;
		gRenderTail[aPoolIdx] = NULL;
	}

	// int aXPos = theX; // unused

	if (theDrawnAreas != NULL)
		theDrawnAreas->clear();


	/*if (theDrawnArea != NULL)
		*theDrawnArea = Rect(0, 0, 0, 0);*/

	if (!mFontData->mInitialized)
	{
		if (theWidth != NULL)
			*theWidth = 0;
		return;
	}

	Prepare();

	bool colorizeImages = g->mColorizeImages;
	g->mColorizeImages = true;

	int aCurXPos = theX;
	int aCurPoolIdx = 0;

	for (unsigned int aCharNum = 0; aCharNum < theString.length(); aCharNum++)
	{
		SexyChar aChar = GetMappedChar(theString[aCharNum]);//mFontData->mCharMap[(uchar) theString[aCharNum]];

		SexyChar aNextChar = 0;
		if (aCharNum < theString.length() - 1)
			aNextChar = GetMappedChar(theString[aCharNum + 1]);//mFontData->mCharMap[(uchar) theString[aCharNum+1]];

		int aMaxXPos = aCurXPos;

		ActiveFontLayerList::iterator anItr = mActiveLayerList.begin();
		while (anItr != mActiveLayerList.end())
		{
			ActiveFontLayer* anActiveFontLayer = &*anItr;

			int aLayerXPos = aCurXPos;

			int anImageX;
			int anImageY;
			int aCharWidth;
			int aSpacing;

			int aLayerPointSize = anActiveFontLayer->mBaseFontLayer->mPointSize;

			double aScale = mScale;
			if (aLayerPointSize != 0)
				aScale *= (float)mPointSize / (float)aLayerPointSize;

			if (aScale == 1.0)
			{
				//anImageX = aLayerXPos + anActiveFontLayer->mBaseFontLayer->mOffset.mX + anActiveFontLayer->mBaseFontLayer->mCharData[(uchar) aChar].mOffset.mX;
				//anImageY = theY - (anActiveFontLayer->mBaseFontLayer->mAscent - anActiveFontLayer->mBaseFontLayer->mOffset.mY - anActiveFontLayer->mBaseFontLayer->mCharData[(uchar) aChar].mOffset.mY);
				//aCharWidth = anActiveFontLayer->mBaseFontLayer->mCharData[(uchar) aChar].mWidth;				
				anImageX = aLayerXPos + anActiveFontLayer->mBaseFontLayer->mOffset.mX + anActiveFontLayer->mBaseFontLayer->GetCharData(aChar)->mOffset.mX;
				anImageY = theY - (anActiveFontLayer->mBaseFontLayer->mAscent - anActiveFontLayer->mBaseFontLayer->mOffset.mY - anActiveFontLayer->mBaseFontLayer->GetCharData(aChar)->mOffset.mY);
				aCharWidth = anActiveFontLayer->mBaseFontLayer->GetCharData(aChar)->mWidth;

				if (aNextChar != 0)
				{
					//aSpacing = anActiveFontLayer->mBaseFontLayer->mSpacing + 
				   //	 anActiveFontLayer->mBaseFontLayer->mCharData[(uchar) aChar].mKerningOffsets[(uchar) aNextChar];
					aSpacing = anActiveFontLayer->mBaseFontLayer->mSpacing +
						anActiveFontLayer->mBaseFontLayer->GetCharData(aChar)->GetKerning(aNextChar);
				}
				else
					aSpacing = 0;
			}
			else
			{
				//anImageX = aLayerXPos + (int) ((anActiveFontLayer->mBaseFontLayer->mOffset.mX + anActiveFontLayer->mBaseFontLayer->mCharData[(uchar) aChar].mOffset.mX) * aScale);
				//anImageY = theY - (int) ((anActiveFontLayer->mBaseFontLayer->mAscent - anActiveFontLayer->mBaseFontLayer->mOffset.mY - anActiveFontLayer->mBaseFontLayer->mCharData[(uchar) aChar].mOffset.mY) * aScale);
				//aCharWidth = (anActiveFontLayer->mBaseFontLayer->mCharData[(uchar) aChar].mWidth * aScale);
				anImageX = aLayerXPos + (int)((anActiveFontLayer->mBaseFontLayer->mOffset.mX + anActiveFontLayer->mBaseFontLayer->GetCharData(aChar)->mOffset.mX) * aScale);
				anImageY = theY - (int)((anActiveFontLayer->mBaseFontLayer->mAscent - anActiveFontLayer->mBaseFontLayer->mOffset.mY - anActiveFontLayer->mBaseFontLayer->GetCharData(aChar)->mOffset.mY) * aScale);
				aCharWidth = (anActiveFontLayer->mBaseFontLayer->GetCharData(aChar)->mWidth * aScale);

				if (aNextChar != 0)
				{
					//aSpacing = (int) ((anActiveFontLayer->mBaseFontLayer->mSpacing + 
					//	 anActiveFontLayer->mBaseFontLayer->mCharData[(uchar) aChar].mKerningOffsets[(uchar) aNextChar]) * aScale);
					aSpacing = (int)((anActiveFontLayer->mBaseFontLayer->mSpacing +
						anActiveFontLayer->mBaseFontLayer->GetCharData(aChar)->GetKerning(aNextChar)) * aScale);
				}
				else
					aSpacing = 0;
			}

			Color aColor;
			aColor.mRed = std::min((theColor.mRed * anActiveFontLayer->mBaseFontLayer->mColorMult.mRed / 255) + anActiveFontLayer->mBaseFontLayer->mColorAdd.mRed, 255);
			aColor.mGreen = std::min((theColor.mGreen * anActiveFontLayer->mBaseFontLayer->mColorMult.mGreen / 255) + anActiveFontLayer->mBaseFontLayer->mColorAdd.mGreen, 255);
			aColor.mBlue = std::min((theColor.mBlue * anActiveFontLayer->mBaseFontLayer->mColorMult.mBlue / 255) + anActiveFontLayer->mBaseFontLayer->mColorAdd.mBlue, 255);
			aColor.mAlpha = std::min((theColor.mAlpha * anActiveFontLayer->mBaseFontLayer->mColorMult.mAlpha / 255) + anActiveFontLayer->mBaseFontLayer->mColorAdd.mAlpha, 255);

			//int anOrder = anActiveFontLayer->mBaseFontLayer->mBaseOrder + anActiveFontLayer->mBaseFontLayer->mCharData[(uchar) aChar].mOrder;
			int anOrder = anActiveFontLayer->mBaseFontLayer->mBaseOrder + anActiveFontLayer->mBaseFontLayer->GetCharData(aChar)->mOrder;

			if (aCurPoolIdx >= POOL_SIZE)
				break;

			RenderCommand* aRenderCommand = &gRenderCommandPool[aCurPoolIdx++];

			aRenderCommand->mImage = anActiveFontLayer->mScaledImage;
			aRenderCommand->mColor = aColor;
			aRenderCommand->mDest[0] = anImageX;
			aRenderCommand->mDest[1] = anImageY;
			//aRenderCommand->mSrc[0] = anActiveFontLayer->mScaledCharImageRects[(uchar) aChar].mX;
			//aRenderCommand->mSrc[1] = anActiveFontLayer->mScaledCharImageRects[(uchar) aChar].mY;
			//aRenderCommand->mSrc[2] = anActiveFontLayer->mScaledCharImageRects[(uchar) aChar].mWidth;
			//aRenderCommand->mSrc[3] = anActiveFontLayer->mScaledCharImageRects[(uchar) aChar].mHeight;
			aRenderCommand->mSrc[0] = anActiveFontLayer->mScaledCharImageRects[aChar].mX;
			aRenderCommand->mSrc[1] = anActiveFontLayer->mScaledCharImageRects[aChar].mY;
			aRenderCommand->mSrc[2] = anActiveFontLayer->mScaledCharImageRects[aChar].mWidth;
			aRenderCommand->mSrc[3] = anActiveFontLayer->mScaledCharImageRects[aChar].mHeight;
			aRenderCommand->mMode = anActiveFontLayer->mBaseFontLayer->mDrawMode;
			aRenderCommand->mNext = NULL;

			int anOrderIdx = std::min(std::max(anOrder + 128, 0), 255);

			if (gRenderTail[anOrderIdx] == NULL)
			{
				gRenderTail[anOrderIdx] = aRenderCommand;
				gRenderHead[anOrderIdx] = aRenderCommand;
			}
			else
			{
				gRenderTail[anOrderIdx]->mNext = aRenderCommand;
				gRenderTail[anOrderIdx] = aRenderCommand;
			}

			//aRenderCommandMap.insert(RenderCommandMap::value_type(aPriority, aRenderCommand));

			/*int anOldDrawMode = g->mDrawMode;
			if (anActiveFontLayer->mBaseFontLayer->mDrawMode != -1)
				g->mDrawMode = anActiveFontLayer->mBaseFontLayer->mDrawMode;
			Color anOrigColor = g->mColor;
			g->mColor = aColor;
			if (anActiveFontLayer->mScaledImage != NULL)
				g->DrawImage(anActiveFontLayer->mScaledImage, anImageX, anImageY, anActiveFontLayer->mScaledCharImageRects[aChar]);
			g->mColor = anOrigColor;
			g->mDrawMode = anOldDrawMode;*/

			if (theDrawnAreas != NULL)
			{
				//Rect aDestRect = Rect(anImageX, anImageY, anActiveFontLayer->mScaledCharImageRects[(uchar) aChar].mWidth, anActiveFontLayer->mScaledCharImageRects[(uchar) aChar].mHeight);
				Rect aDestRect(anImageX, anImageY, anActiveFontLayer->mScaledCharImageRects[aChar].mWidth, anActiveFontLayer->mScaledCharImageRects[aChar].mHeight);

				theDrawnAreas->push_back(aDestRect);

				/*if (theDrawnArea->mWidth == 0)
					*theDrawnArea = theDestRect;
				else
				{
					if (theDestRect.mX < theDrawnArea->mX)
					{
						int aDiff = theDestRect.mX - theDrawnArea->mX;
						theDrawnArea->mX += aDiff;
						theDrawnArea->mWidth += aDiff;
					}

					if (theDestRect.mX + theDestRect.mWidth > theDrawnArea->mX + theDrawnArea->mWidth)
						theDrawnArea->mWidth = theDestRect.mX + theDestRect.mWidth - theDrawnArea->mX;

					if (theDestRect.mY < theDrawnArea->mY)
					{
						int aDiff = theDestRect.mY - theDrawnArea->mY;
						theDrawnArea->mY += aDiff;
						theDrawnArea->mHeight += aDiff;
					}

					if (theDestRect.mY + theDestRect.mHeight > theDrawnArea->mY + theDrawnArea->mHeight)
						theDrawnArea->mHeight = theDestRect.mY + theDestRect.mHeight - theDrawnArea->mY;
				}*/
			}

			aLayerXPos += aCharWidth + aSpacing;

			if (aLayerXPos > aMaxXPos)
				aMaxXPos = aLayerXPos;

			++anItr;
		}

		aCurXPos = aMaxXPos;
	}

	if (theWidth != NULL)
		*theWidth = aCurXPos - theX;

	Color anOrigColor = g->mColor;
	const bool anOldLinearBlend = g->mLinearBlend;
	// Bitmap font glyphs must be point-sampled; linear filtering makes thin
	// strokes and the sun counter hard to read (blurry / faint).
	g->mLinearBlend = false;

	for (aPoolIdx = 0; aPoolIdx < 256; aPoolIdx++)
	{
		RenderCommand* aRenderCommand = gRenderHead[aPoolIdx];

		while (aRenderCommand != NULL)
		{
			int anOldDrawMode = g->mDrawMode;
			if (aRenderCommand->mMode != -1)
				g->mDrawMode = aRenderCommand->mMode;
			g->mColor = Color(aRenderCommand->mColor);
			if (aRenderCommand->mImage != NULL)
				g->DrawImage(aRenderCommand->mImage, aRenderCommand->mDest[0], aRenderCommand->mDest[1], Rect(aRenderCommand->mSrc[0], aRenderCommand->mSrc[1], aRenderCommand->mSrc[2], aRenderCommand->mSrc[3]));
			g->mDrawMode = anOldDrawMode;

			aRenderCommand = aRenderCommand->mNext;
		}
	}

	g->mColor = anOrigColor;
	g->mLinearBlend = anOldLinearBlend;

	/*RenderCommandMap::iterator anItr = aRenderCommandMap.begin();
	while (anItr != aRenderCommandMap.end())
	{
		RenderCommand* aRenderCommand = &anItr->second;

		int anOldDrawMode = g->mDrawMode;
		if (aRenderCommand->mMode != -1)
			g->mDrawMode = aRenderCommand->mMode;
		Color anOrigColor = g->mColor;
		g->mColor = aRenderCommand->mColor;
		if (aRenderCommand->mImage != NULL)
			g->DrawImage(aRenderCommand->mImage, aRenderCommand->mDest.mX, aRenderCommand->mDest.mY, aRenderCommand->mSrc);
		g->mColor = anOrigColor;
		g->mDrawMode = anOldDrawMode;

		++anItr;
	}*/

	g->mColorizeImages = colorizeImages;
}

void ImageFont::DrawString(Graphics* g, int theX, int theY, const SexyString& theString, const Color& theColor, const Rect& theClipRect)
{
	(void)theClipRect;
	DrawStringEx(g, theX, theY, theString, theColor, NULL, NULL);
}

_Font* ImageFont::Duplicate()
{
	return new ImageFont(*this);
}

void ImageFont::SetPointSize(int thePointSize)
{
	mPointSize = thePointSize;
	mActiveListValid = false;
}

void ImageFont::SetScale(double theScale)
{
	mScale = theScale;
	mActiveListValid = false;
}

bool ImageFont::AddTagNumeric(unsigned theTagId)
{
	if (HasTagNumeric(theTagId)) return false;
	mTagIds.push_back(theTagId);
	mActiveListValid = false;
	return true;
}

bool ImageFont::RemoveTagNumeric(unsigned theTagId)
{
	auto it = std::find(mTagIds.begin(), mTagIds.end(), theTagId);
	if (it == mTagIds.end()) return false;
	mTagIds.erase(it);
	mActiveListValid = false;
	return true;
}

bool ImageFont::HasTagNumeric(unsigned theTagId) const
{
	return std::find(mTagIds.begin(), mTagIds.end(), theTagId) != mTagIds.end();
}

#if defined(SEXY_FONT_TEXT_COMPAT_TEST_ONLY)
std::string ImageFont::GetDefine(const std::string& theName)
{
	DataElement* aDataElement = mFontData->Dereference(theName);

	if (aDataElement == NULL)
		return "";

	return mFontData->DataElementToString(aDataElement);
}

#endif

void ImageFont::Prepare()
{
	if (!mActiveListValid)
	{
		GenerateActiveFontLayers();
		mActiveListValid = true;
	}
}

SexyChar ImageFont::GetMappedChar(SexyChar theChar)
{
	auto anItr = mFontData->mCharMap.find(theChar);
	if (anItr != mFontData->mCharMap.end())
	{
		return anItr->second;
	}
	return theChar;
}
