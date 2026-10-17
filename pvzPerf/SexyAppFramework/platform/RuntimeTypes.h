#pragma once
#include "NativeHandles.h"
#include <cstdint>
#include <thread>
#ifndef _WIN32
#include "linux/RuntimeTypes.h"
#endif

namespace Sexy {
#ifdef _WIN32
using NativeThreadId = unsigned int;
#else
using NativeThreadId = std::thread::id;
#endif
NativeThreadId CurrentNativeThreadIdentity() noexcept;

static_assert(sizeof(unsigned int) == 4);
static_assert(sizeof(unsigned long long) == 8);
static_assert(sizeof(int) == 4);
static_assert(sizeof(long long) == 8);
}
