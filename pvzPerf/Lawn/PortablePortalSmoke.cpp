#include "PortablePortalSmoke.h"
#include "ModernVulkanSmoke.h"
#include "LawnApp.h"
#include "Board.h"
#include "GridItem.h"
#include "Sexy.TodLib/EffectSystem.h"
#include "Sexy.TodLib/Reanimator.h"
#include "Sexy.TodLib/TodParticle.h"
#include "graphics/DDInterface.h"
#include "graphics/DDImage.h"
#include "graphics/RenderInterface.h"
#include <fstream>
#include <stdexcept>

namespace
{
void Require(bool value, const char* reason) { if (!value) throw std::runtime_error(reason); }
}

void PortablePortalClosingSmoke(LawnApp& app)
{
    auto& board = *app.mBoard;
    auto& effects = *app.mEffectSystem;
    Require(board.mPaused, "Portal probe needs an isolated paused board");
    board.ProcessDeleteQueue(); effects.ProcessDeleteQueue();
    const auto gridBaseline = board.mGridItems.mSize;
    const auto reanimBaseline = effects.mReanimationHolder->mReanimations.mSize;
    const auto particleBaseline = effects.mParticleHolder->mParticleSystems.mSize;
    std::ofstream log(ModernSmoke::ProbePath("portal-closing-cases.txt"));
    Require(bool(log), "Cannot write portal closing evidence");
    for (auto type : {GRIDITEM_PORTAL_CIRCLE, GRIDITEM_PORTAL_SQUARE})
        for (int cycle = 0; cycle < 8; ++cycle)
        {
            auto* portal = board.mGridItems.DataArrayAlloc();
            const auto gridID = board.mGridItems.DataArrayGetID(portal);
            portal->mGridItemType = type;
            Require(portal->mGridItemState == GRIDITEM_STATE_NORMAL, "Recycled portal slot retained its previous closed state");
            portal->mGridX = 3; portal->mGridY = 1;
            portal->mRenderOrder = Board::MakeRenderOrder(RENDER_LAYER_PARTICLE, 1, 0);
            portal->OpenPortal();
            const auto reanimID = portal->mGridItemReanimID;
            auto* animation = app.ReanimationGet(reanimID);
            unsigned appearingTicks = 0;
            while (animation->mLoopType != REANIM_LOOP && appearingTicks < 1000)
            { portal->Update(); ++appearingTicks; }
            Require(animation->mLoopType == REANIM_LOOP && portal->IsOpenPortal(), "Portal did not reach its pulsing open state");
            const auto particleID = portal->mGridItemParticleID;
            auto* particle = app.ParticleTryToGet(particleID);
            Require(particle && !particle->mDead, "Open portal did not create its particle effect");
            const int trackIndex = animation->FindTrackIndex(ReanimTrackId::anim_dissapear);
            Require(animation->GetTrackId(trackIndex) == ReanimTrackId::anim_dissapear, "Compiled portal has no real disappear track");
            int start = -1, frames = -1;
            animation->GetFramesForLayer(ReanimTrackId::anim_dissapear, start, frames);
            Require(start > 0 && frames > 0, "Invalid disappear frame range");
            portal->ClosePortal();
            log << "type=" << int(type) << " cycle=" << cycle << " appear-ticks=" << appearingTicks
                << " expected=" << start << ',' << frames << " actual=" << animation->mFrameStart << ',' << animation->mFrameCount << std::endl;
            Require(animation->mFrameStart == start && animation->mFrameCount == frames && animation->mAnimRate == 12 &&
                animation->mAnimTime == 0 && animation->mLoopType == REANIM_PLAY_ONCE_AND_HOLD && animation->mLoopCount == 0,
                "ClosePortal does not use the 1073 disappear track");
            Require(!portal->IsOpenPortal() && !portal->mDead && !animation->mDead &&
                portal->mGridItemReanimID == reanimID && portal->mGridItemParticleID == PARTICLESYSTEMID_NULL && particle->mDead,
                "Closing must disable interaction and kill particles, but retain animation until it finishes");
            unsigned closingTicks = 0;
            while (!portal->mDead && closingTicks < 1000)
            {
                if (cycle == 0 && closingTicks % 8 == 0)
                {
                    // Use the ordinary grid-item draw path on the Vulkan canvas.
                    Graphics graphics(app.mDDInterface->mScreenImage);
                    portal->DrawGridItem(&graphics);
                    app.mDDInterface->mRenderInterface->Flush();
                }
                portal->Update(); ++closingTicks;
                Require((animation->mLoopCount > 0) == portal->mDead, "Portal retired before/after its animation completion");
            }
            Require(portal->mDead && animation->mDead && portal->mGridItemReanimID == REANIMATIONID_NULL,
                "Finished portal did not retire its animation and clear the ID");
            board.ProcessDeleteQueue(); effects.ProcessDeleteQueue();
            Require(board.mGridItems.DataArrayTryToGet(gridID) == nullptr && app.ReanimationTryToGet(reanimID) == nullptr &&
                app.ParticleTryToGet(particleID) == nullptr, "Finished portal IDs still resolve after normal delete queues");
            Require(board.mGridItems.mSize == gridBaseline && effects.mReanimationHolder->mReanimations.mSize == reanimBaseline &&
                effects.mParticleHolder->mParticleSystems.mSize == particleBaseline, "Portal cycle accumulated live objects");
            log << "close-ticks=" << closingTicks << " queues-and-live-pools-restored=1" << std::endl;
        }
    ModernSmoke::Report("portable-portals-original-disappear-16-close-delete-cycles", app);
}
