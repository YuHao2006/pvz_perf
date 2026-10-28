// bench08_seedupdate - 目标8: Plant::UpdateAbilities 类型段 22 支 else-if 阶梯 -> kSeedTypeUpdates[53] static 函数指针表
// FormA = 9c008851^ 原链逐字；FormB = 当前 HEAD（命名 lambda 复用 + static 表 + 空槽判断）逐字。
// 账本旧数（成员函数指针表时代，函数内裸表）：8.60 -> 4.26（-50%）。
#include "bench_common.h"

enum SeedType
{
    SEED_PEASHOOTER = 0, SEED_SUNFLOWER, SEED_CHERRYBOMB, SEED_WALLNUT, SEED_POTATOMINE,
    SEED_SNOWPEA, SEED_CHOMPER, SEED_REPEATER, SEED_PUFFSHROOM, SEED_SUNSHROOM,
    SEED_FUMESHROOM, SEED_GRAVEBUSTER, SEED_HYPNOSHROOM, SEED_SCAREDYSHROOM, SEED_ICESHROOM,
    SEED_DOOMSHROOM, SEED_LILYPAD, SEED_SQUASH, SEED_THREEPEATER, SEED_TANGLEKELP,
    SEED_JALAPENO, SEED_SPIKEWEED, SEED_TORCHWOOD, SEED_TALLNUT, SEED_SEASHROOM,
    SEED_PLANTERN, SEED_CACTUS, SEED_BLOVER, SEED_SPLITPEA, SEED_STARFRUIT,
    SEED_PUMPKINSHELL, SEED_MAGNETSHROOM, SEED_CABBAGEPULT, SEED_FLOWERPOT, SEED_KERNELPULT,
    SEED_INSTANT_COFFEE, SEED_GARLIC, SEED_UMBRELLA, SEED_MARIGOLD, SEED_MELONPULT,
    SEED_GATLINGPEA, SEED_TWINSUNFLOWER, SEED_GLOOMSHROOM, SEED_CATTAIL, SEED_WINTERMELON,
    SEED_GOLD_MAGNET, SEED_SPIKEROCK, SEED_COBCANNON, SEED_IMITATER, SEED_EXPLODE_O_NUT,
    SEED_GIANT_WALLNUT, SEED_SPROUT, SEED_LEFTPEATER,
    NUM_SEED_TYPES,
    SEED_NONE = -1
};
enum PlantSubClass { SUBCLASS_SHOOTER = 0, SUBCLASS_OTHER = 1 };

// ---- 桩：各专属更新空桩（编号入 checksum）+ UpdateShooter ----
struct Plant
{
    SeedType mSeedType;
    PlantSubClass mSubclass;

    bool MakesSun() { return mSeedType == SEED_SUNFLOWER || mSeedType == SEED_TWINSUNFLOWER; }

    void UpdateSquash()          { Mix(0x5001u); }
    void UpdateDoomShroom()      { Mix(0x5002u); }
    void UpdateIceShroom()       { Mix(0x5003u); }
    void UpdateChomper()         { Mix(0x5004u); }
    void UpdateBlover()          { Mix(0x5005u); }
    void UpdateFlowerPot()       { Mix(0x5006u); }
    void UpdateLilypad()         { Mix(0x5007u); }
    void UpdateImitater()        { Mix(0x5008u); }
    void UpdateCoffeeBean()      { Mix(0x5009u); }
    void UpdateUmbrella()        { Mix(0x500Au); }
    void UpdateCobCannon()       { Mix(0x500Bu); }
    void UpdateCactus()          { Mix(0x500Cu); }
    void UpdateMagnetShroom()    { Mix(0x500Du); }
    void UpdateGoldMagnetShroom(){ Mix(0x500Eu); }
    void UpdateSunShroom()       { Mix(0x500Fu); }
    void UpdateProductionPlant() { Mix(0x5010u); }
    void UpdateGraveBuster()     { Mix(0x5011u); }
    void UpdateTorchwood()       { Mix(0x5012u); }
    void UpdatePotato()          { Mix(0x5013u); }
    void UpdateSpikeweed()       { Mix(0x5014u); }
    void UpdateTanglekelp()      { Mix(0x5015u); }
    void UpdateScaredyShroom()   { Mix(0x5016u); }
    void UpdateShooter()         { Mix(0x5017u); }
};

// ---------------- FormA：原 22 支阶梯（9c008851^ 逐字，类型分派段） ----------------
__declspec(noinline) void OneA(uint32_t inp)
{
    Plant p;
    p.mSeedType = (SeedType)(inp % (uint32_t)NUM_SEED_TYPES);
    p.mSubclass = (PlantSubClass)((inp >> 17) & 1);
    Plant* this_ = &p;

    if (p.mSeedType == SeedType::SEED_SQUASH)                                                     this_->UpdateSquash();
    else if (p.mSeedType == SeedType::SEED_DOOMSHROOM)                                            this_->UpdateDoomShroom();
    else if (p.mSeedType == SeedType::SEED_ICESHROOM)                                             this_->UpdateIceShroom();
    else if (p.mSeedType == SeedType::SEED_CHOMPER)                                               this_->UpdateChomper();
    else if (p.mSeedType == SeedType::SEED_BLOVER)                                                this_->UpdateBlover();
    else if (p.mSeedType == SeedType::SEED_FLOWERPOT)                                             this_->UpdateFlowerPot();
    else if (p.mSeedType == SeedType::SEED_LILYPAD)                                               this_->UpdateLilypad();
    else if (p.mSeedType == SeedType::SEED_IMITATER)                                              this_->UpdateImitater();
    else if (p.mSeedType == SeedType::SEED_INSTANT_COFFEE)                                        this_->UpdateCoffeeBean();
    else if (p.mSeedType == SeedType::SEED_UMBRELLA)                                              this_->UpdateUmbrella();
    else if (p.mSeedType == SeedType::SEED_COBCANNON)                                             this_->UpdateCobCannon();
    else if (p.mSeedType == SeedType::SEED_CACTUS)                                                this_->UpdateCactus();
    else if (p.mSeedType == SeedType::SEED_MAGNETSHROOM)                                          this_->UpdateMagnetShroom();
    else if (p.mSeedType == SeedType::SEED_GOLD_MAGNET)                                           this_->UpdateGoldMagnetShroom();
    else if (p.mSeedType == SeedType::SEED_SUNSHROOM)                                             this_->UpdateSunShroom();
    else if (p.MakesSun() || p.mSeedType == SeedType::SEED_MARIGOLD)                              this_->UpdateProductionPlant();
    else if (p.mSeedType == SeedType::SEED_GRAVEBUSTER)                                           this_->UpdateGraveBuster();
    else if (p.mSeedType == SeedType::SEED_TORCHWOOD)                                             this_->UpdateTorchwood();
    else if (p.mSeedType == SeedType::SEED_POTATOMINE)                                            this_->UpdatePotato();
    else if (p.mSeedType == SeedType::SEED_SPIKEWEED || p.mSeedType == SeedType::SEED_SPIKEROCK)  this_->UpdateSpikeweed();
    else if (p.mSeedType == SeedType::SEED_TANGLEKELP)                                            this_->UpdateTanglekelp();
    else if (p.mSeedType == SeedType::SEED_SCAREDYSHROOM)                                         this_->UpdateScaredyShroom();

    if (p.mSubclass == PlantSubClass::SUBCLASS_SHOOTER)
    {
        this_->UpdateShooter();
    }
}

// ---------------- FormB：当前 HEAD（static 函数指针表逐字） ----------------
__declspec(noinline) void OneB(uint32_t inp)
{
    Plant p;
    p.mSeedType = (SeedType)(inp % (uint32_t)NUM_SEED_TYPES);
    p.mSubclass = (PlantSubClass)((inp >> 17) & 1);
    Plant* this_ = &p;

    static constexpr auto kProductionUpdate = [](Plant* p) { p->UpdateProductionPlant(); };
    static constexpr auto kSpikeweedUpdate = [](Plant* p) { p->UpdateSpikeweed(); };
    static constexpr void (*kSeedTypeUpdates[])(Plant*) = {
		/* SEED_PEASHOOTER        豌豆射手     */ nullptr,
		/* SEED_SUNFLOWER         向日葵      */ kProductionUpdate,
		/* SEED_CHERRYBOMB        樱桃炸弹     */ nullptr,
		/* SEED_WALLNUT           坚果       */ nullptr,
		/* SEED_POTATOMINE        土豆地雷     */ [](Plant* p) { p->UpdatePotato(); },
		/* SEED_SNOWPEA           寒冰射手     */ nullptr,
		/* SEED_CHOMPER           大嘴花      */ [](Plant* p) { p->UpdateChomper(); },
		/* SEED_REPEATER          双发射手     */ nullptr,
		/* SEED_PUFFSHROOM        小喷菇      */ nullptr,
		/* SEED_SUNSHROOM         阳光菇      */ [](Plant* p) { p->UpdateSunShroom(); },
		/* SEED_FUMESHROOM        大喷菇      */ nullptr,
		/* SEED_GRAVEBUSTER       墓碑吞噬者    */ [](Plant* p) { p->UpdateGraveBuster(); },
		/* SEED_HYPNOSHROOM       魅惑菇      */ nullptr,
		/* SEED_SCAREDYSHROOM     胆小菇      */ [](Plant* p) { p->UpdateScaredyShroom(); },
		/* SEED_ICESHROOM         寒冰菇      */ [](Plant* p) { p->UpdateIceShroom(); },
		/* SEED_DOOMSHROOM        毁灭菇      */ [](Plant* p) { p->UpdateDoomShroom(); },
		/* SEED_LILYPAD           睡莲       */ [](Plant* p) { p->UpdateLilypad(); },
		/* SEED_SQUASH            窝瓜       */ [](Plant* p) { p->UpdateSquash(); },
		/* SEED_THREEPEATER       三线射手     */ nullptr,
		/* SEED_TANGLEKELP        缠绕海草     */ [](Plant* p) { p->UpdateTanglekelp(); },
		/* SEED_JALAPENO          火爆辣椒     */ nullptr,
		/* SEED_SPIKEWEED         地刺       */ kSpikeweedUpdate,
		/* SEED_TORCHWOOD         火炬树桩     */ [](Plant* p) { p->UpdateTorchwood(); },
		/* SEED_TALLNUT                    */ nullptr,
		/* SEED_SEASHROOM                  */ nullptr,
		/* SEED_PLANTERN                   */ nullptr,
		/* SEED_CACTUS                     */ [](Plant* p) { p->UpdateCactus(); },
		/* SEED_BLOVER                     */ [](Plant* p) { p->UpdateBlover(); },
		/* SEED_SPLITPEA                   */ nullptr,
		/* SEED_STARFRUIT                  */ nullptr,
		/* SEED_PUMPKINSHELL               */ nullptr,
		/* SEED_MAGNETSHROOM               */ [](Plant* p) { p->UpdateMagnetShroom(); },
		/* SEED_CABBAGEPULT                */ nullptr,
		/* SEED_FLOWERPOT                  */ [](Plant* p) { p->UpdateFlowerPot(); },
		/* SEED_KERNELPULT                 */ nullptr,
		/* SEED_INSTANT_COFFEE             */ [](Plant* p) { p->UpdateCoffeeBean(); },
		/* SEED_GARLIC                     */ nullptr,
		/* SEED_UMBRELLA                   */ [](Plant* p) { p->UpdateUmbrella(); },
		/* SEED_MARIGOLD                   */ kProductionUpdate,
		/* SEED_MELONPULT                  */ nullptr,
		/* SEED_GATLINGPEA                 */ nullptr,
		/* SEED_TWINSUNFLOWER              */ kProductionUpdate,
		/* SEED_GLOOMSHROOM                */ nullptr,
		/* SEED_CATTAIL                    */ nullptr,
		/* SEED_WINTERMELON                */ nullptr,
		/* SEED_GOLD_MAGNET                */ [](Plant* p) { p->UpdateGoldMagnetShroom(); },
		/* SEED_SPIKEROCK                  */ kSpikeweedUpdate,
		/* SEED_COBCANNON                  */ [](Plant* p) { p->UpdateCobCannon(); },
		/* SEED_IMITATER                   */ [](Plant* p) { p->UpdateImitater(); },
		/* SEED_EXPLODE_O_NUT              */ nullptr,
		/* SEED_GIANT_WALLNUT              */ nullptr,
		/* SEED_SPROUT                     */ nullptr,
		/* SEED_LEFTPEATER                 */ nullptr,
    };
    static_assert(sizeof(kSeedTypeUpdates) / sizeof(kSeedTypeUpdates[0]) == (int)SeedType::NUM_SEED_TYPES,
        "专属更新槽位须与 SeedType 枚举同步");
    if (void (*aUpdate)(Plant*) = kSeedTypeUpdates[p.mSeedType])
    {
        aUpdate(this_);
    }
    if (p.mSubclass == PlantSubClass::SUBCLASS_SHOOTER)
    {
        this_->UpdateShooter();
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
    printf("bench08 kSeedTypeUpdates | before %.2f ns | after %.2f ns | diff %.1f%% | checksum=%s (%016llX/%016llX)\n",
        a, b, (a - b) / a * 100.0, ca == cb ? "OK" : "MISMATCH", (unsigned long long)ca, (unsigned long long)cb);
    return ca == cb ? 0 : 1;
}
