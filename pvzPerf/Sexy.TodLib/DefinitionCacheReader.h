#pragma once

#include <climits>
#include <cstddef>
#include <cstdint>
#include <cstring>

// A bounded view of one raw compiled payload. No allocation, decompression or
// recovery: a failed read records the offending field/offset and returns false.
enum class DefinitionReadFailure : std::uint8_t
{
    None,
    PayloadBounds,
    InvalidCount,
    ArrayBounds,
    AllocationSize,
    Schema,
    Field,
    FieldType,
    RecordBounds,
    ElementSize,
    ImageBinding,
    FontBinding
};
class DefinitionCacheReader
{
public:
    DefinitionCacheReader(const void* data, size_t size)
        : mData(static_cast<const char*>(data)), mSize(size) {}

    bool Fail(DefinitionReadFailure reason)
    {
        if (mError == DefinitionReadFailure::None) mError = reason;
        return false;
    }

    const char* Take(size_t size)
    {
        if (size > mSize - mPosition)
        {
            Fail(DefinitionReadFailure::PayloadBounds);
            return nullptr;
        }
        const char* data = mData + mPosition;
        mPosition += size;
        return data;
    }

    bool Read(void* destination, size_t size)
    {
        const char* data = Take(size);
        if (!data) return false;
        if (size) std::memcpy(destination, data, size);
        return true;
    }

    bool ArrayBytes(int count, int elementSize, size_t& size)
    {
        if (count < 0 || elementSize <= 0)
            return Fail(DefinitionReadFailure::InvalidCount);
        if (static_cast<size_t>(count) > (mSize - mPosition) / static_cast<size_t>(elementSize))
            return Fail(DefinitionReadFailure::ArrayBounds);
        size = static_cast<size_t>(count) * static_cast<size_t>(elementSize);
        if (size > INT_MAX)
            return Fail(DefinitionReadFailure::AllocationSize);
        return true;
    }

    inline bool AtEnd() const { return mPosition == mSize; }
    std::uint16_t mField = 0;

private:
    const char* mData;
    size_t mSize;

public:
    size_t mPosition = 0;
    DefinitionReadFailure mError = DefinitionReadFailure::None;
};
