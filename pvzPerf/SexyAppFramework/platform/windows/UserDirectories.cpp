#include "SexyAppFramework/platform/UserDirectories.h"
#include <windows.h>
#include <ShlObj.h>

namespace Sexy {
std::optional<std::string> ResolveDesktopDirectory() {
    char path[MAX_PATH]{};
    if (FAILED(SHGetFolderPathA(nullptr, CSIDL_DESKTOP, nullptr,
        SHGFP_TYPE_CURRENT, path)))
        return std::nullopt;
    return std::string(path);
}
}
