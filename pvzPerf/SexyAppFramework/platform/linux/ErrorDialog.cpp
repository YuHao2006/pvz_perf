#include "../ErrorDialog.h"
#include <cerrno>
#include <cstdio>
#include <cstdlib>
#include <spawn.h>
#include <string>
#include <sys/wait.h>
#include <vector>

extern char** environ;

namespace Sexy {
namespace {
bool RunDialog(std::vector<std::string> arguments)
{
    std::vector<char*> argv;
    for (auto& argument : arguments)
        argv.push_back(argument.data());
    argv.push_back(nullptr);
    pid_t child;
    if (posix_spawnp(&child, argv.front(), nullptr, nullptr, argv.data(), environ) != 0)
        return false;
    int status = 0;
    pid_t result;
    do {
        result = waitpid(child, &status, 0);
    } while (result < 0 && errno == EINTR);
    // Both providers use 1 for a user dismissal/cancel; do not open a second
    // dialog just because the first was closed with Escape or the titlebar.
    return result == child && WIFEXITED(status) &&
        (WEXITSTATUS(status) == 0 || WEXITSTATUS(status) == 1);
}

std::string QtPlainText(const char* message)
{
    std::string result = "<qt>";
    for (const char* p = message; *p; ++p) {
        switch (*p) {
        case '&': result += "&amp;"; break;
        case '<': result += "&lt;"; break;
        case '>': result += "&gt;"; break;
        case '\n': result += "<br/>"; break;
        default: result += *p; break;
        }
    }
    return result + "</qt>";
}
}

bool ShowNativeErrorDialog(const char* message, const char* title)
{
#if PVZ_ENABLE_GAME_PROBES
    if (std::getenv("PVZ_MODERN_HIDDEN"))
        return false;
#endif
    const char* display = std::getenv("DISPLAY");
    const char* wayland = std::getenv("WAYLAND_DISPLAY");
    if ((!display || !*display) && (!wayland || !*wayland))
        return false;
    // Pass literal arguments, never shell commands. Shader diagnostics and file
    // names can contain quotes, markup and shell metacharacters.
    if (RunDialog({"zenity", "--error", "--no-markup", "--width=640",
                   std::string("--title=") + title, std::string("--text=") + message}))
        return true;
    if (RunDialog({"kdialog", "--title", title, "--error", QtPlainText(message)}))
        return true;
    std::fprintf(stderr, "pvz_perf: Cannot display the error dialog; install zenity or kdialog.\n");
    return false;
}
}
