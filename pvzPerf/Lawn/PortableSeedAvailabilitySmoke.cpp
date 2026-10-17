#include "PortableFixesSmoke.h"
#include "ModernVulkanSmoke.h"
#include "LawnApp.h"
#include "Board.h"
#include "SeedPacket.h"
#include "System/PlayerInfo.h"
#include "Widget/SeedChooserScreen.h"
#include "Widget/GameButton.h"
#include "Resources.h"
#include "graphics/ImageFont.h"
#include <algorithm>
#include <array>
#include <fstream>
#include <memory>
#include <stdexcept>

namespace {
void Require(bool value, const char* message) { if (!value) throw std::runtime_error(message); }
int OriginalSeedCount(int level, int finished) {
    // 1073 00456F90, independent of LawnApp::GetSeedsAvailable.
    if (finished > 0 || level > 50) return 49;
    const int sub = (level - 1) % 10 + 1;
    return std::min(40, (level - 1) / 10 * 8 + sub - (sub >= 10 ? 2 : sub >= 5 ? 1 : 0));
}
}

void PortableSeedAvailabilitySmoke(LawnApp& app) {
    Require(getenv("PVZ_MODERN_HIDDEN") && getenv("PVZ_APPDATA_DIR") && app.mBoard &&
        app.mSeedChooserScreen && !app.IsTrialStageLocked(), "Seed probe requires isolated full-game chooser");
    auto& chooser = *app.mSeedChooserScreen;
    Require(chooser.mMouseVisible && chooser.mSeedsInBank == 0 && chooser.mSeedsInFlight == 0 &&
        app.mBoard->mSeedBank->mNumPackets > 1, "Seed probe requires empty, ready chooser");
    for (auto* button : {chooser.mRandomButton, chooser.mViewLawnButton, chooser.mMenuButton,
         chooser.mStartButton, chooser.mAlmanacButton, chooser.mStoreButton, chooser.mImitaterButton})
        Require(!button->IsMouseOver(), "Seed probe would activate another chooser control");
    auto fixture = std::make_unique<PlayerInfo>();
    struct RestoreProfile { LawnApp& app; PlayerInfo* previous; ~RestoreProfile(){ app.mPlayerInfo = previous; } }
        restore{app, app.mPlayerInfo};
    app.mPlayerInfo = fixture.get();
    std::ofstream log(ModernSmoke::ProbePath("seed-availability.txt"));
    Require(bool(log), "Cannot write seed availability evidence");
    // 1073 0048E020 duplicates global 0072711C into the start button;
    // 00480140 binds that global to FONT_DWARVENTODCRAFT18YELLOW.
    const auto* startFont = dynamic_cast<const Sexy::ImageFont*>(chooser.mStartButton->mFont);
    const auto* originalFont = dynamic_cast<const Sexy::ImageFont*>(Sexy::FONT_DWARVENTODCRAFT18YELLOW);
    const bool originalStartFont = startFont && originalFont && startFont != originalFont &&
        startFont->mFontData == originalFont->mFontData && startFont->mPointSize == originalFont->mPointSize &&
        startFont->mScale == originalFont->mScale && startFont->mTagIds == originalFont->mTagIds;
    log << "start-button-original-18yellow-font-duplicate=" << originalStartFont << std::endl;
    Require(originalStartFont, "Seed chooser start button does not duplicate the 1073 yellow font");
    ModernSmoke::Report("portable-seed-chooser-original-start-button-font", app);
    static_assert(SEED_GATLINGPEA == 40 && SEED_IMITATER == 48 && STORE_ITEM_PLANT_GATLINGPEA == 0);
    unsigned cases = 0, wrong = 0, hitCases = 0, hitWrong = 0;
    const auto check = [&] {
        for (int seed = 0; seed < 49; ++seed) {
            // 00456FE0 handles 41..48 itself. Its callers branch separately
            // for 40: signed purchase > 0, with no progression fall-through.
            const bool rawExpected = seed >= 41 ? fixture->mPurchases[seed - 40] > 0 :
                seed < OriginalSeedCount(fixture->mLevel, fixture->mFinishedAdventure);
            const bool expected = seed == 40 ? fixture->mPurchases[0] > 0 : rawExpected;
            const auto type = static_cast<SeedType>(seed);
            const bool actual = app.SeedTypeAvailable(type), raw = app.HasSeedType(type);
            ++cases;
            if (actual != expected || raw != rawExpected) {
                ++wrong;
                log << "availability level=" << fixture->mLevel << " finished=" << fixture->mFinishedAdventure
                    << " seed=" << seed << " purchase=" << (seed >= 40 ? fixture->mPurchases[seed - 40] : 0)
                    << " actual=" << actual << " expected=" << expected << " raw=" << raw
                    << " raw-expected=" << rawExpected << '\n';
            }
            // Imitater is a separate button, not an ordinary visible packet.
            if (seed == 48) continue;
            const auto& cell = chooser.mChosenSeeds[seed];
            Require(cell.mSeedState == SEED_IN_CHOOSER, "Unexpected packet state in seed hit matrix");
            const auto hit = chooser.SeedHitTest(cell.mX + 10, cell.mY + 10);
            const auto expectedHit = expected ? type : SEED_NONE;
            ++hitCases;
            if (hit != expectedHit) {
                ++hitWrong;
                log << "hit level=" << fixture->mLevel << " finished=" << fixture->mFinishedAdventure
                    << " seed=" << seed << " hit=" << int(hit) << " expected=" << int(expectedHit) << '\n';
            }
        }
    };
    for (const auto& progress : std::array<std::array<int, 2>, 6>{{{1,0},{15,0},{40,0},{50,0},{1,1},{51,0}}}) {
        fixture->mLevel = progress[0]; fixture->mFinishedAdventure = progress[1];
        for (long purchased : {-1L, 0L, 1L, 2L}) {
            std::fill(std::begin(fixture->mPurchases), std::end(fixture->mPurchases), purchased);
            check();
        }
    }
    fixture->mLevel = 1; fixture->mFinishedAdventure = 1;
    for (int item = 0; item < 9; ++item) for (bool complement : {false, true}) {
        std::fill(std::begin(fixture->mPurchases), std::end(fixture->mPurchases), complement ? 1L : 0L);
        fixture->mPurchases[item] = complement ? 0 : 1;
        check();
    }

    // Actual chooser MouseDown -> hit test -> launch -> land -> deselect.
    // These are internal widget calls in a hidden process, never OS mouse input.
    auto& gatling = chooser.mChosenSeeds[SEED_GATLINGPEA];
    unsigned clicks = 0, clickWrong = 0;
    for (int finished : {0, 1}) for (long purchased : {0L, 1L}) {
        fixture->mLevel = 1; fixture->mFinishedAdventure = finished;
        std::fill(std::begin(fixture->mPurchases), std::end(fixture->mPurchases), 0L);
        fixture->mPurchases[0] = purchased;
        const int x = gatling.mX + 10, y = gatling.mY + 10;
        Require(app.mBoard->ZombieHitTest(x - app.mBoard->mX, y - app.mBoard->mY) == nullptr,
            "Seed click would open a zombie almanac dialog");
        chooser.MouseDown(x, y, 1);
        const bool selected = chooser.mSeedsInBank == 1 && chooser.mSeedsInFlight == 1 &&
            gatling.mSeedState == SEED_FLYING_TO_BANK;
        bool correct = selected == (purchased > 0);
        if (selected) {
            chooser.LandFlyingSeed(gatling);
            correct &= chooser.FindSeedInBank(0) == SEED_GATLINGPEA;
            chooser.ClickedSeedInBank(gatling);
            chooser.LandFlyingSeed(gatling);
        }
        correct &= chooser.mSeedsInBank == 0 && chooser.mSeedsInFlight == 0 && gatling.mSeedState == SEED_IN_CHOOSER;
        ++clicks; clickWrong += !correct;
        log << "click finished=" << finished << " purchased=" << purchased << " selected=" << selected
            << " returned-empty=" << (chooser.mSeedsInBank == 0) << " pass=" << correct << '\n';
    }
    log << "availability-cases=" << cases << " wrong=" << wrong << " hit-cases=" << hitCases
        << " hit-wrong=" << hitWrong << " click-cases=" << clicks << " click-wrong=" << clickWrong << std::endl;
    Require(wrong == 0 && hitWrong == 0 && clickWrong == 0,
        "Unpurchased Gatling progression fall-through; see seed-availability.txt");
    ModernSmoke::Report("portable-seed-2058-availability-2016-hit-four-click-cases", app);
}
