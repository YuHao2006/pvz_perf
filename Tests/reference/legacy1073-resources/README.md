# 旧资源格式参考包

legacy1073-slim.pak64 用于旧格式资源审计，不参与当前游戏或资源构建。
当前发行资源由 assets 下的输入生成，输出位于 out/<组合>/Release。

原始清单记录 2896 个 ZIP 条目、251 个旧格式 compiled 定义。
文件没有加密或压缩；移除了旧舞王等不再使用的专用资源，
保留 Zombie_disco 仍然共享的 zombie_dancer__head.png。
具体删项和文件哈希见 legacy1073-slim.manifest.json。
清单中的旧绝对路径仅记录生成来源，不是当前路径配置。

从项目根目录运行旧格式审计：

```powershell
python tools/audit_pak64_semantics.py --trimmed Tests/reference/legacy1073-resources/legacy1073-slim.pak64
```

该审计可能另需其说明指定的独立旧格式对照输入。
重建此夹具必须显式提供完整旧格式源包，不能用当前数值资源包代替：

```text
python tools/build_legacy_slim_pak64.py <完整旧格式源包> <新输出路径>
```
