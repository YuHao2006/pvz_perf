#pragma once

#include <cstdint>
#include <exception>
#include "Reanimator.h"
#include "TodParticle.h"

using DefFieldId = std::uint16_t;

enum class DefFieldType : int
{
    DT_INVALID = 0,
    DT_INT = 1,
    DT_FLOAT = 2,
    DT_ENUM = 4,
    DT_VECTOR2 = 5,
    DT_ARRAY = 6,
    DT_TRACK_FLOAT = 7,
    DT_FLAGS = 8,
    DT_IMAGE = 9,
    DT_FONT = 10
};

class DefField
{
public:
    DefFieldId          mFieldId;
    int                 mFieldOffset;
    DefFieldType        mFieldType;
    void*               mExtraData;
    // DT_ARRAY points to its element map. Other numeric fields need no
    // reflection metadata. DT_INVALID terminates the field array.
};

class DefMap
{
public:
    DefField*           mMapFields;
    int                 mDefSize;
    void*               (*mConstructorFunc)(void*);
    // Serialized record stride can differ from the runtime object stride.
    int                 mRecordSize = 0;
};

inline int DefinitionRecordSize(const DefMap* theDefMap)
{
    return theDefMap->mRecordSize > 0 ? theDefMap->mRecordSize : theDefMap->mDefSize;
}

constexpr int kDefMapHashVisitedMax = 16;
class DefMapHashCapacityError final : public std::exception
{
public:
    const int count;
    const int capacity;

    DefMapHashCapacityError(int count, int capacity) noexcept
        : count(count), capacity(capacity) {}
};

struct DefMapHashVisited
{
    DefMap* mMaps[kDefMapHashVisitedMax];
    int     mCount = 0;

    bool Contains(const DefMap* theDefMap) const
    {
        for (int i = 0; i < mCount; ++i)
            if (mMaps[i] == theDefMap)
                return true;
        return false;
    }
    void Add(DefMap* theDefMap)
    {
        if (mCount >= kDefMapHashVisitedMax)
            throw DefMapHashCapacityError(mCount, kDefMapHashVisitedMax);
        mMaps[mCount++] = theDefMap;
    }
};

// The pointer/count pair is decoded without copying serialized pointer bits.
class DefinitionArrayDef
{
public:
    void*               mArrayData;
    int                 mArrayCount;
};

// PAK64 raw header followed immediately by serialized definition bytes.
static_assert(sizeof(unsigned int) == 4);
static_assert(sizeof(unsigned long long) == 8);
class CompiledDefinitionHeader
{
public:
    unsigned int        mCookie;
    unsigned int        mDataSize;
};
static_assert(sizeof(CompiledDefinitionHeader) == 8);

// Definition paths have one production spelling; no legacy suffix probing.
SexyString              DefinitionCompiledPath(const char* theAuthorPath);
struct PFILE;
PFILE*                  DefinitionOpenCompiledFile(const char* theCompiledFilePath);
bool                    DefinitionReadCompiledFile(const SexyString& theCompiledFilePath, DefMap* theDefMap, void* theDefinition);
// Numeric records contain a schema hash, fixed records and bounded nested
// data. Image/font references are baked uint32 symbols; zero means no resource.
bool                    DefinitionReadCompiledFromBytes(const char* theData, size_t theDataSize, DefMap* theDefMap, void* theDefinition, const SexyString& theSourceName);

void*                   DefinitionAlloc(int theSize);
uint                    DefinitionCalcHashDefMap(int aSchemaHash, DefMap* theDefMap, DefMapHashVisited& theVisited);
uint                    DefinitionCalcHash(DefMap* theDefMap);
class DefinitionCacheReader;
bool                    DefReadFromCacheFloatTrack(DefinitionCacheReader& reader, FloatParameterTrack* theTrack);
void                    DefinitionFreeMap(DefMap* theDefMap, char* theDefinition);

bool                    FloatTrackIsSet(const FloatParameterTrack& theTrack);
void                    FloatTrackSetDefault(FloatParameterTrack& theTrack, float theValue);
float                   FloatTrackEvaluate(FloatParameterTrack& theTrack, float theTimeValue, float theInterp);
float                   FloatTrackEvaluateFromLastTime(FloatParameterTrack& theTrack, float theTimeValue, float theInterp);
bool                    FloatTrackIsConstantZero(FloatParameterTrack& theTrack);
