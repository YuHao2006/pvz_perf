#pragma once
#include "../ErrorDialog.h"
#include <string>

namespace Sexy {
// AppKit operations require the main thread. A non-null input replaces the
// general pasteboard's string; null reads it. Strings use UTF-8.
std::string MacClipboard(const std::string* input);
// Canonical absolute directory containing the actual executable, including
// command-line executables that are not packaged as an .app bundle.
std::string MacExecutableDirectory();
bool MacDebuggerPresent();
}
