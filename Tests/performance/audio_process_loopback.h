#pragma once
#include <audioclient.h>
#include <audioclientactivationparams.h>
#include <mmdeviceapi.h>
#include <ks.h>
#include <ksmedia.h>
#include <wrl.h>
#include <chrono>
#include <stdexcept>
#include <vector>

namespace AudioOutputTest {
inline void Check(HRESULT value, const char* operation)
{
    if (FAILED(value))
        throw std::runtime_error(std::string(operation) + ": " + std::to_string(value));
}
class Completion final : public Microsoft::WRL::RuntimeClass<
    Microsoft::WRL::RuntimeClassFlags<Microsoft::WRL::ClassicCom>,
    Microsoft::WRL::FtmBase, IActivateAudioInterfaceCompletionHandler> {
public:
    HANDLE ready = CreateEventW(nullptr, FALSE, FALSE, nullptr);
    HRESULT result = E_PENDING;
    Microsoft::WRL::ComPtr<IAudioClient> client;
    STDMETHOD(ActivateCompleted)(IActivateAudioInterfaceAsyncOperation* operation) override {
        Microsoft::WRL::ComPtr<IUnknown> activated;
        HRESULT activation = E_FAIL;
        result = operation->GetActivateResult(&activation, &activated);
        if (SUCCEEDED(result)) result = activation;
        if (SUCCEEDED(result)) result = activated.As(&client);
        SetEvent(ready);
        return S_OK;
    }
    ~Completion() { if (ready) CloseHandle(ready); }
};

class Capture {
    Microsoft::WRL::ComPtr<IAudioClient> client;
    Microsoft::WRL::ComPtr<IAudioCaptureClient> capture;
    HANDLE samplesReady = nullptr;
    unsigned long long packetCount = 0;
public:
    std::vector<float> samples;
    unsigned int rate = 0, channels = 0;
    Capture() {
        Microsoft::WRL::ComPtr<IMMDeviceEnumerator> devices;
        Check(CoCreateInstance(__uuidof(MMDeviceEnumerator), nullptr, CLSCTX_ALL,
            IID_PPV_ARGS(&devices)), "Create audio endpoint enumerator");
        Microsoft::WRL::ComPtr<IMMDevice> device;
        Check(devices->GetDefaultAudioEndpoint(eRender, eConsole, &device), "Default endpoint");
        Microsoft::WRL::ComPtr<IAudioClient> endpoint;
        Check(device->Activate(__uuidof(IAudioClient), CLSCTX_ALL, nullptr,
            reinterpret_cast<void**>(endpoint.GetAddressOf())), "Endpoint audio client");
        WAVEFORMATEX* format = nullptr;
        Check(endpoint->GetMixFormat(&format), "Endpoint mix format");
        struct FormatOwner {
            WAVEFORMATEX* value;
            ~FormatOwner() { CoTaskMemFree(value); }
        } owner{format};
        bool floating = format->wFormatTag == WAVE_FORMAT_IEEE_FLOAT;
        if (format->wFormatTag == WAVE_FORMAT_EXTENSIBLE)
            floating = reinterpret_cast<WAVEFORMATEXTENSIBLE*>(format)->SubFormat ==
                KSDATAFORMAT_SUBTYPE_IEEE_FLOAT;
        if (!floating || format->wBitsPerSample != 32 || format->nChannels != 2)
            throw std::runtime_error("Output comparison requires native stereo float32 endpoint");
        rate = format->nSamplesPerSec;
        channels = format->nChannels;
        samples.reserve(static_cast<size_t>(rate) * channels * 4);
        auto completion = Microsoft::WRL::Make<Completion>();
        if (!completion || !completion->ready)
            throw std::runtime_error("Cannot create loopback completion");
        AUDIOCLIENT_ACTIVATION_PARAMS parameters{};
        parameters.ActivationType = AUDIOCLIENT_ACTIVATION_TYPE_PROCESS_LOOPBACK;
        parameters.ProcessLoopbackParams.TargetProcessId = GetCurrentProcessId();
        parameters.ProcessLoopbackParams.ProcessLoopbackMode =
            PROCESS_LOOPBACK_MODE_INCLUDE_TARGET_PROCESS_TREE;
        PROPVARIANT argument{};
        argument.vt = VT_BLOB;
        argument.blob.cbSize = sizeof(parameters);
        argument.blob.pBlobData = reinterpret_cast<BYTE*>(&parameters);
        Microsoft::WRL::ComPtr<IActivateAudioInterfaceAsyncOperation> activation;
        Check(ActivateAudioInterfaceAsync(VIRTUAL_AUDIO_DEVICE_PROCESS_LOOPBACK,
            __uuidof(IAudioClient), &argument, completion.Get(), &activation), "Activate process loopback");
        if (WaitForSingleObject(completion->ready, 10000) != WAIT_OBJECT_0)
            throw std::runtime_error("Process loopback activation timed out");
        Check(completion->result, "Process loopback activation");
        client = completion->client;
        // Match the physical endpoint format; do not request capture-side SRC.
        Check(client->Initialize(AUDCLNT_SHAREMODE_SHARED,
            AUDCLNT_STREAMFLAGS_LOOPBACK | AUDCLNT_STREAMFLAGS_EVENTCALLBACK,
            0, 0, format, nullptr), "Initialize native-format process capture");
        Check(client->GetService(IID_PPV_ARGS(&capture)), "Process capture service");
        samplesReady = CreateEventW(nullptr, FALSE, FALSE, nullptr);
        if (!samplesReady) throw std::runtime_error("Capture event creation failed");
        Check(client->SetEventHandle(samplesReady), "Capture event");
        Check(client->Start(), "Capture start");
    }
    ~Capture() {
        if (client) client->Stop();
        if (samplesReady) CloseHandle(samplesReady);
    }
    void Pump(unsigned int milliseconds) {
        const auto until = std::chrono::steady_clock::now() + std::chrono::milliseconds(milliseconds);
        do {
            const DWORD waited = WaitForSingleObject(samplesReady, 20);
            if (waited != WAIT_OBJECT_0 && waited != WAIT_TIMEOUT)
                throw std::runtime_error("Capture event wait failed");
            UINT32 count = 0;
            Check(capture->GetNextPacketSize(&count), "Capture packet size");
            while (count) {
                BYTE* bytes = nullptr;
                DWORD flags = 0;
                UINT64 position = 0, clock = 0;
                Check(capture->GetBuffer(&bytes, &count, &flags, &position, &clock), "Capture data");
                const size_t length = static_cast<size_t>(count) * channels;
                if (flags & AUDCLNT_BUFFERFLAGS_SILENT)
                    samples.insert(samples.end(), length, 0.0f);
                else {
                    const auto* pcm = reinterpret_cast<const float*>(bytes);
                    samples.insert(samples.end(), pcm, pcm + length);
                }
                Check(capture->ReleaseBuffer(count), "Capture release");
                if (packetCount++ && (flags & AUDCLNT_BUFFERFLAGS_DATA_DISCONTINUITY))
                    throw std::runtime_error("Discontinuity in captured output");
                Check(capture->GetNextPacketSize(&count), "Capture next packet");
            }
        } while (std::chrono::steady_clock::now() < until);
    }
};
}
