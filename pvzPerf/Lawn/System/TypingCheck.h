#pragma once
#include <initializer_list>
#include <vector>
#include "misc/KeyCodes.h"

class TypingCheck
{
protected:
	std::vector<unsigned char> mPhrase;
	std::vector<unsigned char> mRecentTyping;

public:
	TypingCheck() = default;
	TypingCheck(std::initializer_list<unsigned char> thePhrase);

	/*inline*/ void	AddKeyCode(Sexy::KeyCode theKeyCode);
	/*inline*/ bool	Check();
	bool			Check(Sexy::KeyCode theKeyCode);
};
