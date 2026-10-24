// Resident counterpart of Vulkan's mature unified triangle/packet GS.
// All arena addresses are DWORD offsets. Logical track indexes are unchanged.
#include "game.hlsl"
ByteAddressBuffer arena : register(t0, space1);
ByteAddressBuffer instances : register(t1, space1);
ByteAddressBuffer packets : register(t2, space1);
struct UnifiedVertex
{
    float4 position : SV_Position;
    float4 color : COLOR0;
    float2 uv : TEXCOORD0;
    nointerpolation uint slot : TEXCOORD1;
    nointerpolation uint samplerIndex : TEXCOORD2;
};
UnifiedVertex UnifiedVS(VertexIn input)
{
    UnifiedVertex o;
    o.position = float4(input.position, 0, 1);
    o.color = input.color; o.uv = input.uv;
    o.slot = input.slot; o.samplerIndex = input.samplerIndex;
    return o;
}
float value(uint p) { return asfloat(arena.Load(p * 4)); }
float interp(float a, float b, float t)
{
    precise float r = a + (b - a) * t; return r;
}
float fastSin(float radians)
{
    precise float t = radians * 0.15915494 + 0.5; t -= floor(t);
    precise float x = (t - 0.5) * 6.2831853;
    precise float x2 = x * x;
    precise float r = x * (0.999999707 + x2 * (-0.166665772 + x2 * (0.008332558 +
        x2 * (-0.000198125755 + x2 * (2.70405121e-06 + x2 * -2.05342445e-08)))));
    return r;
}
float fastCos(float radians)
{
    precise float a = radians + 1.57079633; return fastSin(a);
}
float4 corner(float2 p, float2 uv, float4 m, float2 translation)
{
    precise float x = m.x * p.x + m.y * p.y + translation.x;
    precise float y = m.z * p.x + m.w * p.y + translation.y;
    return float4(x, y, uv);
}
VertexOut outputVertex(float4 p, float4 color, uint slot, uint samplerIndex)
{
    VertexOut o;
    precise float2 ndc = p.xy / float2(sceneWidth, sceneHeight) * 2.0 - 1.0;
    o.position = float4(ndc.x, -ndc.y, 0, 1);
    o.color = color; o.uv = p.zw; o.slot = slot; o.samplerIndex = samplerIndex;
    return o;
}
bool insideClip(float4 p, int edge, float boundary)
{
    float c = (edge == 0 || edge == 2) ? p.x : p.y;
    return edge < 2 ? c >= boundary : c < boundary;
}
float4 intersection(float4 a, float4 b, int edge, float boundary)
{
    float av = (edge == 0 || edge == 2) ? a.x : a.y;
    float bv = (edge == 0 || edge == 2) ? b.x : b.y;
    precise float t = (boundary - av) / (bv - av);
    precise float4 r = a + (b - a) * t; return r;
}
[maxvertexcount(18)]
void UnifiedGS(triangle UnifiedVertex input[3], inout TriangleStream<VertexOut> stream)
{
    if ((input[0].samplerIndex & 0x80000000u) == 0)
    {
        for (int i = 0; i < 3; ++i)
            stream.Append(outputVertex(float4(input[i].position.xy, input[i].uv),
                input[i].color, input[0].slot, input[0].samplerIndex));
        stream.RestartStrip(); return;
    }
    uint packetOffset = (input[0].samplerIndex & 0x3fffffffu) * 32;
    uint4 packet = packets.Load4(packetOffset);
    float2 shake = asfloat(packets.Load2(packetOffset + 16));
    uint instanceOffset = packet.y * 96;
    uint4 sampleInfo = instances.Load4(instanceOffset);
    float4 timeTranslation = asfloat(instances.Load4(instanceOffset + 16));
    float4 overlayX = asfloat(instances.Load4(instanceOffset + 32));
    float4 overlayY = asfloat(instances.Load4(instanceOffset + 48));
    uint4 metadata = instances.Load4(instanceOffset + 64);
    float4 clip = asfloat(instances.Load4(instanceOffset + 80));
    uint header = metadata.x;
    uint track = arena.Load(header * 4) + packet.x * 4;
    uint keyBase = arena.Load((header + 1) * 4) + arena.Load(track * 4) * 12;
    uint a = keyBase + sampleInfo.x * 12, b = keyBase + sampleInfo.y * 12;
    float t = timeTranslation.x;
    int frame = asint(arena.Load((a + 7) * 4));
    uint image = arena.Load((a + 8) * 4);
    precise float alpha = interp(value(a + 6), value(b + 6), t);
    precise float byteAlpha = alpha * float((packet.z >> 24) & 255);
    byteAlpha = clamp(trunc(byteAlpha > 0 ? byteAlpha + 0.5 : byteAlpha - 0.5), 0, 255);
    uint geometryBase = arena.Load((header + 2) * 4);
    uint base = geometryBase + image * 8;
    uint source = geometryBase + (sampleInfo.z * metadata.y + image) * 8;
    float width = value(source), height = value(source + 1);
    if (frame < 0 || image == 0 || byteAlpha <= 0 || width <= 0 || height <= 0) return;
    if ((packet.w & 1) != 0 && frame != -1 && asint(arena.Load((b + 7) * 4)) == -1 && t > 0) return;
    float4 color = float4(float((packet.z >> 16) & 255), float((packet.z >> 8) & 255),
        float(packet.z & 255), byteAlpha) / 255.0;
    uint slot = metadata.z | (packet.w & 0x78000000u), samplerIndex = metadata.w & 3;
    precise float skewX = -(interp(value(a + 2), value(b + 2), t) * 0.017453292);
    precise float skewY = -(interp(value(a + 3), value(b + 3), t) * 0.017453292);
    precise float sx = interp(value(a + 4), value(b + 4), t);
    precise float sy = interp(value(a + 5), value(b + 5), t);
    precise float m00 = fastCos(skewX) * sx, m10 = -fastSin(skewX) * sx;
    precise float m01 = fastSin(skewY) * sy, m11 = fastCos(skewY) * sy;
    precise float tx = interp(value(a), value(b), t), ty = interp(value(a + 1), value(b + 1), t);
    precise float cx = m00 * (value(base) * 0.5) + m01 * (value(base + 1) * 0.5) + tx;
    precise float cy = m10 * (value(base) * 0.5) + m11 * (value(base + 1) * 0.5) + ty;
    precise float xx = overlayX.x * m00 + overlayX.y * m10, xy = overlayX.x * m01 + overlayX.y * m11;
    precise float yx = overlayY.x * m00 + overlayY.y * m10, yy = overlayY.x * m01 + overlayY.y * m11;
    precise float ox = overlayX.x * cx + overlayX.y * cy + overlayX.z;
    precise float oy = overlayY.x * cx + overlayY.y * cy + overlayY.z;
    precise float translateX = (shake.x + timeTranslation.y) - 0.5;
    precise float translateY = (shake.y + timeTranslation.z) - 0.5;
    if ((metadata.w & 8) != 0)
    {
        translateX = timeTranslation.y; translateY = timeTranslation.z;
    }
    ox += translateX; oy += translateY;
    float4 transform = float4(xx, xy, yx, yy);
    float2 translation = float2(ox, oy);
    float u0 = value(source + 2), v0 = value(source + 3), u1 = value(source + 4), v1 = value(source + 5);
    float4 polygon[8];
    polygon[0] = corner(float2(-width / 2, -height / 2), float2(u0, v0), transform, translation);
    polygon[1] = corner(float2(-width / 2, height / 2), float2(u0, v1), transform, translation);
    polygon[2] = corner(float2(width / 2, height / 2), float2(u1, v1), transform, translation);
    polygon[3] = corner(float2(width / 2, -height / 2), float2(u1, v0), transform, translation);
    if ((metadata.w & 4) == 0 || (packet.w & 2) != 0)
    {
        stream.Append(outputVertex(polygon[0], color, slot, samplerIndex));
        stream.Append(outputVertex(polygon[1], color, slot, samplerIndex));
        stream.Append(outputVertex(polygon[3], color, slot, samplerIndex));
        stream.Append(outputVertex(polygon[2], color, slot, samplerIndex));
        stream.RestartStrip(); return;
    }
    int count = 4;
    for (int edge = 0; edge < 4; ++edge)
    {
        if (count < 2) return;
        float4 clipped[8]; int written = 0;
        for (int i = 0; i < count; ++i)
        {
            float4 p = polygon[(i + count - 1) % count], q = polygon[i];
            bool pIn = insideClip(p, edge, clip[edge]), qIn = insideClip(q, edge, clip[edge]);
            if (pIn && qIn) clipped[written++] = q;
            else if (pIn != qIn)
            {
                clipped[written++] = intersection(p, q, edge, clip[edge]);
                if (qIn) clipped[written++] = q;
            }
        }
        count = written;
        for (int i = 0; i < count; ++i) polygon[i] = clipped[i];
    }
    for (int i = 1; i + 1 < count; ++i)
    {
        stream.Append(outputVertex(polygon[0], color, slot, samplerIndex));
        stream.Append(outputVertex(polygon[i], color, slot, samplerIndex));
        stream.Append(outputVertex(polygon[i + 1], color, slot, samplerIndex));
        stream.RestartStrip();
    }
}
