export component Zombie_Boss_driver {
    fps: 17;
    Track {
        source-name: "anim_swell";
        frame-count: 187;
        frame 9 { cel: -1; }
        frame 10 { cel: -10000; }
    }
    Track {
        source-name: "anim_idle";
        frame-count: 187;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 9 { cel: 0; }
        frame 10 { cel: -10000; }
        frame 24 { cel: -1; }
        frame 25 { cel: -10000; }
    }
    Track {
        source-name: "anim_drive";
        frame-count: 187;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 24 { cel: 0; }
        frame 25 { cel: -10000; }
        frame 49 { cel: -1; }
        frame 50 { cel: -10000; }
    }
    Track {
        source-name: "anim_damage";
        frame-count: 187;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 49 { cel: 0; }
        frame 50 { cel: -10000; }
        frame 61 { cel: -1; }
        frame 62 { cel: -10000; }
    }
    Track {
        source-name: "anim_laugh";
        frame-count: 187;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 65 { cel: 0; }
        frame 66 { cel: -10000; }
        frame 78 { cel: -1; }
        frame 79 { cel: -10000; }
    }
    Track {
        source-name: "anim_death";
        frame-count: 187;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 78 { cel: 0; }
        frame 79 { cel: -10000; }
        frame 164 { cel: -1; }
        frame 165 { cel: -10000; }
    }
    Track {
        source-name: "anim_flag";
        frame-count: 187;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 164 { cel: 0; }
        frame 165 { cel: -10000; }
        frame 178 { cel: -1; }
        frame 179 { cel: -10000; }
    }
    Track {
        source-name: "anim_flag_loop";
        frame-count: 187;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 178 { cel: 0; }
        frame 179 { cel: -10000; }
    }
    Track {
        source-name: "flagpole";
        frame-count: 187;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 164 { x: 42.7000008; y: 111; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_ZOMBIE_BOSS_FLAGPOLE; }
        frame 165 { x: -10000; y: 105.800003; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 166 { y: 100.800003; }
        frame 167 { y: 95.5999985; }
        frame 168 { y: 90.5; }
        frame 169 { y: 85.3000031; }
        frame 170 { y: 80.1999969; }
        frame 171 { y: 75.0999985; }
        frame 172 { x: 42.7999992; y: 69.9000015; }
        frame 173 { x: -10000; y: 64.8000031; }
        frame 174 { y: 59.5999985; }
        frame 175 { y: 54.5; }
        frame 176 { y: 49.4000015; }
        frame 177 { y: 44.2999992; }
        frame 178 { x: 42.7000008; y: 39.0999985; }
        frame 179 { x: -10000; y: -10000; }
    }
    Track {
        source-name: "flag";
        frame-count: 187;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 164 { x: 46.2999992; y: 111.599998; skew-x: 81.5; scale-x: 0.338999987; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_ZOMBIE_BOSS_FLAG; }
        frame 165 { x: 46.2000008; y: 106.400002; skew-x: 81.6999969; scale-x: 0.338; scale-y: -10000; cel: -10000; image: none; }
        frame 166 { x: 46.0999985; y: 101.199997; skew-x: -10000; scale-x: -10000; }
        frame 167 { x: 46; y: 96.0999985; }
        frame 168 { x: 45.9000015; y: 90.9000015; }
        frame 169 { x: 45.7999992; y: 85.6999969; }
        frame 170 { x: 45.5999985; y: 80.5999985; }
        frame 171 { x: 45.5; y: 75.4000015; }
        frame 172 { x: 45.4000015; y: 70.1999969; }
        frame 173 { x: 45.2999992; y: 65.0999985; skew-x: 81.5; scale-x: 0.338999987; }
        frame 174 { x: 45.7999992; y: 59.0999985; skew-x: 65.1999969; scale-x: 0.430000007; }
        frame 175 { x: 45.0999985; y: 54.9000015; skew-x: 48.9000015; scale-x: 0.522000015; }
        frame 176 { x: 44.7999992; y: 49.5999985; skew-x: 32.5999985; scale-x: 0.614000022; }
        frame 177 { x: 44.2000008; y: 44.0999985; skew-x: 16.2999992; scale-x: 0.707000017; }
        frame 178 { x: 44.4000015; y: 40.5; skew-x: 0; scale-x: 0.800000012; }
        frame 179 { x: -10000; y: -10000; skew-x: 2; scale-x: 0.759000003; }
        frame 180 { skew-x: 4.4000001; scale-x: 0.718999982; }
        frame 181 { skew-x: 2; scale-x: 0.759000003; }
        frame 182 { skew-x: 0; scale-x: 0.800000012; }
        frame 183 { skew-x: -1.70000005; scale-x: 0.77700001; }
        frame 184 { skew-x: -3.5999999; scale-x: 0.754000008; }
        frame 185 { skew-x: -1.70000005; scale-x: 0.77700001; }
        frame 186 { skew-x: 0; scale-x: 0.800000012; }
    }
    Track {
        source-name: "Driver_innerarm_upper";
        frame-count: 187;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 9 { x: 39.9000015; y: 58.7000008; skew-x: 39.2999992; skew-y: 39.2999992; scale-x: 0.73299998; scale-y: 0.73299998; cel: 0; image: IMAGE_REANIM_ZOMBIE_BOSSDRIVER_UPPERARM; }
        frame 10 { x: 39.0999985; y: 59; skew-x: 36.9000015; skew-y: 36.9000015; scale-x: 0.731999993; scale-y: 0.731999993; cel: -10000; image: none; }
        frame 11 { x: 38.4000015; y: 59.2000008; skew-x: 34.5999985; skew-y: 34.5999985; scale-x: -10000; scale-y: -10000; }
        frame 12 { x: 37.5999985; y: 59.5; skew-x: 32.4000015; skew-y: 32.4000015; }
        frame 13 { x: 36.7999992; y: 59.9000015; skew-x: 30.1000004; skew-y: 30.1000004; }
        frame 14 { x: 36; y: 60.2999992; skew-x: 27.7999992; skew-y: 27.7999992; }
        frame 15 { x: 35.4000015; y: 60.5999985; skew-x: 25.6000004; skew-y: 25.6000004; }
        frame 16 { x: 34.5999985; y: 61.0999985; skew-x: 23.3999996; skew-y: 23.3999996; scale-x: 0.73299998; scale-y: 0.73299998; }
        frame 17 { x: 35.4000015; y: 60.7999992; skew-x: 25.6000004; skew-y: 25.6000004; scale-x: 0.731999993; scale-y: 0.731999993; }
        frame 18 { x: 36; y: 60.2999992; skew-x: 27.7999992; skew-y: 27.7999992; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 36.9000015; y: 60; skew-x: 30.1000004; skew-y: 30.1000004; }
        frame 20 { x: 37.5; y: 59.5999985; skew-x: 32.4000015; skew-y: 32.4000015; }
        frame 21 { x: 38.2999992; y: 59.2999992; skew-x: 34.5999985; skew-y: 34.5999985; }
        frame 22 { x: 39; y: 59; skew-x: 36.9000015; skew-y: 36.9000015; }
        frame 23 { x: 39.9000015; y: 58.7000008; skew-x: 39.2999992; skew-y: 39.2999992; scale-x: 0.73299998; scale-y: 0.73299998; }
        frame 24 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 41.4000015; y: 58.5; skew-x: 44.0999985; skew-y: 44.0999985; scale-x: 0.731999993; scale-y: 0.762000024; }
        frame 26 { x: 43; y: 58.4000015; skew-x: 48.9000015; skew-y: 48.9000015; scale-x: -10000; scale-y: 0.791999996; }
        frame 27 { x: 44.5999985; y: 58.5; skew-x: 53.9000015; skew-y: 53.9000015; scale-y: 0.822000027; }
        frame 28 { x: 46.0999985; y: 58.9000015; skew-x: 58.7000008; skew-y: 58.7000008; scale-y: 0.851000011; }
        frame 29 { x: 47.7999992; y: 59.4000015; skew-x: 63.7000008; skew-y: 63.7000008; scale-x: 0.731000006; scale-y: 0.880999982; }
        frame 30 { x: 49.4000015; y: 60; skew-x: 68.4000015; skew-y: 68.4000015; scale-x: 0.731999993; scale-y: 0.912; }
        frame 31 { x: 47.7999992; y: 59.4000015; skew-x: 63.7000008; skew-y: 63.7000008; scale-x: 0.731000006; scale-y: 0.880999982; }
        frame 32 { x: 46.2000008; y: 58.9000015; skew-x: 58.7000008; skew-y: 58.7000008; scale-x: 0.731999993; scale-y: 0.851000011; }
        frame 33 { x: 44.5999985; y: 58.5; skew-x: 53.9000015; skew-y: 53.9000015; scale-x: -10000; scale-y: 0.822000027; }
        frame 34 { x: 43; y: -10000; skew-x: 48.9000015; skew-y: 48.9000015; scale-y: 0.791999996; }
        frame 35 { x: 41.4000015; skew-x: 44.0999985; skew-y: 44.0999985; scale-y: 0.762000024; }
        frame 36 { x: 39.9000015; y: 58.7000008; skew-x: 39.2999992; skew-y: 39.2999992; scale-x: 0.73299998; scale-y: 0.73299998; }
        frame 37 { x: 40.4000015; y: 59.2999992; skew-x: 37.7999992; skew-y: 37.7999992; scale-x: 0.731999993; scale-y: 0.731999993; }
        frame 38 { x: 41; y: 60; skew-x: 36.2999992; skew-y: 36.2999992; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 41.5999985; y: 60.5999985; skew-x: 34.7999992; skew-y: 34.7999992; }
        frame 40 { x: 42.2000008; y: 61.2999992; skew-x: 33.4000015; skew-y: 33.4000015; scale-x: 0.731000006; scale-y: 0.731000006; }
        frame 41 { x: 42.7000008; y: 61.9000015; skew-x: 31.8999996; skew-y: 31.8999996; scale-x: -10000; scale-y: -10000; }
        frame 42 { x: 43.2999992; y: 62.5; skew-x: 30.5; skew-y: 30.5; scale-x: 0.731999993; scale-y: 0.731999993; }
        frame 43 { x: 42.7000008; y: 61.9000015; skew-x: 31.8999996; skew-y: 31.8999996; scale-x: 0.731000006; scale-y: 0.731000006; }
        frame 44 { x: 42.0999985; y: 61.2000008; skew-x: 33.4000015; skew-y: 33.4000015; scale-x: -10000; scale-y: -10000; }
        frame 45 { x: 41.5; y: 60.5999985; skew-x: 34.7999992; skew-y: 34.7999992; scale-x: 0.731999993; scale-y: 0.731999993; }
        frame 46 { x: 40.9000015; y: 60; skew-x: 36.2999992; skew-y: 36.2999992; scale-x: -10000; scale-y: -10000; }
        frame 47 { x: 40.4000015; y: 59.4000015; skew-x: 37.7999992; skew-y: 37.7999992; }
        frame 48 { x: 39.9000015; y: 58.7000008; skew-x: 39.2999992; skew-y: 39.2999992; scale-x: 0.73299998; scale-y: 0.73299998; }
        frame 49 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: 54.7999992; y: 57; skew-x: 51.4000015; skew-y: 51.4000015; scale-x: 0.731000006; scale-y: 0.89200002; }
        frame 51 { x: 70.0999985; skew-x: 63.4000015; skew-y: 63.4000015; scale-x: -10000; scale-y: 1.05400002; }
        frame 52 { x: 83.3000031; y: 61; skew-x: 75.5; skew-y: 75.5; scale-x: 0.730000019; scale-y: 1.21399999; }
        frame 53 { x: 96.1999969; y: 66.4000015; skew-x: 87.4000015; skew-y: 87.4000015; scale-x: -10000; scale-y: 1.37699997; }
        frame 54 { x: 89.8000031; y: 62.9000015; skew-x: 80.6999969; skew-y: 80.6999969; scale-y: 1.31099999; }
        frame 55 { x: 83.3000031; y: 59.9000015; skew-x: 73.9000015; skew-y: 73.9000015; scale-y: 1.24399996; }
        frame 56 { x: 76.4000015; y: 57.0999985; skew-x: 66.9000015; skew-y: 66.9000015; scale-y: 1.17999995; }
        frame 57 { x: 67.0999985; y: 56.7000008; skew-x: 60.0999985; skew-y: 60.0999985; scale-y: 1.06599998; }
        frame 58 { x: 57.9000015; y: 56.5999985; skew-x: 53.0999985; skew-y: 53.0999985; scale-x: 0.731000006; scale-y: 0.954999983; }
        frame 59 { x: 48.7000008; y: 57.4000015; skew-x: 46.0999985; skew-y: 46.0999985; scale-x: -10000; scale-y: 0.842999995; }
        frame 60 { x: 39.9000015; y: 58.7000008; skew-x: 39.2999992; skew-y: 39.2999992; scale-x: 0.73299998; scale-y: 0.73299998; }
        frame 61 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 62 { x: 40.5; skew-x: 40.7999992; skew-y: 40.7999992; scale-x: 0.731999993; scale-y: 0.731999993; }
        frame 63 { x: 41.2000008; y: 58.7999992; skew-x: 42.2999992; skew-y: 42.2999992; scale-x: -10000; scale-y: -10000; }
        frame 64 { x: 41.9000015; y: -10000; skew-x: 43.9000015; skew-y: 43.9000015; }
        frame 65 { x: 42.5; y: 58.9000015; skew-x: 45.2999992; skew-y: 45.2999992; scale-x: 0.73299998; scale-y: 0.73299998; }
        frame 66 { x: 42.4000015; y: 58.4000015; skew-x: 44.4000015; skew-y: 44.4000015; scale-x: 0.731999993; scale-y: 0.731999993; }
        frame 67 { x: 42.0999985; y: 57.7999992; skew-x: 43.2999992; skew-y: 43.2999992; scale-x: 0.73299998; scale-y: 0.73299998; }
        frame 68 { x: 42.2999992; y: 58.4000015; skew-x: 44.4000015; skew-y: 44.4000015; scale-x: 0.731999993; scale-y: 0.731999993; }
        frame 69 { x: 42.5; y: 58.9000015; skew-x: 45.2999992; skew-y: 45.2999992; scale-x: 0.73299998; scale-y: 0.73299998; }
        frame 70 { x: 42.4000015; y: 58.4000015; skew-x: 44.4000015; skew-y: 44.4000015; scale-x: 0.731999993; scale-y: 0.731999993; }
        frame 71 { x: 42.0999985; y: 57.7999992; skew-x: 43.2999992; skew-y: 43.2999992; scale-x: 0.73299998; scale-y: 0.73299998; }
        frame 72 { x: 42.2999992; y: 58.4000015; skew-x: 44.4000015; skew-y: 44.4000015; scale-x: 0.731999993; scale-y: 0.731999993; }
        frame 73 { x: 42.5; y: 58.9000015; skew-x: 45.2999992; skew-y: 45.2999992; scale-x: 0.73299998; scale-y: 0.73299998; }
        frame 74 { x: 42.4000015; y: 58.4000015; skew-x: 44.4000015; skew-y: 44.4000015; scale-x: 0.731999993; scale-y: 0.731999993; }
        frame 75 { x: 42.0999985; y: 57.7999992; skew-x: 43.2999992; skew-y: 43.2999992; scale-x: 0.73299998; scale-y: 0.73299998; }
        frame 76 { x: 42.2999992; y: 58.4000015; skew-x: 44.4000015; skew-y: 44.4000015; scale-x: 0.731999993; scale-y: 0.731999993; }
        frame 77 { x: 42.5; y: 58.9000015; skew-x: 45.2999992; skew-y: 45.2999992; scale-x: 0.73299998; scale-y: 0.73299998; }
        frame 78 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 79 { x: 49.2999992; y: 48.7000008; skew-x: 47.9000015; skew-y: 47.9000015; scale-x: 0.731000006; scale-y: 0.911000013; }
        frame 80 { x: 56.2000008; y: 38.5; skew-x: 50.2999992; skew-y: 50.2999992; scale-x: 0.731999993; scale-y: 1.09200001; }
        frame 81 { x: 56.2999992; y: 38.5999985; skew-x: 50.4000015; skew-y: 50.4000015; scale-x: 0.730000019; scale-y: 1.09099996; }
        frame 82 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: 1.09200001; }
        frame 83 { x: 56.5; y: 38.7000008; scale-x: 0.728999972; scale-y: -10000; }
        frame 84 { x: 56.5999985; y: 38.5999985; scale-x: -10000; scale-y: 1.09300005; }
        frame 85 { x: 56.7999992; y: -10000; skew-x: 50.5999985; scale-x: 0.727999985; scale-y: 1.09399998; }
        frame 86 { x: -10000; skew-x: -10000; scale-x: -10000; scale-y: 1.09500003; }
        frame 87 { x: 56.9000015; skew-x: 50.7000008; skew-y: 50.5999985; scale-x: 0.726999998; scale-y: 1.09599996; }
        frame 88 { x: 57; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: 1.097; }
        frame 89 { x: 57.0999985; skew-x: 50.9000015; scale-x: 0.726000011; scale-y: -10000; }
        frame 90 { x: 57.2999992; skew-x: -10000; scale-x: -10000; scale-y: 1.09800005; }
        frame 91 { x: 57.4000015; skew-y: 50.7000008; scale-x: 0.725000024; scale-y: 1.09899998; }
        frame 92 { x: 57.5; skew-y: -10000; scale-x: -10000; scale-y: 1.10000002; }
        frame 93 { x: -10000; scale-x: 0.723999977; scale-y: 1.10099995; }
        frame 94 { x: 57.5999985; skew-x: 51.0999985; skew-y: 50.9000015; scale-x: -10000; scale-y: -10000; }
        frame 95 { x: 57.9000015; skew-x: -10000; skew-y: -10000; scale-x: 0.72299999; scale-y: 1.102; }
        frame 96 { x: -10000; scale-x: -10000; scale-y: 1.10300004; }
        frame 97 { x: 58; skew-x: 51.2000008; scale-x: 0.722000003; scale-y: 1.10399997; }
        frame 98 { x: -10000; skew-x: -10000; scale-x: 0.721000016; scale-y: 1.10500002; }
        frame 99 { x: 58.2000008; skew-x: 51.4000015; scale-x: -10000; scale-y: 1.10599995; }
        frame 100 { x: 58.2999992; skew-x: -10000; scale-x: 0.720000029; scale-y: -10000; }
        frame 101 { x: 58.5; skew-y: 51.0999985; scale-x: -10000; scale-y: 1.10699999; }
        frame 102 { x: -10000; skew-y: -10000; scale-x: 0.718999982; scale-y: 1.10800004; }
        frame 103 { x: 58.5999985; skew-x: 51.5999985; scale-x: -10000; scale-y: 1.10899997; }
        frame 104 { x: 58.7999992; skew-x: -10000; scale-x: 0.717999995; scale-y: 1.11000001; }
        frame 105 { x: -10000; y: 38.5; scale-x: -10000; scale-y: 1.11099994; }
        frame 106 { x: 59; y: 38.5999985; skew-x: 51.7000008; skew-y: 51.2000008; scale-x: 0.717000008; scale-y: -10000; }
        frame 107 { y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: 1.11199999; }
        frame 108 { x: 59.0999985; skew-x: 51.9000015; scale-x: 0.716000021; scale-y: 1.11300004; }
        frame 109 { x: 59.2999992; skew-x: -10000; skew-y: 51.4000015; scale-x: -10000; scale-y: 1.11399996; }
        frame 110 { x: 59.4000015; skew-y: -10000; scale-x: 0.714999974; scale-y: 1.11500001; }
        frame 111 { x: 59.5; scale-x: -10000; scale-y: -10000; }
        frame 112 { x: 59.5999985; scale-x: 0.713999987; scale-y: 1.11600006; }
        frame 113 { x: 59.7000008; skew-x: 52.0999985; scale-x: -10000; scale-y: 1.11699998; }
        frame 114 { x: 59.7999992; y: 38.5; skew-x: -10000; scale-x: 0.713; scale-y: 1.11800003; }
        frame 115 { x: 59.9000015; y: -10000; skew-x: 52.2000008; scale-x: 0.712000012; scale-y: 1.11899996; }
        frame 116 { x: 60; y: 38.5999985; skew-x: -10000; skew-y: 51.5999985; scale-x: -10000; scale-y: 1.12; }
        frame 117 { x: 60.0999985; y: 38.5; skew-x: 52.4000015; skew-y: -10000; scale-x: 0.711000025; scale-y: -10000; }
        frame 118 { x: 60.2999992; y: 38.5999985; skew-x: -10000; scale-x: -10000; scale-y: 1.12100005; }
        frame 119 { x: 60.4000015; y: -10000; scale-x: 0.709999979; scale-y: 1.12199998; }
        frame 120 { x: 60.5; skew-y: 51.7000008; scale-x: -10000; scale-y: 1.12300003; }
        frame 121 { x: -10000; y: 38.5; skew-y: -10000; scale-x: 0.708999991; scale-y: 1.12399995; }
        frame 122 { x: 60.5999985; y: -10000; skew-x: 52.5999985; scale-x: -10000; scale-y: 1.125; }
        frame 123 { x: 60.9000015; y: 38.5999985; skew-x: -10000; skew-y: 51.9000015; scale-x: 0.708000004; scale-y: -10000; }
        frame 124 { x: -10000; y: 38.5; skew-x: 52.7000008; skew-y: -10000; scale-x: -10000; scale-y: 1.12600005; }
        frame 125 { x: 61; y: 38.5999985; skew-x: -10000; scale-x: 0.707000017; scale-y: 1.12699997; }
        frame 126 { x: 61.0999985; y: 38.5; scale-x: -10000; scale-y: 1.12800002; }
        frame 127 { x: 61.2000008; y: -10000; skew-x: 52.9000015; scale-x: 0.70599997; scale-y: 1.12899995; }
        frame 128 { x: 61.2999992; skew-x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 129 { x: 61.5; skew-y: 52; scale-y: 1.13199997; }
        frame 130 { x: 51.7999992; y: 48.5; skew-x: 49.0999985; skew-y: 48.5999985; scale-x: 0.717999995; scale-y: 0.930999994; }
        frame 131 { x: 42.5; y: 58.9000015; skew-x: 45.2999992; skew-y: 45.2999992; scale-x: 0.73299998; scale-y: 0.73299998; }
        frame 132 { x: 40.5999985; y: -10000; skew-x: 44.4000015; skew-y: 44.4000015; scale-x: 0.742999971; scale-y: 0.721000016; }
        frame 133 { x: 38.7000008; skew-x: 43.5999985; skew-y: 43.4000015; scale-x: 0.754999995; scale-y: 0.709999979; }
        frame 134 { x: 36.7999992; skew-x: 42.7999992; skew-y: 42.5999985; scale-x: 0.76700002; scale-y: 0.699999988; }
        frame 135 { x: 40; y: 58.7999992; skew-x: 44.4000015; skew-y: 44.0999985; scale-x: 0.746999979; scale-y: 0.718999982; }
        frame 136 { x: 43; y: -10000; skew-x: 45.9000015; skew-y: 45.5999985; scale-x: 0.727999985; scale-y: 0.737999976; }
        frame 137 { x: 46.2000008; y: 58.9000015; skew-x: 47.4000015; skew-y: 47.0999985; scale-x: 0.708000004; scale-y: 0.758000016; }
        frame 138 { x: 49.2999992; y: -10000; skew-x: 49; skew-y: 48.5; scale-x: 0.689999998; scale-y: 0.777999997; }
        frame 139 { x: 45; skew-x: 47.0999985; skew-y: 46.9000015; scale-x: 0.712000012; scale-y: 0.754000008; }
        frame 140 { x: 40.7999992; skew-x: 45.2999992; skew-y: 45.0999985; scale-x: 0.735000014; scale-y: 0.730000019; }
        frame 141 { x: 36.5; skew-x: 43.4000015; skew-y: 43.2999992; scale-x: 0.759000003; scale-y: 0.708000004; }
        frame 142 { x: 41.4000015; y: 58.0999985; skew-x: 50.4000015; skew-y: 45.0999985; scale-x: 0.744000018; scale-y: 0.730000019; }
        frame 143 { x: 46.5; y: 57.5; skew-x: 57.4000015; skew-y: 46.9000015; scale-x: 0.730000019; scale-y: 0.754000008; }
        frame 144 { x: 51.5999985; y: 57.0999985; skew-x: 64.3000031; skew-y: 48.5; scale-x: 0.717000008; scale-y: 0.777999997; }
        frame 145 { x: 66.5; y: 57.2999992; skew-x: 70.4000015; skew-y: 58.7000008; scale-x: 0.686999977; scale-y: 0.916999996; }
        frame 146 { x: 81.1999969; y: 58.4000015; skew-x: 76.1999969; skew-y: 69; scale-x: 0.657000005; scale-y: 1.05799997; }
        frame 147 { x: 95.8000031; y: 60.5; skew-x: 82.1999969; skew-y: 79.0999985; scale-x: 0.626999974; scale-y: 1.199; }
        frame 148 { x: 93.0999985; y: 59; skew-x: 89; skew-y: 75.1999969; scale-x: 0.672999978; scale-y: 1.13499999; }
        frame 149 { x: 90.3000031; y: 57.7999992; skew-x: 95.3000031; skew-y: 71; scale-x: 0.718999982; scale-y: 1.07200003; }
        frame 150 { x: 87.6999969; y: 57; skew-x: 102; skew-y: 66.8000031; scale-x: 0.765999973; scale-y: 1.00999999; }
        frame 151 { x: 86.0999985; y: 68.8000031; skew-x: 99.5999985; skew-y: 75.1999969; scale-x: 0.718999982; scale-y: -10000; }
        frame 152 { x: 84.1999969; y: 80.5; skew-x: 97.3000031; skew-y: 83.6999969; scale-x: 0.672999978; }
        frame 153 { x: 82; y: 92.1999969; skew-x: 95; skew-y: 91.9000015; scale-x: 0.626999974; scale-y: 1.01100004; }
        frame 154 { x: 85.3000031; y: 102; skew-x: 94.8000031; skew-y: 91.8000031; scale-x: 0.625999987; scale-y: -10000; }
        frame 155 { x: 88.8000031; y: 111.800003; skew-x: 95; skew-y: 91.9000015; scale-x: 0.626999974; }
        frame 156 { x: -10000; y: -10000; skew-x: 94.8000031; skew-y: 91.8000031; scale-x: 0.625999987; }
        frame 157 { skew-x: 95; skew-y: 91.9000015; scale-x: 0.626999974; }
        frame 158 { skew-x: 94.8000031; skew-y: 91.8000031; scale-x: 0.625999987; }
        frame 159 { skew-x: -10000; skew-y: -10000; scale-x: -10000; }
        frame 163 { skew-x: 95; skew-y: 91.9000015; scale-x: 0.626999974; }
        frame 164 { skew-x: -10000; skew-y: -10000; scale-x: -10000; }
    }
    Track {
        source-name: "Driver_innerarm_lower2";
        frame-count: 187;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 9 { x: 14.3999996; y: 79.5999985; skew-x: 8.30000019; skew-y: 8.30000019; scale-x: 0.69599998; scale-y: 0.69599998; cel: 0; image: IMAGE_REANIM_ZOMBIE_BOSSDRIVER_LOWERARM2; }
        frame 10 { x: -10000; y: 79.6999969; skew-x: 8.80000019; skew-y: 8.80000019; scale-x: 0.694999993; scale-y: 0.694999993; cel: -10000; image: none; }
        frame 11 { x: 14.5; y: 80; skew-x: 9.30000019; skew-y: 9.30000019; scale-x: -10000; scale-y: -10000; }
        frame 12 { x: 14.6000004; y: 80.0999985; skew-x: 9.80000019; skew-y: 9.80000019; }
        frame 13 { x: -10000; y: 80.3000031; skew-x: 10.3000002; skew-y: 10.3000002; }
        frame 14 { y: 80.5; skew-x: 10.8000002; skew-y: 10.8000002; }
        frame 15 { x: 14.8000002; y: 80.5999985; skew-x: 11.5; skew-y: 11.5; }
        frame 16 { x: -10000; y: 80.8000031; skew-x: 12.1000004; skew-y: 12.1000004; }
        frame 17 { y: -10000; skew-x: 12.5; skew-y: 11.3000002; scale-x: 0.698000014; scale-y: 0.691999972; }
        frame 18 { x: 14.6999998; y: 80.6999969; skew-x: 13; skew-y: 10.8999996; scale-x: 0.700999975; scale-y: 0.689999998; }
        frame 19 { x: -10000; y: 80.5; skew-x: 12; skew-y: 10.3000002; scale-x: 0.699000001; scale-y: 0.690999985; }
        frame 20 { x: 14.6000004; y: 80.3000031; skew-x: 11; skew-y: 9.80000019; scale-x: 0.698000014; scale-y: 0.691999972; }
        frame 21 { x: 14.5; y: 80.1999969; skew-x: 10.1000004; skew-y: 9.30000019; scale-x: 0.697000027; scale-y: 0.693000019; }
        frame 22 { x: -10000; y: 79.9000015; skew-x: 9.10000038; skew-y: 8.80000019; scale-x: 0.69599998; scale-y: 0.694000006; }
        frame 23 { x: 14.3999996; y: 79.5999985; skew-x: 8.30000019; skew-y: 8.30000019; scale-x: -10000; scale-y: 0.69599998; }
        frame 24 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 25 { x: 14; y: 79.3000031; scale-x: 0.694999993; scale-y: 0.694999993; }
        frame 26 { x: 13.5; y: 79.0999985; scale-x: -10000; scale-y: -10000; }
        frame 27 { x: 13; y: 78.8000031; }
        frame 28 { x: 12.5; y: 78.5; }
        frame 29 { x: 12.1000004; y: 78.3000031; }
        frame 30 { x: 11.6000004; y: 78; scale-x: 0.69599998; scale-y: 0.69599998; }
        frame 31 { x: 12.1000004; y: 78.3000031; scale-x: 0.694999993; scale-y: 0.694999993; }
        frame 32 { x: 12.5; y: 78.5; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 13; y: 78.8000031; }
        frame 34 { x: 13.5; y: 79.0999985; }
        frame 35 { x: 14; y: 79.3000031; }
        frame 36 { x: 14.3999996; y: 79.5999985; scale-x: 0.69599998; scale-y: 0.69599998; }
        frame 37 { x: 15.6999998; y: 79.5; skew-x: 10.8000002; skew-y: 10.8000002; scale-x: 0.694999993; scale-y: 0.694999993; }
        frame 38 { x: 17; y: -10000; skew-x: 13.3000002; skew-y: 13.3000002; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 18.2999992; y: 79.4000015; skew-x: 15.8000002; skew-y: 15.8000002; }
        frame 40 { x: 19.6000004; y: 79.3000031; skew-x: 18.2999992; skew-y: 18.2999992; }
        frame 41 { x: 21; y: -10000; skew-x: 20.7999992; skew-y: 20.7999992; scale-x: 0.694000006; scale-y: 0.694000006; }
        frame 42 { x: 22.2999992; skew-x: 23.2999992; skew-y: 23.2999992; scale-x: 0.694999993; scale-y: 0.694999993; }
        frame 43 { x: 20.8999996; skew-x: 20.7999992; skew-y: 20.7999992; scale-x: 0.694000006; scale-y: 0.694000006; }
        frame 44 { x: 19.6000004; skew-x: 18.2999992; skew-y: 18.2999992; scale-x: 0.694999993; scale-y: 0.694999993; }
        frame 45 { x: 18.3999996; y: 79.5; skew-x: 15.8000002; skew-y: 15.8000002; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 17; y: 79.4000015; skew-x: 13.3000002; skew-y: 13.3000002; }
        frame 47 { x: 15.6999998; y: 79.5; skew-x: 10.8000002; skew-y: 10.8000002; }
        frame 48 { x: 14.3999996; y: 79.5999985; skew-x: 8.30000019; skew-y: 8.30000019; scale-x: 0.69599998; scale-y: 0.69599998; }
        frame 49 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: 20.1000004; y: 77.5; skew-x: 11.5; skew-y: 13.8000002; scale-x: 0.734000027; scale-y: 0.702000022; }
        frame 51 { x: 25.7999992; y: 75.5; skew-x: 14.8000002; skew-y: 19.2999992; scale-x: 0.773999989; scale-y: 0.708999991; }
        frame 52 { x: 31.7000008; y: 73.3000031; skew-x: 18; skew-y: 25.1000004; scale-x: 0.813000023; scale-y: 0.714999974; }
        frame 53 { x: 37.5; y: 71.5; skew-x: 21.2999992; skew-y: 30.7000008; scale-x: 0.852999985; scale-y: 0.72299999; }
        frame 54 { x: 34.0999985; y: 72.5999985; skew-x: 19.2999992; skew-y: 27.3999996; scale-x: 0.828999996; scale-y: 0.717999995; }
        frame 55 { x: 30.8999996; y: 73.6999969; skew-x: 17.5; skew-y: 24.2999992; scale-x: 0.806999981; scale-y: 0.713999987; }
        frame 56 { x: 27.6000004; y: 74.8000031; skew-x: 15.6000004; skew-y: 21; scale-x: 0.785000026; scale-y: 0.711000025; }
        frame 57 { x: 24.2000008; y: 76.0999985; skew-x: 13.8000002; skew-y: 17.7999992; scale-x: 0.762000024; scale-y: 0.707000017; }
        frame 58 { x: 21; y: 77.1999969; skew-x: 12; skew-y: 14.6000004; scale-x: 0.74000001; scale-y: 0.703000009; }
        frame 59 { x: 17.7000008; y: 78.4000015; skew-x: 10; skew-y: 11.3000002; scale-x: 0.717999995; scale-y: 0.699000001; }
        frame 60 { x: 14.3999996; y: 79.5999985; skew-x: 8.30000019; skew-y: 8.30000019; scale-x: 0.69599998; scale-y: 0.69599998; }
        frame 61 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 62 { scale-x: 0.694999993; scale-y: 0.694999993; }
        frame 63 { scale-x: -10000; scale-y: -10000; }
        frame 65 { scale-x: 0.69599998; scale-y: 0.69599998; }
        frame 66 { x: 14.8999996; y: 79.1999969; scale-x: 0.694999993; scale-y: 0.694999993; }
        frame 67 { x: 15.3000002; y: 78.6999969; scale-x: 0.69599998; scale-y: 0.69599998; }
        frame 68 { x: 14.8000002; y: 79.1999969; scale-x: 0.694999993; scale-y: 0.694999993; }
        frame 69 { x: 14.3999996; y: 79.5999985; scale-x: 0.69599998; scale-y: 0.69599998; }
        frame 70 { x: 14.8999996; y: 79.1999969; scale-x: 0.694999993; scale-y: 0.694999993; }
        frame 71 { x: 15.3000002; y: 78.6999969; scale-x: 0.69599998; scale-y: 0.69599998; }
        frame 72 { x: 14.8000002; y: 79.1999969; scale-x: 0.694999993; scale-y: 0.694999993; }
        frame 73 { x: 14.3999996; y: 79.5999985; scale-x: 0.69599998; scale-y: 0.69599998; }
        frame 74 { x: 14.8999996; y: 79.1999969; scale-x: 0.694999993; scale-y: 0.694999993; }
        frame 75 { x: 15.3000002; y: 78.6999969; scale-x: 0.69599998; scale-y: 0.69599998; }
        frame 76 { x: 14.8000002; y: 79.1999969; scale-x: 0.694999993; scale-y: 0.694999993; }
        frame 77 { x: 14.3999996; y: 79.5999985; scale-x: 0.69599998; scale-y: 0.69599998; }
        frame 78 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 79 { x: 16; y: 75.5; skew-x: 1.79999995; skew-y: 1.79999995; scale-x: 0.694999993; scale-y: 0.694999993; }
        frame 80 { x: 17.7999992; y: 71.5; skew-x: -4.69999981; skew-y: -4.69999981; scale-x: -10000; scale-y: -10000; }
        frame 81 { x: -10000; y: 71.5999985; skew-x: -10000; skew-y: -10000; }
        frame 82 { y: -10000; }
        frame 129 { y: 71.5; }
        frame 130 { x: 16.1000004; y: 75.5999985; skew-x: 1.79999995; skew-y: 1.79999995; }
        frame 131 { x: 14.3999996; y: 79.5999985; skew-x: 8.30000019; skew-y: 8.30000019; scale-x: 0.69599998; scale-y: 0.69599998; }
        frame 132 { x: 13.1999998; y: -10000; skew-x: -10000; skew-y: 6.5; scale-x: 0.698000014; scale-y: 0.693000019; }
        frame 133 { x: 11.8999996; skew-x: 8.10000038; skew-y: 4.80000019; scale-x: 0.700999975; scale-y: 0.690999985; }
        frame 134 { x: 10.6000004; skew-x: 8.19999981; skew-y: 3.0999999; scale-x: 0.704999983; scale-y: 0.68900001; }
        frame 135 { x: 12.6999998; skew-x: 8.10000038; skew-y: 6; scale-x: 0.699000001; scale-y: 0.694999993; }
        frame 136 { x: 14.6999998; skew-x: 8.30000019; skew-y: 9; scale-x: 0.694000006; scale-y: 0.700999975; }
        frame 137 { x: 16.7000008; skew-x: -10000; skew-y: 11.8000002; scale-x: 0.68900001; scale-y: 0.70599997; }
        frame 138 { x: 18.7000008; skew-x: 8.39999962; skew-y: 14.8999996; scale-x: 0.684000015; scale-y: 0.712000012; }
        frame 139 { x: 15.8000002; skew-x: 8.30000019; skew-y: 11.3000002; scale-x: 0.689999998; scale-y: 0.704999983; }
        frame 140 { x: 12.8000002; y: 79.6999969; skew-x: -10000; skew-y: 7.80000019; scale-x: 0.69599998; scale-y: 0.697000027; }
        frame 141 { x: 9.80000019; y: 79.5999985; skew-x: 8.19999981; skew-y: 4.4000001; scale-x: 0.703000009; scale-y: 0.689999998; }
        frame 142 { x: 12.8000002; y: -10000; skew-x: 8.30000019; skew-y: 7.80000019; scale-x: 0.69599998; scale-y: 0.697000027; }
        frame 143 { x: 15.8000002; skew-x: -10000; skew-y: 11.3000002; scale-x: 0.689999998; scale-y: 0.704999983; }
        frame 144 { x: 18.7000008; skew-x: 8.39999962; skew-y: 14.8999996; scale-x: 0.684000015; scale-y: 0.712000012; }
        frame 145 { x: 26.6000004; y: 78; skew-x: 8.5; skew-y: 18.1000004; scale-x: 0.676999986; scale-y: 0.726999998; }
        frame 146 { x: 34.4000015; y: 76.3000031; skew-x: -10000; skew-y: 21.5; scale-x: 0.670000017; scale-y: 0.741999984; }
        frame 147 { x: 42.2999992; y: 74.8000031; skew-x: 8.69999981; skew-y: 24.7999992; scale-x: 0.663999975; scale-y: 0.759000003; }
        frame 148 { x: 41.5; y: 75.4000015; skew-x: 8.5; skew-y: -10000; scale-x: -10000; scale-y: 0.758000016; }
        frame 149 { x: 40.5; y: 76.0999985; skew-x: -10000; scale-y: -10000; }
        frame 150 { x: 39.7000008; y: 76.8000031; skew-x: 8.69999981; scale-y: 0.759000003; }
        frame 151 { x: 37.9000015; y: 79.3000031; skew-x: 17; skew-y: 33.0999985; scale-x: 0.662999988; scale-y: 0.757000029; }
        frame 152 { x: 36; y: 81.9000015; skew-x: 25.2999992; skew-y: 41.5999985; scale-x: -10000; scale-y: -10000; }
        frame 153 { x: 34.2000008; y: 84.8000031; skew-x: 33.7999992; skew-y: 50; scale-y: 0.758000016; }
        frame 154 { x: 34.2999992; y: 94.5999985; skew-x: -10000; skew-y: 49.9000015; scale-x: 0.662; scale-y: 0.755999982; }
        frame 155 { x: 34.2000008; y: 104.300003; skew-y: 50; scale-x: 0.662999988; scale-y: 0.758000016; }
        frame 156 { x: 34.2999992; y: 104.400002; skew-y: 49.9000015; scale-x: 0.662; scale-y: 0.755999982; }
        frame 157 { x: 34.2000008; y: 104.300003; skew-y: 50; scale-x: 0.662999988; scale-y: 0.758000016; }
        frame 158 { x: 34.2999992; y: 104.400002; skew-y: 49.9000015; scale-x: 0.662; scale-y: 0.755999982; }
        frame 159 { x: -10000; y: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 163 { x: 34.2000008; y: 104.300003; skew-y: 50; scale-x: 0.662999988; scale-y: 0.758000016; }
        frame 164 { x: -10000; y: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Driver_innerarm_hand";
        frame-count: 187;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 9 { x: 0.899999976; y: 74; skew-x: -2.20000005; skew-y: -2.20000005; scale-x: 0.799000025; scale-y: 0.799000025; cel: 0; image: IMAGE_REANIM_ZOMBIE_BOSSDRIVER_INNERHAND; }
        frame 10 { x: -10000; y: 74.0999985; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 11 { y: -10000; }
        frame 16 { y: 74; }
        frame 17 { y: 74.0999985; }
        frame 18 { y: -10000; }
        frame 23 { y: 74; }
        frame 24 { y: -10000; }
        frame 25 { x: 0; y: 74.1999969; skew-x: -3.9000001; skew-y: -3.9000001; }
        frame 26 { x: -1.10000002; y: 74.5; skew-x: -5.9000001; skew-y: -5.9000001; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 27 { x: -2.20000005; y: 74.6999969; skew-x: -7.69999981; skew-y: -7.69999981; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: -3.29999995; y: 75.0999985; skew-x: -9.69999981; skew-y: -9.69999981; }
        frame 29 { x: -4.30000019; y: 75.3000031; skew-x: -11.6999998; skew-y: -11.6999998; }
        frame 30 { x: -5.4000001; y: 75.6999969; skew-x: -13.6000004; skew-y: -13.6000004; }
        frame 31 { x: -4.30000019; y: 75.3000031; skew-x: -11.6999998; skew-y: -11.6999998; }
        frame 32 { x: -3.29999995; y: 75; skew-x: -9.69999981; skew-y: -9.69999981; }
        frame 33 { x: -2.20000005; y: 74.6999969; skew-x: -7.69999981; skew-y: -7.69999981; }
        frame 34 { x: -1.10000002; y: 74.5; skew-x: -5.9000001; skew-y: -5.9000001; }
        frame 35 { x: -0; y: 74.1999969; skew-x: -3.9000001; skew-y: -3.9000001; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 36 { x: 0.899999976; y: 74; skew-x: -2.20000005; skew-y: -2.20000005; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 2.70000005; y: 73.1999969; skew-x: 0.800000012; skew-y: 0.800000012; }
        frame 38 { x: 4.69999981; y: 72.1999969; skew-x: 4.30000019; skew-y: 4.30000019; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 39 { x: 6.69999981; y: 71.5999985; skew-x: 7.5; skew-y: 7.5; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 8.60000038; y: 70.8000031; skew-x: 10.8000002; skew-y: 10.8000002; }
        frame 41 { x: 10.6000004; y: 70.3000031; skew-x: 14; skew-y: 14; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 42 { x: 12.6999998; y: 69.6999969; skew-x: 17.2999992; skew-y: 17.2999992; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 43 { x: 10.6000004; y: 70.1999969; skew-x: 14; skew-y: 14; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 44 { x: 8.60000038; y: 70.9000015; skew-x: 10.8000002; skew-y: 10.8000002; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 45 { x: 6.5999999; y: 71.5999985; skew-x: 7.5; skew-y: 7.5; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 4.69999981; y: 72.3000031; skew-x: 4.30000019; skew-y: 4.30000019; }
        frame 47 { x: 2.79999995; y: 73.1999969; skew-x: 0.800000012; skew-y: 0.800000012; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 48 { x: 0.899999976; y: 74; skew-x: -2.20000005; skew-y: -2.20000005; scale-x: -10000; scale-y: -10000; }
        frame 49 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 50 { x: 5.19999981; y: 72.3000031; skew-x: 4.30000019; skew-y: 4.30000019; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 51 { x: 9.69999981; y: 70.6999969; skew-x: 11.1000004; skew-y: 11.1000004; scale-x: -10000; scale-y: -10000; }
        frame 52 { x: 14.3999996; y: 69.3000031; skew-x: 17.7999992; skew-y: 17.7999992; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 53 { x: 19.2000008; y: 68.3000031; skew-x: 24.7000008; skew-y: 24.7000008; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: 16.5; y: 68.9000015; skew-x: 20.7999992; skew-y: 20.7999992; }
        frame 55 { x: 13.6999998; y: 69.4000015; skew-x: 17; skew-y: 17; }
        frame 56 { x: 11.1000004; y: 70.3000031; skew-x: 13; skew-y: 13; }
        frame 57 { x: 8.39999962; y: 71; skew-x: 9.30000019; skew-y: 9.30000019; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 58 { x: 5.80000019; y: 71.9000015; skew-x: 5.30000019; skew-y: 5.30000019; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 3.29999995; y: 72.9000015; skew-x: 1.5; skew-y: 1.5; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 60 { x: 0.899999976; y: 74; skew-x: -2.20000005; skew-y: -2.20000005; scale-x: -10000; scale-y: -10000; }
        frame 61 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 62 { y: 74.0999985; }
        frame 63 { y: -10000; }
        frame 65 { y: 74; }
        frame 66 { y: 74.0999985; }
        frame 67 { y: 74; }
        frame 68 { y: 74.0999985; }
        frame 69 { y: 74; }
        frame 70 { y: 74.0999985; }
        frame 71 { y: 74; }
        frame 72 { y: 74.0999985; }
        frame 73 { y: 74; }
        frame 74 { y: 74.0999985; }
        frame 75 { y: 74; }
        frame 76 { y: 74.0999985; }
        frame 77 { y: 74; }
        frame 78 { y: -10000; }
        frame 79 { x: 1.39999998; y: 73; skew-x: -8.69999981; skew-y: -8.69999981; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 80 { x: 2.0999999; y: 72.3000031; skew-x: -15.1999998; skew-y: -15.1999998; scale-x: -10000; scale-y: -10000; }
        frame 81 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 130 { x: 1.5; y: 73.0999985; skew-x: -8.69999981; skew-y: -8.69999981; }
        frame 131 { x: 0.899999976; y: 74; skew-x: -2.20000005; skew-y: -2.20000005; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 132 { x: -0.400000006; y: -10000; skew-x: -10000; skew-y: -3.9000001; scale-x: 0.797999978; scale-y: 0.800999999; }
        frame 133 { x: -1.79999995; y: 74; skew-y: -5.5; scale-x: 0.796999991; scale-y: 0.802999973; }
        frame 134 { x: -3.20000005; skew-y: -7.4000001; scale-x: 0.796000004; scale-y: 0.805000007; }
        frame 135 { x: -0.899999976; skew-y: -4.19999981; scale-x: 0.797999978; scale-y: 0.80400002; }
        frame 136 { x: 1.29999995; y: 73.9000015; skew-y: -1.20000005; scale-x: 0.799000025; scale-y: 0.802999973; }
        frame 137 { x: 3.5; y: 74; skew-y: 1.5; scale-x: 0.800999999; scale-y: 0.801999986; }
        frame 138 { x: 5.9000001; skew-y: 4.5999999; scale-x: 0.802999973; scale-y: 0.800999999; }
        frame 139 { x: 2.5999999; y: 73.9000015; skew-y: 1; scale-x: 0.800999999; scale-y: -10000; }
        frame 140 { x: -0.600000024; y: 74; skew-y: -2.4000001; scale-x: 0.799000025; scale-y: 0.801999986; }
        frame 141 { x: -3.9000001; skew-y: -6.0999999; scale-x: 0.796999991; scale-y: 0.802999973; }
        frame 142 { x: -0.600000024; skew-y: -2.4000001; scale-x: 0.799000025; scale-y: 0.801999986; }
        frame 143 { x: 2.5; y: -10000; skew-y: 1; scale-x: 0.800999999; scale-y: 0.800999999; }
        frame 144 { x: 5.9000001; y: 74; skew-y: 4.5999999; scale-x: 0.802999973; scale-y: -10000; }
        frame 145 { x: 14.3999996; y: 72; skew-x: 4.80000019; skew-y: 18.7999992; scale-x: 0.80400002; scale-y: 0.83099997; }
        frame 146 { x: 23.1000004; y: 71.1999969; skew-x: 11.8000002; skew-y: 33.0999985; scale-x: 0.805999994; scale-y: 0.861999989; }
        frame 147 { x: 31.6000004; y: 71.4000015; skew-x: 19.1000004; skew-y: 47.4000015; scale-x: 0.808000028; scale-y: 0.894999981; }
        frame 148 { x: 28.6000004; y: 72.3000031; skew-x: 16.2999992; skew-y: 44.5999985; scale-x: 0.806999981; scale-y: 0.893000007; }
        frame 149 { x: 25.6000004; y: 73.1999969; skew-x: 13.6000004; skew-y: 42.0999985; scale-x: 0.808000028; scale-y: 0.893999994; }
        frame 150 { x: 22.6000004; y: 74; skew-x: 11.1000004; skew-y: 39.4000015; scale-x: -10000; scale-y: 0.894999981; }
        frame 151 { x: 25.3999996; y: 74.5999985; skew-x: 19.2999992; skew-y: 44.5999985; scale-x: 0.806999981; scale-y: 0.873000026; }
        frame 152 { x: 28.2999992; y: 75.1999969; skew-x: 27.7999992; skew-y: 50.0999985; scale-x: 0.805999994; scale-y: 0.852999985; }
        frame 153 { x: 31.2000008; y: 76; skew-x: 36.2000008; skew-y: 55.4000015; scale-x: 0.806999981; scale-y: 0.833999991; }
        frame 154 { x: 36.0999985; y: 81.1999969; skew-x: 54.9000015; skew-y: 71.6999969; scale-x: 0.805000007; scale-y: 0.82099998; }
        frame 155 { x: 40.5; y: 87.8000031; skew-x: 73.5999985; skew-y: 87.6999969; scale-x: 0.805999994; scale-y: 0.81099999; }
        frame 156 { x: 39.7000008; y: 95.4000015; skew-x: 83; skew-y: 97; scale-x: 0.805000007; scale-y: 0.810000002; }
        frame 157 { x: 38.4000015; y: 103.300003; skew-x: 92.0999985; skew-y: 106.300003; scale-x: -10000; scale-y: -10000; }
        frame 158 { x: 38.2999992; y: -10000; skew-x: 92; skew-y: -10000; scale-y: 0.809000015; }
        frame 159 { x: -10000; skew-x: -10000; scale-y: -10000; }
        frame 163 { x: 38.4000015; skew-x: 92.0999985; scale-y: 0.810000002; }
        frame 164 { x: -10000; skew-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Driver_innerrarm_lower";
        frame-count: 187;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 9 { x: 16.2000008; y: 72.9000015; skew-x: 11.5; skew-y: 11.5; scale-x: 0.69599998; scale-y: 0.69599998; cel: 0; image: IMAGE_REANIM_ZOMBIE_BOSSDRIVER_LOWERARM; }
        frame 10 { x: 16.2999992; y: 73.0999985; skew-x: 11.8000002; skew-y: 11.8000002; scale-x: 0.694999993; scale-y: 0.694999993; cel: -10000; image: none; }
        frame 11 { x: 16.5; y: 73.3000031; skew-x: 12.5; skew-y: 12.5; scale-x: -10000; scale-y: -10000; }
        frame 12 { x: 16.6000004; y: 73.5; skew-x: 13; skew-y: 13; }
        frame 13 { x: 16.7000008; y: 73.8000031; skew-x: 13.5; skew-y: 13.5; }
        frame 14 { x: 16.7999992; y: 74; skew-x: 14; skew-y: 14; }
        frame 15 { x: 16.8999996; y: 74.0999985; skew-x: 14.6000004; skew-y: 14.6000004; }
        frame 16 { x: 17; y: 74.3000031; skew-x: 15.1999998; skew-y: 15.1999998; scale-x: 0.69599998; scale-y: 0.69599998; }
        frame 17 { x: 16.8999996; y: 74.1999969; skew-x: 15.6000004; skew-y: 14.6000004; scale-x: 0.698000014; scale-y: 0.691999972; }
        frame 18 { x: 16.7999992; y: -10000; skew-x: 16.2000008; skew-y: 14.1999998; scale-x: 0.702000022; scale-y: 0.68900001; }
        frame 19 { x: 16.7000008; y: 73.9000015; skew-x: 15.3000002; skew-y: 13.5; scale-x: 0.699999988; scale-y: 0.689999998; }
        frame 20 { x: 16.5; y: 73.6999969; skew-x: 14.3000002; skew-y: 13; scale-x: 0.699000001; scale-y: 0.690999985; }
        frame 21 { x: 16.3999996; y: 73.5; skew-x: 13.3000002; skew-y: 12.5; scale-x: 0.698000014; scale-y: 0.693000019; }
        frame 22 { x: -10000; y: 73.1999969; skew-x: 12.3000002; skew-y: 12; scale-x: 0.697000027; scale-y: 0.694000006; }
        frame 23 { x: 16.2000008; y: 72.9000015; skew-x: 11.5; skew-y: 11.5; scale-x: 0.69599998; scale-y: 0.69599998; }
        frame 24 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 15.8000002; y: 72.6999969; skew-x: 11.3000002; skew-y: 11.3000002; }
        frame 26 { x: 15.3000002; y: 72.3000031; skew-x: -10000; skew-y: -10000; }
        frame 27 { x: 14.8999996; y: 72.0999985; }
        frame 28 { x: 14.3999996; y: 71.8000031; }
        frame 29 { x: 13.8999996; y: 71.5999985; }
        frame 30 { x: 13.3999996; y: 71.3000031; skew-x: 11.5; skew-y: 11.5; }
        frame 31 { x: 13.8000002; y: 71.5999985; skew-x: 11.3000002; skew-y: 11.3000002; }
        frame 32 { x: 14.3000002; y: 71.8000031; skew-x: -10000; skew-y: -10000; }
        frame 33 { x: 14.8000002; y: 72.0999985; }
        frame 34 { x: 15.1999998; y: 72.3000031; }
        frame 35 { x: 15.6999998; y: 72.6999969; }
        frame 36 { x: 16.2000008; y: 72.9000015; skew-x: 11.5; skew-y: 11.5; }
        frame 37 { x: 17.7000008; y: 73; skew-x: 13.8000002; skew-y: 13.8000002; scale-x: 0.694999993; scale-y: 0.694999993; }
        frame 38 { x: 19.2999992; y: -10000; skew-x: 16.2999992; skew-y: 16.2999992; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 20.8999996; y: 73.0999985; skew-x: 18.7999992; skew-y: 18.7999992; }
        frame 40 { x: 22.3999996; y: -10000; skew-x: 21.2999992; skew-y: 21.2999992; }
        frame 41 { x: 24.1000004; y: 73.1999969; skew-x: 23.7999992; skew-y: 23.7999992; }
        frame 42 { x: 25.7000008; y: 73.3000031; skew-x: 26.5; skew-y: 26.5; }
        frame 43 { x: 24.1000004; y: -10000; skew-x: 23.7999992; skew-y: 23.7999992; }
        frame 44 { x: 22.3999996; y: 73.1999969; skew-x: 21.2999992; skew-y: 21.2999992; }
        frame 45 { x: 20.7999992; y: 73.0999985; skew-x: 18.7999992; skew-y: 18.7999992; }
        frame 46 { x: 19.2999992; y: 72.9000015; skew-x: 16.2999992; skew-y: 16.2999992; }
        frame 47 { x: 17.7999992; y: -10000; skew-x: 13.8000002; skew-y: 13.8000002; }
        frame 48 { x: 16.2000008; skew-x: 11.5; skew-y: 11.5; scale-x: 0.69599998; scale-y: 0.69599998; }
        frame 49 { x: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: 22.5; y: 71.0999985; skew-x: 14.5; skew-y: 17.1000004; scale-x: 0.73299998; scale-y: 0.703999996; }
        frame 51 { x: 29; y: 69.1999969; skew-x: 17.6000004; skew-y: 22.7999992; scale-x: 0.769999981; scale-y: 0.713; }
        frame 52 { x: 35.5; y: 67.3000031; skew-x: 20.7999992; skew-y: 28.6000004; scale-x: 0.808000028; scale-y: 0.722000003; }
        frame 53 { x: 42; y: 65.5999985; skew-x: 24; skew-y: 34.2999992; scale-x: 0.846000016; scale-y: 0.731000006; }
        frame 54 { x: 38.2000008; y: 66.6999969; skew-x: 22.1000004; skew-y: 31.1000004; scale-x: 0.824000001; scale-y: 0.725000024; }
        frame 55 { x: 34.5; y: 67.6999969; skew-x: 20.2999992; skew-y: 27.7999992; scale-x: 0.801999986; scale-y: 0.720000029; }
        frame 56 { x: 30.7999992; y: 68.6999969; skew-x: 18.5; skew-y: 24.5; scale-x: 0.781000018; scale-y: 0.714999974; }
        frame 57 { x: 27.1000004; y: 69.6999969; skew-x: 16.7999992; skew-y: 21.2999992; scale-x: 0.75999999; scale-y: 0.709999979; }
        frame 58 { x: 23.5; y: 70.6999969; skew-x: 15; skew-y: 17.7999992; scale-x: 0.737999976; scale-y: 0.704999983; }
        frame 59 { x: 19.7999992; y: 71.8000031; skew-x: 13.1000004; skew-y: 14.6000004; scale-x: 0.717000008; scale-y: 0.699999988; }
        frame 60 { x: 16.2000008; y: 72.9000015; skew-x: 11.5; skew-y: 11.5; scale-x: 0.69599998; scale-y: 0.69599998; }
        frame 61 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 62 { x: 16.2999992; skew-x: 11.3000002; skew-y: 11.3000002; }
        frame 63 { x: -10000; skew-x: -10000; skew-y: -10000; }
        frame 65 { x: 16.2000008; skew-x: 11.5; skew-y: 11.5; }
        frame 66 { x: 16.7000008; y: 72.5; skew-x: 11.3000002; skew-y: 11.3000002; }
        frame 67 { x: 17.1000004; y: 72; skew-x: 11.5; skew-y: 11.5; }
        frame 68 { x: 16.7000008; y: 72.5; skew-x: 11.3000002; skew-y: 11.3000002; }
        frame 69 { x: 16.2000008; y: 72.9000015; skew-x: 11.5; skew-y: 11.5; }
        frame 70 { x: 16.7000008; y: 72.5; skew-x: 11.3000002; skew-y: 11.3000002; }
        frame 71 { x: 17.1000004; y: 72; skew-x: 11.5; skew-y: 11.5; }
        frame 72 { x: 16.7000008; y: 72.5; skew-x: 11.3000002; skew-y: 11.3000002; }
        frame 73 { x: 16.2000008; y: 72.9000015; skew-x: 11.5; skew-y: 11.5; }
        frame 74 { x: 16.7000008; y: 72.5; skew-x: 11.3000002; skew-y: 11.3000002; }
        frame 75 { x: 17.1000004; y: 72; skew-x: 11.5; skew-y: 11.5; }
        frame 76 { x: 16.7000008; y: 72.5; skew-x: 11.3000002; skew-y: 11.3000002; }
        frame 77 { x: 16.2000008; y: 72.9000015; skew-x: 11.5; skew-y: 11.5; }
        frame 78 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 79 { x: 18.1000004; y: 67.9000015; skew-x: 4.80000019; skew-y: 9.80000019; scale-y: 0.773999989; }
        frame 80 { x: 20.2999992; y: 62.7999992; skew-x: -1.5; skew-y: 8.19999981; scale-x: 0.694999993; scale-y: 0.852999985; }
        frame 81 { x: -10000; y: -10000; skew-x: -1.39999998; skew-y: 8.30000019; scale-x: -10000; scale-y: -10000; }
        frame 82 { x: 20.3999996; skew-x: -10000; skew-y: -10000; scale-y: 0.853999972; }
        frame 83 { x: 20.5; skew-y: 8.5; scale-y: -10000; }
        frame 84 { x: -10000; skew-y: 8.60000038; scale-y: 0.855000019; }
        frame 85 { x: 20.6000004; skew-y: 8.80000019; scale-y: -10000; }
        frame 86 { x: -10000; skew-y: -10000; scale-x: 0.69599998; }
        frame 87 { x: 20.7000008; skew-y: 9; scale-x: -10000; scale-y: 0.856000006; }
        frame 88 { x: -10000; skew-y: 9.10000038; scale-y: -10000; }
        frame 89 { x: 20.7999992; skew-y: 9.30000019; scale-y: 0.856999993; }
        frame 90 { x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 91 { x: 20.8999996; skew-y: 9.5; }
        frame 92 { x: -10000; skew-y: 9.60000038; scale-y: 0.85799998; }
        frame 93 { x: 21; skew-y: 9.80000019; scale-y: -10000; }
        frame 94 { skew-y: -10000; }
        frame 95 { x: 21.1000004; skew-y: 10; scale-y: 0.859000027; }
        frame 96 { x: 21.2000008; skew-y: -10000; scale-y: -10000; }
        frame 97 { x: -10000; skew-y: 10.3000002; scale-y: 0.860000014; }
        frame 98 { x: 21.2999992; skew-y: -10000; scale-y: -10000; }
        frame 99 { x: -10000; skew-y: 10.5; }
        frame 100 { x: 21.3999996; skew-y: -10000; scale-y: 0.861000001; }
        frame 101 { x: 21.5; skew-y: 10.8000002; scale-y: -10000; }
        frame 102 { x: -10000; skew-y: -10000; scale-y: 0.861999989; }
        frame 103 { x: 21.6000004; skew-y: 11; scale-y: -10000; }
        frame 104 { x: -10000; skew-y: -10000; }
        frame 105 { x: 21.7000008; skew-y: 11.3000002; scale-y: 0.862999976; }
        frame 106 { x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 107 { x: 21.7999992; scale-y: 0.864000022; }
        frame 108 { x: -10000; skew-y: 11.5; scale-y: -10000; }
        frame 109 { skew-y: 11.6000004; }
        frame 110 { x: 21.8999996; skew-y: 11.8000002; scale-y: 0.86500001; }
        frame 111 { x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 112 { x: 22; skew-y: 12; }
        frame 113 { skew-y: 12.1000004; scale-y: 0.865999997; }
        frame 114 { x: 22.2000008; skew-y: 12.3000002; scale-y: -10000; }
        frame 115 { x: -10000; skew-y: -10000; scale-y: 0.866999984; }
        frame 116 { skew-y: 12.5; scale-y: -10000; }
        frame 117 { x: 22.2999992; skew-y: 12.6000004; }
        frame 118 { x: -10000; skew-y: 12.8000002; scale-y: 0.867999971; }
        frame 119 { x: 22.3999996; skew-y: -10000; scale-y: -10000; }
        frame 120 { x: 22.5; skew-y: 13; scale-y: 0.869000018; }
        frame 121 { x: -10000; skew-y: 13.1000004; scale-y: -10000; }
        frame 122 { x: 22.6000004; skew-y: 13.3000002; }
        frame 123 { x: -10000; skew-y: -10000; scale-y: 0.870000005; }
        frame 124 { x: 22.7000008; skew-y: 13.5; scale-y: -10000; }
        frame 125 { x: -10000; skew-y: 13.6000004; scale-y: 0.870999992; }
        frame 126 { x: 22.7999992; skew-y: 13.8000002; scale-y: -10000; }
        frame 127 { x: -10000; skew-y: -10000; }
        frame 128 { x: 23; skew-y: 14; scale-y: 0.871999979; }
        frame 129 { x: -10000; skew-x: -1.5; skew-y: 14.1000004; scale-y: 0.873000026; }
        frame 130 { x: 19.5; y: 67.9000015; skew-x: 4.80000019; skew-y: 12.8000002; scale-y: 0.783999979; }
        frame 131 { x: 16.2000008; y: 72.9000015; skew-x: 11.5; skew-y: 11.5; scale-y: 0.69599998; }
        frame 132 { x: 14.8000002; y: -10000; skew-x: 11.3000002; skew-y: 9.80000019; scale-x: 0.699999988; scale-y: 0.691999972; }
        frame 133 { x: 13.3000002; y: 72.8000031; skew-x: -10000; skew-y: 8; scale-x: 0.703999996; scale-y: 0.68900001; }
        frame 134 { x: 11.8000002; y: 72.9000015; skew-y: 6.30000019; scale-x: 0.708000004; scale-y: 0.68599999; }
        frame 135 { x: 14.1000004; y: -10000; skew-y: 9.10000038; scale-x: 0.700999975; scale-y: 0.694000006; }
        frame 136 { x: 16.6000004; skew-y: 12; scale-x: 0.694000006; scale-y: 0.700999975; }
        frame 137 { x: 18.8999996; skew-x: 11.5; skew-y: 15; scale-x: 0.68599999; scale-y: 0.708999991; }
        frame 138 { x: 21.2999992; skew-x: 11.6999998; skew-y: 17.8999996; scale-x: 0.680000007; scale-y: 0.717000008; }
        frame 139 { x: 17.8999996; y: 72.8000031; skew-x: 11.5; skew-y: 14.3000002; scale-x: 0.688000023; scale-y: 0.707000017; }
        frame 140 { x: 14.5; y: 72.9000015; skew-x: 11.3000002; skew-y: 11; scale-x: 0.69599998; scale-y: 0.697000027; }
        frame 141 { x: 11.1999998; y: -10000; skew-x: -10000; skew-y: 7.5999999; scale-x: 0.704999983; scale-y: 0.688000023; }
        frame 142 { x: 14.6000004; skew-y: 11; scale-x: 0.69599998; scale-y: 0.697000027; }
        frame 143 { x: 18; skew-x: 11.5; skew-y: 14.3000002; scale-x: 0.688000023; scale-y: 0.707000017; }
        frame 144 { x: 21.2999992; skew-x: 11.6999998; skew-y: 17.8999996; scale-x: 0.680000007; scale-y: 0.717000008; }
        frame 145 { x: 30.7999992; y: 70.5; skew-x: 14.3000002; skew-y: 23.6000004; scale-x: 0.670000017; scale-y: 0.805000007; }
        frame 146 { x: 40.5; y: 68.1999969; skew-x: 17.1000004; skew-y: 29.2999992; scale-x: 0.661000013; scale-y: 0.894999981; }
        frame 147 { x: 50.5; y: 66.3000031; skew-x: 20; skew-y: 35.2000008; scale-x: 0.652999997; scale-y: 0.986000001; }
        frame 148 { x: 49.2000008; y: 67.3000031; skew-x: 19.5; skew-y: 34.7999992; scale-x: 0.65200001; scale-y: 0.962000012; }
        frame 149 { x: 47.9000015; y: 68.0999985; skew-x: 19; skew-y: 34.2999992; scale-x: -10000; scale-y: 0.939999998; }
        frame 150 { x: 46.4000015; y: 68.8000031; skew-x: 18.5; skew-y: 33.7999992; scale-x: 0.652999997; scale-y: 0.91900003; }
        frame 151 { x: 46.5; y: 73; skew-x: 24.7999992; skew-y: 40.0999985; scale-x: 0.65200001; scale-y: 0.866999984; }
        frame 152 { x: -10000; y: 77.0999985; skew-x: 31.1000004; skew-y: 46.4000015; scale-x: 0.651000023; scale-y: 0.816999972; }
        frame 153 { x: 46.2999992; y: 81.3000031; skew-x: 37.2999992; skew-y: 52.5999985; scale-x: 0.65200001; scale-y: 0.768000007; }
        frame 154 { x: -10000; y: 91.0999985; skew-x: -10000; skew-y: -10000; scale-x: 0.651000023; scale-y: 0.76700002; }
        frame 155 { y: 100.900002; scale-x: 0.65200001; scale-y: 0.768000007; }
        frame 156 { x: 46.4000015; y: -10000; scale-x: 0.651000023; scale-y: 0.76700002; }
        frame 157 { x: 46.2999992; scale-x: 0.65200001; scale-y: 0.768000007; }
        frame 158 { x: 46.4000015; scale-x: 0.651000023; scale-y: 0.76700002; }
        frame 159 { x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 163 { x: 46.2999992; scale-x: 0.65200001; scale-y: 0.768000007; }
        frame 164 { x: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Driver_body";
        frame-count: 187;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 9 { x: 35.2000008; y: 44.7999992; skew-x: -5.69999981; skew-y: -5.69999981; scale-x: 0.799000025; scale-y: 0.978999972; cel: 0; image: IMAGE_REANIM_ZOMBIE_BOSSDRIVER_BODY; }
        frame 10 { x: 35.0999985; y: 45.0999985; skew-x: -5.9000001; skew-y: -5.9000001; scale-x: -10000; scale-y: 0.975000024; cel: -10000; image: none; }
        frame 11 { x: 34.9000015; y: 45.5; skew-x: -6.19999981; skew-y: -6.19999981; scale-y: 0.971000016; }
        frame 12 { x: 34.5999985; y: 45.7999992; skew-x: -6.4000001; skew-y: -6.4000001; scale-y: 0.967000008; }
        frame 13 { x: 34.4000015; y: 46.2000008; skew-x: -6.69999981; skew-y: -6.69999981; scale-y: 0.963999987; }
        frame 14 { x: 34.2000008; y: 46.5; skew-x: -6.9000001; skew-y: -6.9000001; scale-y: 0.959999979; }
        frame 15 { x: 34; y: 47; skew-x: -7.19999981; skew-y: -7.19999981; scale-y: 0.95599997; }
        frame 16 { x: 33.7999992; y: 47.2999992; skew-x: -7.5; skew-y: -7.5; scale-y: 0.952000022; }
        frame 17 { x: 34.0999985; y: 46.9000015; skew-x: -7.19999981; skew-y: -7.19999981; scale-y: 0.95599997; }
        frame 18 { x: 34.2999992; y: 46.5; skew-x: -6.9000001; skew-y: -6.9000001; scale-y: 0.959999979; }
        frame 19 { x: 34.5; y: 46.2000008; skew-x: -6.69999981; skew-y: -6.69999981; scale-y: 0.963999987; }
        frame 20 { x: 34.7000008; y: 45.7999992; skew-x: -6.4000001; skew-y: -6.4000001; scale-y: 0.967000008; }
        frame 21 { x: 35; y: 45.4000015; skew-x: -6.19999981; skew-y: -6.19999981; scale-y: 0.971000016; }
        frame 22 { x: 35.0999985; y: 45; skew-x: -5.9000001; skew-y: -5.9000001; scale-y: 0.975000024; }
        frame 23 { x: 35.2000008; y: 44.7999992; skew-x: -5.69999981; skew-y: -5.69999981; scale-y: 0.978999972; }
        frame 24 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 25 { x: 36.5999985; y: 44.4000015; skew-x: -4.69999981; skew-y: -4.69999981; }
        frame 26 { x: 37.7999992; y: 44.0999985; skew-x: -3.9000001; skew-y: -3.70000005; }
        frame 27 { x: 39; y: 43.9000015; skew-x: -3.20000005; skew-y: -2.70000005; }
        frame 28 { x: 40.2999992; y: 43.5999985; skew-x: -2.20000005; skew-y: -1.70000005; }
        frame 29 { x: 41.4000015; y: 43.4000015; skew-x: -1.39999998; skew-y: -0.699999988; }
        frame 30 { x: 42.5999985; y: 43; skew-x: -0.699999988; skew-y: 0.100000001; }
        frame 31 { x: 41.5; y: 43.2999992; skew-x: -1.39999998; skew-y: -0.699999988; }
        frame 32 { x: 40.2999992; y: 43.5; skew-x: -2.20000005; skew-y: -1.70000005; }
        frame 33 { x: 39; y: 43.9000015; skew-x: -3.20000005; skew-y: -2.70000005; }
        frame 34 { x: 37.7000008; y: 44; skew-x: -3.9000001; skew-y: -3.70000005; }
        frame 35 { x: 36.5; y: 44.4000015; skew-x: -4.69999981; skew-y: -4.69999981; }
        frame 36 { x: 35.2000008; y: 44.7999992; skew-x: -5.69999981; skew-y: -5.69999981; }
        frame 37 { x: 36.5999985; y: 44.4000015; skew-x: -4.69999981; skew-y: -4.69999981; }
        frame 38 { x: 37.7999992; y: 44.0999985; skew-x: -3.9000001; skew-y: -3.70000005; }
        frame 39 { x: 39; y: 43.9000015; skew-x: -3.20000005; skew-y: -2.70000005; }
        frame 40 { x: 40.2999992; y: 43.5999985; skew-x: -2.20000005; skew-y: -1.70000005; }
        frame 41 { x: 41.4000015; y: 43.4000015; skew-x: -1.39999998; skew-y: -0.699999988; }
        frame 42 { x: 42.5999985; y: 43; skew-x: -0.699999988; skew-y: 0.100000001; }
        frame 43 { x: 41.5; y: 43.2999992; skew-x: -1.39999998; skew-y: -0.699999988; }
        frame 44 { x: 40.2999992; y: 43.5; skew-x: -2.20000005; skew-y: -1.70000005; }
        frame 45 { x: 39; y: 43.9000015; skew-x: -3.20000005; skew-y: -2.70000005; }
        frame 46 { x: 37.7000008; y: 44; skew-x: -3.9000001; skew-y: -3.70000005; }
        frame 47 { x: 36.5; y: 44.4000015; skew-x: -4.69999981; skew-y: -4.69999981; }
        frame 48 { x: 35.2000008; y: 44.7999992; skew-x: -5.69999981; skew-y: -5.69999981; }
        frame 49 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 50 { x: 47.0999985; y: 44; skew-x: 2.29999995; skew-y: 2.29999995; }
        frame 51 { x: 59.4000015; y: 43.9000015; skew-x: 10.6000004; skew-y: 10.6000004; scale-x: 0.797999978; scale-y: 0.977999985; }
        frame 52 { x: 72; y: 44.5999985; skew-x: 19; skew-y: 19; scale-x: 0.796999991; scale-y: 0.976999998; }
        frame 53 { x: 84.5; y: 46.0999985; skew-x: 27.2999992; skew-y: 27.2999992; scale-x: 0.797999978; scale-y: 0.977999985; }
        frame 54 { x: 77.3000031; y: 45.2000008; skew-x: 22.5; skew-y: 22.5; scale-x: 0.796999991; scale-y: 0.976999998; }
        frame 55 { x: 70.0999985; y: 44.5; skew-x: 17.7999992; skew-y: 17.7999992; scale-x: -10000; scale-y: -10000; }
        frame 56 { x: 63; y: 44; skew-x: 13; skew-y: 13; scale-x: 0.797999978; scale-y: 0.977999985; }
        frame 57 { x: 55.9000015; y: 43.9000015; skew-x: 8.30000019; skew-y: 8.30000019; scale-x: -10000; scale-y: -10000; }
        frame 58 { x: 48.7999992; y: -10000; skew-x: 3.5; skew-y: 3.5; scale-y: 0.978999972; }
        frame 59 { x: 42; y: 44.0999985; skew-x: -0.899999976; skew-y: -0.899999976; scale-x: 0.799000025; scale-y: -10000; }
        frame 60 { x: 35.2000008; y: 44.7999992; skew-x: -5.69999981; skew-y: -5.69999981; scale-x: -10000; }
        frame 61 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 62 { x: 36; y: 44.5; skew-x: -4.9000001; skew-y: -4.9000001; }
        frame 63 { x: 36.7999992; y: 44.2999992; skew-x: -4.19999981; skew-y: -4.19999981; }
        frame 64 { x: 37.4000015; y: 44; skew-x: -3.5; skew-y: -3.5; }
        frame 65 { x: 38; y: 43.7999992; skew-x: -2.9000001; skew-y: -2.9000001; }
        frame 66 { y: 43.9000015; skew-x: -10000; skew-y: -10000; }
        frame 67 { y: 43.7999992; }
        frame 68 { y: 43.9000015; }
        frame 69 { y: 43.7999992; }
        frame 70 { y: 43.9000015; }
        frame 71 { y: 43.7999992; }
        frame 72 { y: 43.9000015; }
        frame 73 { y: 43.7999992; }
        frame 74 { y: 43.9000015; }
        frame 75 { y: 43.7999992; }
        frame 76 { y: 43.9000015; }
        frame 77 { y: 43.7999992; }
        frame 78 { x: -10000; y: -10000; }
        frame 79 { x: 44.0999985; y: 34.7000008; skew-x: 1.79999995; skew-y: 1.79999995; scale-y: 1.03999996; }
        frame 80 { x: 51.0999985; y: 25.7000008; skew-x: 7; skew-y: 7; scale-x: 0.797999978; scale-y: 1.10099995; }
        frame 81 { x: 51.2000008; y: 25.7999992; skew-x: 6.80000019; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 82 { x: 51.2999992; y: 25.7000008; skew-x: -10000; }
        frame 83 { x: 51.4000015; y: 25.7999992; skew-y: 7.0999999; }
        frame 84 { x: 51.5; y: -10000; skew-y: 7.30000019; scale-y: 1.102; }
        frame 85 { x: 51.5999985; y: 25.7000008; skew-y: -10000; scale-x: 0.796999991; scale-y: -10000; }
        frame 86 { x: 51.7999992; y: -10000; scale-x: -10000; }
        frame 87 { x: 52; y: 25.7999992; skew-y: 7.5; }
        frame 88 { y: -10000; skew-y: -10000; scale-y: 1.10300004; }
        frame 89 { x: 52.0999985; y: 25.7000008; skew-y: 7.5999999; scale-y: -10000; }
        frame 90 { x: 52.2999992; y: -10000; skew-y: 7.80000019; }
        frame 91 { x: 52.4000015; y: 25.7999992; skew-y: -10000; }
        frame 92 { x: 52.5; y: -10000; scale-x: 0.796000004; scale-y: 1.10399997; }
        frame 93 { x: 52.7000008; y: 25.7000008; skew-y: 8; scale-x: -10000; scale-y: -10000; }
        frame 94 { x: 52.7999992; y: -10000; skew-y: -10000; }
        frame 95 { x: 52.9000015; skew-y: 8.10000038; }
        frame 96 { x: 53; skew-y: 8.30000019; scale-y: 1.10500002; }
        frame 97 { x: 53.0999985; skew-y: -10000; scale-y: -10000; }
        frame 98 { x: 53.2999992; }
        frame 99 { x: 53.5; y: 25.7999992; skew-y: 8.5; scale-x: 0.795000017; }
        frame 100 { x: -10000; y: 25.7000008; skew-y: -10000; scale-x: -10000; scale-y: 1.10599995; }
        frame 101 { x: 53.5999985; y: -10000; skew-y: 8.60000038; scale-y: -10000; }
        frame 102 { x: 53.7999992; y: 25.7999992; skew-y: 8.80000019; }
        frame 103 { x: 53.9000015; y: 25.7000008; skew-y: -10000; }
        frame 104 { x: 54.0999985; y: -10000; skew-y: 9; scale-y: 1.10699999; }
        frame 105 { x: 54.2000008; skew-y: -10000; scale-y: -10000; }
        frame 106 { x: 54.2999992; y: 25.7999992; scale-x: 0.79400003; }
        frame 107 { x: 54.5; y: 25.7000008; skew-x: 7; skew-y: 9.30000019; scale-x: -10000; }
        frame 108 { x: 54.5999985; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: 1.10800004; }
        frame 109 { x: -10000; scale-y: -10000; }
        frame 110 { x: 54.9000015; skew-y: 9.5; }
        frame 111 { x: -10000; skew-y: -10000; }
        frame 112 { x: 55; skew-y: 9.60000038; scale-x: 0.792999983; scale-y: 1.10899997; }
        frame 113 { x: 55.2999992; skew-y: 9.80000019; scale-x: -10000; scale-y: -10000; }
        frame 114 { x: -10000; skew-y: -10000; }
        frame 115 { x: 55.4000015; }
        frame 116 { x: 55.5999985; skew-y: 10; scale-y: 1.11000001; }
        frame 117 { x: 55.7000008; skew-y: -10000; scale-y: -10000; }
        frame 118 { x: 55.7999992; skew-y: 10.1000004; }
        frame 119 { x: 56; skew-y: 10.3000002; scale-x: 0.791999996; }
        frame 120 { x: -10000; skew-y: -10000; scale-x: -10000; scale-y: 1.11099994; }
        frame 121 { x: 56.0999985; scale-y: -10000; }
        frame 122 { x: 56.4000015; skew-y: 10.5; }
        frame 123 { x: 56.5; skew-y: -10000; scale-y: 1.11199999; }
        frame 124 { x: -10000; skew-y: 10.6000004; scale-y: -10000; }
        frame 125 { x: 56.7999992; skew-y: 10.8000002; }
        frame 126 { x: -10000; skew-y: -10000; scale-x: 0.791000009; }
        frame 127 { x: 56.9000015; scale-x: -10000; scale-y: 1.11300004; }
        frame 128 { x: 57.2000008; skew-y: 11; scale-y: -10000; }
        frame 129 { x: 57.2999992; skew-y: 11.1000004; scale-y: 1.11399996; }
        frame 130 { x: 47.2000008; y: 34.5; skew-x: 1.79999995; skew-y: 4; scale-x: 0.795000017; scale-y: 1.046; }
        frame 131 { x: 38; y: 43.7999992; skew-x: -2.9000001; skew-y: -2.9000001; scale-x: 0.799000025; scale-y: 0.978999972; }
        frame 132 { x: 31.7000008; y: 46.0999985; skew-x: -9.69999981; skew-y: -8.5; scale-x: 0.788999975; scale-y: 0.99000001; }
        frame 133 { x: 25.5; y: 48.7999992; skew-x: -16.7000008; skew-y: -14.1999998; scale-x: 0.779999971; scale-y: 1.00100005; }
        frame 134 { x: 19.3999996; y: 51.5; skew-x: -23.6000004; skew-y: -19.8999996; scale-x: 0.772000015; scale-y: 1.01300001; }
        frame 135 { x: 26.1000004; y: 49; skew-x: -18.2000008; skew-y: -13.8999996; scale-x: 0.778999984; scale-y: 1.00399995; }
        frame 136 { x: 32.7999992; y: 46.9000015; skew-x: -13.1999998; skew-y: -7.9000001; scale-x: 0.787; scale-y: 0.995999992; }
        frame 137 { x: 39.5999985; y: 45; skew-x: -7.9000001; skew-y: -1.89999998; scale-x: 0.796000004; scale-y: 0.987999976; }
        frame 138 { x: 46.5999985; y: 43.7999992; skew-x: -2.9000001; skew-y: 3.9000001; scale-x: 0.80400002; scale-y: 0.980000019; }
        frame 139 { x: 37.4000015; y: 45.9000015; skew-x: -9.69999981; skew-y: -3.5; scale-x: 0.795000017; scale-y: 0.987999976; }
        frame 140 { x: 28.2000008; y: 48.4000015; skew-x: -16.5; skew-y: -11.1999998; scale-x: 0.786000013; scale-y: 0.996999979; }
        frame 141 { x: 19.2999992; y: 51.5; skew-x: -23.2999992; skew-y: -18.7000008; scale-x: 0.777999997; scale-y: 1.00600004; }
        frame 142 { x: 28.2000008; y: 48.4000015; skew-x: -16.5; skew-y: -11.1999998; scale-x: 0.786000013; scale-y: 0.996999979; }
        frame 143 { x: 37.4000015; y: 45.7999992; skew-x: -9.69999981; skew-y: -3.5; scale-x: 0.795000017; scale-y: 0.987999976; }
        frame 144 { x: 46.5999985; y: 43.7999992; skew-x: -2.9000001; skew-y: 3.9000001; scale-x: 0.80400002; scale-y: 0.980000019; }
        frame 145 { x: 61.9000015; y: 44.5; skew-x: 5; skew-y: 15.5; scale-x: 0.805999994; scale-y: 0.989000022; }
        frame 146 { x: 77.3000031; y: 46.7999992; skew-x: 13.1000004; skew-y: 27.2999992; scale-x: 0.808000028; scale-y: 0.999000013; }
        frame 147 { x: 92.5; y: 50.2999992; skew-x: 21.2999992; skew-y: 39.0999985; scale-x: 0.81099999; scale-y: 1.00999999; }
        frame 148 { x: 88.9000015; y: 50.5; skew-x: 18; skew-y: 35.7999992; scale-x: 0.810000002; scale-y: 1.00800002; }
        frame 149 { x: 85.1999969; y: 50.7000008; skew-x: 14.8000002; skew-y: 32.5999985; scale-x: -10000; scale-y: -10000; }
        frame 150 { x: 81.5999985; y: 51; skew-x: 11.5; skew-y: 29.2999992; scale-x: 0.81099999; scale-y: 1.00899994; }
        frame 151 { x: 83.3000031; y: 60.2000008; skew-x: 14.8000002; skew-y: 32.5999985; scale-x: 0.810000002; scale-y: 1.00800002; }
        frame 152 { x: 84.8000031; y: 69.5; skew-x: 18; skew-y: 35.7999992; scale-x: -10000; scale-y: -10000; }
        frame 153 { x: 86.5; y: 78.6999969; skew-x: 21.2999992; skew-y: 39.0999985; scale-x: 0.81099999; scale-y: 1.00999999; }
        frame 154 { x: 85.8000031; y: 88.8000031; skew-x: -10000; skew-y: -10000; scale-x: 0.810000002; scale-y: 0.832000017; }
        frame 155 { x: 85.1999969; y: 98.8000031; scale-x: 0.81099999; scale-y: 0.657000005; }
        frame 156 { x: -10000; y: -10000; scale-x: 0.810000002; scale-y: 0.656000018; }
        frame 157 { scale-x: 0.81099999; scale-y: 0.657000005; }
        frame 158 { scale-x: 0.810000002; scale-y: 0.656000018; }
        frame 159 { scale-x: -10000; scale-y: -10000; }
        frame 163 { scale-x: 0.81099999; scale-y: 0.657000005; }
        frame 164 { scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Driver_brain";
        frame-count: 187;
        frame 0 { cel: -1; }
        frame 1 { x: 8.30000019; y: 20.7999992; skew-x: -5.69999981; skew-y: -5.69999981; scale-x: 0.799000025; scale-y: 0.799000025; cel: 0; image: IMAGE_REANIM_ZOMBIE_BOSSDRIVER_BRAIN; }
        frame 2 { x: 7.4000001; y: 20; skew-x: -10000; skew-y: -5.4000001; scale-x: 0.828999996; scale-y: 0.828999996; cel: -10000; image: none; }
        frame 3 { x: 6.5999999; y: 19; skew-y: -10000; scale-x: 0.860000014; scale-y: 0.860000014; }
        frame 4 { x: 7; y: 19.2999992; skew-y: -5.19999981; scale-x: 0.848999977; scale-y: 0.848999977; }
        frame 5 { x: 7.19999981; y: 19.6000004; skew-y: -5.4000001; scale-x: 0.838999987; scale-y: 0.838999987; }
        frame 6 { x: 7.5; y: 19.7999992; skew-y: -10000; scale-x: 0.828999996; scale-y: 0.828999996; }
        frame 7 { x: 7.80000019; y: 20.1000004; skew-y: -5.5; scale-x: 0.819000006; scale-y: 0.819000006; }
        frame 8 { x: -10000; y: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 9 { x: 8.30000019; y: 20.7999992; skew-y: -5.69999981; scale-x: 0.799000025; scale-y: 0.799000025; cel: 0; }
        frame 10 { x: 8.69999981; y: 19.7000008; skew-x: -5.19999981; skew-y: -5.19999981; scale-x: 0.779999971; scale-y: 0.808000028; cel: -10000; }
        frame 11 { x: 9.19999981; y: 18.5; skew-x: -5; skew-y: -4.69999981; scale-x: 0.762000024; scale-y: 0.818000019; }
        frame 12 { x: 8.39999962; y: 19.7000008; skew-x: -5.69999981; skew-y: -5.4000001; scale-x: 0.768999994; scale-y: 0.81400001; }
        frame 13 { x: 7.5999999; y: 20.7999992; skew-x: -6.4000001; skew-y: -6.19999981; scale-x: 0.776000023; scale-y: 0.810000002; }
        frame 14 { x: 6.69999981; y: 22; skew-x: -7.19999981; skew-y: -7.19999981; scale-x: 0.783999979; scale-y: 0.805999994; }
        frame 15 { x: 6; y: 23.2999992; skew-x: -7.9000001; skew-y: -7.9000001; scale-x: 0.791000009; scale-y: 0.801999986; }
        frame 16 { x: 5.0999999; y: 24.5; skew-x: -8.80000019; skew-y: -8.80000019; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 17 { x: 4.80000019; y: 25.7000008; skew-x: -9.19999981; skew-y: -9.19999981; scale-x: 0.805000007; scale-y: 0.788999975; }
        frame 18 { x: 4.19999981; y: 27.1000004; skew-x: -10; skew-y: -10; scale-x: 0.811999977; scale-y: 0.779999971; }
        frame 19 { x: 5; y: 25.7999992; skew-x: -9; skew-y: -9; scale-x: 0.809000015; scale-y: 0.782999992; }
        frame 20 { x: 5.80000019; y: 24.6000004; skew-x: -8.19999981; skew-y: -8.19999981; scale-x: 0.805999994; scale-y: 0.787; }
        frame 21 { x: 6.69999981; y: 23.3999996; skew-x: -7.4000001; skew-y: -7.4000001; scale-x: 0.80400002; scale-y: 0.791000009; }
        frame 22 { x: 7.5; y: 22; skew-x: -6.4000001; skew-y: -6.4000001; scale-x: 0.800999999; scale-y: 0.795000017; }
        frame 23 { x: 8.30000019; y: 20.7999992; skew-x: -5.69999981; skew-y: -5.69999981; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 24 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 6.69999981; y: 22.3999996; skew-x: -7.5; skew-y: -9.19999981; scale-x: 0.797999978; }
        frame 26 { x: 5.0999999; y: 24.1000004; skew-x: -9.5; skew-y: -12.8000002; scale-x: 0.799000025; scale-y: 0.800000012; }
        frame 27 { x: 8; y: 22.7000008; skew-x: -7.69999981; skew-y: -10.1999998; scale-x: 0.797999978; scale-y: 0.799000025; }
        frame 28 { x: 10.8000002; y: 21.5; skew-x: -6.19999981; skew-y: -7.69999981; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 13.6999998; y: 20.2000008; skew-x: -4.4000001; skew-y: -5.4000001; scale-x: 0.799000025; }
        frame 30 { x: 16.6000004; y: 19; skew-x: -3; skew-y: -3; scale-x: -10000; }
        frame 31 { x: 18.8999996; y: 16.6000004; skew-x: -0.200000003; skew-y: 1; scale-x: 0.811999977; }
        frame 32 { x: 21.1000004; y: 14.3000002; skew-x: 2.29999995; skew-y: 5.30000019; scale-x: 0.824999988; scale-y: 0.800000012; }
        frame 33 { x: 17.8999996; y: 15.8999996; skew-x: 0.300000012; skew-y: 2.5; scale-x: 0.818000019; scale-y: 0.799000025; }
        frame 34 { x: 14.6999998; y: 17.6000004; skew-x: -1.70000005; skew-y: -0.200000003; scale-x: 0.811999977; scale-y: -10000; }
        frame 35 { x: 11.3999996; y: 19.2000008; skew-x: -3.70000005; skew-y: -2.9000001; scale-x: 0.805000007; }
        frame 36 { x: 8.30000019; y: 20.7999992; skew-x: -5.69999981; skew-y: -5.69999981; scale-x: 0.799000025; }
        frame 37 { x: 6.69999981; y: 22.3999996; skew-x: -7.5; skew-y: -9.19999981; scale-x: 0.797999978; }
        frame 38 { x: 5.0999999; y: 24.1000004; skew-x: -9.5; skew-y: -12.8000002; scale-x: 0.799000025; scale-y: 0.800000012; }
        frame 39 { x: 8; y: 22.7000008; skew-x: -7.69999981; skew-y: -10.1999998; scale-x: 0.797999978; scale-y: 0.799000025; }
        frame 40 { x: 10.8000002; y: 21.5; skew-x: -6.19999981; skew-y: -7.69999981; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 13.6999998; y: 20.2000008; skew-x: -4.4000001; skew-y: -5.4000001; scale-x: 0.799000025; }
        frame 42 { x: 16.6000004; y: 19; skew-x: -3; skew-y: -3; scale-x: -10000; }
        frame 43 { x: 18.2000008; y: 16.6000004; skew-x: -0.200000003; skew-y: 1; scale-x: 0.811999977; }
        frame 44 { x: 19.7999992; y: 14.3000002; skew-x: 2.29999995; skew-y: 5.30000019; scale-x: 0.824999988; scale-y: 0.800000012; }
        frame 45 { x: 16.8999996; y: 15.8999996; skew-x: 0.300000012; skew-y: 2.5; scale-x: 0.818000019; scale-y: 0.799000025; }
        frame 46 { x: 14; y: 17.5; skew-x: -1.70000005; skew-y: -0.200000003; scale-x: 0.811999977; scale-y: -10000; }
        frame 47 { x: 11.1999998; y: 19.2000008; skew-x: -3.70000005; skew-y: -2.9000001; scale-x: 0.805000007; }
        frame 48 { x: 8.30000019; y: 20.7999992; skew-x: -5.69999981; skew-y: -5.69999981; scale-x: 0.799000025; }
        frame 49 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; }
        frame 50 { x: 33; y: 14.3999996; skew-x: 10.3000002; skew-y: 12.5; scale-x: 0.797999978; scale-y: 0.827000022; }
        frame 51 { x: 59.5999985; y: 10.6000004; skew-x: 26.6000004; skew-y: 30.7999992; scale-x: 0.796999991; scale-y: 0.853999972; }
        frame 52 { x: 87.3000031; y: 9.89999962; skew-x: 42.7999992; skew-y: 49.4000015; scale-x: 0.796000004; scale-y: 0.882000029; }
        frame 53 { x: 114.800003; y: 12.3000002; skew-x: 59; skew-y: 67.6999969; scale-x: -10000; scale-y: 0.912; }
        frame 54 { x: 108.199997; y: 11.1000004; skew-x: 56.9000015; skew-y: 66.9000015; scale-x: 0.80400002; scale-y: 0.898999989; }
        frame 55 { x: 101.599998; y: 10.1000004; skew-x: 54.9000015; skew-y: 66; scale-x: 0.813000023; scale-y: 0.888000011; }
        frame 56 { x: 95.0999985; y: 8.80000019; skew-x: 53; skew-y: 65.0999985; scale-x: 0.823000014; scale-y: 0.876999974; }
        frame 57 { x: 72.6999969; y: 8.10000038; skew-x: 38.2999992; skew-y: 47.4000015; scale-x: 0.814999998; scale-y: 0.856000006; }
        frame 58 { x: 50.2000008; y: 10; skew-x: 23.6000004; skew-y: 29.6000004; scale-x: 0.810000002; scale-y: 0.837000012; }
        frame 59 { x: 28.5; y: 14.3000002; skew-x: 8.80000019; skew-y: 11.8000002; scale-x: 0.805000007; scale-y: 0.818000019; }
        frame 60 { x: 8.30000019; y: 20.7999992; skew-x: -5.69999981; skew-y: -5.69999981; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 61 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 62 { x: 15.6000004; y: 15.8999996; skew-x: 3.29999995; skew-y: 3.29999995; }
        frame 63 { x: 23.6000004; y: 11.5; skew-x: 12.3000002; skew-y: 12.3000002; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 64 { x: 31.8999996; y: 7.69999981; skew-x: 21.2999992; skew-y: 21.2999992; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 65 { x: 40.7000008; y: 4.5; skew-x: 30.6000004; skew-y: 30.6000004; scale-x: -10000; scale-y: -10000; }
        frame 66 { x: -10000; y: 5.30000019; skew-x: -10000; skew-y: -10000; scale-x: 0.796000004; scale-y: 0.796000004; }
        frame 67 { y: 5.80000019; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 68 { y: 5.30000019; scale-x: 0.796000004; scale-y: 0.796000004; }
        frame 69 { y: 4.5; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 70 { y: 5.30000019; scale-x: 0.796000004; scale-y: 0.796000004; }
        frame 71 { y: 5.80000019; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 72 { y: 5.30000019; scale-x: 0.796000004; scale-y: 0.796000004; }
        frame 73 { y: 4.5; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 74 { y: 5.30000019; scale-x: 0.796000004; scale-y: 0.796000004; }
        frame 75 { y: 5.80000019; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 76 { y: 5.30000019; scale-x: 0.796000004; scale-y: 0.796000004; }
        frame 77 { y: 4.5; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 78 { y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 79 { x: 41.5; y: -4.30000019; skew-x: 25.5; skew-y: 25.5; }
        frame 80 { x: 42.4000015; y: -13.3000002; skew-x: 20.5; skew-y: 20.5; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 81 { x: 43.0999985; y: -13.6000004; skew-x: 21; skew-y: 21; scale-x: 0.796000004; scale-y: 0.802999973; }
        frame 82 { x: 43.7999992; y: -13.8999996; skew-x: 21.5; skew-y: 21.5; scale-x: -10000; scale-y: 0.809000015; }
        frame 83 { x: 44.5; y: -14.1999998; skew-x: 22; skew-y: 22; scale-x: 0.795000017; scale-y: 0.81400001; }
        frame 84 { x: 45.2000008; y: -14.5; skew-x: 22.6000004; skew-y: 22.5; scale-x: 0.79400003; scale-y: 0.819999993; }
        frame 85 { x: 45.9000015; y: -14.8000002; skew-x: 23.1000004; skew-y: 23; scale-x: -10000; scale-y: 0.825999975; }
        frame 86 { x: 46.5999985; y: -15.1000004; skew-x: 23.6000004; skew-y: 23.5; scale-x: 0.792999983; scale-y: 0.832000017; }
        frame 87 { x: 47.4000015; y: -15.3999996; skew-x: 24.1000004; skew-y: 24; scale-x: 0.791999996; scale-y: 0.837000012; }
        frame 88 { x: 48.0999985; y: -15.6000004; skew-x: 24.6000004; skew-y: 24.5; scale-x: -10000; scale-y: 0.842999995; }
        frame 89 { x: 48.9000015; y: -15.8999996; skew-x: 25.1000004; skew-y: 25; scale-x: 0.791000009; scale-y: 0.848999977; }
        frame 90 { x: 49.5999985; y: -16.2000008; skew-x: 25.6000004; skew-y: 25.5; scale-x: -10000; scale-y: 0.855000019; }
        frame 91 { x: 50.4000015; y: -16.3999996; skew-x: 26.1000004; skew-y: 26; scale-x: 0.790000021; scale-y: 0.860000014; }
        frame 92 { x: 51; y: -16.7999992; skew-x: 26.6000004; skew-y: 26.3999996; scale-x: 0.788999975; scale-y: 0.865999997; }
        frame 93 { x: 51.9000015; y: -17; skew-x: 27.1000004; skew-y: 26.8999996; scale-x: -10000; scale-y: 0.871999979; }
        frame 94 { x: 52.5; y: -17.2000008; skew-x: 27.6000004; skew-y: 27.3999996; scale-x: 0.787999988; scale-y: 0.878000021; }
        frame 95 { x: 53.4000015; y: -17.6000004; skew-x: 28.2999992; skew-y: 27.8999996; scale-x: 0.787; scale-y: 0.884000003; }
        frame 96 { x: 54.0999985; y: -17.7000008; skew-x: 28.7999992; skew-y: 28.3999996; scale-x: -10000; scale-y: 0.888999999; }
        frame 97 { x: 54.9000015; y: -18; skew-x: 29.2999992; skew-y: 28.8999996; scale-x: 0.786000013; scale-y: 0.894999981; }
        frame 98 { x: 55.5999985; y: -18.2999992; skew-x: 29.7999992; skew-y: 29.3999996; scale-x: 0.785000026; scale-y: 0.901000023; }
        frame 99 { x: 56.4000015; y: -18.5; skew-x: 30.2999992; skew-y: 29.8999996; scale-x: -10000; scale-y: 0.907000005; }
        frame 100 { x: 57.0999985; y: -18.7999992; skew-x: 30.7999992; skew-y: 30.3999996; scale-x: 0.783999979; scale-y: 0.912; }
        frame 101 { x: 58; y: -18.8999996; skew-x: 31.2999992; skew-y: 30.8999996; scale-x: -10000; scale-y: 0.917999983; }
        frame 102 { x: 58.5999985; y: -19.2000008; skew-x: 31.7999992; skew-y: 31.3999996; scale-x: 0.782999992; scale-y: 0.924000025; }
        frame 103 { x: 59.5; y: -19.3999996; skew-x: 32.2999992; skew-y: 31.8999996; scale-x: 0.782000005; scale-y: 0.930000007; }
        frame 104 { x: 60.2999992; y: -19.7000008; skew-x: 32.7999992; skew-y: 32.4000015; scale-x: -10000; scale-y: 0.935000002; }
        frame 105 { x: 61; y: -19.7999992; skew-x: 33.4000015; skew-y: 32.9000015; scale-x: 0.781000018; scale-y: 0.940999985; }
        frame 106 { x: 61.7999992; y: -20; skew-x: 33.9000015; skew-y: 33.4000015; scale-x: 0.779999971; scale-y: 0.947000027; }
        frame 107 { x: 62.5999985; y: -20.2999992; skew-x: 34.4000015; skew-y: 33.9000015; scale-x: -10000; scale-y: 0.953000009; }
        frame 108 { x: 63.5; y: -20.3999996; skew-x: 34.9000015; skew-y: 34.4000015; scale-x: 0.778999984; scale-y: 0.958999991; }
        frame 109 { x: 64.1999969; y: -20.6000004; skew-x: 35.4000015; skew-y: 34.9000015; scale-x: 0.777999997; scale-y: 0.963999987; }
        frame 110 { x: 65.0999985; y: -20.8999996; skew-x: 36.0999985; skew-y: 35.4000015; scale-x: -10000; scale-y: 0.970000029; }
        frame 111 { x: 65.8000031; y: -21; skew-x: 36.5999985; skew-y: 35.9000015; scale-x: 0.77700001; scale-y: 0.976000011; }
        frame 112 { x: 66.6999969; y: -21.2000008; skew-x: 37.0999985; skew-y: 36.4000015; scale-x: -10000; scale-y: 0.981999993; }
        frame 113 { x: 67.5; y: -21.5; skew-x: 37.5999985; skew-y: 36.9000015; scale-x: 0.776000023; scale-y: 0.986999989; }
        frame 114 { x: 68.3000031; y: -10000; skew-x: 38.0999985; skew-y: 37.4000015; scale-x: 0.774999976; scale-y: 0.992999971; }
        frame 115 { x: 69.0999985; y: -21.7000008; skew-x: 38.5999985; skew-y: 37.9000015; scale-x: -10000; scale-y: 0.999000013; }
        frame 116 { x: 69.8000031; y: -21.8999996; skew-x: 39.0999985; skew-y: 38.4000015; scale-x: 0.773999989; scale-y: 1.005; }
        frame 117 { x: 70.6999969; y: -22.1000004; skew-x: 39.5999985; skew-y: 38.9000015; scale-x: 0.773000002; scale-y: 1.01100004; }
        frame 118 { x: 71.5; y: -22.2000008; skew-x: 40.0999985; skew-y: 39.4000015; scale-x: -10000; scale-y: 1.01600003; }
        frame 119 { x: 72.3000031; y: -22.2999992; skew-x: 40.5999985; skew-y: 39.9000015; scale-x: 0.772000015; scale-y: 1.02199996; }
        frame 120 { x: 73.0999985; y: -22.3999996; skew-x: 41.0999985; skew-y: 40.4000015; scale-x: 0.771000028; scale-y: 1.028; }
        frame 121 { x: 74; y: -22.6000004; skew-x: 41.5999985; skew-y: 40.9000015; scale-x: -10000; scale-y: 1.03400004; }
        frame 122 { x: 74.8000031; y: -22.7999992; skew-x: 42.0999985; skew-y: 41.4000015; scale-x: 0.769999981; scale-y: 1.03900003; }
        frame 123 { x: 75.6999969; y: -22.8999996; skew-x: 42.5999985; skew-y: 41.9000015; scale-x: -10000; scale-y: 1.04499996; }
        frame 124 { x: 76.5; y: -23; skew-x: 43.0999985; skew-y: 42.4000015; scale-x: 0.768999994; scale-y: 1.051; }
        frame 125 { x: 77.3000031; y: -23.1000004; skew-x: 43.5999985; skew-y: 42.9000015; scale-x: 0.768000007; scale-y: 1.05700004; }
        frame 126 { x: 78.0999985; y: -23.2000008; skew-x: 44.2999992; skew-y: 43.4000015; scale-x: -10000; scale-y: 1.06299996; }
        frame 127 { x: 78.9000015; y: -23.3999996; skew-x: 44.9000015; skew-y: 43.9000015; scale-x: 0.76700002; scale-y: 1.06799996; }
        frame 128 { x: 79.8000031; y: -23.5; skew-x: 45.4000015; skew-y: 44.4000015; scale-x: 0.765999973; scale-y: 1.074; }
        frame 129 { x: 80.6999969; y: -23.6000004; skew-x: 45.7999992; skew-y: 44.9000015; scale-x: 0.76700002; scale-y: 1.08200002; }
        frame 130 { x: 60.4000015; y: -9.89999962; skew-x: 38.0999985; skew-y: 37.7999992; scale-x: 0.781000018; scale-y: 0.938000023; }
        frame 131 { x: 40.7000008; y: 4.5; skew-x: 30.6000004; skew-y: 30.6000004; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 132 { x: 23.7000008; y: 15.1000004; skew-x: 11.5; skew-y: 13.3000002; scale-x: 0.773999989; scale-y: 0.792999983; }
        frame 133 { x: 8.89999962; y: 27.2999992; skew-x: -7.19999981; skew-y: -3.70000005; scale-x: 0.750999987; scale-y: 0.788999975; }
        frame 134 { x: -9.60000038; y: 41.9000015; skew-x: -26.2000008; skew-y: -20.8999996; scale-x: 0.805000007; scale-y: 0.785000026; }
        frame 135 { x: -9.10000038; y: 36.5999985; skew-x: -20.2000008; skew-y: -24.2000008; scale-x: 0.773000002; scale-y: 0.800000012; }
        frame 136 { x: -8.10000038; y: 31.5; skew-x: -14.3999996; skew-y: -27.5; scale-x: 0.744000018; scale-y: 0.816999972; }
        frame 137 { x: 21.1000004; y: 14.6999998; skew-x: 8.80000019; skew-y: 3.79999995; scale-x: 0.749000013; scale-y: 0.829999983; }
        frame 138 { x: 54; y: 4.5; skew-x: 32.5; skew-y: 35.4000015; scale-x: 0.755999982; scale-y: 0.842999995; }
        frame 139 { x: 34; y: 11.1999998; skew-x: 17.7999992; skew-y: 21.7999992; scale-x: 0.774999976; scale-y: 0.819999993; }
        frame 140 { x: 15.1999998; y: 20; skew-x: 3.20000005; skew-y: 8.5; scale-x: 0.795000017; scale-y: 0.799000025; }
        frame 141 { x: -13.5; y: 41.7999992; skew-x: -25.8999996; skew-y: -28.3999996; scale-x: 0.773999989; scale-y: 0.818000019; }
        frame 142 { x: 0.200000003; y: 23.3999996; skew-x: -7.4000001; skew-y: -13.3999996; scale-x: 0.76700002; scale-y: 0.856999993; }
        frame 143 { x: 17.2999992; y: 6.0999999; skew-x: 10.8000002; skew-y: 1.20000005; scale-x: 0.760999978; scale-y: 0.898000002; }
        frame 144 { x: 54; y: 4.5; skew-x: 32.5; skew-y: 35.4000015; scale-x: 0.755999982; scale-y: 0.842999995; }
        frame 145 { x: 77.8000031; y: 9.39999962; skew-x: 42.2999992; skew-y: 47.5999985; scale-x: 0.718999982; scale-y: 0.869000018; }
        frame 146 { x: 101.300003; y: 15.8999996; skew-x: 52.0999985; skew-y: 59.7000008; scale-x: 0.684000015; scale-y: 0.897000015; }
        frame 147 { x: 123.800003; y: 23.8999996; skew-x: 61.9000015; skew-y: 71.8000031; scale-x: 0.648999989; scale-y: 0.925999999; }
        frame 148 { x: 124.599998; y: 23.7999992; skew-x: 63.0999985; skew-y: 73.6999969; scale-x: 0.644999981; scale-y: 0.962000012; }
        frame 149 { x: 125.199997; y: 23.7000008; skew-x: 64.1999969; skew-y: 75.4000015; scale-x: 0.64200002; scale-y: 0.998000026; }
        frame 150 { x: 125.900002; y: 23.6000004; skew-x: 65.1999969; skew-y: 77.0999985; scale-x: 0.638999999; scale-y: 1.03600001; }
        frame 151 { x: 103.300003; y: -10000; skew-x: 45.7999992; skew-y: 48.0999985; scale-x: 0.658999979; scale-y: 0.957000017; }
        frame 152 { x: 78.6999969; y: 31; skew-x: 26.2999992; skew-y: 19; scale-x: 0.680000007; scale-y: 0.880999982; }
        frame 153 { x: 71.5; y: 44.0999985; skew-x: 21.7000008; skew-y: 18.7000008; scale-x: 0.686999977; scale-y: 0.814999998; }
        frame 154 { x: 61.5; y: 59.0999985; skew-x: 9; skew-y: 6.0999999; scale-x: 0.691999972; scale-y: 0.746999979; }
        frame 155 { x: 53.4000015; y: 75.3000031; skew-x: -3.29999995; skew-y: -6.19999981; scale-x: 0.697000027; scale-y: 0.680000007; }
        frame 156 { x: 57; y: 86.4000015; skew-x: 1; skew-y: -1.70000005; scale-x: 0.691999972; scale-y: 0.746999979; }
        frame 157 { x: 61.0999985; y: 97.5999985; skew-x: 5.69999981; skew-y: 2.70000005; scale-x: 0.686999977; scale-y: 0.81400001; }
        frame 158 { x: 61; y: 97.6999969; skew-x: 5.5; skew-y: 2.5999999; scale-x: -10000; scale-y: -10000; }
        frame 159 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 163 { x: 61.0999985; y: 97.5999985; skew-x: 5.69999981; skew-y: 2.70000005; }
        frame 164 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
    }
    Track {
        source-name: "Driver_face";
        frame-count: 187;
        frame 0 { cel: -1; }
        frame 1 { x: 9.69999981; y: 44.0999985; skew-x: -5.69999981; skew-y: -5.69999981; scale-x: 0.799000025; scale-y: 0.799000025; cel: 0; image: IMAGE_REANIM_ZOMBIE_BOSSDRIVER_FACE; }
        frame 2 { x: 9.30000019; y: -10000; skew-x: -10000; skew-y: -6.4000001; scale-x: 0.80400002; scale-y: -10000; cel: -10000; image: none; }
        frame 3 { x: 8.80000019; skew-y: -7.30000019; scale-x: 0.809000015; }
        frame 4 { x: 9.10000038; skew-y: -6.69999981; scale-x: 0.805999994; }
        frame 5 { x: 9.39999962; y: 44; skew-y: -6.4000001; scale-x: 0.80400002; }
        frame 6 { x: 9.5; y: 44.0999985; skew-y: -6; scale-x: 0.800999999; }
        frame 7 { x: 9.69999981; y: -10000; skew-y: -5.69999981; scale-x: 0.799000025; }
        frame 8 { x: -10000; skew-y: -10000; scale-x: -10000; cel: -1; }
        frame 9 { cel: 0; }
        frame 10 { x: 9.80000019; y: 43.7000008; skew-x: -5.9000001; scale-x: 0.790000021; scale-y: 0.797999978; cel: -10000; }
        frame 11 { x: 9.89999962; y: 43.2999992; skew-x: -6.0999999; skew-y: -5.80000019; scale-x: 0.782000005; scale-y: -10000; }
        frame 12 { x: 9.39999962; y: 44.0999985; skew-x: -6.5; skew-y: -6.4000001; scale-x: 0.785000026; }
        frame 13 { x: 9; y: 45.0999985; skew-x: -7.19999981; skew-y: -6.9000001; scale-x: 0.788999975; }
        frame 14 { x: 8.60000038; y: 46; skew-x: -7.69999981; skew-y: -7.5; scale-x: 0.791999996; }
        frame 15 { x: 8.10000038; y: 46.7999992; skew-x: -8.19999981; skew-y: -8.19999981; scale-x: 0.795000017; }
        frame 16 { x: 7.80000019; y: 47.5999985; skew-x: -8.80000019; skew-y: -8.80000019; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 17 { x: 7.69999981; y: 48.0999985; skew-x: -9.19999981; skew-y: -9.19999981; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 18 { x: 7.5; y: 48.5; skew-x: -10; skew-y: -10; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 8; y: 47.5999985; skew-x: -9; skew-y: -9; }
        frame 20 { x: 8.39999962; y: 46.7000008; skew-x: -8.19999981; skew-y: -8.19999981; }
        frame 21 { x: 8.80000019; y: 45.9000015; skew-x: -7.4000001; skew-y: -7.4000001; }
        frame 22 { x: 9.19999981; y: 44.7999992; skew-x: -6.4000001; skew-y: -6.4000001; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 23 { x: 9.69999981; y: 44.0999985; skew-x: -5.69999981; skew-y: -5.69999981; scale-x: -10000; scale-y: -10000; }
        frame 24 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 25 { x: 10.1000004; y: 45.4000015; skew-x: -7.5; skew-y: -7.5; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 26 { x: 10.3999996; y: 46.9000015; skew-x: -9.5; skew-y: -9.5; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 27 { x: 12; y: 45.7000008; skew-x: -7.69999981; skew-y: -7.69999981; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 28 { x: 13.6000004; y: 44.5999985; skew-x: -6.19999981; skew-y: -6.19999981; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 15.1999998; y: 43.4000015; skew-x: -4.4000001; skew-y: -4.4000001; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 30 { x: 16.8999996; y: 42.2999992; skew-x: -3; skew-y: -3; scale-x: -10000; scale-y: -10000; }
        frame 31 { x: 17.3999996; y: 39.7999992; skew-x: -0.200000003; skew-y: -0.200000003; }
        frame 32 { x: 17.7999992; y: 37.4000015; skew-x: 2.29999995; skew-y: 2.29999995; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 33 { x: 15.8000002; y: 39; skew-x: 0.300000012; skew-y: 0.300000012; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 34 { x: 13.6999998; y: 40.7999992; skew-x: -1.70000005; skew-y: -1.70000005; scale-x: -10000; scale-y: -10000; }
        frame 35 { x: 11.6999998; y: 42.5; skew-x: -3.70000005; skew-y: -3.70000005; }
        frame 36 { x: 9.69999981; y: 44.0999985; skew-x: -5.69999981; skew-y: -5.69999981; }
        frame 37 { x: 10.1000004; y: 45.4000015; skew-x: -7.5; skew-y: -7.5; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 38 { x: 10.3999996; y: 46.9000015; skew-x: -9.5; skew-y: -9.5; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 39 { x: 12; y: 45.7000008; skew-x: -7.69999981; skew-y: -7.69999981; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 40 { x: 13.6000004; y: 44.5999985; skew-x: -6.19999981; skew-y: -6.19999981; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 15.1999998; y: 43.4000015; skew-x: -4.4000001; skew-y: -4.4000001; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 42 { x: 16.8999996; y: 42.2999992; skew-x: -3; skew-y: -3; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: 16.7999992; y: 39.7999992; skew-x: -0.200000003; skew-y: -0.200000003; }
        frame 44 { x: 16.6000004; y: 37.4000015; skew-x: 2.29999995; skew-y: 2.29999995; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 45 { x: 14.8000002; y: 39; skew-x: 0.300000012; skew-y: 0.300000012; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 46 { x: 13.1000004; y: 40.7000008; skew-x: -1.70000005; skew-y: -1.70000005; scale-x: -10000; scale-y: -10000; }
        frame 47 { x: 11.3999996; y: 42.4000015; skew-x: -3.70000005; skew-y: -3.70000005; }
        frame 48 { x: 9.69999981; y: 44.0999985; skew-x: -5.69999981; skew-y: -5.69999981; }
        frame 49 { x: 10.3999996; y: 42.0999985; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.800000012; image: IMAGE_REANIM_ZOMBIE_BOSSDRIVER_FACE2; }
        frame 50 { x: 29.1000004; y: 34.0999985; skew-x: 16.5; skew-y: 16.5; scale-x: 0.799000025; scale-y: 0.799000025; image: none; }
        frame 51 { x: 49.0999985; y: 28.1000004; skew-x: 33.0999985; skew-y: 33.0999985; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 52 { x: 69.5999985; y: 23.7999992; skew-x: 49.5999985; skew-y: 49.5999985; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 53 { x: 90; y: 21.7999992; skew-x: 66.1999969; skew-y: 66.1999969; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 54 { x: 84.8000031; y: 20.3999996; skew-x: -10000; skew-y: -10000; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 55 { x: 79.5999985; y: 19; scale-x: -10000; scale-y: -10000; }
        frame 56 { x: 74.3000031; y: 17.6000004; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 57 { x: 56.5999985; y: 21.7999992; skew-x: 47.5999985; skew-y: 47.5999985; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 58 { x: 39; y: 28.7999992; skew-x: 28.7999992; skew-y: 28.7999992; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 59 { x: 22.3999996; y: 37.9000015; skew-x: 10.3000002; skew-y: 10.3000002; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 60 { x: 9.69999981; y: 44.0999985; skew-x: -5.69999981; skew-y: -5.69999981; scale-x: 0.799000025; scale-y: 0.799000025; image: IMAGE_REANIM_ZOMBIE_BOSSDRIVER_FACE; }
        frame 61 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 62 { x: 13.6000004; y: 38.2999992; skew-x: 3.29999995; skew-y: 3.29999995; }
        frame 63 { x: 18.1000004; y: 33.0999985; skew-x: 12.3000002; skew-y: 12.3000002; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 64 { x: 22.7999992; y: 28.2999992; skew-x: 21.2999992; skew-y: 21.2999992; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 65 { x: 28; y: 24.1000004; skew-x: 30.6000004; skew-y: 30.6000004; scale-x: -10000; scale-y: -10000; }
        frame 66 { x: -10000; y: 24.8999996; skew-x: -10000; skew-y: -10000; scale-x: 0.796000004; scale-y: 0.796000004; }
        frame 67 { y: 25.5; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 68 { y: 24.8999996; scale-x: 0.796000004; scale-y: 0.796000004; }
        frame 69 { y: 24.1000004; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 70 { y: 24.8999996; scale-x: 0.796000004; scale-y: 0.796000004; }
        frame 71 { y: 25.5; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 72 { y: 24.8999996; scale-x: 0.796000004; scale-y: 0.796000004; }
        frame 73 { y: 24.1000004; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 74 { y: 24.8999996; scale-x: 0.796000004; scale-y: 0.796000004; }
        frame 75 { y: 25.5; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 76 { y: 24.8999996; scale-x: 0.796000004; scale-y: 0.796000004; }
        frame 77 { y: 24.1000004; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 78 { x: 28.2999992; y: 24.2999992; skew-x: 31.7999992; skew-y: 31.7999992; scale-x: 0.799000025; scale-y: 0.799000025; image: IMAGE_REANIM_ZOMBIE_BOSSDRIVER_FACE2; }
        frame 79 { x: 31.1000004; y: 15.6999998; skew-x: 27; skew-y: 27; scale-x: 0.796999991; scale-y: 0.796999991; image: none; }
        frame 80 { x: 34; y: 7.0999999; skew-x: 22.2000008; skew-y: 22.2000008; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 81 { x: 34.4000015; y: 6.9000001; skew-x: 22.6000004; skew-y: 22.6000004; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 82 { x: 34.9000015; y: 6.80000019; skew-x: 23; skew-y: 23; scale-x: -10000; scale-y: -10000; }
        frame 83 { x: 35.2000008; y: 6.69999981; skew-x: 23.2999992; skew-y: 23.2999992; }
        frame 84 { x: 35.5; y: 6.5999999; skew-x: 23.7999992; skew-y: 23.7999992; }
        frame 85 { x: 36; y: 6.5; skew-x: 24.2999992; skew-y: 24.2999992; }
        frame 86 { x: 36.2999992; y: -10000; skew-x: 24.6000004; skew-y: 24.6000004; }
        frame 87 { x: 36.7999992; y: 6.30000019; skew-x: 25.1000004; skew-y: 25.1000004; }
        frame 88 { x: 37.2999992; y: 6.19999981; skew-x: 25.5; skew-y: 25.5; }
        frame 89 { x: 37.5999985; y: -10000; skew-x: 25.7999992; skew-y: 25.7999992; }
        frame 90 { x: 38; y: 6; skew-x: 26.2999992; skew-y: 26.2999992; }
        frame 91 { x: 38.4000015; y: 5.9000001; skew-x: 26.6000004; skew-y: 26.6000004; }
        frame 92 { x: 38.7999992; y: 5.80000019; skew-x: 27.1000004; skew-y: 27.1000004; }
        frame 93 { x: 39.2999992; y: 5.69999981; skew-x: 27.6000004; skew-y: 27.6000004; }
        frame 94 { x: 39.5999985; y: 5.5999999; skew-x: 27.7999992; skew-y: 27.7999992; }
        frame 95 { x: 40.0999985; y: 5.5; skew-x: 28.2999992; skew-y: 28.2999992; }
        frame 96 { x: 40.5; y: 5.4000001; skew-x: 28.7999992; skew-y: 28.7999992; }
        frame 97 { x: 40.9000015; y: 5.30000019; skew-x: 29.1000004; skew-y: 29.1000004; }
        frame 98 { x: 41.2999992; y: 5.19999981; skew-x: 29.6000004; skew-y: 29.6000004; }
        frame 99 { x: 41.7000008; y: 5.0999999; skew-x: 30.1000004; skew-y: 30.1000004; }
        frame 100 { x: 42.0999985; y: 5; skew-x: 30.2999992; skew-y: 30.2999992; }
        frame 101 { x: 42.5; y: 4.80000019; skew-x: 30.7999992; skew-y: 30.7999992; }
        frame 102 { x: 43; y: -10000; skew-x: 31.1000004; skew-y: 31.1000004; }
        frame 103 { x: 43.4000015; y: 4.69999981; skew-x: 31.6000004; skew-y: 31.6000004; }
        frame 104 { x: 43.9000015; y: 4.5999999; skew-x: 32.0999985; skew-y: 32.0999985; scale-x: 0.796000004; scale-y: 0.796000004; }
        frame 105 { x: 44.0999985; y: -10000; skew-x: 32.4000015; skew-y: 32.4000015; scale-x: -10000; scale-y: -10000; }
        frame 106 { x: 44.5999985; y: 4.5; skew-x: 32.7999992; skew-y: 32.7999992; }
        frame 107 { x: 45.0999985; y: 4.30000019; skew-x: 33.2999992; skew-y: 33.2999992; }
        frame 108 { x: 45.4000015; y: -10000; skew-x: 33.5999985; skew-y: 33.5999985; }
        frame 109 { x: 45.9000015; y: 4.19999981; skew-x: 34.0999985; skew-y: 34.0999985; }
        frame 110 { x: 46.4000015; y: 4.0999999; skew-x: 34.5999985; skew-y: 34.5999985; }
        frame 111 { x: 46.7000008; y: 4; skew-x: 34.9000015; skew-y: 34.9000015; }
        frame 112 { x: 47.0999985; skew-x: 35.2999992; skew-y: 35.2999992; }
        frame 113 { x: 47.5; y: 3.9000001; skew-x: 35.5999985; skew-y: 35.5999985; }
        frame 114 { x: 47.9000015; y: 3.79999995; skew-x: 36.0999985; skew-y: 36.0999985; }
        frame 115 { x: 48.4000015; y: 3.5999999; skew-x: 36.5999985; skew-y: 36.5999985; }
        frame 116 { x: 48.7999992; y: -10000; skew-x: 36.9000015; skew-y: 36.9000015; }
        frame 117 { x: 49.2000008; skew-x: 37.4000015; skew-y: 37.4000015; }
        frame 118 { x: 49.5999985; y: 3.5; skew-x: 37.7999992; skew-y: 37.7999992; }
        frame 119 { x: 50; y: 3.4000001; skew-x: 38.0999985; skew-y: 38.0999985; }
        frame 120 { x: 50.5; y: -10000; skew-x: 38.5999985; skew-y: 38.5999985; }
        frame 121 { x: 51; y: 3.29999995; skew-x: 39.0999985; skew-y: 39.0999985; }
        frame 122 { x: 51.2999992; y: -10000; skew-x: 39.4000015; skew-y: 39.4000015; }
        frame 123 { x: 51.7999992; y: 3.0999999; skew-x: 39.7999992; skew-y: 39.7999992; }
        frame 124 { x: 52.2999992; y: 3; skew-x: 40.2999992; skew-y: 40.2999992; }
        frame 125 { x: 52.5999985; y: -10000; skew-x: 40.5999985; skew-y: 40.5999985; }
        frame 126 { x: 53; y: 3; skew-x: 41.0999985; skew-y: 41.0999985; }
        frame 127 { x: 53.5; y: 2.9000001; skew-x: 41.4000015; skew-y: 41.4000015; }
        frame 128 { x: 53.9000015; y: -10000; skew-x: 41.9000015; skew-y: 41.9000015; }
        frame 129 { x: 54.2999992; y: 2.70000005; skew-x: 42.2999992; skew-y: 42.2999992; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 130 { x: 40.2999992; y: 14.3000002; skew-x: 30.6000004; skew-y: 30.7999992; scale-x: 0.796000004; scale-y: 0.787999988; }
        frame 131 { x: 26.7000008; y: 26.8999996; skew-x: 18.7999992; skew-y: 19.5; scale-x: 0.797999978; scale-y: 0.779999971; }
        frame 132 { x: 17.3999996; y: 38.5999985; skew-x: 3.79999995; skew-y: 3.0999999; scale-x: 0.771000028; scale-y: 0.75999999; }
        frame 133 { x: 9.80000019; y: 51.4000015; skew-x: -11.1999998; skew-y: -12.8999996; scale-x: 0.745000005; scale-y: 0.739000022; }
        frame 134 { x: -2.20000005; y: 63.2999992; skew-x: -26.2000008; skew-y: -29.2000008; scale-x: 0.718999982; scale-y: 0.718999982; }
        frame 135 { x: -0; y: 57.9000015; skew-x: -21.2000008; skew-y: -28.2000008; scale-x: -10000; scale-y: 0.725000024; }
        frame 136 { x: 2.29999995; y: 52.5; skew-x: -16.3999996; skew-y: -27.1000004; scale-x: 0.720000029; scale-y: 0.73299998; }
        frame 137 { x: 19.8999996; y: 34.5999985; skew-x: 7.80000019; skew-y: 4; scale-x: -10000; scale-y: 0.726000011; }
        frame 138 { x: 41; y: 22.6000004; skew-x: 32.5; skew-y: 35.4000015; scale-y: 0.718999982; }
        frame 139 { x: 25.7999992; y: 30.1000004; skew-x: 17.7999992; skew-y: 19.1000004; scale-x: 0.718999982; scale-y: -10000; }
        frame 140 { x: 11.6000004; y: 39.2999992; skew-x: 3.0999999; skew-y: 3.0999999; scale-x: 0.720000029; scale-y: 0.720000029; }
        frame 141 { x: -2.5999999; y: 63; skew-x: -25.8999996; skew-y: -28.3999996; scale-x: -10000; scale-y: -10000; }
        frame 142 { x: 5.80000019; y: 46.7999992; skew-x: -6.4000001; skew-y: -10.6999998; scale-x: 0.730000019; scale-y: 0.721000016; }
        frame 143 { x: 17.2000008; y: 31.7999992; skew-x: 12.8000002; skew-y: 6.80000019; scale-x: 0.74000001; scale-y: 0.723999977; }
        frame 144 { x: 37; y: 28.6000004; skew-x: 23.1000004; skew-y: 22.1000004; scale-x: 0.731999993; scale-y: 0.721000016; }
        frame 145 { x: 56.7999992; y: 27.1000004; skew-x: 33.5999985; skew-y: 37.4000015; scale-x: 0.726000011; scale-y: 0.720000029; }
        frame 146 { x: 75.6999969; y: 29.8999996; skew-x: 42.5999985; skew-y: 55.2000008; scale-x: 0.683000028; scale-y: 0.748000026; }
        frame 147 { x: 93.1999969; y: 34.5999985; skew-x: 51.5; skew-y: 72.9000015; scale-x: 0.643000007; scale-y: 0.777999997; }
        frame 148 { x: 92.1999969; y: 33.7000008; skew-x: 52.4000015; skew-y: 72.4000015; scale-x: 0.649999976; scale-y: 0.773999989; }
        frame 149 { x: 91.0999985; y: 32.7999992; skew-x: 53.2000008; skew-y: 71.9000015; scale-x: 0.657999992; scale-y: 0.771000028; }
        frame 150 { x: 90.0999985; y: 31.7000008; skew-x: 54.0999985; skew-y: 71.3000031; scale-x: 0.666000009; scale-y: 0.768000007; }
        frame 151 { x: 80.1999969; y: 43.5; skew-x: 39.7999992; skew-y: 52.9000015; scale-x: 0.698000014; scale-y: 0.73299998; }
        frame 152 { x: 69.8000031; y: 57.9000015; skew-x: 25.6000004; skew-y: 34.2000008; scale-x: 0.731999993; scale-y: 0.700999975; }
        frame 153 { x: 64.8000031; y: 70; skew-x: 17.7999992; skew-y: 25.6000004; scale-x: 0.726999998; scale-y: 0.70599997; }
        frame 154 { x: 60; y: 82.5; skew-x: 10.1000004; skew-y: 17.2999992; scale-x: 0.723999977; scale-y: 0.713; }
        frame 155 { x: 55.5999985; y: 95.4000015; skew-x: 2.5999999; skew-y: 8.80000019; scale-x: 0.720000029; scale-y: 0.720000029; }
        frame 156 { x: -10000; y: 103.300003; skew-x: 2.5; skew-y: -10000; scale-x: -10000; scale-y: 0.718999982; }
        frame 157 { y: 111.199997; skew-x: 2.5999999; scale-y: 0.720000029; }
        frame 158 { y: 111.300003; skew-x: 2.5; scale-y: 0.718999982; }
        frame 159 { y: -10000; skew-x: -10000; scale-y: -10000; }
        frame 163 { y: 111.199997; skew-x: 2.5999999; scale-y: 0.720000029; }
        frame 164 { y: -10000; skew-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Driver_jaw";
        frame-count: 187;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 9 { x: 24.7000008; y: 55.4000015; skew-x: -5.69999981; skew-y: -5.69999981; scale-x: 0.83099997; scale-y: 0.736999989; cel: 0; image: IMAGE_REANIM_ZOMBIE_BOSSDRIVER_JAW; }
        frame 10 { x: 24.7999992; y: 54.9000015; skew-x: -5.9000001; skew-y: -10000; scale-x: 0.818000019; scale-y: -10000; cel: -10000; image: none; }
        frame 11 { x: 24.8999996; y: 54.2999992; skew-x: -6.0999999; skew-y: -5.80000019; scale-x: 0.805000007; scale-y: 0.737999976; }
        frame 12 { x: 24.7000008; y: 54.9000015; skew-x: -6.5; skew-y: -6.4000001; scale-x: 0.802999973; scale-y: 0.75999999; }
        frame 13 { x: 24.6000004; y: 55.5999985; skew-x: -7.19999981; skew-y: -6.9000001; scale-x: 0.801999986; scale-y: 0.782000005; }
        frame 14 { x: 24.3999996; y: 56.2999992; skew-x: -7.69999981; skew-y: -7.5; scale-x: 0.800999999; scale-y: 0.80400002; }
        frame 15 { x: 24.2999992; y: 57; skew-x: -8.19999981; skew-y: -8.19999981; scale-x: 0.800000012; scale-y: 0.825999975; }
        frame 16 { x: 24.1000004; y: 57.9000015; skew-x: -8.80000019; skew-y: -8.80000019; scale-x: 0.799000025; scale-y: 0.84799999; }
        frame 17 { x: -10000; y: 58.7000008; skew-x: -9.19999981; skew-y: -9.19999981; scale-x: 0.802999973; scale-y: 0.842999995; }
        frame 18 { x: 23.8999996; y: 59.4000015; skew-x: -10; skew-y: -10; scale-x: 0.808000028; scale-y: 0.839999974; }
        frame 19 { x: 24.2000008; y: 58.5; skew-x: -9; skew-y: -9; scale-x: 0.811999977; scale-y: 0.819000006; }
        frame 20 { x: 24.2999992; y: 57.7999992; skew-x: -8.19999981; skew-y: -8.19999981; scale-x: 0.816999972; scale-y: 0.797999978; }
        frame 21 { x: 24.5; y: 57; skew-x: -7.4000001; skew-y: -7.4000001; scale-x: 0.82099998; scale-y: 0.777999997; }
        frame 22 { x: 24.7000008; y: 56.2000008; skew-x: -6.4000001; skew-y: -6.4000001; scale-x: 0.825999975; scale-y: 0.757000029; }
        frame 23 { x: -10000; y: 55.4000015; skew-x: -5.69999981; skew-y: -5.69999981; scale-x: 0.83099997; scale-y: 0.736999989; }
        frame 24 { y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 26; y: 56; skew-x: -7.5; skew-y: -3.9000001; scale-x: 0.829999983; scale-y: 0.74000001; }
        frame 26 { x: 27.2000008; y: 56.7999992; skew-x: -9.5; skew-y: -2.0999999; scale-x: 0.83099997; scale-y: 0.742999971; }
        frame 27 { x: 28.2999992; y: 56.0999985; skew-x: -7.69999981; skew-y: -2.20000005; scale-x: 0.829999983; scale-y: 0.740999997; }
        frame 28 { x: 29.2999992; y: 55.5999985; skew-x: -6.19999981; skew-y: -2.4000001; scale-x: 0.83099997; scale-y: 0.74000001; }
        frame 29 { x: 30.2999992; y: 54.9000015; skew-x: -4.4000001; skew-y: -2.70000005; scale-x: -10000; scale-y: 0.737999976; }
        frame 30 { x: 31.2999992; y: 54.2999992; skew-x: -3; skew-y: -3; scale-y: 0.736999989; }
        frame 31 { x: 31; y: 53.2000008; skew-x: -0.200000003; skew-y: -0.200000003; scale-y: 0.763000011; }
        frame 32 { x: 30.7999992; y: 52.2000008; skew-x: 2.29999995; skew-y: 2.29999995; scale-y: 0.788999975; }
        frame 33 { x: 29.1000004; y: 53; skew-x: 0.300000012; skew-y: 0.100000001; scale-y: 0.776000023; }
        frame 34 { x: 27.7000008; y: 53.9000015; skew-x: -1.70000005; skew-y: -1.70000005; scale-y: 0.763000011; }
        frame 35 { x: 26.1000004; y: 54.5; skew-x: -3.70000005; skew-y: -3.70000005; scale-y: 0.75; }
        frame 36 { x: 24.7000008; y: 55.4000015; skew-x: -5.69999981; skew-y: -5.69999981; scale-y: 0.736999989; }
        frame 37 { x: 26; y: 56; skew-x: -7.5; skew-y: -3.9000001; scale-x: 0.829999983; scale-y: 0.74000001; }
        frame 38 { x: 27.2000008; y: 56.7999992; skew-x: -9.5; skew-y: -2.0999999; scale-x: 0.83099997; scale-y: 0.742999971; }
        frame 39 { x: 28.2999992; y: 56.0999985; skew-x: -7.69999981; skew-y: -2.20000005; scale-x: 0.829999983; scale-y: 0.740999997; }
        frame 40 { x: 29.2999992; y: 55.5999985; skew-x: -6.19999981; skew-y: -2.4000001; scale-x: 0.83099997; scale-y: 0.74000001; }
        frame 41 { x: 30.2999992; y: 54.9000015; skew-x: -4.4000001; skew-y: -2.70000005; scale-x: -10000; scale-y: 0.737999976; }
        frame 42 { x: 31.2999992; y: 54.2999992; skew-x: -3; skew-y: -3; scale-y: 0.736999989; }
        frame 43 { x: 30.3999996; y: 53.2000008; skew-x: -0.200000003; skew-y: -0.200000003; scale-y: 0.763000011; }
        frame 44 { x: 29.5; y: 52.2000008; skew-x: 2.29999995; skew-y: 2.29999995; scale-y: 0.788999975; }
        frame 45 { x: 28.2000008; y: 53; skew-x: 0.300000012; skew-y: 0.100000001; scale-y: 0.776000023; }
        frame 46 { x: 27; y: 53.7999992; skew-x: -1.70000005; skew-y: -1.70000005; scale-y: 0.763000011; }
        frame 47 { x: 25.7999992; y: 54.5999985; skew-x: -3.70000005; skew-y: -3.70000005; scale-y: 0.75; }
        frame 48 { x: 24.7000008; y: 55.4000015; skew-x: -5.69999981; skew-y: -5.69999981; scale-y: 0.736999989; }
        frame 49 { x: 25.1000004; y: 56.4000015; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.800000012; image: IMAGE_REANIM_ZOMBIE_BOSSDRIVER_JAW2; }
        frame 50 { x: 38.7000008; y: 50.4000015; skew-x: 16.5; skew-y: 16.5; scale-x: 0.799000025; scale-y: 0.815999985; image: none; }
        frame 51 { x: 53; y: 45.5999985; skew-x: 33.0999985; skew-y: 33.0999985; scale-x: 0.797999978; scale-y: 0.83099997; }
        frame 52 { x: 67.8000031; y: 42.2999992; skew-x: 49.5999985; skew-y: 49.5999985; scale-x: 0.796999991; scale-y: 0.847000003; }
        frame 53 { x: 82.5; y: 40.2999992; skew-x: 66.1999969; skew-y: 66.1999969; scale-x: 0.797999978; scale-y: 0.86500001; }
        frame 54 { x: 77.0999985; y: 39.7999992; skew-x: -10000; skew-y: -10000; scale-x: 0.771000028; scale-y: 0.814999998; }
        frame 55 { x: 71.5999985; y: 39.2999992; scale-x: 0.744000018; scale-y: 0.76700002; }
        frame 56 { x: 66.0999985; y: 38.5999985; scale-x: 0.718999982; scale-y: 0.718999982; }
        frame 57 { x: 55.5999985; y: 42.2000008; skew-x: 47.5999985; skew-y: 47.5999985; scale-x: 0.745000005; scale-y: 0.745000005; }
        frame 58 { x: 44.5999985; y: 47.4000015; skew-x: 28.7999992; skew-y: 28.7999992; scale-x: 0.772000015; scale-y: 0.772000015; }
        frame 59 { x: 34.0999985; y: 54.2000008; skew-x: 10.3000002; skew-y: 10.3000002; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 60 { x: 24.7000008; y: 55.4000015; skew-x: -5.69999981; skew-y: -5.69999981; scale-x: 0.83099997; scale-y: 0.736999989; image: IMAGE_REANIM_ZOMBIE_BOSSDRIVER_JAW; }
        frame 61 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 62 { x: 25.8999996; y: 52; skew-x: 3.29999995; skew-y: 1.60000002; scale-y: 0.737999976; }
        frame 63 { x: 27.3999996; y: 49; skew-x: 12.3000002; skew-y: 9.30000019; scale-x: 0.829999983; scale-y: -10000; }
        frame 64 { x: 29.2000008; y: 46; skew-x: 21.2999992; skew-y: 16.7999992; scale-x: 0.828999996; scale-y: 0.739000022; }
        frame 65 { x: 31.2999992; y: 43.4000015; skew-x: 30.6000004; skew-y: 24.3999996; scale-x: -10000; scale-y: 0.74000001; }
        frame 66 { x: 32.7000008; y: 43.5; skew-x: -10000; skew-y: 30.2999992; scale-x: 0.828000009; scale-y: 0.737999976; }
        frame 67 { x: 34.0999985; y: -10000; skew-y: 36.2000008; scale-x: 0.828999996; scale-y: 0.739000022; }
        frame 68 { x: 32.7000008; skew-y: 30.2999992; scale-x: 0.828000009; scale-y: 0.737999976; }
        frame 69 { x: 31.2999992; y: 43.4000015; skew-y: 24.3999996; scale-x: 0.828999996; scale-y: 0.74000001; }
        frame 70 { x: 32.7000008; y: 43.5; skew-y: 30.2999992; scale-x: 0.828000009; scale-y: 0.737999976; }
        frame 71 { x: 34.0999985; y: -10000; skew-y: 36.2000008; scale-x: 0.828999996; scale-y: 0.739000022; }
        frame 72 { x: 32.7000008; skew-y: 30.2999992; scale-x: 0.828000009; scale-y: 0.737999976; }
        frame 73 { x: 31.2999992; y: 43.4000015; skew-y: 24.3999996; scale-x: 0.828999996; scale-y: 0.74000001; }
        frame 74 { x: 32.7000008; y: 43.5; skew-y: 30.2999992; scale-x: 0.828000009; scale-y: 0.737999976; }
        frame 75 { x: 34.0999985; y: -10000; skew-y: 36.2000008; scale-x: 0.828999996; scale-y: 0.739000022; }
        frame 76 { x: 32.7000008; skew-y: 30.2999992; scale-x: 0.828000009; scale-y: 0.737999976; }
        frame 77 { x: 31.2999992; y: 43.4000015; skew-y: 24.3999996; scale-x: 0.828999996; scale-y: 0.74000001; }
        frame 78 { x: 33.0999985; y: 43.9000015; skew-x: 32.4000015; skew-y: 32.4000015; scale-x: 0.799000025; scale-y: 0.799000025; image: IMAGE_REANIM_ZOMBIE_BOSSDRIVER_JAW2; }
        frame 79 { x: 37.4000015; y: 35.0999985; skew-x: 27.6000004; skew-y: 27.6000004; scale-x: 0.797999978; scale-y: 0.797999978; image: none; }
        frame 80 { x: 41.7999992; y: 26.2999992; skew-x: 22.7999992; skew-y: 22.7999992; scale-x: -10000; scale-y: -10000; }
        frame 81 { x: 42.0999985; y: 26.2000008; skew-x: 23; skew-y: 23.2999992; scale-y: 0.801999986; }
        frame 82 { x: 42.4000015; y: -10000; skew-x: 23.2999992; skew-y: 23.7999992; scale-y: 0.806999981; }
        frame 83 { x: 42.7000008; y: 26.1000004; skew-x: 23.5; skew-y: 24.2999992; scale-y: 0.811999977; }
        frame 84 { x: 43; y: 25.8999996; skew-x: 23.7999992; skew-y: 24.7999992; scale-y: 0.815999985; }
        frame 85 { x: 43.5; y: -10000; skew-x: 24; skew-y: 25.2999992; scale-x: 0.799000025; scale-y: 0.82099998; }
        frame 86 { x: 43.7000008; y: 25.7000008; skew-x: 24.2999992; skew-y: 25.7999992; scale-x: -10000; scale-y: 0.825999975; }
        frame 87 { x: 44; y: 25.6000004; skew-x: 24.5; skew-y: 26.2999992; scale-y: 0.83099997; }
        frame 88 { x: 44.4000015; y: 25.5; skew-x: 24.7999992; skew-y: 26.7999992; scale-y: 0.834999979; }
        frame 89 { x: 44.7999992; y: -10000; skew-x: 25; skew-y: 27.2999992; scale-x: 0.800000012; scale-y: 0.839999974; }
        frame 90 { x: 45; y: 25.3999996; skew-x: 25.2999992; skew-y: 27.8999996; scale-x: -10000; scale-y: 0.845000029; }
        frame 91 { x: 45.4000015; y: 25.2999992; skew-x: 25.5; skew-y: 28.5; scale-y: 0.848999977; }
        frame 92 { x: 45.7999992; y: 25.2000008; skew-x: 25.7999992; skew-y: 29.1000004; scale-y: 0.853999972; }
        frame 93 { x: 46; y: 25.1000004; skew-x: 26; skew-y: 29.6000004; scale-x: 0.800999999; scale-y: 0.859000027; }
        frame 94 { x: 46.4000015; y: -10000; skew-x: 26.2999992; skew-y: 30.1000004; scale-x: -10000; scale-y: 0.864000022; }
        frame 95 { x: 46.7999992; y: 25; skew-x: 26.5; skew-y: 30.6000004; scale-y: 0.867999971; }
        frame 96 { x: 47; y: 24.7999992; skew-x: 26.7999992; skew-y: 31.1000004; scale-y: 0.873000026; }
        frame 97 { x: 47.5; y: -10000; skew-x: 27; skew-y: 31.6000004; scale-x: 0.801999986; scale-y: 0.878000021; }
        frame 98 { x: 47.5999985; skew-x: 27.2999992; skew-y: 32.0999985; scale-x: -10000; scale-y: 0.883000016; }
        frame 99 { x: 48; y: 24.6000004; skew-x: 27.5; skew-y: 32.5999985; scale-y: 0.887000024; }
        frame 100 { x: 48.4000015; y: 24.5; skew-x: 27.7999992; skew-y: 33.0999985; scale-y: 0.89200002; }
        frame 101 { x: 48.5999985; y: -10000; skew-x: 28; skew-y: 33.5999985; scale-x: 0.802999973; scale-y: 0.897000015; }
        frame 102 { x: 49; y: 24.3999996; skew-x: 28.2999992; skew-y: 34.0999985; scale-x: -10000; scale-y: 0.901000023; }
        frame 103 { x: 49.4000015; y: 24.2999992; skew-x: 28.5; skew-y: 34.5999985; scale-y: 0.906000018; }
        frame 104 { x: 49.7999992; y: -10000; skew-x: 28.7999992; skew-y: 35.2999992; scale-y: 0.911000013; }
        frame 105 { x: 50.0999985; y: 24.2000008; skew-x: 29.1000004; skew-y: 35.7999992; scale-x: 0.80400002; scale-y: 0.916000009; }
        frame 106 { x: 50.5; y: -10000; skew-x: 29.2999992; skew-y: 36.2999992; scale-x: -10000; scale-y: 0.920000017; }
        frame 107 { x: 50.7999992; y: 24.1000004; skew-x: 29.6000004; skew-y: 36.7999992; scale-y: 0.925000012; }
        frame 108 { x: 51.2000008; y: -10000; skew-x: 29.7999992; skew-y: 37.2999992; scale-y: 0.930000007; }
        frame 109 { x: 51.5; y: 23.8999996; skew-x: 30.1000004; skew-y: 37.7999992; scale-x: 0.805000007; scale-y: 0.935000002; }
        frame 110 { x: 51.7999992; y: -10000; skew-x: 30.2999992; skew-y: 38.4000015; scale-x: -10000; scale-y: 0.93900001; }
        frame 111 { x: 52.0999985; y: 23.7999992; skew-x: 30.6000004; skew-y: 38.9000015; scale-y: 0.944000006; }
        frame 112 { x: 52.5; y: 23.7000008; skew-x: 30.7999992; skew-y: 39.4000015; scale-y: 0.949000001; }
        frame 113 { x: 52.9000015; y: 23.7999992; skew-x: 31.1000004; skew-y: 39.9000015; scale-x: 0.805999994; scale-y: 0.953999996; }
        frame 114 { x: 53.2000008; y: 23.6000004; skew-x: 31.2999992; skew-y: 40.4000015; scale-x: -10000; scale-y: 0.958000004; }
        frame 115 { x: 53.5; y: -10000; skew-x: 31.6000004; skew-y: 40.9000015; scale-y: 0.963; }
        frame 116 { x: 53.9000015; y: 23.5; skew-x: 31.7999992; skew-y: 41.4000015; scale-y: 0.967999995; }
        frame 117 { x: 54.2999992; y: -10000; skew-x: 32.0999985; skew-y: 42.0999985; scale-x: 0.806999981; scale-y: 0.97299999; }
        frame 118 { x: 54.5999985; skew-x: 32.2999992; skew-y: 42.5999985; scale-x: -10000; scale-y: 0.976999998; }
        frame 119 { x: 55; y: 23.3999996; skew-x: 32.5999985; skew-y: 43.0999985; scale-y: 0.981999993; }
        frame 120 { x: 55.2999992; y: -10000; skew-x: 32.7999992; skew-y: 43.5999985; scale-y: 0.986999989; }
        frame 121 { x: 55.5999985; y: 23.2999992; skew-x: 33.0999985; skew-y: 44.0999985; scale-x: 0.808000028; scale-y: 0.991999984; }
        frame 122 { x: 56; y: -10000; skew-x: 33.2999992; skew-y: 44.5999985; scale-x: -10000; scale-y: 0.995999992; }
        frame 123 { x: 56.4000015; skew-x: 33.5999985; skew-y: 45.0999985; scale-y: 1.00100005; }
        frame 124 { x: 56.5999985; y: 23.2000008; skew-x: 33.7999992; skew-y: 45.5999985; scale-y: 1.00600004; }
        frame 125 { x: 57; y: -10000; skew-x: 34.0999985; skew-y: 46.0999985; scale-x: 0.809000015; scale-y: 1.00999999; }
        frame 126 { x: 57.4000015; y: 23.1000004; skew-x: 34.2999992; skew-y: 46.5999985; scale-x: -10000; scale-y: 1.01499999; }
        frame 127 { x: 57.7999992; y: -10000; skew-x: 34.5999985; skew-y: 47.2000008; scale-y: 1.01999998; }
        frame 128 { x: 58.0999985; skew-x: 34.7999992; skew-y: 47.7000008; scale-y: 1.02499998; }
        frame 129 { x: 58.4000015; y: 23; skew-x: 35; skew-y: 48.2000008; scale-x: 0.81099999; scale-y: 1.03100002; }
        frame 130 { x: 45.5999985; y: 33.7999992; skew-x: 23.2999992; skew-y: 29.6000004; scale-x: 0.80400002; scale-y: 0.903999984; }
        frame 131 { x: 33.7000008; y: 46.2999992; skew-x: 11.6999998; skew-y: 11; scale-x: 0.799000025; scale-y: 0.779999971; }
        frame 132 { x: 29.1000004; y: 54; skew-x: -0.699999988; skew-y: -4.19999981; scale-x: 0.779999971; scale-y: 0.731999993; }
        frame 133 { x: 25.3999996; y: 62.2999992; skew-x: -13.3999996; skew-y: -19.5; scale-x: 0.760999978; scale-y: 0.684000015; }
        frame 134 { x: 15.6999998; y: 70.1999969; skew-x: -26.2000008; skew-y: -35; scale-x: 0.742999971; scale-y: 0.637000024; }
        frame 135 { x: 18.7999992; y: 65.8000031; skew-x: -21.2000008; skew-y: -28.7000008; scale-x: 0.731000006; scale-y: 0.677999973; }
        frame 136 { x: 22.1000004; y: 61.2000008; skew-x: -16.3999996; skew-y: -22.3999996; scale-x: 0.720000029; scale-y: 0.720000029; }
        frame 137 { x: 31.7999992; y: 49.4000015; skew-x: 7.80000019; skew-y: 3.5; scale-x: -10000; scale-y: 0.718999982; }
        frame 138 { x: 43.7000008; y: 40.5; skew-x: 32.5; skew-y: 29.7999992; scale-y: -10000; }
        frame 139 { x: 33.2999992; y: 46.0999985; skew-x: 17.7999992; skew-y: 13.3000002; scale-x: 0.718999982; }
        frame 140 { x: 23.6000004; y: 53; skew-x: 3.0999999; skew-y: -2.9000001; scale-x: 0.720000029; scale-y: 0.720000029; }
        frame 141 { x: 15.1000004; y: 69.3000031; skew-x: -25.8999996; skew-y: -34.2000008; scale-x: -10000; scale-y: 0.718999982; }
        frame 142 { x: 21.2000008; y: 57.5; skew-x: -6.4000001; skew-y: -12.8999996; scale-x: 0.718999982; scale-y: -10000; }
        frame 143 { x: 29.3999996; y: 47.2999992; skew-x: 12.8000002; skew-y: 8.30000019; scale-x: -10000; scale-y: 0.720000029; }
        frame 144 { x: 44.7999992; y: 45.5; skew-x: 23.1000004; skew-y: 25.7999992; scale-x: 0.722000003; scale-y: 0.723999977; }
        frame 145 { x: 60; y: 45.0999985; skew-x: 33.5999985; skew-y: 43.4000015; scale-x: 0.726000011; scale-y: 0.728999972; }
        frame 146 { x: 72.8000031; y: 45.9000015; skew-x: 42.5999985; skew-y: 56.4000015; scale-x: 0.683000028; scale-y: 0.745999992; }
        frame 147 { x: 85.3000031; y: 47.4000015; skew-x: 51.5; skew-y: 69.0999985; scale-x: 0.643000007; scale-y: 0.764999986; }
        frame 148 { x: 84.3000031; y: 46.7999992; skew-x: 52.4000015; skew-y: 68.6999969; scale-x: 0.649999976; scale-y: 0.760999978; }
        frame 149 { x: 83.3000031; y: 46.0999985; skew-x: 53.2000008; skew-y: 68; scale-x: 0.657999992; scale-y: 0.759000003; }
        frame 150 { x: 82.3000031; y: 45.4000015; skew-x: 54.0999985; skew-y: 67.3000031; scale-x: 0.666000009; scale-y: 0.757000029; }
        frame 151 { x: 78.3000031; y: 58.7000008; skew-x: 39.7999992; skew-y: 48.4000015; scale-x: 0.698000014; scale-y: 0.728999972; }
        frame 152 { x: 74.1999969; y: 73.8000031; skew-x: 25.6000004; skew-y: 29.5; scale-x: 0.731999993; scale-y: 0.702000022; }
        frame 153 { x: 71.5; y: 85.0999985; skew-x: 17.7999992; skew-y: 21; scale-x: 0.726999998; scale-y: 0.707000017; }
        frame 154 { x: 68.9000015; y: 96.6999969; skew-x: 10.1000004; skew-y: 12.6000004; scale-x: 0.723999977; scale-y: 0.713; }
        frame 155 { x: 66.5999985; y: 108.5; skew-x: 2.5999999; skew-y: 4.30000019; scale-x: 0.720000029; scale-y: 0.720000029; }
        frame 156 { x: -10000; y: 113.800003; skew-x: 2.5; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 157 { y: 119.300003; skew-x: 2.5999999; }
        frame 158 { y: -10000; skew-x: 2.5; }
        frame 159 { skew-x: -10000; }
        frame 163 { skew-x: 2.5999999; }
        frame 164 { skew-x: -10000; }
    }
    Track {
        source-name: "Driver_outerarm_upper";
        frame-count: 187;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 9 { x: 47.5; y: 58; skew-x: -0.899999976; skew-y: -0.899999976; scale-x: 0.799000025; scale-y: 0.799000025; cel: 0; image: IMAGE_REANIM_ZOMBIE_BOSSDRIVER_UPPERARM; }
        frame 10 { x: -10000; y: 58.4000015; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 11 { y: 58.5999985; }
        frame 12 { x: 47.4000015; y: 59; }
        frame 13 { x: -10000; y: 59.2999992; }
        frame 14 { x: 47.2999992; y: 59.7000008; }
        frame 15 { x: 47.2000008; y: 60; skew-x: -1; skew-y: -1; }
        frame 16 { x: -10000; y: 60.4000015; skew-x: -1.20000005; skew-y: -1.20000005; }
        frame 17 { x: 47.2999992; y: 60; skew-x: 0.5; skew-y: -0.899999976; scale-y: 0.808000028; }
        frame 18 { x: -10000; y: 59.5999985; skew-x: 2.29999995; skew-y: -10000; scale-x: 0.800000012; scale-y: 0.816999972; }
        frame 19 { x: 47.4000015; y: 59.4000015; skew-x: 1.5; scale-x: -10000; scale-y: 0.813000023; }
        frame 20 { x: -10000; y: 59; skew-x: 0.800000012; scale-x: 0.799000025; scale-y: 0.810000002; }
        frame 21 { x: 47.5; y: 58.7999992; skew-x: 0.300000012; scale-x: -10000; scale-y: 0.805999994; }
        frame 22 { x: 47.5999985; y: 58.4000015; skew-x: -0.200000003; skew-y: -0.699999988; scale-y: 0.801999986; }
        frame 23 { x: 47.5; y: 58; skew-x: -0.899999976; skew-y: -0.899999976; scale-y: 0.799000025; }
        frame 24 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 25 { x: 49.2000008; y: 58.9000015; skew-x: -1.70000005; skew-y: -1.70000005; }
        frame 26 { x: 50.5999985; y: 59.9000015; skew-x: -2.70000005; skew-y: -2.70000005; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 27 { x: 52; y: 60.7999992; skew-x: -3.70000005; skew-y: -3.70000005; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 53.5; y: 61.7999992; skew-x: -4.69999981; skew-y: -4.69999981; }
        frame 29 { x: 55; y: 62.7999992; skew-x: -5.69999981; skew-y: -5.69999981; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 30 { x: 56.2999992; y: 63.7999992; skew-x: -6.9000001; skew-y: -6.9000001; scale-x: -10000; scale-y: -10000; }
        frame 31 { x: 55; y: 62.9000015; skew-x: -5.69999981; skew-y: -5.69999981; }
        frame 32 { x: 53.4000015; y: 61.7999992; skew-x: -4.69999981; skew-y: -4.69999981; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 33 { x: 52; y: 60.9000015; skew-x: -3.70000005; skew-y: -3.70000005; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: 50.5; y: 60; skew-x: -2.70000005; skew-y: -2.70000005; }
        frame 35 { x: 49; y: 59; skew-x: -1.70000005; skew-y: -1.70000005; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 36 { x: 47.5; y: 58; skew-x: -0.899999976; skew-y: -0.899999976; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 50.0999985; y: 56.4000015; skew-x: 8; skew-y: 9.80000019; scale-x: 0.797999978; scale-y: 0.829999983; }
        frame 38 { x: 53; y: 55.5; skew-x: 17.1000004; skew-y: 20.6000004; scale-x: 0.796000004; scale-y: 0.861999989; }
        frame 39 { x: 56; y: 55.2000008; skew-x: 26.2999992; skew-y: 31.3999996; scale-x: -10000; scale-y: 0.894999981; }
        frame 40 { x: 58; y: 55.5999985; skew-x: 35.5999985; skew-y: 38.9000015; scale-x: 0.795000017; scale-y: 0.924000025; }
        frame 41 { x: 60; y: 56.5; skew-x: 44.5999985; skew-y: 46.4000015; scale-x: -10000; scale-y: 0.954999983; }
        frame 42 { x: 62.0999985; y: 57.7999992; skew-x: 53.9000015; skew-y: 53.9000015; scale-x: 0.796000004; scale-y: 0.986999989; }
        frame 43 { x: 60.0999985; y: 56.5; skew-x: 44.5999985; skew-y: 46.4000015; scale-x: 0.795000017; scale-y: 0.953999996; }
        frame 44 { x: 58; y: 55.5; skew-x: 35.5999985; skew-y: 38.7999992; scale-x: -10000; scale-y: 0.924000025; }
        frame 45 { x: 56.2999992; y: 55.0999985; skew-x: 26.2999992; skew-y: 31.2999992; scale-x: 0.796000004; scale-y: 0.894999981; }
        frame 46 { x: 53.0999985; y: 55.5; skew-x: 17.1000004; skew-y: 20.5; scale-x: -10000; scale-y: 0.861999989; }
        frame 47 { x: 50.2000008; y: 56.5; skew-x: 8; skew-y: 9.80000019; scale-x: 0.797999978; scale-y: 0.829999983; }
        frame 48 { x: 47.5; y: 58; skew-x: -0.899999976; skew-y: -0.899999976; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 49 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: 60.7000008; y: 56.0999985; skew-x: 21.7999992; skew-y: 24.7999992; scale-x: 0.796000004; scale-y: 0.879999995; }
        frame 51 { x: 75.0999985; y: 57.9000015; skew-x: 44.7000008; skew-y: 50.7999992; scale-x: 0.795000017; scale-y: 0.963; }
        frame 52 { x: 85.1999969; y: 60.7999992; skew-x: 59.7000008; skew-y: 62.7000008; scale-x: 0.79400003; scale-y: 1.07700002; }
        frame 53 { x: 95.1999969; y: 65.3000031; skew-x: 74.4000015; skew-y: 74.4000015; scale-x: 0.795000017; scale-y: 1.19400001; }
        frame 54 { x: 88.9000015; y: 62.4000015; skew-x: 67; skew-y: 67; scale-x: 0.79400003; scale-y: 1.12100005; }
        frame 55 { x: 82.5999985; y: 60; skew-x: 59.4000015; skew-y: 59.4000015; scale-x: -10000; scale-y: 1.04999995; }
        frame 56 { x: 76.3000031; y: 58.2999992; skew-x: 51.9000015; skew-y: 51.9000015; scale-x: 0.795000017; scale-y: 0.980000019; }
        frame 57 { x: 68.5999985; y: 56.7999992; skew-x: 39.0999985; skew-y: 39.0999985; scale-x: 0.79400003; scale-y: 0.90200001; }
        frame 58 { x: 61.0999985; y: 56.5; skew-x: 26.3999996; skew-y: 26.2000008; scale-x: 0.796000004; scale-y: 0.828000009; }
        frame 59 { x: 54.0999985; y: 56.9000015; skew-x: 12.6000004; skew-y: 12.5; scale-x: 0.796999991; scale-y: 0.813000023; }
        frame 60 { x: 47.5; y: 58; skew-x: -0.899999976; skew-y: -0.899999976; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 61 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 62 { x: 48.2000008; y: 57.5999985; skew-x: 0.5; skew-y: 0.5; }
        frame 63 { x: 48.9000015; y: 57.4000015; skew-x: 2.29999995; skew-y: 2.29999995; }
        frame 64 { x: 49.5; y: 57.0999985; skew-x: 3.79999995; skew-y: 3.79999995; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 65 { x: 50.0999985; y: 56.9000015; skew-x: 5.5999999; skew-y: 5.5999999; scale-x: -10000; scale-y: -10000; }
        frame 66 { x: 50.2000008; y: 56.4000015; skew-x: 5.5; skew-y: 5.5; }
        frame 67 { x: 50.0999985; y: 55.7000008; skew-x: 5.5999999; skew-y: 5.5999999; }
        frame 68 { x: -10000; y: 56.4000015; skew-x: 5.5; skew-y: 5.5; }
        frame 69 { y: 56.9000015; skew-x: 5.5999999; skew-y: 5.5999999; }
        frame 70 { x: 50.2000008; y: 56.4000015; skew-x: 5.5; skew-y: 5.5; }
        frame 71 { x: 50.0999985; y: 55.7000008; skew-x: 5.5999999; skew-y: 5.5999999; }
        frame 72 { x: -10000; y: 56.4000015; skew-x: 5.5; skew-y: 5.5; }
        frame 73 { y: 56.9000015; skew-x: 5.5999999; skew-y: 5.5999999; }
        frame 74 { x: 50.2000008; y: 56.4000015; skew-x: 5.5; skew-y: 5.5; }
        frame 75 { x: 50.0999985; y: 55.7000008; skew-x: 5.5999999; skew-y: 5.5999999; }
        frame 76 { x: -10000; y: 56.4000015; skew-x: 5.5; skew-y: 5.5; }
        frame 77 { y: 56.9000015; skew-x: 5.5999999; skew-y: 5.5999999; }
        frame 78 { y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 79 { x: 56.2999992; y: 47.0999985; skew-x: 19.6000004; skew-y: 19.6000004; scale-x: 0.796999991; scale-y: 0.981999993; }
        frame 80 { x: 64.0999985; y: 38.5999985; skew-x: 33.9000015; skew-y: 33.9000015; scale-x: -10000; scale-y: 1.16799998; }
        frame 81 { x: 64.1999969; y: 38.7000008; skew-x: 33.7999992; skew-y: -10000; scale-x: 0.795000017; scale-y: 1.16700006; }
        frame 82 { x: 64.3000031; y: 38.5999985; skew-x: 33.9000015; scale-x: 0.79400003; scale-y: 1.16799998; }
        frame 83 { x: 64.4000015; y: 38.7000008; skew-x: -10000; skew-y: 34.0999985; scale-x: -10000; scale-y: 1.16900003; }
        frame 84 { x: 64.5; y: 38.5999985; skew-y: -10000; scale-x: 0.792999983; scale-y: -10000; }
        frame 85 { x: 64.6999969; y: -10000; skew-x: 34.0999985; scale-x: -10000; scale-y: 1.16999996; }
        frame 86 { x: 64.8000031; skew-x: -10000; scale-x: 0.791999996; scale-y: 1.171; }
        frame 87 { x: -10000; y: 38.7000008; skew-y: 34.2999992; scale-x: 0.791000009; scale-y: 1.17200005; }
        frame 88 { x: 65; y: 38.5999985; skew-y: -10000; scale-x: -10000; scale-y: 1.17299998; }
        frame 89 { x: -10000; y: -10000; scale-x: 0.790000021; scale-y: 1.17400002; }
        frame 90 { x: 65.1999969; skew-y: 34.4000015; scale-x: -10000; scale-y: -10000; }
        frame 91 { x: 65.3000031; y: 38.7000008; skew-y: 34.5999985; scale-x: 0.788999975; scale-y: 1.17499995; }
        frame 92 { x: -10000; y: 38.5999985; skew-y: -10000; scale-x: -10000; scale-y: 1.176; }
        frame 93 { x: 65.5; y: 38.7000008; scale-x: 0.787999988; scale-y: 1.17700005; }
        frame 94 { x: 65.5999985; y: 38.5999985; skew-x: 34.2999992; scale-x: -10000; scale-y: 1.17799997; }
        frame 95 { x: -10000; y: -10000; skew-x: -10000; scale-x: 0.787; scale-y: 1.17900002; }
        frame 96 { x: 65.8000031; y: 38.7000008; skew-y: 34.7999992; scale-x: 0.786000013; scale-y: 1.17999995; }
        frame 97 { x: 65.9000015; y: 38.5999985; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 98 { x: 66.0999985; y: -10000; skew-y: 34.9000015; scale-x: 0.785000026; scale-y: 1.18099999; }
        frame 99 { x: -10000; skew-y: -10000; scale-x: -10000; scale-y: 1.18200004; }
        frame 100 { x: 66.3000031; skew-x: 34.4000015; skew-y: 35.0999985; scale-x: 0.783999979; scale-y: 1.18299997; }
        frame 101 { x: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: 1.18400002; }
        frame 102 { x: 66.5; y: 38.7000008; scale-x: 0.782999992; scale-y: 1.18499994; }
        frame 103 { x: -10000; y: 38.5999985; skew-x: 34.5999985; scale-x: -10000; scale-y: -10000; }
        frame 104 { x: 66.6999969; y: 38.7000008; skew-x: -10000; skew-y: 35.2999992; scale-x: 0.782000005; scale-y: 1.18599999; }
        frame 105 { x: 66.8000031; y: -10000; skew-y: -10000; scale-x: 0.781000018; scale-y: 1.18700004; }
        frame 106 { x: 66.9000015; y: 38.5999985; scale-x: -10000; scale-y: 1.18799996; }
        frame 107 { x: 67; y: 38.7000008; skew-y: 35.4000015; scale-x: 0.779999971; scale-y: 1.18900001; }
        frame 108 { x: 67.0999985; y: 38.5999985; skew-y: -10000; scale-x: -10000; scale-y: 1.19000006; }
        frame 109 { x: 67.1999969; y: 38.7999992; skew-y: 35.5999985; scale-x: 0.778999984; scale-y: 1.19099998; }
        frame 110 { x: 67.3000031; y: 38.5999985; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 111 { x: -10000; y: -10000; scale-x: 0.777999997; scale-y: 1.19200003; }
        frame 112 { x: 67.5; skew-x: 34.7999992; scale-x: -10000; scale-y: 1.19299996; }
        frame 113 { x: 67.5999985; y: 38.7000008; skew-x: -10000; skew-y: 35.7999992; scale-x: 0.77700001; scale-y: 1.19400001; }
        frame 114 { x: 67.8000031; y: 38.5999985; skew-y: -10000; scale-x: 0.776000023; scale-y: 1.19500005; }
        frame 115 { x: -10000; y: -10000; skew-y: 35.9000015; scale-x: -10000; scale-y: 1.19599998; }
        frame 116 { x: 67.9000015; y: 38.7000008; skew-y: -10000; scale-x: 0.774999976; scale-y: 1.19700003; }
        frame 117 { x: 68; y: -10000; skew-y: 36.0999985; scale-x: -10000; scale-y: -10000; }
        frame 118 { x: 68.1999969; y: 38.7999992; skew-x: 34.9000015; skew-y: -10000; scale-x: 0.773999989; scale-y: 1.19799995; }
        frame 119 { x: 68.3000031; y: 38.5999985; skew-x: -10000; scale-x: -10000; scale-y: 1.199; }
        frame 120 { x: -10000; y: 38.7000008; scale-x: 0.773000002; scale-y: 1.20000005; }
        frame 121 { x: 68.5; y: 38.5999985; skew-x: 35.0999985; scale-x: -10000; scale-y: 1.20099998; }
        frame 122 { x: 68.5999985; y: 38.7000008; skew-x: -10000; skew-y: 36.2999992; scale-x: 0.772000015; scale-y: 1.20200002; }
        frame 123 { x: 68.8000031; y: 38.5999985; skew-y: -10000; scale-x: 0.771000028; scale-y: -10000; }
        frame 124 { x: -10000; y: -10000; skew-y: 36.4000015; scale-x: -10000; scale-y: 1.20299995; }
        frame 125 { skew-y: -10000; scale-x: 0.769999981; scale-y: 1.204; }
        frame 126 { x: 69.0999985; skew-y: 36.5999985; scale-x: -10000; scale-y: 1.20500004; }
        frame 127 { x: -10000; y: 38.7000008; skew-y: -10000; scale-x: 0.768999994; scale-y: 1.20599997; }
        frame 128 { x: 69.3000031; y: 38.5999985; scale-x: -10000; scale-y: 1.20700002; }
        frame 129 { x: -10000; y: -10000; skew-x: 35.2000008; skew-y: 36.7000008; scale-y: 1.20899999; }
        frame 130 { x: 58.9000015; y: 46.7999992; skew-x: 20.2999992; skew-y: 21.1000004; scale-x: 0.782999992; scale-y: 1.00300002; }
        frame 131 { x: 50.0999985; y: 56.9000015; skew-x: 5.5999999; skew-y: 5.5999999; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 132 { x: 46.4000015; y: 59.5; skew-x: -3.5; skew-y: -1.20000005; scale-x: 0.788999975; scale-y: 0.808000028; }
        frame 133 { x: 42.9000015; y: 62.5; skew-x: -12.8999996; skew-y: -8.10000038; scale-x: 0.779999971; scale-y: 0.816999972; }
        frame 134 { x: 35.5999985; y: 66.4000015; skew-x: -22.3999996; skew-y: -26; scale-x: 0.771000028; scale-y: 0.824000001; }
        frame 135 { x: 40.7999992; y: 63.5; skew-x: -15.1999998; skew-y: -16.2000008; scale-x: 0.774999976; scale-y: 0.819999993; }
        frame 136 { x: 46.0999985; y: 60.9000015; skew-x: -8.19999981; skew-y: -6.69999981; scale-x: 0.779999971; scale-y: 0.818000019; }
        frame 137 { x: 51.5; y: 58.7000008; skew-x: -1.20000005; skew-y: 2.5999999; scale-x: 0.785000026; scale-y: 0.815999985; }
        frame 138 { x: 57.2000008; y: 56.9000015; skew-x: 5.69999981; skew-y: 12.3999996; scale-x: 0.788999975; scale-y: 0.813000023; }
        frame 139 { x: 49.5; y: 59.5; skew-x: -3.4000001; skew-y: 0; scale-x: 0.785000026; scale-y: 0.814999998; }
        frame 140 { x: 42.2000008; y: 62.7000008; skew-x: -12.6999998; skew-y: -12.3999996; scale-x: 0.781000018; scale-y: -10000; }
        frame 141 { x: 35.0999985; y: 66.4000015; skew-x: -22.2000008; skew-y: -25; scale-x: 0.77700001; scale-y: 0.816999972; }
        frame 142 { x: 42.0999985; y: 62.5999985; skew-x: -12.6999998; skew-y: -12.3999996; scale-x: 0.781000018; scale-y: 0.814999998; }
        frame 143 { x: 49.5999985; y: 59.5; skew-x: -3.4000001; skew-y: 0; scale-x: 0.785000026; scale-y: 0.81400001; }
        frame 144 { x: 57.2000008; y: 56.9000015; skew-x: 5.69999981; skew-y: 12.3999996; scale-x: 0.788999975; scale-y: 0.813000023; }
        frame 145 { x: 72.3000031; y: 56.4000015; skew-x: 28.7999992; skew-y: 37.7999992; scale-x: 0.772000015; scale-y: 0.912; }
        frame 146 { x: 88.1999969; y: 59.9000015; skew-x: 52.0999985; skew-y: 63.2999992; scale-x: 0.757000029; scale-y: 1.01300001; }
        frame 147 { x: 101.900002; y: 66.1999969; skew-x: 75.1999969; skew-y: 81.6999969; scale-x: 0.742999971; scale-y: 1.097; }
        frame 148 { x: 99; y: 64.1999969; skew-x: 69.1999969; skew-y: 75.6999969; scale-x: 0.741999984; scale-y: 1.09500003; }
        frame 149 { x: 95.8000031; y: 62.4000015; skew-x: 63; skew-y: 69.6999969; scale-x: -10000; scale-y: -10000; }
        frame 150 { x: 92.6999969; y: 60.7000008; skew-x: 56.9000015; skew-y: 63.4000015; scale-x: 0.742999971; scale-y: 1.09599996; }
        frame 151 { x: 95.1999969; y: 75.5999985; skew-x: 76.1999969; skew-y: 82.9000015; scale-x: 0.765999973; scale-y: 1.08099997; }
        frame 152 { x: 102.5; y: 91.3000031; skew-x: 95.5999985; skew-y: 102.099998; scale-x: 0.791000009; scale-y: 1.06799996; }
        frame 153 { x: 87.8000031; y: 101.800003; skew-x: 110.599998; skew-y: 117.199997; scale-x: 0.815999985; scale-y: 1.05599999; }
        frame 154 { x: 91.0999985; y: 111.599998; skew-x: -10000; skew-y: 117.099998; scale-x: 0.814999998; scale-y: 1.05400002; }
        frame 155 { x: 94.5999985; y: 121.300003; skew-y: 117.199997; scale-x: 0.815999985; scale-y: 1.05599999; }
        frame 156 { x: -10000; y: -10000; skew-y: 117.099998; scale-x: 0.814999998; scale-y: 1.05400002; }
        frame 157 { skew-y: 117.199997; scale-x: 0.815999985; scale-y: 1.05599999; }
        frame 158 { skew-y: 117.099998; scale-x: 0.814999998; scale-y: 1.05400002; }
        frame 159 { skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 163 { skew-y: 117.199997; scale-x: 0.815999985; scale-y: 1.05599999; }
        frame 164 { skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Driver_outerarm_lower2";
        frame-count: 187;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 9 { x: 34.7999992; y: 83.1999969; scale-x: 0.800000012; scale-y: 0.800000012; cel: 0; image: IMAGE_REANIM_ZOMBIE_BOSSDRIVER_LOWERARM2; }
        frame 10 { x: -10000; y: 83.3000031; skew-x: 0.300000012; skew-y: 0.300000012; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 11 { y: 83.5; skew-x: 0.800000012; skew-y: 0.800000012; }
        frame 12 { y: 83.6999969; skew-x: 1.29999995; skew-y: 1.29999995; }
        frame 13 { y: -10000; skew-x: 1.79999995; skew-y: 1.79999995; }
        frame 14 { y: 83.8000031; skew-x: 2.29999995; skew-y: 2.29999995; }
        frame 15 { x: 34.9000015; y: 83.9000015; skew-x: 2.79999995; skew-y: 2.79999995; }
        frame 16 { x: -10000; y: 84.0999985; skew-x: 3.29999995; skew-y: 3.29999995; }
        frame 17 { y: 84; skew-x: 3.79999995; skew-y: 2.79999995; scale-y: 0.799000025; }
        frame 18 { y: 83.9000015; skew-x: 4.4000001; skew-y: 2.29999995; scale-x: 0.800999999; scale-y: 0.797999978; }
        frame 19 { y: 83.8000031; skew-x: 3.5; skew-y: 1.79999995; scale-x: -10000; scale-y: 0.799000025; }
        frame 20 { y: 83.6999969; skew-x: 2.5; skew-y: 1.29999995; scale-y: -10000; }
        frame 21 { y: 83.5999985; skew-x: 1.79999995; skew-y: 0.800000012; scale-x: 0.800000012; }
        frame 22 { y: 83.4000015; skew-x: 0.800000012; skew-y: 0.300000012; scale-x: -10000; scale-y: 0.800000012; }
        frame 23 { x: 34.7999992; y: 83.1999969; skew-x: 0; skew-y: 0; scale-y: -10000; }
        frame 24 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 25 { x: 36.5999985; y: 82.8000031; skew-x: 2.29999995; skew-y: 2.29999995; }
        frame 26 { x: 38.4000015; y: 82.3000031; skew-x: 4.5; skew-y: 4.5; }
        frame 27 { x: 40.2000008; y: 82; skew-x: 7; skew-y: 7; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 28 { x: 42; y: 81.5999985; skew-x: 9.30000019; skew-y: 9.30000019; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 43.9000015; y: 81.3000031; skew-x: 11.6000004; skew-y: 11.6000004; }
        frame 30 { x: 45.7999992; y: 81; skew-x: 14.1000004; skew-y: 14.1000004; }
        frame 31 { x: 43.9000015; y: 81.3000031; skew-x: 11.6000004; skew-y: 11.6000004; }
        frame 32 { x: 42.0999985; y: 81.6999969; skew-x: 9.30000019; skew-y: 9.30000019; }
        frame 33 { x: 40.2999992; y: 82; skew-x: 7; skew-y: 7; }
        frame 34 { x: 38.5; y: 82.3000031; skew-x: 4.5; skew-y: 4.5; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 35 { x: 36.5999985; y: 82.8000031; skew-x: 2.29999995; skew-y: 2.29999995; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: 34.7999992; y: 83.1999969; skew-x: 0; skew-y: 0; }
        frame 37 { x: 32.9000015; y: 83.6999969; skew-x: -10000; skew-y: -10000; }
        frame 38 { x: 30.8999996; y: 84.0999985; skew-x: 0.300000012; skew-y: 0.300000012; }
        frame 39 { x: 29; y: 84.5; skew-x: -10000; skew-y: -10000; }
        frame 40 { x: 27; y: 84.8000031; skew-x: 0.5; skew-y: 0.5; }
        frame 41 { x: 25.1000004; y: 85.3000031; skew-x: -10000; skew-y: -10000; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 42 { x: 23.2000008; y: 85.8000031; skew-x: 0.800000012; skew-y: 0.800000012; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: 25.2000008; y: 85.3000031; skew-x: 0.5; skew-y: 0.5; }
        frame 44 { x: 27.2000008; y: 84.8000031; skew-x: -10000; skew-y: -10000; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 45 { x: 29; y: 84.5999985; skew-x: 0.300000012; skew-y: 0.300000012; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 30.8999996; y: 84.0999985; skew-x: -10000; skew-y: -10000; }
        frame 47 { x: 32.9000015; y: 83.6999969; skew-x: 0; skew-y: 0; }
        frame 48 { x: 34.7999992; y: 83.1999969; skew-x: -10000; skew-y: -10000; }
        frame 49 { x: -10000; y: -10000; }
        frame 50 { x: 37; y: 81.4000015; skew-x: 6.80000019; skew-y: 6.80000019; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 51 { x: 39.5; y: 79.8000031; skew-x: 13.6000004; skew-y: 13.6000004; scale-x: -10000; scale-y: -10000; }
        frame 52 { x: 42; y: 78.3000031; skew-x: 20.5; skew-y: 20.5; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 53 { x: 44.5; y: 77; skew-x: 27.3999996; skew-y: 27.3999996; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: 43; y: 77.8000031; skew-x: 23.2999992; skew-y: 23.2999992; }
        frame 55 { x: 41.5; y: 78.5999985; skew-x: 19.5; skew-y: 19.5; }
        frame 56 { x: 40.0999985; y: 79.3000031; skew-x: 15.5; skew-y: 15.5; }
        frame 57 { x: 38.7999992; y: 80.3000031; skew-x: 11.6000004; skew-y: 11.6000004; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 58 { x: 37.5; y: 81.1999969; skew-x: 7.80000019; skew-y: 7.80000019; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 36.0999985; y: 82.3000031; skew-x: 3.79999995; skew-y: 3.79999995; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 60 { x: 34.7999992; y: 83.1999969; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 61 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 66 { x: 35; y: 82.9000015; }
        frame 67 { x: 35.2999992; y: 82.5999985; }
        frame 68 { x: 35; y: 82.9000015; }
        frame 69 { x: 34.7999992; y: 83.1999969; }
        frame 70 { x: 35; y: 82.9000015; }
        frame 71 { x: 35.2999992; y: 82.5999985; }
        frame 72 { x: 35; y: 82.9000015; }
        frame 73 { x: 34.7999992; y: 83.1999969; }
        frame 74 { x: 35; y: 82.9000015; }
        frame 75 { x: 35.2999992; y: 82.5999985; }
        frame 76 { x: 35; y: 82.9000015; }
        frame 77 { x: 34.7999992; y: 83.1999969; }
        frame 78 { x: -10000; y: -10000; }
        frame 79 { x: 35.2000008; y: 79.8000031; skew-x: -0.699999988; skew-y: -0; scale-x: 0.790000021; scale-y: 0.834999979; }
        frame 80 { x: 35.5999985; y: 76.3000031; skew-x: -1.5; skew-y: -0.300000012; scale-x: 0.779999971; scale-y: 0.870000005; }
        frame 81 { x: -10000; y: -10000; skew-x: -1.39999998; skew-y: -0.200000003; scale-x: -10000; scale-y: -10000; }
        frame 82 { skew-x: -10000; skew-y: -10000; }
        frame 129 { skew-x: -1.5; skew-y: -0.300000012; }
        frame 130 { x: 35.2999992; y: 79.8000031; skew-x: -0.699999988; skew-y: -0; scale-x: 0.790000021; scale-y: 0.834999979; }
        frame 131 { x: 34.7999992; y: 83.1999969; skew-x: 0; skew-y: 0; scale-x: 0.800000012; scale-y: 0.800000012; }
        frame 132 { x: 33.5999985; y: -10000; skew-x: -10000; skew-y: -1.5; scale-x: -10000; scale-y: 0.800999999; }
        frame 133 { x: 32.5; skew-y: -3.20000005; scale-y: 0.801999986; }
        frame 134 { x: 31.2999992; skew-y: -5.0999999; scale-y: 0.802999973; }
        frame 135 { x: 33.0999985; skew-y: -2; scale-y: 0.80400002; }
        frame 136 { x: 35; y: 83.0999985; skew-y: 0.800000012; scale-y: 0.805000007; }
        frame 137 { x: 36.7999992; y: 83.1999969; skew-y: 3.79999995; scale-y: -10000; }
        frame 138 { x: 38.7000008; y: -10000; skew-y: 6.9000001; scale-y: 0.805999994; }
        frame 139 { x: 36; y: 83.0999985; skew-y: 3.29999995; scale-y: 0.80400002; }
        frame 140 { x: 33.2000008; y: 83.1999969; skew-y: -0.200000003; scale-y: 0.802999973; }
        frame 141 { x: 30.5; y: -10000; skew-y: -3.9000001; scale-y: 0.801999986; }
        frame 142 { x: 33.0999985; skew-y: -0.200000003; scale-y: 0.802999973; }
        frame 143 { x: 35.9000015; y: 83.0999985; skew-y: 3.29999995; scale-y: 0.80400002; }
        frame 144 { x: 38.7000008; y: 83.1999969; skew-y: 6.9000001; scale-y: 0.805999994; }
        frame 145 { x: 42.0999985; y: 82.5999985; skew-y: 10.3000002; scale-y: 0.815999985; }
        frame 146 { x: 45.5; y: 82.0999985; skew-y: 14; scale-y: 0.827000022; }
        frame 147 { x: 49; y: 81.5999985; skew-y: 17.6000004; scale-y: 0.838999987; }
        frame 148 { x: 48.0999985; y: 81.8000031; skew-y: 17.5; scale-y: 0.838; }
        frame 149 { x: 47.4000015; y: 82.1999969; skew-y: -10000; scale-y: -10000; }
        frame 150 { x: 46.5999985; y: 82.4000015; skew-y: 17.6000004; scale-y: 0.838999987; }
        frame 151 { x: 44; y: 85.6999969; skew-x: 8.30000019; skew-y: 25.7999992; scale-x: 0.799000025; scale-y: 0.838; }
        frame 152 { x: 41.5999985; y: 89.1999969; skew-x: 16.6000004; skew-y: 34.2999992; scale-x: -10000; scale-y: 0.837000012; }
        frame 153 { x: 39.2000008; y: 92.9000015; skew-x: 25.1000004; skew-y: 42.7000008; scale-y: 0.838; }
        frame 154 { x: 42.5999985; y: 102.699997; skew-x: -10000; skew-y: 42.5999985; scale-x: 0.797999978; scale-y: 0.837000012; }
        frame 155 { x: 46; y: 112.5; skew-y: 42.7000008; scale-x: 0.799000025; scale-y: 0.838; }
        frame 156 { x: -10000; y: -10000; skew-y: 42.5999985; scale-x: 0.797999978; scale-y: 0.837000012; }
        frame 157 { skew-y: 42.7000008; scale-x: 0.799000025; scale-y: 0.838; }
        frame 158 { skew-y: 42.5999985; scale-x: 0.797999978; scale-y: 0.837000012; }
        frame 159 { skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 163 { skew-y: 42.7000008; scale-x: 0.799000025; scale-y: 0.838; }
        frame 164 { skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Driver_outerarm_hand";
        frame-count: 187;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 9 { x: 19.1000004; y: 78.3000031; skew-x: 9.30000019; skew-y: 9.30000019; scale-x: 0.899999976; scale-y: 0.899999976; cel: 0; image: IMAGE_REANIM_ZOMBIE_BOSSDRIVER_OUTERHAND; }
        frame 10 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: 0.898999989; scale-y: 0.898999989; cel: -10000; image: none; }
        frame 11 { scale-x: -10000; scale-y: -10000; }
        frame 16 { scale-x: 0.899999976; scale-y: 0.899999976; }
        frame 17 { scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 18 { scale-x: -10000; scale-y: -10000; }
        frame 23 { scale-x: 0.899999976; scale-y: 0.899999976; }
        frame 24 { scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 20.7999992; y: 77.1999969; skew-x: 12.3000002; skew-y: 12.3000002; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 26 { x: 22.7000008; y: 76; skew-x: 15.3000002; skew-y: 15.3000002; scale-x: 0.898000002; scale-y: 0.898000002; }
        frame 27 { x: 24.6000004; y: 75; skew-x: 18.2999992; skew-y: 18.2999992; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 26.3999996; y: 73.9000015; skew-x: 21.2999992; skew-y: 21.2999992; }
        frame 29 { x: 28.2999992; y: 72.8000031; skew-x: 24.2999992; skew-y: 24.2999992; }
        frame 30 { x: 30.2000008; y: 72; skew-x: 27.3999996; skew-y: 27.3999996; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 31 { x: 28.2999992; y: 73; skew-x: 24.2999992; skew-y: 24.2999992; scale-x: 0.898000002; scale-y: 0.898000002; }
        frame 32 { x: 26.3999996; y: 74; skew-x: 21.2999992; skew-y: 21.2999992; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 24.6000004; y: 75; skew-x: 18.2999992; skew-y: 18.2999992; }
        frame 34 { x: 22.7000008; y: 76; skew-x: 15.3000002; skew-y: 15.3000002; }
        frame 35 { x: 20.7999992; y: 77.3000031; skew-x: 12.3000002; skew-y: 12.3000002; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 36 { x: 19.1000004; y: 78.3000031; skew-x: 9.30000019; skew-y: 9.30000019; scale-x: 0.899999976; scale-y: 0.899999976; }
        frame 37 { x: 17.2000008; y: 79.3000031; skew-x: 6.30000019; skew-y: 6.30000019; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 38 { x: 15.6000004; y: 80.3000031; skew-x: 3.5; skew-y: 3.5; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 13.8000002; y: 81.3000031; skew-x: 0.600000024; skew-y: 0.600000024; }
        frame 40 { x: 12.3000002; y: 82.3000031; skew-x: -1.89999998; skew-y: -1.89999998; }
        frame 41 { x: 10.6999998; y: 83.3000031; skew-x: -4.69999981; skew-y: -4.69999981; }
        frame 42 { x: 9.10000038; y: 84.5999985; skew-x: -7.69999981; skew-y: -7.69999981; }
        frame 43 { x: 10.6999998; y: 83.3000031; skew-x: -4.69999981; skew-y: -4.69999981; }
        frame 44 { x: 12.3000002; y: 82.3000031; skew-x: -1.89999998; skew-y: -1.89999998; }
        frame 45 { x: 13.8999996; y: 81.5; skew-x: 0.600000024; skew-y: 0.600000024; }
        frame 46 { x: 15.6999998; y: 80.4000015; skew-x: 3.5; skew-y: 3.5; }
        frame 47 { x: 17.3999996; y: 79.4000015; skew-x: 6.30000019; skew-y: 6.30000019; }
        frame 48 { x: 19.1000004; y: 78.3000031; skew-x: 9.30000019; skew-y: 9.30000019; scale-x: 0.899999976; scale-y: 0.899999976; }
        frame 49 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: 22.2999992; y: 76.0999985; skew-x: 16.2999992; skew-y: 16.2999992; scale-x: 0.898000002; scale-y: 0.898000002; }
        frame 51 { x: 25.8999996; y: 74.0999985; skew-x: 23.5; skew-y: 23.5; scale-x: -10000; scale-y: -10000; }
        frame 52 { x: 29.3999996; y: 72.3000031; skew-x: 30.6000004; skew-y: 30.6000004; scale-x: 0.897000015; scale-y: 0.897000015; }
        frame 53 { x: 33.0999985; y: 70.9000015; skew-x: 37.9000015; skew-y: 37.9000015; scale-x: 0.898000002; scale-y: 0.898000002; }
        frame 54 { x: 31; y: 71.6999969; skew-x: 33.7999992; skew-y: 33.7999992; scale-x: 0.897000015; scale-y: 0.897000015; }
        frame 55 { x: 28.8999996; y: 72.6999969; skew-x: 29.6000004; skew-y: 29.6000004; scale-x: -10000; scale-y: -10000; }
        frame 56 { x: 26.7999992; y: 73.5999985; skew-x: 25.6000004; skew-y: 25.6000004; scale-x: 0.898000002; scale-y: 0.898000002; }
        frame 57 { x: 24.7999992; y: 74.5999985; skew-x: 21.5; skew-y: 21.5; scale-x: -10000; scale-y: -10000; }
        frame 58 { x: 22.8999996; y: 75.8000031; skew-x: 17.2999992; skew-y: 17.2999992; }
        frame 59 { x: 20.8999996; y: 77.0999985; skew-x: 13.3000002; skew-y: 13.3000002; scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 60 { x: 19.1000004; y: 78.3000031; skew-x: 9.30000019; skew-y: 9.30000019; scale-x: 0.899999976; scale-y: 0.899999976; }
        frame 61 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 62 { scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 63 { scale-x: -10000; scale-y: -10000; }
        frame 65 { scale-x: 0.899999976; scale-y: 0.899999976; }
        frame 66 { scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 67 { scale-x: 0.899999976; scale-y: 0.899999976; }
        frame 68 { scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 69 { scale-x: 0.899999976; scale-y: 0.899999976; }
        frame 70 { scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 71 { scale-x: 0.899999976; scale-y: 0.899999976; }
        frame 72 { scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 73 { scale-x: 0.899999976; scale-y: 0.899999976; }
        frame 74 { scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 75 { scale-x: 0.899999976; scale-y: 0.899999976; }
        frame 76 { scale-x: 0.898999989; scale-y: 0.898999989; }
        frame 77 { scale-x: 0.899999976; scale-y: 0.899999976; }
        frame 78 { scale-x: -10000; scale-y: -10000; }
        frame 79 { x: 19.7000008; y: 76.1999969; skew-x: 10.5; skew-y: 10.5; scale-x: 0.898000002; scale-y: 0.898000002; }
        frame 80 { x: 20.5; y: 74; skew-x: 12; skew-y: 12; scale-x: -10000; scale-y: -10000; }
        frame 81 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 130 { x: 19.7999992; y: 76.1999969; skew-x: 10.5; skew-y: 10.5; }
        frame 131 { x: 19.1000004; y: 78.3000031; skew-x: 9.30000019; skew-y: 9.30000019; scale-x: 0.899999976; scale-y: 0.899999976; }
        frame 132 { x: 17.7999992; y: 78.4000015; skew-x: 9.10000038; skew-y: 7.5; scale-x: 0.902999997; scale-y: 0.896000028; }
        frame 133 { x: 16.3999996; y: 78.3000031; skew-x: -10000; skew-y: 5.80000019; scale-x: 0.907999992; scale-y: 0.893000007; }
        frame 134 { x: 15.1999998; y: -10000; skew-y: 4.0999999; scale-x: 0.912999988; scale-y: 0.889999986; }
        frame 135 { x: 17.2000008; skew-y: 7; scale-x: 0.904999971; scale-y: 0.898000002; }
        frame 136 { x: 19.3999996; skew-x: 9.30000019; skew-y: 9.80000019; scale-x: 0.897000015; scale-y: 0.906000018; }
        frame 137 { x: 21.5; skew-x: -10000; skew-y: 12.8000002; scale-x: 0.888999999; scale-y: 0.913999975; }
        frame 138 { x: 23.5; skew-x: 9.5; skew-y: 15.8000002; scale-x: 0.882000029; scale-y: 0.922999978; }
        frame 139 { x: 20.5; skew-x: 9.30000019; skew-y: 12.3000002; scale-x: 0.890999973; scale-y: 0.912; }
        frame 140 { x: 17.3999996; skew-x: -10000; skew-y: 8.80000019; scale-x: 0.899999976; scale-y: 0.90200001; }
        frame 141 { x: 14.3999996; skew-x: 9.19999981; skew-y: 5.4000001; scale-x: 0.908999979; scale-y: 0.89200002; }
        frame 142 { x: 17.3999996; skew-x: 9.30000019; skew-y: 8.80000019; scale-x: 0.899999976; scale-y: 0.90200001; }
        frame 143 { x: 20.5; skew-x: -10000; skew-y: 12.3000002; scale-x: 0.890999973; scale-y: 0.912; }
        frame 144 { x: 23.5; skew-x: 9.5; skew-y: 15.8000002; scale-x: 0.882000029; scale-y: 0.922999978; }
        frame 145 { x: 26; skew-x: -10000; skew-y: 19.1000004; scale-x: 0.871999979; scale-y: 0.943000019; }
        frame 146 { x: 28.2999992; skew-y: 22.2999992; scale-x: 0.862999976; scale-y: 0.963; }
        frame 147 { x: 30.7999992; skew-x: 9.80000019; skew-y: 25.7000008; scale-x: 0.853999972; scale-y: 0.985000014; }
        frame 148 { x: 30; y: 78.5999985; skew-x: -10000; skew-y: 25.6000004; scale-x: -10000; scale-y: 0.984000027; }
        frame 149 { x: 29.2000008; y: 78.9000015; skew-y: -10000; scale-y: -10000; }
        frame 150 { x: 28.3999996; y: 79.1999969; skew-y: 25.7000008; scale-y: 0.985000014; }
        frame 151 { x: 30.6000004; y: 80.0999985; skew-x: 18.1000004; skew-y: 34.0999985; scale-x: 0.852999985; scale-y: 0.98299998; }
        frame 152 { x: 32.9000015; y: 81.1999969; skew-x: 26.5; skew-y: 42.4000015; scale-x: 0.851999998; scale-y: 0.981999993; }
        frame 153 { x: 35.2000008; y: 82.5999985; skew-x: 34.9000015; skew-y: 50.7999992; scale-x: 0.852999985; scale-y: 0.984000027; }
        frame 154 { x: 41.4000015; y: 85.5; skew-x: 62.5; skew-y: 78.5; scale-x: 0.851000011; scale-y: 0.981999993; }
        frame 155 { x: 45.7999992; y: 91.8000031; skew-x: 90; skew-y: 105.900002; scale-x: -10000; scale-y: 0.981000006; }
        frame 156 { x: 48; y: 101; skew-x: 107.599998; skew-y: 123.599998; scale-x: 0.848999977; scale-y: 0.978999972; }
        frame 157 { x: 48.7999992; y: 110.699997; skew-x: 125.400002; skew-y: 141.300003; scale-x: -10000; scale-y: -10000; }
        frame 158 { x: 48.7000008; y: 110.800003; skew-x: 125.300003; skew-y: 141.399994; scale-x: 0.84799999; scale-y: 0.977999985; }
        frame 159 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 163 { x: 48.7999992; y: 110.699997; skew-x: 125.400002; skew-y: 141.300003; scale-x: 0.848999977; scale-y: 0.978999972; }
        frame 164 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Driver_outerarm_lower";
        frame-count: 187;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 9 { x: 35.5; y: 75; skew-x: 2.20000005; skew-y: 2.20000005; scale-x: 0.799000025; scale-y: 0.799000025; cel: 0; image: IMAGE_REANIM_ZOMBIE_BOSSDRIVER_LOWERARM; }
        frame 10 { x: -10000; y: 75.1999969; skew-x: 2.5; skew-y: 2.5; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 11 { x: 35.5999985; y: 75.3000031; skew-x: 3; skew-y: 3; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 12 { x: 35.7000008; y: 75.5; skew-x: 3.5; skew-y: 3.5; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: 35.7999992; y: 75.5999985; skew-x: 4; skew-y: 4; }
        frame 14 { x: 35.9000015; y: 75.6999969; skew-x: 4.5; skew-y: 4.5; }
        frame 15 { x: 36; y: 75.8000031; skew-x: 5; skew-y: 5; }
        frame 16 { x: -10000; y: 76; skew-x: 5.5; skew-y: 5.5; }
        frame 17 { y: -10000; skew-x: 6; skew-y: 5; scale-x: 0.799000025; scale-y: 0.796999991; }
        frame 18 { x: 35.9000015; y: 75.8000031; skew-x: 6.5999999; skew-y: 4.5; scale-x: 0.800999999; scale-y: 0.796000004; }
        frame 19 { x: 35.7999992; y: 75.6999969; skew-x: 5.80000019; skew-y: 4; scale-x: 0.800000012; scale-y: -10000; }
        frame 20 { x: 35.7000008; y: 75.5999985; skew-x: 4.80000019; skew-y: 3.5; scale-x: -10000; scale-y: 0.796999991; }
        frame 21 { x: 35.5999985; y: 75.5; skew-x: 3.79999995; skew-y: 3; scale-y: -10000; }
        frame 22 { x: 35.5; y: 75.1999969; skew-x: 3; skew-y: 2.5; scale-x: 0.799000025; scale-y: 0.797999978; }
        frame 23 { x: -10000; y: 75; skew-x: 2.20000005; skew-y: 2.20000005; scale-x: -10000; scale-y: 0.799000025; }
        frame 24 { y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 25 { x: 37.5999985; y: 74.6999969; skew-x: 4.5; skew-y: 4.5; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 26 { x: 39.5999985; y: 74.3000031; skew-x: 6.80000019; skew-y: 6.80000019; scale-x: -10000; scale-y: -10000; }
        frame 27 { x: 41.9000015; y: 74; skew-x: 9.30000019; skew-y: 9.30000019; }
        frame 28 { x: 44; y: 73.8000031; skew-x: 11.5; skew-y: 11.5; }
        frame 29 { x: 46.2999992; y: 73.5; skew-x: 13.8000002; skew-y: 13.8000002; }
        frame 30 { x: 48.5; y: 73.1999969; skew-x: 16.2999992; skew-y: 16.2999992; }
        frame 31 { x: 46.2000008; y: 73.5; skew-x: 13.8000002; skew-y: 13.8000002; }
        frame 32 { x: 44; y: 73.6999969; skew-x: 11.5; skew-y: 11.5; }
        frame 33 { x: 42; y: 73.9000015; skew-x: 9.30000019; skew-y: 9.30000019; }
        frame 34 { x: 39.7999992; y: 74.3000031; skew-x: 6.80000019; skew-y: 6.80000019; }
        frame 35 { x: 37.5999985; y: 74.6999969; skew-x: 4.5; skew-y: 4.5; }
        frame 36 { x: 35.5; y: 75; skew-x: 2.20000005; skew-y: 2.20000005; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 37 { x: 33.5999985; y: 75.5; skew-x: 2.29999995; skew-y: 2.29999995; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 38 { x: 31.7000008; y: 76; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 29.7999992; y: 76.3000031; skew-x: 2.5; skew-y: 2.5; }
        frame 40 { x: 27.7999992; y: 76.8000031; skew-x: 2.5999999; skew-y: 2.5999999; }
        frame 41 { x: 25.8999996; y: 77.3000031; skew-x: 2.79999995; skew-y: 2.79999995; }
        frame 42 { x: 24; y: 77.5999985; skew-x: 3; skew-y: 3; }
        frame 43 { x: 25.8999996; y: 77.1999969; skew-x: 2.79999995; skew-y: 2.79999995; }
        frame 44 { x: 27.7999992; y: 76.8000031; skew-x: 2.5999999; skew-y: 2.5999999; }
        frame 45 { x: 29.7000008; y: 76.3000031; skew-x: 2.5; skew-y: 2.5; }
        frame 46 { x: 31.6000004; y: 76; skew-x: 2.29999995; skew-y: 2.29999995; }
        frame 47 { x: 33.5; y: 75.5; skew-x: -10000; skew-y: -10000; }
        frame 48 { x: 35.5; y: 75; skew-x: 2.20000005; skew-y: 2.20000005; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 49 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: 38.2999992; y: 74.0999985; skew-x: 7.5; skew-y: 7.5; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 51 { x: 41.0999985; y: 73.3000031; skew-x: 13; skew-y: 13; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 52 { x: 44; y: 72.5999985; skew-x: 18.5; skew-y: 18.5; scale-x: 0.796000004; scale-y: 0.796000004; }
        frame 53 { x: 47.0999985; y: 72; skew-x: 24.1000004; skew-y: 24.1000004; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 54 { x: 45.4000015; y: 72.4000015; skew-x: 20.7999992; skew-y: 20.7999992; scale-x: 0.796000004; scale-y: 0.796000004; }
        frame 55 { x: 43.5999985; y: 72.5999985; skew-x: 17.7999992; skew-y: 17.7999992; scale-x: 0.796999991; scale-y: 0.796999991; }
        frame 56 { x: 42; y: 73.0999985; skew-x: 14.6000004; skew-y: 14.6000004; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: 40.2999992; y: 73.4000015; skew-x: 11.5; skew-y: 11.5; }
        frame 58 { x: 38.5999985; y: 74; skew-x: 8.30000019; skew-y: 8.30000019; scale-x: 0.797999978; scale-y: 0.797999978; }
        frame 59 { x: 37; y: 74.5; skew-x: 5.30000019; skew-y: 5.30000019; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 35.5; y: 75; skew-x: 2.20000005; skew-y: 2.20000005; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 61 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 62 { y: 75.0999985; skew-x: 2.0999999; skew-y: 2.0999999; }
        frame 63 { y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 65 { y: 75; skew-x: 2.20000005; skew-y: 2.20000005; }
        frame 66 { x: 35.4000015; y: 75.0999985; skew-x: 0.800000012; skew-y: 0.800000012; }
        frame 67 { x: 35.2000008; y: 75.1999969; skew-x: -0.400000006; skew-y: -0.400000006; }
        frame 68 { x: 35.4000015; y: 75.0999985; skew-x: 0.800000012; skew-y: 0.800000012; }
        frame 69 { x: 35.5; y: 75; skew-x: 2.20000005; skew-y: 2.20000005; }
        frame 70 { x: 35.4000015; y: 75.0999985; skew-x: 0.800000012; skew-y: 0.800000012; }
        frame 71 { x: 35.2000008; y: 75.1999969; skew-x: -0.400000006; skew-y: -0.400000006; }
        frame 72 { x: 35.4000015; y: 75.0999985; skew-x: 0.800000012; skew-y: 0.800000012; }
        frame 73 { x: 35.5; y: 75; skew-x: 2.20000005; skew-y: 2.20000005; }
        frame 74 { x: 35.4000015; y: 75.0999985; skew-x: 0.800000012; skew-y: 0.800000012; }
        frame 75 { x: 35.2000008; y: 75.1999969; skew-x: -0.400000006; skew-y: -0.400000006; }
        frame 76 { x: 35.4000015; y: 75.0999985; skew-x: 0.800000012; skew-y: 0.800000012; }
        frame 77 { x: 35.5; y: 75; skew-x: 2.20000005; skew-y: 2.20000005; }
        frame 78 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 79 { x: 34.4000015; y: 73.3000031; skew-x: -5.69999981; skew-y: -3.9000001; scale-x: 0.791999996; scale-y: 0.829999983; }
        frame 80 { x: 33.2999992; y: 71.6999969; skew-x: -13.8000002; skew-y: -10.3000002; scale-x: 0.786000013; scale-y: 0.861999989; }
        frame 81 { x: -10000; y: -10000; skew-x: -13.6999998; skew-y: -10.1999998; scale-x: 0.785000026; scale-y: 0.861000001; }
        frame 82 { x: 33.5; skew-x: -10000; skew-y: -9.89999962; scale-x: -10000; scale-y: 0.861999989; }
        frame 83 { x: -10000; y: 71.5999985; skew-y: -9.69999981; scale-y: -10000; }
        frame 84 { y: -10000; skew-y: -10000; }
        frame 85 { x: 33.5999985; y: 71.6999969; skew-y: -9.5; scale-x: 0.786000013; }
        frame 86 { x: -10000; y: -10000; skew-y: -9.39999962; scale-x: -10000; }
        frame 87 { x: 33.7000008; skew-y: -9.19999981; }
        frame 88 { x: -10000; y: 71.5999985; skew-y: -10000; }
        frame 89 { x: 33.7999992; y: -10000; skew-y: -8.89999962; }
        frame 90 { x: 33.9000015; skew-y: -8.69999981; scale-y: 0.862999976; }
        frame 91 { x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 92 { x: 34; skew-y: -8.5; }
        frame 93 { skew-y: -8.39999962; scale-x: 0.787; }
        frame 94 { x: -10000; skew-y: -8.19999981; scale-x: -10000; }
        frame 95 { x: 34.0999985; y: 71.5; skew-y: -10000; }
        frame 96 { x: 34.2999992; y: -10000; skew-y: -7.9000001; }
        frame 97 { x: 34.2000008; skew-y: -7.69999981; }
        frame 98 { x: 34.2999992; y: 71.5999985; skew-y: -10000; scale-y: 0.864000022; }
        frame 99 { x: 34.4000015; y: 71.5; skew-y: -7.5; scale-y: -10000; }
        frame 100 { x: -10000; y: -10000; skew-y: -7.4000001; }
        frame 101 { x: 34.5; skew-y: -7.19999981; scale-x: 0.787999988; }
        frame 102 { x: -10000; y: 71.5999985; skew-y: -10000; scale-x: -10000; }
        frame 103 { x: 34.5999985; y: 71.5; skew-y: -6.9000001; }
        frame 104 { x: -10000; y: -10000; skew-y: -6.69999981; }
        frame 105 { skew-y: -10000; }
        frame 106 { x: 34.7999992; y: 71.5999985; skew-y: -6.5; scale-y: 0.86500001; }
        frame 107 { x: -10000; y: 71.5; skew-y: -6.4000001; scale-y: -10000; }
        frame 108 { y: -10000; skew-y: -6.19999981; }
        frame 109 { x: 34.9000015; skew-y: -10000; scale-x: 0.788999975; }
        frame 110 { x: 35; skew-y: -5.9000001; scale-x: -10000; }
        frame 111 { x: -10000; y: 71.4000015; skew-y: -10000; }
        frame 112 { x: 35; y: -10000; skew-y: -5.69999981; }
        frame 113 { x: 35.0999985; skew-y: -5.5; }
        frame 114 { x: -10000; y: 71.3000031; skew-y: -5.4000001; scale-y: 0.865999997; }
        frame 115 { x: 35.2000008; y: 71.5; skew-y: -5.19999981; scale-y: -10000; }
        frame 116 { x: -10000; y: 71.4000015; skew-y: -10000; }
        frame 117 { x: 35.4000015; y: 71.5; skew-y: -4.9000001; scale-x: 0.790000021; }
        frame 118 { x: -10000; y: 71.4000015; skew-y: -10000; scale-x: -10000; }
        frame 119 { y: -10000; skew-y: -4.69999981; }
        frame 120 { x: 35.5; skew-y: -4.5; }
        frame 121 { x: -10000; skew-y: -4.4000001; }
        frame 122 { y: 71.3000031; skew-y: -4.19999981; scale-y: 0.866999984; }
        frame 123 { x: 35.5999985; y: 71.4000015; skew-y: -10000; scale-y: -10000; }
        frame 124 { x: 35.7000008; y: 71.3000031; skew-y: -3.9000001; scale-x: 0.791000009; }
        frame 125 { x: 35.7999992; y: 71.4000015; skew-y: -10000; scale-x: -10000; }
        frame 126 { x: -10000; y: 71.3000031; skew-y: -3.70000005; }
        frame 127 { x: 35.9000015; y: 71.4000015; skew-y: -3.5; }
        frame 128 { x: 36; y: -10000; skew-y: -3.4000001; }
        frame 129 { x: -10000; y: 71.3000031; skew-y: -3.29999995; scale-x: 0.791999996; scale-y: 0.867999971; }
        frame 130 { x: 35.5; y: 73.3000031; skew-x: -5.69999981; skew-y: -0.400000006; scale-x: 0.795000017; scale-y: 0.833000004; }
        frame 131 { x: -10000; y: 75; skew-x: 2.20000005; skew-y: 2.20000005; scale-x: 0.799000025; scale-y: 0.799000025; }
        frame 132 { x: 34; y: -10000; skew-x: 2.0999999; skew-y: 0.300000012; scale-x: 0.800000012; scale-y: -10000; }
        frame 133 { x: 32.7000008; y: 75.0999985; skew-x: -10000; skew-y: -1.20000005; scale-x: -10000; }
        frame 134 { x: 31.2999992; y: 75; skew-x: 2.20000005; skew-y: -2.9000001; scale-x: 0.801999986; }
        frame 135 { x: 33.5; y: -10000; skew-x: 2.0999999; skew-y: 0; scale-x: 0.800000012; scale-y: 0.800999999; }
        frame 136 { x: 35.7999992; y: 75; skew-x: -10000; skew-y: 3; scale-x: 0.797999978; scale-y: 0.80400002; }
        frame 137 { x: 38; y: -10000; skew-y: 6; scale-x: 0.796000004; scale-y: 0.805999994; }
        frame 138 { x: 40.4000015; y: 75; skew-x: 2.20000005; skew-y: 9.10000038; scale-x: 0.795000017; scale-y: 0.808000028; }
        frame 139 { x: 37; skew-x: 2.0999999; skew-y: 5.30000019; scale-x: 0.796999991; scale-y: 0.805000007; }
        frame 140 { x: 33.7999992; skew-x: -10000; skew-y: 1.79999995; scale-x: 0.799000025; scale-y: 0.801999986; }
        frame 141 { x: 30.6000004; y: -10000; skew-x: 2.20000005; skew-y: -1.60000002; scale-x: 0.800999999; scale-y: 0.797999978; }
        frame 142 { x: 33.9000015; skew-x: 2.0999999; skew-y: 1.79999995; scale-x: 0.799000025; scale-y: 0.801999986; }
        frame 143 { x: 37.0999985; skew-x: -10000; skew-y: 5.30000019; scale-x: 0.796999991; scale-y: 0.805000007; }
        frame 144 { x: 40.4000015; skew-x: 2.20000005; skew-y: 9.10000038; scale-x: 0.795000017; scale-y: 0.808000028; }
        frame 145 { x: 44.5; y: 74.6999969; skew-x: 4.80000019; skew-y: 13.5; scale-x: 0.791999996; scale-y: 0.813000023; }
        frame 146 { x: 48.5; y: 74.1999969; skew-x: 7.5; skew-y: 17.7999992; scale-x: 0.790000021; scale-y: 0.819000006; }
        frame 147 { x: 52.5999985; y: 74; skew-x: 10.3000002; skew-y: 22.3999996; scale-x: 0.787; scale-y: 0.824999988; }
        frame 148 { x: 51.7999992; y: 74.1999969; skew-x: -10000; skew-y: 22.2999992; scale-x: -10000; scale-y: -10000; }
        frame 149 { x: 51; y: 74.5; skew-y: -10000; }
        frame 150 { x: 50.2999992; y: 74.8000031; skew-y: 22.3999996; }
        frame 151 { x: 50.7999992; y: 78.6999969; skew-x: 18.6000004; skew-y: 30.7999992; scale-x: 0.786000013; scale-y: 0.824000001; }
        frame 152 { x: 51.5999985; y: 83; skew-x: 26.8999996; skew-y: 39.0999985; scale-x: -10000; scale-y: 0.823000014; }
        frame 153 { x: 52.5; y: 87.5; skew-x: 35.4000015; skew-y: 47.5; scale-y: 0.824000001; }
        frame 154 { x: -10000; y: 97.3000031; skew-x: 35.2999992; skew-y: 47.5999985; scale-x: 0.785000026; scale-y: 0.823000014; }
        frame 155 { y: 107.099998; skew-x: 35.4000015; skew-y: 47.5; scale-x: 0.786000013; scale-y: 0.824000001; }
        frame 156 { y: 107.199997; skew-x: 35.2999992; skew-y: 47.5999985; scale-x: 0.785000026; scale-y: 0.823000014; }
        frame 157 { y: 107.099998; skew-x: 35.4000015; skew-y: 47.5; scale-x: 0.786000013; scale-y: 0.824000001; }
        frame 158 { y: 107.199997; skew-x: 35.2999992; skew-y: 47.5999985; scale-x: 0.785000026; scale-y: 0.823000014; }
        frame 159 { y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 163 { y: 107.099998; skew-x: 35.4000015; skew-y: 47.5; scale-x: 0.786000013; scale-y: 0.824000001; }
        frame 164 { y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
}
