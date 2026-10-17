#include "LevelSaveConverter.h"

#include <exception>
#include <algorithm>
#include <cctype>
#include <filesystem>
#include <iostream>
#include <string>
#include <vector>

#ifdef _WIN32
#define NOMINMAX
#define WIN32_LEAN_AND_MEAN
#include <Windows.h>
#endif

namespace
{
void PrintErrorRed(const std::string& theMessage)
{
#ifdef _WIN32
    HANDLE aConsole = GetStdHandle(STD_ERROR_HANDLE);
    CONSOLE_SCREEN_BUFFER_INFO anInfo{};
    const bool isConsole =
        aConsole != INVALID_HANDLE_VALUE &&
        GetConsoleScreenBufferInfo(aConsole, &anInfo) != FALSE;
    if (isConsole)
    {
        SetConsoleTextAttribute(
            aConsole,
            FOREGROUND_RED | FOREGROUND_INTENSITY);
    }
#endif

    std::cerr << "错误：" << theMessage << '\n';

#ifdef _WIN32
    if (isConsole)
    {
        SetConsoleTextAttribute(aConsole, anInfo.wAttributes);
    }
#endif
}

void PrintUsage(const std::filesystem::path& theProgram)
{
    std::cout
        << "PvZ 1.2.0.1073 存档双向转换器（关卡档 game*.dat + 玩家明细档 user*.dat）\n\n"
        << "用法：\n  " << theProgram.filename().string()
        << "\n  " << theProgram.filename().string()
        << " <输入 game*.dat|game*.dat64|user*.dat|user*.dat64> [输出文件]\n\n"
        << "无参数：扫描转换器所在目录。若存在任何 .dat（game数字_数字.dat 或"
           " user数字.dat），全部转为 dat64；否则把全部 .dat64 转回 .dat。"
           "每份成功后删除源文件，失败的源文件保留。\n\n"
        << "关卡档文件名里的模式数字随格式换算（dat 是 v1 枚举值，dat64 是 v3"
           " 枚举值；模式值只存在于文件名，存档体内没有）。\n"
        << "省略输出文件时自动生成对应名称；转换器会完整验证输入和生成结果，"
           "失败时不会写出目标文件。\n";
}

std::filesystem::path GetExecutableDirectory(const char* theArgv0)
{
#ifdef _WIN32
    std::wstring aPath(32768, L'\0');
    const DWORD aLength = GetModuleFileNameW(
        nullptr,
        aPath.data(),
        static_cast<DWORD>(aPath.size()));
    if (aLength > 0 && aLength < aPath.size())
    {
        aPath.resize(aLength);
        return std::filesystem::path(aPath).parent_path();
    }
#endif
    return std::filesystem::absolute(
        theArgv0 ? std::filesystem::u8path(theArgv0) : std::filesystem::path("."))
        .parent_path();
}

bool IsNamedLevelSave(
    const std::filesystem::path& thePath,
    const std::string& theExtension)
{
    std::string aName = thePath.filename().string();
    std::transform(aName.begin(), aName.end(), aName.begin(),
        [](unsigned char c) { return static_cast<char>(std::tolower(c)); });
    if (!aName.starts_with("game") || !aName.ends_with(theExtension))
    {
        return false;
    }
    const std::size_t aBodyEnd = aName.size() - theExtension.size();
    const std::string aBody = aName.substr(4, aBodyEnd - 4);
    const std::size_t anUnderscore = aBody.find('_');
    if (anUnderscore == std::string::npos || anUnderscore == 0 ||
        anUnderscore + 1 == aBody.size() ||
        aBody.find('_', anUnderscore + 1) != std::string::npos)
    {
        return false;
    }
    return std::all_of(aBody.begin(), aBody.begin() + anUnderscore,
               [](unsigned char c) { return std::isdigit(c) != 0; }) &&
        std::all_of(aBody.begin() + anUnderscore + 1, aBody.end(),
               [](unsigned char c) { return std::isdigit(c) != 0; });
}

// user<数字>.dat / user<数字>.dat64（users.dat 汇总表没有数字后缀，天然不匹配）。
bool IsNamedUserSave(
    const std::filesystem::path& thePath,
    const std::string& theExtension)
{
    std::string aName = thePath.filename().string();
    std::transform(aName.begin(), aName.end(), aName.begin(),
        [](unsigned char c) { return static_cast<char>(std::tolower(c)); });
    if (!aName.starts_with("user") || !aName.ends_with(theExtension))
    {
        return false;
    }
    const std::size_t aBodyEnd = aName.size() - theExtension.size();
    const std::string aBody = aName.substr(4, aBodyEnd - 4);
    return !aBody.empty() && std::all_of(aBody.begin(), aBody.end(),
        [](unsigned char c) { return std::isdigit(c) != 0; });
}

int RunDirectoryBatch(const std::filesystem::path& theDirectory)
{
    std::vector<std::filesystem::path> aDatFiles;
    std::vector<std::filesystem::path> aDat64Files;
    for (const auto& anEntry : std::filesystem::directory_iterator(theDirectory))
    {
        if (!anEntry.is_regular_file())
        {
            continue;
        }
        if (IsNamedLevelSave(anEntry.path(), ".dat") ||
            IsNamedUserSave(anEntry.path(), ".dat"))
        {
            aDatFiles.push_back(anEntry.path());
        }
        else if (IsNamedLevelSave(anEntry.path(), ".dat64") ||
            IsNamedUserSave(anEntry.path(), ".dat64"))
        {
            aDat64Files.push_back(anEntry.path());
        }
    }

    const bool isForward = !aDatFiles.empty();
    std::vector<std::filesystem::path>& aSources = isForward ? aDatFiles : aDat64Files;
    std::sort(aSources.begin(), aSources.end());
    if (aSources.empty())
    {
        std::cout << "目录中没有 game数字_数字/user数字 的 .dat 或 .dat64：\n  "
                  << theDirectory.string() << '\n';
        return 0;
    }

    std::cout << "批量方向：" << (isForward ? ".dat -> .dat64" : ".dat64 -> .dat")
              << "\n目录：" << theDirectory.string()
              << "\n文件数：" << aSources.size() << "\n\n";
    std::size_t aSuccessCount = 0;
    std::size_t aFailureCount = 0;
    for (const std::filesystem::path& aSource : aSources)
    {
        try
        {
            const std::string aName = aSource.filename().string();
            const bool isUser = aName.starts_with("user") || aName.starts_with("USER");
            std::filesystem::path aTarget;
            if (isUser)
            {
                const PvzDat64::UserFormat aFormat = isForward
                    ? PvzDat64::UserFormat::LegacyUserDat
                    : PvzDat64::UserFormat::UserDat64;
                aTarget = PvzDat64::DefaultUserOutputPath(aSource, aFormat);
            }
            else
            {
                const PvzDat64::Format aFormat = isForward
                    ? PvzDat64::Format::Legacy1073Dat
                    : PvzDat64::Format::Dat64V1;
                aTarget = PvzDat64::DefaultOutputPath(aSource, aFormat);
            }
            if (isUser)
            {
                const PvzDat64::UserConversionResult aResult =
                    PvzDat64::ConvertUserFile(aSource, aTarget);
                std::cout << "成功（明细档）：" << aSource.filename().string()
                          << " -> " << aResult.mTargetPath.filename().string();
            }
            else
            {
                const PvzDat64::ConversionResult aResult =
                    PvzDat64::ConvertFile(aSource, aTarget);
                std::cout << "成功：" << aSource.filename().string()
                          << " -> " << aResult.mTargetPath.filename().string();
            }

            std::error_code anError;
            const bool wasRemoved = std::filesystem::remove(aSource, anError);
            if (!wasRemoved || anError)
            {
                throw std::runtime_error(
                    "目标已验证写出，但无法删除源文件 " + aSource.string() +
                    "：" + anError.message());
            }
            ++aSuccessCount;
            std::cout << "（源文件已删除）\n";
        }
        catch (const std::exception& anError)
        {
            ++aFailureCount;
            PrintErrorRed(aSource.filename().string() + "：" + anError.what() +
                "；源文件未删除");
        }
    }

    std::cout << "\n批量完成：成功 " << aSuccessCount
              << "，失败 " << aFailureCount << "。\n";
    return aFailureCount == 0 ? 0 : 1;
}
}

int main(int argc, char** argv)
{
    try
    {
        if (argc == 1)
        {
            return RunDirectoryBatch(GetExecutableDirectory(argc > 0 ? argv[0] : nullptr));
        }
        if (argc > 3)
        {
            PrintUsage(argc > 0 ? std::filesystem::path(argv[0]) : "pvz_dat64_converter");
            return 2;
        }

        const std::filesystem::path anInput =
            std::filesystem::absolute(std::filesystem::u8path(argv[1]));
        // 先按内容识别关卡档（magic/全量解析）；不是关卡档再按 user 档识别。
        // 文件名只决定默认输出名，格式判定一律以内容为准。两条链的失败都
        // 保留在报告里：user 兜底不能吞掉关卡档的真实错误。
        bool isUserSave = true;
        std::string aLevelError;
        try
        {
            PvzDat64::DetectFormat(anInput);
            isUserSave = false;
        }
        catch (const std::exception& aLevelFailure)
        {
            aLevelError = aLevelFailure.what();
            try
            {
                PvzDat64::DetectUserFormat(anInput);
            }
            catch (const std::exception& aUserFailure)
            {
                throw std::runtime_error(
                    "不是可识别的存档——按关卡档解析：" + aLevelError +
                    "；按玩家明细档解析：" + aUserFailure.what());
            }
        }

        if (isUserSave)
        {
            const PvzDat64::UserFormat anInputFormat =
                PvzDat64::DetectUserFormat(anInput);
            const std::filesystem::path anOutput = argc == 3
                ? std::filesystem::absolute(std::filesystem::u8path(argv[2]))
                : PvzDat64::DefaultUserOutputPath(anInput, anInputFormat);
            const PvzDat64::UserConversionResult aResult =
                PvzDat64::ConvertUserFile(anInput, anOutput);
            std::cout
                << "验证与转换完成：\n  "
                << aResult.mSourcePath.string() << "\n  "
                << PvzDat64::UserFormatName(aResult.mSourceFormat) << " ("
                << aResult.mSourceSize << " 字节)\n    ->\n  "
                << aResult.mTargetPath.string() << "\n  "
                << PvzDat64::UserFormatName(aResult.mTargetFormat) << " ("
                << aResult.mTargetSize << " 字节)\n";
            return 0;
        }

        const PvzDat64::Format anInputFormat = PvzDat64::DetectFormat(anInput);
        const std::filesystem::path anOutput = argc == 3
            ? std::filesystem::absolute(std::filesystem::u8path(argv[2]))
            : PvzDat64::DefaultOutputPath(anInput, anInputFormat);

        const PvzDat64::ConversionResult aResult =
            PvzDat64::ConvertFile(anInput, anOutput);
        std::cout
            << "验证与转换完成：\n  "
            << aResult.mSourcePath.string() << "\n  "
            << PvzDat64::FormatName(aResult.mSourceFormat) << " ("
            << aResult.mSourceSize << " 字节)\n    ->\n  "
            << aResult.mTargetPath.string() << "\n  "
            << PvzDat64::FormatName(aResult.mTargetFormat) << " ("
            << aResult.mTargetSize << " 字节)\n";
        return 0;
    }
    catch (const std::exception& anError)
    {
        PrintErrorRed(anError.what());
        return 1;
    }
}
