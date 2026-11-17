#include "Sexy.TodLib/AtlasSourceExtent.h"

static_assert(DefinitionAtlasSourceExtentMatches(8192, 4096, 8192, 4096));
static_assert(DefinitionAtlasSourceExtentMatches(8192, 4096, 4096, 2048));
static_assert(!DefinitionAtlasSourceExtentMatches(8192, 4096, 4096, 4096));
static_assert(!DefinitionAtlasSourceExtentMatches(8192, 4096, 2048, 1024));
static_assert(!DefinitionAtlasSourceExtentMatches(8191, 4096, 4095, 2048));
static_assert(!DefinitionAtlasSourceExtentMatches(8192, 4096, 8191, 4096));
static_assert(!DefinitionAtlasSourceExtentMatches(0, 4096, 0, 2048));

int main() { return 0; }
