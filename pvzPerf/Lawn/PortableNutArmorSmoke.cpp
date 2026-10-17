#include "PortableFixesSmoke.h"
#include "ModernVulkanSmoke.h"
#include "LawnApp.h"
#include "Resources.h"
#include "Board.h"
#include "Zombie.h"
#include "System/SaveGame.h"
#include "Sexy.TodLib/Reanimator.h"
#include "Sexy.TodLib/EffectSystem.h"
#include "Sexy.TodLib/Attachment.h"
#include "graphics/DDInterface.h"
#include "graphics/DDImage.h"
#include "graphics/RenderInterface.h"
#include <algorithm>
#include <array>
#include <fstream>
#include <limits>
#include <stdexcept>

namespace {
void Require(bool ok, const char* text) { if (!ok) throw std::runtime_error(text); }
void DeleteQueue(LawnApp& app) { app.mBoard->ProcessDeleteQueue(); app.mEffectSystem->ProcessDeleteQueue(); }

void ResourceImageReadCases(std::ostream& log) {
    unsigned cases = 0;
    for (auto encoding : {LevelSaveEncoding::Legacy1073, LevelSaveEncoding::Dat64V1}) {
        // Negative witness first: reading a font slot does not access beyond
        // its pointer storage. Never dereference the wrongly returned object.
        SaveGameContext font;
        font.mFailed = false; font.mReading = true; font.mEncoding = encoding;
        font.mBuffer.WriteLong(int(Sexy::ResourceId::FONT_BRIANNETOD16_ID));
        Sexy::Image* image = nullptr;
        font.SyncImage(image);
        const bool rejected = font.mFailed && image == nullptr;
        log << "image-resource-font-rejected encoding=" << int(encoding) << " result=" << rejected << std::endl;
        Require(rejected, "Image stream accepted a font resource ID");
        ++cases;
        for (int id = 0; id <= int(Sexy::ResourceId::RESOURCE_ID_MAX); ++id) {
            SaveGameContext reader;
            reader.mFailed = false; reader.mReading = true; reader.mEncoding = encoding;
            reader.mBuffer.WriteLong(id);
            image = nullptr;
            reader.SyncImage(image);
            const bool null = id == int(Sexy::ResourceId::RESOURCE_ID_MAX);
            const bool valid = null || gResources[id].mKind == Sexy::ResourceReference::Kind::Image;
            auto* expected = valid && !null ? Sexy::GetImageById(static_cast<Sexy::ResourceId>(id)) : nullptr;
            Require(reader.mFailed == !valid && image == expected && reader.ByteLeftToRead() == 0,
                "Image stream kind, pointer or four-byte width is wrong");
            ++cases;
        }
        for (int id : {-1, std::numeric_limits<int>::min(), int(Sexy::ResourceId::RESOURCE_ID_MAX) + 1,
                       std::numeric_limits<int>::max()}) {
            SaveGameContext reader;
            reader.mFailed = false; reader.mReading = true; reader.mEncoding = encoding;
            reader.mBuffer.WriteLong(id); image = nullptr;
            reader.SyncImage(image);
            Require(reader.mFailed && !image, "Image stream accepted an out-of-range ID");
            ++cases;
        }
        for (int bytes = 0; bytes < 4; ++bytes) {
            SaveGameContext reader;
            reader.mFailed = false; reader.mReading = true; reader.mEncoding = encoding;
            unsigned char raw[4]{};
            reader.mBuffer.WriteBytes(raw, bytes); image = Sexy::IMAGE_PVZ_LOGO;
            reader.SyncImage(image);
            Require(reader.mFailed && !image && reader.ByteLeftToRead() == bytes,
                "Truncated image stream looked up resource zero or consumed partial input");
            ++cases;
        }
        SaveGameContext failed;
        failed.mFailed = true; failed.mReading = true; failed.mEncoding = encoding;
        failed.mBuffer.WriteLong(int(Sexy::ResourceId::IMAGE_PVZ_LOGO_ID)); image = Sexy::IMAGE_PVZ_LOGO;
        failed.SyncImage(image);
        Require(failed.mFailed && !image && failed.ByteLeftToRead() == 4, "Failed image stream continued lookup");
        ++cases;
    }
    Require(cases == 1780, "Image resource fixture coverage changed");
    log << "portable-image-resource-1780-stream-cases passed" << std::endl;
}

void ResourceValueCases(std::ostream& log) {
    unsigned imageCount = 0, fontCount = 0, soundCount = 0;
    for (int pass = 0; pass < 2; ++pass) {
        if (pass == 1) gNeedRecalcVariableToIdMap = true; // Exercise a real cache rebuild as well as cached queries.
        for (int i = 0; i < int(Sexy::ResourceId::RESOURCE_ID_MAX); ++i) {
            const auto& slot = gResources[i]; const auto id = static_cast<Sexy::ResourceId>(i);
            if (slot.mKind == Sexy::ResourceReference::Kind::Image) {
                auto* value = Sexy::GetImageById(id); if (!value) continue;
                const auto found = Sexy::GetIdByImage(value);
                Require(found != Sexy::ResourceId::RESOURCE_ID_MAX && Sexy::GetImageById(found) == value,
                    "Loaded image does not round-trip through its resource ID");
                Require(&Sexy::GetImageRefById(id) == slot.mAddress, "Image reference accessor changed its slot");
                ++imageCount;
            } else if (slot.mKind == Sexy::ResourceReference::Kind::Font) {
                auto* value = Sexy::GetFontById(id); if (!value) continue;
                const auto found = Sexy::GetIdByFont(value);
                Require(found != Sexy::ResourceId::RESOURCE_ID_MAX && Sexy::GetFontById(found) == value,
                    "Loaded font does not round-trip through its resource ID");
                Require(&Sexy::GetFontRefById(id) == slot.mAddress, "Font reference accessor changed its slot");
                ++fontCount;
            } else {
                const int value = Sexy::GetSoundById(id);
                // The original shared reverse map aliases zero/unloaded slots.
                // Verify nonzero loaded handles without inventing a new null policy.
                if (value <= 0) continue;
                const auto found = Sexy::GetIdBySound(value);
                Require(found != Sexy::ResourceId::RESOURCE_ID_MAX && Sexy::GetSoundById(found) == value,
                    "Loaded sound does not round-trip through its resource ID");
                Require(&Sexy::GetSoundRefById(id) == slot.mAddress, "Sound reference accessor changed its slot");
                ++soundCount;
            }
        }
    }
    struct alignas(8) NarrowSound { int value; std::uint32_t neighbor; } sound{7, 0xa5c39e27u};
    static_assert(sizeof(sound.value) == 4);
    const Sexy::ResourceReference slot(&sound.value);
    Require(slot.Value() == reinterpret_cast<void*>(intptr_t(7)) && sound.neighbor == 0xa5c39e27u,
        "Sound resource reader included adjacent bytes");
    sound.value = -1;
    Require(slot.Value() == reinterpret_cast<void*>(intptr_t(-1)), "Sound handle sign extension changed");
    Require(imageCount > 0 && fontCount > 0, "Resource mapping fixture has no loaded resources");
    log << "resource-roundtrips images=" << imageCount << " fonts=" << fontCount << " sounds=" << soundCount
        << " cached-and-rebuilt=1 sound-int32-neighbor=1\n";
}

bool RoundTripTracks(LawnApp& app, Reanimation& source, LevelSaveEncoding encoding, std::ostream& log) {
    // Test the actual per-animation stream, not a whole-level load. These
    // fixtures have no child attachments: copying a live attachment
    // ID into another owner would itself make the test double-destroy it.
    for (int i = 0; i < source.mDefinition->mTracks.count; ++i)
        Require(source.mTrackInstances[i].mAttachmentID == ATTACHMENTID_NULL,
            "Track stream fixture unexpectedly owns a child attachment");
    SaveGameContext writer;
    writer.mFailed = false; writer.mReading = false; writer.mEncoding = encoding;
    SyncReanimation(app.mBoard, &source, writer);
    Require(!writer.mFailed, "Cannot serialize animation tracks");
    SaveGameContext reader;
    reader.mFailed = false; reader.mReading = true; reader.mEncoding = encoding;
    reader.mBuffer = writer.mBuffer; reader.mBuffer.mReadBitPos = 0;
    Reanimation restored;
    restored.mReanimationType = source.mReanimationType; // Outer object field, not this track substream.
    SyncReanimation(app.mBoard, &restored, reader);
    Require(!reader.mFailed && reader.ByteLeftToRead() == 0 && restored.mDefinition == source.mDefinition,
        "Animation track stream failed or left unread bytes");
    bool same = true;
    for (int i = 0; i < source.mDefinition->mTracks.count; ++i) {
        const auto& a = source.mTrackInstances[i]; const auto& b = restored.mTrackInstances[i];
        same &= a.mImageOverride == b.mImageOverride && a.mRenderGroup == b.mRenderGroup &&
            a.mAttachmentID == b.mAttachmentID && a.mTrackColor == b.mTrackColor;
        if (a.mImageOverride != b.mImageOverride)
            log << "stream encoding=" << int(encoding) << " track=" << i << " resource-id="
                << int(Sexy::GetIdByImage(a.mImageOverride)) << " null-id=" << int(Sexy::ResourceId::RESOURCE_ID_MAX)
                << " source=" << a.mImageOverride << " restored=" << b.mImageOverride << '\n';
    }
    return same;
}

void BodyOverrideStreams(LawnApp& app, std::ostream& log) {
    using namespace Sexy;
    unsigned streams = 0, wrong = 0, nonnull = 0;
    // 1073 0048C4D0/0048C220 serializes the actual override resource IDs.
    // This tests that substream, NOT whole-level conversion or damage thresholds.
    // Do not instantiate/update boss attachers or clone ownership of live IDs.
    for (int repeat = 0; repeat < 2; ++repeat)
    for (auto kind : {ZOMBIE_GARGANTUAR, ZOMBIE_REDEYE_GARGANTUAR,
                      ZOMBIE_ZAMBONI, ZOMBIE_CATAPULT, ZOMBIE_BOSS}) {
        Reanimation body;
        body.ReanimationInitializeType(0, 0, GetZombieDefinition(kind).mReanimationType);
        auto set = [&](ReanimTrackId track, Image* image) {
            Require(body.TrackExists(track) && image, "Missing body override track/resource");
            body.SetImageOverride(track, image);
        };
        // Baseline, first damage, second damage, explicit non-health-derived
        // override, then all overrides cleared. Repeat from a fresh animation.
        for (int state = 0; state < 5; ++state) {
            if (state == 0 && kind == ZOMBIE_REDEYE_GARGANTUAR)
                set(ReanimTrackId::anim_head1, IMAGE_REANIM_ZOMBIE_GARGANTUAR_HEAD_REDEYE);
            if (state == 1 || state == 2) {
                const bool severe = state == 2;
                if (kind == ZOMBIE_GARGANTUAR || kind == ZOMBIE_REDEYE_GARGANTUAR) {
                    set(ReanimTrackId::Zombie_gargantua_body1, severe ?
                        IMAGE_REANIM_ZOMBIE_GARGANTUAR_BODY1_3 : IMAGE_REANIM_ZOMBIE_GARGANTUAR_BODY1_2);
                    set(ReanimTrackId::Zombie_gargantuar_outerarm_lower, IMAGE_REANIM_ZOMBIE_GARGANTUAR_OUTERARM_LOWER2);
                    if (severe) {
                        set(ReanimTrackId::Zombie_gargantuar_outerleg_foot, IMAGE_REANIM_ZOMBIE_GARGANTUAR_FOOT2);
                        set(ReanimTrackId::anim_head1, kind == ZOMBIE_REDEYE_GARGANTUAR ?
                            IMAGE_REANIM_ZOMBIE_GARGANTUAR_HEAD2_REDEYE : IMAGE_REANIM_ZOMBIE_GARGANTUAR_HEAD2);
                    }
                } else if (kind == ZOMBIE_ZAMBONI) {
                    set(ReanimTrackId::Zombie_zamboni_1, severe ?
                        IMAGE_REANIM_ZOMBIE_ZAMBONI_1_DAMAGE2 : IMAGE_REANIM_ZOMBIE_ZAMBONI_1_DAMAGE1);
                    set(ReanimTrackId::Zombie_zamboni_2, severe ?
                        IMAGE_REANIM_ZOMBIE_ZAMBONI_2_DAMAGE2 : IMAGE_REANIM_ZOMBIE_ZAMBONI_2_DAMAGE1);
                } else if (kind == ZOMBIE_CATAPULT) {
                    set(ReanimTrackId::Zombie_catapult_siding, IMAGE_REANIM_ZOMBIE_CATAPULT_SIDING_DAMAGE);
                } else {
                    set(ReanimTrackId::Boss_head, severe ? IMAGE_REANIM_ZOMBIE_BOSS_HEAD_DAMAGE2 : IMAGE_REANIM_ZOMBIE_BOSS_HEAD_DAMAGE1);
                    set(ReanimTrackId::Boss_jaw, severe ? IMAGE_REANIM_ZOMBIE_BOSS_JAW_DAMAGE2 : IMAGE_REANIM_ZOMBIE_BOSS_JAW_DAMAGE1);
                    set(ReanimTrackId::Boss_outerarm_hand, severe ? IMAGE_REANIM_ZOMBIE_BOSS_OUTERARM_HAND_DAMAGE2 : IMAGE_REANIM_ZOMBIE_BOSS_OUTERARM_HAND_DAMAGE1);
                    set(ReanimTrackId::Boss_outerarm_thumb2, severe ? IMAGE_REANIM_ZOMBIE_BOSS_OUTERARM_THUMB_DAMAGE2 : IMAGE_REANIM_ZOMBIE_BOSS_OUTERARM_THUMB_DAMAGE1);
                    set(severe ? ReanimTrackId::Boss_outerleg_foot : ReanimTrackId::Boss_innerleg_foot,
                        severe ? IMAGE_REANIM_ZOMBIE_BOSS_FOOT_DAMAGE2 : IMAGE_REANIM_ZOMBIE_BOSS_FOOT_DAMAGE1);
                }
            }
            if (state == 3) {
                Require(IMAGE_REANIM_ZOMBIE_ZAMBONI_1_DAMAGE1, "Missing explicit override resource");
                body.mTrackInstances[0].mImageOverride = IMAGE_REANIM_ZOMBIE_ZAMBONI_1_DAMAGE1;
                body.mTrackInstances[0].mTrackColor = Color(19, 57, 121, 173);
                body.mTrackInstances[0].mRenderGroup = 3;
            }
            if (state == 4) for (int i = 0; i < body.mDefinition->mTracks.count; ++i)
                body.mTrackInstances[i].mImageOverride = nullptr;
            unsigned overrides = 0;
            for (int i = 0; i < body.mDefinition->mTracks.count; ++i)
                overrides += body.mTrackInstances[i].mImageOverride != nullptr;
            nonnull += overrides;
            for (auto encoding : {LevelSaveEncoding::Legacy1073, LevelSaveEncoding::Dat64V1}) {
                const bool pass = RoundTripTracks(app, body, encoding, log);
                ++streams; wrong += !pass;
                log << "body-stream repeat=" << repeat << " zombie=" << int(kind) << " state=" << state
                    << " encoding=" << int(encoding) << " tracks=" << body.mDefinition->mTracks.count
                    << " overrides=" << overrides << " pass=" << pass << '\n';
            }
        }
    }
    log << "body-streams=" << streams << " wrong=" << wrong << " nonnull-overrides=" << nonnull << std::endl;
    Require(streams == 100 && wrong == 0 && nonnull > 0, "Body override substream mismatch");
    ModernSmoke::Report("portable-body-five-types-five-states-100-track-streams", app);
}

auto DrawHead(LawnApp& app, Reanimation& head) {
    auto& render = *app.mDDInterface->mRenderInterface;
    auto* screen = app.mDDInterface->mScreenImage;
    const auto matrix = head.mOverlayMatrix;
    struct Restore { Reanimation& head; SexyTransform2D matrix; ~Restore(){ head.mOverlayMatrix = matrix; } }
        restore{head, matrix};
    head.mOverlayMatrix.LoadIdentity(); head.mOverlayMatrix.m02 = 200;
    head.mOverlayMatrix.m12 = 200;
    screen->FillRect(Sexy::Rect(0, 0, 800, 600), Sexy::Color(17, 29, 43), 0);
    Sexy::Graphics g(screen); head.Draw(&g); render.Flush();
    auto pixels = render.mRenderer->ReadScenePixels();
    Require(pixels.size() == 480000 && std::any_of(pixels.begin() + 1, pixels.end(),
        [&](auto p){ return p != pixels[0]; }), "Nut head GPU draw is blank or incorrectly sized");
    return pixels;
}
}

void PortableNutArmorSmoke(LawnApp& app) {
    Require(getenv("PVZ_MODERN_HIDDEN") && getenv("PVZ_APPDATA_DIR") && app.mBoard,
        "Nut armor regression requires an isolated hidden board");
    DeleteQueue(app);
    const auto zombiesBefore = app.mBoard->mZombies.mSize;
    const auto reanimsBefore = app.mEffectSystem->mReanimationHolder->mReanimations.mSize;
    const auto attachmentsBefore = app.mEffectSystem->mAttachmentHolder->mAttachments.mSize;
    std::ofstream log(ModernSmoke::ProbePath("nut-armor-cases.txt"));
    Require(bool(log), "Cannot write nut armor evidence");
    ResourceImageReadCases(log);
    ModernSmoke::Report("portable-image-resource-1780-stream-cases", app);
    ResourceValueCases(log);
    BodyOverrideStreams(app, log);
    unsigned initCases = 0, initWrong = 0, damageCases = 0, damageWrong = 0;
    unsigned streams = 0, streamWrong = 0, gpuCases = 0, gpuWrong = 0;
    static_assert(HELMTYPE_WALLNUT == 8 && HELMTYPE_TALLNUT == 9);
    for (int repeat = 0; repeat < 2; ++repeat) for (bool tall : {false, true}) {
        const auto kind = tall ? ZOMBIE_TALLNUT_HEAD : ZOMBIE_WALLNUT_HEAD;
        const auto helm = tall ? HELMTYPE_TALLNUT : HELMTYPE_WALLNUT;
        const auto reanimType = tall ? REANIM_TALLNUT : REANIM_WALLNUT;
        const auto track = tall ? ReanimTrackId::anim_idle : ReanimTrackId::anim_face;
        const int maximum = tall ? 2200 : 1100;
        auto* zombie = app.mBoard->AddZombieInRow(kind, repeat == 0 ? 0 : 5, 0);
        const auto zombieId = app.mBoard->ZombieGetID(zombie);
        const auto headId = zombie->mSpecialHeadReanimID;
        auto* head = app.ReanimationGet(headId);
        Require(head && head->mReanimationType == reanimType && head->TrackExists(track),
            "Nut fixture has wrong/missing head animation or track");
        const bool correctInit = zombie->mHelmType == helm && zombie->mHelmHealth == maximum &&
            zombie->mHelmMaxHealth == maximum;
        ++initCases; initWrong += !correctInit;
        log << "init type=" << int(kind) << " row=" << zombie->mRow << " helm=" << int(zombie->mHelmType)
            << " expected=" << int(helm) << " hp=" << zombie->mHelmHealth << " pass=" << correctInit << '\n';
        const int bodyBefore = zombie->mBodyHealth;
        for (int health : {maximum, maximum * 2 / 3, maximum * 2 / 3 - 1,
             maximum / 3, maximum / 3 - 1, 1, 0}) {
            const int remaining = zombie->TakeHelmDamage(zombie->mHelmHealth - health + (health == 0 ? 20 : 0), 0);
            const int index = health < maximum / 3 ? 2 : health < maximum * 2 / 3 ? 1 : 0;
            Sexy::Image* expectedImage = index == 0 ? nullptr : tall ?
                (index == 1 ? Sexy::IMAGE_REANIM_TALLNUT_CRACKED1 : Sexy::IMAGE_REANIM_TALLNUT_CRACKED2) :
                (index == 1 ? Sexy::IMAGE_REANIM_WALLNUT_CRACKED1 : Sexy::IMAGE_REANIM_WALLNUT_CRACKED2);
            const bool correct = zombie->mHelmHealth == health && zombie->GetHelmDamageIndex() == index &&
                zombie->mHelmType == (health == 0 ? HELMTYPE_NONE : helm) &&
                remaining == (health == 0 ? 20 : 0) && zombie->mBodyHealth == bodyBefore &&
                head->GetImageOverride(track) == expectedImage;
            ++damageCases; damageWrong += !correct;
            log << "damage type=" << int(kind) << " hp=" << health << " index=" << index
                << " correct-image=" << (head->GetImageOverride(track) == expectedImage) << " pass=" << correct << '\n';
            if (health != 0) for (auto encoding : {LevelSaveEncoding::Legacy1073, LevelSaveEncoding::Dat64V1}) {
                ++streams; streamWrong += !RoundTripTracks(app, *head, encoding, log);
            }
            if (repeat == 0 && (health == maximum || health == maximum * 2 / 3 - 1 || health == maximum / 3 - 1)) {
                // A fresh reference animation with the independently selected
                // original asset; do not derive the reference from production overrides.
                Reanimation reference; reference.ReanimationInitializeType(200, 200, reanimType);
                reference.PlayReanim(ReanimTrackId::anim_idle, REANIM_LOOP, 0, 15.0f);
                // ZombieInitialize ends with UpdateReanim, which has already
                // advanced its attached head. Compare assets at the same phase.
                reference.mAnimTime = head->mAnimTime;
                reference.SetImageOverride(track, expectedImage);
                const auto actual = DrawHead(app, *head), expected = DrawHead(app, reference);
                unsigned different = 0;
                for (size_t i = 0; i < actual.size(); ++i) different += actual[i] != expected[i];
                ++gpuCases; gpuWrong += different != 0;
                log << "gpu type=" << int(kind) << " damage-index=" << index << " wrong-pixels=" << different << '\n';
            }
        }
        zombie->DieNoLoot(); DeleteQueue(app);
        Require(app.mBoard->mZombies.DataArrayTryToGet(zombieId) == nullptr && app.ReanimationTryToGet(headId) == nullptr,
            "Nut fixture retained a dead zombie/head ID");
    }
    Require(app.mBoard->mZombies.mSize == zombiesBefore &&
        app.mEffectSystem->mReanimationHolder->mReanimations.mSize == reanimsBefore &&
        app.mEffectSystem->mAttachmentHolder->mAttachments.mSize == attachmentsBefore,
        "Nut fixture left live objects/attachments");
    log << "init=" << initCases << " init-wrong=" << initWrong << " damage=" << damageCases
        << " damage-wrong=" << damageWrong << " streams=" << streams << " stream-wrong=" << streamWrong
        << " gpu=" << gpuCases << " gpu-wrong=" << gpuWrong << std::endl;
    Require(initWrong == 0 && damageWrong == 0 && streamWrong == 0 && gpuWrong == 0,
        "Nut helmet/texture mismatch; see nut-armor-cases.txt");
    ModernSmoke::Report("portable-nut-armor-four-init-28-damage-48-stream-six-gpu", app);
}
