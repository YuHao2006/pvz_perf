#pragma once

// Whole-page 4x -> 2x derivation leaves normalized UVs and logical geometry
// unchanged. Validate only at load time; drawing needs no scale branch.
constexpr bool DefinitionAtlasSourceExtentMatches(unsigned authoredWidth,
    unsigned authoredHeight, unsigned decodedWidth, unsigned decodedHeight)
{
    if (!authoredWidth || !authoredHeight || !decodedWidth || !decodedHeight)
        return false;
    if (authoredWidth == decodedWidth && authoredHeight == decodedHeight)
        return true;
    return authoredWidth % 2 == 0 && authoredHeight % 2 == 0 &&
        decodedWidth == authoredWidth / 2 && decodedHeight == authoredHeight / 2;
}
