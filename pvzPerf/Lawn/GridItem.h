#pragma once
#include "misc/TimeCounter.h"
#include "ConstEnums.h"

#define NUM_MOTION_TRAIL_FRAMES 12

class LawnApp;
class Board;
class Zombie;
namespace Sexy
{
	class Graphics;
};

class MotionTrailFrame
{
public:
	float					mPosX;
	float					mPosY;
	std::int64_t			mAnimClock;
};

class GridItem
{
public:
	LawnApp*				mApp;											//+0x0
	Board*					mBoard;											//+0x4
	GridItemType			mGridItemType;									//+0x8
	GridItemState			mGridItemState;									//+0xC
	int						mGridX;											//+0x10
	int						mGridY;											//+0x14
	Sexy::TimeCounter						mGridItemCounter;								//+0x18
	int						mRenderOrder;									//+0x1C
	bool					mDead;											//+0x20
	float					mPosX;											//+0x24
	float					mPosY;											//+0x28
	float					mGoalX;											//+0x2C
	float					mGoalY;											//+0x30
	ReanimationID			mGridItemReanimID;								//+0x34
	ParticleSystemID		mGridItemParticleID;							//+0x38
	ZombieType				mZombieType;									//+0x3C
	SeedType				mSeedType;										//+0x40
	ScaryPotType			mScaryPotType;									//+0x44
	bool					mHighlighted;									//+0x48
	Sexy::TimeCounter						mTransparentCounter;							//+0x4C
	int						mSunCount;										//+0x50
	MotionTrailFrame		mMotionTrailFrames[NUM_MOTION_TRAIL_FRAMES];	//+0x54
	int						mMotionTrailCount;								//+0xE4
	double				mRootWorldX = 0;
	double				mRootSample = 0;
	ReanimationID			mRootReanimID = ReanimationID::REANIMATIONID_NULL;
	std::uint32_t			mRootGeneration = 0;
	std::int32_t			mRootDirection = 0;
	float				mRootLastOutputX = 0;
	std::int64_t			mRootPeriodNs = 0;
	bool					mRootChocolate = false;

public:
	GridItem();

	void					DrawLadder(Sexy::Graphics* g);
	void					DrawCrater(Sexy::Graphics* g);
	void					DrawGraveStone(Sexy::Graphics* g);
	void					GridItemDie();
	void					AddGraveStoneParticles();
	void					DrawGridItem(Sexy::Graphics* g);
	void					DrawGridItemOverlay(Sexy::Graphics* g);
	void					OpenPortal();
	void					Update();
	void					ClosePortal();
	void					DrawScaryPot(Sexy::Graphics* g);
	void					UpdateScaryPot();
	void					UpdatePortal();
	void					DrawSquirrel(Sexy::Graphics* g);
	void					UpdateRake();
	Zombie*					RakeFindZombie();
	void					DrawIZombieBrain(Sexy::Graphics* g);
	void					UpdateBrain();
	void					DrawStinky(Sexy::Graphics* g);
	/*inline*/ bool			IsOpenPortal();
};

