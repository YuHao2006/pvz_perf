# 旗杆留白与动画原点修正

原版 `Zombie_flagpole.png` 的画布为 86×110，非透明区域集中在 `(1,36)-(33,109)`。此前将高清杆身撑满画布，造成杆身过长、过粗。

先将高清杆身对回原版占用位置，然后把运行画布裁为 32×73。`Zombie_flagpole` 的杆身轨道旋转角固定，因此可将裁剪偏移在每个关键帧中补偿为 `translation += M * (1,36)`；关键帧间的缩放与位置插值仍保持同一几何关系。该操作没有增加运行实例字段、运行时分支或每帧运算。两个旗帜外观共用同一杆身。

- `Zombie_flagpole-source.png`：未缩小的重植版来源。
- `Zombie_flagpole-original-canvas.png`、`Zombie_flagpole-original-definition.dsl`：修改前的原版画布和定义。
- `Zombie_flagpole-4x.png`：保留完整原画布的 4 倍修正母版。
- `Zombie_flagpole-trimmed-4x.png`：对应新动画定义的 128×292 裁剪母版；当前运行图由它缩小一半。
- `mapping.json`、`trim-validation.json`：配准、裁剪和插值校验记录。

对于旋转角会在关键帧之间变化的轨道，不能直接用关键帧位移补偿替代局部原点偏移，否则插值中间位置会发生变化。本次只修改已经核对为固定角度的旗杆轨道。
