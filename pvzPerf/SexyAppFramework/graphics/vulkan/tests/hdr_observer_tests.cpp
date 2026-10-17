#include "TestWin32Window.h"
#include "VulkanHdrDisplayState.h"
#include <atomic>
#include <iostream>
#include <string>
#include <thread>
#include <objbase.h>

namespace {
std::atomic_uint errors=0;
void Require(bool value,const char* message) {if (!value) throw std::runtime_error(message);}
struct CallerApartment {
    APTTYPE type=APTTYPE_CURRENT;
    APTTYPEQUALIFIER qualifier=APTTYPEQUALIFIER_NONE;
    HRESULT result=CoGetApartmentType(&type,&qualifier);
    bool Uncommitted() const {
        return result==CO_E_NOTINITIALIZED ||
            (result==S_OK && type==APTTYPE_MTA && qualifier==APTTYPEQUALIFIER_IMPLICIT_MTA);
    }
    void RequirePreserved() const {
        const CallerApartment now;
        if (Uncommitted())
            Require(now.Uncommitted(),"HDR observer fixed an uninitialized caller into an explicit COM apartment");
        else
            Require(now.result==result && now.type==type && now.qualifier==qualifier,
                "HDR observer changed the caller's existing COM apartment");
    }
};
struct ScopedCallerApartment {
    explicit ScopedCallerApartment(DWORD mode) {
        const auto result=CoInitializeEx(nullptr,mode);
        if (FAILED(result)) throw std::runtime_error("Cannot select caller COM apartment: "+std::to_string(result));
    }
    ~ScopedCallerApartment() {CoUninitialize();}
};
VkBool32 VKAPI_CALL Validation(VkDebugUtilsMessageSeverityFlagBitsEXT severity,
    VkDebugUtilsMessageTypeFlagsEXT type,const VkDebugUtilsMessengerCallbackDataEXT* data,void* user) {
    if (severity>=VK_DEBUG_UTILS_MESSAGE_SEVERITY_ERROR_BIT_EXT) ++errors;
    return VulkanInitConfig::DefaultDebugCallback(severity,type,data,user);
}
void StateTest() {
    Sexy::VulkanHdrDisplayState state;
    bool rejected=false;
    try {(void)state.Snapshot();}catch(const std::logic_error&) {rejected=true;}
    Require(rejected,"Uninitialized display snapshot was accepted");
    const Sexy::VulkanHdrDisplayInfo first{true,200,800,0,400};
    state.Publish(first);
    const auto old=state.Snapshot();
    state.Publish(first);
    Require(state.Revision()==1 && old.revision==1,"Duplicate display event advanced revision");
    state.Publish({true,250,1000,0,500});
    Require(state.Revision()==2 && old.display==first,"Published snapshot changed an earlier owned value");
    std::atomic_bool done=false;
    std::jthread producer([&] {
        for (int i=1;i<=10000;++i) {
            const float white=float(100+i%300);
            state.Publish({true,white,4*white,0,2*white});
        }
        done.store(true,std::memory_order_release);
    });
    uint64_t revision=2;
    do {
        const auto current=state.Snapshot();
        Require(current.revision>=revision && current.display.peakNits==4*current.display.paperWhiteNits &&
            current.display.fullFrameNits==2*current.display.paperWhiteNits,"Torn or regressed HDR publication");
        revision=current.revision;
    } while (!done.load(std::memory_order_acquire));
    producer.join();
    state.Fail(std::make_exception_ptr(std::runtime_error("injected HDR query failure")));
    state.Publish(first);
    rejected=false;
    try {(void)state.Snapshot();}catch(const std::runtime_error& e) {rejected=std::string(e.what())=="injected HDR query failure";}
    Require(rejected,"Later metadata concealed a failed asynchronous HDR query");
    std::cout<<"PASS HDR publication: duplicate events, owned snapshots, 10000 concurrent updates, latched error\n";
}
void ObserverTest() {
    VulkanInitConfig init;
    init.enableValidation=true;init.debugCallback=Validation;
    VulkanTest::Window native(320,240);
    VulkanContext window(init,native.hwnd,VulkanTest::SwapchainConfig());
    const auto monitor=MonitorFromWindow(native.hwnd,MONITOR_DEFAULTTONEAREST);
    const auto identity=window.hwnd;
    const auto swapchain=window.swapchainGeneration;
    auto exercise=[&](int cycles) {
      for (int cycle=0;cycle<cycles;++cycle) {
        const CallerApartment caller;
        Sexy::VulkanHdrDisplayObserver observer(monitor);
        caller.RequirePreserved();
        // A previously uninitialized game/UI thread must remain free to choose
        // STA even while the independent metadata observer is alive.
        if (caller.Uncommitted()) {
            const ScopedCallerApartment sta(COINIT_APARTMENTTHREADED);
            observer.Refresh();
        }
        caller.RequirePreserved();
        const auto initial=observer.Snapshot();
        Require(initial.revision>0,"Observer did not publish initial metadata");
        observer.Rebind(monitor);
        observer.Refresh();
        Require(observer.Snapshot().display==Sexy::QueryVulkanHdrDisplay(monitor),"Observer disagrees with direct monitor query");
        // Force a topology refresh with the same native handle. This exercises
        // unregister/register on the owning dispatcher without changing the OS.
        observer.Rebind(monitor,true);
        Require(observer.Snapshot().display==Sexy::QueryVulkanHdrDisplay(monitor),"Rebound observer has stale metadata");
        caller.RequirePreserved();
        observer.Close();observer.Close();
        caller.RequirePreserved();
        bool rejected=false;
        try {observer.Refresh();}catch(const std::logic_error&) {rejected=true;}
        Require(rejected,"Closed observer accepted work");
        rejected=false;
        try {observer.Rebind(monitor);}catch(const std::logic_error&) {rejected=true;}
        Require(rejected,"Closed observer silently accepted its previous target");
      }
    };
    const CallerApartment baseline;
    exercise(4);
    baseline.RequirePreserved();
    {
        const ScopedCallerApartment sta(COINIT_APARTMENTTHREADED);
        exercise(2);
    }
    baseline.RequirePreserved();
    bool rejected=false;
    try {Sexy::VulkanHdrDisplayObserver invalid(nullptr);}
    catch (const std::invalid_argument&) {rejected=true;}
    Require(rejected,"Null monitor was accepted");
    baseline.RequirePreserved();
    {
        Sexy::VulkanHdrDisplayObserver implicitClose(monitor);
        implicitClose.Refresh();
    }
    baseline.RequirePreserved();
    {
        Sexy::VulkanHdrDisplayObserver first(monitor),second(monitor);
        first.Close();
        second.Refresh();
        Require(second.Snapshot().display==Sexy::QueryVulkanHdrDisplay(monitor),
            "Closing one observer invalidated another observer's COM lifetime");
    }
    baseline.RequirePreserved();
    {
        const ScopedCallerApartment mta(COINIT_MULTITHREADED);
        exercise(2);
    }
    baseline.RequirePreserved();
    Require(window.hwnd==identity && window.swapchainGeneration==swapchain &&
        !IsWindowVisible(identity),"Metadata observer modified the window/WSI");
    std::cout<<"PASS real HDR subscriptions: 8 explicit-close cycles, failed construction, implicit/overlapping lifetimes, uninitialized/STA/MTA callers preserved; no OS display changes/presents\n";
}
}
int main() {
    try {StateTest();ObserverTest();Require(errors==0,"Vulkan validation error");return 0;}
    catch(const std::exception& e) {std::cerr<<"FAIL "<<e.what()<<'\n';return 1;}
}
