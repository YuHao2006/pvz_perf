#include "JsonDoc.h"

// 本文件是全工程唯一包含 <nlohmann/json.hpp> 的 TU（见 JsonDoc.h 头注）。
#include <nlohmann/json.hpp>

#include <cstdlib>
#include <cstring>
#include <cstdio>
#include <utility>

namespace
{
using Json = nlohmann::ordered_json;
}  // namespace

struct JsonDoc::Impl
{
	Json mRoot = Json::object();
};

namespace
{
	// 纯数字段（含前导零）= 数组下标；其余段 = 对象键。空段直接跳过（"a//b" 同 "a/b"）。
	bool SegmentIsIndex(const std::string& theSegment, size_t& theOutIndex)
	{
		if (theSegment.empty())
			return false;
		for (char c : theSegment)
			if (c < '0' || c > '9')
				return false;
		theOutIndex = (size_t)strtoull(theSegment.c_str(), nullptr, 10);
		return true;
	}

	const Json* FindNode(const Json& theRoot, const std::string& thePath)
	{
		const Json* aNode = &theRoot;
		size_t aBegin = 0;
		while (aBegin <= thePath.size() && aNode != nullptr)
		{
			size_t anEnd = thePath.find('/', aBegin);
			if (anEnd == std::string::npos)
				anEnd = thePath.size();
			std::string aSegment = thePath.substr(aBegin, anEnd - aBegin);
			if (!aSegment.empty())
			{
				size_t anIndex;
				if (aNode->is_array() && SegmentIsIndex(aSegment, anIndex))
				{
					if (anIndex >= aNode->size())
						return nullptr;
					aNode = &(*aNode)[anIndex];
				}
				else if (aNode->is_object())
				{
					auto anItr = aNode->find(aSegment);
					if (anItr == aNode->end())
						return nullptr;
					aNode = &*anItr;
				}
				else
				{
					return nullptr;
				}
			}
			if (anEnd == thePath.size())
				break;
			aBegin = anEnd + 1;
		}
		return aNode;
	}

	Json& MakeNode(Json& theRoot, const std::string& thePath)
	{
		// 写路径只建对象（回写配置无数组需求）；段不存在则插入空对象。
		Json* aNode = &theRoot;
		size_t aBegin = 0;
		while (aBegin <= thePath.size())
		{
			size_t anEnd = thePath.find('/', aBegin);
			if (anEnd == std::string::npos)
				anEnd = thePath.size();
			std::string aSegment = thePath.substr(aBegin, anEnd - aBegin);
			if (!aSegment.empty())
				aNode = &((*aNode)[aSegment]);
			if (anEnd == thePath.size())
				break;
			aBegin = anEnd + 1;
		}
		return *aNode;
	}

	std::string ScalarToString(const Json& theNode)
	{
		if (theNode.is_string())
			return theNode.get<std::string>();
		if (theNode.is_boolean() || theNode.is_number())
			return theNode.dump();
		return std::string();
	}
}

JsonDoc::JsonDoc() : mImpl(new Impl) {}
JsonDoc::~JsonDoc() { delete mImpl; }

JsonDoc::JsonDoc(JsonDoc&& theOther) noexcept
	: mStatus(std::exchange(theOther.mStatus, LoadStatus::NotLoaded)),
	  mError(std::move(theOther.mError)), mImpl(theOther.mImpl)
{
	theOther.mError.clear();
	theOther.mImpl = new Impl;
}

JsonDoc& JsonDoc::operator=(JsonDoc&& theOther) noexcept
{
	if (this != &theOther)
	{
		delete mImpl;
		mStatus = std::exchange(theOther.mStatus, LoadStatus::NotLoaded);
		mError = std::move(theOther.mError);
		theOther.mError.clear();
		mImpl = theOther.mImpl;
		theOther.mImpl = new Impl;
	}
	return *this;
}

bool JsonDoc::LoadFile(const std::string& thePath)
{
	mError.clear();
	mStatus = LoadStatus::IoError;

	FILE* aFile = fopen(thePath.c_str(), "rb");
	if (aFile == nullptr)
		return false;

	std::string aText;
	char aBuffer[4096];
	size_t aRead;
	while ((aRead = fread(aBuffer, 1, sizeof(aBuffer), aFile)) > 0)
		aText.append(aBuffer, aRead);
	const bool aReadFailed = ferror(aFile) != 0;
	fclose(aFile);
	if (aReadFailed)
		return false;

	try
	{
		mImpl->mRoot = Json::parse(aText);
	}
	catch (const std::exception& anError)
	{
		mImpl->mRoot = Json::object();
		mError = anError.what();
		mStatus = LoadStatus::ParseError;
		return false;
	}

	if (!mImpl->mRoot.is_object() && !mImpl->mRoot.is_array())
	{
		// 顶层必须是对象/数组（配置文件形态）；标量顶层视作解析失败。
		mImpl->mRoot = Json::object();
		mError = "top-level value must be an object";
		mStatus = LoadStatus::ParseError;
		return false;
	}

	mStatus = LoadStatus::Loaded;
	return true;
}

JsonDoc::Type JsonDoc::GetType(const std::string& thePath) const
{
	const Json* aNode = FindNode(mImpl->mRoot, thePath);
	if (aNode == nullptr)
		return Type::Missing;
	if (aNode->is_null()) return Type::Null;
	if (aNode->is_boolean()) return Type::Bool;
	if (aNode->is_number()) return Type::Number;
	if (aNode->is_string()) return Type::String;
	if (aNode->is_array()) return Type::Array;
	if (aNode->is_object()) return Type::Object;
	return Type::Missing;
}

bool JsonDoc::Has(const std::string& thePath) const
{
	return FindNode(mImpl->mRoot, thePath) != nullptr;
}

bool JsonDoc::GetBool(const std::string& thePath, bool theDefault) const
{
	const Json* aNode = FindNode(mImpl->mRoot, thePath);
	if (aNode == nullptr)
		return theDefault;
	if (aNode->is_boolean())
		return aNode->get<bool>();
	if (aNode->is_number_unsigned())
		return aNode->get<uint64_t>() != 0;
	if (aNode->is_number())
		return aNode->get<double>() != 0.0;
	if (aNode->is_string())
	{
		// 沿袭 XML 文本语义：仅 "false"/"0" 关，其余（含 "true"/"1"）开。
		const std::string aText = aNode->get<std::string>();
		return !(aText == "false" || aText == "0");
	}
	return theDefault;
}

long long JsonDoc::GetInt(const std::string& thePath, long long theDefault) const
{
	const Json* aNode = FindNode(mImpl->mRoot, thePath);
	if (aNode == nullptr)
		return theDefault;
	if (aNode->is_number_unsigned())
	{
		const uint64_t aValue = aNode->get<uint64_t>();
		return aValue > (uint64_t)9223372036854775807ULL ? theDefault : (long long)aValue;
	}
	if (aNode->is_number_integer())
		return aNode->get<long long>();
	if (aNode->is_number_float())
		return (long long)aNode->get<double>();
	if (aNode->is_boolean())
		return aNode->get<bool>() ? 1 : 0;
	if (aNode->is_string())
		return atoll(aNode->get<std::string>().c_str());
	return theDefault;
}

double JsonDoc::GetFloat(const std::string& thePath, double theDefault) const
{
	const Json* aNode = FindNode(mImpl->mRoot, thePath);
	if (aNode == nullptr)
		return theDefault;
	if (aNode->is_number())
		return aNode->get<double>();
	if (aNode->is_boolean())
		return aNode->get<bool>() ? 1.0 : 0.0;
	if (aNode->is_string())
		return atof(aNode->get<std::string>().c_str());
	return theDefault;
}

std::string JsonDoc::GetString(const std::string& thePath, const std::string& theDefault) const
{
	const Json* aNode = FindNode(mImpl->mRoot, thePath);
	if (aNode == nullptr)
		return theDefault;
	std::string aText = ScalarToString(*aNode);
	return aText.empty() && !aNode->is_string() ? theDefault : aText;
}

size_t JsonDoc::GetArraySize(const std::string& thePath) const
{
	const Json* aNode = FindNode(mImpl->mRoot, thePath);
	return (aNode != nullptr && aNode->is_array()) ? aNode->size() : 0;
}

void JsonDoc::GetKeys(const std::string& thePath, std::vector<std::string>& theOutKeys) const
{
	theOutKeys.clear();
	const Json* aNode = FindNode(mImpl->mRoot, thePath);
	if (aNode == nullptr || !aNode->is_object())
		return;
	theOutKeys.reserve(aNode->size());
	for (auto anItr = aNode->begin(); anItr != aNode->end(); ++anItr)
		theOutKeys.push_back(anItr.key());
}

void JsonDoc::SetBool(const std::string& thePath, bool theValue)
{
	MakeNode(mImpl->mRoot, thePath) = theValue;
}

void JsonDoc::SetInt(const std::string& thePath, long long theValue)
{
	MakeNode(mImpl->mRoot, thePath) = theValue;
}

void JsonDoc::SetFloat(const std::string& thePath, double theValue)
{
	MakeNode(mImpl->mRoot, thePath) = theValue;
}

void JsonDoc::SetString(const std::string& thePath, const std::string& theValue)
{
	MakeNode(mImpl->mRoot, thePath) = theValue;
}

bool JsonDoc::SaveFile(const std::string& thePath) const
{
	std::string aText = mImpl->mRoot.dump(2, ' ', false);
	aText.push_back('\n');

	FILE* aFile = fopen(thePath.c_str(), "wb");
	if (aFile == nullptr)
		return false;
	const size_t aWritten = fwrite(aText.data(), 1, aText.size(), aFile);
	fclose(aFile);
	return aWritten == aText.size();
}
