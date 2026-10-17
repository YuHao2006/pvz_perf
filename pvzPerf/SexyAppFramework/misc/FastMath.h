#pragma once

// 快速三角（2026-10-07 自 TodLib/TodCommon 下放共享层——分层整理第二批：
// MemoryImage（Framework）与 TodCommon（TodLib）双消费，物理位置随最低
// 消费层。实现见 misc/FastMath.cpp，逐句自 TodCommon.cpp 迁移零漂移）。
// 无分支无域缩减：调用方保证入参 [-π,π]（角度类天然满足）；越界域请先
// FoldPi。不得用于：需要逐位对拍 CRT 的场景（对拍/存档哈希类调用点保持
// sinf/cosf）。
float FastSin(float theRadians);
float FastCos(float theRadians);
