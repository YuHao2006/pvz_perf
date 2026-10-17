#pragma once

namespace Sexy {
// Works before the game window/renderer exists. Returns false without a usable
// desktop dialog provider; callers retain their stderr/file diagnostics.
bool ShowLinuxErrorDialog(const char* message, const char* title);
}
