#pragma once
#include "D3d9Context.h"
#ifndef NOMINMAX
#define NOMINMAX
#endif
#include <d3d9.h>
#include <cstdio>
#include <stdexcept>
#include <string>
#include <utility>
namespace Sexy::DX9 {
inline void Check(HRESULT result, const char* operation)
{
    if (FAILED(result)) {
        char code[32];
        std::snprintf(code, sizeof(code), " (HRESULT 0x%08x)", static_cast<unsigned int>(result));
        throw std::runtime_error(std::string(operation) + code);
    }
}
template<class T> class Com {
public:
    T* value = nullptr;
    Com() = default;
    ~Com() { reset(); }
    Com(const Com&) = delete;
    Com& operator=(const Com&) = delete;
    Com(Com&& other) noexcept : value(std::exchange(other.value, nullptr)) {}
    Com& operator=(Com&& other) noexcept {
        if (this != &other) { reset(); value = std::exchange(other.value, nullptr); }
        return *this;
    }
    void reset() { if (value) { value->Release(); value = nullptr; } }
    T* operator->() const { return value; }
    explicit operator bool() const { return value != nullptr; }
    T** put() { reset(); return &value; }
};
}
