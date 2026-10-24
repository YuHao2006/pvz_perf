# 原版 1073 首次教学的启动与持续方式

查证日期：2026-10-24。证据直接来自本地 Windows x86 原版可执行文件，
没有启动游戏或操作游戏窗口。

文件：`C:/UserProgram/Plants_Vs_Zombies_V1.2.0.1073_EN/PlantsVsZombies.exe`

SHA256：`5f650f52d12751e08b63e590edb0d9b9f09d087cea900baa0eb39e4af8eda251`

## 启动条件

原版固定 100Hz 战斗更新，在关卡战斗更新中将主计数器加一：

```asm
004183e4: mov edi, 1
004183e9: add dword ptr [esi + 0x5580], edi
```

同一次更新的后半部分只在主计数器等于 1 时进入首次教学逻辑：

```asm
00418455: cmp dword ptr [esi + 0x5580], edi
0041845b: jne 0x4185de
```

随后检查冒险模式、首次通关状态，以及关卡编号：

```asm
00418484: cmp dword ptr [esi + 0x5568], edi
0041848a: jne 0x418498
0041848c: push edi
0041848d: push esi
0041848e: call 0x4175d0
...
004184b9: cmp dword ptr [esi + 0x5568], 2
004184c0: jne 0x4185de
004184c6: push 5
004184c8: push esi
004184c9: call 0x4175d0
```

这里 `esi + 0x5580` 是该版本原版二进制的主计数器，
`esi + 0x5568` 是关卡编号；不能把其他版本源码中的成员偏移注释直接套用。
第一关进入教学状态 1，第二关进入教学状态 5。两个关卡共用“主计数器等于 1”的外层条件，
不是第二关等于 2，也没有 100 次更新或 1 秒的启动窗口。

## 第一关提示

教学状态 1 的设置逻辑从 `0x4175d0` 开始。没有已种植物时，
它显示箭头和选择种子卡片提示，并使用样式 2（TutorialLevel1Stay）。

```asm
0041771a: mov eax, 0x2710
0041771f: mov dword ptr [esi + 0x8c], 2
00417733: mov dword ptr [esi + 0x84], eax
00417739: mov dword ptr [esi + 0x88], eax
```

`0x2710 = 10000` 在这里是常驻提示标记，不能乘以 10ms 当作 100 秒自动关闭。
原版消息更新明确跳过这个值的倒计时：

```asm
0045cdba: mov eax, dword ptr [esi + 0x88]
0045cdc0: cmp eax, 0x2710
0045cdc5: jge 0x45ce1e
0045cdc7: cmp eax, ebx
0045cdc9: jle 0x45ce1e
0045cdcb: dec eax
0045cdcc: mov dword ptr [esi + 0x88], eax
```

教学通过玩家选择卡片、种植等操作推进，提示由状态变化清除或替换，
并非从启动起固定显示 1 秒。

## 第二关初始提示

第二关启动时设置样式 3（TutorialLevel2）和 500 个旧时间单位：

```asm
0041858a: mov eax, 0x1f4
0041858f: mov dword ptr [ebx + 0x8c], 3
004185a3: mov dword ptr [ebx + 0x88], eax
004185a9: mov dword ptr [ebx + 0x84], eax
...
004185d4: mov dword ptr [esi + 0x55a4], 0x1f4
```

500 个固定 10ms 单位等于 5 秒。该文字还可能被教学推进提前替换；
文字时长、教学状态时长、首次启动时刻是不同概念。

## 当前实现的选择

按用户确认的行为语义，当前运行时以裸纳秒主时钟工作，启动条件为
`mLevelTimeNs > 0`，并要求教学状态尚未开始。
现有已存档的 `mTutorialState` 保证单次启动，没有新增触发标志。

这是对可变步长的明确适配：保留首次战斗更新启动的语义，不额外等待 10ms。
原版自身是固定步长的 `counter == 1`，不能声称它原本就使用纳秒阈值。
此前临时添加的 1 秒上限没有原版依据，已撤除。
