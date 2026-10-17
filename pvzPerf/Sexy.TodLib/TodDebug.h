#pragma once

#ifndef SEXY_FORMAT_ATTRIBUTE
#if defined(__GNUC__) || defined(__clang__)
#define SEXY_FORMAT_ATTRIBUTE(theFormatIndex, theFirstArgIndex) \
	__attribute__((format(printf, theFormatIndex, theFirstArgIndex)))
#else
#define SEXY_FORMAT_ATTRIBUTE(theFormatIndex, theFirstArgIndex)
#endif
#endif

class TodHesitationBracket
{
public:
	char			mMessage[256];
	int				mBracketStartTime;

public:
	TodHesitationBracket(const char* /*theFormat*/, ...) { ; }
	~TodHesitationBracket() { ; }

	inline void		EndBracket() { ; }
};

void				TodLog(const char* theFormat, ...) SEXY_FORMAT_ATTRIBUTE(1, 2);
void				TodTrace(const char* theFormat, ...) SEXY_FORMAT_ATTRIBUTE(1, 2);
void				TodTraceMemory();
void				TodTraceAndLog(const char* theFormat, ...) SEXY_FORMAT_ATTRIBUTE(1, 2);
void				TodTraceWithoutSpamming(const char* theFormat, ...) SEXY_FORMAT_ATTRIBUTE(1, 2);
void				TodHesitationTrace(...);
void				TodAssertFailed(const char* theCondition, const char* theFile, int theLine, const char* theMsg = "", ...) SEXY_FORMAT_ATTRIBUTE(4, 5);
/*inline*/ void		TodErrorMessageBox(const char* theMessage, const char* theTitle);

/*inline*/ void*	TodMalloc(int theSize);
/*inline*/ void	TodFree(void* theBlock);
void				TodAssertInitForApp();
void				TodAssertBreakIfDebuggerPresent();



#ifdef _DEBUG
#define TOD_ASSERT(condition, ...) { \
if (!bool(condition)) { TodAssertFailed(""#condition, __FILE__, __LINE__, ##__VA_ARGS__); \
TodAssertBreakIfDebuggerPresent(); \
TodTraceMemory(); }\
}
#else
#define TOD_ASSERT(condition, ...)
#endif

