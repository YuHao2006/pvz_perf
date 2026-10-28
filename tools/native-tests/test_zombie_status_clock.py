"""Compile production zombie status deadline/age math against deterministic clocks."""
from pathlib import Path
import os
import subprocess
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[2]


def definition(source, name):
    start = source.index(name)
    opening = source.index("{", start)
    depth, end = 1, opening + 1
    while depth:
        depth += (source[end] == "{") - (source[end] == "}")
        end += 1
    return source[start:end]


class ZombieStatusClockTests(unittest.TestCase):
    def test_production_deadlines(self):
        production = (ROOT / "pvzPerf/Lawn/Zombie.cpp").read_text(encoding="utf-8")
        expiry_start = production.index("    if (mIceTrapEndTimeNs != 0 && aStatusNowNs >= mIceTrapEndTimeNs)")
        expiry_end = production.index("    if (mZombiePhase ==", expiry_start)
        freeze_start = production.index("    const auto statusStepNs =")
        freeze_end = production.index("\n}", freeze_start)
        source = r'''
#include <algorithm>
#include <cstdint>
#include <stdexcept>
namespace Sexy { unsigned long long gUpdateIntervalNs = 10'000'000; }
enum class ReanimTimeDomain { Battle, Visual };
namespace FoleyType { constexpr int FOLEY_FROZEN = 1; }
namespace ParticleEffect { constexpr int PARTICLE_ICE_TRAP_RELEASE = 1; }
struct Clock { std::int64_t mVisualTimeNs = 0; };
struct Effect { Clock* mReanimationHolder; };
struct Board {
    unsigned long long mLevelTimeNs = 0;
    int mTimeStopCounter = 0;
    ReanimTimeDomain domain = ReanimTimeDomain::Battle;
    ReanimTimeDomain AnimationTimeDomain() { return domain; }
};
struct App {
    Effect* mEffectSystem;
    int sounds = 0;
    void PlayFoley(int) { ++sounds; }
};
class Zombie {
public:
    Board* mBoard;
    App* mApp;
    bool onboard = true, mYuckyFace = false;
    std::int64_t mShotFlashEndTimeNs = 0, mShieldFlashEndTimeNs = 0, mShieldRecoilEndTimeNs = 0;
    std::int64_t mFadeEndTimeNs = -1, mYuckyFaceStartTimeNs = 0;
    std::int64_t mChilledEndTimeNs = 0, mButteredEndTimeNs = 0, mIceTrapEndTimeNs = 0;
    int animationUpdates = 0, iceReleases = 0, butterReleases = 0, particles = 0;
    bool IsOnBoard() { return onboard; }
    bool CanBeChilled() { return true; }
    void UpdateAnimSpeed() { ++animationUpdates; }
    void RemoveIceTrap() { ++iceReleases; }
    void RemoveButter() { ++butterReleases; }
    void AddAttachedParticle(int,int,int) { ++particles; }
    bool IsImmobilizied();
    void ApplyChill(bool);
    void Expire();
    void FreezeSkipped(bool playingUpdated, bool doUpdate, bool animated);
};
'''
        source += definition(production, "bool ZombieAgeCrossedPeriod(") + "\n"
        source += definition(production, "bool ZombieAgeCrossedPoint(") + "\n"
        source += definition(production, "bool Zombie::IsImmobilizied(") + "\n"
        source += definition(production, "void Zombie::ApplyChill(") + "\n"
        source += "void Zombie::Expire() { const auto aStatusNowNs = onboard ? std::int64_t(mBoard->mLevelTimeNs) : mApp->mEffectSystem->mReanimationHolder->mVisualTimeNs;\n"
        source += production[expiry_start:expiry_end] + "}\n"
        source += "void Zombie::FreezeSkipped(bool playingUpdated, bool doUpdate, bool animated) {\n" + production[freeze_start:freeze_end] + "}\n"
        source += r'''
void Require(bool value, const char* message) { if(!value) throw std::runtime_error(message); }
int main() {
    Clock clock; Effect effect{&clock}; App app{&effect}; Board board;
    board.mLevelTimeNs = 50'000'000'000;
    Zombie z; z.mBoard=&board; z.mApp=&app;
    z.ApplyChill(false);
    Require(z.mChilledEndTimeNs == 60'000'000'000 && app.sounds == 1, "chill did not bind to level time");
    board.mLevelTimeNs += 3'000'000'000;
    z.ApplyChill(true);
    Require(z.mChilledEndTimeNs == 73'000'000'000 && app.sounds == 1, "chill extension/sound edge changed");
    z.mIceTrapEndTimeNs = board.mLevelTimeNs + 7;
    z.mButteredEndTimeNs = board.mLevelTimeNs + 13;
    Require(z.IsImmobilizied(), "active immobilization missing");
    board.mLevelTimeNs += 20;
    z.Expire(); z.Expire();
    Require(z.mIceTrapEndTimeNs == 0 && z.mButteredEndTimeNs == 0 &&
        z.iceReleases == 1 && z.butterReleases == 1 && z.particles == 1,
        "skipped deadline did not consume expiry exactly once");
    Require(!z.IsImmobilizied(), "expired immobilization remained active");
    z.mShotFlashEndTimeNs = board.mLevelTimeNs - 6'000'000'000;
    const auto hungerRemaining = z.mShotFlashEndTimeNs - std::int64_t(board.mLevelTimeNs);
    z.mYuckyFace=true; z.mYuckyFaceStartTimeNs=10;
    z.FreezeSkipped(false,false,false);
    Require(z.mShotFlashEndTimeNs - std::int64_t(board.mLevelTimeNs) == hungerRemaining + 10'000'000 &&
        z.mYuckyFaceStartTimeNs == 10+10'000'000, "conditional pause did not shift signed hit/face origins");
    board.domain=ReanimTimeDomain::Visual;
    const auto frozen=z.mShotFlashEndTimeNs;
    z.FreezeSkipped(false,false,false);
    Require(z.mShotFlashEndTimeNs == frozen, "stopped battle clock shifted origins anyway");
    z.onboard=false; clock.mVisualTimeNs=100'000'000'000;
    z.mChilledEndTimeNs=0; z.ApplyChill(false);
    Require(z.mChilledEndTimeNs==110'000'000'000, "preview status used frozen battle time");
    Require(ZombieAgeCrossedPeriod(1'000'000'001,5,1'000'000'000) &&
        !ZombieAgeCrossedPeriod(1'000'000'002,1,1'000'000'000), "age period crossing repeated or skipped");
    Require(ZombieAgeCrossedPoint(700'000'001,5,700'000'000) &&
        !ZombieAgeCrossedPoint(700'000'002,1,700'000'000), "face event crossing repeated or skipped");
}
'''
        toolset = Path("C:/UserProgram/Visual Studuio/2026/Community/VC/Tools/MSVC/14.51.36231")
        vcvars = toolset.parents[2] / "Auxiliary/Build/vcvars64.bat"
        if not vcvars.exists():
            vcvars=Path("C:/UserProgram/Visual Studuio/2026/Community/VC/Auxiliary/Build/vcvars64.bat")
        if not vcvars.exists(): self.skipTest("MSVC is required")
        with tempfile.TemporaryDirectory(prefix="pvz-zombie-status-") as temp:
            src=Path(temp)/"status.cpp";exe=Path(temp)/"status.exe";src.write_text(source,encoding="utf-8")
            build=(f'call "{vcvars}" >nul && set "INCLUDE={toolset}/include;!INCLUDE!" && '
                f'set "LIB={toolset}/lib/x64;!LIB!" && "{toolset}/bin/Hostx64/x64/cl.exe" /nologo /EHsc /std:c++20 '
                f'"{src}" /Fo"{temp}/status.obj" /Fe"{exe}"')
            cmd=f'"{os.environ.get("COMSPEC","cmd.exe")}" /d /v:on /s /c "{build}"'
            subprocess.run(cmd,cwd=temp,check=True)
            subprocess.run([str(exe)],cwd=temp,check=True)


if __name__ == "__main__": unittest.main()
