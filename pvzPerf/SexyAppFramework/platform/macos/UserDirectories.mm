#include "SexyAppFramework/platform/UserDirectories.h"
#import <Foundation/Foundation.h>

namespace Sexy {
std::optional<std::string> ResolveDesktopDirectory()
{
    @autoreleasepool {
        NSURL* desktop = [NSFileManager.defaultManager URLsForDirectory:NSDesktopDirectory
            inDomains:NSUserDomainMask].firstObject;
        if (!desktop || !desktop.fileURL) return std::nullopt;
        const char* path = desktop.fileSystemRepresentation;
        if (!path) return std::nullopt;
        return std::string(path);
    }
}
}
