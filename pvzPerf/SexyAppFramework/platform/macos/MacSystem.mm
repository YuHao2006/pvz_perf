#include "MacSystem.h"
#import <AppKit/AppKit.h>
#include <mach-o/dyld.h>
#include <sys/types.h>
#include <sys/sysctl.h>
#include <sys/proc.h>
#include <unistd.h>
#include <cstdlib>
#include <cstdint>
#include <filesystem>
#include <stdexcept>
#include <vector>

#if !__has_feature(objc_arc)
#error Compile the Cocoa platform sources with -fobjc-arc
#endif

namespace Sexy {
std::string MacClipboard(const std::string* input)
{
    if (![NSThread isMainThread])
        throw std::logic_error("Cocoa clipboard access requires the main thread");
    @autoreleasepool {
        NSPasteboard* pasteboard = NSPasteboard.generalPasteboard;
        if (input) {
            NSString* text = [[NSString alloc] initWithBytes:input->data() length:input->size()
                encoding:NSUTF8StringEncoding];
            if (!text) throw std::invalid_argument("Cocoa clipboard text must be UTF-8");
            [pasteboard clearContents];
            if (![pasteboard setString:text forType:NSPasteboardTypeString])
                throw std::runtime_error("Cannot write the Cocoa clipboard");
            return {};
        }
        NSString* text = [pasteboard stringForType:NSPasteboardTypeString];
        if (!text) return {};
        NSData* data = [text dataUsingEncoding:NSUTF8StringEncoding];
        if (!data) throw std::runtime_error("Cannot encode Cocoa clipboard text");
        if (!data.length) return {};
        return std::string(static_cast<const char*>(data.bytes), data.length);
    }
}

bool ShowNativeErrorDialog(const char* message, const char* title)
{
    if (![NSThread isMainThread]) return false;
    if (std::getenv("PVZ_MODERN_HIDDEN")) return false;
    @autoreleasepool {
        @try {
            [NSApplication sharedApplication];
            NSString* heading = [NSString stringWithUTF8String:title ? title : "pvz_perf"];
            NSString* detail = [NSString stringWithUTF8String:message ? message : ""];
            if (!heading || !detail) return false;
            NSAlert* alert = [NSAlert new];
            alert.alertStyle = NSAlertStyleCritical;
            alert.messageText = heading;
            alert.informativeText = detail;
            [alert addButtonWithTitle:@"OK"];
            [alert runModal];
            return true;
        } @catch (NSException* exception) {
            (void)exception;
            return false;
        }
    }
}

std::string MacExecutableDirectory()
{
    std::uint32_t size = 0;
    _NSGetExecutablePath(nullptr, &size);
    if (!size) throw std::runtime_error("Cannot measure the macOS executable path");
    std::vector<char> path(size);
    if (_NSGetExecutablePath(path.data(), &size) != 0)
        throw std::runtime_error("Cannot read the macOS executable path");
    std::error_code error;
    const auto executable = std::filesystem::canonical(path.data(), error);
    if (error) throw std::runtime_error("Cannot resolve the macOS executable path: " + error.message());
    return executable.parent_path().string();
}

bool MacDebuggerPresent()
{
    int query[] = {CTL_KERN, KERN_PROC, KERN_PROC_PID, static_cast<int>(getpid())};
    kinfo_proc process{};
    std::size_t size = sizeof(process);
    if (sysctl(query, 4, &process, &size, nullptr, 0) != 0 || size != sizeof(process))
        return false;
    return (process.kp_proc.p_flag & P_TRACED) != 0;
}
}
