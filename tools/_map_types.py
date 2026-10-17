import re
txt = open(r'C:/Users/Administrator/CLionProjects/codex/PlantsVsZombiesModern/Sexy.TodLib/Reanimator.cpp', encoding='utf-8', errors='replace').read()
i = txt.index('gLawnReanimationArray')
seg = txt[i:]
seg = seg[:seg.index('};')]
names = []
for line in seg.splitlines():
    m = re.search(r'(REANIM_[A-Z0-9_]+)\s*,\s*"([^"]+)"', line)
    if m:
        fname = m.group(2).split(chr(92))[-1].replace('.reanim', '')
        names.append((m.group(1), fname))
print('条目数:', len(names))
for i2 in (6, 17, 28, 43, 68, 77, 80, 86, 87, 141, 142):
    print(f'  defID {i2:3} = {names[i2]}')
bad22 = {'cobcannon', 'credits_bigbrain', 'credits_stage', 'fire', 'goldmagnet', 'hypnoshroom', 'plantern',
         'rain_circle', 'rake', 'tanglekelp', 'torchwood', 'zengarden_sprout', 'zombie_boss', 'zombie_boss_fireball',
         'zombie_boss_iceball', 'zombie_charred', 'zombie_charred_catapult', 'zombie_charred_digger',
         'zombie_charred_zamboni', 'zombie_dolphinrider', 'zombie_hand', 'zombie_surprise'}
hits = [(i2, f) for i2, (n, f) in enumerate(names) if f.lower() in bad22]
print('22个不一致类型的 defID:', hits)
