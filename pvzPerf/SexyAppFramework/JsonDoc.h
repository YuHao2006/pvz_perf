#pragma once

#include <string>
#include <vector>

// JSON 配置文件访问器（settings.json / scale.json）。
//
// nlohmann/json 是单头文件库，若在每个使用点直接展开，每个 obj 都会各带
// 一份解释器代码（多份代码问题）。纪律：全工程只有 JsonDoc.cpp 一个 TU
// 包含 <nlohmann/json.hpp>，其余代码只包含本头；JsonDoc 本体是 pimpl，
// nlohmann 类型不进头文件，链接期 nlohmann 代码只存在于 JsonDoc.obj。
class JsonDoc
{
public:
	enum class Type
	{
		Missing,	// 路径不存在
		Null,
		Bool,
		Number,
		String,
		Array,
		Object
	};

	enum class LoadStatus
	{
		Loaded,			// 成功
		NotLoaded,		// LoadFile 尚未成功调用过
		IoError,		// 打开/读取失败（含文件不存在——沿袭"无配置=默认"语义）
		ParseError		// 文件在但 JSON 损坏（mError 带行列诊断）
	};

	JsonDoc();
	~JsonDoc();
	JsonDoc(const JsonDoc&) = delete;
	JsonDoc& operator=(const JsonDoc&) = delete;
	JsonDoc(JsonDoc&&) noexcept;
	JsonDoc& operator=(JsonDoc&&) noexcept;

	LoadStatus mStatus = LoadStatus::NotLoaded;
	std::string mError;

	// 读入并解析整个文件。失败返回 false，细节看 mStatus/mError。
	bool LoadFile(const std::string& thePath);

	// 路径访问：'/' 分段，纯数字段 = 数组下标，空串 = 根。
	// 读取族宽松（沿袭 atoi/atof 时代容错）：缺失/类型不符返回 theDefault，
	// 字符串值按 C 传统解析出数值，数值/布尔也可读成字符串（序列化形式）。
	Type GetType(const std::string& thePath) const;
	bool Has(const std::string& thePath) const;
	bool GetBool(const std::string& thePath, bool theDefault) const;
	long long GetInt(const std::string& thePath, long long theDefault) const;
	double GetFloat(const std::string& thePath, double theDefault) const;
	std::string GetString(const std::string& thePath, const std::string& theDefault) const;
	size_t GetArraySize(const std::string& thePath) const;		// 非数组返回 0
	void GetKeys(const std::string& thePath, std::vector<std::string>& theOutKeys) const;	// 非对象清空

	// 写入（settings.json 回写用）。中间路径按对象创建；ordered_json 保插入序。
	void SetBool(const std::string& thePath, bool theValue);
	void SetInt(const std::string& thePath, long long theValue);
	void SetFloat(const std::string& thePath, double theValue);
	void SetString(const std::string& thePath, const std::string& theValue);
	bool SaveFile(const std::string& thePath) const;	// 2 空格缩进 + 末尾换行

private:
	struct Impl;
	Impl* mImpl;
};
