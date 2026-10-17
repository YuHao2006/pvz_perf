# 生产工具

本目录保存构建、资源编译、存档转换和发行打包工具。
性能工具及其夹具、运行脚本和分析脚本位于 Tests/performance。

| 工具 | 源码 | 主构建中的输出 |
| --- | --- | --- |
| reanim/particle 编译器 | resourceCompiler/src | out/<组合>/tools/resourceCompiler/build |
| DAT/DAT64 转换器 | saveConverter/src | out/<组合>/tools/saveConverter/build |
| 资源流水线 | resourcePipeline/src | out/<组合>/cache/resources |

reanimc 和存档转换器已是 C++；资源清单、字体编译及打包的 Python
实现暂时保留。主 CMake 自动调用流水线，生成头文件和 C++ 文件回到
pvzPerf 源码目录；数值定义和 main.pak64 进入缓存，再部署到 Release。
内置 shader 由图形后端独立编译到包外 shaders 目录。

资源原始输入位于 assets/definitions 和 assets/runtime，
不使用相邻 openPvz 仓库或本机原版安装目录作为正常构建输入。
历史算法审计工具所需的旧对照输入仍由其显式参数和说明定义。
