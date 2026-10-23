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

	g->Translate(mX, mY);
	return true;
}

void GameObject::EndDraw(Graphics* g)
{
	g->Translate(-mX, -mY);
}

void GameObject::MakeParentGraphicsFrame(Graphics* g)
{
	g->Translate(-mX, -mY);
}

FloatGameObject::FloatGameObject()
{
	mApp = gLawnApp;
	mBoard = gLawnApp->mBoard;
	mX = mY = 0;
	mWidth = mHeight = 0;
	mVisible = true;
	mRow = -1;
	mRenderOrder = RenderLayer::RENDER_LAYER_TOP;
}

bool FloatGameObject::BeginDraw(Graphics* g)
{
	if (!mVisible) return false;
	g->Translate(mX, mY);
	return true;
}

void FloatGameObject::EndDraw(Graphics* g)
{
	g->Translate(-mX, -mY);
}

void FloatGameObject::MakeParentGraphicsFrame(Graphics* g)
{
	g->Translate(-mX, -mY);
}
