// bench09_zaction - 目标9: Zombie::UpdateActions 类型段 20 连独立 if -> kZombieTypeActions[36] static 函数指针表
// FormA = 9c008851^ 原链逐字（20 个独立 if 全链比较）；FormB = 当前 HEAD（命名 lambda + static 表 + 边界守卫）逐字。
// 账本旧数（成员函数指针表时代，函数内裸表）：7.44 -> 4.65（-38%）。
#include "bench_common.h"

enum ZombieType
{
    ZOMBIE_NORMAL = 0, ZOMBIE_FLAG, ZOMBIE_TRAFFIC_CONE, ZOMBIE_POLEVAULTER, ZOMBIE_PAIL,
    ZOMBIE_NEWSPAPER, ZOMBIE_DOOR, ZOMBIE_FOOTBALL, ZOMBIE_DANCER, ZOMBIE_BACKUP_DANCER,
    ZOMBIE_DUCKY_TUBE, ZOMBIE_SNORKEL, ZOMBIE_ZAMBONI, ZOMBIE_BOBSLED, ZOMBIE_DOLPHIN_RIDER,
    ZOMBIE_JACK_IN_THE_BOX, ZOMBIE_BALLOON, ZOMBIE_DIGGER, ZOMBIE_POGO, ZOMBIE_YETI,
    ZOMBIE_BUNGEE, ZOMBIE_LADDER, ZOMBIE_CATAPULT, ZOMBIE_GARGANTUAR, ZOMBIE_IMP,
    ZOMBIE_BOSS, ZOMBIE_PEA_HEAD, ZOMBIE_WALLNUT_HEAD, ZOMBIE_JALAPENO_HEAD, ZOMBIE_GATLING_HEAD,
    ZOMBIE_SQUASH_HEAD, ZOMBIE_TALLNUT_HEAD, ZOMBIE_REDEYE_GARGANTUAR, ZOMBIE_ZOMBATAR,
    NUM_ZOMBIE_TYPES,
    ZOMBIE_CACHED_POLEVAULTER_WITH_POLE = 35
};

// ---- 桩：各专属动作空桩（编号入 checksum） ----
struct Zombie
{
    ZombieType mZombieType;

    void UpdateZombiePolevaulter()    { Mix(0x6001u); }
    void UpdateZombieCatapult()       { Mix(0x6002u); }
    void UpdateZombieDolphinRider()   { Mix(0x6003u); }
    void UpdateZombieSnorkel()        { Mix(0x6004u); }
    void UpdateZombieFlyer()          { Mix(0x6005u); }
    void UpdateZombieNewspaper()      { Mix(0x6006u); }
    void UpdateZombieDigger()         { Mix(0x6007u); }
    void UpdateZombieJackInTheBox()   { Mix(0x6008u); }
    void UpdateZombieGargantuar()     { Mix(0x6009u); }
    void UpdateZombieBobsled()        { Mix(0x600Au); }
    void UpdateZamboni()              { Mix(0x600Bu); }
    void UpdateLadder()               { Mix(0x600Cu); }
    void UpdateYeti()                 { Mix(0x600Du); }
    void UpdateZombieDancer()         { Mix(0x600Eu); }
    void UpdateZombieBackupDancer()   { Mix(0x600Fu); }
    void UpdateZombieImp()            { Mix(0x6010u); }
    void UpdateZombiePeaHead()        { Mix(0x6011u); }
    void UpdateZombieJalapenoHead()   { Mix(0x6012u); }
    void UpdateZombieGatlingHead()    { Mix(0x6013u); }
    void UpdateZombieSquashHead()     { Mix(0x6014u); }
};

// ---------------- FormA：原 20 连独立 if（9c008851^ 逐字，类型分派段） ----------------
__declspec(noinline) void OneA(uint32_t inp)
{
    Zombie z;
    z.mZombieType = (ZombieType)(inp % (uint32_t)NUM_ZOMBIE_TYPES);
    Zombie* this_ = &z;

    if (z.mZombieType == ZombieType::ZOMBIE_POLEVAULTER)
    {
        this_->UpdateZombiePolevaulter();
    }
    if (z.mZombieType == ZombieType::ZOMBIE_CATAPULT)
    {
        this_->UpdateZombieCatapult();
    }
    if (z.mZombieType == ZombieType::ZOMBIE_DOLPHIN_RIDER)
    {
        this_->UpdateZombieDolphinRider();
    }
    if (z.mZombieType == ZombieType::ZOMBIE_SNORKEL)
    {
        this_->UpdateZombieSnorkel();
    }
    if (z.mZombieType == ZombieType::ZOMBIE_BALLOON)
    {
        this_->UpdateZombieFlyer();
    }
    if (z.mZombieType == ZombieType::ZOMBIE_NEWSPAPER)
    {
        this_->UpdateZombieNewspaper();
    }
    if (z.mZombieType == ZombieType::ZOMBIE_DIGGER)
    {
        this_->UpdateZombieDigger();
    }
    if (z.mZombieType == ZombieType::ZOMBIE_JACK_IN_THE_BOX)
    {
        this_->UpdateZombieJackInTheBox();
    }
    if (z.mZombieType == ZombieType::ZOMBIE_GARGANTUAR || z.mZombieType == ZombieType::ZOMBIE_REDEYE_GARGANTUAR)
    {
        this_->UpdateZombieGargantuar();
    }
    if (z.mZombieType == ZombieType::ZOMBIE_BOBSLED)
    {
        this_->UpdateZombieBobsled();
    }
    if (z.mZombieType == ZombieType::ZOMBIE_ZAMBONI)
    {
        this_->UpdateZamboni();
    }
    if (z.mZombieType == ZombieType::ZOMBIE_LADDER)
    {
        this_->UpdateLadder();
    }
    if (z.mZombieType == ZombieType::ZOMBIE_YETI)
    {
        this_->UpdateYeti();
    }
    if (z.mZombieType == ZombieType::ZOMBIE_DANCER)
    {
        this_->UpdateZombieDancer();
    }
    if (z.mZombieType == ZombieType::ZOMBIE_BACKUP_DANCER)
    {
        this_->UpdateZombieBackupDancer();
    }
    if (z.mZombieType == ZombieType::ZOMBIE_IMP)
    {
        this_->UpdateZombieImp();
    }
    if (z.mZombieType == ZombieType::ZOMBIE_PEA_HEAD)
    {
        this_->UpdateZombiePeaHead();
    }
    if (z.mZombieType == ZombieType::ZOMBIE_JALAPENO_HEAD)
    {
        this_->UpdateZombieJalapenoHead();
    }
    if (z.mZombieType == ZombieType::ZOMBIE_GATLING_HEAD)
    {
        this_->UpdateZombieGatlingHead();
    }
    if (z.mZombieType == ZombieType::ZOMBIE_SQUASH_HEAD)
    {
        this_->UpdateZombieSquashHead();
    }
}

// ---------------- FormB：当前 HEAD（static 函数指针表逐字） ----------------
__declspec(noinline) void OneB(uint32_t inp)
{
    Zombie z;
    z.mZombieType = (ZombieType)(inp % (uint32_t)NUM_ZOMBIE_TYPES);
    Zombie* this_ = &z;

    static constexpr auto kGargantuarUpdate = [](Zombie* z) { z->UpdateZombieGargantuar(); };
    static constexpr void (*kZombieTypeActions[])(Zombie*) = {
        /*  0 ZOMBIE_NORMAL                    */ nullptr,
        /*  1 ZOMBIE_FLAG                      */ nullptr,
        /*  2 ZOMBIE_TRAFFIC_CONE              */ nullptr,
        /*  3 ZOMBIE_POLEVAULTER               */ [](Zombie* z) { z->UpdateZombiePolevaulter(); },
        /*  4 ZOMBIE_PAIL                      */ nullptr,
        /*  5 ZOMBIE_NEWSPAPER                 */ [](Zombie* z) { z->UpdateZombieNewspaper(); },
        /*  6 ZOMBIE_DOOR                      */ nullptr,
        /*  7 ZOMBIE_FOOTBALL                  */ nullptr,
        /*  8 ZOMBIE_DANCER                    */ [](Zombie* z) { z->UpdateZombieDancer(); },
        /*  9 ZOMBIE_BACKUP_DANCER             */ [](Zombie* z) { z->UpdateZombieBackupDancer(); },
        /* 10 ZOMBIE_DUCKY_TUBE                */ nullptr,
        /* 11 ZOMBIE_SNORKEL                   */ [](Zombie* z) { z->UpdateZombieSnorkel(); },
        /* 12 ZOMBIE_ZAMBONI                   */ [](Zombie* z) { z->UpdateZamboni(); },
        /* 13 ZOMBIE_BOBSLED                   */ [](Zombie* z) { z->UpdateZombieBobsled(); },
        /* 14 ZOMBIE_DOLPHIN_RIDER             */ [](Zombie* z) { z->UpdateZombieDolphinRider(); },
        /* 15 ZOMBIE_JACK_IN_THE_BOX           */ [](Zombie* z) { z->UpdateZombieJackInTheBox(); },
        /* 16 ZOMBIE_BALLOON                   */ [](Zombie* z) { z->UpdateZombieFlyer(); },
        /* 17 ZOMBIE_DIGGER                    */ [](Zombie* z) { z->UpdateZombieDigger(); },
        /* 18 ZOMBIE_POGO                      */ nullptr,
        /* 19 ZOMBIE_YETI                      */ [](Zombie* z) { z->UpdateYeti(); },
        /* 20 ZOMBIE_BUNGEE                    */ nullptr,
        /* 21 ZOMBIE_LADDER                    */ [](Zombie* z) { z->UpdateLadder(); },
        /* 22 ZOMBIE_CATAPULT                  */ [](Zombie* z) { z->UpdateZombieCatapult(); },
        /* 23 ZOMBIE_GARGANTUAR                */ kGargantuarUpdate,
        /* 24 ZOMBIE_IMP                       */ [](Zombie* z) { z->UpdateZombieImp(); },
        /* 25 ZOMBIE_BOSS                      */ nullptr,
        /* 26 ZOMBIE_PEA_HEAD                  */ [](Zombie* z) { z->UpdateZombiePeaHead(); },
        /* 27 ZOMBIE_WALLNUT_HEAD              */ nullptr,
        /* 28 ZOMBIE_JALAPENO_HEAD             */ [](Zombie* z) { z->UpdateZombieJalapenoHead(); },
        /* 29 ZOMBIE_GATLING_HEAD              */ [](Zombie* z) { z->UpdateZombieGatlingHead(); },
        /* 30 ZOMBIE_SQUASH_HEAD               */ [](Zombie* z) { z->UpdateZombieSquashHead(); },
        /* 31 ZOMBIE_TALLNUT_HEAD              */ nullptr,
        /* 32 ZOMBIE_REDEYE_GARGANTUAR         */ kGargantuarUpdate,
        /* 33 ZOMBIE_ZOMBATAR                  */ nullptr,
        /* 34 NUM_ZOMBIE_TYPES 哨兵位          */ nullptr,
        /* 35 ZOMBIE_CACHED_POLEVAULTER_WITH_POLE */ nullptr,
    };
    static_assert(sizeof(kZombieTypeActions) / sizeof(kZombieTypeActions[0]) == (int)ZombieType::ZOMBIE_CACHED_POLEVAULTER_WITH_POLE + 1,
        "专属动作槽位须与 ZombieType 枚举（含缓存段）同步");
    if ((unsigned)z.mZombieType < sizeof(kZombieTypeActions) / sizeof(kZombieTypeActions[0]))
    {
        if (void (*aAction)(Zombie*) = kZombieTypeActions[z.mZombieType])
        {
            aAction(this_);
        }
    }
}

static void RunA() { for (int i = 0; i < kN; i++) OneA(gInput[i]); }
static void RunB() { for (int i = 0; i < kN; i++) OneB(gInput[i]); }

int main()
{
    GenInput();
    uint64_t ca = CheckOnly(RunA);
    uint64_t cb = CheckOnly(RunB);
    double a = TimePerIterNs(RunA, kN);
    double b = TimePerIterNs(RunB, kN);
    printf("bench09 kZombieTypeActions | before %.2f ns | after %.2f ns | diff %.1f%% | checksum=%s (%016llX/%016llX)\n",
        a, b, (a - b) / a * 100.0, ca == cb ? "OK" : "MISMATCH", (unsigned long long)ca, (unsigned long long)cb);
    return ca == cb ? 0 : 1;
}
