// Compile as MSVC x86 with /d1reportSingleClassLayout<ClassName> to audit
// the native layouts embedded verbatim in 1.2.0.1073 level saves.
#include "Lawn/Board.h"
#include "Lawn/Challenge.h"
#include "Lawn/CursorObject.h"
#include "Lawn/MessageWidget.h"
#include "Lawn/SeedPacket.h"
#include "Lawn/System/Music.h"
#include "Sexy.TodLib/Attachment.h"
#include "Sexy.TodLib/Reanimator.h"
#include "Sexy.TodLib/TodParticle.h"
// Trail.h 已随 Trail 系统整体退役（2026-09 删除验证运动阶段 1）；其 1073 布局
// 常量保留在 Lawn/System/LevelSaveFormat.h 与 dat64 转换器中。

int main()
{
	return 0;
}
