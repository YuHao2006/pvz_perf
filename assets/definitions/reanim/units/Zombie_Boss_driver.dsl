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
        frame 164 { x: 42.7; y: 111; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_ZOMBIE_BOSS_FLAGPOLE; }
        frame 165 { x: -10000; y: 105.8; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 166 { y: 100.8; }
        frame 167 { y: 95.6; }
        frame 168 { y: 90.5; }
        frame 169 { y: 85.3; }
        frame 170 { y: 80.2; }
        frame 171 { y: 75.1; }
        frame 172 { x: 42.8; y: 69.9; }
        frame 173 { x: -10000; y: 64.8; }
        frame 174 { y: 59.6; }
        frame 175 { y: 54.5; }
        frame 176 { y: 49.4; }
        frame 177 { y: 44.3; }
        frame 178 { x: 42.7; y: 39.1; }
        frame 179 { x: -10000; y: -10000; }
    }
    Track {
        source-name: "flag";
        frame-count: 187;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 164 { x: 46.3; y: 111.6; skew-x: 81.5; scale-x: 0.339; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_ZOMBIE_BOSS_FLAG; }
        frame 165 { x: 46.2; y: 106.4; skew-x: 81.7; scale-x: 0.338; scale-y: -10000; cel: -10000; image: none; }
        frame 166 { x: 46.1; y: 101.2; skew-x: -10000; scale-x: -10000; }
        frame 167 { x: 46; y: 96.1; }
        frame 168 { x: 45.9; y: 90.9; }
        frame 169 { x: 45.8; y: 85.7; }
        frame 170 { x: 45.6; y: 80.6; }
        frame 171 { x: 45.5; y: 75.4; }
        frame 172 { x: 45.4; y: 70.2; }
        frame 173 { x: 45.3; y: 65.1; skew-x: 81.5; scale-x: 0.339; }
        frame 174 { x: 45.8; y: 59.1; skew-x: 65.2; scale-x: 0.43; }
        frame 175 { x: 45.1; y: 54.9; skew-x: 48.9; scale-x: 0.522; }
        frame 176 { x: 44.8; y: 49.6; skew-x: 32.6; scale-x: 0.614; }
        frame 177 { x: 44.2; y: 44.1; skew-x: 16.3; scale-x: 0.707; }
        frame 178 { x: 44.4; y: 40.5; skew-x: 0; scale-x: 0.8; }
        frame 179 { x: -10000; y: -10000; skew-x: 2; scale-x: 0.759; }
        frame 180 { skew-x: 4.4; scale-x: 0.719; }
        frame 181 { skew-x: 2; scale-x: 0.759; }
        frame 182 { skew-x: 0; scale-x: 0.8; }
        frame 183 { skew-x: -1.7; scale-x: 0.777; }
        frame 184 { skew-x: -3.6; scale-x: 0.754; }
        frame 185 { skew-x: -1.7; scale-x: 0.777; }
        frame 186 { skew-x: 0; scale-x: 0.8; }
    }
    Track {
        source-name: "Driver_innerarm_upper";
        frame-count: 187;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 9 { x: 39.9; y: 58.7; skew-x: 39.3; skew-y: 39.3; scale-x: 0.733; scale-y: 0.733; cel: 0; image: IMAGE_REANIM_ZOMBIE_BOSSDRIVER_UPPERARM; }
        frame 10 { x: 39.1; y: 59; skew-x: 36.9; skew-y: 36.9; scale-x: 0.732; scale-y: 0.732; cel: -10000; image: none; }
        frame 11 { x: 38.4; y: 59.2; skew-x: 34.6; skew-y: 34.6; scale-x: -10000; scale-y: -10000; }
        frame 12 { x: 37.6; y: 59.5; skew-x: 32.4; skew-y: 32.4; }
        frame 13 { x: 36.8; y: 59.9; skew-x: 30.1; skew-y: 30.1; }
        frame 14 { x: 36; y: 60.3; skew-x: 27.8; skew-y: 27.8; }
        frame 15 { x: 35.4; y: 60.6; skew-x: 25.6; skew-y: 25.6; }
        frame 16 { x: 34.6; y: 61.1; skew-x: 23.4; skew-y: 23.4; scale-x: 0.733; scale-y: 0.733; }
        frame 17 { x: 35.4; y: 60.8; skew-x: 25.6; skew-y: 25.6; scale-x: 0.732; scale-y: 0.732; }
        frame 18 { x: 36; y: 60.3; skew-x: 27.8; skew-y: 27.8; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 36.9; y: 60; skew-x: 30.1; skew-y: 30.1; }
        frame 20 { x: 37.5; y: 59.6; skew-x: 32.4; skew-y: 32.4; }
        frame 21 { x: 38.3; y: 59.3; skew-x: 34.6; skew-y: 34.6; }
        frame 22 { x: 39; y: 59; skew-x: 36.9; skew-y: 36.9; }
        frame 23 { x: 39.9; y: 58.7; skew-x: 39.3; skew-y: 39.3; scale-x: 0.733; scale-y: 0.733; }
        frame 24 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 41.4; y: 58.5; skew-x: 44.1; skew-y: 44.1; scale-x: 0.732; scale-y: 0.762; }
        frame 26 { x: 43; y: 58.4; skew-x: 48.9; skew-y: 48.9; scale-x: -10000; scale-y: 0.792; }
        frame 27 { x: 44.6; y: 58.5; skew-x: 53.9; skew-y: 53.9; scale-y: 0.822; }
        frame 28 { x: 46.1; y: 58.9; skew-x: 58.7; skew-y: 58.7; scale-y: 0.851; }
        frame 29 { x: 47.8; y: 59.4; skew-x: 63.7; skew-y: 63.7; scale-x: 0.731; scale-y: 0.881; }
        frame 30 { x: 49.4; y: 60; skew-x: 68.4; skew-y: 68.4; scale-x: 0.732; scale-y: 0.912; }
        frame 31 { x: 47.8; y: 59.4; skew-x: 63.7; skew-y: 63.7; scale-x: 0.731; scale-y: 0.881; }
        frame 32 { x: 46.2; y: 58.9; skew-x: 58.7; skew-y: 58.7; scale-x: 0.732; scale-y: 0.851; }
        frame 33 { x: 44.6; y: 58.5; skew-x: 53.9; skew-y: 53.9; scale-x: -10000; scale-y: 0.822; }
        frame 34 { x: 43; y: -10000; skew-x: 48.9; skew-y: 48.9; scale-y: 0.792; }
        frame 35 { x: 41.4; skew-x: 44.1; skew-y: 44.1; scale-y: 0.762; }
        frame 36 { x: 39.9; y: 58.7; skew-x: 39.3; skew-y: 39.3; scale-x: 0.733; scale-y: 0.733; }
        frame 37 { x: 40.4; y: 59.3; skew-x: 37.8; skew-y: 37.8; scale-x: 0.732; scale-y: 0.732; }
        frame 38 { x: 41; y: 60; skew-x: 36.3; skew-y: 36.3; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 41.6; y: 60.6; skew-x: 34.8; skew-y: 34.8; }
        frame 40 { x: 42.2; y: 61.3; skew-x: 33.4; skew-y: 33.4; scale-x: 0.731; scale-y: 0.731; }
        frame 41 { x: 42.7; y: 61.9; skew-x: 31.9; skew-y: 31.9; scale-x: -10000; scale-y: -10000; }
        frame 42 { x: 43.3; y: 62.5; skew-x: 30.5; skew-y: 30.5; scale-x: 0.732; scale-y: 0.732; }
        frame 43 { x: 42.7; y: 61.9; skew-x: 31.9; skew-y: 31.9; scale-x: 0.731; scale-y: 0.731; }
        frame 44 { x: 42.1; y: 61.2; skew-x: 33.4; skew-y: 33.4; scale-x: -10000; scale-y: -10000; }
        frame 45 { x: 41.5; y: 60.6; skew-x: 34.8; skew-y: 34.8; scale-x: 0.732; scale-y: 0.732; }
        frame 46 { x: 40.9; y: 60; skew-x: 36.3; skew-y: 36.3; scale-x: -10000; scale-y: -10000; }
        frame 47 { x: 40.4; y: 59.4; skew-x: 37.8; skew-y: 37.8; }
        frame 48 { x: 39.9; y: 58.7; skew-x: 39.3; skew-y: 39.3; scale-x: 0.733; scale-y: 0.733; }
        frame 49 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: 54.8; y: 57; skew-x: 51.4; skew-y: 51.4; scale-x: 0.731; scale-y: 0.892; }
        frame 51 { x: 70.1; skew-x: 63.4; skew-y: 63.4; scale-x: -10000; scale-y: 1.054; }
        frame 52 { x: 83.3; y: 61; skew-x: 75.5; skew-y: 75.5; scale-x: 0.73; scale-y: 1.214; }
        frame 53 { x: 96.2; y: 66.4; skew-x: 87.4; skew-y: 87.4; scale-x: -10000; scale-y: 1.377; }
        frame 54 { x: 89.8; y: 62.9; skew-x: 80.7; skew-y: 80.7; scale-y: 1.311; }
        frame 55 { x: 83.3; y: 59.9; skew-x: 73.9; skew-y: 73.9; scale-y: 1.244; }
        frame 56 { x: 76.4; y: 57.1; skew-x: 66.9; skew-y: 66.9; scale-y: 1.18; }
        frame 57 { x: 67.1; y: 56.7; skew-x: 60.1; skew-y: 60.1; scale-y: 1.066; }
        frame 58 { x: 57.9; y: 56.6; skew-x: 53.1; skew-y: 53.1; scale-x: 0.731; scale-y: 0.955; }
        frame 59 { x: 48.7; y: 57.4; skew-x: 46.1; skew-y: 46.1; scale-x: -10000; scale-y: 0.843; }
        frame 60 { x: 39.9; y: 58.7; skew-x: 39.3; skew-y: 39.3; scale-x: 0.733; scale-y: 0.733; }
        frame 61 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 62 { x: 40.5; skew-x: 40.8; skew-y: 40.8; scale-x: 0.732; scale-y: 0.732; }
        frame 63 { x: 41.2; y: 58.8; skew-x: 42.3; skew-y: 42.3; scale-x: -10000; scale-y: -10000; }
        frame 64 { x: 41.9; y: -10000; skew-x: 43.9; skew-y: 43.9; }
        frame 65 { x: 42.5; y: 58.9; skew-x: 45.3; skew-y: 45.3; scale-x: 0.733; scale-y: 0.733; }
        frame 66 { x: 42.4; y: 58.4; skew-x: 44.4; skew-y: 44.4; scale-x: 0.732; scale-y: 0.732; }
        frame 67 { x: 42.1; y: 57.8; skew-x: 43.3; skew-y: 43.3; scale-x: 0.733; scale-y: 0.733; }
        frame 68 { x: 42.3; y: 58.4; skew-x: 44.4; skew-y: 44.4; scale-x: 0.732; scale-y: 0.732; }
        frame 69 { x: 42.5; y: 58.9; skew-x: 45.3; skew-y: 45.3; scale-x: 0.733; scale-y: 0.733; }
        frame 70 { x: 42.4; y: 58.4; skew-x: 44.4; skew-y: 44.4; scale-x: 0.732; scale-y: 0.732; }
        frame 71 { x: 42.1; y: 57.8; skew-x: 43.3; skew-y: 43.3; scale-x: 0.733; scale-y: 0.733; }
        frame 72 { x: 42.3; y: 58.4; skew-x: 44.4; skew-y: 44.4; scale-x: 0.732; scale-y: 0.732; }
        frame 73 { x: 42.5; y: 58.9; skew-x: 45.3; skew-y: 45.3; scale-x: 0.733; scale-y: 0.733; }
        frame 74 { x: 42.4; y: 58.4; skew-x: 44.4; skew-y: 44.4; scale-x: 0.732; scale-y: 0.732; }
        frame 75 { x: 42.1; y: 57.8; skew-x: 43.3; skew-y: 43.3; scale-x: 0.733; scale-y: 0.733; }
        frame 76 { x: 42.3; y: 58.4; skew-x: 44.4; skew-y: 44.4; scale-x: 0.732; scale-y: 0.732; }
        frame 77 { x: 42.5; y: 58.9; skew-x: 45.3; skew-y: 45.3; scale-x: 0.733; scale-y: 0.733; }
        frame 78 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 79 { x: 49.3; y: 48.7; skew-x: 47.9; skew-y: 47.9; scale-x: 0.731; scale-y: 0.911; }
        frame 80 { x: 56.2; y: 38.5; skew-x: 50.3; skew-y: 50.3; scale-x: 0.732; scale-y: 1.092; }
        frame 81 { x: 56.3; y: 38.6; skew-x: 50.4; skew-y: 50.4; scale-x: 0.73; scale-y: 1.091; }
        frame 82 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: 1.092; }
        frame 83 { x: 56.5; y: 38.7; scale-x: 0.729; scale-y: -10000; }
        frame 84 { x: 56.6; y: 38.6; scale-x: -10000; scale-y: 1.093; }
        frame 85 { x: 56.8; y: -10000; skew-x: 50.6; scale-x: 0.728; scale-y: 1.094; }
        frame 86 { x: -10000; skew-x: -10000; scale-x: -10000; scale-y: 1.095; }
        frame 87 { x: 56.9; skew-x: 50.7; skew-y: 50.6; scale-x: 0.727; scale-y: 1.096; }
        frame 88 { x: 57; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: 1.097; }
        frame 89 { x: 57.1; skew-x: 50.9; scale-x: 0.726; scale-y: -10000; }
        frame 90 { x: 57.3; skew-x: -10000; scale-x: -10000; scale-y: 1.098; }
        frame 91 { x: 57.4; skew-y: 50.7; scale-x: 0.725; scale-y: 1.099; }
        frame 92 { x: 57.5; skew-y: -10000; scale-x: -10000; scale-y: 1.1; }
        frame 93 { x: -10000; scale-x: 0.724; scale-y: 1.101; }
        frame 94 { x: 57.6; skew-x: 51.1; skew-y: 50.9; scale-x: -10000; scale-y: -10000; }
        frame 95 { x: 57.9; skew-x: -10000; skew-y: -10000; scale-x: 0.723; scale-y: 1.102; }
        frame 96 { x: -10000; scale-x: -10000; scale-y: 1.103; }
        frame 97 { x: 58; skew-x: 51.2; scale-x: 0.722; scale-y: 1.104; }
        frame 98 { x: -10000; skew-x: -10000; scale-x: 0.721; scale-y: 1.105; }
        frame 99 { x: 58.2; skew-x: 51.4; scale-x: -10000; scale-y: 1.106; }
        frame 100 { x: 58.3; skew-x: -10000; scale-x: 0.72; scale-y: -10000; }
        frame 101 { x: 58.5; skew-y: 51.1; scale-x: -10000; scale-y: 1.107; }
        frame 102 { x: -10000; skew-y: -10000; scale-x: 0.719; scale-y: 1.108; }
        frame 103 { x: 58.6; skew-x: 51.6; scale-x: -10000; scale-y: 1.109; }
        frame 104 { x: 58.8; skew-x: -10000; scale-x: 0.718; scale-y: 1.11; }
        frame 105 { x: -10000; y: 38.5; scale-x: -10000; scale-y: 1.111; }
        frame 106 { x: 59; y: 38.6; skew-x: 51.7; skew-y: 51.2; scale-x: 0.717; scale-y: -10000; }
        frame 107 { y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: 1.112; }
        frame 108 { x: 59.1; skew-x: 51.9; scale-x: 0.716; scale-y: 1.113; }
        frame 109 { x: 59.3; skew-x: -10000; skew-y: 51.4; scale-x: -10000; scale-y: 1.114; }
        frame 110 { x: 59.4; skew-y: -10000; scale-x: 0.715; scale-y: 1.115; }
        frame 111 { x: 59.5; scale-x: -10000; scale-y: -10000; }
        frame 112 { x: 59.6; scale-x: 0.714; scale-y: 1.116; }
        frame 113 { x: 59.7; skew-x: 52.1; scale-x: -10000; scale-y: 1.117; }
        frame 114 { x: 59.8; y: 38.5; skew-x: -10000; scale-x: 0.713; scale-y: 1.118; }
        frame 115 { x: 59.9; y: -10000; skew-x: 52.2; scale-x: 0.712; scale-y: 1.119; }
        frame 116 { x: 60; y: 38.6; skew-x: -10000; skew-y: 51.6; scale-x: -10000; scale-y: 1.12; }
        frame 117 { x: 60.1; y: 38.5; skew-x: 52.4; skew-y: -10000; scale-x: 0.711; scale-y: -10000; }
        frame 118 { x: 60.3; y: 38.6; skew-x: -10000; scale-x: -10000; scale-y: 1.121; }
        frame 119 { x: 60.4; y: -10000; scale-x: 0.71; scale-y: 1.122; }
        frame 120 { x: 60.5; skew-y: 51.7; scale-x: -10000; scale-y: 1.123; }
        frame 121 { x: -10000; y: 38.5; skew-y: -10000; scale-x: 0.709; scale-y: 1.124; }
        frame 122 { x: 60.6; y: -10000; skew-x: 52.6; scale-x: -10000; scale-y: 1.125; }
        frame 123 { x: 60.9; y: 38.6; skew-x: -10000; skew-y: 51.9; scale-x: 0.708; scale-y: -10000; }
        frame 124 { x: -10000; y: 38.5; skew-x: 52.7; skew-y: -10000; scale-x: -10000; scale-y: 1.126; }
        frame 125 { x: 61; y: 38.6; skew-x: -10000; scale-x: 0.707; scale-y: 1.127; }
        frame 126 { x: 61.1; y: 38.5; scale-x: -10000; scale-y: 1.128; }
        frame 127 { x: 61.2; y: -10000; skew-x: 52.9; scale-x: 0.706; scale-y: 1.129; }
        frame 128 { x: 61.3; skew-x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 129 { x: 61.5; skew-y: 52; scale-y: 1.132; }
        frame 130 { x: 51.8; y: 48.5; skew-x: 49.1; skew-y: 48.6; scale-x: 0.718; scale-y: 0.931; }
        frame 131 { x: 42.5; y: 58.9; skew-x: 45.3; skew-y: 45.3; scale-x: 0.733; scale-y: 0.733; }
        frame 132 { x: 40.6; y: -10000; skew-x: 44.4; skew-y: 44.4; scale-x: 0.743; scale-y: 0.721; }
        frame 133 { x: 38.7; skew-x: 43.6; skew-y: 43.4; scale-x: 0.755; scale-y: 0.71; }
        frame 134 { x: 36.8; skew-x: 42.8; skew-y: 42.6; scale-x: 0.767; scale-y: 0.7; }
        frame 135 { x: 40; y: 58.8; skew-x: 44.4; skew-y: 44.1; scale-x: 0.747; scale-y: 0.719; }
        frame 136 { x: 43; y: -10000; skew-x: 45.9; skew-y: 45.6; scale-x: 0.728; scale-y: 0.738; }
        frame 137 { x: 46.2; y: 58.9; skew-x: 47.4; skew-y: 47.1; scale-x: 0.708; scale-y: 0.758; }
        frame 138 { x: 49.3; y: -10000; skew-x: 49; skew-y: 48.5; scale-x: 0.69; scale-y: 0.778; }
        frame 139 { x: 45; skew-x: 47.1; skew-y: 46.9; scale-x: 0.712; scale-y: 0.754; }
        frame 140 { x: 40.8; skew-x: 45.3; skew-y: 45.1; scale-x: 0.735; scale-y: 0.73; }
        frame 141 { x: 36.5; skew-x: 43.4; skew-y: 43.3; scale-x: 0.759; scale-y: 0.708; }
        frame 142 { x: 41.4; y: 58.1; skew-x: 50.4; skew-y: 45.1; scale-x: 0.744; scale-y: 0.73; }
        frame 143 { x: 46.5; y: 57.5; skew-x: 57.4; skew-y: 46.9; scale-x: 0.73; scale-y: 0.754; }
        frame 144 { x: 51.6; y: 57.1; skew-x: 64.3; skew-y: 48.5; scale-x: 0.717; scale-y: 0.778; }
        frame 145 { x: 66.5; y: 57.3; skew-x: 70.4; skew-y: 58.7; scale-x: 0.687; scale-y: 0.917; }
        frame 146 { x: 81.2; y: 58.4; skew-x: 76.2; skew-y: 69; scale-x: 0.657; scale-y: 1.058; }
        frame 147 { x: 95.8; y: 60.5; skew-x: 82.2; skew-y: 79.1; scale-x: 0.627; scale-y: 1.199; }
        frame 148 { x: 93.1; y: 59; skew-x: 89; skew-y: 75.2; scale-x: 0.673; scale-y: 1.135; }
        frame 149 { x: 90.3; y: 57.8; skew-x: 95.3; skew-y: 71; scale-x: 0.719; scale-y: 1.072; }
        frame 150 { x: 87.7; y: 57; skew-x: 102; skew-y: 66.8; scale-x: 0.766; scale-y: 1.01; }
        frame 151 { x: 86.1; y: 68.8; skew-x: 99.6; skew-y: 75.2; scale-x: 0.719; scale-y: -10000; }
        frame 152 { x: 84.2; y: 80.5; skew-x: 97.3; skew-y: 83.7; scale-x: 0.673; }
        frame 153 { x: 82; y: 92.2; skew-x: 95; skew-y: 91.9; scale-x: 0.627; scale-y: 1.011; }
        frame 154 { x: 85.3; y: 102; skew-x: 94.8; skew-y: 91.8; scale-x: 0.626; scale-y: -10000; }
        frame 155 { x: 88.8; y: 111.8; skew-x: 95; skew-y: 91.9; scale-x: 0.627; }
        frame 156 { x: -10000; y: -10000; skew-x: 94.8; skew-y: 91.8; scale-x: 0.626; }
        frame 157 { skew-x: 95; skew-y: 91.9; scale-x: 0.627; }
        frame 158 { skew-x: 94.8; skew-y: 91.8; scale-x: 0.626; }
        frame 159 { skew-x: -10000; skew-y: -10000; scale-x: -10000; }
        frame 163 { skew-x: 95; skew-y: 91.9; scale-x: 0.627; }
        frame 164 { skew-x: -10000; skew-y: -10000; scale-x: -10000; }
    }
    Track {
        source-name: "Driver_innerarm_lower2";
        frame-count: 187;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 9 { x: 14.4; y: 79.6; skew-x: 8.3; skew-y: 8.3; scale-x: 0.696; scale-y: 0.696; cel: 0; image: IMAGE_REANIM_ZOMBIE_BOSSDRIVER_LOWERARM2; }
        frame 10 { x: -10000; y: 79.7; skew-x: 8.8; skew-y: 8.8; scale-x: 0.695; scale-y: 0.695; cel: -10000; image: none; }
        frame 11 { x: 14.5; y: 80; skew-x: 9.3; skew-y: 9.3; scale-x: -10000; scale-y: -10000; }
        frame 12 { x: 14.6; y: 80.1; skew-x: 9.8; skew-y: 9.8; }
        frame 13 { x: -10000; y: 80.3; skew-x: 10.3; skew-y: 10.3; }
        frame 14 { y: 80.5; skew-x: 10.8; skew-y: 10.8; }
        frame 15 { x: 14.8; y: 80.6; skew-x: 11.5; skew-y: 11.5; }
        frame 16 { x: -10000; y: 80.8; skew-x: 12.1; skew-y: 12.1; }
        frame 17 { y: -10000; skew-x: 12.5; skew-y: 11.3; scale-x: 0.698; scale-y: 0.692; }
        frame 18 { x: 14.7; y: 80.7; skew-x: 13; skew-y: 10.9; scale-x: 0.701; scale-y: 0.69; }
        frame 19 { x: -10000; y: 80.5; skew-x: 12; skew-y: 10.3; scale-x: 0.699; scale-y: 0.691; }
        frame 20 { x: 14.6; y: 80.3; skew-x: 11; skew-y: 9.8; scale-x: 0.698; scale-y: 0.692; }
        frame 21 { x: 14.5; y: 80.2; skew-x: 10.1; skew-y: 9.3; scale-x: 0.697; scale-y: 0.693; }
        frame 22 { x: -10000; y: 79.9; skew-x: 9.1; skew-y: 8.8; scale-x: 0.696; scale-y: 0.694; }
        frame 23 { x: 14.4; y: 79.6; skew-x: 8.3; skew-y: 8.3; scale-x: -10000; scale-y: 0.696; }
        frame 24 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 25 { x: 14; y: 79.3; scale-x: 0.695; scale-y: 0.695; }
        frame 26 { x: 13.5; y: 79.1; scale-x: -10000; scale-y: -10000; }
        frame 27 { x: 13; y: 78.8; }
        frame 28 { x: 12.5; y: 78.5; }
        frame 29 { x: 12.1; y: 78.3; }
        frame 30 { x: 11.6; y: 78; scale-x: 0.696; scale-y: 0.696; }
        frame 31 { x: 12.1; y: 78.3; scale-x: 0.695; scale-y: 0.695; }
        frame 32 { x: 12.5; y: 78.5; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 13; y: 78.8; }
        frame 34 { x: 13.5; y: 79.1; }
        frame 35 { x: 14; y: 79.3; }
        frame 36 { x: 14.4; y: 79.6; scale-x: 0.696; scale-y: 0.696; }
        frame 37 { x: 15.7; y: 79.5; skew-x: 10.8; skew-y: 10.8; scale-x: 0.695; scale-y: 0.695; }
        frame 38 { x: 17; y: -10000; skew-x: 13.3; skew-y: 13.3; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 18.3; y: 79.4; skew-x: 15.8; skew-y: 15.8; }
        frame 40 { x: 19.6; y: 79.3; skew-x: 18.3; skew-y: 18.3; }
        frame 41 { x: 21; y: -10000; skew-x: 20.8; skew-y: 20.8; scale-x: 0.694; scale-y: 0.694; }
        frame 42 { x: 22.3; skew-x: 23.3; skew-y: 23.3; scale-x: 0.695; scale-y: 0.695; }
        frame 43 { x: 20.9; skew-x: 20.8; skew-y: 20.8; scale-x: 0.694; scale-y: 0.694; }
        frame 44 { x: 19.6; skew-x: 18.3; skew-y: 18.3; scale-x: 0.695; scale-y: 0.695; }
        frame 45 { x: 18.4; y: 79.5; skew-x: 15.8; skew-y: 15.8; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 17; y: 79.4; skew-x: 13.3; skew-y: 13.3; }
        frame 47 { x: 15.7; y: 79.5; skew-x: 10.8; skew-y: 10.8; }
        frame 48 { x: 14.4; y: 79.6; skew-x: 8.3; skew-y: 8.3; scale-x: 0.696; scale-y: 0.696; }
        frame 49 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: 20.1; y: 77.5; skew-x: 11.5; skew-y: 13.8; scale-x: 0.734; scale-y: 0.702; }
        frame 51 { x: 25.8; y: 75.5; skew-x: 14.8; skew-y: 19.3; scale-x: 0.774; scale-y: 0.709; }
        frame 52 { x: 31.7; y: 73.3; skew-x: 18; skew-y: 25.1; scale-x: 0.813; scale-y: 0.715; }
        frame 53 { x: 37.5; y: 71.5; skew-x: 21.3; skew-y: 30.7; scale-x: 0.853; scale-y: 0.723; }
        frame 54 { x: 34.1; y: 72.6; skew-x: 19.3; skew-y: 27.4; scale-x: 0.829; scale-y: 0.718; }
        frame 55 { x: 30.9; y: 73.7; skew-x: 17.5; skew-y: 24.3; scale-x: 0.807; scale-y: 0.714; }
        frame 56 { x: 27.6; y: 74.8; skew-x: 15.6; skew-y: 21; scale-x: 0.785; scale-y: 0.711; }
        frame 57 { x: 24.2; y: 76.1; skew-x: 13.8; skew-y: 17.8; scale-x: 0.762; scale-y: 0.707; }
        frame 58 { x: 21; y: 77.2; skew-x: 12; skew-y: 14.6; scale-x: 0.74; scale-y: 0.703; }
        frame 59 { x: 17.7; y: 78.4; skew-x: 10; skew-y: 11.3; scale-x: 0.718; scale-y: 0.699; }
        frame 60 { x: 14.4; y: 79.6; skew-x: 8.3; skew-y: 8.3; scale-x: 0.696; scale-y: 0.696; }
        frame 61 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 62 { scale-x: 0.695; scale-y: 0.695; }
        frame 63 { scale-x: -10000; scale-y: -10000; }
        frame 65 { scale-x: 0.696; scale-y: 0.696; }
        frame 66 { x: 14.9; y: 79.2; scale-x: 0.695; scale-y: 0.695; }
        frame 67 { x: 15.3; y: 78.7; scale-x: 0.696; scale-y: 0.696; }
        frame 68 { x: 14.8; y: 79.2; scale-x: 0.695; scale-y: 0.695; }
        frame 69 { x: 14.4; y: 79.6; scale-x: 0.696; scale-y: 0.696; }
        frame 70 { x: 14.9; y: 79.2; scale-x: 0.695; scale-y: 0.695; }
        frame 71 { x: 15.3; y: 78.7; scale-x: 0.696; scale-y: 0.696; }
        frame 72 { x: 14.8; y: 79.2; scale-x: 0.695; scale-y: 0.695; }
        frame 73 { x: 14.4; y: 79.6; scale-x: 0.696; scale-y: 0.696; }
        frame 74 { x: 14.9; y: 79.2; scale-x: 0.695; scale-y: 0.695; }
        frame 75 { x: 15.3; y: 78.7; scale-x: 0.696; scale-y: 0.696; }
        frame 76 { x: 14.8; y: 79.2; scale-x: 0.695; scale-y: 0.695; }
        frame 77 { x: 14.4; y: 79.6; scale-x: 0.696; scale-y: 0.696; }
        frame 78 { x: -10000; y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 79 { x: 16; y: 75.5; skew-x: 1.8; skew-y: 1.8; scale-x: 0.695; scale-y: 0.695; }
        frame 80 { x: 17.8; y: 71.5; skew-x: -4.7; skew-y: -4.7; scale-x: -10000; scale-y: -10000; }
        frame 81 { x: -10000; y: 71.6; skew-x: -10000; skew-y: -10000; }
        frame 82 { y: -10000; }
        frame 129 { y: 71.5; }
        frame 130 { x: 16.1; y: 75.6; skew-x: 1.8; skew-y: 1.8; }
        frame 131 { x: 14.4; y: 79.6; skew-x: 8.3; skew-y: 8.3; scale-x: 0.696; scale-y: 0.696; }
        frame 132 { x: 13.2; y: -10000; skew-x: -10000; skew-y: 6.5; scale-x: 0.698; scale-y: 0.693; }
        frame 133 { x: 11.9; skew-x: 8.1; skew-y: 4.8; scale-x: 0.701; scale-y: 0.691; }
        frame 134 { x: 10.6; skew-x: 8.2; skew-y: 3.1; scale-x: 0.705; scale-y: 0.689; }
        frame 135 { x: 12.7; skew-x: 8.1; skew-y: 6; scale-x: 0.699; scale-y: 0.695; }
        frame 136 { x: 14.7; skew-x: 8.3; skew-y: 9; scale-x: 0.694; scale-y: 0.701; }
        frame 137 { x: 16.7; skew-x: -10000; skew-y: 11.8; scale-x: 0.689; scale-y: 0.706; }
        frame 138 { x: 18.7; skew-x: 8.4; skew-y: 14.9; scale-x: 0.684; scale-y: 0.712; }
        frame 139 { x: 15.8; skew-x: 8.3; skew-y: 11.3; scale-x: 0.69; scale-y: 0.705; }
        frame 140 { x: 12.8; y: 79.7; skew-x: -10000; skew-y: 7.8; scale-x: 0.696; scale-y: 0.697; }
        frame 141 { x: 9.8; y: 79.6; skew-x: 8.2; skew-y: 4.4; scale-x: 0.703; scale-y: 0.69; }
        frame 142 { x: 12.8; y: -10000; skew-x: 8.3; skew-y: 7.8; scale-x: 0.696; scale-y: 0.697; }
        frame 143 { x: 15.8; skew-x: -10000; skew-y: 11.3; scale-x: 0.69; scale-y: 0.705; }
        frame 144 { x: 18.7; skew-x: 8.4; skew-y: 14.9; scale-x: 0.684; scale-y: 0.712; }
        frame 145 { x: 26.6; y: 78; skew-x: 8.5; skew-y: 18.1; scale-x: 0.677; scale-y: 0.727; }
        frame 146 { x: 34.4; y: 76.3; skew-x: -10000; skew-y: 21.5; scale-x: 0.67; scale-y: 0.742; }
        frame 147 { x: 42.3; y: 74.8; skew-x: 8.7; skew-y: 24.8; scale-x: 0.664; scale-y: 0.759; }
        frame 148 { x: 41.5; y: 75.4; skew-x: 8.5; skew-y: -10000; scale-x: -10000; scale-y: 0.758; }
        frame 149 { x: 40.5; y: 76.1; skew-x: -10000; scale-y: -10000; }
        frame 150 { x: 39.7; y: 76.8; skew-x: 8.7; scale-y: 0.759; }
        frame 151 { x: 37.9; y: 79.3; skew-x: 17; skew-y: 33.1; scale-x: 0.663; scale-y: 0.757; }
        frame 152 { x: 36; y: 81.9; skew-x: 25.3; skew-y: 41.6; scale-x: -10000; scale-y: -10000; }
        frame 153 { x: 34.2; y: 84.8; skew-x: 33.8; skew-y: 50; scale-y: 0.758; }
        frame 154 { x: 34.3; y: 94.6; skew-x: -10000; skew-y: 49.9; scale-x: 0.662; scale-y: 0.756; }
        frame 155 { x: 34.2; y: 104.3; skew-y: 50; scale-x: 0.663; scale-y: 0.758; }
        frame 156 { x: 34.3; y: 104.4; skew-y: 49.9; scale-x: 0.662; scale-y: 0.756; }
        frame 157 { x: 34.2; y: 104.3; skew-y: 50; scale-x: 0.663; scale-y: 0.758; }
        frame 158 { x: 34.3; y: 104.4; skew-y: 49.9; scale-x: 0.662; scale-y: 0.756; }
        frame 159 { x: -10000; y: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 163 { x: 34.2; y: 104.3; skew-y: 50; scale-x: 0.663; scale-y: 0.758; }
        frame 164 { x: -10000; y: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Driver_innerarm_hand";
        frame-count: 187;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 9 { x: 0.9; y: 74; skew-x: -2.2; skew-y: -2.2; scale-x: 0.799; scale-y: 0.799; cel: 0; image: IMAGE_REANIM_ZOMBIE_BOSSDRIVER_INNERHAND; }
        frame 10 { x: -10000; y: 74.1; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 11 { y: -10000; }
        frame 16 { y: 74; }
        frame 17 { y: 74.1; }
        frame 18 { y: -10000; }
        frame 23 { y: 74; }
        frame 24 { y: -10000; }
        frame 25 { x: 0; y: 74.2; skew-x: -3.9; skew-y: -3.9; }
        frame 26 { x: -1.1; y: 74.5; skew-x: -5.9; skew-y: -5.9; scale-x: 0.798; scale-y: 0.798; }
        frame 27 { x: -2.2; y: 74.7; skew-x: -7.7; skew-y: -7.7; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: -3.3; y: 75.1; skew-x: -9.7; skew-y: -9.7; }
        frame 29 { x: -4.3; y: 75.3; skew-x: -11.7; skew-y: -11.7; }
        frame 30 { x: -5.4; y: 75.7; skew-x: -13.6; skew-y: -13.6; }
        frame 31 { x: -4.3; y: 75.3; skew-x: -11.7; skew-y: -11.7; }
        frame 32 { x: -3.3; y: 75; skew-x: -9.7; skew-y: -9.7; }
        frame 33 { x: -2.2; y: 74.7; skew-x: -7.7; skew-y: -7.7; }
        frame 34 { x: -1.1; y: 74.5; skew-x: -5.9; skew-y: -5.9; }
        frame 35 { x: -0; y: 74.2; skew-x: -3.9; skew-y: -3.9; scale-x: 0.799; scale-y: 0.799; }
        frame 36 { x: 0.9; y: 74; skew-x: -2.2; skew-y: -2.2; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 2.7; y: 73.2; skew-x: 0.8; skew-y: 0.8; }
        frame 38 { x: 4.7; y: 72.2; skew-x: 4.3; skew-y: 4.3; scale-x: 0.798; scale-y: 0.798; }
        frame 39 { x: 6.7; y: 71.6; skew-x: 7.5; skew-y: 7.5; scale-x: -10000; scale-y: -10000; }
        frame 40 { x: 8.6; y: 70.8; skew-x: 10.8; skew-y: 10.8; }
        frame 41 { x: 10.6; y: 70.3; skew-x: 14; skew-y: 14; scale-x: 0.797; scale-y: 0.797; }
        frame 42 { x: 12.7; y: 69.7; skew-x: 17.3; skew-y: 17.3; scale-x: 0.798; scale-y: 0.798; }
        frame 43 { x: 10.6; y: 70.2; skew-x: 14; skew-y: 14; scale-x: 0.797; scale-y: 0.797; }
        frame 44 { x: 8.6; y: 70.9; skew-x: 10.8; skew-y: 10.8; scale-x: 0.798; scale-y: 0.798; }
        frame 45 { x: 6.6; y: 71.6; skew-x: 7.5; skew-y: 7.5; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 4.7; y: 72.3; skew-x: 4.3; skew-y: 4.3; }
        frame 47 { x: 2.8; y: 73.2; skew-x: 0.8; skew-y: 0.8; scale-x: 0.799; scale-y: 0.799; }
        frame 48 { x: 0.9; y: 74; skew-x: -2.2; skew-y: -2.2; scale-x: -10000; scale-y: -10000; }
        frame 49 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 50 { x: 5.2; y: 72.3; skew-x: 4.3; skew-y: 4.3; scale-x: 0.798; scale-y: 0.798; }
        frame 51 { x: 9.7; y: 70.7; skew-x: 11.1; skew-y: 11.1; scale-x: -10000; scale-y: -10000; }
        frame 52 { x: 14.4; y: 69.3; skew-x: 17.8; skew-y: 17.8; scale-x: 0.797; scale-y: 0.797; }
        frame 53 { x: 19.2; y: 68.3; skew-x: 24.7; skew-y: 24.7; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: 16.5; y: 68.9; skew-x: 20.8; skew-y: 20.8; }
        frame 55 { x: 13.7; y: 69.4; skew-x: 17; skew-y: 17; }
        frame 56 { x: 11.1; y: 70.3; skew-x: 13; skew-y: 13; }
        frame 57 { x: 8.4; y: 71; skew-x: 9.3; skew-y: 9.3; scale-x: 0.798; scale-y: 0.798; }
        frame 58 { x: 5.8; y: 71.9; skew-x: 5.3; skew-y: 5.3; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 3.3; y: 72.9; skew-x: 1.5; skew-y: 1.5; scale-x: 0.799; scale-y: 0.799; }
        frame 60 { x: 0.9; y: 74; skew-x: -2.2; skew-y: -2.2; scale-x: -10000; scale-y: -10000; }
        frame 61 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 62 { y: 74.1; }
        frame 63 { y: -10000; }
        frame 65 { y: 74; }
        frame 66 { y: 74.1; }
        frame 67 { y: 74; }
        frame 68 { y: 74.1; }
        frame 69 { y: 74; }
        frame 70 { y: 74.1; }
        frame 71 { y: 74; }
        frame 72 { y: 74.1; }
        frame 73 { y: 74; }
        frame 74 { y: 74.1; }
        frame 75 { y: 74; }
        frame 76 { y: 74.1; }
        frame 77 { y: 74; }
        frame 78 { y: -10000; }
        frame 79 { x: 1.4; y: 73; skew-x: -8.7; skew-y: -8.7; scale-x: 0.798; scale-y: 0.798; }
        frame 80 { x: 2.1; y: 72.3; skew-x: -15.2; skew-y: -15.2; scale-x: -10000; scale-y: -10000; }
        frame 81 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 130 { x: 1.5; y: 73.1; skew-x: -8.7; skew-y: -8.7; }
        frame 131 { x: 0.9; y: 74; skew-x: -2.2; skew-y: -2.2; scale-x: 0.799; scale-y: 0.799; }
        frame 132 { x: -0.4; y: -10000; skew-x: -10000; skew-y: -3.9; scale-x: 0.798; scale-y: 0.801; }
        frame 133 { x: -1.8; y: 74; skew-y: -5.5; scale-x: 0.797; scale-y: 0.803; }
        frame 134 { x: -3.2; skew-y: -7.4; scale-x: 0.796; scale-y: 0.805; }
        frame 135 { x: -0.9; skew-y: -4.2; scale-x: 0.798; scale-y: 0.804; }
        frame 136 { x: 1.3; y: 73.9; skew-y: -1.2; scale-x: 0.799; scale-y: 0.803; }
        frame 137 { x: 3.5; y: 74; skew-y: 1.5; scale-x: 0.801; scale-y: 0.802; }
        frame 138 { x: 5.9; skew-y: 4.6; scale-x: 0.803; scale-y: 0.801; }
        frame 139 { x: 2.6; y: 73.9; skew-y: 1; scale-x: 0.801; scale-y: -10000; }
        frame 140 { x: -0.6; y: 74; skew-y: -2.4; scale-x: 0.799; scale-y: 0.802; }
        frame 141 { x: -3.9; skew-y: -6.1; scale-x: 0.797; scale-y: 0.803; }
        frame 142 { x: -0.6; skew-y: -2.4; scale-x: 0.799; scale-y: 0.802; }
        frame 143 { x: 2.5; y: -10000; skew-y: 1; scale-x: 0.801; scale-y: 0.801; }
        frame 144 { x: 5.9; y: 74; skew-y: 4.6; scale-x: 0.803; scale-y: -10000; }
        frame 145 { x: 14.4; y: 72; skew-x: 4.8; skew-y: 18.8; scale-x: 0.804; scale-y: 0.831; }
        frame 146 { x: 23.1; y: 71.2; skew-x: 11.8; skew-y: 33.1; scale-x: 0.806; scale-y: 0.862; }
        frame 147 { x: 31.6; y: 71.4; skew-x: 19.1; skew-y: 47.4; scale-x: 0.808; scale-y: 0.895; }
        frame 148 { x: 28.6; y: 72.3; skew-x: 16.3; skew-y: 44.6; scale-x: 0.807; scale-y: 0.893; }
        frame 149 { x: 25.6; y: 73.2; skew-x: 13.6; skew-y: 42.1; scale-x: 0.808; scale-y: 0.894; }
        frame 150 { x: 22.6; y: 74; skew-x: 11.1; skew-y: 39.4; scale-x: -10000; scale-y: 0.895; }
        frame 151 { x: 25.4; y: 74.6; skew-x: 19.3; skew-y: 44.6; scale-x: 0.807; scale-y: 0.873; }
        frame 152 { x: 28.3; y: 75.2; skew-x: 27.8; skew-y: 50.1; scale-x: 0.806; scale-y: 0.853; }
        frame 153 { x: 31.2; y: 76; skew-x: 36.2; skew-y: 55.4; scale-x: 0.807; scale-y: 0.834; }
        frame 154 { x: 36.1; y: 81.2; skew-x: 54.9; skew-y: 71.7; scale-x: 0.805; scale-y: 0.821; }
        frame 155 { x: 40.5; y: 87.8; skew-x: 73.6; skew-y: 87.7; scale-x: 0.806; scale-y: 0.811; }
        frame 156 { x: 39.7; y: 95.4; skew-x: 83; skew-y: 97; scale-x: 0.805; scale-y: 0.81; }
        frame 157 { x: 38.4; y: 103.3; skew-x: 92.1; skew-y: 106.3; scale-x: -10000; scale-y: -10000; }
        frame 158 { x: 38.3; y: -10000; skew-x: 92; skew-y: -10000; scale-y: 0.809; }
        frame 159 { x: -10000; skew-x: -10000; scale-y: -10000; }
        frame 163 { x: 38.4; skew-x: 92.1; scale-y: 0.81; }
        frame 164 { x: -10000; skew-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Driver_innerrarm_lower";
        frame-count: 187;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 9 { x: 16.2; y: 72.9; skew-x: 11.5; skew-y: 11.5; scale-x: 0.696; scale-y: 0.696; cel: 0; image: IMAGE_REANIM_ZOMBIE_BOSSDRIVER_LOWERARM; }
        frame 10 { x: 16.3; y: 73.1; skew-x: 11.8; skew-y: 11.8; scale-x: 0.695; scale-y: 0.695; cel: -10000; image: none; }
        frame 11 { x: 16.5; y: 73.3; skew-x: 12.5; skew-y: 12.5; scale-x: -10000; scale-y: -10000; }
        frame 12 { x: 16.6; y: 73.5; skew-x: 13; skew-y: 13; }
        frame 13 { x: 16.7; y: 73.8; skew-x: 13.5; skew-y: 13.5; }
        frame 14 { x: 16.8; y: 74; skew-x: 14; skew-y: 14; }
        frame 15 { x: 16.9; y: 74.1; skew-x: 14.6; skew-y: 14.6; }
        frame 16 { x: 17; y: 74.3; skew-x: 15.2; skew-y: 15.2; scale-x: 0.696; scale-y: 0.696; }
        frame 17 { x: 16.9; y: 74.2; skew-x: 15.6; skew-y: 14.6; scale-x: 0.698; scale-y: 0.692; }
        frame 18 { x: 16.8; y: -10000; skew-x: 16.2; skew-y: 14.2; scale-x: 0.702; scale-y: 0.689; }
        frame 19 { x: 16.7; y: 73.9; skew-x: 15.3; skew-y: 13.5; scale-x: 0.7; scale-y: 0.69; }
        frame 20 { x: 16.5; y: 73.7; skew-x: 14.3; skew-y: 13; scale-x: 0.699; scale-y: 0.691; }
        frame 21 { x: 16.4; y: 73.5; skew-x: 13.3; skew-y: 12.5; scale-x: 0.698; scale-y: 0.693; }
        frame 22 { x: -10000; y: 73.2; skew-x: 12.3; skew-y: 12; scale-x: 0.697; scale-y: 0.694; }
        frame 23 { x: 16.2; y: 72.9; skew-x: 11.5; skew-y: 11.5; scale-x: 0.696; scale-y: 0.696; }
        frame 24 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 15.8; y: 72.7; skew-x: 11.3; skew-y: 11.3; }
        frame 26 { x: 15.3; y: 72.3; skew-x: -10000; skew-y: -10000; }
        frame 27 { x: 14.9; y: 72.1; }
        frame 28 { x: 14.4; y: 71.8; }
        frame 29 { x: 13.9; y: 71.6; }
        frame 30 { x: 13.4; y: 71.3; skew-x: 11.5; skew-y: 11.5; }
        frame 31 { x: 13.8; y: 71.6; skew-x: 11.3; skew-y: 11.3; }
        frame 32 { x: 14.3; y: 71.8; skew-x: -10000; skew-y: -10000; }
        frame 33 { x: 14.8; y: 72.1; }
        frame 34 { x: 15.2; y: 72.3; }
        frame 35 { x: 15.7; y: 72.7; }
        frame 36 { x: 16.2; y: 72.9; skew-x: 11.5; skew-y: 11.5; }
        frame 37 { x: 17.7; y: 73; skew-x: 13.8; skew-y: 13.8; scale-x: 0.695; scale-y: 0.695; }
        frame 38 { x: 19.3; y: -10000; skew-x: 16.3; skew-y: 16.3; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 20.9; y: 73.1; skew-x: 18.8; skew-y: 18.8; }
        frame 40 { x: 22.4; y: -10000; skew-x: 21.3; skew-y: 21.3; }
        frame 41 { x: 24.1; y: 73.2; skew-x: 23.8; skew-y: 23.8; }
        frame 42 { x: 25.7; y: 73.3; skew-x: 26.5; skew-y: 26.5; }
        frame 43 { x: 24.1; y: -10000; skew-x: 23.8; skew-y: 23.8; }
        frame 44 { x: 22.4; y: 73.2; skew-x: 21.3; skew-y: 21.3; }
        frame 45 { x: 20.8; y: 73.1; skew-x: 18.8; skew-y: 18.8; }
        frame 46 { x: 19.3; y: 72.9; skew-x: 16.3; skew-y: 16.3; }
        frame 47 { x: 17.8; y: -10000; skew-x: 13.8; skew-y: 13.8; }
        frame 48 { x: 16.2; skew-x: 11.5; skew-y: 11.5; scale-x: 0.696; scale-y: 0.696; }
        frame 49 { x: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: 22.5; y: 71.1; skew-x: 14.5; skew-y: 17.1; scale-x: 0.733; scale-y: 0.704; }
        frame 51 { x: 29; y: 69.2; skew-x: 17.6; skew-y: 22.8; scale-x: 0.77; scale-y: 0.713; }
        frame 52 { x: 35.5; y: 67.3; skew-x: 20.8; skew-y: 28.6; scale-x: 0.808; scale-y: 0.722; }
        frame 53 { x: 42; y: 65.6; skew-x: 24; skew-y: 34.3; scale-x: 0.846; scale-y: 0.731; }
        frame 54 { x: 38.2; y: 66.7; skew-x: 22.1; skew-y: 31.1; scale-x: 0.824; scale-y: 0.725; }
        frame 55 { x: 34.5; y: 67.7; skew-x: 20.3; skew-y: 27.8; scale-x: 0.802; scale-y: 0.72; }
        frame 56 { x: 30.8; y: 68.7; skew-x: 18.5; skew-y: 24.5; scale-x: 0.781; scale-y: 0.715; }
        frame 57 { x: 27.1; y: 69.7; skew-x: 16.8; skew-y: 21.3; scale-x: 0.76; scale-y: 0.71; }
        frame 58 { x: 23.5; y: 70.7; skew-x: 15; skew-y: 17.8; scale-x: 0.738; scale-y: 0.705; }
        frame 59 { x: 19.8; y: 71.8; skew-x: 13.1; skew-y: 14.6; scale-x: 0.717; scale-y: 0.7; }
        frame 60 { x: 16.2; y: 72.9; skew-x: 11.5; skew-y: 11.5; scale-x: 0.696; scale-y: 0.696; }
        frame 61 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 62 { x: 16.3; skew-x: 11.3; skew-y: 11.3; }
        frame 63 { x: -10000; skew-x: -10000; skew-y: -10000; }
        frame 65 { x: 16.2; skew-x: 11.5; skew-y: 11.5; }
        frame 66 { x: 16.7; y: 72.5; skew-x: 11.3; skew-y: 11.3; }
        frame 67 { x: 17.1; y: 72; skew-x: 11.5; skew-y: 11.5; }
        frame 68 { x: 16.7; y: 72.5; skew-x: 11.3; skew-y: 11.3; }
        frame 69 { x: 16.2; y: 72.9; skew-x: 11.5; skew-y: 11.5; }
        frame 70 { x: 16.7; y: 72.5; skew-x: 11.3; skew-y: 11.3; }
        frame 71 { x: 17.1; y: 72; skew-x: 11.5; skew-y: 11.5; }
        frame 72 { x: 16.7; y: 72.5; skew-x: 11.3; skew-y: 11.3; }
        frame 73 { x: 16.2; y: 72.9; skew-x: 11.5; skew-y: 11.5; }
        frame 74 { x: 16.7; y: 72.5; skew-x: 11.3; skew-y: 11.3; }
        frame 75 { x: 17.1; y: 72; skew-x: 11.5; skew-y: 11.5; }
        frame 76 { x: 16.7; y: 72.5; skew-x: 11.3; skew-y: 11.3; }
        frame 77 { x: 16.2; y: 72.9; skew-x: 11.5; skew-y: 11.5; }
        frame 78 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 79 { x: 18.1; y: 67.9; skew-x: 4.8; skew-y: 9.8; scale-y: 0.774; }
        frame 80 { x: 20.3; y: 62.8; skew-x: -1.5; skew-y: 8.2; scale-x: 0.695; scale-y: 0.853; }
        frame 81 { x: -10000; y: -10000; skew-x: -1.4; skew-y: 8.3; scale-x: -10000; scale-y: -10000; }
        frame 82 { x: 20.4; skew-x: -10000; skew-y: -10000; scale-y: 0.854; }
        frame 83 { x: 20.5; skew-y: 8.5; scale-y: -10000; }
        frame 84 { x: -10000; skew-y: 8.6; scale-y: 0.855; }
        frame 85 { x: 20.6; skew-y: 8.8; scale-y: -10000; }
        frame 86 { x: -10000; skew-y: -10000; scale-x: 0.696; }
        frame 87 { x: 20.7; skew-y: 9; scale-x: -10000; scale-y: 0.856; }
        frame 88 { x: -10000; skew-y: 9.1; scale-y: -10000; }
        frame 89 { x: 20.8; skew-y: 9.3; scale-y: 0.857; }
        frame 90 { x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 91 { x: 20.9; skew-y: 9.5; }
        frame 92 { x: -10000; skew-y: 9.6; scale-y: 0.858; }
        frame 93 { x: 21; skew-y: 9.8; scale-y: -10000; }
        frame 94 { skew-y: -10000; }
        frame 95 { x: 21.1; skew-y: 10; scale-y: 0.859; }
        frame 96 { x: 21.2; skew-y: -10000; scale-y: -10000; }
        frame 97 { x: -10000; skew-y: 10.3; scale-y: 0.86; }
        frame 98 { x: 21.3; skew-y: -10000; scale-y: -10000; }
        frame 99 { x: -10000; skew-y: 10.5; }
        frame 100 { x: 21.4; skew-y: -10000; scale-y: 0.861; }
        frame 101 { x: 21.5; skew-y: 10.8; scale-y: -10000; }
        frame 102 { x: -10000; skew-y: -10000; scale-y: 0.862; }
        frame 103 { x: 21.6; skew-y: 11; scale-y: -10000; }
        frame 104 { x: -10000; skew-y: -10000; }
        frame 105 { x: 21.7; skew-y: 11.3; scale-y: 0.863; }
        frame 106 { x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 107 { x: 21.8; scale-y: 0.864; }
        frame 108 { x: -10000; skew-y: 11.5; scale-y: -10000; }
        frame 109 { skew-y: 11.6; }
        frame 110 { x: 21.9; skew-y: 11.8; scale-y: 0.865; }
        frame 111 { x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 112 { x: 22; skew-y: 12; }
        frame 113 { skew-y: 12.1; scale-y: 0.866; }
        frame 114 { x: 22.2; skew-y: 12.3; scale-y: -10000; }
        frame 115 { x: -10000; skew-y: -10000; scale-y: 0.867; }
        frame 116 { skew-y: 12.5; scale-y: -10000; }
        frame 117 { x: 22.3; skew-y: 12.6; }
        frame 118 { x: -10000; skew-y: 12.8; scale-y: 0.868; }
        frame 119 { x: 22.4; skew-y: -10000; scale-y: -10000; }
        frame 120 { x: 22.5; skew-y: 13; scale-y: 0.869; }
        frame 121 { x: -10000; skew-y: 13.1; scale-y: -10000; }
        frame 122 { x: 22.6; skew-y: 13.3; }
        frame 123 { x: -10000; skew-y: -10000; scale-y: 0.87; }
        frame 124 { x: 22.7; skew-y: 13.5; scale-y: -10000; }
        frame 125 { x: -10000; skew-y: 13.6; scale-y: 0.871; }
        frame 126 { x: 22.8; skew-y: 13.8; scale-y: -10000; }
        frame 127 { x: -10000; skew-y: -10000; }
        frame 128 { x: 23; skew-y: 14; scale-y: 0.872; }
        frame 129 { x: -10000; skew-x: -1.5; skew-y: 14.1; scale-y: 0.873; }
        frame 130 { x: 19.5; y: 67.9; skew-x: 4.8; skew-y: 12.8; scale-y: 0.784; }
        frame 131 { x: 16.2; y: 72.9; skew-x: 11.5; skew-y: 11.5; scale-y: 0.696; }
        frame 132 { x: 14.8; y: -10000; skew-x: 11.3; skew-y: 9.8; scale-x: 0.7; scale-y: 0.692; }
        frame 133 { x: 13.3; y: 72.8; skew-x: -10000; skew-y: 8; scale-x: 0.704; scale-y: 0.689; }
        frame 134 { x: 11.8; y: 72.9; skew-y: 6.3; scale-x: 0.708; scale-y: 0.686; }
        frame 135 { x: 14.1; y: -10000; skew-y: 9.1; scale-x: 0.701; scale-y: 0.694; }
        frame 136 { x: 16.6; skew-y: 12; scale-x: 0.694; scale-y: 0.701; }
        frame 137 { x: 18.9; skew-x: 11.5; skew-y: 15; scale-x: 0.686; scale-y: 0.709; }
        frame 138 { x: 21.3; skew-x: 11.7; skew-y: 17.9; scale-x: 0.68; scale-y: 0.717; }
        frame 139 { x: 17.9; y: 72.8; skew-x: 11.5; skew-y: 14.3; scale-x: 0.688; scale-y: 0.707; }
        frame 140 { x: 14.5; y: 72.9; skew-x: 11.3; skew-y: 11; scale-x: 0.696; scale-y: 0.697; }
        frame 141 { x: 11.2; y: -10000; skew-x: -10000; skew-y: 7.6; scale-x: 0.705; scale-y: 0.688; }
        frame 142 { x: 14.6; skew-y: 11; scale-x: 0.696; scale-y: 0.697; }
        frame 143 { x: 18; skew-x: 11.5; skew-y: 14.3; scale-x: 0.688; scale-y: 0.707; }
        frame 144 { x: 21.3; skew-x: 11.7; skew-y: 17.9; scale-x: 0.68; scale-y: 0.717; }
        frame 145 { x: 30.8; y: 70.5; skew-x: 14.3; skew-y: 23.6; scale-x: 0.67; scale-y: 0.805; }
        frame 146 { x: 40.5; y: 68.2; skew-x: 17.1; skew-y: 29.3; scale-x: 0.661; scale-y: 0.895; }
        frame 147 { x: 50.5; y: 66.3; skew-x: 20; skew-y: 35.2; scale-x: 0.653; scale-y: 0.986; }
        frame 148 { x: 49.2; y: 67.3; skew-x: 19.5; skew-y: 34.8; scale-x: 0.652; scale-y: 0.962; }
        frame 149 { x: 47.9; y: 68.1; skew-x: 19; skew-y: 34.3; scale-x: -10000; scale-y: 0.94; }
        frame 150 { x: 46.4; y: 68.8; skew-x: 18.5; skew-y: 33.8; scale-x: 0.653; scale-y: 0.919; }
        frame 151 { x: 46.5; y: 73; skew-x: 24.8; skew-y: 40.1; scale-x: 0.652; scale-y: 0.867; }
        frame 152 { x: -10000; y: 77.1; skew-x: 31.1; skew-y: 46.4; scale-x: 0.651; scale-y: 0.817; }
        frame 153 { x: 46.3; y: 81.3; skew-x: 37.3; skew-y: 52.6; scale-x: 0.652; scale-y: 0.768; }
        frame 154 { x: -10000; y: 91.1; skew-x: -10000; skew-y: -10000; scale-x: 0.651; scale-y: 0.767; }
        frame 155 { y: 100.9; scale-x: 0.652; scale-y: 0.768; }
        frame 156 { x: 46.4; y: -10000; scale-x: 0.651; scale-y: 0.767; }
        frame 157 { x: 46.3; scale-x: 0.652; scale-y: 0.768; }
        frame 158 { x: 46.4; scale-x: 0.651; scale-y: 0.767; }
        frame 159 { x: -10000; scale-x: -10000; scale-y: -10000; }
        frame 163 { x: 46.3; scale-x: 0.652; scale-y: 0.768; }
        frame 164 { x: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Driver_body";
        frame-count: 187;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 9 { x: 35.2; y: 44.8; skew-x: -5.7; skew-y: -5.7; scale-x: 0.799; scale-y: 0.979; cel: 0; image: IMAGE_REANIM_ZOMBIE_BOSSDRIVER_BODY; }
        frame 10 { x: 35.1; y: 45.1; skew-x: -5.9; skew-y: -5.9; scale-x: -10000; scale-y: 0.975; cel: -10000; image: none; }
        frame 11 { x: 34.9; y: 45.5; skew-x: -6.2; skew-y: -6.2; scale-y: 0.971; }
        frame 12 { x: 34.6; y: 45.8; skew-x: -6.4; skew-y: -6.4; scale-y: 0.967; }
        frame 13 { x: 34.4; y: 46.2; skew-x: -6.7; skew-y: -6.7; scale-y: 0.964; }
        frame 14 { x: 34.2; y: 46.5; skew-x: -6.9; skew-y: -6.9; scale-y: 0.96; }
        frame 15 { x: 34; y: 47; skew-x: -7.2; skew-y: -7.2; scale-y: 0.956; }
        frame 16 { x: 33.8; y: 47.3; skew-x: -7.5; skew-y: -7.5; scale-y: 0.952; }
        frame 17 { x: 34.1; y: 46.9; skew-x: -7.2; skew-y: -7.2; scale-y: 0.956; }
        frame 18 { x: 34.3; y: 46.5; skew-x: -6.9; skew-y: -6.9; scale-y: 0.96; }
        frame 19 { x: 34.5; y: 46.2; skew-x: -6.7; skew-y: -6.7; scale-y: 0.964; }
        frame 20 { x: 34.7; y: 45.8; skew-x: -6.4; skew-y: -6.4; scale-y: 0.967; }
        frame 21 { x: 35; y: 45.4; skew-x: -6.2; skew-y: -6.2; scale-y: 0.971; }
        frame 22 { x: 35.1; y: 45; skew-x: -5.9; skew-y: -5.9; scale-y: 0.975; }
        frame 23 { x: 35.2; y: 44.8; skew-x: -5.7; skew-y: -5.7; scale-y: 0.979; }
        frame 24 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 25 { x: 36.6; y: 44.4; skew-x: -4.7; skew-y: -4.7; }
        frame 26 { x: 37.8; y: 44.1; skew-x: -3.9; skew-y: -3.7; }
        frame 27 { x: 39; y: 43.9; skew-x: -3.2; skew-y: -2.7; }
        frame 28 { x: 40.3; y: 43.6; skew-x: -2.2; skew-y: -1.7; }
        frame 29 { x: 41.4; y: 43.4; skew-x: -1.4; skew-y: -0.7; }
        frame 30 { x: 42.6; y: 43; skew-x: -0.7; skew-y: 0.1; }
        frame 31 { x: 41.5; y: 43.3; skew-x: -1.4; skew-y: -0.7; }
        frame 32 { x: 40.3; y: 43.5; skew-x: -2.2; skew-y: -1.7; }
        frame 33 { x: 39; y: 43.9; skew-x: -3.2; skew-y: -2.7; }
        frame 34 { x: 37.7; y: 44; skew-x: -3.9; skew-y: -3.7; }
        frame 35 { x: 36.5; y: 44.4; skew-x: -4.7; skew-y: -4.7; }
        frame 36 { x: 35.2; y: 44.8; skew-x: -5.7; skew-y: -5.7; }
        frame 37 { x: 36.6; y: 44.4; skew-x: -4.7; skew-y: -4.7; }
        frame 38 { x: 37.8; y: 44.1; skew-x: -3.9; skew-y: -3.7; }
        frame 39 { x: 39; y: 43.9; skew-x: -3.2; skew-y: -2.7; }
        frame 40 { x: 40.3; y: 43.6; skew-x: -2.2; skew-y: -1.7; }
        frame 41 { x: 41.4; y: 43.4; skew-x: -1.4; skew-y: -0.7; }
        frame 42 { x: 42.6; y: 43; skew-x: -0.7; skew-y: 0.1; }
        frame 43 { x: 41.5; y: 43.3; skew-x: -1.4; skew-y: -0.7; }
        frame 44 { x: 40.3; y: 43.5; skew-x: -2.2; skew-y: -1.7; }
        frame 45 { x: 39; y: 43.9; skew-x: -3.2; skew-y: -2.7; }
        frame 46 { x: 37.7; y: 44; skew-x: -3.9; skew-y: -3.7; }
        frame 47 { x: 36.5; y: 44.4; skew-x: -4.7; skew-y: -4.7; }
        frame 48 { x: 35.2; y: 44.8; skew-x: -5.7; skew-y: -5.7; }
        frame 49 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 50 { x: 47.1; y: 44; skew-x: 2.3; skew-y: 2.3; }
        frame 51 { x: 59.4; y: 43.9; skew-x: 10.6; skew-y: 10.6; scale-x: 0.798; scale-y: 0.978; }
        frame 52 { x: 72; y: 44.6; skew-x: 19; skew-y: 19; scale-x: 0.797; scale-y: 0.977; }
        frame 53 { x: 84.5; y: 46.1; skew-x: 27.3; skew-y: 27.3; scale-x: 0.798; scale-y: 0.978; }
        frame 54 { x: 77.3; y: 45.2; skew-x: 22.5; skew-y: 22.5; scale-x: 0.797; scale-y: 0.977; }
        frame 55 { x: 70.1; y: 44.5; skew-x: 17.8; skew-y: 17.8; scale-x: -10000; scale-y: -10000; }
        frame 56 { x: 63; y: 44; skew-x: 13; skew-y: 13; scale-x: 0.798; scale-y: 0.978; }
        frame 57 { x: 55.9; y: 43.9; skew-x: 8.3; skew-y: 8.3; scale-x: -10000; scale-y: -10000; }
        frame 58 { x: 48.8; y: -10000; skew-x: 3.5; skew-y: 3.5; scale-y: 0.979; }
        frame 59 { x: 42; y: 44.1; skew-x: -0.9; skew-y: -0.9; scale-x: 0.799; scale-y: -10000; }
        frame 60 { x: 35.2; y: 44.8; skew-x: -5.7; skew-y: -5.7; scale-x: -10000; }
        frame 61 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 62 { x: 36; y: 44.5; skew-x: -4.9; skew-y: -4.9; }
        frame 63 { x: 36.8; y: 44.3; skew-x: -4.2; skew-y: -4.2; }
        frame 64 { x: 37.4; y: 44; skew-x: -3.5; skew-y: -3.5; }
        frame 65 { x: 38; y: 43.8; skew-x: -2.9; skew-y: -2.9; }
        frame 66 { y: 43.9; skew-x: -10000; skew-y: -10000; }
        frame 67 { y: 43.8; }
        frame 68 { y: 43.9; }
        frame 69 { y: 43.8; }
        frame 70 { y: 43.9; }
        frame 71 { y: 43.8; }
        frame 72 { y: 43.9; }
        frame 73 { y: 43.8; }
        frame 74 { y: 43.9; }
        frame 75 { y: 43.8; }
        frame 76 { y: 43.9; }
        frame 77 { y: 43.8; }
        frame 78 { x: -10000; y: -10000; }
        frame 79 { x: 44.1; y: 34.7; skew-x: 1.8; skew-y: 1.8; scale-y: 1.04; }
        frame 80 { x: 51.1; y: 25.7; skew-x: 7; skew-y: 7; scale-x: 0.798; scale-y: 1.101; }
        frame 81 { x: 51.2; y: 25.8; skew-x: 6.8; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 82 { x: 51.3; y: 25.7; skew-x: -10000; }
        frame 83 { x: 51.4; y: 25.8; skew-y: 7.1; }
        frame 84 { x: 51.5; y: -10000; skew-y: 7.3; scale-y: 1.102; }
        frame 85 { x: 51.6; y: 25.7; skew-y: -10000; scale-x: 0.797; scale-y: -10000; }
        frame 86 { x: 51.8; y: -10000; scale-x: -10000; }
        frame 87 { x: 52; y: 25.8; skew-y: 7.5; }
        frame 88 { y: -10000; skew-y: -10000; scale-y: 1.103; }
        frame 89 { x: 52.1; y: 25.7; skew-y: 7.6; scale-y: -10000; }
        frame 90 { x: 52.3; y: -10000; skew-y: 7.8; }
        frame 91 { x: 52.4; y: 25.8; skew-y: -10000; }
        frame 92 { x: 52.5; y: -10000; scale-x: 0.796; scale-y: 1.104; }
        frame 93 { x: 52.7; y: 25.7; skew-y: 8; scale-x: -10000; scale-y: -10000; }
        frame 94 { x: 52.8; y: -10000; skew-y: -10000; }
        frame 95 { x: 52.9; skew-y: 8.1; }
        frame 96 { x: 53; skew-y: 8.3; scale-y: 1.105; }
        frame 97 { x: 53.1; skew-y: -10000; scale-y: -10000; }
        frame 98 { x: 53.3; }
        frame 99 { x: 53.5; y: 25.8; skew-y: 8.5; scale-x: 0.795; }
        frame 100 { x: -10000; y: 25.7; skew-y: -10000; scale-x: -10000; scale-y: 1.106; }
        frame 101 { x: 53.6; y: -10000; skew-y: 8.6; scale-y: -10000; }
        frame 102 { x: 53.8; y: 25.8; skew-y: 8.8; }
        frame 103 { x: 53.9; y: 25.7; skew-y: -10000; }
        frame 104 { x: 54.1; y: -10000; skew-y: 9; scale-y: 1.107; }
        frame 105 { x: 54.2; skew-y: -10000; scale-y: -10000; }
        frame 106 { x: 54.3; y: 25.8; scale-x: 0.794; }
        frame 107 { x: 54.5; y: 25.7; skew-x: 7; skew-y: 9.3; scale-x: -10000; }
        frame 108 { x: 54.6; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: 1.108; }
        frame 109 { x: -10000; scale-y: -10000; }
        frame 110 { x: 54.9; skew-y: 9.5; }
        frame 111 { x: -10000; skew-y: -10000; }
        frame 112 { x: 55; skew-y: 9.6; scale-x: 0.793; scale-y: 1.109; }
        frame 113 { x: 55.3; skew-y: 9.8; scale-x: -10000; scale-y: -10000; }
        frame 114 { x: -10000; skew-y: -10000; }
        frame 115 { x: 55.4; }
        frame 116 { x: 55.6; skew-y: 10; scale-y: 1.11; }
        frame 117 { x: 55.7; skew-y: -10000; scale-y: -10000; }
        frame 118 { x: 55.8; skew-y: 10.1; }
        frame 119 { x: 56; skew-y: 10.3; scale-x: 0.792; }
        frame 120 { x: -10000; skew-y: -10000; scale-x: -10000; scale-y: 1.111; }
        frame 121 { x: 56.1; scale-y: -10000; }
        frame 122 { x: 56.4; skew-y: 10.5; }
        frame 123 { x: 56.5; skew-y: -10000; scale-y: 1.112; }
        frame 124 { x: -10000; skew-y: 10.6; scale-y: -10000; }
        frame 125 { x: 56.8; skew-y: 10.8; }
        frame 126 { x: -10000; skew-y: -10000; scale-x: 0.791; }
        frame 127 { x: 56.9; scale-x: -10000; scale-y: 1.113; }
        frame 128 { x: 57.2; skew-y: 11; scale-y: -10000; }
        frame 129 { x: 57.3; skew-y: 11.1; scale-y: 1.114; }
        frame 130 { x: 47.2; y: 34.5; skew-x: 1.8; skew-y: 4; scale-x: 0.795; scale-y: 1.046; }
        frame 131 { x: 38; y: 43.8; skew-x: -2.9; skew-y: -2.9; scale-x: 0.799; scale-y: 0.979; }
        frame 132 { x: 31.7; y: 46.1; skew-x: -9.7; skew-y: -8.5; scale-x: 0.789; scale-y: 0.99; }
        frame 133 { x: 25.5; y: 48.8; skew-x: -16.7; skew-y: -14.2; scale-x: 0.78; scale-y: 1.001; }
        frame 134 { x: 19.4; y: 51.5; skew-x: -23.6; skew-y: -19.9; scale-x: 0.772; scale-y: 1.013; }
        frame 135 { x: 26.1; y: 49; skew-x: -18.2; skew-y: -13.9; scale-x: 0.779; scale-y: 1.004; }
        frame 136 { x: 32.8; y: 46.9; skew-x: -13.2; skew-y: -7.9; scale-x: 0.787; scale-y: 0.996; }
        frame 137 { x: 39.6; y: 45; skew-x: -7.9; skew-y: -1.9; scale-x: 0.796; scale-y: 0.988; }
        frame 138 { x: 46.6; y: 43.8; skew-x: -2.9; skew-y: 3.9; scale-x: 0.804; scale-y: 0.98; }
        frame 139 { x: 37.4; y: 45.9; skew-x: -9.7; skew-y: -3.5; scale-x: 0.795; scale-y: 0.988; }
        frame 140 { x: 28.2; y: 48.4; skew-x: -16.5; skew-y: -11.2; scale-x: 0.786; scale-y: 0.997; }
        frame 141 { x: 19.3; y: 51.5; skew-x: -23.3; skew-y: -18.7; scale-x: 0.778; scale-y: 1.006; }
        frame 142 { x: 28.2; y: 48.4; skew-x: -16.5; skew-y: -11.2; scale-x: 0.786; scale-y: 0.997; }
        frame 143 { x: 37.4; y: 45.8; skew-x: -9.7; skew-y: -3.5; scale-x: 0.795; scale-y: 0.988; }
        frame 144 { x: 46.6; y: 43.8; skew-x: -2.9; skew-y: 3.9; scale-x: 0.804; scale-y: 0.98; }
        frame 145 { x: 61.9; y: 44.5; skew-x: 5; skew-y: 15.5; scale-x: 0.806; scale-y: 0.989; }
        frame 146 { x: 77.3; y: 46.8; skew-x: 13.1; skew-y: 27.3; scale-x: 0.808; scale-y: 0.999; }
        frame 147 { x: 92.5; y: 50.3; skew-x: 21.3; skew-y: 39.1; scale-x: 0.811; scale-y: 1.01; }
        frame 148 { x: 88.9; y: 50.5; skew-x: 18; skew-y: 35.8; scale-x: 0.81; scale-y: 1.008; }
        frame 149 { x: 85.2; y: 50.7; skew-x: 14.8; skew-y: 32.6; scale-x: -10000; scale-y: -10000; }
        frame 150 { x: 81.6; y: 51; skew-x: 11.5; skew-y: 29.3; scale-x: 0.811; scale-y: 1.009; }
        frame 151 { x: 83.3; y: 60.2; skew-x: 14.8; skew-y: 32.6; scale-x: 0.81; scale-y: 1.008; }
        frame 152 { x: 84.8; y: 69.5; skew-x: 18; skew-y: 35.8; scale-x: -10000; scale-y: -10000; }
        frame 153 { x: 86.5; y: 78.7; skew-x: 21.3; skew-y: 39.1; scale-x: 0.811; scale-y: 1.01; }
        frame 154 { x: 85.8; y: 88.8; skew-x: -10000; skew-y: -10000; scale-x: 0.81; scale-y: 0.832; }
        frame 155 { x: 85.2; y: 98.8; scale-x: 0.811; scale-y: 0.657; }
        frame 156 { x: -10000; y: -10000; scale-x: 0.81; scale-y: 0.656; }
        frame 157 { scale-x: 0.811; scale-y: 0.657; }
        frame 158 { scale-x: 0.81; scale-y: 0.656; }
        frame 159 { scale-x: -10000; scale-y: -10000; }
        frame 163 { scale-x: 0.811; scale-y: 0.657; }
        frame 164 { scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Driver_brain";
        frame-count: 187;
        frame 0 { cel: -1; }
        frame 1 { x: 8.3; y: 20.8; skew-x: -5.7; skew-y: -5.7; scale-x: 0.799; scale-y: 0.799; cel: 0; image: IMAGE_REANIM_ZOMBIE_BOSSDRIVER_BRAIN; }
        frame 2 { x: 7.4; y: 20; skew-x: -10000; skew-y: -5.4; scale-x: 0.829; scale-y: 0.829; cel: -10000; image: none; }
        frame 3 { x: 6.6; y: 19; skew-y: -10000; scale-x: 0.86; scale-y: 0.86; }
        frame 4 { x: 7; y: 19.3; skew-y: -5.2; scale-x: 0.849; scale-y: 0.849; }
        frame 5 { x: 7.2; y: 19.6; skew-y: -5.4; scale-x: 0.839; scale-y: 0.839; }
        frame 6 { x: 7.5; y: 19.8; skew-y: -10000; scale-x: 0.829; scale-y: 0.829; }
        frame 7 { x: 7.8; y: 20.1; skew-y: -5.5; scale-x: 0.819; scale-y: 0.819; }
        frame 8 { x: -10000; y: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -1; }
        frame 9 { x: 8.3; y: 20.8; skew-y: -5.7; scale-x: 0.799; scale-y: 0.799; cel: 0; }
        frame 10 { x: 8.7; y: 19.7; skew-x: -5.2; skew-y: -5.2; scale-x: 0.78; scale-y: 0.808; cel: -10000; }
        frame 11 { x: 9.2; y: 18.5; skew-x: -5; skew-y: -4.7; scale-x: 0.762; scale-y: 0.818; }
        frame 12 { x: 8.4; y: 19.7; skew-x: -5.7; skew-y: -5.4; scale-x: 0.769; scale-y: 0.814; }
        frame 13 { x: 7.6; y: 20.8; skew-x: -6.4; skew-y: -6.2; scale-x: 0.776; scale-y: 0.81; }
        frame 14 { x: 6.7; y: 22; skew-x: -7.2; skew-y: -7.2; scale-x: 0.784; scale-y: 0.806; }
        frame 15 { x: 6; y: 23.3; skew-x: -7.9; skew-y: -7.9; scale-x: 0.791; scale-y: 0.802; }
        frame 16 { x: 5.1; y: 24.5; skew-x: -8.8; skew-y: -8.8; scale-x: 0.799; scale-y: 0.799; }
        frame 17 { x: 4.8; y: 25.7; skew-x: -9.2; skew-y: -9.2; scale-x: 0.805; scale-y: 0.789; }
        frame 18 { x: 4.2; y: 27.1; skew-x: -10; skew-y: -10; scale-x: 0.812; scale-y: 0.78; }
        frame 19 { x: 5; y: 25.8; skew-x: -9; skew-y: -9; scale-x: 0.809; scale-y: 0.783; }
        frame 20 { x: 5.8; y: 24.6; skew-x: -8.2; skew-y: -8.2; scale-x: 0.806; scale-y: 0.787; }
        frame 21 { x: 6.7; y: 23.4; skew-x: -7.4; skew-y: -7.4; scale-x: 0.804; scale-y: 0.791; }
        frame 22 { x: 7.5; y: 22; skew-x: -6.4; skew-y: -6.4; scale-x: 0.801; scale-y: 0.795; }
        frame 23 { x: 8.3; y: 20.8; skew-x: -5.7; skew-y: -5.7; scale-x: 0.799; scale-y: 0.799; }
        frame 24 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 6.7; y: 22.4; skew-x: -7.5; skew-y: -9.2; scale-x: 0.798; }
        frame 26 { x: 5.1; y: 24.1; skew-x: -9.5; skew-y: -12.8; scale-x: 0.799; scale-y: 0.8; }
        frame 27 { x: 8; y: 22.7; skew-x: -7.7; skew-y: -10.2; scale-x: 0.798; scale-y: 0.799; }
        frame 28 { x: 10.8; y: 21.5; skew-x: -6.2; skew-y: -7.7; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 13.7; y: 20.2; skew-x: -4.4; skew-y: -5.4; scale-x: 0.799; }
        frame 30 { x: 16.6; y: 19; skew-x: -3; skew-y: -3; scale-x: -10000; }
        frame 31 { x: 18.9; y: 16.6; skew-x: -0.2; skew-y: 1; scale-x: 0.812; }
        frame 32 { x: 21.1; y: 14.3; skew-x: 2.3; skew-y: 5.3; scale-x: 0.825; scale-y: 0.8; }
        frame 33 { x: 17.9; y: 15.9; skew-x: 0.3; skew-y: 2.5; scale-x: 0.818; scale-y: 0.799; }
        frame 34 { x: 14.7; y: 17.6; skew-x: -1.7; skew-y: -0.2; scale-x: 0.812; scale-y: -10000; }
        frame 35 { x: 11.4; y: 19.2; skew-x: -3.7; skew-y: -2.9; scale-x: 0.805; }
        frame 36 { x: 8.3; y: 20.8; skew-x: -5.7; skew-y: -5.7; scale-x: 0.799; }
        frame 37 { x: 6.7; y: 22.4; skew-x: -7.5; skew-y: -9.2; scale-x: 0.798; }
        frame 38 { x: 5.1; y: 24.1; skew-x: -9.5; skew-y: -12.8; scale-x: 0.799; scale-y: 0.8; }
        frame 39 { x: 8; y: 22.7; skew-x: -7.7; skew-y: -10.2; scale-x: 0.798; scale-y: 0.799; }
        frame 40 { x: 10.8; y: 21.5; skew-x: -6.2; skew-y: -7.7; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 13.7; y: 20.2; skew-x: -4.4; skew-y: -5.4; scale-x: 0.799; }
        frame 42 { x: 16.6; y: 19; skew-x: -3; skew-y: -3; scale-x: -10000; }
        frame 43 { x: 18.2; y: 16.6; skew-x: -0.2; skew-y: 1; scale-x: 0.812; }
        frame 44 { x: 19.8; y: 14.3; skew-x: 2.3; skew-y: 5.3; scale-x: 0.825; scale-y: 0.8; }
        frame 45 { x: 16.9; y: 15.9; skew-x: 0.3; skew-y: 2.5; scale-x: 0.818; scale-y: 0.799; }
        frame 46 { x: 14; y: 17.5; skew-x: -1.7; skew-y: -0.2; scale-x: 0.812; scale-y: -10000; }
        frame 47 { x: 11.2; y: 19.2; skew-x: -3.7; skew-y: -2.9; scale-x: 0.805; }
        frame 48 { x: 8.3; y: 20.8; skew-x: -5.7; skew-y: -5.7; scale-x: 0.799; }
        frame 49 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; }
        frame 50 { x: 33; y: 14.4; skew-x: 10.3; skew-y: 12.5; scale-x: 0.798; scale-y: 0.827; }
        frame 51 { x: 59.6; y: 10.6; skew-x: 26.6; skew-y: 30.8; scale-x: 0.797; scale-y: 0.854; }
        frame 52 { x: 87.3; y: 9.9; skew-x: 42.8; skew-y: 49.4; scale-x: 0.796; scale-y: 0.882; }
        frame 53 { x: 114.8; y: 12.3; skew-x: 59; skew-y: 67.7; scale-x: -10000; scale-y: 0.912; }
        frame 54 { x: 108.2; y: 11.1; skew-x: 56.9; skew-y: 66.9; scale-x: 0.804; scale-y: 0.899; }
        frame 55 { x: 101.6; y: 10.1; skew-x: 54.9; skew-y: 66; scale-x: 0.813; scale-y: 0.888; }
        frame 56 { x: 95.1; y: 8.8; skew-x: 53; skew-y: 65.1; scale-x: 0.823; scale-y: 0.877; }
        frame 57 { x: 72.7; y: 8.1; skew-x: 38.3; skew-y: 47.4; scale-x: 0.815; scale-y: 0.856; }
        frame 58 { x: 50.2; y: 10; skew-x: 23.6; skew-y: 29.6; scale-x: 0.81; scale-y: 0.837; }
        frame 59 { x: 28.5; y: 14.3; skew-x: 8.8; skew-y: 11.8; scale-x: 0.805; scale-y: 0.818; }
        frame 60 { x: 8.3; y: 20.8; skew-x: -5.7; skew-y: -5.7; scale-x: 0.799; scale-y: 0.799; }
        frame 61 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 62 { x: 15.6; y: 15.9; skew-x: 3.3; skew-y: 3.3; }
        frame 63 { x: 23.6; y: 11.5; skew-x: 12.3; skew-y: 12.3; scale-x: 0.798; scale-y: 0.798; }
        frame 64 { x: 31.9; y: 7.7; skew-x: 21.3; skew-y: 21.3; scale-x: 0.797; scale-y: 0.797; }
        frame 65 { x: 40.7; y: 4.5; skew-x: 30.6; skew-y: 30.6; scale-x: -10000; scale-y: -10000; }
        frame 66 { x: -10000; y: 5.3; skew-x: -10000; skew-y: -10000; scale-x: 0.796; scale-y: 0.796; }
        frame 67 { y: 5.8; scale-x: 0.797; scale-y: 0.797; }
        frame 68 { y: 5.3; scale-x: 0.796; scale-y: 0.796; }
        frame 69 { y: 4.5; scale-x: 0.797; scale-y: 0.797; }
        frame 70 { y: 5.3; scale-x: 0.796; scale-y: 0.796; }
        frame 71 { y: 5.8; scale-x: 0.797; scale-y: 0.797; }
        frame 72 { y: 5.3; scale-x: 0.796; scale-y: 0.796; }
        frame 73 { y: 4.5; scale-x: 0.797; scale-y: 0.797; }
        frame 74 { y: 5.3; scale-x: 0.796; scale-y: 0.796; }
        frame 75 { y: 5.8; scale-x: 0.797; scale-y: 0.797; }
        frame 76 { y: 5.3; scale-x: 0.796; scale-y: 0.796; }
        frame 77 { y: 4.5; scale-x: 0.797; scale-y: 0.797; }
        frame 78 { y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 79 { x: 41.5; y: -4.3; skew-x: 25.5; skew-y: 25.5; }
        frame 80 { x: 42.4; y: -13.3; skew-x: 20.5; skew-y: 20.5; scale-x: 0.798; scale-y: 0.798; }
        frame 81 { x: 43.1; y: -13.6; skew-x: 21; skew-y: 21; scale-x: 0.796; scale-y: 0.803; }
        frame 82 { x: 43.8; y: -13.9; skew-x: 21.5; skew-y: 21.5; scale-x: -10000; scale-y: 0.809; }
        frame 83 { x: 44.5; y: -14.2; skew-x: 22; skew-y: 22; scale-x: 0.795; scale-y: 0.814; }
        frame 84 { x: 45.2; y: -14.5; skew-x: 22.6; skew-y: 22.5; scale-x: 0.794; scale-y: 0.82; }
        frame 85 { x: 45.9; y: -14.8; skew-x: 23.1; skew-y: 23; scale-x: -10000; scale-y: 0.826; }
        frame 86 { x: 46.6; y: -15.1; skew-x: 23.6; skew-y: 23.5; scale-x: 0.793; scale-y: 0.832; }
        frame 87 { x: 47.4; y: -15.4; skew-x: 24.1; skew-y: 24; scale-x: 0.792; scale-y: 0.837; }
        frame 88 { x: 48.1; y: -15.6; skew-x: 24.6; skew-y: 24.5; scale-x: -10000; scale-y: 0.843; }
        frame 89 { x: 48.9; y: -15.9; skew-x: 25.1; skew-y: 25; scale-x: 0.791; scale-y: 0.849; }
        frame 90 { x: 49.6; y: -16.2; skew-x: 25.6; skew-y: 25.5; scale-x: -10000; scale-y: 0.855; }
        frame 91 { x: 50.4; y: -16.4; skew-x: 26.1; skew-y: 26; scale-x: 0.79; scale-y: 0.86; }
        frame 92 { x: 51; y: -16.8; skew-x: 26.6; skew-y: 26.4; scale-x: 0.789; scale-y: 0.866; }
        frame 93 { x: 51.9; y: -17; skew-x: 27.1; skew-y: 26.9; scale-x: -10000; scale-y: 0.872; }
        frame 94 { x: 52.5; y: -17.2; skew-x: 27.6; skew-y: 27.4; scale-x: 0.788; scale-y: 0.878; }
        frame 95 { x: 53.4; y: -17.6; skew-x: 28.3; skew-y: 27.9; scale-x: 0.787; scale-y: 0.884; }
        frame 96 { x: 54.1; y: -17.7; skew-x: 28.8; skew-y: 28.4; scale-x: -10000; scale-y: 0.889; }
        frame 97 { x: 54.9; y: -18; skew-x: 29.3; skew-y: 28.9; scale-x: 0.786; scale-y: 0.895; }
        frame 98 { x: 55.6; y: -18.3; skew-x: 29.8; skew-y: 29.4; scale-x: 0.785; scale-y: 0.901; }
        frame 99 { x: 56.4; y: -18.5; skew-x: 30.3; skew-y: 29.9; scale-x: -10000; scale-y: 0.907; }
        frame 100 { x: 57.1; y: -18.8; skew-x: 30.8; skew-y: 30.4; scale-x: 0.784; scale-y: 0.912; }
        frame 101 { x: 58; y: -18.9; skew-x: 31.3; skew-y: 30.9; scale-x: -10000; scale-y: 0.918; }
        frame 102 { x: 58.6; y: -19.2; skew-x: 31.8; skew-y: 31.4; scale-x: 0.783; scale-y: 0.924; }
        frame 103 { x: 59.5; y: -19.4; skew-x: 32.3; skew-y: 31.9; scale-x: 0.782; scale-y: 0.93; }
        frame 104 { x: 60.3; y: -19.7; skew-x: 32.8; skew-y: 32.4; scale-x: -10000; scale-y: 0.935; }
        frame 105 { x: 61; y: -19.8; skew-x: 33.4; skew-y: 32.9; scale-x: 0.781; scale-y: 0.941; }
        frame 106 { x: 61.8; y: -20; skew-x: 33.9; skew-y: 33.4; scale-x: 0.78; scale-y: 0.947; }
        frame 107 { x: 62.6; y: -20.3; skew-x: 34.4; skew-y: 33.9; scale-x: -10000; scale-y: 0.953; }
        frame 108 { x: 63.5; y: -20.4; skew-x: 34.9; skew-y: 34.4; scale-x: 0.779; scale-y: 0.959; }
        frame 109 { x: 64.2; y: -20.6; skew-x: 35.4; skew-y: 34.9; scale-x: 0.778; scale-y: 0.964; }
        frame 110 { x: 65.1; y: -20.9; skew-x: 36.1; skew-y: 35.4; scale-x: -10000; scale-y: 0.97; }
        frame 111 { x: 65.8; y: -21; skew-x: 36.6; skew-y: 35.9; scale-x: 0.777; scale-y: 0.976; }
        frame 112 { x: 66.7; y: -21.2; skew-x: 37.1; skew-y: 36.4; scale-x: -10000; scale-y: 0.982; }
        frame 113 { x: 67.5; y: -21.5; skew-x: 37.6; skew-y: 36.9; scale-x: 0.776; scale-y: 0.987; }
        frame 114 { x: 68.3; y: -10000; skew-x: 38.1; skew-y: 37.4; scale-x: 0.775; scale-y: 0.993; }
        frame 115 { x: 69.1; y: -21.7; skew-x: 38.6; skew-y: 37.9; scale-x: -10000; scale-y: 0.999; }
        frame 116 { x: 69.8; y: -21.9; skew-x: 39.1; skew-y: 38.4; scale-x: 0.774; scale-y: 1.005; }
        frame 117 { x: 70.7; y: -22.1; skew-x: 39.6; skew-y: 38.9; scale-x: 0.773; scale-y: 1.011; }
        frame 118 { x: 71.5; y: -22.2; skew-x: 40.1; skew-y: 39.4; scale-x: -10000; scale-y: 1.016; }
        frame 119 { x: 72.3; y: -22.3; skew-x: 40.6; skew-y: 39.9; scale-x: 0.772; scale-y: 1.022; }
        frame 120 { x: 73.1; y: -22.4; skew-x: 41.1; skew-y: 40.4; scale-x: 0.771; scale-y: 1.028; }
        frame 121 { x: 74; y: -22.6; skew-x: 41.6; skew-y: 40.9; scale-x: -10000; scale-y: 1.034; }
        frame 122 { x: 74.8; y: -22.8; skew-x: 42.1; skew-y: 41.4; scale-x: 0.77; scale-y: 1.039; }
        frame 123 { x: 75.7; y: -22.9; skew-x: 42.6; skew-y: 41.9; scale-x: -10000; scale-y: 1.045; }
        frame 124 { x: 76.5; y: -23; skew-x: 43.1; skew-y: 42.4; scale-x: 0.769; scale-y: 1.051; }
        frame 125 { x: 77.3; y: -23.1; skew-x: 43.6; skew-y: 42.9; scale-x: 0.768; scale-y: 1.057; }
        frame 126 { x: 78.1; y: -23.2; skew-x: 44.3; skew-y: 43.4; scale-x: -10000; scale-y: 1.063; }
        frame 127 { x: 78.9; y: -23.4; skew-x: 44.9; skew-y: 43.9; scale-x: 0.767; scale-y: 1.068; }
        frame 128 { x: 79.8; y: -23.5; skew-x: 45.4; skew-y: 44.4; scale-x: 0.766; scale-y: 1.074; }
        frame 129 { x: 80.7; y: -23.6; skew-x: 45.8; skew-y: 44.9; scale-x: 0.767; scale-y: 1.082; }
        frame 130 { x: 60.4; y: -9.9; skew-x: 38.1; skew-y: 37.8; scale-x: 0.781; scale-y: 0.938; }
        frame 131 { x: 40.7; y: 4.5; skew-x: 30.6; skew-y: 30.6; scale-x: 0.797; scale-y: 0.797; }
        frame 132 { x: 23.7; y: 15.1; skew-x: 11.5; skew-y: 13.3; scale-x: 0.774; scale-y: 0.793; }
        frame 133 { x: 8.9; y: 27.3; skew-x: -7.2; skew-y: -3.7; scale-x: 0.751; scale-y: 0.789; }
        frame 134 { x: -9.6; y: 41.9; skew-x: -26.2; skew-y: -20.9; scale-x: 0.805; scale-y: 0.785; }
        frame 135 { x: -9.1; y: 36.6; skew-x: -20.2; skew-y: -24.2; scale-x: 0.773; scale-y: 0.8; }
        frame 136 { x: -8.1; y: 31.5; skew-x: -14.4; skew-y: -27.5; scale-x: 0.744; scale-y: 0.817; }
        frame 137 { x: 21.1; y: 14.7; skew-x: 8.8; skew-y: 3.8; scale-x: 0.749; scale-y: 0.83; }
        frame 138 { x: 54; y: 4.5; skew-x: 32.5; skew-y: 35.4; scale-x: 0.756; scale-y: 0.843; }
        frame 139 { x: 34; y: 11.2; skew-x: 17.8; skew-y: 21.8; scale-x: 0.775; scale-y: 0.82; }
        frame 140 { x: 15.2; y: 20; skew-x: 3.2; skew-y: 8.5; scale-x: 0.795; scale-y: 0.799; }
        frame 141 { x: -13.5; y: 41.8; skew-x: -25.9; skew-y: -28.4; scale-x: 0.774; scale-y: 0.818; }
        frame 142 { x: 0.2; y: 23.4; skew-x: -7.4; skew-y: -13.4; scale-x: 0.767; scale-y: 0.857; }
        frame 143 { x: 17.3; y: 6.1; skew-x: 10.8; skew-y: 1.2; scale-x: 0.761; scale-y: 0.898; }
        frame 144 { x: 54; y: 4.5; skew-x: 32.5; skew-y: 35.4; scale-x: 0.756; scale-y: 0.843; }
        frame 145 { x: 77.8; y: 9.4; skew-x: 42.3; skew-y: 47.6; scale-x: 0.719; scale-y: 0.869; }
        frame 146 { x: 101.3; y: 15.9; skew-x: 52.1; skew-y: 59.7; scale-x: 0.684; scale-y: 0.897; }
        frame 147 { x: 123.8; y: 23.9; skew-x: 61.9; skew-y: 71.8; scale-x: 0.649; scale-y: 0.926; }
        frame 148 { x: 124.6; y: 23.8; skew-x: 63.1; skew-y: 73.7; scale-x: 0.645; scale-y: 0.962; }
        frame 149 { x: 125.2; y: 23.7; skew-x: 64.2; skew-y: 75.4; scale-x: 0.642; scale-y: 0.998; }
        frame 150 { x: 125.9; y: 23.6; skew-x: 65.2; skew-y: 77.1; scale-x: 0.639; scale-y: 1.036; }
        frame 151 { x: 103.3; y: -10000; skew-x: 45.8; skew-y: 48.1; scale-x: 0.659; scale-y: 0.957; }
        frame 152 { x: 78.7; y: 31; skew-x: 26.3; skew-y: 19; scale-x: 0.68; scale-y: 0.881; }
        frame 153 { x: 71.5; y: 44.1; skew-x: 21.7; skew-y: 18.7; scale-x: 0.687; scale-y: 0.815; }
        frame 154 { x: 61.5; y: 59.1; skew-x: 9; skew-y: 6.1; scale-x: 0.692; scale-y: 0.747; }
        frame 155 { x: 53.4; y: 75.3; skew-x: -3.3; skew-y: -6.2; scale-x: 0.697; scale-y: 0.68; }
        frame 156 { x: 57; y: 86.4; skew-x: 1; skew-y: -1.7; scale-x: 0.692; scale-y: 0.747; }
        frame 157 { x: 61.1; y: 97.6; skew-x: 5.7; skew-y: 2.7; scale-x: 0.687; scale-y: 0.814; }
        frame 158 { x: 61; y: 97.7; skew-x: 5.5; skew-y: 2.6; scale-x: -10000; scale-y: -10000; }
        frame 159 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 163 { x: 61.1; y: 97.6; skew-x: 5.7; skew-y: 2.7; }
        frame 164 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
    }
    Track {
        source-name: "Driver_face";
        frame-count: 187;
        frame 0 { cel: -1; }
        frame 1 { x: 9.7; y: 44.1; skew-x: -5.7; skew-y: -5.7; scale-x: 0.799; scale-y: 0.799; cel: 0; image: IMAGE_REANIM_ZOMBIE_BOSSDRIVER_FACE; }
        frame 2 { x: 9.3; y: -10000; skew-x: -10000; skew-y: -6.4; scale-x: 0.804; scale-y: -10000; cel: -10000; image: none; }
        frame 3 { x: 8.8; skew-y: -7.3; scale-x: 0.809; }
        frame 4 { x: 9.1; skew-y: -6.7; scale-x: 0.806; }
        frame 5 { x: 9.4; y: 44; skew-y: -6.4; scale-x: 0.804; }
        frame 6 { x: 9.5; y: 44.1; skew-y: -6; scale-x: 0.801; }
        frame 7 { x: 9.7; y: -10000; skew-y: -5.7; scale-x: 0.799; }
        frame 8 { x: -10000; skew-y: -10000; scale-x: -10000; cel: -1; }
        frame 9 { cel: 0; }
        frame 10 { x: 9.8; y: 43.7; skew-x: -5.9; scale-x: 0.79; scale-y: 0.798; cel: -10000; }
        frame 11 { x: 9.9; y: 43.3; skew-x: -6.1; skew-y: -5.8; scale-x: 0.782; scale-y: -10000; }
        frame 12 { x: 9.4; y: 44.1; skew-x: -6.5; skew-y: -6.4; scale-x: 0.785; }
        frame 13 { x: 9; y: 45.1; skew-x: -7.2; skew-y: -6.9; scale-x: 0.789; }
        frame 14 { x: 8.6; y: 46; skew-x: -7.7; skew-y: -7.5; scale-x: 0.792; }
        frame 15 { x: 8.1; y: 46.8; skew-x: -8.2; skew-y: -8.2; scale-x: 0.795; }
        frame 16 { x: 7.8; y: 47.6; skew-x: -8.8; skew-y: -8.8; scale-x: 0.799; scale-y: 0.799; }
        frame 17 { x: 7.7; y: 48.1; skew-x: -9.2; skew-y: -9.2; scale-x: 0.798; scale-y: 0.798; }
        frame 18 { x: 7.5; y: 48.5; skew-x: -10; skew-y: -10; scale-x: -10000; scale-y: -10000; }
        frame 19 { x: 8; y: 47.6; skew-x: -9; skew-y: -9; }
        frame 20 { x: 8.4; y: 46.7; skew-x: -8.2; skew-y: -8.2; }
        frame 21 { x: 8.8; y: 45.9; skew-x: -7.4; skew-y: -7.4; }
        frame 22 { x: 9.2; y: 44.8; skew-x: -6.4; skew-y: -6.4; scale-x: 0.799; scale-y: 0.799; }
        frame 23 { x: 9.7; y: 44.1; skew-x: -5.7; skew-y: -5.7; scale-x: -10000; scale-y: -10000; }
        frame 24 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 25 { x: 10.1; y: 45.4; skew-x: -7.5; skew-y: -7.5; scale-x: 0.798; scale-y: 0.798; }
        frame 26 { x: 10.4; y: 46.9; skew-x: -9.5; skew-y: -9.5; scale-x: 0.799; scale-y: 0.799; }
        frame 27 { x: 12; y: 45.7; skew-x: -7.7; skew-y: -7.7; scale-x: 0.798; scale-y: 0.798; }
        frame 28 { x: 13.6; y: 44.6; skew-x: -6.2; skew-y: -6.2; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 15.2; y: 43.4; skew-x: -4.4; skew-y: -4.4; scale-x: 0.799; scale-y: 0.799; }
        frame 30 { x: 16.9; y: 42.3; skew-x: -3; skew-y: -3; scale-x: -10000; scale-y: -10000; }
        frame 31 { x: 17.4; y: 39.8; skew-x: -0.2; skew-y: -0.2; }
        frame 32 { x: 17.8; y: 37.4; skew-x: 2.3; skew-y: 2.3; scale-x: 0.798; scale-y: 0.798; }
        frame 33 { x: 15.8; y: 39; skew-x: 0.3; skew-y: 0.3; scale-x: 0.799; scale-y: 0.799; }
        frame 34 { x: 13.7; y: 40.8; skew-x: -1.7; skew-y: -1.7; scale-x: -10000; scale-y: -10000; }
        frame 35 { x: 11.7; y: 42.5; skew-x: -3.7; skew-y: -3.7; }
        frame 36 { x: 9.7; y: 44.1; skew-x: -5.7; skew-y: -5.7; }
        frame 37 { x: 10.1; y: 45.4; skew-x: -7.5; skew-y: -7.5; scale-x: 0.798; scale-y: 0.798; }
        frame 38 { x: 10.4; y: 46.9; skew-x: -9.5; skew-y: -9.5; scale-x: 0.799; scale-y: 0.799; }
        frame 39 { x: 12; y: 45.7; skew-x: -7.7; skew-y: -7.7; scale-x: 0.798; scale-y: 0.798; }
        frame 40 { x: 13.6; y: 44.6; skew-x: -6.2; skew-y: -6.2; scale-x: -10000; scale-y: -10000; }
        frame 41 { x: 15.2; y: 43.4; skew-x: -4.4; skew-y: -4.4; scale-x: 0.799; scale-y: 0.799; }
        frame 42 { x: 16.9; y: 42.3; skew-x: -3; skew-y: -3; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: 16.8; y: 39.8; skew-x: -0.2; skew-y: -0.2; }
        frame 44 { x: 16.6; y: 37.4; skew-x: 2.3; skew-y: 2.3; scale-x: 0.798; scale-y: 0.798; }
        frame 45 { x: 14.8; y: 39; skew-x: 0.3; skew-y: 0.3; scale-x: 0.799; scale-y: 0.799; }
        frame 46 { x: 13.1; y: 40.7; skew-x: -1.7; skew-y: -1.7; scale-x: -10000; scale-y: -10000; }
        frame 47 { x: 11.4; y: 42.4; skew-x: -3.7; skew-y: -3.7; }
        frame 48 { x: 9.7; y: 44.1; skew-x: -5.7; skew-y: -5.7; }
        frame 49 { x: 10.4; y: 42.1; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_BOSSDRIVER_FACE2; }
        frame 50 { x: 29.1; y: 34.1; skew-x: 16.5; skew-y: 16.5; scale-x: 0.799; scale-y: 0.799; image: none; }
        frame 51 { x: 49.1; y: 28.1; skew-x: 33.1; skew-y: 33.1; scale-x: 0.798; scale-y: 0.798; }
        frame 52 { x: 69.6; y: 23.8; skew-x: 49.6; skew-y: 49.6; scale-x: 0.797; scale-y: 0.797; }
        frame 53 { x: 90; y: 21.8; skew-x: 66.2; skew-y: 66.2; scale-x: 0.798; scale-y: 0.798; }
        frame 54 { x: 84.8; y: 20.4; skew-x: -10000; skew-y: -10000; scale-x: 0.797; scale-y: 0.797; }
        frame 55 { x: 79.6; y: 19; scale-x: -10000; scale-y: -10000; }
        frame 56 { x: 74.3; y: 17.6; scale-x: 0.798; scale-y: 0.798; }
        frame 57 { x: 56.6; y: 21.8; skew-x: 47.6; skew-y: 47.6; scale-x: 0.797; scale-y: 0.797; }
        frame 58 { x: 39; y: 28.8; skew-x: 28.8; skew-y: 28.8; scale-x: 0.798; scale-y: 0.798; }
        frame 59 { x: 22.4; y: 37.9; skew-x: 10.3; skew-y: 10.3; scale-x: 0.8; scale-y: 0.8; }
        frame 60 { x: 9.7; y: 44.1; skew-x: -5.7; skew-y: -5.7; scale-x: 0.799; scale-y: 0.799; image: IMAGE_REANIM_ZOMBIE_BOSSDRIVER_FACE; }
        frame 61 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 62 { x: 13.6; y: 38.3; skew-x: 3.3; skew-y: 3.3; }
        frame 63 { x: 18.1; y: 33.1; skew-x: 12.3; skew-y: 12.3; scale-x: 0.798; scale-y: 0.798; }
        frame 64 { x: 22.8; y: 28.3; skew-x: 21.3; skew-y: 21.3; scale-x: 0.797; scale-y: 0.797; }
        frame 65 { x: 28; y: 24.1; skew-x: 30.6; skew-y: 30.6; scale-x: -10000; scale-y: -10000; }
        frame 66 { x: -10000; y: 24.9; skew-x: -10000; skew-y: -10000; scale-x: 0.796; scale-y: 0.796; }
        frame 67 { y: 25.5; scale-x: 0.797; scale-y: 0.797; }
        frame 68 { y: 24.9; scale-x: 0.796; scale-y: 0.796; }
        frame 69 { y: 24.1; scale-x: 0.797; scale-y: 0.797; }
        frame 70 { y: 24.9; scale-x: 0.796; scale-y: 0.796; }
        frame 71 { y: 25.5; scale-x: 0.797; scale-y: 0.797; }
        frame 72 { y: 24.9; scale-x: 0.796; scale-y: 0.796; }
        frame 73 { y: 24.1; scale-x: 0.797; scale-y: 0.797; }
        frame 74 { y: 24.9; scale-x: 0.796; scale-y: 0.796; }
        frame 75 { y: 25.5; scale-x: 0.797; scale-y: 0.797; }
        frame 76 { y: 24.9; scale-x: 0.796; scale-y: 0.796; }
        frame 77 { y: 24.1; scale-x: 0.797; scale-y: 0.797; }
        frame 78 { x: 28.3; y: 24.3; skew-x: 31.8; skew-y: 31.8; scale-x: 0.799; scale-y: 0.799; image: IMAGE_REANIM_ZOMBIE_BOSSDRIVER_FACE2; }
        frame 79 { x: 31.1; y: 15.7; skew-x: 27; skew-y: 27; scale-x: 0.797; scale-y: 0.797; image: none; }
        frame 80 { x: 34; y: 7.1; skew-x: 22.2; skew-y: 22.2; scale-x: 0.798; scale-y: 0.798; }
        frame 81 { x: 34.4; y: 6.9; skew-x: 22.6; skew-y: 22.6; scale-x: 0.797; scale-y: 0.797; }
        frame 82 { x: 34.9; y: 6.8; skew-x: 23; skew-y: 23; scale-x: -10000; scale-y: -10000; }
        frame 83 { x: 35.2; y: 6.7; skew-x: 23.3; skew-y: 23.3; }
        frame 84 { x: 35.5; y: 6.6; skew-x: 23.8; skew-y: 23.8; }
        frame 85 { x: 36; y: 6.5; skew-x: 24.3; skew-y: 24.3; }
        frame 86 { x: 36.3; y: -10000; skew-x: 24.6; skew-y: 24.6; }
        frame 87 { x: 36.8; y: 6.3; skew-x: 25.1; skew-y: 25.1; }
        frame 88 { x: 37.3; y: 6.2; skew-x: 25.5; skew-y: 25.5; }
        frame 89 { x: 37.6; y: -10000; skew-x: 25.8; skew-y: 25.8; }
        frame 90 { x: 38; y: 6; skew-x: 26.3; skew-y: 26.3; }
        frame 91 { x: 38.4; y: 5.9; skew-x: 26.6; skew-y: 26.6; }
        frame 92 { x: 38.8; y: 5.8; skew-x: 27.1; skew-y: 27.1; }
        frame 93 { x: 39.3; y: 5.7; skew-x: 27.6; skew-y: 27.6; }
        frame 94 { x: 39.6; y: 5.6; skew-x: 27.8; skew-y: 27.8; }
        frame 95 { x: 40.1; y: 5.5; skew-x: 28.3; skew-y: 28.3; }
        frame 96 { x: 40.5; y: 5.4; skew-x: 28.8; skew-y: 28.8; }
        frame 97 { x: 40.9; y: 5.3; skew-x: 29.1; skew-y: 29.1; }
        frame 98 { x: 41.3; y: 5.2; skew-x: 29.6; skew-y: 29.6; }
        frame 99 { x: 41.7; y: 5.1; skew-x: 30.1; skew-y: 30.1; }
        frame 100 { x: 42.1; y: 5; skew-x: 30.3; skew-y: 30.3; }
        frame 101 { x: 42.5; y: 4.8; skew-x: 30.8; skew-y: 30.8; }
        frame 102 { x: 43; y: -10000; skew-x: 31.1; skew-y: 31.1; }
        frame 103 { x: 43.4; y: 4.7; skew-x: 31.6; skew-y: 31.6; }
        frame 104 { x: 43.9; y: 4.6; skew-x: 32.1; skew-y: 32.1; scale-x: 0.796; scale-y: 0.796; }
        frame 105 { x: 44.1; y: -10000; skew-x: 32.4; skew-y: 32.4; scale-x: -10000; scale-y: -10000; }
        frame 106 { x: 44.6; y: 4.5; skew-x: 32.8; skew-y: 32.8; }
        frame 107 { x: 45.1; y: 4.3; skew-x: 33.3; skew-y: 33.3; }
        frame 108 { x: 45.4; y: -10000; skew-x: 33.6; skew-y: 33.6; }
        frame 109 { x: 45.9; y: 4.2; skew-x: 34.1; skew-y: 34.1; }
        frame 110 { x: 46.4; y: 4.1; skew-x: 34.6; skew-y: 34.6; }
        frame 111 { x: 46.7; y: 4; skew-x: 34.9; skew-y: 34.9; }
        frame 112 { x: 47.1; skew-x: 35.3; skew-y: 35.3; }
        frame 113 { x: 47.5; y: 3.9; skew-x: 35.6; skew-y: 35.6; }
        frame 114 { x: 47.9; y: 3.8; skew-x: 36.1; skew-y: 36.1; }
        frame 115 { x: 48.4; y: 3.6; skew-x: 36.6; skew-y: 36.6; }
        frame 116 { x: 48.8; y: -10000; skew-x: 36.9; skew-y: 36.9; }
        frame 117 { x: 49.2; skew-x: 37.4; skew-y: 37.4; }
        frame 118 { x: 49.6; y: 3.5; skew-x: 37.8; skew-y: 37.8; }
        frame 119 { x: 50; y: 3.4; skew-x: 38.1; skew-y: 38.1; }
        frame 120 { x: 50.5; y: -10000; skew-x: 38.6; skew-y: 38.6; }
        frame 121 { x: 51; y: 3.3; skew-x: 39.1; skew-y: 39.1; }
        frame 122 { x: 51.3; y: -10000; skew-x: 39.4; skew-y: 39.4; }
        frame 123 { x: 51.8; y: 3.1; skew-x: 39.8; skew-y: 39.8; }
        frame 124 { x: 52.3; y: 3; skew-x: 40.3; skew-y: 40.3; }
        frame 125 { x: 52.6; y: -10000; skew-x: 40.6; skew-y: 40.6; }
        frame 126 { x: 53; y: 3; skew-x: 41.1; skew-y: 41.1; }
        frame 127 { x: 53.5; y: 2.9; skew-x: 41.4; skew-y: 41.4; }
        frame 128 { x: 53.9; y: -10000; skew-x: 41.9; skew-y: 41.9; }
        frame 129 { x: 54.3; y: 2.7; skew-x: 42.3; skew-y: 42.3; scale-x: 0.797; scale-y: 0.797; }
        frame 130 { x: 40.3; y: 14.3; skew-x: 30.6; skew-y: 30.8; scale-x: 0.796; scale-y: 0.788; }
        frame 131 { x: 26.7; y: 26.9; skew-x: 18.8; skew-y: 19.5; scale-x: 0.798; scale-y: 0.78; }
        frame 132 { x: 17.4; y: 38.6; skew-x: 3.8; skew-y: 3.1; scale-x: 0.771; scale-y: 0.76; }
        frame 133 { x: 9.8; y: 51.4; skew-x: -11.2; skew-y: -12.9; scale-x: 0.745; scale-y: 0.739; }
        frame 134 { x: -2.2; y: 63.3; skew-x: -26.2; skew-y: -29.2; scale-x: 0.719; scale-y: 0.719; }
        frame 135 { x: -0; y: 57.9; skew-x: -21.2; skew-y: -28.2; scale-x: -10000; scale-y: 0.725; }
        frame 136 { x: 2.3; y: 52.5; skew-x: -16.4; skew-y: -27.1; scale-x: 0.72; scale-y: 0.733; }
        frame 137 { x: 19.9; y: 34.6; skew-x: 7.8; skew-y: 4; scale-x: -10000; scale-y: 0.726; }
        frame 138 { x: 41; y: 22.6; skew-x: 32.5; skew-y: 35.4; scale-y: 0.719; }
        frame 139 { x: 25.8; y: 30.1; skew-x: 17.8; skew-y: 19.1; scale-x: 0.719; scale-y: -10000; }
        frame 140 { x: 11.6; y: 39.3; skew-x: 3.1; skew-y: 3.1; scale-x: 0.72; scale-y: 0.72; }
        frame 141 { x: -2.6; y: 63; skew-x: -25.9; skew-y: -28.4; scale-x: -10000; scale-y: -10000; }
        frame 142 { x: 5.8; y: 46.8; skew-x: -6.4; skew-y: -10.7; scale-x: 0.73; scale-y: 0.721; }
        frame 143 { x: 17.2; y: 31.8; skew-x: 12.8; skew-y: 6.8; scale-x: 0.74; scale-y: 0.724; }
        frame 144 { x: 37; y: 28.6; skew-x: 23.1; skew-y: 22.1; scale-x: 0.732; scale-y: 0.721; }
        frame 145 { x: 56.8; y: 27.1; skew-x: 33.6; skew-y: 37.4; scale-x: 0.726; scale-y: 0.72; }
        frame 146 { x: 75.7; y: 29.9; skew-x: 42.6; skew-y: 55.2; scale-x: 0.683; scale-y: 0.748; }
        frame 147 { x: 93.2; y: 34.6; skew-x: 51.5; skew-y: 72.9; scale-x: 0.643; scale-y: 0.778; }
        frame 148 { x: 92.2; y: 33.7; skew-x: 52.4; skew-y: 72.4; scale-x: 0.65; scale-y: 0.774; }
        frame 149 { x: 91.1; y: 32.8; skew-x: 53.2; skew-y: 71.9; scale-x: 0.658; scale-y: 0.771; }
        frame 150 { x: 90.1; y: 31.7; skew-x: 54.1; skew-y: 71.3; scale-x: 0.666; scale-y: 0.768; }
        frame 151 { x: 80.2; y: 43.5; skew-x: 39.8; skew-y: 52.9; scale-x: 0.698; scale-y: 0.733; }
        frame 152 { x: 69.8; y: 57.9; skew-x: 25.6; skew-y: 34.2; scale-x: 0.732; scale-y: 0.701; }
        frame 153 { x: 64.8; y: 70; skew-x: 17.8; skew-y: 25.6; scale-x: 0.727; scale-y: 0.706; }
        frame 154 { x: 60; y: 82.5; skew-x: 10.1; skew-y: 17.3; scale-x: 0.724; scale-y: 0.713; }
        frame 155 { x: 55.6; y: 95.4; skew-x: 2.6; skew-y: 8.8; scale-x: 0.72; scale-y: 0.72; }
        frame 156 { x: -10000; y: 103.3; skew-x: 2.5; skew-y: -10000; scale-x: -10000; scale-y: 0.719; }
        frame 157 { y: 111.2; skew-x: 2.6; scale-y: 0.72; }
        frame 158 { y: 111.3; skew-x: 2.5; scale-y: 0.719; }
        frame 159 { y: -10000; skew-x: -10000; scale-y: -10000; }
        frame 163 { y: 111.2; skew-x: 2.6; scale-y: 0.72; }
        frame 164 { y: -10000; skew-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Driver_jaw";
        frame-count: 187;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 9 { x: 24.7; y: 55.4; skew-x: -5.7; skew-y: -5.7; scale-x: 0.831; scale-y: 0.737; cel: 0; image: IMAGE_REANIM_ZOMBIE_BOSSDRIVER_JAW; }
        frame 10 { x: 24.8; y: 54.9; skew-x: -5.9; skew-y: -10000; scale-x: 0.818; scale-y: -10000; cel: -10000; image: none; }
        frame 11 { x: 24.9; y: 54.3; skew-x: -6.1; skew-y: -5.8; scale-x: 0.805; scale-y: 0.738; }
        frame 12 { x: 24.7; y: 54.9; skew-x: -6.5; skew-y: -6.4; scale-x: 0.803; scale-y: 0.76; }
        frame 13 { x: 24.6; y: 55.6; skew-x: -7.2; skew-y: -6.9; scale-x: 0.802; scale-y: 0.782; }
        frame 14 { x: 24.4; y: 56.3; skew-x: -7.7; skew-y: -7.5; scale-x: 0.801; scale-y: 0.804; }
        frame 15 { x: 24.3; y: 57; skew-x: -8.2; skew-y: -8.2; scale-x: 0.8; scale-y: 0.826; }
        frame 16 { x: 24.1; y: 57.9; skew-x: -8.8; skew-y: -8.8; scale-x: 0.799; scale-y: 0.848; }
        frame 17 { x: -10000; y: 58.7; skew-x: -9.2; skew-y: -9.2; scale-x: 0.803; scale-y: 0.843; }
        frame 18 { x: 23.9; y: 59.4; skew-x: -10; skew-y: -10; scale-x: 0.808; scale-y: 0.84; }
        frame 19 { x: 24.2; y: 58.5; skew-x: -9; skew-y: -9; scale-x: 0.812; scale-y: 0.819; }
        frame 20 { x: 24.3; y: 57.8; skew-x: -8.2; skew-y: -8.2; scale-x: 0.817; scale-y: 0.798; }
        frame 21 { x: 24.5; y: 57; skew-x: -7.4; skew-y: -7.4; scale-x: 0.821; scale-y: 0.778; }
        frame 22 { x: 24.7; y: 56.2; skew-x: -6.4; skew-y: -6.4; scale-x: 0.826; scale-y: 0.757; }
        frame 23 { x: -10000; y: 55.4; skew-x: -5.7; skew-y: -5.7; scale-x: 0.831; scale-y: 0.737; }
        frame 24 { y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 26; y: 56; skew-x: -7.5; skew-y: -3.9; scale-x: 0.83; scale-y: 0.74; }
        frame 26 { x: 27.2; y: 56.8; skew-x: -9.5; skew-y: -2.1; scale-x: 0.831; scale-y: 0.743; }
        frame 27 { x: 28.3; y: 56.1; skew-x: -7.7; skew-y: -2.2; scale-x: 0.83; scale-y: 0.741; }
        frame 28 { x: 29.3; y: 55.6; skew-x: -6.2; skew-y: -2.4; scale-x: 0.831; scale-y: 0.74; }
        frame 29 { x: 30.3; y: 54.9; skew-x: -4.4; skew-y: -2.7; scale-x: -10000; scale-y: 0.738; }
        frame 30 { x: 31.3; y: 54.3; skew-x: -3; skew-y: -3; scale-y: 0.737; }
        frame 31 { x: 31; y: 53.2; skew-x: -0.2; skew-y: -0.2; scale-y: 0.763; }
        frame 32 { x: 30.8; y: 52.2; skew-x: 2.3; skew-y: 2.3; scale-y: 0.789; }
        frame 33 { x: 29.1; y: 53; skew-x: 0.3; skew-y: 0.1; scale-y: 0.776; }
        frame 34 { x: 27.7; y: 53.9; skew-x: -1.7; skew-y: -1.7; scale-y: 0.763; }
        frame 35 { x: 26.1; y: 54.5; skew-x: -3.7; skew-y: -3.7; scale-y: 0.75; }
        frame 36 { x: 24.7; y: 55.4; skew-x: -5.7; skew-y: -5.7; scale-y: 0.737; }
        frame 37 { x: 26; y: 56; skew-x: -7.5; skew-y: -3.9; scale-x: 0.83; scale-y: 0.74; }
        frame 38 { x: 27.2; y: 56.8; skew-x: -9.5; skew-y: -2.1; scale-x: 0.831; scale-y: 0.743; }
        frame 39 { x: 28.3; y: 56.1; skew-x: -7.7; skew-y: -2.2; scale-x: 0.83; scale-y: 0.741; }
        frame 40 { x: 29.3; y: 55.6; skew-x: -6.2; skew-y: -2.4; scale-x: 0.831; scale-y: 0.74; }
        frame 41 { x: 30.3; y: 54.9; skew-x: -4.4; skew-y: -2.7; scale-x: -10000; scale-y: 0.738; }
        frame 42 { x: 31.3; y: 54.3; skew-x: -3; skew-y: -3; scale-y: 0.737; }
        frame 43 { x: 30.4; y: 53.2; skew-x: -0.2; skew-y: -0.2; scale-y: 0.763; }
        frame 44 { x: 29.5; y: 52.2; skew-x: 2.3; skew-y: 2.3; scale-y: 0.789; }
        frame 45 { x: 28.2; y: 53; skew-x: 0.3; skew-y: 0.1; scale-y: 0.776; }
        frame 46 { x: 27; y: 53.8; skew-x: -1.7; skew-y: -1.7; scale-y: 0.763; }
        frame 47 { x: 25.8; y: 54.6; skew-x: -3.7; skew-y: -3.7; scale-y: 0.75; }
        frame 48 { x: 24.7; y: 55.4; skew-x: -5.7; skew-y: -5.7; scale-y: 0.737; }
        frame 49 { x: 25.1; y: 56.4; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; image: IMAGE_REANIM_ZOMBIE_BOSSDRIVER_JAW2; }
        frame 50 { x: 38.7; y: 50.4; skew-x: 16.5; skew-y: 16.5; scale-x: 0.799; scale-y: 0.816; image: none; }
        frame 51 { x: 53; y: 45.6; skew-x: 33.1; skew-y: 33.1; scale-x: 0.798; scale-y: 0.831; }
        frame 52 { x: 67.8; y: 42.3; skew-x: 49.6; skew-y: 49.6; scale-x: 0.797; scale-y: 0.847; }
        frame 53 { x: 82.5; y: 40.3; skew-x: 66.2; skew-y: 66.2; scale-x: 0.798; scale-y: 0.865; }
        frame 54 { x: 77.1; y: 39.8; skew-x: -10000; skew-y: -10000; scale-x: 0.771; scale-y: 0.815; }
        frame 55 { x: 71.6; y: 39.3; scale-x: 0.744; scale-y: 0.767; }
        frame 56 { x: 66.1; y: 38.6; scale-x: 0.719; scale-y: 0.719; }
        frame 57 { x: 55.6; y: 42.2; skew-x: 47.6; skew-y: 47.6; scale-x: 0.745; scale-y: 0.745; }
        frame 58 { x: 44.6; y: 47.4; skew-x: 28.8; skew-y: 28.8; scale-x: 0.772; scale-y: 0.772; }
        frame 59 { x: 34.1; y: 54.2; skew-x: 10.3; skew-y: 10.3; scale-x: 0.8; scale-y: 0.8; }
        frame 60 { x: 24.7; y: 55.4; skew-x: -5.7; skew-y: -5.7; scale-x: 0.831; scale-y: 0.737; image: IMAGE_REANIM_ZOMBIE_BOSSDRIVER_JAW; }
        frame 61 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; image: none; }
        frame 62 { x: 25.9; y: 52; skew-x: 3.3; skew-y: 1.6; scale-y: 0.738; }
        frame 63 { x: 27.4; y: 49; skew-x: 12.3; skew-y: 9.3; scale-x: 0.83; scale-y: -10000; }
        frame 64 { x: 29.2; y: 46; skew-x: 21.3; skew-y: 16.8; scale-x: 0.829; scale-y: 0.739; }
        frame 65 { x: 31.3; y: 43.4; skew-x: 30.6; skew-y: 24.4; scale-x: -10000; scale-y: 0.74; }
        frame 66 { x: 32.7; y: 43.5; skew-x: -10000; skew-y: 30.3; scale-x: 0.828; scale-y: 0.738; }
        frame 67 { x: 34.1; y: -10000; skew-y: 36.2; scale-x: 0.829; scale-y: 0.739; }
        frame 68 { x: 32.7; skew-y: 30.3; scale-x: 0.828; scale-y: 0.738; }
        frame 69 { x: 31.3; y: 43.4; skew-y: 24.4; scale-x: 0.829; scale-y: 0.74; }
        frame 70 { x: 32.7; y: 43.5; skew-y: 30.3; scale-x: 0.828; scale-y: 0.738; }
        frame 71 { x: 34.1; y: -10000; skew-y: 36.2; scale-x: 0.829; scale-y: 0.739; }
        frame 72 { x: 32.7; skew-y: 30.3; scale-x: 0.828; scale-y: 0.738; }
        frame 73 { x: 31.3; y: 43.4; skew-y: 24.4; scale-x: 0.829; scale-y: 0.74; }
        frame 74 { x: 32.7; y: 43.5; skew-y: 30.3; scale-x: 0.828; scale-y: 0.738; }
        frame 75 { x: 34.1; y: -10000; skew-y: 36.2; scale-x: 0.829; scale-y: 0.739; }
        frame 76 { x: 32.7; skew-y: 30.3; scale-x: 0.828; scale-y: 0.738; }
        frame 77 { x: 31.3; y: 43.4; skew-y: 24.4; scale-x: 0.829; scale-y: 0.74; }
        frame 78 { x: 33.1; y: 43.9; skew-x: 32.4; skew-y: 32.4; scale-x: 0.799; scale-y: 0.799; image: IMAGE_REANIM_ZOMBIE_BOSSDRIVER_JAW2; }
        frame 79 { x: 37.4; y: 35.1; skew-x: 27.6; skew-y: 27.6; scale-x: 0.798; scale-y: 0.798; image: none; }
        frame 80 { x: 41.8; y: 26.3; skew-x: 22.8; skew-y: 22.8; scale-x: -10000; scale-y: -10000; }
        frame 81 { x: 42.1; y: 26.2; skew-x: 23; skew-y: 23.3; scale-y: 0.802; }
        frame 82 { x: 42.4; y: -10000; skew-x: 23.3; skew-y: 23.8; scale-y: 0.807; }
        frame 83 { x: 42.7; y: 26.1; skew-x: 23.5; skew-y: 24.3; scale-y: 0.812; }
        frame 84 { x: 43; y: 25.9; skew-x: 23.8; skew-y: 24.8; scale-y: 0.816; }
        frame 85 { x: 43.5; y: -10000; skew-x: 24; skew-y: 25.3; scale-x: 0.799; scale-y: 0.821; }
        frame 86 { x: 43.7; y: 25.7; skew-x: 24.3; skew-y: 25.8; scale-x: -10000; scale-y: 0.826; }
        frame 87 { x: 44; y: 25.6; skew-x: 24.5; skew-y: 26.3; scale-y: 0.831; }
        frame 88 { x: 44.4; y: 25.5; skew-x: 24.8; skew-y: 26.8; scale-y: 0.835; }
        frame 89 { x: 44.8; y: -10000; skew-x: 25; skew-y: 27.3; scale-x: 0.8; scale-y: 0.84; }
        frame 90 { x: 45; y: 25.4; skew-x: 25.3; skew-y: 27.9; scale-x: -10000; scale-y: 0.845; }
        frame 91 { x: 45.4; y: 25.3; skew-x: 25.5; skew-y: 28.5; scale-y: 0.849; }
        frame 92 { x: 45.8; y: 25.2; skew-x: 25.8; skew-y: 29.1; scale-y: 0.854; }
        frame 93 { x: 46; y: 25.1; skew-x: 26; skew-y: 29.6; scale-x: 0.801; scale-y: 0.859; }
        frame 94 { x: 46.4; y: -10000; skew-x: 26.3; skew-y: 30.1; scale-x: -10000; scale-y: 0.864; }
        frame 95 { x: 46.8; y: 25; skew-x: 26.5; skew-y: 30.6; scale-y: 0.868; }
        frame 96 { x: 47; y: 24.8; skew-x: 26.8; skew-y: 31.1; scale-y: 0.873; }
        frame 97 { x: 47.5; y: -10000; skew-x: 27; skew-y: 31.6; scale-x: 0.802; scale-y: 0.878; }
        frame 98 { x: 47.6; skew-x: 27.3; skew-y: 32.1; scale-x: -10000; scale-y: 0.883; }
        frame 99 { x: 48; y: 24.6; skew-x: 27.5; skew-y: 32.6; scale-y: 0.887; }
        frame 100 { x: 48.4; y: 24.5; skew-x: 27.8; skew-y: 33.1; scale-y: 0.892; }
        frame 101 { x: 48.6; y: -10000; skew-x: 28; skew-y: 33.6; scale-x: 0.803; scale-y: 0.897; }
        frame 102 { x: 49; y: 24.4; skew-x: 28.3; skew-y: 34.1; scale-x: -10000; scale-y: 0.901; }
        frame 103 { x: 49.4; y: 24.3; skew-x: 28.5; skew-y: 34.6; scale-y: 0.906; }
        frame 104 { x: 49.8; y: -10000; skew-x: 28.8; skew-y: 35.3; scale-y: 0.911; }
        frame 105 { x: 50.1; y: 24.2; skew-x: 29.1; skew-y: 35.8; scale-x: 0.804; scale-y: 0.916; }
        frame 106 { x: 50.5; y: -10000; skew-x: 29.3; skew-y: 36.3; scale-x: -10000; scale-y: 0.92; }
        frame 107 { x: 50.8; y: 24.1; skew-x: 29.6; skew-y: 36.8; scale-y: 0.925; }
        frame 108 { x: 51.2; y: -10000; skew-x: 29.8; skew-y: 37.3; scale-y: 0.93; }
        frame 109 { x: 51.5; y: 23.9; skew-x: 30.1; skew-y: 37.8; scale-x: 0.805; scale-y: 0.935; }
        frame 110 { x: 51.8; y: -10000; skew-x: 30.3; skew-y: 38.4; scale-x: -10000; scale-y: 0.939; }
        frame 111 { x: 52.1; y: 23.8; skew-x: 30.6; skew-y: 38.9; scale-y: 0.944; }
        frame 112 { x: 52.5; y: 23.7; skew-x: 30.8; skew-y: 39.4; scale-y: 0.949; }
        frame 113 { x: 52.9; y: 23.8; skew-x: 31.1; skew-y: 39.9; scale-x: 0.806; scale-y: 0.954; }
        frame 114 { x: 53.2; y: 23.6; skew-x: 31.3; skew-y: 40.4; scale-x: -10000; scale-y: 0.958; }
        frame 115 { x: 53.5; y: -10000; skew-x: 31.6; skew-y: 40.9; scale-y: 0.963; }
        frame 116 { x: 53.9; y: 23.5; skew-x: 31.8; skew-y: 41.4; scale-y: 0.968; }
        frame 117 { x: 54.3; y: -10000; skew-x: 32.1; skew-y: 42.1; scale-x: 0.807; scale-y: 0.973; }
        frame 118 { x: 54.6; skew-x: 32.3; skew-y: 42.6; scale-x: -10000; scale-y: 0.977; }
        frame 119 { x: 55; y: 23.4; skew-x: 32.6; skew-y: 43.1; scale-y: 0.982; }
        frame 120 { x: 55.3; y: -10000; skew-x: 32.8; skew-y: 43.6; scale-y: 0.987; }
        frame 121 { x: 55.6; y: 23.3; skew-x: 33.1; skew-y: 44.1; scale-x: 0.808; scale-y: 0.992; }
        frame 122 { x: 56; y: -10000; skew-x: 33.3; skew-y: 44.6; scale-x: -10000; scale-y: 0.996; }
        frame 123 { x: 56.4; skew-x: 33.6; skew-y: 45.1; scale-y: 1.001; }
        frame 124 { x: 56.6; y: 23.2; skew-x: 33.8; skew-y: 45.6; scale-y: 1.006; }
        frame 125 { x: 57; y: -10000; skew-x: 34.1; skew-y: 46.1; scale-x: 0.809; scale-y: 1.01; }
        frame 126 { x: 57.4; y: 23.1; skew-x: 34.3; skew-y: 46.6; scale-x: -10000; scale-y: 1.015; }
        frame 127 { x: 57.8; y: -10000; skew-x: 34.6; skew-y: 47.2; scale-y: 1.02; }
        frame 128 { x: 58.1; skew-x: 34.8; skew-y: 47.7; scale-y: 1.025; }
        frame 129 { x: 58.4; y: 23; skew-x: 35; skew-y: 48.2; scale-x: 0.811; scale-y: 1.031; }
        frame 130 { x: 45.6; y: 33.8; skew-x: 23.3; skew-y: 29.6; scale-x: 0.804; scale-y: 0.904; }
        frame 131 { x: 33.7; y: 46.3; skew-x: 11.7; skew-y: 11; scale-x: 0.799; scale-y: 0.78; }
        frame 132 { x: 29.1; y: 54; skew-x: -0.7; skew-y: -4.2; scale-x: 0.78; scale-y: 0.732; }
        frame 133 { x: 25.4; y: 62.3; skew-x: -13.4; skew-y: -19.5; scale-x: 0.761; scale-y: 0.684; }
        frame 134 { x: 15.7; y: 70.2; skew-x: -26.2; skew-y: -35; scale-x: 0.743; scale-y: 0.637; }
        frame 135 { x: 18.8; y: 65.8; skew-x: -21.2; skew-y: -28.7; scale-x: 0.731; scale-y: 0.678; }
        frame 136 { x: 22.1; y: 61.2; skew-x: -16.4; skew-y: -22.4; scale-x: 0.72; scale-y: 0.72; }
        frame 137 { x: 31.8; y: 49.4; skew-x: 7.8; skew-y: 3.5; scale-x: -10000; scale-y: 0.719; }
        frame 138 { x: 43.7; y: 40.5; skew-x: 32.5; skew-y: 29.8; scale-y: -10000; }
        frame 139 { x: 33.3; y: 46.1; skew-x: 17.8; skew-y: 13.3; scale-x: 0.719; }
        frame 140 { x: 23.6; y: 53; skew-x: 3.1; skew-y: -2.9; scale-x: 0.72; scale-y: 0.72; }
        frame 141 { x: 15.1; y: 69.3; skew-x: -25.9; skew-y: -34.2; scale-x: -10000; scale-y: 0.719; }
        frame 142 { x: 21.2; y: 57.5; skew-x: -6.4; skew-y: -12.9; scale-x: 0.719; scale-y: -10000; }
        frame 143 { x: 29.4; y: 47.3; skew-x: 12.8; skew-y: 8.3; scale-x: -10000; scale-y: 0.72; }
        frame 144 { x: 44.8; y: 45.5; skew-x: 23.1; skew-y: 25.8; scale-x: 0.722; scale-y: 0.724; }
        frame 145 { x: 60; y: 45.1; skew-x: 33.6; skew-y: 43.4; scale-x: 0.726; scale-y: 0.729; }
        frame 146 { x: 72.8; y: 45.9; skew-x: 42.6; skew-y: 56.4; scale-x: 0.683; scale-y: 0.746; }
        frame 147 { x: 85.3; y: 47.4; skew-x: 51.5; skew-y: 69.1; scale-x: 0.643; scale-y: 0.765; }
        frame 148 { x: 84.3; y: 46.8; skew-x: 52.4; skew-y: 68.7; scale-x: 0.65; scale-y: 0.761; }
        frame 149 { x: 83.3; y: 46.1; skew-x: 53.2; skew-y: 68; scale-x: 0.658; scale-y: 0.759; }
        frame 150 { x: 82.3; y: 45.4; skew-x: 54.1; skew-y: 67.3; scale-x: 0.666; scale-y: 0.757; }
        frame 151 { x: 78.3; y: 58.7; skew-x: 39.8; skew-y: 48.4; scale-x: 0.698; scale-y: 0.729; }
        frame 152 { x: 74.2; y: 73.8; skew-x: 25.6; skew-y: 29.5; scale-x: 0.732; scale-y: 0.702; }
        frame 153 { x: 71.5; y: 85.1; skew-x: 17.8; skew-y: 21; scale-x: 0.727; scale-y: 0.707; }
        frame 154 { x: 68.9; y: 96.7; skew-x: 10.1; skew-y: 12.6; scale-x: 0.724; scale-y: 0.713; }
        frame 155 { x: 66.6; y: 108.5; skew-x: 2.6; skew-y: 4.3; scale-x: 0.72; scale-y: 0.72; }
        frame 156 { x: -10000; y: 113.8; skew-x: 2.5; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 157 { y: 119.3; skew-x: 2.6; }
        frame 158 { y: -10000; skew-x: 2.5; }
        frame 159 { skew-x: -10000; }
        frame 163 { skew-x: 2.6; }
        frame 164 { skew-x: -10000; }
    }
    Track {
        source-name: "Driver_outerarm_upper";
        frame-count: 187;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 9 { x: 47.5; y: 58; skew-x: -0.9; skew-y: -0.9; scale-x: 0.799; scale-y: 0.799; cel: 0; image: IMAGE_REANIM_ZOMBIE_BOSSDRIVER_UPPERARM; }
        frame 10 { x: -10000; y: 58.4; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 11 { y: 58.6; }
        frame 12 { x: 47.4; y: 59; }
        frame 13 { x: -10000; y: 59.3; }
        frame 14 { x: 47.3; y: 59.7; }
        frame 15 { x: 47.2; y: 60; skew-x: -1; skew-y: -1; }
        frame 16 { x: -10000; y: 60.4; skew-x: -1.2; skew-y: -1.2; }
        frame 17 { x: 47.3; y: 60; skew-x: 0.5; skew-y: -0.9; scale-y: 0.808; }
        frame 18 { x: -10000; y: 59.6; skew-x: 2.3; skew-y: -10000; scale-x: 0.8; scale-y: 0.817; }
        frame 19 { x: 47.4; y: 59.4; skew-x: 1.5; scale-x: -10000; scale-y: 0.813; }
        frame 20 { x: -10000; y: 59; skew-x: 0.8; scale-x: 0.799; scale-y: 0.81; }
        frame 21 { x: 47.5; y: 58.8; skew-x: 0.3; scale-x: -10000; scale-y: 0.806; }
        frame 22 { x: 47.6; y: 58.4; skew-x: -0.2; skew-y: -0.7; scale-y: 0.802; }
        frame 23 { x: 47.5; y: 58; skew-x: -0.9; skew-y: -0.9; scale-y: 0.799; }
        frame 24 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 25 { x: 49.2; y: 58.9; skew-x: -1.7; skew-y: -1.7; }
        frame 26 { x: 50.6; y: 59.9; skew-x: -2.7; skew-y: -2.7; scale-x: 0.798; scale-y: 0.798; }
        frame 27 { x: 52; y: 60.8; skew-x: -3.7; skew-y: -3.7; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 53.5; y: 61.8; skew-x: -4.7; skew-y: -4.7; }
        frame 29 { x: 55; y: 62.8; skew-x: -5.7; skew-y: -5.7; scale-x: 0.797; scale-y: 0.797; }
        frame 30 { x: 56.3; y: 63.8; skew-x: -6.9; skew-y: -6.9; scale-x: -10000; scale-y: -10000; }
        frame 31 { x: 55; y: 62.9; skew-x: -5.7; skew-y: -5.7; }
        frame 32 { x: 53.4; y: 61.8; skew-x: -4.7; skew-y: -4.7; scale-x: 0.798; scale-y: 0.798; }
        frame 33 { x: 52; y: 60.9; skew-x: -3.7; skew-y: -3.7; scale-x: -10000; scale-y: -10000; }
        frame 34 { x: 50.5; y: 60; skew-x: -2.7; skew-y: -2.7; }
        frame 35 { x: 49; y: 59; skew-x: -1.7; skew-y: -1.7; scale-x: 0.799; scale-y: 0.799; }
        frame 36 { x: 47.5; y: 58; skew-x: -0.9; skew-y: -0.9; scale-x: -10000; scale-y: -10000; }
        frame 37 { x: 50.1; y: 56.4; skew-x: 8; skew-y: 9.8; scale-x: 0.798; scale-y: 0.83; }
        frame 38 { x: 53; y: 55.5; skew-x: 17.1; skew-y: 20.6; scale-x: 0.796; scale-y: 0.862; }
        frame 39 { x: 56; y: 55.2; skew-x: 26.3; skew-y: 31.4; scale-x: -10000; scale-y: 0.895; }
        frame 40 { x: 58; y: 55.6; skew-x: 35.6; skew-y: 38.9; scale-x: 0.795; scale-y: 0.924; }
        frame 41 { x: 60; y: 56.5; skew-x: 44.6; skew-y: 46.4; scale-x: -10000; scale-y: 0.955; }
        frame 42 { x: 62.1; y: 57.8; skew-x: 53.9; skew-y: 53.9; scale-x: 0.796; scale-y: 0.987; }
        frame 43 { x: 60.1; y: 56.5; skew-x: 44.6; skew-y: 46.4; scale-x: 0.795; scale-y: 0.954; }
        frame 44 { x: 58; y: 55.5; skew-x: 35.6; skew-y: 38.8; scale-x: -10000; scale-y: 0.924; }
        frame 45 { x: 56.3; y: 55.1; skew-x: 26.3; skew-y: 31.3; scale-x: 0.796; scale-y: 0.895; }
        frame 46 { x: 53.1; y: 55.5; skew-x: 17.1; skew-y: 20.5; scale-x: -10000; scale-y: 0.862; }
        frame 47 { x: 50.2; y: 56.5; skew-x: 8; skew-y: 9.8; scale-x: 0.798; scale-y: 0.83; }
        frame 48 { x: 47.5; y: 58; skew-x: -0.9; skew-y: -0.9; scale-x: 0.799; scale-y: 0.799; }
        frame 49 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: 60.7; y: 56.1; skew-x: 21.8; skew-y: 24.8; scale-x: 0.796; scale-y: 0.88; }
        frame 51 { x: 75.1; y: 57.9; skew-x: 44.7; skew-y: 50.8; scale-x: 0.795; scale-y: 0.963; }
        frame 52 { x: 85.2; y: 60.8; skew-x: 59.7; skew-y: 62.7; scale-x: 0.794; scale-y: 1.077; }
        frame 53 { x: 95.2; y: 65.3; skew-x: 74.4; skew-y: 74.4; scale-x: 0.795; scale-y: 1.194; }
        frame 54 { x: 88.9; y: 62.4; skew-x: 67; skew-y: 67; scale-x: 0.794; scale-y: 1.121; }
        frame 55 { x: 82.6; y: 60; skew-x: 59.4; skew-y: 59.4; scale-x: -10000; scale-y: 1.05; }
        frame 56 { x: 76.3; y: 58.3; skew-x: 51.9; skew-y: 51.9; scale-x: 0.795; scale-y: 0.98; }
        frame 57 { x: 68.6; y: 56.8; skew-x: 39.1; skew-y: 39.1; scale-x: 0.794; scale-y: 0.902; }
        frame 58 { x: 61.1; y: 56.5; skew-x: 26.4; skew-y: 26.2; scale-x: 0.796; scale-y: 0.828; }
        frame 59 { x: 54.1; y: 56.9; skew-x: 12.6; skew-y: 12.5; scale-x: 0.797; scale-y: 0.813; }
        frame 60 { x: 47.5; y: 58; skew-x: -0.9; skew-y: -0.9; scale-x: 0.799; scale-y: 0.799; }
        frame 61 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 62 { x: 48.2; y: 57.6; skew-x: 0.5; skew-y: 0.5; }
        frame 63 { x: 48.9; y: 57.4; skew-x: 2.3; skew-y: 2.3; }
        frame 64 { x: 49.5; y: 57.1; skew-x: 3.8; skew-y: 3.8; scale-x: 0.798; scale-y: 0.798; }
        frame 65 { x: 50.1; y: 56.9; skew-x: 5.6; skew-y: 5.6; scale-x: -10000; scale-y: -10000; }
        frame 66 { x: 50.2; y: 56.4; skew-x: 5.5; skew-y: 5.5; }
        frame 67 { x: 50.1; y: 55.7; skew-x: 5.6; skew-y: 5.6; }
        frame 68 { x: -10000; y: 56.4; skew-x: 5.5; skew-y: 5.5; }
        frame 69 { y: 56.9; skew-x: 5.6; skew-y: 5.6; }
        frame 70 { x: 50.2; y: 56.4; skew-x: 5.5; skew-y: 5.5; }
        frame 71 { x: 50.1; y: 55.7; skew-x: 5.6; skew-y: 5.6; }
        frame 72 { x: -10000; y: 56.4; skew-x: 5.5; skew-y: 5.5; }
        frame 73 { y: 56.9; skew-x: 5.6; skew-y: 5.6; }
        frame 74 { x: 50.2; y: 56.4; skew-x: 5.5; skew-y: 5.5; }
        frame 75 { x: 50.1; y: 55.7; skew-x: 5.6; skew-y: 5.6; }
        frame 76 { x: -10000; y: 56.4; skew-x: 5.5; skew-y: 5.5; }
        frame 77 { y: 56.9; skew-x: 5.6; skew-y: 5.6; }
        frame 78 { y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 79 { x: 56.3; y: 47.1; skew-x: 19.6; skew-y: 19.6; scale-x: 0.797; scale-y: 0.982; }
        frame 80 { x: 64.1; y: 38.6; skew-x: 33.9; skew-y: 33.9; scale-x: -10000; scale-y: 1.168; }
        frame 81 { x: 64.2; y: 38.7; skew-x: 33.8; skew-y: -10000; scale-x: 0.795; scale-y: 1.167; }
        frame 82 { x: 64.3; y: 38.6; skew-x: 33.9; scale-x: 0.794; scale-y: 1.168; }
        frame 83 { x: 64.4; y: 38.7; skew-x: -10000; skew-y: 34.1; scale-x: -10000; scale-y: 1.169; }
        frame 84 { x: 64.5; y: 38.6; skew-y: -10000; scale-x: 0.793; scale-y: -10000; }
        frame 85 { x: 64.7; y: -10000; skew-x: 34.1; scale-x: -10000; scale-y: 1.17; }
        frame 86 { x: 64.8; skew-x: -10000; scale-x: 0.792; scale-y: 1.171; }
        frame 87 { x: -10000; y: 38.7; skew-y: 34.3; scale-x: 0.791; scale-y: 1.172; }
        frame 88 { x: 65; y: 38.6; skew-y: -10000; scale-x: -10000; scale-y: 1.173; }
        frame 89 { x: -10000; y: -10000; scale-x: 0.79; scale-y: 1.174; }
        frame 90 { x: 65.2; skew-y: 34.4; scale-x: -10000; scale-y: -10000; }
        frame 91 { x: 65.3; y: 38.7; skew-y: 34.6; scale-x: 0.789; scale-y: 1.175; }
        frame 92 { x: -10000; y: 38.6; skew-y: -10000; scale-x: -10000; scale-y: 1.176; }
        frame 93 { x: 65.5; y: 38.7; scale-x: 0.788; scale-y: 1.177; }
        frame 94 { x: 65.6; y: 38.6; skew-x: 34.3; scale-x: -10000; scale-y: 1.178; }
        frame 95 { x: -10000; y: -10000; skew-x: -10000; scale-x: 0.787; scale-y: 1.179; }
        frame 96 { x: 65.8; y: 38.7; skew-y: 34.8; scale-x: 0.786; scale-y: 1.18; }
        frame 97 { x: 65.9; y: 38.6; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 98 { x: 66.1; y: -10000; skew-y: 34.9; scale-x: 0.785; scale-y: 1.181; }
        frame 99 { x: -10000; skew-y: -10000; scale-x: -10000; scale-y: 1.182; }
        frame 100 { x: 66.3; skew-x: 34.4; skew-y: 35.1; scale-x: 0.784; scale-y: 1.183; }
        frame 101 { x: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: 1.184; }
        frame 102 { x: 66.5; y: 38.7; scale-x: 0.783; scale-y: 1.185; }
        frame 103 { x: -10000; y: 38.6; skew-x: 34.6; scale-x: -10000; scale-y: -10000; }
        frame 104 { x: 66.7; y: 38.7; skew-x: -10000; skew-y: 35.3; scale-x: 0.782; scale-y: 1.186; }
        frame 105 { x: 66.8; y: -10000; skew-y: -10000; scale-x: 0.781; scale-y: 1.187; }
        frame 106 { x: 66.9; y: 38.6; scale-x: -10000; scale-y: 1.188; }
        frame 107 { x: 67; y: 38.7; skew-y: 35.4; scale-x: 0.78; scale-y: 1.189; }
        frame 108 { x: 67.1; y: 38.6; skew-y: -10000; scale-x: -10000; scale-y: 1.19; }
        frame 109 { x: 67.2; y: 38.8; skew-y: 35.6; scale-x: 0.779; scale-y: 1.191; }
        frame 110 { x: 67.3; y: 38.6; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 111 { x: -10000; y: -10000; scale-x: 0.778; scale-y: 1.192; }
        frame 112 { x: 67.5; skew-x: 34.8; scale-x: -10000; scale-y: 1.193; }
        frame 113 { x: 67.6; y: 38.7; skew-x: -10000; skew-y: 35.8; scale-x: 0.777; scale-y: 1.194; }
        frame 114 { x: 67.8; y: 38.6; skew-y: -10000; scale-x: 0.776; scale-y: 1.195; }
        frame 115 { x: -10000; y: -10000; skew-y: 35.9; scale-x: -10000; scale-y: 1.196; }
        frame 116 { x: 67.9; y: 38.7; skew-y: -10000; scale-x: 0.775; scale-y: 1.197; }
        frame 117 { x: 68; y: -10000; skew-y: 36.1; scale-x: -10000; scale-y: -10000; }
        frame 118 { x: 68.2; y: 38.8; skew-x: 34.9; skew-y: -10000; scale-x: 0.774; scale-y: 1.198; }
        frame 119 { x: 68.3; y: 38.6; skew-x: -10000; scale-x: -10000; scale-y: 1.199; }
        frame 120 { x: -10000; y: 38.7; scale-x: 0.773; scale-y: 1.2; }
        frame 121 { x: 68.5; y: 38.6; skew-x: 35.1; scale-x: -10000; scale-y: 1.201; }
        frame 122 { x: 68.6; y: 38.7; skew-x: -10000; skew-y: 36.3; scale-x: 0.772; scale-y: 1.202; }
        frame 123 { x: 68.8; y: 38.6; skew-y: -10000; scale-x: 0.771; scale-y: -10000; }
        frame 124 { x: -10000; y: -10000; skew-y: 36.4; scale-x: -10000; scale-y: 1.203; }
        frame 125 { skew-y: -10000; scale-x: 0.77; scale-y: 1.204; }
        frame 126 { x: 69.1; skew-y: 36.6; scale-x: -10000; scale-y: 1.205; }
        frame 127 { x: -10000; y: 38.7; skew-y: -10000; scale-x: 0.769; scale-y: 1.206; }
        frame 128 { x: 69.3; y: 38.6; scale-x: -10000; scale-y: 1.207; }
        frame 129 { x: -10000; y: -10000; skew-x: 35.2; skew-y: 36.7; scale-y: 1.209; }
        frame 130 { x: 58.9; y: 46.8; skew-x: 20.3; skew-y: 21.1; scale-x: 0.783; scale-y: 1.003; }
        frame 131 { x: 50.1; y: 56.9; skew-x: 5.6; skew-y: 5.6; scale-x: 0.798; scale-y: 0.798; }
        frame 132 { x: 46.4; y: 59.5; skew-x: -3.5; skew-y: -1.2; scale-x: 0.789; scale-y: 0.808; }
        frame 133 { x: 42.9; y: 62.5; skew-x: -12.9; skew-y: -8.1; scale-x: 0.78; scale-y: 0.817; }
        frame 134 { x: 35.6; y: 66.4; skew-x: -22.4; skew-y: -26; scale-x: 0.771; scale-y: 0.824; }
        frame 135 { x: 40.8; y: 63.5; skew-x: -15.2; skew-y: -16.2; scale-x: 0.775; scale-y: 0.82; }
        frame 136 { x: 46.1; y: 60.9; skew-x: -8.2; skew-y: -6.7; scale-x: 0.78; scale-y: 0.818; }
        frame 137 { x: 51.5; y: 58.7; skew-x: -1.2; skew-y: 2.6; scale-x: 0.785; scale-y: 0.816; }
        frame 138 { x: 57.2; y: 56.9; skew-x: 5.7; skew-y: 12.4; scale-x: 0.789; scale-y: 0.813; }
        frame 139 { x: 49.5; y: 59.5; skew-x: -3.4; skew-y: 0; scale-x: 0.785; scale-y: 0.815; }
        frame 140 { x: 42.2; y: 62.7; skew-x: -12.7; skew-y: -12.4; scale-x: 0.781; scale-y: -10000; }
        frame 141 { x: 35.1; y: 66.4; skew-x: -22.2; skew-y: -25; scale-x: 0.777; scale-y: 0.817; }
        frame 142 { x: 42.1; y: 62.6; skew-x: -12.7; skew-y: -12.4; scale-x: 0.781; scale-y: 0.815; }
        frame 143 { x: 49.6; y: 59.5; skew-x: -3.4; skew-y: 0; scale-x: 0.785; scale-y: 0.814; }
        frame 144 { x: 57.2; y: 56.9; skew-x: 5.7; skew-y: 12.4; scale-x: 0.789; scale-y: 0.813; }
        frame 145 { x: 72.3; y: 56.4; skew-x: 28.8; skew-y: 37.8; scale-x: 0.772; scale-y: 0.912; }
        frame 146 { x: 88.2; y: 59.9; skew-x: 52.1; skew-y: 63.3; scale-x: 0.757; scale-y: 1.013; }
        frame 147 { x: 101.9; y: 66.2; skew-x: 75.2; skew-y: 81.7; scale-x: 0.743; scale-y: 1.097; }
        frame 148 { x: 99; y: 64.2; skew-x: 69.2; skew-y: 75.7; scale-x: 0.742; scale-y: 1.095; }
        frame 149 { x: 95.8; y: 62.4; skew-x: 63; skew-y: 69.7; scale-x: -10000; scale-y: -10000; }
        frame 150 { x: 92.7; y: 60.7; skew-x: 56.9; skew-y: 63.4; scale-x: 0.743; scale-y: 1.096; }
        frame 151 { x: 95.2; y: 75.6; skew-x: 76.2; skew-y: 82.9; scale-x: 0.766; scale-y: 1.081; }
        frame 152 { x: 102.5; y: 91.3; skew-x: 95.6; skew-y: 102.1; scale-x: 0.791; scale-y: 1.068; }
        frame 153 { x: 87.8; y: 101.8; skew-x: 110.6; skew-y: 117.2; scale-x: 0.816; scale-y: 1.056; }
        frame 154 { x: 91.1; y: 111.6; skew-x: -10000; skew-y: 117.1; scale-x: 0.815; scale-y: 1.054; }
        frame 155 { x: 94.6; y: 121.3; skew-y: 117.2; scale-x: 0.816; scale-y: 1.056; }
        frame 156 { x: -10000; y: -10000; skew-y: 117.1; scale-x: 0.815; scale-y: 1.054; }
        frame 157 { skew-y: 117.2; scale-x: 0.816; scale-y: 1.056; }
        frame 158 { skew-y: 117.1; scale-x: 0.815; scale-y: 1.054; }
        frame 159 { skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 163 { skew-y: 117.2; scale-x: 0.816; scale-y: 1.056; }
        frame 164 { skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Driver_outerarm_lower2";
        frame-count: 187;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 9 { x: 34.8; y: 83.2; scale-x: 0.8; scale-y: 0.8; cel: 0; image: IMAGE_REANIM_ZOMBIE_BOSSDRIVER_LOWERARM2; }
        frame 10 { x: -10000; y: 83.3; skew-x: 0.3; skew-y: 0.3; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 11 { y: 83.5; skew-x: 0.8; skew-y: 0.8; }
        frame 12 { y: 83.7; skew-x: 1.3; skew-y: 1.3; }
        frame 13 { y: -10000; skew-x: 1.8; skew-y: 1.8; }
        frame 14 { y: 83.8; skew-x: 2.3; skew-y: 2.3; }
        frame 15 { x: 34.9; y: 83.9; skew-x: 2.8; skew-y: 2.8; }
        frame 16 { x: -10000; y: 84.1; skew-x: 3.3; skew-y: 3.3; }
        frame 17 { y: 84; skew-x: 3.8; skew-y: 2.8; scale-y: 0.799; }
        frame 18 { y: 83.9; skew-x: 4.4; skew-y: 2.3; scale-x: 0.801; scale-y: 0.798; }
        frame 19 { y: 83.8; skew-x: 3.5; skew-y: 1.8; scale-x: -10000; scale-y: 0.799; }
        frame 20 { y: 83.7; skew-x: 2.5; skew-y: 1.3; scale-y: -10000; }
        frame 21 { y: 83.6; skew-x: 1.8; skew-y: 0.8; scale-x: 0.8; }
        frame 22 { y: 83.4; skew-x: 0.8; skew-y: 0.3; scale-x: -10000; scale-y: 0.8; }
        frame 23 { x: 34.8; y: 83.2; skew-x: 0; skew-y: 0; scale-y: -10000; }
        frame 24 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 25 { x: 36.6; y: 82.8; skew-x: 2.3; skew-y: 2.3; }
        frame 26 { x: 38.4; y: 82.3; skew-x: 4.5; skew-y: 4.5; }
        frame 27 { x: 40.2; y: 82; skew-x: 7; skew-y: 7; scale-x: 0.799; scale-y: 0.799; }
        frame 28 { x: 42; y: 81.6; skew-x: 9.3; skew-y: 9.3; scale-x: -10000; scale-y: -10000; }
        frame 29 { x: 43.9; y: 81.3; skew-x: 11.6; skew-y: 11.6; }
        frame 30 { x: 45.8; y: 81; skew-x: 14.1; skew-y: 14.1; }
        frame 31 { x: 43.9; y: 81.3; skew-x: 11.6; skew-y: 11.6; }
        frame 32 { x: 42.1; y: 81.7; skew-x: 9.3; skew-y: 9.3; }
        frame 33 { x: 40.3; y: 82; skew-x: 7; skew-y: 7; }
        frame 34 { x: 38.5; y: 82.3; skew-x: 4.5; skew-y: 4.5; scale-x: 0.8; scale-y: 0.8; }
        frame 35 { x: 36.6; y: 82.8; skew-x: 2.3; skew-y: 2.3; scale-x: -10000; scale-y: -10000; }
        frame 36 { x: 34.8; y: 83.2; skew-x: 0; skew-y: 0; }
        frame 37 { x: 32.9; y: 83.7; skew-x: -10000; skew-y: -10000; }
        frame 38 { x: 30.9; y: 84.1; skew-x: 0.3; skew-y: 0.3; }
        frame 39 { x: 29; y: 84.5; skew-x: -10000; skew-y: -10000; }
        frame 40 { x: 27; y: 84.8; skew-x: 0.5; skew-y: 0.5; }
        frame 41 { x: 25.1; y: 85.3; skew-x: -10000; skew-y: -10000; scale-x: 0.799; scale-y: 0.799; }
        frame 42 { x: 23.2; y: 85.8; skew-x: 0.8; skew-y: 0.8; scale-x: -10000; scale-y: -10000; }
        frame 43 { x: 25.2; y: 85.3; skew-x: 0.5; skew-y: 0.5; }
        frame 44 { x: 27.2; y: 84.8; skew-x: -10000; skew-y: -10000; scale-x: 0.8; scale-y: 0.8; }
        frame 45 { x: 29; y: 84.6; skew-x: 0.3; skew-y: 0.3; scale-x: -10000; scale-y: -10000; }
        frame 46 { x: 30.9; y: 84.1; skew-x: -10000; skew-y: -10000; }
        frame 47 { x: 32.9; y: 83.7; skew-x: 0; skew-y: 0; }
        frame 48 { x: 34.8; y: 83.2; skew-x: -10000; skew-y: -10000; }
        frame 49 { x: -10000; y: -10000; }
        frame 50 { x: 37; y: 81.4; skew-x: 6.8; skew-y: 6.8; scale-x: 0.799; scale-y: 0.799; }
        frame 51 { x: 39.5; y: 79.8; skew-x: 13.6; skew-y: 13.6; scale-x: -10000; scale-y: -10000; }
        frame 52 { x: 42; y: 78.3; skew-x: 20.5; skew-y: 20.5; scale-x: 0.798; scale-y: 0.798; }
        frame 53 { x: 44.5; y: 77; skew-x: 27.4; skew-y: 27.4; scale-x: -10000; scale-y: -10000; }
        frame 54 { x: 43; y: 77.8; skew-x: 23.3; skew-y: 23.3; }
        frame 55 { x: 41.5; y: 78.6; skew-x: 19.5; skew-y: 19.5; }
        frame 56 { x: 40.1; y: 79.3; skew-x: 15.5; skew-y: 15.5; }
        frame 57 { x: 38.8; y: 80.3; skew-x: 11.6; skew-y: 11.6; scale-x: 0.799; scale-y: 0.799; }
        frame 58 { x: 37.5; y: 81.2; skew-x: 7.8; skew-y: 7.8; scale-x: -10000; scale-y: -10000; }
        frame 59 { x: 36.1; y: 82.3; skew-x: 3.8; skew-y: 3.8; scale-x: 0.8; scale-y: 0.8; }
        frame 60 { x: 34.8; y: 83.2; skew-x: 0; skew-y: 0; scale-x: -10000; scale-y: -10000; }
        frame 61 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 66 { x: 35; y: 82.9; }
        frame 67 { x: 35.3; y: 82.6; }
        frame 68 { x: 35; y: 82.9; }
        frame 69 { x: 34.8; y: 83.2; }
        frame 70 { x: 35; y: 82.9; }
        frame 71 { x: 35.3; y: 82.6; }
        frame 72 { x: 35; y: 82.9; }
        frame 73 { x: 34.8; y: 83.2; }
        frame 74 { x: 35; y: 82.9; }
        frame 75 { x: 35.3; y: 82.6; }
        frame 76 { x: 35; y: 82.9; }
        frame 77 { x: 34.8; y: 83.2; }
        frame 78 { x: -10000; y: -10000; }
        frame 79 { x: 35.2; y: 79.8; skew-x: -0.7; skew-y: -0; scale-x: 0.79; scale-y: 0.835; }
        frame 80 { x: 35.6; y: 76.3; skew-x: -1.5; skew-y: -0.3; scale-x: 0.78; scale-y: 0.87; }
        frame 81 { x: -10000; y: -10000; skew-x: -1.4; skew-y: -0.2; scale-x: -10000; scale-y: -10000; }
        frame 82 { skew-x: -10000; skew-y: -10000; }
        frame 129 { skew-x: -1.5; skew-y: -0.3; }
        frame 130 { x: 35.3; y: 79.8; skew-x: -0.7; skew-y: -0; scale-x: 0.79; scale-y: 0.835; }
        frame 131 { x: 34.8; y: 83.2; skew-x: 0; skew-y: 0; scale-x: 0.8; scale-y: 0.8; }
        frame 132 { x: 33.6; y: -10000; skew-x: -10000; skew-y: -1.5; scale-x: -10000; scale-y: 0.801; }
        frame 133 { x: 32.5; skew-y: -3.2; scale-y: 0.802; }
        frame 134 { x: 31.3; skew-y: -5.1; scale-y: 0.803; }
        frame 135 { x: 33.1; skew-y: -2; scale-y: 0.804; }
        frame 136 { x: 35; y: 83.1; skew-y: 0.8; scale-y: 0.805; }
        frame 137 { x: 36.8; y: 83.2; skew-y: 3.8; scale-y: -10000; }
        frame 138 { x: 38.7; y: -10000; skew-y: 6.9; scale-y: 0.806; }
        frame 139 { x: 36; y: 83.1; skew-y: 3.3; scale-y: 0.804; }
        frame 140 { x: 33.2; y: 83.2; skew-y: -0.2; scale-y: 0.803; }
        frame 141 { x: 30.5; y: -10000; skew-y: -3.9; scale-y: 0.802; }
        frame 142 { x: 33.1; skew-y: -0.2; scale-y: 0.803; }
        frame 143 { x: 35.9; y: 83.1; skew-y: 3.3; scale-y: 0.804; }
        frame 144 { x: 38.7; y: 83.2; skew-y: 6.9; scale-y: 0.806; }
        frame 145 { x: 42.1; y: 82.6; skew-y: 10.3; scale-y: 0.816; }
        frame 146 { x: 45.5; y: 82.1; skew-y: 14; scale-y: 0.827; }
        frame 147 { x: 49; y: 81.6; skew-y: 17.6; scale-y: 0.839; }
        frame 148 { x: 48.1; y: 81.8; skew-y: 17.5; scale-y: 0.838; }
        frame 149 { x: 47.4; y: 82.2; skew-y: -10000; scale-y: -10000; }
        frame 150 { x: 46.6; y: 82.4; skew-y: 17.6; scale-y: 0.839; }
        frame 151 { x: 44; y: 85.7; skew-x: 8.3; skew-y: 25.8; scale-x: 0.799; scale-y: 0.838; }
        frame 152 { x: 41.6; y: 89.2; skew-x: 16.6; skew-y: 34.3; scale-x: -10000; scale-y: 0.837; }
        frame 153 { x: 39.2; y: 92.9; skew-x: 25.1; skew-y: 42.7; scale-y: 0.838; }
        frame 154 { x: 42.6; y: 102.7; skew-x: -10000; skew-y: 42.6; scale-x: 0.798; scale-y: 0.837; }
        frame 155 { x: 46; y: 112.5; skew-y: 42.7; scale-x: 0.799; scale-y: 0.838; }
        frame 156 { x: -10000; y: -10000; skew-y: 42.6; scale-x: 0.798; scale-y: 0.837; }
        frame 157 { skew-y: 42.7; scale-x: 0.799; scale-y: 0.838; }
        frame 158 { skew-y: 42.6; scale-x: 0.798; scale-y: 0.837; }
        frame 159 { skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 163 { skew-y: 42.7; scale-x: 0.799; scale-y: 0.838; }
        frame 164 { skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Driver_outerarm_hand";
        frame-count: 187;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 9 { x: 19.1; y: 78.3; skew-x: 9.3; skew-y: 9.3; scale-x: 0.9; scale-y: 0.9; cel: 0; image: IMAGE_REANIM_ZOMBIE_BOSSDRIVER_OUTERHAND; }
        frame 10 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: 0.899; scale-y: 0.899; cel: -10000; image: none; }
        frame 11 { scale-x: -10000; scale-y: -10000; }
        frame 16 { scale-x: 0.9; scale-y: 0.9; }
        frame 17 { scale-x: 0.899; scale-y: 0.899; }
        frame 18 { scale-x: -10000; scale-y: -10000; }
        frame 23 { scale-x: 0.9; scale-y: 0.9; }
        frame 24 { scale-x: -10000; scale-y: -10000; }
        frame 25 { x: 20.8; y: 77.2; skew-x: 12.3; skew-y: 12.3; scale-x: 0.899; scale-y: 0.899; }
        frame 26 { x: 22.7; y: 76; skew-x: 15.3; skew-y: 15.3; scale-x: 0.898; scale-y: 0.898; }
        frame 27 { x: 24.6; y: 75; skew-x: 18.3; skew-y: 18.3; scale-x: -10000; scale-y: -10000; }
        frame 28 { x: 26.4; y: 73.9; skew-x: 21.3; skew-y: 21.3; }
        frame 29 { x: 28.3; y: 72.8; skew-x: 24.3; skew-y: 24.3; }
        frame 30 { x: 30.2; y: 72; skew-x: 27.4; skew-y: 27.4; scale-x: 0.899; scale-y: 0.899; }
        frame 31 { x: 28.3; y: 73; skew-x: 24.3; skew-y: 24.3; scale-x: 0.898; scale-y: 0.898; }
        frame 32 { x: 26.4; y: 74; skew-x: 21.3; skew-y: 21.3; scale-x: -10000; scale-y: -10000; }
        frame 33 { x: 24.6; y: 75; skew-x: 18.3; skew-y: 18.3; }
        frame 34 { x: 22.7; y: 76; skew-x: 15.3; skew-y: 15.3; }
        frame 35 { x: 20.8; y: 77.3; skew-x: 12.3; skew-y: 12.3; scale-x: 0.899; scale-y: 0.899; }
        frame 36 { x: 19.1; y: 78.3; skew-x: 9.3; skew-y: 9.3; scale-x: 0.9; scale-y: 0.9; }
        frame 37 { x: 17.2; y: 79.3; skew-x: 6.3; skew-y: 6.3; scale-x: 0.899; scale-y: 0.899; }
        frame 38 { x: 15.6; y: 80.3; skew-x: 3.5; skew-y: 3.5; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 13.8; y: 81.3; skew-x: 0.6; skew-y: 0.6; }
        frame 40 { x: 12.3; y: 82.3; skew-x: -1.9; skew-y: -1.9; }
        frame 41 { x: 10.7; y: 83.3; skew-x: -4.7; skew-y: -4.7; }
        frame 42 { x: 9.1; y: 84.6; skew-x: -7.7; skew-y: -7.7; }
        frame 43 { x: 10.7; y: 83.3; skew-x: -4.7; skew-y: -4.7; }
        frame 44 { x: 12.3; y: 82.3; skew-x: -1.9; skew-y: -1.9; }
        frame 45 { x: 13.9; y: 81.5; skew-x: 0.6; skew-y: 0.6; }
        frame 46 { x: 15.7; y: 80.4; skew-x: 3.5; skew-y: 3.5; }
        frame 47 { x: 17.4; y: 79.4; skew-x: 6.3; skew-y: 6.3; }
        frame 48 { x: 19.1; y: 78.3; skew-x: 9.3; skew-y: 9.3; scale-x: 0.9; scale-y: 0.9; }
        frame 49 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: 22.3; y: 76.1; skew-x: 16.3; skew-y: 16.3; scale-x: 0.898; scale-y: 0.898; }
        frame 51 { x: 25.9; y: 74.1; skew-x: 23.5; skew-y: 23.5; scale-x: -10000; scale-y: -10000; }
        frame 52 { x: 29.4; y: 72.3; skew-x: 30.6; skew-y: 30.6; scale-x: 0.897; scale-y: 0.897; }
        frame 53 { x: 33.1; y: 70.9; skew-x: 37.9; skew-y: 37.9; scale-x: 0.898; scale-y: 0.898; }
        frame 54 { x: 31; y: 71.7; skew-x: 33.8; skew-y: 33.8; scale-x: 0.897; scale-y: 0.897; }
        frame 55 { x: 28.9; y: 72.7; skew-x: 29.6; skew-y: 29.6; scale-x: -10000; scale-y: -10000; }
        frame 56 { x: 26.8; y: 73.6; skew-x: 25.6; skew-y: 25.6; scale-x: 0.898; scale-y: 0.898; }
        frame 57 { x: 24.8; y: 74.6; skew-x: 21.5; skew-y: 21.5; scale-x: -10000; scale-y: -10000; }
        frame 58 { x: 22.9; y: 75.8; skew-x: 17.3; skew-y: 17.3; }
        frame 59 { x: 20.9; y: 77.1; skew-x: 13.3; skew-y: 13.3; scale-x: 0.899; scale-y: 0.899; }
        frame 60 { x: 19.1; y: 78.3; skew-x: 9.3; skew-y: 9.3; scale-x: 0.9; scale-y: 0.9; }
        frame 61 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 62 { scale-x: 0.899; scale-y: 0.899; }
        frame 63 { scale-x: -10000; scale-y: -10000; }
        frame 65 { scale-x: 0.9; scale-y: 0.9; }
        frame 66 { scale-x: 0.899; scale-y: 0.899; }
        frame 67 { scale-x: 0.9; scale-y: 0.9; }
        frame 68 { scale-x: 0.899; scale-y: 0.899; }
        frame 69 { scale-x: 0.9; scale-y: 0.9; }
        frame 70 { scale-x: 0.899; scale-y: 0.899; }
        frame 71 { scale-x: 0.9; scale-y: 0.9; }
        frame 72 { scale-x: 0.899; scale-y: 0.899; }
        frame 73 { scale-x: 0.9; scale-y: 0.9; }
        frame 74 { scale-x: 0.899; scale-y: 0.899; }
        frame 75 { scale-x: 0.9; scale-y: 0.9; }
        frame 76 { scale-x: 0.899; scale-y: 0.899; }
        frame 77 { scale-x: 0.9; scale-y: 0.9; }
        frame 78 { scale-x: -10000; scale-y: -10000; }
        frame 79 { x: 19.7; y: 76.2; skew-x: 10.5; skew-y: 10.5; scale-x: 0.898; scale-y: 0.898; }
        frame 80 { x: 20.5; y: 74; skew-x: 12; skew-y: 12; scale-x: -10000; scale-y: -10000; }
        frame 81 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 130 { x: 19.8; y: 76.2; skew-x: 10.5; skew-y: 10.5; }
        frame 131 { x: 19.1; y: 78.3; skew-x: 9.3; skew-y: 9.3; scale-x: 0.9; scale-y: 0.9; }
        frame 132 { x: 17.8; y: 78.4; skew-x: 9.1; skew-y: 7.5; scale-x: 0.903; scale-y: 0.896; }
        frame 133 { x: 16.4; y: 78.3; skew-x: -10000; skew-y: 5.8; scale-x: 0.908; scale-y: 0.893; }
        frame 134 { x: 15.2; y: -10000; skew-y: 4.1; scale-x: 0.913; scale-y: 0.89; }
        frame 135 { x: 17.2; skew-y: 7; scale-x: 0.905; scale-y: 0.898; }
        frame 136 { x: 19.4; skew-x: 9.3; skew-y: 9.8; scale-x: 0.897; scale-y: 0.906; }
        frame 137 { x: 21.5; skew-x: -10000; skew-y: 12.8; scale-x: 0.889; scale-y: 0.914; }
        frame 138 { x: 23.5; skew-x: 9.5; skew-y: 15.8; scale-x: 0.882; scale-y: 0.923; }
        frame 139 { x: 20.5; skew-x: 9.3; skew-y: 12.3; scale-x: 0.891; scale-y: 0.912; }
        frame 140 { x: 17.4; skew-x: -10000; skew-y: 8.8; scale-x: 0.9; scale-y: 0.902; }
        frame 141 { x: 14.4; skew-x: 9.2; skew-y: 5.4; scale-x: 0.909; scale-y: 0.892; }
        frame 142 { x: 17.4; skew-x: 9.3; skew-y: 8.8; scale-x: 0.9; scale-y: 0.902; }
        frame 143 { x: 20.5; skew-x: -10000; skew-y: 12.3; scale-x: 0.891; scale-y: 0.912; }
        frame 144 { x: 23.5; skew-x: 9.5; skew-y: 15.8; scale-x: 0.882; scale-y: 0.923; }
        frame 145 { x: 26; skew-x: -10000; skew-y: 19.1; scale-x: 0.872; scale-y: 0.943; }
        frame 146 { x: 28.3; skew-y: 22.3; scale-x: 0.863; scale-y: 0.963; }
        frame 147 { x: 30.8; skew-x: 9.8; skew-y: 25.7; scale-x: 0.854; scale-y: 0.985; }
        frame 148 { x: 30; y: 78.6; skew-x: -10000; skew-y: 25.6; scale-x: -10000; scale-y: 0.984; }
        frame 149 { x: 29.2; y: 78.9; skew-y: -10000; scale-y: -10000; }
        frame 150 { x: 28.4; y: 79.2; skew-y: 25.7; scale-y: 0.985; }
        frame 151 { x: 30.6; y: 80.1; skew-x: 18.1; skew-y: 34.1; scale-x: 0.853; scale-y: 0.983; }
        frame 152 { x: 32.9; y: 81.2; skew-x: 26.5; skew-y: 42.4; scale-x: 0.852; scale-y: 0.982; }
        frame 153 { x: 35.2; y: 82.6; skew-x: 34.9; skew-y: 50.8; scale-x: 0.853; scale-y: 0.984; }
        frame 154 { x: 41.4; y: 85.5; skew-x: 62.5; skew-y: 78.5; scale-x: 0.851; scale-y: 0.982; }
        frame 155 { x: 45.8; y: 91.8; skew-x: 90; skew-y: 105.9; scale-x: -10000; scale-y: 0.981; }
        frame 156 { x: 48; y: 101; skew-x: 107.6; skew-y: 123.6; scale-x: 0.849; scale-y: 0.979; }
        frame 157 { x: 48.8; y: 110.7; skew-x: 125.4; skew-y: 141.3; scale-x: -10000; scale-y: -10000; }
        frame 158 { x: 48.7; y: 110.8; skew-x: 125.3; skew-y: 141.4; scale-x: 0.848; scale-y: 0.978; }
        frame 159 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 163 { x: 48.8; y: 110.7; skew-x: 125.4; skew-y: 141.3; scale-x: 0.849; scale-y: 0.979; }
        frame 164 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
    Track {
        source-name: "Driver_outerarm_lower";
        frame-count: 187;
        frame 0 { cel: -1; }
        frame 1 { cel: -10000; }
        frame 9 { x: 35.5; y: 75; skew-x: 2.2; skew-y: 2.2; scale-x: 0.799; scale-y: 0.799; cel: 0; image: IMAGE_REANIM_ZOMBIE_BOSSDRIVER_LOWERARM; }
        frame 10 { x: -10000; y: 75.2; skew-x: 2.5; skew-y: 2.5; scale-x: -10000; scale-y: -10000; cel: -10000; image: none; }
        frame 11 { x: 35.6; y: 75.3; skew-x: 3; skew-y: 3; scale-x: 0.798; scale-y: 0.798; }
        frame 12 { x: 35.7; y: 75.5; skew-x: 3.5; skew-y: 3.5; scale-x: -10000; scale-y: -10000; }
        frame 13 { x: 35.8; y: 75.6; skew-x: 4; skew-y: 4; }
        frame 14 { x: 35.9; y: 75.7; skew-x: 4.5; skew-y: 4.5; }
        frame 15 { x: 36; y: 75.8; skew-x: 5; skew-y: 5; }
        frame 16 { x: -10000; y: 76; skew-x: 5.5; skew-y: 5.5; }
        frame 17 { y: -10000; skew-x: 6; skew-y: 5; scale-x: 0.799; scale-y: 0.797; }
        frame 18 { x: 35.9; y: 75.8; skew-x: 6.6; skew-y: 4.5; scale-x: 0.801; scale-y: 0.796; }
        frame 19 { x: 35.8; y: 75.7; skew-x: 5.8; skew-y: 4; scale-x: 0.8; scale-y: -10000; }
        frame 20 { x: 35.7; y: 75.6; skew-x: 4.8; skew-y: 3.5; scale-x: -10000; scale-y: 0.797; }
        frame 21 { x: 35.6; y: 75.5; skew-x: 3.8; skew-y: 3; scale-y: -10000; }
        frame 22 { x: 35.5; y: 75.2; skew-x: 3; skew-y: 2.5; scale-x: 0.799; scale-y: 0.798; }
        frame 23 { x: -10000; y: 75; skew-x: 2.2; skew-y: 2.2; scale-x: -10000; scale-y: 0.799; }
        frame 24 { y: -10000; skew-x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 25 { x: 37.6; y: 74.7; skew-x: 4.5; skew-y: 4.5; scale-x: 0.798; scale-y: 0.798; }
        frame 26 { x: 39.6; y: 74.3; skew-x: 6.8; skew-y: 6.8; scale-x: -10000; scale-y: -10000; }
        frame 27 { x: 41.9; y: 74; skew-x: 9.3; skew-y: 9.3; }
        frame 28 { x: 44; y: 73.8; skew-x: 11.5; skew-y: 11.5; }
        frame 29 { x: 46.3; y: 73.5; skew-x: 13.8; skew-y: 13.8; }
        frame 30 { x: 48.5; y: 73.2; skew-x: 16.3; skew-y: 16.3; }
        frame 31 { x: 46.2; y: 73.5; skew-x: 13.8; skew-y: 13.8; }
        frame 32 { x: 44; y: 73.7; skew-x: 11.5; skew-y: 11.5; }
        frame 33 { x: 42; y: 73.9; skew-x: 9.3; skew-y: 9.3; }
        frame 34 { x: 39.8; y: 74.3; skew-x: 6.8; skew-y: 6.8; }
        frame 35 { x: 37.6; y: 74.7; skew-x: 4.5; skew-y: 4.5; }
        frame 36 { x: 35.5; y: 75; skew-x: 2.2; skew-y: 2.2; scale-x: 0.799; scale-y: 0.799; }
        frame 37 { x: 33.6; y: 75.5; skew-x: 2.3; skew-y: 2.3; scale-x: 0.798; scale-y: 0.798; }
        frame 38 { x: 31.7; y: 76; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 39 { x: 29.8; y: 76.3; skew-x: 2.5; skew-y: 2.5; }
        frame 40 { x: 27.8; y: 76.8; skew-x: 2.6; skew-y: 2.6; }
        frame 41 { x: 25.9; y: 77.3; skew-x: 2.8; skew-y: 2.8; }
        frame 42 { x: 24; y: 77.6; skew-x: 3; skew-y: 3; }
        frame 43 { x: 25.9; y: 77.2; skew-x: 2.8; skew-y: 2.8; }
        frame 44 { x: 27.8; y: 76.8; skew-x: 2.6; skew-y: 2.6; }
        frame 45 { x: 29.7; y: 76.3; skew-x: 2.5; skew-y: 2.5; }
        frame 46 { x: 31.6; y: 76; skew-x: 2.3; skew-y: 2.3; }
        frame 47 { x: 33.5; y: 75.5; skew-x: -10000; skew-y: -10000; }
        frame 48 { x: 35.5; y: 75; skew-x: 2.2; skew-y: 2.2; scale-x: 0.799; scale-y: 0.799; }
        frame 49 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 50 { x: 38.3; y: 74.1; skew-x: 7.5; skew-y: 7.5; scale-x: 0.798; scale-y: 0.798; }
        frame 51 { x: 41.1; y: 73.3; skew-x: 13; skew-y: 13; scale-x: 0.797; scale-y: 0.797; }
        frame 52 { x: 44; y: 72.6; skew-x: 18.5; skew-y: 18.5; scale-x: 0.796; scale-y: 0.796; }
        frame 53 { x: 47.1; y: 72; skew-x: 24.1; skew-y: 24.1; scale-x: 0.797; scale-y: 0.797; }
        frame 54 { x: 45.4; y: 72.4; skew-x: 20.8; skew-y: 20.8; scale-x: 0.796; scale-y: 0.796; }
        frame 55 { x: 43.6; y: 72.6; skew-x: 17.8; skew-y: 17.8; scale-x: 0.797; scale-y: 0.797; }
        frame 56 { x: 42; y: 73.1; skew-x: 14.6; skew-y: 14.6; scale-x: -10000; scale-y: -10000; }
        frame 57 { x: 40.3; y: 73.4; skew-x: 11.5; skew-y: 11.5; }
        frame 58 { x: 38.6; y: 74; skew-x: 8.3; skew-y: 8.3; scale-x: 0.798; scale-y: 0.798; }
        frame 59 { x: 37; y: 74.5; skew-x: 5.3; skew-y: 5.3; scale-x: -10000; scale-y: -10000; }
        frame 60 { x: 35.5; y: 75; skew-x: 2.2; skew-y: 2.2; scale-x: 0.799; scale-y: 0.799; }
        frame 61 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 62 { y: 75.1; skew-x: 2.1; skew-y: 2.1; }
        frame 63 { y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 65 { y: 75; skew-x: 2.2; skew-y: 2.2; }
        frame 66 { x: 35.4; y: 75.1; skew-x: 0.8; skew-y: 0.8; }
        frame 67 { x: 35.2; y: 75.2; skew-x: -0.4; skew-y: -0.4; }
        frame 68 { x: 35.4; y: 75.1; skew-x: 0.8; skew-y: 0.8; }
        frame 69 { x: 35.5; y: 75; skew-x: 2.2; skew-y: 2.2; }
        frame 70 { x: 35.4; y: 75.1; skew-x: 0.8; skew-y: 0.8; }
        frame 71 { x: 35.2; y: 75.2; skew-x: -0.4; skew-y: -0.4; }
        frame 72 { x: 35.4; y: 75.1; skew-x: 0.8; skew-y: 0.8; }
        frame 73 { x: 35.5; y: 75; skew-x: 2.2; skew-y: 2.2; }
        frame 74 { x: 35.4; y: 75.1; skew-x: 0.8; skew-y: 0.8; }
        frame 75 { x: 35.2; y: 75.2; skew-x: -0.4; skew-y: -0.4; }
        frame 76 { x: 35.4; y: 75.1; skew-x: 0.8; skew-y: 0.8; }
        frame 77 { x: 35.5; y: 75; skew-x: 2.2; skew-y: 2.2; }
        frame 78 { x: -10000; y: -10000; skew-x: -10000; skew-y: -10000; }
        frame 79 { x: 34.4; y: 73.3; skew-x: -5.7; skew-y: -3.9; scale-x: 0.792; scale-y: 0.83; }
        frame 80 { x: 33.3; y: 71.7; skew-x: -13.8; skew-y: -10.3; scale-x: 0.786; scale-y: 0.862; }
        frame 81 { x: -10000; y: -10000; skew-x: -13.7; skew-y: -10.2; scale-x: 0.785; scale-y: 0.861; }
        frame 82 { x: 33.5; skew-x: -10000; skew-y: -9.9; scale-x: -10000; scale-y: 0.862; }
        frame 83 { x: -10000; y: 71.6; skew-y: -9.7; scale-y: -10000; }
        frame 84 { y: -10000; skew-y: -10000; }
        frame 85 { x: 33.6; y: 71.7; skew-y: -9.5; scale-x: 0.786; }
        frame 86 { x: -10000; y: -10000; skew-y: -9.4; scale-x: -10000; }
        frame 87 { x: 33.7; skew-y: -9.2; }
        frame 88 { x: -10000; y: 71.6; skew-y: -10000; }
        frame 89 { x: 33.8; y: -10000; skew-y: -8.9; }
        frame 90 { x: 33.9; skew-y: -8.7; scale-y: 0.863; }
        frame 91 { x: -10000; skew-y: -10000; scale-y: -10000; }
        frame 92 { x: 34; skew-y: -8.5; }
        frame 93 { skew-y: -8.4; scale-x: 0.787; }
        frame 94 { x: -10000; skew-y: -8.2; scale-x: -10000; }
        frame 95 { x: 34.1; y: 71.5; skew-y: -10000; }
        frame 96 { x: 34.3; y: -10000; skew-y: -7.9; }
        frame 97 { x: 34.2; skew-y: -7.7; }
        frame 98 { x: 34.3; y: 71.6; skew-y: -10000; scale-y: 0.864; }
        frame 99 { x: 34.4; y: 71.5; skew-y: -7.5; scale-y: -10000; }
        frame 100 { x: -10000; y: -10000; skew-y: -7.4; }
        frame 101 { x: 34.5; skew-y: -7.2; scale-x: 0.788; }
        frame 102 { x: -10000; y: 71.6; skew-y: -10000; scale-x: -10000; }
        frame 103 { x: 34.6; y: 71.5; skew-y: -6.9; }
        frame 104 { x: -10000; y: -10000; skew-y: -6.7; }
        frame 105 { skew-y: -10000; }
        frame 106 { x: 34.8; y: 71.6; skew-y: -6.5; scale-y: 0.865; }
        frame 107 { x: -10000; y: 71.5; skew-y: -6.4; scale-y: -10000; }
        frame 108 { y: -10000; skew-y: -6.2; }
        frame 109 { x: 34.9; skew-y: -10000; scale-x: 0.789; }
        frame 110 { x: 35; skew-y: -5.9; scale-x: -10000; }
        frame 111 { x: -10000; y: 71.4; skew-y: -10000; }
        frame 112 { x: 35; y: -10000; skew-y: -5.7; }
        frame 113 { x: 35.1; skew-y: -5.5; }
        frame 114 { x: -10000; y: 71.3; skew-y: -5.4; scale-y: 0.866; }
        frame 115 { x: 35.2; y: 71.5; skew-y: -5.2; scale-y: -10000; }
        frame 116 { x: -10000; y: 71.4; skew-y: -10000; }
        frame 117 { x: 35.4; y: 71.5; skew-y: -4.9; scale-x: 0.79; }
        frame 118 { x: -10000; y: 71.4; skew-y: -10000; scale-x: -10000; }
        frame 119 { y: -10000; skew-y: -4.7; }
        frame 120 { x: 35.5; skew-y: -4.5; }
        frame 121 { x: -10000; skew-y: -4.4; }
        frame 122 { y: 71.3; skew-y: -4.2; scale-y: 0.867; }
        frame 123 { x: 35.6; y: 71.4; skew-y: -10000; scale-y: -10000; }
        frame 124 { x: 35.7; y: 71.3; skew-y: -3.9; scale-x: 0.791; }
        frame 125 { x: 35.8; y: 71.4; skew-y: -10000; scale-x: -10000; }
        frame 126 { x: -10000; y: 71.3; skew-y: -3.7; }
        frame 127 { x: 35.9; y: 71.4; skew-y: -3.5; }
        frame 128 { x: 36; y: -10000; skew-y: -3.4; }
        frame 129 { x: -10000; y: 71.3; skew-y: -3.3; scale-x: 0.792; scale-y: 0.868; }
        frame 130 { x: 35.5; y: 73.3; skew-x: -5.7; skew-y: -0.4; scale-x: 0.795; scale-y: 0.833; }
        frame 131 { x: -10000; y: 75; skew-x: 2.2; skew-y: 2.2; scale-x: 0.799; scale-y: 0.799; }
        frame 132 { x: 34; y: -10000; skew-x: 2.1; skew-y: 0.3; scale-x: 0.8; scale-y: -10000; }
        frame 133 { x: 32.7; y: 75.1; skew-x: -10000; skew-y: -1.2; scale-x: -10000; }
        frame 134 { x: 31.3; y: 75; skew-x: 2.2; skew-y: -2.9; scale-x: 0.802; }
        frame 135 { x: 33.5; y: -10000; skew-x: 2.1; skew-y: 0; scale-x: 0.8; scale-y: 0.801; }
        frame 136 { x: 35.8; y: 75; skew-x: -10000; skew-y: 3; scale-x: 0.798; scale-y: 0.804; }
        frame 137 { x: 38; y: -10000; skew-y: 6; scale-x: 0.796; scale-y: 0.806; }
        frame 138 { x: 40.4; y: 75; skew-x: 2.2; skew-y: 9.1; scale-x: 0.795; scale-y: 0.808; }
        frame 139 { x: 37; skew-x: 2.1; skew-y: 5.3; scale-x: 0.797; scale-y: 0.805; }
        frame 140 { x: 33.8; skew-x: -10000; skew-y: 1.8; scale-x: 0.799; scale-y: 0.802; }
        frame 141 { x: 30.6; y: -10000; skew-x: 2.2; skew-y: -1.6; scale-x: 0.801; scale-y: 0.798; }
        frame 142 { x: 33.9; skew-x: 2.1; skew-y: 1.8; scale-x: 0.799; scale-y: 0.802; }
        frame 143 { x: 37.1; skew-x: -10000; skew-y: 5.3; scale-x: 0.797; scale-y: 0.805; }
        frame 144 { x: 40.4; skew-x: 2.2; skew-y: 9.1; scale-x: 0.795; scale-y: 0.808; }
        frame 145 { x: 44.5; y: 74.7; skew-x: 4.8; skew-y: 13.5; scale-x: 0.792; scale-y: 0.813; }
        frame 146 { x: 48.5; y: 74.2; skew-x: 7.5; skew-y: 17.8; scale-x: 0.79; scale-y: 0.819; }
        frame 147 { x: 52.6; y: 74; skew-x: 10.3; skew-y: 22.4; scale-x: 0.787; scale-y: 0.825; }
        frame 148 { x: 51.8; y: 74.2; skew-x: -10000; skew-y: 22.3; scale-x: -10000; scale-y: -10000; }
        frame 149 { x: 51; y: 74.5; skew-y: -10000; }
        frame 150 { x: 50.3; y: 74.8; skew-y: 22.4; }
        frame 151 { x: 50.8; y: 78.7; skew-x: 18.6; skew-y: 30.8; scale-x: 0.786; scale-y: 0.824; }
        frame 152 { x: 51.6; y: 83; skew-x: 26.9; skew-y: 39.1; scale-x: -10000; scale-y: 0.823; }
        frame 153 { x: 52.5; y: 87.5; skew-x: 35.4; skew-y: 47.5; scale-y: 0.824; }
        frame 154 { x: -10000; y: 97.3; skew-x: 35.3; skew-y: 47.6; scale-x: 0.785; scale-y: 0.823; }
        frame 155 { y: 107.1; skew-x: 35.4; skew-y: 47.5; scale-x: 0.786; scale-y: 0.824; }
        frame 156 { y: 107.2; skew-x: 35.3; skew-y: 47.6; scale-x: 0.785; scale-y: 0.823; }
        frame 157 { y: 107.1; skew-x: 35.4; skew-y: 47.5; scale-x: 0.786; scale-y: 0.824; }
        frame 158 { y: 107.2; skew-x: 35.3; skew-y: 47.6; scale-x: 0.785; scale-y: 0.823; }
        frame 159 { y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
        frame 163 { y: 107.1; skew-x: 35.4; skew-y: 47.5; scale-x: 0.786; scale-y: 0.824; }
        frame 164 { y: -10000; skew-x: -10000; skew-y: -10000; scale-x: -10000; scale-y: -10000; }
    }
}
