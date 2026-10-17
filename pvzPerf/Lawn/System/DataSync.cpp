#include "DataSync.h"
#include "DataWriterLimits.h"
#include "Sexy.TodLib/TodDebug.h"
#include <cerrno>
#include <bit>
#include <cstdint>
#include <limits>
#include <system_error>
#include <utility>

static_assert(sizeof(float) == 4 && std::numeric_limits<float>::is_iec559,
	"1073 float wire values require IEEE binary32");
static_assert(sizeof(double) == 8 && std::numeric_limits<double>::is_iec559,
	"1073 double wire values require IEEE binary64");
static_assert(std::endian::native == std::endian::little || std::endian::native == std::endian::big,
	"1073 wire conversion requires a uniform native byte order");

DataReader::DataReader()
{
	mFile = nullptr;
	mData = nullptr;
	mDataLen = 0;
	mDataPos = 0;
	mOwnData = false;
}

//0x441B20、0x441B80
DataReader::~DataReader()
{
	if (mFile)
	{
		fclose(mFile);
		mFile = nullptr;
	}

	if (mOwnData)
	{
		delete[] mData;
	}

	mData = nullptr;
	mDataLen = 0;
	mDataPos = 0;
	mOwnData = false;
}

bool DataReader::OpenFile(const std::string& theFileName)
{
	if (mFile)
	{
		fclose(mFile);
		mFile = nullptr;
	}
	if (mOwnData)
	{
		delete[] mData;
	}

	mData = nullptr;
	mDataLen = 0;
	mDataPos = 0;
	mOwnData = false;
	mFile = fopen(theFileName.c_str(), "rb");
	return mFile;
}

void DataReader::OpenMemory(const void* theData, unsigned int theDataLen, bool takeOwnership)
{
	if (mFile)
	{
		fclose(mFile);
		mFile = nullptr;
	}
	if (mOwnData)
	{
		delete[] mData;
	}

	mData = (char*)theData;
	mDataLen = theDataLen;
	mDataPos = 0;
	mOwnData = takeOwnership;
}

void DataReader::Close()
{
	if (mFile)
	{
		fclose(mFile);
		mFile = nullptr;
	}
}

//0x441BE0
void DataReader::ReadBytes(void* theMem, unsigned int theNumBytes)
{
	if (mData)
	{
		if (mDataPos > mDataLen || theNumBytes > mDataLen - mDataPos)
		{
			throw DataReaderException();
		}

		memcpy(theMem, mData + mDataPos, theNumBytes);
		mDataPos += theNumBytes;
	}
	else if (!mFile || fread(theMem, sizeof(char), theNumBytes, mFile) != theNumBytes)
	{
		throw DataReaderException();
	}
}

void DataReader::Rewind(unsigned int theNumBytes)
{
	if (mFile)
	{
		// The stream owns its position, including bytes consumed by a short read.
		// mDataPos is only the memory-buffer cursor; it is not a FILE offset.
#ifdef _WIN32
		const auto aPosition = _ftelli64(mFile);
#else
		const auto aPosition = ftello(mFile);
#endif
		if (aPosition < 0)
		{
			throw DataReaderException();
		}
		const auto aRewind = std::min<std::uint64_t>(theNumBytes, aPosition);
		const auto aTarget = aPosition - static_cast<decltype(aPosition)>(aRewind);
#ifdef _WIN32
		const int aResult = _fseeki64(mFile, aTarget, SEEK_SET);
#else
		const int aResult = fseeko(mFile, aTarget, SEEK_SET);
#endif
		if (aResult != 0)
		{
			throw DataReaderException();
		}
		return;
	}

	theNumBytes = std::min(theNumBytes, mDataPos);
	mDataPos -= theNumBytes;
}

unsigned short DataReader::ReadShort()
{
	std::uint16_t aValue;
	ReadBytes(&aValue, sizeof(aValue));
	if constexpr (std::endian::native == std::endian::big)
		aValue = std::byteswap(aValue);
	return aValue;
}

unsigned int DataReader::ReadLong()
{
	// "Long" is the historical name of a four-byte little-endian wire value,
	// not the size or byte order of the host C++ unsigned int.
	unsigned char aBytes[4];
	ReadBytes(aBytes, sizeof(aBytes));
	return std::uint32_t(aBytes[0]) | (std::uint32_t(aBytes[1]) << 8) |
		(std::uint32_t(aBytes[2]) << 16) | (std::uint32_t(aBytes[3]) << 24);
}

unsigned char DataReader::ReadByte()
{
	unsigned char aChar;
	ReadBytes(&aChar, sizeof(aChar));
	return aChar;
}

bool DataReader::ReadBool()
{
	// 1073 SyncDetails reads a byte, then cmp/setne normalizes it to 0 or 1.
	// A serialized nonzero byte is true, not a raw C++ bool representation.
	return ReadByte() != 0;
}

float DataReader::ReadFloat()
{
	// Preserve the IEEE bits, including negative zero and NaN payloads.
	return std::bit_cast<float>(static_cast<std::uint32_t>(ReadLong()));
}

double DataReader::ReadDouble()
{
	std::uint64_t aBits;
	ReadBytes(&aBits, sizeof(aBits));
	if constexpr (std::endian::native == std::endian::big)
		aBits = std::byteswap(aBits);
	return std::bit_cast<double>(aBits);
}

void DataReader::ReadString(SexyString& theStr)
{
	unsigned int aStrLen = ReadShort();
	theStr.resize(aStrLen);
	ReadBytes(theStr.data(), aStrLen);
}

////////////////////////////////////////////////////////////////////////////////////////////////////

//0x441E70
DataSync::DataSync(DataReader& theReader)
{
	Reset();
	mReader = &theReader;
}

//0x441F10
DataSync::DataSync(DataWriter& theWriter)
{
	Reset();
	mWriter = &theWriter;
}

//0x441FB0
DataSync::~DataSync()
{
}

//0x442020
void DataSync::ResetPointerTable()
{
	mIntToPointerMap.clear();
	mPointerToIntMap.clear();
	mPointerSyncList.clear();
	mCurPointerIndex = 1;
	mPointerToIntMap[nullptr] = 0;
	mIntToPointerMap[0] = nullptr;
}

void DataSync::Reset()
{
	mReader = nullptr;
	mWriter = nullptr;
	ResetPointerTable();
}

void DataSync::SyncBytes(void* theData, unsigned int theDataLen)
{
	if (mReader)
	{
		mReader->ReadBytes(theData, theDataLen);
	}
	else
	{
		mWriter->WriteBytes(theData, theDataLen);
	}
}

void DataSync::SyncLong(unsigned int& theNum)
{
	if (mReader)
	{
		theNum = mReader->ReadLong();
	}
	else
	{
		mWriter->WriteLong(theNum);
	}
}

void DataSync::SyncLong(char& theNum)
{
	unsigned int aNum = static_cast<unsigned char>(theNum);
	SyncLong(aNum);
	if (mReader)
		theNum = static_cast<char>(aNum);
}

void DataSync::SyncLong(short& theNum)
{
	unsigned int aNum = static_cast<unsigned short>(theNum);
	SyncLong(aNum);
	if (mReader)
		theNum = static_cast<short>(aNum);
}

void DataSync::SyncLong(long& theNum)
{
	unsigned int aNum = static_cast<unsigned int>(theNum);
	SyncLong(aNum);
	if (mReader)
		theNum = static_cast<long>(aNum);
}

void DataSync::SyncLong(unsigned char& theNum)
{
	unsigned int aNum = theNum;
	SyncLong(aNum);
	if (mReader)
		theNum = static_cast<unsigned char>(aNum);
}

void DataSync::SyncLong(unsigned short& theNum)
{
	unsigned int aNum = theNum;
	SyncLong(aNum);
	if (mReader)
		theNum = static_cast<unsigned short>(aNum);
}

void DataSync::SyncLong(int& theNum)
{
	unsigned int aNum = static_cast<unsigned int>(theNum);
	SyncLong(aNum);
	if (mReader)
		theNum = static_cast<int>(aNum);
}

void DataSync::SyncSLong(long& theNum)
{
	if (mReader)
	{
		theNum = (long)mReader->ReadLong();
	}
	else
	{
		mWriter->WriteLong((unsigned int)theNum);
	}
}

void DataSync::SyncSLong(char& theNum)
{
	long aNum = theNum;
	SyncSLong(aNum);
	if (mReader)
		theNum = static_cast<char>(aNum);
}

void DataSync::SyncSLong(short& theNum)
{
	long aNum = theNum;
	SyncSLong(aNum);
	if (mReader)
		theNum = static_cast<short>(aNum);
}

void DataSync::SyncSLong(int& theNum)
{
	long aNum = theNum;
	SyncSLong(aNum);
	if (mReader)
		theNum = static_cast<int>(aNum);
}

void DataSync::SyncSLong(unsigned char& theNum)
{
	long aNum = theNum;
	SyncSLong(aNum);
	if (mReader)
		theNum = static_cast<unsigned char>(aNum);
}

void DataSync::SyncSLong(unsigned short& theNum)
{
	long aNum = theNum;
	SyncSLong(aNum);
	if (mReader)
		theNum = static_cast<unsigned short>(aNum);
}

void DataSync::SyncSLong(unsigned int& theNum)
{
	long aNum = static_cast<long>(theNum);
	SyncSLong(aNum);
	if (mReader)
		theNum = static_cast<unsigned int>(aNum);
}

void DataSync::SyncShort(unsigned short& theNum)
{
	if (mReader)
	{
		theNum = mReader->ReadShort();
	}
	else
	{
		mWriter->WriteShort(theNum);
	}
}

void DataSync::SyncShort(char& theNum)
{
	unsigned short aNum = static_cast<unsigned char>(theNum);
	SyncShort(aNum);
	if (mReader)
		theNum = static_cast<char>(aNum);
}

void DataSync::SyncShort(short& theNum)
{
	unsigned short aNum = static_cast<unsigned short>(theNum);
	SyncShort(aNum);
	if (mReader)
		theNum = static_cast<short>(aNum);
}

void DataSync::SyncShort(long& theNum)
{
	unsigned short aNum = static_cast<unsigned short>(theNum);
	SyncShort(aNum);
	if (mReader)
		theNum = static_cast<long>(aNum);
}

void DataSync::SyncShort(unsigned char& theNum)
{
	unsigned short aNum = theNum;
	SyncShort(aNum);
	if (mReader)
		theNum = static_cast<unsigned char>(aNum);
}

void DataSync::SyncShort(unsigned int& theNum)
{
	unsigned short aNum = static_cast<unsigned short>(theNum);
	SyncShort(aNum);
	if (mReader)
		theNum = aNum;
}

void DataSync::SyncShort(int& theNum)
{
	unsigned short aNum = static_cast<unsigned short>(theNum);
	SyncShort(aNum);
	if (mReader)
		theNum = aNum;
}

void DataSync::SyncSShort(short& theNum)
{
	if (mReader)
	{
		theNum = (short)mReader->ReadShort();
	}
	else
	{
		mWriter->WriteShort((unsigned short)theNum);
	}
}

void DataSync::SyncSShort(char& theNum)
{
	short aNum = theNum;
	SyncSShort(aNum);
	if (mReader)
		theNum = static_cast<char>(aNum);
}

void DataSync::SyncSShort(long& theNum)
{
	short aNum = static_cast<short>(theNum);
	SyncSShort(aNum);
	if (mReader)
		theNum = aNum;
}

void DataSync::SyncSShort(unsigned char& theNum)
{
	short aNum = theNum;
	SyncSShort(aNum);
	if (mReader)
		theNum = static_cast<unsigned char>(aNum);
}

void DataSync::SyncSShort(unsigned short& theNum)
{
	short aNum = static_cast<short>(theNum);
	SyncSShort(aNum);
	if (mReader)
		theNum = static_cast<unsigned short>(aNum);
}

void DataSync::SyncSShort(unsigned int& theNum)
{
	short aNum = static_cast<short>(theNum);
	SyncSShort(aNum);
	if (mReader)
		theNum = static_cast<unsigned int>(aNum);
}

void DataSync::SyncSShort(int& theNum)
{
	short aNum = static_cast<short>(theNum);
	SyncSShort(aNum);
	if (mReader)
		theNum = aNum;
}

void DataSync::SyncByte(unsigned char& theChar)
{
	if (mReader)
	{
		theChar = mReader->ReadByte();
	}
	else
	{
		mWriter->WriteByte(theChar);
	}
}

void DataSync::SyncByte(char& theChar)
{
	unsigned char aChar = static_cast<unsigned char>(theChar);
	SyncByte(aChar);
	if (mReader)
		theChar = static_cast<char>(aChar);
}

void DataSync::SyncByte(short& theChar)
{
	unsigned char aChar = static_cast<unsigned char>(theChar);
	SyncByte(aChar);
	if (mReader)
		theChar = aChar;
}

void DataSync::SyncByte(long& theChar)
{
	unsigned char aChar = static_cast<unsigned char>(theChar);
	SyncByte(aChar);
	if (mReader)
		theChar = aChar;
}

void DataSync::SyncByte(unsigned short& theChar)
{
	unsigned char aChar = static_cast<unsigned char>(theChar);
	SyncByte(aChar);
	if (mReader)
		theChar = aChar;
}

void DataSync::SyncByte(unsigned int& theChar)
{
	unsigned char aChar = static_cast<unsigned char>(theChar);
	SyncByte(aChar);
	if (mReader)
		theChar = aChar;
}

void DataSync::SyncByte(int& theChar)
{
	unsigned char aChar = static_cast<unsigned char>(theChar);
	SyncByte(aChar);
	if (mReader)
		theChar = aChar;
}

void DataSync::SyncSByte(char& theChar)
{
	if (mReader)
	{
		theChar = (char)mReader->ReadByte();
	}
	else
	{
		mWriter->WriteByte((unsigned char)theChar);
	}
}

void DataSync::SyncSByte(short& theChar)
{
	char aChar = static_cast<char>(theChar);
	SyncSByte(aChar);
	if (mReader)
		theChar = aChar;
}

void DataSync::SyncSByte(long& theChar)
{
	char aChar = static_cast<char>(theChar);
	SyncSByte(aChar);
	if (mReader)
		theChar = aChar;
}

void DataSync::SyncSByte(unsigned char& theChar)
{
	char aChar = static_cast<char>(theChar);
	SyncSByte(aChar);
	if (mReader)
		theChar = static_cast<unsigned char>(aChar);
}

void DataSync::SyncSByte(unsigned short& theChar)
{
	char aChar = static_cast<char>(theChar);
	SyncSByte(aChar);
	if (mReader)
		theChar = static_cast<unsigned short>(aChar);
}

void DataSync::SyncSByte(unsigned int& theChar)
{
	char aChar = static_cast<char>(theChar);
	SyncSByte(aChar);
	if (mReader)
		theChar = static_cast<unsigned int>(aChar);
}

void DataSync::SyncSByte(int& theChar)
{
	char aChar = static_cast<char>(theChar);
	SyncSByte(aChar);
	if (mReader)
		theChar = aChar;
}

void DataSync::SyncBool(bool& theBool)
{
	if (mReader)
	{
		theBool = mReader->ReadBool();
	}
	else
	{
		mWriter->WriteBool(theBool);
	}
}

void DataSync::SyncFloat(float& theFloat)
{
	if (mReader)
	{
		theFloat = mReader->ReadFloat();
	}
	else
	{
		mWriter->WriteFloat(theFloat);
	}
}

void DataSync::SyncDouble(double& theDouble)
{
	if (mReader)
	{
		theDouble = mReader->ReadDouble();
	}
	else
	{
		mWriter->WriteDouble(theDouble);
	}
}

void DataSync::SyncString(SexyString& theStr)
{
	if (mReader)
	{
		mReader->ReadString(theStr);
	}
	else
	{
		mWriter->WriteString(theStr);
	}
}

////////////////////////////////////////////////////////////////////////////////////////////////////

DataWriter::DataWriter()
{
	mFile = nullptr;
	mMemoryActive = false;
}

//0x4436A0、0x4436F0
DataWriter::~DataWriter()
{
	// Destruction must not throw over an existing exception. Explicit Close
	// reports flush errors to its caller; destruction still records any failure.
	if (mFile && fclose(std::exchange(mFile, nullptr)) != 0)
		TodTraceAndLog("DataWriter: file close failed during destruction (errno=%d)\n", errno);
}

bool DataWriter::OpenFile(const std::string& theFileName)
{
	Close();
	mMemoryActive = false;
	std::vector<char>().swap(mData);
	mFile = fopen(theFileName.c_str(), "wb");
	return mFile != nullptr;
}

void DataWriter::Close()
{
	if (mFile)
	{
		errno = 0;
		if (fclose(std::exchange(mFile, nullptr)) != 0)
			throw std::system_error(errno ? errno : EIO, std::generic_category(), "DataWriter file close");
	}
	// Like the original, closing an in-memory writer retains its payload.
}

void DataWriter::OpenMemory(unsigned int theReserveAmount)
{
	const auto reserve = DataWriterLimits::AppendSize(0, std::max(theReserveAmount, 32u));
	// Allocation failure leaves the previous destination and payload intact.
	mData.reserve(reserve);
	Close();
	mData.clear();
	mMemoryActive = true;
}

void DataWriter::WriteBytes(const void* theData, unsigned int theDataLen)
{
	if (theDataLen == 0) return;
	if (mFile)
	{
		if (!theData) throw std::invalid_argument("DataWriter received a null source");
		errno = 0;
		if (fwrite(theData, 1, theDataLen, mFile) != theDataLen)
			throw std::system_error(errno ? errno : EIO, std::generic_category(), "DataWriter file write");
		return;
	}
	if (!mMemoryActive) throw std::logic_error("DataWriter has no open destination");
	const auto previousSize = mData.size();
	const auto newSize = DataWriterLimits::AppendSize(previousSize, theDataLen);
	if (!theData) throw std::invalid_argument("DataWriter received a null source");
	const auto source = reinterpret_cast<std::uintptr_t>(theData);
	const auto base = reinterpret_cast<std::uintptr_t>(mData.data());
	const bool ownSource = source >= base && source - base < previousSize;
	const auto sourceOffset = ownSource ? source - base : 0;
	if (ownSource && theDataLen > previousSize - sourceOffset)
		throw std::out_of_range("DataWriter source extends beyond its payload");
	mData.reserve(DataWriterLimits::CapacityFor(mData.capacity(), newSize));
	if (ownSource)
	{
		// A pointer into the old allocation must be rebased after growth.
		// The destination starts after the entire old payload, so no overlap.
		mData.resize(newSize);
		memcpy(mData.data() + previousSize, mData.data() + sourceOffset, theDataLen);
	}
	else
	{
		const auto* begin = static_cast<const char*>(theData);
		mData.insert(mData.end(), begin, begin + theDataLen);
	}
}

//0x443770
void DataWriter::WriteLong(unsigned int theLong)
{
	const std::uint32_t aValue = static_cast<std::uint32_t>(theLong);
	const unsigned char aBytes[4] = {
		static_cast<unsigned char>(aValue), static_cast<unsigned char>(aValue >> 8),
		static_cast<unsigned char>(aValue >> 16), static_cast<unsigned char>(aValue >> 24)
	};
	WriteBytes(aBytes, sizeof(aBytes));
}

//0x4437C0
void DataWriter::WriteShort(unsigned short theShort)
{
	std::uint16_t aValue = static_cast<std::uint16_t>(theShort);
	if constexpr (std::endian::native == std::endian::big)
		aValue = std::byteswap(aValue);
	WriteBytes(&aValue, sizeof(aValue));
}

void DataWriter::WriteByte(unsigned char theChar)
{
	WriteBytes(&theChar, sizeof(unsigned char));
}

void DataWriter::WriteBool(bool theBool)
{
	WriteBytes(&theBool, sizeof(bool));
}

void DataWriter::WriteFloat(float theFloat)
{
	WriteLong(std::bit_cast<std::uint32_t>(theFloat));
}

void DataWriter::WriteDouble(double theDouble)
{
	std::uint64_t aBits = std::bit_cast<std::uint64_t>(theDouble);
	if constexpr (std::endian::native == std::endian::big)
		aBits = std::byteswap(aBits);
	WriteBytes(&aBits, sizeof(aBits));
}

//0x443810
void DataWriter::WriteString(const SexyString& theStr)
{
	if (theStr.length() > 0xffff)
		throw std::length_error("DataWriter string exceeds its 16-bit wire length");
	unsigned short aStrLen = (unsigned short)theStr.length();
	WriteShort(aStrLen);
	WriteBytes(theStr.c_str(), (unsigned int)aStrLen);
}
