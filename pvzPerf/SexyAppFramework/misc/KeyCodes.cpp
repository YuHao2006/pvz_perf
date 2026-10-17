#include "KeyCodes.h"

using namespace Sexy;

KeyCode Sexy::GetKeyCodeFromAscii(unsigned char theAscii)
{
	if (theAscii >= 'a' && theAscii <= 'z')
		theAscii -= 'a' - 'A';

	if (theAscii >= KEYCODE_ASCIIBEGIN && theAscii <= KEYCODE_ASCIIEND)
		return static_cast<KeyCode>(theAscii);

	if (theAscii >= KEYCODE_ASCIIBEGIN2 - 0x80 && theAscii <= KEYCODE_ASCIIEND2 - 0x80)
		return static_cast<KeyCode>(theAscii + 0x80);

	return KEYCODE_UNKNOWN;
}
