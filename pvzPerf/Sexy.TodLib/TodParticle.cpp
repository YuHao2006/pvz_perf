#include "TodDebug.h"
#include "Definition.h"
#include "TodParticle.h"
#include "EffectSystem.h"
#include "Reanimator.h"
#include "GameConstants.h"
#include "graphics/Graphics.h"
#include "graphics/DDInterface.h"
#include "graphics/RenderInterface.h"
#include "paklib/PakInterface.h"
#include <array>
#include <bit>
#include <span>
#include <stdexcept>
#include <memory>
#include "generated/ImageSymbolId.h"
namespace
{
	// 反射 CRC-32（多项式 0xEDB88320）查表改由 consteval 生成器在编译期填充
	// （模式同 SexyAppFramework/misc/Buffer.cpp 的 GenerateCRCTable/crc_table 先例），
	// 与旧函数内 static 表 + lazy flag 的逐位结果一致，无运行期首用锁。
	consteval std::array<std::uint32_t, 256> GenerateParticleCrcTable()
	{
		std::array<std::uint32_t, 256> aTable{};
		for (std::uint32_t i = 0; i < aTable.size(); i++)
		{
			std::uint32_t aValue = i;
			for (int aBit = 0; aBit < 8; aBit++)
				aValue = (aValue & 1) ? (0xEDB88320u ^ (aValue >> 1)) : (aValue >> 1);
			aTable[i] = aValue;
		}
		return aTable;
	}

	constexpr auto gParticleCrcTable = GenerateParticleCrcTable();
	static_assert(gParticleCrcTable[0] == 0x00000000u && gParticleCrcTable[1] == 0x77073096u &&
		gParticleCrcTable[255] == 0x2D02EF8Du,
		"particle CRC table must stay bit-for-bit identical to the old lazy-init table");
}

static std::uint32_t TodParticleCrc32(const std::uint8_t* theData, const std::size_t theSize)
{
	std::uint32_t aCrc = 0xFFFFFFFFu;
	for (std::size_t i = 0; i < theSize; i++)
		aCrc = gParticleCrcTable[(aCrc ^ theData[i]) & 0xFF] ^ (aCrc >> 8);
	return aCrc ^ 0xFFFFFFFFu;
}

namespace
{
using EmitterTrackMember = FloatParameterTrack TodEmitterDefinition::*;
constexpr EmitterTrackMember kEmitterSystemTracks[] = {
    &TodEmitterDefinition::mSystemDuration, &TodEmitterDefinition::mCrossFadeDuration,
    &TodEmitterDefinition::mSpawnRate, &TodEmitterDefinition::mSpawnMinActive,
    &TodEmitterDefinition::mSpawnMaxActive, &TodEmitterDefinition::mSpawnMaxLaunched,
    &TodEmitterDefinition::mEmitterRadius, &TodEmitterDefinition::mEmitterOffsetX,
    &TodEmitterDefinition::mEmitterOffsetY, &TodEmitterDefinition::mEmitterBoxX,
    &TodEmitterDefinition::mEmitterBoxY, &TodEmitterDefinition::mEmitterPath,
    &TodEmitterDefinition::mEmitterSkewX, &TodEmitterDefinition::mEmitterSkewY,
    &TodEmitterDefinition::mParticleDuration, &TodEmitterDefinition::mSystemRed,
    &TodEmitterDefinition::mSystemGreen, &TodEmitterDefinition::mSystemBlue,
    &TodEmitterDefinition::mSystemAlpha, &TodEmitterDefinition::mSystemBrightness,
    &TodEmitterDefinition::mLaunchSpeed, &TodEmitterDefinition::mLaunchAngle
};
constexpr EmitterTrackMember kEmitterParticleTracks[] = {
    &TodEmitterDefinition::mParticleRed, &TodEmitterDefinition::mParticleGreen,
    &TodEmitterDefinition::mParticleBlue, &TodEmitterDefinition::mParticleAlpha,
    &TodEmitterDefinition::mParticleBrightness, &TodEmitterDefinition::mParticleSpinAngle,
    &TodEmitterDefinition::mParticleSpinSpeed, &TodEmitterDefinition::mParticleScale,
    &TodEmitterDefinition::mParticleStretch, &TodEmitterDefinition::mCollisionReflect,
    &TodEmitterDefinition::mCollisionSpin, &TodEmitterDefinition::mClipTop,
    &TodEmitterDefinition::mClipBottom, &TodEmitterDefinition::mClipLeft,
    &TodEmitterDefinition::mClipRight, &TodEmitterDefinition::mAnimationRate
};
static_assert(std::size(kEmitterSystemTracks) == 22 && std::size(kEmitterParticleTracks) == 16);

void FreeParticleFields(EmitterFieldArray& fields)
{
    for (int i = 0; i < fields.count; ++i)
    {
        delete[] fields.Fields[i].mX.mNodes;
        delete[] fields.Fields[i].mY.mNodes;
    }
    delete[] fields.Fields;
    fields = {};
}

void FreeParticleDefinition(TodParticleDefinition& definition)
{
    for (int i = 0; i < definition.mEmitterDefCount; ++i)
    {
        TodEmitterDefinition& emitter = definition.mEmitterDefs[i];
        for (const auto member : kEmitterSystemTracks)
            delete[] (emitter.*member).mNodes;
        for (const auto member : kEmitterParticleTracks)
            delete[] (emitter.*member).mNodes;
        FreeParticleFields(emitter.mParticleFields);
        FreeParticleFields(emitter.mSystemFields);
    }
    delete[] definition.mEmitterDefs;
    definition.mEmitterDefs = nullptr;
    definition.mEmitterDefCount = 0;
    definition.mEmitterIndexByName.fill(-1);
}

class ParticleRecordReader final
{
public:
    explicit ParticleRecordReader(std::span<const std::uint8_t> bytes) : mBytes(bytes) {}

    std::span<const std::uint8_t> Take(std::size_t size)
    {
        if (size > mBytes.size() - mPosition)
            throw std::runtime_error("truncated particle record");
        const auto result = mBytes.subspan(mPosition, size);
        mPosition += size;
        return result;
    }
    std::uint32_t U32()
    {
        std::uint32_t value;
        const auto bytes = Take(sizeof(value));
        std::memcpy(&value, bytes.data(), sizeof(value));
        return value;
    }
    int I32() { return std::bit_cast<std::int32_t>(U32()); }
    bool AtEnd() const { return mPosition == mBytes.size(); }

    void Track(FloatParameterTrack& track)
    {
        const auto count = U32();
        if (count > 100000)
            throw std::runtime_error("particle track node count out of range");
        const auto bytes = Take(count * kFloatTrackNodeRecordSize);
        if (count == 0)
            return;
        auto nodes = std::make_unique<FloatParameterTrackNode[]>(count);
        for (std::uint32_t i = 0; i < count; ++i)
        {
            const auto* record = bytes.data() + i * kFloatTrackNodeRecordSize;
            FloatParameterTrackNode& node = nodes[i];
            std::memcpy(&node.mTime, record, 4);
            std::memcpy(&node.mLowValue, record + 4, 4);
            std::memcpy(&node.mHighValue, record + 8, 4);
            int curve, distribution;
            std::memcpy(&curve, record + 12, 4);
            std::memcpy(&distribution, record + 16, 4);
            if (unsigned(curve) > 13 || unsigned(distribution) > 13)
                throw std::runtime_error("particle track curve out of range");
            node.mCurveTypeEval = TodCurveResolveEval(curve);
            node.mDistributionEval = TodCurveResolveEval(distribution);
        }
        track.mNodes = nodes.release();
        track.mCountNodes = static_cast<int>(count);
    }

    void Fields(EmitterFieldArray& fields)
    {
        const auto count = U32();
        if (count > MAX_PARTICLE_FIELDS)
            throw std::runtime_error("particle field count out of range");
        if (count == 0)
            return;
        fields.Fields = new ParticleField[count]{};
        fields.count = static_cast<int>(count);
        for (std::uint32_t i = 0; i < count; ++i)
        {
            const int type = I32();
            if (type <= FIELD_INVALID || type >= PARTICLE_FIELD_COUNT)
                throw std::runtime_error("particle field type out of range");
            fields.Fields[i].mFieldType = static_cast<ParticleFieldType>(type);
            Track(fields.Fields[i].mX);
            Track(fields.Fields[i].mY);
        }
    }
private:
    std::span<const std::uint8_t> mBytes;
    std::size_t mPosition = 0;
};

void DecodeParticleRecord(TodParticleDefinition& definition, std::span<const std::uint8_t> bytes)
{
    ParticleRecordReader header(bytes);
    if (header.U32() != 0xDEADFED8u)
        throw std::runtime_error("particle record cookie mismatch");
    const auto payloadSize = header.U32();
    const auto storedCrc = header.U32();
    const auto payload = header.Take(payloadSize);
    if (!header.AtEnd() || TodParticleCrc32(payload.data(), payload.size()) != storedCrc)
        throw std::runtime_error("particle record size or CRC mismatch");

    ParticleRecordReader reader(payload);
    if (reader.U32() != 0x35504449u) // IDP5: compact scalar/track body, IDT3 and IDT5.
        throw std::runtime_error("particle record format mismatch");
    if (reader.U32() != TodImageSymbolRegistryHash())
        throw std::runtime_error("particle image registry mismatch");
    if (reader.U32() != kParticleEmitterNameTableHash)
        throw std::runtime_error("particle emitter ID table mismatch");
    const auto count = reader.U32();
    if (count > 1000)
        throw std::runtime_error("particle emitter count out of range");
    const auto bodySize = reader.U32();
    ParticleRecordReader body(reader.Take(bodySize));

    TodParticleDefinition pending{};
    const auto release = [](TodParticleDefinition* value) { FreeParticleDefinition(*value); };
    std::unique_ptr<TodParticleDefinition, decltype(release)> owner(&pending, release);
    pending.mEmitterDefs = new TodEmitterDefinition[count]{};
    pending.mEmitterDefCount = static_cast<int>(count);
    for (std::uint32_t i = 0; i < count; ++i)
    {
        TodEmitterDefinition& emitter = pending.mEmitterDefs[i];
        const auto imageId = body.U32();
        if (imageId > IMAGE_SYMBOL_ID_MAX)
            throw std::runtime_error("particle image symbol out of range");
        emitter.mImage = imageId ? TodDefinitionLoadImageById(imageId) : nullptr;
        emitter.mImageCol = body.I32();
        emitter.mImageRow = body.I32();
        emitter.mImageFrames = body.I32();
        emitter.mAnimated = body.I32();
        emitter.mParticleFlags = body.I32();
        const auto emitterType = body.U32();
        if (emitterType > static_cast<unsigned>(EmitterType::EMITTER_CIRCLE_EVEN_SPACING))
            throw std::runtime_error("particle emitter type out of range");
        emitter.mEmitterType = static_cast<EmitterType>(emitterType);
        for (const auto member : kEmitterSystemTracks)
            body.Track(emitter.*member);
        body.Fields(emitter.mParticleFields);
        body.Fields(emitter.mSystemFields);
        for (const auto member : kEmitterParticleTracks)
            body.Track(emitter.*member);
    }
    if (!body.AtEnd())
        throw std::runtime_error("particle body has trailing bytes");

    if (reader.U32() != 0x33544449u || reader.U32() != count)
        throw std::runtime_error("particle IDT3 section mismatch");
    for (std::uint32_t i = 0; i < count; ++i)
    {
        const auto target = reader.U32();
        if (target != 0xFFFFFFFFu && target >= count)
            throw std::runtime_error("particle IDT3 target out of range");
        pending.mEmitterDefs[i].mOnDurationEmitterIndex = target == 0xFFFFFFFFu ? -1 : int(target);
    }
    if (reader.U32() != 0x35544449u || reader.U32() != count)
        throw std::runtime_error("particle IDT5 section mismatch");
    for (std::uint32_t i = 0; i < count; ++i)
    {
        const auto id = reader.U32();
        if (id >= static_cast<unsigned>(ParticleEmitterName::top))
            throw std::runtime_error("particle name ID out of range");
        pending.mEmitterDefs[i].mNameId = static_cast<ParticleEmitterName>(id);
        if (pending.mEmitterIndexByName[id] < 0)
            pending.mEmitterIndexByName[id] = int(i);
    }
    if (!reader.AtEnd())
        throw std::runtime_error("particle record has trailing bytes");
    definition = pending;
    owner.release();
}
}

static bool TodParticleTryLoadDefinitionV4(TodParticleDefinition* theParticleDef, const char* theParticleFileName)
{
    const std::string path = DefinitionCompiledPath(theParticleFileName);
    PFILE* file = DefinitionOpenCompiledFile(path.c_str());
    if (!file)
        throw std::runtime_error("particle record missing: " + path);
    p_fseek(file, 0, 2);
    const long size = p_ftell(file);
    p_fseek(file, 0, 0);
    if (size < 12)
    {
        p_fclose(file);
        throw std::runtime_error("particle record truncated: " + path);
    }
    std::vector<std::uint8_t> bytes(size);
    const bool read = p_fread(bytes.data(), 1, bytes.size(), file) == bytes.size();
    p_fclose(file);
    if (!read)
        throw std::runtime_error("particle record unreadable: " + path);
    try
    {
        DecodeParticleRecord(*theParticleDef, bytes);
    }
    catch (const std::exception& error)
    {
        throw std::runtime_error(path + ": " + error.what());
    }
    return true;
}

int gParticleDefCount;                      // [0x6A9F08]
TodParticleDefinition* gParticleDefArray;   // [0x6A9F0C]
static int gParticleParamArraySize;				// [0x6A9F10]
static ParticleParams* gParticleParamArray;		// [0x6A9F14]

ParticleParams gLawnParticleArray[(int)ParticleEffect::NUM_PARTICLES] = {
	{ ParticleEffect::PARTICLE_MELONSPLASH, "particles\\MelonImpact.xml" },
	{ ParticleEffect::PARTICLE_WINTERMELON, "particles\\WinterMelonImpact.xml" },
	{ ParticleEffect::PARTICLE_FUMECLOUD, "particles\\FumeCloud.xml" },
	{ ParticleEffect::PARTICLE_POPCORNSPLASH, "particles\\PopcornSplash.xml" },
	{ ParticleEffect::PARTICLE_POWIE, "particles\\Powie.xml" },
	{ ParticleEffect::PARTICLE_JACKEXPLODE, "particles\\JackExplode.xml" },
	{ ParticleEffect::PARTICLE_ZOMBIE_HEAD, "particles\\ZombieHead.xml" },
	{ ParticleEffect::PARTICLE_ZOMBIE_ARM, "particles\\ZombieArm.xml" },
	{ ParticleEffect::PARTICLE_ZOMBIE_TRAFFIC_CONE, "particles\\ZombieTrafficCone.xml" },
	{ ParticleEffect::PARTICLE_ZOMBIE_PAIL, "particles\\ZombiePail.xml" },
	{ ParticleEffect::PARTICLE_ZOMBIE_HELMET, "particles\\ZombieHelmet.xml" },
	{ ParticleEffect::PARTICLE_ZOMBIE_FLAG, "particles\\ZombieFlag.xml" },
	{ ParticleEffect::PARTICLE_ZOMBIE_DOOR, "particles\\ZombieDoor.xml" },
	{ ParticleEffect::PARTICLE_ZOMBIE_NEWSPAPER, "particles\\ZombieNewspaper.xml" },
	{ ParticleEffect::PARTICLE_ZOMBIE_HEADLIGHT, "particles\\ZombieHeadLight.xml" },
	{ ParticleEffect::PARTICLE_POW, "particles\\Pow.xml" },
	{ ParticleEffect::PARTICLE_ZOMBIE_POGO, "particles\\ZombiePogo.xml" },
	{ ParticleEffect::PARTICLE_ZOMBIE_NEWSPAPER_HEAD, "particles\\ZombieNewspaperHead.xml" },
	{ ParticleEffect::PARTICLE_ZOMBIE_BALLOON_HEAD, "particles\\ZombieBalloonHead.xml" },
	{ ParticleEffect::PARTICLE_SOD_ROLL, "particles\\SodRoll.xml" },
	{ ParticleEffect::PARTICLE_GRAVE_STONE_RISE, "particles\\GraveStoneRise.xml" },
	{ ParticleEffect::PARTICLE_PLANTING, "particles\\Planting.xml" },
	{ ParticleEffect::PARTICLE_PLANTING_POOL, "particles\\PlantingPool.xml" },
	{ ParticleEffect::PARTICLE_ZOMBIE_RISE, "particles\\ZombieRise.xml" },
	{ ParticleEffect::PARTICLE_GRAVE_BUSTER, "particles\\GraveBuster.xml" },
	{ ParticleEffect::PARTICLE_GRAVE_BUSTER_DIE, "particles\\GraveBusterDie.xml" },
	{ ParticleEffect::PARTICLE_POOL_SPLASH, "particles\\PoolSplash.xml" },  // unused：全库零生成调用点（枚举值是存档/粒子池协议数字，保留占位不删）
	{ ParticleEffect::PARTICLE_ICE_SPARKLE, "particles\\IceSparkle.xml" },
	{ ParticleEffect::PARTICLE_SEED_PACKET, "particles\\SeedPacket.xml" },
	{ ParticleEffect::PARTICLE_TALL_NUT_BLOCK, "particles\\TallNutBlock.xml" },
	{ ParticleEffect::PARTICLE_DOOM, "particles\\Doom.xml" },
	{ ParticleEffect::PARTICLE_DIGGER_RISE, "particles\\DiggerRise.xml" },
	{ ParticleEffect::PARTICLE_DIGGER_TUNNEL, "particles\\DiggerTunnel.xml" },
	{ ParticleEffect::PARTICLE_DANCER_RISE, "particles\\DancerRise.xml" },
	{ ParticleEffect::PARTICLE_POOL_SPARKLY, "particles\\PoolSparkly.xml" },
	{ ParticleEffect::PARTICLE_WALLNUT_EAT_SMALL, "particles\\WallnutEatSmall.xml" },
	{ ParticleEffect::PARTICLE_WALLNUT_EAT_LARGE, "particles\\WallnutEatLarge.xml" },
	{ ParticleEffect::PARTICLE_PEA_SPLAT, "particles\\PeaSplat.xml" },
	{ ParticleEffect::PARTICLE_BUTTER_SPLAT, "particles\\ButterSplat.xml" },
	{ ParticleEffect::PARTICLE_CABBAGE_SPLAT, "particles\\CabbageSplat.xml" },
	{ ParticleEffect::PARTICLE_PUFF_SPLAT, "particles\\PuffSplat.xml" },
	{ ParticleEffect::PARTICLE_STAR_SPLAT, "particles\\StarSplat.xml" },
	{ ParticleEffect::PARTICLE_ICE_TRAP, "particles\\IceTrap.xml" },
	{ ParticleEffect::PARTICLE_SNOWPEA_SPLAT, "particles\\SnowPeaSplat.xml" },
	{ ParticleEffect::PARTICLE_SNOWPEA_PUFF, "particles\\SnowPeaPuff.xml" },
	{ ParticleEffect::PARTICLE_SNOWPEA_TRAIL, "particles\\SnowPeaTrail.xml" },
	{ ParticleEffect::PARTICLE_LANTERN_SHINE, "particles\\LanternShine.xml" },
	{ ParticleEffect::PARTICLE_SEED_PACKET_PICKUP, "particles\\Award.xml" },
	{ ParticleEffect::PARTICLE_POTATO_MINE, "particles\\PotatoMine.xml" },
	{ ParticleEffect::PARTICLE_POTATO_MINE_RISE, "particles\\PotatoMineRise.xml" },
	{ ParticleEffect::PARTICLE_PUFFSHROOM_TRAIL, "particles\\PuffShroomTrail.xml" },
	{ ParticleEffect::PARTICLE_PUFFSHROOM_MUZZLE, "particles\\PuffShroomMuzzle.xml" },
	{ ParticleEffect::PARTICLE_SEED_PACKET_FLASH, "particles\\SeedPacketFlash.xml" },
	{ ParticleEffect::PARTICLE_WHACK_A_ZOMBIE_RISE, "particles\\WhackAZombieRise.xml" },
	{ ParticleEffect::PARTICLE_ZOMBIE_LADDER, "particles\\ZombieLadder.xml" },
	{ ParticleEffect::PARTICLE_UMBRELLA_REFLECT, "particles\\UmbrellaReflect.xml" },
	{ ParticleEffect::PARTICLE_SEED_PACKET_PICK, "particles\\SeedPacketPick.xml" },
	{ ParticleEffect::PARTICLE_ICE_TRAP_ZOMBIE, "particles\\IceTrapZombie.xml" },  // unused：全库零生成调用点（枚举值是存档/粒子池协议数字，保留占位不删）
	{ ParticleEffect::PARTICLE_ICE_TRAP_RELEASE, "particles\\IceTrapRelease.xml" },
	{ ParticleEffect::PARTICLE_ZAMBONI_SMOKE, "particles\\ZamboniSmoke.xml" },
	{ ParticleEffect::PARTICLE_GLOOMCLOUD, "particles\\GloomCloud.xml" },
	{ ParticleEffect::PARTICLE_ZOMBIE_POGO_HEAD, "particles\\ZombiePogoHead.xml" },
	{ ParticleEffect::PARTICLE_ZAMBONI_TIRE, "particles\\ZamboniTire.xml" },
	{ ParticleEffect::PARTICLE_ZAMBONI_EXPLOSION, "particles\\ZamboniExplosion.xml" },
	{ ParticleEffect::PARTICLE_ZAMBONI_EXPLOSION2, "particles\\ZamboniExplosion2.xml" },
	{ ParticleEffect::PARTICLE_CATAPULT_EXPLOSION, "particles\\CatapultExplosion.xml" },
	{ ParticleEffect::PARTICLE_MOWER_CLOUD, "particles\\MowerCloud.xml" },
	{ ParticleEffect::PARTICLE_BOSS_ICE_BALL, "particles\\BossIceBallTrail.xml" },  // unused：全库零生成调用点（枚举值是存档/粒子池协议数字，保留占位不删）
	{ ParticleEffect::PARTICLE_BLASTMARK, "particles\\BlastMark.xml" },
	{ ParticleEffect::PARTICLE_COIN_PICKUP_ARROW, "particles\\CoinPickupArrow.xml" },
	{ ParticleEffect::PARTICLE_PRESENT_PICKUP, "particles\\PresentPickup.xml" },
	{ ParticleEffect::PARTICLE_IMITATER_MORPH, "particles\\ImitaterMorph.xml" },
	{ ParticleEffect::PARTICLE_MOWERED_ZOMBIE_HEAD, "particles\\MoweredZombieHead.xml" },
	{ ParticleEffect::PARTICLE_MOWERED_ZOMBIE_ARM, "particles\\MoweredZombieArm.xml" },
	{ ParticleEffect::PARTICLE_ZOMBIE_HEAD_POOL, "particles\\ZombieHeadPool.xml" },
	{ ParticleEffect::PARTICLE_ZOMBIE_BOSS_FIREBALL, "particles\\Zombie_boss_fireball.xml" },
	{ ParticleEffect::PARTICLE_FIREBALL_DEATH, "particles\\FireballDeath.xml" },  // unused：全库零生成调用点（枚举值是存档/粒子池协议数字，保留占位不删）
	{ ParticleEffect::PARTICLE_ICEBALL_DEATH, "particles\\IceballDeath.xml" },
	{ ParticleEffect::PARTICLE_ICEBALL_TRAIL, "particles\\Iceball_Trail.xml" },
	{ ParticleEffect::PARTICLE_FIREBALL_TRAIL, "particles\\Fireball_Trail.xml" },
	{ ParticleEffect::PARTICLE_BOSS_EXPLOSION, "particles\\BossExplosion.xml" },
	{ ParticleEffect::PARTICLE_SCREEN_FLASH, "particles\\ScreenFlash.xml" },
	{ ParticleEffect::PARTICLE_TROPHY_SPARKLE, "particles\\TrophySparkle.xml" },
	{ ParticleEffect::PARTICLE_PORTAL_CIRCLE, "particles\\PortalCircle.xml" },
	{ ParticleEffect::PARTICLE_PORTAL_SQUARE, "particles\\PortalSquare.xml" },
	{ ParticleEffect::PARTICLE_POTTED_PLANT_GLOW, "particles\\PottedPlantGlow.xml" },  // unused：全库零生成调用点（枚举值是存档/粒子池协议数字，保留占位不删）
	{ ParticleEffect::PARTICLE_POTTED_WATER_PLANT_GLOW, "particles\\PottedWaterPlantGlow.xml" },
	{ ParticleEffect::PARTICLE_POTTED_ZEN_GLOW, "particles\\PottedZenGlow.xml" },
	{ ParticleEffect::PARTICLE_MIND_CONTROL, "particles\\MindControl.xml" },
	{ ParticleEffect::PARTICLE_VASE_SHATTER, "particles\\VaseShatter.xml" },
	{ ParticleEffect::PARTICLE_VASE_SHATTER_LEAF, "particles\\VaseShatterLeaf.xml" },
	{ ParticleEffect::PARTICLE_VASE_SHATTER_ZOMBIE, "particles\\VaseShatterZombie.xml" },
	{ ParticleEffect::PARTICLE_AWARD_PICKUP_ARROW, "particles\\AwardPickupArrow.xml" },
	{ ParticleEffect::PARTICLE_ZOMBIE_SEAWEED, "particles\\Zombie_seaweed.xml" },
	{ ParticleEffect::PARTICLE_ZOMBIE_MUSTACHE, "particles\\ZombieMustache.xml" },
	{ ParticleEffect::PARTICLE_ZOMBIE_SUNGLASS, "particles\\ZombieFutureGlasses.xml" },
	{ ParticleEffect::PARTICLE_ZOMBIE_PINATA, "particles\\Pinata.xml" },
	{ ParticleEffect::PARTICLE_DUST_SQUASH, "particles\\Dust_Squash.xml" },
	{ ParticleEffect::PARTICLE_DUST_FOOT, "particles\\Dust_Foot.xml" },
	{ ParticleEffect::PARTICLE_ZOMBIE_DAISIES, "particles\\Daisy.xml" },
	{ ParticleEffect::PARTICLE_CREDIT_STROBE, "particles\\Credits_Strobe.xml" },
	{ ParticleEffect::PARTICLE_CREDITS_RAYSWIPE, "particles\\Credits_RaysWipe.xml" },
	{ ParticleEffect::PARTICLE_CREDITS_ZOMBIEHEADWIPE, "particles\\Credits_ZombieHeadWipe.xml" },
	{ ParticleEffect::PARTICLE_STARBURST, "particles\\Starburst.xml" },
	{ ParticleEffect::PARTICLE_CREDITS_FOG, "particles\\Credits_fog.xml" },
	{ ParticleEffect::PARTICLE_PERSENT_PICK_UP_ARROW, "particles\\UpsellArrow.xml" },
};  // 0x6A0FF0

//0x515640 : (ecx = *theParticleFileName, *theParticleDef)  //esp -= 4
static bool TodParticleLoadADef(TodParticleDefinition* theParticleDef, const char* theParticleFileName)
{
	TodHesitationBracket(("Load Particle %s"), theParticleFileName);
	// v4 唯一装载（用户裁决，与 reanim 同法）：烘焙符号号，记录内零资源
	// 字符串；缺失/损坏/注册表错配均已在其内硬错，不回落 v2/v1 掩盖。
	if (!TodParticleTryLoadDefinitionV4(theParticleDef, theParticleFileName))
		return false;
	for (int i = 0; i < theParticleDef->mEmitterDefCount; i++)
	{
		TodEmitterDefinition& aDef = theParticleDef->mEmitterDefs[i];
		FloatTrackSetDefault(aDef.mSystemDuration, 0.0f);
		FloatTrackSetDefault(aDef.mSpawnRate, 0.0f);
		FloatTrackSetDefault(aDef.mSpawnMinActive, -1.0f);
		FloatTrackSetDefault(aDef.mSpawnMaxActive, -1.0f);
		FloatTrackSetDefault(aDef.mSpawnMaxLaunched, -1.0f);
		FloatTrackSetDefault(aDef.mEmitterRadius, 0.0f);
		FloatTrackSetDefault(aDef.mEmitterOffsetX, 0.0f);
		FloatTrackSetDefault(aDef.mEmitterOffsetY, 0.0f);
		FloatTrackSetDefault(aDef.mEmitterBoxX, 0.0f);
		FloatTrackSetDefault(aDef.mEmitterBoxY, 0.0f);
		FloatTrackSetDefault(aDef.mEmitterSkewX, 0.0f);
		FloatTrackSetDefault(aDef.mEmitterSkewY, 0.0f);
		FloatTrackSetDefault(aDef.mParticleDuration, 100.0f);
		FloatTrackSetDefault(aDef.mLaunchSpeed, 0.0f);
		FloatTrackSetDefault(aDef.mSystemRed, 1.0f);
		FloatTrackSetDefault(aDef.mSystemGreen, 1.0f);
		FloatTrackSetDefault(aDef.mSystemBlue, 1.0f);
		FloatTrackSetDefault(aDef.mSystemAlpha, 1.0f);
		FloatTrackSetDefault(aDef.mSystemBrightness, 1.0f);
		FloatTrackSetDefault(aDef.mLaunchAngle, 0.0f);
		FloatTrackSetDefault(aDef.mCrossFadeDuration, 0.0f);
		FloatTrackSetDefault(aDef.mParticleRed, 1.0f);
		FloatTrackSetDefault(aDef.mParticleGreen, 1.0f);
		FloatTrackSetDefault(aDef.mParticleBlue, 1.0f);
		FloatTrackSetDefault(aDef.mParticleAlpha, 1.0f);
		FloatTrackSetDefault(aDef.mParticleBrightness, 1.0f);
		FloatTrackSetDefault(aDef.mParticleSpinAngle, 0.0f);
		FloatTrackSetDefault(aDef.mParticleSpinSpeed, 0.0f);
		FloatTrackSetDefault(aDef.mParticleScale, 1.0f);
		FloatTrackSetDefault(aDef.mParticleStretch, 1.0f);
		FloatTrackSetDefault(aDef.mCollisionReflect, 0.0f);
		FloatTrackSetDefault(aDef.mCollisionSpin, 0.0f);
		FloatTrackSetDefault(aDef.mClipTop, 0.0f);
		FloatTrackSetDefault(aDef.mClipBottom, 0.0f);
		FloatTrackSetDefault(aDef.mClipLeft, 0.0f);
		FloatTrackSetDefault(aDef.mClipRight, 0.0f);
		FloatTrackSetDefault(aDef.mAnimationRate, 0.0f);
	}
	return true;
}

//0x515CE0
void TodParticleLoadDefinitions(ParticleParams* theParticleParamArray, int theParticleParamArraySize)
{
	TodHesitationBracket aHesitiation("TodParticleLoadDefinitions");
	TOD_ASSERT(!gParticleParamArray && !gParticleDefArray);
	// 1073 initializes every emitter pointer/count before loading the first file.
	// Publish only after allocation succeeds, so cleanup never sees a count with
	// a null array, or garbage in definitions that have not been loaded yet.
	auto* aDefinitions = new TodParticleDefinition[theParticleParamArraySize]{};
	gParticleParamArraySize = theParticleParamArraySize;
	gParticleParamArray = theParticleParamArray;
	gParticleDefCount = theParticleParamArraySize;
	gParticleDefArray = aDefinitions;

	for (int i = 0; i < gParticleParamArraySize; i++)
	{
		ParticleParams& aParticleParams = gParticleParamArray[i];
		TOD_ASSERT(aParticleParams.mParticleEffect == i);
		if (!TodParticleLoadADef(&gParticleDefArray[i], aParticleParams.mParticleFileName))
		{
			const std::string aMessage = std::string("Failed to load particle '") + aParticleParams.mParticleFileName + "'";
			TodErrorMessageBox(aMessage.c_str(), "Error");
		}
		gSexyAppBase->mCompletedLoadingThreadTasks += 6;
	}

	// P5-④：粒子 def 渲染轨道预扫描位掩码（装载后一次性；bit=通道有已设轨）
	for (int d = 0; d < gParticleDefCount; d++)
		for (int e = 0; e < gParticleDefArray[d].mEmitterDefCount; e++)
		{
			TodEmitterDefinition& aDef = gParticleDefArray[d].mEmitterDefs[e];
			unsigned aMask = 0;
			auto has = [&aMask](int bit, const FloatParameterTrack& t) { if (FloatTrackIsSet(t)) aMask |= 1u << bit; };
			has(0, aDef.mSystemRed); has(1, aDef.mSystemGreen); has(2, aDef.mSystemBlue);
			has(3, aDef.mSystemAlpha); has(4, aDef.mSystemBrightness);
			has(5, aDef.mParticleRed); has(6, aDef.mParticleGreen); has(7, aDef.mParticleBlue);
			has(8, aDef.mParticleAlpha); has(9, aDef.mParticleBrightness);
			has(10, aDef.mParticleScale); has(11, aDef.mParticleStretch);
			has(12, aDef.mParticleSpinSpeed); has(13, aDef.mParticleSpinAngle);
			aDef.mRenderTrackMask = aMask;
		}
}

//0x515E30
void TodParticleFreeDefinitions()
{
	for (int i = 0; i < gParticleDefCount; i++)
		FreeParticleDefinition(gParticleDefArray[i]);
	delete[] gParticleDefArray;
	gParticleDefArray = nullptr;
	gParticleDefCount = 0;
	gParticleParamArray = nullptr;
	gParticleParamArraySize = 0;
}

TodParticleSystem::TodParticleSystem()
{
	mEffectType = ParticleEffect::PARTICLE_NONE;
	mParticleDef = nullptr;
	mParticleHolder = nullptr;
	mDead = false;
	mDontUpdate = false;
	mIsAttachment = false;
	mRenderOrder = 0;
}

TodParticleSystem::~TodParticleSystem()
{
	ParticleSystemDie();  // Die 内已清册（P3 名册化）；退役链表占位随 TodList 删除（2026-10-02）
}

//0x515E90 : (edx = theEffectType, *theDefinition, ecx = theRenderOrder, theY, theX, *this)
void TodParticleSystem::TodParticleInitializeFromDef(float theX, float theY, int theRenderOrder, TodParticleDefinition* theDefinition, ParticleEffect theEffectType)
{
	TOD_ASSERT(mParticleHolder);
	// 名册侧表：系统池槽位键天然就位，无需分配器（链表成员已退役）
	mParticleDef = theDefinition;
	mEffectType = theEffectType;
	mRenderOrder = theRenderOrder;

	for (int i = 0; i < theDefinition->mEmitterDefCount; i++)
	{
		TodEmitterDefinition& aDef = theDefinition->mEmitterDefs[i];
		if (!FloatTrackIsSet(aDef.mCrossFadeDuration))
		{
			if (TestBit(aDef.mParticleFlags, (int)ParticleFlags::PARTICLE_DIE_IF_OVERLOADED) && mParticleHolder->IsOverLoaded())
			{
				ParticleSystemDie();
				break;
			}
			TodParticleEmitter* aEmitter = mParticleHolder->mEmitters.DataArrayAlloc();
			aEmitter->TodEmitterInitialize(theX, theY, this, &aDef);
			EmitterRosterAdd(aEmitter);
		}
	}
}

//0x515F70 : (*theEmitterDef, *theSystem, theY, theX, ecx = *this)
void TodParticleEmitter::TodEmitterInitialize(float theX, float theY, TodParticleSystem* theSystem, TodEmitterDefinition* theEmitterDef)
{
	mSpawnAccum = 0.0f;
	mParticlesSpawned = 0;
	mSystemTimeValue = -1.0f;
	mSystemLastTimeValue = -1.0f;
	mSystemAge = -1;
	mDead = false;
	mColorOverride = Sexy::Color::White;
	mSystemCenter.x = theX;
	mSystemCenter.y = theY;
	mFrameOverride = -1;
	mParticleSystem = theSystem;
	mScaleOverride = 1.0f;
	mExtraAdditiveDrawOverride = false;
	mImageOverride = nullptr;
	mSystemDuration = 0;
	mEmitterDef = theEmitterDef;
	// 粒子名册侧表：发射器池槽位键天然就位，无需分配器（链表成员已退役）

	if (FloatTrackIsSet(mEmitterDef->mSystemDuration))
		mSystemDuration = FloatTrackEvaluate(mEmitterDef->mSystemDuration, 0.0f, Sexy::Rand(1.0f));
	else
		mSystemDuration = FloatTrackEvaluate(mEmitterDef->mParticleDuration, 0.0f, 1.0f);
	mSystemDuration = std::max(1, mSystemDuration);

	for (int i = 0; i < mEmitterDef->mSystemFields.count; i++)
	{
		mSystemFieldInterp[i][0] = Sexy::Rand(1.0f);
		mSystemFieldInterp[i][1] = Sexy::Rand(1.0f);
	}
	for (int j = 0; j < 10; j++)
		mTrackInterp[j] = Sexy::Rand(1.0f);

	Update();
}

//0x5160C0
void TodParticleSystem::ParticleSystemDie()
{
	{
		const int aCount = EmitterRosterCount();
		for (int i = 0; i < aCount; i++)
		{
			TodParticleEmitter* aEmitter = EmitterRosterEmitterAt(i);
			aEmitter->DeleteAll();
			mParticleHolder->mEmitters.DataArrayFree(aEmitter);
		}
	}
	EmitterRosterClear();
	mDead = true;
}


//0x516160
TodParticle* TodParticleEmitter::SpawnParticle(int theIndex, int theSpawnCount)
{
	// TodParticleEmitter::SpawnParticle 发射几何分发表：表内匿名 lambda =
	// 原 case 体逐句迁移（生成器 + 逆变换 token 对拍 0 差异）；圆形三标签
	// 共体具名；default 具名并被越界复用。
	using ParticleSpawnPosCaseFn = void (*)(TodParticleEmitter&, float, float&, float&);

	// 标签共体（匿名 lambda 无法跨槽复用，复用即具名）
	// 原 case EMITTER_CIRCLE, EMITTER_CIRCLE_PATH, EMITTER_CIRCLE_EVEN_SPACING
	static constexpr auto ParticleSpawnPosEmitterCircle = [](TodParticleEmitter& e, float aLaunchAngle, float& aPosX, float& aPosY)
	{
	float aEmitterRadiusInterp = Sexy::Rand(1.0f);
	float aRadius = FloatTrackEvaluate(e.mEmitterDef->mEmitterRadius, e.mSystemTimeValue, aEmitterRadiusInterp);
	// ★ 以竖直向下的方向为 0 角度
	aPosX = sin(aLaunchAngle) * aRadius;
	aPosY = cos(aLaunchAngle) * aRadius;
	};

	// 原 default（无 case 的 0 型与表外哨兵共用）
	static constexpr auto ParticleSpawnPosDefault = [](TodParticleEmitter& e, float aLaunchAngle, float& aPosX, float& aPosY)
	{
	TOD_ASSERT(false);
	};

	// 匿名 lambda 函数指针表，行序 = EmitterType 枚举值序（0..4）。
	static constexpr ParticleSpawnPosCaseFn kParticleSpawnPosCases[(int)EmitterType::EMITTER_CIRCLE_EVEN_SPACING + 1] = {
	ParticleSpawnPosEmitterCircle,  // 0 EMITTER_CIRCLE（共体）
	// 原 case EMITTER_BOX
	[](TodParticleEmitter& e, float aLaunchAngle, float& aPosX, float& aPosY)
	{
	float aEmitterBoxXInterp = Sexy::Rand(1.0f);
	float aEmitterBoxYInterp = Sexy::Rand(1.0f);
	aPosX = FloatTrackEvaluate(e.mEmitterDef->mEmitterBoxX, e.mSystemTimeValue, aEmitterBoxXInterp);
	aPosY = FloatTrackEvaluate(e.mEmitterDef->mEmitterBoxY, e.mSystemTimeValue, aEmitterBoxYInterp);
	},  // 1 EMITTER_BOX
	// 原 case EMITTER_BOX_PATH
	[](TodParticleEmitter& e, float aLaunchAngle, float& aPosX, float& aPosY)
	{
	float aEmitterPathPosition = FloatTrackEvaluate(e.mEmitterDef->mEmitterPath, e.mSystemTimeValue, e.mTrackInterp[ParticleSystemTracks::TRACK_EMITTER_PATH]);
	float aMinX = FloatTrackEvaluate(e.mEmitterDef->mEmitterBoxX, e.mSystemTimeValue, 0.0f);
	float aMaxX = FloatTrackEvaluate(e.mEmitterDef->mEmitterBoxX, e.mSystemTimeValue, 1.0f);
	float aMinY = FloatTrackEvaluate(e.mEmitterDef->mEmitterBoxY, e.mSystemTimeValue, 0.0f);
	float aMaxY = FloatTrackEvaluate(e.mEmitterDef->mEmitterBoxY, e.mSystemTimeValue, 1.0f);
	float aDistanceX = aMaxX - aMinX;  // 路径矩形的横向宽度
	float aDistanceY = aMaxY - aMinY;  // 路径矩形的纵向高度
	float aPathPos = aEmitterPathPosition * (aDistanceY + aDistanceX + aDistanceY + aDistanceX);  // 发射点位于矩形边上的位置
	// ★ 注释规定：以矩形左上的顶点开始，按逆时针方向依次将矩形的四个顶点标记为 A、B、C、D，并标记发射点为 P
	// ★           如此，aPathPos 即为 P 点与 A 点在矩形路径上的距离。注意，游戏中取横向水平向右和纵向竖直向下为正方向。
	if (aPathPos < aDistanceY)  // 发射点落在矩形 AB 边（左边）上
	{
	aPosX = aMinX;  // 横坐标 = 矩形左端横坐标
	aPosY = aMinY + aPathPos;  // 纵坐标 = 矩形底端坐标 + |PA|
	}
	else if (aPathPos < aDistanceY + aDistanceX)  // 发射点落在矩形 BC 边（顶边）上
	{
	aPosX = aMinX + (aPathPos - aDistanceY);  // 横坐标 = 矩形左端横坐标 + |PB|
	aPosY = aMaxY;
	}
	else if (aPathPos < aDistanceY + aDistanceX + aDistanceY)  // 发射点落在矩形 CD 边（右边）上
	{
	aPosX = aMaxX;
	aPosY = aMaxY - (aPathPos - aDistanceY - aDistanceX);  // 纵坐标 = 矩形顶端纵坐标 - |PC|
	}
	else  // 发射点落在矩形 AD 边（底边）上
	{
	aPosX = aMaxX - (aPathPos - aDistanceY - aDistanceX - aDistanceY);  // 横坐标 = 矩形右端横坐标 - |PD|
	aPosY = aMinY;
	}
	},  // 2 EMITTER_BOX_PATH
	ParticleSpawnPosEmitterCircle,  // 3 EMITTER_CIRCLE_PATH（共体）
	ParticleSpawnPosEmitterCircle,  // 4 EMITTER_CIRCLE_EVEN_SPACING（共体）
	};
	static_assert(sizeof(kParticleSpawnPosCases) / sizeof(kParticleSpawnPosCases[0]) ==
	(int)EmitterType::EMITTER_CIRCLE_EVEN_SPACING + 1, "kParticleSpawnPosCases 槽位数须与 EmitterType 枚举同步");

	DataArray<TodParticle>& aDataArray = mParticleSystem->mParticleHolder->mParticles;
	if (aDataArray.mSize == aDataArray.mMaxSize)
	{
		TodTraceWithoutSpamming("Too many particles (emitter id=%u)\n", static_cast<unsigned>(mEmitterDef->mNameId));
		return nullptr;
	}

	TodParticle* aParticle = aDataArray.DataArrayAlloc();
	TOD_ASSERT(mEmitterDef->mParticleFields.count <= MAX_PARTICLE_FIELDS);
	for (int i = 0; i < mEmitterDef->mParticleFields.count; i++)
	{
		aParticle->mParticleFieldInterp[i][0] = Sexy::Rand(1.0f);  // 初始化每个粒子场的横向插值
		aParticle->mParticleFieldInterp[i][1] = Sexy::Rand(1.0f);  // 初始化每个粒子场的纵向插值
	}
	for (int i = 0; i < (int)ParticleTracks::NUM_PARTICLE_TRACKS; i++)
		aParticle->mParticleInterp[i] = Sexy::Rand(1.0f);  // 初始化每条通道的插值

	float aParticleDurationInterp = Sexy::Rand(1.0f);
	float aLaunchSpeedInterp = Sexy::Rand(1.0f);
	float aEmitterOffsetXInterp = Sexy::Rand(1.0f);
	float aEmitterOffsetYInterp = Sexy::Rand(1.0f);
	aParticle->mParticleDuration = FloatTrackEvaluate(mEmitterDef->mParticleDuration, mSystemTimeValue, aParticleDurationInterp);
	aParticle->mParticleDuration = std::max(1, aParticle->mParticleDuration);  // 初始化粒子持续时间（至少为 1）
	aParticle->mParticleDurationInv = 1.0f / (aParticle->mParticleDuration - 1);  // 持续期倒数：时间值由除改乘
	aParticle->mParticleAge = 0;
	aParticle->mParticleEmitter = this;
	aParticle->mParticleTimeValue = -1.0f;
	aParticle->mParticleLastTimeValue = -1.0f;
	if (TestBit(mEmitterDef->mParticleFlags, (int)ParticleFlags::PARTICLE_RANDOM_START_TIME))
		aParticle->mParticleAge = Sexy::Rand(aParticle->mParticleDuration);  // 对于“随机初始时间”的粒子
	float aLaunchSpeed = FloatTrackEvaluate(mEmitterDef->mLaunchSpeed, mSystemTimeValue, aLaunchSpeedInterp) * 0.01f;
	float aLaunchAngleInterp = Sexy::Rand(1.0f);

	float aLaunchAngle;
	if (mEmitterDef->mEmitterType == EmitterType::EMITTER_CIRCLE_PATH)
	{
		// 发射角度 = 根据路径定义计算的圆周上的基础角度 + 根据发射角度定义计算的额外偏移的角度
		aLaunchAngle = FloatTrackEvaluate(mEmitterDef->mEmitterPath, mSystemTimeValue, mTrackInterp[ParticleSystemTracks::TRACK_EMITTER_PATH]) * 2 * PI;
		aLaunchAngle += DEG_TO_RAD(FloatTrackEvaluate(mEmitterDef->mLaunchAngle, mSystemTimeValue, aLaunchAngleInterp));
	}
	else if (mEmitterDef->mEmitterType == EmitterType::EMITTER_CIRCLE_EVEN_SPACING)
		// 基础发射角度要使 theSpawnCount 个粒子平均布满圆周
		aLaunchAngle = 2 * PI * theIndex / theSpawnCount + DEG_TO_RAD(FloatTrackEvaluate(mEmitterDef->mLaunchAngle, mSystemTimeValue, aLaunchAngleInterp));
	else if (FloatTrackIsConstantZero(mEmitterDef->mLaunchAngle))
		// 未定义的轨道，发射角度直接取 [0, 2π] 的随机值
		aLaunchAngle = Sexy::Rand((float)(2 * PI));
	else
		// 其他情况下，根据发射角度的定义值计算
		aLaunchAngle = DEG_TO_RAD(FloatTrackEvaluate(mEmitterDef->mLaunchAngle, mSystemTimeValue, aLaunchAngleInterp));

	float aPosX, aPosY;
	// C 形态 -> 匿名 lambda 函数指针表：行序 = EmitterType 枚举序（0..4）。
	// 三种圆形发射器标签共体 → 具名（匿名 lambda 无法跨槽复用）；
	// aPosX/aPosY 经引用直写（分发点之后消费）；发射角经值参直传。
	// default（TOD_ASSERT）具名并被越界分支复用。
	const unsigned aEmitterKindIndex = static_cast<unsigned>(mEmitterDef->mEmitterType);
	if (aEmitterKindIndex <= static_cast<unsigned>(EmitterType::EMITTER_CIRCLE_EVEN_SPACING))
	{
		kParticleSpawnPosCases[aEmitterKindIndex](*this, aLaunchAngle, aPosX, aPosY);
	}
	else
	{
		ParticleSpawnPosDefault(*this, aLaunchAngle, aPosX, aPosY);
	}

	float aEmitterSkewXInterp = Sexy::Rand(1.0f);
	float aEmitterSkewYInterp = Sexy::Rand(1.0f);
	float aSkewX = FloatTrackEvaluate(mEmitterDef->mEmitterSkewX, mSystemTimeValue, aEmitterSkewXInterp);
	float aSkewY = FloatTrackEvaluate(mEmitterDef->mEmitterSkewY, mSystemTimeValue, aEmitterSkewYInterp);
	aParticle->mPosition.x = mSystemCenter.x + aPosX + aPosY * aSkewX;  // 横向（左右）倾斜的幅度受纵坐标影响
	aParticle->mPosition.y = mSystemCenter.y + aPosY + aPosX * aSkewY;  // 纵向（上下）倾斜的幅度受横坐标影响
	aParticle->mVelocity.x = sin(aLaunchAngle) * aLaunchSpeed;
	aParticle->mVelocity.y = cos(aLaunchAngle) * aLaunchSpeed;
	aParticle->mPosition.x += FloatTrackEvaluate(mEmitterDef->mEmitterOffsetX, mSystemTimeValue, aEmitterOffsetXInterp);  // 横坐标加上横向偏移值
	aParticle->mPosition.y += FloatTrackEvaluate(mEmitterDef->mEmitterOffsetY, mSystemTimeValue, aEmitterOffsetYInterp);  // 纵坐标加上纵向偏移值
	
	aParticle->mAnimationTimeValue = 0.0f;
	if (mEmitterDef->mAnimated || FloatTrackIsSet(mEmitterDef->mAnimationRate))
		aParticle->mImageFrame = 0;  // 如果定义了粒子动态或动画速率，则粒子的当前帧将在后续根据粒子时间值或动画循环率实时计算，此处先初始化为 0
	else
		aParticle->mImageFrame = Sexy::Rand(mEmitterDef->mImageFrames);  // 对于帧固定的粒子，在贴图的所有帧中随机取得一帧，后续一般不再变化

	if (TestBit(mEmitterDef->mParticleFlags, (int)ParticleFlags::PARTICLE_RANDOM_LAUNCH_SPIN))
		aParticle->mSpinPosition = Sexy::Rand((float)(2 * PI));  // 在 [0, 2π] 之间随机取得一个初始旋转角度
	else if (TestBit(mEmitterDef->mParticleFlags, (int)ParticleFlags::PARTICLE_ALIGN_LAUNCH_SPIN))
		aParticle->mSpinPosition = aLaunchAngle;  // 粒子旋转角度对齐发射角度
	else
		aParticle->mSpinPosition = 0.0f;  // 默认无初始旋转
	aParticle->mSpinVelocity = 0.0f;
	aParticle->mCrossFadeDuration = 0;
	aParticle->mCrossFadeParticleID = ParticleID::PARTICLEID_NULL;

	if (!ParticleRosterAdd(aParticle))
	{
		aDataArray.DataArrayFree(aParticle);  // 名册满回滚 = 池满同款（宁可丢不崩）
		return nullptr;
	}
	mParticlesSpawned++;
	UpdateParticle(aParticle);
	return aParticle;
}

float TodParticleEmitter::ParticleTrackEvaluate(FloatParameterTrack& theTrack, TodParticle* theParticle, ParticleTracks theParticleTrack)
{
	return FloatTrackEvaluate(theTrack, theParticle->mParticleTimeValue, theParticle->mParticleInterp[(int)theParticleTrack]);
}

namespace
{
// TodParticleEmitter::UpdateParticleField 物理场分发表：表内匿名 lambda =
// 原 case 体逐句迁移（生成器 + 逆变换 token 对拍 0 差异）；INVALID 槽空
// 操作；default 具名并被缺槽/越界复用。
using ParticleFieldCaseFn = void (*)(TodParticleEmitter&, TodParticle*, ParticleField*, float, float, float, float, float);

// 原 default（无 case 的 1 型与表外哨兵共用）
void ParticleFieldDefault(TodParticleEmitter& e, TodParticle* theParticle, ParticleField* theParticleField, float theParticleTimeValue, float x, float y, float aInterpX, float aInterpY)
{
    		TOD_ASSERT(0);
}

// 匿名 lambda 函数指针表，行序 = ParticleFieldType 枚举值序（0..11）。
constexpr ParticleFieldCaseFn kParticleFieldCases[(int)ParticleFieldType::PARTICLE_FIELD_COUNT] = {
    // 原 case FIELD_INVALID
    [](TodParticleEmitter& e, TodParticle* theParticle, ParticleField* theParticleField, float theParticleTimeValue, float x, float y, float aInterpX, float aInterpY)
    {

    },  // 0 FIELD_INVALID
    // 原 case FIELD_FRICTION
    [](TodParticleEmitter& e, TodParticle* theParticle, ParticleField* theParticleField, float theParticleTimeValue, float x, float y, float aInterpX, float aInterpY)
    {
    // 摩擦力场
        theParticle->mVelocity.x *= Sexy::UpdateDecay(1 - x);
        theParticle->mVelocity.y *= Sexy::UpdateDecay(1 - y);
    },  // 1 FIELD_FRICTION
    // 原 case FIELD_ACCELERATION
    [](TodParticleEmitter& e, TodParticle* theParticle, ParticleField* theParticleField, float theParticleTimeValue, float x, float y, float aInterpX, float aInterpY)
    {
    // 加速度场
        theParticle->mVelocity.x += Sexy::UpdateDelta(0.01f * x);
        theParticle->mVelocity.y += Sexy::UpdateDelta(0.01f * y);
    },  // 2 FIELD_ACCELERATION
    // 原 case FIELD_ATTRACTOR
    [](TodParticleEmitter& e, TodParticle* theParticle, ParticleField* theParticleField, float theParticleTimeValue, float x, float y, float aInterpX, float aInterpY)
    {
    // 弹性力场
    		float aDiffX = x - (theParticle->mPosition.x - e.mSystemCenter.x);
    		float aDiffY = y - (theParticle->mPosition.y - e.mSystemCenter.y);
    		// 加速度的方向始终从粒子所在位置指向“标准位置”
        theParticle->mVelocity.x += Sexy::UpdateDelta(0.01f * aDiffX);
        theParticle->mVelocity.y += Sexy::UpdateDelta(0.01f * aDiffY);
    },  // 3 FIELD_ATTRACTOR
    // 原 case FIELD_MAX_VELOCITY
    [](TodParticleEmitter& e, TodParticle* theParticle, ParticleField* theParticleField, float theParticleTimeValue, float x, float y, float aInterpX, float aInterpY)
    {
    // 限速场
    		theParticle->mVelocity.x = ClampFloat(theParticle->mVelocity.x, -x, x);
    		theParticle->mVelocity.y = ClampFloat(theParticle->mVelocity.y, -y, y);
    },  // 4 FIELD_MAX_VELOCITY
    // 原 case FIELD_VELOCITY
    [](TodParticleEmitter& e, TodParticle* theParticle, ParticleField* theParticleField, float theParticleTimeValue, float x, float y, float aInterpX, float aInterpY)
    {
    // 匀速场
        theParticle->mPosition.x += Sexy::UpdateDelta(0.01 * x);
        theParticle->mPosition.y += Sexy::UpdateDelta(0.01 * y);
    },  // 5 FIELD_VELOCITY
    // 原 case FIELD_POSITION
    [](TodParticleEmitter& e, TodParticle* theParticle, ParticleField* theParticleField, float theParticleTimeValue, float x, float y, float aInterpX, float aInterpY)
    {
    // 定位场
    		float aLastX = FloatTrackEvaluateFromLastTime(theParticleField->mX, theParticle->mParticleLastTimeValue, aInterpX);
    		float aLastY = FloatTrackEvaluateFromLastTime(theParticleField->mY, theParticle->mParticleLastTimeValue, aInterpY);
    		theParticle->mPosition.x += x - aLastX;
    		theParticle->mPosition.y += y - aLastY;
    },  // 6 FIELD_POSITION
    &ParticleFieldDefault,  // 7 FIELD_SYSTEM_POSITION（原 default）
    // 原 case FIELD_GROUND_CONSTRAINT
    [](TodParticleEmitter& e, TodParticle* theParticle, ParticleField* theParticleField, float theParticleTimeValue, float x, float y, float aInterpX, float aInterpY)
    {
    		if (theParticle->mPosition.y > e.mSystemCenter.y + y)  // 判断是否触及地面
    		{
    			theParticle->mPosition.y = e.mSystemCenter.y + y;  // 将坐标重置至地面
    			float aCollisionReflect = FloatTrackEvaluate(
    				e.mEmitterDef->mCollisionReflect, theParticleTimeValue, theParticle->mParticleInterp[ParticleTracks::TRACK_PARTICLE_COLLISION_REFLECT]
    			);
    			float aCollisionSpin = FloatTrackEvaluate(
    				e.mEmitterDef->mCollisionSpin, theParticleTimeValue, theParticle->mParticleInterp[ParticleTracks::TRACK_PARTICLE_COLLISION_SPIN]
    			) / 1000.0f;
    			theParticle->mSpinVelocity = theParticle->mVelocity.y * aCollisionSpin;
    			theParticle->mVelocity.x *= aCollisionReflect;
    			theParticle->mVelocity.y *= -aCollisionReflect;
    		}
    },  // 8 FIELD_GROUND_CONSTRAINT
    // 原 case FIELD_SHAKE
    [](TodParticleEmitter& e, TodParticle* theParticle, ParticleField* theParticleField, float theParticleTimeValue, float x, float y, float aInterpX, float aInterpY)
    {
    // 震动
    		float aLastX = FloatTrackEvaluateFromLastTime(theParticleField->mX, theParticle->mParticleLastTimeValue, aInterpX);
    		float aLastY = FloatTrackEvaluateFromLastTime(theParticleField->mY, theParticle->mParticleLastTimeValue, aInterpY);
    		// 先恢复上一次震动效果的影响
        int aLastRandSeed = theParticle->mParticleAge.mSteps - 1;
    		if (aLastRandSeed == -1)
            aLastRandSeed = Sexy::TimeCounter::Encode(theParticle->mParticleDuration) - 1;
    		srand(aLastRandSeed * (uintptr_t)theParticle);
    		theParticle->mPosition.x -= aLastX * ((float)rand() / RAND_MAX * 2.0f - 1.0f);
    		theParticle->mPosition.y -= aLastY * ((float)rand() / RAND_MAX * 2.0f - 1.0f);
    		// 再随机取得当前帧的震动效果
        srand(theParticle->mParticleAge.mSteps * (uintptr_t)theParticle);
    		theParticle->mPosition.x += x * ((float)rand() / RAND_MAX * 2.0f - 1.0f);
    		theParticle->mPosition.y += y * ((float)rand() / RAND_MAX * 2.0f - 1.0f);
    },  // 9 FIELD_SHAKE
    // 原 case FIELD_CIRCLE
    [](TodParticleEmitter& e, TodParticle* theParticle, ParticleField* theParticleField, float theParticleTimeValue, float x, float y, float aInterpX, float aInterpY)
    {
    // 圆周
    		SexyVector2 aToCenter = theParticle->mPosition - e.mSystemCenter;
    		SexyVector2 aMotion = aToCenter.Perp().Normalize();  // 标准化的法向量
    		float aRadius = aToCenter.Magnitude();
        aMotion *= 0.01 * Sexy::gUpdateTicks * (x + aRadius * y);
    		theParticle->mPosition += aMotion;
    },  // 10 FIELD_CIRCLE
    // 原 case FIELD_AWAY
    [](TodParticleEmitter& e, TodParticle* theParticle, ParticleField* theParticleField, float theParticleTimeValue, float x, float y, float aInterpX, float aInterpY)
    {
    // 远离
    		SexyVector2 aToCenter = theParticle->mPosition - e.mSystemCenter;
    		SexyVector2 aMotion = aToCenter.Normalize();  // 标准化的方向向量
    		float aRadius = aToCenter.Magnitude();
        aMotion *= 0.01 * Sexy::gUpdateTicks * (x + aRadius * y);
    		theParticle->mPosition += aMotion;
    },  // 11 FIELD_AWAY
};
static_assert(sizeof(kParticleFieldCases) / sizeof(kParticleFieldCases[0]) ==
    (int)ParticleFieldType::PARTICLE_FIELD_COUNT, "kParticleFieldCases 槽位数须与 ParticleFieldType 枚举同步");
}  // namespace

//0x516820
void TodParticleEmitter::UpdateParticleField(TodParticle* theParticle, ParticleField* theParticleField, float theParticleTimeValue, int theFieldIndex)
{
	TOD_ASSERT(theFieldIndex < MAX_PARTICLE_FIELDS);
	float aInterpX = theParticle->mParticleFieldInterp[theFieldIndex][0];
	float aInterpY = theParticle->mParticleFieldInterp[theFieldIndex][1];
	float x = FloatTrackEvaluate(theParticleField->mX, theParticleTimeValue, aInterpX);
	float y = FloatTrackEvaluate(theParticleField->mY, theParticleTimeValue, aInterpY);

	// C 形态 -> 匿名 lambda 函数指针表：行序 = ParticleFieldType 枚举序
	// （0..11；SYSTEM_POSITION 为 UpdateSystemField 专属 → 缺槽走 default）。
	// 场值 x/y 与双插值经值参传入（体只读）；发射器成员经 e 直写。
	// default（TOD_ASSERT）具名并被缺槽与越界分支复用。
	const unsigned aFieldTypeIndex = static_cast<unsigned>(theParticleField->mFieldType);
	if (aFieldTypeIndex < static_cast<unsigned>(ParticleFieldType::PARTICLE_FIELD_COUNT))
	{
		kParticleFieldCases[aFieldTypeIndex](*this, theParticle, theParticleField, theParticleTimeValue, x, y, aInterpX, aInterpY);
	}
	else
	{
		ParticleFieldDefault(*this, theParticle, theParticleField, theParticleTimeValue, x, y, aInterpX, aInterpY);
	}

}

float TodParticleEmitter::SystemTrackEvaluate(FloatParameterTrack& theTrack, ParticleSystemTracks theSystemTrack)
{
	return FloatTrackEvaluate(theTrack, mSystemTimeValue, mTrackInterp[(int)theSystemTrack]);
}

//0x516D70
void TodParticleEmitter::UpdateSystemField(ParticleField* theParticleField, float theParticleTimeValue, int theFieldIndex)
{
	TOD_ASSERT(theFieldIndex < MAX_PARTICLE_FIELDS);
	float aInterpX = mSystemFieldInterp[theFieldIndex][0];
	float aInterpY = mSystemFieldInterp[theFieldIndex][1];
	float x = FloatTrackEvaluate(theParticleField->mX, theParticleTimeValue, aInterpX);
	float y = FloatTrackEvaluate(theParticleField->mY, theParticleTimeValue, aInterpY);

	switch (theParticleField->mFieldType)
	{
	case ParticleFieldType::FIELD_SYSTEM_POSITION:
	{
		float aLastX = FloatTrackEvaluateFromLastTime(theParticleField->mX, mSystemLastTimeValue, aInterpX);
		float aLastY = FloatTrackEvaluateFromLastTime(theParticleField->mY, mSystemLastTimeValue, aInterpY);
		mSystemCenter.x += x - aLastX;
		mSystemCenter.y += y - aLastY;
		break;
	}
	default:
		TOD_ASSERT(0);
		break;
	}
}


// IDT3 resolves the first target definition at compile time.
bool TodParticleEmitter::CrossFadeParticleOnDuration(TodParticle* theParticle)
{
	const int aIndex = mEmitterDef->mOnDurationEmitterIndex;
	if (aIndex >= 0 && aIndex < mParticleSystem->mParticleDef->mEmitterDefCount)
	{
		return CrossFadeParticleToDef(theParticle, &mParticleSystem->mParticleDef->mEmitterDefs[aIndex]);
	}
	return false;
}

// 按发射器 def 交叉淡入：分配目标发射器实例、入系统表并转移粒子。
bool TodParticleEmitter::CrossFadeParticleToDef(TodParticle* theParticle, TodEmitterDefinition* theToEmitterDef)
{
	if (mParticleSystem->mParticleHolder->mEmitters.mSize == mParticleSystem->mParticleHolder->mEmitters.mMaxSize)
	{
		TodTraceAndLog("Too many emitters to cross fade\n");
		return false;
	}

	TodParticleEmitter* aEmitter = mParticleSystem->mParticleHolder->mEmitters.DataArrayAlloc();
	aEmitter->TodEmitterInitialize(mSystemCenter.x, mSystemCenter.y, mParticleSystem, theToEmitterDef);
	ParticleEmitterID aEmitterID = (ParticleEmitterID)mParticleSystem->mParticleHolder->mEmitters.DataArrayGetID(aEmitter);
	if (!mParticleSystem->EmitterRosterAdd(aEmitter))
	{
		mParticleSystem->mParticleHolder->mEmitters.DataArrayFree(aEmitter);  // 名册满即整体回滚（防孤儿发射器）
		return false;
	}
	return CrossFadeParticle(theParticle, aEmitter);
}

//0x516F00
bool TodParticleEmitter::UpdateParticle(TodParticle* theParticle)
{
	if (theParticle->mParticleAge >= theParticle->mParticleDuration)  // 粒子的生命周期结束时
	{
		if (TestBit(mEmitterDef->mParticleFlags, (int)ParticleFlags::PARTICLE_PARTICLE_LOOPS))  // 判断粒子是否循环
			theParticle->mParticleAge = 0;  // 重置粒子当前帧
		else if (theParticle->mCrossFadeDuration > 0)  // 判断粒子是否处于交叉混合过程中
			theParticle->mParticleAge = theParticle->mParticleDuration - 1;  // 将粒子滞留在最后一帧
		else if (mEmitterDef->mOnDurationEmitterIndex < 0 || !CrossFadeParticleOnDuration(theParticle))  // 尝试进行交叉混合（IDT3 下标；无链接即无淡入）
			return false;
	}
	if (theParticle->mCrossFadeParticleID != ParticleID::PARTICLEID_NULL &&
		mParticleSystem->mParticleHolder->mParticles.DataArrayTryToGet(theParticle->mCrossFadeParticleID) == nullptr)
		return false;  // 当粒子不存在交叉混合时，可以删除粒子

	theParticle->mParticleTimeValue = theParticle->mParticleAge.LegacyTicks() * theParticle->mParticleDurationInv;
	const int aParticleFieldCount = mEmitterDef->mParticleFields.count;  // 装载后 def 只读，场数外提免逐场重载
	for (int i = 0; i < aParticleFieldCount; i++)  // 更新粒子受到每个粒子场的作用
		UpdateParticleField(theParticle, &mEmitterDef->mParticleFields.Fields[i], theParticle->mParticleTimeValue, i);
	theParticle->mPosition += theParticle->mVelocity * static_cast<float>(Sexy::gUpdateTicks);
	float aSpinSpeed = ParticleTrackEvaluate(mEmitterDef->mParticleSpinSpeed, theParticle, ParticleTracks::TRACK_PARTICLE_SPIN_SPEED) * 0.01 * Sexy::gUpdateTicks;
	float aSpinAngle = ParticleTrackEvaluate(mEmitterDef->mParticleSpinAngle, theParticle, ParticleTracks::TRACK_PARTICLE_SPIN_ANGLE);
	float aLastSpinAngle = FloatTrackEvaluateFromLastTime(
		mEmitterDef->mParticleSpinAngle, theParticle->mParticleLastTimeValue, theParticle->mParticleInterp[ParticleTracks::TRACK_PARTICLE_SPIN_ANGLE]);
	theParticle->mSpinPosition += DEG_TO_RAD(aSpinSpeed + aSpinAngle - aLastSpinAngle) + Sexy::UpdateDelta(theParticle->mSpinVelocity);

	if (FloatTrackIsSet(mEmitterDef->mAnimationRate))  // 如果定义了动画速率
	{
		float aAnimTime = ParticleTrackEvaluate(mEmitterDef->mAnimationRate, theParticle, ParticleTracks::TRACK_PARTICLE_ANIMATION_RATE) * 0.01 * Sexy::gUpdateTicks;
		theParticle->mAnimationTimeValue += aAnimTime;  // 更新动画时间值（动画循环率）
		while (theParticle->mAnimationTimeValue >= 1.0f)
			theParticle->mAnimationTimeValue -= 1.0f;
		while (theParticle->mAnimationTimeValue < 0.0f)
			theParticle->mAnimationTimeValue += 1.0f;
	}

	theParticle->mParticleAge++;
	theParticle->mParticleLastTimeValue = theParticle->mParticleTimeValue;
	return true;
}

//0x517160
void TodParticleEmitter::UpdateSpawning()
{
	TodParticleEmitter* aCrossFadeEmitter = mParticleSystem->mParticleHolder->mEmitters.DataArrayTryToGet((unsigned int)mCrossFadeEmitterID);
	TodParticleEmitter* aSpawningEmitter = !aCrossFadeEmitter ? this : aCrossFadeEmitter;  // 各项数据的计算均以此“主发射器”为准
	mSpawnAccum += aSpawningEmitter->SystemTrackEvaluate(aSpawningEmitter->mEmitterDef->mSpawnRate, ParticleSystemTracks::TRACK_SPAWN_RATE) * 0.01 * Sexy::gUpdateTicks;
	int aSpawnCount = (int)mSpawnAccum;
	mSpawnAccum -= aSpawnCount;

	int aSpawnMinActive = (int)aSpawningEmitter->SystemTrackEvaluate(aSpawningEmitter->mEmitterDef->mSpawnMinActive, ParticleSystemTracks::TRACK_SPAWN_MIN_ACTIVE);
	if (aSpawnMinActive >= 0 && aSpawnCount < aSpawnMinActive - ParticleRosterCount())
		aSpawnCount = aSpawnMinActive - ParticleRosterCount();  // 至少确保将粒子数量增加至 aSpawnMinActive 个
	int aSpawnMaxActive = (int)aSpawningEmitter->SystemTrackEvaluate(aSpawningEmitter->mEmitterDef->mSpawnMaxActive, ParticleSystemTracks::TRACK_SPAWN_MAX_ACTIVE);
	if (aSpawnMaxActive >= 0 && aSpawnCount > aSpawnMaxActive - ParticleRosterCount())
		aSpawnCount = aSpawnMaxActive - ParticleRosterCount();  // 至多保证粒子数量不会超过 aSpawnMaxActive 个
	if (FloatTrackIsSet(aSpawningEmitter->mEmitterDef->mSpawnMaxLaunched))
	{
		int aSpawnMaxLaunched = aSpawningEmitter->SystemTrackEvaluate(aSpawningEmitter->mEmitterDef->mSpawnMaxLaunched, ParticleSystemTracks::TRACK_SPAWN_MAX_LAUNCHED);
		if (aSpawnCount > aSpawnMaxLaunched - mParticlesSpawned)
			aSpawnCount = aSpawnMaxLaunched - mParticlesSpawned;  // 确保发射数量不超过发射器总共能发射的最大数量
	}

	for (int i = 0; i < aSpawnCount; i++)
	{
		TodParticle* aParticle = SpawnParticle(i, aSpawnCount);
		if (aCrossFadeEmitter != nullptr)
			CrossFadeParticle(aParticle, aCrossFadeEmitter);
	}
}

//0x5172C0
void TodParticleEmitter::DeleteNonCrossFading()
{
	// 尾存倒序遍历（=原头→尾序）；下标直传 DeleteParticleAt（免逐粒 Find 扫）
	for (int i = ParticleRosterCount() - 1; i >= 0; i--)
	{
		TodParticle* aParticle = ParticleRosterParticleAt(i);
		if (aParticle->mCrossFadeDuration <= 0)  // 当粒子不处于交叉混合状态，则删除该粒子
			DeleteParticleAt(i, aParticle);
	}
}

//0x517300
void TodParticleEmitter::DeleteAll()
{
	while (ParticleRosterCount() != 0)
	{
		TodParticle* aParticle = ParticleRosterParticleAt(ParticleRosterCount() - 1);  // 尾=最新=原 RemoveHead
		ParticleRosterRemoveAt(ParticleRosterCount() - 1);
		mParticleSystem->mParticleHolder->mParticles.DataArrayFree(aParticle);
	}
}

//0x517370
// GOTY @Patoke: 0x521A20
void TodParticleSystem::Update()
{
	if (!mDontUpdate)
	{
		bool aEmitterAlive = false;
		const int aEmitterCount = EmitterRosterCount();
		for (int i = 0; i < aEmitterCount; i++)
		{
			TodParticleEmitter* aEmitter = EmitterRosterEmitterAt(i);
			aEmitter->Update();
			if ((FloatTrackIsSet(aEmitter->mEmitterDef->mCrossFadeDuration) && aEmitter->ParticleRosterCount() > 0) || !aEmitter->mDead)
				aEmitterAlive = true;
		}
		if (!aEmitterAlive)
			mDead = true;
	}
}

//0x5173E0
bool TodParticleEmitter::CrossFadeParticle(TodParticle* theParticle, TodParticleEmitter* theToEmitter)
{
	if (theParticle->mCrossFadeDuration > 0)  // 粒子已处于交叉混合的过程中
	{
		TodTrace("We don't support cross fading more than one at a time\n");
		return false;
	}
	if (!FloatTrackIsSet(theToEmitter->mEmitterDef->mCrossFadeDuration))  // 目标发射器未设定交叉混合时长轨道
	{
		TodTrace("Can't cross fade to emitter that doesn't have CrossFadeDuration");
		return false;
	}
	TOD_ASSERT(theToEmitter != this);  // 不能交叉混合至自身

	TodParticle* aToParticle = theToEmitter->SpawnParticle(0, 1);
	if (aToParticle == nullptr)
		return false;
	if (mEmitterCrossFadeCountDown > 0)  // 如果源发射器正处于交叉混合过程中
		theParticle->mCrossFadeDuration = mEmitterCrossFadeCountDown;  // 源粒子的交叉混合的时长即为源发射器交叉混合的剩余时长
	else
	{
		float aCrossFadeDurationInterp = Sexy::Rand(1);
		int aCrossFadeDuration = FloatTrackEvaluate(theToEmitter->mEmitterDef->mCrossFadeDuration, mSystemTimeValue, aCrossFadeDurationInterp);
		theParticle->mCrossFadeDuration = std::max(1, aCrossFadeDuration);  // 随机取得交叉混合的时长（至少 1 帧）
	}
	if (!FloatTrackIsSet(theToEmitter->mEmitterDef->mParticleDuration))  // 如果目标发射器未定义粒子持续时间
	{
		aToParticle->mParticleDuration = theParticle->mCrossFadeDuration;  // 目标粒子的持续时间等于交叉混合的时间
		aToParticle->mParticleDurationInv = 1.0f / (aToParticle->mParticleDuration - 1);  // 持续期被改写，倒数同步
	}
	aToParticle->mCrossFadeParticleID = (ParticleID)mParticleSystem->mParticleHolder->mParticles.DataArrayGetID(theParticle);  // 赋值交叉混合来源的粒子编号
	return true;
}

//0x517490
void TodParticleEmitter::DeleteParticle(TodParticle* theParticle)
{
	DeleteParticleAt(ParticleRosterFind(theParticle), theParticle);  // 线性找槽位（交叉源级联等下标未知方）
}

// 下标化删除核心：调用方（更新循环/DeleteNonCrossFading）已知名册下标直入，
// 省 Find 的槽位线性探测。交叉源递归删在移除**之前**发生、且可能经
// A→B→A 链删掉本行更旧条目使下标漂移——递归后槽位一次校验（一载一比），
// 漂移（罕见）才回退 Find。
void TodParticleEmitter::DeleteParticleAt(int theRosterIndex, TodParticle* theParticle)
{
	TodParticle* aCrossFadeParticle = mParticleSystem->mParticleHolder->mParticles.DataArrayTryToGet((unsigned int)theParticle->mCrossFadeParticleID);
	if (aCrossFadeParticle != nullptr)
	{
		aCrossFadeParticle->mParticleEmitter->DeleteParticle(aCrossFadeParticle);  // 同时删除交叉混合的源粒子
		theParticle->mCrossFadeParticleID = ParticleID::PARTICLEID_NULL;
	}

	if (theRosterIndex < 0 || theRosterIndex >= ParticleRosterCount() ||
		ParticleRosterParticleAt(theRosterIndex) != theParticle)  // 级联漂移校验
		theRosterIndex = ParticleRosterFind(theParticle);
	if (theRosterIndex >= 0)
		ParticleRosterRemoveAt(theRosterIndex);
	mParticleSystem->mParticleHolder->mParticles.DataArrayFree(theParticle);
}

//0x517550
void TodParticleEmitter::Update()
{
	if (mDead)
		return;

	mSystemAge++;
	bool aDie = false;
	if (mSystemAge >= mSystemDuration)  // 发射器的生命周期结束时
	{
		if (TestBit(mEmitterDef->mParticleFlags, (unsigned int)ParticleFlags::PARTICLE_SYSTEM_LOOPS))  // 判断发射器是否循环
			mSystemAge = 0;  // 重置发射器当前帧
		else
		{
			mSystemAge = mSystemDuration - 1;  // 将发射器滞留在最后一帧
			aDie = true;
		}
	}

	if (mEmitterCrossFadeCountDown > 0)
	{
		mEmitterCrossFadeCountDown--;  // 更新发射器的交叉混合
		if (mEmitterCrossFadeCountDown == 0)
			aDie = true;
	}
	if (mCrossFadeEmitterID != ParticleEmitterID::PARTICLEEMITTERID_NULL)
	{
		TodParticleEmitter* aCrossFadeEmitter = mParticleSystem->mParticleHolder->mEmitters.DataArrayTryToGet(mCrossFadeEmitterID);
		if (aCrossFadeEmitter == nullptr || aCrossFadeEmitter->mDead)
			aDie = true;
	}

	mSystemTimeValue = mSystemAge.LegacyTicks() / (float)(mSystemDuration - 1);
	for (int i = 0; i < mEmitterDef->mSystemFields.count; i++)
		UpdateSystemField(&mEmitterDef->mSystemFields.Fields[i], mSystemTimeValue, i);  // 更新发射器受到每个系统场的作用
	// 尾存倒序遍历（=原头→尾序）；下标直传 DeleteParticleAt（免逐粒 Find 扫）；
	// DeleteParticle 递归删交叉源可能改本行更低（更旧）下标——memmove 后
	// i-- 恰落到下一个更旧粒子，语义与原"预存 next"逐字一致
	for (int i = ParticleRosterCount() - 1; i >= 0; i--)
	{
		TodParticle* aParticle = ParticleRosterParticleAt(i);
		if (!UpdateParticle(aParticle))  // 更新发射器中的每个粒子
			DeleteParticleAt(i, aParticle);
	}
	UpdateSpawning();  // 更新粒子发射

	if (aDie)
	{
		DeleteNonCrossFading();
		if (ParticleRosterCount() == 0)
		{
			mDead = true;
			return;
		}
	}
	mSystemLastTimeValue = mSystemTimeValue;
}

float CrossFadeLerp(float theFrom, float theTo, bool theFromIsSet, bool theToIsSet, float theFraction)
{
	if (!theFromIsSet)
		return theTo;
	if (!theToIsSet)
		return theFrom;
	return theFrom + (theTo - theFrom) * theFraction;
}

//0x5176A0
bool TodParticleEmitter::GetRenderParams(TodParticle* theParticle, ParticleRenderParams* theParams)
{
	TodParticleEmitter* aEmitter = theParticle->mParticleEmitter;
	TodEmitterDefinition* aDef = aEmitter->mEmitterDef;

	// P5-④ 快路：def 无任何已设渲染轨且覆写全默认——直给标准渲染参数，
	// 跳过下方 20 次轨道求值与 IsSet 判定（无色无缩放的粒子 def 大多命中）
	if (aDef->mRenderTrackMask == 0 &&
		aEmitter->mColorOverride == Color::White &&
		aEmitter->mScaleOverride == 1.0f)
	{
		theParams->mRedIsSet = theParams->mGreenIsSet = theParams->mBlueIsSet =
			theParams->mAlphaIsSet = theParams->mParticleScaleIsSet =
			theParams->mParticleStretchIsSet = theParams->mSpinPositionIsSet = false;
		theParams->mPositionIsSet = aDef->mParticleFields.count > 0 ||
			FloatTrackIsSet(aDef->mEmitterRadius) || FloatTrackIsSet(aDef->mEmitterOffsetX) ||
			FloatTrackIsSet(aDef->mEmitterOffsetY) || FloatTrackIsSet(aDef->mEmitterBoxX) ||
			FloatTrackIsSet(aDef->mEmitterBoxY);
		theParams->mRed = theParams->mGreen = theParams->mBlue = theParams->mAlpha = 255.0f;
		theParams->mParticleScale = 1.0f;
		theParams->mParticleStretch = 0.0f;
		theParams->mSpinPosition = theParticle->mSpinPosition;
		theParams->mPosX = theParticle->mPosition.x;
		theParams->mPosY = theParticle->mPosition.y;
		return true;
	}

	// 颜色。对于每一色彩通道，当系统对应轨道、粒子对应轨道和对应覆写中任一有定义时，认为该通道已设定。
	theParams->mRedIsSet = false;
	theParams->mRedIsSet |= FloatTrackIsSet(aDef->mSystemRed);
	theParams->mRedIsSet |= FloatTrackIsSet(aDef->mParticleRed);
	theParams->mRedIsSet |= aEmitter->mColorOverride.mRed != 1.0f;
	theParams->mGreenIsSet = false;
	theParams->mGreenIsSet |= FloatTrackIsSet(aDef->mSystemGreen);
	theParams->mGreenIsSet |= FloatTrackIsSet(aDef->mParticleGreen);
	theParams->mGreenIsSet |= aEmitter->mColorOverride.mGreen != 1.0f;
	theParams->mBlueIsSet = false;
	theParams->mBlueIsSet |= FloatTrackIsSet(aDef->mSystemBlue);
	theParams->mBlueIsSet |= FloatTrackIsSet(aDef->mParticleBlue);
	theParams->mBlueIsSet |= aEmitter->mColorOverride.mBlue != 1.0f;
	theParams->mAlphaIsSet = false;
	theParams->mAlphaIsSet |= FloatTrackIsSet(aDef->mSystemAlpha);
	theParams->mAlphaIsSet |= FloatTrackIsSet(aDef->mParticleAlpha);
	theParams->mAlphaIsSet |= aEmitter->mColorOverride.mAlpha != 1.0f;
	// 缩放
	theParams->mParticleScaleIsSet = false;
	theParams->mParticleScaleIsSet |= FloatTrackIsSet(aDef->mParticleScale);
	theParams->mParticleScaleIsSet |= (aEmitter->mScaleOverride != 1.0f);
	// 拉伸
	theParams->mParticleStretchIsSet = FloatTrackIsSet(aDef->mParticleStretch);
	// 旋转角度。当粒子使用随机初始旋转角度或对齐发射方向角度时，也可认为旋转角度已设定。
	theParams->mSpinPositionIsSet = false;
	theParams->mSpinPositionIsSet |= FloatTrackIsSet(aDef->mParticleSpinSpeed);
	theParams->mSpinPositionIsSet |= FloatTrackIsSet(aDef->mParticleSpinAngle);
	theParams->mSpinPositionIsSet |= TestBit(aDef->mParticleFlags, (int)ParticleFlags::PARTICLE_RANDOM_LAUNCH_SPIN);
	theParams->mSpinPositionIsSet |= TestBit(aDef->mParticleFlags, (int)ParticleFlags::PARTICLE_ALIGN_LAUNCH_SPIN);
	// 位置
	theParams->mPositionIsSet = false;
	theParams->mPositionIsSet |= (aDef->mParticleFields.count > 0.0f);
	theParams->mPositionIsSet |= FloatTrackIsSet(aDef->mEmitterRadius);
	theParams->mPositionIsSet |= FloatTrackIsSet(aDef->mEmitterOffsetX);
	theParams->mPositionIsSet |= FloatTrackIsSet(aDef->mEmitterOffsetY);
	theParams->mPositionIsSet |= FloatTrackIsSet(aDef->mEmitterBoxX);
	theParams->mPositionIsSet |= FloatTrackIsSet(aDef->mEmitterBoxY);

	float aSystemRed = aEmitter->SystemTrackEvaluate(aDef->mSystemRed, ParticleSystemTracks::TRACK_SYSTEM_RED);
	float aSystemGreen = aEmitter->SystemTrackEvaluate(aDef->mSystemGreen, ParticleSystemTracks::TRACK_SYSTEM_GREEN);
	float aSystemBlue = aEmitter->SystemTrackEvaluate(aDef->mSystemBlue, ParticleSystemTracks::TRACK_SYSTEM_BLUE);
	float aSystemAlpha = aEmitter->SystemTrackEvaluate(aDef->mSystemAlpha, ParticleSystemTracks::TRACK_SYSTEM_ALPHA);
	float aSystemBrightness = aEmitter->SystemTrackEvaluate(aDef->mSystemBrightness, ParticleSystemTracks::TRACK_SYSTEM_BRIGHTNESS);
	float aParticleRed = aEmitter->ParticleTrackEvaluate(aDef->mParticleRed, theParticle, ParticleTracks::TRACK_PARTICLE_RED);
	float aParticleGreen = aEmitter->ParticleTrackEvaluate(aDef->mParticleGreen, theParticle, ParticleTracks::TRACK_PARTICLE_GREEN);
	float aParticleBlue = aEmitter->ParticleTrackEvaluate(aDef->mParticleBlue, theParticle, ParticleTracks::TRACK_PARTICLE_BLUE);
	float aParticleAlpha = aEmitter->ParticleTrackEvaluate(aDef->mParticleAlpha, theParticle, ParticleTracks::TRACK_PARTICLE_ALPHA);
	float aParticleBrightness = aEmitter->ParticleTrackEvaluate(aDef->mParticleBrightness, theParticle, ParticleTracks::TRACK_PARTICLE_BRIGHTNESS);
	float aBrightness = aParticleBrightness * aSystemBrightness;
	// 实际颜色 = 粒子颜色 * 系统颜色 * 覆写颜色 * 亮度
	theParams->mRed = aParticleRed * aSystemRed * aEmitter->mColorOverride.mRed * aBrightness;
	theParams->mGreen = aParticleGreen * aSystemGreen * aEmitter->mColorOverride.mGreen * aBrightness;
	theParams->mBlue = aParticleBlue * aSystemBlue * aEmitter->mColorOverride.mBlue * aBrightness;
	theParams->mAlpha = aParticleAlpha * aSystemAlpha * aEmitter->mColorOverride.mAlpha * aBrightness;
	theParams->mPosX = theParticle->mPosition.x;
	theParams->mPosY = theParticle->mPosition.y;
	float aParticleScale = aEmitter->ParticleTrackEvaluate(aDef->mParticleScale, theParticle, ParticleTracks::TRACK_PARTICLE_SCALE);
	theParams->mParticleStretch = aEmitter->ParticleTrackEvaluate(aDef->mParticleStretch, theParticle, ParticleTracks::TRACK_PARTICLE_STRETCH);
	theParams->mParticleScale = aParticleScale * aEmitter->mScaleOverride;
	theParams->mSpinPosition = theParticle->mSpinPosition;

	TodParticle* aCrossFadeParticle = aEmitter->mParticleSystem->mParticleHolder->mParticles.DataArrayTryToGet((unsigned int)theParticle->mCrossFadeParticleID);
	if (aCrossFadeParticle != nullptr)  // 当存在交叉混合的粒子时，将二者的渲染参数进行混合（从 aCrossFadeParticle 至 theParticle 的交叉混合）
	{
		ParticleRenderParams aCrossFadeParams;
		if (TodParticleEmitter::GetRenderParams(aCrossFadeParticle, &aCrossFadeParams))
		{
			float aFraction = theParticle->mParticleAge.LegacyTicks() / (float)(aCrossFadeParticle->mCrossFadeDuration - 1);
			// 各项数值按照 aFraction 比例混合
			theParams->mRed = CrossFadeLerp(aCrossFadeParams.mRed, theParams->mRed, aCrossFadeParams.mRedIsSet, theParams->mRedIsSet, aFraction);
			theParams->mGreen = CrossFadeLerp(aCrossFadeParams.mGreen, theParams->mGreen, aCrossFadeParams.mGreenIsSet, theParams->mGreenIsSet, aFraction);
			theParams->mBlue = CrossFadeLerp(aCrossFadeParams.mBlue, theParams->mBlue, aCrossFadeParams.mBlueIsSet, theParams->mBlueIsSet, aFraction);
			theParams->mAlpha = CrossFadeLerp(aCrossFadeParams.mAlpha, theParams->mAlpha, aCrossFadeParams.mAlphaIsSet, theParams->mAlphaIsSet, aFraction);
			theParams->mParticleScale = CrossFadeLerp(
				aCrossFadeParams.mParticleScale, theParams->mParticleScale, aCrossFadeParams.mParticleScaleIsSet, theParams->mParticleScaleIsSet, aFraction);
			theParams->mParticleStretch = CrossFadeLerp(
				aCrossFadeParams.mParticleStretch, theParams->mParticleStretch, aCrossFadeParams.mParticleStretchIsSet, theParams->mParticleStretchIsSet, aFraction);
			theParams->mSpinPosition = CrossFadeLerp(
				aCrossFadeParams.mSpinPosition, theParams->mSpinPosition, aCrossFadeParams.mSpinPositionIsSet, theParams->mSpinPositionIsSet, aFraction);
			theParams->mPosX = CrossFadeLerp(aCrossFadeParams.mPosX, theParams->mPosX, aCrossFadeParams.mPositionIsSet, theParams->mPositionIsSet, aFraction);
			theParams->mPosY = CrossFadeLerp(aCrossFadeParams.mPosY, theParams->mPosY, aCrossFadeParams.mPositionIsSet, theParams->mPositionIsSet, aFraction);
			// 当交叉混合来源的某项已设定时，可以认为该粒子的对应项也已设定
			theParams->mRedIsSet |= aCrossFadeParams.mRedIsSet;
			theParams->mGreenIsSet |= aCrossFadeParams.mGreenIsSet;
			theParams->mBlueIsSet |= aCrossFadeParams.mBlueIsSet;
			theParams->mAlphaIsSet |= aCrossFadeParams.mAlphaIsSet;
			theParams->mParticleScaleIsSet |= aCrossFadeParams.mParticleScaleIsSet;
			theParams->mParticleStretchIsSet |= aCrossFadeParams.mParticleStretchIsSet;
			theParams->mSpinPositionIsSet |= aCrossFadeParams.mSpinPositionIsSet;
			theParams->mPositionIsSet |= aCrossFadeParams.mPositionIsSet;
		}
	}
	return true;
}

//0x517E20
void RenderParticle(Graphics* g, TodParticle* theParticle, const Color& theColor, ParticleRenderParams* theParams, TodTriangleGroup* theTriangleGroup)
{
	TodParticleEmitter* aEmitter = theParticle->mParticleEmitter;
	TodEmitterDefinition* aEmitterDef = aEmitter->mEmitterDef;
	Image* aImage = aEmitter->mImageOverride != nullptr ? aEmitter->mImageOverride : aEmitterDef->mImage;  // 优先使用覆写贴图，无覆写贴图则使用定义的贴图
	if (aImage == nullptr)
		return;  // 不存在贴图时，取消绘制

	int aCelWidth = aImage->GetCelWidth();
	int aCelHeight = aImage->GetCelHeight();
	int aFrame = aEmitter->mFrameOverride;
	if (aFrame == -1)  // 如果未定义覆写帧
	{
		if (FloatTrackIsSet(aEmitterDef->mAnimationRate))  // 如果定义了动画速率
			aFrame = ClampInt(theParticle->mAnimationTimeValue * aEmitterDef->mImageFrames, 0, aEmitterDef->mImageFrames - 1);  // 动画时间值（循环率） * 总帧数得到当前帧
		else if (aEmitterDef->mAnimated)
			aFrame = ClampInt(theParticle->mParticleTimeValue * aEmitterDef->mImageFrames, 0, aEmitterDef->mImageFrames - 1);  // 粒子时间值 * 总帧数得到当前帧
		else
			aFrame = theParticle->mImageFrame;  // 帧固定的粒子，直接取其贴图帧
	}
	aFrame += aEmitterDef->mImageCol;  // 当前帧加上定义中的图像起始列，得到当前帧在贴图中的列数
	if (aFrame >= aImage->mNumCols)
		aFrame = aImage->mNumCols - 1;

	Rect aSrcRect(aFrame * aCelWidth, std::min(aEmitterDef->mImageRow, aImage->mNumRows - 1) * aCelHeight, aCelWidth, aCelHeight);
	float aClipTop = TodParticleEmitter::ParticleTrackEvaluate(aEmitterDef->mClipTop, theParticle, ParticleTracks::TRACK_PARTICLE_CLIP_TOP);
	float aClipBottom = TodParticleEmitter::ParticleTrackEvaluate(aEmitterDef->mClipBottom, theParticle, ParticleTracks::TRACK_PARTICLE_CLIP_BOTTOM);
	float aClipLeft = TodParticleEmitter::ParticleTrackEvaluate(aEmitterDef->mClipLeft, theParticle, ParticleTracks::TRACK_PARTICLE_CLIP_LEFT);
	float aClipRight = TodParticleEmitter::ParticleTrackEvaluate(aEmitterDef->mClipRight, theParticle, ParticleTracks::TRACK_PARTICLE_CLIP_RIGHT);
	TOD_ASSERT(aClipTop >= 0.0f && aClipTop <= 1.0f);
	TOD_ASSERT(aClipBottom >= 0.0f && aClipBottom <= 1.0f);
	TOD_ASSERT(aClipLeft >= 0.0f && aClipLeft <= 1.0f);
	TOD_ASSERT(aClipRight >= 0.0f && aClipRight <= 1.0f);
	theParams->mPosX += aClipLeft * aCelWidth;
	theParams->mPosY += aClipTop * aCelHeight;
	aSrcRect.mX += FloatRoundToInt(aClipLeft * aCelWidth);
	aSrcRect.mY += FloatRoundToInt(aClipTop * aCelHeight);
	aSrcRect.mWidth -= FloatRoundToInt(aCelWidth * (aClipLeft + aClipRight));
	aSrcRect.mHeight -= FloatRoundToInt(aCelHeight * (aClipBottom + aClipTop));  // 以上根据裁剪各方向的比例调整源矩形
	TOD_ASSERT(aSrcRect.mX == aCelWidth * aFrame + FloatRoundToInt(aClipLeft * aCelWidth));
	TOD_ASSERT(aSrcRect.mY == aCelHeight * aEmitterDef->mImageRow + FloatRoundToInt(aClipTop * aCelHeight));
	TOD_ASSERT(aSrcRect.mX >= 0 && aSrcRect.mX < 10000);
	TOD_ASSERT(aSrcRect.mY >= 0 && aSrcRect.mY < 10000);

	if (TestBit(aEmitterDef->mParticleFlags, (int)ParticleFlags::PARTICLE_ALIGN_TO_PIXELS))  // 坐标对齐至整数像素点
	{
		theParams->mPosX = FloatRoundToInt(theParams->mPosX);
		theParams->mPosY = FloatRoundToInt(theParams->mPosY);
	}
	int aDrawMode = g->mDrawMode;
	if (TestBit(aEmitterDef->mParticleFlags, (int)ParticleFlags::PARTICLE_ADDITIVE))  // 使用叠加模式
		aDrawMode = Graphics::DRAWMODE_ADDITIVE;
	if (TestBit(aEmitterDef->mParticleFlags, (int)ParticleFlags::PARTICLE_FULLSCREEN))  // 全屏模式
	{
		theTriangleGroup->DrawGroup(g);
		Color anOldColor = g->mColor;
		int anOldDrawMode = g->mDrawMode;
		g->mColor = theColor;
		// Fullscreen particles cover the render destination, independent of world width.
		g->FillRect(-g->mTransX, -g->mTransY, g->mDestImage->mWidth, g->mDestImage->mHeight);
		g->mColor = anOldColor;
		g->mDrawMode = anOldDrawMode;
	}
	else
	{
		SexyMatrix3 aTransform;
		TodScaleRotateTransformMatrix(
			aTransform, 
			theParams->mPosX, 
			theParams->mPosY, 
			theParams->mSpinPosition, 
			theParams->mParticleScale, 
			theParams->mParticleStretch * theParams->mParticleScale
		);
		theTriangleGroup->AddTriangle(g, aImage, aTransform, g->mClipRect, theColor, aDrawMode, aSrcRect);
		if (aEmitter->mExtraAdditiveDrawOverride)
			theTriangleGroup->AddTriangle(g, aImage, aTransform, g->mClipRect, theColor, Graphics::DRAWMODE_ADDITIVE, aSrcRect);
	}
}

//0x518210
void TodParticleEmitter::DrawParticle(Graphics* g, TodParticle* theParticle, TodTriangleGroup* theTriangleGroup)
{
	if (theParticle->mCrossFadeDuration > 0)  // 交叉混合的源粒子，不绘制
		return;

	ParticleRenderParams aParams;
	if (GetRenderParams(theParticle, &aParams))
	{
		Color aColor(
			ClampInt(FloatRoundToInt(aParams.mRed), 0, 255), 
			ClampInt(FloatRoundToInt(aParams.mGreen), 0, 255), 
			ClampInt(FloatRoundToInt(aParams.mBlue), 0, 255), 
			ClampInt(FloatRoundToInt(aParams.mAlpha), 0, 255)
		);
		if (aColor.mAlpha > 0)  // 不透明度为 0 时，不绘制
		{
			aParams.mPosX += g->mTransX;
			aParams.mPosY += g->mTransY;

			TodParticle* aParticle;
			if (mImageOverride || mEmitterDef->mImage)  // 粒子有贴图时，渲染该粒子
				aParticle = theParticle;
			else  // 粒子没有贴图时，尝试渲染交叉混合来源的粒子
				aParticle = mParticleSystem->mParticleHolder->mParticles.DataArrayTryToGet((unsigned int)theParticle->mCrossFadeParticleID);
			if (aParticle != nullptr)
			{
				RenderParticle(g, aParticle, aColor, &aParams, theTriangleGroup);
			}
		}
	}
}

//0x518370
void TodParticleSystem::Draw(Graphics* g)
{
	const int aDrawCount = EmitterRosterCount();
	for (int i = 0; i < aDrawCount; i++)
		EmitterRosterEmitterAt(i)->Draw(g);
}

//0x5183A0
void TodParticleEmitter::Draw(Graphics* g)
{
	bool aHardWare = gSexyAppBase->mDDInterface->mIs3D;
	if ((TestBit(mEmitterDef->mParticleFlags, (int)ParticleFlags::PARTICLE_SOFTWARE_ONLY) && aHardWare) ||
		(TestBit(mEmitterDef->mParticleFlags, (int)ParticleFlags::PARTICLE_HARDWARE_ONLY) && !aHardWare))
		return;

	TodTriangleGroup aTriangleGroup;
	// 尾存倒序遍历（=原头→尾序=新→旧叠放序）
	const int aProbeCount = ParticleRosterCount();
	aTriangleGroup.mVertArray.reserve(size_t(aProbeCount)*2);
	for (int i = aProbeCount - 1; i >= 0; i--)
		DrawParticle(g, ParticleRosterParticleAt(i), &aTriangleGroup);
	aTriangleGroup.DrawGroup(g);
}

//0x518440
void TodParticleSystem::SystemMove(float theX, float theY)
{
	const int aMoveCount = EmitterRosterCount();
	for (int i = 0; i < aMoveCount; i++)
		EmitterRosterEmitterAt(i)->SystemMove(theX, theY);
}

//0x518480
void TodParticleEmitter::SystemMove(float theX, float theY)
{
	float aDeltaX = theX - mSystemCenter.x;
	float aDeltaY = theY - mSystemCenter.y;
	if (FloatApproxEqual(aDeltaX, 0.0f) && FloatApproxEqual(aDeltaY, 0.0f))  // 移动前后的坐标几乎相等时，无需操作
		return;
	
	mSystemCenter.x = theX;
	mSystemCenter.y = theY;
	if (!TestBit(mEmitterDef->mParticleFlags, (int)ParticleFlags::PARTICLE_PARTICLES_DONT_FOLLOW))
	{
		for (int i = ParticleRosterCount() - 1; i >= 0; i--)
		{
			TodParticle* aParticle = ParticleRosterParticleAt(i);
			aParticle->mPosition.x += aDeltaX;
			aParticle->mPosition.y += aDeltaY;
		}
	}
}

//0x518560
void TodParticleSystem::OverrideColor(ParticleEmitterNameRange theRange, const Color& theColor)
{
	const int aRosterCount = EmitterRosterCount();
	for (int i = 0; i < aRosterCount; i++)
	{
		TodParticleEmitter* aEmitter = EmitterRosterEmitterAt(i);
		if (theRange.Contains(static_cast<ParticleEmitterName>(aEmitter->mEmitterDef->mNameId)))
			aEmitter->mColorOverride = theColor;
	}
}

void TodParticleSystem::OverrideColor(ParticleEmitterName theName, const Color& theColor)
{
	const int aRosterCount = EmitterRosterCount();
	for (int i = 0; i < aRosterCount; i++)
	{
		TodParticleEmitter* aEmitter = EmitterRosterEmitterAt(i);
		if (static_cast<ParticleEmitterName>(aEmitter->mEmitterDef->mNameId) == theName)
			aEmitter->mColorOverride = theColor;
	}
}


//0x5185D0
void TodParticleSystem::OverrideExtraAdditiveDraw(ParticleEmitterNameRange theRange, bool theEnableExtraAdditiveDraw)
{
	const int aRosterCount = EmitterRosterCount();
	for (int i = 0; i < aRosterCount; i++)
	{
		TodParticleEmitter* aEmitter = EmitterRosterEmitterAt(i);
		if (theRange.Contains(static_cast<ParticleEmitterName>(aEmitter->mEmitterDef->mNameId)))
			aEmitter->mExtraAdditiveDrawOverride = theEnableExtraAdditiveDraw;
	}
}

void TodParticleSystem::OverrideExtraAdditiveDraw(ParticleEmitterName theName, bool theEnableExtraAdditiveDraw)
{
	const int aRosterCount = EmitterRosterCount();
	for (int i = 0; i < aRosterCount; i++)
	{
		TodParticleEmitter* aEmitter = EmitterRosterEmitterAt(i);
		if (static_cast<ParticleEmitterName>(aEmitter->mEmitterDef->mNameId) == theName)
			aEmitter->mExtraAdditiveDrawOverride = theEnableExtraAdditiveDraw;
	}
}


//0x518600
// GOTY @Patoke: 0x522CB0
void TodParticleSystem::OverrideImage(ParticleEmitterNameRange theRange, Image* theImage)
{
	const int aRosterCount = EmitterRosterCount();
	for (int i = 0; i < aRosterCount; i++)
	{
		TodParticleEmitter* aEmitter = EmitterRosterEmitterAt(i);
		if (theRange.Contains(static_cast<ParticleEmitterName>(aEmitter->mEmitterDef->mNameId)))
			aEmitter->mImageOverride = theImage;
	}
}

void TodParticleSystem::OverrideImage(ParticleEmitterName theName, Image* theImage)
{
	const int aRosterCount = EmitterRosterCount();
	for (int i = 0; i < aRosterCount; i++)
	{
		TodParticleEmitter* aEmitter = EmitterRosterEmitterAt(i);
		if (static_cast<ParticleEmitterName>(aEmitter->mEmitterDef->mNameId) == theName)
			aEmitter->mImageOverride = theImage;
	}
}


//0x518560
void TodParticleSystem::OverrideFrame(ParticleEmitterNameRange theRange, int theFrame)
{
	const int aRosterCount = EmitterRosterCount();
	for (int i = 0; i < aRosterCount; i++)
	{
		TodParticleEmitter* aEmitter = EmitterRosterEmitterAt(i);
		if (theRange.Contains(static_cast<ParticleEmitterName>(aEmitter->mEmitterDef->mNameId)))
			aEmitter->mFrameOverride = theFrame;
	}
}

void TodParticleSystem::OverrideFrame(ParticleEmitterName theName, int theFrame)
{
	const int aRosterCount = EmitterRosterCount();
	for (int i = 0; i < aRosterCount; i++)
	{
		TodParticleEmitter* aEmitter = EmitterRosterEmitterAt(i);
		if (static_cast<ParticleEmitterName>(aEmitter->mEmitterDef->mNameId) == theName)
			aEmitter->mFrameOverride = theFrame;
	}
}


//0x518630
void TodParticleSystem::OverrideScale(ParticleEmitterNameRange theRange, float theScale)
{
	const int aRosterCount = EmitterRosterCount();
	for (int i = 0; i < aRosterCount; i++)
	{
		TodParticleEmitter* aEmitter = EmitterRosterEmitterAt(i);
		if (theRange.Contains(static_cast<ParticleEmitterName>(aEmitter->mEmitterDef->mNameId)))
			aEmitter->mScaleOverride = theScale;
	}
}

void TodParticleSystem::OverrideScale(ParticleEmitterName theName, float theScale)
{
	const int aRosterCount = EmitterRosterCount();
	for (int i = 0; i < aRosterCount; i++)
	{
		TodParticleEmitter* aEmitter = EmitterRosterEmitterAt(i);
		if (static_cast<ParticleEmitterName>(aEmitter->mEmitterDef->mNameId) == theName)
			aEmitter->mScaleOverride = theScale;
	}
}




//0x5186D0
void TodParticleEmitter::CrossFadeEmitter(TodParticleEmitter* theToEmitter)
{
	if (mEmitterCrossFadeCountDown > 0)
	{
		TodTraceAndLog("We don't support cross fading emitters more than one at a time\n");
		return;
	}
	if (!FloatTrackIsSet(theToEmitter->mEmitterDef->mCrossFadeDuration))
	{
		TodTrace("Can't cross fade to emitter that doesn't have CrossFadeDuration");
		return;
	}
	TOD_ASSERT(theToEmitter != this);

	float aCrossFadeDurationInterp = Sexy::Rand(1.0f);
	mEmitterCrossFadeCountDown = FloatTrackEvaluate(theToEmitter->mEmitterDef->mCrossFadeDuration, mSystemTimeValue, aCrossFadeDurationInterp);
	mEmitterCrossFadeCountDown = std::max<Sexy::TimeCounter>(1, mEmitterCrossFadeCountDown);
	mCrossFadeEmitterID = (ParticleEmitterID)mParticleSystem->mParticleHolder->mEmitters.DataArrayGetID(theToEmitter);
	if (!FloatTrackIsSet(theToEmitter->mEmitterDef->mSystemDuration))
		theToEmitter->mSystemDuration = mEmitterCrossFadeCountDown;

	const int aXFadeParticleCount = ParticleRosterCount();
	for (int i = aXFadeParticleCount - 1; i >= 0; i--)
		CrossFadeParticle(ParticleRosterParticleAt(i), theToEmitter);
}

//0x518790
void TodParticleSystem::CrossFade(ParticleEmitterName theName)
{
	const auto aId = static_cast<std::size_t>(theName);
	const int aIndex = aId < mParticleDef->mEmitterIndexByName.size()
		? mParticleDef->mEmitterIndexByName[aId] : -1;
	TodEmitterDefinition* aEmitterDef = aIndex >= 0
		? &mParticleDef->mEmitterDefs[aIndex] : nullptr;
	if (aEmitterDef == nullptr)
	{
		TodTraceAndLog("Can't find cross fade emitter id %u\n", static_cast<std::uint32_t>(theName));
		return;
	}
	if (!FloatTrackIsSet(aEmitterDef->mCrossFadeDuration))
	{
		TodTraceAndLog("Can't cross fade without duration set\n");
		return;
	}
	const int aXFadeCount = EmitterRosterCount();
	if (mParticleHolder->mEmitters.mSize + aXFadeCount > mParticleHolder->mEmitters.mMaxSize)
	{
		TodTraceAndLog("Too many emitters to cross fade\n");
		ParticleSystemDie();
		return;
	}

	// Appended target emitters do not participate as sources in this call.
	for (int i = 0; i < aXFadeCount; i++)
	{
		TodParticleEmitter* aEmitter = EmitterRosterEmitterAt(i);
		if (aEmitter->mEmitterDef != aEmitterDef)
		{
			TodParticleEmitter* aCrossFadeEmitter = mParticleHolder->mEmitters.DataArrayAlloc();
			aCrossFadeEmitter->TodEmitterInitialize(aEmitter->mSystemCenter.x, aEmitter->mSystemCenter.y, this, aEmitterDef);
			if (!EmitterRosterAdd(aCrossFadeEmitter))
			{
				mParticleHolder->mEmitters.DataArrayFree(aCrossFadeEmitter);
				continue;
			}
			aEmitter->CrossFadeEmitter(aCrossFadeEmitter);
		}
	}
}

void TodParticleSystem::CrossFade(ParticleEmitterNameRange theRange)
{
	// A range resolves one target, in definition declaration order.
	for (int i = 0; i < mParticleDef->mEmitterDefCount; i++)
	{
		const ParticleEmitterName aName = static_cast<ParticleEmitterName>(mParticleDef->mEmitterDefs[i].mNameId);
		if (theRange.Contains(aName))
		{
			CrossFade(aName);
			return;
		}
	}
}

// ── 发射器名册紧凑侧表（2026-10-04 P3 第一步，用户裁决）──
// 按系统池槽位键控（格桶/行段桶同款派生索引先例）；成员 mEmitterList 已
// 退役（保留以钉 sizeof/dat64 分段）。迭代从"链表节点(24B)→ID→池槽"
// 三跳缩为"2B 槽号数组→池槽"一跳；AddTail 序=原链表序逐字保持。
// 清册纪律：ParticleSystemDie/析构/池 free/FreeAll 全挂钩，槽位回收后
// 新系统复用键前必清。
namespace
{
constexpr unsigned int PARTICLE_POOL_CAPACITY = 1024U;
constexpr int EMITTER_ROSTER_MAX = 64;
constexpr int PARTICLE_ROSTER_MAX = 256;
}  // namespace

// Dense slot rows belong to the supplied data, not to an individual holder view.
struct TodParticleRosterStorage
{
	struct EmitterRosterRow
	{
		uint32_t mOwnerKey;
		uint16_t mSlots[EMITTER_ROSTER_MAX];
		uint16_t mCount;
	};

	struct ParticleRosterRow
	{
		uint32_t mOwnerKey;
		uint16_t mSlots[PARTICLE_ROSTER_MAX];
		uint16_t mCount;
	};

	EmitterRosterRow mEmitterRosters[PARTICLE_POOL_CAPACITY];
	ParticleRosterRow mParticleRosters[PARTICLE_POOL_CAPACITY];

	static EmitterRosterRow* EmitterRosterRowFor(const TodParticleSystem* theSystem)
	{
		// Unbound systems are valid during construction and interrupted loads.
		if (theSystem->mParticleHolder == nullptr)
			return nullptr;
		auto& aHolder = *theSystem->mParticleHolder;
		auto& aPool = aHolder.mParticleSystems;
		const unsigned int aSlot = aPool.DataArrayIndexOf(theSystem);
		EmitterRosterRow& aRow = aHolder.mData->mRosterStorage->mEmitterRosters[aSlot];
		const uint32_t aOwnerKey = (uint32_t)aPool.DataArrayGetID(const_cast<TodParticleSystem*>(theSystem));
		if (aRow.mOwnerKey != aOwnerKey)
		{
			aRow.mOwnerKey = aOwnerKey;
			aRow.mCount = 0;
		}
		return &aRow;
	}

	static ParticleRosterRow* ParticleRosterRowFor(const TodParticleEmitter* theEmitter)
	{
		if (theEmitter->mParticleSystem == nullptr || theEmitter->mParticleSystem->mParticleHolder == nullptr)
			return nullptr;
		auto& aHolder = *theEmitter->mParticleSystem->mParticleHolder;
		auto& aPool = aHolder.mEmitters;
		const unsigned int aSlot = aPool.DataArrayIndexOf(theEmitter);
		ParticleRosterRow& aRow = aHolder.mData->mRosterStorage->mParticleRosters[aSlot];
		const uint32_t aOwnerKey = (uint32_t)aPool.DataArrayGetID(const_cast<TodParticleEmitter*>(theEmitter));
		if (aRow.mOwnerKey != aOwnerKey)
		{
			aRow.mOwnerKey = aOwnerKey;
			aRow.mCount = 0;
		}
		return &aRow;
	}
};

TodParticleData::TodParticleData() = default;

//0x518870
TodParticleData::~TodParticleData()
{
	Dispose();
}

TodParticleHolder::TodParticleHolder(TodParticleData* theData)
	: mParticleSystems(theData->mParticleSystems),
	  mEmitters(theData->mEmitters), mParticles(theData->mParticles), mData(theData)
{
}

int TodParticleSystem::EmitterRosterCount() const
{
	auto* aRow = TodParticleRosterStorage::EmitterRosterRowFor(this);
	return aRow ? aRow->mCount : 0;
}

TodParticleEmitter* TodParticleSystem::EmitterRosterEmitterAt(int theIndex) const
{
	auto* aRow = TodParticleRosterStorage::EmitterRosterRowFor(this);
	if (aRow == nullptr || (unsigned)theIndex >= aRow->mCount)
		return nullptr;
	return &mParticleHolder->mEmitters.mBlock[aRow->mSlots[theIndex]].mItem;
}

ParticleEmitterID TodParticleSystem::EmitterRosterIDAt(int theIndex) const
{
	auto* aRow = TodParticleRosterStorage::EmitterRosterRowFor(this);
	if (aRow == nullptr || (unsigned)theIndex >= aRow->mCount)
		return (ParticleEmitterID)0;
	return (ParticleEmitterID)mParticleHolder->mEmitters.DataArrayGetID(&mParticleHolder->mEmitters.mBlock[aRow->mSlots[theIndex]].mItem);
}

bool TodParticleSystem::EmitterRosterAdd(TodParticleEmitter* theEmitter)
{
	auto* aRow = TodParticleRosterStorage::EmitterRosterRowFor(this);
	if (aRow == nullptr)
		return false;
	if (aRow->mCount >= EMITTER_ROSTER_MAX)
	{
		TodTrace("Too many emitters in roster\n");
		return false;
	}
	aRow->mSlots[aRow->mCount++] = (uint16_t)mParticleHolder->mEmitters.DataArrayIndexOf(theEmitter);
	return true;
}

void TodParticleSystem::EmitterRosterClear()
{
	auto* aRow = TodParticleRosterStorage::EmitterRosterRowFor(this);
	if (aRow != nullptr)
		aRow->mCount = 0;
}

// ── 粒子名册紧凑侧表（2026-10-04 P3 第二步，用户裁决）──
// 按发射器池槽位键控 + 世代键行主自失效（发射器侧表同款，装载
// ClearNativeObject memset 不经钩子的防陈旧机制）；尾存倒序遍历保
// AddHead 头→尾序（AddHead 的 O(1) 由尾插达成）；倒序迭代中删除只
// memmove 已遍历过的新侧段。容量 256/发射器，溢界拒生=池满同款。
int TodParticleEmitter::ParticleRosterCount() const
{
	auto* aRow = TodParticleRosterStorage::ParticleRosterRowFor(this);
	return aRow ? aRow->mCount : 0;
}

TodParticle* TodParticleEmitter::ParticleRosterParticleAt(int theIndex) const
{
	auto* aRow = TodParticleRosterStorage::ParticleRosterRowFor(this);
	if (aRow == nullptr || (unsigned)theIndex >= aRow->mCount)
		return nullptr;
	return &mParticleSystem->mParticleHolder->mParticles.mBlock[aRow->mSlots[theIndex]].mItem;
}

ParticleID TodParticleEmitter::ParticleRosterIDAt(int theIndex) const
{
	auto* aRow = TodParticleRosterStorage::ParticleRosterRowFor(this);
	if (aRow == nullptr || (unsigned)theIndex >= aRow->mCount)
		return ParticleID::PARTICLEID_NULL;
	return (ParticleID)mParticleSystem->mParticleHolder->mParticles.DataArrayGetID(
		&mParticleSystem->mParticleHolder->mParticles.mBlock[aRow->mSlots[theIndex]].mItem);
}

bool TodParticleEmitter::ParticleRosterAdd(TodParticle* theParticle)
{
	auto* aRow = TodParticleRosterStorage::ParticleRosterRowFor(this);
	if (aRow == nullptr)
		return false;
	if (aRow->mCount >= PARTICLE_ROSTER_MAX)
	{
		TodTraceWithoutSpamming("Too many particles in roster (emitter id=%u)\n", static_cast<unsigned>(mEmitterDef->mNameId));
		return false;
	}
	aRow->mSlots[aRow->mCount++] = (uint16_t)mParticleSystem->mParticleHolder->mParticles.DataArrayIndexOf(theParticle);
	return true;
}

int TodParticleEmitter::ParticleRosterFind(TodParticle* theParticle) const
{
	auto* aRow = TodParticleRosterStorage::ParticleRosterRowFor(this);
	if (aRow == nullptr)
		return -1;
	const uint16_t aSlot = (uint16_t)mParticleSystem->mParticleHolder->mParticles.DataArrayIndexOf(theParticle);
	for (int i = 0; i < aRow->mCount; i++)
		if (aRow->mSlots[i] == aSlot)
			return i;
	return -1;
}

void TodParticleEmitter::ParticleRosterRemoveAt(int theIndex)
{
	auto* aRow = TodParticleRosterStorage::ParticleRosterRowFor(this);
	if (aRow == nullptr || (unsigned)theIndex >= aRow->mCount)
		return;
	std::memmove(&aRow->mSlots[theIndex], &aRow->mSlots[theIndex + 1],
		(aRow->mCount - theIndex - 1) * sizeof(uint16_t));
	aRow->mCount--;
}

void TodParticleEmitter::ParticleRosterClear()
{
	auto* aRow = TodParticleRosterStorage::ParticleRosterRowFor(this);
	if (aRow != nullptr)
		aRow->mCount = 0;
}

//0x518900
void TodParticleData::Initialize()
{
	mRosterStorage = std::make_unique<TodParticleRosterStorage>();
	mParticleSystems.DataArrayInitialize(PARTICLE_POOL_CAPACITY, DataArrayKind::ParticleSystems);
	mEmitters.DataArrayInitialize(PARTICLE_POOL_CAPACITY, DataArrayKind::ParticleEmitters);
	mParticles.DataArrayInitialize(PARTICLE_POOL_CAPACITY, DataArrayKind::Particles);
}

//0x5189A0
void TodParticleData::Dispose()
{
	mParticleSystems.DataArrayDispose();
	mEmitters.DataArrayDispose();
	mParticles.DataArrayDispose();
	// Pool object destructors must finish before their roster rows are released.
	mRosterStorage.reset();
}

bool TodParticleHolder::IsOverLoaded()
{
	return mParticleSystems.mSize > MAX_PARTICLES_SIZE || mEmitters.mSize > MAX_PARTICLES_SIZE || mParticles.mSize > MAX_PARTICLES_SIZE;
}

TodParticleSystem* TodParticleHolder::AllocParticleSystemFromDef(float theX, float theY, int theRenderOrder, TodParticleDefinition* theDefinition, ParticleEffect theParticleEffect)
{
	if (mParticleSystems.mSize == mParticleSystems.mMaxSize)
	{
		TodTrace("Too many particle systems\n");
		return nullptr;
	}
	if (theDefinition->mEmitterDefCount + mEmitters.mSize > mEmitters.mMaxSize)
	{
		TodTrace("Too many particle emitters\n");
		return nullptr;
	}

	TodParticleSystem* aTodParticle = mParticleSystems.DataArrayAlloc();
	aTodParticle->mParticleHolder = this;
	aTodParticle->TodParticleInitializeFromDef(theX, theY, theRenderOrder, theDefinition, theParticleEffect);
	return aTodParticle;
}

//0x518A70
TodParticleSystem* TodParticleHolder::AllocParticleSystem(float theX, float theY, int theRenderOrder, ParticleEffect theParticleEffect)
{
	TOD_ASSERT((int)theParticleEffect >= 0 && (int)theParticleEffect < gParticleDefCount);
	return AllocParticleSystemFromDef(theX, theY, theRenderOrder, &gParticleDefArray[(int)theParticleEffect], theParticleEffect);
}
