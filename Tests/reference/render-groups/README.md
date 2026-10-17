# 渲染分组源码对照

source-baseline.tar.gz 是引入渲染分组前的项目源码快照，
不是原版 1073 的反编译源码，也不是当前项目的性能基线。
tools/audit_1073_render_semantics.py 使用它核对历史函数结构。

- 原文件名：legacy-pre-render-group-refactor-20260824.tar.gz。
- 源检查点：7b67e7aa06911e7e29d84cbe6c35e84eaa30c0e4。
- 大小：7,469,090 字节。
- SHA256：54CAEFBDCEBDB18678B1DDB722FE4268893F800DCE8A314F12C90FE9565B4DBA。

该历史文本审计仍有部分断言和当前实现不匹配，不能仅凭旧文本未匹配
判定游戏行为回归，也不能将构建通过等同于它全部通过。
