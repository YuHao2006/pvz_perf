#pragma once
#include "Common.h"
#include "GpuBackend.h"
#include "Color.h"
#include "TriVertex.h"
#include "misc/Rect.h"
#include <array>
#include <cstdint>
#include <span>

namespace Sexy
{
class SexyMatrix3;

// Borrowed draw data only. Copying this value never transfers GPU ownership.
struct TextureSource
{
	GpuTexture* mTexture = nullptr;
	int mWidth = 0;
	int mHeight = 0;
	std::uint32_t mSamplingFlags = 0;

	void Blt(float x, float y, const Rect& source, const Color& color) const;
	void BltTransformed(const SexyMatrix3& transform, const Rect& source, const Color& color,
		const Rect* clip = nullptr, float x = 0, float y = 0, bool center = false) const;
	void BltTriangles(const TriVertex vertices[][3], int count, DWORD color,
		float tx = 0, float ty = 0) const;
	void BltTriangles(std::span<const std::array<TriVertex,3>> triangles, DWORD color,
		float tx = 0, float ty = 0) const;
};
}
