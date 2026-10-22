#include "SexyApp.h"

//#include "..\Crypt\RegKey.h"
#include "misc/SEHCatcher.h"
#include <time.h>
#include <fstream>

using namespace Sexy;

namespace Sexy
{
// 命名污染审计：仅本 TU 使用，声明自对应头文件下沉（内部链接）。
static SexyApp* gSexyApp = NULL;
}

namespace
{
// Groups of 80-byte data
const char DYNAMIC_DATA_BLOCK[400] = 
	"DYN00000PACPOPPOPCAPPACPOPPOPCAPBUILDINFOMARKERPACPOPPOPCAPPACPOPPOPCAPXXXXXXXXX"
	"00000000PACPOPPOPCAPPACPOPPOPCAPBUILDINFOMARKERPACPOPPOPCAPPACPOPPOPCAPXXXXXXXXX";
									
const char* BUILD_INFO_MARKER		= DYNAMIC_DATA_BLOCK + 80;
const char* SIGNATURE_CODE_MARKER	= DYNAMIC_DATA_BLOCK + 80*2;
const char* BETA_ID_MARKER			= DYNAMIC_DATA_BLOCK + 80*3;
}  // namespace

SexyApp::SexyApp()
{
	gSexyApp = this;

	mTimesPlayed = 0;
	mTimesExecuted = 0;
	mTimedOut = false;

	mDownloadId = 0;
	mSkipAd = false;
	mDontUpdate = false;
	mLastVerCheckQueryTime = 0;

	mDemoPrefix = "popcap";
	mDemoFileName = mDemoPrefix + ".dmo";	
	mCompanyName = "PopCap";

	mBetaValidate = false;	

	char aStr[9] = {0};
	strncpy(aStr, BUILD_INFO_MARKER, 8);
	mBuildNum = atoi(aStr);

	if (mBuildNum != 0)
		mBuildDate = BUILD_INFO_MARKER + 8;
}

SexyApp::~SexyApp()
{
}

/*
bool SexyApp::Validate(const std::string& theUserName, const std::string& theRegCode)
{
	BigInt n("42BF94023BBA6D040C8B81D9");
	BigInt e("11");

	unsigned int i;
	std::string aDataString;
	bool space = false;	
	for (i = 0; i < theUserName.size(); i++)
	{
		if (theUserName[i] == ' ')
		{
			if (aDataString.length() > 0)
				space = true;
		}
		else
		{
			if (space)
			{
				aDataString += " ";
				space = false;
			}

			char aChar = theUserName[i];
			for (int j = 0; gRegKeyTranslationTable[j][0] != 0; j++)
				if (gRegKeyTranslationTable[j][0] == aChar)
					aChar = gRegKeyTranslationTable[j][1];

			aDataString += toupper(aChar);
		}
	}

	std::string aProduct;
	aProduct = mProdName;
	for (i = 0; i < aProduct.length(); i++)
		aProduct[i] = toupper(aProduct[i]);

	aDataString += "\n";
	aDataString += aProduct;
	BigInt aHash = HashString(aDataString, 94);	
	
	BigInt aSignature = KeyToInt(theRegCode);
	BigInt aHashTest = aSignature.ModPow(e, n);

	return aHashTest == aHash;
}
*/

void SexyApp::ReadFromRegistry()
{
	SexyAppBase::ReadFromRegistry();

	// ScreenMode belongs to the original executable, where fullscreen was the
	// normal startup mode.  This 64-bit port must always create its first window
	// without changing the desktop display mode.  A later, explicit in-game
	// fullscreen request is still handled by SwitchScreenMode.
	mIsWindowed = true;
	mForceFullscreen = false;

	// No registry / popcinfo.dat: the port is fully self-contained.
	mTimesPlayed = 0;
	mTimesExecuted = 0;

	mDontUpdate = false;

}
void SexyApp::WriteToRegistry()
{
	SexyAppBase::WriteToRegistry();
	// No registry / popcinfo.dat writes; settings.json (SexyAppBase) covers
	// everything this port persists.
}

/*
bool SexyApp::CheckSignature(const Buffer& theBuffer, const std::string& theFileName)
{
#ifdef _DEBUG
	// Don't check signatures on debug version because it's annoying and the build number
	//  will probably be 0 anyway
	return true;
#endif

	if (mSkipSignatureChecks)
		return true;

	char aSigStr[25];

	FILE* aFP = fopen((theFileName + ".sig").c_str(), "rb");
	if (aFP == NULL)
		return false;

	fread(aSigStr, 1, 24, aFP);
	aSigStr[24] = 0;

	fclose(aFP);

	char* aFileData = new char[theBuffer.GetDataLen()+4];
	int aFileDataPos = 0;
	
	char aStr[9] = {0};
	strncpy(aStr, SIGNATURE_CODE_MARKER, 8);
	int aSignatureCode = atoi(aStr);

	aFileData[aFileDataPos++] = (aSignatureCode & 0xFF);
	aFileData[aFileDataPos++] = ((aSignatureCode >> 8) & 0xFF);
	aFileData[aFileDataPos++] = ((aSignatureCode >> 16) & 0xFF);
	aFileData[aFileDataPos++] = ((aSignatureCode >> 24) & 0xFF);

	theBuffer.SeekFront();
	while (!theBuffer.AtEnd())
	{
		unsigned char c = theBuffer.ReadByte();
		fread(&c, 1, 1, aFP);
		if (!::isspace(c))
			aFileData[aFileDataPos++] = c;
	}	

	// Public RSA stuff
	BigInt n("D99BC76AB7B2578738E606F7");
	BigInt e("11");
			
	BigInt aHash = HashData(aFileData, aFileDataPos, 94);
	delete aFileData;
	
	BigInt aSignature(aSigStr);
	BigInt aHashTest = aSignature.ModPow(e, n);

	return aHashTest == aHash;
}
*/

void SexyApp::PreTerminate()
{
}

void SexyApp::HandleCmdLineParam(const std::string& theParamName, const std::string& theParamValue)
{
	if (theParamName == "-version")
	{
		// Just print version info and then quit
		
		std::string aVersionString = 
			"Product: " + mProdName + "\r\n" +
			"Version: " + mProductVersion + "\r\n" +
			"Build Num: " + StrFormat("%d", mBuildNum) + "\r\n" +
			"Build Date: " + mBuildDate;

		MsgBox(aVersionString, "Version Info", MB_ICONINFORMATION | MB_OK);
		DoExit(0);
	}
	else
		SexyAppBase::HandleCmdLineParam(theParamName, theParamValue);
}

std::string SexyApp::GetGameSEHInfo()
{
	char aGamesPlayedStr[16];
	sprintf(aGamesPlayedStr, "%d", mTimesPlayed);

	std::string anInfoString = SexyAppBase::GetGameSEHInfo() + 
		"Times Played: " + std::string(aGamesPlayedStr) + "\r\n" +
		"Build Num: " + StrFormat("%d", mBuildNum) + "\r\n" +
		"Build Date: " + mBuildDate + "\r\n";

	return anInfoString;
}

void SexyApp::PreDisplayHook()
{
}

void SexyApp::InitPropertiesHook()
{
	// Legacy does not load PopCap's optional partner.xml layer.  It carried
	// partner branding/registration metadata and made startup depend on
	// partner_logo.jpg even though this port never displays that branding.
	// Keep the port self-contained and use the product defaults initialized by
	// LawnApp.
	mIsWindowed = true;
		
}

void SexyApp::Init()
{
	SEHCatcher::mCrashMessage =
		L"程序发生错误。诊断信息已保存到程序目录的 log\\crash.txt。";

	SexyAppBase::Init();

	if (mIsScreenSaver)
		mSkipAd = true;	

	mTimesExecuted++;
}

void SexyApp::UpdateFrames()
{
	SexyAppBase::UpdateFrames();
}

