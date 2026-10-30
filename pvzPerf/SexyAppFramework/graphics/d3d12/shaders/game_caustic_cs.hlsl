// Native port of vulkan/shaders/game_caustic_cs.comp.
// b0, space0: 3 root DWORDs: integer lookup offsets U0/U1/V1.
// t0: 256x256 RGBA source, blue channel bytes; u0: 128x64 RGBA8 UNORM.
// No samplers. Dispatch 16, 16, 1 with numthreads(8,4,1).
cbuffer CausticConstants : register(b0, space0)
{
    uint offsetU0 : packoffset(c0.x);
    uint offsetU1 : packoffset(c0.y);
    uint offsetV1 : packoffset(c0.z);
};

Texture2D<float4> sourceImage : register(t0, space0);
RWTexture2D<float4> target : register(u0, space0);

uint BlueAt(uint index)
{
    const int2 coord = int2(int(index % 256u), int(index / 256u));
    return uint(round(sourceImage.Load(int3(coord, 0)).b * 255.0));
}

uint BilinearLookup(uint u, uint v)
{
    uint timeU = u & 0xffff0000u;
    uint timeV = v & 0xffff0000u;
    uint factorU1 = ((u - timeU) & 0x0000fffeu) + 1u;
    uint factorV1 = ((v - timeV) & 0x0000fffeu) + 1u;
    uint factorU0 = 65536u - factorU1;
    uint factorV0 = 65536u - factorV1;
    uint indexU0 = (timeU >> 16u) % 256u;
    uint indexU1 = ((timeU >> 16u) + 1u) % 256u;
    uint indexV0 = (timeV >> 16u) % 256u;
    uint indexV1 = ((timeV >> 16u) + 1u) % 256u;
    return ((((factorU0 * factorV1) / 65536u) * BlueAt(indexV1 * 256u + indexU0)) / 65536u) +
        ((((factorU1 * factorV1) / 65536u) * BlueAt(indexV1 * 256u + indexU1)) / 65536u) +
        ((((factorU0 * factorV0) / 65536u) * BlueAt(indexV0 * 256u + indexU0)) / 65536u) +
        ((((factorU1 * factorV0) / 65536u) * BlueAt(indexV0 * 256u + indexU1)) / 65536u);
}

[numthreads(8, 4, 1)]
void CSMain(uint3 id : SV_DispatchThreadID)
{
    if (id.x >= 128u || id.y >= 64u)
        return;
    uint x = id.x;
    uint y = id.y;
    uint timeV1 = (256u - y) << 17u;
    uint timeV0 = y << 17u;
    uint timeU = x << 17u;

    uint a1 = BilinearLookup(timeU + offsetU1, timeV1 + offsetV1) & 0xffu;
    uint a0 = BilinearLookup(timeU + offsetU0, timeV0) & 0xffu;
    uint a = (a0 + a1) / 2u;

    uint alpha;
    if (a >= 160u)
        alpha = 255u - 2u * (a - 160u);
    else if (a >= 128u)
        alpha = 5u * (a - 128u);
    else
        alpha = 0u;

    target[int2(id.xy)] = float4(1.0, 1.0, 1.0, float(alpha / 3u) / 255.0);
}
