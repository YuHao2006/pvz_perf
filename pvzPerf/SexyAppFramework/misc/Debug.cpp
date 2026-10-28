#include "Common.h"
#include "Debug.h"

#include "AutoCrit.h"
#include "CritSect.h"

#include <time.h>
#include <cstdint>
#include <format>
#include <memory>

#include "memmgr.h"

// 命名污染审计：以下仅本 TU 使用，声明自对应头文件下沉（内部链接，前置声明供前部引用）。
static void SexyDumpUnfreed();


bool gInAssert = false;
// Seemingly unused
//extern bool gSexyDumpLeakedMem = false;

static FILE *gTraceFile = NULL;
static int gTraceFileLen = 0;
static int gTraceFileNum = 1;

using namespace Sexy;

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
namespace
{
void DebugOutput(const char* text)
{
#ifdef _WIN32
	OutputDebugStringA(text);
#else
	fputs(text, stderr);
#endif
}
struct SEXY_ALLOC_INFO
{
	int		size;
#ifdef _WIN32
	char	file[_MAX_PATH+1];
#else
	char	file[4096];
#endif
	int		line;
};
static bool gShowLeaks = false;
static bool gSexyAllocMapValid = false;
class SexyAllocMap : public std::map<void*,SEXY_ALLOC_INFO>
{
public:
	CritSect mCrit;

public:
	SexyAllocMap() { gSexyAllocMapValid = true; }
	~SexyAllocMap() 
	{ 
		if (gShowLeaks) 
			SexyDumpUnfreed();		

		gSexyAllocMapValid = false; 
	}
};
static SexyAllocMap gSexyAllocMap;
}  // namespace

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
void SexyTrace(const char *theStr)
{
	if (gTraceFile==NULL)
	{
		gTraceFileNum = (gTraceFileNum+1)%2;
		char aBuf[50];
		snprintf(aBuf, sizeof(aBuf), "trace%d.txt", gTraceFileNum+1);
		gTraceFile = fopen(GetLogFilePath(aBuf).c_str(),"w");
		if (gTraceFile==NULL)
			return;
	}

	fprintf(gTraceFile,"%s\n",theStr);
	fflush(gTraceFile);

	gTraceFileLen += strlen(theStr);
	if (gTraceFileLen > 100000)
	{
		fclose(gTraceFile);
		gTraceFile = NULL;
		gTraceFileLen = 0;
	}
}

//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
[[maybe_unused]] static void SexyTraceFmt(const SexyChar* fmt ...)
{
	// Does not append a newline by default, also takes vararg parameters

	va_list argList;
	va_start(argList, fmt);
	std::string result = SexyStringToStringFast(vformat(fmt, argList));
	va_end(argList);

	
	if (gTraceFile==NULL)
	{
		gTraceFileNum = (gTraceFileNum+1)%2;
		char aBuf[50];
		snprintf(aBuf, sizeof(aBuf), "trace%d.txt", gTraceFileNum+1);
		gTraceFile = fopen(GetLogFilePath(aBuf).c_str(),"w");
		if (gTraceFile==NULL)
			return;
	}

	fprintf(gTraceFile,"%s",result.c_str());
	fflush(gTraceFile);

	gTraceFileLen += result.length();
	if (gTraceFileLen > 100000)
	{
		fclose(gTraceFile);
		gTraceFile = NULL;
		gTraceFileLen = 0;
	}
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
void SexyMemAddTrack(void *addr,  int asize,  const char* fname, int lnum)
{
	if (!gSexyAllocMapValid)
		return;

	AutoCrit aCrit(gSexyAllocMap.mCrit);
	gShowLeaks = true;

	SEXY_ALLOC_INFO &info = gSexyAllocMap[addr];
	strncpy(info.file, fname, sizeof(info.file)-1);
	info.file[sizeof(info.file)-1] = '\0';
	info.line = lnum;
	info.size = asize;
};

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
void SexyMemRemoveTrack(void* addr)
{
	if (!gSexyAllocMapValid)
		return;

	AutoCrit aCrit(gSexyAllocMap.mCrit);
	SexyAllocMap::iterator anItr = gSexyAllocMap.find(addr);
	if (anItr != gSexyAllocMap.end())
		gSexyAllocMap.erase(anItr);
};

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
static void SexyDumpUnfreed()
{
	if (!gSexyAllocMapValid)
		return;

	AutoCrit aCrit(gSexyAllocMap.mCrit);
	SexyAllocMap::iterator i;
	std::int64_t totalSize = 0;

#ifdef SEXY_DUMP_LEAKED_MEM
	int count = 0;
	int index = 0;
#endif

	// Formatting can allocate. Close the report on success and on exceptions;
	// never keep a descriptor until process exit for each diagnostic invocation.
	std::unique_ptr<FILE, decltype(&fclose)> aReport(
		fopen(GetLogFilePath("mem_leaks.txt").c_str(), "wt"), &fclose);
	FILE* f = aReport.get();
	if (!f)
		return;

	time_t aTime = time(NULL);
	const std::string aHeader = std::format("Memory Leak Report for {}\n", asctime(localtime(&aTime)));
	fputs(aHeader.c_str(), f);
	DebugOutput("\n");
	DebugOutput(aHeader.c_str());
	for(i = gSexyAllocMap.begin(); i != gSexyAllocMap.end(); i++) 
	{
		const std::string aLine = std::format("{}({}) : Leak {} byte{}\n",
			i->second.file, i->second.line, i->second.size, i->second.size>1?"s":"");
		DebugOutput(aLine.c_str());
		fputs(aLine.c_str(), f);

#ifdef SEXY_DUMP_LEAKED_MEM
		unsigned char* data = (unsigned char*)i->first;
		std::string aHexDump;
		std::string aAsciiDump;

		for (index = 0; index < i->second.size; index++)
		{			
			unsigned char _c = *data;
			
			if (count == 0)
				aHexDump += '\t';
			aHexDump += std::format("{:02X} ", (unsigned int)_c);
		
			if ((_c < 32) || (_c > 126))
				_c = '.';

			if (count == 0)
				aAsciiDump += '\t';
			aAsciiDump += (char)_c;
			if (count == 7)
				aAsciiDump += ' ';
			

			if (++count == 16)
			{
				count = 0;
				// Dumped bytes are data, including '%' and format-like sequences.
				fprintf(f, "%s\t%s\n", aHexDump.c_str(), aAsciiDump.c_str());

				aHexDump.clear();
				aAsciiDump.clear();
			}

			data++;
		}

		if (count != 0)
		{
			fputs(aHexDump.c_str(), f);
			for (index = 0; index < 16 - count; index++)
				fprintf(f, "\t");

			fputs(aAsciiDump.c_str(), f);

			for (index = 0; index < 16 - count; index++)
				fprintf(f, ".");
		}

		count = 0;
		fprintf(f, "\n\n");

#endif // SEXY_DUMP_LEAKED_MEM

		totalSize += i->second.size;
	}


	const char* aSeparator = "-----------------------------------------------------------\n";
	fputs(aSeparator, f);
	DebugOutput(aSeparator);
	const std::string aTotal = std::format("Total Unfreed: {} bytes ({}KB)\n\n", totalSize, totalSize / 1024);
	DebugOutput(aTotal.c_str());
	fputs(aTotal.c_str(), f);
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
[[maybe_unused]] static void OutputDebug(const SexyChar* fmt ...)
{
	va_list argList;
    va_start(argList, fmt);
    std::string result = SexyStringToStringFast(vformat(fmt, argList));
    va_end(argList);

	DebugOutput(result.c_str());
}

