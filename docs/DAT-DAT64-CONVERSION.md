# 存档转换与兼容性

v4.0.0 游戏当前直接读写 **DAT64 v5.1：major 5 / minor 1 / schema `0x00010747`**。用户摘要 users.dat 与 PVZUSR64 版本 13 的玩家详情不改号。

## 自动升级（DFU）

游戏先检查关卡档头。当前 v5.1 直接读取，不加载转换模块、不扫描动画卡死。历史正式 DAT64 v4（major 4 / minor 0 / schema `0x10745`）交给独立 DataFixerUpper：修复明确识别的旧射手攻击动画卡死，再转换为 v5.1。未知版本和未发布的 v3 / v5.0 开发档拒绝混读。

Windows 的模块是程序目录 data/pvz_dfu.dll；Android 的 libpvz_dfu.so 已随 APK 打包；网页在游戏启动前使用独立 wasm32 工具升级，不从游戏 Wasm 中提取转换功能，完成后释放工具 Worker。网页继续使用既有 /persist/development-v331/ 存档目录。

转换产生经过重新解析验证的临时文件，成功后才替换原档。模块缺失或转换失败会报错并保留原档。不要靠修改头部版本或扩展名冒充当前格式。

## 手动转换

附带的 data/pvz_dat64_converter.exe 是 DFU DLL 的命令行入口，必须和 pvz_dfu.dll 放在一起。单文件模式保留输入，输入输出不能相同：

```powershell
.\pvz_dat64_converter.exe .\copies\game3_13.dat .\converted\game1_58.dat64 --target dat64-v5
.\pvz_dat64_converter.exe --dfu .\copies\old-v4.dat64 .\converted\game1_58.dat64
.\pvz_dat64_converter.exe .\copies\game1_58.dat64 .\converted\game3_13.dat --target legacy --round-time nearest
```

手动转换器支持原版 1073 DAT、DAT64 v1、v2、v4、v5.1；游戏只直接解析 v5.1，v4 自动走 DFU。目标参数为 legacy|dat64-v1|dat64-v2|dat64-v4|dat64-v5。原版 DAT 默认生成 v5.1；DAT64 默认导出原版 DAT。导出旧单位时间要求精确可表示，只有显式 nearest 允许最接近舍入，超出范围仍拒绝。

无参数批量模式扫描转换器所在目录，成功后删除该批输入、失败保留；备份后再明确使用这一模式。正常游戏自动升级不调用此批处理入口。

## 文件与协议

- users.dat：用户摘要；user<ID>.dat64：玩家详情，不随关卡版本改号。
- game<ID>_<mode>.dat64：关卡快照，模式编号来自文件名。冒险模式共用模式 0 的槽位，具体冒险进度属于用户详情。
- 图形句柄、原生指针和派生绘制缓存不入档。按字段序列化，C++ 对象 sizeof 不是磁盘协议。
- DAT64 头固定 48 字节、小端；magic PVZDAT64，major 位于 8，schema 位于 36，minor 位于 40。当前分别为 5、0x10747、1。
- 文件长度、结束标记、池代次、拥有关系和跨对象引用均需有效。当前不校验内容 CRC/哈希，修改合法字段无需重算。
- 当前 11 池为 Zombie、Plant、Projectile、Coin、LawnMower、GridItem、ParticleSystem、ParticleEmitter、Particle、Reanimation、Attachment。旧非空 Trail 池没有运行时对应物，转换拒绝。

## 实现与核对

游戏协议见 LevelSaveFormat.h、V7SaveSchema.h、SaveRecordMapping.h 与 SaveGame.cpp；独立 DFU 源码在 [PvzDevTools](https://github.com/YuHao2006/PvzDevTools)。时间字段迁移清单见 [v5 审计](research/time-deadline-v5-audit.md)。

已验证原版起点转换、真实 v4 自动升级、当前 v5.1 跳过修复、损坏输入与缺失模块不覆盖原档，以及 DLL / 独立 wasm 的转换输出一致。植物修复仅发生在 v4 升级中，正确的当前格式不会被额外扫描或改写。
