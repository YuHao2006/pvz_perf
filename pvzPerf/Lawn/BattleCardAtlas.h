#pragma once
#include "ConstEnums.h"
#include <memory>
#include <vector>
#include <array>
namespace Sexy { class Image; class Graphics; }
class Board;
class SeedPacket;

// Derived render state owned by LawnApp for its current Board; never serialized.
class BattleCardAtlas {
    struct Entry { SeedType seed,imitater; int cost; bool variableCost; };
    Board* board_;
    std::unique_ptr<Sexy::Image> image_;
    std::vector<Entry> entries_;
    bool landscape_,conveyor_;
    int width_,height_;
    bool pricesDirty_=false;
    std::array<int,static_cast<int>(SEED_ZOMBIE_IMP)+1> conveyorSlots_;
    void Paint(int slot);
    void Rebuild();
public:
    explicit BattleCardAtlas(Board& board);
    ~BattleCardAtlas();
    bool Matches(const Board& board) const;
    void InvalidatePrices() { pricesDirty_=true; }
    const Sexy::Image* AtlasImage() const { return image_.get(); }
    void UpdatePrices();
    bool Draw(const SeedPacket& packet,Sexy::Graphics* g,float dark,int gray);
};
void PrepareBattleCardAtlas(Board& board);
