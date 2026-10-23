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
    int                             mX;
    int                             mY;
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

// Actors own one ordinary floating-point pixel position. Other game objects
// retain their existing integer-coordinate GameObject layout.
class FloatGameObject
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
    unsigned int                    mSaveLayoutPadding = 0;

    FloatGameObject();
    bool BeginDraw(Graphics* g);
    void EndDraw(Graphics* g);
    void MakeParentGraphicsFrame(Graphics* g);
};
static_assert(sizeof(FloatGameObject) == sizeof(GameObject));
static_assert(offsetof(FloatGameObject, mX) == offsetof(GameObject, mX));
static_assert(offsetof(FloatGameObject, mY) == offsetof(GameObject, mY));
