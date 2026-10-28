# 精确根运动：固定轨道与周期内相位优化

MSVC14.51 x64 Release /GL /LTCG，LP14/0x4000，11x由用户控制、未独立读回。所有构建及原生回归完成后，串行before—after—after—before，每进程四种定义、每内核一次预热和五轮各200万更新。早期与构建重叠的试跑已覆盖，不进入结果。报告min-of-5；未重测整局FPS、GPU或Android性能。

before为修改前真实游戏对象；after为修改后真实游戏对象。两侧源/编译/EXE哈希见build-manifest。所有(定义,内核)的checksum跨四进程一致；全部60秒多步长accuracy.csv逐字节一致。

## 原理

1. 在.cpp利用生成MPHF常量求出144项_ground下标表，576字节、无动态初始化；缺失为-1。Zombie可用性检查直接读表，RootMotion固定_ground查询也直接定位。其他轨道及错误语义仍由通用查询处理。没有新增实例字段、存档字段或运行期缓存。
2. ConsumeTimeAt已按周期起点重绑正向时间基准。查询时间仍在本周期时，phase=now-start精确成立，跳过周期商余；循环次数保留原锚点。不在该区间、倒放、暂停或非零初始相位按原精确规则处理。

current_root_method保留跨越大量周期的通用查询。current_period_local把查询限制到一周期内，模拟常见锚点；夹具额外的now%period在两侧都计时，因此这里不是纯函数最小成本或真实场景占比。旧速度累加内核仍为重建的原算术，非原版EXE直接调用。current_root_resolved只是手工预解析的诊断内核，不是实际生产接口。

## 验证

after在计时前独立线性扫描全部144种定义，核对_ground首见下标；1701个样本逐项比较实际SamplePlaybackAt与原通用整数求值器，覆盖正向/反向/暂停、普通/full-last循环/hold、起点偏移、负时间差、端点和跨多周期。四种定义的公开RootMotion与预解析求值一致；100/120/200/240/1000Hz同一60秒位置逐位相同。

真实游戏链接回归四场景通过，含原速根运动、裁限根运动、变速连续、事件分区、僵尸传送/动作重绑、全定义释放重载。Vulkan Release/LTO与reanim_clock、time_counter_save通过。资源包保持5bdd71c632d945304ae3752bfed61941bb8c7e4351e616e1ff6fbceab1431545，存档仍v3.6。运行期实现都在.cpp，.h只新增数据声明。

当前比旧速度累加仍贵；优化减少重复定位与常规周期除法，不把精确求值描述为比积分更快。所有原始轮次包含在CSV中，不能由微基准推算整局收益。
