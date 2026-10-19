#include "AudioUnitDevice.h"
#include <AudioUnit/AudioUnit.h>
#include <algorithm>
#include <array>
#include <mutex>
#include <stdexcept>
#include <string>
#include <thread>

namespace Sexy {
namespace {
void RequireAudio(OSStatus status, const char* operation)
{
    if (status != noErr)
        throw std::runtime_error(std::string(operation) + ": " + std::to_string(status));
}
struct Engine {
    static constexpr unsigned int MaxFrames = 4096, VoiceCount = 64;
    AudioComponentInstance unit = nullptr;
    std::array<AudioUnitVoice, VoiceCount> voices;
    std::array<bool, VoiceCount> claimed{};
    std::array<float, MaxFrames * 2> scratch{};
    std::atomic<int> error{0};
    static OSStatus Render(void* context, AudioUnitRenderActionFlags* flags,
        const AudioTimeStamp*, UInt32, UInt32 frames, AudioBufferList* buffers) noexcept
    {
        auto& engine = *static_cast<Engine*>(context);
        if (!buffers || buffers->mNumberBuffers != 1 ||
            buffers->mBuffers[0].mNumberChannels != 2 ||
            !buffers->mBuffers[0].mData || frames > MaxFrames ||
            buffers->mBuffers[0].mDataByteSize < frames * sizeof(float) * 2) {
            engine.error.store(kAudioUnitErr_TooManyFramesToProcess, std::memory_order_release);
            return kAudioUnitErr_TooManyFramesToProcess;
        }
        auto* output = static_cast<float*>(buffers->mBuffers[0].mData);
        std::fill_n(output, size_t(frames) * 2, 0.0f);
        bool playing = false;
        for (auto& voice : engine.voices) {
            // Sequential consistency makes disable/readers a quiescence handshake.
            voice.readers.fetch_add(1);
            if (voice.state.load() == AudioUnitVoiceState::Playing) {
                playing = true;
                std::fill_n(engine.scratch.data(), size_t(frames) * 2, 0.0f);
                voice.render(voice.context, engine.scratch.data(), frames);
                const float left = voice.leftGain.load(std::memory_order_relaxed);
                const float right = voice.rightGain.load(std::memory_order_relaxed);
                for (unsigned int frame = 0; frame < frames; ++frame) {
                    output[frame * 2] += engine.scratch[frame * 2] * left;
                    output[frame * 2 + 1] += engine.scratch[frame * 2 + 1] * right;
                }
            }
            voice.readers.fetch_sub(1);
        }
        if (!playing) *flags |= kAudioUnitRenderAction_OutputIsSilence;
        return noErr;
    }
    Engine()
    {
        AudioComponentDescription description{};
        description.componentType = kAudioUnitType_Output;
        description.componentSubType = kAudioUnitSubType_DefaultOutput;
        description.componentManufacturer = kAudioUnitManufacturer_Apple;
        const auto component = AudioComponentFindNext(nullptr, &description);
        if (!component) throw std::runtime_error("No macOS default-output Audio Unit");
        RequireAudio(AudioComponentInstanceNew(component, &unit), "Create Audio Unit");
        try {
            AudioStreamBasicDescription format{};
            format.mSampleRate = AudioUnitDevice::SampleRate;
            format.mFormatID = kAudioFormatLinearPCM;
            format.mFormatFlags = kAudioFormatFlagsNativeFloatPacked;
            format.mBytesPerPacket = format.mBytesPerFrame = sizeof(float) * 2;
            format.mFramesPerPacket = 1;
            format.mChannelsPerFrame = 2;
            format.mBitsPerChannel = sizeof(float) * 8;
            RequireAudio(AudioUnitSetProperty(unit, kAudioUnitProperty_StreamFormat,
                kAudioUnitScope_Input, 0, &format, sizeof(format)), "Set Audio Unit PCM format");
            const UInt32 maximum = MaxFrames;
            RequireAudio(AudioUnitSetProperty(unit, kAudioUnitProperty_MaximumFramesPerSlice,
                kAudioUnitScope_Global, 0, &maximum, sizeof(maximum)), "Set Audio Unit slice size");
            const AURenderCallbackStruct callback{Render, this};
            RequireAudio(AudioUnitSetProperty(unit, kAudioUnitProperty_SetRenderCallback,
                kAudioUnitScope_Input, 0, &callback, sizeof(callback)), "Set Audio Unit callback");
            RequireAudio(AudioUnitInitialize(unit), "Initialize Audio Unit");
            RequireAudio(AudioOutputUnitStart(unit), "Start Audio Unit");
        } catch (...) {
            AudioComponentInstanceDispose(unit);
            throw;
        }
    }
    ~Engine()
    {
        AudioOutputUnitStop(unit);
        AudioUnitUninitialize(unit);
        AudioComponentInstanceDispose(unit);
    }
};
std::mutex engineMutex;
std::unique_ptr<Engine> sharedEngine;
unsigned int engineOwners = 0;
}
struct AudioUnitDevice::Impl {
    Engine* engine;
    Impl()
    {
        const std::lock_guard lock(engineMutex);
        if (!sharedEngine) sharedEngine = std::make_unique<Engine>();
        engine = sharedEngine.get();
        ++engineOwners;
    }
    ~Impl()
    {
        const std::lock_guard lock(engineMutex);
        if (--engineOwners == 0) sharedEngine.reset();
    }
};
AudioUnitDevice::AudioUnitDevice() : impl_(std::make_unique<Impl>()) {}
AudioUnitDevice::~AudioUnitDevice() = default;
AudioUnitVoice* AudioUnitDevice::AcquireVoice(void* context, AudioUnitRender render)
{
    if (!render) throw std::invalid_argument("Audio Unit voice requires a render function");
    const std::lock_guard lock(engineMutex);
    auto& engine = *impl_->engine;
    for (size_t i = 0; i < engine.voices.size(); ++i) {
        if (engine.claimed[i]) continue;
        engine.claimed[i] = true;
        auto& voice = engine.voices[i];
        voice.context = context;
        voice.render = render;
        voice.leftGain.store(1, std::memory_order_relaxed);
        voice.rightGain.store(1, std::memory_order_relaxed);
        return &voice;
    }
    throw std::runtime_error("Audio Unit voice slots exhausted");
}
void AudioUnitDevice::ReleaseVoice(AudioUnitVoice* voice)
{
    QuiesceAudioUnitVoice(*voice);
    const std::lock_guard lock(engineMutex);
    auto& engine = *impl_->engine;
    for (size_t i = 0; i < engine.voices.size(); ++i) {
        if (&engine.voices[i] != voice) continue;
        voice->render = nullptr;
        voice->context = nullptr;
        engine.claimed[i] = false;
        return;
    }
    throw std::logic_error("Foreign Audio Unit voice");
}
void AudioUnitDevice::Check() const
{
    RequireAudio(impl_->engine->error.load(std::memory_order_acquire), "Audio Unit render");
}
}
