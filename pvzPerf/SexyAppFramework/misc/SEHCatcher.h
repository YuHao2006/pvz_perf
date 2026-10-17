#pragma once
#include "Common.h"
#ifdef _WIN32
#include <imagehlp.h>
#endif

namespace Sexy
{

class SexyAppBase;

#ifdef _WIN32
typedef BOOL (__stdcall * SYMINITIALIZEPROC)(HANDLE, LPSTR, BOOL);

typedef uintptr_t (__stdcall *SYMSETOPTIONSPROC)(uintptr_t);

typedef BOOL (__stdcall *SYMCLEANUPPROC)(HANDLE);

typedef LPCSTR (__stdcall *UNDECORATESYMBOLNAMEPROC)(LPCSTR, LPSTR, uintptr_t, uintptr_t);

typedef BOOL (__stdcall * STACKWALKPROC)
           ( uintptr_t, HANDLE, HANDLE, LPSTACKFRAME, LPVOID,
            PREAD_PROCESS_MEMORY_ROUTINE,PFUNCTION_TABLE_ACCESS_ROUTINE,
            PGET_MODULE_BASE_ROUTINE, PTRANSLATE_ADDRESS_ROUTINE);

typedef LPVOID (__stdcall *SYMFUNCTIONTABLEACCESSPROC)(HANDLE, uintptr_t);

typedef uintptr_t (__stdcall *SYMGETMODULEBASEPROC)(HANDLE, uintptr_t);

typedef BOOL (__stdcall *SYMGETSYMFROMADDRPROC)(HANDLE, uintptr_t, PDWORD, PIMAGEHLP_SYMBOL);

class SEHCatcher 
{
public:	
	static SexyAppBase*		mApp;
	static HFONT			mDialogFont;
	static HFONT			mBoldFont;
	static NativeWindowHandle	mNoButtonWindow;
	static NativeWindowHandle	mDebugButtonWindow;
	static bool				mDebugError;
	static std::string		mErrorTitle;
	static std::string		mErrorText;
	static std::wstring		mCrashMessage;
	static HMODULE			mImageHelpLib;
	static SYMINITIALIZEPROC mSymInitialize;
	static SYMSETOPTIONSPROC mSymSetOptions;
	static UNDECORATESYMBOLNAMEPROC mUnDecorateSymbolName;
	static SYMCLEANUPPROC	mSymCleanup;
	static STACKWALKPROC	mStackWalk;
	static SYMFUNCTIONTABLEACCESSPROC mSymFunctionTableAccess;
	static SYMGETMODULEBASEPROC mSymGetModuleBase;
	static SYMGETSYMFROMADDRPROC mSymGetSymFromAddr;
	static bool				mExiting;
	static bool				mShowUI;

protected:
	static LPTOP_LEVEL_EXCEPTION_FILTER mPreviousFilter;

public:
	static LRESULT CALLBACK SEHWindowProc(NativeWindowHandle hWnd, UINT uMsg, WPARAM wParam, LPARAM lParam);
	static long __stdcall	UnhandledExceptionFilter(LPEXCEPTION_POINTERS lpExceptPtr);	
	static void				DoHandleDebugEvent(LPEXCEPTION_POINTERS lpEP);
	static bool				GetLogicalAddress(void* addr, char* szModule, DWORD len, DWORD& section, DWORD& offset);
	static std::string		GetFilename(const std::string& thePath);
	static void				WriteToFile(const std::string& theErrorText);
	static void				ShowErrorDialog(const std::string& theErrorTitle, const std::string& theErrorText);	
	static bool				LoadImageHelp();
	static void				UnloadImageHelp();
	static std::string		IntelWalk(PCONTEXT theContext);
	static std::string		ImageHelpWalk(PCONTEXT theContext, int theSkipCount);
	static std::string		GetSysInfo();
	static void				GetSymbolsFromMapFile(std::string &theDebugDump);

public:
	SEHCatcher();
	~SEHCatcher();
};
#else
// Linux retains native signals and core dumps; main reports C++ exceptions.
class SEHCatcher
{
public:
	inline static SexyAppBase* mApp = nullptr;
	inline static bool mShowUI = true;
	inline static std::wstring mCrashMessage;
};
#endif

}

