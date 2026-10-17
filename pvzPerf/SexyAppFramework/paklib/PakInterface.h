#pragma once
#include <map>
#include <list>
#include <string>

#include "Common.h"
#include <cstdio>
#include <vector>

#ifdef _WIN32
using PakFileTime = FILETIME;
using PakFindHandle = HANDLE;
using PakFindResult = WIN32_FIND_DATAA;
using PakFileHandle = HANDLE;
#else
struct PakFileTime { unsigned int dwLowDateTime = 0, dwHighDateTime = 0; };
struct PakFindResult {
	unsigned int dwFileAttributes = 0;
	PakFileTime ftCreationTime{}, ftLastAccessTime{}, ftLastWriteTime{};
	unsigned int nFileSizeHigh = 0, nFileSizeLow = 0;
	char cFileName[4096]{};
};
using PakFindHandle = void*;
using PakFileHandle = int;
inline const PakFindHandle INVALID_HANDLE_VALUE = reinterpret_cast<void*>(std::intptr_t(-1));
constexpr unsigned int FILE_ATTRIBUTE_DIRECTORY = 0x10;
#endif
using PakFindResultPtr = PakFindResult*;
static_assert(sizeof(PakFileTime) == 8);

class PakCollection;

// [定义]资源包文件：包含了若干游戏资源的 .pak 文件。例如：main.pak
// [定义]资源文件：资源包文件中的一项具体资源的文件。例如：zombie_falling_1.ogg

// ====================================================================================================
// ★ 一个 PakRecord 实例对应资源包内的一个资源文件的数据，包括文件名，地址，大小等信息
// ====================================================================================================
class PakRecord
{
public:
	PakCollection*			mCollection;			//+0x0：指向该资源文件所在的资源包的 PakCollection
	std::string				mFileName;				//+0x4：资源文件的名称及路径（路径从 .pak 开始），例如 sounds\zombie_falling_1.ogg
	PakFileTime				mFileTime;				//+0x20：八字节型的资源文件的时间戳
	int						mStartPos;				//+0x28：该资源文件在资源包中的位置（即在 mCollection->mDataPtr 中的偏移量）
	int						mSize;					//+0x2C：资源文件的大小，单位为 Byte（字节数）
};

typedef std::map<std::string, PakRecord> PakRecordMap;

// ====================================================================================================
// ★ 一个 PakCollection 实例对应一个 pak 资源包在内存中的映射文件
// ====================================================================================================
class PakCollection
{
public:
	PakFileHandle			mFileHandle;
#ifdef _WIN32
	HANDLE					mMappingHandle;
#else
	size_t					mMappingSize = 0;
#endif
	void*					mDataPtr;				//+0x8：资源包中的所有数据
};

typedef std::list<PakCollection> PakCollectionList;

struct PFILE
{
	PakRecord*				mRecord;
	int						mPos;
	FILE*					mFP;
};

struct PFindData
{
	PakFindHandle			mWHandle;
	std::string				mLastFind;
	std::string				mFindCriteria;
#ifndef _WIN32
	std::vector<std::string> mLooseFiles;
	size_t mLooseIndex = 0;
#endif
};

class PakInterfaceBase
{
public:
	virtual PFILE*			FOpen(const char* theFileName, const char* theAccess) = 0;
//	virtual PFILE*			FOpen(const wchar_t* theFileName, const wchar_t* theAccess) { return NULL; }
	virtual int				FClose(PFILE* theFile) = 0;
	virtual int				FSeek(PFILE* theFile, long theOffset, int theOrigin) = 0;
	virtual int				FTell(PFILE* theFile) = 0;
	virtual size_t			FRead(void* thePtr, int theElemSize, int theCount, PFILE* theFile) = 0;
	virtual int				FGetC(PFILE* theFile) = 0;
	virtual int				UnGetC(int theChar, PFILE* theFile) = 0;
	virtual char*			FGetS(char* thePtr, int theSize, PFILE* theFile) = 0;
//	virtual wchar_t*		FGetS(wchar_t* thePtr, int theSize, PFILE* theFile) { return thePtr; }
	virtual int				FEof(PFILE* theFile) = 0;

	virtual PakFindHandle	FindFirstFile(const char* lpFileName, PakFindResultPtr lpFindFileData) = 0;
	virtual BOOL			FindNextFile(PakFindHandle hFindFile, PakFindResultPtr lpFindFileData) = 0;
	virtual BOOL			FindClose(PakFindHandle hFindFile) = 0;
};

class PakInterface : public PakInterfaceBase
{
public:
	PakCollectionList		mPakCollectionList;		//+0x4：通过 AddPakFile() 添加的各个资源包的内存映射文件数据的链表
	PakRecordMap			mPakRecordMap;			//+0x10：所有已添加的资源包中的所有资源文件的、从文件名到文件数据的映射容器

public:
	bool					PFindNext(PFindData* theFindData, PakFindResultPtr lpFindFileData);

public:
	PakInterface();
	~PakInterface();

	bool					AddPakFile(const std::string& theFileName);
	PFILE*					FOpen(const char* theFileName, const char* theAccess);
	int						FClose(PFILE* theFile);
	int						FSeek(PFILE* theFile, long theOffset, int theOrigin);
	int						FTell(PFILE* theFile);
	size_t					FRead(void* thePtr, int theElemSize, int theCount, PFILE* theFile);
	int						FGetC(PFILE* theFile);
	int						UnGetC(int theChar, PFILE* theFile);
	char*					FGetS(char* thePtr, int theSize, PFILE* theFile);
	int						FEof(PFILE* theFile);

	PakFindHandle			FindFirstFile(const char* lpFileName, PakFindResultPtr lpFindFileData);
	BOOL					FindNextFile(PakFindHandle hFindFile, PakFindResultPtr lpFindFileData);
	BOOL					FindClose(PakFindHandle hFindFile);
};

extern PakInterface* gPakInterface;
bool PakPathRequiresArchive(const char* path);

#ifdef _WIN32
static HANDLE gPakFileMapping = NULL;
static PakInterfaceBase** gPakInterfaceP = NULL;
#else
inline PakInterfaceBase* gPakInterfaceSlot = nullptr;
static PakInterfaceBase** gPakInterfaceP = &gPakInterfaceSlot;
#endif

[[maybe_unused]]
static PakInterfaceBase* GetPakPtr()
{
#ifdef _WIN32
	if (gPakFileMapping == NULL)
	{
		char aName[256];
		sprintf(aName, "gPakInterfaceP_%d", GetCurrentProcessId());
		gPakFileMapping = ::CreateFileMappingA((HANDLE)INVALID_HANDLE_VALUE, NULL, PAGE_READWRITE, 0, sizeof(PakInterface*), aName);
		gPakInterfaceP = (PakInterfaceBase**) MapViewOfFile(gPakFileMapping, FILE_MAP_ALL_ACCESS, 0, 0, sizeof(PakInterface*));		
	}
#endif
	return *gPakInterfaceP;
}

[[maybe_unused]]
static PFILE* p_fopen(const char* theFileName, const char* theAccess) 
{
	if (GetPakPtr() != NULL)
		return (*gPakInterfaceP)->FOpen(theFileName, theAccess);	
	if (PakPathRequiresArchive(theFileName))
		return nullptr;
	FILE* aFP = fopen(theFileName, theAccess);
	if (aFP == NULL)
		return NULL;
	PFILE* aPFile = new PFILE();
	aPFile->mRecord = NULL;
	aPFile->mPos = 0;
	aPFile->mFP = aFP;
	return aPFile;
}

/*
[[maybe_unused]]
static PFILE* p_fopen(const wchar_t* theFileName, const wchar_t* theAccess) 
{
	if (GetPakPtr() != NULL)
		return (*gPakInterfaceP)->FOpen(theFileName, theAccess);	
	FILE* aFP = _wfopen(theFileName, theAccess);
	if (aFP == NULL)
		return NULL;
	PFILE* aPFile = new PFILE();
	aPFile->mRecord = NULL;
	aPFile->mPos = 0;
	aPFile->mFP = aFP;
	return aPFile;
}
*/

[[maybe_unused]]
static int p_fclose(PFILE* theFile)
{
	if (GetPakPtr() != NULL)
		return (*gPakInterfaceP)->FClose(theFile);
	int aResult = fclose(theFile->mFP);
	delete theFile;
	return aResult;
}

[[maybe_unused]]
static int p_fseek(PFILE* theFile, long theOffset, int theOrigin)
{
	if (GetPakPtr() != NULL)
		return (*gPakInterfaceP)->FSeek(theFile, theOffset, theOrigin);
	return fseek(theFile->mFP, theOffset, theOrigin);
}

[[maybe_unused]]
static int p_ftell(PFILE* theFile)
{
	if (GetPakPtr() != NULL)
		return (*gPakInterfaceP)->FTell(theFile);
	return ftell(theFile->mFP);
}

[[maybe_unused]]
static size_t p_fread(void* thePtr, int theSize, int theCount, PFILE* theFile)
{
	if (GetPakPtr() != NULL)
		return (*gPakInterfaceP)->FRead(thePtr, theSize, theCount, theFile);
	return fread(thePtr, theSize, theCount, theFile->mFP);
}

[[maybe_unused]]
static size_t p_fwrite(const void* thePtr, int theSize, int theCount, PFILE* theFile)
{	
	if (theFile->mFP == NULL)
		return 0;
	return fwrite(thePtr, theSize, theCount, theFile->mFP);
}

[[maybe_unused]]
static int p_fgetc(PFILE* theFile)
{
	if (GetPakPtr() != NULL)
		return (*gPakInterfaceP)->FGetC(theFile);
	return fgetc(theFile->mFP);
}

[[maybe_unused]]
static int p_ungetc(int theChar, PFILE* theFile)
{
	if (GetPakPtr() != NULL)
		return (*gPakInterfaceP)->UnGetC(theChar, theFile);
	return ungetc(theChar, theFile->mFP);
}

[[maybe_unused]]
static char* p_fgets(char* thePtr, int theSize, PFILE* theFile)
{
	if (GetPakPtr() != NULL)
		return (*gPakInterfaceP)->FGetS(thePtr, theSize, theFile);
	return fgets(thePtr, theSize, theFile->mFP);
}

/*
[[maybe_unused]]
static wchar_t* p_fgets(wchar_t* thePtr, int theSize, PFILE* theFile)
{
	if (GetPakPtr() != NULL)
		return (*gPakInterfaceP)->FGetS(thePtr, theSize, theFile);
	return fgetws(thePtr, theSize, theFile->mFP);
}
*/

[[maybe_unused]]
static int p_feof(PFILE* theFile)
{
	if (GetPakPtr() != NULL)
		return (*gPakInterfaceP)->FEof(theFile);
	return feof(theFile->mFP);
}

[[maybe_unused]]
static PakFindHandle p_FindFirstFile(const char* lpFileName, PakFindResultPtr lpFindFileData)
{
	if (GetPakPtr() != NULL)
		return (*gPakInterfaceP)->FindFirstFile(lpFileName, lpFindFileData);
#ifdef _WIN32
	return FindFirstFile(lpFileName, lpFindFileData);
#else
	return INVALID_HANDLE_VALUE;
#endif
}

[[maybe_unused]]
static BOOL p_FindNextFile(PakFindHandle hFindFile, PakFindResultPtr lpFindFileData)
{
	if (GetPakPtr() != NULL)
		return (*gPakInterfaceP)->FindNextFile(hFindFile, lpFindFileData);
#ifdef _WIN32
	return FindNextFile(hFindFile, lpFindFileData);
#else
	return false;
#endif
}

[[maybe_unused]]
static BOOL p_FindClose(PakFindHandle hFindFile)
{
	if (GetPakPtr() != NULL)
		return (*gPakInterfaceP)->FindClose(hFindFile);
#ifdef _WIN32
	return FindClose(hFindFile);
#else
	return false;
#endif
}


