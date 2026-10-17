#include "Buffer.h"
#include "Debug.h"
#include <bit>
#include <array>
#include <cstdint>
#include <limits>
#include <stdexcept>

using namespace Sexy;

namespace
{
consteval std::array<std::uint32_t, 256> GenerateCRCTable()
{
    std::array<std::uint32_t, 256> table{};
    for (std::uint32_t i = 0; i < table.size(); ++i)
    {
        std::uint32_t remainder = i << 24;
        for (unsigned bit = 0; bit < 8; ++bit)
            remainder = (remainder & 0x80000000u)
                ? (remainder << 1) ^ 0x04C11DB7u : remainder << 1;
        table[i] = remainder;
    }
    return table;
}

// No runtime "ready" flag, partially filled table, allocation or first-use lock.
constexpr auto crc_table = GenerateCRCTable();

std::uint32_t UpdateCRC(std::uint32_t remainder, const uchar* bytes, size_t length)
{
    // Keep the framework's non-reflected, caller-seeded CRC without final XOR.
    for (size_t i = 0; i < length; ++i)
        remainder = (remainder << 8) ^ crc_table[(remainder >> 24) ^ bytes[i]];
    return remainder;
}
}

//----------------------------------------------------------------------------
// Stream UTF8 data in a const char* to keep receiving wchar_ts
//----------------------------------------------------------------------------
static int GetUTF8Char(const char** theBuffer, int theLen, wchar_t* theChar)
{
	static const unsigned short aMaskData[] = {
		0xC0,		// 1 extra byte
		0xE0,		// 2 extra bytes
		0xF0,		// 3 extra bytes
		0xF8,		// 4 extra bytes
		0xFC		// 5 extra bytes
	};

	if (theLen == 0) return 0;

	const char* aBuffer = *theBuffer;

	int aTempChar = int((unsigned char)*aBuffer++);
	if ((aTempChar & 0x80) != 0)
	{
		if ((aTempChar & 0xC0) != 0xC0) return 0; // sanity check: high bit should not be set without the next highest bit being set, too.

		int aBytesRead[6];
		int* aBytesReadPtr = &aBytesRead[0];

		*aBytesReadPtr++ = aTempChar;

		int aLen;
		for (aLen = 0; aLen < (int)(sizeof(aMaskData)/sizeof(*aMaskData)); ++aLen)
		{
			if ( (aTempChar & aMaskData[aLen]) == ((aMaskData[aLen] << 1) & aMaskData[aLen]) ) break;
		}
		if (aLen >= (int)(sizeof(aMaskData)/sizeof(*aMaskData))) return 0;

		aTempChar &= ~aMaskData[aLen];
		int aTotalLen = aLen+1;

		if (aTotalLen < 2 || aTotalLen > 6) return 0;

		int anExtraChar = 0;
		while (aLen > 0 && (aBuffer - *theBuffer) < theLen)
		{
			anExtraChar = int((unsigned char)*aBuffer++);
			if ((anExtraChar & 0xC0) != 0x80) return 0; // sanity check: high bit set, and next highest bit NOT set.

			*aBytesReadPtr++ = anExtraChar;

			aTempChar = (aTempChar << 6) | (anExtraChar & 0x3F);
			--aLen;
		}
		if (aLen > 0) return 0; // ran out of data before ending sequence

		// validate substrings
		bool valid = true;
		switch (aTotalLen)
		{
			case 2:
				valid = !((aBytesRead[0] & 0x3E) == 0);
				break;
			case 3:
				valid = !((aBytesRead[0] & 0x1F) == 0 && (aBytesRead[1] & 0x20) == 0);
				break;
			case 4:
				valid = !((aBytesRead[0] & 0x0F) == 0 && (aBytesRead[1] & 0x30) == 0);
				break;
			case 5:
				valid = !((aBytesRead[0] & 0x07) == 0 && (aBytesRead[1] & 0x38) == 0);
				break;
			case 6:
				valid = !((aBytesRead[0] & 0x03) == 0 && (aBytesRead[1] & 0x3C) == 0);
				break;
		}
		if (!valid) return 0;
	}

	int aConsumedCount = aBuffer - *theBuffer;
	
	if ( (aTempChar >= 0xD800 && aTempChar <= 0xDFFF) || (aTempChar >= 0xFFFE && aTempChar <= 0xFFFF) ) 
		return 0;

	*theChar = (wchar_t)aTempChar;

	*theBuffer = aBuffer;
	return aConsumedCount;
}

Buffer::Buffer()
{
	mDataBitSize = 0;
	mReadBitPos = 0;
	mWriteBitPos = 0;	
}

Buffer::~Buffer()
{
}

std::wstring Buffer::UTF8ToWideString() const
{
    if (mDataBitSize < 0)
        throw BufferError(BufferOperation::UTF8ToWideString, BufferFailure::NegativeLogicalSize);
    const size_t length = (static_cast<size_t>(mDataBitSize) + 7) / 8;
    if (length > mData.size())
        throw BufferError(BufferOperation::UTF8ToWideString, BufferFailure::LogicalSizeBeyondStorage);
    if ((mDataBitSize & 7) != 0)
        throw UTF8DecodeError(length - 1);

    std::wstring result;
    result.reserve(length); // UTF-16 units never outnumber UTF-8 bytes.
    for (size_t offset = 0; offset < length;)
    {
        const size_t start = offset;
        const unsigned first = mData[offset++];
        unsigned value = first, minimum = 0, extra = 0;
        if (first < 0x80) {}
        else if (first >= 0xC2 && first <= 0xDF) { value &= 0x1F; minimum = 0x80; extra = 1; }
        else if (first >= 0xE0 && first <= 0xEF) { value &= 0x0F; minimum = 0x800; extra = 2; }
        else if (first >= 0xF0 && first <= 0xF4) { value &= 0x07; minimum = 0x10000; extra = 3; }
        else throw UTF8DecodeError(start);
        if (extra > length - offset)
            throw UTF8DecodeError(start);
        for (unsigned i = 0; i < extra; ++i)
        {
            const unsigned next = mData[offset++];
            if ((next & 0xC0) != 0x80)
                throw UTF8DecodeError(start);
            value = (value << 6) | (next & 0x3F);
        }
        // Preserve the text codec's noncharacter restriction, but never
        // mistake malformed input for a successfully converted prefix.
        if (value < minimum || value > 0x10FFFF ||
            (value >= 0xD800 && value <= 0xDFFF) || value == 0xFFFE || value == 0xFFFF)
            throw UTF8DecodeError(start);
        if (start == 0 && value == 0xFEFF)
            continue;
        if constexpr (sizeof(wchar_t) == 2)
        {
            if (value > 0xFFFF)
            {
                value -= 0x10000;
                result += static_cast<wchar_t>(0xD800 + (value >> 10));
                result += static_cast<wchar_t>(0xDC00 + (value & 0x3FF));
                continue;
            }
        }
        result += static_cast<wchar_t>(value);
    }
    return result;
}

void Buffer::Clear()
{
	mReadBitPos = 0;
	mWriteBitPos = 0;
	mDataBitSize = 0;
	mData.clear();
}

void Buffer::WriteByte(uchar theByte)
{	
	if (mWriteBitPos % 8 == 0)
		mData.push_back((char) theByte);
	else
	{		
		int anOfs = mWriteBitPos  % 8;
		mData[mWriteBitPos /8] |= theByte << anOfs;
		mData.push_back((char) (theByte >> (8-anOfs)));		
	}

	mWriteBitPos += 8;
	if (mWriteBitPos > mDataBitSize)
		mDataBitSize = mWriteBitPos;
}

static void ReserveBufferAppend(ByteVector& theData, size_t theExtraBytes)
{
	if (theExtraBytes > theData.max_size() - theData.size())
		throw BufferError(BufferOperation::ReserveAppend, BufferFailure::CapacityOverflow);
	const size_t aRequired = theData.size() + theExtraBytes;
	if (aRequired <= theData.capacity())
		return;
	// Reserve the entire operation before modifying any bits, but do not turn
	// repeated small writes into one reallocation (and copy) per call.
	const size_t aGrowth = std::min(theData.capacity(), theData.max_size() - theData.capacity());
	theData.reserve(std::max(aRequired, theData.capacity() + aGrowth));
}

void Buffer::WriteNumBits(int theNum, int theBits)
{
	if (theBits < 0 || theBits > 32)
		throw BufferError(BufferOperation::WriteNumBits, BufferFailure::InvalidWidth);
	if (mWriteBitPos < 0 || mWriteBitPos > std::numeric_limits<int>::max() - theBits)
		throw BufferError(BufferOperation::WriteNumBits, BufferFailure::PositionOverflow);
	const size_t aBytePos = static_cast<size_t>(mWriteBitPos / 8);
	const int anOffset = mWriteBitPos % 8;
	if (theBits && (aBytePos > mData.size() || (anOffset && aBytePos == mData.size())))
		throw BufferError(BufferOperation::WriteNumBits, BufferFailure::PositionOutsideStorage);
	const size_t aNewBytes = static_cast<size_t>((anOffset + theBits + 7) / 8 - (anOffset != 0));
	ReserveBufferAppend(mData, aNewBytes);
	const auto aValue = static_cast<unsigned int>(theNum);
	for (int aBitNum = 0; aBitNum < theBits; ++aBitNum)
	{
		if (mWriteBitPos % 8 == 0)
			mData.push_back(0);
		if ((aValue & (1u << aBitNum)) != 0)
			mData[mWriteBitPos / 8] |= static_cast<uchar>(1u << (mWriteBitPos % 8));
		++mWriteBitPos;
	}
	mDataBitSize = std::max(mDataBitSize, mWriteBitPos);
}

int Buffer::GetBitsRequired(int theNum, bool isSigned)
{
	// Keep the legacy two's-complement width convention even when isSigned is
	// false, but do not negate INT_MIN or shift a signed threshold past bit 30.
	const unsigned int aValue = static_cast<unsigned int>(theNum);
	return std::bit_width(theNum < 0 ? ~aValue : aValue) + (isSigned ? 1 : 0);
}

void Buffer::WriteBoolean(bool theBool)
{
	WriteByte(theBool ? 1 : 0);
}

void Buffer::WriteShort(short theShort)
{
	WriteByte((uchar)theShort);
	WriteByte((uchar)(theShort >> 8));
}

void Buffer::WriteLong(long theLong)
{
	WriteByte((uchar)theLong);
	WriteByte((uchar)(theLong >> 8));
	WriteByte((uchar)(theLong >> 16));
	WriteByte((uchar)(theLong >> 24));
}

void Buffer::WriteString(const std::string& theString)
{
	WriteShort((short) theString.length());
	for (int i = 0; i < (int)theString.length(); i++)
		WriteByte(theString[i]);
}

void Buffer::WriteUTF8String(const std::wstring& theString)
{
	if ((mWriteBitPos & 7) != 0) // boo! let's get byte aligned.
		mWriteBitPos = (mWriteBitPos + 8) & ~7;

	WriteShort((short) theString.length());
	for (int i = 0; i < (int)theString.length(); ++i)
	{
		const unsigned int c = (unsigned int)theString[i]; // just in case wchar_t is only 16 bits, and it generally is in visual studio
		if (c < 0x80)
		{
			WriteByte((uchar)c);
		}
		else if (c < 0x800) 
		{
			WriteByte((uchar)(0xC0 | (c>>6)));
			WriteByte((uchar)(0x80 | (c & 0x3F)));
		}
		else if (c < 0x10000) 
		{
			WriteByte((uchar)(0xE0 | c>>12));
			WriteByte((uchar)(0x80 | ((c>>6) & 0x3F)));
			WriteByte((uchar)(0x80 | (c & 0x3F)));
		}
		else if (c < 0x110000) 
		{
			WriteByte((uchar)(0xF0 | (c>>18)));
			WriteByte((uchar)(0x80 | ((c>>12) & 0x3F)));
			WriteByte((uchar)(0x80 | ((c>>6) & 0x3F)));
			WriteByte((uchar)(0x80 | (c & 0x3F)));
		} // are the remaining ranges really necessary? add if so!
	}
}

void Buffer::WriteLine(const std::string& theString)
{
	WriteBytes((const uchar*) (theString + "\r\n").c_str(), (int) theString.length() + 2);
}

void Buffer::WriteBuffer(const ByteVector& theBuffer)
{
	if (&theBuffer == &mData)
		throw BufferError(BufferOperation::WriteBuffer, BufferFailure::SourceAliasesOutput);
	if (mWriteBitPos < 0 || mWriteBitPos > std::numeric_limits<int>::max() - 32 ||
		theBuffer.size() > static_cast<size_t>((std::numeric_limits<int>::max() - mWriteBitPos - 32) / 8))
		throw BufferError(BufferOperation::WriteBuffer, BufferFailure::PositionOverflow);
	const size_t aBytePos = static_cast<size_t>(mWriteBitPos / 8);
	if (aBytePos > mData.size() || (mWriteBitPos % 8 && aBytePos == mData.size()))
		throw BufferError(BufferOperation::WriteBuffer, BufferFailure::PositionOutsideStorage);
	const size_t aNewBytes = 4 + theBuffer.size();
	ReserveBufferAppend(mData, aNewBytes);
	WriteLong(static_cast<long>(theBuffer.size()));
	for (uchar aByte : theBuffer)
		WriteByte(aByte);
}

void Buffer::WriteBytes(const uchar* theByte, int theCount)
{
	for (int i = 0; i < theCount; i++)
		WriteByte(theByte[i]);
}

void Buffer::SetData(const ByteVector& theBuffer)
{
	mData = theBuffer;
	mDataBitSize = mData.size() * 8;
}

void Buffer::SetData(ByteVector&& theBuffer)
{
	if (theBuffer.size() > static_cast<size_t>(std::numeric_limits<int>::max() / 8))
		throw BufferReadError{};
	mData = std::move(theBuffer);
	mDataBitSize = mData.size() * 8;
}

void Buffer::SetData(uchar* thePtr, int theCount)
{
	mData.clear();
	mData.insert(mData.begin(), thePtr, thePtr + theCount);
	mDataBitSize = mData.size() * 8;
}

uchar Buffer::ReadByte() const
{
	if ((mReadBitPos + 7)/8 >= (int)mData.size())
	{		
		return 0; // Underflow
	}

	if (mReadBitPos % 8 == 0)
	{
		uchar b = mData[mReadBitPos/8];
		mReadBitPos += 8;
		return b;
	}
	else
	{
		int anOfs = mReadBitPos % 8;
			
		uchar b = 0;
		
		b = mData[mReadBitPos/8] >> anOfs;
		b |= mData[(mReadBitPos/8)+1] << (8 - anOfs);
		
		mReadBitPos += 8;		
		
		return b;
	}
}

int Buffer::ReadNumBits(int theBits, bool isSigned) const
{
	if (theBits < 0 || theBits > 32)
		throw BufferError(BufferOperation::ReadNumBits, BufferFailure::InvalidWidth);
	if (mReadBitPos < 0)
		throw BufferError(BufferOperation::ReadNumBits, BufferFailure::NegativeReadPosition);
	const size_t aBytePos = static_cast<size_t>(mReadBitPos / 8);
	if (aBytePos >= mData.size())
		return 0; // Preserve the existing partial-read/EOF contract.
	const int aBytes = static_cast<int>(std::min<size_t>(mData.size() - aBytePos, 5));
	const int aBitsToRead = std::min(theBits, aBytes * 8 - mReadBitPos % 8);
	if (mReadBitPos > std::numeric_limits<int>::max() - aBitsToRead)
		throw BufferError(BufferOperation::ReadNumBits, BufferFailure::PositionOverflow);
	unsigned int aValue = 0;
	bool aLastBit = false;
	for (int bit = 0; bit < aBitsToRead; ++bit)
	{
		aLastBit = (mData[mReadBitPos / 8] & (1u << (mReadBitPos % 8))) != 0;
		if (aLastBit)
			aValue |= 1u << bit;
		++mReadBitPos;
	}
	// Sign extension uses the REQUESTED width, as in 1073, even on a short read.
	if (isSigned && aLastBit && theBits < 32)
		aValue |= std::numeric_limits<unsigned int>::max() << theBits;
	return static_cast<int>(aValue);
}

bool Buffer::ReadBoolean() const
{
	return ReadByte() != 0;
}

short Buffer::ReadShort() const
{
	short aShort = ReadByte();
	aShort |= ((short) ReadByte() << 8);
	return aShort;	
}

long Buffer::ReadLong() const
{
	long aLong = ReadByte();
	aLong |= ((long) ReadByte()) << 8;
	aLong |= ((long) ReadByte()) << 16;
	aLong |= ((long) ReadByte()) << 24;

	return aLong;
}

std::string	Buffer::ReadString() const
{
	std::string aString;
	int aLen = ReadShort();

	for (int i = 0; i < aLen; i++)
		aString += (char) ReadByte();

	return aString;
}

std::wstring Buffer::ReadUTF8String() const
{
	if ((mReadBitPos & 7) != 0)
		mReadBitPos = (mReadBitPos + 8) & ~7; // byte align the read position

	std::wstring aString;
	int aLen = ReadShort();

	const char* aData = (const char*)(&mData[mReadBitPos/8]);
	int aDataSizeBytes = (mDataBitSize - mReadBitPos)/8;

	int i;
	for (i = 0; aDataSizeBytes > 0 && i < aLen; ++i)
	{
		wchar_t aChar;
		int aConsumed = GetUTF8Char(&aData, aDataSizeBytes, &aChar);
		if (aConsumed == 0) break;
		aDataSizeBytes -= aConsumed;

		aString += aChar;
	}
	DBG_ASSERT(i == aLen); // if this fires, the UTF-8 data was malformed.

	return aString;
}


std::string Buffer::ReadLine() const
{
	std::string aString;

	for (;;)
	{
		char c = ReadByte();

		if ((c == 0) || (c == '\n'))
			break;

		if (c != '\r')
			aString += c;
	}

	return aString;
}

void Buffer::ReadBytes(uchar* theData, int theLen) const
{
	for (int i = 0; i < theLen; i++)
		theData[i] = ReadByte();
}

void Buffer::ReadBuffer(ByteVector* theByteVector) const
{
	if (theByteVector == nullptr || theByteVector == &mData)
		throw BufferError(BufferOperation::ReadBuffer, BufferFailure::InvalidOutput);
	if (mReadBitPos < 0)
		throw BufferError(BufferOperation::ReadBuffer, BufferFailure::NegativeReadPosition);
	const int aStart = mReadBitPos;
	const size_t aBytePos = static_cast<size_t>(aStart / 8);
	const size_t aHeaderBytes = 4 + (aStart % 8 != 0);
	if (aBytePos > mData.size() || mData.size() - aBytePos < aHeaderBytes)
		throw BufferError(BufferOperation::ReadBuffer, BufferFailure::TruncatedLength);
	if (aStart > std::numeric_limits<int>::max() - 32)
		throw BufferError(BufferOperation::ReadBuffer, BufferFailure::PositionOverflow);
	try
	{
		const auto aLength = static_cast<unsigned long>(ReadLong());
		const size_t aPayloadPos = static_cast<size_t>(mReadBitPos / 8);
		const size_t aNeeded = static_cast<size_t>(aLength) + (aLength != 0 && mReadBitPos % 8 != 0);
		if (aPayloadPos > mData.size() || aNeeded > mData.size() - aPayloadPos)
			throw BufferError(BufferOperation::ReadBuffer, BufferFailure::TruncatedPayload);
		if (aLength > static_cast<unsigned long>((std::numeric_limits<int>::max() - mReadBitPos) / 8))
			throw BufferError(BufferOperation::ReadBuffer, BufferFailure::PositionOverflow);
		ByteVector aResult(aLength);
		ReadBytes(aResult.data(), static_cast<int>(aLength));
		theByteVector->swap(aResult);
	}
	catch (...)
	{
		mReadBitPos = aStart;
		throw;
	}
}

const uchar* Buffer::GetDataPtr() const
{
	if (mData.size() == 0)
		return NULL;
	return &mData[0];
}

unsigned int Buffer::GetCRC32(unsigned int theSeed) const
{	
    // Deliberately checksum the backing bytes, as before, not mDataBitSize.
    return UpdateCRC(static_cast<std::uint32_t>(theSeed), mData.data(), mData.size());
}
