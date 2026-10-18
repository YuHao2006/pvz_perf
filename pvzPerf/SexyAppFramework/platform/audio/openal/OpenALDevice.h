#pragma once
#include <AL/al.h>
#include <AL/alc.h>
#include <AL/alext.h>
#include <stdexcept>

namespace Sexy {
inline void CheckOpenAL(const char* operation)
{
    if (alGetError() != AL_NO_ERROR)
        throw std::runtime_error(operation);
}

class OpenALDevice final {
public:
    ALCdevice* mDevice = nullptr;
    ALCcontext* mContext = nullptr;
    OpenALDevice();
    ~OpenALDevice();
    void Close();
    OpenALDevice(const OpenALDevice&) = delete;
    OpenALDevice& operator=(const OpenALDevice&) = delete;
};
}
