// b_zombie_events.cpp — Zombie.cpp 事件表批测：
//   b05 kLostArmOverrides+HideCases+ParticleImage -> SetupReanimForLostArm（事件）
//   b06 kBossSpawnTracks/kBossHeadTracks -> BossSpawnAttack/BossHeadSpit（事件）
//   b07 kFutureSunglasses/kMustacheStyles -> EnableFuture/EnableMustache（事件·款式选择器）
#include "r3_entities.h"

// ==================== b05 SetupReanimForLostArm ====================
// FormA：03710e6f^ 原三段 switch 逐字
__declspec(noinline) void Zombie::SetupReanimForLostArm_A(unsigned int theDamageFlags)
{
    switch (mZombieType)
    {
    case ZombieType::ZOMBIE_FOOTBALL:
        ReanimShowRange(ReanimTrackRanges::Zombie_football_leftarm_lower, RENDER_GROUP_HIDDEN);
        ReanimShowRange(ReanimTrackRanges::Zombie_football_leftarm_hand, RENDER_GROUP_HIDDEN);
        break;
    case ZombieType::ZOMBIE_NEWSPAPER:
        ReanimShowTrack(ReanimTrackId::Zombie_paper_hands, RENDER_GROUP_HIDDEN);
        ReanimShowTrack(ReanimTrackId::Zombie_paper_leftarm_lower, RENDER_GROUP_HIDDEN);
        break;
    case ZombieType::ZOMBIE_POLEVAULTER:
        ReanimShowTrack(ReanimTrackId::Zombie_polevaulter_outerarm_lower, RENDER_GROUP_HIDDEN);
        ReanimShowTrack(ReanimTrackId::Zombie_outerarm_hand, RENDER_GROUP_HIDDEN);
        break;
    // @Patoke: add cases
    case ZombieType::ZOMBIE_DANCER:
        ReanimShowTrack(ReanimTrackId::Zombie_disco_outerarm_lower, RENDER_GROUP_HIDDEN);
        ReanimShowTrack(ReanimTrackId::Zombie_disco_outerhand_point, RENDER_GROUP_HIDDEN);
        break;
    case ZombieType::ZOMBIE_BACKUP_DANCER:
        ReanimShowTrack(ReanimTrackId::Zombie_disco_outerarm_lower, RENDER_GROUP_HIDDEN);
        ReanimShowTrack(ReanimTrackId::Zombie_disco_outerhand, RENDER_GROUP_HIDDEN);
        break;
    default:
        ReanimShowRange(ReanimTrackRanges::Zombie_outerarm_lower, RENDER_GROUP_HIDDEN);
        ReanimShowRange(ReanimTrackRanges::Zombie_outerarm_hand, RENDER_GROUP_HIDDEN);
        break;
    }

    ZombieDrawPosition aDrawPos;
    GetDrawPos(aDrawPos);
    float aPosX = mPosX + aDrawPos.mImageOffsetX + 45.0f;
    float aPosY = mPosY + aDrawPos.mImageOffsetY + aDrawPos.mBodyY + 78.0f;
    if (IsWalkingBackwards())
    {
        aPosX += 36.0f;
    }

    Reanimation* aBodyReanim = mApp->ReanimationTryToGet(mBodyReanimID);
    if (aBodyReanim)
    {
        switch (mZombieType)
        {
        case ZombieType::ZOMBIE_FOOTBALL:
            GetTrackPosition(ReanimTrackId::zombie_football_leftarm_hand, aPosX, aPosY);
            aBodyReanim->SetImageOverride(ReanimTrackId::zombie_football_leftarm_upper, IMAGE_REANIM_ZOMBIE_FOOTBALL_LEFTARM_UPPER2);
            break;
        case ZombieType::ZOMBIE_NEWSPAPER:
            GetTrackPosition(ReanimTrackId::Zombie_paper_leftarm_lower, aPosX, aPosY);
            aBodyReanim->SetImageOverride(ReanimTrackId::Zombie_paper_leftarm_upper, IMAGE_REANIM_ZOMBIE_PAPER_LEFTARM_UPPER2);
            break;
        case ZombieType::ZOMBIE_POLEVAULTER:
            GetTrackPosition(ReanimTrackId::Zombie_polevaulter_outerarm_lower, aPosX, aPosY);
            aBodyReanim->SetImageOverride(ReanimTrackId::Zombie_polevaulter_outerarm_upper, IMAGE_REANIM_ZOMBIE_POLEVAULTER_OUTERARM_UPPER2);
            break;
        case ZombieType::ZOMBIE_BALLOON:
            GetTrackPosition(ReanimTrackId::Zombie_outerarm_lower, aPosX, aPosY);
            aBodyReanim->SetImageOverride(ReanimTrackId::Zombie_outerarm_upper, IMAGE_REANIM_ZOMBIE_BALLOON_OUTERARM_UPPER2);
            break;
        case ZombieType::ZOMBIE_IMP:
            GetTrackPosition(ReanimTrackId::Zombie_outerarm_lower, aPosX, aPosY);
            aBodyReanim->SetImageOverride(ReanimTrackId::Zombie_imp_outerarm_upper, IMAGE_REANIM_ZOMBIE_IMP_ARM1_BONE);
            break;
        case ZombieType::ZOMBIE_DIGGER:
            GetTrackPosition(ReanimTrackId::Zombie_outerarm_lower, aPosX, aPosY);
            aBodyReanim->SetImageOverride(ReanimTrackId::Zombie_digger_outerarm_upper, IMAGE_REANIM_ZOMBIE_DIGGER_OUTERARM_UPPER2);
            break;
        case ZombieType::ZOMBIE_BOBSLED:
            GetTrackPosition(ReanimTrackId::Zombie_outerarm_lower, aPosX, aPosY);
            aBodyReanim->SetImageOverride(ReanimTrackId::Zombie_dolphinrider_outerarm_upper, IMAGE_REANIM_ZOMBIE_BOBSLED_OUTERARM_UPPER2);
            break;
        case ZombieType::ZOMBIE_JACK_IN_THE_BOX:
            GetTrackPosition(ReanimTrackId::Zombie_jackbox_outerarm_lower, aPosX, aPosY);
            aBodyReanim->SetImageOverride(ReanimTrackId::Zombie_jackbox_outerarm_lower, IMAGE_REANIM_ZOMBIE_JACKBOX_OUTERARM_LOWER2);
            break;
        case ZombieType::ZOMBIE_SNORKEL:
            GetTrackPosition(ReanimTrackId::Zombie_outerarm_lower, aPosX, aPosY);
            aBodyReanim->SetImageOverride(ReanimTrackId::Zombie_snorkle_outerarm_upper, IMAGE_REANIM_ZOMBIE_SNORKLE_OUTERARM_UPPER2);
            break;
        case ZombieType::ZOMBIE_DOLPHIN_RIDER:
            GetTrackPosition(ReanimTrackId::Zombie_outerarm_lower, aPosX, aPosY);
            aBodyReanim->SetImageOverride(ReanimTrackId::Zombie_dolphinrider_outerarm_upper, IMAGE_REANIM_ZOMBIE_DOLPHINRIDER_OUTERARM_UPPER2);
            break;
        case ZombieType::ZOMBIE_POGO:
            GetTrackPosition(ReanimTrackId::Zombie_outerarm_lower, aPosX, aPosY);
            aBodyReanim->SetImageOverride(ReanimTrackId::Zombie_outerarm_upper, IMAGE_REANIM_ZOMBIE_POGO_OUTERARM_UPPER2);
            aBodyReanim->SetImageOverride(ReanimTrackId::Zombie_pogo_stickhands, IMAGE_REANIM_ZOMBIE_POGO_STICKHANDS2);
            aBodyReanim->SetImageOverride(ReanimTrackId::Zombie_pogo_stick, IMAGE_REANIM_ZOMBIE_POGO_STICKDAMAGE2);
            aBodyReanim->SetImageOverride(ReanimTrackId::Zombie_pogo_stick2, IMAGE_REANIM_ZOMBIE_POGO_STICK2DAMAGE2);
            break;
        case ZombieType::ZOMBIE_FLAG:
        {
            GetTrackPosition(ReanimTrackId::Zombie_outerarm_lower, aPosX, aPosY);
            aBodyReanim->SetImageOverride(ReanimTrackId::Zombie_outerarm_upper, IMAGE_REANIM_ZOMBIE_OUTERARM_UPPER2);

            Reanimation* aHeadReanim = mApp->ReanimationTryToGet(mSpecialHeadReanimID);
            if (aHeadReanim)
            {
                aHeadReanim->SetImageOverride(ReanimTrackId::Zombie_flag, IMAGE_REANIM_ZOMBIE_FLAG3);
            }
            break;
        }
        case ZombieType::ZOMBIE_DANCER:
            // @Patoke: updated for new assets
            GetTrackPosition(ReanimTrackId::Zombie_disco_outerarm_lower, aPosX, aPosY);
            aBodyReanim->SetImageOverride(ReanimTrackId::Zombie_disco_outerarm_upper, IMAGE_REANIM_ZOMBIE_DISCO_OUTERARM_UPPER2); // @Patoke: GOTY assets have different name
            break;
        case ZombieType::ZOMBIE_BACKUP_DANCER:
            // @Patoke: updated for new assets
            GetTrackPosition(ReanimTrackId::Zombie_disco_outerarm_lower, aPosX, aPosY);
            aBodyReanim->SetImageOverride(ReanimTrackId::Zombie_disco_outerarm_upper, IMAGE_REANIM_ZOMBIE_BACKUP_OUTERARM_UPPER2); // @Patoke: added call
            break;
        case ZombieType::ZOMBIE_LADDER:
            GetTrackPosition(ReanimTrackId::Zombie_outerarm_hand, aPosX, aPosY);
            aBodyReanim->SetImageOverride(ReanimTrackId::Zombie_ladder_outerarm_upper, IMAGE_REANIM_ZOMBIE_LADDER_OUTERARM_UPPER2);
            break;
        case ZombieType::ZOMBIE_YETI:
            GetTrackPosition(ReanimTrackId::Zombie_outerarm_hand, aPosX, aPosY);
            aBodyReanim->SetImageOverride(ReanimTrackId::Zombie_yeti_outerarm_upper, IMAGE_REANIM_ZOMBIE_YETI_OUTERARM_UPPER2);
            break;
        default:
            GetTrackPosition(ReanimTrackId::Zombie_outerarm_lower, aPosX, aPosY);
            aBodyReanim->SetImageOverride(ReanimTrackId::Zombie_outerarm_upper, IMAGE_REANIM_ZOMBIE_OUTERARM_UPPER2);
            break;
        }
    }

    if (!mInPool && !TestBit(theDamageFlags, DamageFlags::DAMAGE_DOESNT_LEAVE_BODY))
    {
        ParticleEffect aEffect = ParticleEffect::PARTICLE_ZOMBIE_ARM;
        if (mZombiePhase == ZombiePhase::PHASE_ZOMBIE_MOWERED)
        {
            aEffect = ParticleEffect::PARTICLE_MOWERED_ZOMBIE_ARM;
        }

        TodParticleSystem* aParticle = mApp->AddTodParticle(aPosX, aPosY, mRenderOrder + 1, aEffect);
        OverrideParticleColor(aParticle);
        OverrideParticleScale(aParticle);

        if (aParticle)
        {
            switch (mZombieType)
            {
            case ZombieType::ZOMBIE_FOOTBALL:
                aParticle->OverrideImage(nullptr, IMAGE_REANIM_ZOMBIE_FOOTBALL_LEFTARM_HAND);
                break;
            case ZombieType::ZOMBIE_NEWSPAPER:
                aParticle->OverrideImage(nullptr, IMAGE_REANIM_ZOMBIE_PAPER_LEFTARM_LOWER);
                break;
            case ZombieType::ZOMBIE_DANCER:
                aParticle->OverrideImage(nullptr, IMAGE_REANIM_ZOMBIE_DISCO_OUTERARM_HAND);
                break;
            case ZombieType::ZOMBIE_BACKUP_DANCER:
                aParticle->OverrideImage(nullptr, IMAGE_REANIM_ZOMBIE_BACKUP_INNERARM_HAND);
                break;
            case ZombieType::ZOMBIE_BOBSLED:
                aParticle->OverrideImage(nullptr, IMAGE_REANIM_ZOMBIE_BOBSLED_OUTERARM_HAND);
                break;
            case ZombieType::ZOMBIE_IMP:
                aParticle->OverrideImage(nullptr, IMAGE_REANIM_ZOMBIE_IMP_ARM2);
                break;
            case ZombieType::ZOMBIE_YETI:
                aParticle->OverrideImage(nullptr, IMAGE_REANIM_ZOMBIE_YETI_OUTERARM_HAND);
                break;
            case ZombieType::ZOMBIE_JACK_IN_THE_BOX:
                aParticle->OverrideImage(nullptr, IMAGE_ZOMBIEJACKBOXARM);
                break;
            case ZombieType::ZOMBIE_DIGGER:
                aParticle->OverrideImage(nullptr, IMAGE_ZOMBIEDIGGERARM);
                break;
            case ZombieType::ZOMBIE_POLEVAULTER:
            case ZombieType::ZOMBIE_BALLOON:
            case ZombieType::ZOMBIE_DOLPHIN_RIDER:
            case ZombieType::ZOMBIE_POGO:
            case ZombieType::ZOMBIE_LADDER:
                aParticle->OverrideImage(nullptr, IMAGE_REANIM_ZOMBIE_OUTERARM_HAND);
                break;
            default:
                break;
            }
        }
    }
}

// FormB 表群（HEAD 逐字）
namespace
{
struct LostArmOverride
{
    ReanimTrackId mPositionTrack;
    ReanimTrackId mOverrideTrack;
    Image* const* mArmImage;
};
constexpr LostArmOverride kLostArmOverrides[ZombieType::NUM_ZOMBIE_TYPES] = {
    /* [0]  ZOMBIE_NORMAL          */ { ReanimTrackId::Zombie_outerarm_lower, ReanimTrackId::Zombie_outerarm_upper, &IMAGE_REANIM_ZOMBIE_OUTERARM_UPPER2 },
    /* [1]  ZOMBIE_FLAG            */ { ReanimTrackId::Zombie_outerarm_lower, ReanimTrackId::Zombie_outerarm_upper, &IMAGE_REANIM_ZOMBIE_OUTERARM_UPPER2 },
    /* [2]  ZOMBIE_TRAFFIC_CONE    */ { ReanimTrackId::Zombie_outerarm_lower, ReanimTrackId::Zombie_outerarm_upper, &IMAGE_REANIM_ZOMBIE_OUTERARM_UPPER2 },
    /* [3]  ZOMBIE_POLEVAULTER     */ { ReanimTrackId::Zombie_polevaulter_outerarm_lower, ReanimTrackId::Zombie_polevaulter_outerarm_upper, &IMAGE_REANIM_ZOMBIE_POLEVAULTER_OUTERARM_UPPER2 },
    /* [4]  ZOMBIE_PAIL            */ { ReanimTrackId::Zombie_outerarm_lower, ReanimTrackId::Zombie_outerarm_upper, &IMAGE_REANIM_ZOMBIE_OUTERARM_UPPER2 },
    /* [5]  ZOMBIE_NEWSPAPER       */ { ReanimTrackId::Zombie_paper_leftarm_lower, ReanimTrackId::Zombie_paper_leftarm_upper, &IMAGE_REANIM_ZOMBIE_PAPER_LEFTARM_UPPER2 },
    /* [6]  ZOMBIE_DOOR            */ { ReanimTrackId::Zombie_outerarm_lower, ReanimTrackId::Zombie_outerarm_upper, &IMAGE_REANIM_ZOMBIE_OUTERARM_UPPER2 },
    /* [7]  ZOMBIE_FOOTBALL        */ { ReanimTrackId::zombie_football_leftarm_hand, ReanimTrackId::zombie_football_leftarm_upper, &IMAGE_REANIM_ZOMBIE_FOOTBALL_LEFTARM_UPPER2 },
    /* [8]  ZOMBIE_DANCER          */ { ReanimTrackId::Zombie_disco_outerarm_lower, ReanimTrackId::Zombie_disco_outerarm_upper, &IMAGE_REANIM_ZOMBIE_DISCO_OUTERARM_UPPER2 },
    /* [9]  ZOMBIE_BACKUP_DANCER   */ { ReanimTrackId::Zombie_disco_outerarm_lower, ReanimTrackId::Zombie_disco_outerarm_upper, &IMAGE_REANIM_ZOMBIE_BACKUP_OUTERARM_UPPER2 },
    /* [10] ZOMBIE_DUCKY_TUBE      */ { ReanimTrackId::Zombie_outerarm_lower, ReanimTrackId::Zombie_outerarm_upper, &IMAGE_REANIM_ZOMBIE_OUTERARM_UPPER2 },
    /* [11] ZOMBIE_SNORKEL         */ { ReanimTrackId::Zombie_outerarm_lower, ReanimTrackId::Zombie_snorkle_outerarm_upper, &IMAGE_REANIM_ZOMBIE_SNORKLE_OUTERARM_UPPER2 },
    /* [12] ZOMBIE_ZAMBONI         */ { ReanimTrackId::Zombie_outerarm_lower, ReanimTrackId::Zombie_outerarm_upper, &IMAGE_REANIM_ZOMBIE_OUTERARM_UPPER2 },
    /* [13] ZOMBIE_BOBSLED         */ { ReanimTrackId::Zombie_outerarm_lower, ReanimTrackId::Zombie_dolphinrider_outerarm_upper, &IMAGE_REANIM_ZOMBIE_BOBSLED_OUTERARM_UPPER2 },
    /* [14] ZOMBIE_DOLPHIN_RIDER   */ { ReanimTrackId::Zombie_outerarm_lower, ReanimTrackId::Zombie_dolphinrider_outerarm_upper, &IMAGE_REANIM_ZOMBIE_DOLPHINRIDER_OUTERARM_UPPER2 },
    /* [15] ZOMBIE_JACK_IN_THE_BOX */ { ReanimTrackId::Zombie_jackbox_outerarm_lower, ReanimTrackId::Zombie_jackbox_outerarm_lower, &IMAGE_REANIM_ZOMBIE_JACKBOX_OUTERARM_LOWER2 },
    /* [16] ZOMBIE_BALLOON         */ { ReanimTrackId::Zombie_outerarm_lower, ReanimTrackId::Zombie_outerarm_upper, &IMAGE_REANIM_ZOMBIE_BALLOON_OUTERARM_UPPER2 },
    /* [17] ZOMBIE_DIGGER          */ { ReanimTrackId::Zombie_outerarm_lower, ReanimTrackId::Zombie_digger_outerarm_upper, &IMAGE_REANIM_ZOMBIE_DIGGER_OUTERARM_UPPER2 },
    /* [18] ZOMBIE_POGO            */ { ReanimTrackId::Zombie_outerarm_lower, ReanimTrackId::Zombie_outerarm_upper, &IMAGE_REANIM_ZOMBIE_POGO_OUTERARM_UPPER2 },
    /* [19] ZOMBIE_YETI            */ { ReanimTrackId::Zombie_outerarm_hand, ReanimTrackId::Zombie_yeti_outerarm_upper, &IMAGE_REANIM_ZOMBIE_YETI_OUTERARM_UPPER2 },
    /* [20] ZOMBIE_BUNGEE          */ { ReanimTrackId::Zombie_outerarm_lower, ReanimTrackId::Zombie_outerarm_upper, &IMAGE_REANIM_ZOMBIE_OUTERARM_UPPER2 },
    /* [21] ZOMBIE_LADDER          */ { ReanimTrackId::Zombie_outerarm_hand, ReanimTrackId::Zombie_ladder_outerarm_upper, &IMAGE_REANIM_ZOMBIE_LADDER_OUTERARM_UPPER2 },
    /* [22] ZOMBIE_CATAPULT        */ { ReanimTrackId::Zombie_outerarm_lower, ReanimTrackId::Zombie_outerarm_upper, &IMAGE_REANIM_ZOMBIE_OUTERARM_UPPER2 },
    /* [23] ZOMBIE_GARGANTUAR      */ { ReanimTrackId::Zombie_outerarm_lower, ReanimTrackId::Zombie_outerarm_upper, &IMAGE_REANIM_ZOMBIE_OUTERARM_UPPER2 },
    /* [24] ZOMBIE_IMP             */ { ReanimTrackId::Zombie_outerarm_lower, ReanimTrackId::Zombie_imp_outerarm_upper, &IMAGE_REANIM_ZOMBIE_IMP_ARM1_BONE },
    /* [25] ZOMBIE_BOSS            */ { ReanimTrackId::Zombie_outerarm_lower, ReanimTrackId::Zombie_outerarm_upper, &IMAGE_REANIM_ZOMBIE_OUTERARM_UPPER2 },
    /* [26] ZOMBIE_PEA_HEAD        */ { ReanimTrackId::Zombie_outerarm_lower, ReanimTrackId::Zombie_outerarm_upper, &IMAGE_REANIM_ZOMBIE_OUTERARM_UPPER2 },
    /* [27] ZOMBIE_WALLNUT_HEAD    */ { ReanimTrackId::Zombie_outerarm_lower, ReanimTrackId::Zombie_outerarm_upper, &IMAGE_REANIM_ZOMBIE_OUTERARM_UPPER2 },
    /* [28] ZOMBIE_JALAPENO_HEAD   */ { ReanimTrackId::Zombie_outerarm_lower, ReanimTrackId::Zombie_outerarm_upper, &IMAGE_REANIM_ZOMBIE_OUTERARM_UPPER2 },
    /* [29] ZOMBIE_GATLING_HEAD    */ { ReanimTrackId::Zombie_outerarm_lower, ReanimTrackId::Zombie_outerarm_upper, &IMAGE_REANIM_ZOMBIE_OUTERARM_UPPER2 },
    /* [30] ZOMBIE_SQUASH_HEAD     */ { ReanimTrackId::Zombie_outerarm_lower, ReanimTrackId::Zombie_outerarm_upper, &IMAGE_REANIM_ZOMBIE_OUTERARM_UPPER2 },
    /* [31] ZOMBIE_TALLNUT_HEAD    */ { ReanimTrackId::Zombie_outerarm_lower, ReanimTrackId::Zombie_outerarm_upper, &IMAGE_REANIM_ZOMBIE_OUTERARM_UPPER2 },
    /* [32] ZOMBIE_REDEYE_GARGANTUAR */ { ReanimTrackId::Zombie_outerarm_lower, ReanimTrackId::Zombie_outerarm_upper, &IMAGE_REANIM_ZOMBIE_OUTERARM_UPPER2 },
    /* [33] ZOMBIE_ZOMBATAR        */ { ReanimTrackId::Zombie_outerarm_lower, ReanimTrackId::Zombie_outerarm_upper, &IMAGE_REANIM_ZOMBIE_OUTERARM_UPPER2 },
};
static_assert(sizeof(kLostArmOverrides) / sizeof(kLostArmOverrides[0]) == (int)ZombieType::NUM_ZOMBIE_TYPES,
    "断臂覆写槽位须与 ZombieType 枚举尾同步");

// SetupReanimForLostArm 第一段（藏臂轨道）分发表
using LostArmHideCaseFn = void (*)(Zombie&);

// 原 default（无 case 的 29 型与表外哨兵共用）
void LostArmHideDefault(Zombie& z)
{
            z.ReanimShowRange(ReanimTrackRanges::Zombie_outerarm_lower, RENDER_GROUP_HIDDEN);
            z.ReanimShowRange(ReanimTrackRanges::Zombie_outerarm_hand, RENDER_GROUP_HIDDEN);
}

// 匿名 lambda 函数指针表，行序 = ZombieType 枚举值序（0..33）。
constexpr LostArmHideCaseFn kLostArmHideCases[(int)ZombieType::NUM_ZOMBIE_TYPES] = {
    &LostArmHideDefault,  // 0 ZOMBIE_NORMAL（原 default）
    &LostArmHideDefault,  // 1 ZOMBIE_FLAG（原 default）
    &LostArmHideDefault,  // 2 ZOMBIE_TRAFFIC_CONE（原 default）
    // 原 case ZOMBIE_POLEVAULTER
    [](Zombie& z)
    {
            z.ReanimShowTrack(ReanimTrackId::Zombie_polevaulter_outerarm_lower, RENDER_GROUP_HIDDEN);
            z.ReanimShowTrack(ReanimTrackId::Zombie_outerarm_hand, RENDER_GROUP_HIDDEN);

        // @Patoke: add cases
    },  // 3 ZOMBIE_POLEVAULTER
    &LostArmHideDefault,  // 4 ZOMBIE_PAIL（原 default）
    // 原 case ZOMBIE_NEWSPAPER
    [](Zombie& z)
    {
            z.ReanimShowTrack(ReanimTrackId::Zombie_paper_hands, RENDER_GROUP_HIDDEN);
            z.ReanimShowTrack(ReanimTrackId::Zombie_paper_leftarm_lower, RENDER_GROUP_HIDDEN);
    },  // 5 ZOMBIE_NEWSPAPER
    &LostArmHideDefault,  // 6 ZOMBIE_DOOR（原 default）
    // 原 case ZOMBIE_FOOTBALL
    [](Zombie& z)
    {
            z.ReanimShowRange(ReanimTrackRanges::Zombie_football_leftarm_lower, RENDER_GROUP_HIDDEN);
            z.ReanimShowRange(ReanimTrackRanges::Zombie_football_leftarm_hand, RENDER_GROUP_HIDDEN);
    },  // 7 ZOMBIE_FOOTBALL
    // 原 case ZOMBIE_DANCER
    [](Zombie& z)
    {
            z.ReanimShowTrack(ReanimTrackId::Zombie_disco_outerarm_lower, RENDER_GROUP_HIDDEN);
            z.ReanimShowTrack(ReanimTrackId::Zombie_disco_outerhand_point, RENDER_GROUP_HIDDEN);
    },  // 8 ZOMBIE_DANCER
    // 原 case ZOMBIE_BACKUP_DANCER
    [](Zombie& z)
    {
            z.ReanimShowTrack(ReanimTrackId::Zombie_disco_outerarm_lower, RENDER_GROUP_HIDDEN);
            z.ReanimShowTrack(ReanimTrackId::Zombie_disco_outerhand, RENDER_GROUP_HIDDEN);
    },  // 9 ZOMBIE_BACKUP_DANCER
    &LostArmHideDefault,  // 10 ZOMBIE_DUCKY_TUBE（原 default）
    &LostArmHideDefault,  // 11 ZOMBIE_SNORKEL（原 default）
    &LostArmHideDefault,  // 12 ZOMBIE_ZAMBONI（原 default）
    &LostArmHideDefault,  // 13 ZOMBIE_BOBSLED（原 default）
    &LostArmHideDefault,  // 14 ZOMBIE_DOLPHIN_RIDER（原 default）
    &LostArmHideDefault,  // 15 ZOMBIE_JACK_IN_THE_BOX（原 default）
    &LostArmHideDefault,  // 16 ZOMBIE_BALLOON（原 default）
    &LostArmHideDefault,  // 17 ZOMBIE_DIGGER（原 default）
    &LostArmHideDefault,  // 18 ZOMBIE_POGO（原 default）
    &LostArmHideDefault,  // 19 ZOMBIE_YETI（原 default）
    &LostArmHideDefault,  // 20 ZOMBIE_BUNGEE（原 default）
    &LostArmHideDefault,  // 21 ZOMBIE_LADDER（原 default）
    &LostArmHideDefault,  // 22 ZOMBIE_CATAPULT（原 default）
    &LostArmHideDefault,  // 23 ZOMBIE_GARGANTUAR（原 default）
    &LostArmHideDefault,  // 24 ZOMBIE_IMP（原 default）
    &LostArmHideDefault,  // 25 ZOMBIE_BOSS（原 default）
    &LostArmHideDefault,  // 26 ZOMBIE_PEA_HEAD（原 default）
    &LostArmHideDefault,  // 27 ZOMBIE_WALLNUT_HEAD（原 default）
    &LostArmHideDefault,  // 28 ZOMBIE_JALAPENO_HEAD（原 default）
    &LostArmHideDefault,  // 29 ZOMBIE_GATLING_HEAD（原 default）
    &LostArmHideDefault,  // 30 ZOMBIE_SQUASH_HEAD（原 default）
    &LostArmHideDefault,  // 31 ZOMBIE_TALLNUT_HEAD（原 default）
    &LostArmHideDefault,  // 32 ZOMBIE_REDEYE_GARGANTUAR（原 default）
    &LostArmHideDefault,  // 33 ZOMBIE_ZOMBATAR（原 default）
};
static_assert(sizeof(kLostArmHideCases) / sizeof(kLostArmHideCases[0]) ==
    (int)ZombieType::NUM_ZOMBIE_TYPES, "kLostArmHideCases 槽位数须与 ZombieType 枚举同步");

// kLostArmParticleImage：生成器解析原 switch 生成（逐槽对拍 0 差异）；
// 哨兵 nullptr = 无 case 槽（default 无操作）。
constexpr Image* const* kLostArmParticleImage[(int)ZombieType::NUM_ZOMBIE_TYPES] = {
        nullptr,  // 0 ZOMBIE_NORMAL（无 case）
        nullptr,  // 1 ZOMBIE_FLAG（无 case）
        nullptr,  // 2 ZOMBIE_TRAFFIC_CONE（无 case）
        &IMAGE_REANIM_ZOMBIE_OUTERARM_HAND,  // 3 ZOMBIE_POLEVAULTER
        nullptr,  // 4 ZOMBIE_PAIL（无 case）
        &IMAGE_REANIM_ZOMBIE_PAPER_LEFTARM_LOWER,  // 5 ZOMBIE_NEWSPAPER
        nullptr,  // 6 ZOMBIE_DOOR（无 case）
        &IMAGE_REANIM_ZOMBIE_FOOTBALL_LEFTARM_HAND,  // 7 ZOMBIE_FOOTBALL
        &IMAGE_REANIM_ZOMBIE_DISCO_OUTERARM_HAND,  // 8 ZOMBIE_DANCER
        &IMAGE_REANIM_ZOMBIE_BACKUP_INNERARM_HAND,  // 9 ZOMBIE_BACKUP_DANCER
        nullptr,  // 10 ZOMBIE_DUCKY_TUBE（无 case）
        nullptr,  // 11 ZOMBIE_SNORKEL（无 case）
        nullptr,  // 12 ZOMBIE_ZAMBONI（无 case）
        &IMAGE_REANIM_ZOMBIE_BOBSLED_OUTERARM_HAND,  // 13 ZOMBIE_BOBSLED
        &IMAGE_REANIM_ZOMBIE_OUTERARM_HAND,  // 14 ZOMBIE_DOLPHIN_RIDER
        &IMAGE_ZOMBIEJACKBOXARM,  // 15 ZOMBIE_JACK_IN_THE_BOX
        &IMAGE_REANIM_ZOMBIE_OUTERARM_HAND,  // 16 ZOMBIE_BALLOON
        &IMAGE_ZOMBIEDIGGERARM,  // 17 ZOMBIE_DIGGER
        &IMAGE_REANIM_ZOMBIE_OUTERARM_HAND,  // 18 ZOMBIE_POGO
        &IMAGE_REANIM_ZOMBIE_YETI_OUTERARM_HAND,  // 19 ZOMBIE_YETI
        nullptr,  // 20 ZOMBIE_BUNGEE（无 case）
        &IMAGE_REANIM_ZOMBIE_OUTERARM_HAND,  // 21 ZOMBIE_LADDER
        nullptr,  // 22 ZOMBIE_CATAPULT（无 case）
        nullptr,  // 23 ZOMBIE_GARGANTUAR（无 case）
        &IMAGE_REANIM_ZOMBIE_IMP_ARM2,  // 24 ZOMBIE_IMP
        nullptr,  // 25 ZOMBIE_BOSS（无 case）
        nullptr,  // 26 ZOMBIE_PEA_HEAD（无 case）
        nullptr,  // 27 ZOMBIE_WALLNUT_HEAD（无 case）
        nullptr,  // 28 ZOMBIE_JALAPENO_HEAD（无 case）
        nullptr,  // 29 ZOMBIE_GATLING_HEAD（无 case）
        nullptr,  // 30 ZOMBIE_SQUASH_HEAD（无 case）
        nullptr,  // 31 ZOMBIE_TALLNUT_HEAD（无 case）
        nullptr,  // 32 ZOMBIE_REDEYE_GARGANTUAR（无 case）
        nullptr,  // 33 ZOMBIE_ZOMBATAR（无 case）
};
static_assert(sizeof(kLostArmParticleImage) / sizeof(kLostArmParticleImage[0]) ==
    (int)ZombieType::NUM_ZOMBIE_TYPES, "槽位须与 ZombieType 枚举同步");
}  // namespace

__declspec(noinline) void Zombie::SetupReanimForLostArm_B(unsigned int theDamageFlags)
{
    // C 形态 -> 匿名 lambda 函数指针表：行序 = ZombieType 枚举序（0..33）。
    // 原 default 非空（藏外臂两轨道）——无 case 的型与哨兵均走它，故越界
    // 分支显式调 default 具名函数，逐字保持 switch 语义。
    const unsigned aTypeIndex = static_cast<unsigned>(mZombieType);
    if (aTypeIndex < static_cast<unsigned>(ZombieType::NUM_ZOMBIE_TYPES))
    {
        kLostArmHideCases[aTypeIndex](*this);
    }
    else
    {
        LostArmHideDefault(*this);
    }


    ZombieDrawPosition aDrawPos;
    GetDrawPos(aDrawPos);
    float aPosX = mPosX + aDrawPos.mImageOffsetX + 45.0f;
    float aPosY = mPosY + aDrawPos.mImageOffsetY + aDrawPos.mBodyY + 78.0f;
    if (IsWalkingBackwards())
    {
        aPosX += 36.0f;
    }

    Reanimation* aBodyReanim = mApp->ReanimationTryToGet(mBodyReanimID);
    if (aBodyReanim)
    {
        int aType = (int)mZombieType;
        if ((unsigned)aType < (unsigned)(sizeof(kLostArmOverrides) / sizeof(kLostArmOverrides[0])))
        {
            const LostArmOverride& aOverride = kLostArmOverrides[aType];
            GetTrackPosition(aOverride.mPositionTrack, aPosX, aPosY);
            aBodyReanim->SetImageOverride(aOverride.mOverrideTrack, *aOverride.mArmImage);
            if (mZombieType == ZombieType::ZOMBIE_POGO)
            {
                aBodyReanim->SetImageOverride(ReanimTrackId::Zombie_pogo_stickhands, IMAGE_REANIM_ZOMBIE_POGO_STICKHANDS2);
                aBodyReanim->SetImageOverride(ReanimTrackId::Zombie_pogo_stick, IMAGE_REANIM_ZOMBIE_POGO_STICKDAMAGE2);
                aBodyReanim->SetImageOverride(ReanimTrackId::Zombie_pogo_stick2, IMAGE_REANIM_ZOMBIE_POGO_STICK2DAMAGE2);
            }
            else if (mZombieType == ZombieType::ZOMBIE_FLAG)
            {
                Reanimation* aHeadReanim = mApp->ReanimationTryToGet(mSpecialHeadReanimID);
                if (aHeadReanim)
                {
                    aHeadReanim->SetImageOverride(ReanimTrackId::Zombie_flag, IMAGE_REANIM_ZOMBIE_FLAG3);
                }
            }
        }
        else
        {
            GetTrackPosition(ReanimTrackId::Zombie_outerarm_lower, aPosX, aPosY);
            aBodyReanim->SetImageOverride(ReanimTrackId::Zombie_outerarm_upper, IMAGE_REANIM_ZOMBIE_OUTERARM_UPPER2);
        }
    }

    if (!mInPool && !TestBit(theDamageFlags, DamageFlags::DAMAGE_DOESNT_LEAVE_BODY))
    {
        ParticleEffect aEffect = ParticleEffect::PARTICLE_ZOMBIE_ARM;
        if (mZombiePhase == ZombiePhase::PHASE_ZOMBIE_MOWERED)
        {
            aEffect = ParticleEffect::PARTICLE_MOWERED_ZOMBIE_ARM;
        }

        TodParticleSystem* aParticle = mApp->AddTodParticle(aPosX, aPosY, mRenderOrder + 1, aEffect);
        OverrideParticleColor(aParticle);
        OverrideParticleScale(aParticle);

        if (aParticle)
        {
            // B 形态 -> 常量表（见上 kLostArmParticleImage）；无 case 槽 = nullptr
            // 不覆写（=原 default 无操作）。
            if (static_cast<unsigned>(mZombieType) < static_cast<unsigned>(ZombieType::NUM_ZOMBIE_TYPES) && kLostArmParticleImage[mZombieType] != nullptr)
            {
                aParticle->OverrideImage(nullptr, *kLostArmParticleImage[mZombieType]);
            }

        }
    }
}

// ==================== b06 BossSpawnAttack / BossHeadSpit ====================
// FormA：198fef4a^ 原 switch 逐字
__declspec(noinline) void Zombie::BossSpawnAttack_A()
{
    RemoveColdEffects();
    mZombiePhase = ZombiePhase::PHASE_BOSS_SPAWNING;
    if (mBossMode == 0)
    {
        mSummonCounter = RandRangeInt(450, 550);
    }
    else if (mBossMode == 1)
    {
        mSummonCounter = RandRangeInt(350, 450);
    }
    else if (mBossMode == 2)
    {
        mSummonCounter = RandRangeInt(150, 250);
    }

    mTargetRow = mBoard->PickRowForNewZombie(ZombieType::ZOMBIE_NORMAL);

    ReanimTrackId aTrackName;
    switch (mTargetRow)
    {
    case 0:     aTrackName = ReanimTrackId::anim_spawn_1;    break;
    case 1:     aTrackName = ReanimTrackId::anim_spawn_2;    break;
    case 2:     aTrackName = ReanimTrackId::anim_spawn_3;    break;
    case 3:     aTrackName = ReanimTrackId::anim_spawn_4;    break;
    case 4:     aTrackName = ReanimTrackId::anim_spawn_5;    break;
#ifdef DO_FIX_BUGS
    default:    aTrackName = ReanimTrackId::anim_spawn_5;    break;  // 泳池场景放僵尸崩溃的一种妥协的修复方式（不修改动画时）
#else
    default:    TOD_ASSERT(false);                   break;
#endif
    }
    PlayZombieReanim(aTrackName, ReanimLoopType::REANIM_PLAY_ONCE_AND_HOLD, 20, 12.0f);
    mApp->PlayFoley(FoleyType::FOLEY_HYDRAULIC_SHORT);
}

__declspec(noinline) void Zombie::BossHeadSpit_A()
{
    Reanimation* aFireBallReanim = mApp->ReanimationTryToGet(mBossFireBallReanimID);
    if (aFireBallReanim)
    {
        aFireBallReanim->ReanimationDie();
        mBossFireBallReanimID = ReanimationID::REANIMATIONID_NULL;
    }

    mZombiePhase = ZombiePhase::PHASE_BOSS_HEAD_SPIT;
#ifdef DO_FIX_BUGS
    mFireballRow = RandRangeInt(0, mBoard->StageHas6Rows() ? 5 : 4);  // 泳池僵王兼容
#else
    mFireballRow = RandRangeInt(0, 4);
#endif
    mIsFireBall = RandRangeInt(0, 1) == 0;

    ReanimTrackId aTrackName;
    switch (mFireballRow)
    {
    case 0:     aTrackName = ReanimTrackId::anim_head_attack_1;      break;
    case 1:     aTrackName = ReanimTrackId::anim_head_attack_2;      break;
    case 2:     aTrackName = ReanimTrackId::anim_head_attack_3;      break;
    case 3:     aTrackName = ReanimTrackId::anim_head_attack_4;      break;
    case 4:     aTrackName = ReanimTrackId::anim_head_attack_5;      break;
#ifdef DO_FIX_BUGS
    default:    aTrackName = ReanimTrackId::anim_head_attack_5;      break;  // 泳池场景吐球的一种妥协的修复方式（不修改动画时）
#else
    default:    TOD_ASSERT(false);                           break;
#endif
    }
    PlayZombieReanim(aTrackName, ReanimLoopType::REANIM_PLAY_ONCE_AND_HOLD, 20, 12.0f);

    Reanimation* aBodyReanim = mApp->ReanimationGet(mBodyReanimID);
    if (mIsFireBall)
    {
        aBodyReanim->SetImageOverride(ReanimTrackId::Boss_eyeglow_red, nullptr);
        aBodyReanim->SetImageOverride(ReanimTrackId::Boss_mouthglow_red, nullptr);
    }
    else
    {
        aBodyReanim->SetImageOverride(ReanimTrackId::Boss_eyeglow_red, IMAGE_REANIM_ZOMBIE_BOSS_EYEGLOW_BLUE);
        aBodyReanim->SetImageOverride(ReanimTrackId::Boss_mouthglow_red, IMAGE_REANIM_ZOMBIE_BOSS_MOUTHGLOW_BLUE);
    }
}

namespace
{
// Boss 出招轨道名表（手工生成，5-case 整型直下标；static_assert 锚
// ReanimTrackId 序数；default 分支保留表外——DO_FIX_BUGS 语义见原处）。
constexpr ReanimTrackId kBossSpawnTracks[5] = {
    ReanimTrackId::anim_spawn_1,
    ReanimTrackId::anim_spawn_2,
    ReanimTrackId::anim_spawn_3,
    ReanimTrackId::anim_spawn_4,
    ReanimTrackId::anim_spawn_5,
};
static_assert(kBossSpawnTracks[0] == ReanimTrackId::anim_spawn_1 &&
    kBossSpawnTracks[4] == ReanimTrackId::anim_spawn_5, "spawn 轨道表锚点");
constexpr ReanimTrackId kBossHeadTracks[5] = {
    ReanimTrackId::anim_head_attack_1,
    ReanimTrackId::anim_head_attack_2,
    ReanimTrackId::anim_head_attack_3,
    ReanimTrackId::anim_head_attack_4,
    ReanimTrackId::anim_head_attack_5,
};
static_assert(kBossHeadTracks[0] == ReanimTrackId::anim_head_attack_1 &&
    kBossHeadTracks[4] == ReanimTrackId::anim_head_attack_5, "head 轨道表锚点");
}  // namespace

//0x534C70
__declspec(noinline) void Zombie::BossSpawnAttack_B()
{
    RemoveColdEffects();
    mZombiePhase = ZombiePhase::PHASE_BOSS_SPAWNING;
    if (mBossMode == 0)
    {
        mSummonCounter = RandRangeInt(450, 550);
    }
    else if (mBossMode == 1)
    {
        mSummonCounter = RandRangeInt(350, 450);
    }
    else if (mBossMode == 2)
    {
        mSummonCounter = RandRangeInt(150, 250);
    }

    mTargetRow = mBoard->PickRowForNewZombie(ZombieType::ZOMBIE_NORMAL);

    // B 形态 -> 常量表 kBossSpawnTracks[5]（见函数前 namespace）：整型直下标；
    // default（DO_FIX_BUGS 回退/断言）保留表外。
    ReanimTrackId aTrackName;
    if (static_cast<unsigned>(mTargetRow) < 5)
    {
        aTrackName = kBossSpawnTracks[mTargetRow];
    }
    else
    {
#ifdef DO_FIX_BUGS
        aTrackName = ReanimTrackId::anim_spawn_5;  // 泳池场景放僵尸崩溃的一种妥协的修复方式（不修改动画时）
#else
        TOD_ASSERT(false);
#endif
    }
    PlayZombieReanim(aTrackName, ReanimLoopType::REANIM_PLAY_ONCE_AND_HOLD, 20, 12.0f);
    mApp->PlayFoley(FoleyType::FOLEY_HYDRAULIC_SHORT);
}

// FormB BossHeadSpit 分发段（HEAD；前段与后段同 FormA，仅 switch→表）
__declspec(noinline) void Zombie::BossHeadSpit_B()
{
    Reanimation* aFireBallReanim = mApp->ReanimationTryToGet(mBossFireBallReanimID);
    if (aFireBallReanim)
    {
        aFireBallReanim->ReanimationDie();
        mBossFireBallReanimID = ReanimationID::REANIMATIONID_NULL;
    }

    mZombiePhase = ZombiePhase::PHASE_BOSS_HEAD_SPIT;
#ifdef DO_FIX_BUGS
    mFireballRow = RandRangeInt(0, mBoard->StageHas6Rows() ? 5 : 4);  // 泳池僵王兼容
#else
    mFireballRow = RandRangeInt(0, 4);
#endif
    mIsFireBall = RandRangeInt(0, 1) == 0;

    // B 形态 -> 常量表 kBossHeadTracks[5]（见上 namespace）：整型直下标；
    // default（DO_FIX_BUGS 回退/断言）保留表外。
    ReanimTrackId aTrackName;
    if (static_cast<unsigned>(mFireballRow) < 5)
    {
        aTrackName = kBossHeadTracks[mFireballRow];
    }
    else
    {
#ifdef DO_FIX_BUGS
        aTrackName = ReanimTrackId::anim_head_attack_5;  // 泳池场景吐球的一种妥协的修复方式（不修改动画时）
#else
        TOD_ASSERT(false);
#endif
    }
    PlayZombieReanim(aTrackName, ReanimLoopType::REANIM_PLAY_ONCE_AND_HOLD, 20, 12.0f);

    Reanimation* aBodyReanim = mApp->ReanimationGet(mBodyReanimID);
    if (mIsFireBall)
    {
        aBodyReanim->SetImageOverride(ReanimTrackId::Boss_eyeglow_red, nullptr);
        aBodyReanim->SetImageOverride(ReanimTrackId::Boss_mouthglow_red, nullptr);
    }
    else
    {
        aBodyReanim->SetImageOverride(ReanimTrackId::Boss_eyeglow_red, IMAGE_REANIM_ZOMBIE_BOSS_EYEGLOW_BLUE);
        aBodyReanim->SetImageOverride(ReanimTrackId::Boss_mouthglow_red, IMAGE_REANIM_ZOMBIE_BOSS_MOUTHGLOW_BLUE);
    }
}

// ==================== b07 EnableFuture / EnableMustache ====================
// FormA：f87ffc85^ 原 switch 逐字
__declspec(noinline) void Zombie::EnableMustache_A(bool theEnableMustache)
{
    if (mFromWave == Zombie::ZOMBIE_WAVE_UI)
        return;

    if (!mHasHead || Zombie::IsZombotany(mZombieType))
        return;

    Reanimation* aBodyReanim = mApp->ReanimationTryToGet(mBodyReanimID);
    if (aBodyReanim == nullptr || !aBodyReanim->TrackExists(ReanimTrackId::Zombie_mustache))
        return;

    if (theEnableMustache)
    {
        aBodyReanim->AssignRenderGroupToRange(ReanimTrackRanges::Zombie_mustache, RENDER_GROUP_NORMAL);

        switch (RandRangeInt(1, 3))
        {
        case 1:     aBodyReanim->SetImageOverride(ReanimTrackId::Zombie_mustache, nullptr);                          break;
        case 2:     aBodyReanim->SetImageOverride(ReanimTrackId::Zombie_mustache, IMAGE_REANIM_ZOMBIE_MUSTACHE2);    break;
        case 3:     aBodyReanim->SetImageOverride(ReanimTrackId::Zombie_mustache, IMAGE_REANIM_ZOMBIE_MUSTACHE3);    break;
        }
    }
    else
    {
        aBodyReanim->AssignRenderGroupToRange(ReanimTrackRanges::Zombie_mustache, RENDER_GROUP_HIDDEN);
    }
}

__declspec(noinline) void Zombie::EnableFuture_A(bool theEnableFuture)
{
    if (mFromWave == Zombie::ZOMBIE_WAVE_UI || Zombie::IsZombotany(mZombieType))
        return;

    Reanimation* aBodyReanim = mApp->ReanimationTryToGet(mBodyReanimID);
    if (aBodyReanim == nullptr || aBodyReanim->mReanimationType != ReanimationType::REANIM_ZOMBIE)
        return;

    if (theEnableFuture)
    {
        Image* aImage = nullptr;
        switch ((unsigned int)mBoard->ZombieGetID(this) % 4)
        {
        case 0:     aImage = IMAGE_REANIM_ZOMBIE_HEAD_SUNGLASSES1;      break;
        case 1:     aImage = IMAGE_REANIM_ZOMBIE_HEAD_SUNGLASSES2;      break;
        case 2:     aImage = IMAGE_REANIM_ZOMBIE_HEAD_SUNGLASSES3;      break;
        case 3:     aImage = IMAGE_REANIM_ZOMBIE_HEAD_SUNGLASSES4;      break;
        default:    TOD_ASSERT(false);                                       break;
        }
        aBodyReanim->SetImageOverride(ReanimTrackId::anim_head1, aImage);
    }
    else
    {
        aBodyReanim->SetImageOverride(ReanimTrackId::anim_head1, nullptr);
    }
}

namespace
{
// 秘技贴图表（手工生成）：太阳镜 %4 直下标；胡子 RandRangeInt(0,2) 直下标。
constexpr Image* const* kFutureSunglasses[4] = {
    &IMAGE_REANIM_ZOMBIE_HEAD_SUNGLASSES1,
    &IMAGE_REANIM_ZOMBIE_HEAD_SUNGLASSES2,
    &IMAGE_REANIM_ZOMBIE_HEAD_SUNGLASSES3,
    &IMAGE_REANIM_ZOMBIE_HEAD_SUNGLASSES4,
};
// Image* const* 形态（IMAGE_ 运行期装载，存变量地址）；槽 0 = nullptr（无样式）
constexpr Image* const* kMustacheStyles[3] = {
    nullptr,
    &IMAGE_REANIM_ZOMBIE_MUSTACHE2,
    &IMAGE_REANIM_ZOMBIE_MUSTACHE3,
};
// IMAGE_* 为运行期装载全局（非 constexpr），图片值锚定不能进 static_assert——
// 槽位数断言 + 注释行锚（首尾值在上方行内注释）
static_assert(sizeof(kFutureSunglasses) / sizeof(kFutureSunglasses[0]) == 4, "太阳镜表槽位");
static_assert(sizeof(kMustacheStyles) / sizeof(kMustacheStyles[0]) == 3, "胡子表槽位");
}  // namespace

//0x536C90
__declspec(noinline) void Zombie::EnableMustache_B(bool theEnableMustache)
{
    if (mFromWave == Zombie::ZOMBIE_WAVE_UI)
        return;

    if (!mHasHead || Zombie::IsZombotany(mZombieType))
        return;

    Reanimation* aBodyReanim = mApp->ReanimationTryToGet(mBodyReanimID);
    if (aBodyReanim == nullptr || !aBodyReanim->TrackExists(ReanimTrackId::Zombie_mustache))
        return;

    if (theEnableMustache)
    {
        aBodyReanim->AssignRenderGroupToRange(ReanimTrackRanges::Zombie_mustache, RENDER_GROUP_NORMAL);

        // 0 基随机下标直取（原 RandRangeInt(1,3) 改 0 基，消 -1 偏移；秘技路径
        // 一次性，RNG 流差异不可感知）
        Image* const* aMustache = kMustacheStyles[RandRangeInt(0, 2)];
        aBodyReanim->SetImageOverride(ReanimTrackId::Zombie_mustache,
            aMustache != nullptr ? *aMustache : nullptr);
    }
    else
    {
        aBodyReanim->AssignRenderGroupToRange(ReanimTrackRanges::Zombie_mustache, RENDER_GROUP_HIDDEN);
    }
}

//0x536D90
__declspec(noinline) void Zombie::EnableFuture_B(bool theEnableFuture)
{
    if (mFromWave == Zombie::ZOMBIE_WAVE_UI || Zombie::IsZombotany(mZombieType))
        return;

    Reanimation* aBodyReanim = mApp->ReanimationTryToGet(mBodyReanimID);
    if (aBodyReanim == nullptr || aBodyReanim->mReanimationType != ReanimationType::REANIM_ZOMBIE)
        return;

    if (theEnableFuture)
    {
        // B 形态 -> 常量表（下方 kFutureSunglasses；%4 值域必在 0..3，default 断言废弃）
        aBodyReanim->SetImageOverride(ReanimTrackId::anim_head1,
            *kFutureSunglasses[(unsigned int)mBoard->ZombieGetID(this) % 4]);
    }
    else
    {
        aBodyReanim->SetImageOverride(ReanimTrackId::anim_head1, nullptr);
    }
}

// ============================ main ============================
static Zombie g_z;
static Board g_board;
static LawnApp g_app;
static CutScene g_cut;
static Graphics g_gfx;

static void ResetLostArm(const R3Input& in, unsigned& flags)
{
    g_z.mApp = &g_app;
    g_z.mBoard = &g_board;
    g_app.mBoard = &g_board;
    g_board.mApp = &g_app;
    g_board.mCutScene = &g_cut;
    g_z.mZombieType = (ZombieType)(in.a % (int)ZombieType::NUM_ZOMBIE_TYPES);
    g_z.mZombiePhase = (ZombiePhase)(in.b % 40);
    g_z.mFromWave = (int)(in.a % 30) - 10;
    g_z.mPosX = (float)(in.c % 700);
    g_z.mPosY = (float)(in.d % 500);
    g_z.mVelX = (in.c % 2) ? 0.25f : -0.25f;
    g_z.mInPool = (in.b % 6 == 0);
    g_z.mRenderOrder = (int)(in.c % 1000);
    g_z.mBodyReanimID = (in.b % 7 == 0) ? (ReanimationID)0 : (ReanimationID)(1 + in.b % 2);
    g_z.mSpecialHeadReanimID = (ReanimationID)(1 + in.a % 2);
    g_z.mBossFireBallReanimID = (ReanimationID)(in.c % 5 == 0 ? 0 : 1);
    g_z.mBossMode = (int)(in.d % 3);
    g_z.mTargetRow = -1;
    g_z.mFireballRow = -1;
    g_z.mIsFireBall = false;
    g_z.mSummonCounter = 0;
    g_z.mHasHead = true;
    flags = in.d & 7u;
}

int main()
{
    int rc = 0;
    {
        auto reset = []() {};
        auto pa = [&](uint64_t& ck)
        {
            for (uint32_t i = 0; i < R3_N; i++)
            {
                unsigned fl; ResetLostArm(g_inputs[i], fl);
                g_z.SetupReanimForLostArm_A(fl);
                g_z.HashFold(ck);
            }
        };
        auto pb = [&](uint64_t& ck)
        {
            for (uint32_t i = 0; i < R3_N; i++)
            {
                unsigned fl; ResetLostArm(g_inputs[i], fl);
                g_z.SetupReanimForLostArm_B(fl);
                g_z.HashFold(ck);
            }
        };
        rc |= R3BenchMain("b05_SetupReanimForLostArm_3tables", reset, pa, pb);
    }
    {
        auto reset = []() {};
        auto pa = [&](uint64_t& ck)
        {
            for (uint32_t i = 0; i < R3_N; i++)
            {
                unsigned fl; ResetLostArm(g_inputs[i], fl);
                g_z.BossSpawnAttack_A();
                g_z.HashFold(ck);
            }
        };
        auto pb = [&](uint64_t& ck)
        {
            for (uint32_t i = 0; i < R3_N; i++)
            {
                unsigned fl; ResetLostArm(g_inputs[i], fl);
                g_z.BossSpawnAttack_B();
                g_z.HashFold(ck);
            }
        };
        rc |= R3BenchMain("b06a_BossSpawnAttack_kBossSpawnTracks", reset, pa, pb);
    }
    {
        auto reset = []() {};
        auto pa = [&](uint64_t& ck)
        {
            for (uint32_t i = 0; i < R3_N; i++)
            {
                unsigned fl; ResetLostArm(g_inputs[i], fl);
                g_z.BossHeadSpit_A();
                g_z.HashFold(ck);
            }
        };
        auto pb = [&](uint64_t& ck)
        {
            for (uint32_t i = 0; i < R3_N; i++)
            {
                unsigned fl; ResetLostArm(g_inputs[i], fl);
                g_z.BossHeadSpit_B();
                g_z.HashFold(ck);
            }
        };
        rc |= R3BenchMain("b06b_BossHeadSpit_kBossHeadTracks", reset, pa, pb);
    }
    {
        auto reset = []() {};
        auto pa = [&](uint64_t& ck)
        {
            for (uint32_t i = 0; i < R3_N; i++)
            {
                unsigned fl; ResetLostArm(g_inputs[i], fl);
                g_z.EnableMustache_A((i & 1) != 0);
                g_z.EnableFuture_A((i & 2) != 0);
                g_z.HashFold(ck);
            }
        };
        auto pb = [&](uint64_t& ck)
        {
            for (uint32_t i = 0; i < R3_N; i++)
            {
                unsigned fl; ResetLostArm(g_inputs[i], fl);
                g_z.EnableMustache_B((i & 1) != 0);
                g_z.EnableFuture_B((i & 2) != 0);
                g_z.HashFold(ck);
            }
        };
        rc |= R3BenchMain("b07_FutureMustache_selector_arrays", reset, pa, pb);
    }
    return rc;
}
