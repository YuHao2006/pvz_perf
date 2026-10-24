#pragma once
#include "Common.h"
#include "misc/Rect.h"
#include "Color.h"
#include "Image.h"
#include "TriVertex.h"
#include "TextureRegion.h"

namespace Sexy
{

class _Font;
class SexyMatrix3;
class Transform;

const int MAX_TEMP_SPANS = 8192;

struct Edge
{
    double mX;
    double mDX;
    int i;
	double b;
};

class Graphics;

class GraphicsState
{
public:
	Image*					mDestImage = nullptr;
	float					mTransX;
	float					mTransY;
	float					mScaleX;
	float					mScaleY;
	float					mScaleOrigX;
	float					mScaleOrigY;
	Rect					mClipRect;
	Color					mColor;
	_Font*					mFont;
	int						mDrawMode;
	bool					mColorizeImages;
	bool					mFastStretch;
	bool					mWriteColoredString;
	bool					mLinearBlend;

};

typedef std::list<GraphicsState> GraphicsStateList;

class Graphics : public GraphicsState
{
public:	
	enum
	{
		DRAWMODE_NORMAL,
		DRAWMODE_ADDITIVE,
		DRAWMODE_OPAQUE
	};
	
	Edge*					mPFActiveEdgeList = nullptr;
	int						mPFNumActiveEdges = 0;
	static const Point*		mPFPoints;
	int						mPFNumVertices = 0;

	GraphicsStateList		mStateStack;

protected:	
	static int				PFCompareInd(const void* u, const void* v);
	static int				PFCompareActive(const void* u, const void* v);
	void					PFDelete(int i); 
	void					PFInsert(int i, int y);

	void					DrawImageTransformHelper(Image* theImage, const Transform &theTransform, const Rect &theSrcRect, float x, float y, bool useFloat);

public:
	Graphics(const Graphics& theGraphics);
	Graphics(Image* theDestImage = NULL);
	~Graphics();

	void					PushState();
	void					PopState();

	Graphics*				Create();
	
	void					FillRect(int theX, int theY, int theWidth, int theHeight);
	void					FillRect(const Rect& theRect);
	void					DrawRect(int theX, int theY, int theWidth, int theHeight);	
	void					DrawRect(const Rect& theRect);
	void					ClearRect(int theX, int theY, int theWidth, int theHeight);	
	void					ClearRect(const Rect& theRect);
	void					DrawString(const SexyString& theString, int theX, int theY);
	
private:
	bool					DrawLineClipHelper(double* theStartX, double* theStartY, double *theEndX, double* theEndY);
public:
	void					DrawLine(int theStartX, int theStartY, int theEndX, int theEndY);
	void					DrawLineAA(int theStartX, int theStartY, int theEndX, int theEndY);
	void					PolyFill(const Point *theVertexList, int theNumVertices, bool convex = false);
	void					PolyFillAA(const Point *theVertexList, int theNumVertices, bool convex = false);

	void					DrawImage(Image* theImage, int theX, int theY);
	void					DrawImage(Image* theImage, int theX, int theY, const Rect& theSrcRect);
	void DrawImage(Image* image, int x, int y, const TextureRegion& source);
	void					DrawImage(Image* theImage, const Rect& theDestRect, const Rect& theSrcRect);
	void DrawImage(Image* image, const Rect& destination, const TextureRegion& source);
	void					DrawImage(Image* theImage, int theX, int theY, int theStretchedWidth, int theStretchedHeight);
	void					DrawImageF(Image* theImage, float theX, float theY);
	void					DrawImageF(Image* theImage, float theX, float theY, const Rect& theSrcRect);

	void					DrawImageMirror(Image* theImage, int theX, int theY, bool mirror = true);
	void					DrawImageMirror(Image* theImage, int theX, int theY, const Rect& theSrcRect, bool mirror = true);
	void					DrawImageMirror(Image* theImage, const Rect& theDestRect, const Rect& theSrcRect, bool mirror = true);

	void					DrawImageRotated(Image* theImage, int theX, int theY, double theRot, const Rect *theSrcRect = NULL);
	void					DrawImageRotated(Image* theImage, int theX, int theY, double theRot, int theRotCenterX, int theRotCenterY, const Rect *theSrcRect = NULL);
	void					DrawImageRotatedF(Image* theImage, float theX, float theY, double theRot, const Rect *theSrcRect = NULL);
	void					DrawImageRotatedF(Image* theImage, float theX, float theY, double theRot, float theRotCenterX, float theRotCenterY, const Rect *theSrcRect = NULL);

	void					DrawImageMatrix(Image* theImage, const SexyMatrix3 &theMatrix, float x = 0, float y = 0);
	void					DrawImageMatrix(Image* theImage, const SexyMatrix3 &theMatrix, const Rect &theSrcRect, float x = 0, float y = 0);
	void					DrawImageTransform(Image* theImage, const Transform &theTransform, float x = 0, float y = 0);
	void					DrawImageTransform(Image* theImage, const Transform &theTransform, const Rect &theSrcRect, float x = 0, float y = 0);
	void					DrawImageTransformF(Image* theImage, const Transform &theTransform, float x = 0, float y = 0);
	void					DrawImageTransformF(Image* theImage, const Transform &theTransform, const Rect &theSrcRect, float x = 0, float y = 0);
	void					DrawTriangleTex(Image *theTexture, const TriVertex &v1, const TriVertex &v2, const TriVertex &v3);
	void					DrawTrianglesTex(Image *theTexture, const TriVertex theVertices[][3], int theNumTriangles);


	void					ClearClipRect();
	void					SetClipRect(int theX, int theY, int theWidth, int theHeight);
	void					SetClipRect(const Rect& theRect);
	void					ClipRect(int theX, int theY, int theWidth, int theHeight);
	void					ClipRect(const Rect& theRect);
	void					Translate(int theTransX, int theTransY);
	void					TranslateF(float theTransX, float theTransY);

	// In progress: Only affects DrawImage
	void					SetScale(float theScaleX, float theScaleY, float theOrigX, float theOrigY);

	int						StringWidth(const SexyString& theString);
	void					DrawImageBox(const Rect& theDest, Image* theComponentImage);
	void					DrawImageBox(const Rect& theSrc, const Rect& theDest, Image* theComponentImage);
	void DrawImageBox(const TextureRegion& source, const Rect& destination, Image* image);

	int						WriteString(const SexyString& theString, int theX, int theY, int theWidth = -1, int theJustification = 0, bool drawString = true, int theOffset = 0, int theLength = -1, int theOldColor = -1);
	int						WriteWordWrapped(const Rect& theRect, const SexyString& theLine, int theLineSpacing = -1, int theJustification = -1, int *theMaxWidth = NULL, int theMaxChars = -1, int* theLastWidth = NULL);
	int						DrawStringColor(const SexyString& theString, int theX, int theY, int theOldColor = -1); //works like DrawString but can have color tags like ^ff0000^.
	int						DrawStringWordWrapped(const SexyString& theLine, int theX, int theY, int theWrapWidth = 10000000, int theLineSpacing = -1, int theJustification = -1, int *theMaxWidth = NULL); //works like DrawString but also word wraps
	int						GetWordWrappedHeight(int theWidth, const SexyString& theLine, int theLineSpacing = -1, int *theMaxWidth = NULL);
	static int MeasureWordWrappedHeight(_Font& font,int width,const SexyString& text,
		int lineSpacing=-1,int* maxWidth=nullptr,bool colored=true);

};

class GraphicsAutoState
{
public:
	Graphics*				mG;

public:
	
	explicit GraphicsAutoState(Graphics* theG) : mG(theG)
	{
		mG->PushState();
	}

	~GraphicsAutoState()
	{
		mG->PopState();
	}

	GraphicsAutoState(const GraphicsAutoState&) = delete;
	GraphicsAutoState& operator=(const GraphicsAutoState&) = delete;
};

}
