#pragma once
#include <string>
class LawnApp;
// Opt-in integration probe. No OS mouse injection and no Legacy save writes.
void ModernVulkanSmokeTick(LawnApp& app);
void ModernVulkanCreditsSmokeTick(LawnApp& app);
void ModernVulkanSquirrelSmokeTick(LawnApp& app);
void ModernVulkanAwardVaseSmokeTick(LawnApp& app);
void ModernVulkanAquariumSmokeTick(LawnApp& app);
void ModernVulkanUpsellSmokeTick(LawnApp& app);
void ModernVulkanBeghouledSmokeTick(LawnApp& app);
void PortableSurvivalSmokeTick(LawnApp& app);
void PortableContinueSmokeTick(LawnApp& app);
void PortableZenLifetimeSmokeTick(LawnApp& app);
void PortableModalLifetimeSmokeTick(LawnApp& app);
void ModernVulkanGameplaySmokeTick(LawnApp& app, const std::string& scenario);
namespace ModernSmoke {
// Opt-in scene actions simulate a real callback. Nested unit fixtures retain
// their explicit top-level entry and manage their own collection probes.
class CallbackScope final {
    int& depth;
    bool entered;
public:
    explicit CallbackScope(LawnApp& app);
    ~CallbackScope();
    CallbackScope(const CallbackScope&) = delete;
    CallbackScope& operator=(const CallbackScope&) = delete;
};
void RequireDeletionBoundary(LawnApp& app, const char* phase);
std::string ProbePath(const std::string& file);
void Report(const char* stage, LawnApp& app);
void Capture(const char* name, LawnApp& app, unsigned minimumColors=128);
void ProbeScreenshot(LawnApp& app);
void ProbeSpriteScaling(LawnApp& app);
void ToggleScale(LawnApp& app, bool enabled);
}
