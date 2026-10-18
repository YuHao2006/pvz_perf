#pragma once
#include <cstdint>
#include <strings.h>
#include <objc/objc.h>

// Legacy storage names only. BOOL comes from Apple's runtime ABI, including
// in ordinary C++ translation units; redefining it as int breaks Objective-C++.
using BYTE = unsigned char;
using WORD = unsigned short;
using DWORD = unsigned int;
using UINT = unsigned int;
using LONG = int;
using LONG_PTR = std::intptr_t;
using WPARAM = std::uintptr_t;
using LPARAM = std::intptr_t;
using LRESULT = std::intptr_t;
using HANDLE = void*;
using HINSTANCE = void*;
using HMODULE = void*;
using HCURSOR = void*;
struct POINT { LONG x, y; };
struct RECT { LONG left, top, right, bottom; };
#define WINAPI
#define CALLBACK
#define _stricmp strcasecmp
#define stricmp strcasecmp
#define _strnicmp strncasecmp
#define strnicmp strncasecmp
#ifndef TRUE
#define TRUE 1
#define FALSE 0
#endif
constexpr int MB_OK = 0, MB_ICONERROR = 16, MB_ICONINFORMATION = 64;
constexpr int MB_APPLMODAL = 0, MB_ICONSTOP = 16, IDOK = 1;
