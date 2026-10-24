# 临时清单：故意空裁剪与无目标 Graphics

2026-10-24 按用户要求保留，供后续直接使用，不再重复全库查找。
本页是明确的临时审计清单，不作为新一轮实现过程日志。

## 确认用途

| 位置／入口 | 原用途 | 当前处理 |
| --- | --- | --- |
| `Graphics::GetWordWrappedHeight` | 构造无目标 `Graphics aTestG`，调用折行绘制，以空 clip 丢弃字形，仅返回高度和最大行宽 | 已删除内部空 Graphics；与实际绘制共用 `WriteWordWrappedLayout`，测量用 `<false>` 实例，不调用字形 draw |
| `LawnDialog::CalcSize` → `Widget::GetWordWrappedHeight` | 创建 Quit 等对话框时，以只有字体、没有绘制目标的 Graphics 取得正文高度 | 布局调用必须保留；目前已进入纯测量路径，不依赖空裁剪抑制绘制 |
| `Dialog::GetPreferredHeight` → `GetWordWrappedHeight` | 通用对话框按字体、正文和可用宽度确定高度 | 同上，不能直接删除计高调用 |
| `LawnDialog::Draw` 的正文计高 | 正文居中和排版需要先测高度 | 继续使用同一纯测量入口 |
| `CreditScreen` 构造 → `DrawCreditsContent(..., false)` | 计算动态 role/name 段落总高度；heading 在 `theDraw == false` 时不绘制，正文 helper 传 `drawString=false` | 已删除 `Graphics aMeasure(nullptr)`，直接传 `nullptr`；TodStringFile 的测量分支不读取 clip/translation，也不绘制 |
| 原生测试中的 `Graphics(nullptr)` | 证明无目标文字测量不绘制、不因 UV 入口要求目标而异常；另有只验证 BeginDraw/EndDraw 状态的测试 | 保留测试，不作为生产死代码删除 |

文字测量输入中的 `Rect(0,0,width,0)` 是**布局参数**，不是强制绘制范围；
高度 0 不表示可以删除整个测量调用。字体数据只提供字符宽度、单行度量和行距，
整段高度仍由内容、可用宽度、显式换行和格式标记共同决定。

## 已排除的无像素绘制

- `TitleScreen::Draw`：草进度条裁剪宽度截为整数后不大于零时，不再创建裁剪并绘草图。
  卷草图、`mDrawnYet` 和 `DrawToPreload` 的行为保留。
- `EditWidget::Draw`：第二 pass 中，clamp 后选区／光标左右边相同，跳过零宽高亮与文字重绘。
  首遍文字、背景与边框保留。
- `Board` 温室边光：没有左侧／右侧扩展时，分别跳过对应的空裁剪镜像 light。
  中央 light 及 additive 模式恢复保留。
- `Graphics::FillRect`：与 clip 求交后宽或高不大于零，直接返回。
- 普通整数 `DrawImage`／`DrawImageMirror` 与 `ImageDrawing::BltF` 原有空交集早退保留。
  UV 的 `DrawImage` 重载也保留空 clip 早退，以支持不可见绘制与测量兼容边界。
- Board 波浪边缘、Slider／九宫格中心的若干零宽区域，本来就由零次循环避免实际绘制，
  无需重复增加判断。

## 正常动态裁剪：不能静态删除

ListWidget、TextWidget、SeedPacket、LawnMower、Zombie、Almanac、Zombatar、Credits 等
会因滚动、动画、父区域求交或页面布局得到空区域。这些调用并非永远不可见，
需保留有效区域的路径，只在已确认纯绘制的叶节点或提交入口跳过空结果。

全库未发现应用代码直接写死的 `SetClipRect(...,0,0)`／`ClipRect(...,0,0)` 永久空区。
判空应使用 `width <= 0 || height <= 0`：相切的矩形交集可以保留非零坐标，
不能只与 `Rect()` 比较。

## 禁止整棵 Widget 树按空 clip 直接返回

`WidgetContainer::DrawAll` 同时负责 deferred overlay 刷新、modal 标记、子项 dirty 清理，
并允许子项通过 `ClearClipRect`／`SetClipRect` 恢复区域。
`Reanimator` 的 ignore-clip 轨道也可能突破传入裁剪。
某些 Draw 还有加载／预热状态副作用，例如 TitleScreen 的 `mDrawnYet` 与 `DrawToPreload`。
因此不能把父 clip 为空等价为整个遍历没有作用。

## 回归入口

- `Tests/native/ImageRuntimeTests.cpp::WrappedTextMeasurements`：测量与绘制的高度／最大行宽对拍，
  覆盖长单词、空格、换行、颜色标记；测量时字形 draw 次数为零。
- `Tests/native/QuitDialogRuntimeChecks.h`：真实确认框创建、正文、Yes/No、删除。
- Quit 独立隐藏调查夹具的红／绿日志及符号栈位于系统 Temp 的 `pvz-quit-investigation`，
  未操作用户游戏窗口或存档。
