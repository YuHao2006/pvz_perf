#pragma once
#include <string>
#include <stdexcept>
#include "misc/Buffer.h"
#include "ConstEnums.h"

class Board;
class Reanimation;
class TodParticleSystem;
class TodParticleEmitter;
class ReanimatorDefinition;
class TodParticleDefinition;
namespace Sexy
{
    class Image;
}
using namespace Sexy;

struct SaveFileHeader
{
    unsigned int    mMagicNumber;
    unsigned int    mBuildVersion;
    unsigned int    mBuildDate;
};

class SaveGameLoadRejected : public std::runtime_error
{
public:
    using std::runtime_error::runtime_error;
};

class SaveGameUpgradeRequired : public SaveGameLoadRejected
{
public:
    using SaveGameLoadRejected::SaveGameLoadRejected;
};

class SaveGameContext
{
public:
    Buffer          mBuffer;            //+0x0
    bool            mFailed;            //+0x20
    bool            mReading;           //+0x21

public:
    inline int      ByteLeftToRead() { return (mBuffer.mDataBitSize - mBuffer.mReadBitPos + 7) / 8; }
    void            SyncBytes(void* theDest, int theReadSize);
    void            SyncInt(int& theInt);
    inline void     SyncUint(unsigned int& theInt) { SyncInt((signed int&)theInt); }
    void            SyncReanimationDef(ReanimatorDefinition*& theDefinition);
};

// The active game stream contains eleven pools; Trail is not a runtime pool.

void                SyncParticleSystem(Board* theBoard, TodParticleSystem* theParticleSystem, SaveGameContext& theContext);
void                SyncReanimation(Board* theBoard, Reanimation* theReanimation, SaveGameContext& theContext);
void                SyncBoard(SaveGameContext& theContext, Board* theBoard);
void				FixBoardAfterLoad(Board* theBoard);
bool				LawnLoadGame(Board* theBoard, const std::string& theFilePath);
bool				LawnSaveGame(Board* theBoard, const std::string& theFilePath);

