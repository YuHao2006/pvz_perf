#pragma once

#include "ConstEnums.h"
#include <cstdint>
#include <cstddef>
#include <cmath>
#include "SexyAppFramework/graphics/Graphics.h"

using namespace Sexy;

class LawnApp;
class Board;

class GameObject
{
public:
	LawnApp*                        mApp;
	Board*                          mBoard;
    float                           mX;
    float                           mY;
    int                             mWidth;
    int                             mHeight;
    bool                            mVisible;
    int                             mRow;
    int                             mRenderOrder;
    // Occupy MSVC's tail padding so other ABIs cannot reuse it in derived
    // classes; the existing dat64 field offsets remain identical.
    unsigned int                    mSaveLayoutPadding = 0;

public:
    /*inline*/                      GameObject();
    /*inline*/ bool                 BeginDraw(Graphics* g);
    /*inline*/ void                 EndDraw(Graphics* g);
    /*inline*/ void                 MakeParentGraphicsFrame(Graphics* g);
};

static_assert(sizeof(GameObject::mX) == sizeof(std::int32_t));
static_assert(sizeof(GameObject::mY) == sizeof(std::int32_t));
