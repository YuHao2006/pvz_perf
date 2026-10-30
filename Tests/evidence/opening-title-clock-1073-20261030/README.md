# 开场关卡名计时

`inspect_title.py`只读本机已核验SHA256的1073 EXE；重建代码注释中的459xxx地址属于另一布局，不能直接当成本EXE地址。

- `0x45CA21`比较样式14（HOUSE_NAME），`0x45CA26`将MessageWidget+0x88设为250。
- `0x45CDAE`检查Board+0x17C暂停；暂停则返回。
- `0x45CDCB`递减有限显示时间；归零时`0x45CDD6`清除样式。
- Board的暂停返回在`0x4186B4`开始；`0x41875B`调用MessageWidget::Update，早于后面的战斗逻辑检查。

1073没有当前项目的显式Visual纳秒时钟，实际是未暂停的Board界面更新次数；标题在开场过场中已消耗时长，而不是从开始战斗计时。重建的CutScene::StartLevelIntro也在启动过场时设置HOUSE_NAME。现行实现按用户指定，在设置标题时绑定Visual时间+2.5秒，更新与淡出使用相同时间。普通暂停停止Visual；其他提示时钟本次未改。

存档仍保存剩余时长，HOUSE_NAME根据Visual时间投影和重绑定；没有新增字段或改变线格式。ImageRuntimeTests使用真实MessageWidget检查30/100/240/1000Hz、暂停、过场到战斗、全程过场到期、无限提示，以及不同Visual纪元的编码/解码。

