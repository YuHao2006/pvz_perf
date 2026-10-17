#pragma once
#include <string>

namespace Sexy
{

#define MTRAND_N 624

class MTRand
{
	unsigned int mt[MTRAND_N]; /* the array for the state vector  */
	int mti;

public:
	MTRand(const std::string& theSerialData);
	MTRand(unsigned int seed);
	MTRand();

	void SRand(const std::string& theSerialData);
	void SRand(unsigned int seed);
	unsigned int NextNoAssert();
	unsigned int Next();
	unsigned int NextNoAssert(unsigned int range);
	unsigned int Next(unsigned int range);
	float NextNoAssert(float range);
	float Next( float range );
	void GetState(unsigned int* theState, int& theIndex) const;

	std::string Serialize();

	static void SetRandAllowed(bool allowed);
};

struct MTAutoDisallowRand
{
	MTAutoDisallowRand() { MTRand::SetRandAllowed(false); }
	~MTAutoDisallowRand() { MTRand::SetRandAllowed(true); }
};

}

