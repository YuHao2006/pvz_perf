#include "PortableFixesSmoke.h"
#include "ModernVulkanSmoke.h"
#include "LawnApp.h"
#include "Board.h"
#include "Zombie.h"
#include "Projectile.h"
#include "Sexy.TodLib/EffectSystem.h"
#include "Sexy.TodLib/TodParticle.h"
#include "Sexy.TodLib/Reanimator.h"
#include <array>
#include <cmath>
#include <fstream>
#include <stdexcept>
#include <utility>
#include <vector>

namespace {
void Require(bool ok, const char* message) { if (!ok) throw std::runtime_error(message); }

void SplashCases(LawnApp& app, std::ostream& log) {
    auto& board = *app.mBoard;
    const auto baseline = board.mZombies.mSize;
    auto* target = board.AddZombieInRow(ZOMBIE_NORMAL, 0, 0);
    Require(target, "Cannot allocate splash predicate fixture");
    Projectile projectile;
    projectile.mAttachmentID = ATTACHMENTID_NULL;
    unsigned cases = 0, wrong = 0, flagCases = 0, flagWrong = 0, oldWrong = 0;
    // Independent numeric predicates recovered from 1073 004718A0/004718E0.
    // Re-tag one real object without ticking it: this is a predicate/flag test,
    // not a claim to have played every zombie type or tested splash hit geometry.
    for (int type = 0; type < NUM_PROJECTILES; ++type)
    for (int zombie = -1; zombie < NUM_ZOMBIE_TYPES; ++zombie)
    for (int shield = 0; shield < 4; ++shield) {
        if (zombie == -1 && shield != 0) continue;
        target->mZombieType = static_cast<ZombieType>(zombie < 0 ? 0 : zombie);
        target->mShieldType = static_cast<ShieldType>(shield);
        auto* hit = zombie < 0 ? nullptr : target;
        projectile.mProjectileType = static_cast<ProjectileType>(type);
        const bool resistant = hit && (zombie == 22 || zombie == 12 || shield == 1 || shield == 3);
        const bool expected = type == 3 || type == 5 || (type == 6 && !resistant);
        const bool actual = projectile.IsSplashDamage(hit);
        ++cases; wrong += actual != expected;
        const bool oldResult = type != 0 && resistant ? false : type == 3 || type == 5 || type == 6;
        oldWrong += oldResult != expected;
        for (int motion = 0; motion <= 7; ++motion) for (float vx : {-1.0f, 0.0f, 1.0f}) {
            projectile.mMotionType = static_cast<ProjectileMotion>(motion);
            projectile.mVelX = vx;
            unsigned flags = expected ? 2u : (motion == 1 || motion == 6 || (motion == 7 && vx < 0)) ? 1u : 0u;
            if (type == 1 || type == 5) flags |= 4u;
            ++flagCases; flagWrong += projectile.GetDamageFlags(hit) != flags;
        }
    }
    target->mZombieType = ZOMBIE_NORMAL; target->mShieldType = SHIELDTYPE_NONE;
    target->DieNoLoot(); board.ProcessDeleteQueue(); app.mEffectSystem->ProcessDeleteQueue();
    log << "splash-cases=" << cases << " wrong=" << wrong << " flags=" << flagCases
        << " flag-wrong=" << flagWrong << " old-expression-wrong=" << oldWrong << std::endl;
    Require(cases == NUM_PROJECTILES * (NUM_ZOMBIE_TYPES * 4 + 1) && flagCases == cases * 24 &&
        wrong == 0 && flagWrong == 0 && oldWrong > 0 && board.mZombies.mSize == baseline,
        "Splash/flags differ from 1073 or fixture leaked a zombie");
    ModernSmoke::Report("portable-splash-all-types-shields-null-and-24-motion-flags", app);
}

void FreezeCases(LawnApp& app, std::ostream& log) {
    auto& board = *app.mBoard;
    auto& holder = *app.mEffectSystem->mParticleHolder;
    const auto systemsBefore = holder.mParticleSystems.mSize;
    const auto emittersBefore = holder.mEmitters.mSize;
    const auto particlesBefore = holder.mParticles.mSize;
    const auto reanimsBefore = app.mEffectSystem->mReanimationHolder->mReanimations.mSize;
    struct Restore {
        Board& board;
        int ice;
        std::vector<std::pair<TodParticleSystem*, bool>> particles;
        std::vector<std::pair<Reanimation*, float>> reanims;
        ~Restore() {
            board.mIceTrapCounter = ice;
            for (auto [p, value] : particles) p->mDontUpdate = value;
            for (auto [r, value] : reanims) r->mAnimRate = value;
        }
    } restore{board, board.mIceTrapCounter};
    TodParticleSystem* p = nullptr;
    while (board.IterateParticles(p)) restore.particles.emplace_back(p, p->mDontUpdate);
    Reanimation* r = nullptr;
    while (board.IterateReanimations(r)) restore.reanims.emplace_back(r, r->mAnimRate);
    const std::array effects{PARTICLE_GRAVE_BUSTER, PARTICLE_POOL_SPARKLY, PARTICLE_MELONSPLASH};
    std::array<TodParticleSystem*, 3> samples{};
    for (size_t i = 0; i < samples.size(); ++i) {
        samples[i] = app.AddTodParticle(100, 100, 0, effects[i]);
        Require(samples[i], "Cannot allocate cutscene particle fixture");
    }
    auto* sleeping = app.AddReanimation(100, 100, 0, REANIM_SLEEPING);
    auto* other = app.AddReanimation(100, 100, 0, REANIM_PEASHOOTER);
    Require(sleeping && other, "Cannot allocate cutscene animation fixture");
    unsigned cases = 0, wrong = 0, oldWrong = 0, rates = 0, rateWrong = 0;
    // Original 0040D560: 0x18 always; 0x22 only when ice counter == 0;
    // all other live particles retain their preexisting flag. Dead entries skip.
    static_assert(PARTICLE_GRAVE_BUSTER == 0x18 && PARTICLE_POOL_SPARKLY == 0x22 && REANIM_SLEEPING == 0x44);
    for (int ice : {0, 1, 100, -1}) for (bool freeze : {false, true})
    for (bool initial : {false, true}) for (bool dead : {false, true}) {
        board.mIceTrapCounter = ice;
        for (auto* sample : samples) { sample->mDontUpdate = initial; sample->mDead = dead; }
        sleeping->mDead = dead; sleeping->mAnimRate = 11.0f;
        other->mDead = dead; other->mAnimRate = 13.0f;
        board.FreezeEffectsForCutscene(freeze);
        for (size_t i = 0; i < samples.size(); ++i) {
            const bool expected = !dead && (i == 0 || (i == 1 && ice == 0)) ? freeze : initial;
            ++cases; wrong += samples[i]->mDontUpdate != expected;
            oldWrong += initial != expected; // Old impossible nested condition never writes.
        }
        const float rate = sleeping->mAnimRate;
        const bool sleepOK = dead ? rate == 11 : freeze ? rate == 0 : std::isfinite(rate) && rate >= 6 && rate <= 8;
        rates += 2; rateWrong += !sleepOK; rateWrong += other->mAnimRate != 13;
    }
    for (auto* sample : samples) { sample->mDead = false; sample->ParticleSystemDie(); }
    sleeping->mDead = false; sleeping->ReanimationDie();
    other->mDead = false; other->ReanimationDie();
    app.mEffectSystem->ProcessDeleteQueue();
    log << "freeze-cases=" << cases << " wrong=" << wrong << " old-nested-wrong=" << oldWrong
        << " animation-rates=" << rates << " rate-wrong=" << rateWrong << std::endl;
    Require(cases == 96 && rates == 64 && wrong == 0 && rateWrong == 0 && oldWrong > 0 &&
        holder.mParticleSystems.mSize == systemsBefore && holder.mEmitters.mSize == emittersBefore &&
        holder.mParticles.mSize == particlesBefore &&
        app.mEffectSystem->mReanimationHolder->mReanimations.mSize == reanimsBefore,
        "Cutscene freeze/rates differ from 1073 or effect pools did not return to baseline");
    ModernSmoke::Report("portable-cutscene-96-particle-flags-64-animation-rates", app);
}
}

void PortableSplashFreezeSmoke(LawnApp& app) {
    Require(getenv("PVZ_MODERN_HIDDEN") && getenv("PVZ_APPDATA_DIR") && app.mBoard,
        "Splash/freeze regression requires an isolated hidden board");
    app.mBoard->ProcessDeleteQueue(); app.mEffectSystem->ProcessDeleteQueue();
    std::ofstream log(ModernSmoke::ProbePath("splash-freeze-cases.txt"));
    Require(bool(log), "Cannot write splash/freeze evidence");
    SplashCases(app, log);
    FreezeCases(app, log);
}
