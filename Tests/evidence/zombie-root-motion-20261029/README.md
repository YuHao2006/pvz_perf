# 僵尸根运动：速度累加与相位求值

MSVC 14.51、Release /GL /LTCG；LP14，11x由用户控制，未独立读回。两个独立进程串行，每内核预热一次、五轮各200万更新，计时步长10ms；报告各进程min-of-5。源码链接当前实际游戏对象与当前四种定义的_ground关键帧。

legacy_velocity_accumulate重建原GetFrameTime/GetTrackVelocity的浮点算术与速度累加，预先解析轨道下标；它不是直接调用原版EXE。current_root_method调用实际Reanimation::RootMotion，包括MPHF轨道定位；current_root_resolved使用同一求值算术但预先解析下标，用于分离查找成本。三侧都有相同的不可内联调用屏障与位置checksum，不包含完整僵尸状态机、碰撞、绘制或变速重绑定。

60秒精度实验使用100/120/200/240/1000Hz，最后不足一拍的纳秒也处理。四种定义当前结果在所有步长下逐位相同，并与独立解析参考相差不超过0.002px；实际最大误差见accuracy.csv。MSVC的long double与double精度相同，参考的独立性在公式实现，不声称更高硬件精度。旧积分与解析结果无需相同，不能将其checksum不同当错误。

当前相位求值较慢；收益是不同步长下的位置一致性，不登记为CPU优化。预解析路径是诊断，不是已经落地的生产加速。定义名/rate只用于受控负载，不代表游戏所有状态的实际速度。
