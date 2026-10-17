#pragma once
#include <string>
#include <stdexcept>
#include <cstdint>
#include "Common.h"

namespace Sexy
{

typedef std::vector<uchar> ByteVector;
class BufferReadError final : public std::exception {};

enum class BufferOperation : std::uint8_t
{
    UTF8ToWideString,
    ReserveAppend,
    WriteNumBits,
    WriteBuffer,
    ReadNumBits,
    ReadBuffer
};

enum class BufferFailure : std::uint8_t
{
    NegativeLogicalSize,
    LogicalSizeBeyondStorage,
    CapacityOverflow,
    InvalidWidth,
    PositionOverflow,
    PositionOutsideStorage,
    SourceAliasesOutput,
    InvalidOutput,
    NegativeReadPosition,
    TruncatedLength,
    TruncatedPayload
};

class BufferError final : public std::exception
{
public:
    const BufferOperation operation;
    const BufferFailure reason;

    BufferError(BufferOperation operation, BufferFailure reason) noexcept
        : operation(operation), reason(reason) {}
};

// An input-format error, distinct from allocation or corrupted Buffer state.
class UTF8DecodeError final : public std::exception
{
public:
    const size_t byteOffset;
    explicit UTF8DecodeError(size_t byteOffset) noexcept
        : byteOffset(byteOffset) {}
};

class Buffer
{
public:
	ByteVector				mData;
	int						mDataBitSize;
	mutable int				mReadBitPos;
	mutable int				mWriteBitPos;	

public:
	Buffer();
	~Buffer();
			
	void					Clear();

	void					WriteByte(uchar theByte);
	void					WriteNumBits(int theNum, int theBits);
	static int				GetBitsRequired(int theNum, bool isSigned);
	void					WriteBoolean(bool theBool);
	void					WriteShort(short theShort);
	void					WriteLong(long theLong);
	void					WriteString(const std::string& theString);
	void					WriteUTF8String(const std::wstring& theString);
	void					WriteLine(const std::string& theString);	
	void					WriteBuffer(const ByteVector& theBuffer);
	void					WriteBytes(const uchar* theByte, int theCount);
	void					SetData(const ByteVector& theBuffer);
	void					SetData(ByteVector&& theBuffer);
	void					SetData(uchar* thePtr, int theCount);

	std::wstring			UTF8ToWideString() const;
	uchar					ReadByte() const;
	int						ReadNumBits(int theBits, bool isSigned) const;
	bool					ReadBoolean() const;
	short					ReadShort() const;
	long					ReadLong() const;
	std::string				ReadString() const;	
	std::wstring			ReadUTF8String() const;
	std::string				ReadLine() const;
	void					ReadBytes(uchar* theData, int theLen) const;
	void					ReadBuffer(ByteVector* theByteVector) const;

	const uchar*			GetDataPtr() const;
	int						GetDataLen() const { return (mDataBitSize + 7) / 8; }
	unsigned int					GetCRC32(unsigned int theSeed = 0) const;

	bool					AtEnd() const { return mReadBitPos >= mDataBitSize; }
	bool					PastEnd() const { return mReadBitPos > mDataBitSize; }
};

}
