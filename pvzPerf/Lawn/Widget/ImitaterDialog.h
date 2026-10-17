#pragma once
#include "LawnDialog.h"

class ToolTipWidget;
class ImitaterDialog : public LawnDialog
{
public:
    ToolTipWidget*          mToolTip;
    SeedType                mToolTipSeed;

public:
    ImitaterDialog();
    virtual ~ImitaterDialog();

    SeedType                SeedHitTest(int x, int y);
    void                    UpdateCursor();
    virtual void            Update();
    /*inline*/ void         GetSeedPosition(int theIndex, int& x, int& y);
    virtual void            Draw(Graphics* g);
    void                    ShowToolTip();
    virtual void            MouseDown(int x, int y, int theClickCount);
    virtual void            MouseUp(int, int, int){}
};

