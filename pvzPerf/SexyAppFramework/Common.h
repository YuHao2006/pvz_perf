#pragma once
#ifdef _WIN32
#pragma warning(disable:4786)
#pragma warning(disable:4503)

#undef WIN32_LEAN_AND_MEAN

#define WIN32_LEAN_AND_MEAN
#undef _UNICODE
#undef UNICODE
#endif

#include <string>
#include <vector>
#include <set>
#include <map>
#include <list>
#include <algorithm>
#include <cstdlib>
#include <cstdint>
#include <cstdarg>
#include <cstring>
#include <cwctype>
#include <ctime>
#include "platform/RuntimeTypes.h"
#include "misc/StableTime.h"

#ifndef NOMINMAX
#define NOMINMAX 1
#endif
#ifdef _WIN32
#include <windows.h>
#include <shellapi.h> 
#include <mmsystem.h>
#endif
#include "misc/ModVal.h"

#ifndef SEXY_FORMAT_ATTRIBUTE
#if defined(__GNUC__) || defined(__clang__)
#define SEXY_FORMAT_ATTRIBUTE(theFormatIndex, theFirstArgIndex) \
	__attribute__((format(printf, theFormatIndex, theFirstArgIndex)))
#else
#define SEXY_FORMAT_ATTRIBUTE(theFormatIndex, theFirstArgIndex)
#endif
#endif

// fallback if NOMINMAX fails (somehow?)
#undef min
#undef max

// Removed wide string support
using SexyString = std::string;

#define sexystrncmp			strncmp
#define sexystrcmp			strcmp
#define sexystricmp			stricmp
#define sexysscanf			sscanf
#define sexyatoi			atoi
#define sexystrcpy			strcpy
#define sexystrlen			strlen
#define sexyisdigit			isdigit
#define sexyisalnum			isalnum
#define sexystrchr			strchr

#define SexyStringToStringFast(x)	(x)
#define SexyStringToWStringFast(x)	StringToWString(x)
#define StringToSexyStringFast(x)	(x)
#define WStringToSexyStringFast(x)	WStringToString(x)

#define LONG_BIGE_TO_NATIVE(l) (((l >> 24) & 0xFF) | ((l >> 8) & 0xFF00) | ((l << 8) & 0xFF0000) | ((l << 24) & 0xFF000000))
#define WORD_BIGE_TO_NATIVE(w) (((w >> 8) & 0xFF) | ((w << 8) & 0xFF00))
#define LONG_LITTLEE_TO_NATIVE(l) (l)
#define WORD_LITTLEE_TO_NATIVE(w) (w)

#define LENGTH(anyarray) (sizeof(anyarray) / sizeof(anyarray[0]))

using uchar = unsigned char;
using ushort = unsigned short;
using uint = unsigned int;
#ifdef _WIN32
using int64 = __int64;
#else
using int64 = long long;
#endif

using DefinesMap = std::map<std::string, std::string>;
using WStringWStringMap = std::map<std::wstring, std::wstring>;
using SexyChar = SexyString::value_type;
#define HAS_SEXYCHAR

namespace Sexy
{

const unsigned int SEXY_RAND_MAX = 0x7FFFFFFF;
const int SEXY_RAND_STATE_WORDS = 624;

extern bool			gDebug;
extern HINSTANCE	gHInstance;

int					Rand();
int					Rand(int range);
float				Rand(float range);
void				SRand(unsigned int theSeed);
void				GetRandState(unsigned int* theState, int& theIndex);
extern std::string	vformat(const char* fmt, va_list argPtr) SEXY_FORMAT_ATTRIBUTE(1, 0);
extern std::wstring	vformat(const wchar_t* fmt, va_list argPtr);
extern std::string	StrFormat(const char* fmt ...) SEXY_FORMAT_ATTRIBUTE(1, 2);
extern std::wstring	StrFormat(const wchar_t* fmt ...);
bool				CheckFor98Mill();
bool				CheckForVista();
std::string			GetAppDataFolder();
void				SetAppDataFolder(const std::string& thePath);
std::string			StringToUpper(const std::string& theString);
std::wstring		StringToUpper(const std::wstring& theString);
std::string			StringToLower(const std::string& theString);
std::wstring		StringToLower(const std::wstring& theString);
std::wstring		StringToWString(const std::string &theString);
std::string			WStringToString(const std::wstring &theString);
SexyString			StringToSexyString(const std::string& theString);
SexyString			WStringToSexyString(const std::wstring& theString);
std::string			SexyStringToString(const SexyString& theString);
std::wstring		SexyStringToWString(const SexyString& theString);
std::string			Upper(const std::string& theData);
std::wstring		Upper(const std::wstring& theData);
std::string			Lower(const std::string& theData);
std::wstring		Lower(const std::wstring& theData);
std::string			Trim(const std::string& theString);
std::wstring		Trim(const std::wstring& theString);
bool				StringToInt(const std::string& theString, int* theIntVal);
bool				StringToDouble(const std::string& theString, double* theDoubleVal);
bool				StringToInt(const std::wstring& theString, int* theIntVal);
bool				StringToDouble(const std::wstring& theString, double* theDoubleVal);
std::string			Evaluate(const std::string& theString, const DefinesMap& theDefinesMap);

bool				FileExists(const std::string& theFileName);
void				MkDir(const std::string& theDir);
std::string			GetFileName(const std::string& thePath, bool noExtension = false);
std::string			GetFileDir(const std::string& thePath, bool withSlash = false);
std::string			RemoveTrailingSlash(const std::string& theDirectory);
std::string			AddTrailingSlash(const std::string& theDirectory, bool backSlash = false);
time_t				GetFileDate(const std::string& theFileName);
std::string			GetCurDir();
std::string			GetFullPath(const std::string& theRelPath);
// Paths rooted at the executable, independent of the process current
// directory (which the framework changes while bootstrapping).
std::string			GetExecutableDirectory();
std::string			GetDataFilePath(const std::string& theFileName);
// Runtime diagnostics: Windows uses executable/log; Linux uses the per-user
// data root/log. PVZ_LOG_DIR overrides either location at startup.
std::string			GetLogFilePath(const std::string& theFileName);
const char*			GetLogFilePathC(const char* theFileName);
std::string			GetPathFrom(const std::string& theRelPath, const std::string& theDir);
bool				AllowAllAccess(const std::string& theFileName);
std::wstring		UTF8StringToWString(const std::string& theString);

// Read memory and then move the pointer
// Write memory and then move the pointer
void				SMemW(void*& _Dst, const void* _Src, size_t _Size);

inline void			inlineUpper(std::string &theData)
{
    //std::transform(theData.begin(), theData.end(), theData.begin(), toupper);

	int aStrLen = (int) theData.length();
	for (int i = 0; i < aStrLen; i++)
	{
		theData[i] = toupper(theData[i]);
	}
}

inline void			inlineUpper(std::wstring &theData)
{
    //std::transform(theData.begin(), theData.end(), theData.begin(), toupper);

	int aStrLen = (int) theData.length();
	for (int i = 0; i < aStrLen; i++)
	{
		theData[i] = towupper(theData[i]);
	}
}

inline void			inlineLower(std::string &theData)
{
    std::transform(theData.begin(), theData.end(), theData.begin(), tolower);
}

inline void			inlineLower(std::wstring &theData)
{
    std::transform(theData.begin(), theData.end(), theData.begin(), tolower);
}

inline void			inlineLTrim(std::string &theData, const std::string& theChars = " \t\r\n")
{
    theData.erase(0, theData.find_first_not_of(theChars));
}

inline void			inlineLTrim(std::wstring &theData, const std::wstring& theChars = L" \t\r\n")
{
    theData.erase(0, theData.find_first_not_of(theChars));
}


inline void			inlineRTrim(std::string &theData, const std::string& theChars = " \t\r\n")
{
    theData.resize(theData.find_last_not_of(theChars) + 1);
}

inline void			inlineTrim(std::string &theData, const std::string& theChars = " \t\r\n")
{
	inlineRTrim(theData, theChars);
	inlineLTrim(theData, theChars);
}

struct StringLessNoCase { bool operator()(const std::string &s1, const std::string &s2) const { return _stricmp(s1.c_str(),s2.c_str())<0; } };

}
