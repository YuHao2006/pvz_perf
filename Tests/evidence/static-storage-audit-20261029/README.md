# 只读局部表存储期审计

扫描pvzPerf中468份cpp/h/mm/inl（排除生成代码、shader和测试），并检查资源编译器相关源码。词法脚本只负责候选召回，不能单独证明全部语义；之后区分命名空间常量、运行时依赖、可变缓冲和真正固定表。

本轮50张只读局部表改为static constexpr，清单覆盖21个源文件。ScaleEffectFormats.h的IsScaleEffectFormat实现移入ScaleEffectCompiler.cpp，头文件只保留声明。当前Plant的射手/生产/保龄球表原已static，本轮未重复修改。

排除运行时坐标/颜色/UV、GPU图像与描述符、实例按钮指针、按入参形成的序列化字节、可变统计数组和捕获引用。命名空间constexpr已有静态存储期；不盲目修改。没有变更实例字段、访问器或存档格式。

验证：Windows Vulkan Release/LTO完整构建成功；Vulkan原生renderer检查PASS且零validation errors；DX12 renderer检查PASS且debug errors=0；Win7/OpenGL目标以匹配MSVC14.44头文件/库构建，原生检查failed=0。它在当前Windows/GPU运行，不代表实机Win7认证。Mac/Metal、Linux clipboard和Android/OpenAL分支仅静态审查，未作交叉平台构建成功声明。TimeCounterSaveTests新增伴舞多步长/旧计数回绕检查，原生测试PASS。

OpenGL/Vulkan资源包SHA256均为5bdd71c632d945304ae3752bfed61941bb8c7e4351e616e1ff6fbceab1431545。具体源码哈希与测试输出见本目录。构建日志留在系统TEMP，未放入out。此审计只证明存储期与功能验证，不为每张表虚构运行速度收益。
