# 商店 1400 宽素材

商店保留独立底图、车辆、货架、戴夫和UI。原图、对齐结果、生成脚本和
离线预览均保存在外部 helper：
`PlantsVsZombies/ReferenceResearch/Widescreen/store-21x9/`。

## 底图

`runtime/images/Store_Background.png` 和 `Store_BackgroundNight.png` 均为
1400×600 RGB PNG，按既有居中公式绘制在 local x=-300。
底图采用Ultra现成环境和Widescreen的居中布局组合，不反射、镜像或拉伸边缘。

两侧使用用户提供的
`C:/UserProgram/MOD ULTRA WIDESCREEN/main.eng` 中
`images/store_background.jpg`、`images/store_backgroundnight.jpg` 的原生像素。
Widescreen背景的原生裁片放在source x=167，使原800宽布局保持
在`[300,1100)`。右侧保留Ultra单独的完整房屋，不叠加另一段屋顶。
AI只调和左侧树景、围栏和地面的拼接，以及右侧天空和多余围栏接缝。
功能区域保持原位；source x=1000..1100、y<210 的空天空参与羽化过渡。
接入时避免在 x=1050 硬切蒙版，并在右侧保留房屋前按行匹配天空颜色，
消除合成产生的矩形色带。多余围栏区域完整替换后再向原房屋边缘过渡，
source x>=1240、y>=210 的原生房屋区域逐像素保留。
车辆、戴夫、商品和按钮不进入生图输入，没有采用Ultra偏左的车辆布局。

AI原始返回图、输入、蒙版和提示词保存在`assets/source-art/ai/`。运行时采用
限定编辑区内的派生像素，原始返回图不改动。整图扩展与早期接缝试稿仅归档，
不作为当前商店底图。最终组合与校验位于helper的`store-native-join-v2/`。

## 车辆前景

| 文件 | 尺寸 | 保持的绘制原点 |
|---|---|---|
| `Store_Car.png` + `Store_Car_.png` | 904×462 | local (196,138) |
| `Store_CarClosed.png` + `Store_CarClosed_.png` | 904×462 | local (196,138) |
| `Store_Car_night.png` | 412×272 | local (688,193) |

两个白天前景使用 RGB PNG 加原有独立 alpha 伴随图。删除原同名 JPEG，
避免 extensionless 资源路径出现竞争格式。原左 604×462 的 RGB 与 alpha
逐像素保持 HEAD 解码值，车厢、货架、后盖接合和商品位置都不移动。
`Store_HatchbackOpen.png` 和 `Store_CarClosed_night.png` 保持不变。

新增车体来自 Ultra `images/store_car.png`（850×462 RGBA），参考补丁匹配后
仅平移 (+1,-2)，截取原 x>=604 之外的区域；没有缩放。开盖和关盖使用完全
相同的右侧车身，防止状态切换时车头跳动。新增区域包含 44,831 个非透明像素，
实际车身延伸到 source x=789；其后的透明画布是完整车头外的自然空白，
不是用透明补边掩盖原 604 宽截断。

夜景窗口补片来自 Ultra `images/store_car_night.png`（288×272 RGBA），
同样只平移 (+1,-2)。原左 132×175 及其下方透明区域保持不变，
右侧补齐窗口，画布扩到 412 像素以覆盖目标 viewport 的资源范围。

## 验证与边界

离线合成昼/夜、开/关盖四种状态，车辆前景与既有904宽版本逐字节一致。
检查天空接缝、左侧留白、房屋轮廓和原local x=800截车位置。
底图中保护的Widescreen区域逐像素一致，左右新增区域不含白色空块。
800..1400 的全部 601 个整数宽度均落在不透明底图范围内。
当前验证记录为 helper 的 `store-native-join-v2/verification.json`，
昼夜开关盖预览为同目录的 `day-open.png`、`day-closed.png`、
`night-open.png`、`night-closed.png`。原始返回图及请求提示词保持不变，
本轮使用已有返回图完成离线合成，没有发起新的生图请求。

原素材所有权及许可保持不变。
