#include "VulkanHdr.h"
#ifdef _WIN32
#include "VulkanHdrDisplayState.h"
#include <cstdio>
#include <future>
#include <utility>
#include <roapi.h>
#include <windows.graphics.display.interop.h>
#include <winrt/Windows.Foundation.h>
#include <winrt/Windows.Graphics.Display.h>
#include <winrt/Windows.System.h>

namespace Sexy {
namespace {
using winrt::Windows::Graphics::Display::DisplayInformation;
using winrt::Windows::System::DispatcherQueueController;

std::exception_ptr HdrFailure() {
    try { throw; }
    catch (const winrt::hresult_error& error) {
        return std::make_exception_ptr(std::runtime_error("HDR notification failed: "+
            winrt::to_string(error.message())+" HRESULT="+std::to_string(error.code().value)));
    }
    catch (...) { return std::current_exception(); }
}
struct Apartment {
    HRESULT result=RoInitialize(RO_INIT_MULTITHREADED);
    Apartment() {
        if (FAILED(result) && result!=RPC_E_CHANGED_MODE)
            throw std::runtime_error("Cannot initialize HDR observer COM apartment: "+std::to_string(result));
    }
    ~Apartment() { if (SUCCEEDED(result)) RoUninitialize(); }
};
struct MtaLifetime {
    CO_MTA_USAGE_COOKIE cookie=nullptr;
    MtaLifetime() {
        const auto result=CoIncrementMTAUsage(&cookie);
        if (FAILED(result))
            throw std::runtime_error("Cannot retain HDR observer MTA: "+std::to_string(result));
    }
    MtaLifetime(const MtaLifetime&)=delete;
    MtaLifetime& operator=(const MtaLifetime&)=delete;
    void Close() {
        if (!cookie) return;
        const auto result=CoDecrementMTAUsage(std::exchange(cookie,nullptr));
        if (FAILED(result))
            throw std::runtime_error("Cannot release HDR observer MTA: "+std::to_string(result));
    }
    ~MtaLifetime() {
        try {Close();}
        catch (const std::exception& error) {std::fprintf(stderr,"%s\n",error.what());}
    }
};
VulkanHdrDisplayInfo ReadDisplay(const DisplayInformation& display) {
    using winrt::Windows::Graphics::Display::AdvancedColorKind;
    const auto color=display.GetAdvancedColorInfo();
    return {color.CurrentAdvancedColorKind()==AdvancedColorKind::HighDynamicRange,
        color.SdrWhiteLevelInNits(),color.MaxLuminanceInNits(),color.MinLuminanceInNits(),
        color.MaxAverageFullFrameLuminanceInNits()};
}
}

struct VulkanHdrDisplayObserver::Impl {
    // Keep agile controller resources alive between calls without fixing the
    // game thread into MTA for the whole session. Each WinRT call has its own
    // balanced initialization; an existing STA is left unchanged. This lease
    // is released only after the notification queue/controller are shut down.
    MtaLifetime mta;
    DispatcherQueueController controller{nullptr};
    struct State {
        VulkanHdrDisplayState published;
        // The following fields are accessed ONLY on the dispatcher thread.
        DisplayInformation display{nullptr};
        winrt::event_token token{};
        bool subscribed=false;
        uint64_t binding=0;
        void Unbind() {
            ++binding; // Ignore already-queued notifications from an old target.
            auto previous=std::exchange(display,nullptr);
            if (std::exchange(subscribed,false)) previous.AdvancedColorInfoChanged(token);
        }
    };
    std::shared_ptr<State> state=std::make_shared<State>();
    NativeMonitorHandle native=nullptr; // Identity comparison only on the application thread.

    Impl() {
        try {
            const Apartment apartment;
            controller=DispatcherQueueController::CreateOnDedicatedThread();
        }
        catch (...) { std::rethrow_exception(HdrFailure()); }
    }
    template<class Work> void Invoke(Work&& work) {
        if (!controller) throw std::logic_error("HDR observer is closed");
        auto done=std::make_shared<std::promise<void>>();
        auto future=done->get_future();
        const Apartment apartment;
        try {
            if (!controller.DispatcherQueue().TryEnqueue([work=std::forward<Work>(work),done]() noexcept {
                try {work();done->set_value();}
                catch (...) {done->set_exception(HdrFailure());}
            })) throw std::runtime_error("HDR observer queue rejected work");
        } catch (...) { std::rethrow_exception(HdrFailure()); }
        // The dedicated queue owns its pump; never re-enter the game while waiting.
        future.get();
    }
    void Bind(NativeMonitorHandle target,bool force) {
        if (!controller) throw std::logic_error("HDR observer is closed");
        if (native==target && !force) return;
        Invoke([s=state,target] {
            s->Unbind();
            auto factory=winrt::get_activation_factory<DisplayInformation,IDisplayInformationStaticsInterop>();
            winrt::check_hresult(factory->GetForMonitor(target,winrt::guid_of<DisplayInformation>(),winrt::put_abi(s->display)));
            const auto binding=s->binding;
            s->token=s->display.AdvancedColorInfoChanged([weak=std::weak_ptr<State>(s),binding](auto const& sender,auto const&) noexcept {
                if (auto state=weak.lock();state && state->binding==binding) {
                    try {state->published.Publish(ReadDisplay(sender));}
                    catch (...) {state->published.Fail(HdrFailure());}
                }
            });
            s->subscribed=true;
            s->published.Publish(ReadDisplay(s->display));
        });
        native=target;
    }
    void Stop() {
        if (!controller) return;
        std::exception_ptr failure;
        try {
            Invoke([s=state]{s->Unbind();});
            // An event may have failed just before shutdown, with no subsequent
            // game pump to consume it. Still report it after draining the queue.
            if (state->published.Revision()) (void)state->published.Snapshot();
        }
        catch (...) { failure=std::current_exception(); }
        try {
            const Apartment apartment;
            auto complete=std::make_shared<std::promise<void>>();
            auto future=complete->get_future();
            auto action=controller.ShutdownQueueAsync();
            action.Completed([complete](auto const& operation,auto) noexcept {
                try {operation.GetResults();complete->set_value();}
                catch (...) {complete->set_exception(HdrFailure());}
            });
            future.get(); // Completion means the dedicated event loop exited.
            controller=nullptr;
            mta.Close();
        } catch (...) { if (!failure) failure=HdrFailure(); }
        if (failure) std::rethrow_exception(failure);
    }
    ~Impl() {
        // Close reports errors to normal callers. Destruction during unwinding
        // still tears down and records failures, never silently discards them.
        try {Stop();}
        catch (const std::exception& error) {std::fprintf(stderr,"HDR observer shutdown failed: %s\n",error.what());}
    }
};

VulkanHdrDisplayObserver::VulkanHdrDisplayObserver(NativeMonitorHandle monitor) {
    impl_=std::make_unique<Impl>();
    Rebind(monitor);
}
VulkanHdrDisplayObserver::~VulkanHdrDisplayObserver()=default;
void VulkanHdrDisplayObserver::Rebind(NativeMonitorHandle monitor,bool force) {
    if (!monitor) throw std::invalid_argument("HDR observer requires a target monitor");
    impl_->Bind(monitor,force);
}
void VulkanHdrDisplayObserver::Refresh() {
    impl_->Invoke([s=impl_->state] {s->published.Publish(ReadDisplay(s->display));});
}
uint64_t VulkanHdrDisplayObserver::Revision() const {
    return impl_->state->published.Revision();
}
VulkanHdrDisplaySnapshot VulkanHdrDisplayObserver::Snapshot() const {
    return impl_->state->published.Snapshot();
}
void VulkanHdrDisplayObserver::Close() {
    impl_->Stop();
}
}
#endif
