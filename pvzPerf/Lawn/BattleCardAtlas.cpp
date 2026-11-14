#include "BattleCardAtlas.h"
#include "Board.h"
#include "SeedPacket.h"
#include "Challenge.h"
#include "Plant.h"
#include "LandscapeHud.h"
#include "LawnApp.h"
#include "System/ReanimationLawn.h"
#include "graphics/Image.h"
#include "graphics/Graphics.h"
#include "graphics/DDInterface.h"
#include "graphics/RenderInterface.h"
#include <algorithm>

using namespace Sexy;
BattleCardAtlas::~BattleCardAtlas()=default;
BattleCardAtlas::BattleCardAtlas(Board& board):board_(&board),landscape_(board.mLandscapeHud),
    conveyor_(board.HasConveyorBeltSeedBank()),width_(landscape_?81:50),height_(landscape_?53:70) {
    conveyorSlots_.fill(-1);
    if(conveyor_) {
        for(auto seed:board.mChallenge->ConveyorCardTypes())
            if(std::none_of(entries_.begin(),entries_.end(),[&](auto e){return e.seed==seed;}))
                entries_.push_back({seed,SEED_NONE,0,false});
    } else for(int i=0;i<board.mSeedBank->mNumPackets;++i) {
        const auto& p=board.mSeedBank->mSeedPackets[i];
        entries_.push_back({p.mPacketType,p.mImitaterType,0,false});
    }
    if(entries_.empty())return;
    for(int i=0;i<static_cast<int>(entries_.size());++i)if(static_cast<unsigned>(entries_[i].seed)<conveyorSlots_.size())conveyorSlots_[entries_[i].seed]=i;
    for(int i=0;i<static_cast<int>(entries_.size());++i) {
        auto& e=entries_[i];
        if(e.seed==SEED_NONE)continue;
        const auto effective=e.seed==SEED_IMITATER&&e.imitater!=SEED_NONE?e.imitater:e.seed;
        e.variableCost=!conveyor_&&board.PlantUsesAcceleratedPricing(effective);
        e.cost=board.GetCurrentPlantCost(e.seed,e.imitater);
    }
    Rebuild();
}
void BattleCardAtlas::Rebuild() {
    image_.reset(board_->mApp->mDDInterface->mRenderInterface->CreateRenderImage(
        static_cast<int>(entries_.size())*(width_+4),height_+4));
    for(int i=0;i<static_cast<int>(entries_.size());++i) if(entries_[i].seed!=SEED_NONE)Paint(i);
}
void BattleCardAtlas::Paint(int slot) {
    const auto& e=entries_[slot];
    auto& render=*board_->mApp->mDDInterface->mRenderInterface;
    GpuImageDrawScope scope(render,image_.get());
    Graphics g(image_.get());
    const int x=slot*(width_+4)+2;
    // Opaque replacement writes transparent black as well; ordinary alpha
    // blending cannot erase old digits or restore transparent card edges.
    render.FillRect(Rect(x,2,width_,height_),Color(0,0,0,0),2);
    g.ClipRect(x,2,width_,height_);
    if(landscape_)LandscapeHud::DrawPacket(&g,float(x),2,e.seed,e.imitater,0,255,!conveyor_,true);
    else DrawSeedPacket(&g,float(x),2,e.seed,e.imitater,0,255,!conveyor_,true);
}
void BattleCardAtlas::UpdatePrices() {
    if(!pricesDirty_)return;
    pricesDirty_=false;
    for(int i=0;i<static_cast<int>(entries_.size());++i) {
        auto& e=entries_[i];if(!e.variableCost)continue;
        const int cost=board_->GetCurrentPlantCost(e.seed,e.imitater);
        if(cost!=e.cost){e.cost=cost;Paint(i);}
    }
}
bool BattleCardAtlas::Draw(const SeedPacket& p,Graphics* graphics,float dark,int gray) {
    if(!image_||p.mBoard!=board_)return false;
    int slot=p.mIndex;
    if(conveyor_) {
        if(static_cast<unsigned>(p.mPacketType)>=conveyorSlots_.size())return false;
        slot=conveyorSlots_[p.mPacketType];
    }
    if(slot<0||slot>=static_cast<int>(entries_.size()))return false;
    const auto& e=entries_[slot];
    if(e.seed!=p.mPacketType||e.imitater!=p.mImitaterType)return false;
    Graphics g(*graphics);g.mColorizeImages=true;g.mColor=Color(gray,gray,gray,graphics->mColorizeImages?graphics->mColor.mAlpha:255);
    if(landscape_)g.mLinearBlend=false;
    const int x=landscape_?0:p.mOffsetX;
    const Rect source(slot*(width_+4)+2,2,width_,height_);
    g.DrawImage(image_.get(),x,0,source);
    if(dark>0) {
        g.mColor=Color(64,64,64,g.mColor.mAlpha);
        if(landscape_){const int covered=std::clamp(int(width_*dark+0.5f),0,width_);g.ClipRect(x+width_-covered,0,covered,height_);}
        else g.ClipRect(x,0,width_,int(68*dark+0.5f)+2);
        g.DrawImage(image_.get(),x,0,source);
    }
    return true;
}
bool BattleCardAtlas::Matches(const Board& b) const {
    if(board_!=&b||landscape_!=b.mLandscapeHud||conveyor_!=b.HasConveyorBeltSeedBank())return false;
    if(conveyor_)return true;
    if(entries_.size()!=static_cast<size_t>(b.mSeedBank->mNumPackets))return false;
    for(int i=0;i<b.mSeedBank->mNumPackets;++i)if(entries_[i].seed!=b.mSeedBank->mSeedPackets[i].mPacketType||entries_[i].imitater!=b.mSeedBank->mSeedPackets[i].mImitaterType)return false;
    return true;
}
void PrepareBattleCardAtlas(Board& board) {
    auto& app=*board.mApp;
    // Production prebuilds portraits before any Board exists. Partial-object
    // fixtures without that loading barrier retain the original draw path.
    if(!app.mReanimatorCache||!app.mReanimatorCache->mPlantImages[SEED_PEASHOOTER]||app.IsSlotMachineLevel()||app.IsChallengeWithoutSeedBank())return;
    if(app.mBattleCardAtlas&&app.mBattleCardAtlas->Matches(board))return;
    app.mBattleCardAtlas=std::make_unique<BattleCardAtlas>(board);
}
