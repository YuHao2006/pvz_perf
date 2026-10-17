#pragma once
#include <algorithm>
#include <cstdint>

namespace Sexy::SWTriAdditive
{

inline std::uint32_t ScaleChannel(std::uint32_t theChannel, std::uint32_t theAlpha, bool thePremultiplied)
{
	return thePremultiplied ? theChannel : (theChannel * theAlpha) >> 8;
}

inline std::uint32_t Blend888(
	std::uint32_t theDestination,
	std::uint32_t theSource,
	std::uint32_t theAlpha,
	bool thePremultiplied)
{
	const std::uint32_t aRed = std::min(
		255U,
		((theDestination >> 16) & 0xFFU) +
			ScaleChannel((theSource >> 16) & 0xFFU, theAlpha, thePremultiplied));
	const std::uint32_t aGreen = std::min(
		255U,
		((theDestination >> 8) & 0xFFU) +
			ScaleChannel((theSource >> 8) & 0xFFU, theAlpha, thePremultiplied));
	const std::uint32_t aBlue = std::min(
		255U,
		(theDestination & 0xFFU) + ScaleChannel(theSource & 0xFFU, theAlpha, thePremultiplied));

	return 0xFF000000U | (aRed << 16) | (aGreen << 8) | aBlue;
}

inline std::uint16_t Blend565(
	std::uint16_t theDestination,
	std::uint32_t theSource,
	std::uint32_t theAlpha,
	bool thePremultiplied)
{
	const std::uint32_t aSourceRed =
		ScaleChannel((theSource >> 16) & 0xFFU, theAlpha, thePremultiplied) >> 3;
	const std::uint32_t aSourceGreen =
		ScaleChannel((theSource >> 8) & 0xFFU, theAlpha, thePremultiplied) >> 2;
	const std::uint32_t aSourceBlue =
		ScaleChannel(theSource & 0xFFU, theAlpha, thePremultiplied) >> 3;

	const std::uint32_t aRed = std::min(31U, ((theDestination >> 11) & 0x1FU) + aSourceRed);
	const std::uint32_t aGreen = std::min(63U, ((theDestination >> 5) & 0x3FU) + aSourceGreen);
	const std::uint32_t aBlue = std::min(31U, (theDestination & 0x1FU) + aSourceBlue);

	return static_cast<std::uint16_t>((aRed << 11) | (aGreen << 5) | aBlue);
}

}

