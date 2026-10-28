# 小基准复测与适用范围

核对56份夹具，55份完成两个独立进程运行；唯一未生成结果的是已退役CanFly/Jumper标志实验。
完成表示正常退出且未发现夹具自报的不一致，不等于给所有历史模型增加了新的正确性证明。

MSVC 14.51.36231 x64，LP14，用户控制11x；各夹具两个独立进程，串行测量。
历史算法模型不等于原版EXE；当前表声明提取也不等于当前完整业务函数。
历史夹具仍按原输入、下游桩和计时边界运行；只修复头文件路径，r3使用冻结历史枚举。

## 当前表声明：保持原夹具范围

单位ns/次；各列为一个进程内min-of-5。植物高度、阴影采用C(static)，不采用旧B栈物化形态。

| 表 | 历史最终值 | 本轮进程1 | 本轮进程2 | 原始输出 |
| --- | ---: | ---: | ---: | --- |
| kDamageRangeFlags | 6.89 | 6.89 | 6.88 | [记录](base-42_current_bench01_dmgflags/run-1.txt) |
| kFireProjectiles | 7.12 | 7.12 | 7.12 | [记录](base-43_current_bench02_fireproj/run-1.txt) |
| kFlowerPotAdjust | 8.96 | 8.95 | 8.96 | [记录](base-44_current_bench04_flowerpot/run-1.txt) |
| kSeedPacketDrawMetrics | 26.77 | 26.76 | 26.75 | [记录](base-45_current_bench05_packetdraw/run-1.txt) |
| kZombieImageOffsetFix | 9.53 | 9.42 | 9.42 | [记录](base-46_current_bench06_zimgoff/run-1.txt) |
| kWalkHeadPos | 14.66 | 14.65 | 14.61 | [记录](base-47_current_bench07_walkhead/run-1.txt) |
| kSeedTypeUpdates | 48.16 | 47.40 | 47.42 | [记录](base-48_current_bench08_seedupdate/run-1.txt) |
| kShadowParams | 59.93 | 59.73 | 59.73 | [记录](base-49_current_bench11_proshadow/run-1.txt) |
| kSeedCostOverrides | 32.87 | 32.61 | 32.47 | [记录](base-50_current_bench14_seedcost/run-1.txt) |
| kStoreItemCosts | 9.22 | 9.20 | 9.16 | [记录](base-51_current_bench15_storecost/run-1.txt) |
| kPlantHeightOffsets | 11.72 | 11.70 | 11.71 | [记录](extra-02_current_bench7_plantheight/run-1.txt) |
| kPlantShadow | 22.89 | 22.87 | 22.87 | [记录](extra-03_current_bench5_plantshadow/run-1.txt) |
| kZombatarPaletteRange | 8.67 | 8.67 | 8.68 | [记录](extra-04_current_bench13_ZombatarColors_SetColorMode/run-1.txt) |

表声明、生产源文件及夹具SHA256见manifest。参数选择和下游桩范围沿用旧夹具；不能据此宣称完整Draw/Update有相同耗时。

## 粒子名字：原112系统/222定义语料

每进程九轮AB/BA；表中为每侧九轮中位数。固定旧语料，未覆盖当前新增变体。
选取与历史台账相同的17个负载；额外探索负载仅保留在原始报告。

| 负载键 | 原机制（进程1） | ID/区间（进程1） | ID/区间（进程2） |
| --- | ---: | ---: | ---: |
| unnamed_tiny_1_10 | 32.233711 | 18.304576 | 18.289863 |
| unnamed_fast_tiny_1_10 | 24.211653 | 18.285556 | 18.261422 |
| named_exact_tiny_1_10 | 66.791919 | 19.340067 | 19.400903 |
| family_prefix_tiny_1_10 | 91.463870 | 18.346142 | 18.334378 |
| family_prefix_cached_tiny_1_10 | 49.982079 | 18.286738 | 18.304252 |
| unnamed_full_corpus | 35.422474 | 18.743225 | 18.755315 |
| unnamed_fast_full_corpus | 25.486717 | 18.716931 | 18.715123 |
| named_exact_full_corpus | 112.215273 | 22.743519 | 22.758295 |
| family_prefix_full_corpus | 120.786939 | 20.724689 | 20.729080 |
| family_gloom__own_system | 335.332702 | 45.831099 | 45.816269 |
| family_icetrap_own_system | 90.387070 | 25.565956 | 25.614866 |
| family_awardray_own_system | 569.126246 | 56.167511 | 56.368888 |
| family_doommushroom_own_system | 503.140327 | 47.196641 | 47.187511 |
| find_direct_tiny_1_10 | 44.917504 | 6.181267 | 6.168967 |
| find_direct_full_corpus | 69.579612 | 6.479399 | 6.473767 |
| find_fadeout_present_systems | 48.745432 | 5.976565 | 5.974640 |
| find_fadeout_full_corpus | 30.371945 | 5.946345 | 5.942804 |

[完整九轮报告](extra-05_bench_particle_emitter_names/reports-1/results.json)、[原始样本](extra-05_bench_particle_emitter_names/reports-1/samples.csv)。

## 历史夹具复现

以下仅复现旧模型。对象大小、计时字段或下游行为已经变化的，不能作为3.0新指标。

| 夹具 | 状态 | 范围 | 原始记录 |
| --- | --- | --- | --- |
| 00_bench01_dmgflags | 两进程完成 | 历史模型 | [文件](base-00_bench01_dmgflags/run-1.txt) |
| 01_bench02_fireproj | 两进程完成 | 历史模型 | [文件](base-01_bench02_fireproj/run-1.txt) |
| 02_bench03_shootctr | 两进程完成 | 历史模型 | [文件](base-02_bench03_shootctr/run-1.txt) |
| 03_bench04_flowerpot | 两进程完成 | 历史模型 | [文件](base-03_bench04_flowerpot/run-1.txt) |
| 04_bench05_packetdraw | 两进程完成 | 历史模型 | [文件](base-04_bench05_packetdraw/run-1.txt) |
| 05_bench06_zimgoff | 两进程完成 | 历史模型 | [文件](base-05_bench06_zimgoff/run-1.txt) |
| 06_bench07_walkhead | 两进程完成 | 历史模型 | [文件](base-06_bench07_walkhead/run-1.txt) |
| 07_bench08_seedupdate | 两进程完成 | 历史模型 | [文件](base-07_bench08_seedupdate/run-1.txt) |
| 08_bench09_zaction | 两进程完成 | 历史模型 | [文件](base-08_bench09_zaction/run-1.txt) |
| 09_bench10_prodraw | 两进程完成 | 历史模型 | [文件](base-09_bench10_prodraw/run-1.txt) |
| 10_bench11_proshadow | 两进程完成 | 历史模型 | [文件](base-10_bench11_proshadow/run-1.txt) |
| 11_bench12_proimmediate | 两进程完成 | 历史模型 | [文件](base-11_bench12_proimmediate/run-1.txt) |
| 12_bench13_dynamics | 两进程完成 | 历史模型 | [文件](base-12_bench13_dynamics/run-1.txt) |
| 13_bench14_seedcost | 两进程完成 | 历史模型 | [文件](base-13_bench14_seedcost/run-1.txt) |
| 14_bench15_storecost | 两进程完成 | 历史模型 | [文件](base-14_bench15_storecost/run-1.txt) |
| 15_bench16_falltime | 两进程完成 | 历史模型 | [文件](base-15_bench16_falltime/run-1.txt) |
| 16_bench1_seedpacket | 两进程完成 | 历史模型 | [文件](base-16_bench1_seedpacket/run-1.txt) |
| 17_bench2_potoffset | 两进程完成 | 历史模型 | [文件](base-17_bench2_potoffset/run-1.txt) |
| 18_bench4_coindraw | 两进程完成 | 历史模型 | [文件](base-18_bench4_coindraw/run-1.txt) |
| 19_bench5_plantshadow | 两进程完成 | 历史模型 | [文件](base-19_bench5_plantshadow/run-1.txt) |
| 20_bench7_plantheight | 两进程完成 | 历史模型 | [文件](base-20_bench7_plantheight/run-1.txt) |
| 21_bench8_fire | 两进程完成 | 历史模型 | [文件](base-21_bench8_fire/run-1.txt) |
| 22_bench02_Plant_DoSpecial | 两进程完成 | 历史模型 | [文件](base-22_bench02_Plant_DoSpecial/run-1.txt) |
| 23_bench07_Challenge_BeghouledPickSeed | 两进程完成 | 历史模型 | [文件](base-23_bench07_Challenge_BeghouledPickSeed/run-1.txt) |
| 24_bench08_Challenge_SquirrelFound | 两进程完成 | 历史模型 | [文件](base-24_bench08_Challenge_SquirrelFound/run-1.txt) |
| 25_bench09_ZenGarden_DrawPlantOverlay | 两进程完成 | 历史模型 | [文件](base-25_bench09_ZenGarden_DrawPlantOverlay/run-1.txt) |
| 26_bench11_ZombatarItems_DrawCategoryHighlight | 两进程完成 | 历史模型 | [文件](base-26_bench11_ZombatarItems_DrawCategoryHighlight/run-1.txt) |
| 27_bench13_ZombatarColors_SetColorMode | 两进程完成 | 历史模型 | [文件](base-27_bench13_ZombatarColors_SetColorMode/run-1.txt) |
| 30_bench_plant | 两进程完成 | 历史模型 | [文件](base-30_bench_plant/run-1.txt) |
| 31_bench_cellbucket | 两进程完成 | 历史模型 | [文件](base-31_bench_cellbucket/run-1.txt) |
| 32_bench_attachment | 两进程完成 | 历史模型 | [文件](base-32_bench_attachment/run-1.txt) |
| 33_bench_curve_dispatch | 两进程完成 | 历史模型 | [文件](base-33_bench_curve_dispatch/run-1.txt) |
| 34_bench_dispatch_duel | 两进程完成 | 历史模型 | [文件](base-34_bench_dispatch_duel/run-1.txt) |
| 35_bench_d_algebra | 两进程完成 | 历史模型 | [文件](base-35_bench_d_algebra/run-1.txt) |
| 36_bench_phase_query | 未产生有效新指标 | 历史模型 | [文件](base-36_bench_phase_query/build.txt) |
| 38_bench_reanim_trackwalk | 两进程完成 | 历史模型 | [文件](base-38_bench_reanim_trackwalk/run-1.txt) |
| 39_bench_zombie_rowscan | 两进程完成 | 历史模型 | [文件](base-39_bench_zombie_rowscan/run-1.txt) |
| 40_bench_image_variation | 两进程完成 | 历史模型 | [文件](base-40_bench_image_variation/run-1.txt) |
| 41_bench_sincos | 两进程完成 | 历史模型 | [文件](base-41_bench_sincos/run-1.txt) |
| 00_t16_cursor | 两进程完成 | 历史模型 | [文件](r3-00_t16_cursor/run-1.txt) |
| 00_b_zombie_events | 两进程完成 | 历史模型 | [文件](zombie-00_b_zombie_events/run-1.txt) |
| 00_bench_particle_roster | 两进程完成 | 历史模型 | [文件](roster-00_bench_particle_roster/run-1.txt) |

## 不替代的旧指标

- 已退役：IDT4/IDT5运行时行为解码器，保留旧数字，不测静态C++数据来替代。
- 已退役：旧kDrawParams全局投掷物纹理参数表；当前离线图集/UV路径不是同一测量范围。
- 已退役实验：CanFly/Jumper标志查询，当前无这些位，旧夹具编译失败保留证据，不向游戏补回死位。
- 固定DX12 DrawScreen已从归档恢复，两个实际游戏进程完成测量；[独立记录](../dx12-gpu-submission-20261029/frozen-summary.json)，不以Vulkan完整帧、flush/fence或GPU时间替代。
- reanim旧112B槽模型、粒子旧约160B槽模型、僵尸旧168B模型及附件trail混合只保留为旧算法复现。
- 曲线分发/除法模型仍为旧float形态，当前曲线使用double进度和纳秒输入，不登记为当前业务函数耗时。

本目录是历史夹具与表声明快照，不包含原版EXE机器码对拍。后续实际原版机器码／当前函数、真实结构及清理后商店表已经补测，见[完整补测报告](../production-small-benchmarks-20261029/README.md)。其中商店最终30槽价表在原31项输入夹具下为10.73／10.73ns，本页9.20／9.16ns保留为清理前快照。不同ABI、布局及输入域的指标分别登记，不相互替换。
