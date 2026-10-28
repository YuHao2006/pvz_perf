#include "PakInterface.h"
#ifndef _WIN32
#include <sys/mman.h>
#include <sys/stat.h>
#include <unistd.h>
#include <fcntl.h>
#include <glob.h>
#endif
#include <filesystem>
#include <string_view>
#include <cstring>
#include <algorithm>
#include <vector>
#include <cstdint>
#include <stdexcept>

typedef unsigned char uchar;
typedef unsigned short ushort;

enum
{
	FILEFLAGS_END = 0x80
};

PakInterface* gPakInterface = new PakInterface();

static std::string StringToUpper(const std::string& theString)
{
	std::string aString;

	for (unsigned i = 0; i < theString.length(); i++)
		aString += static_cast<char>(toupper(static_cast<unsigned char>(theString[i])));

	return aString;
}

static unsigned short ReadPakU16(const unsigned char* theData)
{
	return (unsigned short)theData[0] | ((unsigned short)theData[1] << 8);
}

static unsigned int ReadPakU32(const unsigned char* theData)
{
	return (unsigned int)theData[0] |
		((unsigned int)theData[1] << 8) |
		((unsigned int)theData[2] << 16) |
		((unsigned int)theData[3] << 24);
}

static bool AddPakFileZipOnly(PakInterface* theInterface, const std::string& theFileName)
{
#ifdef _WIN32
	HANDLE aFileHandle = CreateFile(theFileName.c_str(), GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING, 0, NULL);
	if (aFileHandle == INVALID_HANDLE_VALUE)
		return false;
	DWORD aFileSize = GetFileSize(aFileHandle, NULL);
	if (aFileSize < 22 || aFileSize == INVALID_FILE_SIZE)
	{
		CloseHandle(aFileHandle);
		return false;
	}
	HANDLE aFileMapping = CreateFileMapping(aFileHandle, NULL, PAGE_READONLY, 0, aFileSize, NULL);
	if (aFileMapping == NULL)
	{
		CloseHandle(aFileHandle);
		return false;
	}
	void* aPtr = MapViewOfFile(aFileMapping, FILE_MAP_READ, 0, 0, aFileSize);
	if (aPtr == NULL)
	{
		CloseHandle(aFileMapping);
		CloseHandle(aFileHandle);
		return false;
	}
#else
	const int aFileHandle = open(theFileName.c_str(), O_RDONLY | O_CLOEXEC);
	if (aFileHandle < 0) return false;
	struct stat info{};
	if (fstat(aFileHandle, &info) != 0 || info.st_size < 22 || info.st_size > INT32_MAX)
	{
		close(aFileHandle);
		return false;
	}
	const auto aFileSize = static_cast<unsigned int>(info.st_size);
	void* aPtr = mmap(nullptr, aFileSize, PROT_READ, MAP_PRIVATE, aFileHandle, 0);
	if (aPtr == MAP_FAILED) { close(aFileHandle); return false; }
#endif
	const unsigned char* aBytes = (const unsigned char*)aPtr;
	bool aCollectionAdded = false;
	std::vector<std::string> aInsertedKeys;
	auto aFail = [&]() {
		for (const std::string& aKey : aInsertedKeys)
			theInterface->mPakRecordMap.erase(aKey);
		if (aCollectionAdded)
			theInterface->mPakCollectionList.pop_back();
#ifdef _WIN32
		UnmapViewOfFile(aPtr);
		CloseHandle(aFileMapping);
		CloseHandle(aFileHandle);
#else
		munmap(aPtr, aFileSize);
		close(aFileHandle);
#endif
		return false;
	};
	if (ReadPakU32(aBytes) != 0x04034B50u)
		return aFail();
	int aSearchBegin = std::max(0, (int)aFileSize - (22 + 0xFFFF));
	int anEndOfCentral = -1;
	for (int aPos = (int)aFileSize - 22; aPos >= aSearchBegin; --aPos)
	{
		if (ReadPakU32(aBytes + aPos) == 0x06054B50u)
		{
			anEndOfCentral = aPos;
			break;
		}
	}
	if (anEndOfCentral < 0 || ReadPakU16(aBytes + anEndOfCentral + 4) != 0 || ReadPakU16(aBytes + anEndOfCentral + 6) != 0)
		return aFail();
	unsigned int aEntryCount = ReadPakU16(aBytes + anEndOfCentral + 10);
	unsigned int aCentralSize = ReadPakU32(aBytes + anEndOfCentral + 12);
	unsigned int aCentralOffset = ReadPakU32(aBytes + anEndOfCentral + 16);
	if ((unsigned long long)aCentralOffset + aCentralSize > aFileSize)
		return aFail();

	theInterface->mPakCollectionList.push_back(PakCollection());
	aCollectionAdded = true;
	PakCollection* aCollection = &theInterface->mPakCollectionList.back();
	aCollection->mFileHandle = aFileHandle;
#ifdef _WIN32
	aCollection->mMappingHandle = aFileMapping;
#else
	aCollection->mMappingSize = aFileSize;
#endif
	aCollection->mDataPtr = aPtr;
	unsigned int aPos = aCentralOffset;
	for (unsigned int i = 0; i < aEntryCount; ++i)
	{
		if (aPos > aFileSize || aFileSize - aPos < 46 || ReadPakU32(aBytes + aPos) != 0x02014B50u)
			return aFail();
		unsigned short aFlags = ReadPakU16(aBytes + aPos + 8);
		unsigned short aMethod = ReadPakU16(aBytes + aPos + 10);
		unsigned int aSize = ReadPakU32(aBytes + aPos + 24);
		unsigned short aNameSize = ReadPakU16(aBytes + aPos + 28);
		unsigned short anExtraSize = ReadPakU16(aBytes + aPos + 30);
		unsigned short aCommentSize = ReadPakU16(aBytes + aPos + 32);
		unsigned int aLocalOffset = ReadPakU32(aBytes + aPos + 42);
		if ((aFlags & 1) != 0 || aMethod != 0 || aSize > 0x7FFFFFFFu ||
			(unsigned long long)46 + aNameSize + anExtraSize + aCommentSize > aFileSize - aPos ||
			aLocalOffset > aFileSize || aFileSize - aLocalOffset < 30 || ReadPakU32(aBytes + aLocalOffset) != 0x04034B50u ||
			aNameSize == 0 || aNameSize >= 256)
			return aFail();
		unsigned short aLocalNameSize = ReadPakU16(aBytes + aLocalOffset + 26);
		unsigned short aLocalExtraSize = ReadPakU16(aBytes + aLocalOffset + 28);
		unsigned long long aDataOffset = (unsigned long long)aLocalOffset + 30 + aLocalNameSize + aLocalExtraSize;
		if (aDataOffset + aSize > aFileSize)
			return aFail();
		char aName[256];
		memcpy(aName, aBytes + aPos + 46, aNameSize);
		aName[aNameSize] = 0;
		for (unsigned int j = 0; j < aNameSize; ++j)
			if (aName[j] == '/')
				aName[j] = '\\';
		PakFileTime aFileTime = {};
		PakRecordMap::iterator aRecordItr = theInterface->mPakRecordMap.insert(PakRecordMap::value_type(StringToUpper(aName), PakRecord())).first;
		if (aRecordItr->second.mCollection == nullptr)
		{
			PakRecord* aRecord = &aRecordItr->second;
			aRecord->mCollection = aCollection;
			aRecord->mFileName = aName;
			aRecord->mStartPos = (int)aDataOffset;
			aRecord->mSize = (int)aSize;
			aRecord->mFileTime = aFileTime;
			aInsertedKeys.push_back(StringToUpper(aName));
		}
		aPos += 46 + aNameSize + anExtraSize + aCommentSize;
	}
	return true;
}

PakInterface::PakInterface()
{
	if (GetPakPtr() == NULL)
		*gPakInterfaceP = this;
}

PakInterface::~PakInterface()
{
#ifndef _WIN32
	for (auto& collection : mPakCollectionList)
	{
		munmap(collection.mDataPtr, collection.mMappingSize);
		close(collection.mFileHandle);
	}
	if (*gPakInterfaceP == this) *gPakInterfaceP = nullptr;
#endif
}

bool PakInterface::AddPakFile(const std::string& theFileName)
{
	return AddPakFileZipOnly(this, theFileName);
	/* Legacy custom PAK parser retained below only as historical reference. */
	#if 0
	HANDLE aFileHandle = CreateFile(theFileName.c_str(), GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING, 0, NULL);

	if (aFileHandle == INVALID_HANDLE_VALUE)
		return false;

	int aFileSize = GetFileSize(aFileHandle, 0);

	HANDLE aFileMapping = CreateFileMapping(aFileHandle, NULL, PAGE_READONLY, 0, aFileSize, NULL);
	if (aFileMapping == NULL)
	{
		CloseHandle(aFileHandle);
		return false;
	}

	void* aPtr = MapViewOfFile(aFileMapping, FILE_MAP_READ, 0, 0, aFileSize);
	if (aPtr == NULL)
	{
		CloseHandle(aFileMapping);
		CloseHandle(aFileHandle);
		return false;
	}

	mPakCollectionList.push_back(PakCollection());
	PakCollection* aPakCollection = &mPakCollectionList.back();

	aPakCollection->mFileHandle = aFileHandle;
	aPakCollection->mMappingHandle = aFileMapping;
	aPakCollection->mDataPtr = aPtr;

	// Legacy x64 accepts only the converter's unobfuscated PAK64 format.  The
	// official XOR-obfuscated 32-bit PAK is an input to the standalone converter,
	// never a runtime dependency.
	const unsigned int kPakMagic = 0xBAC04AC0u;
	unsigned int aStoredMagic = 0;
	if (aFileSize >= (int)sizeof(aStoredMagic))
		memcpy(&aStoredMagic, aPtr, sizeof(aStoredMagic));
	if (aStoredMagic != kPakMagic)
	{
		UnmapViewOfFile(aPtr);
		CloseHandle(aFileMapping);
		CloseHandle(aFileHandle);
		mPakCollectionList.pop_back();
		return false;
	}
	
	PakRecordMap::iterator aRecordItr = mPakRecordMap.insert(PakRecordMap::value_type(StringToUpper(theFileName), PakRecord())).first;
	PakRecord* aPakRecord = &(aRecordItr->second);
	aPakRecord->mCollection = aPakCollection;
	aPakRecord->mFileName = theFileName;
	aPakRecord->mStartPos = 0;
	aPakRecord->mSize = aFileSize;
	
	PFILE* aFP = FOpen(theFileName.c_str(), "rb");
	if (aFP == NULL)
		return false;

	unsigned int aMagic = 0;
	FRead(&aMagic, sizeof(unsigned int), 1, aFP);
	if (aMagic != 0xBAC04AC0)
	{
		FClose(aFP);
		return false;
	}

	unsigned int aVersion = 0;
	FRead(&aVersion, sizeof(unsigned int), 1, aFP);
	if (aVersion > 0)
	{
		FClose(aFP);
		return false;
	}

	int aPos = 0;

	for (;;)
	{
		uchar aFlags = 0;
		int aCount = FRead(&aFlags, 1, 1, aFP);
		if ((aFlags & FILEFLAGS_END) || (aCount == 0))
			break;

		uchar aNameWidth = 0;
		char aName[256];
		FRead(&aNameWidth, 1, 1, aFP);
		FRead(aName, 1, aNameWidth, aFP);
		aName[aNameWidth] = 0;
		int aSrcSize = 0;
		FRead(&aSrcSize, sizeof(int), 1, aFP);
		FILETIME aFileTime;
		FRead(&aFileTime, sizeof(FILETIME), 1, aFP);

		PakRecordMap::iterator aRecordItr = mPakRecordMap.insert(PakRecordMap::value_type(StringToUpper(aName), PakRecord())).first;
		PakRecord* aPakRecord = &(aRecordItr->second);
		aPakRecord->mCollection = aPakCollection;
		aPakRecord->mFileName = aName;
		aPakRecord->mStartPos = aPos;
		aPakRecord->mSize = aSrcSize;
		aPakRecord->mFileTime = aFileTime;

		aPos += aSrcSize;
	}

	int anOffset = FTell(aFP);

	// Now fix file starts
	aRecordItr = mPakRecordMap.begin();
	while (aRecordItr != mPakRecordMap.end())
	{
		PakRecord* aPakRecord = &(aRecordItr->second);
		if (aPakRecord->mCollection == aPakCollection)
			aPakRecord->mStartPos += anOffset;
		++aRecordItr;
	}

	FClose(aFP);

	return true;
	#endif
}

// 1073 FUN_0063A400 used unchecked 256-byte cwd/output buffers and treated
// every component starting with ".." as a parent. Normalize complete components
// without opening files; archive names still use uppercase backslashes.
// Keep 1073's cwd-relative archive lookup and unchanged loose-file fallback.
// This is not a sandbox/canonical-path check (no symlink resolution is intended).
static std::string NormalizePakPath(const char* theFileName)
{
	std::string input(theFileName);
#ifndef _WIN32
	std::replace(input.begin(), input.end(), '\\', '/');
#endif
	const std::filesystem::path aPath =
		std::filesystem::path(input).lexically_normal();
	std::string aResult = StringToUpper(aPath.generic_string());
	std::replace(aResult.begin(), aResult.end(), '/', '\\');
	if (aPath.is_absolute())
	{
		std::string aRoot = StringToUpper(
			std::filesystem::current_path().lexically_normal().generic_string());
		std::replace(aRoot.begin(), aRoot.end(), '/', '\\');
		if (!aRoot.empty() && aRoot.back() != '\\')
			aRoot += '\\';
		// Include the separator, so e.g. C:\\game2 is not inside C:\\game.
		if (aResult.starts_with(aRoot))
			aResult.erase(0, aRoot.size());
	}
	return aResult;
}

bool PakPathRequiresArchive(const char* path)
{
	return NormalizePakPath(path).starts_with("COMPILED\\");
}

//0x5D85C0
PFILE* PakInterface::FOpen(const char* theFileName, const char* anAccess)
{
	if ((stricmp(anAccess, "r") == 0) || (stricmp(anAccess, "rb") == 0) || (stricmp(anAccess, "rt") == 0))
	{
		const std::string anUpperName = NormalizePakPath(theFileName);
		
		PakRecordMap::iterator anItr = mPakRecordMap.find(anUpperName);
		if (anItr != mPakRecordMap.end())
		{
			PFILE* aPFP = new PFILE;
			aPFP->mRecord = &anItr->second;
			aPFP->mPos = 0;
			aPFP->mFP = NULL;
			return aPFP;
		}
	}

	if (PakPathRequiresArchive(theFileName))
		return nullptr;

	std::string nativePath(theFileName);
#ifndef _WIN32
	std::replace(nativePath.begin(), nativePath.end(), '\\', '/');
#endif
	FILE* aFP = fopen(nativePath.c_str(), anAccess);
	if (aFP == NULL)
		return NULL;
	PFILE* aPFP = new PFILE;
	aPFP->mRecord = NULL;
	aPFP->mPos = 0;
	aPFP->mFP = aFP;
	return aPFP;
}

//0x5D8780
int PakInterface::FClose(PFILE* theFile)
{
	if (theFile->mRecord == NULL)
		fclose(theFile->mFP);
	delete theFile;
	return 0;
}

//0x5D87B0
int PakInterface::FSeek(PFILE* theFile, long theOffset, int theOrigin)
{
	if (theFile->mRecord != NULL)
	{
		if (theOrigin == SEEK_SET)
			theFile->mPos = theOffset;
		else if (theOrigin == SEEK_END)
			theFile->mPos = theFile->mRecord->mSize - theOffset;
		else if (theOrigin == SEEK_CUR)
			theFile->mPos += theOffset;

		// 当前指针位置不能超过整个文件的大小，且不能小于 0
		theFile->mPos = std::max(std::min(theFile->mPos, theFile->mRecord->mSize), 0);
		return 0;
	}
	else
		return fseek(theFile->mFP, theOffset, theOrigin);
}

//0x5D8830
int PakInterface::FTell(PFILE* theFile)
{
	if (theFile->mRecord != NULL)
		return theFile->mPos;
	else
		return ftell(theFile->mFP);	
}

//0x5D8850
size_t PakInterface::FRead(void* thePtr, int theElemSize, int theCount, PFILE* theFile)
{
	if (theElemSize < 0 || theCount < 0)
		throw std::invalid_argument("PakInterface::FRead: negative element size or count");
	if (theElemSize == 0 || theCount == 0)
		return 0;

	if (theFile->mRecord != NULL)
	{
		// 实际读取的字节数不能超过当前资源文件剩余可读取的字节数
		// Widen BEFORE multiplication: two valid int arguments may request
		// more than INT_MAX bytes. Clamp to the entry before narrowing again.
		const std::uint64_t aRequested = std::uint64_t(theElemSize) * std::uint64_t(theCount);
		const int aSizeBytes = static_cast<int>(std::min(aRequested,
			std::uint64_t(theFile->mRecord->mSize - theFile->mPos)));
		if (aSizeBytes == 0)
			return 0;

		// 取得在整个 pak 中开始读取的位置的指针
		uchar* src = (uchar*) theFile->mRecord->mCollection->mDataPtr + theFile->mRecord->mStartPos + theFile->mPos;
		uchar* dest = (uchar*) thePtr;
		memcpy(dest, src, aSizeBytes);
		theFile->mPos += aSizeBytes;  // 读取完成后，移动当前读取位置的指针
		return aSizeBytes / theElemSize;  // 返回实际读取的项数
	}
	
	return fread(thePtr, theElemSize, theCount, theFile->mFP);	
}

int PakInterface::FGetC(PFILE* theFile)
{
	if (theFile->mRecord != NULL)
	{
		for (;;)
		{
			if (theFile->mPos >= theFile->mRecord->mSize)
				return EOF;		
			char aChar = *((char*) theFile->mRecord->mCollection->mDataPtr + theFile->mRecord->mStartPos + theFile->mPos++);
			if (aChar != '\r')
				return (uchar) aChar;
		}
	}

	return fgetc(theFile->mFP);
}

int PakInterface::UnGetC(int theChar, PFILE* theFile)
{
	if (theFile->mRecord != NULL)
	{
		// This won't work if we're not pushing the same chars back in the stream
		theFile->mPos = std::max(theFile->mPos - 1, 0);
		return theChar;
	}

	return ungetc(theChar, theFile->mFP);
}

char* PakInterface::FGetS(char* thePtr, int theSize, PFILE* theFile)
{
	if (thePtr == nullptr || theFile == nullptr || theSize <= 0)
		return nullptr;

	if (theFile->mRecord != NULL)
	{
		int anIdx = 0;
		while (anIdx < theSize - 1)
		{
			if (theFile->mPos >= theFile->mRecord->mSize)
			{
				if (anIdx == 0)
					return NULL;
				break;
			}
			char aChar = *((char*) theFile->mRecord->mCollection->mDataPtr + theFile->mRecord->mStartPos + theFile->mPos++);
			if (aChar != '\r')
				thePtr[anIdx++] = aChar;
			if (aChar == '\n')
				break;
		}
		thePtr[anIdx] = 0;
		return thePtr;
	}

	return fgets(thePtr, theSize, theFile->mFP);
}

int PakInterface::FEof(PFILE* theFile)
{
	if (theFile->mRecord != NULL)
		return theFile->mPos >= theFile->mRecord->mSize;
	else
		return feof(theFile->mFP);
}

bool PakInterface::PFindNext(PFindData* theFindData, PakFindResultPtr lpFindFileData)
{
	PakRecordMap::iterator anItr;
	if (theFindData->mLastFind.size() == 0)
		anItr = mPakRecordMap.begin();
	else
	{
		anItr = mPakRecordMap.find(theFindData->mLastFind);
		if (anItr != mPakRecordMap.end())
			anItr++;
	}

	while (anItr != mPakRecordMap.end())
	{
		const char* aFileName = anItr->first.c_str();
		PakRecord* aPakRecord = &anItr->second;

		int aStarPos = (int) theFindData->mFindCriteria.find('*');
		if (aStarPos != -1)
		{
			const std::string_view aName(aFileName);
			const std::string_view aCriteria(theFindData->mFindCriteria);
			const std::string_view aPrefix = aCriteria.substr(0, aStarPos);
			const std::string_view aSuffix = aCriteria.substr(aStarPos + 1);
			if (aName.starts_with(aPrefix))
			{
				// Preserve DOS *.* matching extensionless names. Otherwise the
				// prefix and suffix must fit without overlapping; never subtract
				// an unchecked suffix length from the filename's data pointer.
				if (aSuffix.empty() || aSuffix == ".*" ||
					(aSuffix.size() <= aName.size() - aPrefix.size() && aName.ends_with(aSuffix)))
				{
					// Matches before and after star
					*lpFindFileData = {};
					
					int aLastSlashPos = (int) anItr->second.mFileName.rfind('\\');
					if (aLastSlashPos == -1)
						strcpy(lpFindFileData->cFileName, anItr->second.mFileName.c_str());
					else
						strcpy(lpFindFileData->cFileName, anItr->second.mFileName.c_str() + aLastSlashPos + 1);

					if (aSuffix.find('\\') != std::string_view::npos)
						lpFindFileData->dwFileAttributes |= FILE_ATTRIBUTE_DIRECTORY;

					lpFindFileData->nFileSizeLow = aPakRecord->mSize;
					lpFindFileData->ftCreationTime = aPakRecord->mFileTime;
					lpFindFileData->ftLastWriteTime = aPakRecord->mFileTime;
					lpFindFileData->ftLastAccessTime = aPakRecord->mFileTime;
					theFindData->mLastFind = aFileName;

					return true;
				}
			}
		}

		++anItr;
	}

	return false;
}

#ifndef _WIN32
namespace {
bool NextLooseFile(PFindData& state, PakFindResult& result)
{
	while (state.mLooseIndex < state.mLooseFiles.size())
	{
		const auto& path = state.mLooseFiles[state.mLooseIndex++];
		struct stat info{};
		if (stat(path.c_str(), &info) != 0) continue;
		result = {};
		const auto name = std::filesystem::path(path).filename().string();
		if (name.size() >= sizeof(result.cFileName)) continue;
		memcpy(result.cFileName, name.c_str(), name.size() + 1);
		result.dwFileAttributes = S_ISDIR(info.st_mode) ? FILE_ATTRIBUTE_DIRECTORY : 0;
		result.nFileSizeLow = static_cast<unsigned int>(info.st_size);
		result.nFileSizeHigh = static_cast<unsigned int>(static_cast<unsigned long long>(info.st_size) >> 32);
		const unsigned long long time = (static_cast<unsigned long long>(info.st_mtime) + 11644473600ULL) * 10000000;
		result.ftLastWriteTime = {static_cast<unsigned int>(time), static_cast<unsigned int>(time >> 32)};
		return true;
	}
	return false;
}
}
#endif

PakFindHandle PakInterface::FindFirstFile(const char* lpFileName, PakFindResultPtr lpFindFileData)
{
	const std::string anUpperName = NormalizePakPath(lpFileName);
	PFindData* aFindData = new PFindData;

	aFindData->mFindCriteria = anUpperName;
	aFindData->mWHandle = INVALID_HANDLE_VALUE;
#if !defined(_WIN32) && !defined(__ANDROID__)
	std::string pattern(lpFileName);
	std::replace(pattern.begin(), pattern.end(), '\\', '/');
	if (pattern.ends_with("*.*")) pattern.resize(pattern.size() - 2);
	glob_t matches{};
	const int status = glob(pattern.c_str(), 0, nullptr, &matches);
	if (status == 0)
		for (size_t i = 0; i < matches.gl_pathc; ++i)
			aFindData->mLooseFiles.emplace_back(matches.gl_pathv[i]);
	globfree(&matches);
#endif

	if (PFindNext(aFindData, lpFindFileData))
		return (PakFindHandle) aFindData;

#ifdef _WIN32
	aFindData->mWHandle = ::FindFirstFile(aFindData->mFindCriteria.c_str(), lpFindFileData);
	if (aFindData->mWHandle != INVALID_HANDLE_VALUE)
		return (HANDLE) aFindData;
#else
	if (NextLooseFile(*aFindData, *lpFindFileData)) return aFindData;
#endif

	delete aFindData;
	return INVALID_HANDLE_VALUE;
}

BOOL PakInterface::FindNextFile(PakFindHandle hFindFile, PakFindResultPtr lpFindFileData)
{
	PFindData* aFindData = (PFindData*) hFindFile;

	if (aFindData->mWHandle == INVALID_HANDLE_VALUE)
	{
		if (PFindNext(aFindData, lpFindFileData))
			return TRUE;

#ifdef _WIN32
		aFindData->mWHandle = ::FindFirstFile(aFindData->mFindCriteria.c_str(), lpFindFileData);
		return (aFindData->mWHandle != INVALID_HANDLE_VALUE);			
#else
		return NextLooseFile(*aFindData, *lpFindFileData);
#endif
	}
	
#ifdef _WIN32
	return ::FindNextFile(aFindData->mWHandle, lpFindFileData);
#else
	return NextLooseFile(*aFindData, *lpFindFileData);
#endif
}

BOOL PakInterface::FindClose(PakFindHandle hFindFile)
{
	PFindData* aFindData = (PFindData*) hFindFile;

#ifdef _WIN32
	if (aFindData->mWHandle != INVALID_HANDLE_VALUE)
		::FindClose(aFindData->mWHandle);
#endif

	delete aFindData;
	return TRUE;
}

