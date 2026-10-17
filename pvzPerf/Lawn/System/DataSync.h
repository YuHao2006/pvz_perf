#pragma once
#include "SexyAppFramework/Common.h"

class DataReader
{
protected:
	FILE*					mFile;			//+0x4
	char*					mData;			//+0x8
	unsigned int			mDataLen;		//+0xC
	unsigned int			mDataPos;		//+0x10
	bool					mOwnData;		//+0x14

public:
	DataReader();
	DataReader(const DataReader&) = delete;
	DataReader& operator=(const DataReader&) = delete;
	~DataReader();

	bool					OpenFile(const std::string& theFileName);
	void					OpenMemory(const void* theData, unsigned int theDataLen, bool takeOwnership);
	void					Close();
	void					ReadBytes(void* theMem, unsigned int theNumBytes);
	void					Rewind(unsigned int theNumBytes);
	unsigned int			ReadLong();
	unsigned short			ReadShort();
	unsigned char			ReadByte();
	bool					ReadBool();
	float					ReadFloat();
	double					ReadDouble();
	void					ReadString(SexyString& theStr);
};
class DataReaderException : public std::exception
{
};

class DataWriter
{
protected:
	FILE*					mFile;
	std::vector<char>		mData;
	bool					mMemoryActive;

public:
	DataWriter();
	DataWriter(const DataWriter&) = delete;
	DataWriter& operator=(const DataWriter&) = delete;
	~DataWriter();

	bool					OpenFile(const std::string& theFileName);
	void					OpenMemory(unsigned int theReserveAmount = 0x20);
	void					Close();
	inline bool				WriteToFile(const std::string& theFileName);
	void					WriteBytes(const void* theData, unsigned int theDataLen);
	void					WriteLong(unsigned int theLong);
	void					WriteShort(unsigned short theShort);
	void					WriteByte(unsigned char theChar);
	void					WriteBool(bool theBool);
	void					WriteFloat(float theFloat);
	void					WriteDouble(double theDouble);
	void					WriteString(const SexyString& theStr);
	inline unsigned int	GetPos();
	inline void				SetLong(unsigned int, unsigned int) { /* 未找到 */ }
	inline void				SetShort(unsigned int, unsigned int) { /* 未找到 */ }
	inline void				SetByte(unsigned int, unsigned int) { /* 未找到 */ }
	inline void*			GetDataPtr() { return mData.data(); }
	inline int				GetDataLen() { return static_cast<int>(mData.size()); }
};

typedef std::map<void*, int> PointerToIntMap;
typedef std::map<int, void*> IntToPointerMap;

class DataSync
{
public:
	DataReader*				mReader;
	DataWriter*				mWriter;
	int						mVersion;

protected:
	PointerToIntMap			mPointerToIntMap;
	IntToPointerMap			mIntToPointerMap;
	std::vector<void**>		mPointerSyncList;
	int						mCurPointerIndex;

protected:
	void ResetPointerTable();
	void Reset();

public:
	DataSync(DataReader& theReader);
	DataSync(DataWriter& theWriter);
	~DataSync();

	inline void				SyncPointers() { /* 未找到 */ }
	void					SyncBytes(void* theData, unsigned int theDataLen);
	void					SyncLong(char& theNum);
	void					SyncLong(short& theNum);
	void					SyncLong(long& theNum);
	void					SyncLong(unsigned char& theNum);
	void					SyncLong(unsigned short& theNum);
	void					SyncLong(unsigned int& theNum);
	void					SyncLong(int& theNum);
	void					SyncSLong(char& theNum);
	void					SyncSLong(short& theNum);
	void					SyncSLong(long& theNum);
	void					SyncSLong(unsigned char& theNum);
	void					SyncSLong(unsigned short& theNum);
	void					SyncSLong(unsigned int& theNum);
	void					SyncSLong(int& theNum);
	void					SyncShort(char& theNum);
	void					SyncShort(short& theNum);
	void					SyncShort(long& theNum);
	void					SyncShort(unsigned char& theNum);
	void					SyncShort(unsigned short& theNum);
	void					SyncShort(unsigned int& theNum);
	void					SyncShort(int& theNum);
	void					SyncSShort(char& theNum);
	void					SyncSShort(short& theNum);
	void					SyncSShort(long& theNum);
	void					SyncSShort(unsigned char& theNum);
	void					SyncSShort(unsigned short& theNum);
	void					SyncSShort(unsigned int& theNum);
	void					SyncSShort(int& theNum);
	void					SyncByte(char& theChar);
	void					SyncByte(short& theChar);
	void					SyncByte(long& theChar);
	void					SyncByte(unsigned char& theChar);
	void					SyncByte(unsigned short& theChar);
	void					SyncByte(unsigned int& theChar);
	void					SyncByte(int& theChar);
	void					SyncSByte(char& theChar);
	void					SyncSByte(short& theChar);
	void					SyncSByte(long& theChar);
	void					SyncSByte(unsigned char& theChar);
	void					SyncSByte(unsigned short& theChar);
	void					SyncSByte(unsigned int& theChar);
	void					SyncSByte(int& theChar);
	void					SyncBool(bool& theBool);
	void					SyncFloat(float& theFloat);
	void					SyncDouble(double& theDouble);
	void					SyncString(SexyString& theStr);
	inline void				SyncPointer(void**) { /* 未找到 */ }
	inline void				RegisterPointer(void*) { /* 未找到 */ }
};

