#include "OpenALDevice.h"

namespace Sexy {
OpenALDevice::OpenALDevice()
{
    mDevice = alcOpenDevice(nullptr);
    if (!mDevice)
        throw std::runtime_error("OpenAL Soft could not open a native audio device");
    const int attributes[]{ALC_MONO_SOURCES, 32, ALC_STEREO_SOURCES, 8, 0};
    mContext = alcCreateContext(mDevice, attributes);
    if (!mContext || !alcMakeContextCurrent(mContext)) {
        if (mContext) alcDestroyContext(mContext);
        alcCloseDevice(mDevice);
        throw std::runtime_error("OpenAL audio context creation failed");
    }
    if (!alIsExtensionPresent("AL_SOFT_callback_buffer")) {
        alcMakeContextCurrent(nullptr);
        alcDestroyContext(mContext);
        alcCloseDevice(mDevice);
        throw std::runtime_error("Music requires OpenAL Soft with AL_SOFT_callback_buffer");
    }
    alDistanceModel(AL_NONE);
}
OpenALDevice::~OpenALDevice()
{
    Close();
}
void OpenALDevice::Close()
{
    if (mContext) {
        alcMakeContextCurrent(nullptr);
        alcDestroyContext(mContext);
        mContext = nullptr;
    }
    if (mDevice) {
        alcCloseDevice(mDevice);
        mDevice = nullptr;
    }
}
}
