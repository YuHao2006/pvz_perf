#include "LawnApp.h"
#if PVZ_ENABLE_GAME_PROBES
#include "Lawn/NativeLinuxGameSmoke.h"
#ifdef _WIN32
#include "Lawn/PortableFixesSmoke.h"
#include "Lawn/LoadingCloseSmoke.h"
#endif
#endif
#include "Resources.h"
#include "Sexy.TodLib/TodStringFile.h"
#include "Sexy.TodLib/TodDebug.h"
#include "SexyAppFramework/misc/KeyCodes.h"
#include "SexyAppFramework/misc/SEHCatcher.h"
#include "SexyAppFramework/misc/ResourceError.h"
#include "SexyAppFramework/widget/WidgetManager.h"
#include <string>
#include <cstdio>
#include <cstdlib>
#include <exception>
#ifndef _WIN32
#include "SexyAppFramework/platform/linux/ErrorDialog.h"
#endif
using namespace Sexy;

bool (*gAppCloseRequest)();				//[0x69E6A0]
bool (*gAppHasUsedCheatKeys)();			//[0x69E6A4]
SexyString (*gGetCurrentLevelName)();

namespace
{
void WriteFatalLog(const char* message)
{
	TodLog("%s\n", message);
	fprintf(stderr, "pvz_perf: %s\n", message);
}
bool HasRuntimeFile(const std::string& theDirectory, const char* theRelativePath)
{
	if (theDirectory.empty())
		return false;

	const std::string aPath = AddTrailingSlash(theDirectory, true) + theRelativePath;
	return Sexy::FileExists(aPath);
}

bool HasRuntimeRoot(const std::string& theDirectory)
{
	return HasRuntimeFile(theDirectory, "main.pak64");
}

std::string SelectRuntimeRoot(const std::string& theExecutableDirectory)
{
	if (HasRuntimeRoot(theExecutableDirectory))
		return theExecutableDirectory;

	const std::string aParentDirectory = GetFileDir(RemoveTrailingSlash(theExecutableDirectory));
	if (HasRuntimeRoot(aParentDirectory))
		return aParentDirectory;

	const std::string aCurrentDirectory = GetCurDir();
	if (HasRuntimeRoot(aCurrentDirectory))
		return aCurrentDirectory;

	// Preserve the executable-directory default so the eventual resource error
	// still points at the location the user launched.
	return theExecutableDirectory;
}
}

//0x44E8F0
#ifdef _WIN32
int WINAPI WinMain(_In_ HINSTANCE /* hInstance */, _In_opt_ HINSTANCE /* hPrevInstance */, _In_ LPSTR /* lpCmdLine */, _In_ int /* nCmdShow */)
#else
int main(int argc, char** argv)
#endif
{
#ifdef _WIN32
#if PVZ_ENABLE_GAME_PROBES
    if (std::getenv("PVZ_MODERN_HIDDEN")) {
        // Hidden tests still write SEH crash diagnostics and fail the process,
        // but must not wait forever for a user to dismiss an error dialog.
        SEHCatcher::mShowUI=false;
        const UINT previousMode=SetErrorMode(SEM_NOGPFAULTERRORBOX);
        SetErrorMode(previousMode | SEM_NOGPFAULTERRORBOX);
    }
#endif
	// Take control of display scaling ourselves: stop DWM from virtualizing the
	// window at the system scale (e.g. 150%) and present at a fixed integer
	// factor instead. DPI_AWARENESS_CONTEXT_SYSTEM_AWARE is -2 (UNAWARE is -1).
	typedef BOOL(WINAPI* SetProcessDpiAwarenessContextFunc)(void*);
	typedef BOOL(WINAPI* SetProcessDPIAwareFunc)();
	HMODULE aUser32 = GetModuleHandleA("user32.dll");
	if (aUser32 != nullptr)
	{
		auto aSetDpiAwarenessContext =
			(SetProcessDpiAwarenessContextFunc)GetProcAddress(aUser32, "SetProcessDpiAwarenessContext");
		if (aSetDpiAwarenessContext != nullptr)
			aSetDpiAwarenessContext((void*)-2);
		else
		{
			auto aSetProcessDpiAware = (SetProcessDPIAwareFunc)GetProcAddress(aUser32, "SetProcessDPIAware");
			if (aSetProcessDpiAware != nullptr)
				aSetProcessDpiAware();
		}
	}
#endif

	try {
	gTodStringFormats = gLawnStringFormats;
	gTodStringFormatCount = gLawnStringFormatCount;
	gGetCurrentLevelName = LawnGetCurrentLevelName;
	gAppCloseRequest = LawnGetCloseRequest;
	gAppHasUsedCheatKeys = LawnHasUsedCheatKeys;
	gExtractResourcesByGroup = Sexy::ExtractResourcesByGroup;
	gLawnApp = new LawnApp();
	gLawnApp->mChangeDirTo = SelectRuntimeRoot(gLawnApp->mChangeDirTo);

#ifndef _WIN32
	// argv already separates arguments; values may contain spaces or '='.
	for (int index = 1; index < argc; ++index)
	{
		const std::string argument = argv[index];
		const auto equals = argument.find('=');
		gLawnApp->HandleCmdLineParam(argument.substr(0, equals),
			equals == std::string::npos ? "" : argument.substr(equals + 1));
	}
	gLawnApp->mCmdLineParsed = true;
#if PVZ_ENABLE_GAME_PROBES
	PrepareNativeLinuxGameSmoke(*gLawnApp);
#endif
#elif PVZ_ENABLE_GAME_PROBES
        PortableBeforeInitSmoke(*gLawnApp);
#endif
        gLawnApp->Init();
#if PVZ_ENABLE_GAME_PROBES && defined(_WIN32)
        LoadingCloseSmoke::AfterInit(*gLawnApp);
#endif
        gLawnApp->Start();
        gLawnApp->Shutdown();
		gLawnApp->RethrowLoadingThreadError();
#if PVZ_ENABLE_GAME_PROBES && defined(_WIN32)
        LoadingCloseSmoke::AfterShutdown(*gLawnApp);
        PortableStoreCloseAfterShutdown(*gLawnApp);
#endif
        delete gLawnApp;
        gLawnApp = nullptr;
#if PVZ_ENABLE_GAME_PROBES && defined(_WIN32)
        LoadingCloseSmoke::AfterDestruction();
        PortableStoreCloseAfterDestruction();
#endif
        return 0;
    } catch (const ResourceManagerException& exception) {
        const auto& error=exception.error;
		const auto message=StrFormat("Resource loading failed.\nError code: %u\nResource slot: %u\nValue: %u\nByte offset: %zu",
			static_cast<unsigned>(error.reason),error.slot,error.value,error.offset);
		WriteFatalLog(message.c_str());
#ifdef _WIN32
#if PVZ_ENABLE_GAME_PROBES
        if(getenv("PVZ_MODERN_HIDDEN")==nullptr) {
#else
        {
#endif
            MessageBoxA(nullptr,message.c_str(),"pvz_perf - Fatal error",MB_OK|MB_ICONERROR);
        }
#else
        const auto details = message + "\n\nGame directory: " + GetCurDir();
        ShowLinuxErrorDialog(details.c_str(), "pvz_perf - Fatal error");
#endif
        return 1;
    } catch (const std::exception& error) {
		WriteFatalLog(error.what());
#ifdef _WIN32
#if PVZ_ENABLE_GAME_PROBES
        if(getenv("PVZ_MODERN_HIDDEN")==nullptr)
#endif
            MessageBoxA(nullptr,error.what(),"pvz_perf - Fatal error",MB_OK|MB_ICONERROR);
#else
        const auto details = std::string(error.what()) + "\n\nGame directory: " + GetCurDir();
        ShowLinuxErrorDialog(details.c_str(), "pvz_perf - Fatal error");
#endif
        return 1;
    }
}
