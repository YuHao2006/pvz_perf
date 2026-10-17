#pragma once
#include "SexyAppBase.h"

namespace Sexy
{

class SexyApp : public SexyAppBase
{
public:	
	std::string				mVariation;
	unsigned int			mDownloadId;
	unsigned int			mLastVerCheckQueryTime;
	bool					mSkipAd;
	bool					mDontUpdate;	

	int						mBuildNum;
	std::string				mBuildDate;

	std::string				mUserName;	

	int						mTimesPlayed;
	int						mTimesExecuted;
	bool					mTimedOut;

public:
	virtual void			UpdateFrames();

	virtual void			WriteToRegistry();
	virtual void			ReadFromRegistry();	

//	virtual bool			CheckSignature(const Buffer& theBuffer, const std::string& theFileName);
	
public:
	SexyApp();
	virtual ~SexyApp();

//	bool					Validate(const std::string& theUserName, const std::string& theRegCode);

	virtual void			PreDisplayHook();
	virtual void			InitPropertiesHook();
	virtual void			Init();
	virtual void			PreTerminate();

	virtual void			HandleCmdLineParam(const std::string& theParamName, const std::string& theParamValue);
	virtual std::string		GetGameSEHInfo();

};


};
