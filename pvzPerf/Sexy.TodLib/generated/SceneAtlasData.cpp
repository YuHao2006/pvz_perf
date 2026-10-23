#include "SceneAtlasData.h"
#include "Sexy.TodLib/DefinitionImageRegion.h"
namespace MagnetAtlas {
Sexy::GpuTexture* Texture = nullptr;
const Sexy::Rect Images[Count] = {
    {83, 256, 62, 67},
    {86, 327, 62, 67},
    {87, 652, 62, 67},
    {2, 377, 66, 73},
    {2, 515, 66, 73},
    {5, 592, 66, 73},
    {75, 525, 66, 123},
    {83, 2, 66, 123},
    {83, 129, 66, 123},
    {2, 774, 44, 86},
    {46, 774, 44, 86},
    {90, 774, 44, 86},
    {2, 454, 58, 57},
    {2, 2, 77, 121},
    {2, 127, 77, 121},
    {2, 252, 77, 121},
    {72, 398, 77, 121},
    {51, 725, 43, 40},
    {2, 725, 45, 45},
    {15, 669, 68, 52},
    {101, 723, 48, 47},
};
const float Scales[Count] = {
    0.800000012f, 0.800000012f, 0.800000012f, 0.800000012f, 0.800000012f, 0.800000012f, 0.800000012f, 0.800000012f, 0.800000012f, 0.800000012f, 0.800000012f, 0.800000012f, 0.800000012f, 0.800000012f, 0.800000012f, 0.800000012f, 0.800000012f, 1.0f, 1.0f, 1.0f, 0.800000012f
};
void Load() {
    DefinitionBindAtlasPath(Texture, Width, Height, "compiled/atlases/magnet_items.atlas.png");
}
void Free() { DefinitionUnbindAtlas(Texture); }
}
namespace AlmanacAtlas {
Sexy::GpuTexture* Texture = nullptr;
const Sexy::Rect Images[Count] = {
    {2, 2, 1400, 600},
    {1406, 2, 1400, 600},
    {2810, 2, 1400, 600},
    {4542, 2, 324, 484},
    {4214, 2, 324, 497},
    {4294, 503, 76, 76},
    {4374, 503, 76, 76},
    {4214, 503, 76, 76},
    {4870, 2, 200, 200},
    {4870, 206, 200, 200},
    {4870, 410, 200, 200},
    {5074, 206, 200, 200},
    {5074, 410, 200, 200},
    {5074, 2, 200, 200},
    {4454, 550, 89, 26},
    {4492, 503, 89, 26},
    {4214, 583, 164, 26},
    {4382, 583, 164, 26},
    {4454, 503, 34, 43},
};
void Load() {
    DefinitionBindAtlasPath(Texture, Width, Height, "compiled/atlases/almanac_ui.atlas.png");
}
void Free() { DefinitionUnbindAtlas(Texture); }
}
namespace AchievementsAtlas {
Sexy::GpuTexture* Texture = nullptr;
const Sexy::Rect Images[Count] = {
    {2810, 460, 1400, 225},
    {2, 2, 1400, 225},
    {2, 231, 1400, 225},
    {2, 460, 1400, 225},
    {1406, 2, 1400, 225},
    {1406, 231, 1400, 225},
    {1406, 460, 1400, 225},
    {2810, 2, 1400, 225},
    {2810, 231, 1400, 225},
    {4214, 262, 93, 39},
    {4214, 553, 92, 120},
    {4214, 305, 92, 120},
    {4214, 429, 92, 120},
    {4310, 305, 92, 120},
    {4310, 429, 92, 120},
    {4214, 2, 70, 70},
    {4284, 2, 70, 70},
    {4354, 2, 70, 70},
    {4424, 2, 70, 70},
    {4494, 2, 70, 70},
    {4564, 2, 70, 70},
    {4634, 2, 70, 70},
    {4214, 72, 70, 70},
    {4284, 72, 70, 70},
    {4354, 72, 70, 70},
    {4424, 72, 70, 70},
    {4494, 72, 70, 70},
    {4564, 72, 70, 70},
    {4634, 72, 70, 70},
    {4214, 142, 70, 70},
    {4284, 142, 70, 70},
    {4354, 142, 70, 70},
    {4424, 142, 70, 70},
    {4494, 142, 70, 70},
    {4564, 142, 70, 70},
};
const Sexy::Rect Icons[IconCount] = {
    {4214, 2, 70, 70},
    {4284, 2, 70, 70},
    {4354, 2, 70, 70},
    {4424, 2, 70, 70},
    {4494, 2, 70, 70},
    {4564, 2, 70, 70},
    {4634, 2, 70, 70},
    {4214, 72, 70, 70},
    {4284, 72, 70, 70},
    {4354, 72, 70, 70},
    {4424, 72, 70, 70},
    {4494, 72, 70, 70},
    {4564, 72, 70, 70},
    {4634, 72, 70, 70},
    {4214, 142, 70, 70},
    {4284, 142, 70, 70},
    {4354, 142, 70, 70},
    {4424, 142, 70, 70},
    {4494, 142, 70, 70},
    {4564, 142, 70, 70},
};
void Load() {
    DefinitionBindAtlasPath(Texture, Width, Height, "compiled/atlases/achievements_ui.atlas.png");
}
void Free() { DefinitionUnbindAtlas(Texture); }
}
namespace FixedUIAtlas {
Sexy::GpuTexture* Texture = nullptr;
const Sexy::Rect Images[Count] = {
    {290, 52, 36, 46},
    {877, 171, 46, 46},
    {330, 52, 35, 46},
    {290, 2, 36, 46},
    {827, 171, 46, 46},
    {330, 2, 35, 46},
    {374, 2, 107, 97},
    {193, 2, 93, 97},
    {485, 120, 120, 97},
    {162, 103, 107, 54},
    {730, 163, 93, 54},
    {609, 163, 117, 54},
    {277, 105, 107, 112},
    {388, 103, 93, 114},
    {485, 2, 120, 114},
    {609, 2, 107, 148},
    {720, 2, 93, 150},
    {817, 2, 120, 150},
    {2, 2, 187, 64},
    {2, 70, 156, 42},
    {2, 116, 156, 42},
    {2, 162, 156, 42},
    {162, 191, 111, 26},
    {162, 161, 111, 26},
};
void Load() {
    DefinitionBindAtlasPath(Texture, Width, Height, "compiled/atlases/fixed_ui.atlas.png");
}
void Free() { DefinitionUnbindAtlas(Texture); }
}
void LoadSceneAtlases() {
    MagnetAtlas::Load();
    AlmanacAtlas::Load();
    AchievementsAtlas::Load();
    FixedUIAtlas::Load();
}
void FreeSceneAtlases() {
    FixedUIAtlas::Free();
    AchievementsAtlas::Free();
    AlmanacAtlas::Free();
    MagnetAtlas::Free();
}
