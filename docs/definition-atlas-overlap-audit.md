# Definition atlas overlap audit

Generated from the current cache and source DSLs. All sizes below are decoded RGBA bytes, not compressed PNG or pak bytes. Native packing is a feasible estimate, not a proof of optimality. The current atlas baseline includes its cached exact-solver improvements; proposed unions use native MaxRects only, so the comparison is conservative about possible future exact packing.

- Manifest SHA-256: `bf02f728e6e1aefdd4dbc2de725b09afc0f96494d312249d794aaf8af9a02c7c`
- Source definitions verified: 252; unique author image names: 1702. Every referenced current source image was decoded with runtime alpha rules and checked against cache dimensions/hash.
- Source/cache case-alias name differences: 0; all resolve to identical decoded pixels (details in JSON).
- Per-definition source RGBA occurrences: 98,977,344 bytes.
- Unique author image RGBA: 77,682,596 bytes; unique exact RGBA: 77,657,580 bytes.
- Current physically distinct atlas RGBA: 85,781,860 bytes.
- Current nonempty physical atlas PNG count: 193.
- Current physical source occurrences (every existing shared atlas counted once): 79,267,744 bytes; exact RGBA duplicates across current physical atlases: 1,610,164 bytes. Per-definition occurrences above intentionally count every definition independently.

## Currently shared atlases

The manifest already contains 28 shared physical atlases covering 80 definitions. These are implemented groups, not remaining recommendations. Bytes below count each physical PNG once. Component spellings come from the selected author DSLs.

| Physical atlas PNG | Author components | Dimensions | RGBA bytes | PNG bytes |
|---|---|---:|---:|---:|
| compiled/atlases/award_rays.atlas.png | particle:Award, particle:CreditsRaysWipe | 154×335 | 206,360 | 11,647 |
| compiled/atlases/boss_family.atlas.png | reanim:Credits_Bossdance, reanim:Zombie_boss | 1519×945 | 5,741,820 | 1,417,017 |
| compiled/atlases/credits_brain.atlas.png | reanim:Credits_BigBrain, reanim:Credits_Throat | 463×1533 | 2,839,116 | 271,094 |
| compiled/atlases/credits_stage.atlas.png | reanim:Credits_AnyHour, reanim:Credits_Main, reanim:Credits_Main2, reanim:Credits_Main3, reanim:Credits_WeAreTheUndead, reanim:ZombiesWon | 1404×3998 | 22,452,768 | 6,330,469 |
| compiled/atlases/dave_family.atlas.png | reanim:CrazyDave, reanim:Credits_CrazyDave | 980×790 | 3,096,800 | 733,723 |
| compiled/atlases/dust.atlas.png | particle:DustFoot, particle:DustSquash | 100×31 | 12,400 | 2,182 |
| compiled/atlases/fireball_burst.atlas.png | particle:FireballDeath, particle:ZombieBossFireball | 452×78 | 141,024 | 18,274 |
| compiled/atlases/fume_cloud.atlas.png | particle:FumeCloud, particle:GloomCloud | 36×31 | 4,464 | 1,273 |
| compiled/atlases/ice_trail.atlas.png | particle:BossIceBallTrail, particle:IceBallDeath, particle:SnowPeaTrail | 64×24 | 6,144 | 1,479 |
| compiled/atlases/ice_trap_burst.atlas.png | particle:IceTrapRelease, particle:IceTrapZombie | 71×21 | 5,964 | 2,026 |
| compiled/atlases/melon_family.atlas.png | reanim:Melonpult, reanim:WinterMelon | 391×96 | 150,144 | 61,030 |
| compiled/atlases/pea_family.atlas.png | reanim:GatlingPea, reanim:PeaShooter, reanim:PeaShooterSingle, reanim:SnowPea, reanim:SplitPea, reanim:ThreePeater | 187×391 | 292,468 | 95,616 |
| compiled/atlases/pickup_arrows.atlas.png | particle:CoinPickupArrow, particle:SeedPacketPick, particle:UpsellArrow | 36×30 | 4,320 | 614 |
| compiled/atlases/pickup_starburst.atlas.png | particle:PresentPickup, particle:Starburst | 58×100 | 23,200 | 2,466 |
| compiled/atlases/pool_splash.atlas.png | particle:PlantingPool, particle:PoolSplash | 244×44 | 42,944 | 731 |
| compiled/atlases/portal_particles.atlas.png | particle:PortalCircle, particle:PortalSquare | 20×20 | 1,600 | 306 |
| compiled/atlases/potato_mine.atlas.png | particle:PotatoMine, reanim:PotatoMine | 204×401 | 327,216 | 56,149 |
| compiled/atlases/projectile_splat.atlas.png | particle:CabbageSplat, particle:PeaSplat | 137×28 | 15,344 | 4,701 |
| compiled/atlases/puff_spores.atlas.png | particle:PuffShroomMuzzle, particle:PuffShroomTrail, particle:PuffSplat | 25×25 | 2,500 | 712 |
| compiled/atlases/rising_dirt.atlas.png | particle:DancerRise, particle:DiggerRise, particle:DiggerTunnel, particle:GraveBusterDie, particle:GraveStoneRise, particle:Planting, particle:PotatoMineRise, particle:SodRoll, particle:WhackAZombieRise, particle:ZombieRise | 354×248 | 351,168 | 26,334 |
| compiled/atlases/screen_flash.atlas.png | particle:CreditsStrobe, particle:ScreenFlash | 5×5 | 100 | 79 |
| compiled/atlases/selector_clouds.atlas.png | reanim:SelectorScreen, reanim:TreeOfWisdomClouds | 2481×1188 | 11,789,712 | 1,492,870 |
| compiled/atlases/sparkles.atlas.png | particle:IceSparkle, particle:TrophySparkle | 64×24 | 6,144 | 968 |
| compiled/atlases/sunflower_family.atlas.png | reanim:SunFlower, reanim:TwinSunflower | 137×192 | 105,216 | 35,050 |
| compiled/atlases/vase_shards.atlas.png | particle:VaseShatter, particle:VaseShatterLeaf, particle:VaseShatterZombie | 292×100 | 116,800 | 29,440 |
| compiled/atlases/zamboni_family.atlas.png | particle:ZamboniExplosion, particle:ZamboniExplosion2, particle:ZamboniSmoke, particle:ZamboniTire, reanim:Zombie_zamboni | 450×438 | 788,400 | 158,585 |
| compiled/atlases/zombie_arms.atlas.png | particle:MoweredZombieArm, particle:ZombieArm | 30×54 | 6,480 | 2,940 |
| compiled/atlases/zombie_heads.atlas.png | particle:MoweredZombieHead, particle:ZombieHead, particle:ZombieHeadPool | 68×65 | 17,680 | 6,900 |

## Current runtime residency

The current application preloads all available definitions and uploads every definition atlas before completing loading. LawnApp::LoadingThreadProc calls ReanimatorLoadAllDefinitionData and TodParticleLoadDefinitions; the latter loops over the complete particle parameter array. LawnApp::UpdateApp waits for the warm queue/final sweep and calls ReanimatorUploadAllTexturesToGPU. That function waits for both definition-ready flags, collects all reanim and particle atlas images into a deduplicated set, and uploads them. Its comment explicitly retains source textures on the GPU while releasing CPU decode pixels.

Consequently the saving column applies to the current full-preload residency model. The last column is a hypothetical future risk if loading/eviction changes to individual definitions or scenes; it is not an extra allocation caused by present runtime requests. These are base RGBA allocation estimates, excluding backend alignment, texture metadata and transient upload memory.

Source evidence: pvzPerf/LawnApp.cpp (LoadingThreadProc, UpdateApp); pvzPerf/Sexy.TodLib/Reanimator.cpp (ReanimatorLoadAllDefinitionData, ReanimatorUploadAllTexturesToGPU); pvzPerf/Sexy.TodLib/TodParticle.cpp (TodParticleLoadDefinitions).

The compiled wire format stores each image reference as an inline six-u32 rectangle (x, y, width, height, rows, cols). It contains no local image ID, region table or atlas path; the generated DefinitionImageBindings.h provides definition-to-atlas path bindings. Manifest image rows may carry atlas-specific region coordinates. This audit compares only source image metadata across occurrences of one author image name, excluding those coordinates and other layout-specific fields.

## Implemented groups and remaining opportunities

The currently shared table is the source of truth for implemented consolidation. A proposal already contained in one physical PNG is omitted from remaining candidates. Expanding one member of an existing group includes that entire group, so each remaining row requires combining at least two current physical PNGs. Candidate savings are incremental from this manifest, not the older ungrouped corpus. Candidate rows can overlap and must not be summed without checking their full expanded members.

Shared author image bytes below count occurrences across current physical atlases, excluding duplicates already removed by implemented groups. Source-subset paths identify an atlas whose complete source set is contained in another candidate atlas; its definitions need no new source pixels in that larger atlas. Native layouts are still measured, since a different deterministic packing order can affect gaps.

The ResidentImage filter-alias implementation reuses the owning GPU texture and applies the existing shader sampling flags. It avoids a separate whole-atlas filtered texture allocation, so TreeOfWisdom whitening only selected tracks does not multiply the atlas allocation by its filter variants. The table still measures base atlas bytes only, not alias object metadata or transient upload memory. This conclusion concerns ResidentImage atlases, not unrelated legacy MemoryImage filter render targets. Source evidence: pvzPerf/Sexy.TodLib/FilterEffect.cpp (FilterEffectCreateImage) routes ResidentImage to pvzPerf/SexyAppFramework/graphics/RenderInterface.cpp (CreateResidentFilterImage), which sets mTexture=original.mTexture, mOwnsTexture=false and filter mSamplingFlags without allocating a render target.

## Remaining candidate unions

Saving uses the current full-preload simultaneous residency of the distinct atlases. The last column models future demand loading with just one member resident. Negative saving means the measured native layout is worse than the current cached layouts. Members already sharing an atlas are expanded together. Author image duplicate bytes count repeated name-keyed rectangles; equal RGBA under different author names does not reduce production union size.

| Candidate | Expanded author components | Duplicate physical author image RGBA | Current atlas RGBA | Union atlas RGBA | Incremental current saving | Future demand-load extra for one member |
|---|---|---:|---:|---:|---:|---:|
| zamboni_with_explosion_particles | particle:BossExplosion, particle:CatapultExplosion, particle:JackExplode, particle:ZamboniExplosion, particle:ZamboniExplosion2, particle:ZamboniSmoke, particle:ZamboniTire, reanim:Zombie_zamboni | 382,400 | 1,744,252 | 1,236,480 (384×805) | 507,772 | 448,080…992,180 |
| zombie_credits_family | reanim:Zombie, reanim:Zombie_credits_conehead, reanim:Zombie_credits_dance, reanim:Zombie_credits_screendoor | 281,604 | 672,072 | 311,264 (284×274) | 360,808 | 16,264…214,112 |
| explosion_particles | particle:BossExplosion, particle:CatapultExplosion, particle:JackExplode | 246,400 | 955,852 | 629,624 (746×211) | 326,228 | 227,576…385,324 |
| highest cross reanim/particle shared author image RGBA pair | particle:JackExplode, particle:ZamboniExplosion, particle:ZamboniExplosion2, particle:ZamboniSmoke, particle:ZamboniTire, reanim:Zombie_zamboni | 136,000 | 1,190,448 | 954,720 (459×520) | 235,728 | 166,320…552,672 |
| highest shared author image RGBA pair | particle:CatapultExplosion, particle:JackExplode | 136,000 | 646,348 | 451,248 (553×204) | 195,100 | 49,200…206,948 |
| highest shared author image RGBA pair | particle:BossExplosion, particle:JackExplode | 110,400 | 711,552 | 529,984 (637×208) | 181,568 | 127,936…220,480 |
| highest cross reanim/particle shared author image RGBA pair | particle:CatapultExplosion, particle:ZamboniExplosion, particle:ZamboniExplosion2, particle:ZamboniSmoke, particle:ZamboniTire, reanim:Zombie_zamboni | 136,000 | 1,032,700 | 868,112 (674×322) | 164,588 | 79,712…623,812 |
| highest shared author image RGBA pair | reanim:Zombie, reanim:Zombie_credits_screendoor | 106,636 | 430,360 | 295,000 (125×590) | 135,360 | 0…159,640 |
| highest shared author image RGBA pair | reanim:Zombie, reanim:Zombie_credits_dance | 101,604 | 439,560 | 311,264 (284×274) | 128,296 | 16,264…166,704 |
| highest cross reanim/particle shared author image RGBA pair | particle:DancerRise, particle:DiggerRise, particle:DiggerTunnel, particle:GraveBusterDie, particle:GraveStoneRise, particle:Planting, particle:PotatoMineRise, particle:SodRoll, particle:WhackAZombieRise, particle:ZamboniExplosion, particle:ZamboniExplosion2, particle:ZamboniSmoke, particle:ZamboniTire, particle:ZombieRise, reanim:Zombie_zamboni | 102,400 | 1,139,568 | 1,012,928 (784×323) | 126,640 | 224,528…661,760 |
| highest cross reanim/particle shared author image RGBA pair | particle:BossExplosion, particle:ZamboniExplosion, particle:ZamboniExplosion2, particle:ZamboniSmoke, particle:ZamboniTire, reanim:Zombie_zamboni | 110,400 | 1,097,904 | 977,256 (441×554) | 120,648 | 188,856…667,752 |
| highest shared author image RGBA pair | reanim:Credits_AnyHour, reanim:Credits_Main, reanim:Credits_Main2, reanim:Credits_Main3, reanim:Credits_WeAreTheUndead, reanim:Zombie_dolphinrider, reanim:ZombiesWon | 39,000 | 22,649,568 | 22,531,392 (1404×4012) | 118,176 | 78,624…22,334,592 |
| highest shared author image RGBA pair | particle:BossExplosion, particle:CatapultExplosion | 110,400 | 553,804 | 438,960 (372×295) | 114,844 | 129,456…194,660 |
| highest shared author image RGBA pair | reanim:Zombie, reanim:Zombie_credits_conehead | 73,364 | 392,152 | 295,000 (125×590) | 97,152 | 0…197,848 |
| highest shared author image RGBA pair | reanim:Zombie_credits_dance, reanim:Zombie_credits_screendoor | 59,960 | 279,920 | 198,816 (228×218) | 81,104 | 54,256…63,456 |
| highest shared author image RGBA pair | reanim:Zombie_credits_conehead, reanim:Zombie_credits_dance | 59,912 | 241,712 | 160,640 (251×160) | 81,072 | 16,080…63,488 |
| highest shared author image RGBA pair | reanim:Zombie_boss_fireball, reanim:Zombie_boss_iceball | 40,820 | 1,527,724 | 1,446,888 (1002×361) | 80,836 | 525,616…840,436 |
| highest shared author image RGBA pair | reanim:Zombie_credits_conehead, reanim:Zombie_credits_screendoor | 52,024 | 232,512 | 161,792 (256×158) | 70,720 | 26,432…64,640 |
| highest cross reanim/particle shared author image RGBA pair | particle:Powie, particle:ZamboniExplosion, particle:ZamboniExplosion2, particle:ZamboniSmoke, particle:ZamboniTire, reanim:Zombie_zamboni | 25,600 | 1,023,408 | 954,720 (459×520) | 68,688 | 166,320…719,712 |
| highest shared author image RGBA pair | reanim:Zombie_charred, reanim:Zombie_charred_catapult | 37,936 | 1,470,204 | 1,420,800 (384×925) | 49,404 | 264,960…1,106,436 |
| highest shared author image RGBA pair | reanim:Zombie_charred, reanim:Zombie_charred_digger | 37,936 | 821,432 | 773,376 (304×636) | 48,056 | 266,308…459,012 |
| highest shared author image RGBA pair | reanim:Zombie_charred, reanim:Zombie_charred_imp | 37,936 | 460,364 | 412,920 (465×222) | 47,444 | 98,556…266,920 |
| highest shared author image RGBA pair | reanim:Zombie_charred_catapult, reanim:Zombie_charred_digger | 37,936 | 1,662,908 | 1,615,872 (768×526) | 47,036 | 460,032…1,108,804 |
| highest shared author image RGBA pair | reanim:Zombie_charred, reanim:Zombie_charred_gargantuar | 37,936 | 1,405,300 | 1,363,072 (926×368) | 42,228 | 272,136…1,048,708 |
| highest cross reanim/particle shared author image RGBA pair | particle:CatapultExplosion, reanim:Zombie_catapult | 14,868 | 701,572 | 669,300 (485×345) | 32,272 | 212,028…425,000 |
| highest cross reanim/particle shared author image RGBA pair | particle:ZamboniExplosion, particle:ZamboniExplosion2, particle:ZamboniSmoke, particle:ZamboniTire, reanim:zombatar_zombie_head, reanim:Zombie_zamboni | 12,096 | 1,720,240 | 1,688,032 (1819×232) | 32,208 | 756,192…899,632 |
| highest cross reanim/particle shared author image RGBA pair | particle:ZamboniExplosion, particle:ZamboniExplosion2, particle:ZamboniSmoke, particle:ZamboniTire, reanim:Zombie_credits_dance, reanim:Zombie_zamboni | 12,096 | 932,960 | 901,888 (542×416) | 31,072 | 113,488…757,328 |
| highest cross reanim/particle shared author image RGBA pair | particle:ZamboniExplosion, particle:ZamboniExplosion2, particle:ZamboniSmoke, particle:ZamboniTire, reanim:Zombie_credits_conehead, reanim:Zombie_zamboni | 12,096 | 885,552 | 855,576 (459×466) | 29,976 | 67,176…758,424 |
| highest cross reanim/particle shared author image RGBA pair | particle:ZamboniExplosion, particle:ZamboniExplosion2, particle:ZamboniSmoke, particle:ZamboniTire, reanim:Zombie_paper, reanim:Zombie_zamboni | 12,096 | 1,056,720 | 1,027,728 (468×549) | 28,992 | 239,328…759,408 |
| zombie_body_family | reanim:Zombie, reanim:Zombie_flagpole, reanim:Zombie_polevaulter | 16,636 | 480,940 | 452,364 (253×447) | 28,576 | 157,364…385,764 |
| highest cross reanim/particle shared author image RGBA pair | particle:ZamboniExplosion, particle:ZamboniExplosion2, particle:ZamboniSmoke, particle:ZamboniTire, reanim:Zombie_credits_screendoor, reanim:Zombie_zamboni | 12,096 | 923,760 | 895,384 (542×413) | 28,376 | 106,984…760,024 |
| highest cross reanim/particle shared author image RGBA pair | particle:MowerCloud, particle:ZamboniExplosion, particle:ZamboniExplosion2, particle:ZamboniSmoke, particle:ZamboniTire, reanim:Zombie_zamboni | 25,600 | 816,624 | 788,400 (450×438) | 28,224 | 0…760,176 |
| highest cross reanim/particle shared author image RGBA pair | particle:ZamboniExplosion, particle:ZamboniExplosion2, particle:ZamboniSmoke, particle:ZamboniTire, reanim:LoadBar_Zombiehead, reanim:Zombie_zamboni | 12,096 | 816,696 | 788,736 (624×316) | 27,960 | 336…760,440 |
| highest cross reanim/particle shared author image RGBA pair | particle:ZamboniExplosion, particle:ZamboniExplosion2, particle:ZamboniSmoke, particle:ZamboniTire, reanim:Zombie, reanim:Zombie_zamboni | 12,096 | 1,083,400 | 1,055,700 (1035×255) | 27,700 | 267,300…760,700 |
| highest cross reanim/particle shared author image RGBA pair | particle:ZamboniExplosion, particle:ZamboniExplosion2, particle:ZamboniSmoke, particle:ZamboniTire, reanim:Zombie_polevaulter, reanim:Zombie_zamboni | 12,096 | 907,740 | 882,420 (573×385) | 25,320 | 94,020…763,080 |
| highest cross reanim/particle shared author image RGBA pair | particle:ZombieNewspaperHead, reanim:Zombie_paper | 3,800 | 292,256 | 283,800 (430×165) | 8,456 | 15,480…259,864 |
| highest cross reanim/particle shared author image RGBA pair | particle:ZombiePogoHead, reanim:Zombie_paper | 3,800 | 291,012 | 284,832 (414×172) | 6,180 | 16,512…262,140 |
| highest cross reanim/particle shared author image RGBA pair | particle:ZombieMustache, reanim:Zombie | 4,400 | 300,616 | 295,000 (125×590) | 5,616 | 0…289,384 |
| highest cross reanim/particle shared author image RGBA pair | particle:ZombieNewspaperHead, reanim:Zombie_pogo | 3,800 | 149,360 | 143,960 (122×295) | 5,400 | 18,536…120,024 |
| highest cross reanim/particle shared author image RGBA pair | particle:UmbrellaReflect, reanim:Zombie_catapult | 3,844 | 462,172 | 457,272 (657×174) | 4,900 | 0…452,372 |
| snow_pea_particles | particle:BossIceBallTrail, particle:IceBallDeath, particle:SnowPeaPuff, particle:SnowPeaSplat, particle:SnowPeaTrail | 1,452 | 148,724 | 144,624 (524×69) | 4,100 | 17,388…138,480 |
| boss_iceball | particle:BossIceBallTrail, particle:IceballTrail, particle:IceBallDeath, particle:SnowPeaTrail, reanim:Zombie_boss_iceball | 0 | 629,444 | 625,784 (179×874) | 3,660 | 19,332…619,640 |
| magnet_family | reanim:GoldMagnet, reanim:Magnetshroom | 0 | 577,400 | 575,232 (448×321) | 2,168 | 263,712…309,352 |
| portal_circle | particle:PortalCircle, particle:PortalSquare, reanim:Portal_Circle | 0 | 148,992 | 147,392 (112×329) | 1,600 | 0…145,792 |
| puff_family | reanim:PuffShroom, reanim:SeaShroom | 0 | 73,800 | 73,304 (187×98) | 496 | 35,000…37,808 |
| zombie_debris | particle:MoweredZombieArm, particle:MoweredZombieHead, particle:ZombieArm, particle:ZombieHead, particle:ZombieHeadPool, reanim:Zombie | 0 | 319,160 | 318,780 (231×345) | 380 | 23,780…312,300 |
| ice_trap_particles | particle:IceTrap, particle:IceTrapRelease, particle:IceTrapZombie | 0 | 12,588 | 12,780 (71×45) | -192 | 6,156…6,816 |
| boss_fireball | particle:FireballTrail, particle:FireballDeath, particle:ZombieBossFireball, reanim:Zombie_boss_fireball | 0 | 1,080,944 | 1,082,048 (638×424) | -1,104 | 160,776…1,063,400 |
| portal_square | particle:PortalCircle, particle:PortalSquare, reanim:Portal_Square | 0 | 77,000 | 82,812 (67×309) | -5,812 | 7,412…81,212 |
| credits_with_brain_throat | reanim:Credits_AnyHour, reanim:Credits_BigBrain, reanim:Credits_Main, reanim:Credits_Main2, reanim:Credits_Main3, reanim:Credits_Throat, reanim:Credits_WeAreTheUndead, reanim:ZombiesWon | 0 | 25,291,884 | 25,376,464 (1412×4493) | -84,580 | 2,923,696…22,537,348 |

### Remaining decisions

- zombie_credits_family: incremental native saving 360,808 bytes; union 311,264 bytes. Two credits variants are source subsets of Zombie; the dance variant adds a small set of images.
- explosion_particles: incremental native saving 326,228 bytes; union 629,624 bytes. A smaller particle-only alternative to extending the vehicle family.
- zamboni_with_explosion_particles: incremental native saving 507,772 bytes; union 1,236,480 bytes. Largest measured explosion union; it overlaps the particle-only alternative, so choose one.

### Source-subset candidates

- zombie_credits_family: compiled/reanim/zombie_credits_conehead.atlas.png, compiled/reanim/zombie_credits_screendoor.atlas.png; incremental native saving 360,808 bytes. Expanded members: reanim:Zombie, reanim:Zombie_credits_conehead, reanim:Zombie_credits_dance, reanim:Zombie_credits_screendoor. Other candidate sources still add pixels beyond each individual current atlas.
- highest shared author image RGBA pair: compiled/reanim/zombie_credits_screendoor.atlas.png; incremental native saving 135,360 bytes. Expanded members: reanim:Zombie, reanim:Zombie_credits_screendoor. The complete union source set already exists in compiled/reanim/zombie.atlas.png.
- highest shared author image RGBA pair: compiled/reanim/zombie_credits_conehead.atlas.png; incremental native saving 97,152 bytes. Expanded members: reanim:Zombie, reanim:Zombie_credits_conehead. The complete union source set already exists in compiled/reanim/zombie.atlas.png.
- highest cross reanim/particle shared author image RGBA pair: compiled/particles/mowercloud.atlas.png; incremental native saving 28,224 bytes. Expanded members: particle:MowerCloud, particle:ZamboniExplosion, particle:ZamboniExplosion2, particle:ZamboniSmoke, particle:ZamboniTire, reanim:Zombie_zamboni. The complete union source set already exists in compiled/atlases/zamboni_family.atlas.png.
- highest cross reanim/particle shared author image RGBA pair: compiled/particles/zombiemustache.atlas.png; incremental native saving 5,616 bytes. Expanded members: particle:ZombieMustache, reanim:Zombie. The complete union source set already exists in compiled/reanim/zombie.atlas.png.
- highest cross reanim/particle shared author image RGBA pair: compiled/particles/umbrellareflect.atlas.png; incremental native saving 4,900 bytes. Expanded members: particle:UmbrellaReflect, reanim:Zombie_catapult. The complete union source set already exists in compiled/reanim/zombie_catapult.atlas.png.

## Connectivity diagnostics

There are 11 nontrivial shared-author-image components. Their sizes are 76, 14, 5, 3, 3, 2, 2, 2, 2, 2, 2.
These are not merge recommendations. Current full preloading does make these definitions co-resident, but a tiny shared sprite does not justify a large union: packing, size limits, future scene loading and eviction boundaries still matter.

## Reproduce

```powershell
python tools/audit_definition_atlas_overlap.py
```

The tool checks all selected source DSL author image names against the cache, allowing only case aliases with verified identical current decoded pixels and aborting on other mismatches. It records SHA-256 values for the manifest, build configuration and each source DSL in the JSON. All original referenced images are re-decoded by definition_atlas.logical_image, including alpha composition. Source descriptors come from definition_atlas.authoring_descriptors and resources.json. The audit never reads program image IDs or historical symbol registry binaries, and does not compile the program numeric resource manifest. The tool aborts if current dimensions or RGBA pixels differ from the cached fingerprints. It never writes runtime assets, DSLs or build settings.

For additional pairs or alternate source/cache paths, use `--help`. The JSON includes every overlapping pair, exact-RGBA statistics and full component memberships.
