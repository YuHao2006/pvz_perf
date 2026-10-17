#include "TypingCheck.h"
using namespace Sexy;

//0x51C470
TypingCheck::TypingCheck(std::initializer_list<unsigned char> thePhrase) :
	mPhrase(thePhrase)
{
	mRecentTyping.reserve(mPhrase.size() + 1);
}

void TypingCheck::AddKeyCode(Sexy::KeyCode theKeyCode)
{
	mPhrase.push_back(static_cast<unsigned char>(theKeyCode));
}

bool TypingCheck::Check()
{
	if (mRecentTyping == mPhrase)
	{
		mRecentTyping.clear();
		return true;
	}
	return false;
}

//0x51C5A0
bool TypingCheck::Check(Sexy::KeyCode theKeyCode)
{
	mRecentTyping.push_back(static_cast<unsigned char>(theKeyCode));
	size_t aLength = mPhrase.size();
	if (aLength == 0)
		return false;

	if (mRecentTyping.size() > aLength)
		mRecentTyping.erase(mRecentTyping.begin());
	
	return Check();
}
