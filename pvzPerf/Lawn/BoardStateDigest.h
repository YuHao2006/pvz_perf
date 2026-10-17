#pragma once
#include <cstdint>

class Board;

namespace pvz
{
namespace legacy
{

std::uint64_t ComputeBoardStateDigest(const Board& theBoard);

}
}

