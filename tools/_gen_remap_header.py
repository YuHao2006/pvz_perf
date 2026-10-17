import json, re, os

final = json.load(open(os.path.join(os.path.dirname(__file__), '_exe_resid_final.json')))
assert len(final) == 879, len(final)

# 现代枚举序（= modern id）
txt = open(os.path.join(os.path.dirname(__file__), '..', 'Resources.h'), encoding='utf-8', errors='replace').read()
enum_text = open(os.path.join(os.path.dirname(__file__), '..', 'Sexy.TodLib', 'generated', 'ResourceId.h'), encoding='utf-8').read()
i = enum_text.index('enum class ResourceId')
seg = enum_text[i:enum_text.index('RESOURCE_ID_MAX')]
names = re.findall(r'\b([A-Z0-9_]+)_ID\s*=\s*\d+\s*,', seg)
assert len(names) == 879

# Use the actual C++ resource slot types, including the FONT_IMAGE glyph atlas.
image_names = set(re.findall(r'\bextern\s+Image\s*\*\s*([A-Z0-9_]+)\s*;', txt))
assert image_names and image_names <= set(names), 'Image* 声明与资源枚举不一致'

exe_to_modern = [879] * 880
modern_to_exe = [879] * 880
exe_is_image = [False] * 880
for name, eid in final.items():
    mid = names.index(name)
    assert 0 <= eid < 879, (name, eid)
    assert exe_to_modern[eid] == 879 or exe_to_modern[eid] == mid, (name, eid)
    exe_to_modern[eid] = mid
    modern_to_exe[mid] = eid
    exe_is_image[eid] = name in image_names
assert all(v != 879 for v in exe_to_modern[:879]), 'exe 表有洞'
assert all(v != 879 for v in modern_to_exe[:879]), 'modern 表有洞'
# 双射校验
assert sorted(exe_to_modern[:879]) == list(range(879))
assert sorted(modern_to_exe[:879]) == list(range(879))

def fmt_ints(xs, per=12):
    lines = []
    for k in range(0, len(xs), per):
        lines.append('    ' + ', '.join(str(v) for v in xs[k:k+per]) + ',')
    return '\n'.join(lines)

def fmt_bools(xs, per=40):
    lines = []
    for k in range(0, len(xs), per):
        lines.append('    ' + ', '.join('1' if v else '0' for v in xs[k:k+per]) + ',')
    return '\n'.join(lines)

hdr = f'''#pragma once
// 由 tools/_gen_remap_header.py 生成 —— 勿手改。
// 来源：1.2.0.1073 PlantsVsZombies.exe 的 .data gResources 指针数组
// @VA 0x71da08（0x726e14 是首项 IMAGE_BLANK 变量地址）。原提取 872 项，
// 另 7 个长名项已按完整字符串 → 装载函数变量 → 表槽只读复核。
// 双向校验：6 个存档经验锚点（南瓜 232/手臂 248/梯子 307·308·310/玩偶匣 297）全中。
// 空间定义：
//   legacy(.dat)  = 1073 exe 的 ResourceId 序
//   dat64(规范态) = 本工程 Resources.h 枚举序
// 879 = RESOURCE_ID_MAX 哨兵（两空间同值，直通不映射）。
#include <cstdint>
#include "../Resources.h"

namespace LevelSaveRemap {{
inline constexpr int kResourceCount = 879;      // 0..878
inline constexpr int kResourceIdSentinel = 879; // RESOURCE_ID_MAX

// legacy(exe) id -> dat64(modern) id
inline constexpr std::int32_t kExeToModern[kResourceCount + 1] = {{
{fmt_ints(exe_to_modern)}
}};

// dat64(modern) id -> legacy(exe) id
inline constexpr std::int32_t kModernToExe[kResourceCount + 1] = {{
{fmt_ints(modern_to_exe)}
}};

// legacy(exe) 空间的"是图像"位图（0..878 资源 + 哨兵 0）。modern 空间沿用
// Sexy::IsImageResourceId（有 static_assert 对 gResources 兜底）。
inline constexpr bool kExeIsImage[kResourceCount + 1] = {{
{fmt_bools(exe_is_image)}
}};

constexpr bool HasBoundedResourceMappings() noexcept
{{
    for (int id = 0; id < kResourceCount; ++id)
    {{
        if (kExeToModern[id] < 0 || kExeToModern[id] >= kResourceCount ||
            kModernToExe[id] < 0 || kModernToExe[id] >= kResourceCount)
        {{
            return false;
        }}
    }}
    return true;
}}

constexpr bool HasBijectiveResourceMappings() noexcept
{{
    if (!HasBoundedResourceMappings())
    {{
        return false;
    }}
    for (int id = 0; id < kResourceCount; ++id)
    {{
        if (kModernToExe[kExeToModern[id]] != id ||
            kExeToModern[kModernToExe[id]] != id)
        {{
            return false;
        }}
    }}
    return true;
}}

constexpr bool HasConsistentImageMask() noexcept
{{
    if (!HasBoundedResourceMappings())
    {{
        return false;
    }}
    for (int id = 0; id < kResourceCount; ++id)
    {{
        if (kExeIsImage[id] !=
                Sexy::IsImageResourceId(static_cast<Sexy::ResourceId>(kExeToModern[id])))
        {{
            return false;
        }}
    }}
    return true;
}}

static_assert(kResourceCount == static_cast<int>(Sexy::ResourceId::RESOURCE_ID_MAX));
static_assert(kResourceIdSentinel == kResourceCount);
static_assert(kExeToModern[kResourceIdSentinel] == kResourceIdSentinel &&
    kModernToExe[kResourceIdSentinel] == kResourceIdSentinel);
static_assert(!kExeIsImage[kResourceIdSentinel] &&
    !Sexy::IsImageResourceId(Sexy::ResourceId::RESOURCE_ID_MAX));
static_assert(HasBoundedResourceMappings(), "Resource mappings must stay in bounds");
static_assert(HasBijectiveResourceMappings(), "Resource mappings must be inverses");
static_assert(HasConsistentImageMask(), "Legacy image mask must match Resources.h");
static_assert(kExeIsImage[kModernToExe[
    static_cast<int>(Sexy::ResourceId::FONT_IMAGE_HOUSEOFTERROR28_ID)]]);
}}  // namespace LevelSaveRemap
'''
out = os.path.join(os.path.dirname(__file__), '..', 'dat64', 'ResourceIdRemap.h')
open(out, 'w', encoding='utf-8', newline='\n').write(hdr)
print('written', out, len(hdr), 'bytes')
print('一致项:', sum(1 for n in names if final[n] == names.index(n)), '/879')
