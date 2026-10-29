#pragma once
#include <charconv>
#include <string_view>
#include <type_traits>

#include "ConstEnums.h"
#include "graphics/Graphics.h"
#include "widget//EditWidget.h"

using namespace Sexy;
// using namespace std;

class Board;
class LawnStoneButton;
class NewLawnButton;
namespace Sexy
{
	class Dialog;
	class Checkbox;
	class DialogButton;
	class CheckboxListener;
}

class LawnEditWidget : public EditWidget
{
public:
	Dialog*					mDialog;

public:
	LawnEditWidget(int theId, EditListener* theListener, Dialog* theDialog);
	~LawnEditWidget();

	virtual void			KeyDown(KeyCode theKey);
};

// ====================================================================================================
// ★ 常用逻辑判断
// ====================================================================================================
/*inline*/ bool				ModInRange(int theNumber, int theMod, int theRange = 0);
/*inline*/ bool				GridInRange(int x1, int y1, int x2, int y2, int theRangeX = 1, int theRangeY = 1);

// ====================================================================================================
// ★ 动画、特效与绘制相关
// ====================================================================================================
/*inline*/ void				TileImageHorizontally(Graphics* g, Image* theImage, int theX, int theY, int theWidth);
/*inline*/ void				TileImageVertically(Graphics* g, Image* theImage, int theX, int theY, int theHeight);

// ====================================================================================================
// ★ 控件
// ====================================================================================================
Checkbox*					MakeNewCheckbox(int theId, CheckboxListener* theListener, bool theDefault);
LawnEditWidget*				CreateEditWidget(int theId, EditListener* theListener, Dialog* theDialog);
void						DrawEditBox(Graphics* g, EditWidget* theWidget);

// ====================================================================================================
// ★ 其他
// ====================================================================================================
std::string					GetSavedGameName(GameMode theGameMode, int theProfileId);
int							GetCurrentDaysSince2000();

// ====================================================================================================
// ★ 纯整型格式化助手（C++23 第一批·条目9）
// std::to_chars 直填缓冲：无 locale、无格式串解析；返回 string_view 喂 SSO SexyString，
// 输出与 StrFormat(("%d"), v) 逐字节等价（十进制最小表示）。
// ====================================================================================================
template <typename T>
    requires std::is_integral_v<T>
inline std::string_view FormatInt(char (&theBuf)[16], T theValue)
{
	static_assert(sizeof(T) <= 4, "FormatInt 缓冲 16 字节，仅服务 32 位以内整型站点");
	auto aResult = std::to_chars(theBuf, theBuf + sizeof(theBuf), theValue);
	return { theBuf, aResult.ptr };
}

