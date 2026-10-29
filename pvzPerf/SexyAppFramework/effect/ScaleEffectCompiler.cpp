#include "ScaleEffectCompiler.h"
#include "ScaleEffectFormats.h"
namespace Sexy {
bool IsScaleEffectFormat(unsigned int format)
{
    static constexpr unsigned int formats[]{
        109, 97, 91, 92, 103, 64, 122, 37, 38, 83,
        77, 78, 100, 16, 17, 76, 70, 71, 9, 10
    };
    for (const auto candidate : formats)
        if (candidate == format) return true;
    return false;
}
}

#if defined(SEXY_SCALE_EFFECT_AUTHORING)

#ifdef _WIN32
#define NOMINMAX
#include <windows.h> // DXC ABI only, not a graphics API
#endif
#include <dxcapi.h>
#include <filesystem>
#include <algorithm>
#include <stdexcept>

#include <cctype>
#include <cmath>
#include <cstring>
#include <cstdio>
#include <fstream>
#include <iomanip>
#include <limits>
#include <locale>
#include <set>
#include <sstream>



namespace Sexy
{


namespace
{

std::string Trim(const std::string& theText)
{
	size_t aStart = theText.find_first_not_of(" \t\r\n");
	if (aStart == std::string::npos)
		return "";
	size_t anEnd = theText.find_last_not_of(" \t\r\n");
	return theText.substr(aStart, anEnd - aStart + 1);
}

std::string Lower(const std::string& theText)
{
	std::string aResult = theText;
	for (size_t i = 0; i < aResult.size(); i++)
		aResult[i] = (char)tolower((unsigned char)aResult[i]);
	return aResult;
}

std::string MakeHlslFloatLiteral(float theValue)
{
	std::ostringstream aStream;
	aStream.imbue(std::locale::classic());
	aStream << std::setprecision((std::numeric_limits<float>::max_digits10)) << theValue;
	std::string aResult = aStream.str();
	if (aResult.find_first_of(".eE") == std::string::npos)
		aResult += ".0";
	aResult += "f";
	return aResult;
}

bool ParseIntList(const std::string& theText, std::vector<int>& outValues)
{
	std::string aText = theText;
	size_t aPos = 0;
	while (aPos <= aText.size())
	{
		size_t aComma = aText.find_first_of("xX,", aPos);
		std::string aPart = Trim(aText.substr(aPos, aComma == std::string::npos ? std::string::npos : aComma - aPos));
		if (aPart.empty())
			return false;
		char* anEnd = nullptr;
		long aValue = strtol(aPart.c_str(), &anEnd, 10);
		if (anEnd == aPart.c_str() || aValue <= 0)
			return false;
		outValues.push_back((int)aValue);
		if (aComma == std::string::npos)
			break;
		aPos = aComma + 1;
	}
	return !outValues.empty();
}

// Removes // and /* */ comments while preserving //! metadata lines.
std::string StripComments(const std::string& source)
{
    enum class State { Code, Block, Line, String };
    State state = State::Code;
    char quote = 0;
    std::string result;
    result.reserve(source.size());
    for (size_t i = 0; i < source.size(); ++i) {
        const char c = source[i], next = i + 1 < source.size() ? source[i + 1] : '\0';
        if (state == State::Block) {
            if (c == '*' && next == '/') { result += "  "; ++i; state = State::Code; }
            else result += (c == '\n' || c == '\r') ? c : ' ';
        } else if (state == State::Line) {
            if (c == '\n') { state = State::Code; result += c; }
            else result += c == '\r' ? c : ' ';
        } else if (state == State::String) {
            result += c;
            if (c == '\\' && next) result += source[++i];
            else if (c == quote) state = State::Code;
        } else if (c == '/' && next == '*') {
            result += "  "; ++i; state = State::Block;
        } else if (c == '/' && next == '/') {
            if (i + 2 < source.size() && source[i + 2] == '!') {
                // Keep the entire metadata comment, including quoted labels.
                while (i < source.size() && source[i] != '\n') result += source[i++];
                if (i < source.size()) result += '\n';
            } else { result += "  "; ++i; state = State::Line; }
        } else {
            result += c;
            if (c == '"' || c == '\'') { quote = c; state = State::String; }
        }
    }
    return result;
}

std::string GetOption(const std::string& theLine, const char* theKey)
{
	std::string aTrimmed = Trim(theLine);
	std::string aKey = Lower(theKey);
	if (aTrimmed.size() > 3 && aTrimmed.compare(0, 3, "//!") == 0)
		aTrimmed = Trim(aTrimmed.substr(3));
	if (Lower(aTrimmed).compare(0, aKey.size(), aKey) != 0)
		return "";
	return Trim(aTrimmed.substr(aKey.size()));
}

bool IsBlockStart(const std::string& theLine, std::string& outKeyword)
{
	std::string aTrimmed = Trim(theLine);
	if (aTrimmed.size() <= 3 || aTrimmed.compare(0, 3, "//!") != 0)
		return false;
	std::string aBody = Trim(aTrimmed.substr(3));
	static const char* kKeywords[] = { "PARAMETER", "TEXTURE", "SAMPLER", "COMMON", "PASS" };
	for (const char* aKeyword : kKeywords)
	{
		if (Lower(aBody).compare(0, strlen(aKeyword), Lower(aKeyword)) == 0)
		{
			outKeyword = Lower(aKeyword);
			return true;
		}
	}
	return false;
}

} // namespace

namespace {
template<class T> struct DxcPtr {
    T* ptr = nullptr;
    ~DxcPtr() { if (ptr) ptr->Release(); }
    DxcPtr() = default;
    DxcPtr(const DxcPtr&) = delete;
    DxcPtr& operator=(const DxcPtr&) = delete;
};
void CheckDxc(HRESULT result, const char* operation) {
    if (FAILED(result))
        throw std::runtime_error(std::string(operation) + " failed: " + std::to_string(result));
}
}

struct ScaleEffectCompiler::Impl {
    DxcPtr<IDxcUtils> utils;
    DxcPtr<IDxcCompiler3> compiler;
    DxcPtr<IDxcIncludeHandler> includes;
    Impl() {
        CheckDxc(DxcCreateInstance(CLSID_DxcUtils, IID_PPV_ARGS(&utils.ptr)), "Create DXC utils");
        CheckDxc(DxcCreateInstance(CLSID_DxcCompiler, IID_PPV_ARGS(&compiler.ptr)), "Create DXC compiler");
        CheckDxc(utils.ptr->CreateDefaultIncludeHandler(&includes.ptr), "Create DXC include handler");
    }
    bool CompileD3d12(const std::string& source, const std::string& sourcePath,
                     std::vector<uint8_t>& dxil, std::string& error) {
        dxil.clear();
        const auto path = std::filesystem::absolute(std::filesystem::path(std::u8string(sourcePath.begin(), sourcePath.end())));
        const auto name = path.wstring(), directory = path.parent_path().wstring();
        const wchar_t* args[] = {name.c_str(), L"-E", L"__M", L"-T", L"cs_6_0",
            L"-HV", L"2018", L"-O3", L"-Ges", L"-I", directory.c_str()};
        DxcBuffer input{source.data(), source.size(), DXC_CP_UTF8};
        DxcPtr<IDxcResult> result;
        const auto status = compiler.ptr->Compile(&input, args, static_cast<UINT32>(std::size(args)),
                                             includes.ptr, IID_PPV_ARGS(&result.ptr));
        if (FAILED(status)) {
            error = "DXC DXIL invocation failed: " + std::to_string(status);
            return false;
        }
        HRESULT compiled = E_FAIL;
        CheckDxc(result.ptr->GetStatus(&compiled), "DXC DXIL compile status");
        DxcPtr<IDxcBlobUtf8> diagnostics;
        CheckDxc(result.ptr->GetOutput(DXC_OUT_ERRORS, IID_PPV_ARGS(&diagnostics.ptr), nullptr),
                 "DXC DXIL diagnostics");
        if (FAILED(compiled)) {
            error = "HLSL -> DXIL failed (" + std::to_string(compiled) + "): ";
            if (diagnostics.ptr) error.append(diagnostics.ptr->GetStringPointer(), diagnostics.ptr->GetStringLength());
            return false;
        }
        DxcPtr<IDxcBlob> object;
        CheckDxc(result.ptr->GetOutput(DXC_OUT_OBJECT, IID_PPV_ARGS(&object.ptr), nullptr), "DXC DXIL output");
        if (!object.ptr || object.ptr->GetBufferSize() < 32 ||
            std::memcmp(object.ptr->GetBufferPointer(), "DXBC", 4) != 0) {
            error = "DXC did not return a complete DXIL container";
            return false;
        }
        const auto* bytes = static_cast<const uint8_t*>(object.ptr->GetBufferPointer());
        dxil.assign(bytes, bytes + object.ptr->GetBufferSize());
        error.clear();
        return true;
    }
    bool Compile(const std::string& source, const std::string& sourcePath,
                 std::vector<uint32_t>& spirv, std::string& error) {
        const auto path = std::filesystem::absolute(std::filesystem::path(std::u8string(sourcePath.begin(), sourcePath.end())));
        const auto name = path.wstring(), directory = path.parent_path().wstring();
        const wchar_t* args[] = {name.c_str(), L"-E", L"__M", L"-T", L"cs_6_0",
            L"-spirv", L"-fspv-target-env=vulkan1.2", L"-HV", L"2018",
            L"-O3", L"-Ges", L"-I", directory.c_str()};
        DxcBuffer input{source.data(), source.size(), DXC_CP_UTF8};
        DxcPtr<IDxcResult> result;
        const auto status = compiler.ptr->Compile(&input, args, static_cast<UINT32>(std::size(args)),
                                             includes.ptr, IID_PPV_ARGS(&result.ptr));
        if (FAILED(status)) {
            error = "DXC invocation failed: " + std::to_string(status);
            return false;
        }
        HRESULT compiled = E_FAIL;
        CheckDxc(result.ptr->GetStatus(&compiled), "DXC compile status");
        DxcPtr<IDxcBlobUtf8> diagnostics;
        CheckDxc(result.ptr->GetOutput(DXC_OUT_ERRORS, IID_PPV_ARGS(&diagnostics.ptr), nullptr),
                 "DXC diagnostics");
        if (FAILED(compiled)) {
            error = "HLSL -> SPIR-V failed: ";
            if (diagnostics.ptr) error.append(diagnostics.ptr->GetStringPointer(), diagnostics.ptr->GetStringLength());
            return false;
        }
        DxcPtr<IDxcBlob> object;
        CheckDxc(result.ptr->GetOutput(DXC_OUT_OBJECT, IID_PPV_ARGS(&object.ptr), nullptr), "DXC SPIR-V output");
        if (!object.ptr || object.ptr->GetBufferSize() < 20 || object.ptr->GetBufferSize() % 4) {
            error = "DXC did not return a complete SPIR-V module";
            return false;
        }
        spirv.resize(object.ptr->GetBufferSize() / 4);
        std::memcpy(spirv.data(), object.ptr->GetBufferPointer(), object.ptr->GetBufferSize());
        if (spirv.front() != 0x07230203u) {
            error = "Compiler returned non-SPIR-V data";
            spirv.clear();
            return false;
        }
        return true;
    }
};
ScaleEffectCompiler::ScaleEffectCompiler() = default;
ScaleEffectCompiler::~ScaleEffectCompiler() = default;

bool ScaleEffectCompiler::CompileEffect(const std::string& thePath, ScaleEffectDesc& outDesc)

{
	return CompileEffect(thePath, ScaleEffectParams(), outDesc);
}

bool ScaleEffectCompiler::CompileEffect(
	const std::string& thePath,
	const ScaleEffectParams& theInlineParams,
	ScaleEffectDesc& outDesc)
{
	outDesc = ScaleEffectDesc();
	outDesc.mName = thePath;
	outDesc.mSourcePath = thePath;
	if (outDesc.mName.size() > 5 &&
		Lower(outDesc.mName.substr(outDesc.mName.size() - 5)) == ".hlsl")
		outDesc.mName.erase(outDesc.mName.size() - 5);
	// Strip a leading "effects/" prefix from the display name.
	if (Lower(outDesc.mName).compare(0, 8, "effects/") == 0)
		outDesc.mName.erase(0, 8);

	if (!ParseEffect(thePath, outDesc))
		return false;
	if (!ResolveInlineParams(outDesc, theInlineParams, outDesc.mInlineParams, outDesc.mError))
		return false;
	outDesc.mInlineParamsEnabled = true;
	return GenerateAndCompilePasses(outDesc);
}

bool ScaleEffectCompiler::CompileFile(const std::string& path, const ScaleEffectParams& params,
    ScaleEffectRuntimeDesc& out, std::string& error)
{
    out = {};
    error.clear();
    try {
        ScaleEffectDesc authored;
        if (!CompileEffect(path, params, authored)) {
            error = path + ": " + authored.mError;
            return false;
        }
        if (!CompileRuntimeMetadata(authored, out, error)) {
            error = path + ": " + error;
            return false;
        }
        return true;
    } catch (const std::exception& e) {
        out = {};
        error = path + ": " + e.what();
        return false;
    }
}

bool ScaleEffectCompiler::CompileD3d12(const std::string& path, const ScaleEffectParams& params,
    ScaleEffectRuntimeDesc& out, std::string& error)
{
    out = {};
    error.clear();
    try {
        ScaleEffectDesc authored;
        authored.mName = path;
        authored.mSourcePath = path;
        std::vector<std::vector<uint8_t>> dxil;
        if (!ParseEffect(path, authored) ||
            !ResolveInlineParams(authored, params, authored.mInlineParams, authored.mError)) {
            error = path + ": " + authored.mError;
            return false;
        }
        authored.mInlineParamsEnabled = true;
        if (!GenerateAndCompilePasses(authored, &dxil)) {
            error = path + ": " + authored.mError;
            return false;
        }
        if (!BuildRuntimeMetadata(authored, &dxil, out, error)) {
            error = path + ": " + error;
            return false;
        }
        return true;
    } catch (const std::exception& e) {
        out = {};
        error = path + ": " + e.what();
        return false;
    }
}

bool ScaleEffectCompiler::ResolveInlineParams(
	const ScaleEffectDesc& theDesc,
	const ScaleEffectParams& theOverrides,
	ScaleEffectParams& outResolved,
	std::string& outError)
{
	outResolved.clear();
	outError.clear();
	std::set<std::string> aUsedOverrideNames;
	std::set<std::string> aDeclaredNames;

	for (const ScaleEffectParamDesc& aParam : theDesc.mParams)
	{
		const std::string aLowerName = Lower(aParam.mName);
		if (!aDeclaredNames.insert(aLowerName).second)
		{
			outError = "duplicate PARAMETER name: " + aParam.mName;
			return false;
		}

		float aValue = aParam.mDefault;
		bool aFound = false;
		for (const auto& anOverride : theOverrides)
		{
			if (Lower(anOverride.first) != aLowerName)
				continue;
			if (aFound)
			{
				outError = "duplicate case-insensitive parameter override: " + aParam.mName;
				return false;
			}
			aValue = anOverride.second;
			aUsedOverrideNames.insert(Lower(anOverride.first));
			aFound = true;
		}

		if (!std::isfinite(aValue))
		{
			outError = "non-finite parameter value: " + aParam.mName;
			return false;
		}

		if (aParam.mIsInt)
		{
			const double aRounded = std::round((double)aValue);
			if (aRounded < (double)(std::numeric_limits<int>::min)() ||
				aRounded > (double)(std::numeric_limits<int>::max)())
			{
				outError = "integer parameter is outside int range: " + aParam.mName;
				return false;
			}
			aValue = (float)(int)aRounded;
            if (double(aValue) < (std::numeric_limits<int>::min)() ||
                double(aValue) > (std::numeric_limits<int>::max)()) {
                outError = "integer parameter cannot be represented safely: " + aParam.mName;
                return false;
            }
		}

		if (aValue < aParam.mMin || aValue > aParam.mMax)
		{
			std::ostringstream aMessage;
			aMessage << "parameter out of range: " << aParam.mName << "=" << aValue
				<< " expected [" << aParam.mMin << ", " << aParam.mMax << "]";
			outError = aMessage.str();
			return false;
		}

		outResolved[aParam.mName] = aValue;
	}

	for (const auto& anOverride : theOverrides)
	{
		if (aUsedOverrideNames.find(Lower(anOverride.first)) == aUsedOverrideNames.end())
		{
			// scale.json 填错参数名时，把效果实际声明的参数名列出来一眼可查
			// （含 //!LABEL 展示名——Magpie UI 显示的是标签，容易误当变量名）
			std::string aDeclared;
			for (const ScaleEffectParamDesc& aParam : theDesc.mParams)
			{
				aDeclared += aDeclared.empty() ? "" : ", ";
				aDeclared += aParam.mName;
				if (!aParam.mLabel.empty())
					aDeclared += " (" + aParam.mLabel + ")";
			}
			outError = "unknown parameter: " + anOverride.first +
				(aDeclared.empty() ? " (effect declares no parameters)"
				: " (declared: " + aDeclared + ")");
			return false;
		}
	}
	return true;
}

bool ScaleEffectCompiler::CompileAll(const std::string& theEffectsDir, std::vector<ScaleEffectDesc>& outEffects)
{
	outEffects.clear();

	// Enumerate *.hlsl recursively (Anime4K lives in a subdirectory).
	std::vector<std::string> aFiles;
	for (const auto& entry : std::filesystem::recursive_directory_iterator(theEffectsDir))
		if (entry.is_regular_file() && Lower(entry.path().extension().string()) == ".hlsl")
			aFiles.push_back(std::filesystem::relative(entry.path(), theEffectsDir).generic_string());
	std::sort(aFiles.begin(), aFiles.end());

	bool aAllOk = true;
	for (const std::string& aFile : aFiles)
	{
		ScaleEffectDesc aDesc;
		std::string aOpenPath = theEffectsDir + "/" + aFile;
		if (CompileEffect(aOpenPath, aDesc))
		{
			outEffects.push_back(std::move(aDesc));
		}
		else
		{
			aAllOk = false;
		}
	}

	return aAllOk;
}

bool ScaleEffectCompiler::ParseEffect(const std::string& thePath, ScaleEffectDesc& ioDesc)
{
	std::ifstream aFile(thePath, std::ios::binary);
	if (!aFile)
	{
		ioDesc.mError = "cannot open " + thePath;
		return false;
	}
	std::string aSource((std::istreambuf_iterator<char>(aFile)), std::istreambuf_iterator<char>());
	std::string aStripped = StripComments(aSource);
	std::istringstream aStream(aStripped);

	std::string aLine;
	std::vector<std::string> aLines;
	while (std::getline(aStream, aLine))
		aLines.push_back(aLine);

	// Collect blocks: header + PARAMETER/TEXTURE/SAMPLER/COMMON/PASS.
	struct Block
	{
		std::string				mKeyword;
		std::vector<std::string> mOptionLines;
		std::vector<std::string> mCodeLines;
	};
	std::vector<Block> aBlocks;
	Block* aCurrent = nullptr;
	bool aSawMagic = false;

	for (const std::string& aRawLine : aLines)
	{
		std::string aTrimmed = Trim(aRawLine);
		if (aTrimmed.empty())
		{
			if (aCurrent != nullptr)
				aCurrent->mCodeLines.push_back(aRawLine);
			continue;
		}

		std::string aKeyword;
		if (IsBlockStart(aTrimmed, aKeyword))
		{
			aBlocks.push_back(Block());
			aCurrent = &aBlocks.back();
			aCurrent->mKeyword = aKeyword;
			continue;
		}

		if (aTrimmed.compare(0, 3, "//!") == 0)
		{
			if (aCurrent != nullptr)
				aCurrent->mOptionLines.push_back(aTrimmed);
			else
			{
				// Header options.
				std::string aBody = Trim(aTrimmed.substr(3));
				if (Lower(aBody).compare(0, 13, "magpie effect") == 0)
					aSawMagic = true;
				// VERSION/SORT_NAME/USE/CAPABILITY are validated loosely below.
				aBlocks.push_back(Block());
				aCurrent = &aBlocks.back();
				aCurrent->mKeyword = "header";
				aCurrent->mOptionLines.push_back(aTrimmed);
			}
			continue;
		}

		if (aCurrent != nullptr)
			aCurrent->mCodeLines.push_back(aRawLine);
		else if (aTrimmed.compare(0, 8, "#include") != 0)
		{
			ioDesc.mError = "code before any block";
			return false;
		}
	}

	if (!aSawMagic && !aBlocks.empty() && aBlocks[0].mKeyword == "header")
	{
		// Fall back: first header block counts as magic if it has VERSION.
		for (const std::string& aLine2 : aBlocks[0].mOptionLines)
			if (Lower(GetOption(aLine2, "version")) == "4")
				aSawMagic = true;
	}
	if (!aSawMagic)
	{
		ioDesc.mError = "missing //!MAGPIE EFFECT";
		return false;
	}

	for (const Block& aBlock : aBlocks)
	{
		if (aBlock.mKeyword == "header")
			continue;

		if (aBlock.mKeyword == "parameter")
		{
			ScaleEffectParamDesc aParam;
			bool aHasDefault = false;
			bool aHasMin = false;
			bool aHasMax = false;
			bool aHasStep = false;
			for (const std::string& aOpt : aBlock.mOptionLines)
			{
				std::string aValue = GetOption(aOpt, "default");
				if (!aValue.empty()) { aParam.mDefault = (float)atof(aValue.c_str()); aHasDefault = true; }
				aValue = GetOption(aOpt, "min");
				if (!aValue.empty()) { aParam.mMin = (float)atof(aValue.c_str()); aHasMin = true; }
				aValue = GetOption(aOpt, "max");
				if (!aValue.empty()) { aParam.mMax = (float)atof(aValue.c_str()); aHasMax = true; }
				aValue = GetOption(aOpt, "step");
				if (!aValue.empty()) { aParam.mStep = (float)atof(aValue.c_str()); aHasStep = true; }
				aValue = GetOption(aOpt, "label");
				if (!aValue.empty()) aParam.mLabel = aValue;
			}
			if (!aHasDefault || !aHasMin || !aHasMax || !aHasStep ||
				!std::isfinite(aParam.mDefault) || !std::isfinite(aParam.mMin) ||
				!std::isfinite(aParam.mMax) || !std::isfinite(aParam.mStep) ||
				aParam.mMin > aParam.mMax || aParam.mStep <= 0.0f)
			{
				ioDesc.mError = "bad PARAMETER metadata";
				return false;
			}
			std::string aCode = "";
			for (const std::string& aCodeLine : aBlock.mCodeLines)
				aCode += Trim(aCodeLine) + " ";
			aCode = Trim(aCode);
			if (aCode.compare(0, 5, "float") == 0 && aCode.find(';') != std::string::npos)
				aParam.mIsInt = false;
			else if (aCode.compare(0, 3, "int") == 0 && aCode.find(';') != std::string::npos)
				aParam.mIsInt = true;
			else
			{
				ioDesc.mError = "bad PARAMETER block";
				return false;
			}
			// Name is the token before ';'.
			size_t aSemi = aCode.find(';');
			std::string aDecl = Trim(aCode.substr(0, aSemi));
			size_t aSpace = aDecl.find_last_of(' ');
			aParam.mName = aSpace == std::string::npos ? aDecl : aDecl.substr(aSpace + 1);
			ioDesc.mParams.push_back(aParam);
		}
		else if (aBlock.mKeyword == "texture")
		{
			ScaleEffectTextureDesc aTex;
			for (const std::string& aOpt : aBlock.mOptionLines)
			{
				std::string aValue = GetOption(aOpt, "width");
				if (!aValue.empty()) aTex.mWidthExpr = aValue;
				aValue = GetOption(aOpt, "height");
				if (!aValue.empty()) aTex.mHeightExpr = aValue;
				aValue = GetOption(aOpt, "format");
				if (!aValue.empty()) aTex.mFormat = aValue;
				aValue = GetOption(aOpt, "source");
				if (!aValue.empty()) aTex.mSource = aValue;
			}
			std::string aCode = "";
			for (const std::string& aCodeLine : aBlock.mCodeLines)
				aCode += Trim(aCodeLine) + " ";
			aCode = Trim(aCode);
			size_t aSemi = aCode.find(';');
			if (aCode.compare(0, 9, "Texture2D") != 0 || aSemi == std::string::npos)
			{
				ioDesc.mError = "bad TEXTURE block";
				return false;
			}
			std::string aDecl = Trim(aCode.substr(9, aSemi - 9));
			aTex.mName = Trim(aDecl);
			ioDesc.mTextures.push_back(aTex);
		}
		else if (aBlock.mKeyword == "sampler")
		{
			ScaleEffectSamplerDesc aSam;
			for (const std::string& aOpt : aBlock.mOptionLines)
			{
				std::string aValue = GetOption(aOpt, "filter");
				if (!aValue.empty()) aSam.mFilter = Lower(aValue);
				aValue = GetOption(aOpt, "address");
				if (!aValue.empty()) aSam.mAddress = Lower(aValue);
			}
			std::string aCode = "";
			for (const std::string& aCodeLine : aBlock.mCodeLines)
				aCode += Trim(aCodeLine) + " ";
			aCode = Trim(aCode);
			size_t aSemi = aCode.find(';');
			if (aCode.compare(0, 12, "SamplerState") != 0 || aSemi == std::string::npos)
			{
				ioDesc.mError = "bad SAMPLER block";
				return false;
			}
			std::string aDecl = Trim(aCode.substr(12, aSemi - 12));
			aSam.mName = Trim(aDecl);
			ioDesc.mSamplers.push_back(aSam);
		}
		else if (aBlock.mKeyword == "common")
		{
			std::string aCommon;
			for (const std::string& aCodeLine : aBlock.mCodeLines)
				aCommon += aCodeLine + "\n";
			ioDesc.mCommonBlocks.push_back(aCommon);
		}
		else if (aBlock.mKeyword == "pass")
		{
			ScaleEffectPassDesc aPass;
			aPass.mPSStyle = false;
			aPass.mBlockWidth = 8;
			aPass.mBlockHeight = 8;
			aPass.mNumThreadsX = 8;
			aPass.mNumThreadsY = 8;
			aPass.mNumThreadsZ = 1;

			for (const std::string& aOpt : aBlock.mOptionLines)
			{
				std::string aValue = GetOption(aOpt, "in");
				if (!aValue.empty())
				{
					std::string aName;
					std::istringstream aList(aValue);
					while (std::getline(aList, aName, ','))
						aPass.mInputs.push_back(Trim(aName));
				}
				aValue = GetOption(aOpt, "out");
				if (!aValue.empty())
				{
					std::string aName;
					std::istringstream aList(aValue);
					while (std::getline(aList, aName, ','))
						aPass.mOutputs.push_back(Trim(aName));
				}
				aValue = GetOption(aOpt, "style");
				if (!aValue.empty())
					aPass.mPSStyle = Lower(aValue) == "ps";
				aValue = GetOption(aOpt, "desc");
				if (!aValue.empty())
					aPass.mDesc = aValue;
				aValue = GetOption(aOpt, "block_size");
				if (!aValue.empty())
				{
					std::vector<int> aSizes;
					if (ParseIntList(aValue, aSizes) && aSizes.size() <= 2)
					{
						aPass.mBlockWidth = aSizes[0];
						aPass.mBlockHeight = aSizes.size() == 2 ? aSizes[1] : aSizes[0];
					}
				}
				aValue = GetOption(aOpt, "num_threads");
				if (!aValue.empty())
				{
					std::vector<int> aSizes;
					if (ParseIntList(aValue, aSizes) && aSizes.size() <= 3)
					{
						aPass.mNumThreadsX = aSizes[0];
						aPass.mNumThreadsY = aSizes.size() >= 2 ? aSizes[1] : 1;
						aPass.mNumThreadsZ = aSizes.size() == 3 ? aSizes[2] : 1;
					}
				}
			}

			for (const std::string& aCodeLine : aBlock.mCodeLines)
				aPass.mCode += aCodeLine + "\n";

			aPass.mIndex = (int)ioDesc.mPasses.size() + 1;
			ioDesc.mPasses.push_back(aPass);
		}
	}

	if (ioDesc.mPasses.empty())
	{
		ioDesc.mError = "no PASS blocks";
		return false;
	}
	return true;
}

const ScaleEffectTextureDesc* FindTexture(const ScaleEffectDesc& theDesc, const std::string& theName)
{
	for (const ScaleEffectTextureDesc& aTex : theDesc.mTextures)
		if (aTex.mName == theName)
			return &aTex;
	return nullptr;
}

bool ScaleEffectCompiler::GenerateAndCompilePasses(ScaleEffectDesc& ioDesc,
    std::vector<std::vector<uint8_t>>* dxil)
{
    ioDesc.mCompiled = false;
	ioDesc.mCompiledSpirv.clear();
    if (dxil) {
        dxil->clear();
        dxil->resize(ioDesc.mPasses.size());
    } else {
        ioDesc.mCompiledSpirv.resize(ioDesc.mPasses.size());
    }

	const size_t aPassCount = ioDesc.mPasses.size();
	for (size_t i = 0; i < aPassCount; i++)
	{
		const ScaleEffectPassDesc& aPass = ioDesc.mPasses[i];

		std::string aSource;
		aSource.reserve(4096 + aPass.mCode.size());

		// Constant buffer.
		aSource += dxil ? "cbuffer __CB1 : register(b0) {\n" : "[[vk::binding(0, 0)]] cbuffer __CB1 {\n";
		aSource += "\tuint2 __inputSize;\n";
		aSource += "\tuint2 __outputSize;\n";
		aSource += "\tfloat2 __inputPt;\n";
		aSource += "\tfloat2 __outputPt;\n";
		aSource += "\tfloat2 __scale;\n";
		for (size_t j = 0; j < aPassCount - 1; j++)
		{
			if (ioDesc.mPasses[j].mPSStyle)
			{
				char aBuf[128];
				snprintf(aBuf, sizeof(aBuf), "\tuint2 __pass%zuOutputSize;\n\tfloat2 __pass%zuOutputPt;\n", j + 1, j + 1);
				aSource += aBuf;
			}
		}
		aSource += "};\n\n";

        // Vulkan uses declaration-order specialization IDs; DXIL bakes the
        // resolved values into static constants when compiling the source.
        for (size_t paramSlot = 0; paramSlot < ioDesc.mParams.size(); ++paramSlot)
        {
            const auto& aParam = ioDesc.mParams[paramSlot];
            auto anItr = ioDesc.mInlineParams.find(aParam.mName);
            if (anItr == ioDesc.mInlineParams.end())
            {
                ioDesc.mError = "resolved inline parameter missing: " + aParam.mName;
                return false;
            }
            aSource += dxil ? "static const " :
                "[[vk::constant_id(" + std::to_string(paramSlot) + ")]] const ";
            aSource += aParam.mIsInt ? "int " : "float ";
            aSource += aParam.mName;
            aSource += " = ";
            aSource += aParam.mIsInt ? std::to_string((int)anItr->second) : MakeHlslFloatLiteral(anItr->second);
            aSource += ";\n";
        }
		if (!ioDesc.mParams.empty())
			aSource += "\n";

		// SRV inputs.
		int aSrvSlot = 0;
		for (const std::string& aInput : aPass.mInputs)
		{
			const ScaleEffectTextureDesc* aTex = FindTexture(ioDesc, aInput);
			if (aTex == nullptr)
			{
				ioDesc.mError = "pass input not declared: " + aInput;
				return false;
			}
			std::string aFormat = aTex->mFormat.empty() ? "R8G8B8A8_UNORM" : aTex->mFormat;
			const ScaleAuthoringFormatInfo* aInfo = FindScaleEffectFormat(aFormat);
			if (aInfo == nullptr)
			{
				ioDesc.mError = "unknown texture format: " + aFormat;
				return false;
			}
			char aBuf[256];
            if (dxil)
                snprintf(aBuf, sizeof(aBuf), "Texture2D<%s> %s : register(t%d);\n", aInfo->mSrvType, aInput.c_str(), aSrvSlot++);
            else
                snprintf(aBuf, sizeof(aBuf), "[[vk::binding(%d, 1)]] Texture2D<%s> %s;\n", aSrvSlot++, aInfo->mSrvType, aInput.c_str());
			aSource += aBuf;
		}

		// UAV outputs.
		int aUavSlot = 0;
		for (const std::string& aOutput : aPass.mOutputs)
		{
			const ScaleEffectTextureDesc* aTex = FindTexture(ioDesc, aOutput);
			if (aTex == nullptr)
			{
				ioDesc.mError = "pass output not declared: " + aOutput;
				return false;
			}
			std::string aFormat = aTex->mFormat.empty() ? "R8G8B8A8_UNORM" : aTex->mFormat;
			const ScaleAuthoringFormatInfo* aInfo = FindScaleEffectFormat(aFormat);
			if (aInfo == nullptr)
			{
				ioDesc.mError = "unknown texture format: " + aFormat;
				return false;
			}
			char aBuf[256];
            if (dxil)
                snprintf(aBuf, sizeof(aBuf), "RWTexture2D<%s> %s : register(u%d);\n", aInfo->mSrvType, aOutput.c_str(), aUavSlot++);
            else
                snprintf(aBuf, sizeof(aBuf), "[[vk::binding(%d, 2)]] [[vk::image_format(\"%s\")]] RWTexture2D<%s> %s;\n", aUavSlot++, aInfo->mImageFormat, aInfo->mSrvType, aOutput.c_str());
			aSource += aBuf;
		}

		// Samplers.
		int aSamplerSlot = 0;
		for (const ScaleEffectSamplerDesc& aSam : ioDesc.mSamplers)
		{
			char aBuf[256];
            if (dxil)
                snprintf(aBuf, sizeof(aBuf), "SamplerState %s : register(s%d);\n", aSam.mName.c_str(), aSamplerSlot++);
            else
                snprintf(aBuf, sizeof(aBuf), "[[vk::binding(%d, 3)]] SamplerState %s;\n", aSamplerSlot++, aSam.mName.c_str());
			aSource += aBuf;
		}
		aSource += "\n";

		// Builtins.
		aSource +=
			"uint __Bfe(uint src, uint off, uint bits) { uint mask = (1u << bits) - 1; return (src >> off) & mask; }\n"
			"uint __BfiM(uint src, uint ins, uint bits) { uint mask = (1u << bits) - 1; return (ins & mask) | (src & (~mask)); }\n"
			"uint2 Rmp8x8(uint a) { return uint2(__Bfe(a, 1u, 3u), __BfiM(__Bfe(a, 3u, 3u), a, 1u)); }\n"
			"uint2 GetInputSize() { return __inputSize; }\n"
			"float2 GetInputPt() { return __inputPt; }\n"
			"uint2 GetOutputSize() { return __outputSize; }\n"
			"float2 GetOutputPt() { return __outputPt; }\n"
			"float2 GetScale() { return __scale; }\n"
			"MF2 MulAdd(MF2 x, MF2x2 y, MF2 a) { return mul(x, y) + a; }\n"
			"MF3 MulAdd(MF2 x, MF2x3 y, MF3 a) { return mul(x, y) + a; }\n"
			"MF4 MulAdd(MF2 x, MF2x4 y, MF4 a) { return mul(x, y) + a; }\n"
			"MF2 MulAdd(MF3 x, MF3x2 y, MF2 a) { return mul(x, y) + a; }\n"
			"MF3 MulAdd(MF3 x, MF3x3 y, MF3 a) { return mul(x, y) + a; }\n"
			"MF4 MulAdd(MF3 x, MF3x4 y, MF4 a) { return mul(x, y) + a; }\n"
			"MF2 MulAdd(MF4 x, MF4x2 y, MF2 a) { return mul(x, y) + a; }\n"
			"MF3 MulAdd(MF4 x, MF4x3 y, MF3 a) { return mul(x, y) + a; }\n"
			"MF4 MulAdd(MF4 x, MF4x4 y, MF4 a) { return mul(x, y) + a; }\n"
			"\n";

		// COMMON blocks.
		for (const std::string& aCommon : ioDesc.mCommonBlocks)
			aSource += aCommon + "\n";

		// Pass code.
		aSource += aPass.mCode;
		aSource += "\n";

		// Entry.
		if (aPass.mPSStyle)
		{
			std::string aOutputSize = i + 1 == aPassCount ? "__outputSize" : (std::string) "__pass" + std::to_string(i + 1) + "OutputSize";
			std::string aOutputPt = i + 1 == aPassCount ? "__outputPt" : (std::string) "__pass" + std::to_string(i + 1) + "OutputPt";
			if (aPass.mOutputs.empty())
			{
				ioDesc.mError = "PS pass has no output";
				return false;
			}
			char aBuf[1024];
			snprintf(
				aBuf,
				sizeof(aBuf),
				"[numthreads(64, 1, 1)]\n"
				"void __M(uint3 tid : SV_GroupThreadID, uint3 gid : SV_GroupID) {\n"
				"\tuint2 gxy = (gid.xy << 4u) + Rmp8x8(tid.x);\n"
				"\tif (gxy.x >= %s.x || gxy.y >= %s.y) return;\n"
				"\tfloat2 pos = (gxy + 0.5f) * %s;\n"
				"\tfloat2 step = 8 * %s;\n"
				"\t%s[gxy] = Pass%d(pos);\n"
				"\tgxy.x += 8u; pos.x += step.x;\n"
				"\tif (gxy.x < %s.x && gxy.y < %s.y) %s[gxy] = Pass%d(pos);\n"
				"\tgxy.y += 8u; pos.y += step.y;\n"
				"\tif (gxy.x < %s.x && gxy.y < %s.y) %s[gxy] = Pass%d(pos);\n"
				"\tgxy.x -= 8u; pos.x -= step.x;\n"
				"\tif (gxy.x < %s.x && gxy.y < %s.y) %s[gxy] = Pass%d(pos);\n"
				"}\n",
				aOutputSize.c_str(), aOutputSize.c_str(), aOutputPt.c_str(), aOutputPt.c_str(),
				aPass.mOutputs[0].c_str(), aPass.mIndex,
				aOutputSize.c_str(), aOutputSize.c_str(), aPass.mOutputs[0].c_str(), aPass.mIndex,
				aOutputSize.c_str(), aOutputSize.c_str(), aPass.mOutputs[0].c_str(), aPass.mIndex,
				aOutputSize.c_str(), aOutputSize.c_str(), aPass.mOutputs[0].c_str(), aPass.mIndex);
			aSource += aBuf;
		}
		else
		{
			char aBuf[512];
			snprintf(
				aBuf,
				sizeof(aBuf),
				"[numthreads(%d, %d, %d)]\n"
				"void __M(uint3 tid : SV_GroupThreadID, uint3 gid : SV_GroupID) {\n"
				"\tPass%d(gid.xy * uint2(%d, %d), tid);\n"
				"}\n",
				aPass.mNumThreadsX, aPass.mNumThreadsY, aPass.mNumThreadsZ,
				aPass.mIndex, aPass.mBlockWidth, aPass.mBlockHeight);
			aSource += aBuf;
		}

		// Compile.
		std::vector<std::pair<std::string, std::string>> aMacroPairs;
		auto AddMacro = [&](const std::string& theName, const std::string& theValue)
		{
			aMacroPairs.emplace_back(theName, theValue);
		};
		AddMacro("MP_BLOCK_WIDTH", std::to_string(aPass.mBlockWidth));
		AddMacro("MP_BLOCK_HEIGHT", std::to_string(aPass.mBlockHeight));
		AddMacro("MP_NUM_THREADS_X", std::to_string(aPass.mNumThreadsX));
		AddMacro("MP_NUM_THREADS_Y", std::to_string(aPass.mNumThreadsY));
		AddMacro("MP_NUM_THREADS_Z", std::to_string(aPass.mNumThreadsZ));
		if (aPass.mPSStyle)
			AddMacro("MP_PS_STYLE", "");
		AddMacro("MP_INLINE_PARAMS", "");
		AddMacro("MF", "float");
		static constexpr const char* aDigits[] = { "1", "2", "3", "4" };
		for (int k = 0; k < 4; k++)
		{
			AddMacro(std::string("MF") + aDigits[k], std::string("float") + aDigits[k]);
			for (int m = 0; m < 4; m++)
			{
				AddMacro(
					std::string("MF") + aDigits[k] + "x" + aDigits[m],
					std::string("float") + aDigits[k] + "x" + aDigits[m]);
			}
		}

        // Retain one compiler instance across all passes/effects in this compile batch.
        if (!mImpl) mImpl = std::make_unique<Impl>();
        std::string preamble;
        for (const auto& [name, value] : aMacroPairs)
            preamble += "#define " + name + " " + value + "\n";
        aSource.insert(0, preamble);
        bool compiled = false;
        try {
            compiled = dxil
                ? mImpl->CompileD3d12(aSource, ioDesc.mSourcePath, (*dxil)[i], ioDesc.mError)
                : mImpl->Compile(aSource, ioDesc.mSourcePath, ioDesc.mCompiledSpirv[i], ioDesc.mError);
        } catch (const std::exception& e) {
            ioDesc.mError = e.what();
        }
        if (!compiled) {
            ioDesc.mError = ioDesc.mName + " pass " + std::to_string(i + 1) + ": " + ioDesc.mError;
            // A failed effect is never partially usable.
            ioDesc.mCompiledSpirv.clear();
            if (dxil) dxil->clear();
            return false;
        }
	}

		ioDesc.mCompiled = true;
		return true;
	}

namespace {
class SizeExprCompiler {
public:
    SizeExprCompiler(std::string_view text, ScaleSizeExpr& out): text_(text), out_(out) {}
    bool Parse() { AddSub(); Space(); return ok_ && pos_ == text_.size(); }
private:
    void Space() { while(pos_<text_.size() && std::isspace(static_cast<unsigned char>(text_[pos_]))) ++pos_; }
    void AddSub() {
        MulDiv();
        while(ok_) {
            Space(); if(pos_==text_.size() || (text_[pos_]!='+' && text_[pos_]!='-')) return;
            const char op=text_[pos_++]; MulDiv();
            out_.push_back({op=='+'?ScaleSizeOp::Add:ScaleSizeOp::Subtract,0});
        }
    }
    void MulDiv() {
        Primary();
        while(ok_) {
            Space(); if(pos_==text_.size() || (text_[pos_]!='*' && text_[pos_]!='/')) return;
            const char op=text_[pos_++]; Primary();
            out_.push_back({op=='*'?ScaleSizeOp::Multiply:ScaleSizeOp::Divide,0});
        }
    }
    void Primary() {
        Space(); if(pos_==text_.size()) { ok_=false; return; }
        if(text_[pos_]=='(') {
            ++pos_; if(++depth_>256) { ok_=false; return; }
            AddSub(); --depth_; Space();
            if(pos_==text_.size() || text_[pos_++]!=')') ok_=false;
            return;
        }
        if(std::isdigit(static_cast<unsigned char>(text_[pos_]))) {
            int64_t value=0;
            while(pos_<text_.size() && std::isdigit(static_cast<unsigned char>(text_[pos_]))) {
                value=value*10+(text_[pos_++]-'0');
                if(value>INT32_MAX) { ok_=false; return; }
            }
            out_.push_back({ScaleSizeOp::Literal,int32_t(value)}); return;
        }
        const auto start=pos_;
        while(pos_<text_.size() && (std::isalnum(static_cast<unsigned char>(text_[pos_])) || text_[pos_]=='_')) ++pos_;
        const auto name=text_.substr(start,pos_-start);
        ScaleSizeOp op;
        if(name=="INPUT_WIDTH") op=ScaleSizeOp::InputWidth;
        else if(name=="INPUT_HEIGHT") op=ScaleSizeOp::InputHeight;
        else if(name=="OUTPUT_WIDTH") op=ScaleSizeOp::OutputWidth;
        else if(name=="OUTPUT_HEIGHT") op=ScaleSizeOp::OutputHeight;
        else { ok_=false; return; }
        out_.push_back({op,0});
    }
    std::string_view text_;
    ScaleSizeExpr& out_;
    size_t pos_=0;
    unsigned depth_=0;
    bool ok_=true;
};
}
bool ScaleEffectCompiler::CompileSizeExpr(std::string_view text, ScaleSizeExpr& out, std::string& error) {
    out.clear(); error.clear();
    if(text.empty()) return true;
    if(!SizeExprCompiler(text,out).Parse()) {
        out.clear(); error="Invalid scale size expression"; return false;
    }
    return true;
}
bool ScaleEffectCompiler::CompileRuntimeMetadata(const ScaleEffectDesc& authored,
    ScaleEffectRuntimeDesc& out, std::string& error) {
    return BuildRuntimeMetadata(authored, nullptr, out, error);
}
bool ScaleEffectCompiler::BuildRuntimeMetadata(const ScaleEffectDesc& authored,
    const std::vector<std::vector<uint8_t>>* dxil, ScaleEffectRuntimeDesc& out, std::string& error) {
    out={}; error.clear();
    if(!authored.mCompiled || !authored.mInlineParamsEnabled ||
        (dxil ? dxil->size() : authored.mCompiledSpirv.size())!=authored.mPasses.size()) {
        error="Effect authoring compilation is incomplete"; return false;
    }
    ScaleEffectRuntimeDesc result;
    result.mSourcePath=authored.mSourcePath;
    std::map<std::string,ScaleResourceId> resources;
    for(const auto& item:authored.mTextures) {
        ScaleRuntimeTexture texture;
        texture.mId=static_cast<ScaleResourceId>(result.mTextures.size());
        if(!resources.emplace(item.mName,texture.mId).second) {
            error="Duplicate scale resource declaration"; return false;
        }
        if(item.mName=="INPUT") result.mInput=texture.mId;
        if(item.mName=="OUTPUT") result.mOutput=texture.mId;
        if(!CompileSizeExpr(item.mWidthExpr,texture.mWidthExpr,error) ||
            !CompileSizeExpr(item.mHeightExpr,texture.mHeightExpr,error)) return false;
        const auto* format=FindScaleEffectFormat(item.mFormat.empty()?"R8G8B8A8_UNORM":item.mFormat);
        if(!format) { error="Unknown scale texture format"; return false; }
        texture.mFormat=format->mFormat; texture.mSource=item.mSource;
        result.mTextures.push_back(std::move(texture));
    }
    for(const auto& item:authored.mSamplers) {
        ScaleRuntimeSampler sampler;
        if(item.mFilter.empty() || item.mFilter=="point") sampler.mFilter=0;
        else if(item.mFilter=="linear") sampler.mFilter=1;
        else { error="Unknown scale sampler filter"; return false; }
        if(item.mAddress.empty() || item.mAddress=="clamp") sampler.mAddress=2;
        else if(item.mAddress=="wrap") sampler.mAddress=0;
        else if(item.mAddress=="mirror") sampler.mAddress=1;
        else if(item.mAddress=="border") sampler.mAddress=3;
        else { error="Unknown scale sampler address"; return false; }
        result.mSamplers.push_back(sampler);
    }
    for(size_t i=0;i<authored.mParams.size();++i) {
        const auto& item=authored.mParams[i];
        const auto value=authored.mInlineParams.find(item.mName);
        if(value==authored.mInlineParams.end()) { error="Missing resolved scale parameter"; return false; }
        result.mParams.push_back({ScaleEffectBinary::ProtocolParamKey(item.mName),static_cast<ScaleParamId>(i),
            item.mIsInt,item.mDefault,item.mMin,item.mMax,item.mStep,value->second});
    }
    for(size_t i=0;i<authored.mPasses.size();++i) {
        const auto& item=authored.mPasses[i];
        ScaleRuntimePass pass;
        pass.mId=static_cast<ScalePassId>(i); pass.mPSStyle=item.mPSStyle;
        pass.mBlockWidth=item.mBlockWidth; pass.mBlockHeight=item.mBlockHeight;
        pass.mNumThreadsX=item.mNumThreadsX; pass.mNumThreadsY=item.mNumThreadsY; pass.mNumThreadsZ=item.mNumThreadsZ;
        for(const auto& name:item.mInputs) {
            const auto found=resources.find(name);
            if(found==resources.end()) { error="Undeclared scale input resource"; return false; }
            pass.mInputs.push_back(found->second);
        }
        for(const auto& name:item.mOutputs) {
            const auto found=resources.find(name);
            if(found==resources.end()) { error="Undeclared scale output resource"; return false; }
            pass.mOutputs.push_back(found->second);
        }
        if (dxil) {
            pass.mDxil = (*dxil)[i];
        } else {
            const auto& words=authored.mCompiledSpirv[i];
            if(words.size()<5) { error="Invalid scale SPIR-V"; return false; }
            pass.mSpirv.assign(words.begin(),words.begin()+5);
            for(size_t pos=5;pos<words.size();) {
                const auto count=words[pos]>>16, op=words[pos]&0xffffu;
                if(!count || count>words.size()-pos) { error="Invalid scale SPIR-V instruction"; return false; }
                // Debug symbol labels are not execution metadata. EntryPoint and
                // extension/import strings are native SPIR-V protocol and retained.
                if(op!=5 && op!=6) pass.mSpirv.insert(pass.mSpirv.end(),words.begin()+pos,words.begin()+pos+count);
                pos+=count;
            }
        }
        result.mPasses.push_back(std::move(pass));
    }
    if(!(dxil ? ValidateD3d12(result,error) : ScaleEffectBinary::Validate(result,error))) return false;
    out=std::move(result); return true;
}
bool ScaleEffectCompiler::CompileBinary(const std::string& sourcePath,const ScaleEffectParams& overrides,
    std::filesystem::path& writtenPath,std::string& error) {
    writtenPath.clear();
    ScaleEffectDesc authored;
    if(!CompileEffect(sourcePath,overrides,authored)) { error=authored.mError; return false; }
    ScaleEffectRuntimeDesc runtime;
    if(!CompileRuntimeMetadata(authored,runtime,error)) return false;
    writtenPath=ScaleEffectBinary::DefaultPath(sourcePath);
    return ScaleEffectBinary::Save(writtenPath,runtime,error);
}
}
#endif // SEXY_SCALE_EFFECT_AUTHORING

#include <algorithm>
#include <bit>
#include <cmath>
#include <fstream>
#include <limits>
#include <set>
#include <stdexcept>

namespace Sexy {
namespace {
constexpr uint32_t kScaleMagic=0x58465356u; // VSFX little-endian disk protocol.
constexpr uint32_t kMaxScaleItems=1u<<20;
class BinaryWriter {
public:
    explicit BinaryWriter(const std::filesystem::path& path): stream_(path,std::ios::binary|std::ios::trunc) {}
    void Word(uint32_t word) {
        const char bytes[]={char(word),char(word>>8),char(word>>16),char(word>>24)};
        stream_.write(bytes,4);
    }
    void Count(size_t count) { if(count>kMaxScaleItems) throw std::runtime_error("Scale binary collection is too large"); Word(uint32_t(count)); }
    void Float(float value) { Word(std::bit_cast<uint32_t>(value)); }
    void Path(const std::string& value) { Count(value.size()); stream_.write(value.data(),std::streamsize(value.size())); }
    void Expr(const ScaleSizeExpr& expr) {
        Count(expr.size()); for(const auto& instruction:expr) { Word(uint32_t(instruction.mOp)); Word(std::bit_cast<uint32_t>(instruction.mLiteral)); }
    }
    void Finish() { stream_.flush(); if(!stream_) throw std::runtime_error("Cannot write scale binary"); }
private:
    std::ofstream stream_;
};
class BinaryReader {
public:
    explicit BinaryReader(const std::filesystem::path& path): stream_(path,std::ios::binary|std::ios::ate) {
        const auto size=stream_.tellg();
        if(size<0 || uint64_t(size)>(1ull<<30)) throw std::runtime_error("Cannot read scale binary or file exceeds size limit");
        remaining_=uint64_t(size); stream_.seekg(0);
    }
    uint32_t Word() {
        unsigned char bytes[4]; Read(reinterpret_cast<char*>(bytes),4);
        return uint32_t(bytes[0])|(uint32_t(bytes[1])<<8)|(uint32_t(bytes[2])<<16)|(uint32_t(bytes[3])<<24);
    }
    size_t Count() { const auto count=Word(); if(count>kMaxScaleItems || uint64_t(count)>remaining_) throw std::runtime_error("Invalid scale binary collection length"); return count; }
    float Float() { return std::bit_cast<float>(Word()); }
    bool Flag() { const auto value=Word(); if(value>1) throw std::runtime_error("Invalid scale binary flag"); return value!=0; }
    std::string Path() { std::string value(Count(),'\0'); Read(value.data(),value.size()); if(value.find('\0')!=std::string::npos) throw std::runtime_error("Invalid scale binary filepath"); return value; }
    ScaleSizeExpr Expr() {
        ScaleSizeExpr result(Count());
        for(auto& instruction:result) { instruction.mOp=static_cast<ScaleSizeOp>(Word()); instruction.mLiteral=std::bit_cast<int32_t>(Word()); }
        return result;
    }
    void Finish() { if(remaining_) throw std::runtime_error("Trailing data in scale binary"); }
private:
    void Read(char* out,size_t length) {
        if(length>remaining_ || !stream_.read(out,std::streamsize(length))) throw std::runtime_error("Truncated scale binary");
        remaining_-=length;
    }
    std::ifstream stream_;
    uint64_t remaining_=0;
};
bool ValidExpr(const ScaleSizeExpr& expr) {
    size_t depth=0;
    for(const auto& instruction:expr) {
        switch(instruction.mOp) {
        case ScaleSizeOp::Literal: if(instruction.mLiteral<0) return false; ++depth; break;
        case ScaleSizeOp::InputWidth: case ScaleSizeOp::InputHeight:
        case ScaleSizeOp::OutputWidth: case ScaleSizeOp::OutputHeight:
            if(instruction.mLiteral) return false; ++depth; break;
        case ScaleSizeOp::Add: case ScaleSizeOp::Subtract: case ScaleSizeOp::Multiply: case ScaleSizeOp::Divide:
            if(instruction.mLiteral || depth<2) return false; --depth; break;
        default: return false;
        }
    }
    return expr.empty() || depth==1;
}
bool NormalizeParam(const ScaleRuntimeParam& param,float input,float& out) {
    if(!std::isfinite(input)) return false;
    if(param.mIsInt) {
        const double rounded=std::round(double(input));
        if(rounded<INT32_MIN || rounded>INT32_MAX) return false;
        input=float(int32_t(rounded));
        // int32->float may round INT32_MAX to 2^31; never cast it back unchecked.
        if(double(input)<INT32_MIN || double(input)>INT32_MAX) return false;
    }
    if(input<param.mMin || input>param.mMax) return false;
    out=input; return true;
}
}
uint64_t ScaleEffectBinary::ProtocolParamKey(std::string_view name) {
    uint64_t key=14695981039346656037ull;
    for(unsigned char c:name) { if(c>='A' && c<='Z') c=static_cast<unsigned char>(c+('a'-'A')); key=(key^c)*1099511628211ull; }
    return key;
}
bool ScaleEffectBinary::DecodeParam(const ScaleEffectRuntimeDesc& effect,std::string_view name,
    float value,ScaleParamValue& out,std::string& error) {
    error.clear(); const auto key=ProtocolParamKey(name);
    for(const auto& param:effect.mParams) if(param.mProtocolKey==key) {
        out={param.mId,value}; return true;
    }
    error="Unknown scale parameter in external configuration"; return false;
}
bool ScaleEffectBinary::ResolveParams(const ScaleEffectRuntimeDesc& effect,const ScaleRuntimeParams& overrides,
    ScaleRuntimeParams& out,std::string& error) {
    out.clear(); error.clear(); std::vector<bool> seen(effect.mParams.size());
    for(const auto& param:effect.mParams) {
        float value=0;
        if(!NormalizeParam(param,param.mDefault,value)) { error="Invalid scale parameter default"; return false; }
        out.push_back({param.mId,value});
    }
    for(const auto& value:overrides) {
        const auto slot=ScaleSlot(value.mId);
        if(slot>=out.size() || seen[slot]) { out.clear(); error="Unknown or duplicate numeric scale parameter"; return false; }
        seen[slot]=true; float normalized=0;
        if(!NormalizeParam(effect.mParams[slot],value.mValue,normalized)) { out.clear(); error="Scale parameter is non-finite or outside its range"; return false; }
        out[slot].mValue=normalized;
    }
    return true;
}
namespace {
bool ValidDxil(const std::vector<uint8_t>& bytes) {
    const auto word = [&](size_t pos) {
        return uint32_t(bytes[pos]) | (uint32_t(bytes[pos+1])<<8) |
            (uint32_t(bytes[pos+2])<<16) | (uint32_t(bytes[pos+3])<<24);
    };
    // DXIL objects use the DXBC container, with an offset table for its parts.
    if(bytes.size()<32 || bytes[0]!='D' || bytes[1]!='X' || bytes[2]!='B' || bytes[3]!='C' ||
        word(20)!=1 || word(24)!=bytes.size()) return false;
    const auto count=word(28);
    if(!count || count>(bytes.size()-32)/4) return false;
    bool hasDxil=false;
    std::vector<std::pair<size_t,size_t>> ranges;
    for(size_t i=0;i<count;++i) {
        const size_t offset=word(32+i*4);
        if(offset<32+size_t(count)*4 || offset>bytes.size()-8 || offset%4) return false;
        const size_t length=word(offset+4);
        if(length>bytes.size()-offset-8) return false;
        ranges.emplace_back(offset,offset+8+length);
        if(word(offset)==0x4c495844u) { // DXIL part, containing an LLVM bitcode program.
            if(hasDxil || length<24 || word(offset+16)!=0x4c495844u) return false;
            const size_t programWords=word(offset+12);
            const size_t bitcodeOffset=word(offset+24), bitcodeSize=word(offset+28);
            if(programWords!=length/4 || length%4 || bitcodeOffset<16 ||
                bitcodeOffset>length-8 || bitcodeSize>length-8-bitcodeOffset || bitcodeSize<4)
                return false;
            if(word(offset+16+bitcodeOffset)!=0xdec04342u) return false;
            hasDxil=true;
        }
    }
    std::sort(ranges.begin(),ranges.end());
    for(size_t i=1;i<ranges.size();++i)
        if(ranges[i].first<ranges[i-1].second) return false;
    return hasDxil;
}
bool ValidateRuntime(const ScaleEffectRuntimeDesc& effect,std::string& error,bool dxil) {
    error.clear();
    const auto fail=[&](const char* text){ error=text; return false; };
    if(effect.mTextures.empty() || effect.mPasses.empty() || ScaleSlot(effect.mInput)>=effect.mTextures.size() ||
        ScaleSlot(effect.mOutput)>=effect.mTextures.size() || effect.mInput==effect.mOutput)
        return fail("Invalid scale binary input/output/pass IDs");
    std::set<uint64_t> keys;
    for(size_t i=0;i<effect.mParams.size();++i) {
        const auto& param=effect.mParams[i]; float value=0;
        if(ScaleSlot(param.mId)!=i || !keys.insert(param.mProtocolKey).second ||
            !std::isfinite(param.mMin) || !std::isfinite(param.mMax) || !std::isfinite(param.mStep) ||
            param.mMin>param.mMax || param.mStep<=0 || !NormalizeParam(param,param.mDefault,value) ||
            !NormalizeParam(param,param.mInlineValue,value) || value!=param.mInlineValue)
            return fail("Invalid scale binary parameter metadata");
    }
    for(size_t i=0;i<effect.mTextures.size();++i) {
        const auto& texture=effect.mTextures[i];
        if(ScaleSlot(texture.mId)!=i || !IsScaleEffectFormat(texture.mFormat) ||
            !ValidExpr(texture.mWidthExpr) || !ValidExpr(texture.mHeightExpr))
            return fail("Invalid scale binary resource/format/expression");
    }
    if(!effect.mTextures[ScaleSlot(effect.mInput)].mSource.empty() || !effect.mTextures[ScaleSlot(effect.mOutput)].mSource.empty())
        return fail("Invalid scale binary input/output source");
    for(const auto& sampler:effect.mSamplers)
        if(sampler.mFilter>1 || sampler.mAddress>3)
            return fail("Invalid scale binary sampler enums");
    std::vector<bool> produced(effect.mTextures.size());
    produced[ScaleSlot(effect.mInput)]=true;
    for(const auto& texture:effect.mTextures) if(!texture.mSource.empty()) produced[ScaleSlot(texture.mId)]=true;
    for(size_t i=0;i<effect.mPasses.size();++i) {
        const auto& pass=effect.mPasses[i];
        if(ScaleSlot(pass.mId)!=i || pass.mOutputs.empty() || pass.mBlockWidth<=0 || pass.mBlockHeight<=0 ||
            pass.mNumThreadsX<=0 || pass.mNumThreadsY<=0 || pass.mNumThreadsZ<=0)
            return fail("Invalid scale pass/dispatch metadata");
        if(dxil) {
            if(!pass.mSpirv.empty() || !ValidDxil(pass.mDxil))
                return fail("Invalid scale DXIL container or mixed shader backends");
            if(pass.mNumThreadsX>1024 || pass.mNumThreadsY>1024 || pass.mNumThreadsZ>64 ||
                uint64_t(pass.mNumThreadsX)*pass.mNumThreadsY*pass.mNumThreadsZ>1024)
                return fail("Scale pass exceeds D3D12 compute thread group limits");
        } else {
            if(pass.mSpirv.size()<5 || pass.mSpirv[0]!=0x07230203u)
                return fail("Invalid scale binary pass/SPIR-V");
            for(size_t pos=5;pos<pass.mSpirv.size();) {
                const auto count=pass.mSpirv[pos]>>16;
                if(!count || count>pass.mSpirv.size()-pos) return fail("Invalid scale binary SPIR-V instruction length");
                if((pass.mSpirv[pos]&0xffffu)==5 || (pass.mSpirv[pos]&0xffffu)==6)
                    return fail("Scale binary contains debug symbolic labels");
                pos+=count;
            }
        }
        for(auto id:pass.mInputs) if(ScaleSlot(id)>=produced.size() || !produced[ScaleSlot(id)])
            return fail("Scale binary pass reads an undeclared/unwritten resource");
        std::set<ScaleResourceId> outputs;
        for(auto id:pass.mOutputs) {
            if(ScaleSlot(id)>=produced.size() || id==effect.mInput || !effect.mTextures[ScaleSlot(id)].mSource.empty() ||
                std::find(pass.mInputs.begin(),pass.mInputs.end(),id)!=pass.mInputs.end() || !outputs.insert(id).second)
                return fail("Scale binary pass aliases a resource");
            produced[ScaleSlot(id)]=true;
        }
    }
    if(!produced[ScaleSlot(effect.mOutput)]) return fail("Scale binary does not produce its output resource");
    return true;
}
}
bool ScaleEffectBinary::Validate(const ScaleEffectRuntimeDesc& effect,std::string& error) {
    return ValidateRuntime(effect,error,false);
}
#if defined(SEXY_SCALE_EFFECT_AUTHORING)
bool ScaleEffectCompiler::ValidateD3d12(const ScaleEffectRuntimeDesc& effect,std::string& error) {
    return ValidateRuntime(effect,error,true);
}
#endif
std::filesystem::path ScaleEffectBinary::DefaultPath(const std::filesystem::path& sourcePath) {
    auto path=sourcePath; path+=".vfx"; return path;
}
bool ScaleEffectBinary::Save(const std::filesystem::path& path,const ScaleEffectRuntimeDesc& effect,std::string& error) {
    if(!Validate(effect,error)) return false;
    try {
        BinaryWriter out(path); out.Word(kScaleMagic); out.Word(Version);
        out.Path(effect.mSourcePath); out.Word(uint32_t(effect.mInput)); out.Word(uint32_t(effect.mOutput));
        out.Count(effect.mParams.size());
        for(const auto& p:effect.mParams) {
            out.Word(uint32_t(p.mProtocolKey)); out.Word(uint32_t(p.mProtocolKey>>32)); out.Word(uint32_t(p.mId)); out.Word(p.mIsInt);
            out.Float(p.mDefault); out.Float(p.mMin); out.Float(p.mMax); out.Float(p.mStep); out.Float(p.mInlineValue);
        }
        out.Count(effect.mTextures.size());
        for(const auto& t:effect.mTextures) { out.Word(uint32_t(t.mId)); out.Word(uint32_t(t.mFormat)); out.Path(t.mSource); out.Expr(t.mWidthExpr); out.Expr(t.mHeightExpr); }
        out.Count(effect.mSamplers.size());
        for(const auto& s:effect.mSamplers) { out.Word(uint32_t(s.mFilter)); out.Word(uint32_t(s.mAddress)); }
        out.Count(effect.mPasses.size());
        for(const auto& p:effect.mPasses) {
            out.Word(uint32_t(p.mId)); out.Word(p.mPSStyle);
            out.Word(uint32_t(p.mBlockWidth)); out.Word(uint32_t(p.mBlockHeight));
            out.Word(uint32_t(p.mNumThreadsX)); out.Word(uint32_t(p.mNumThreadsY)); out.Word(uint32_t(p.mNumThreadsZ));
            out.Count(p.mInputs.size()); for(auto id:p.mInputs) out.Word(uint32_t(id));
            out.Count(p.mOutputs.size()); for(auto id:p.mOutputs) out.Word(uint32_t(id));
            out.Count(p.mSpirv.size()); for(auto word:p.mSpirv) out.Word(word);
        }
        out.Finish(); error.clear(); return true;
    } catch(const std::exception& e) { error=e.what(); return false; }
}
bool ScaleEffectBinary::Load(const std::filesystem::path& path,ScaleEffectRuntimeDesc& out,std::string& error) {
    out={}; error.clear();
    try {
        BinaryReader in(path);
        if(in.Word()!=kScaleMagic || in.Word()!=Version) throw std::runtime_error("Stale or unsupported scale binary; rebake offline");
        ScaleEffectRuntimeDesc result;
        result.mSourcePath=in.Path(); result.mInput=static_cast<ScaleResourceId>(in.Word()); result.mOutput=static_cast<ScaleResourceId>(in.Word());
        result.mParams.resize(in.Count());
        for(auto& p:result.mParams) {
            const uint64_t low=in.Word(), high=in.Word(); p.mProtocolKey=low|(high<<32); p.mId=static_cast<ScaleParamId>(in.Word()); p.mIsInt=in.Flag();
            p.mDefault=in.Float(); p.mMin=in.Float(); p.mMax=in.Float(); p.mStep=in.Float(); p.mInlineValue=in.Float();
        }
        result.mTextures.resize(in.Count());
        for(auto& t:result.mTextures) { t.mId=static_cast<ScaleResourceId>(in.Word()); t.mFormat=in.Word(); t.mSource=in.Path(); t.mWidthExpr=in.Expr(); t.mHeightExpr=in.Expr(); }
        result.mSamplers.resize(in.Count());
        for(auto& s:result.mSamplers) { s.mFilter=in.Word(); s.mAddress=in.Word(); }
        result.mPasses.resize(in.Count());
        for(auto& p:result.mPasses) {
            p.mId=static_cast<ScalePassId>(in.Word()); p.mPSStyle=in.Flag();
            p.mBlockWidth=std::bit_cast<int32_t>(in.Word()); p.mBlockHeight=std::bit_cast<int32_t>(in.Word());
            p.mNumThreadsX=std::bit_cast<int32_t>(in.Word()); p.mNumThreadsY=std::bit_cast<int32_t>(in.Word()); p.mNumThreadsZ=std::bit_cast<int32_t>(in.Word());
            p.mInputs.resize(in.Count()); for(auto& id:p.mInputs) id=static_cast<ScaleResourceId>(in.Word());
            p.mOutputs.resize(in.Count()); for(auto& id:p.mOutputs) id=static_cast<ScaleResourceId>(in.Word());
            p.mSpirv.resize(in.Count()); for(auto& word:p.mSpirv) word=in.Word();
        }
        in.Finish(); if(!Validate(result,error)) return false;
        out=std::move(result); return true;
    } catch(const std::exception& e) { error=e.what(); return false; }
}
}
