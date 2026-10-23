# AI 返回原始素材

本目录保存接口返回的原始 PNG，供后续离线 Anime4K 处理使用。
这些文件从返回结果逐字节复制，没有裁切、缩放、重采样或重新编码。
任何加工结果必须另存，不能覆盖本目录的原件。

| 原件 | 请求的模型名 | 请求尺寸 | 返回尺寸 | 质量参数 |
| --- | --- | --- | --- | --- |
| `zombatar-seam-ai-v1.png` | `gpt-image-2` | 1744×608 | 2123×741 | medium |
| `zombatar-seam-sunburst-v1.png` | `gpt-image-2.5-sunburst` | auto | 2123×741 | medium |
| `common-menu-paper-hires-v1.png` | `gpt-image-2` | 2304×1296 | 1672×941 | high |
| `selector-source-base-sunburst-v1.png` | `gpt-image-2.5-sunburst` | auto（输入 1744×608） | 2123×741 | high |
| `selector-tree-left-21x9-sunburst-v1.png` | `gpt-image-2.5-sunburst` | 1024×1024 | 1254×1254 | high |
| `selector-whole-layers-sunburst-v1.png` | `gpt-image-2.5-sunburst` | auto（完整天空、树景、房屋分层输入 1536×1312） | 1357×1159 | high |
| `Background_Greenhouse-21x9-sunburst-v1.png` | `gpt-image-2.5-sunburst` | auto（输入1408×608） | 1908×824 | high |
| `Background_MushroomGarden-21x9-sunburst-v1.png` | `gpt-image-2.5-sunburst` | auto（输入1408×608） | 1909×824 | high |
| `aquarium1-21x9-sunburst-v1.png` | `gpt-image-2.5-sunburst` | auto（输入1408×608） | 1908×824 | high |

模型名是请求接口时使用的名称，不作为下游实际模型身份的证明。
输入图、蒙版和提示词一并保存在 `inputs/` 与 `prompts/`。
本目录不保存 API 密钥或服务认证信息。

`runtime/` 保存经确认仍在使用的 10 张加工成品，不能代替上方原件。
`runtime-overlay.json` 显式记录每张成品对应的游戏虚拟路径；构建只允许这份
清单中的成品参与引用解析，不递归打包原件、`inputs/`、`prompts/` 或试验图。
成品从 `assets/runtime/` 原样移入，未重新编码；原生素材不在此目录内。
后续大图提分辨率采用离线 Anime4K 最高档位；reanim 小图优先使用重植版素材。
