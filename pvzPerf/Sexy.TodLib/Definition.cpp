#include "TodCommon.h"
#include "TodParticle.h"
#include <assert.h>
#include <cstring>
#include <cstdlib>
#include <cstdint>
#include <memory>
#include <algorithm>
#include <stdexcept>
#include <stddef.h>
#include "TodDebug.h"
#include "Definition.h"
#include "DefinitionCacheReader.h"
#include <zlib.h> // CRC32 is part of the definition schema hash; no inflate/deflate is used here.
#include "paklib/PakInterface.h"
#include "graphics/DDImage.h"
#include "graphics/AtlasImageRegion.h"
#include "generated/DefinitionImageBindings.h"
#include <climits>
#include <limits>
#include <iterator>
#include <mutex>
#include <unordered_map>

namespace
{
std::shared_ptr<Sexy::ResidentImage> LoadSharedDefinitionAtlas(const std::string& path,
    unsigned width,unsigned height)
{
    // Loading workers and the main-thread early animation can request the same
    // PNG concurrently. Publish only a fully decoded image, once per live path.
    static std::mutex mutex;
    static std::unordered_map<std::string,std::weak_ptr<Sexy::ResidentImage>> images;
    std::lock_guard lock(mutex);
    auto& entry=images[path];
    auto image=entry.lock();
    if (!image)
    {
        image=Sexy::ResidentImage::DecodePng(path);
        if (!image || image->mWidth!=int(width) || image->mHeight!=int(height))
            throw std::runtime_error("definition atlas PNG dimensions mismatch: "+path);
        entry=image;
    }
    else if (image->mWidth!=int(width) || image->mHeight!=int(height))
        throw std::runtime_error("shared definition atlas dimensions disagree: "+path);
    return image;
}
}

DefinitionAtlas DefinitionLoadAtlas(std::span<const std::uint8_t> payload,
    std::size_t& position, std::uint32_t magic)
{
    const auto u32 = [&]() {
        if (position > payload.size() || payload.size()-position < 4)
            throw std::runtime_error("truncated definition atlas");
        std::uint32_t value;
        std::memcpy(&value,payload.data()+position,4);
        position+=4;
        return value;
    };
    if (u32()!=magic) throw std::runtime_error("definition atlas format mismatch");
    const auto width=u32(),height=u32();
    if (width>INT_MAX || height>INT_MAX || ((width==0)!=(height==0)))
        throw std::runtime_error("invalid definition atlas dimensions");
    return {nullptr,int(width),int(height)};
}

DefinitionImageRegion DefinitionReadImageRegion(std::span<const std::uint8_t> payload,
    std::size_t& position, const DefinitionAtlas& atlas)
{
    if (position>payload.size() || payload.size()-position<24)
        throw std::runtime_error("truncated definition image rectangle");
    std::uint32_t words[6];
    std::memcpy(words,payload.data()+position,sizeof(words));
    position+=sizeof(words);
    if (std::all_of(std::begin(words),std::end(words),[](auto word){return word==0;}))
        return {};
    if (std::any_of(std::begin(words),std::end(words),[](auto word){return word>INT_MAX;}))
        throw std::runtime_error("definition image rectangle integer overflow");
    DefinitionImageRegion r{int(words[0]),int(words[1]),int(words[2]),int(words[3]),int(words[4]),int(words[5])};
    if (!Sexy::IsValidAtlasImageRegion({r.mX,r.mY,r.mWidth,r.mHeight,atlas.width,atlas.height,r.mRows,r.mCols}) ||
        r.mX<2 || r.mY<2 || uint64_t(r.mX)+r.mWidth+2>unsigned(atlas.width) ||
        uint64_t(r.mY)+r.mHeight+2>unsigned(atlas.height))
        throw std::runtime_error("invalid definition image rectangle");
    return r;
}

void DefinitionBindAtlas(DefinitionAtlas& atlas,const std::string& compiledPath)
{
    if (atlas.width==0)
    {
        atlas.image.reset();
        return;
    }
    std::string normalized=compiledPath;
    std::replace(normalized.begin(),normalized.end(),'\\','/');
    std::transform(normalized.begin(),normalized.end(),normalized.begin(),[](unsigned char c) {
        return c>='A' && c<='Z' ? char(c-'A'+'a') : char(c);
    });
    const auto& bindings=DefinitionImageBindings::Bindings;
    const auto found=std::lower_bound(bindings.begin(),bindings.end(),std::string_view(normalized),
        [](const auto& binding,std::string_view path){return binding.definition<path;});
    if (found==bindings.end() || found->definition!=normalized || found->image.empty())
        throw std::runtime_error("definition atlas binding missing: "+normalized);
    atlas.image=LoadSharedDefinitionAtlas(std::string(found->image),atlas.width,atlas.height);
}

static void DefinitionFillWithDefaults(DefMap* theDefMap, void* theDefinition);
static void* DefinitionReadCompiledPayload(void* theCompiledBuffer, size_t theCompiledBufferSize, size_t& theDataSize);
static bool DefMapReadFromCache(DefinitionCacheReader& reader, DefMap* theDefMap, void* theDefinition);
static void DefinitionFreeArrayField(DefinitionArrayDef* theArray, DefMap* theDefMap);

static bool DefinitionHasField(const DefField& field)
{
    return field.mFieldType != DefFieldType::DT_INVALID;
}

static bool DefinitionValidateMap(DefinitionCacheReader& reader, DefMap* map, DefMapHashVisited& visited)
{
    if (!map || !map->mMapFields || map->mDefSize <= 0 || DefinitionRecordSize(map) <= 0)
        return reader.Fail(DefinitionReadFailure::Schema);
    if (visited.Contains(map))
        return true;
    visited.Add(map);

    for (DefField* field = map->mMapFields; DefinitionHasField(*field); ++field)
    {
        reader.mField = field->mFieldId;
        if (!field->mFieldId || field->mFieldOffset < 0)
            return reader.Fail(DefinitionReadFailure::Field);
        size_t valueSize;
        size_t recordSize;
        switch (field->mFieldType)
        {
        case DefFieldType::DT_INT:
        case DefFieldType::DT_ENUM:
        case DefFieldType::DT_FLAGS:
            valueSize = recordSize = sizeof(int);
            break;
        case DefFieldType::DT_FLOAT:
            valueSize = recordSize = sizeof(float);
            break;
        case DefFieldType::DT_VECTOR2:
            valueSize = recordSize = sizeof(SexyVector2);
            break;
        case DefFieldType::DT_ARRAY:
            valueSize = sizeof(DefinitionArrayDef);
            recordSize = offsetof(DefinitionArrayDef, mArrayCount) + sizeof(int);
            break;
        case DefFieldType::DT_TRACK_FLOAT:
            valueSize = sizeof(FloatParameterTrack);
            recordSize = 0;
            break;
        case DefFieldType::DT_IMAGE:
            valueSize = sizeof(Image*);
            recordSize = 0;
            break;
        case DefFieldType::DT_FONT:
            valueSize = sizeof(_Font*);
            recordSize = 0;
            break;
        default:
            return reader.Fail(DefinitionReadFailure::FieldType);
        }
        const size_t offset = static_cast<size_t>(field->mFieldOffset);
        const size_t runtimeSize = static_cast<size_t>(map->mDefSize);
        const size_t serializedSize = static_cast<size_t>(DefinitionRecordSize(map));
        if (offset > runtimeSize || valueSize > runtimeSize - offset ||
            (recordSize && (offset > serializedSize || recordSize > serializedSize - offset)))
            return reader.Fail(DefinitionReadFailure::RecordBounds);
        if (field->mFieldType == DefFieldType::DT_ARRAY &&
            !DefinitionValidateMap(reader, static_cast<DefMap*>(field->mExtraData), visited))
            return false;
    }
    return true;
}


void* DefinitionAlloc(int theSize)
{
    void* aPtr = operator new[](theSize);
    TOD_ASSERT(aPtr);
    memset(aPtr, 0, theSize);
    return aPtr;
}

// The compiled record preserves the historic struct size, but only fields in
// DefMap are resource data. Runtime-only members and
// pointer placeholders must come from initialization, never from file bytes.
// The record points into the already bounded payload and never aliases the
// destination. No additional record buffer or ownership allocation is needed.
static void DefinitionReadCacheRecord(DefMap* map, void* definition, const char* record)
{
    if (map->mConstructorFunc)
        map->mConstructorFunc(definition);
    else
        DefinitionFillWithDefaults(map, definition);

    for (DefField* field = map->mMapFields; DefinitionHasField(*field); ++field)
    {
        char* value = static_cast<char*>(definition) + field->mFieldOffset;
        const char* source = record + field->mFieldOffset;
        switch (field->mFieldType)
        {
        case DefFieldType::DT_INT:
        case DefFieldType::DT_ENUM:
        case DefFieldType::DT_FLAGS:
            std::memcpy(value, source, sizeof(int));
            break;
        case DefFieldType::DT_FLOAT:
            std::memcpy(value, source, sizeof(float));
            break;
        case DefFieldType::DT_VECTOR2:
            std::memcpy(value, source, sizeof(SexyVector2));
            break;
        case DefFieldType::DT_ARRAY:
            std::memcpy(value + offsetof(DefinitionArrayDef, mArrayCount),
                source + offsetof(DefinitionArrayDef, mArrayCount), sizeof(int));
            break;
        default:
            // Image/font references and float tracks are decoded
            // from the nested tail; no pointer bits are copied.
            break;
        }
    }
}

static bool DefReadFromCacheArray(DefinitionCacheReader& reader, DefinitionArrayDef* theArray, DefMap* theDefMap)
{
    int defSize;
    if (!reader.Read(&defSize, sizeof(defSize)))
        return false;
    // Disk records advance by their serialized stride; runtime objects advance
    // by mDefSize. Existing mapped fields must retain their serialized offsets.
    if (defSize != DefinitionRecordSize(theDefMap))
        return reader.Fail(DefinitionReadFailure::ElementSize);
    const size_t aStride = static_cast<size_t>(theDefMap->mDefSize);

    size_t size;
    if (!reader.ArrayBytes(theArray->mArrayCount, defSize, size))
        return false;
    if (theArray->mArrayCount == 0)
        return true;

    const size_t aAllocSize = aStride * static_cast<size_t>(theArray->mArrayCount);
    if (aAllocSize > INT_MAX)
        return reader.Fail(DefinitionReadFailure::AllocationSize);

    // Publish only a fully decoded array. The current element has its own
    // rollback; this owner frees only the previously completed elements.
    DefinitionArrayDef ready{DefinitionAlloc(static_cast<int>(aAllocSize)), 0};
    const auto dispose = [theDefMap](DefinitionArrayDef* array) {
        DefinitionFreeArrayField(array, theDefMap);
    };
    std::unique_ptr<DefinitionArrayDef, decltype(dispose)> owner(&ready, dispose);
    const char* records = reader.Take(size);
    if (!records)
        return false;
    for (int i = 0; i < theArray->mArrayCount; ++i)
    {
        char* element = static_cast<char*>(ready.mArrayData) + aStride * static_cast<size_t>(i);
        DefinitionReadCacheRecord(theDefMap, element, records + static_cast<size_t>(defSize) * i);
        if (!DefMapReadFromCache(reader, theDefMap, element))
            return false;
        ++ready.mArrayCount;
    }
    theArray->mArrayData = ready.mArrayData;
    owner.release();
    return true;
}

bool DefReadFromCacheFloatTrack(DefinitionCacheReader& reader, FloatParameterTrack* theTrack)
{
    int count;
    if (!reader.Read(&count, sizeof(count)))
        return false;
    size_t size;
    if (!reader.ArrayBytes(count, kFloatTrackNodeRecordSize, size))
        return false;
    if (count == 0)
        return true;
    // 记录节点 20B 紧排；内存节点 28B，逐节点搬运 + 解析。
    // 无效曲线硬错（装载期拦截，不带病运行）。
    std::unique_ptr<char[]> nodes(static_cast<char*>(
        DefinitionAlloc(static_cast<int>(count * (int)sizeof(FloatParameterTrackNode)))));
    if (nodes == nullptr)
        return false;
    for (int i = 0; i < count; i++)
    {
        FloatParameterTrackNode& aNode = reinterpret_cast<FloatParameterTrackNode*>(nodes.get())[i];
        if (!reader.Read(&aNode, kFloatTrackNodeRecordSize))
            return false;
        // 记录 20B 已直拷进节点前缀：偏移 12 的 8B（= mCurveTypeEval 槽原始字节）
        // 低 32 位曲线 int、高 32 位分布 int——一次读出，查表覆写真指针。
        std::uint64_t aRawCurve;
        std::memcpy(&aRawCurve, reinterpret_cast<const char*>(&aNode) + 12, sizeof(aRawCurve));
        int aCurveInt = (int)(std::uint32_t)aRawCurve;
        int aDistInt = (int)(std::uint32_t)(aRawCurve >> 32);
        aNode.mCurveTypeEval = TodCurveResolveEval(aCurveInt);
        aNode.mDistributionEval = TodCurveResolveEval(aDistInt);
    }
    theTrack->mNodes = reinterpret_cast<FloatParameterTrackNode*>(nodes.release());
    theTrack->mCountNodes = count;
    return true;
}

static bool DefReadFromCacheImage(DefinitionCacheReader& reader, Image** theImage)
{
    std::uint32_t symbol = 0;
    if (!reader.Read(&symbol, sizeof(symbol)))
        return false;
    if (symbol == 0)
    {
        *theImage = nullptr;
        return true;
    }
    Image* image = TodDefinitionLoadImageById(symbol);
    if (!image)
        return reader.Fail(DefinitionReadFailure::ImageBinding);
    *theImage = image;
    return true;
}

static bool DefReadFromCacheFont(DefinitionCacheReader& reader, _Font** theFont)
{
    std::uint32_t symbol = 0;
    if (!reader.Read(&symbol, sizeof(symbol)))
        return false;
    if (symbol == 0)
    {
        *theFont = nullptr;
        return true;
    }
    _Font* font = TodDefinitionLoadFontById(symbol);
    if (!font)
        return reader.Fail(DefinitionReadFailure::FontBinding);
    *theFont = font;
    return true;
}

static bool DefMapReadFromCache(DefinitionCacheReader& reader, DefMap* theDefMap, void* theDefinition)
{
    const auto dispose = [theDefMap](char* definition) { DefinitionFreeMap(theDefMap, definition); };
    std::unique_ptr<char, decltype(dispose)> owner(static_cast<char*>(theDefinition), dispose);
    for (DefField* field = theDefMap->mMapFields; DefinitionHasField(*field); ++field)
    {
        bool success = true;
        reader.mField = field->mFieldId;
        char* value = static_cast<char*>(theDefinition) + field->mFieldOffset;
        switch (field->mFieldType)
        {
        case DefFieldType::DT_ARRAY:
            success = DefReadFromCacheArray(reader, reinterpret_cast<DefinitionArrayDef*>(value),
                static_cast<DefMap*>(field->mExtraData));
            break;
        case DefFieldType::DT_TRACK_FLOAT:
            success = DefReadFromCacheFloatTrack(reader, reinterpret_cast<FloatParameterTrack*>(value));
            break;
        case DefFieldType::DT_IMAGE:
            success = DefReadFromCacheImage(reader, reinterpret_cast<Image**>(value));
            break;
        case DefFieldType::DT_FONT:
            success = DefReadFromCacheFont(reader, reinterpret_cast<_Font**>(value));
            break;
        default:
            break;
        }
        if (!success) return false;
    }
    owner.release();
    return true;
}

uint DefinitionCalcHashDefMap(int aSchemaHash, DefMap* theDefMap, DefMapHashVisited& theVisited)
{
    if (theVisited.Contains(theDefMap))
        return aSchemaHash;
    theVisited.Add(theDefMap);

    const int aRecordSize = DefinitionRecordSize(theDefMap);
    aSchemaHash = crc32(aSchemaHash, (Bytef*)&aRecordSize, sizeof(int));
    for (DefField* aField = theDefMap->mMapFields; DefinitionHasField(*aField); aField++)
    {
        aSchemaHash = crc32(aSchemaHash, (const Bytef*)&aField->mFieldId, sizeof(DefFieldId));
        aSchemaHash = crc32(aSchemaHash, (Bytef*)&aField->mFieldType, sizeof(DefFieldType));
        aSchemaHash = crc32(aSchemaHash, (Bytef*)&aField->mFieldOffset, sizeof(int));
        switch (aField->mFieldType)
        {
        case DefFieldType::DT_ARRAY:
            aSchemaHash = DefinitionCalcHashDefMap(aSchemaHash, (DefMap*)aField->mExtraData, theVisited);
            break;
        default:
            break;
        }
    }
    return aSchemaHash;
}

uint DefinitionCalcHash(DefMap* theDefMap)
{
    DefMapHashVisited aVisited;
    return DefinitionCalcHashDefMap(crc32(0L, (Bytef*)Z_NULL, NULL) + 1, theDefMap, aVisited);
}

// PAK64 compiled definitions are deliberately raw.  The 32-bit release used
// a zlib stream here, but x64 Legacy only mounts main.pak64 and must not pay a
// decompression/allocation cost on this path.
static void* DefinitionReadCompiledPayload(void* theCompiledBuffer, size_t theCompiledBufferSize, size_t& theDataSize)
{
    if (theCompiledBufferSize < sizeof(CompiledDefinitionHeader))
    {
        return nullptr;
    }
    auto* aHeader = static_cast<CompiledDefinitionHeader*>(theCompiledBuffer);
    if (aHeader->mCookie != 0xDEADFED5u)
    {
        return nullptr;
    }
    if (aHeader->mDataSize != theCompiledBufferSize - sizeof(CompiledDefinitionHeader))
    {
        return nullptr;
    }
    auto* aData = static_cast<unsigned char*>(DefinitionAlloc(aHeader->mDataSize));
    memcpy(aData, static_cast<unsigned char*>(theCompiledBuffer) + sizeof(CompiledDefinitionHeader), aHeader->mDataSize);
    theDataSize = aHeader->mDataSize;
    return aData;
}

SexyString DefinitionCompiledPath(const char* theAuthorPath)
{
    SexyString path(theAuthorPath);
    std::replace(path.begin(), path.end(), '\\', '/');
    const size_t extension = path.rfind('.');
    const size_t separator = path.rfind('/');
    if (extension == SexyString::npos ||
        (separator != SexyString::npos && extension < separator) ||
        (path.substr(extension) != ".reanim" && path.substr(extension) != ".xml"))
        throw std::invalid_argument("definition author path");
    path.resize(extension);
    return "compiled/" + path + ".compiled";
}

PFILE* DefinitionOpenCompiledFile(const char* theCompiledFilePath)
{
    if (!gPakInterface)
        return nullptr;
    SexyString path = StringToUpper(theCompiledFilePath);
    std::replace(path.begin(), path.end(), '/', '\\');
    if (!path.starts_with("COMPILED\\"))
        return nullptr;
    const auto record = gPakInterface->mPakRecordMap.find(path);
    if (record == gPakInterface->mPakRecordMap.end())
        return nullptr;
    return new PFILE{&record->second, 0, nullptr};
}

//0x444560 : (void* def, *defMap, eax = string& compiledFilePath)  //esp -= 8
bool DefinitionReadCompiledFile(const SexyString& theCompiledFilePath, DefMap* theDefMap, void* theDefinition)
{
    std::unique_ptr<PFILE, decltype(&p_fclose)> pFile(
        DefinitionOpenCompiledFile(theCompiledFilePath.c_str()), &p_fclose);
    if (!pFile) {
        return false;
    }

    if (p_fseek(pFile.get(), 0, 2) != 0)
    {
        return false;
    }
    const int aFileSize = p_ftell(pFile.get());
    if (aFileSize < 0)
    {
        return false;
    }
    if (p_fseek(pFile.get(), 0, 0) != 0)
    {
        return false;
    }
    const size_t aCompiledSize = static_cast<size_t>(aFileSize);
    std::unique_ptr<char[]> aCompiledBuffer(static_cast<char*>(DefinitionAlloc(aFileSize)));
    // 读取文件，并判断实际读取的大小是否为完整的文件大小，若不等则判断为读取失败
    const size_t aReadSize=p_fread(aCompiledBuffer.get(), sizeof(char), aCompiledSize, pFile.get());
    pFile.reset();
    if (aReadSize!=aCompiledSize) {
        return false;
    }

    size_t aDataSize;
    std::unique_ptr<char[]> aDataBuffer(static_cast<char*>(
        DefinitionReadCompiledPayload(aCompiledBuffer.get(), aCompiledSize, aDataSize)));
    aCompiledBuffer.reset();
    if (!aDataBuffer) return false;

    return DefinitionReadCompiledFromBytes(aDataBuffer.get(), aDataSize, theDefMap, theDefinition, theCompiledFilePath);
}

// Numeric generic records are used by bounded-reader regression probes;
// production reanimation and particle records have dedicated loaders.
bool DefinitionReadCompiledFromBytes(const char* theData, const size_t theDataSize, DefMap* theDefMap, void* theDefinition, const SexyString&)
{
    DefinitionCacheReader reader(theData, theDataSize);
    DefMapHashVisited visited;
    if (!DefinitionValidateMap(reader, theDefMap, visited))
    {
        return false;
    }
    reader.mField = 0;
    const int aRecordSize = DefinitionRecordSize(theDefMap);
    if (theDefMap->mDefSize <= 0 || aRecordSize <= 0 ||
        theDataSize < static_cast<size_t>(aRecordSize) + sizeof(uint)) {
        return false;
    }
    uint aDefHash = DefinitionCalcHash(theDefMap);
    uint aCashHash;
    if (!reader.Read(&aCashHash, sizeof(aCashHash))) return false;
    if (aCashHash != aDefHash) {
        return false;
    }

    const char* record = reader.Take(static_cast<size_t>(aRecordSize));
    if (!record) return false;
    DefinitionReadCacheRecord(theDefMap, theDefinition, record);
    bool aResult = DefMapReadFromCache(reader, theDefMap, theDefinition);
    if (aResult && !reader.AtEnd()) {
        DefinitionFreeMap(theDefMap, static_cast<char*>(theDefinition));
        return false;
    }
    return aResult;
}

static void DefinitionFillWithDefaults(DefMap* theDefMap, void* theDefinition)
{
    memset(theDefinition, 0, theDefMap->mDefSize);
}

//0x4448E0
float FloatTrackEvaluate(FloatParameterTrack& theTrack, float theTimeValue, float theInterp)
{
    if (theTrack.mCountNodes == 0)
        return 0.0f;

    // 常值轨快路：单节点 low==high 时，任何分布曲线在任何 t 下恒返 low
    //（Curves 族全部经 EvalFull(t,a,b,...)=a+(b-a)*warp(t) 或端点钳制，
    // a==b ⇒ 代数上逐位等于 low）——省一次间接调用，热路径常打。
    if (theTrack.mCountNodes == 1 && theTrack.mNodes[0].mLowValue == theTrack.mNodes[0].mHighValue)
        return theTrack.mNodes[0].mLowValue;

    if (theTimeValue < theTrack.mNodes[0].mTime)  // 如果当前时间小于第一个节点的开始时间
        return theTrack.mNodes[0].mDistributionEval(theInterp, theTrack.mNodes[0].mLowValue, theTrack.mNodes[0].mHighValue);

    for (int i = 1; i < theTrack.mCountNodes; i++)
    {
        FloatParameterTrackNode* aNodeNxt = &theTrack.mNodes[i];
        if (theTimeValue <= aNodeNxt->mTime)  // 寻找首个开始时间大于当前时间的节点
        {
            FloatParameterTrackNode* aNodeCur = &theTrack.mNodes[i - 1];
            // 计算当前时间在〔当前节点至下一节点〕的过程中的进度
            float aTimeFraction = (theTimeValue - aNodeCur->mTime) / (aNodeNxt->mTime - aNodeCur->mTime);
            float aLeftValue = aNodeCur->mDistributionEval(theInterp, aNodeCur->mLowValue, aNodeCur->mHighValue);
            float aRightValue = aNodeNxt->mDistributionEval(theInterp, aNodeNxt->mLowValue, aNodeNxt->mHighValue);
            return aNodeCur->mCurveTypeEval(aTimeFraction, aLeftValue, aRightValue);
        }
    }

    FloatParameterTrackNode* aLastNode = &theTrack.mNodes[theTrack.mCountNodes - 1];  // 如果当前时间大于最后一个节点的开始时间
    return aLastNode->mDistributionEval(theInterp, aLastNode->mLowValue, aLastNode->mHighValue);
}

//0x4449F0
void FloatTrackSetDefault(FloatParameterTrack& theTrack, float theValue)
{
    if (theTrack.mNodes == nullptr && theValue != 0.0f)  // 确保该参数轨道无节点（未被赋值过）且给定的默认值不为 0
    {
        theTrack.mCountNodes = 1;  // 默认参数轨道有且仅有 1 个节点
        FloatParameterTrackNode* aNode = (FloatParameterTrackNode*)DefinitionAlloc(sizeof(FloatParameterTrackNode));
        theTrack.mNodes = aNode;
        aNode->mTime = 0.0f;
        aNode->mLowValue = theValue;
        aNode->mHighValue = theValue;
        aNode->mCurveTypeEval = TodCurveResolveEval(0);
        aNode->mDistributionEval = TodCurveResolveEval(1);
    } else if (theTrack.mNodes == nullptr) {
        theTrack.mCountNodes = 0;
    }
}

bool FloatTrackIsSet(const FloatParameterTrack& theTrack)
{
    // 默认轨=指针直比（SetDefault 写入的节点曲线恒为 TodCurveResolveEval(0)=
    // Curves::Constant）。曲线定义唯一定义于 TodCommon.cpp——单一符号单一地址，
    // 比较跨 TU 恒定，不做旗标兜底：若实现回迁头文件（inline 多副本），此处会
    // 立刻误判、粒子消失，问题直接暴露。
    // 槽 0 与 8 同指 Constant：残渣槽 8 节点全部 low=high=0（等价常量），语义不变。
    return theTrack.mCountNodes != 0 && theTrack.mNodes[0].mCurveTypeEval != Curves::Constant;
}

bool FloatTrackIsConstantZero(FloatParameterTrack& theTrack)
{
    // 当轨道无节点，或仅存在一个节点且该节点的最大、最小值均为 0 时，认为该轨道上的值恒为零
    return theTrack.mCountNodes == 0 || (theTrack.mCountNodes == 1 && theTrack.mNodes[0].mLowValue == 0.0f && theTrack.mNodes[0].mHighValue == 0.0f);
}

//0x5167F0
float FloatTrackEvaluateFromLastTime(FloatParameterTrack& theTrack, float theTimeValue, float theInterp)
{
    return theTimeValue < 0.0f ? 0.0f : FloatTrackEvaluate(theTrack, theTimeValue, theInterp);
}

//0x444A50
static void DefinitionFreeArrayField(DefinitionArrayDef* theArray, DefMap* theDefMap)
{
    if (theArray->mArrayData != nullptr)
        for (int i = 0; i < theArray->mArrayCount; i++)
            DefinitionFreeMap(theDefMap, (char*)theArray->mArrayData + static_cast<size_t>(theDefMap->mDefSize) * i);
    delete[] (char *)theArray->mArrayData;
    theArray->mArrayData = nullptr;
    theArray->mArrayCount = 0;
}

//0x444A90
void DefinitionFreeMap(DefMap* theDefMap, char* theDefinition)
{
    // 根据 theDefMap 遍历 theDefinition 的每个成员变量
    for (DefField* aField = theDefMap->mMapFields; DefinitionHasField(*aField); aField++)
    {
        DefinitionArrayDef* theArray = (DefinitionArrayDef*)&theDefinition[aField->mFieldOffset];  // 指向该成员变量的指针
        switch (aField->mFieldType)
        {
        case DefFieldType::DT_ARRAY:
            DefinitionFreeArrayField(theArray, (DefMap*)aField->mExtraData);
            break;
        case DefFieldType::DT_TRACK_FLOAT:
            if (((FloatParameterTrack*)theArray)->mCountNodes != 0)
                delete[]((FloatParameterTrack*)theArray)->mNodes;  // 释放浮点参数轨道的节点
            ((FloatParameterTrack*)theArray)->mNodes = nullptr;
            ((FloatParameterTrack*)theArray)->mCountNodes = 0;
            break;
        default:
            break;
        }
    }
}
