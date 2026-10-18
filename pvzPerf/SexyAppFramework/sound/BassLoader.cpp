#include "BassLoader.h"
#include "SexyAppFramework/Common.h"
#include <cstdlib>
#include <string>
#include <vector>
#include <memory>
#include <mutex>
#include <stdexcept>
#ifndef _WIN32
#include <dlfcn.h>
#endif

using namespace Sexy;

BASS_INSTANCE* Sexy::gBass = NULL;
#ifdef _WIN32
static long gBassLoadCount = 0;
#else
static int gBassLoadCount = 0;
#endif

namespace
{
#ifdef _WIN32
std::string GetDirectoryFromPath(const std::string& thePath)
{
	const size_t aSlash = thePath.find_last_of("\\/");
	if (aSlash == std::string::npos)
		return std::string();
	return thePath.substr(0, aSlash);
}

std::string GetExecutableDirectory()
{
	char aPath[MAX_PATH] = {};
	const DWORD aLength = GetModuleFileNameA(NULL, aPath, static_cast<DWORD>(sizeof(aPath)));
	if (aLength == 0 || aLength >= sizeof(aPath))
		return std::string();
	return GetDirectoryFromPath(std::string(aPath, aLength));
}

std::string GetCurrentDirectoryString()
{
	char aPath[MAX_PATH] = {};
	const DWORD aLength = GetCurrentDirectoryA(static_cast<DWORD>(sizeof(aPath)), aPath);
	if (aLength == 0 || aLength >= sizeof(aPath))
		return std::string();
	return std::string(aPath, aLength);
}

void AddCandidate(std::vector<std::string>& theCandidates, const std::string& theCandidate)
{
	if (theCandidate.empty())
		return;

	for (const std::string& anExisting : theCandidates)
	{
		if (_stricmp(anExisting.c_str(), theCandidate.c_str()) == 0)
			return;
	}
	theCandidates.push_back(theCandidate);
}

std::string ResolveBassPath()
{
	std::vector<std::string> aCandidates;

	// This is intentionally an opt-in override for test sandboxes and packagers.
	// Production builds still resolve the DLL beside the executable first.
	if (const char* anOverride = std::getenv("PVZ_BASS_DLL"); anOverride != NULL && anOverride[0] != '\0')
		AddCandidate(aCandidates, anOverride);

	const std::string anExecutableDirectory = GetExecutableDirectory();
	if (!anExecutableDirectory.empty())
	{
		AddCandidate(aCandidates, anExecutableDirectory + "\\bass.dll");

		// Visual Studio puts the executable in a configuration subdirectory while
		// local runtime assets are often staged at the build-tree root.
		const std::string aParentDirectory = GetDirectoryFromPath(anExecutableDirectory);
		if (!aParentDirectory.empty())
			AddCandidate(aCandidates, aParentDirectory + "\\bass.dll");
	}

	const std::string aCurrentDirectory = GetCurrentDirectoryString();
	if (!aCurrentDirectory.empty())
		AddCandidate(aCandidates, aCurrentDirectory + "\\bass.dll");

	for (const std::string& aCandidate : aCandidates)
	{
		const DWORD anAttributes = GetFileAttributesA(aCandidate.c_str());
		if (anAttributes != INVALID_FILE_ATTRIBUTES && (anAttributes & FILE_ATTRIBUTE_DIRECTORY) == 0)
			return aCandidate;
	}

	// Keep the final loader error meaningful if no candidate exists.
	return aCandidates.empty() ? std::string("bass.dll") : aCandidates.front();
}

std::string FormatWin32Error(DWORD theError)
{
	if (theError == ERROR_SUCCESS)
		return "no error code";

	char aBuffer[512] = {};
	const DWORD aLength = FormatMessageA(
		FORMAT_MESSAGE_FROM_SYSTEM | FORMAT_MESSAGE_IGNORE_INSERTS,
		NULL,
		theError,
		MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT),
		aBuffer,
		static_cast<DWORD>(sizeof(aBuffer)),
		NULL);
	if (aLength == 0)
		return StrFormat("Win32 error %lu", static_cast<unsigned long>(theError));

	std::string aMessage(aBuffer, aLength);
	while (!aMessage.empty() && (aMessage.back() == '\r' || aMessage.back() == '\n' || aMessage.back() == ' '))
		aMessage.pop_back();
	return aMessage;
}
#else
std::mutex gBassMutex;
#ifdef __APPLE__
constexpr const char* NativeBassFilename = "libbass.dylib";
#else
constexpr const char* NativeBassFilename = "libbass.so";
#endif
std::string ResolveBassPath()
{
	if (const char* path = std::getenv("PVZ_BASS_LIBRARY"); path && *path)
		return path;
	return Sexy::GetExecutableDirectory() + NativeBassFilename;
}
#endif
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
static void CheckBassFunction(bool theFound, const char *theName)
{
	if (!theFound)
	{
#ifdef _WIN32
		const std::string aMessage = std::string(theName) + " function not found in bass.dll";
		MessageBoxA(NULL,aMessage.c_str(),"Error",MB_OK | MB_ICONERROR);
		std::exit(EXIT_FAILURE);
#else
		throw std::runtime_error(std::string(NativeBassFilename) + " is missing required symbol: " + theName);
#endif
	}
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
BASS_INSTANCE::BASS_INSTANCE(const char *dllName) : mModule(NULL)
{
#ifdef _WIN32
	mModule = LoadLibraryA(dllName);
#else
	mModule = dlopen(dllName, RTLD_NOW | RTLD_LOCAL);
#endif
	if (!mModule)
		return;

// Preserve the complete function address and assign through its actual type.
// An integer lvalue must not alias a function-pointer member; in particular,
// a 32-bit integer check can misclassify a non-null x64 address as null.
#ifdef _WIN32
#define GETPROC(_x) do { \
	_x = reinterpret_cast<decltype(_x)>(GetProcAddress(mModule, #_x)); \
	CheckBassFunction(_x != nullptr, #_x); \
} while (false)
#else
#define GETPROC(_x) do { \
	_x = reinterpret_cast<decltype(_x)>(dlsym(mModule, #_x)); \
	CheckBassFunction(_x != nullptr, #_x); \
} while (false)
	try {
#endif

	GETPROC(BASS_Init);
	GETPROC(BASS_Free);
	GETPROC(BASS_Stop);
	GETPROC(BASS_Start);
	
	//*((uintptr_t*) &BASS_SetConfig) = (uintptr_t) GetProcAddress(mModule, "BASS_SetConfig");
	//*((uintptr_t*) &BASS_GetConfig) = (uintptr_t) GetProcAddress(mModule, "BASS_GetConfig");
	GETPROC(BASS_SetConfig);
	GETPROC(BASS_GetConfig);

	GETPROC(BASS_GetInfo);
	GETPROC(BASS_ChannelGetInfo);

	GETPROC(BASS_GetVersion);
	GETPROC(BASS_ChannelStop);
	GETPROC(BASS_ChannelPlay);
	GETPROC(BASS_ChannelPause);
	GETPROC(BASS_ChannelSetAttribute);
	GETPROC(BASS_ChannelGetAttribute);
	GETPROC(BASS_ChannelSetPosition);
	GETPROC(BASS_ChannelGetPosition);
	GETPROC(BASS_ChannelIsActive);
	GETPROC(BASS_ChannelFlags);
	GETPROC(BASS_ChannelSlideAttribute);
	GETPROC(BASS_ChannelIsSliding);
	GETPROC(BASS_ChannelGetLevel);	
	GETPROC(BASS_ChannelSetSync);
	GETPROC(BASS_ChannelRemoveSync);
	GETPROC(BASS_ChannelGetData);

	// supported by BASS 1.1 and higher. Only work if the user has DX8 or higher though.
	GETPROC(BASS_FXSetParameters);
	GETPROC(BASS_FXGetParameters);
	GETPROC(BASS_ChannelSetFX);
	GETPROC(BASS_ChannelRemoveFX);

	GETPROC(BASS_MusicLoad);
	GETPROC(BASS_MusicFree);
	//GETPROC(BASS_MusicGetAttribute);
	//GETPROC(BASS_MusicSetAttribute);

	GETPROC(BASS_StreamCreateFile);
	GETPROC(BASS_StreamFree);

	//GETPROC(BASS_MusicGetOrders);
	//GETPROC(BASS_MusicGetOrderPosition);

	GETPROC(BASS_SampleLoad);
	GETPROC(BASS_SampleFree);
	GETPROC(BASS_SampleSetInfo);
	GETPROC(BASS_SampleGetInfo);
	GETPROC(BASS_SampleGetChannel);
	GETPROC(BASS_SampleStop);

	GETPROC(BASS_ErrorGetCode);

	GETPROC(BASS_PluginLoad);
	GETPROC(BASS_ChannelGetLength);

#undef GETPROC
#ifndef _WIN32
	} catch (...) {
		dlclose(mModule);
		mModule = nullptr;
		throw;
	}
#endif
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
BASS_INSTANCE::~BASS_INSTANCE()
{
    if (mModule)
#ifdef _WIN32
        FreeLibrary(mModule);
#else
        dlclose(mModule);
#endif
}


BOOL BASS_INSTANCE::BASS_MusicSetAmplify(HMUSIC handle, float amp)
{
	BASS_ChannelSetAttribute(handle, BASS_ATTRIB_MUSIC_AMPLIFY, amp);
	return true;
}


BOOL BASS_INSTANCE::BASS_MusicPlay(HMUSIC handle)
{
	return BASS_ChannelPlay(handle, true);
}


BOOL BASS_INSTANCE::BASS_MusicPlayEx(HMUSIC handle, DWORD pos, int flags, BOOL reset)
{
	(void)reset;
	//int anOffset = MAKEMUSICPOS(pos,0);

	BASS_ChannelStop(handle);
	// pos is already BASS's packed order/row value.  Re-wrapping it with
	// MAKELONG(pos, 0) truncates the row (the upper 16 bits), so resuming a
	// paused MOD starts at the beginning of the order instead of the saved
	// point.
	BASS_ChannelSetPosition(handle, static_cast<QWORD>(pos), BASS_POS_MUSIC_ORDER);
	BASS_ChannelFlags(handle, flags, -1);

	return BASS_ChannelPlay(handle, false/*reset*/); // What's wrong with actually using the reset flag?
}


BOOL BASS_INSTANCE::BASS_ChannelResume(DWORD handle)
{
	return BASS_ChannelPlay(handle, false);
}

BOOL BASS_INSTANCE::BASS_StreamPlay(HSTREAM handle, BOOL flush, DWORD flags)
{
	BASS_ChannelFlags(handle, flags, -1);
	return BASS_ChannelPlay(handle, flush);
}


///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
void Sexy::LoadBassDLL()
{
#ifdef _WIN32
	InterlockedIncrement(&gBassLoadCount);
	if (gBass!=NULL)
		return;

	const std::string aBassPath = ResolveBassPath();
	gBass = new BASS_INSTANCE(aBassPath.c_str());
	if (gBass->mModule==NULL)
	{
		const DWORD anError = GetLastError();
		const std::string aMessage = StrFormat(
			"Can't load bass.dll.\n\nTried:\n%s\n\n%s",
			aBassPath.c_str(),
			FormatWin32Error(anError).c_str());
		MessageBoxA(NULL, aMessage.c_str(), "Audio initialization error", MB_OK | MB_ICONERROR);
		exit(1);
	}
#else
	std::lock_guard lock(gBassMutex);
	if (gBass) { ++gBassLoadCount; return; }
	const auto path = ResolveBassPath();
	auto instance = std::make_unique<BASS_INSTANCE>(path.c_str());
	if (!instance->mModule)
	{
		const char* error = dlerror();
		throw std::runtime_error(std::string("Audio requires native BASS 2.4 ") + NativeBassFilename + ". Tried " +
			path + ": " + (error ? error : "dlopen failed") +
			". Install the matching architecture library beside the executable or set PVZ_BASS_LIBRARY.");
	}
	if ((instance->BASS_GetVersion() >> 16) != BASSVERSION)
		throw std::runtime_error("Linux audio requires BASS ABI 2.4");
	if (!instance->BASS_Init(0, 44100, 0, nullptr, nullptr))
		throw std::runtime_error("Linux BASS decoder initialization failed, error " +
			std::to_string(instance->BASS_ErrorGetCode()));
	gBass = instance.release();
	gBassLoadCount = 1;
#endif
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
void Sexy::FreeBassDLL()
{
#ifndef _WIN32
	std::lock_guard lock(gBassMutex);
#endif
	if (gBass!=NULL)
	{
#ifdef _WIN32
		if (InterlockedDecrement(&gBassLoadCount) <= 0)
#else
		if (--gBassLoadCount <= 0)
#endif
		{
#ifndef _WIN32
			gBass->BASS_Free();
#endif
			delete gBass;
			gBass = NULL;
		}
	}
}


