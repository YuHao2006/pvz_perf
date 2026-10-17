# 整理范围外的观察

Linux GCC/LTO 在 pvzPerf/Lawn/Zombie.cpp:10736 报告 aTrackName
可能未初始化：Boss 召唤分支只为 mTargetRow < 5 赋值，其他行在
未启用 DO_FIX_BUGS 时依赖 TOD_ASSERT(false)，随后继续使用该变量。
本轮未修改这段游戏逻辑。需另行核实 Boss 场景的合法行契约，
不能仅根据警告为其添加回退动画。

Linux 还保留既有 Vulkan 聚合初始化和旧分发表的编译警告。
三个组合构建均 exit=0；这不代表已经完成实玩、显存或 FPS 验收。

旧 tools/audit_1073_render_semantics.py 已适配源码目录，但仍有九项
断言或函数定位失败，详见 source-layout-render-audit.log。
其中 RGB_to_HSL 已不在 C++ 中，相关颜色计算位于 shader；
其他刷新次数、UI 常量及分配器断言仍需分别核实，不能仅据文本不匹配判定
当前游戏行为错误，也不能把本次构建和 131 项单元测试通过说成全门禁通过。
