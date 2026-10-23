// Controller fixture compiled with the production StartBurst/UpdateMusicBurst
// definitions by tools/native-tests/test_music_burst.py. Playback and the board
// are deterministic doubles; timer storage and all controller code are real.
#include "Lawn/System/Music.h"
#include <algorithm>
#include <array>
#include <iostream>
#include <memory>
#include <stdexcept>
#include <type_traits>

static_assert(std::is_same_v<decltype(Music::mBaseBPM), float>);
static_assert(std::is_same_v<decltype(Music::mBaseModSpeed), float>);

enum class GameMode { GAMEMODE_ADVENTURE, GAMEMODE_INTRO };
class Board
{
public:
    int zombies = 10;
    int CountZombiesOnScreen() const { return zombies; }
};
class LawnApp
{
public:
    Board* mBoard = nullptr;
    GameMode mGameMode = GameMode::GAMEMODE_ADVENTURE;
};
namespace Sexy
{
class MusicInterface
{
public:
    std::array<double, 6> volume{};
    void SetSongVolume(int file, double gain) { volume.at(file) = gain; }
};
struct TestPlayback
{
    int order = -1;
    int seeks = 0;
    void Seek(unsigned long long position, unsigned)
    {
        order = static_cast<int>(position);
        ++seeks;
    }
};
struct TestSlot { TestPlayback mPlayback; };
class BassMusicInterface : public MusicInterface
{
public:
    std::array<std::unique_ptr<TestSlot>, 6> mMusicSlots;
    BassMusicInterface()
    {
        for (auto& slot : mMusicSlots) slot = std::make_unique<TestSlot>();
    }
};
}
namespace Curves { inline constexpr int Linear = 0; }
float TodAnimateCurveFloat(int start, int end, int age, float first, float last, int)
{
    return first + (last - first) * std::clamp(float(age - start) / float(end - start), 0.0f, 1.0f);
}
static unsigned currentOrder = 48;
unsigned Music::GetMusicOrder(MusicFile) { return currentOrder; }
Music::Music()
{
    mCurMusicTune = MUSIC_TUNE_NIGHT_MOONGRAINS;
    mCurMusicFileMain = MUSIC_FILE_MAIN_MUSIC;
    mCurMusicFileDrums = MUSIC_FILE_DRUMS;
    mCurMusicFileHihats = MUSIC_FILE_HIHATS;
    mBurstOverride = -1;
    mMusicBurstState = MUSIC_BURST_OFF;
    mMusicDrumsState = MUSIC_DRUMS_OFF;
    mBurstStateCounter = 0;
    mDrumsStateCounter = 0;
    mQueuedDrumTrackPackedOrder = -1;
}

// The runner appends production controller definitions here.
