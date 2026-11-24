// Generated from the selected HD artwork.
#pragma once
#include "graphics/TextureRegion.h"
namespace HdUi {
inline constexpr int StripPageWidth=5608, StripPageHeight=5448, StripHeight=225;
struct Strip { Sexy::TextureRegion region; int left; };
inline constexpr Strip SELECTORSCREEN_ACHIEVEMENTS_BG{{4.0f/5608, 4.0f/5448, 5604.0f/5608, 904.0f/5448, 1400, 225}, 0};
inline constexpr Strip ACHEESEMENTS_HOLE_TILE{{4.0f/5608, 912.0f/5448, 5604.0f/5608, 1812.0f/5448, 1400, 225}, 0};
inline constexpr Strip ACHEESEMENTS_CHINA{{4.0f/5608, 1820.0f/5448, 5604.0f/5608, 2720.0f/5448, 1400, 225}, 0};
inline constexpr Strip ACHEESEMENTS_BEJEWELED{{4.0f/5608, 2728.0f/5448, 3172.0f/5608, 3628.0f/5448, 792, 225}, 309};
inline constexpr Strip ACHEESEMENTS_ZUMA{{3180.0f/5608, 2728.0f/5448, 5412.0f/5608, 3628.0f/5448, 558, 225}, 422};
inline constexpr Strip ACHEESEMENTS_BOOKWORM{{4.0f/5608, 3636.0f/5448, 2976.0f/5608, 4536.0f/5448, 743, 225}, 338};
inline constexpr Strip ACHEESEMENTS_PEGGLE{{2984.0f/5608, 3636.0f/5448, 5000.0f/5608, 4536.0f/5448, 504, 225}, 448};
inline constexpr Strip ACHEESEMENTS_PIPE{{4.0f/5608, 4544.0f/5448, 2948.0f/5608, 5444.0f/5448, 736, 225}, 329};
inline constexpr Strip ACHEESEMENTS_CHUZZLE{{2956.0f/5608, 4544.0f/5448, 4920.0f/5608, 5444.0f/5448, 491, 225}, 461};
struct DecorationOrigin { int x, y; };
inline constexpr DecorationOrigin ALMANAC_INDEXPANELS{19, 164};
inline constexpr DecorationOrigin ALMANAC_PLANTDECOR{0, 200};
inline constexpr DecorationOrigin ALMANAC_ZOMBIEDECOR{0, 251};
}
