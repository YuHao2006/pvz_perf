#pragma once
#include "graphics/Graphics.h"
#include "ConstEnums.h"
#include "generated/LawnStrings.h"
#include "NumericTextControls.h"
using namespace Sexy;

//enum DrawStringJustification;
enum TodStringFormatFlag
{
    TOD_FORMAT_IGNORE_NEWLINES,
    TOD_FORMAT_HIDE_UNTIL_MAGNETSHROOM
};

class TodStringListFormat
{
public:
    StringFormatId  mFormatId;
    _Font**          mNewFont;
    Color           mNewColor;
    int             mLineSpacingOffset;
    unsigned int    mFormatFlags;

public:
    TodStringListFormat();
    TodStringListFormat(StringFormatId theFormatId, _Font** theFont, const Color& theColor, int theLineSpacingOffset, unsigned int theFormatFlags);
};
extern int gTodStringFormatCount;               //[0x69DE4C]
extern TodStringListFormat* gTodStringFormats;  //[0x69DA34]

extern const int gLawnStringFormatCount;
extern TodStringListFormat gLawnStringFormats[12];  //0x6A5010

// 以下三个查表 API 已随 properties 字符串表退役删除（阶段 4），
// 调用点改走 generated/EntityStrings.h 的 Entity* 系列。
int                 TodWriteString(Graphics* g, const SexyString& theString, int theX, int theY, TodStringListFormat& theCurrentFormat, int theWidth, DrawStringJustification theJustification, bool drawString, int theOffset, int theLength);
/*inline*/ int      TodWriteWordWrappedHelper(Graphics* g, const SexyString& theString, int theX, int theY, TodStringListFormat& theCurrentFormat, int theWidth, DrawStringJustification theJustification, bool drawString, int theOffset, int theLength, int theMaxChars);
int                 TodDrawStringWrappedHelper(Graphics* g, const SexyString& theText, const Rect& theRect, _Font* theFont, const Color& theColor, DrawStringJustification theJustification, bool drawString);
/*inline*/ void		TodDrawStringWrapped(Graphics* g, const SexyString& theText, const Rect& theRect, _Font* theFont, const Color& theColor, DrawStringJustification theJustification);
