#define PVZ_HDR_COMPUTE_PROBE
#include "../shaders/game_hdr_ps.hlsl"
[[vk::binding(0,0)]] StructuredBuffer<float4> signals;
[[vk::binding(1,0)]] RWStructuredBuffer<float4> output;
[numthreads(1,1,1)]
void main(uint3 id : SV_DispatchThreadID) { output[id.x]=ConvertHdr(signals[id.x].rgb); }
