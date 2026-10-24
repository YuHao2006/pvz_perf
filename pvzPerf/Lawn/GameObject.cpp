#include "GameObject.h"
#include "LawnApp.h"

GameObject::GameObject()
{
	mApp = gLawnApp;
	mBoard = gLawnApp->mBoard;
	mX = 0;
	mY = 0;
	mWidth = 0;
	mHeight = 0;
	mVisible = true;
	mRow = -1;
	mRenderOrder = RenderLayer::RENDER_LAYER_TOP;
}

bool GameObject::BeginDraw(Graphics* g)
{
	if (!mVisible)
		return false;

	g->TranslateF(mX, mY);
	return true;
}

void GameObject::EndDraw(Graphics* g, float parentTransX, float parentTransY)
{
	// Subtracting mX/mY cannot undo rounding in BeginDraw's float addition.
	g->mTransX = parentTransX;
	g->mTransY = parentTransY;
}

void GameObject::MakeParentGraphicsFrame(Graphics* g)
{
	g->TranslateF(-mX, -mY);
}
