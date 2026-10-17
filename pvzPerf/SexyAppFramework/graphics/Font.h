#pragma once
#include "Common.h"
#include "misc/Rect.h"
#include "Color.h"
#include <exception>
#include <string>

namespace Sexy
{

class Graphics;

class FontNotConfigured : public std::exception
{
};

class _Font
{
public:
	int						mAscent;
	int						mAscentPadding; // How much space is above the avg uppercase char
	int						mHeight;
	int						mLineSpacingOffset; // This plus height should get added between lines
public:
	_Font();
	_Font(const _Font& theFont);
	virtual ~_Font();

	int				GetDescent() { return mHeight - mAscent; }
	int				GetLineSpacing() { return mHeight + mLineSpacingOffset; }
	virtual int				StringWidth(const SexyString& theString);
	virtual int				CharWidth(SexyChar theChar);
	virtual int				CharWidthKern(SexyChar theChar, SexyChar thePrevChar);

	virtual void			DrawString(Graphics* g, int theX, int theY, const SexyString& theString, const Color& theColor, const Rect& theClipRect);

	virtual _Font*			Duplicate() = 0;
};

}
