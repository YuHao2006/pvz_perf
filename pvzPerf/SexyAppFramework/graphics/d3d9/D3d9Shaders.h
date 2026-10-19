#pragma once

#include <cstddef>

namespace Sexy::D3d9Shaders {

// Build these with fxc /O3 /Gis /WX; never /Gpp (partial precision).
// Do not add /Gfp: SDK 10.0.26100 emits texldl_pp in scenePS with that flag.
// Omit /Ges: strict modern HLSL rejects the DX9 sampler/tex2Dlod syntax.
// Package the resulting bytecode; Create*Shader consumes it without D3DCompile.
struct Program {
    const char* file;
    const char* entry;
    const char* profile;
    const char* bytecode;
};
inline constexpr Program Programs[] = {
    {"scene_vs.hlsl", "sceneVS", "vs_3_0", "scene_vs.cso"},
    {"image_vs.hlsl", "imageVS", "vs_3_0", "image_vs.cso"},
    {"scene_ps.hlsl", "scenePS", "ps_3_0", "scene_ps.cso"},
    {"image_ps.hlsl", "copyPS", "ps_3_0", "copy_ps.cso"},
    {"image_ps.hlsl", "colorizePS", "ps_3_0", "colorize_ps.cso"},
    {"image_ps.hlsl", "composeAlphaPS", "ps_3_0", "compose_alpha_ps.cso"},
    {"caustics_ps.hlsl", "causticsPS", "ps_3_0", "caustics_ps.cso"},
    {"font_ps.hlsl", "fontPS", "ps_3_0", "font_ps.cso"},
    {"present_ps.hlsl", "presentPS", "ps_3_0", "present_ps.cso"},
};

enum VertexConstant : unsigned {
    Projection = 0, // (2/viewportW, -2/viewportH, -1-1/viewportW, 1+1/viewportH)
};
enum PixelConstant : unsigned {
    SourceRect = 0,       // image/font/present only: (atlasX, atlasY, logicalWidth, logicalHeight)
    SourceTexture = 1,    // (1/physicalWidth, 1/physicalHeight, 0, 0)
    SourceFlags = 2,      // image/font only: (generated/premultiplied, opaque, alphaEdge, filterKind)
    Sampling = 3,         // scene uses only w=targetPremult; present uses x=linear
    Modes = 4,            // (coverageInput, fontForceWhite, composeColorOnly, tintAllLE255)
    Rectangle = 5,        // (sourceOffsetX, sourceOffsetY, outputWidth, outputHeight)
    AlphaRect = 6,        // (atlasX, atlasY, logicalOriginalWidth, logicalOriginalHeight)
    AlphaTexture = 7,     // (1/physicalWidth, 1/physicalHeight, 0, 0)
    PackedColor = 8,      // (R,G,B,A), integer bytes decoded on CPU from packed ARGB
    Cells = 9,            // (columns, rows, floor(outputWidth/columns), floor(outputHeight/rows))
    CausticOffset0 = 10,  // (uHighModulo256, uLow16, vHighModulo256, vLow16)
    CausticOffset1 = 11,  // same; see CPU recipe below
    GlyphSource = 12,     // (x,y,width,height)
    GlyphDestination = 13,// (x,y,width,height), absolute target coordinates
    XRangeTexture = 14,   // (width,height,1/width,1/height)
    YRangeTexture = 15,
    XTapTexture = 16,
    YTapTexture = 17,
    TintRed = 18,         // tint red as unsigned modulo-2^32 LE bytes, each exactly 0..255
    TintGreen = 19,
    TintBlue = 20,
    TintAlpha = 21,
    Presentation = 22,    // (flipY,0,0,0); normally 0 for top-down D3D9 storage
    PixelConstantCount = 23,
};
enum Sampler : unsigned {
    SourceImage = 0,
    AlphaImage = 1, // image operations
    XRanges = 1,   // font pass
    YRanges = 2,
    XTaps = 3,
    YTaps = 4,
};
enum class ImageOperation : unsigned { Copy, Colorize, ComposeAlpha, Caustics };
enum class ColorFilter : unsigned { None, White, WashedOut, LessWashedOut };

struct Float4 { float x, y, z, w; };
enum SceneFlag : unsigned {
    Generated = 1, Opaque = 2, AlphaEdge = 4, FilterKindUnit = 8,
    Independent = 32, Linear = 64, Repeat = 128,
};
struct Vertex {
    float x, y;       // POSITION0 FLOAT2, viewport-local pixel EDGES, top-down
    float r, g, b, a; // COLOR0 FLOAT4 (not normalized packed bytes)
    float u, v;       // TEXCOORD0 FLOAT2, logical image UV
    Float4 rect;      // TEXCOORD1 FLOAT4, (atlasX,atlasY,logicalWidth,logicalHeight)
    float flags;      // TEXCOORD2 FLOAT1, exact integer 0..255; see SceneFlag
};
static_assert(sizeof(Float4) == 16 && sizeof(Vertex) == 52);
static_assert(offsetof(Vertex, r) == 8 && offsetof(Vertex, u) == 24);
static_assert(offsetof(Vertex, rect) == 32 && offsetof(Vertex, flags) == 48);

// All constants are float4 registers set with Set*ShaderConstantF. Image/font
// flags are individual 0/1 floats; filterKind is 0..3. Scene CPU packs
// generated+2*opaque+4*edge+8*filterKind+32*independent+64*linear+128*repeat
// into Vertex.flags, never the original 32-bit word. Duplicate rect and flags
// on EVERY vertex of each triangle; scenePS rounds them floor(value+0.5).
// Scene batches share physical texture storage/blend/clip, not logical rect
// or flags. SourceTexture is physical-page inverse extent. Scene uniforms
// Sampling.w=targetPremult and Modes.x=coverage remain per batch.
// CPU validates repeat coordinates per axis, including all triangle vertices:
// abs(floor(uv*logicalExtent))+3*logicalExtent+2 <= 16777216.
// This keeps corrected integer modulo products float-exact even for negative
// UVs. Reject out-of-range UVs explicitly rather than approximating int32 modulo.
//
// Vertex shaders share Vertex and Projection. For image/font/present, submit a
// viewport-local quad (0,0)..(viewportW,viewportH), UV (0,0)..(1,1).
// imageVS consumes only position and UV; quad metadata may be zero.
// Font may use a glyph-sized viewport at glyphDst.xy; VPOS is absolute.
// Projection includes the D3D9 half-texel correction exactly once. No XYZRHW
// vertices, extra half-texel UV bias, or additional projection flip. All stored
// images use top-down logical rows, including render targets; Presentation.x=0
// consequently implements the visual result of GL's final vertical flip.
//
// Every sampler: POINT min/mag, NONE mip, CLAMP U/V, SRGBTEXTURE=FALSE.
// Shaders implement logical clamp/repeat and bilinear filtering explicitly;
// atlas padding and hardware linear sampling must not enter the calculation.
// Render states: SRGBWRITEENABLE=FALSE, no alpha test, no fog. Image/font passes
// overwrite (blend disabled). Float generated images require A32B32G32R32F RTs
// and full float32 shader arithmetic: half-float loses the font integer bound.
// Scene premult output uses ONE/INVSRCALPHA (or ONE/ONE for additive), and
// straight output uses SRCALPHA/INVSRCALPHA as appropriate to the caller.
//
// Font tables: use existing double BuildFontAxisWeights unchanged, units 257
// and 256. Upload float32 RG (G32R32F or RGBA32F) textures, ranges=(offset,count),
// taps=(SIGNED index,weight). Decode modulo-2^32 signed index on CPU BEFORE
// converting to float. Flatten each table into its own width*height rectangle;
// ranges can also span rows. All offsets/counts/indices must be float-exact
// integers (abs <= 2^24); validate CPU-side, never truncate a table.
// Validate countX<=257,countY<=256,sumX<=257,sumY<=256 per output and
// nonzero weights. The flattened loop covers 257*256 without a 256-repeat
// instruction (SM3 rep is capped at 255). Font SourceFlags.z comes from
// samplingFlags & kAlphaEdgeFilter, independently of the source slot flags.
// total<=255*257*256=16776960<2^24; /65536 and /256 floors are exact.
// Never replace this with floating filtering, reordered double CPU formulas,
// half precision, approximate reciprocals before floor, or a shorter loop.
//
// Caustic CPU recipe (uint32 wrapping BEFORE shifts/additions):
// p0 = counter << 16; p1 = ((counter & 65535u) + 1u) << 16;
// divSigned(n,d) = n's signed two's-complement value / d, truncating to zero;
// implement via int64 to avoid implementation-defined signed conversions.
// u0 = uint32(divSigned(p0,10)); u1 = 0u-uint32(divSigned(p1,6));
// v0 = 0; v1 = p0 >> 3 (UNSIGNED shift).
// For each (u,v), upload ((u>>16)&255,u&65535,(v>>16)&255,v&65535).
// GPU adds (2*x,2*y) or (2*x,-2*y) to high coordinates modulo 256.
// Odd bilinear factors are 2*floor(low16/2)+1; products use 8-bit limbs.
// Source must be a 256x256 map with byte-valued blue (0..255 after rounding).
//
// Colorize tint: upload four LE bytes of uint32(tint.channel), even for negative
// int values. Modes.w is CPU all(original signed tint channels <=255).
// Byte-limb multiplication preserves GLSL's uint32 wrap before division.
// Compose uses PackedColor's four bytes, including its alpha OR mask.
//
// SM3 support is conditional: require vs_3_0/ps_3_0, sufficient instruction and
// executed-instruction/loop caps, point sampling of float32 tables and float32
// render targets with post-pixel-shader blending. Check workload execution
// budgets against MaxPShaderInstructionsExecuted; a large shrinking font
// kernel can exceed this even though its static shader is below 512 slots.
// Reject unsupported devices/workloads explicitly. fxc success alone does not
// establish pixel equivalence; backend readback tests do that.

}
