#include "PortableFixesSmoke.h"
#include "ModernVulkanSmoke.h"
#include "LawnApp.h"
#include "Board.h"
#include "SeedPacket.h"
#include "System/PlayerInfo.h"
#include "Widget/SeedChooserScreen.h"
#include "Widget/GameButton.h"
#include "Sexy.TodLib/TodCommon.h"
#include <algorithm>
#include <array>
#include <cstdint>
#include <cstring>
#include <fstream>
#include <memory>
#include <new>
#include <stdexcept>

namespace {
void Require(bool ok, const char* message) { if (!ok) throw std::runtime_error(message); }
struct Flight { SeedType seed; int sx, sy, ex, ey, duration; ChosenSeedState finalState; };
}

void PortableChooserTimingSmoke(LawnApp& app) {
    Require(getenv("PVZ_MODERN_HIDDEN") && getenv("PVZ_APPDATA_DIR") && app.mBoard && app.mSeedChooserScreen,
        "Chooser timing regression requires an isolated hidden chooser");
    auto& chooser = *app.mSeedChooserScreen;
    Require(chooser.mSeedsInBank == 0 && chooser.mSeedsInFlight == 0, "Chooser timing needs an empty bank");
    auto profile = std::make_unique<PlayerInfo>();
    profile->mLevel = 50; profile->mFinishedAdventure = 1;
    struct Restore {
        LawnApp& app; SeedChooserScreen& chooser;
        PlayerInfo* profile; GameMode mode; int packets;
        decltype(std::to_array(chooser.mChosenSeeds)) seeds;
        std::uint32_t ageBits;
        int bank, flight; bool mouseVisible, startDisabled;
        decltype(std::to_array(chooser.mStartButton->mColors)) startColors;
        ~Restore() {
            app.mPlayerInfo = profile; app.mGameMode = mode; app.mBoard->mSeedBank->mNumPackets = packets;
            std::copy(seeds.begin(), seeds.end(), std::begin(chooser.mChosenSeeds));
            std::memcpy(&chooser.mSeedChooserAge, &ageBits, sizeof(ageBits));
            chooser.mSeedsInBank = bank; chooser.mSeedsInFlight = flight; chooser.mMouseVisible = mouseVisible;
            chooser.mStartButton->mDisabled = startDisabled;
            std::copy(startColors.begin(), startColors.end(), std::begin(chooser.mStartButton->mColors));
        }
    } restore{app, chooser, app.mPlayerInfo, app.mGameMode, app.mBoard->mSeedBank->mNumPackets,
        std::to_array(chooser.mChosenSeeds), 0, chooser.mSeedsInBank, chooser.mSeedsInFlight,
        chooser.mMouseVisible, chooser.mStartButton->mDisabled, std::to_array(chooser.mStartButton->mColors)};
    static_assert(sizeof(chooser.mSeedChooserAge) == sizeof(std::uint32_t));
    // Inspect object representations, not indeterminate signed integer values
    // in the old constructor. This same test also runs before the fix.
    std::memcpy(&restore.ageBits, &chooser.mSeedChooserAge, sizeof(restore.ageBits));
    app.mPlayerInfo = profile.get(); app.mGameMode = GAMEMODE_MINIGAME_WAR_AND_PEAS;
    app.mBoard->mSeedBank->mNumPackets = 6;
    chooser.mMouseVisible = false;
    std::ofstream log(ModernSmoke::ProbePath("chooser-timing-cases.txt"));
    Require(bool(log), "Cannot write chooser timing evidence");
    unsigned constructions = 0, initWrong = 0, cases = 0, frameChecks = 0, wrong = 0;
    for (unsigned char poison : {0x00, 0x7f, 0xa5, 0xff}) {
        alignas(SeedChooserScreen) std::array<unsigned char, sizeof(SeedChooserScreen)> storage;
        storage.fill(poison);
        auto* made = ::new (static_cast<void*>(storage.data())) SeedChooserScreen;
        std::uint32_t age;
        std::memcpy(&age, &made->mSeedChooserAge, sizeof(age));
        ++constructions; initWrong += age != 0;
        log << "constructor poison=" << unsigned(poison) << " age-bits=" << age << '\n';
        made->~SeedChooserScreen();
    }
    const auto reset = [&](std::uint32_t origin) {
        std::copy(restore.seeds.begin(), restore.seeds.end(), std::begin(chooser.mChosenSeeds));
        chooser.mSeedsInBank = 0; chooser.mSeedsInFlight = 0;
        std::memcpy(&chooser.mSeedChooserAge, &origin, sizeof(origin));
    };
    const auto describe = [&](SeedType seed, int ticks, ChosenSeedState final) {
        const auto& s = chooser.mChosenSeeds[seed];
        return Flight{seed, s.mStartX, s.mStartY, s.mEndX, s.mEndY, ticks, final};
    };
    const auto run = [&](std::uint32_t origin, const char* name, std::initializer_list<Flight> flights, int bank) {
        const auto before = wrong;
        for (int tick = 1; tick <= 25; ++tick) {
            chooser.Update();
            unsigned expectedFlying = 0;
            for (const auto& f : flights) {
                const auto& s = chooser.mChosenSeeds[f.seed];
                const bool landed = tick >= f.duration;
                const auto expectedState = landed ? f.finalState : f.finalState == SEED_IN_BANK ?
                    SEED_FLYING_TO_BANK : SEED_FLYING_TO_CHOOSER;
                const int x = TodAnimateCurve(0, f.duration, tick, f.sx, f.ex, Curves::EaseInOut);
                const int y = TodAnimateCurve(0, f.duration, tick, f.sy, f.ey, Curves::EaseInOut);
                ++frameChecks; wrong += s.mX != x || s.mY != y || s.mSeedState != expectedState;
                expectedFlying += !landed;
            }
            wrong += chooser.mSeedsInFlight != int(expectedFlying) || chooser.mSeedsInBank != bank;
        }
        ++cases;
        log << "flight origin=" << origin << " route=" << name << " wrong=" << wrong - before << std::endl;
    };
    for (std::uint32_t origin : {0u, 17u, 0x7fffffe0u, 0x7ffffff5u, 0x7fffffffu,
                                0xffffffe0u, 0xfffffff5u, 0xffffffffu}) {
        reset(origin);
        chooser.ClickedSeedInChooser(chooser.mChosenSeeds[SEED_PEASHOOTER]);
        run(origin, "to-bank", {describe(SEED_PEASHOOTER, 25, SEED_IN_BANK)}, 1);
        std::memcpy(&chooser.mSeedChooserAge, &origin, sizeof(origin));
        chooser.ClickedSeedInBank(chooser.mChosenSeeds[SEED_PEASHOOTER]);
        run(origin, "to-chooser", {describe(SEED_PEASHOOTER, 25, SEED_IN_CHOOSER)}, 0);
        reset(origin);
        for (auto seed : {SEED_PEASHOOTER, SEED_SUNFLOWER, SEED_CHERRYBOMB}) {
            chooser.ClickedSeedInChooser(chooser.mChosenSeeds[seed]);
            chooser.LandFlyingSeed(chooser.mChosenSeeds[seed]);
        }
        chooser.ClickedSeedInBank(chooser.mChosenSeeds[SEED_PEASHOOTER]);
        run(origin, "close-gap", {describe(SEED_PEASHOOTER, 25, SEED_IN_CHOOSER),
            describe(SEED_SUNFLOWER, 15, SEED_IN_BANK), describe(SEED_CHERRYBOMB, 15, SEED_IN_BANK)}, 2);
        wrong += chooser.mChosenSeeds[SEED_SUNFLOWER].mSeedIndexInBank != 0 ||
            chooser.mChosenSeeds[SEED_CHERRYBOMB].mSeedIndexInBank != 1;
    }
    log << "constructions=" << constructions << " init-wrong=" << initWrong << " flight-cases=" << cases
        << " frame-checks=" << frameChecks << " timing-wrong=" << wrong << std::endl;
    Require(constructions == 4 && cases == 24 && frameChecks == 1000 && initWrong == 0 && wrong == 0,
        "Chooser clock uninitialized or 15/25-tick flight crossed signed/wrap boundary incorrectly");
    ModernSmoke::Report("portable-chooser-four-poison-24-flights-1000-frames", app);
}
